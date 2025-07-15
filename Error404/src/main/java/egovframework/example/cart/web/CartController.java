package egovframework.example.cart.web;

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
	
}
