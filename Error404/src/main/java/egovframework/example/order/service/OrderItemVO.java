/**
 * 
 */
package egovframework.example.order.service;


import egovframework.example.book.service.BookImgDTO;
import egovframework.example.book.service.BookVO;
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
public class OrderItemVO extends Criteria {
	private int ono;     // 주문번호 (FK)
    private int bno;     // 도서 번호
    private int qty;     // 수량
    private int price;   // 해당 항목 총 가격 (dprice * qty)

    private BookVO book;	// 북 정보 포함
	private BookImgDTO bookImg;
    
    public BookVO getBook() { return book; }
    public void setBook(BookVO book) { this.book = book; }
    
    public BookImgDTO getBookImg() { return bookImg; }
    public void setBookImg(BookImgDTO bookImg) { this.bookImg = bookImg; }
}
