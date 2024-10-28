/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.BillPrintDAO;

/**
 *
 * @author Administrator
 */
public class BillPrintController {

    public Boolean billPrintSetup (String billType,String col,String pageFormat, String imagePath){
        BillPrintDAO billPrint = new BillPrintDAO();
        boolean returnFlag = billPrint.billPrintSetup(billType, col,pageFormat, imagePath);
        return returnFlag;
    }
   public String getQueryValue1 (String billType){
        BillPrintDAO billPrint = new BillPrintDAO();
        String returnFlag = billPrint.getQueryValue1(billType);
        return returnFlag;
    }
   public String getQueryValue2 (String billType){
        BillPrintDAO billPrint = new BillPrintDAO();
        String returnFlag = billPrint.getQueryValue2(billType);
        return returnFlag;
    }
public String getQueryValue3 (String billType){
        BillPrintDAO billPrint = new BillPrintDAO();
        String returnFlag = billPrint.getQueryValue3(billType);
        return returnFlag;
    }
public int isExists (){
        BillPrintDAO billPrint = new BillPrintDAO();
        int returnFlag = billPrint.isExists();
        return returnFlag;
    }
}
