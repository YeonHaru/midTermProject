/**
 * 
 */
package egovframework.example.personinfo.service;

import java.util.List;

import egovframework.example.common.Criteria;

/**
 * @author user
 *
 */
public interface PersonInfoService {
   List<?> selectPersonList(Criteria criteria); 		// 전체조회
   int selectPersonListTotCnt(Criteria criteria); 	    // 총 개수 구하기
}
