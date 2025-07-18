/**
 * 
 */
package egovframework.example.giftcard.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

/**
 * @author user
 *
 */
@Mapper
public interface GiftBuyMapper {
	public List<?> selectGiftBuyList(); 		// 전체조회
}
