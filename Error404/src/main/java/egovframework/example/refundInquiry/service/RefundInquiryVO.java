/**
 * 
 */
package egovframework.example.refundInquiry.service;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * @author user 이건 1대1문의에 쓰이는 vo입니다.
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode(callSuper = false)
public class RefundInquiryVO {
	private Long id; // NUMBER, 시퀀스 값
	private String userId; // USER_ID
	private String title; // TITLE
	private String content; // CONTENT
	private Date requestDate; // REQUEST_DATE
	private String answer;		// 관리자 답변
	private Date answerDate;	// 관리자 답변 날짜

}
