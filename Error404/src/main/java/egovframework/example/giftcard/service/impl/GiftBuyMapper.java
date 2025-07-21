/**
 * 
 */
package egovframework.example.giftcard.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.giftcard.service.GiftBuyVO;

/**
 * @author user
 *
 */
@Mapper
public interface GiftBuyMapper {
	public void insertGiftBuy(GiftBuyVO vo);
	public GiftBuyVO selectById(int gno);
	public List<GiftBuyVO> selectGiftBuyList(); 		// 전체조회
}
