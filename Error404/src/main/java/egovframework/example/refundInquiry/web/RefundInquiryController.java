/**
 * 
 */
package egovframework.example.refundInquiry.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import egovframework.example.refundInquiry.service.RefundInquiryService;
import egovframework.example.refundInquiry.service.RefundInquiryVO;
import egovframework.example.users.service.UsersVO;
import org.springframework.ui.Model;

/**
 * @author user
 *	1대1 문의 컨트롤러
 */
@Controller
public class RefundInquiryController {

	@Autowired
	private RefundInquiryService refundInquiryService;

//	로그인이 되었을때 마이페이지로 이동  로그인이 안되어있다면 바로 로그인페이지로 이동
	@PostMapping("/inquiry/submit")
	public String submitInquiry(RefundInquiryVO refundInquiryVO, HttpSession session) {
		UsersVO loginUser = (UsersVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "redirect:/login.do";
		}

		refundInquiryVO.setUserId(loginUser.getUserid());
		refundInquiryService.insertRefundInquiry(refundInquiryVO);

		return "redirect:/mypage.do";
	}

// 마이페이지 1대1 문의 새창
	@GetMapping("/mypage/1on1Inquiry.do")
	public String show1on1InquiryForm() {
		return "mypage/mypage-1on1";
	}

//	마이페이지 나의질문 새창
	@GetMapping("/mypage/myQuestions.do")
	public String showMyQuestions(HttpSession session, Model model) {
	    UsersVO loginUser = (UsersVO) session.getAttribute("loginUser");
	    if (loginUser == null) {
	        return "redirect:/login.do";
	    }
	    // 1. 유저 ID로 문의 내역 조회
	    String userId = loginUser.getUserid();
	    List<RefundInquiryVO> inquiryList = refundInquiryService.selectInquiriesByUserId(userId);

	    // 2. 조회된 리스트를 model에 담기
	    model.addAttribute("inquiries", inquiryList);
	    
	    return "mypage/mypage-myquestions"; 
	}

	
	
}