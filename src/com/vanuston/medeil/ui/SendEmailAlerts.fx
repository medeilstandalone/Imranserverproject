/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.ui;

import java.lang.Exception;
import java.lang.Math;
import java.util.Random;
import com.vanuston.medeil.util.Logger;
import java.lang.System;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.client.RegistryFactory ;
import com.vanuston.medeil.util.RegistryConstants ;

/**
 * @author San
 */

public class SendEmailAlerts {




    def log = Logger.getLogger(SendEmailAlerts.class, "Utilities");
    var commonController : CommonImplements = RegistryFactory.getClientStub( RegistryConstants.CommonImplements ) as CommonImplements ;

    public var msg1 = "";
    public var isSentMail : Boolean;
    public var rand1 : Integer = 0;
    public var title="";

    public function sendEMail(to: String, msg: String): Void {
        msg1 = "";
        def email = getEmailGateWay();
        def s = email[0].split("@");
        var chck = true;
//        if(to.trim().length()<=0)
//        {
//            chck = false;
//        }
//        if(s[1]!=null)
//        {
//            var domain = s[1].split(".");
////            if(not s[1].startsWith("gmail") or not s[1].startsWith("google") )
//            if(not domain[0].equals("gmail"))
//            {
//                chck = false;
//                isSentMail = chck;
//                rand1 = Math.abs(new Random().nextInt() mod 100);
//            }
//        }else{
//            chck = false;
//        }

        if(chck)
        {
            msg1 = "Logging account...";
            sendMail(email[0],email[1],to,msg);
        }
    }

    public function sendEMail(to: String[], msg: String): Void {
        def email = getEmailGateWay();
        msg1 = "";
        def s = email[0].split("@");
        var chck = true;

        if(s[1]!=null)
        {
            if(not s[1].startsWith("gmail") or not s[1].startsWith("google") )
            {
                chck = false;
                isSentMail = chck;
                rand1 = Math.abs(new Random().nextInt() mod 100);
            }
        }else{
            chck = false;
        }
        chck = true;
        if(chck)
        {
            msg1 = "Logging account...";
            sendMail(email[0],email[1],to,msg);
        }
    }

function sendMail(frm : String , pass :String , to : String , mes : String):Void {

    try{
        var host = "smtp.gmail.com";
        var subject ="";
        if(title.length()>0)
        {
            subject = title;
        }
        else {
            subject = "Email Alert From the Shop \" {commonController.getShopName()} \"by Medeil Software.";
        }
        msg1 = "{msg1} Sending mail to ";

        var props = System.getProperties();
        props.put("mail.smtp.starttls.enable", "true"); // added this line
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", frm);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        var session = Session.getDefaultInstance(props, null);
        var message = new MimeMessage(session);
        message.setFrom(new InternetAddress(frm));
        var toAddress = new InternetAddress(to);
        message.addRecipient(Message.RecipientType.TO, toAddress);

        message.setSubject(subject);
        message.setText(mes);
        var transport = session.getTransport("smtp");
        transport.connect(host, frm, pass);
        transport.sendMessage(message, message.getAllRecipients());
        isSentMail = true;
        rand1 = Math.abs(new Random().nextInt() mod 100);
        transport.close();
        }catch(e :Exception )
        {
            var mess = "Class : SendAlerts  Method :  sendMail  Mail Id:{to}   Exception := {e}";
            msg1 = " Email has not sent anymore. becaues Exception := {e.getMessage()}";
            log.debug(mess);

            isSentMail = false;
            rand1 = Math.abs(new Random().nextInt() mod 100);
        }
    }
function sendMail(frm : String , pass :String , to : String[] , mes : String):Void {

    try{
        var host = "smtp.gmail.com";
        var subject ="";
        if(title.length()>0)
        {
            subject = title;;
        }
        else {
            subject = "Email Alert From the Shop \" {commonController.getShopName()} \"by Medeil Software.";
        }        msg1 = "{msg1} Sending mail to ";
        var props = System.getProperties();
        props.put("mail.smtp.starttls.enable", "true"); // added this line
        props.put("mail.smtp.host", host);
        props.put("mail.smtp.user", frm);
        props.put("mail.smtp.password", pass);
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");

        var session = Session.getDefaultInstance(props, null);
        var message = new MimeMessage(session);
        message.setFrom(new InternetAddress(frm));

        for(i in [0..<to.size()])
        {
            if(to[i].trim().length()>0)
            {
                var toAddress = new InternetAddress(to[i]);
                var c="";
                if(i!=(to.size()-1))
                    c = ", ";
                msg1 = "{msg1} {toAddress} {c}";
                message.addRecipient(Message.RecipientType.TO, toAddress);
            }
        }
        message.setSubject(subject);
        message.setText(mes);
        var transport = session.getTransport("smtp");
        transport.connect(host, frm, pass);
        transport.sendMessage(message, message.getAllRecipients());
        isSentMail = true;
        rand1 = Math.abs(new Random().nextInt() mod 100);
        transport.close();

        }catch(e :Exception )
        {
            var mess = "Class : SendAlerts  Method :  sendMail  Mail Id:{to}   Exception := {e}";
            msg1 = " Email has not sent anymore. becaues Exception := {e.getMessage()}";
            log.debug(mess);

            isSentMail = false;
            rand1 = Math.abs(new Random().nextInt() mod 100);
        }
    }

    function getEmailGateWay(): String[] {
//        var ret: String[] = [];

     var ret = commonController.getQueryValue("SELECT email_username , email_password FROM settings_config",2).toArray() as String [] ;
//        ret[1] = "{DBData.getQueryValue("SELECT email_password as compare FROM settings_config")}";

        return ret;
    }
}