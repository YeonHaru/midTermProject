/**
 * 
 */
package egovframework.example.writerinfo.service;

import egovframework.example.common.Criteria;
import egovframework.example.dept.service.DeptVO;
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
public class WriterInfoVO extends Criteria{
	private String uuid;				      		// 기본키(uuid)
	private String writer;						// 작가
	private String work;						// 작품
	private String prize;                       // 상
	private String details;                     // 짧은 글
	private String plot;                        // 줄거리
	private byte[] bookcover;                   // 첨부파일
	private String bookurl;						// 이미지 다운로드를 위한 URL
	public WriterInfoVO(String writer, String work, String prize, String details, String plot, byte[] bookcover) {
		super();
		this.writer = writer;
		this.work = work;
		this.prize = prize;
		this.details = details;
		this.plot = plot;
		this.bookcover = bookcover;
	}

} 
