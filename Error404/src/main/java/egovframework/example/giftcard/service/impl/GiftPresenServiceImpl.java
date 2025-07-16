/**
 * 
 */
package egovframework.example.giftcard.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.common.Criteria;
import egovframework.example.giftcard.service.GiftPresenService;

/**
 * @author user
 *
 */
@Service
public class GiftPresenServiceImpl implements GiftPresenService {
	@Autowired
	private GiftPresenMapper giftPresenMapper;

//	전체조회
	@Override
	public List<?> selectGiftPresenList() {
		// TODO Auto-generated method stub
		return giftPresenMapper.selectGiftPresenList();
	}
	
	
}
