/**
 * 
 */
package egovframework.example.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

/**
 * @author user
 *	이 클래스는 비밀번호찾기에 사용되는 인증이메일을 날리게 도와주는 클래스입니다
 *  삭제하시면 안됩니다.
 */
@Configuration
public class MailConfig {
	
	@Bean
    public JavaMailSender javaMailSender() {
        JavaMailSenderImpl mailSender = new JavaMailSenderImpl();

        mailSender.setHost("smtp.naver.com");
        mailSender.setPort(587);

        mailSender.setUsername("your_naver_id@naver.com");
        mailSender.setPassword("your_password_or_app_password");

        Properties props = mailSender.getJavaMailProperties();
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        return mailSender;
    }
}
