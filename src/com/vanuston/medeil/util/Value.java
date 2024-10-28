package com.vanuston.medeil.util;


import java.text.DecimalFormat;

public class Value {

    public static double Round(double Rval, int Rpl) {
        double p = (double) Math.pow(10, Rpl);
        Rval = Rval * p;
        double tmp = Math.round(Rval);
        return (double) tmp / p;
    }

    public static String Round(double Rval) {
        DecimalFormat df = new DecimalFormat("#0.00");
        return df.format(Rval);
    }

    public static String Round(String Rval) {
        if(Rval.trim().length()<=0)
            Rval="0";
        return Round(Double.parseDouble(Rval));
    }

    public static String Round(Object Rval) {
        if (Rval != null) {
            return Round(Double.parseDouble(Rval.toString()));
        }
        return null;
    }

    public static double Round(double Rval, int n, int nn) {
        DecimalFormat df = null;
        String deciFormt = "#0.0";
        double dVal = 0.0;
        if (n > 1) {
            for (int i = 1; i < n; i++) {
                deciFormt = deciFormt.concat("0");
            }
            df = new DecimalFormat(deciFormt);
        } else {
            df = new DecimalFormat(deciFormt);
        }
        if (df != null) {
            dVal = Double.parseDouble(df.format(Rval));
        }
        return dVal;
    }

    public static String Round(String Rval, int n) {
        return Round(Round(Double.parseDouble(Rval), n, 0));
    }

    public static double roundToWholeVal(String ss) {
        double retVal = Double.parseDouble(ss);
        ss = Round(ss);
        int totL = ss.trim().length();
        String[] s = {ss.substring(0, (totL - 3)), ss.substring((totL - 2), totL)};//ss.split(".");
        int len = s.length;
        if (len > 1) {
            int val = Integer.parseInt(s[1]);
            if (val < 50) {
                retVal = Integer.parseInt(s[0]);
            } else {
                int v = Integer.parseInt(s[0]) + 1;
                retVal = v;
            }
        }
        return retVal;
    }

    public static double roundToWholeVal(double sd) {
        double retVal = 0.00;
        String ss = "" + sd;
        int dot = ss.indexOf(".");
        int val = Integer.parseInt("" + ss.charAt(dot + 1));
        double value = sd;
        if (val < 5) {
            retVal = Math.floor(Round(value, 2));
        } else if (val >= 5) {
            retVal = Math.ceil(Round(value, 2));
        }
        return retVal;
    }
    public static double roundToHalfVal(String ss) {
        double retVal = Double.parseDouble(ss);
        ss = Round(ss);
        int totL = ss.trim().length();
        String[] s = {ss.substring(0, (totL - 3)), ss.substring((totL - 2), totL)};//ss.split(".");
        int len = s.length;
        if (len > 1) {
            int val = Integer.parseInt(s[1]);
            if (val <= 25) {
                retVal = Integer.parseInt(s[0]);
            }
            else if(val > 26 && val <=75) {
                retVal = Integer.parseInt(s[0])+.50;
            }
            else {
                int v = Integer.parseInt(s[0]) + 1;
                retVal = v;
            }
        }
        return retVal;
    }

    public static double Round(double d, double d0, int i) {
        throw new UnsupportedOperationException("Not yet implemented");
    }
}
