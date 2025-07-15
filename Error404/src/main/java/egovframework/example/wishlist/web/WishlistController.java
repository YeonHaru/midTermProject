/**
 * 
 */
package egovframework.example.wishlist.web;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import egovframework.example.book.service.BookVO;
import egovframework.example.users.service.UsersVO;
import egovframework.example.wishlist.service.WishlistService;
import egovframework.example.wishlist.service.WishlistVO;

/**
 * @author user
 *
 */
@Controller
@RequestMapping("/wishlist")
public class WishlistController {

    @Autowired
    private WishlistService wishlistService;

    @PostMapping("/add")
    @ResponseBody
    public String addWishlist(@RequestParam int bno, HttpSession session) {
        UsersVO loginUser = (UsersVO) session.getAttribute("loginUser");
        if (loginUser == null) return "notLoggedIn";

        WishlistVO vo = new WishlistVO();
        vo.setBno(bno);
        vo.setUserid(loginUser.getUserid());

        if (!wishlistService.isInWishlist(vo)) {
            wishlistService.addWishlist(vo);
            return "added";
        } else {
            return "exists";
        }
    }

    @PostMapping("/remove")
    @ResponseBody
    public String removeWishlist(@RequestParam int bno, HttpSession session) {
        UsersVO loginUser = (UsersVO) session.getAttribute("loginUser");
        if (loginUser == null) return "notLoggedIn";

        WishlistVO vo = new WishlistVO();
        vo.setBno(bno);
        vo.setUserid(loginUser.getUserid());

        wishlistService.removeWishlist(vo);
        return "removed";
    }

    @GetMapping("/list")
    public String wishlistPage(HttpSession session, Model model) {
        UsersVO loginUser = (UsersVO) session.getAttribute("loginUser");
        if (loginUser == null) return "redirect:/login.do";

        List<?> wishlist = wishlistService.getWishlist(loginUser.getUserid());
        model.addAttribute("wishlist", wishlist);
        return "mypage/wishlist"; // wishlist.jsp 또는 wishlist.html
    }
}