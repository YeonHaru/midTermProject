package egovframework.example.cart.service.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.cart.service.CartVO;
import egovframework.example.common.Criteria;
@Mapper
public interface CartMapper {
	public List<?> getCartList(Criteria criteria);			// 전체 조회
	void updateQuantity(@Param("cno") int cno, @Param("quantity") int quantity); // 수량 변경
	
	void deleteCartItems(List<Integer> cnos); //삭제
	
	void addToCart(String userId, int bno, int quantity);  // 장바구니 추가 : 덕규
	
	CartVO findCartItem(@Param("userId") String userId, @Param("bno") int bno);

    void insertCart(CartVO cartVO);
    
    void updateCartQuantity(@Param("cno") int cno, @Param("quantity") int quantity);  // 수량 합산용
}
