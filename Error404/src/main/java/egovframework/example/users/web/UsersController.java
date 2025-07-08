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
		return "auth/join"; // join에 연결해둠

	}

//	로그인 페이지 열기(주소정하기, 추가페이지 우리 몇개까지?)
	@GetMapping("/login.do")
	public String loginUsersView(Model model) {
		model.addAttribute("usersVO", new UsersVO());
		return "auth/login"; // login에 연결해둠

	}

	// 로그인
	@PostMapping("/login.do")
	public String login(UsersVO usersVO, HttpSession session, Model model) {
		boolean success = usersService.login(usersVO);
		if (success) {
			session.setAttribute("loginUser", usersVO);
			return "redirect:/home.do";
		} else {
			model.addAttribute("msg", "아이디 또는 비밀번호가 올바르지 않습니다.");
			return "auth/login"; // 정확한 경로로 수정
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

	// 아이디 찾기 폼 페이지
	@GetMapping("/findId.do")
	public String findIdForm() {
		return "auth/findId"; // findId.jsp 또는 findId.html
	}

	// 아이디 찾기 처리
	@PostMapping("/findId.do")
	public String findId(String name, String email, Model model) {
		String userid = usersService.findUserId(name, email);
		if (userid != null) {
			model.addAttribute("result", "아이디는 " + userid + " 입니다.");
		} else {
			model.addAttribute("result", "일치하는 정보가 없습니다.");
		}
		return "auth/findId";
	}

	// 비밀번호 찾기 폼 페이지
	@GetMapping("/findPw.do")
	public String findPwForm() {
		return "auth/findPw"; // findPw.jsp 또는 findPw.html
	}

	// 비밀번호 찾기 처리
	@PostMapping("/findPw.do")
	public String findPw(String userid, String email, Model model) {
		String password = usersService.findPassword(userid, email);
		if (password != null) {
			model.addAttribute("result", "비밀번호는 " + password + " 입니다.");
			// 실제 운영에서는 임시 비밀번호 발급 + 메일 전송 등으로 변경 필요
		} else {
			model.addAttribute("result", "일치하는 정보가 없습니다.");
		}
		return "auth/findPw";
	}

}
