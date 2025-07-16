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
	private int fprice; // 정가
	private int dprice; // 할인가
	private String des; // 책 소개 (CLOB → String으로 매핑됨)

	
	private String uuid; 
	private String fileName; 
	private byte[] fileData; 
	private String downloadUrl; 
	
	
}
