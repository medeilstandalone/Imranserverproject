package com.vanuston.medeil.util;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigInteger;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.prefs.Preferences;

public class LogReg {

    static Logger log = Logger.getLogger(LogReg.class, "Utilities");
   GetProductInfo getProInfo;

    public LogReg() {
        try {
            getProInfo = new GetProductInfo();
        } catch (Exception e) {
            log.debug("Method:LogReg Exception:"+e.getMessage());
        }
    }
    DateUtils dutil = new DateUtils();
    final String DATE_FORMAT_NOW = "yyyyMMdd";
    SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_NOW);
    Calendar cal = Calendar.getInstance();
    int curUSER = HKEY_CURRENT_USER;
    int loclMAC = HKEY_LOCAL_MACHINE;
    static String convHex = "";
    public String InstalledDate = "", version = "", custName = "";
    public String defaultValue = "NA";
    public String defaultFWValue = "4d456465694c44656d4f4032303130";
    public String trialExpiry = null;
    public long TrialDaysRemaining;
    public static final int HKEY_CURRENT_USER = 0x80000001;
    public static final int HKEY_LOCAL_MACHINE = 0x80000002;
    public final int REG_SUCCESS = 0;
    public final int REG_NOTFOUND = 2;
    public final int REG_ACCESSDENIED = 5;
    private final int KEY_ALL_ACCESS = 0xf003f;
    private final int KEY_READ = 0x20019;
    public String fLogkey = "SOFTWARE\\Medeil";
    public String ExpiryDate = "";
    private Preferences userRoot = Preferences.userRoot();
    private Preferences systemRoot = Preferences.systemRoot();
    private Class<? extends Preferences> userClass = userRoot.getClass();
    private Method regOpenKey = null;
    private Method regCloseKey = null;
    private Method regQueryValueEx = null;
    private Method regEnumValue = null;
    private Method regQueryInfoKey = null;
    private Method regEnumKeyEx = null;
    private Method regCreateKeyEx = null;
    private Method regSetValueEx = null;
    private Method regDeleteKey = null;
    private Method regDeleteValue = null;

    {
        try {
            regOpenKey = userClass.getDeclaredMethod("WindowsRegOpenKey",
                    new Class[]{int.class, byte[].class, int.class});
            regOpenKey.setAccessible(true);


            regCloseKey = userClass.getDeclaredMethod("WindowsRegCloseKey",
                    new Class[]{int.class});
            regCloseKey.setAccessible(true);

            regQueryValueEx = userClass.getDeclaredMethod("WindowsRegQueryValueEx",
                    new Class[]{int.class, byte[].class});
            regQueryValueEx.setAccessible(true);

            regEnumValue = userClass.getDeclaredMethod("WindowsRegEnumValue",
                    new Class[]{int.class, int.class, int.class});
            regEnumValue.setAccessible(true);

            regQueryInfoKey = userClass.getDeclaredMethod("WindowsRegQueryInfoKey1",
                    new Class[]{int.class});
            regQueryInfoKey.setAccessible(true);

            regEnumKeyEx = userClass.getDeclaredMethod(
                    "WindowsRegEnumKeyEx", new Class[]{int.class, int.class,
                        int.class});
            regEnumKeyEx.setAccessible(true);

            regCreateKeyEx = userClass.getDeclaredMethod(
                    "WindowsRegCreateKeyEx", new Class[]{int.class,
                        byte[].class});
            regCreateKeyEx.setAccessible(true);

            regSetValueEx = userClass.getDeclaredMethod(
                    "WindowsRegSetValueEx", new Class[]{int.class,
                        byte[].class, byte[].class});
            regSetValueEx.setAccessible(true);

            regDeleteValue = userClass.getDeclaredMethod(
                    "WindowsRegDeleteValue", new Class[]{int.class,
                        byte[].class});
            regDeleteValue.setAccessible(true);

            regDeleteKey = userClass.getDeclaredMethod(
                    "WindowsRegDeleteKey", new Class[]{int.class,
                        byte[].class});
            regDeleteKey.setAccessible(true);

        } catch (Exception e) {
            String ss = "Class : LogReg  Method  : LogReg Exception :" + e.getMessage();
            log.debug(ss);
        }
    }

    public int loginCheck() {
        String value1 = "";
        value1 = getValues(curUSER, fLogkey, "LogDate");
        if (value1 == null) {
            setKeyValues(curUSER, fLogkey, "LogDate", toHex(sdf.format(cal.getTime()).toString()));
            setKeyValues(loclMAC, fLogkey, "LogDate", toHex(sdf.format(cal.getTime()).toString()));
        } else {
            try {                
                if (Integer.parseInt(convertHexToString(value1)) <= Integer.parseInt(sdf.format(cal.getTime()).toString())) {
                    setKeyValues(curUSER, fLogkey, "LogDate", toHex(sdf.format(cal.getTime()).toString()));
                    setKeyValues(loclMAC, fLogkey, "LogDate", toHex(sdf.format(cal.getTime()).toString()));
                } else {
                    return 0;
                }
            } catch (Exception e) {
                String ss = "Class : LogReg  Method  : loginCheck Exception :" + e.getMessage();
                log.debug(ss);
            }
        }        
        return 1;
    }

    public void createKey(int hkey, String key)
            throws IllegalArgumentException, IllegalAccessException,
            InvocationTargetException {
        int[] ret;
        if (hkey == HKEY_LOCAL_MACHINE) {
            ret = createKey(systemRoot, hkey, key);
            regCloseKey.invoke(systemRoot, new Object[]{new Integer(ret[0])});
        } else if (hkey == HKEY_CURRENT_USER) {
            ret = createKey(userRoot, hkey, key);
            regCloseKey.invoke(userRoot, new Object[]{new Integer(ret[0])});
        } else {
            throw new IllegalArgumentException("hkey=" + hkey);
        }
        if (ret[1] != REG_SUCCESS) {
            throw new IllegalArgumentException("rc=" + ret[1] + "  key=" + key);
        }
    }

    private int[] createKey(Preferences root, int hkey, String key)
            throws IllegalArgumentException, IllegalAccessException,
            InvocationTargetException {
        return (int[]) regCreateKeyEx.invoke(root,
                new Object[]{new Integer(hkey), toCstr(key)});
    }

    public String readString(int hkey, String key, String valueName)
            throws IllegalArgumentException, IllegalAccessException,
            InvocationTargetException {
        if (hkey == HKEY_LOCAL_MACHINE) {
            return readString(systemRoot, hkey, key, valueName);
        } else if (hkey == HKEY_CURRENT_USER) {
            return readString(userRoot, hkey, key, valueName);
        } else {
            throw new IllegalArgumentException("hkey=" + hkey);
        }
    }

    private String readString(Preferences root, int hkey, String key, String value)
            throws IllegalArgumentException, IllegalAccessException,
            InvocationTargetException {
        int[] handles = (int[]) regOpenKey.invoke(root, new Object[]{
                    new Integer(hkey), toCstr(key), new Integer(KEY_READ)});
        if (handles[1] != REG_SUCCESS) {
            return null;
        }
        byte[] valb = (byte[]) regQueryValueEx.invoke(root, new Object[]{
                    new Integer(handles[0]), toCstr(value)});
        regCloseKey.invoke(root, new Object[]{new Integer(handles[0])});
        return (valb != null ? new String(valb).trim() : null);
    }

    public void deleteValue(int hkey, String key, String value)
            throws IllegalArgumentException, IllegalAccessException,
            InvocationTargetException {
        int rc = -1;
        if (hkey == HKEY_LOCAL_MACHINE) {
            rc = deleteValue(systemRoot, hkey, key, value);
        } else if (hkey == HKEY_CURRENT_USER) {
            rc = deleteValue(userRoot, hkey, key, value);
        }
        if (rc != REG_SUCCESS) {
            throw new IllegalArgumentException("rc=" + rc + "  key=" + key + "  value=" + value);
        }
    }

    private int deleteValue(Preferences root, int hkey, String key, String value)
            throws IllegalArgumentException, IllegalAccessException,
            InvocationTargetException {
        int[] handles = (int[]) regOpenKey.invoke(root, new Object[]{
                    new Integer(hkey), toCstr(key), new Integer(KEY_ALL_ACCESS)});
        if (handles[1] != REG_SUCCESS) {
            return handles[1];
        }
        int rc = ((Integer) regDeleteValue.invoke(root,
                new Object[]{
                    new Integer(handles[0]), toCstr(value)
                })).intValue();
        regCloseKey.invoke(root, new Object[]{new Integer(handles[0])});
        return rc;
    }

    private byte[] toCstr(String str) {
        byte[] result = new byte[str.trim().length() + 1];

        for (int i = 0; i < str.trim().length(); i++) {
            result[i] = (byte) str.charAt(i);
        }
        result[str.trim().length()] = 0;
        return result;
    }

    public String toHex(String arg) {

        try {
            convHex = String.format("%x", new BigInteger(arg.getBytes()));
        } catch (Exception e) {
            String ss = "Class : LogReg  Method  : loginCheck Exception :" + e.getMessage();
            log.debug(ss);
        }
        return convHex.toString();
    }

    public String convertHexToString(String hex) {
        StringBuilder sb = new StringBuilder();
//        if (getValue() == "NA") {
//        } else {
        for (int i = 0; i < hex.trim().length() - 1; i += 2) {
            String output = hex.substring(i, (i + 2));
            int decimal = Integer.parseInt(output, 16);
            sb.append((char) decimal);
        }
//        }
        return sb.toString();
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
        } catch (Exception e) {
            String ss = "Class : LogReg  Method  : setValue Exception :" + e.getMessage();
            log.debug(ss);
        }
    }

    public int setExpireDate() {
        try {
            Calendar expireDate = Calendar.getInstance();
            expireDate.getTime();
            long longDay = 24 * 60 * 60 * 1000;
            int validity = getProInfo.getValidity();
            getValue();            
            String year = convertHexToString(InstalledDate).substring(0, convertHexToString(InstalledDate).trim().length() - 4);
            String month = convertHexToString(InstalledDate).substring((convertHexToString(InstalledDate).trim().length() - 4), (convertHexToString(InstalledDate).trim().length() - 2));
            String day = convertHexToString(InstalledDate).substring(convertHexToString(InstalledDate).trim().length() - 2, (convertHexToString(InstalledDate).trim().length()));
            long trialDay = 0;
            Date CurDate = null;
            Date TrialExpiry = null;
            String insDateStr = year + "-" + month + "-" + day;
            Date insDate = null;
            SimpleDateFormat daFormt = new SimpleDateFormat("yyyy-MM-dd");
            try {
                insDate = daFormt.parse(insDateStr);
                TrialExpiry = daFormt.parse(insDateStr);
                CurDate = daFormt.parse(dutil.now("yyyy-MM-dd"));
            } catch (ParseException e) {
                String ss = "Class : LogReg  Method  : setExpireDate Exception :" + e.getMessage();
                log.debug(ss);
            }
            if (validity != 0) {
                long trTime = TrialExpiry.getTime();
                TrialExpiry.setTime(trTime + validity * longDay);
                trialExpiry = daFormt.format(TrialExpiry);
            } else if (validity == 0) {
                long trTime = TrialExpiry.getTime();
                TrialExpiry.setTime(trTime + 15 * longDay);
                trialExpiry = daFormt.format(TrialExpiry);
            }            
            trialDay = ((CurDate).getTime() - (insDate).getTime()) / (24 * 3600 * 1000);
            TrialDaysRemaining = ((validity * longDay) / (longDay) - (trialDay + 1));
            boolean bo;
            boolean bo1, bo2;

            expireDate.set(Integer.parseInt(year), Integer.parseInt(month) - 1, Integer.parseInt(day) - 1);
            
            bo = CurDate.after(TrialExpiry);
            bo1 = CurDate.before(insDate);
            bo2 = CurDate.equals(TrialExpiry);
            if (bo || bo1) {                
                return 1;
            }
            ExpiryDate = daFormt.format(TrialExpiry).toString();
        } catch (NumberFormatException e) {
            String ss = "Class : LogReg  Method  : loginCheck Exception :" + e.getMessage();
            log.debug(ss);
        }        
        return 0;
    }

    public void setKeyValues(int regEntry, String FKey, String FVal, String keyVal) {
        try {
            createKey(regEntry, FKey);
            writeStringValue(regEntry, FKey, FVal, keyVal);
        } catch (Exception e) {
            String ss = "Class : LogReg  Method  : loginCheck Exception :" + e.getMessage();
            log.debug(ss);
        }
    }

    public void writeStringValue(int hkey, String key, String valueName, String value)
            throws IllegalArgumentException, IllegalAccessException,
            InvocationTargetException {
        if (hkey == HKEY_LOCAL_MACHINE) {
            writeStringValue(systemRoot, hkey, key, valueName, value);
        } else if (hkey == HKEY_CURRENT_USER) {
            writeStringValue(userRoot, hkey, key, valueName, value);
        } else {
            throw new IllegalArgumentException("hkey=" + hkey);
        }
    }

    private void writeStringValue(Preferences root, int hkey, String key, String valueName, String value)
            throws IllegalArgumentException, IllegalAccessException,
            InvocationTargetException {
        int[] handles = (int[]) regOpenKey.invoke(root, new Object[]{
                    new Integer(hkey), toCstr(key), new Integer(KEY_ALL_ACCESS)});

        regSetValueEx.invoke(root,
                new Object[]{
                    new Integer(handles[0]), toCstr(valueName), toCstr(value)
                });
        regCloseKey.invoke(root, new Object[]{new Integer(handles[0])});
    }

    public String getValues(int regEntry, String FKey, String key) {
        String value = null;
        try {
            value = readString(regEntry, FKey, key);
        } catch (Exception e) {
            String ss = "Class : LogReg  Method  : getValues  Exception :" + e.getMessage();
            log.debug(ss);
        }
        
        return value;
    }

    public String getValue() {
        try {
            InstalledDate = systemRoot.get("Installed", defaultValue);
            custName = systemRoot.get("LicHold", defaultValue);
            version = systemRoot.get("Version", defaultValue);
            systemRoot.flush();
        } catch (Exception e) {
            String ss = "Class : LogReg  Method  : getValues Exception :" + e.getMessage();
            log.debug(ss);
        }
        return InstalledDate;
    }

    public String temp() {
        String tmp = "Error";
        try {
//            String ff1 = userRoot.get("Medeils", defaultFWValue);
            String ff2 = systemRoot.get("Medeils", defaultFWValue);
            userRoot.flush();
            systemRoot.flush();
//            String tmp1 = convertHexToString(ff1);
            String tmp2 = convertHexToString(ff2);
//            if (tmp1.equals(tmp2)) {
            tmp = tmp2;            
//            }
        } catch (Exception e) {
            log.debug("Class : LogReg  Method  temp() Exception : " + e);
        }        
        return tmp;
    }

    public Integer getRemainingDays() {
        Integer RemainingDays = 0;
        try {
            if (!getValue().equals("NA")) {
                long longDay = 24 * 60 * 60 * 1000;
                int validity = getProInfo.getValidity();
                String regDate = convertHexToString(InstalledDate);
                String year = regDate.substring(0, regDate.length() - 4);
                String month = regDate.substring((regDate.length() - 4), (regDate.length() - 2));
                String day = regDate.substring(regDate.length() - 2, (regDate.length()));

                long trialDay = 0;
                Date CurDate = null;

                String insDateStr = year + "-" + month + "-" + day;
                Date insDate = null;
                SimpleDateFormat daFormt = new SimpleDateFormat("yyyy-MM-dd");

                insDate = daFormt.parse(insDateStr);
                CurDate = daFormt.parse(dutil.now("yyyy-MM-dd"));

                trialDay = ((CurDate).getTime() - (insDate).getTime()) / (24 * 3600 * 1000);
                long rdays = (validity * longDay) / (longDay) - (trialDay + 1);
                RemainingDays = Integer.parseInt(String.valueOf(rdays));
            }
        } catch (Exception e) {
            String ss = "Class : LogReg  Method  : getRemainingDays Exception :" + e.getMessage();
            log.debug(ss);
        }
        if(RemainingDays <=0){
            log.debug("Class : LogReg  Method  : getRemainingDays value :"+RemainingDays);
        }
        return RemainingDays;
    }
}
