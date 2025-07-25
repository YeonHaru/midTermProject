/**
 * 
 */
package egovframework.example.users.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.common.Criteria;
import egovframework.example.users.service.UsersVO;

/**
 * @author user
 *
 */
@Mapper
public interface UsersMapper {
	public List<?> selectUsersList(Criteria criteria);  // 전체조회
	public UsersVO selectUserById(String userid);		// 마이페이지 접속

//	2개 이상의 아이디가 있을경우엔 지정을 안해주면 오류가 뜬다길래 @Param을 사용했습니다
//	@Param을 사용하면 이 오류를 방지해준다고 합니다.
	
	// 아이디 찾기: 이름 + 이메일 
	public String findUserId(@Param("name") String name, @Param("email") String email);

	// 비밀번호 찾기: 아이디 + 이메일
	public String findPassword(@Param("userid") String userid, @Param("email") String email);
	
	// 임시 비밀번호 업데이트용
	void updatePassword(@Param("userid") String userid, @Param("password") String password);
	
	public void insertUser(UsersVO usersVO);   // 신규 회원가입
	
//	임시 비번 데이터 저장용
	public void updatePasswordPermanent(@Param("userid") String userid, @Param("password") String password);

//	최근 본 상품 조회 : 덕규
	public String getRecentBooks(@Param("userid") String userid);
	
//	최근 본 상품 업데이트 : 덕규
	public void updateRecentBooks(@Param("userid") String userid, @Param("recent_books") String recentBooks);
//	개인정보수신동의 db저장하기  7/15일 void -> int 수정 강대성
	public int updateUserPreferences(UsersVO usersVO);
//	유저프로필 업로드 
	public int updateProfileImage(@Param("userid") String userid, @Param("profileImagePath") String profileImagePath);
	
	public int updateUserInfo(UsersVO user);  // 유저 회원정보 수정 반영
	
	public int updatePasswordWithFlag(UsersVO user);  // 암호화 비번, 임시비번 플레그 업뎃
	
	
}	
