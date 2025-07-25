package egovframework.example;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import egovframework.example.book.service.BookImgDTO;
import egovframework.example.book.service.BookImgService;
import egovframework.example.book.service.BookService;
import egovframework.example.book.service.BookVO;

@Controller
public class HomeController {

    @Autowired
    private BookService bookService;
    @Autowired
    private BookImgService bookImgService;

    @GetMapping("/home.do")
    public String home(Model model) {
        
      
        List<BookImgDTO> latestBookImgs = bookImgService.selectLatestBookImgList();// 메인페이지 신간 도서 4개용(승화)
        List<BookImgDTO> novelBooksImgs = bookImgService.selectBooksByCategory("fiction");// 메인페이지 랜덤 도서 4개용(승화)   	
        List<BookImgDTO> flipBooksImgs = bookImgService.selectFlipBookImgList();// 메인페이지 플립 도서 4개용(승화)
        List<BookVO> bestSellers = bookService.selectBestSellerList();// 메인페이지 베스트셀러(승화)
        
      
        // 임시) 첫 번째 책만 'new', 두 번째는 순위 상승 3, 세 번째는 순위 하락 1이라고 임의 설정
        // 추후 오더카운터 적용될시 수정할 예정 (승화)
		/*
		 * for (int i = 0; i < bestSellers.size(); i++) { BookImgDTO book =
		 * bestSellers.get(i);
		 * 
		 * if (i == 0) book.setNewFlag(true); if (i == 1) book.setRankUp(3); if (i == 2)
		 * book.setRankDown(1); }
		 */

          
        model.addAttribute("latestBookImgs", latestBookImgs);// 메인페이지 신간 도서 4개용(승화)
        model.addAttribute("novelBooksImgs", novelBooksImgs); // 메인페이지 랜덤 도서 4개용(승화)
        model.addAttribute("flipBooksImgs", flipBooksImgs); // 메인페이지 플립 도서 4개용(승화)
        model.addAttribute("bestSellers", bestSellers);// 메인페이지 베스트셀러 (승화)
        
        return "home";
    }

    @GetMapping("/temp.do")
    public String temp() {
        return "temp";
    }
}
