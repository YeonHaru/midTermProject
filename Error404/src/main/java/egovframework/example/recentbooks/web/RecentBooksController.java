/**
 * 
 */
package egovframework.example.recentbooks.web;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.users.service.UsersService;
import egovframework.example.users.service.impl.UsersMapper;
import lombok.extern.log4j.Log4j2;

/**
 * @author user
 *
 */
@Log4j2
@Controller
public class RecentBooksController {
	@Autowired 
	private UsersMapper usersMapper;
	@Autowired
	private UsersService usersService;

		
	 // ① 책 번호 문자열 그대로 조회 (기존)
    @GetMapping("/user/recent-books-ids")
    @ResponseBody
    public ResponseEntity<String> getRecentBookIds(@RequestParam String userid) {
        String recent = usersMapper.getRecentBooks(userid);
        return ResponseEntity.ok(recent == null ? "" : recent);
		}
		
// 	② 책 정보(BookVO) 리스트로 반환 ← ✅ JS에서 이걸 fetch해야 함
	    @GetMapping("/user/recent-books")
	    @ResponseBody
	    public ResponseEntity<?> getRecentBooks(@RequestParam String userid) {
	        return ResponseEntity.ok(usersService.getRecentBookListByUserId(userid));
	    }

	
//	업데이트용
		@PostMapping("/user/recent-books")
		@ResponseBody
		public ResponseEntity<?> updateRecentBooks(@RequestParam String userid, @RequestParam String recentBooks) {
		    usersMapper.updateRecentBooks(userid, recentBooks);
		    return ResponseEntity.ok().build();
		}
}
