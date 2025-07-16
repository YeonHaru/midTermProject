/**
 * 
 */
package egovframework.example.giftcard.service;

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
public class GiftPresenVO extends Criteria{
	
	private int gno;					// 부서번호(기본키,시퀀스)
	private String title;				// 제목
	private String content;				// 내용
	private int money;				    // 금액
	private String photo;				// 이미지	 
	
}
