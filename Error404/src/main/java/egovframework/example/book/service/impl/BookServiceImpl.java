package egovframework.example.book.service.impl;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.book.service.BookService;
import egovframework.example.book.service.BookVO;
import egovframework.example.common.Criteria;

@Service
public class BookServiceImpl implements BookService {
	//	mapper 가져오기
	@Autowired
	private BookMapper bookMapper;

//	전체조회
	@Override
	public List<?> selectBookList(Criteria criteria) {
		// TODO Auto-generated method stub
		return bookMapper.selectBookList(criteria);
	}

//	상세조회
	@Override
	public BookVO selectBook(int bno) {
		// TODO Auto-generated method stub
		return bookMapper.selectBook(bno);
	}

//  검색 책 검색하는 오버라이드(덕규 : 도서, 저자, 통합검색)	
	@Override
	public List<BookVO> searchBookList(Criteria criteria) {
		// TODO Auto-generated method stub
		return bookMapper.searchBookList(criteria);
	}

//	메인페이지 신간 도서 4개용(승화)
	@Override
	public List<BookVO> selectLatestBooks() {
		// TODO Auto-generated method stub
		return bookMapper.selectLatestBooks();
	}

//	메인페이지 랜덤 도서 4개용(승화)
	@Override
	public List<BookVO> selectRandomBooks() {
		// TODO Auto-generated method stub
		return bookMapper.selectRandomBooks();
	}


//	총 개수 구하기
	@Override
	public int selectBookListTotCnt(Criteria criteria) {
		// TODO Auto-generated method stub
		return bookMapper.selectBookListTotCnt(criteria);
	}


// 최근 본 상품 조회(덕규)
	@Override
	public List<BookVO> selectBooksByBnoList(List<Integer> bnoList) {
		if (bnoList == null || bnoList.isEmpty()) {
	        return Collections.emptyList();
	    }
		return bookMapper.selectBooksByBnoList(bnoList);
	}
	
	


//	메인페이지 플립 도서 4개용(승화)
	@Override
	public List<BookVO> selectFlipBooks() {
		// TODO Auto-generated method stub
		 return bookMapper.selectFlipBooks();

	}

	
	// 메인페이지 베스트셀러(승화)
	@Override
	public List<BookVO> selectBestSellerList() {
		// TODO Auto-generated method stub
		return bookMapper.selectBestSellerList();
	}

	//	랜덤도서 1권 가져오는 오버라이드(덕규)
	@Override
	public BookVO getRandomOnSaleBook() {
		return bookMapper.getRandomOnSaleBook();
	}
	

	
	
}
