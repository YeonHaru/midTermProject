/**
 * 
 */
package egovframework.example.wishlist.service.impl;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.book.service.BookVO;
import egovframework.example.wishlist.service.WishlistVO;

/**
 * @author user
 *
 */
@Mapper
public interface WishlistMapper {
	public void insertWishlist(WishlistVO wishlist);		//  위시리스트에 도서 추가
	public void deleteWishlist(WishlistVO wishlist);		//  위시리스트에서 도서 삭제
	public List<?> selectWishlistByUser(String userid);		//  해당 사용자의 위시리스트 조회
	public boolean existsWishlist(WishlistVO wishlist);		//  특정 도서가 이미 위시리스트에 존재하는지 확인
}
