/**
 * 
 */
package egovframework.example.refundrequests.service;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * @author user
 *	이건 마이페이지 환불요청에 들어가는 VO입니다
 *	환불사유,나의1대1문의 조회 기능으로 만든것입니다.
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode(callSuper = false)
public class RefundVO {
	private Long rno;           // RNO (기존 id → rno로 변경)
	private String userid;      // USERID
	private String reason;      // REASON
	private String content;     // CONTENT
	private Date requestDate;   // REQUEST_DATE
	private Long ono;           // ONO (선택적 사용)
	private String status;      // STATUS (선택적 사용)
}