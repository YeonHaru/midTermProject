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
}
