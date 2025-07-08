/**
 * 
 */
package egovframework.example.guestorder.service;

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
    private String orderDate;
    private int totalPrice;
    private String address;
    private String phone;
}
