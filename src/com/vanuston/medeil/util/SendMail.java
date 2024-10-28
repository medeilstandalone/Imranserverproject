package com.vanuston.medeil.util;

import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import java.util.Date;
import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Multipart;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class SendMail {

    static Logger log = Logger.getLogger(SendMail.class, "Inventory");
    private String from;
    private String[] to;
    private String subject;
    private String text;
    private String pass;
    private String path;
    private String filename;
    private String type;
    public int m = 0;

    public SendMail() {
    }

    public SendMail(String from, String pwd, String rec[], String subject, String text) {
        m = 0;
        this.from = from;
        this.to = rec;
        this.subject = subject;
        this.text = text;
        this.pass = pwd;
        try {
            send();
        } catch (Exception e) {
            String msg = "Class : SendMail  Method : SendMail   Exception: " + e.getMessage();
            log.debug(msg);
            m = 1;
        }
    }

    public void send() throws MessagingException {
        String host = "smtp.gmail.com";
        Properties props = System.getProperties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        Session session = Session.getDefaultInstance(props, null);
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(from));
        InternetAddress[] toAddress = new InternetAddress[to.length];
        for (int i = 0; i < to.length; i++) {
            toAddress[i] = new InternetAddress(to[i]);
        }
        for (int i = 0; i < toAddress.length; i++) {
            message.addRecipient(Message.RecipientType.TO, toAddress[i]);
        }
        message.setSubject(subject);
        message.setText(text);
        Transport transport = session.getTransport("smtp");
        transport.connect(host, from, pass);
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
    }

    public SendMail(String from, String pwd, String rec[], String subject, String text, String path, String file, String type) {
        m = 0;
        this.from = from;
        this.to = rec;
        this.subject = subject;
        this.text = text;
        this.pass = pwd;
        this.path = path;
        this.filename = file;
        this.type = type;
        path = path.replaceAll("/", "\\\\");
        path = path.concat(file);
        this.path = path;
        try {
            sendAttach();
        } catch (Exception e) {
            String msg = "Class : SendMail  Method : Send   Exception:" + e.getMessage();
            log.debug(msg);
            m = 1;
        }
    }

    public SendMail(String from, String pwd, String rec, String subject, String text, String path, String file, String type) {
        m = 0;
        this.from = from;
        this.to[0] = rec;
        this.subject = subject;
        this.text = text;
        this.pass = pwd;
        this.path = path;
        this.filename = file;
        this.type = type;
        path = path.replaceAll("/", "\\\\");
        path = path.concat(file);
        this.path = path;
        try {
            sendAttach();
        } catch (Exception e) {
            String msg = "Class : SendMail  Method : SendMail   Exception:" + e.getMessage();
            log.debug(msg);
            m = 1;
        }
    }

    public void sendAttach() throws MessagingException {
        String host = "smtp.gmail.com";
        Properties props = System.getProperties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        Session session = Session.getDefaultInstance(props, null);
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(from));
        InternetAddress[] toAddress = new InternetAddress[to.length];
        for (int i = 0; i < to.length; i++) {
            toAddress[i] = new InternetAddress(to[i]);
        }
        for (int i = 0; i < toAddress.length; i++) {
            message.addRecipient(Message.RecipientType.TO, toAddress[i]);
        }
        message.setSubject(subject);
        message.setText(text);
        if (type == "html") {
            message.setContent("<h1>This is actual message</h1>", "text/html");
        }
        BodyPart messageBodyPart = new MimeBodyPart();
        messageBodyPart.setText(text);
        Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(messageBodyPart);
        messageBodyPart = new MimeBodyPart();
        DataSource source = new FileDataSource(path);
        messageBodyPart.setDataHandler(new DataHandler(source));
        messageBodyPart.setFileName(filename);
        multipart.addBodyPart(messageBodyPart);
        message.setContent(multipart);
        message.setSentDate(new Date());
        Transport transport = session.getTransport("smtp");
        transport.connect(host, from, pass);
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
    }

    public void sendAttach(String from1, String pass1, String too1, String subject1, String text1, String type1, String path1, String fileName1) throws MessagingException {
        String[] to1 = new String[100];
        to1[0] = too1;
        String host = "smtp.gmail.com";
        Properties props = System.getProperties();
        props.put("mail.smtp.starttls.enable", "true");
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", from1);
        props.put("mail.smtp.password", pass1);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        Session session = Session.getDefaultInstance(props, null);
        MimeMessage message = new MimeMessage(session);
        message.setFrom(new InternetAddress(from1));
        InternetAddress[] toAddress = new InternetAddress[to1.length];
        for (int i = 0; i < to1.length; i++) {
            toAddress[i] = new InternetAddress(to[i]);
        }
        for (int i = 0; i < toAddress.length; i++) {
            message.addRecipient(Message.RecipientType.TO, toAddress[i]);
        }
        message.setSubject(subject1);
        message.setText(text1);
        if (type1 == "html") {
            message.setContent("<h1>This is actual message</h1>", "text/html");
        }
        BodyPart messageBodyPart = new MimeBodyPart();
        messageBodyPart.setText(text1);
        Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(messageBodyPart);
        messageBodyPart = new MimeBodyPart();
        DataSource source = new FileDataSource(path1);
        messageBodyPart.setDataHandler(new DataHandler(source));
        messageBodyPart.setFileName(fileName1);
        multipart.addBodyPart(messageBodyPart);
        message.setContent(multipart);
        message.setSentDate(new Date());
        Transport transport = session.getTransport("smtp");
        transport.connect(host, from1, pass1);
        transport.sendMessage(message, message.getAllRecipients());
        transport.close();
    }
}
