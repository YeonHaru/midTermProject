/**
 * 
 */
package egovframework.example.guestorder.web;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;

import egovframework.example.book.service.BookService;
import egovframework.example.book.service.BookVO;
import egovframework.example.guestorder.service.GuestOrderService;
import egovframework.example.guestorder.service.GuestOrderVO;
import lombok.extern.log4j.Log4j2;

/**
 * @author user
 *
 */
@Log4j2
@Controller
public class GuestOrderController {
	@Autowired
	private GuestOrderService guestOrderService;
	
	@Autowired
	private BookService bookService;

//	비회원 조회기능
	@PostMapping("/guestOrder/check.do")
	public String checkGuestOrder(GuestOrderVO vo, Model model, HttpServletRequest request) {
	    GuestOrderVO result = guestOrderService.selectGuestOrder(vo);

	    if (result == null) {
	        request.setAttribute("guestMsg", "일치하는 주문정보가 없습니다.");
	        return "auth/login"; // 실패 시 로그인 페이지로
	    }

	    model.addAttribute("order", result);
	    return "guestorder/guestOrderResult"; // 성공 시 주문페이지로 이동
	}
	
	@PostMapping("/guestOrder/submit.do")
	public String submitGuestOrder(HttpServletRequest request, Model model) {
	    // 1. 파라미터 수집
	    String[] dnoArr = request.getParameterValues("dnoList");
	    String[] qtyArr = request.getParameterValues("qtyList");
	    String recipient = request.getParameter("recipient");
	    String phone = request.getParameter("phone");
	    String address = request.getParameter("address");
	    String memo = request.getParameter("memo");
	    String paymentMethod = request.getParameter("paymentMethod");

	    log.info("📦 비회원 주문 - 수령인: {}, 전화: {}, 주소: {}", recipient, phone, address);

	    // 2. 도서 정보 조회 및 총액 계산
	    List<BookVO> selectedBooks = new ArrayList<>();
	    List<Integer> quantities = new ArrayList<>();
	    int totalPrice = 0;

	    for (int i = 0; i < dnoArr.length; i++) {
	        int dno = Integer.parseInt(dnoArr[i]);
	        int qty = Integer.parseInt(qtyArr[i]);
	        BookVO book = bookService.getBookById(dno);
	        if (book != null) {
	            selectedBooks.add(book);
	            quantities.add(qty);
	            totalPrice += book.getDprice() * qty;
	        }
	    }

	 // 3. GuestOrderVO 생성
	    GuestOrderVO guestOrder = new GuestOrderVO();
	    guestOrder.setOrderPassword("guest" + (int)(Math.random() * 10000)); // 임시 비번
	    guestOrder.setCustomerName(recipient);
	    guestOrder.setProductName(
	        selectedBooks.size() == 1 ? selectedBooks.get(0).getTitle() : selectedBooks.get(0).getTitle() + " 외"
	    );
	    guestOrder.setAddress(address);
	    guestOrder.setPhone(phone);
	    guestOrder.setTotalPrice(totalPrice);
	    guestOrder.setOstatus("결제완료");
	    guestOrder.setPaymentMethod("비회원카드");
	    guestOrder.setRecipient(recipient);
	    guestOrder.setMemo(memo); // 혹시 null일 수도 있지만 넣어두는 게 안전
	    
	    

	 // 4. DB 저장 전 임시 orderId 설정 (NOT NULL 방지용)
	    guestOrder.setOrderId("TEMP_G" + System.currentTimeMillis()); 

	    // 5. insert → 이때 orderId가 null이면 오류
	    guestOrderService.insertGuestOrder(guestOrder);

	    // 6. 진짜 orderId 설정 (G + gno)
	    String finalOrderId = "G" + guestOrder.getGno();
	    guestOrder.setOrderId(finalOrderId);
	    
	    guestOrderService.updateOrderId(guestOrder.getGno(), finalOrderId);


	    log.info("✅ 최종 orderId: {}", guestOrder.getOrderId());

	    // 6. 모델 전달
	    model.addAttribute("order", guestOrder);
	    model.addAttribute("guestPassword", guestOrder.getOrderPassword());
	    model.addAttribute("totalAmount", guestOrder.getTotalPrice());

	    // 7. JSP 이동
	    return "order/submit";

	}
}