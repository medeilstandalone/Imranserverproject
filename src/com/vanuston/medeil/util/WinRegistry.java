package com.vanuston.medeil.util;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.math.BigInteger;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;
import java.util.prefs.Preferences;

public class WinRegistry {

    GetProductInfo getproInfo;

    public WinRegistry() {
        try {
            getproInfo = new GetProductInfo();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    DateUtils dutil = new DateUtils();
    public String InstalledDate = "", version = "", actKey = "", licHold = "", appPath = "", custName1 = "", custName2 = "", custName;
    public String defaultValue = "NA";
    public final String DATE_FORMAT_NOW = "yyyyMMdd";
    SimpleDateFormat sdf = new SimpleDateFormat(DATE_FORMAT_NOW);
    Calendar cal = Calendar.getInstance();
    String convHex = "";
    public String trialExpiry;
    public final int HKEY_CURRENT_USER = 0x80000001;
    public final int HKEY_LOCAL_MACHINE = 0x80000002;
    public final int REG_SUCCESS = 0;
    public final int REG_NOTFOUND = 2;
    public final int REG_ACCESSDENIED = 5;
    private final int KEY_ALL_ACCESS = 0xf003f;
    private final int KEY_READ = 0x20019;
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
    static Logger log = Logger.getLogger(WinRegistry.class, "Utilities");

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
            String ss = "Method: WinRegistry    Exception : " + e.getMessage();
            log.debug(ss);
        }
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

    public Map<String, String> readStringValues(int hkey, String key)
            throws IllegalArgumentException, IllegalAccessException,
            InvocationTargetException {
        if (hkey == HKEY_LOCAL_MACHINE) {
            return readStringValues(systemRoot, hkey, key);
        } else if (hkey == HKEY_CURRENT_USER) {
            return readStringValues(userRoot, hkey, key);
        } else {
            throw new IllegalArgumentException("hkey=" + hkey);
        }
    }

    public int setExpireDate() {
        Calendar expireDate = Calendar.getInstance();
        expireDate.getTime();
        long longDay = 24 * 60 * 60 * 1000;
        int validity = getproInfo.getValidity();
        getValue();
        String year = convertHexToString(InstalledDate).substring(0, convertHexToString(InstalledDate).length() - 4);
        String month = convertHexToString(InstalledDate).substring((convertHexToString(InstalledDate).length() - 4), (convertHexToString(InstalledDate).length() - 2));
        String day = convertHexToString(InstalledDate).substring(convertHexToString(InstalledDate).length() - 2, (convertHexToString(InstalledDate).length()));
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
            String ss = "Method: setExpireDate    Exception : " + e.getMessage();
            log.debug(ss);
        }
        if (validity != 0) {
            long trTime = TrialExpiry.getTime();
            TrialExpiry.setTime(trTime + validity * longDay);
            trialExpiry = daFormt.format(TrialExpiry);
        }
        trialDay = ((CurDate).getTime() - (insDate).getTime()) / (24 * 3600 * 1000);
        boolean bo;
        boolean bo1, bo2;
        expireDate.set(Integer.parseInt(year), Integer.parseInt(month) - 1, Integer.parseInt(day) - 1);
        bo = CurDate.after(TrialExpiry);
        bo1 = CurDate.before(insDate);
        bo2 = CurDate.equals(TrialExpiry);
        if (bo || bo1) {
            return 1;
        }
        return 0;
    }

    public List<String> readStringSubKeys(int hkey, String key)
            throws IllegalArgumentException, IllegalAccessException,
            InvocationTargetException {
        if (hkey == HKEY_LOCAL_MACHINE) {
            return readStringSubKeys(systemRoot, hkey, key);
        } else if (hkey == HKEY_CURRENT_USER) {
            return readStringSubKeys(userRoot, hkey, key);
        } else {
            throw new IllegalArgumentException("hkey=" + hkey);
        }
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

    public void deleteKey(int hkey, String key)
            throws IllegalArgumentException, IllegalAccessException,
            InvocationTargetException {
        int rc = -1;
        if (hkey == HKEY_LOCAL_MACHINE) {
            rc = deleteKey(systemRoot, hkey, key);
        } else if (hkey == HKEY_CURRENT_USER) {
            rc = deleteKey(userRoot, hkey, key);
        }
        if (rc != REG_SUCCESS) {
            throw new IllegalArgumentException("rc=" + rc + "  key=" + key);
        }
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

    private int deleteKey(Preferences root, int hkey, String key)
            throws IllegalArgumentException, IllegalAccessException,
            InvocationTargetException {
        int rc = ((Integer) regDeleteKey.invoke(root,
                new Object[]{new Integer(hkey), toCstr(key)})).intValue();
        return rc;
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

    private Map<String, String> readStringValues(Preferences root, int hkey, String key)
            throws IllegalArgumentException, IllegalAccessException,
            InvocationTargetException {
        HashMap<String, String> results = new HashMap<String, String>();
        int[] handles = (int[]) regOpenKey.invoke(root, new Object[]{
                    new Integer(hkey), toCstr(key), new Integer(KEY_READ)});
        if (handles[1] != REG_SUCCESS) {
            return null;
        }
        int[] info = (int[]) regQueryInfoKey.invoke(root,
                new Object[]{new Integer(handles[0])});
        int count = info[2];
        int maxlen = info[3];
        for (int index = 0; index < count; index++) {
            byte[] name = (byte[]) regEnumValue.invoke(root, new Object[]{
                        new Integer(handles[0]), new Integer(index), new Integer(maxlen + 1)});
            String value = readString(hkey, key, new String(name));
            results.put(new String(name).trim(), value);
        }
        regCloseKey.invoke(root, new Object[]{new Integer(handles[0])});
        return results;
    }

    private List<String> readStringSubKeys(Preferences root, int hkey, String key)
            throws IllegalArgumentException, IllegalAccessException,
            InvocationTargetException {
        List<String> results = new ArrayList<String>();
        int[] handles = (int[]) regOpenKey.invoke(root, new Object[]{
                    new Integer(hkey), toCstr(key), new Integer(KEY_READ)
                });
        if (handles[1] != REG_SUCCESS) {
            return null;
        }
        int[] info = (int[]) regQueryInfoKey.invoke(root,
                new Object[]{new Integer(handles[0])});
        int count = info[2];
        int maxlen = info[3];
        for (int index = 0; index < count; index++) {
            byte[] name = (byte[]) regEnumKeyEx.invoke(root, new Object[]{
                        new Integer(handles[0]), new Integer(index), new Integer(maxlen + 1)
                    });
            results.add(new String(name).trim());
        }
        regCloseKey.invoke(root, new Object[]{new Integer(handles[0])});
        return results;
    }

    private int[] createKey(Preferences root, int hkey, String key)
            throws IllegalArgumentException, IllegalAccessException,
            InvocationTargetException {
        return (int[]) regCreateKeyEx.invoke(root,
                new Object[]{new Integer(hkey), toCstr(key)});
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

    public String toHex(String arg) {
        try {
            convHex = String.format("%x", new BigInteger(arg.getBytes()));
        } catch (Exception e) {
            String ss = "Method: toHex    Exception : " + e.getMessage();
            log.debug(ss);
        }
        return convHex.toString();
    }

    public String convertHexToString(String hex) {
        StringBuilder sb = new StringBuilder();
        StringBuilder temp = new StringBuilder();
        if (getValue().get(0) == "NA") {
        } else {
            for (int i = 0; i < hex.length() - 1; i += 2) {
                String output = hex.substring(i, (i + 2));
                int decimal = Integer.parseInt(output, 16);
                sb.append((char) decimal);
                temp.append(decimal);
            }
        }
        return sb.toString();
    }

    public ArrayList getValue() {
        ArrayList a = new ArrayList();
        try {
//            InstalledDate = userRoot.get("Installed", defaultValue);
            InstalledDate = systemRoot.get("Installed", defaultValue);
            a.add(InstalledDate);
//            version = userRoot.get("Version", defaultValue);
            version = systemRoot.get("Version", defaultValue);
            a.add(version);
//            actKey = userRoot.get("KeyA", defaultValue);
            actKey = systemRoot.get("KeyA", defaultValue);
            a.add(actKey);
//            licHold = userRoot.get("LicHold", defaultValue);
            licHold = systemRoot.get("LicHold", defaultValue);
            a.add(licHold);
//            appPath = userRoot.get("AppPath", defaultValue);
            appPath = systemRoot.get("AppPath", defaultValue);
            a.add(appPath);
            userRoot.flush();
            systemRoot.flush();
        } catch (Exception e) {
            String ss = "Method: getValue    Exception : " + e.getMessage();
            log.debug(ss);
        }
        return a;
    }

    public String getCustvalue() {
        try {
            custName = userRoot.get("LicHold", defaultValue);
            custName = systemRoot.get("LicHold", defaultValue);
            userRoot.flush();
            systemRoot.flush();
        } catch (Exception e) {
            String ss = "Method: getCustvalue    Exception : " + e.getMessage();
            log.debug(ss);
        }
        return custName;
    }

    private byte[] toCstr(String str) {
        byte[] result = new byte[str.length() + 1];
        for (int i = 0; i < str.length(); i++) {
            result[i] = (byte) str.charAt(i);
        }
        result[str.length()] = 0;
        return result;
    }

    public String checkTrialDays() {
        int validity = getproInfo.getValidity();
        return String.valueOf(validity);
    }

    public String getValues(int regEntry, String FKey, String key) {
        String value = null;
        try {
            value = readString(regEntry, FKey, key);
        } catch (Exception e) {
            String ss = "Method: getValues    Exception : " + e.getMessage();
            log.debug(ss);
        }
        return value;
    }

    public String getExpiryDate() {
        String exp = "";
        long longDay = 24 * 60 * 60 * 1000;
        int validity = getproInfo.getValidity();
        int cnt = getproInfo.getLicenceCount();
        try {
            if (cnt > 0) {
                getValue();
                String insDate = convertHexToString(InstalledDate);
                if (insDate.trim().length() > 0) {
                    String year = insDate.substring(0, insDate.length() - 4);
                    String month = insDate.substring((insDate.length() - 4), (insDate.length() - 2));
                    String day = insDate.substring(insDate.length() - 2, (insDate.length()));
                    String insDateStr = year + "-" + month + "-" + day;

                    SimpleDateFormat daFormt = new SimpleDateFormat("yyyy-MM-dd");

//                    Date installDate = daFormt.parse(insDateStr);
                    Date TrialExpiry = daFormt.parse(insDateStr);
//                    Date CurDate = daFormt.parse(DateUtils.now("yyyy-MM-dd"));

                    if (validity != 0) {
                        long trTime = TrialExpiry.getTime();
                        TrialExpiry.setTime(trTime + (validity * longDay));
                        trialExpiry = daFormt.format(TrialExpiry);
                    }
                }
            }
        } catch (Exception e) {
            String ss = "Method: getExpiryDate    Exception : " + e.getMessage();
            log.debug(ss);
        }
        if (trialExpiry == null) {
        }
        return trialExpiry;
    }
    /*public static String getCustvalue() {
    String custName="";
    try {
    custName = systemRoot.get("LicHold", defaultValue);
    userRoot.flush();
    systemRoot.flush();
    } catch (Exception e) {
    String ss = "Method: getCustvalue    Exception : " + e.getMessage();
    log.debug(ss);
    }
    return custName;
    }*/

    public String getInstalledDay() {
        String installDay = "";
        try {
            installDay = userRoot.get("installedday", defaultValue);
            installDay = systemRoot.get("installedday", defaultValue);
            installDay = userRoot.get("installedday", defaultValue);            
            userRoot.flush();
            systemRoot.flush();
        } catch (Exception e) {
            String ss = "Method: getInstalledDay    Exception : " + e.getMessage();
            log.debug(ss);
        }
        installDay = "Monday";
        return installDay;
    }

    public String getActKey() {
        String custAct = "";
        try {
            //custAct = userRoot.get("KeyA", defaultValue);
            custAct = systemRoot.get("KeyA", defaultValue);
            userRoot.flush();
            systemRoot.flush();
        } catch (Exception e) {
            String ss = "Method: getCustvalue    Exception : " + e.getMessage();
            log.debug(ss);
        }
        return custAct;
    }
}
