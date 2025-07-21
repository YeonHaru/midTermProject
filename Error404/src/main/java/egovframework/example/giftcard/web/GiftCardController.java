/**
 * 
 */
package egovframework.example.giftcard.web;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.giftcard.service.GiftBuyService;
import egovframework.example.giftcard.service.GiftBuyVO;
import egovframework.example.giftcard.service.GiftOrderService;
import egovframework.example.giftcard.service.GiftOrderVO;
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
	private GiftBuyService giftBuyService;	
	
	@Autowired
	private GiftOrderService giftOrderService;
	

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
	List<?> giftBuys = giftBuyService.selectGiftBuyList();
	log.info("테스트 : " + giftBuys);
	model.addAttribute("giftBuys", giftBuys);

		return "giftcard/gift_buy";
	}
	
	@PostMapping("/gift/buySubmit.do")
	public String submitGiftBuy(
	    @RequestParam("photo") String photo,
	    @RequestParam("name") String name,
	    @RequestParam("money") int money,
	    @RequestParam(value = "popupMode", required = false) String popupMode, // ✅ 추가
	    Model model
	) {
	    // ✅ 팝업이 아닌 경우 접근 차단
		if (!"true".equals(popupMode)) {
		    return "redirect:/"; // 팝업 외 접근 방지
		}

		GiftOrderVO vo = new GiftOrderVO();
		vo.setPhoto(photo);
		vo.setName(name);
		vo.setMoney(money);

		giftOrderService.insertGiftOrder(vo); // ✅ 구매 이력 테이블에 저장

		model.addAttribute("gift", vo);
		return "giftcard/complete"; // 팝업 내 완료 페이지
	}

	
	
	@GetMapping("/giftBuy/popup.do")
	public String openGiftPopup(@RequestParam("gno") int gno, Model model) {
	    GiftBuyVO gift = giftBuyService.selectById(gno);
	    model.addAttribute("gift", gift);
	    return "giftcard/gift_buy_popup"; // popup JSP 경로
	}
}
