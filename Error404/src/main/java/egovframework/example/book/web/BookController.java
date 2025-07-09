package egovframework.example.book.web;

import java.util.List;

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

       // 조건에 맞는 도서 조회
       List<?> books = bookService.selectBookList(criteria);

       model.addAttribute("books", books);
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

