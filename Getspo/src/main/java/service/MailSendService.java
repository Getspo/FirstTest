package service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailSendService {
	
	private JavaMailSender javaMailSender;
	private int authNumber = 0;
	
	public MailSendService(JavaMailSender javaMailSender) {
		this.javaMailSender = javaMailSender;
	}
	
	public void makeRandomNumber() {
		Random rnd = new Random();
		
		//난수 범위 111111 ~ 999999
		int checkNum = rnd.nextInt(999999 - 111111 + 1) + 111111;
		System.out.println("인증번호: " + checkNum);
		authNumber = checkNum;
	}
	
	public String joinEmail(String email) {
		makeRandomNumber();
		String setFrom = "sscjdthsuss@naver.com"; //발송자의 메일주소
		String toMail = email; //발송할 메일주소
		String title = "회원 가입 인증 이메일 입니다."; //이메일 제목
		
		//이메일 내용
		String content = "인증번호는 <b>" + authNumber + "</b>입니다.";
		
		try {
			MimeMessage mail = javaMailSender.createMimeMessage();
			MimeMessageHelper mailHelper = new MimeMessageHelper(mail, true, "UTF-8");
			
			mailHelper.setFrom(setFrom);
			mailHelper.setTo(toMail);
			mailHelper.setSubject(title);
			mailHelper.setText(content, true);
			
			javaMailSender.send(mail);
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return String.valueOf(authNumber);
		
				
	}
	
	
	
}
