/**
 * 
 */
package egovframework.example.guestorder.service;

import java.util.Date;
import java.util.List;

import egovframework.example.order.service.OrderItemVO;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * @author user
 *	비회원 주문자 관련된 VO
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode(callSuper = false)
public class GuestOrderVO {
	private String orderId;
    private String orderPassword;
    private String customerName;
    private String productName;
    private Date orderDate;					//타입 변경
    private int totalPrice;
    private String address;
    private String phone;
    private String ostatus;					// 주문 처리 상태 추적
    private int gno;         // DB에서 selectKey로 채워짐
    private String paymentMethod;
    private List<OrderItemVO> items;
    private String recipient;
    private String memo;
}
