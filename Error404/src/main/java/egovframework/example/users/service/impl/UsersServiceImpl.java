/**
 * 
 */
package egovframework.example.users.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.common.Criteria;
import egovframework.example.users.service.UsersService;
import egovframework.example.users.service.UsersVO;

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

	@Override
	public boolean login(UsersVO usersVO) {
		// TODO Auto-generated method stub
		UsersVO dbUser = usersMapper.selectUserById(usersVO.getUserid());
		
		if (dbUser !=null && dbUser.getPassword().equals(usersVO.getPassword())) {
			return true;
		}
		return false;
	}

	
}
