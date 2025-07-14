/**
 * 
 */
package egovframework.example.users.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import egovframework.example.book.service.BookVO;
import egovframework.example.common.Criteria;

/**
 * @author user
 *
 */
public interface UsersService {
	List<?> selectUsersList(Criteria criteria); // 전체조회

	boolean login(UsersVO usersVO); // 로그인

	UsersVO selectUserById(String userid); // 마이페이지 접속

	// 아이디 찾기: 이름 + 이메일
	String findUserId(@Param("name") String name, @Param("email") String email);

	// 비밀번호 찾기: 아이디 + 이메일
	String sendTemporaryPassword(String userid, String email);

	// 유저가 직접 마이페이지에서 비번 변경
	boolean changePassword(String userid, String currentPassword, String newPassword);
	
	void insertUser(UsersVO usersVO);   // 신규 회원가입
	
//	임시비번 데이터 저장용
	void updatePasswordPermanent(@Param("userid") String userid, @Param("password") String password);
	
//	최근 본 상품 조회 : 덕규
	 String getRecentBooks(String usersid);
	
//	최근 본 상품 업데이트 : 덕규
	 void updateRecentBooks(@Param("userid") String userid, @Param("recent_books") String recentBooks);
	 
	 List<BookVO> selectBooksByBnoList(List<Integer> bnoList);
	 
// 최근 본 책 목록(BookVO 리스트) 조회
	 List<BookVO> getRecentBookListByUserId(String userid);
//		개인정보수신동의 db저장하기
	 void updateUserPreferences(UsersVO usersVO);
//	 유저 프로필 사진 업로드
	 int updateProfileImage(@Param("userid") String userid, @Param("profileImagePath") String profileImagePath);
}
