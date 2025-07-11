package egovframework.example;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import egovframework.example.book.service.BookService;
import egovframework.example.book.service.BookVO;

@Controller
public class HomeController {

    @Autowired
    private BookService bookService;

    @GetMapping("/home.do")
    public String home(Model model) {
        // 신간 도서 4권 조회
        List<BookVO> latestBooks = bookService.selectLatestBooks(); // 메인페이지 신간 도서 4개용(승화)
        List<BookVO> randomBooks = bookService.selectRandomBooks(); // 메인페이지 랜덤 도서 4개용(승화)
        List<BookVO> flipBooks = bookService.selectFlipBooks();
        
        model.addAttribute("latestBooks", latestBooks);  // 메인페이지 신간 도서 4개용(승화)
        model.addAttribute("randomBooks", randomBooks);  // 메인페이지 랜덤 도서 4개용(승화)
        model.addAttribute("flipBooks", flipBooks);
        return "home";
    }

    @GetMapping("/temp.do")
    public String temp() {
        return "temp";
    }
}
