/**
 * 
 */
package egovframework.example.qna.service;

import java.util.List;

/**
 * @author user
 *
 */
public interface QnaService {
	int insertQna(QnaVO qnavo);								// 1대1 문의
	List<QnaVO> selectQnaByUserId(String userId);			// 사용자별 문의 조회
	int updateQnaAnswer(QnaVO qnavo);							// 관리자 답변 등록
	QnaVO selectQnaById(Long qnaId);						// ID로 단건 조회
}

