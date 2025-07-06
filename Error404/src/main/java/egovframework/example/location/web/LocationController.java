/**
 * 
 */
package egovframework.example.location.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

/**
 * @author user
 *
 */
@Controller
public class LocationController {
	
		@GetMapping("/mapview.do")
		public String MapView() {
			return "location/mapview";
		}
}
