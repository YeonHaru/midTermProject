/**
 * 
 */
package egovframework.example.qna.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.qna.service.QnaService;
import egovframework.example.qna.service.QnaVO;

/**
 * @author user
 *
 */
@Service
public class QnaServiceImpl implements QnaService {
	@Autowired
	private QnaMapper qnaMapper;

//	1대1 문의창 불러오기
	@Override
	public int insertQna(QnaVO qnavo) {
		return qnaMapper.insertQna(qnavo);
	}
//	사용자별 1대1 연동
	@Override
	public List<QnaVO> selectQnaByUserId(String userId) {
		return qnaMapper.selectQnaByUserId(userId);
	}
//	1대1 질문게시판에 답변권한
	@Override
	public int updateQnaAnswer(QnaVO qnavo) {
		return qnaMapper.updateQnaAnswer(qnavo);
	}
//	관리자가 답변을 관리자가 달 수 있게 하는 권한추가
	@Override
	public QnaVO selectQnaById(Long qnaId) {
		return qnaMapper.selectQnaById(qnaId);
	}
//	관리자전용 답변이 없는 qna조회
	@Override
	public List<QnaVO> selectUnansweredQna() {
		// TODO Auto-generated method stub
		return qnaMapper.selectUnansweredQna();
	}
	
}
