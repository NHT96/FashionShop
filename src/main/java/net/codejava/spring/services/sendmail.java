package net.codejava.spring.services;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
public class sendmail {
	public boolean SendPass(String email, String content) {
        String to = "tdtfindme@gmail.com";
        String host = "smtp.gmail.com";
        Properties properties = System.getProperties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication("tdtfindme@gmail.com", "islworttohdwpxui");
            }
        });
        session.setDebug(true);
        try {
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(to));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(email));
            message.setSubject("TDT~FINDME: NEW PASSWORD");
            message.setText("Đây là mật khẩu mới của bạn: " + content + "\nVui lòng đăng nhập lại và thay đổi mật khẩu!\nCảm ơn khách hàng đã tin tưởng và sử dụng dịch vụ của chúng tôi!");
            System.out.println("sending...");
            Transport.send(message);
            return true;
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }
		return false;
	}
}
