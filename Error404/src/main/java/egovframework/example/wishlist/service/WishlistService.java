/**
 * 
 */
package egovframework.example.wishlist.service;

import java.util.List;

import org.springframework.stereotype.Service;

import egovframework.example.book.service.BookVO;

/**
 * @author user
 *
 */
@Service
public interface WishlistService {
    void addWishlist(WishlistVO wishlist);		//  위시리스트에 도서 추가
    void removeWishlist(WishlistVO wishlist);	//  위시리스트에서 도서 삭제
    List<?> getWishlist(String userid);			//  해당 사용자의 위시리스트 조회
    boolean isInWishlist(WishlistVO wishlist);	//  특정 도서가 이미 위시리스트에 존재하는지 확인
}
