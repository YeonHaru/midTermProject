/**
 * 
 */
package egovframework.example.refundrequests.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import egovframework.example.refundrequests.service.RefundService;
import egovframework.example.refundrequests.service.RefundVO;
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
		refundVO.setUserid(loginUser.getUserid());			// 로그인 사용자 id 설정
		
		// ✅ 추가 설정
		refundVO.setStatus("요청"); // 기본 상태
		refundVO.setOno(0L);       // 주문번호 없으면 0 또는 실제 주문번호
		
		
		
		refundService.insertRefundRequest(refundVO); 			// 환불요청등록
		
		model.addAttribute("msg", "환불 요청이 정상 접수되었습니다.");   // 결과 메시지
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
//	환불리스트
	@GetMapping("/refund/list")
    public String refundList(Model model) {
        List<RefundVO> refundList = refundService.selectRefundList();
        model.addAttribute("refundList", refundList);
        return "mypage/refundList"; // jsp 경로
    }
	
	
}
