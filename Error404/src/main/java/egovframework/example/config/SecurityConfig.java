/**
 * 
 */
package egovframework.example.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

/**
 * @author user
 *	비밀번호 해쉬를 위한 클래스입니다.
 */
@Configuration
public class SecurityConfig {
	
	@Bean
    public BCryptPasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
