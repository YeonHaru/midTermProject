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
    void addWishlist(WishlistVO wishlist);
    void removeWishlist(WishlistVO wishlist);
    List<?> getWishlist(String userid);
    boolean isInWishlist(WishlistVO wishlist);
}
