package com.proj.command.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;
import java.util.Random;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.springframework.ui.Model;

import com.proj.beans.member.MemberDAO;
import com.proj.beans.member.MemberDTO;
import com.proj.security.CustomNoOpPasswordEncoder;

import common.Command;
import common.D;

public class PasswordUpdateCommand implements Command {

	CustomNoOpPasswordEncoder pwencoder = new CustomNoOpPasswordEncoder();
			
	@Override
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		
		HashMap<String, Object> map2 = new HashMap<String, Object>();
		
		//List<MemberDTO> list = (List<MemberDTO>)map.get("list");
		
		String email = (String)map.get("email");
		
		Random random = new Random();
		String numStr = "";
		for (int i = 0; i < 7; i++) {
			String temp = Integer.toString(random.nextInt(10));
			
			numStr += temp;
			
		}
		
		String pw = pwencoder.encode(numStr);
		
		map2.put("email", email);
		map2.put("pw", pw);
		
		MemberDAO dao = D.sqlSession.getMapper(MemberDAO.class);
		
		int cnt = dao.updatePw(map2);
		
		model.addAttribute("result", cnt);
		
		if(cnt != 0) {
			
			String host = "smtp.naver.com";
			final String username = "cooking0728";
			final String password = "recipe1234!";
			int port = 465;
					
			String setfrom = "cooking0728@naver.com";	// 보내는 사람
			String tomail = email;
			String title = "요리조리 임시 비밀번호";
			String content = "요리조리 임시 비밀번호: " +numStr +"\n *이 메일은 개발 중인 사이트에서 보내는 것으로 혹시나 잘못 전달 시 무시하시기 바랍니다. 죄송합니다. ";
			
			Properties props = System.getProperties();
			
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", port);
			props.put("mail.smtp.auth", "true");
			props.put("mail.smtp.ssl.enable", "true");
			props.put("mail.smtp.ssl.trust", host);
			
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				String un = username;
				String pw = password;
				protected javax.mail.PasswordAuthentication getPasswordAuthentication() {
					return new javax.mail.PasswordAuthentication(un, pw);
				}
			});
			
			Message mimeMessage = new MimeMessage(session);
			try {
				mimeMessage.setFrom(new InternetAddress("cooking0728@naver.com"));
				mimeMessage.setRecipient(Message.RecipientType.TO, new InternetAddress(tomail));
				mimeMessage.setSubject(title);
				mimeMessage.setText(content);
				Transport.send(mimeMessage);
				
			} catch (AddressException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		

	}

}
