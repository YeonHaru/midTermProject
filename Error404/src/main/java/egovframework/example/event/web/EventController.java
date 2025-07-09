/**
 * 
 */
package egovframework.example.event.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author user
 *
 */
@Controller
public class EventController {
		
		@GetMapping("/eventmain.do")
		public String Event() {
			return "event/main";
		}

}
