package egovframework.example.book.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.book.service.BookVO;
import egovframework.example.common.Criteria;

@Mapper
public interface BookMapper {
	public List<?> selectBookList(Criteria criteria);
	public List<BookVO> searchBookList(Criteria criteria);
	public BookVO selectBook(int bno);
	public List<BookVO> selectLatestBooks(); 					 // 메인페이지 신간 도서 4개용(승화)
	public List<BookVO> selectRandomBooks(); 					 // 메인페이지 랜덤 도서 4개용(승화)
	public int selectBookListTotCnt(Criteria criteria); 	     // 총 개수 구하기
	public List<BookVO> selectBooksByBnoList(List<Integer> bnoList);  // 최근 본 상품(덕규)
	public List<BookVO> selectFlipBooks();   					 // 메인페이지 플립 도서 4개용(승화)
	public List<BookVO> selectBestSellerList(); 				 // 메인페이지 베스트셀러(승화)
	public BookVO getRandomOnSaleBook();						 // 랜덤도서 1권 가져오는용(덕규)
}

