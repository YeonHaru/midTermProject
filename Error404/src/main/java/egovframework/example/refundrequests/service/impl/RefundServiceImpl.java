/**
 * 
 */
package egovframework.example.refundrequests.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.refundrequests.service.RefundService;
import egovframework.example.refundrequests.service.RefundVO;
import lombok.extern.log4j.Log4j2;

/**
 * @author user
 *	이건 마이페이지 환불사유에 쓰일 파일들입니다.
 */
@Log4j2
@Service
public class RefundServiceImpl implements RefundService {
	@Autowired
	private RefundMapper refundMapper;

//	마이페이지 환불사유 새창불러오기
	@Override
	public int insertRefundRequest(RefundVO refundVO) {
		// TODO Auto-generated method stub
		log.info("🌀 RefundServiceImpl.insertRefundRequest 호출됨");
		return refundMapper.insertRefundRequest(refundVO);
	}
//	환불사유 전체 조회
	@Override
	public List<RefundVO> selectRefundList() {
		// TODO Auto-generated method stub
		return refundMapper.selectRefundList();
	}
//	환불사유 개별id조회
	@Override
	public List<RefundVO> selectRefundListByUserId(String userid) {
		// TODO Auto-generated method stub
		return refundMapper.selectRefundListByUserId(userid);
	}

	
}
