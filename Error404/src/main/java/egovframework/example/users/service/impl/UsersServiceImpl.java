/**
 * 
 */
package egovframework.example.users.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.common.Criteria;
import egovframework.example.dept.service.impl.DeptMapper;
import egovframework.example.users.service.UsersService;

/**
 * @author user
 *
 */
@Service
public class UsersServiceImpl implements UsersService{
	@Autowired
	private UsersMapper usersMapper;

	@Override
	public List<?> selectUsersList(Criteria criteria) {
		// TODO Auto-generated method stub
		return usersMapper.selectUsersList(criteria);
	}
	
}
