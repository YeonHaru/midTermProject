/**
 * 
 */
package egovframework.example.qna.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.qna.service.QnaVO;

/**
 * @author user
 *
 */
@Mapper
public interface QnaMapper {
	public int insertQna(QnaVO qnavo); // 1대1 문의

	public List<QnaVO> selectQnaByUserId(@Param("userId") String userId); // 사용자별 문의 조회

	public int updateQnaAnswer(QnaVO qnavo); // 관리자 답변 등록

	public QnaVO selectQnaById(Long qnaId); // ID로 단건 조회
	
	
	public List<QnaVO> selectUnansweredQna();  // 관리자 전용 답변이 없는 리스트 조회
	

}
