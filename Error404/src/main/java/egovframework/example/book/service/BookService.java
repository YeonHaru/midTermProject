package egovframework.example.book.service;

import java.util.List;

import egovframework.example.common.Criteria;

public interface BookService {
	List<?> selectBookList(Criteria criteria);
	BookVO selectBook(int bno);
	List<BookVO> searchBookList(Criteria criteria);
}
