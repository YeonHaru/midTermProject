/**
 * 
 */
package egovframework.example.guestorder.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.guestorder.service.GuestOrderService;
import egovframework.example.guestorder.service.GuestOrderVO;
import lombok.extern.log4j.Log4j2;

/**
 * @author user
 *
 */
@Log4j2
@Service
public class GuestOrderServiceImpl implements GuestOrderService {

	@Autowired
	private GuestOrderMapper guestOrderMapper;

//	주문번호 + 비밀번호 조회
    @Override
    public GuestOrderVO selectGuestOrder(GuestOrderVO guestOrderVO) {
        log.info("🔍 selectGuestOrder() 호출 - param: {}", guestOrderVO);
        GuestOrderVO result = guestOrderMapper.selectGuestOrder(guestOrderVO);
        log.info("✅ 조회 결과: {}", result);
        return result;
    }

    @Override
    public void insertGuestOrder(GuestOrderVO guestOrderVO) {
        log.info("📝 insertGuestOrder() 호출 - param: {}", guestOrderVO);
        guestOrderMapper.insertGuestOrder(guestOrderVO);
        log.info("✅ 비회원 주문 등록 완료");
    }

    @Override
    public void updateGuestOrderStatus(GuestOrderVO guestOrderVO) {
        log.info("🔄 updateGuestOrderStatus() 호출 - param: {}", guestOrderVO);
        guestOrderMapper.updateGuestOrderStatus(guestOrderVO);
        log.info("✅ 주문 상태 업데이트 완료");
    }

    @Override
    public List<GuestOrderVO> selectGuestOrdersByPhone(String phone) {
        log.info("📱 selectGuestOrdersByPhone() 호출 - phone: {}", phone);
        List<GuestOrderVO> list = guestOrderMapper.selectGuestOrdersByPhone(phone);
        log.info("✅ 조회된 주문 수: {}", list.size());
        return list;
    }

	@Override
	public void updateOrderId(int gno, String orderId) {
		guestOrderMapper.updateOrderId(gno, orderId);
	} 
}
