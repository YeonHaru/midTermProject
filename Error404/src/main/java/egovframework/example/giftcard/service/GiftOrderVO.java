package egovframework.example.giftcard.service;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class GiftOrderVO {
    private int ono;         // 주문번호
    private String photo;    // 이미지
    private String name;     // 상품명
    private int money;       // 금액
    private Date odate;      // 구매일시
}
