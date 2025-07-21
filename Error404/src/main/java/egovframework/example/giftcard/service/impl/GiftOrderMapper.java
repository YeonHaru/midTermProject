package egovframework.example.giftcard.service.impl;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;
import egovframework.example.giftcard.service.GiftOrderVO;

@Mapper
public interface GiftOrderMapper {
    void insertGiftOrder(GiftOrderVO vo);
    List<GiftOrderVO> selectGiftOrderList(); 
}


