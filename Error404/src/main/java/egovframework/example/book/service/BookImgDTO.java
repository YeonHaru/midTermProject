/**
 * 
 */
package egovframework.example.book.service;

import java.util.Date;

import egovframework.example.common.Criteria;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
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
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode(callSuper = false)
public class BookImgDTO extends Criteria{
	private int bno; // 도서 번호 (PK)
	private String title; // 제목
	private String author; // 저자
	private String publisher; // 출판사
	private Date pubDate; // 출간일
	private int fprice; // 정가
	private int dprice; // 할인가
	private int stock; // 재고 수량
	private String des; // 책 소개 (CLOB → String으로 매핑됨)
	private int bcid; // 카테고리 ID
	private Double discount; // 할인율 (메인페이지 할인율 플립도서용)

	private int orderCount; // 주문수(메인페이지 베스트셀러에서 활용 승화)
	private boolean newFlag; // 신규 여부(메인페이지 베스트셀러에서 활용 승화)
	private int rankUp; // 순위 상승(메인페이지 베스트셀러에서 활용 승화)
	private int rankDown; // 순위 하락(메인페이지 베스트셀러에서 활용 승화)
	
	private String uuid; 
	private String fileName; 
	private byte[] fileData; 
	private String downloadUrl; 
	
	
}
