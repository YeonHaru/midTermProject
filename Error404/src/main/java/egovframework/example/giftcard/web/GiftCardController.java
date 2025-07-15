/**
 * 
 */
package egovframework.example.giftcard.web;

import java.util.List;

import org.egovframe.rte.ptl.mvc.tags.ui.pagination.PaginationInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import egovframework.example.common.Criteria;
import egovframework.example.dept.web.DeptController;
import lombok.extern.log4j.Log4j2;

/**
 * @author user
 *
 */
@Log4j2
@Controller
public class GiftCardController {

//	전체조회
	@GetMapping("/giftcard.do")
	public String name() {
    return "giftcard/gift_main";
	}
	
	@GetMapping("/giftcard/giftpresen.do")
	public String presen() {
    return "giftcard/gift_presen";
	}
}
