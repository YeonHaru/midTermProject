/**
 * 
 */
package egovframework.example.users.web;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import egovframework.example.order.service.OrderService;
import egovframework.example.order.service.OrderVO;
import egovframework.example.users.service.UsersService;
import egovframework.example.users.service.UsersVO;
import egovframework.example.wishlist.service.WishlistService;
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
	private OrderService orderService;
	@Autowired
	private UsersService usersService;
	@Autowired
	private WishlistService wishlistService;  // 위시리스트 불러오기
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;  // 비밀번호 해시화

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
		
		String userid = loginUser.getUserid();		// 덕규 추가한거
		
		// DB에서 최신 사용자 정보 가져오기 (프로필 이미지 포함)
	    UsersVO userDetails = usersService.selectUserById(loginUser.getUserid());
		
	    model.addAttribute("user", userDetails);  // JSP에서 ${user.profileImagePath} 접근 가능
		
	    // 위시리스트 추가
		List<?> list =wishlistService.getWishlist(loginUser.getUserid());

		model.addAttribute("wishlist", list);
		
		// ✅ 주문내역 (여기서 추가!) : 덕규
	    List<OrderVO> orders = orderService.getOrdersByUserid(userid);
	    model.addAttribute("orders", orders);
		
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
//		로그인 유효성 체크(중복방지)
		@GetMapping("/checkUserid.do")
		@ResponseBody
		public String checkUserid(@RequestParam String userid) {
		    UsersVO user = usersService.selectUserById(userid);
		    if (user == null) {
		        return "available"; // 사용 가능
		    } else {
		        return "unavailable"; // 이미 존재
		    }
		
		}
		
//		개인정보수신동의 db전달   
		@PostMapping("/mypage/updatePreferences.do")
		@ResponseBody
		public String updatePreferences(
		    @RequestParam(value = "promoAgree", required = false) String promoAgree,
		    @RequestParam(value = "postNotifyAgree", required = false) String postNotifyAgree,
		    HttpSession session) {

		    UsersVO loginUser = (UsersVO) session.getAttribute("loginUser");
		    if (loginUser == null) return "fail";

		    if (promoAgree != null) {
		        loginUser.setPromoAgree(promoAgree);
		    }
		    if (postNotifyAgree != null) {
		        loginUser.setPostNotifyAgree(postNotifyAgree);
		    }

		    int result = usersService.updateUserPreferences(loginUser);
		    return result > 0 ? "success" : "fail";
		}

//		유저 프로필 파일 업로드
		@PostMapping("/mypage/uploadPhoto.do")
		public String uploadProfilePhoto(@RequestParam("profilePhoto") MultipartFile file, HttpSession session, Model model) {
		    log.info("uploadProfilePhoto 진입");

		    UsersVO loginUser = (UsersVO) session.getAttribute("loginUser");
		    if (loginUser == null) {
		        log.warn("로그인 세션 없음 - 로그인 페이지로 리다이렉트");
		        return "redirect:/login.do";
		    }

		    if (file == null || file.isEmpty()) {
		        log.warn("업로드된 파일이 없음");
		        model.addAttribute("uploadError", "파일이 선택되지 않았습니다.");
		        return "mypage/mypage";
		    }

		    try {
		        log.info("파일명: {}", file.getOriginalFilename());
		        log.info("파일 크기: {}", file.getSize());

		        // 실제 서버 내 경로 가져오기 (웹 루트 내 resources/upload/profile)
		        String uploadDir = session.getServletContext().getRealPath("/resources/upload/profile");
		        log.info("업로드 경로: {}", uploadDir);

		        File dir = new File(uploadDir);
		        if (!dir.exists()) {
		            boolean created = dir.mkdirs();
		            log.info("디렉토리 생성 결과: {}", created);
		        }

		        String originalFilename = file.getOriginalFilename();
		        String extension = originalFilename.substring(originalFilename.lastIndexOf("."));
		        String newFileName = loginUser.getUserid() + extension;

		        File saveFile = new File(uploadDir, newFileName);
		        file.transferTo(saveFile);
		        log.info("파일 저장 완료: {}", saveFile.getAbsolutePath());

		        // 웹에서 접근할 URL 경로 (JSP에서 사용)
		        String profileImagePath = "/resources/upload/profile/" + newFileName;
		        log.info("DB 저장할 이미지 경로: {}", profileImagePath);

		        usersService.updateProfileImage(loginUser.getUserid(), profileImagePath);

		        loginUser.setProfileImagePath(profileImagePath);
		        session.setAttribute("loginUser", loginUser);

		    } catch (IOException e) {
		        log.error("프로필 사진 업로드 중 오류 발생", e);
		        model.addAttribute("uploadError", "사진 업로드 중 오류가 발생했습니다.");
		        return "mypage/mypage";
		    }

		    return "redirect:/mypage.do";
		}
//		유저 정보 수정 db저장 
		@PostMapping("/mypage/updateInfo.do")
		@ResponseBody
		public String updateUserInfo(HttpSession session,
		                             @RequestParam("birth") String birth,
		                             @RequestParam("phone") String phone,
		                             @RequestParam("address") String address) {
		    UsersVO loginUser = (UsersVO) session.getAttribute("loginUser");
		    if (loginUser == null) return "fail";

		    try {
		    	loginUser.setBirthdate(birth);
		        loginUser.setPhone(phone);
		        loginUser.setAddress(address);

		        int result = usersService.updateUserInfo(loginUser);
		        return result > 0 ? "success" : "fail";

		    } catch (Exception e) {
		        e.printStackTrace();
		        return "fail";
		    }
		
		}
}
