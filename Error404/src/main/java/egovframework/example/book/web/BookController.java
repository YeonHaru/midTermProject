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
//	서비스 가져오기
	@Autowired
	private BookService bookService;
	
//	전체조회
	@GetMapping("/book.do")
	public String book(
			@ModelAttribute Criteria criteria, Model model
			) {
//		PaginationInfo paginationInfo = new PaginationInfo();
//		paginationInfo.setCurrentPageNo(criteria.getPageIndex());
//		criteria.setFirstIndex(paginationInfo.getFirstRecordIndex());
//		전체조회 서비스 메소드 실행
		List<?> books = bookService.selectBookList(criteria);
		log.info("테스트 : "+books);	
		model.addAttribute("books", books);
		return "book/book_all";
	}
	
//	상세페이지
    @GetMapping("/book/detail.do")
    public String bookDetail(@RequestParam int bno, Model model) {
        BookVO bookVO = bookService.selectBook(bno);
        model.addAttribute("bookVO", bookVO); // JSP에 넘겨줄 모델 데이터
        return "book/book_detail"; // → /WEB-INF/views/book/detail.jsp 로 forward
    }
	

}
