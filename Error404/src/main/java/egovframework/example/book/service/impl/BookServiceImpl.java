package egovframework.example.book.service.impl;

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
	
	
}
