/**
 * 
 */
package egovframework.example.book.service;

import java.util.List;

import egovframework.example.common.Criteria;

/**
 * @author user
 *
 */
public interface BookImgService {
   List<?> selectBookImgList(Criteria criteria);
   int selectBookImgListTotCnt(Criteria criteria); 	// 총 개수 구하기
}
