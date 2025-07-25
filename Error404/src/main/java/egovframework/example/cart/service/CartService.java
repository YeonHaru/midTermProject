package egovframework.example.cart.service;

import java.util.List;

import egovframework.example.common.Criteria;

public interface CartService {
	List<?> getCartList(Criteria criteria);					// 전체조회
	void updateQuantity(int cno, int quantity); // 수량 변경 (종일)

	void deleteCartItems(List<Integer> cnos);
	void addToCart(String userId, int bno, int quantity);  // 장바구니 추가 : 덕규
}
