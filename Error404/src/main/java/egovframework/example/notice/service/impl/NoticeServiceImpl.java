/**
 * 
 */
package egovframework.example.notice.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.common.Criteria;
import egovframework.example.notice.service.NoticeService;
import egovframework.example.notice.service.NoticeVO;

/**
 * @author user
 *
 */
@Service
public class NoticeServiceImpl implements NoticeService {
//	Mapper 가져오기
	@Autowired
	private NoticeMapper noticeMapper;

//	전체조회
	@Override
	public List<?> selectNoticeList(Criteria criteria) {
		// TODO Auto-generated method stub
		return noticeMapper.selectNoticeList(criteria);
	}

//	총개수구하기
	@Override
	public int selectNoticeListTotCnt(Criteria criteria) {
		// TODO Auto-generated method stub
		return noticeMapper.selectNoticeListTotCnt(criteria);
	}

//	단건 조회
	@Override
	public NoticeVO selectNoticeById(int noticeId) {
		// TODO Auto-generated method stub
		return noticeMapper.selectNoticeById(noticeId);
	}

//	조회수 증가
	@Override
	public void updateViewCount(int noticeId) {
		// TODO Auto-generated method stub
		noticeMapper.updateViewCount(noticeId);
	}

//	상세페이지
	@Override
	public NoticeVO selectNoticeDetail(int noticeId) {
		// TODO Auto-generated method stub
		 return noticeMapper.selectNoticeDetail(noticeId);
	}

	@Override
	public NoticeVO selectPrevNotice(int noticeId) {
		// TODO Auto-generated method stub
		return noticeMapper.selectPrevNotice(noticeId);
	}

	@Override
	public NoticeVO selectNextNotice(int noticeId) {
		// TODO Auto-generated method stub
		return noticeMapper.selectNextNotice(noticeId);
	}
	
	
	
}
