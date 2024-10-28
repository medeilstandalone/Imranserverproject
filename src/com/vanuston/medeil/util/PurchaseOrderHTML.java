package com.vanuston.medeil.util;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class PurchaseOrderHTML {
    public static Logger log = Logger.getLogger(PurchaseOrderHTML.class, "Utilities");
    public PurchaseOrderHTML(String fileName, String msg) {
        try {
            File f;
            String fileN = "html\\".concat(fileName);
            f = new File(fileN);
            if (!f.exists()) {
                f.createNewFile();
                FileWriter fstream = new FileWriter(fileN);
                BufferedWriter out = new BufferedWriter(fstream);
                out.write(msg);
                out.close();
            }
        } catch (IOException e) {
         log.debug("Class : PurchaseOrderHTML Method  : PurchaseOrderHTML  Exception:"+e.getMessage());
        }

    }
}
