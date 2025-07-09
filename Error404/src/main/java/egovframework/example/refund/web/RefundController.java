/**
 * 
 */
package egovframework.example.refund.web;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import egovframework.example.refund.service.RefundService;
import egovframework.example.refund.service.RefundVO;
import egovframework.example.users.service.UsersVO;

/**
 * @author user
 *	이건 마이페이지 환불요청에 들어가는 VO입니다
 *	환불사유,나의1대1문의 조회 기능으로 만든것입니다.
 */
@Controller
public class RefundController {
	@Autowired
	private RefundService refundService;

//	환불사유 새 페이지 로그인이 안되어있으면 로그인 페이지로 이동함
	@PostMapping("/refund/submit")
	public String submitRefundRequest(RefundVO refundVO, HttpSession session, Model model) {
		UsersVO loginUser = (UsersVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "redirect:/login.do";
		}
		refundVO.setUserId(loginUser.getUserid());
		refundService.insertRefundRequest(refundVO);
		model.addAttribute("msg", "환불 요청이 정상 접수되었습니다.");
		return "redirect:/mypage.do"; // 성공페이지 또는 알림 후 마이페이지로 redirect
	}

//	환불사유 새창 띄우기
	@GetMapping("/inquiryPopup.do")
	public String inquiryPopup() {
		return "mypage/mypage-inquiry"; // 
	}
	
//	footer에 있는 환불 클릭하면 넘어감
	@GetMapping("/goRefund.do")
	public String goRefund(HttpSession session) {
	    UsersVO loginUser = (UsersVO) session.getAttribute("loginUser");

	    if (loginUser == null) {
	        return "redirect:/login.do"; // 로그인 안 되어 있으면 로그인 페이지로 이동
	    }

	    return "redirect:/mypage.do"; // 로그인 되어 있으면 마이페이지로 이동
	}
}
