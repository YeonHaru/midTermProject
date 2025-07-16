package egovframework.example.cart.web;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.cart.service.CartService;
import egovframework.example.common.Criteria;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class CartController {

	@Autowired CartService cartService;
	
	@GetMapping("/cart.do")
	public String cartList(
			@ModelAttribute Criteria criteria,
			Model model,
			HttpSession httpSession
			) {
		String userId = (String) httpSession.getAttribute("userId");
		
		if (userId == null) {
			return "redirect:/login.do";
		}
		
		criteria.setUserId(userId);
		
		log.info("장바구니 목록 요청 - 사용자 ID: {}",userId);
		
		List<?> cartList = cartService.getCartList(criteria);
		
		model.addAttribute("cartList", cartList);
		
		// ✅ 총 금액 계산 (다운캐스팅 필요 시 BookVO나 CartVO 타입 확인)
	    int totalPrice = 0;
	    for (Object obj : cartList) {
	        if (obj instanceof egovframework.example.cart.service.CartVO) {
	            egovframework.example.cart.service.CartVO item = (egovframework.example.cart.service.CartVO) obj;
	            totalPrice += item.getDprice() * item.getQuantity();
	        }
	    }
	    model.addAttribute("totalPrice", totalPrice); // JSP로 전달

		
		return "cart/cart_all";
	}
	
	@PostMapping("/cart/updateQuantity.do")
	@ResponseBody
	public String updateQuantity(@RequestParam int cno, @RequestParam int quantity) {
		log.info("수량 변경 요청 - CNO: {}, 수량: {}", cno, quantity);
		try {
	        cartService.updateQuantity(cno, quantity);
	        return "success";
	    } catch (Exception e) {
	        log.error("수량 변경 실패", e);
	        return "fail";
	    }
	}
	
	@PostMapping("/cart/deleteChecked.do")
	@ResponseBody
	public String deleteCheckedItems(@RequestParam("cnos") List<Integer> cnos) {
		System.out.println("받은 cnos: " + cnos);  // ★ 로그 확인용
	    try {
	        cartService.deleteCartItems(cnos); // 서비스에 리스트로 전달
	        return "success";
	    } catch (Exception e) {
	    	e.printStackTrace();  // ★ 예외 출력
	        return "fail";
	    }
	}
	
	@PostMapping("/cart/deleteOne.do")
	@ResponseBody
	public String deleteOne(@RequestParam("cno") int cno) {
	    try {
	        cartService.deleteCartItems(Collections.singletonList(cno));
	        return "success";
	    } catch (Exception e) {
	        e.printStackTrace();
	        return "fail";
	    }
	}


	
}
