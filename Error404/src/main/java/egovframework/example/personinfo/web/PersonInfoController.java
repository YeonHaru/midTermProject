/**
 * 
 */
package egovframework.example.personinfo.web;

import java.util.List;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import egovframework.example.common.Criteria;
import egovframework.example.personinfo.service.PersonInfoService;
import lombok.extern.log4j.Log4j2;

/**
 * @author user
 *
 */
@Log4j2
@Controller
public class PersonInfoController {
//	서비스 가져오기
	@Autowired
	private PersonInfoService personInfoService;
	
//	전체조회
	@GetMapping("/personinfo/personinfo.do")
	public String name(@ModelAttribute Criteria criteria, Model model) {
//		1)등차자동계산 클래스 :
//			-필요정보 : (1) 현재페이지번호, (2) 보일 갯수(pageUnit) : 8
		PaginationInfo paginationInfo = new PaginationInfo();
		paginationInfo.setCurrentPageNo(criteria.getPageIndex());
		paginationInfo.setRecordCountPerPage(criteria.getPageUnit());
//		등차를 자동 계산 : firstRecordIndex 필드에 있음
		criteria.setFirstIndex(paginationInfo.getFirstRecordIndex());
		
//	전체조회 서비스 메소드 실행
	List<?> personinfos = personInfoService.selectPersonList(criteria);
	log.info("테스트 : "+personinfos);	
	model.addAttribute("personinfos", personinfos);
	
//	페이지 번호 그리기 : 플러그인(전체테이블 행 갯수)
	int totCnt = personInfoService.selectPersonListTotCnt(criteria);
	paginationInfo.setTotalRecordCount(totCnt);
	log.info("테스트 : " + totCnt);
//	페이지 모든정보 : paginationInfo
	model.addAttribute("paginationInfo", paginationInfo);	
	return "personinfo/personinfo_all";
	}


}
