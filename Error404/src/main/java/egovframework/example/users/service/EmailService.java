/**
 * 
 */
package egovframework.example.users.service;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

/**
 * @author user
 * 
 * 임시 비밀번호를 이메일로 전송하는 메서드
 * 
 * @param toEmail      수신자 이메일 주소
 * @param tempPassword 임시 비밀번호
 * @throws MessagingException
 */
 
@Service
public class EmailService {
	@Autowired
	private JavaMailSender mailSender;
		
	public void sendTempPassword(String toEmail, String tempPassword) throws MessagingException {
        MimeMessage message = mailSender.createMimeMessage();

        // true = multipart 메시지 처리, UTF-8 인코딩 설정
        MimeMessageHelper helper = new MimeMessageHelper(message, true, "UTF-8");

        helper.setFrom("rkdeotjdak@naver.com");  // 발신자 이메일 꼭 명시
        helper.setTo(toEmail);
        helper.setSubject("임시 비밀번호 안내");
        String content = "<h3>안녕하세요.</h3>"
                + "<p>요청하신 임시 비밀번호를 안내드립니다.</p>"
                + "<p><b>" + tempPassword + "</b></p>"
                + "<p>로그인 후 반드시 비밀번호를 변경해 주세요.</p>";
        helper.setText(content, true); // true = HTML 형식 메일

        mailSender.send(message);
    }
	

}
