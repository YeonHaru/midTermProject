/**
 * 
 */
package egovframework.example.order.service;

import java.util.List;



/**
 * @author user
 *
 */
public interface OrderService {
	void placeOrder(OrderVO order);
	List<OrderVO> getOrdersByUserid(String userid);
	List<OrderVO> selectOrdersByUserid(String userid);	//사용자 주문내역 조회 추가
	List<OrderItemVO> getItemsByOno(int ono);
	int insertOrder(OrderVO order); // 주문 저장, 주문번호 반환
    OrderVO getOrderWithItems(int ono); // 주문번호로 주문 + 항목 + 책 정보 조회
}
