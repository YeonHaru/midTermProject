/**
 * 
 */
package egovframework.example.guestorder.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.guestorder.service.GuestOrderService;
import egovframework.example.guestorder.service.GuestOrderVO;

/**
 * @author user
 *
 */
@Service
public class GuestOrderServiceImpl implements GuestOrderService {

	@Autowired
	private GuestOrderMapper guestOrderMapper;

//	주문번호 + 비밀번호 조회
	@Override
	public GuestOrderVO selectGuestOrder(GuestOrderVO guestOrderVO) {
		// TODO Auto-generated method stub
		return guestOrderMapper.selectGuestOrder(guestOrderVO);
	}
}
