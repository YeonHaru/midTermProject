/**
 * 
 */
package egovframework.example.refundrequests.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.refundrequests.service.RefundVO;

/**
 * @author user
 * 	이건 마이페이지 환불사유에 쓰일 파일들입니다.
 */
@Mapper
public interface RefundMapper {
	public int insertRefundRequest(RefundVO refundVO);   //	환불사유 추가
	public List<RefundVO> selectRefundList(); 			 // 전체 환불사유 조회
	public List<RefundVO> selectRefundListByUserId(String userid); // id별로 환불사유 조회
	
}
