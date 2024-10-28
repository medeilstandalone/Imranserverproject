package com.vanuston.medeil.util;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.TimeZone;

public class Logger {

    static String name = "";
    static Class module;
    protected static String defaultLogFile = "logs/probil_barcode.log";
    public Logger(String name, Class modName) {
        this.name = name;
        this.module = modName;
        initialize();
    }

    private void initialize() {
        try {
            File logDir = new File("logs");

            if (!logDir.exists()) {
                logDir.mkdir();
            }

        } catch (Exception e) {
            debug(e);
        }
    }
         public static void write(String s) throws IOException {
             writeFile(defaultLogFile, s);
        }

         public static void writeFile(String f, String s) throws IOException {
         TimeZone tz = TimeZone.getDefault();
         Date now = new Date();
         DateFormat df = new SimpleDateFormat ("dd-MM-yyyy   hh:mm:ss a");
         df.setTimeZone(tz);
         String currentTime = df.format(now);

         File dir = new File("logs");
         File logFile = new File(f);
         String[] cnt = dir.list();
         int l = cnt.length ;

         if(logFile.length()>=1048576){
            logFile.renameTo(new File("logs/probilz_barcode.log."+l));
         }
         FileWriter aWriter = new FileWriter(f, true);
         aWriter.write(currentTime +" | LoggerName : "+name+"  | " + s + "\n");
//         aWriter.write(currentTime +" | LoggerName : "+name+" | " + s + "\n");
         aWriter.flush();
         aWriter.close();
     }

    public static Logger getLogger(Class modName, String name) {
        return new Logger(name, modName);
    }

    public void debug(String msg) {
        try {
            write(msg);
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    public void debug(Exception msg) {
        try {
            write(msg.getMessage());
        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }
    public void debug(String className,String Method,String type){
        try {
            write(className + "-" + Method + "-" + type + "Free:"+Runtime.getRuntime().freeMemory()/(1024*1024)+", Total:"+Runtime.getRuntime().totalMemory()/(1024*1024) + ", Max"+Runtime.getRuntime().maxMemory()/(1024*1024));
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
}
