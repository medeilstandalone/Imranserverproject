package com.vanuston.medeil.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

public class Autobackup {

    static Logger log = Logger.getLogger(Autobackup.class, "Utilities");
    static String todyTime = DateUtils.now("HHmmss");
    static String today = DateUtils.now("dd-MM-yyyy");
    static String[] ignoreTable = {"medil.drug_temp", "medil.banned_drug", "medil.countries", "medil.state", "medil.license_details", "medil.therapeutics", "medil.formulations", "medil.user_info", "medil.user_login"};

    public static void usingDump() {
        String dbName = "medil";
        String dbUser = "root";
        String temp = new LogReg().temp();
        String fullBackUpPath = "";
        try {
            int processComplete = 0;
            String executeCmd = "";
            boolean count = false;
            File absPath = new File(DriveTypeInfo.getAutoBackupPath() + "Medeil\\");
            if (!absPath.exists()) {
                absPath.mkdirs();
            }
            fullBackUpPath = absPath.getAbsolutePath().replaceAll("\\\\", "/") + "/autobackup/";
            File baseDir = new File(fullBackUpPath);
            if (!baseDir.exists()) {
                baseDir.mkdirs();
            }
            File tFolder = new File(fullBackUpPath + today + "/");
            if (!tFolder.exists()) {
                tFolder.mkdir();
            }
            String fileName = fullBackUpPath + today + "/NewProject" + today + todyTime + ".sql";
            executeCmd = "Data\\bin\\mysqldump -u" + dbUser + " -p" + temp + " " + "--no-create-info --no-create-db --replace --complete-insert --extended-insert --skip-triggers --skip-disable-keys --skip-set-charset --skip-add-locks --no-set-names --quick " + getIgnoreTable() + " " + dbName + " -r \"" + fileName + "\"";
            Process runtimeProcess = Runtime.getRuntime().exec(executeCmd);
            try {
                processComplete = runtimeProcess.waitFor();
            } catch (InterruptedException ex) {
                log.debug("Class : Autobackup  Method  :usingDump Exception:" + ex.getMessage());
            }
            zipFileConvertion();
        } catch (Exception e) {
            log.debug("Class : Autobackup  Method  :usingDump  Exception:" + e.getMessage());
        }
    }

    public static ArrayList getFile() {
        ArrayList fileList = new ArrayList();
        File file[] = null;
        String name = null;
        String s = null;
        String fullBackUpPath = "";
        File absPath = new File(DriveTypeInfo.getAutoBackupPath() + "Medeil\\");

        fullBackUpPath = absPath.getAbsolutePath().replaceAll("\\\\", "/") + "/autobackup/";
        try {
            // Please Give Source File Path Here
            name = fullBackUpPath + today + "/";
            if (new File(name).exists()) {
                file = new File(name).listFiles();
                for (int i = 0; i < file.length; i++) {
                    s = file[i].getName();
                    fileList.add(s);
                }
            }
        } catch (Exception e) {
            String msg = "Class : AutoBackUp  Method : getFile()   = ".concat(e.getMessage());
            log.debug(msg);
        }
        return fileList;
    }

    public static void zipFileConvertion() {
        ArrayList fileList = new ArrayList();
        byte[] buf = new byte[1024];
        try {
            String fullBackUpPath = "";
            File absPath = new File(DriveTypeInfo.getAutoBackupPath() + "Medeil\\");

            fullBackUpPath = absPath.getAbsolutePath().replaceAll("\\\\", "/") + "/autobackup/";
            // Please Give Here the Path Where the rar file is Stored.
            ZipOutputStream zipFormat = new ZipOutputStream(new FileOutputStream(fullBackUpPath + today + ".rar"));
            fileList = getFile();
            for (int i = 0; i < fileList.size(); i++) {
                String fName = (String) fileList.get(i);
                // Here also Give the Source File Path with the File Name is add to rar Folder.
                FileInputStream in = new FileInputStream(fullBackUpPath + today + "/" + fName);
                zipFormat.putNextEntry(new ZipEntry(fullBackUpPath + today + "/" + fName));
                int len = 0;
                while ((len = in.read(buf)) > 0) {
                    zipFormat.write(buf, 0, len);
                }
                zipFormat.closeEntry();
                in.close();
            }
            zipFormat.close();
        } catch (Exception e) {
            String msg = "Class : AutoBackUp  Method : zipFileConvertion()   = ".concat(e.getMessage());
            log.debug(msg);
        }
    }

    static String getIgnoreTable() {
        String retVal = "";
        for (int i = 0; i < ignoreTable.length; i++) {
            retVal += "--ignore-table=" + ignoreTable[i] + " ";
        }
        return retVal;
    }
}
