package com.vanuston.medeil.util;

import java.util.List;
import java.util.Map;

public class CheckApplication {

    static Logger log = Logger.getLogger(CheckApplication.class, "Utilities");
    WinRegistry winReg = new WinRegistry();

    public String getValues(int regEntry, String FKey, String key) {
        String value = null;
        try {
            value = winReg.readString(regEntry, FKey, key);

        } catch (Exception ex) {
            log.debug("Class : CheckApplication Method  :getValues Exception:" + ex.getMessage());
        }
        return value;
    }

    public Map getStringValues(int regEntry, String FKey) {
        Map value = null;
        try {
            value = winReg.readStringValues(regEntry, FKey);
        } catch (Exception ex) {
            log.debug("Class : CheckApplication Method  :getValues Exception:" + ex.getMessage());
        }
        return value;
    }

    public List getStringSubKeys(int regEntry, String FKey) {
        List value = null;
        try {
            value = winReg.readStringSubKeys(regEntry, FKey);
        } catch (Exception ex) {
            log.debug("Class : CheckApplication Method :getStringSubKeys   Exception :" + ex.getMessage());
        }
        return value;
    }

    public void setKeyValues(int regEntry, String FKey, String FVal, String keyVal) {
        try {
            winReg.createKey(regEntry, FKey);
            winReg.writeStringValue(regEntry, FKey, FVal, keyVal);
        } catch (Exception ex) {
            log.debug("Class : CheckApplication Method : setKeyValues Exception :" + ex.getMessage());
        }
    }
}
