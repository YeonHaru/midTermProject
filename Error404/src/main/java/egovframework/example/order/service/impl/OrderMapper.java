/**
 * 
 */
package egovframework.example.order.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import egovframework.example.order.service.OrderItemVO;
import egovframework.example.order.service.OrderVO;

/**
 * @author user
 *
 */
@Mapper
public interface OrderMapper {
	public void insertOrder(OrderVO order);             // 마스터 저장
    public void insertOrderItem(OrderItemVO item);      // 상세 항목 저장
    public List<OrderVO> getOrdersByUserid(String userid);		//조회용

}
