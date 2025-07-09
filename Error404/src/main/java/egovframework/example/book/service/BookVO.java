package egovframework.example.book.service;

import java.util.Date;

import egovframework.example.common.Criteria;
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
public class BookVO extends Criteria {
	
    private int bno;               // 도서 번호 (PK)
    private String title;          // 제목
    private String author;         // 저자
    private String publisher;      // 출판사
    private byte[] bimg;           // 이미지 (BLOB 처리)
    private Date pubDate;          // 출간일
    private int fprice;            // 정가
    private int dprice;            // 할인가
    private int stock;             // 재고 수량
    private String des;    // 책 소개 (CLOB → String으로 매핑됨)
    private int bcid;              // 카테고리 ID
    private String fileUrl; // 이미지 다운로드를 위한 URL
	
	
}
