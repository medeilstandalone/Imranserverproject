package com.vanuston.medeil.util;

import com.vanuston.medeil.controller.BillPrintController;
import java.io.*;
import java.util.HashMap;
import java.util.Scanner;
import javax.xml.parsers.*;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperPrintManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;

public class BillPrint {
 static Logger log = Logger.getLogger(BillPrint.class, "Utilities");
    static String billT;
    int customizeA5=0;

    public static boolean isExists() {
        boolean bo = false;
        try {
            BillPrintController printController  = new BillPrintController();
            int val = printController.isExists();
            if (val == 1) {
                    bo = true;
                }

        } catch (Exception ex) {
            log.debug( "Class : BillPrint Method  : isExists Exception :" + ex.getMessage());
        }
        return bo;
    }
    public static void jasperPrint(String billno, String billmodel) {
        try {

            File reportSource = new File("printerfiles/Print.jasper");
            DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
            builderFactory.setValidating(false);
            HashMap params1 = new HashMap();
            params1.put("billno", billno);
            params1.put("billmodel", billmodel);

            JasperReport jasperReport = (JasperReport) JRLoader.loadObject(reportSource);
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params1, DBConnection.getStatement().getConnection());
            JasperPrintManager.printReport(jasperPrint, false);
        } catch (Exception e) {
            log.debug( "Class : BillPrint Method  : jasperPrint   Exception :" +e.getMessage());
        }
    }

    public static void copyFile(File fromFile, File toFile) throws IOException {
        Scanner freader = new Scanner(fromFile);
        BufferedWriter writer = new BufferedWriter(new FileWriter(toFile));
        String line = null;
        while (freader.hasNextLine()) {
            line = freader.nextLine();
            writer.write(line);
            writer.newLine();
        }
        freader.close();
        writer.close();
    }

   
}
