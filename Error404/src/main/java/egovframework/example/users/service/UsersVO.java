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
	    private String role;
	    private String gender;
	    private LocalDate birthdate;    
	    private String address;
	    private Integer point;          // null 가능성을 고려해 Integer 사용
}
