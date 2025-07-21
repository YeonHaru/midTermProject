/**
 * 
 */
package egovframework.example.order.web;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import egovframework.example.book.service.BookService;
import egovframework.example.book.service.BookVO;
import egovframework.example.order.service.OrderItemVO;
import egovframework.example.order.service.OrderService;
import egovframework.example.order.service.OrderVO;
import egovframework.example.users.service.UsersService;
import egovframework.example.users.service.UsersVO;
import egovframework.example.wishlist.service.WishlistService;
import lombok.extern.log4j.Log4j2;

/**
 * @author user
 *
 */
@Log4j2
@Controller
public class OrderController {

	@Autowired
	private BookService bookService;

	@Autowired
	private UsersService userService;

	@Autowired
	private WishlistService wishlistService;

	@Autowired
	private OrderService orderService;

	@PostMapping("/order/submit.do")
	public String submitOrder(@RequestParam("dnoList") List<Integer> bnoList,
			@RequestParam("qtyList") List<Integer> qtyList, @RequestParam String recipient, @RequestParam String phone,
			@RequestParam String address, @RequestParam(required = false) String memo,
			@RequestParam(required = false) String paymentMethod, HttpSession session, Model model) {
		UsersVO loginUser = (UsersVO) session.getAttribute("loginUser");

		if (loginUser == null) {
			return "redirect:/login.do";
		}

		// 총액 계산 및 주문 아이템 생성
		List<OrderItemVO> items = new ArrayList<>();
		int total = 0;

		for (int i = 0; i < bnoList.size(); i++) {
			int bno = bnoList.get(i);
			int qty = qtyList.get(i);
			BookVO book = bookService.getBookById(bno); // 도서조회를 합니다잉

			int itemPrice = book.getDprice() * qty;

			OrderItemVO item = new OrderItemVO();
			item.setBno(bno);
			item.setQty(qty);
			item.setPrice(itemPrice);

			item.setBook(book); // 북브이오 객체를 세팅합니다

			items.add(item);
			total += itemPrice;
		}

		// 주문 객체 생성
		OrderVO order = new OrderVO();
		order.setUserid(loginUser.getUserid());
		order.setOstatus("결제완료");
		order.setTotal(total);
		order.setItems(items);

		// 배송 관련 필드 추가 설정
		order.setRecipient(recipient);
		order.setPhone(phone);
		order.setAddress(address);
		order.setMemo(memo);
		order.setPaymentMethod(paymentMethod);

		// 주문 저장
		int ono = orderService.insertOrder(order);

		// 주문 객체에 다시 주문번호 설정
		order.setOno(ono);

		model.addAttribute("order", order);
		return "order/submit";
	}

	@PostMapping("/order/buyNowForm.do")
	public String buyNowForm(HttpServletRequest request, HttpSession session, Model model) {
		String[] dnoArr = request.getParameterValues("dnoList");
		String[] qtyArr = request.getParameterValues("qtyList");
		String totalStr = request.getParameter("totalPrice");

		log.info("전달된 dno: {}", Arrays.toString(dnoArr));
		log.info("전달된 qty: {}", Arrays.toString(qtyArr));
		log.info("전달된 totalPrice: {}", totalStr);

		// dnoArr 또는 qtyArr가 null이거나 길이가 다르면 장바구니 페이지로 리다이렉트
		if (dnoArr == null || qtyArr == null || dnoArr.length != qtyArr.length) {
			log.warn("❌ 파라미터 오류: dno 또는 qty가 null이거나 개수 불일치");
			return "redirect:/cart.do";
		}

		List<BookVO> selectedBooks = new ArrayList<>();
		List<Integer> quantities = new ArrayList<>();

		// 총 결제 금액을 저장할 변수 초기화
		int totalPrice = 0;

		for (int i = 0; i < dnoArr.length; i++) {
			try {
				// ★ 빈 문자열 체크 추가 (null, 빈값, 공백 모두 체크)
				if (dnoArr[i] == null || dnoArr[i].trim().isEmpty() || qtyArr[i] == null
						|| qtyArr[i].trim().isEmpty()) {
					log.warn("빈 문자열 발견, 해당 인덱스 무시. dnoArr: '{}', qtyArr: '{}'", dnoArr[i], qtyArr[i]);
					continue; // 빈 값이면 파싱하지 않고 다음 루프로 넘어감
				}

				// dno와 qty 문자열을 정수로 변환
				int dno = Integer.parseInt(dnoArr[i]);
				int qty = Integer.parseInt(qtyArr[i]);

				// dno로 도서 정보 조회
				BookVO book = bookService.getBookById(dno);
				if (book != null) {
					selectedBooks.add(book);
					quantities.add(qty);
					totalPrice += book.getDprice() * qty; // 총 가격 누적 계산
					log.info("✅ 책 추가: {} / 수량: {}", book.getTitle(), qty);
				} else {
					log.warn("⚠️ BookVO가 null입니다. dno = {}", dno);
				}
			} catch (NumberFormatException e) {
				// 숫자 변환 실패 시 에러 로그 출력
				log.error("숫자 파싱 오류", e);
			}
		}
		
		// ✅ 로그인 유저 정보 JSP에 전달
	    UsersVO loginUser = (UsersVO) session.getAttribute("loginUser");
	    if (loginUser != null) {
	        model.addAttribute("userInfo", loginUser);
	    }
		

		// JSP에서 사용할 모델에 데이터 세팅
		model.addAttribute("selectedBooks", selectedBooks);
		model.addAttribute("quantities", quantities);
		model.addAttribute("totalPrice", totalPrice);
		
//		주문서에 책 수량이 잘못찍히는걸 수정 7/19일 강대성
		int totalQuantity = quantities.stream().mapToInt(Integer::intValue).sum();
		model.addAttribute("totalQuantity", totalQuantity);

		// 주문서 작성 폼 페이지로 이동
		return "order/orderForm";
	}

}
