/*
 *   PROBILZ – Retail Management System (RMS) To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.util;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;


/**
 *
 * @author san
 */
public class LabelPrintConfig {
    static Logger log = Logger.getLogger(LabelPrintConfig.class, "LabelPrintConfig");

    public Boolean createLabelPrintConfig (String[] labelPrintConfig) {
        Boolean isCreate = false ;
        try {
            File configDir = new File("config") ;
            String file = "config/LabelPrintConfig.txt" ;
            File configFile = new File ("config/LabelPrintConfig.txt") ;
            if (! configDir.exists())
                configDir.mkdirs();
            FileWriter fileWritter = new FileWriter (file, isCreate) ;
            fileWritter.write (
                    labelPrintConfig[0]+","+
                    labelPrintConfig[1]+","+
                    labelPrintConfig[2]+","+
                    labelPrintConfig[3]+","+
                    labelPrintConfig[4]+","+
                    labelPrintConfig[5]+","+
                    labelPrintConfig[6]+","+
                    labelPrintConfig[7] ) ;
            fileWritter.flush () ;
            fileWritter.close () ;
            FileReader reader = new FileReader (file) ;
            int count = 0 ;
            while (reader.read() != -1)
                count += 1 ;
            if (count != 0)
                isCreate =  true ;
            reader.close();
        } catch (IOException ex) {
            log.debug ("Class : LabelPrintConfig  Method  : createLabelPrintConfig() Exception:" + ex.getMessage ()) ;
        }
        return isCreate ;
    }
    public String getLabelPrintConfig () {
        String labelPrintConfig = "";
        try {
            File configFile = new File("config/LabelPrintConfig.txt") ;
            if (! configFile.exists()){
                createLabelPrintConfig("select,1,0,0,0,0,0,0".split(","));
            }
            BufferedReader br = new BufferedReader(new FileReader(configFile));
            String s;
            while ((s = br.readLine()) != null) {
                labelPrintConfig = s ;
            }
        } catch (Exception e) {
           log.debug("LabelPrintConfig getLabelPrintConfig: "+e.getMessage());
//            e.printStackTrace();
        }
        return labelPrintConfig ;
    }

}

