/**
 * 
 */
package egovframework.example.refund.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.refund.service.RefundService;
import egovframework.example.refund.service.RefundVO;

/**
 * @author user
 *	이건 마이페이지 환불사유에 쓰일 파일들입니다.
 */
@Service
public class RefundServiceImpl implements RefundService {
	@Autowired
	private RefundMapper refundMapper;

//	마이페이지 환불사유 새창불러오기
	@Override
	public int insertRefundRequest(RefundVO refundVO) {
		// TODO Auto-generated method stub
		return refundMapper.insertRefundRequest(refundVO);
	}
	
}
