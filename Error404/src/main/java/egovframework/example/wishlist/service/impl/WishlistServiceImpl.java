/**
 * 
 */
package egovframework.example.wishlist.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.book.service.BookVO;
import egovframework.example.wishlist.service.WishlistService;
import egovframework.example.wishlist.service.WishlistVO;

/**
 * @author user
 *
 */
@Service
public class WishlistServiceImpl implements WishlistService {

    @Autowired
    private WishlistMapper wishlistMapper;

//  위시리스트에 도서 추가
    @Override
    public void addWishlist(WishlistVO wishlist) {
        wishlistMapper.insertWishlist(wishlist);
    }

//  위시리스트에서 도서 삭제
    @Override
    public void removeWishlist(WishlistVO wishlist) {
        wishlistMapper.deleteWishlist(wishlist);
    }

//  해당 사용자의 위시리스트 조회
    @Override
    public List<?> getWishlist(String userid) {
        return wishlistMapper.selectWishlistByUser(userid);
    }

//  특정 도서가 이미 위시리스트에 존재하는지 확인
    @Override
    public boolean isInWishlist(WishlistVO wishlist) {
        return wishlistMapper.existsWishlist(wishlist);
    }
}