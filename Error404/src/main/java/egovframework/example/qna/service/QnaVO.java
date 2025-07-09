/**
 * 
 */
package egovframework.example.qna.service;

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
public class QnaVO {
	private Long qnaId;				// QNA_ID
	private String title;			// TITLE
	private String questionUserId;	// Q_ID
	private String questionContent;	// Q_CONTENT
	private Date questionDate;		// Q_DATE
	private String answerUserId;	// A_ID
	private String answerContent;	// A_CONTENT
	private Date answerDate;		// A_DATE
}
