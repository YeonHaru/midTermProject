/**
 * 
 */
package egovframework.example.order.web;

import java.util.ArrayList;
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

/**
 * @author user
 *
 */
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
		public String submitOrder(
		    @RequestParam("bnoList") List<Integer> bnoList,
		    @RequestParam("qtyList") List<Integer> qtyList,
		    @RequestParam String recipient,
		    @RequestParam String phone,
		    @RequestParam String address,
		    @RequestParam(required = false) String memo,
		    @RequestParam(required = false) String paymentMethod,
		    HttpSession session,
		    Model model
		) {
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
		        BookVO book = bookService.getBookById(bno);  //도서조회를 합니다잉

		        int itemPrice = book.getDprice() * qty;

		        OrderItemVO item = new OrderItemVO();
		        item.setBno(bno);
		        item.setQty(qty);
		        item.setPrice(itemPrice);
		        
		        item.setBook(book);		// 북브이오 객체를 세팅합니다

		        items.add(item);
		        total += itemPrice;
		    }

		    // 주문 객체 생성
		    OrderVO order = new OrderVO();
		    order.setUserid(loginUser.getUserid());
		    order.setOstatus("결제완료");
		    order.setTotal(total);
		    order.setItems(items);
		    
		 //  배송 관련 필드 추가 설정
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
		public String buyNowForm(HttpServletRequest request, Model model) {
		    String[] dnoArr = request.getParameterValues("dno");
		    String[] qtyArr = request.getParameterValues("qty");

		    if (dnoArr == null || qtyArr == null || dnoArr.length != qtyArr.length) {
		        System.out.println("❌ 파라미터 오류: dno 또는 qty가 null이거나 개수 불일치");
		        return "redirect:/cart.do";
		    }

		    List<BookVO> selectedBooks = new ArrayList<>();
		    List<Integer> quantities = new ArrayList<>();

		    for (int i = 0; i < dnoArr.length; i++) {
		        try {
		            int dno = Integer.parseInt(dnoArr[i]);
		            int qty = Integer.parseInt(qtyArr[i]);

		            BookVO book = bookService.getBookById(dno);
		            if (book != null) {
		                selectedBooks.add(book);
		                quantities.add(qty);
		            }
		        } catch (Exception e) {
		            e.printStackTrace();
		        }
		    }

		    model.addAttribute("selectedBooks", selectedBooks);
		    model.addAttribute("quantities", quantities);
		    return "order/orderForm";
		}

}

