/**
 * 
 */
package egovframework.example.personinfo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.common.Criteria;
import egovframework.example.dept.service.impl.DeptMapper;
import egovframework.example.personinfo.service.PersonInfoService;

/**
 * @author user
 *
 */
@Service
public class PersonInfoServiceImpl implements PersonInfoService{
//	Mapper 가져오기
	@Autowired
	private PersonInfoMapper personInfoMapper;

//	전체조회
	@Override
	public List<?> selectPersonList(Criteria criteria) {
		// TODO Auto-generated method stub
		return personInfoMapper.selectPersonList(criteria);
	}

//	총 개수구하기
	@Override
	public int selectPersonListTotCnt(Criteria criteria) {
		// TODO Auto-generated method stub
		return personInfoMapper.selectPersonListTotCnt(criteria);
	}
	
	
}







