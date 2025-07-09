/**
 * 
 */
package egovframework.example.qna.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import egovframework.example.qna.service.QnaService;
import egovframework.example.qna.service.QnaVO;
import egovframework.example.users.service.UsersVO;

/**
 * @author user
 *	1대1 문의 컨트롤러
 */
@Controller
public class QnaController {

	@Autowired
	private QnaService qnaService;

//	로그인이 되었을때 마이페이지로 이동  로그인이 안되어있다면 바로 로그인페이지로 이동
	@PostMapping("/inquiry/submit")
	public String submitInquiry(QnaVO qnaVO, HttpSession session) {
		UsersVO loginUser = (UsersVO) session.getAttribute("loginUser");
		if (loginUser == null) {
			return "redirect:/login.do";
		}

		qnaVO.setQuestionUserId(loginUser.getUserid()); // 변경
		qnaService.insertQna(qnaVO); // 변경

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
	    List<QnaVO> qnaList = qnaService.selectQnaByUserId(userId); // 변경

	    // 2. 조회된 리스트를 model에 담기
	    model.addAttribute("inquiries", qnaList);
	    
	    return "mypage/mypage-myquestions"; 
	}

	
	
}