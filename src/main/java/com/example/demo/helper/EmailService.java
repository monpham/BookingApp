package com.example.demo.helper;

import org.springframework.stereotype.Component;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import java.util.Properties;

@Component
public class EmailService {
    public void sendMail (String recipient, String emailSubject, String emailContent){
        Properties properties = new Properties();

        properties.put("mail.smtp.auth","true");
        properties.put("mail.smtp.starttls.enable","true");
        properties.put("mail.smtp.host","smtp.gmail.com");
        properties.put("mail.smtp.port","587");

        final String myAccountEmail = "thonlam750@gmail.com";
        final String password = "lnhkingsea123";

        Session session = Session.getInstance(properties, new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(myAccountEmail,password);
            }
        });

        Message message = prepareMessage(session, myAccountEmail, recipient, emailSubject, emailContent);
        try {
            Transport.send(message);
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        System.out.println("send ok");
    }
    private Message prepareMessage(Session session,String myAccountEmail,String recipient, String emailSubject, String emailContent){
        try {
            Message message = new MimeMessage(session);
            message.setFrom(new InternetAddress(myAccountEmail));
            message.setRecipient(Message.RecipientType.TO,new InternetAddress(recipient));
            message.setSubject(emailSubject);
            /*message.setText(emailContent);*/
            message.setContent(emailContent ,"text/html; charset=utf-8");
            return message;
        } catch (MessagingException e) {
            e.printStackTrace();
        }
        return null;
    }

}
