/**
 * 
 */
package egovframework.example.refund.service;

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
	private Long id;             // NUMBER (자동 생성되므로 Long 타입 권장)
    private String userId;       // 유저아이디
    private String reason;       // 환불사유
    private String content;      // 환불상세사유
    private Date requestDate;    // 환불날짜
}
