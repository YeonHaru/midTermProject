/**
 * 
 */
package egovframework.example.book.service;

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
public class BookImgVO extends Criteria{
	private String uuid; 
	private int bno; 
	private String fileName; 
	private byte[] fileData; 
	private String downloadUrl; 
	
	
}
