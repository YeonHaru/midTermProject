/**
 * 
 */
package egovframework.example.giftcard.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.giftcard.service.GiftOrderService;
import egovframework.example.giftcard.service.GiftOrderVO;

/**
 * @author user
 *
 */
@Service
public class GiftOrderServiceImpl implements GiftOrderService {
	@Autowired
	private GiftOrderMapper giftOrderMapper;

	@Override
	public void insertGiftOrder(GiftOrderVO vo) {
		giftOrderMapper.insertGiftOrder(vo);
		
	}
	

}
