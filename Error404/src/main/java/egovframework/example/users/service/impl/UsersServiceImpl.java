/**
 * 
 */
package egovframework.example.users.service.impl;

import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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

		if (dbUser != null && dbUser.getPassword().equals(usersVO.getPassword())) {
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
		// 1. 사용자 정보 확인
		String found = usersMapper.findPassword(userid, email);
		if (found == null) {
			return "입력한 정보와 일치하는 계정이 없습니다.";
		}
		// 2. 임시 비밀번호 생성 (예: 10자리 랜덤 문자열)
		String tempPassword = generateTempPassword();

		// 3. DB에 임시 비밀번호 업데이트
		usersMapper.updatePassword(userid, tempPassword);

//		// 4. 이메일로 임시 비밀번호 전송
//		try {
//			emailService.sendTempPassword(email, tempPassword);
//		} catch (Exception e) {
//			e.printStackTrace();
//			return "메일 전송에 실패했습니다.";
//		}
//		// 5. 성공 메시지
		return "임시 비밀번호: " + tempPassword;

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

		if (dbUser != null && dbUser.getPassword().equals(currentPassword)) {
			// 비밀번호 변경 시, TEMP_PW_YN = 'N' 으로 업데이트
			usersMapper.updatePasswordPermanent(userid, newPassword); // 새 메소드
			return true;
		}
		return false;
	}

//		신규 회원가입 
	@Override
	public void insertUser(UsersVO usersVO) {
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

	

//	회원등급 정보 임플입니다 7월10일
	@Override
	public void updateUserGrade(String userid) {
		LocalDate threeMonthsAgo = LocalDate.now().minusMonths(3);
        int total = purchaseMapper.sumByUserIdSince(userid, threeMonthsAgo);

        String newGrade;
        if (total >= 300000) {
            newGrade = "PLATINUM";
        } else if (total >= 200000) {
            newGrade = "GOLD";
        } else {
            newGrade = "GENERAL";
        }

        usersMapper.updateGrade(userid, newGrade);
	}
	
}
