/**
 * 
 */
package egovframework.example.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.example.order.service.OrderItemVO;
import egovframework.example.order.service.OrderService;
import egovframework.example.order.service.OrderVO;
import lombok.extern.log4j.Log4j2;

/**
 * @author user
 *
 */
@Service
@Log4j2
@Transactional
public class OrderServiceImpl implements OrderService{
		@Autowired
		private OrderMapper orderMapper;

		@Override
		public void placeOrder(OrderVO order) {
//			주문 마스터 저장합니다.
			orderMapper.insertOrder(order);
			
//			주문을 상세 저장합니다.
			for (OrderItemVO item : order.getItems()) {
			    item.setOno(order.getOno()); // 오류 안 남!
			    orderMapper.insertOrderItem(item);
			}
		}

		@Override
	    public List<OrderVO> getOrdersByUserid(String userid) {
	        List<OrderVO> orders = orderMapper.getOrdersByUserid(userid);

	        log.debug("🔍 [OrderServiceImpl] 유저 주문 수: {}", orders.size());
	        for (OrderVO order : orders) {
	            log.debug("🧾 주문번호: {}", order.getOno());
	        }

	        return orders;
	    }
		
		
//	사용자 주문내역 추가 오버라이딩
		@Override
		public List<OrderVO> selectOrdersByUserid(String userid) {
			return orderMapper.selectOrdersByUserid(userid);
		}

		@Override
		public List<OrderItemVO> getItemsByOno(int ono) {
			return orderMapper.getItemsByOno(ono);
		}

		@Override
		public int insertOrder(OrderVO order) {
			orderMapper.insertOrder(order); // ORDER_SEQ로 ono 생성됨
	        for (OrderItemVO item : order.getItems()) {
	            item.setOno(order.getOno()); // 생성된 주문번호 설정
	            orderMapper.insertOrderItem(item);
	        }
	        return order.getOno();
	    }

		@Override
		public OrderVO getOrderWithItems(int ono) {
			return orderMapper.getOrderByOno(ono); // orderResultMap에서 items도 함께 매핑
	    }
		
		
		
}
