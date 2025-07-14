package egovframework.example.book.web;

import java.util.List;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.book.service.BookService;
import egovframework.example.book.service.BookVO;
import egovframework.example.common.Criteria;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Controller
public class BookController {
//   서비스 가져오기
   @Autowired
   private BookService bookService;
   
//   전체조회
   @GetMapping("/book.do")

   public String book(
         @ModelAttribute Criteria criteria,  // nat과 category도 이 안에 포함됨
         Model model
   ) {
       // nat과 category 로그 확인
       log.info("선택된 국적: {}", criteria.getNat());
       log.info("선택된 카테고리: {}", criteria.getCategory());
       // 덕규 : 로그 확인
       log.info("검색어(searchKeyword): {}", criteria.getSearchKeyword());
       log.info("검색조건(searchCondition): {}", criteria.getSearchCondition());

//		1)등차자동계산 클래스 :
//		-필요정보 : (1) 현재페이지번호, (2) 보일 갯수(pageUnit) : 3
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(criteria.getPageIndex());
		paginationInfo.setRecordCountPerPage(criteria.getPageUnit());
	//	등차를 자동 계산 : firstRecordIndex 필드에 있음
		criteria.setFirstIndex(paginationInfo.getFirstRecordIndex());
	
	
       // 조건에 맞는 도서 조회
       List<?> books;
       


       // (덕규)검색어가 있는 경우: 검색 전용으로 조건문을 달아봄
       if (criteria.getSearchKeyword() != null && !criteria.getSearchKeyword().trim().isEmpty()) {
           books = bookService.searchBookList(criteria); 
       } else {
           books = bookService.selectBookList(criteria); // 기존 전체 조회
       }
       // 여기까지가 조건문으로 바꾼것

       model.addAttribute("books", books);
       
//		페이지 번호 그리기 : 플러그인(전체테이블 행 갯수)
		int totCnt = bookService.selectBookListTotCnt(criteria);
		paginationInfo.setTotalRecordCount(totCnt);
		log.info("테스트 : " + totCnt);
//		페이지 모든정보 : paginationInfo
		model.addAttribute("paginationInfo", paginationInfo);
		
       return "book/book_all"; // JSP 경로
   }

   // 상세페이지
   @GetMapping("/book/detail.do")
   public String bookDetail(@RequestParam int bno, Model model) {
       BookVO book = bookService.selectBook(bno);
       model.addAttribute("book", book); // ← 여기 이름을 "book"으로 맞춰줌
       return "book/book_detail";
   }
 

}

