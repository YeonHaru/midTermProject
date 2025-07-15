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

    @Override
    public void addWishlist(WishlistVO wishlist) {
        wishlistMapper.insertWishlist(wishlist);
    }

    @Override
    public void removeWishlist(WishlistVO wishlist) {
        wishlistMapper.deleteWishlist(wishlist);
    }

    @Override
    public List<?> getWishlist(String userid) {
        return wishlistMapper.selectWishlistByUser(userid);
    }

    @Override
    public boolean isInWishlist(WishlistVO wishlist) {
        return wishlistMapper.existsWishlist(wishlist);
    }
}