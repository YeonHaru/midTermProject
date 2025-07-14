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
import org.springframework.web.bind.annotation.RequestMapping;

import egovframework.example.refundrequests.service.RefundService;
import egovframework.example.refundrequests.service.RefundVO;
import egovframework.example.users.service.UsersVO;
import lombok.extern.log4j.Log4j2;

/**
 * @author user
 *	이건 마이페이지 환불요청에 들어가는 VO입니다
 *	환불사유,나의1대1문의 조회 기능으로 만든것입니다.
 */
@Log4j2

@Controller
public class RefundController {
	@Autowired
	private RefundService refundService;

//	환불사유 새 페이지 로그인이 안되어있으면 로그인 페이지로 이동함
	@PostMapping("/refund/submit.do")
	public String submitRefundRequest(RefundVO refundVO, HttpSession session, Model model) {
	    log.info(">>> submitRefundRequest 진입");
	    log.info("📦 전달받은 RefundVO: {}", refundVO);

	    UsersVO loginUser = (UsersVO) session.getAttribute("loginUser");
	    if (loginUser == null) {
	        log.warn("⛔ 로그인 안 됨 - 리다이렉트");
	        return "redirect:/login.do";
	    }

	    log.info("👤 로그인한 사용자 ID: {}", loginUser.getUserid());

	    refundVO.setUserid(loginUser.getUserid());
	    refundVO.setStatus("요청");
	    refundVO.setOno(0L);

	    try {
	        int result = refundService.insertRefundRequest(refundVO);
	        log.info("✅ insertRefundRequest 결과: {}", result);
	    } catch (Exception e) {
	        log.error("❌ insertRefundRequest 오류 발생", e);
	    }

	    model.addAttribute("msg", "환불 요청이 정상 접수되었습니다.");
	    return "redirect:/mypage.do";
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
	@GetMapping("/refund/list.do")
	public String refundList(HttpSession session, Model model) {
	    UsersVO loginUser = (UsersVO) session.getAttribute("loginUser");
	    
	    // 로그인 여부 확인
	    if (loginUser == null) {
	        return "redirect:/login.do";
	    }

	    String userid = loginUser.getUserid();
	    List<RefundVO> refundList = refundService.selectRefundListByUserId(userid);
	    model.addAttribute("refundList", refundList);

	    return "/mypage/refundList"; // jsp 경로
	}
	
	
}
