package com.vanuston.medeil.util;

import java.lang.reflect.InvocationTargetException;

public class WinRegistryTest {
    WinRegistry winReg = new WinRegistry();
    SetRegistryKey setReg = new SetRegistryKey();

    public Boolean writeAct(String actKey, String licHolder, String appPath) throws IllegalArgumentException, IllegalAccessException, InvocationTargetException {
        int curUSER = winReg.HKEY_CURRENT_USER;
        int loclMAC = winReg.HKEY_LOCAL_MACHINE;
        CheckApplication chk = new CheckApplication();
        String fKey = "SOFTWARE\\Medeil";
        if (winReg.getValue().get(1) == "NA") {
            new SetRegistryKey().setValue(actKey, licHolder, appPath);
            if (winReg.trialExpiry == null) {
                String fKey1 = "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\App Paths";
                String fVal = "Medeil PMS";
                String fVal1 = "Path";

                chk.setKeyValues(curUSER, fKey1 + "\\Medeil.exe", fVal1, appPath);
                chk.setKeyValues(loclMAC, fKey1 + "\\Medeil.exe", fVal1, appPath);
                chk.setKeyValues(curUSER, fKey, "Date", winReg.toHex(winReg.getExpiryDate()));
                chk.setKeyValues(loclMAC, fKey, "Date", winReg.toHex(winReg.getExpiryDate()));
                chk.setKeyValues(curUSER, fKey, "KeyAct", winReg.toHex(actKey));
                chk.setKeyValues(loclMAC, fKey, "KeyAct", winReg.toHex(actKey));
                chk.setKeyValues(curUSER, fKey, "Licholder", winReg.toHex(licHolder));
                chk.setKeyValues(loclMAC, fKey, "Licholder", winReg.toHex(licHolder));
                chk.setKeyValues(curUSER, fKey, "AppPath", appPath);
                chk.setKeyValues(loclMAC, fKey, "AppPath", appPath);
                chk.setKeyValues(curUSER, fKey, fVal, setReg.setValue());
                chk.setKeyValues(loclMAC, fKey, fVal, setReg.setValue());
                return true;
            }
        } else if (!actKey.equals("Trial")) {
            new SetRegistryKey().setValue(actKey, licHolder, appPath);
            String fKey1 = "SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\App Paths";
            String fVal = "Medeil PMS";
            String fVal1 = "Path";
            chk.setKeyValues(curUSER, fKey1 + "\\Medeil.exe", fVal1, appPath);
            chk.setKeyValues(loclMAC, fKey1 + "\\Medeil.exe", fVal1, appPath);
            chk.setKeyValues(curUSER, fKey, "Date", winReg.toHex(winReg.getExpiryDate()));
            chk.setKeyValues(loclMAC, fKey, "Date", winReg.toHex(winReg.getExpiryDate()));
            chk.setKeyValues(curUSER, fKey, "KeyAct", winReg.toHex(actKey));
            chk.setKeyValues(loclMAC, fKey, "KeyAct", winReg.toHex(actKey));
            chk.setKeyValues(curUSER, fKey, "Licholder", winReg.toHex(licHolder));
            chk.setKeyValues(loclMAC, fKey, "Licholder", winReg.toHex(licHolder));
            chk.setKeyValues(curUSER, fKey, "AppPath", appPath);
            chk.setKeyValues(loclMAC, fKey, "AppPath", appPath);
            chk.setKeyValues(curUSER, fKey, fVal, setReg.setValue());
            chk.setKeyValues(loclMAC, fKey, fVal, setReg.setValue());
            return true;
        } else if (actKey.equals("Trial")) {
            return false;
        }
         return false;
    }
}
