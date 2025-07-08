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
	//	로그인
	@PostMapping("/login.do")
	public String login(UsersVO usersVO, HttpSession session, Model model) {
	    boolean success = usersService.login(usersVO);
	    if (success) {
	        session.setAttribute("loginUser", usersVO);
	        return "redirect:/home.do";
	    } else {
	        model.addAttribute("msg", "아이디 또는 비밀번호가 올바르지 않습니다.");
	        return "auth/login";  // 정확한 경로로 수정
	    }
}
//	로그아웃
	@GetMapping("/logout.do")
    public String logout(HttpSession session) {
        session.invalidate(); // 세션 종료
        return "redirect:/home.do"; // 홈 또는 로그인 페이지로 이동
    }
	
//	마이페이지
	@GetMapping("/mypage.do")
	public String mypage(HttpSession session, Model model) {
	    UsersVO loginUser = (UsersVO) session.getAttribute("loginUser");

	    if (loginUser == null) {
	        return "redirect:/login.do"; // 로그인 안 되어 있으면 로그인 페이지로 이동
	    }

	    UsersVO userDetails = usersService.selectUserById(loginUser.getUserid());
	    model.addAttribute("user", userDetails);

	    return "mypage/mypage";
	}
	
}
