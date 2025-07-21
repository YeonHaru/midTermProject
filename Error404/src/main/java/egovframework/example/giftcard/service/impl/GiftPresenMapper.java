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
public interface GiftPresenMapper {
	public List<?> selectGiftPresenList(); 		// 전체조회

}
