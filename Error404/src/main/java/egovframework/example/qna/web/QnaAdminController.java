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
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.qna.service.QnaService;
import egovframework.example.qna.service.QnaVO;
import egovframework.example.users.service.UsersVO;

/**
 * @author user 1대1 질문에 관리자가 답변을 달 수 있는 컨트롤러 mapper , service, serviceimpl은 같이
 *         쓰면됩니다 (임폴트추가 필수로 사용해야 합니다)
 */
@Controller
public class QnaAdminController {

	@Autowired
	public QnaService qnaService;

	// 답변 작성 폼 페이지 (ID로 문의글 조회 후 폼에 보여주기)
	@GetMapping("/answerForm.do")
	public String showAnswerForm(@RequestParam Long id, Model model) {
		QnaVO qna = qnaService.selectQnaById(id);
		model.addAttribute("inquiry", qna);
		// JSP 경로 변경
		return "mypage/adminQna-answerForm";
	}

	// 답변 저장 처리
	@PostMapping("/answerSubmit.do")
	public String submitAnswer(QnaVO qnaVO, HttpSession session) {
	    UsersVO adminUser = (UsersVO) session.getAttribute("loginUser");
	    if (adminUser == null || !"ADMIN".equals(adminUser.getRole())) {
	        return "redirect:/accessDenied"; // 권한 없으면 차단
	    }
	    qnaVO.setAnswerUserId(adminUser.getUserid());
	    qnaService.updateQnaAnswer(qnaVO);
	    return "redirect:/admin/qna/list.do"; // jsp 위치와 매핑 경로에 맞춘 리다이렉트
	}


	// 답변이 없는 문의 리스트 페이지
	@GetMapping("/admin/qna/list.do")
	public String showUnansweredInquiries(HttpSession session, Model model) {
		UsersVO loginUser = (UsersVO) session.getAttribute("loginUser");

		if (loginUser == null || !"ADMIN".equals(loginUser.getRole())) {
			// 로그인 안 되어 있거나, 관리자가 아닐 경우
			return "redirect:/home.do"; // 또는 에러 페이지
		}

		List<QnaVO> unansweredList = qnaService.selectUnansweredQna();
		model.addAttribute("inquiries", unansweredList);
		return "mypage/adminQna-list";
	}

	@GetMapping("/admin/dashboard.do")
	public String adminDashboard(HttpSession session, Model model) {
	    UsersVO loginUser = (UsersVO) session.getAttribute("loginUser");
	    if (loginUser == null || !"ADMIN".equals(loginUser.getRole())) {
	    	return "redirect:/home.do";
	    }
	    // 필요 시 model에 데이터 추가
	    return "mypage/dashboard";  // jsp 경로에 맞게 리턴
	}

}