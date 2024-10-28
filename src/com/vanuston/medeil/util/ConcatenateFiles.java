package com.vanuston.medeil.util;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CommonImplements;
import java.io.*;
import java.sql.ResultSet;
import java.util.Vector;

public class ConcatenateFiles {

    static Logger log = Logger.getLogger(ConcatenateFiles.class, "Utilities");
    static String renamedFile = "";
    static String concatDate = "";
    static String fromDate = "";
    static String toDate = "";
    static String rsValue;
    public static int chkVal;
    static String filepath;
    static String docName;
    static String licName;
    static String s = "";

    public static boolean renameFileExtension(String source, String newExtension) {
        String target;
        String currentExtension = getFileExtension(source);

        if (currentExtension.equals("")) {
            target = source + "." + newExtension;
        } else {
            target = source.replaceAll("." + currentExtension, newExtension);
        }
        return new File(source).renameTo(new File(target));
    }

    public static String getFileExtension(String f) {
        String ext = "";
        int i = f.lastIndexOf('.');
        if (i > 0 && i < f.length() - 1) {
            ext = f.substring(i + 1).toLowerCase();
        }
        return ext;
    }

    public static String getFromTodate() {
        try {
            CommonImplements comImp = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
            int cnt = comImp.selectCountQuryExe("SELECT count(*) FROM backuplog_table");

            if (cnt <= 0) {
                String frm = comImp.getQueryValue("SELECT date(date_time) FROM license_details");
                String to = comImp.getQueryValue("SELECT DATE_SUB(curdate(),interval 1 day)");

//                    System.s
                concatDate = frm + "_" + to;//DateUtils.now("yyyy-MM-dd");
//                    ResultSet rs1 = DBConnection.getStatement().executeQuery("SELECT start_date,end_date from backuplog_table where curr_date='" + DateUtils.now("yyyy-MM-dd") + "'and start_date=(select max(start_date) from backuplog_table" + ")");
//                    while (rs.next()) {
//                        concatDate = rs1.getDate("start_date") + "_" + rs1.getDate("end_date");

//                    }
            } else {
                ResultSet rs = DBConnection.getStatement().executeQuery("SELECT start_date,end_date from backuplog_table where curr_date='" + DateUtils.now("yyyy-MM-dd") + "'and start_date=(select max(start_date) from backuplog_table" + ")");
                while (rs.next()) {
//                    if((rs.getDate("start_date") != null && rs.getDate("end_date") != null) || (!rs.getDate("start_date").equals("null") && !rs.getDate("end_date").equals("null"))) {
                    concatDate = rs.getDate("start_date") + "_" + rs.getDate("end_date");
                    
//                    }
                }
            }
        } catch (Exception e) {
            log.debug("Class : ConcatenateFiles  Method  : getFromTodate   Exception :" + e.getMessage());
        }
        return concatDate;
    }

    public static String getLICFT() {
//        licName="_" + WinRegistry.convertHexToString(WinRegistry.getCustvalue());
        WinRegistry winRegistry = new WinRegistry();
        String custName = "_" + winRegistry.convertHexToString(winRegistry.getCustvalue()) + "_" + getFromTodate();
        
        return custName;
    }

    public static void getBackup() {
        try {
            boolean count = false;
            if (!new File("updates//").exists()) {
                new File("updates").mkdirs();
                count = true;
            } else if (new File("updates//").exists()) {
                new File("updates").delete();
                count = false;
            }
            increBack();
//            if (count) {
//                increBack();
//            } else {
//                increBack();
//            }
        } catch (Exception e) {
            log.debug("Class : ConcatenateFiles  Method  : getBackup   Exception :" + e.getMessage());
        }
    }

    public static void increBack() {
        try {
            WinRegistry winRegistry = new WinRegistry();
            licName = "_" + winRegistry.convertHexToString(winRegistry.getCustvalue());
            Vector<String> vFiles = new Vector<String>();

            s = getFromTodate();

            File f = new File("updates/" + licName + "_" + s + ".txt");
            File sales = new File("updates/sales.txt");
            File purchase = new File("updates/purchases.txt");
            File customer = new File("updates/customer.txt");
            File doctor = new File("updates/doctor.txt");
            File distributor = new File("updates/distributor.txt");
            File drug = new File("updates/drugs.txt");

            sales.delete();
            purchase.delete();
            customer.delete();
            doctor.delete();
            distributor.delete();
            drug.delete();
            //f.delete();

            docName = licName + ".txt";
            filepath = new File("updates").getAbsolutePath().concat("\\").replace("\\", "\\\\");
//            String getFile=getFilePath();
            
            
            ResultSet rs = DBConnection.getStatement().executeQuery("CALL pro_backuppriorities('" + filepath + "');");
            while (rs.next()) {
                rsValue = rs.getString(1);
            }
            if (rsValue.equals("Data Empties in Sales,Purchase")) {
                chkVal = 0;
            } else if (rsValue.equals("Data Import Successfully finished")) {
                chkVal = 1;

                vFiles.add("updates/" + licName + "_" + s + ".txt");
                vFiles.add("updates/sales.txt");
                vFiles.add("updates/purchases.txt");
                vFiles.add("updates/customer.txt");
                vFiles.add("updates/doctor.txt");
                vFiles.add("updates/distributor.txt");
                vFiles.add("updates/drugs.txt");
                
                if (vFiles.size() > 8) {
                } else {
                    int nbFiles = vFiles.size();
                    PrintWriter saveAs = new PrintWriter(new FileOutputStream(vFiles.get(0)));
                    for (int i = 1; i < nbFiles; i++) {
                        System.out.print("Processing " + vFiles.get(i) + "... ");
                        BufferedReader readBuff = new BufferedReader(new FileReader(vFiles.get(i)));
                        String line = readBuff.readLine();

                        while (line != null) {
                            saveAs.println(line);//14  in 4 files
                            line = readBuff.readLine();
                        }
                        readBuff.close();

                    }
                    sales.delete();
                    purchase.delete();
                    customer.delete();
                    doctor.delete();
                    distributor.delete();
                    drug.delete();
                    saveAs.close();

                }
            }
        } catch (Exception e) {
            log.debug("Class : ConcatenateFiles  Method  : increBack   Exception :" + e.getMessage());
//            e.printStackTrace();
        }
    }

    public static String getFilePath() {
        WinRegistry winRegistry = new WinRegistry();
        licName = "_" + winRegistry.convertHexToString(winRegistry.getCustvalue());
        
        return filepath + licName + "_" + s;

    }
}
