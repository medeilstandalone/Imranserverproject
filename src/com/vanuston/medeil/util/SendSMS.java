package com.vanuston.medeil.util;

import java.io.IOException;
import javax.swing.JEditorPane;


public class SendSMS {

    static Logger log = Logger.getLogger(SendSMS.class,"Utilities");
    JEditorPane jep = new JEditorPane();

    public void setPage(String url) {
        try {
            if (!url.startsWith("http://")) {
                url = "http://".concat(url);
            }
            url = url.replaceAll(" ", "%20");
            
            jep.setPage(url);
        } catch (IOException e) {
            String msg1 = "Class : SendSMS  Method :  setPage  Exception: " + e.getMessage();
            log.debug(msg1);
        }
    }

    public String[] spiltMsg(String msg, int len) {
        String[] mess = null;
        try {
            int val = msg.trim().length();
            int l = val / len;
            int rem = val % len;
            int count = l;
            if (rem > 0) {
                count++;
            }
            mess = new String[count];
            for (int i = 0; i < count; i++) {
                int endl = (i + 1) * len;
                if (rem > 0 && i == count - 1) {
                    mess[i] = msg.substring((i * len), (i * len) + rem);
                } else {
                    mess[i] = msg.substring((i * len), (endl - 1));
                }
            }
        } catch (Exception e) {
            String msg2 = "Class : SendSMS  Method :  SplitMessage  Exception:" + e.getMessage();
            log.debug(msg2);
        }
        return mess;
    }
}
