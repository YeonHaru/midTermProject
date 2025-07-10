package egovframework.example.cart.service;

import java.util.List;

import egovframework.example.common.Criteria;

public interface CartService {
	List<?> getCartList(Criteria criteria);
}
