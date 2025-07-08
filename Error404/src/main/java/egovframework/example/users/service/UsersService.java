/**
 * 
 */
package egovframework.example.users.service;

import java.util.List;

import egovframework.example.common.Criteria;

/**
 * @author user
 *
 */
public interface UsersService {
	List<?> selectUsersList(Criteria criteria);
	boolean login(UsersVO usersVO);
	UsersVO selectUserById(String userid);

}
