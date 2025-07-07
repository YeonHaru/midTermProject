/**
 * 
 */
package egovframework.example.users.service;

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
	private String userid ;						// 아이디
	private String password ;					// 비밀번호
	private String name ;						// 이름
	private String email ;						// 메일
	private String phone ;						// 전화번호
	private String join_date ;					// 가입날짜
	private String role ;							// 등급(역할)
}
