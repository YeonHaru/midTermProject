package egovframework.example.cart.service;

import java.util.Date;

import egovframework.example.cart.service.CartVO;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode(callSuper = false)
public class CartVO {
	
	//CART 테이블 컬럼
	private int cno;
	private String userId;
	private int bno;
	private int quantity;
	
	// BOOK테이블에서 JOIN한 도서 정보
	private String title;
    private String author;
    private String publisher;
    
//   BookImgDTO
    private String downloadUrl;      // 7월 17일 추가 강대성
    
//    private String bimg;       // BLOB을 경로로 처리 (예: /img/book1.jpg)
    private Date pdate;
    private int fprice;
    private int dprice;
    private int stock;
    private String des;
    private String category;
    private String nat;
    private int orderCount;
}
