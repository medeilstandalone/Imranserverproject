package com.vanuston.medeil.util;

import java.math.BigInteger;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.prefs.Preferences;

public class SetRegistryKey {

    public final String DATE_FORMAT_NOW = "yyyyMMdd";
    SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_NOW);
    Calendar cal = Calendar.getInstance();
    private Preferences userRoot = Preferences.userRoot();
    private Preferences systemRoot = Preferences.systemRoot();
    String convHex = "";
    Logger log = Logger.getLogger(SetRegistryKey.class, "utilities");

    public String setValue() {
        try {
            userRoot.put("Installed", toHex(sdf.format(cal.getTime()).toString()));
            systemRoot.put("Installed", toHex(sdf.format(cal.getTime()).toString()));
            userRoot.put("Version", "1.0");
            systemRoot.put("Version", "1.0");
        } catch (Exception ex) {
            String msg = "Class : SetRegistryKey  Method :setValue Exception:" + ex.getMessage();
            log.debug(msg);
        }
        return toHex(sdf.format(cal.getTime()).toString());
    }

    public void setValue(String actKey, String licHolder, String appPath) {
        try {
            userRoot.put("Installed", toHex(sdf.format(cal.getTime()).toString()));
            systemRoot.put("Installed", toHex(sdf.format(cal.getTime()).toString()));
            userRoot.put("Version", "1.0");
            systemRoot.put("Version", "1.0");
            userRoot.put("KeyA", toHex(actKey.toString()));
            systemRoot.put("KeyA", toHex(actKey.toString()));
            userRoot.put("LicHold", toHex(licHolder.toString()));
            systemRoot.put("LicHold", toHex(licHolder.toString()));
            userRoot.put("AppPath", toHex(appPath.toString()));
            systemRoot.put("AppPath", toHex(appPath.toString()));
        } catch (Exception ex) {
            String msg = "Class : SetRegistryKey  Method :setValue Exception: " + ex.getMessage();
            log.debug(msg);
        }
    }

    public String toHex(String arg) {
        try {
            convHex = String.format("%x", new BigInteger(arg.getBytes()));
        } catch (Exception ex) {
            String msg = "Class : SetRegistryKey  Method :toHex Exception: " + ex.getMessage();
            log.debug(msg);
        }
        return convHex.toString();
    }
}
