/**
 * 
 */
package egovframework.example.giftcard.service;

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
public class GiftBuyVO extends Criteria{
	private int gno;					// 부서번호(기본키,시퀀스)
	private String photo;				// 이미지
	private String name;				// 제목
	private int money;					// 금액
}
