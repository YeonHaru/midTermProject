/**
 * 
 */
package egovframework.example.refundInquiry.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.refundInquiry.service.RefundInquiryService;
import egovframework.example.refundInquiry.service.RefundInquiryVO;

/**
 * @author user
 *
 */
@Service
public class RefundInquiryServiceImpl implements RefundInquiryService {
	@Autowired
	private RefundInquiryMapper refundInquiryMapper;

//	1대1 문의창 불러오기
	@Override
	public int insertRefundInquiry(RefundInquiryVO refundInquiryVO) {
		// TODO Auto-generated method stub
		return refundInquiryMapper.insertRefundInquiry(refundInquiryVO);
	}
//	사용자별 1대1 연동
	@Override
	public List<RefundInquiryVO> selectInquiriesByUserId(String userId) {
		// TODO Auto-generated method stub
		return refundInquiryMapper.selectInquiriesByUserId(userId); 
	}
//	1대1 질문게시판에 답변권한
	@Override
	public int updateInquiryAnswer(RefundInquiryVO refundInquiryVO) {
		// TODO Auto-generated method stub
		return refundInquiryMapper.updateInquiryAnswer(refundInquiryVO);
	}
//	관리자가 답변을 관리자가 달 수 있게 하는 권한추가
	@Override
	public RefundInquiryVO selectInquiryById(Long id) {
		// TODO Auto-generated method stub
		return refundInquiryMapper.selectInquiryById(id);
	}
	
}
