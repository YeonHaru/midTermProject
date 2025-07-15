/**
 * 
 */
package egovframework.example.order.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import egovframework.example.book.service.BookService;
import egovframework.example.book.service.BookVO;
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
		@Autowired
		private BookService bookService;

//		[일반 사용자 주문]
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

	        System.out.println("✅ [OrderServiceImpl] getOrdersByUserid 호출됨");
	        System.out.println("▶ 유저 ID: " + userid);
	        System.out.println("▶ 주문 수: " + orders.size());

	        for (OrderVO order : orders) {
	            System.out.println("📦 주문번호: " + order.getOno());
	            System.out.println("📚 항목 수: " + (order.getItems() != null ? order.getItems().size() : "null"));
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

//		[내부 또는 관리자 전용] 주문저장+주문번호 반환
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

		@Override
		public OrderVO placeOrder(String userid, List<Integer> bnoList, List<Integer> qtyList, String recipient,
				String phone, String address, String memo, String paymentMethod) {
			OrderVO order = new OrderVO();
		    order.setUserid(userid);
		    order.setOstatus("결제완료");
		    order.setRecipient(recipient);
		    order.setPhone(phone);
		    order.setAddress(address);
		    order.setMemo(memo);
		    order.setPaymentMethod(paymentMethod);

		    List<OrderItemVO> itemList = new ArrayList<>();
		    int total = 0;

		    for (int i = 0; i < bnoList.size(); i++) {
		        int bno = bnoList.get(i);
		        int qty = qtyList.get(i);
		        BookVO book = bookService.getBookById(bno);

		        if (book != null) {
		            OrderItemVO item = new OrderItemVO();
		            item.setBno(bno);
		            item.setQty(qty);
		            item.setPrice(book.getDprice() * qty); // 할인 가격 기준
		            item.setBook(book);

		            total += item.getPrice();
		            itemList.add(item);
		        }
		    }

		    order.setTotal(total);
		    order.setItems(itemList);

		    // 주문 저장
		    orderMapper.insertOrder(order);
		    for (OrderItemVO item : itemList) {
		        item.setOno(order.getOno());
		        orderMapper.insertOrderItem(item);
		    }

		    return order;
		}
		
		
		
		
		
}
