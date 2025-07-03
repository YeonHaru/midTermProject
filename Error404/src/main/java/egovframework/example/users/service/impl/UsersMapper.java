/**
 * 
 */
package egovframework.example.users.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.common.Criteria;
import egovframework.example.users.service.UsersVO;

/**
 * @author user
 *
 */
@Mapper
public interface UsersMapper {
	public List<?> selectUsersList(Criteria criteria);
	public UsersVO selectUserById(String userId);
}
