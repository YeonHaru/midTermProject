/**
 * 
 */
package egovframework.example.writerinfo.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.common.Criteria;

/**
 * @author user
 *
 */
@Mapper
public interface WriterInfoMapper {
	public List<?> selectWriterList(Criteria criteria); 		// 전체조회
	public int selectWriterListTotCnt(Criteria criteria); 	    // 총 개수 구하기
}
