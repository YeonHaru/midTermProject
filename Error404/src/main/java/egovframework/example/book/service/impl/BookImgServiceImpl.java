/**
 * 
 */
package egovframework.example.book.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.book.service.BookImgDTO;
import egovframework.example.book.service.BookImgService;
import egovframework.example.common.Criteria;

/**
 * @author user
 *
 */
@Service
public class BookImgServiceImpl implements BookImgService{
	@Autowired
	private BookImgMapper bookImgMapper;

	@Override
	public List<?> selectBookImgList(Criteria criteria) {
		// TODO Auto-generated method stub
		return bookImgMapper.selectBookImgList(criteria);
	}

	@Override
	public int selectBookImgListTotCnt(Criteria criteria) {
		// TODO Auto-generated method stub
		return bookImgMapper.selectBookImgListTotCnt(criteria);
	}

	@Override
	public List<BookImgDTO> selectLatestBookImgList() {
		// TODO Auto-generated method stub
		return bookImgMapper.selectLatestBookImgList();
	}


	@Override
	public List<BookImgDTO> selectBooksByCategory(String category) {
		// TODO Auto-generated method stub
		return bookImgMapper.selectBooksByCategory(category);
	}

	@Override
	public List<BookImgDTO> selectFlipBookImgList() {
		// TODO Auto-generated method stub
		return bookImgMapper.selectFlipBookImgList();
	}

	@Override
	public List<BookImgDTO> selectBestSellerImgList() {
		// TODO Auto-generated method stub
		return bookImgMapper.selectBestSellerImgList();
	}
//	특정 도서번호(bno)에 대한 도서+이미지 상세정보 단건 조회 7/19일 강대성
	@Override
	public BookImgDTO selectBookImg(int bno) {
		// TODO Auto-generated method stub
		return bookImgMapper.selectBookImg(bno);
	}
	
	
	
}
