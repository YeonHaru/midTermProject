package egovframework.example.book.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.book.service.BookService;
import egovframework.example.book.service.BookVO;
import egovframework.example.common.Criteria;
import egovframework.example.users.service.UsersVO;
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
   // 오늘의 도서 특가 : 덕규
   @RequestMapping("/todaySpecial.do")
   public String todaySpecial(Model model) {
	    List<BookVO> randomBooks = new ArrayList<>();
  // 반복문 2개 출력
	    for (int i = 0; i < 2; i++) {
	        BookVO randomBook = bookService.getRandomOnSaleBook();

	        if (randomBook == null) {
	            randomBook = new BookVO();
	            randomBook.setTitle("도서 없음");
	            randomBook.setFileUrl("/images/default.jpg");
	        }

	        randomBooks.add(randomBook); 
	    }

	    model.addAttribute("books", randomBooks);
	    return "today_special/todaySpecial";
	}
   
//   구매 : 덕규
   @RequestMapping(value = "/order/form.do", method =  RequestMethod.POST)
   public String showOrderForm(@RequestParam("bno") int bno,
           @RequestParam("qty") int qty,
           HttpSession session,
           Model model) {
//	도서 정보 조회를 합니다.
	   BookVO book = bookService.getBookById(bno);
	   
//	   도서가 존재하지 않을 때 예외 처리 할건데 일단은 홈으로 리다이렉트 걸어둘게요.
	   if (book == null) {
	        return "redirect:/home.do"; 		// 바꾸고싶은 곳으로 리다이렉트 해도 될거같아요
	    }
	   
//	   모델에서 도서 정보와 수량을 전달하는거에요
	   model.addAttribute("book", book);
	   model.addAttribute("qty", qty);
//	로그인 회원정보
	   UsersVO loginUser = (UsersVO) session.getAttribute("loginUser");
	   if (loginUser != null) {
		model.addAttribute("user",loginUser);
	}
	   return "order/orderForm"; 
	
}
}

