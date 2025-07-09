/**
 * 
 */
package egovframework.example.coalition.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j2;

/**
 * @author user
 *
 */
@Log4j2
@Controller
public class CoalitionController {
	@GetMapping("/coalition/coalition.do")
	public String name() {
		
		return "coalition/coalition";
	}
}
