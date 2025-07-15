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
	public void insertWishlist(WishlistVO wishlist);
	public void deleteWishlist(WishlistVO wishlist);
	public List<?> selectWishlistByUser(String userid);
	public boolean existsWishlist(WishlistVO wishlist);
}
