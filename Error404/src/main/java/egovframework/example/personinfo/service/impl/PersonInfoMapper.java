/**
 * 
 */
package egovframework.example.personinfo.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.common.Criteria;

/**
 * @author user
 *
 */
@Mapper
public interface PersonInfoMapper {
	public List<?> selectPersonList(Criteria criteria); 		// 전체조회
	public int selectPersonListTotCnt(Criteria criteria); 	    // 총 개수 구하기
}
