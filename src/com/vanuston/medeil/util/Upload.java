package com.vanuston.medeil.util;

import java.io.*;

public class Upload {

    static Logger log = Logger.getLogger(Upload.class, "Utilities");

    public static void copy(File src, File dst) throws IOException {
        InputStream in = new FileInputStream(src);
        OutputStream out = new FileOutputStream(dst);
        byte[] buf = new byte[1024];
        int len;
        while ((len = in.read(buf)) > 0) {
            out.write(buf, 0, len);
        }
        in.close();
        out.close();
    }

    public static void copyfile(String srFile, String dtFile) throws IOException {
        try {
            File f1 = new File(srFile);
            File f2 = new File(dtFile);
            copy(f1, f2);
        } catch (FileNotFoundException ex) {
            String ss = "Method: copyfile    Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }
}
