/**
 * 
 */
package egovframework.example.users.web;


import javax.servlet.http.HttpSession;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;


import egovframework.example.users.service.UsersService;
import egovframework.example.users.service.UsersVO;
import lombok.extern.log4j.Log4j2;

/**
 * @author user
 *
 */
@Log4j2
@Controller
public class UsersController {
//	서비스 가져오기
	@Autowired
	private UsersService usersService;
	
//	회원가입 페이지 열기(주소정하기, 추가페이지 우리 몇개까지?)
	@GetMapping("/join.do")
	public String joinUsersView(Model model) {
		model.addAttribute("usersVO", new UsersVO());
		return "auth/join";  // join에 연결해둠
		
	}
//	로그인 페이지 열기(주소정하기, 추가페이지 우리 몇개까지?)
	@GetMapping("/login.do")
	public String loginUsersView(Model model) {
		model.addAttribute("usersVO", new UsersVO());
		return "auth/login";  // login에 연결해둠
		
	}

	@PostMapping("/login.do")
	public String login(UsersVO usersVO, HttpSession session) {
	    boolean success = usersService.login(usersVO);
	    if (success) {
	        session.setAttribute("loginUser", usersVO);
	        return "redirect:/home.do";
	    } else {
	        return "login";
	    }
	
}

}
