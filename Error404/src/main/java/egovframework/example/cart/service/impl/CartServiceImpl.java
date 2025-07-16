package egovframework.example.cart.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.cart.service.CartService;
import egovframework.example.cart.service.CartVO;
import egovframework.example.common.Criteria;
import lombok.extern.log4j.Log4j2;

@Log4j2
@Service
public class CartServiceImpl implements CartService {

	@Autowired
	private CartMapper cartMapper;
//	전체조회
	@Override
	public List<?> getCartList(Criteria criteria) {
		// TODO Auto-generated method stub
		return cartMapper.getCartList(criteria);	
	}
	@Override
	public void updateQuantity(int cno, int quantity) {
		// TODO Auto-generated method stub
		cartMapper.updateQuantity(cno, quantity);
	}
	
	@Override
	public void deleteCartItems(List<Integer> cnos) {
	    cartMapper.deleteCartItems(cnos);
	}
	@Override
	public void addToCart(String userId, int bno, int quantity) {
		log.info("🧾 addToCart 호출됨 - userId: {}, bno: {}, quantity: {}", userId, bno, quantity);
	    
	    CartVO existing = cartMapper.findCartItem(userId, bno);
	    if (existing != null) {
	        int newQty = existing.getQuantity() + quantity;
	        log.info("✅ 기존 항목 있음. cno={}, 기존수량={}, 새로운 수량={}", existing.getCno(), existing.getQuantity(), newQty);
	        cartMapper.updateCartQuantity(existing.getCno(), newQty);
	    } else {
	        log.info("🆕 새 장바구니 항목 추가");
	        CartVO newItem = new CartVO();
	        newItem.setUserId(userId);
	        newItem.setBno(bno);
	        newItem.setQuantity(quantity);
	        log.info("🧾 새로운 장바구니 항목: {}", newItem);
	        cartMapper.insertCart(newItem);
	    }
	}
}
