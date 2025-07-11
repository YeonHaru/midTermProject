package egovframework.example.book.service;

import java.util.List;

import egovframework.example.common.Criteria;

public interface BookService {
	List<?> selectBookList(Criteria criteria);
	BookVO selectBook(int bno);
	List<BookVO> searchBookList(Criteria criteria);
	List<BookVO> selectLatestBooks();  // 메인페이지 신간 도서 4개용(승화)
	List<BookVO> selectRandomBooks();  // 메인페이지 랜덤 도서 4개용(승화)
	List<BookVO> selectBooksByBnoList(List<Integer> bnoList);  // 최근 본 상품(덕규)
	
}
