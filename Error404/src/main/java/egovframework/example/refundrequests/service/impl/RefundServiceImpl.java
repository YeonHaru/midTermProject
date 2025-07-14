/**
 * 
 */
package egovframework.example.refundrequests.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.refundrequests.service.RefundService;
import egovframework.example.refundrequests.service.RefundVO;

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
//	마이페이지 작성 조회
	@Override
	public List<RefundVO> selectRefundList() {
		// TODO Auto-generated method stub
		return refundMapper.selectRefundList();
	}
	
}
