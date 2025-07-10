package egovframework.example.cart.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.common.Criteria;
@Mapper
public interface CartMapper {
	public List<?> getCartList(Criteria criteria);
}
