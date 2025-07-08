/**
 * 
 */
package egovframework.example.refund.service.impl;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.refund.service.RefundVO;

/**
 * @author user
 * 	이건 마이페이지 환불사유에 쓰일 파일들입니다.
 */
@Mapper
public interface RefundMapper {
	public int insertRefundRequest(RefundVO refundVO);
}
