package egovframework.example.book.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.book.service.BookVO;
import egovframework.example.common.Criteria;

@Mapper
public interface BookMapper {
	public List<?> selectBookList(Criteria criteria);
	public BookVO selectBook(int bno);
}
