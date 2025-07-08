/**
 * 
 */
package egovframework.example.notice.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.common.Criteria;
import egovframework.example.notice.service.NoticeVO;

/**
 * @author user
 *
 */
@Mapper
public interface NoticeMapper {
	public List<?> selectNoticeList(Criteria criteria); 		// 전체조회
	public int selectNoticeListTotCnt(Criteria criteria); 		// 총 개수 구하기
	public NoticeVO selectNoticeById(int noticeId);				//  단건 조회
	public void updateViewCount(int noticeId);				    //  조회수 증가
	public NoticeVO selectNoticeDetail(int noticeId);			// 상세페이지
	public NoticeVO selectPrevNotice(int noticeId);				// 공지 상세페이지 밑에 이전글
	public NoticeVO selectNextNotice(int noticeId);				// 공지 상세페이지 밑에 다음글
}
