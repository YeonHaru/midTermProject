/**
 * 
 */
package egovframework.example.giftcard.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.giftcard.service.GiftBuyService;
import egovframework.example.giftcard.service.GiftBuyVO;

/**
 * @author user
 *
 */
@Service
public class GiftBuyServiceImpl implements GiftBuyService {
	@Autowired
	private GiftBuyMapper giftBuyMapper;

	@Override
	public void insertGiftBuy(GiftBuyVO vo) {
		 giftBuyMapper.insertGiftBuy(vo);
		
	}

	@Override
	public GiftBuyVO selectById(int gno) {
		// TODO Auto-generated method stub
		return giftBuyMapper.selectById(gno);
	}

	@Override
	public List<GiftBuyVO> selectGiftBuyList() {
		// TODO Auto-generated method stub
		return giftBuyMapper.selectGiftBuyList();
	}


	
	
}
