/**
 * 
 */
package egovframework.example.users.service.impl;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import egovframework.example.book.service.BookService;
import egovframework.example.book.service.BookVO;
import egovframework.example.book.service.impl.BookMapper;
import egovframework.example.common.Criteria;
import egovframework.example.purchase.service.impl.PurchaseMapper;
import egovframework.example.users.service.EmailService;
import egovframework.example.users.service.UsersService;
import egovframework.example.users.service.UsersVO;

/**
 * @author user
 *
 */
@Service
public class UsersServiceImpl implements UsersService {
	@Autowired
	private UsersMapper usersMapper;
	@Autowired
	private EmailService emailService;
	@Autowired
	private PurchaseMapper purchaseMapper;
	@Autowired
	private BookMapper bookMapper;
	@Autowired
	private BookService bookService;
	@Autowired
	private BCryptPasswordEncoder passwordEncoder;  // 비밀번호 해시화

// 	전체조회
	@Override
	public List<?> selectUsersList(Criteria criteria) {
		// TODO Auto-generated method stub
		return usersMapper.selectUsersList(criteria);
	}

//	로그인
	@Override
	public boolean login(UsersVO usersVO) {
	    UsersVO dbUser = usersMapper.selectUserById(usersVO.getUserid());

	    if (dbUser != null && passwordEncoder.matches(usersVO.getPassword(), dbUser.getPassword())) {
	        usersVO.setTempPwYn(dbUser.getTempPwYn()); // TEMP_PW_YN 상태도 세팅
	        return true;
	    }
	    return false;
	}

//	아이디 찾기 
	@Override
	public String findUserId(String name, String email) {
		// TODO Auto-generated method stub
		return usersMapper.findUserId(name, email);
	}

	// 마이페이지 불러오기? 들어가기?
	@Override
	public UsersVO selectUserById(String userid) {
		// TODO Auto-generated method stub
		return usersMapper.selectUserById(userid);
	}

// 		비밀번호 찾기
//		임시비번을 유저 메일로 쏘고 db에 임시비번을 저장
//		유저가 메일을 받고 임시비번으로 로긴 후 비번 변경시 다시 db에 저장
	@Override
	public String sendTemporaryPassword(String userid, String email) {
	    String found = usersMapper.findPassword(userid, email);
	    if (found == null) {
	        return "입력한 정보와 일치하는 계정이 없습니다.";
	    }

	    String tempPassword = generateTempPassword();
	    String encodedTempPw = passwordEncoder.encode(tempPassword);

	    usersMapper.updatePassword(userid, encodedTempPw);  // DB 저장은 암호화된 비밀번호로

	    return "임시 비밀번호: " + tempPassword; // 이메일 전송 or 안내
	}

//	임시 비번을 생성하는 메소드
//		영문 대소문자와 숫자를 조합해 10자리 랜덤 문자열 생성
	private String generateTempPassword() {
		int length = 10;
		String chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < length; i++) {
			int idx = (int) (Math.random() * chars.length());
			sb.append(chars.charAt(idx));
		}
		return sb.toString();
	}

//		유저가 직접 비번 변경
	@Override
	public boolean changePassword(String userid, String currentPassword, String newPassword) {
	    UsersVO dbUser = usersMapper.selectUserById(userid);

	    if (dbUser != null && passwordEncoder.matches(currentPassword, dbUser.getPassword())) {
	        String encodedNewPw = passwordEncoder.encode(newPassword);
	        usersMapper.updatePasswordPermanent(userid, encodedNewPw);
	        return true;
	    }
	    return false;
	}

//		신규 회원가입 
	@Override
	public void insertUser(UsersVO usersVO) {
		// 아이디 중복 검사
	    UsersVO existingUser = usersMapper.selectUserById(usersVO.getUserid());
	    if (existingUser != null) {
	        throw new RuntimeException("이미 존재하는 아이디입니다.");
	    }
	    
	    // 🔒 비밀번호 암호화
	    String encryptedPw = passwordEncoder.encode(usersVO.getPassword());
	    usersVO.setPassword(encryptedPw);
		
		usersVO.setJoin_date(LocalDate.now()); // 회원가입시 가입날짜가 오늘이게끔
		usersVO.setRole("USER"); // 회원가입시 User
		usersVO.setPoint(0); // " 포인트0원
		usersVO.setGrade("일반"); // 회원등급

//			insert실행문
		usersMapper.insertUser(usersVO);

	}

//	임시비번 db저장
	@Override
	public void updatePasswordPermanent(String userid, String password) {
		usersMapper.updatePasswordPermanent(userid, password);

	}
// 	최근본상품 조회용, 업데이트용
	


	@Override
	public void updateRecentBooks(String userid, String recentBooks) {
		 usersMapper.updateRecentBooks(userid, recentBooks);
		
	}

	@Override
	public String getRecentBooks(String userid) {
		return usersMapper.getRecentBooks(userid);
	}

	@Override
	public List<BookVO> selectBooksByBnoList(List<Integer> bnoList) {
		if (bnoList == null || bnoList.isEmpty()) {
	        return Collections.emptyList();
	    }
	    return bookMapper.selectBooksByBnoList(bnoList);
	}

	@Override
	public List<BookVO> getRecentBookListByUserId(String userid) {
		 String recentBooksStr = usersMapper.getRecentBooks(userid); // 예: "101,102,103"

	        if (recentBooksStr == null || recentBooksStr.trim().isEmpty()) {
	            return Collections.emptyList();
	        }

	        List<Integer> bnoList = Arrays.stream(recentBooksStr.split(","))
	            .map(String::trim)
	            .filter(s -> !s.isEmpty())
	            .map(Integer::parseInt)
	            .collect(Collectors.toList());

	        return bookService.selectBooksByBnoList(bnoList);
	    }
//	개인정보 수신동의 db전달 및 저장  7/15일 void -> int 수정 강대성
	@Override
	public int updateUserPreferences(UsersVO usersVO) {
		usersMapper.updateUserPreferences(usersVO);
		return usersMapper.updateUserPreferences(usersVO);
	}
//	유저 프로필 사진 업로드
	@Override
	public int updateProfileImage(String userid, String profileImagePath) {
		// TODO Auto-generated method stub
		return usersMapper.updateProfileImage(userid, profileImagePath);
	}
//	유저 회원정보 업데이트 db 반영
	@Override
	public int updateUserInfo(UsersVO user) {
	    return usersMapper.updateUserInfo(user);
	}

	@Override
	public UsersVO getUserById(String userid) {
		return usersMapper.selectUserById(userid);  // ✅ MyBatis 호출
		
	}



	
	
	

	

	

	
	
}
