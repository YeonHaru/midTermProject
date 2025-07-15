package egovframework.example.image.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import egovframework.example.book.service.BookService;
import egovframework.example.book.service.BookVO;
import egovframework.example.image.service.BookImageService;

@RestController
@RequestMapping("/image")
public class BookImageController {

    private final BookService bookService;
    private final BookImageService bookImageService;

    @Autowired
    public BookImageController(BookService bookService, BookImageService bookImageService) {
        this.bookService = bookService;
        this.bookImageService = bookImageService;
    }

    @GetMapping("/book/{bno}")
    public ResponseEntity<byte[]> getBookImage(@PathVariable int bno) {
        BookVO book = bookService.selectBook(bno);
        if (book == null) {
            return ResponseEntity.notFound().build();
        }

        byte[] imageData = bookImageService.getImageOrDefault(book.getBimg());

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_JPEG); // JPG 기준
        headers.setContentLength(imageData.length);

        return new ResponseEntity<>(imageData, headers, HttpStatus.OK);
        
        
		/* 
		 * <div class="book-list-image"> <a
		 * href="${pageContext.request.contextPath}/book/detail.do?bno=${book.bno}">
		 * <img src="${pageContext.request.contextPath}/image/book/${book.bno}"
		 * alt="${book.title} 이미지" /> </a> </div>
		 */
    }
}
