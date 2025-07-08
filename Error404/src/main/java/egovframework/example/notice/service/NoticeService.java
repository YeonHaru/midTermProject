/**
 * 
 */
package egovframework.example.notice.service;

import java.util.List;

import egovframework.example.common.Criteria;

/**
 * @author user
 *
 */
public interface NoticeService {
	List<?> selectNoticeList(Criteria criteria); 		// 전체조회
	int selectNoticeListTotCnt(Criteria criteria); 		// 총 개수 구하기
    NoticeVO selectNoticeById(int noticeId);			//  단건 조회
    void updateViewCount(int noticeId);				    //  조회수 증가
    NoticeVO selectNoticeDetail(int noticeId);			// 상세페이지
    NoticeVO selectPrevNotice(int noticeId);			// 공지 상세페이지 밑에 이전글
    NoticeVO selectNextNotice(int noticeId);			// 공지 상세페이지 밑에 다음글
}
