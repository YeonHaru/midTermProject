/**
 * 
 */
package egovframework.example.giftcard.service;

import java.util.List;

/**
 * @author user
 *
 */
public interface GiftBuyService {
	 void insertGiftBuy(GiftBuyVO vo);
	 GiftBuyVO selectById(int gno);
	 List<GiftBuyVO> selectGiftBuyList(); 		// 전체조회
}
