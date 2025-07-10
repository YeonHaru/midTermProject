/**
 * 
 */
package egovframework.example.purchase.service;

import java.time.LocalDate;

import egovframework.example.common.Criteria;
import lombok.AllArgsConstructor;
import lombok.EqualsAndHashCode;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 * @author user
 *
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@EqualsAndHashCode(callSuper = false)
public class PurchaseVO extends Criteria {
	private int id;
    private String userid;
    private int amount; // 구매 금액
    private LocalDate purchaseDate;
}
