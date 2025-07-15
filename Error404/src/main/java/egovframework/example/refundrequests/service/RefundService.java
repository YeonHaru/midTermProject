/**
 * 
 */
package egovframework.example.refundrequests.service;

import java.util.List;

/**
 * @author user
 *	이건 마이페이지 환불사유에 쓰일 파일들입니다.
 */
public interface RefundService {
	int insertRefundRequest(RefundVO refundVO);
	List<RefundVO> selectRefundList(); 			 // 전체 환불사유 조회
	List<RefundVO> selectRefundListByUserId(String userid); // id별로 환불사유 조회
}
