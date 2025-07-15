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
}
