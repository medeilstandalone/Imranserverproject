/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.ui;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.lang.Exception;
import java.lang.Math;
import java.net.URL;
import java.util.Random;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.URLUTF8Encoder;
import com.vanuston.medeil.implementation.CommonImplements ;
import com.vanuston.medeil.client.RegistryFactory ;
import com.vanuston.medeil.util.RegistryConstants ;
/**
 * @author vanuston
 */
public class SendSmsAlerts {

    def log = Logger.getLogger(SendSmsAlerts.class, "Utilities");
//    var jep = new JEditorPane();
    var title = "";
    var stsMsg = "";
    var smsNo = "";
    public var msg = "";
    public var isSent: Boolean;
    public var rand: Integer = 0;

    function setPage(url: String): Void {
        var new_url = url;
        msg = "";
        try {
            //            if (not new_url.startsWith("http://")) {
            //                new_url = "http://".concat(new_url);
            //            }
            new_url = new_url.replaceAll(" ", "%20");
            var webURL = new URL(new_url);
            def reader = new BufferedReader(new InputStreamReader(webURL.openStream()));
            var line = "";
            var intch: Integer = -1;

            while ((intch = reader.read()) != -1) {
                var ch = (intch as Character);
                //                lbl_msg.text = lbl_msg.text.concat("{ch}");
                msg = "{msg}{ch}";
                //                Thread.sleep(10000);
                print("ch:{ch}");
            }
            if (msg.endsWith("sent")) {
                rand = Math.abs(new Random().nextInt() mod 100);
                isSent = true;

            } else {

                rand = Math.abs(new Random().nextInt() mod 100);
                isSent = false;
            }
            reader.close();

        } catch (e: Exception) {
            var mess = "Class : SendSMSAlerts  Method :  setPage URL:{new_url}   Exception : = {e}";
            msg = " Message has not sent anymore.becaues Exception := {e.getMessage()}";
            log.debug(mess);
        } catch (ex: IOException) {
            var mess = "Class : SendSMSAlerts  Method :  setPage  URL:{new_url}   Exception := {ex}";
            msg = " Message has not sent anymore. becaues Exception := {ex.getMessage()}";
            log.debug(mess);
        }
    }

    public function sendSMS(mob: String, msg: String): Boolean {
        //        panel.visible = true;
        def sms = getSMSGateWay();
        def mess = new URLUTF8Encoder().encode(msg);
        def l = mess.trim().length();
        def l1 = sms[0].trim().length();
        def l2 = sms[1].trim().length();
        def l3 = sms[2].trim().length();
        var s = true;
        if (l > 138) {
            s = false;
        }

        if (l > 0 or l1 > 0 or l2 > 0 or l3 > 0) {
            if (s) {
                stsMsg = "Sending SMS to this mob no.: {sms[1]}...";
                var url = "http://www.pharmastute.com/sms/SendSMS.php?acc={sms[0]}&uid={sms[1]}&pwd={sms[2]}&mob={mob}&msg={msg}";
                smsNo = sms[0];
                setPage(url);
                return isSent;
            } else {
                var getMes = spiltMsg(msg, 138);
                smsNo = sms[0];
                for (i in [0..<getMes.size()]) {
                    stsMsg = "Sending SMS {i + 1} Part to this mob no. : {sms[1]}...";
                    var url = "http://www.pharmastute.com/sms/SendSMS.php?acc={sms[0]}&uid={sms[1]}&pwd={sms[2]}&mob={mob}&msg={getMes[i]}";
                    setPage(url);
                    if (not isSent)
                        break;
                }
            }
        } else {
            isSent = false;
        }

        return isSent;

    }

    function spiltMsg(msg: String, len: Integer): String[] {
        var mess: String[] = [];
        try {
            var val = msg.trim().length();
            var l = val / len;
            var rem = val mod len;
            var count = l;
            if (rem > 0) {
                count++;
            }
            for (i in [0..<count]) {
                var endl = (i + 1) * len;
                if (rem > 0 and i == count - 1) {
                    mess[i] = msg.substring((i * len), (i * len) + rem);
                } else {
                    mess[i] = msg.substring((i * len), (endl - 1));
                }
            }
        } catch (e: Exception) {
            var msg2 = "Class : SendSMS  Method :  SplitMEssage   = {e.getMessage()}";
            log.debug(msg2);
        }
        return mess;
    }

    function getSMSGateWay(): String[] {
        var ret: String[] = ["way2sms"];
        var commonController : CommonImplements = RegistryFactory.getClientStub( RegistryConstants.CommonImplements ) as CommonImplements ;
        var gw = commonController.getCompare("SELECT defaultsms_gw as compare FROM settings_config");
//        var gw = DBData.getCompare("SELECT defaultsms_gw as compare FROM settings_config");
        if (gw == 1) {
//            ret[0] = "160by2";
//            ret[1] = "{DBData.getQueryValue("SELECT 160by2_user as compare FROM settings_config")}";
//            if (ret[1].trim().length() == 10) {
//                ret[1] = "91".concat(ret[1]);
//            }
//
//            ret[2] = "{DBData.getQueryValue("SELECT 160by2_pass as compare FROM settings_config")}";
            ret = ["160by2", commonController.getQueryValue("SELECT 160by2_user,160by2_pass FROM settings_config", 2).toArray() as String [] ] ;
        } else {
//            ret[0] = "way2sms";
//            ret[1] = "{DBData.getQueryValue("SELECT way2sms_user as compare FROM settings_config")}";
//            ret[2] = "{DBData.getQueryValue("SELECT way2sms_pass as compare FROM settings_config")}";
            ret = ["way2sms", commonController.getQueryValue("SELECT way2sms_user,way2sms_pass FROM settings_config", 2).toArray() as String [] ] ;
        }

        return ret;
    }

}
