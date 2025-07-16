/**
 * 
 */
package egovframework.example.order.service;

import java.util.Date;
import java.util.List;

import egovframework.example.common.Criteria;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * @author user
 *
 */
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class OrderVO extends Criteria {
	private int ono;           // 주문번호
    private String userid;     // 주문자 ID
    private Date odate;        // 주문일자
    private String ostatus;    // 주문 상태
    private int total;         // 총 주문 금액
    
    private String recipient;
    private String phone;
    private String address;
    private String memo;
    private String paymentMethod;

    private List<OrderItemVO> items; // 주문 상세 리스트 (1:N)
    
    public List<OrderItemVO> getItems() {
        return items;
    }

    public void setItems(List<OrderItemVO> items) {
        this.items = items;
    }
}
