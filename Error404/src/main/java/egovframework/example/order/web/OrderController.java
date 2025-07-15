/**
 * 
 */
package egovframework.example.order.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.order.service.OrderService;
import egovframework.example.order.service.OrderVO;
import egovframework.example.users.service.UsersVO;

/**
 * @author user
 *
 */
@Controller
public class OrderController {

		@Autowired
		private OrderService orderService;
		
		@RequestMapping("/order/submit.do")
		private String submitOrder(@ModelAttribute OrderVO order, Model model) {
//			주문처리를 한다
			orderService.placeOrder(order);
//			주문완료 페이지로 전달 할겅
			model.addAttribute("book", order.getItems().get(0));		// 첫 상품 정보
			// 첫번째 도서의 수량을 모델에 전달 qty라는 이름으로(jsp에서 수량 표시용입니다)
			model.addAttribute("qty", order.getItems().get(0).getQty());		
			
//			여기 주문번호도 전달해볼거에요 삭제도 생각중....
			model.addAttribute("ono", order.getOno());
			
			return "order/submit";

		}
//		주문조회 메서드 추가
		@RequestMapping("/mypage.do")
		public String showMypage(Model model, HttpSession session) {
		    UsersVO loginUser = (UsersVO) session.getAttribute("loginUser");
		    if (loginUser != null) {
		        model.addAttribute("user", loginUser);
		        List<OrderVO> orders = orderService.getOrdersByUserid(loginUser.getUserid());
		        model.addAttribute("orders", orders);
		    }
		    return "mypage"; // → mypage.jsp 로 넘기기
		}

}

