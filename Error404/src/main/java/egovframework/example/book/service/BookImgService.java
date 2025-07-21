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
   
   List<BookImgDTO> selectLatestBookImgList();
   List<BookImgDTO> selectBooksByCategory(String category);
   List<BookImgDTO> selectFlipBookImgList();
   List<BookImgDTO> selectBestSellerImgList();
   
   
// 특정 도서번호(bno)에 대한 도서+이미지 상세정보 단건 조회 7/19일 강대성
   BookImgDTO selectBookImg(int bno);
}
