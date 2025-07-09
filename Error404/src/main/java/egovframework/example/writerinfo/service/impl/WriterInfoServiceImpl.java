/**
 * 
 */
package egovframework.example.writerinfo.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.common.Criteria;
import egovframework.example.dept.service.impl.DeptMapper;
import egovframework.example.writerinfo.service.WriterInfoService;

/**
 * @author user
 *
 */
@Service
public class WriterInfoServiceImpl implements WriterInfoService{
//	Mapper 가져오기
	@Autowired
	private WriterInfoMapper writerInfoMapper;

//	전체조회
	@Override
	public List<?> selectWriterList(Criteria criteria) {
		// TODO Auto-generated method stub
		return writerInfoMapper.selectWriterList(criteria);
	}

//	총 개수구하기
	@Override
	public int selectWriterListTotCnt(Criteria criteria) {
		// TODO Auto-generated method stub
		return writerInfoMapper.selectWriterListTotCnt(criteria);
	}
	
	
}







