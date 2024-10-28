package com.vanuston.medeil.util;

import java.text.DateFormat;
import java.text.ParseException;
import java.util.Calendar;
import java.text.SimpleDateFormat;
import java.util.Date;
public class DateUtils {
 static Logger log = Logger.getLogger(DateUtils.class, "Utilities");

    public static String now(String dateFormat) {
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
        return sdf.format(cal.getTime());
    }

    public static String formatConverter(String date, int currentFormat, int newFormat) throws Exception {
        if (!((currentFormat == DateFormat.LONG || currentFormat == DateFormat.FULL || currentFormat == DateFormat.MEDIUM || currentFormat == DateFormat.SHORT)
                && (newFormat == DateFormat.LONG || newFormat == DateFormat.FULL || newFormat == DateFormat.MEDIUM || newFormat == DateFormat.SHORT))) {
            throw new Exception("Invalid argument");
        }
        DateFormat newdate = null;
        Date d = null;
        try {
            DateFormat df = SimpleDateFormat.getDateInstance(currentFormat);
            d = df.parse(date);
            newdate = DateFormat.getDateInstance(newFormat);
        } catch (Exception ex) {
        }
        return newdate.format(d);
    }

    public static Date monthYr(String dateFormat) {
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
        Date da = null;
        try {
            da = sdf.parse(cal.getTime().toString());
        } catch (ParseException ex) {
            log.debug( "Class : DateUtils  Method  : monthYr Exception :" +ex.getMessage());
        }
        return da;
    }

    public static String currTime(String dateFormat) {
        Calendar cal = Calendar.getInstance();
        SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
        return sdf.format(cal.getTime());
    }

    public static String changeFormatDate(Date da) {
        if (da != null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            return sdf.format(da);
        } else {
            return null;
        }
    }

    public static String changeFormatDate(String da) {
        if (da != null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
            SimpleDateFormat sdf1 = new SimpleDateFormat("dd-MM-yyyy");
            Date date = null;
            try {
                date = sdf1.parse(da);
            } catch (Exception ex) {
            }
            return sdf.format(date);
        } else {
            return null;
        }
    }

    public static String changeFormatExpDate(Date da, String format) {
        if (da != null) {
            SimpleDateFormat sdf = new SimpleDateFormat(format);
            return sdf.format(da);
        } else {
            return null;
        }
    }

    public static String normalFormatExpDate(String date) {
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
        Date da = null;
        try {
            da = sdf1.parse(date);
        } catch (ParseException ex) {
            log.debug( "Class : DateUtils  Method  : normalFormatExpDate Exception :" +ex.getMessage());
        }
        if (da != null) {
            SimpleDateFormat sdf = new SimpleDateFormat("MMM-yyyy");
            return sdf.format(da);
        } else {
            return null;
        }
    }

    public static String normalFormatPurcExpDate(String date) {
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
        Date da = null;
        try {
            da = sdf1.parse(date);
        } catch (ParseException ex) {
            log.debug( "Class : DateUtils  Method  : normalFormatPurcExpDate Exception :" +ex.getMessage());
        }
        if (da != null) {
            SimpleDateFormat sdf = new SimpleDateFormat("MM-yyyy");
            return sdf.format(da);
        } else {
            return null;
        }
    }

    public static String normalFormatExpDate(Date date) {
        Date da = date;
        if (da != null) {
            SimpleDateFormat sdf = new SimpleDateFormat("MMM-yyyy");
            return sdf.format(da);
        } else {
            return null;
        }
    }

    public static String changeFormatExpDate(Date date) {
        Date da = date;
        if (da != null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
            return sdf.format(da);
        } else {
            return null;
        }
    }

    public static String changeFormatExpDate(String date) {
        SimpleDateFormat sdf1 = new SimpleDateFormat("MMM-yyyy");
        Date da = null;
        try {
            da = sdf1.parse(date);
        } catch (ParseException ex) {
            log.debug( "Class : DateUtils  Method  : changeFormatExpDate Exception :" +ex.getMessage());
        }
        if (da != null) {
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM");
            return sdf.format(da);
        } else {
            return null;
        }
    }

    public static String changeFormatExpDate(String date, String format) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        SimpleDateFormat sdf1 = new SimpleDateFormat(format);
        Date da = null;
        try {
            da = sdf.parse(date);
        } catch (ParseException ex) {
            log.debug( "Class : DateUtils  Method  : changeFormatExpDate Exception :" +ex.getMessage());
        }
        if (da != null) {
            return sdf1.format(da);
        } else {
            return null;
        }
    }

    public static String normalFormatDate(Date da) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        return sdf.format(da);
    }

    public static Date normalStringToDate(String da) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        Date dat = null;
        try {
            dat = sdf.parse(da);
        } catch (ParseException ex) {
            log.debug( "Class : DateUtils  Method  : normalStringToDate Exception :" +ex.getMessage());
        }
        return dat;
    }
    public static Date chngeFormatStringToDate(String da) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date dat = null;
        try {
            dat = sdf.parse(da);
        } catch (ParseException ex) {
            log.debug( "Class : DateUtils  Method  : chngeFormatStringToDate Exception :" +ex);
        }
        return dat;
    }

    public static Date normalExpDateStringToDate(String da) {
        SimpleDateFormat sdf = new SimpleDateFormat("MMM-yyyy");
        Date dat = null;
        try {
            dat = sdf.parse(da);
        } catch (ParseException ex) {
            log.debug( "Class : DateUtils  Method  : normalExpDateStringToDate Exception :" +ex.getMessage());
        }
        return dat;
    }

    public static Date normalExpDateFullStringToDate(String da) {
        DateFormat sdf = DateFormat.getDateInstance();
        Date dat = null;
        try {
            dat = sdf.parse(da);
        } catch (ParseException ex) {
            log.debug( "Class : DateUtils  Method  : normalExpDateFullStringToDate Exception :" +ex.getMessage());
        }
        return dat;
    }

    public static String normalFullDateToShort(Date da) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        String s = sdf.format(da);
        return s;
    }

    public static String normalFormatDate(String da) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd");
        String date = null;
        try {
            date = sdf.format(sdf1.parse(da));
        } catch (ParseException ex) {
            log.debug( "Class : DateUtils  Method  : normalFormatDate Exception :" +ex.getMessage());
        }
        return date;
    }

    public static String normalFormatDate1(Date da) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
        return sdf.format(da);
    }
}
