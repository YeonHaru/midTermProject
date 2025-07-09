/**
 * 
 */
package egovframework.example.writerinfo.service;

import java.util.List;

import egovframework.example.common.Criteria;

/**
 * @author user
 *
 */
public interface WriterInfoService {
   List<?> selectWriterList(Criteria criteria); 		// 전체조회
   int selectWriterListTotCnt(Criteria criteria); 	    // 총 개수 구하기
}
