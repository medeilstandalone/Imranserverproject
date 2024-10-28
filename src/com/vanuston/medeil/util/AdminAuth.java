package com.vanuston.medeil.util;
import java.security.NoSuchAlgorithmException;
import java.util.Date;

public class AdminAuth {

    public static Boolean getAdminpwd(String pwd) throws NoSuchAlgorithmException {
        String[] stringMonthYearArray = new String[4];
        String[] pwdArray = new String[4];
        Boolean isEqual = false;

        Date date = new Date();
        String dateString = date.toString();        
        String[] stringArray = dateString.split(" ");
        
        
        stringMonthYearArray[0] = "Medeil";         pwdArray[0]=(pwd.startsWith("Medeil")?"Medeil":"");
        stringMonthYearArray[1] = stringArray[1];   pwdArray[1]=stringArray[1];
        stringMonthYearArray[2] = "Admin";          pwdArray[2]=(pwd.endsWith("Admin")?"Admin":"");
        stringMonthYearArray[3] = stringArray[5];   pwdArray[3]=stringArray[5];
        
        
        String string = getEncryption(stringMonthYearArray);
        if(string.equals(getEncryption(pwdArray))) {
            isEqual = true;
        }
        
        return isEqual;
    }
    public static boolean chkPwd(String pwd){
        Boolean isValid = false;
        try {
            isValid = getAdminpwd(pwd);
        }catch(Exception e){
            e.printStackTrace();
        }
        return isValid;
    }
    private static String getEncryption(String[] array) throws NoSuchAlgorithmException {
        String hexaFormatMessage = "";
        String concatString = array[0] + array[1] + array[2] + array[3];
        byte[] buffer = concatString.getBytes();
        java.security.MessageDigest messageDigest = java.security.MessageDigest.getInstance("SHA-256");
        messageDigest.update(buffer);
        byte[] messageDigestBytes = messageDigest.digest();
        for (int index = 0; index < messageDigestBytes.length; index++) {
            int countEncode = messageDigestBytes[index] & 0xff;
            if (Integer.toHexString(countEncode).trim().length() == 1) {
                hexaFormatMessage = hexaFormatMessage + "0";
            }
            hexaFormatMessage = hexaFormatMessage + Integer.toHexString(countEncode);
        }
        int length = hexaFormatMessage.trim().length() - 1;
        String pwString = "";
        int j = 1;
        for (int i = 1; i <= 8; i++) {
            pwString += hexaFormatMessage.charAt(length);
            if (j == 4 && i < 8) {
                pwString = pwString + "-";
                j = 0;
            }
            length = Math.abs(length - 8);
            j++;
        }
        return pwString;
    }
}
