package egovframework.example.cart.service.impl;

import java.util.List;

import egovframework.example.common.Criteria;

public interface CartMapper {
	public List<?> getCartList(Criteria criteria);
}
