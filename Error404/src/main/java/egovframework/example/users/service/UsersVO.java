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
	private String userid ;
	private String password ;
	private String name ;
	private String email ;
	private String phone ;
	private String join_date ;
	private String role ;
}
