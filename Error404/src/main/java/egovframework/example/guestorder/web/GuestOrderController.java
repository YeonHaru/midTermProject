/**
 * 
 */
package egovframework.example.guestorder.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import egovframework.example.guestorder.service.GuestOrderService;
import egovframework.example.guestorder.service.GuestOrderVO;

/**
 * @author user
 *
 */
@Controller
public class GuestOrderController {
	@Autowired
	private GuestOrderService guestOrderService;

//	비회원 조회기능
	@PostMapping("/guestOrder/check.do")
	public String checkGuestOrder(GuestOrderVO vo, Model model, HttpServletRequest request) {
	    GuestOrderVO result = guestOrderService.selectGuestOrder(vo);

	    if (result == null) {
	        request.setAttribute("guestMsg", "일치하는 주문정보가 없습니다.");
	        return "auth/login"; // 실패 시 로그인 페이지로
	    }

	    model.addAttribute("order", result);
	    return "guestorder/guestOrderResult"; // 성공 시 결과 페이지로 이동
	}
}