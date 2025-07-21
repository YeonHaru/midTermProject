/**
 * 
 */
package egovframework.example.guestorder.service;

import java.util.List;

/**
 * @author user
 *
 */
public interface GuestOrderService {
	GuestOrderVO selectGuestOrder (GuestOrderVO guestOrderVO ); // 주문번호 + 비밀번호 조회
	 void insertGuestOrder(GuestOrderVO guestOrderVO);						// 비회원 주문 등록
	 void updateGuestOrderStatus(GuestOrderVO guestOrderVO);		// 상태 업데이트
	 List<GuestOrderVO> selectGuestOrdersByPhone(String phone);	// 전화번호로 주문목록 조회
	 void updateOrderId(int gno, String orderId);
}

