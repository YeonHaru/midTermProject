/**
 * 
 */
package egovframework.example.refundInquiry.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.refundInquiry.service.RefundInquiryService;
import egovframework.example.refundInquiry.service.RefundInquiryVO;

/**
 * @author user
 *	1대1 질문에 관리자가 답변을 달 수 있는 컨트롤러
 *	mapper , service, serviceimpl은 같이 쓰면됩니다 (임폴트추가 필수로 사용해야 합니다)
 */
@Controller
public class RefundInquiryAdminController {
	
	@Autowired
	public RefundInquiryService refundInquiryService;
	
	// 답변 작성 폼 페이지 (ID로 문의글 조회 후 폼에 보여주기)
    @GetMapping("/answerForm")
    public String showAnswerForm(@RequestParam Long id, Model model) {
        RefundInquiryVO inquiry = refundInquiryService.selectInquiryById(id); // selectInquiryById 메서드 필요
        model.addAttribute("inquiry", inquiry);
        return "admin/refundInquiry-answerForm";
    }

    // 답변 저장 처리
    @PostMapping("/answerSubmit")
    public String submitAnswer(RefundInquiryVO refundInquiryVO) {
        refundInquiryService.updateInquiryAnswer(refundInquiryVO);
        return "redirect:/admin/refundInquiry/list"; // 목록으로 리다이렉트
    }
}
