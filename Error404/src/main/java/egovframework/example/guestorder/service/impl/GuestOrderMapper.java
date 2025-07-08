/**
 * 
 */
package egovframework.example.guestorder.service.impl;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.example.guestorder.service.GuestOrderVO;

/**
 * @author user
 *
 */
@Mapper
public interface GuestOrderMapper {
	public GuestOrderVO selectGuestOrder (GuestOrderVO guestOrderVO ); // 주문번호 + 비밀번호 조회
}
