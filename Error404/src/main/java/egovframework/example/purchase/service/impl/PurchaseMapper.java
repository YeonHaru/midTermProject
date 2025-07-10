/**
 * 
 */
package egovframework.example.purchase.service.impl;

import java.time.LocalDate;

import org.apache.ibatis.annotations.Param;
import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

/**
 * @author user
 *
 */
@Mapper
public interface PurchaseMapper {
	int sumByUserIdSince(@Param("userid") String userid, @Param("startDate") LocalDate startDate);
}
