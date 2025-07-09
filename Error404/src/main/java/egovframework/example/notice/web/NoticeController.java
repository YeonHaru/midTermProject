/**
 * 
 */
package egovframework.example.notice.web;

import java.util.List;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.common.Criteria;
import egovframework.example.notice.service.NoticeService;
import egovframework.example.notice.service.NoticeVO;
import lombok.extern.log4j.Log4j2;
/**
 * @author user
 *
 */
@Log4j2
@Controller
public class NoticeController {
//	서비스 가져오기
	@Autowired
	private NoticeService noticeService ;
	
//	전체조회
	@GetMapping("/notice.do")
	public String name(@ModelAttribute Criteria criteria, Model model) {
//		1)등차자동계산 클래스 :
//		-필요정보 : (1) 현재페이지번호, (2) 보일 갯수(pageUnit) : 3
	PaginationInfo paginationInfo = new PaginationInfo();
	paginationInfo.setCurrentPageNo(criteria.getPageIndex());
	paginationInfo.setRecordCountPerPage(criteria.getPageUnit());
//	등차를 자동 계산 : firstRecordIndex 필드에 있음
	criteria.setFirstIndex(paginationInfo.getFirstRecordIndex());
	
//	전체조회 서비스 메소드 실행
	List<?> noticeList = noticeService.selectNoticeList(criteria);
	log.info("테스트 : "+noticeList);	
	model.addAttribute("noticeList", noticeList);
	
//	페이지 번호 그리기 : 플러그인(전체테이블 행 갯수)
	int totCnt = noticeService.selectNoticeListTotCnt(criteria);
	paginationInfo.setTotalRecordCount(totCnt);
	log.info("테스트 : " + totCnt);
//	페이지 모든정보 : paginationInfo
	model.addAttribute("paginationInfo", paginationInfo);
		return "notice/notice_all";
	}
	
    //  공지사항 상세 페이지
    @GetMapping("/notice/detail.do")
    public String detail(@RequestParam("noticeId") int noticeId, Model model) {
//    	조회수 업뎃 
	    noticeService.updateViewCount(noticeId);
    	log.info("detail() 호출됨. noticeId=" + noticeId);
// 		공지 상세 조회(조회수 +1= 총조회수)
    	NoticeVO noticeVO = noticeService.selectNoticeDetail(noticeId);
    	log.info("테스트 :" + noticeVO);

    	    if (noticeVO == null) {
    	        log.warn("존재하지 않는 공지입니다: " + noticeId);
    	        return "redirect:/notice.do";
    	    }
    	    model.addAttribute("noticeVO", noticeVO); 
    	    
    	 // 이전글/다음글 조회
    	    NoticeVO prevNotice = noticeService.selectPrevNotice(noticeId);
    	    NoticeVO nextNotice = noticeService.selectNextNotice(noticeId);
    	    model.addAttribute("prevNotice", prevNotice);
    	    model.addAttribute("nextNotice", nextNotice);
    	    return "notice/notice_detail";
    	}
}

