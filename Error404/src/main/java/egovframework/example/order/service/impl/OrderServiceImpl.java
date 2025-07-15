/**
 * 
 */
package egovframework.example.order.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.order.service.OrderItemVO;
import egovframework.example.order.service.OrderService;
import egovframework.example.order.service.OrderVO;

/**
 * @author user
 *
 */
@Service
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
			return orderMapper.getOrdersByUserid(userid);
		}	
		
}
