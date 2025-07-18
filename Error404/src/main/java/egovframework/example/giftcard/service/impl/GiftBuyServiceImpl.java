/**
 * 
 */
package egovframework.example.giftcard.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.giftcard.service.GiftBuyService;

/**
 * @author user
 *
 */
@Service
public class GiftBuyServiceImpl implements GiftBuyService {
	@Autowired
	private GiftBuyMapper giftBuyMapper;

//	전체조회
	@Override
	public List<?> selectGiftBuyList() {
		// TODO Auto-generated method stub
		return giftBuyMapper.selectGiftBuyList();
	}
	
	
}
