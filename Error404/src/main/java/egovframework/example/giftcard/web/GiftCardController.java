/**
 * 
 */
package egovframework.example.giftcard.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import egovframework.example.giftcard.service.GiftBuyService;
import egovframework.example.giftcard.service.GiftPresenService;
import lombok.extern.log4j.Log4j2;

/**
 * @author user
 *
 */
@Log4j2
@Controller
public class GiftCardController {
//	서비스 가져오기
	@Autowired
	private GiftPresenService giftpresenService;
	
//	서비스 가져오기
	@Autowired
	private GiftBuyService giftbuyService;	
	

//	전체조회
	@GetMapping("/giftcard.do")
	public String name() {
		return "giftcard/gift_main";
	}

	
	@GetMapping("/giftcard/giftpresen.do")
	public String presen(Model model) {

//	전체조회 서비스 메소드 실행
		List<?> giftPresens = giftpresenService.selectGiftPresenList();
		log.info("테스트 : " + giftPresens);
		model.addAttribute("giftPresens", giftPresens);

		return "giftcard/gift_presen";
	}
	
	
	@GetMapping("/giftcard/giftbuy.do")
	public String buy(Model model) {

//	전체조회 서비스 메소드 실행
	List<?> giftBuys = giftbuyService.selectGiftBuyList();
	log.info("테스트 : " + giftBuys);
	model.addAttribute("giftBuys", giftBuys);

		return "giftcard/gift_buy";
	}
}
