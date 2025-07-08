/**
 * 
 */
package egovframework.example.refundInquiry.service;

import java.util.List;

/**
 * @author user
 *
 */
public interface RefundInquiryService {
	int insertRefundInquiry(RefundInquiryVO refundInquiryVO);  // 1대1 문의
	List<RefundInquiryVO> selectInquiriesByUserId(String userId);  // 사용자별 문의 조회
	int updateInquiryAnswer(RefundInquiryVO refundInquiryVO);  // 관리자 답변 등록
	RefundInquiryVO selectInquiryById(Long id);
}
