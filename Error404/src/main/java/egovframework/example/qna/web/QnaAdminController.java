/**
 * 
 */
package egovframework.example.qna.web;

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
	@GetMapping("/answerForm")
	public String showAnswerForm(@RequestParam Long id, Model model) {
		QnaVO qna = qnaService.selectQnaById(id); // selectInquiryById 메서드 필요
		model.addAttribute("inquiry", qna);
		return "admin/refundInquiry-answerForm";
	}

	// 답변 저장 처리
	@PostMapping("/answerSubmit")
	public String submitAnswer(QnaVO qnaVO, HttpSession session) {
		// 세션에서 로그인한 관리자 정보 가져오기
		UsersVO adminUser = (UsersVO) session.getAttribute("loginUser");
		if (adminUser != null) {
			qnaVO.setAnswerUserId(adminUser.getUserid()); // A_ID에 관리자 ID 넣기
		}

		qnaService.updateQnaAnswer(qnaVO);
		return "redirect:/admin/refundInquiry/list"; // 목록으로 리다이렉트
	}
}
