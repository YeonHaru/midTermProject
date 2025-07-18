/**
 * 
 */
package egovframework.example.book.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.book.service.BookImgDTO;
import egovframework.example.common.Criteria;

/**
 * @author user
 *
 */
@Mapper
public interface BookImgMapper {
	public List<?> selectBookImgList(Criteria criteria);
	public int selectBookImgListTotCnt(Criteria criteria); 	// 총 개수 구하기
	
	public List<BookImgDTO> selectLatestBookImgList();
	public List<BookImgDTO> selectBooksByCategory(String category);
	public List<BookImgDTO> selectFlipBookImgList();
	public List<BookImgDTO> selectBestSellerImgList();
	
	
	// 특정 도서번호(bno)에 대한 도서+이미지 상세정보 단건 조회 7/19일 강대성
	public BookImgDTO selectBookImg(int bno);
}
