/**
 * 
 */
package egovframework.example.refundInquiry.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.refundInquiry.service.RefundInquiryVO;

/**
 * @author user
 *
 */
@Mapper
public interface RefundInquiryMapper {
	public int insertRefundInquiry(RefundInquiryVO refundInquiryVO);  // 1대1 문의
	
	public List<RefundInquiryVO> selectInquiriesByUserId(String userId);  // 사용자별 문의 조회
	
	public int updateInquiryAnswer(RefundInquiryVO refundInquiryVO);  // 관리자 답변 등록
	
	public RefundInquiryVO selectInquiryById(Long id); 					// ID로 단건 조회
	
}
