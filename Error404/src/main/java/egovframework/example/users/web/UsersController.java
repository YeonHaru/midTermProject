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
import org.springframework.web.bind.annotation.RequestParam;

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
			session.setAttribute("userId", usersVO.getUserid()); // 이 줄 추가!
			 log.info("세션에 userId 저장됨: {}", usersVO.getUserid());
			
			 // TEMP_PW_YN이 'Y'면 플래그 세션에 저장하고 마이페이지로 강제 이동
	        if ("Y".equals(usersVO.getTempPwYn())) {
	            session.setAttribute("isTempPassword", true);
	            return "redirect:/mypage.do"; // ✅ 마이페이지로 이동
	        }
			
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

		// 세션에 임시비번 플래그가 있으면 JSP에 넘기고 한 번만 사용
	    Boolean isTemp = (Boolean) session.getAttribute("isTempPassword");
	    if (isTemp != null && isTemp) {
	        model.addAttribute("isTempPassword", true);
	        session.removeAttribute("isTempPassword"); // ✅ 팝업은 한 번만 띄우기 위해 제거
	    }
		
	
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
	// 비밀번호 찾기 처리 (추가)
	@PostMapping("/findPw.do")
	public String sendTempPassword(String userid, String email, Model model) {
	    String resultMessage;
	    try {
	        resultMessage = usersService.sendTemporaryPassword(userid, email);
	    } catch (Exception e) {
	        log.error("임시 비밀번호 발송 중 오류 발생", e);
	        resultMessage = "임시 비밀번호 발송 중 오류가 발생했습니다. 다시 시도해주세요.";
	    }
	    model.addAttribute("result", resultMessage);
	    return "auth/findPw";
	}
	
//	 유저가 직접 비밀번호 수정
		@PostMapping("/mypage/changePassword.do")
		public String changePassword(@RequestParam String currentPassword,
		                             @RequestParam String newPassword,
		                             HttpSession session, Model model) {

		    UsersVO loginUser = (UsersVO) session.getAttribute("loginUser");
		    String userid = loginUser.getUserid();

		    boolean result = usersService.changePassword(userid, currentPassword, newPassword);

		    if (result) {
		        model.addAttribute("msg", "비밀번호가 변경되었습니다.");
		    } else {
		        model.addAttribute("msg", "현재 비밀번호가 일치하지 않습니다.");
		    }

		    model.addAttribute("user", usersService.selectUserById(userid));

		    return "mypage/mypage";
		}
		// 회원가입 처리
		@PostMapping("/join.do")
		public String joinUser(UsersVO usersVO, Model model) {
		    try {
		        usersService.insertUser(usersVO);
		        model.addAttribute("msg", "회원가입이 완료되었습니다. 로그인 해주세요.");
		        return "auth/login"; // 가입 후 로그인 페이지로 이동
		    } catch (Exception e) {
		        log.error("회원가입 중 오류 발생", e);
		        model.addAttribute("msg", "회원가입 중 오류가 발생했습니다. 다시 시도해주세요.");
		        return "auth/join"; // 오류 시 다시 가입 폼으로
		    }
		}
}
