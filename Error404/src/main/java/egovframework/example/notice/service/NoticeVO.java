/**
 * 
 */
package egovframework.example.notice.service;

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
public class NoticeVO extends Criteria {

	private int noticeId;			// 공지번호
	private String title;			// 제목
	private String content;			// 내용
	private String writer;			// 작성자
	private Date createDate;		// 작성일
	private int viewCount;			// 조회수
	
}
