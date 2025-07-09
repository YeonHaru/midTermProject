/**
 * 
 */
package egovframework.example.writerinfo.service;

import egovframework.example.common.Criteria;
import egovframework.example.dept.service.DeptVO;
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
public class WriterInfoVO extends Criteria{
	private int wno ;				      		// 기본키
	private String writer ;						// 작가
	private String work ;						// 작품
	private String prize;
	private String details;
}
