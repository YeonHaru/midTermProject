package egovframework.example.cart.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.cart.service.CartService;
import egovframework.example.common.Criteria;

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

	
	
}
