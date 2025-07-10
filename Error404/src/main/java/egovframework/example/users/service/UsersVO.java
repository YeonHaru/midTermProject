/**
 * 
 */
package egovframework.example.users.service;

import java.time.LocalDate;

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
public class UsersVO extends Criteria{

	 private String userid;
	    private String password;
	    private String name;
	    private String email;
	    private String phone;
	    private LocalDate join_date;    // DATE → LocalDate
	    private String role = "GENERAL" ; // 일반 등급 기본값 : 덕규(7/10)
	    private String gender;
	    private String birthdate;    
	    private String address;
	    private Integer point;          // null 가능성을 고려해 Integer 사용
	    private String promoAgree;		// 알림수신동의
	    private String postNotifyAgree;	// 알림수신동의
	    private String grade;			// 회원등급
	    private String tempPwYn; 		// 임시 비밀번호 여부 ('Y' or 'N')
}
