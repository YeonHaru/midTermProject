/**
 * 
 */
package egovframework.example.guestorder.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.guestorder.service.GuestOrderVO;

/**
 * @author user
 *
 */
@Mapper
public interface GuestOrderMapper {
	public GuestOrderVO selectGuestOrder (GuestOrderVO guestOrderVO ); // 주문번호 + 비밀번호 조회
	public void insertGuestOrder(GuestOrderVO guestOrderVO);						// 비회원 주문 등록
	public void updateGuestOrderStatus(GuestOrderVO guestOrderVO);		// 상태 업데이트
	public List<GuestOrderVO> selectGuestOrdersByPhone(String phone);	// 전화번호로 주문목록 조회
	public void updateOrderId(@Param("gno") int gno, @Param("orderId") String orderId);
}
