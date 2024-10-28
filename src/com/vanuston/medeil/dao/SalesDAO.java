/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.dao;

import com.vanuston.medeil.implementation.Sales;
import com.vanuston.medeil.model.CreditNoteModel;
import com.vanuston.medeil.model.SalesModel;
import com.vanuston.medeil.model.StockModel;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.List;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Logger;
import java.util.ArrayList;
import com.vanuston.medeil.util.Value;
import java.io.File;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Vector;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import javax.xml.parsers.DocumentBuilderFactory;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperPrintManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;



/**
 *
 * @author Administrator
 */
public class SalesDAO implements Sales {
    static Logger log=Logger.getLogger(SalesDAO.class,"com.vanuston.medeil.dao.SalesDAO");
    public int getCntFnRow;
    private Object dataa;
    private int index;

    //Temporary Stock table insertion
    @Override
    public boolean insertTempStock(SalesModel sales) {
        boolean insertFlag = false;
        SalesModel tempSales = sales;
        try {

            DBConnection.getStatement().executeUpdate("INSERT INTO temp_stocks (item_code,item_name,batch_no,qty,packing,expiry_date,mrp,cdate,temp_flag_id) values('" + tempSales.getItemCode() + "','" + tempSales.getItemName() + "','" + tempSales.getBatchNumber() + "','" + tempSales.getQuantity() + "','" + tempSales.getPacking() + "','" + tempSales.getExpiryDate() + "','" + tempSales.getMrp() + "',curdate(),'0')");
            insertFlag =true;
        }
        catch(Exception ex) {
           
            String msg = "Class :SalesDAO  Method : insertTempStock Exception : " + ex.getMessage();
            log.debug(msg);
        }
        return insertFlag;
    }
    //---------------------------------------------------------------------------me----------------------------
//
//    public boolean stockSub(SalesModel model) {
//    ResultSet rs = null;
//    int oldStockQty = 0;
//    int newStockQty = 0;
//    int oldSoldQty = 0;
//    int adjid = 0;
//    int oldStockfQty = 0;
//    int newStockfQty = 0;
//    int oldSoldfQty = 0;
//    String itemName = "";
//    Boolean updateFlag = false;
//    try {
//        if (!model.getUpdateFlag().equals("true")) {
//            rs = DBConnection.getStatement().executeQuery("select item_name, item_code, batch_no, qty, total_items from sales_" + model.getTableName() + " where bill_no='" + model.getBillNumber() + "'");
//        } else {
//            rs = DBConnection.getStatement().executeQuery("select item_name, item_code, batch_no, qty, total_items, adj_id from sales_return where sales_return_no='" + model.getSalesReturnNumber() + "'");
//        }
//        while (rs.next()) {
//            model.setOldItemCode(rs.getString("item_code"));
//            model.setOldQty(rs.getInt("qty"));
//            model.setOldBatch(rs.getString("batch_no"));
//            itemName = rs.getString("item_name");
//            adjid = rs.getInt("adj_id");
//
//            StockDAO stock = new StockDAO();
//            String stkQty = stock.getStockQty(model.getOldItemCode(), model.getOldBatch());
//            String stkFQty = stock.getStockFQty(model.getOldItemCode(), model.getOldBatch()); // Assuming you have a method getStockFQty to get fqty
//
//            if (stkQty != null && !stkQty.equals("null") && !stkQty.trim().equals("")) {
//                oldStockQty = Integer.parseInt(stkQty);
//            }
//            if (stkFQty != null && !stkFQty.equals("null") && !stkFQty.trim().equals("")) {
//                oldStockfQty = Integer.parseInt(stkFQty);
//            }
//
//            oldSoldQty = model.getOldQty();
//            newStockQty = oldStockQty - oldSoldQty;
//            oldSoldfQty = model.getGetOldFQty(); // Assuming model has getOldFQty() method
//            newStockfQty = oldStockfQty - oldSoldfQty;
//
//            if (adjid == 0) {
//                DBConnection.getStatement().executeUpdate("update stock_statement set qty='" + newStockQty + "', fqty='" + newStockfQty + "' where item_code='" + model.getOldItemCode() + "' and batch_no='" + model.getOldBatch() + "'");
//                String sql1 = "insert into stock_register values(now(),'" + model.getOldItemCode() + "','" + itemName + "','" + model.getOldBatch() + "','" + oldStockQty + "','" + oldSoldQty + "','" + newStockQty + "','Sales Maintenance (-)','" + model.getBillNumber() + "')";
//                DBConnection.getStatement().executeUpdate(sql1);
//            } else {
//                int adjQty = 0;
//                int physcialQty = 0;
//                ResultSet rs1 = DBConnection.getStatement().executeQuery("select adjusted_stock as qty, physical_stock from stock_adjustment where id='" + adjid + "'");
//                while (rs1.next()) {
//                    adjQty = rs1.getInt("qty");
//                    physcialQty = rs1.getInt("physical_stock");
//                    newStockQty = adjQty + model.getOldQty();
//                    physcialQty = physcialQty + model.getOldQty();
//                    DBConnection.getStatement().executeUpdate("update stock_adjustment set adjusted_stock='" + newStockQty + "', physical_stock='" + physcialQty + "' where id='" + adjid + "'");
//                }
//            }
//        }
//        updateFlag = true;
//    } catch (Exception ex) {
//        String msg = "Class :SalesDAO  Method : stockSub Exception : " + ex.getMessage();
//        log.debug(msg);
//    }
//    return updateFlag;
//}
//--------------------------------------------------------------me------------------------------------------------

























//-------------------------------------------------------------------------------------------------------------------------
    //Stock subtraction
    @Override
    public boolean stockSub(SalesModel model)

    {
        System.out.println("ppppppppppppp");
       ResultSet rs=null;
       int oldStockQty=0;
       int newStockQty=0;
       int oldSoldQty=0;
       int adjid=0;
       String itemName = "";
       Boolean updateFlag=false;
         System.out.println("pppp");
        try {
            if(!model.getUpdateFlag().equals("true")) {
                rs = DBConnection.getStatement().executeQuery("select item_name,item_code,batch_no,qty,total_items from sales_" + model.getTableName() + " where bill_no='" + model.getBillNumber() + "'");
            }
            else{
                rs = DBConnection.getStatement().executeQuery("select item_name,item_code,batch_no,qty,total_items,adj_id from sales_return where sales_return_no='" + model.getSalesReturnNumber() + "'");
            }
            while(rs.next()) {
                model.setOldItemCode(rs.getString("item_code"));
                model.setOldQty(rs.getInt("qty"));
                model.setOldBatch(rs.getString("batch_no"));
                itemName = rs.getString("item_name");
                adjid=rs.getInt("adj_id");
                if(adjid==0) {
                    StockDAO stock=new StockDAO();
                    String stkQty = stock.getStockQty(model.getOldItemCode(),model.getOldBatch());
                    if(stkQty!=null && !stkQty.equals("null") && !stkQty.trim().equals("")) {
                        oldStockQty=Integer.parseInt(stock.getStockQty(model.getOldItemCode(),model.getOldBatch()));
                    }
                    System.out.println("pppppppp777ppppp");
                    oldSoldQty=model.getOldQty();
                    newStockQty=oldStockQty-oldSoldQty;
                    DBConnection.getStatement().executeUpdate("update stock_statement set qty='" + newStockQty + "' where item_code='"+model.getOldItemCode()+"' and batch_no='"+model.getOldBatch()+"'");
                    String sql1 = "insert into stock_register values(now(),'"+model.getOldItemCode()+"','"+itemName+"','"+model.getOldBatch()+"','"+oldStockQty+"','"+oldSoldQty+"','"+newStockQty+"','Sales Maintenance (-)','"+model.getBillNumber()+"')";
                    DBConnection.getStatement().executeUpdate(sql1);
                      System.out.println("9090");
                }
                else {
                    int adjQty=0;
                    int physcialQty=0;
                    ResultSet rs1=DBConnection.getStatement().executeQuery("select adjusted_stock as qty,physical_stock from stock_adjustment where id='"+adjid+"'");
                    while(rs1.next()) {
                        adjQty=rs1.getInt("qty");
                        physcialQty=rs1.getInt("physical_stock");
                        newStockQty=adjQty+model.getOldQty();
                        physcialQty=physcialQty+model.getOldQty();
                        DBConnection.getStatement().executeUpdate("update stock_adjustment set adjusted_stock='" + newStockQty + "',physical_stock='"+physcialQty+"' where id='"+adjid+"'");
                    }

                }
            }
            updateFlag=true;
        }
        catch (Exception ex) {
            String msg = "Class :SalesDAO  Method : stockSub Exception : " + ex.getMessage();
            log.debug(msg);
        }
      return updateFlag;
    }
//------------------------------------------------------------------------------------

    //Stock Addition while updating in Sales Maintenance
    //Method purpose : While updating in sales maintenance, the rows in sales bills are deleted. So stock is added back
    @Override
    public boolean stockAdd(SalesModel model)
    {
          System.out.println("Slaesmodel3");
        ResultSet rs=null;
        int oldStockQty=0;
       int  oldStockpackQty=0;
        int newStockQty=0;
        int oldSoldQty=0;
         int oldpackSoldQty=0;
        int retQty=0;
        int adjid=0;
        String itemName = "";
        Boolean updateFlag=false;
        try
        {
            if(!model.getBillType().equals("counter"))
            {
              rs=DBConnection.getStatement().executeQuery("select s.item_name as item_name,s.item_code as item_code,s.batch_no as batch_no,s.qty as qty, s.total_items as total_items,s.adj_id,"
                      + "coalesce(sr.qty,0) as retqty,s.fqty as fqty from sales_"+model.getBillType()+"_bill"+" s left join sales_return sr on s.bill_no=sr.bill_no and s.batch_no=sr.batch_no and s.item_code=sr.item_code "
                      + "and s.item_name=sr.item_name where s.bill_no='"+model.getBillNumber()+"'");
            }
            else
            {
              rs=DBConnection.getStatement().executeQuery("select s.item_name as item_name,s.item_code as item_code,s.batch_no as batch_no,s.qty as qty,s.total_items as total_items,0 as adj_id,"
                      + "coalesce(sr.qty,0) as retqty from sales_accounts s left join sales_return sr on s.bill_no=sr.bill_no and s.batch_no=sr.batch_no and s.item_code=sr.item_code and "
                      + "s.item_name=sr.item_name where s.bill_no='"+model.getBillNumber()+"'");
            }
            while(rs.next())
            {
                  System.out.println("Stockaddedl3");
                model.setOldItemCode(rs.getString("item_code"));
                model.setOldQty(rs.getInt("qty"));
                model.setGetOldFQty(rs.getInt("fqty"));
               // model.setOldQty(rs.getInt("fqty"));
                System.out.println("klis");
                    //System.out.println((rs.getInt("fqty")));
                model.setOldBatch(rs.getString("batch_no"));
                itemName = rs.getString("item_name");
                retQty = rs.getInt("retqty");
                adjid=rs.getInt("adj_id");
                  StockDAO stock=new StockDAO();
                    String stkQty = stock.getStockQty(model.getOldItemCode(),model.getOldBatch());
                        System.out.println("Stockaddedl3");
                             System.out.println(stkQty);


                    if(stkQty!=null && !stkQty.equals("null") && !stkQty.trim().equals("")) {
                        oldStockQty=Integer.parseInt(stock.getStockQty(model.getOldItemCode(),model.getOldBatch()));
                        oldStockpackQty=Integer.parseInt(stock.getStockpackQty(model.getOldItemCode(),model.getOldBatch()));
                    System.out.println(oldStockQty);
                    }
                             System.out.println("oldStockQty             ="+oldStockQty);
                                          System.out.println("venkat");
                                        System.out.println(model.getGetOldFQty());
                                        System.out.println(oldStockpackQty);
                    oldSoldQty=model.getOldQty();
                    oldpackSoldQty=model.getGetOldFQty() * oldStockpackQty;
                                        System.out.println("oldStockQty             ="+oldStockQty);
                                          System.out.println("venkat");
                                        System.out.println(model.getGetOldFQty());
                                        System.out.println(model.getPacking());
                    newStockQty=oldStockQty+oldSoldQty-retQty+oldpackSoldQty;
                    DBConnection.getStatement().executeUpdate("update stock_statement set qty='" + newStockQty + "',ss_flag_id = 0 where item_code='"+model.getOldItemCode()+"' and batch_no='"+model.getOldBatch()+"'");
                    if(!model.getFormType().equals("cancelbill")) {
                        String sql1 = "insert into stock_register values(now(),'"+model.getOldItemCode()+"','"+itemName+"','"+model.getOldBatch()+"','"+oldStockQty+"','"+(oldSoldQty-retQty)+"','"+newStockQty+"','Sales Maintenance (+)','"+model.getBillNumber()+"')";
                        DBConnection.getStatement().executeUpdate(sql1);
                    }
                if(adjid==0) {
//                    StockDAO stock=new StockDAO();
//                    String stkQty = stock.getStockQty(model.getOldItemCode(),model.getOldBatch());
//                        System.out.println("Stockaddedl3");
//                             System.out.println(stkQty);
//                    if(stkQty!=null && !stkQty.equals("null") && !stkQty.trim().equals("")) {
//                        oldStockQty=Integer.parseInt(stock.getStockQty(model.getOldItemCode(),model.getOldBatch()));
//                    System.out.println(oldStockQty);
//                    }
//                    oldSoldQty=model.getOldQty();
//                                        System.out.println("oldStockQty             ="+oldStockQty);
//                    newStockQty=oldStockQty+oldSoldQty-retQty;
//                    DBConnection.getStatement().executeUpdate("update stock_statement set qty='" + newStockQty + "',ss_flag_id = 0 where item_code='"+model.getOldItemCode()+"' and batch_no='"+model.getOldBatch()+"'");
//                    if(!model.getFormType().equals("cancelbill")) {
//                        String sql1 = "insert into stock_register values(now(),'"+model.getOldItemCode()+"','"+itemName+"','"+model.getOldBatch()+"','"+oldStockQty+"','"+(oldSoldQty-retQty)+"','"+newStockQty+"','Sales Maintenance (+)','"+model.getBillNumber()+"')";
//                        DBConnection.getStatement().executeUpdate(sql1);
//                    }
                }
                else {
                    int adjQty=0;
                    int physcialQty=0;
                    ResultSet rs1=DBConnection.getStatement().executeQuery("select adjusted_stock as qty,physical_stock from stock_adjustment where id='"+adjid+"'");
                    while(rs1.next()) {
                        adjQty=rs1.getInt("qty");
                        physcialQty=rs1.getInt("physical_stock");
                        newStockQty=adjQty-model.getOldQty();
                        physcialQty=physcialQty-model.getOldQty();
                        DBConnection.getStatement().executeUpdate("update stock_adjustment set adjusted_stock='" + newStockQty + "',physical_stock='"+physcialQty+"' where id='"+adjid+"'");
                    }                    
                }                
            }
            updateFlag=true;
        }
        catch(Exception ex) {           
            String msg = "Class :SalesDAO  Method : stockAdd()  Exception: " + ex.getMessage();
            log.debug(msg);
        }
        return updateFlag;
    }
    
    @Override
    public Object viewAllRecords() {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    //Save sales bill, sales return.
    //Sales cash,card or credit bill tables are inserted first. Then sales maintenance table is inserted.
//    @Override
//    public Object createRecord(Object object) {
//       System.out.println("Slaesmodel");
//        Boolean insert = false;
//        int returnFlagCount = 0;
////        System.out.println("Slaesmodel2");
//        SalesModel salesModel = (SalesModel) object;
////        System.out.println("Slaesmodel3");
//        List<SalesModel> list = salesModel.getListofitems();//
//         System.out.println("Slaesmodel"+list.size());
////         System.out.println("Slaesmodel111111111111"+salesModel.getListofitems());
//        try
//        {
//        // Sales cash, credit, cards Insert
////            Logger.write("SalesModel   ==== >");
////       for (int index = 0; index < Math.min(list.size(), 2); index++) {
////          SalesModel iterateModel = list.get(index);
//
//
//
//        for (int index = 0; index < list.size(); index++) {
//            System.out.println("index= "+index+" ="+list.size()+" =");
//////            Logger.write("SalesModel001   ==== >");
//            SalesModel iterateModel = list.get(index);//
////            Logger.write("SalesModel   ==== >"+list.get(index));
//            CallableStatement salesCall=DBConnection.getConnection().prepareCall("{call pro_savesales( ?, ?, ?, ?, ?,   ?, ?, ?, ?, ?,    ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,    ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,   ?, ?, ?, ?,   ?, ?, ?)}");
////            Logger.write("SalesModel1   ==== >"+salesModel.getBillNumber());
//            salesCall.setString(1,salesModel.getBillNumber());
////            Logger.write("SalesModel2   ==== >"+salesModel.getBillDate());
//            salesCall.setString(2,salesModel.getBillDate());
////            Logger.write("SalesModel3   ==== >"+salesModel.getCustomerName());
//            salesCall.setString(3,salesModel.getCustomerName());
////            Logger.write("SalesModel4   ==== >"+salesModel.getDoctorName());
//            salesCall.setString(4,salesModel.getDoctorName());
////            Logger.write("SalesModel5   ==== >"+iterateModel.getItemCode());
//            salesCall.setString(5,iterateModel.getItemCode());
//                                 //System.out.println(5 + ", " + iterateModel.getItemCode());
////         Logger.write("SalesModelitemname6   ==== >"+iterateModel.getItemName());
//
//            salesCall.setString(6,iterateModel.getItemName());
////            System.out.println("Anna");
//
////                                   System.out.println(6 + ", " + iterateModel.getItemName());
//
////            Logger.write("SalesModel7   ==== >"+iterateModel.getFormulation());
//            salesCall.setString(7,iterateModel.getFormulation());
//                                  // System.out.println(7 + ", " + iterateModel.getFormulation());
////            Logger.write("SalesModel8   ==== >"+iterateModel.getBatchNumber());
//            salesCall.setString(8,iterateModel.getBatchNumber());
//           // System.out.println(8 + ", " + iterateModel.getBatchNumber());
////            Logger.write("SalesModel9   ==== >"+iterateModel.getQuantity());
//            salesCall.setInt(9,iterateModel.getQuantity());
////            System.out.println("getqanty");
////            System.out.println(iterateModel.getQuantity());
////            Logger.write("SalesModel10   ==== >"+iterateModel.getUnitPrice());
//            salesCall.setDouble(10, iterateModel.getUnitPrice());
////            Logger.write("SalesModel11   ==== >"+iterateModel.getExpiryDate());
//            salesCall.setString(11,iterateModel.getExpiryDate());
////            Logger.write("SalesModel2   ==== >"+iterateModel.getMrp());
//            salesCall.setDouble(12, iterateModel.getMrp());
////            Logger.write("SalesModel13   ==== >"+iterateModel.getUnitDiscount());
//            salesCall.setDouble(13, iterateModel.getUnitDiscount());
////            Logger.write("SalesModel14   ==== >"+iterateModel.getUnitVAT());
//            salesCall.setDouble(14, iterateModel.getUnitVAT());
//         //   Logger.write("SalesModel   ==== >"+salesModel.getFprice());
//          //  salesCall.setDouble(15, iterateModel.getFprice());
//            if (salesModel.getBillType().equals("counter")) {
//                    salesCall.setDouble(15, 0.00);
//                 }
//            else if(salesModel.getBillType().equals("dummy")) {
//                    salesCall.setDouble(15, 0.00);
//                 }
//            else if(salesModel.getFormType().equals("return")){
//                salesCall.setDouble(15, 0.00);
//            }
//            else{
////                Logger.write("SalesModel15   ==== >"+iterateModel.getFprice());
//                salesCall.setDouble(15, iterateModel.getFprice());
//            }
////            Logger.write("SalesModel16   ==== >"+iterateModel.getSubTotal());
//            salesCall.setDouble(16, iterateModel.getSubTotal());
////            Logger.write("SalesModel 17  ==== >"+salesModel.getTotalDiscount());
//            salesCall.setDouble(17, salesModel.getTotalDiscount());
////            Logger.write("SalesModel18   ==== >"+salesModel.getTotalVAT());
//            salesCall.setDouble(18, salesModel.getTotalVAT());
////            Logger.write("SalesModel19   ==== >"+salesModel.getTotalAmount());
//            salesCall.setDouble(19, salesModel.getTotalAmount());
////            Logger.write("SalesModel20   ==== >"+salesModel.getPaidAmount());
//            salesCall.setDouble(20, salesModel.getPaidAmount());
////            Logger.write("SalesModel21   ==== >"+salesModel.getBalanceAmount());
//            salesCall.setDouble(21, salesModel.getBalanceAmount());
////            Logger.write("SalesModel22   ==== >"+salesModel.getTotalItems());
//            salesCall.setInt(22, salesModel.getTotalItems());
////            Logger.write("SalesModel23   ==== >"+salesModel.getTotalQuantity());
//            salesCall.setInt(23, salesModel.getTotalQuantity());
////            Logger.write("SalesModel24   ==== >"+salesModel.getPaymentMode());
//            salesCall.setString(24, salesModel.getPaymentMode());
////            Logger.write("SalesModel25   ==== >"+salesModel.getCardNumber());
//            salesCall.setString(25, salesModel.getCardNumber());
////            Logger.write("SalesModel 26  ==== >"+salesModel.getCardHolderName());
//            salesCall.setString(26, salesModel.getCardHolderName());
////            Logger.write("SalesModel27   ==== >"+salesModel.getBankName());
//            salesCall.setString(27,salesModel.getBankName());
////            Logger.write("SalesModel28   ==== >"+salesModel.getCardExpiry());
//            salesCall.setString(28, salesModel.getCardExpiry());
////            Logger.write("SalesModel 29  ==== >"+salesModel.getAccountNumber());
//            String dataa= salesModel.getAccountNumber();
//              if(dataa==null || dataa.equals("")  ){
//                    salesModel.setAccountNumber("0");}
//             else {}
//            salesCall.setString(29, salesModel.getAccountNumber());
////            System.out.println(29 + ", " + salesModel.getAccountNumber());
////            System.out.println("Acc");
//
//
//
//
//
////            if(){
////
////            }else{
////
////            }
////            Logger.write("SalesModel30   ==== >"+salesModel.getBillType());
//           // System.out.println(30, salesModel.getBillType());
//            salesCall.setString(30, salesModel.getBillType());
////          System.out.println(30 + ", " + salesModel.getBillType());
//
////            Logger.write("SalesModel31   ==== >"+salesModel.getFormType());
//            salesCall.setString(31, salesModel.getFormType());
////            System.out.println(31 + ", " + salesModel.getFormType());
////            Logger.write("SalesModel32   ==== >"+salesModel.getSalesReturnNumber());
//            salesCall.setString(32,salesModel.getSalesReturnNumber());
////            System.out.println(32 + ", " + salesModel.getSalesReturnNumber());
////            Logger.write("SalesModel33   ==== >"+salesModel.getSalesReturnDate());
//            salesCall.setString(33,salesModel.getSalesReturnDate());
////            Logger.write("SalesModel34   ==== >"+salesModel.getEmployeeID());
//            salesCall.setString(34,salesModel.getEmployeeID());
//            //Adjustment ID is set in Total Items
//            //salesCall.setDouble(34, iterateModel.getFprice());
//           Logger.write("SalesModel 35   ==== >"+salesModel.getTotalItems());
//
//
//          salesCall.setInt(35,salesModel.getTotalItems());// i am changes old
//
//          //   salesCall.setInt(35,iterateModel.getTotalItems());
//
//
//
//            Logger.write("SalesModel36   ==== >"+salesModel.getBillDate());
//              Logger.write("Sales    ==== >35");
//            salesCall.setInt(36,0);
////          Logger.write("SalesModel37 ==== >" + (36,0));
//
//      Logger.write("Sales    ==== >36");
//                       System.out.println("Slaesmodel31");
//                         //System.out.println(iterateModel.getPquantity());
//            salesCall.setInt(37,iterateModel.getPquantity());
////                         System.out.println(iterateModel.getPquantity());
////                        System.out.println(37 + ", " + iterateModel.getPquantity());
//          Logger.write("iterateModel37   ==== >"+iterateModel.getPquantity());
//            //salesCall.registerOutParameter(38,Types.INTEGER);
//            // Logger.write("38   ==== >"+Types.INTEGER);
//              System.out.println("Adjid12");
//                  //  System.out.println(salesCall.executeUpdate());
//            salesCall.executeUpdate();
           // ------------------------------------------------------
        


           //  System.out.println(salesCall.executeUpdate());
          //   Logger.write("salesAdjid   ==== >"+salesCall.executeUpdate());
         //   int returnFlag=salesCall.getInt("flag");
            ///---
//          int returnFlag=1;
//            if(returnFlag==1){
//               returnFlagCount++;
//            }
//            }
//            // Maintenance Table Insert
//            System.out.println("Accmaintance123");
//             if(returnFlagCount==list.size() && !salesModel.getBillType().equals("dummy") && !salesModel.getFormType().equals("return") && !salesModel.getFormType().equals("cancelbill")){
//             String paymentMode="";
//              //List<SalesModel> list = salesModel.getListofitems();//
//             if(salesModel.getBillType().equals("cards")) {
//                paymentMode = salesModel.getPaymentMode();
//             }
//             for (int index = 0; index <list.size() ; index++) {
//             SalesModel iterateModel = list.get(index);//jai
//                  System.out.println("Adjidmaint");
//               Logger.write("Sales Maintanence   ==== >");
//                 CallableStatement maintenanceCall=DBConnection.getConnection().prepareCall("{call pro_savesales(?, ?, ?, ?, ?, ?, ?, ?, ?, ?,     ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,   ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,    ?, ?, ?, ?,    ?, ?, ? )}");
////                 Logger.write("Sales Maintanence1  ==== >"+salesModel.getBillNumber());
//                 maintenanceCall.setString(1, salesModel.getBillNumber());
////                 Logger.write("Sales Maintanence2   ==== >"+salesModel.getBillDate());
//                 maintenanceCall.setString(2, salesModel.getBillDate());
////                 Logger.write("Sales Maintanence3   ==== >"+salesModel.getCustomerName());
//                 maintenanceCall.setString(3, salesModel.getCustomerName());
////                 Logger.write("Sales Maintanence4   ==== >"+salesModel.getDoctorName());
//                 maintenanceCall.setString(4, salesModel.getDoctorName());
////                 Logger.write("Sales Maintanence5   ==== >5");
//                 maintenanceCall.setString(5,"");
////                 Logger.write("Sales Maintanence6   ==== >6");
//                 maintenanceCall.setString(6,"");
////                 Logger.write("Sales Maintanence7   ==== >7"+salesModel.getBillNumber());
//                 maintenanceCall.setString(7,"");
////                 Logger.write("Sales Maintanence8   ==== >8"+salesModel.getBillNumber());
//                 maintenanceCall.setString(8,"");
////                 Logger.write("Sales Maintanence9   ==== >9"+salesModel.getBillNumber());
//                 maintenanceCall.setInt(9,0);
////                 Logger.write("Sales Maintanence10   ==== >10"+salesModel.getBillNumber());
//                 maintenanceCall.setDouble(10, 0.00);
////                 Logger.write("Sales Maintanence11   ==== >11"+salesModel.getBillNumber());
//                 maintenanceCall.setString(11,"0000-00-00");
////                 Logger.write("Sales Maintanence12   ==== >12"+salesModel.getBillNumber());
//                 maintenanceCall.setDouble(12, 0.00);
////                 Logger.write("Sales Maintanence13   ==== >13"+salesModel.getBillNumber());
//                 maintenanceCall.setDouble(13, 0.00);
////                 Logger.write("Sales Maintanence14   ==== >14"+salesModel.getBillNumber());
//                 maintenanceCall.setDouble(14, 0.00);
////                 Logger.write("Sales Maintanence15   ==== >15"+salesModel.getBillNumber());
//                 maintenanceCall.setDouble(15, 0.00);
////                 Logger.write("Sales Maintanence16  ==== >16"+salesModel.getBillNumber());
//                 maintenanceCall.setDouble(16, 0.00);
////                 Logger.write("Sales Maintanence17  ==== >17"+salesModel.getBillNumber());
//                 maintenanceCall.setDouble(17, 0.00);
////                 Logger.write("Sales Maintanence18   ==== >18"+salesModel.getBillNumber());
//                 maintenanceCall.setDouble(18, 0.00);
////                 Logger.write("Sales Maintanence19   ==== >"+salesModel.getTotalAmount());
//                 maintenanceCall.setDouble(19, salesModel.getTotalAmount());
////                 Logger.write("Sales Maintanence20   ==== >"+salesModel.getPaidAmount());
//                 maintenanceCall.setDouble(20, salesModel.getPaidAmount());
////                 Logger.write("Sales Maintanence21   ==== >"+salesModel.getBalanceAmount());
//                 maintenanceCall.setDouble(21, salesModel.getBalanceAmount());
////                 Logger.write("Sales Maintanence22   ==== >"+salesModel.getTotalItems());
//                 maintenanceCall.setInt(22, salesModel.getTotalItems());
////                 Logger.write("Sales Maintanence23   ==== >"+salesModel.getTotalQuantity());
//                 maintenanceCall.setInt(23, salesModel.getTotalQuantity());
////                 Logger.write("Sales Maintanence24   ==== >mode");
//                 maintenanceCall.setString(24, paymentMode);
////                 Logger.write("Sales Maintanence25   ==== >"+salesModel.getCardNumber());
//                 maintenanceCall.setString(25, salesModel.getCardNumber());
////                 Logger.write("Sales Maintanence26   ==== >"+salesModel.getCardHolderName());
//                 maintenanceCall.setString(26, salesModel.getCardHolderName());
////                 Logger.write("Sales Maintanence27   ==== >"+salesModel.getBankName());
//                 maintenanceCall.setString(27, salesModel.getBankName());
////                 Logger.write("Sales Maintanence28   ==== >"+salesModel.getCardExpiry());
//                 maintenanceCall.setString(28, salesModel.getCardExpiry());
////                 System.out.println("Acc123");
////                 Logger.write("Sales Maintanence29   ==== >"+salesModel.getAccountNumber());
////                      System.out.println("kumarann123");
////                      if(dataa==null || dataa.equals("")  ){
////                    salesModel.setAccountNumber("0");}
////             else {}
////                 maintenanceCall.setString(29, salesModel.getAccountNumber());
//
//                  String dataa= salesModel.getAccountNumber();
//              if(dataa==null || dataa.equals("")  ){
//                    salesModel.setAccountNumber("0");}
//             else {}
//            maintenanceCall.setString(29, salesModel.getAccountNumber());
//
//
//
//
//
//
////                 if(salesModel.getAccountNumber()==null  ){
////                    salesModel.setAccountNumber("0");}
//// else {}
////                 System.out.println(29 + ", " + salesModel.getAccountNumber());
////                      System.out.println("kumarann");
////                 Logger.write("Sales Maintanence30   ==== >"+salesModel.getBillType());
//                 if (index == 0 && !salesModel.getBillType().equals("counter")) {
//                    maintenanceCall.setString(30, "savemaintenance");
//                 } else if(index == 0 && salesModel.getBillType().equals("counter")) {
//                    maintenanceCall.setString(30, "savecountermaintenance");
//                 } else if (index == 1 && salesModel.getBillType().equals("cards")) {
//                    maintenanceCall.setString(30, "bankbook");
//                 } else {
//                     maintenanceCall.setString(30, "");
//                 }
////                 Logger.write("Sales Maintanence31   ==== >"+salesModel.getFormType());
//                 maintenanceCall.setString(31,salesModel.getFormType());
////                 Logger.write("Sales Maintanence32   ==== >"+salesModel.getSalesReturnNumber());
//                 maintenanceCall.setString(32,salesModel.getSalesReturnNumber());
////                 Logger.write("Sales Maintanence33   ==== >"+salesModel.getSalesReturnDate());
//                 maintenanceCall.setString(33,salesModel.getSalesReturnDate());
////                 Logger.write("Sales Maintanence34   ==== >"+salesModel.getEmployeeID());
//                 maintenanceCall.setString(34,salesModel.getEmployeeID());
////                Logger.write("Sales Maintanence35   ==== >35");
//                 maintenanceCall.setInt(35,0);
//               //  Logger.write("SalesModel37 ==== >" + "(35,0)");
//   Logger.write("Sales Maintanence   ==== >35");
//           //  Logger.write("Sales Maintanence36   ==== >"+salesModel.getPrescriptionDays());
//                 maintenanceCall.setInt(36, salesModel.getPrescriptionDays());
//            //    System.out.println( maintenanceCall.setInt(36,0));
//
//  System.out.println("Adjid23");
//                  maintenanceCall.setInt(37,iterateModel.getPquantity());
//              //    Logger.write("Sales Maintanence37   ==== >"+iterateModel.getPquantity());
//               // System.out.println(37 + ", " + iterateModel.getPquantity());
////                 Logger.write("Sales Maintanence   ==== >38");
////                  System.out.println("Slaesmodel3456789");
//                // maintenanceCall.registerOutParameter(38,Types.INTEGER);//old jai
//                //  Logger.write("Sales Maintanence   ==== >38"+Types.INTEGER);
//                 maintenanceCall.executeUpdate();
//                //  Logger.write("maintainAdjid   ==== >"+maintenanceCall.executeUpdate());
////          System.out.println(maintenanceCall.executeUpdate());
//                 System.out.println("Adjid2345");
//             }
//            } else {
//            // Rollback Sales items
//            }
//            insert = true;
//        }
//        catch(Exception e)
//        {
//           insert = false;//true
//
//
//           System.out.println( "errrrrrrrrrrrrrrrrrr   "+e.toString());
//           System.out.println(e.getMessage());
//           log.debug(" Class : SalesDAO  Method   : CreateRecord Exception :" + e.getMessage());
//        }
//        System.out.println("Sales:"+insert);
//        return insert;
//    }
//-----------------------------------------------------//
@Override
public Object createRecord(Object object) {
    System.out.println("SalesModel");
    Boolean insert = false;
    int returnFlagCount = 0;

    SalesModel salesModel = (SalesModel) object;
    List<SalesModel> list = salesModel.getListofitems();
    System.out.println("SalesModel size: " + list.size());

    try {
        for (int index = 0; index < list.size(); index++) {
            System.out.println("index= " + index + " =" + list.size() + " =");
            SalesModel iterateModel = list.get(index);

            CallableStatement salesCall = DBConnection.getConnection().prepareCall(
                "{call pro_savesales(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}"
            );

            salesCall.setString(1, salesModel.getBillNumber());
            salesCall.setString(2, salesModel.getBillDate());
            salesCall.setString(3, salesModel.getCustomerName());
            salesCall.setString(4, salesModel.getDoctorName());
            salesCall.setString(5, iterateModel.getItemCode());
            salesCall.setString(6, iterateModel.getItemName());
            salesCall.setString(7, iterateModel.getFormulation());
            salesCall.setString(8, iterateModel.getBatchNumber());
            salesCall.setInt(9, iterateModel.getQuantity());
            salesCall.setDouble(10, iterateModel.getUnitPrice());
            salesCall.setString(11, iterateModel.getExpiryDate());
            salesCall.setDouble(12, iterateModel.getMrp());
            salesCall.setDouble(13, iterateModel.getUnitDiscount());
            salesCall.setDouble(14, iterateModel.getUnitVAT());
            salesCall.setDouble(15, iterateModel.getFprice());
            salesCall.setDouble(16, iterateModel.getSubTotal());
            salesCall.setDouble(17, salesModel.getTotalDiscount());
            salesCall.setDouble(18, salesModel.getTotalVAT());
            salesCall.setDouble(19, salesModel.getTotalAmount());
            salesCall.setDouble(20, salesModel.getPaidAmount());
            salesCall.setDouble(21, salesModel.getBalanceAmount());
            salesCall.setInt(22, salesModel.getTotalItems());
            salesCall.setInt(23, salesModel.getTotalQuantity());
            salesCall.setString(24, salesModel.getPaymentMode());
            salesCall.setString(25, salesModel.getCardNumber());
            salesCall.setString(26, salesModel.getCardHolderName());
            salesCall.setString(27, salesModel.getBankName());
            salesCall.setString(28, salesModel.getCardExpiry());
             System.out.println("Sales insert status: " + salesModel.getAccountNumber());

            salesCall.setString(29, salesModel.getAccountNumber());
            salesCall.setString(30, salesModel.getBillType());
            salesCall.setString(31, salesModel.getFormType());
            salesCall.setString(32, salesModel.getSalesReturnNumber());
            salesCall.setString(33, salesModel.getSalesReturnDate());
            salesCall.setString(34, salesModel.getEmployeeID());
            salesCall.setInt(35, 0);  // Placeholder for adjustment ID
            salesCall.setInt(36, salesModel.getPrescriptionDays());
            salesCall.setInt(37, iterateModel.getPquantity());

            System.out.println("Executing sales procedure for index: " + index);
            salesCall.executeUpdate();

            int returnFlag = 1;  // This should be retrieved from the stored procedure if applicable
            if (returnFlag == 1) {
                returnFlagCount++;
            }
        }

        if (returnFlagCount == list.size() && !salesModel.getBillType().equals("dummy") && !salesModel.getFormType().equals("return") && !salesModel.getFormType().equals("cancelbill")) {
            String paymentMode = salesModel.getBillType().equals("cards") ? salesModel.getPaymentMode() : "";
            for (SalesModel iterateModel : list) {
                CallableStatement maintenanceCall = DBConnection.getConnection().prepareCall(
                    "{call pro_savesales(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}"
                );

                maintenanceCall.setString(1, salesModel.getBillNumber());
                maintenanceCall.setString(2, salesModel.getBillDate());
                maintenanceCall.setString(3, salesModel.getCustomerName());
                maintenanceCall.setString(4, salesModel.getDoctorName());
                maintenanceCall.setString(5, "");
                maintenanceCall.setString(6, "");
                maintenanceCall.setString(7, "");
                maintenanceCall.setString(8, "");
                maintenanceCall.setInt(9, 0);
                maintenanceCall.setDouble(10, 0.00);
                maintenanceCall.setString(11, "0000-00-00");
                maintenanceCall.setDouble(12, 0.00);
                maintenanceCall.setDouble(13, 0.00);
                maintenanceCall.setDouble(14, 0.00);
                maintenanceCall.setDouble(15, 0.00);
                maintenanceCall.setDouble(16, 0.00);
                maintenanceCall.setDouble(17, 0.00);
                maintenanceCall.setDouble(18, 0.00);
                maintenanceCall.setDouble(19, salesModel.getTotalAmount());
                maintenanceCall.setDouble(20, salesModel.getPaidAmount());
                maintenanceCall.setDouble(21, salesModel.getBalanceAmount());
                maintenanceCall.setInt(22, salesModel.getTotalItems());
                maintenanceCall.setInt(23, salesModel.getTotalQuantity());
                maintenanceCall.setString(24, paymentMode);
                maintenanceCall.setString(25, salesModel.getCardNumber());
                maintenanceCall.setString(26, salesModel.getCardHolderName());
                maintenanceCall.setString(27, salesModel.getBankName());
                maintenanceCall.setString(28, salesModel.getCardExpiry());
                 System.out.println("Sales insert status: ");
                maintenanceCall.setString(29, salesModel.getAccountNumber());
if (index == 0 && !salesModel.getBillType().equals("counter")) {
                  maintenanceCall.setString(30, "savemaintenance");
                 } else if(index == 0 && salesModel.getBillType().equals("counter")) {
                   maintenanceCall.setString(30, "savecountermaintenance");
                 } else if (index == 1 && salesModel.getBillType().equals("cards")) {
                    maintenanceCall.setString(30, "bankbook");
                 } else {
                     maintenanceCall.setString(30, "");
                 }
                

                maintenanceCall.setString(31, salesModel.getFormType());
                maintenanceCall.setString(32, salesModel.getSalesReturnNumber());
                maintenanceCall.setString(33, salesModel.getSalesReturnDate());
                maintenanceCall.setString(34, salesModel.getEmployeeID());
                maintenanceCall.setInt(35, 0);
                maintenanceCall.setInt(36, salesModel.getPrescriptionDays());
                maintenanceCall.setInt(37, iterateModel.getPquantity());

                System.out.println("Executing maintenance procedure for item.");
                maintenanceCall.executeUpdate();
            }
        }

        insert = true;
    } catch (Exception e) {
        insert = false;
        System.out.println("Error: " + e.toString());
        System.out.println(e.getMessage());
        log.debug("Class: SalesDAO, Method: createRecord, Exception: " + e.getMessage());
    }

    System.out.println("Sales insert status: " + insert);
    return insert;
}


//----------------------------------------------------//
//    public Object createRecord(Object object) {
//    Boolean insert = false;
//    int returnFlagCount = 0;
//    SalesModel salesModel = (SalesModel) object;
//    List<SalesModel> list = salesModel.getListofitems();
//
//    try {
//        for (SalesModel iterateModel : list) {
//            CallableStatement salesCall = DBConnection.getConnection().prepareCall("{call pro_savesales( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
//         SalesModel iterateModel = list.get(index);
//            salesCall.setString(1, salesModel.getBillNumber());
//            salesCall.setString(2, salesModel.getBillDate());
//            salesCall.setString(3, salesModel.getCustomerName());
//            salesCall.setString(4, salesModel.getDoctorName());
//            salesCall.setString(5, iterateModel.getItemCode());
//            salesCall.setString(6, iterateModel.getItemName());
//            salesCall.setString(7, iterateModel.getFormulation());
//            salesCall.setString(8, iterateModel.getBatchNumber());
//            salesCall.setInt(9, iterateModel.getQuantity());
//            salesCall.setDouble(10, iterateModel.getUnitPrice());
//            salesCall.setString(11, iterateModel.getExpiryDate());
//            salesCall.setDouble(12, iterateModel.getMrp());
//            salesCall.setDouble(13, iterateModel.getUnitDiscount());
//            salesCall.setDouble(14, iterateModel.getUnitVAT());
//
//            if (salesModel.getBillType().equals("counter") || salesModel.getBillType().equals("dummy") || salesModel.getFormType().equals("return")) {
//                salesCall.setDouble(15, 0.00);
//            } else {
//                salesCall.setDouble(15, iterateModel.getFprice());
//            }
//
//            salesCall.setDouble(16, iterateModel.getSubTotal());
//            salesCall.setDouble(17, salesModel.getTotalDiscount());
//            salesCall.setDouble(18, salesModel.getTotalVAT());
//            salesCall.setDouble(19, salesModel.getTotalAmount());
//            salesCall.setDouble(20, salesModel.getPaidAmount());
//            salesCall.setDouble(21, salesModel.getBalanceAmount());
//            salesCall.setInt(22, salesModel.getTotalItems());
//            salesCall.setInt(23, salesModel.getTotalQuantity());
//            salesCall.setString(24, salesModel.getPaymentMode());
//            salesCall.setString(25, salesModel.getCardNumber());
//            salesCall.setString(26, salesModel.getCardHolderName());
//            salesCall.setString(27, salesModel.getBankName());
//            salesCall.setString(28, salesModel.getCardExpiry());
//            salesCall.setString(29, salesModel.getAccountNumber());
//            salesCall.setString(30, salesModel.getBillType());
//            salesCall.setString(31, salesModel.getFormType());
//            salesCall.setString(32, salesModel.getSalesReturnNumber());
//            salesCall.setString(33, salesModel.getSalesReturnDate());
//            salesCall.setString(34, salesModel.getEmployeeID());
//            salesCall.setInt(35, iterateModel.getTotalItems());
//            salesCall.setInt(36, 0);
//            salesCall.setInt(37, iterateModel.getPquantity());
//            salesCall.registerOutParameter(38, Types.INTEGER);
//
//            salesCall.executeUpdate();
//
//            int returnFlag = salesCall.getInt("flag");
//            if (returnFlag == 1) {
//                returnFlagCount++;
//            }
//        }
//
//        // Maintenance Table Insert
//        if (returnFlagCount == list.size() && !salesModel.getBillType().equals("dummy") && !salesModel.getFormType().equals("return") && !salesModel.getFormType().equals("cancelbill")) {
//            String paymentMode = "";
//            if (salesModel.getBillType().equals("cards")) {
//                paymentMode = salesModel.getPaymentMode();
//            }
//
//            for (int index = 0; index <= 1; index++) {
//                CallableStatement maintenanceCall = DBConnection.getConnection().prepareCall("{call pro_savesales( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
//                 SalesModel iterateModel = list.get(index);
//                maintenanceCall.setString(1, salesModel.getBillNumber());
//                maintenanceCall.setString(2, salesModel.getBillDate());
//                maintenanceCall.setString(3, salesModel.getCustomerName());
//                maintenanceCall.setString(4, salesModel.getDoctorName());
//                maintenanceCall.setString(5, "");
//                maintenanceCall.setString(6, "");
//                maintenanceCall.setString(7, "");
//                maintenanceCall.setString(8, "");
//                maintenanceCall.setInt(9, 0);
//                maintenanceCall.setDouble(10, 0.00);
//                maintenanceCall.setString(11, "0000-00-00");
//                maintenanceCall.setDouble(12, 0.00);
//                maintenanceCall.setDouble(13, 0.00);
//                maintenanceCall.setDouble(14, 0.00);
//                maintenanceCall.setDouble(15, 0.00);
//                maintenanceCall.setDouble(16, 0.00);
//                maintenanceCall.setDouble(17, 0.00);
//                maintenanceCall.setDouble(18, 0.00);
//                maintenanceCall.setDouble(19, salesModel.getTotalAmount());
//                maintenanceCall.setDouble(20, salesModel.getPaidAmount());
//                maintenanceCall.setDouble(21, salesModel.getBalanceAmount());
//                maintenanceCall.setInt(22, salesModel.getTotalItems());
//                maintenanceCall.setInt(23, salesModel.getTotalQuantity());
//                maintenanceCall.setString(24, paymentMode);
//                maintenanceCall.setString(25, salesModel.getCardNumber());
//                maintenanceCall.setString(26, salesModel.getCardHolderName());
//                maintenanceCall.setString(27, salesModel.getBankName());
//                maintenanceCall.setString(28, salesModel.getCardExpiry());
//                maintenanceCall.setString(29, salesModel.getAccountNumber());
//
//                if (index == 0 && !salesModel.getBillType().equals("counter")) {
//                    maintenanceCall.setString(30, "savemaintenance");
//                } else if (index == 0 && salesModel.getBillType().equals("counter")) {
//                    maintenanceCall.setString(30, "savecountermaintenance");
//                } else if (index == 1 && salesModel.getBillType().equals("cards")) {
//                    maintenanceCall.setString(30, "bankbook");
//                } else {
//                    maintenanceCall.setString(30, "");
//                }
//
//                maintenanceCall.setString(31, salesModel.getFormType());
//                maintenanceCall.setString(32, salesModel.getSalesReturnNumber());
//                maintenanceCall.setString(33, salesModel.getSalesReturnDate());
//                maintenanceCall.setString(34, salesModel.getEmployeeID());
//                maintenanceCall.setInt(35, 0);
//                maintenanceCall.setInt(36, salesModel.getPrescriptionDays());
//                maintenanceCall.setInt(37, iterateModel.getPquantity());
//                maintenanceCall.registerOutParameter(38, Types.INTEGER);
//
//                maintenanceCall.executeUpdate();
//            }
//        } else {
//            // Rollback Sales items if needed
//        }
//
//        insert = true;
//    } catch (Exception e) {
//        insert = false;
//        log.debug("Class : SalesDAO Method : createRecord Exception: " + e.getMessage());
//        // Print stack trace for debugging
//        e.printStackTrace();
//    }
//
//    System.out.println("Sales: " + insert);
//    return insert;
//}
//
//





    //Values for Expiry Stock Alert dialog box in Sales
    @Override
    public Integer getAlertStatus() {
        int i = 0;
        try {
            ResultSet rs = null;
            String sql = "";
            sql = "SELECT expiry_alerts   FROM alert_setting";
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                i = rs.getInt("expiry_alerts");
            }
        } catch (Exception ex) {
            String msg = "Class :SalesDAO  Method : getAlertStatus Exception : " + ex.getMessage();
            log.debug(msg);
        }

        return i;
    }

    
    @Override
    public int getTotTempQty(int rowIndex,int n,List<SalesModel> salesTableItems) {
        int totTmpQty = 0;
        try {            
            SalesModel model = salesTableItems.get(rowIndex);
            String itemName = model.getItemName();
            Integer quantity = model.getQuantity();
              Integer fquantity = model.getPquantity();
            String batchNo = model.getBatchNumber();

            for (int index = 0; index < salesTableItems.size(); index++) {
                SalesModel salesmodel = salesTableItems.get(index);
                String batch = salesmodel.getBatchNumber();               
                String tableItemName = salesmodel.getItemName();
               

                if(!tableItemName.equals("") && !batch.equals("")) {
                    if (itemName.trim().equals(tableItemName.trim()) && batch.trim().equals(batchNo.trim())) {
                           System.out.println("kon");
                        int rQty = salesmodel.getQuantity();
                             int rfQty = salesmodel.getPquantity();
                            totTmpQty += rQty+rfQty;
                             System.out.println(totTmpQty);
                            getCntFnRow = index;
                    }
                }
            }
            if(n==0) {
              //  totTmpQty -= quantity;//oldd
                totTmpQty -= (quantity + fquantity);
                      System.out.println("lllllllllllllllllllooooooooooooooo");
                   System.out.println(totTmpQty);
            }

        } catch (Exception ex) {
           
            String msg = "Class :SalesDAO  Method : getTotTempQty Exception : " + ex.getMessage();
            log.debug(msg);
        }
        return totTmpQty;
    }

    @Override
    public Object viewRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    //Sales maintenance update - while clicking on update, the datas are actually deleted and inserted
    //Purpose: to delete values in sales cash,card or credit as well as maintenance tables
    @Override
    public boolean deleteRecord(Object object) {
         System.out.println("deleteRecord");
        Boolean deleteFlag=false;
        SalesModel model = (SalesModel) object;
                System.out.println("deleteRecord12");
        try {
            if(!model.getFormType().equals("return")) {
            if(!model.getBillType().equals("counter")) {
                System.out.println(model.getBillType());
            DBConnection.getStatement().executeUpdate("delete from sales_"+model.getBillType()+"_bill"+" where bill_no = '"+model.getBillNumber()+"'");
            }

            else {
            DBConnection.getStatement().executeUpdate("delete from sales_accounts where bill_no = '"+model.getBillNumber()+"'");
            }
            System.out.println("Cancelbill");
            DBConnection.getStatement().executeUpdate("delete from sales_maintain_bill where bill_no='"+model.getBillNumber()+"'");
            deleteFlag=true;
            }
            else {
            DBConnection.getStatement().executeUpdate("delete from sales_return where sales_return_no = '"+model.getSalesReturnNumber()+"'");
            deleteFlag=true;
            }
            System.out.println("Cancelbills successfull");
        } catch (Exception ex) {          
           deleteFlag=false;
           String msg = "Class :SalesDAO  Method : deleteRecord  Exception: " + ex.getMessage();
           log.debug(msg);
            System.out.println("Cancelbills successfullyyyy");
        }
        return deleteFlag;
    }

    @Override
    public Object updateRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Object salesTableValidation(List<SalesModel> list, String billType,String formType,String billNumber, String tableName) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    //To get the sales quantity in sales table before making any changes in sales maintenance
    @Override
    public String getSoldQty(String billNumber,String itemCode, String batchNumber,String billType) {
        String getSoldQty="0";
        ResultSet rs=null;
        try {            
            if(!billType.equals("counter"))
            {
                    System.out.println("rs");
            rs=DBConnection.getStatement().executeQuery("select qty from sales_"+billType+"_bill"+" where bill_no='"+billNumber+"' and item_code='"+itemCode+"' and batch_no='"+batchNumber+"'");
           System.out.println(rs);
            System.out.println("rs1");
                  System.out.println(batchNumber);
                             System.out.println(billType);
                                     System.out.println(billNumber);
                                      System.out.println(itemCode);
     System.out.println(getSoldQty);
            }
            else
            {
                 System.out.println("rs2");
            rs=DBConnection.getStatement().executeQuery("select qty from sales_accounts where bill_no='"+billNumber+"' and item_code='"+itemCode+"' and batch_no='"+batchNumber+"'");
            }

               System.out.println("rs3");
          while(rs.next())
            {
                        System.out.println(getSoldQty);
                 System.out.println("rs123");
                 if (rs.getString("qty") != null && !rs.getString("qty").equals("")) {
                    getSoldQty = rs.getString("qty").toString();
                               System.out.println(getSoldQty);
                  //  getSoldQty = rs.getString("fqty").toString();
                }
            }
        }
        catch(Exception ex){          
           String msg = "Class :SalesDAO  Method : getSoldQty Exception: " + ex.getMessage();
           log.debug(msg);
        }
        return getSoldQty;
    }    



    @Override
    public Integer getSoldQty(String billNumber,String itemCode, String batchNumber,String billType, String tableName)
    {
        int soldQty=0;
        ResultSet rs=null;
        try
        {
                       System.out.println("rsgetstock");
        rs=DBConnection.getStatement().executeQuery("select qty from sales_"+tableName+" where bill_no='"+billNumber+"' and item_code='"+itemCode+"' and batch_no='"+batchNumber+"'");        
            System.out.println(soldQty);
        System.out.println(rs);
        while(rs.next())
        {
            soldQty=rs.getInt("qty");
              soldQty=rs.getInt("fqty");
                 System.out.println("rsgetstock");
                 System.out.println(soldQty);
        }
        }
        catch(Exception e)
        {
            String ss = " Class : SalesDAO  Method   : getSoldQty Exception :" + e.getMessage();
            log.debug(ss);
        }
        return soldQty;
    }


    //To insert in cedit note table in case of sales return
    @Override
    public CreditNoteModel insertCreditNoteNo(SalesModel sales) {
        ResultSet rs=null;
        CommonDAO commonDAO = new CommonDAO();
        CreditNoteModel creditModel=new CreditNoteModel();
        String creditNoteNo=commonDAO.getAutoIncrement(DateUtils.now("dd-MM-yyyy"),"CreditNotes");        
            try {
                if(!sales.getUpdateFlag().equals("true")){
                creditModel.setCreditNoteNumber(creditNoteNo);
                DBConnection.getStatement().executeUpdate("insert into credit_note (credit_note_no,issued_against,credit_opt,credit_date, invoiceorbill_no,name,amount,details,cre_flag_id) values('"+creditNoteNo+"','Customer','Sales Return','"+sales.getSalesReturnDate()+"','"+sales.getBillNumber()+"','"+sales.getCustomerName()+"',"+sales.getTotalAmount()+",'',0)");
                
                }
                else{
                rs=DBConnection.getStatement().executeQuery("select credit_note_no,details from credit_note where invoiceorbill_no = '"+sales.getBillNumber()+"'");
                while(rs.next())
                {
                   creditModel.setCreditNoteNumber(rs.getString("credit_note_no"));
                   creditModel.setDetails(rs.getString("details"));
                }
                DBConnection.getStatement().executeUpdate("update credit_note set issued_against='Customer',credit_opt='Sales Return',credit_date='"+sales.getSalesReturnDate()+"',name='"+sales.getCustomerName()+"',amount="+sales.getTotalAmount()+",details='"+creditModel.getDetails()+"' where credit_note_no = '"+creditModel.getCreditNoteNumber()+"'");
                }                
            } catch (Exception ex) {               
                String ss = " Class : SalesDAO  Method   : insertCreditNoteNo Exception :" + ex.getMessage();
                log.debug(ss);
            }
        return creditModel;
    
    }

    //Update credit note table in case of sales return
    @Override
    public Boolean updateCreditDetails(String details,String creditNoteNo)
    {
        Boolean updateFlag=false;
        try{
            
            DBConnection.getStatement().executeUpdate("update credit_note set details ='"+details+"' where credit_note_no = '"+creditNoteNo+"'");
            updateFlag = true;

        }
        catch(Exception ex){
               
                String ss = " Class : SalesDAO  Method   : updateCreditDetails Exception :" + ex.getMessage();
                log.debug(ss);
        }
        return updateFlag;

    }


    //To load current date sales in Sales maintenance form on clicking Maintenance Submenu
    @Override
    public SalesModel loadSalesMaintain(String nowDate)
    {
        ResultSet rs=null;
        SalesModel sales = new SalesModel();
        SalesModel salesitems;
        List salesList = new ArrayList();
        try{
            rs = DBConnection.getStatement().executeQuery("select bill_no, bill_date,bill_type, cust_name,total_items, total_qty,total_amount from sales_maintain_bill where bill_date = '" + nowDate + "' order by bill_no desc");
            rs.last();
            int cnt = rs.getRow();            
            
            rs.beforeFirst();
            sales.setRowCount(cnt);
            while(rs.next()){
                salesitems = new SalesModel();
                salesitems.setBillNumber(rs.getString("bill_no"));                
                salesitems.setBillDate(rs.getString("bill_date"));
                salesitems.setBillType(rs.getString("bill_type"));
                salesitems.setCustomerName(rs.getString("cust_name"));
                salesitems.setTotalItems(rs.getInt("total_items"));
                salesitems.setTotalQuantity(rs.getInt("total_qty"));
                 System.out.println("sDAO");
                   System.out.println((rs.getInt("total_qty")));
                    System.out.println((rs.getDouble("total_amount")));
                salesitems.setTotalAmount(rs.getDouble("total_amount"));                
                salesList.add(salesitems);
            }
            sales.setListofitems(salesList);
        }
        catch(Exception ex){
               
                String ss = " Class : SalesDAO  Method  : loadSalesMaintain Exception :" + ex.getMessage();
                log.debug(ss);
        }
        return sales;
    }

    //To load sales values in Sales maintenance form based on date, bill number search
    @Override
    public SalesModel loadSalesMaintain(String option,String value)
    {
        ResultSet rs=null;
        SalesModel sales = new SalesModel();
        SalesModel salesitems;
        List salesList = new ArrayList();
        try {
            rs = DBConnection.getStatement().executeQuery("select bill_no, bill_date,bill_type, cust_name,total_items, total_qty,total_amount from sales_maintain_bill where " + option + " like '" + value + "%' order by bill_no desc ");
            rs.last();
            int cnt = rs.getRow();            
            rs.beforeFirst();
            sales.setRowCount(cnt);
            while(rs.next()){
                salesitems = new SalesModel();
                salesitems.setBillNumber(rs.getString("bill_no"));                
                salesitems.setBillDate(rs.getString("bill_date"));
                salesitems.setBillType(rs.getString("bill_type"));
                salesitems.setCustomerName(rs.getString("cust_name"));
                salesitems.setTotalItems(rs.getInt("total_items"));
                salesitems.setTotalQuantity(rs.getInt("total_qty"));
                System.out.println((rs.getInt("total_qty")));
                 System.out.println("ssssssssDAO");
                salesitems.setTotalAmount(rs.getDouble("total_amount"));
                 System.out.println((rs.getDouble("total_amount")));
                salesList.add(salesitems);
            }
            sales.setListofitems(salesList);
        }
        catch(Exception ex){
               
                String ss = " Class : SalesDAO  Method  : loadSalesMaintain Exception :" + ex.getMessage();
                log.debug(ss);
        }
        return sales;
    }


    //Dummy Bill Loading table values
    @Override
        public Vector loadDummyStockTable(String val) {
        ResultSet rs = null;
        Vector temp = null;
        Vector data = new Vector();
        PurchaseDAO purchase = new PurchaseDAO();
        try {
            rs = DBConnection.getStatement().executeQuery("CALL pro_getDrugTables('" + val + "')");
            while(rs.next()){
                temp = new Vector();
                String vt = "0";
                    String mfg = "";
                    String code = rs.getString("itemcode").trim();
                    double mrp = rs.getDouble("mrp");
                    int pack = purchase.getPackingValue(code);
                    String unitmrp = Value.Round(mrp/pack);
                    if (rs.getString("vat") == null || rs.getString("vat").equals("0.00")); else {
                        vt = rs.getString("vat").trim();
                    }
                    mfg = rs.getString("mfgname").trim();
                    temp.addElement(rs.getString("itemname").trim());
                    temp.addElement(code);
                    temp.addElement(mfg);
                    temp.addElement(rs.getString("dosage").trim());
                    temp.addElement(unitmrp);
                    temp.addElement(vt);
                    temp.addElement(rs.getString("formulation"));
                    data.addElement(temp);
            }

        } catch(Exception ex) {
                String ss = " Class : SalesDAO  Method   : loadDummyStockTable Exception :" + ex.getMessage();
                log.debug(ss);
        }
        return data;
    }


    //Loading table values for cash,credit,card and counter sales bills
    @Override
    public Vector loadStockTable (String val) {
        System.out.println("loadStockTable");
     ResultSet rs = null;
        Vector temp = null;
        Vector data = new Vector();
        try {
              // this condition only applicable for sharma medicals only
            rs = DBConnection.getStatement().executeQuery("CALL pro_getStockTables('" + val + "')");
            while(rs.next()){
                System.out.println("loadstock");
                    temp = new Vector();
                    String unitPrice = "0";
                    String vat = "0";
                    String mfg = "";
                    String batch = "";
                    String edate = DateUtils.now("MM-yy");
                    edate = rs.getString("expiry_date");
                    String code = rs.getString("item_code").trim();
                    String mrp = rs.getString("mrp").trim();
                    String sellingPrice = rs.getString("selling_price").trim();
                    String bat = rs.getString("batch_no").trim();
                    //String stkmrp=rs.getString("stockmrp").trim();
                    int stkQty = rs.getInt("stkqty");
                          System.out.println(stkQty);
                    //int packQty=rs.getInt(packQty);
                    mfg = rs.getString("mfgname").trim();                    
                    if (rs.getString("vat") == null || rs.getString("vat").equals("0.00")); else {
                        vat = rs.getString("vat").trim();
                    }                   
                    
                    if (sellingPrice == null || sellingPrice.equals("")) {
                        if (mrp.equalsIgnoreCase("0") || mrp.equalsIgnoreCase("0.0")) {
                            unitPrice = "0";
                        } else {
                            unitPrice = mrp;
                        }
                    } else {
                        unitPrice = sellingPrice;
                    }
                    if (bat == null || bat.equals("")); else {
                        batch = bat;
                    }
                    temp.addElement(rs.getString("itemname").trim());
                    temp.addElement(code);
                    System.out.println(code);
                    temp.addElement(mfg);
                    temp.addElement(rs.getString("dosage").trim());
                    temp.addElement(batch);
                   // temp.addElement(packQty);
                    temp.addElement(stkQty);
                    temp.addElement(Double.parseDouble(unitPrice));
                    temp.addElement(mrp);
                    temp.addElement(vat);
                    temp.addElement(edate);
                    temp.addElement(rs.getString("formulation"));
                    temp.addElement(rs.getString("ban_flag_id"));
                    temp.addElement(rs.getString("rack"));
                    temp.addElement(rs.getString("shelf"));
                    temp.addElement(rs.getString("minstock"));
                    temp.addElement(rs.getString("packing"));
                    temp.addElement(rs.getDouble("sales_discount"));
                    temp.addElement(rs.getDouble("purchase_price"));
                    System.out.println(rs.getDouble("purchase_price"));
                    temp.addElement(rs.getDouble("stockmrp"));
                    System.out.println(rs.getDouble("stockmrp"));
                    //temp.addElement(rs.getString("stockmrp").trim());
                    data.addElement(temp);
            }
        } catch(Exception ex) {
                String ss = "Class : SalesDAO  Method : loadStockTable_1 Exception :" + ex.getMessage();
                log.debug(ss);
        }
       System.out.println(data);
        return data;
    }

    //to load values from Prescription to Sales
     @Override
    public SalesModel getStockItem(String val,double qty) {
        ResultSet rs = null ;
        SalesModel sm =null ;
        List<SalesModel> list ;
        try {
            String qry = "CALL pro_getStockDetails('" + val + "','"+qty+"')";            
            rs = DBConnection.getStatement().executeQuery(qry);
            if(rs != null){
                list = new ArrayList<SalesModel>();            
                while(rs.next()){
                        sm = new SalesModel();
                        sm.setModuleType("importSales");
                        String unitPrice = "0";
                        String vat = "0";
                        String mfg = "";
                        String batch = "";
                        String edate = DateUtils.now("mmm-yyyy");
                        edate = rs.getString("expiry_date");                        
                        String code = rs.getString("item_code").trim();
                        String mrp = rs.getString("mrp").trim();
                        String sellingPrice = rs.getString("selling_price").trim();
                        String bat = rs.getString("batch_no").trim();
                        int stkQty = rs.getInt("stkqty");
                        mfg = rs.getString("mfgname").trim();

                        if (rs.getString("vat") == null || rs.getString("vat").equals("0.00")); else {
                            vat = rs.getString("vat").trim();
                        }

                        if (sellingPrice == null || sellingPrice.equals("")) {
                            if (mrp.equalsIgnoreCase("0") || mrp.equalsIgnoreCase("0.0")) {
                                unitPrice = "0";
                            } else {
                                unitPrice = mrp;
                            }
                        } else {
                            unitPrice = sellingPrice;
                        }
                        if (bat == null || bat.equals("")); else {
                            batch = bat;
                        }
                        sm.setItemName(rs.getString("itemname").trim()+"_"+rs.getString("dosage").trim());
                        sm.setItemCode(code);
                        sm.setManufacturerName(mfg);
                        sm.setBatchNumber(batch);                        
                        sm.setQuantity((int) qty);                        
                        sm.setUnitPrice(Double.parseDouble(unitPrice));
                        sm.setMrp(rs.getDouble("mrp"));
                        sm.setUnitPrice(rs.getDouble("selling_price"));
                        sm.setUnitVAT(rs.getDouble("vat"));
                        sm.setExpiryDate(edate);
                        sm.setFormulation(rs.getString("formulation"));
                        sm.setUpdateFlag(rs.getString("ban_flag_id"));//use UbdateFlag instead baanedFlag 
                        sm.setPacking(rs.getInt("packing"));
                        sm.setUnitDiscount(rs.getDouble("sales_discount"));
                        sm.setFprice(rs.getDouble("stockmrp"));
                        list.add(sm);
                }
            }

        } catch(Exception ex) {
                String ss = "Class : SalesDAO  Method : getStockItem Exception :" + ex.getMessage();
                log.debug(ss);
        }
        return sm;
    }

    //Loading table values for cash,credit,card and counter sales bills
    @Override
    public Vector loadStockTable(String val, Object dos) {
        ResultSet rs = null;
        Vector temp = null;
        Vector data = new Vector();
         System.out.println("Stock");
        try {
                rs = DBConnection.getStatement().executeQuery("CALL pro_getStockTables('" + val + "')");
                while (rs.next()) {
                    temp = new Vector();
                    String name = rs.getString("itemname").trim();
                    String dosage = rs.getString("dosage").trim();
                    int stkQty = rs.getInt("stkqty");
                       System.out.println(stkQty);
                    if (name.equals(val.trim()) && dosage.equals(dos) && stkQty > 0) {
                        String up = "0";
                        String vt = "0";
                        String batch = "";
                        String edate = DateUtils.now("MMM-yyyy");
                        String mfg = "";
                        String code = rs.getString("item_code").trim();
                        String mrp = rs.getString("mrp").trim();
                        String s = rs.getString("selling_price").trim();
                        String bat = rs.getString("batch_no").trim();
                        //String stkmrp = rs.getString("Pur_MRP").trim();
                        edate = rs.getString("expiry_date");

                        if (rs.getString("vat") == null || rs.getString("vat").equals("0.00")); else {
                            vt = rs.getString("vat").trim();
                        }
                        mfg = rs.getString("mfgname").trim();
                        temp.addElement(name);
                        if (s == null || s.equals("")) {
                            if (mrp.equalsIgnoreCase("0") || mrp.equalsIgnoreCase("0.0")) {
                                up = "0";
                            } else {
                                up = mrp;
                            }
                        } else {
                            up = s;
                        }
                        if (bat == null || bat.equals("")); else {
                            batch = bat;
                        }
                        temp.addElement(code);
                        temp.addElement(mfg);
                        temp.addElement(dosage);
                        temp.addElement(batch);
                        temp.addElement(stkQty);
                        temp.addElement(Double.parseDouble(up));
                        temp.addElement(mrp);
                        temp.addElement(vt);
                        temp.addElement(edate);
                        temp.addElement(rs.getString("formulation"));
                        temp.addElement(rs.getString("ban_flag_id"));
                        temp.addElement(rs.getString("Pur_MRP"));
                        data.addElement(temp);
                    } else {
                        continue;
                    }
                }
        } catch(Exception ex) {
                String ss = "Class : SalesDAO  Method   : loadStockTable_2 Exception :" + ex.getMessage();
                log.debug(ss);
        }        
        return data;
    }


    //Load substitute drug values in sales on pressing F11
    @Override
    public Vector loadSubstituteDrug(String val, int purRate, int stk){
        ResultSet rs = null;
        Vector temp = null;
        Vector data = new Vector();
        try {
                rs = DBConnection.getStatement().executeQuery("CALL pro_getSubstitutes(" + val + "," + purRate + "," + stk + ")");
                rs.last();
                int rr = rs.getRow();
                rs.beforeFirst();
                if (rr > 0) {
                    while (rs.next()) {
                        temp = new Vector();
                        String up = "0";
                        String vt = "0";
                        String batch = "";
                        String edate = DateUtils.now("MM-yy");
                        String mfg = "";
                        String code = rs.getString("item_code").trim();
                        String mrp = rs.getString("mrp").trim();
                        String s = rs.getString("selling_price").trim();
                        String bat = rs.getString("batch_no").trim();
                        int stkQty = rs.getInt("stkqty");
                        edate = DateUtils.normalFormatExpDate(rs.getDate("expiry_date"));
                        if (rs.getString("vat") == null || rs.getString("vat").equals("0.00")); else {
                            vt = rs.getString("vat").trim();
                        }
                        mfg = rs.getString("mfgname").trim();
                        temp.addElement(rs.getString("itemname").trim());
                        if (s == null || s.equals("")) {
                            if (mrp.equalsIgnoreCase("0") || mrp.equalsIgnoreCase("0.0")) {
                                up = "0";
                            } else {
                                up = mrp;
                            }
                        } else {
                            up = s;
                        }
                        if (bat == null || bat.equals("")); else {
                            batch = bat;
                        }
                        temp.addElement(code);
                        temp.addElement(mfg);
                        temp.addElement(rs.getString("dosage"));
                        temp.addElement(rs.getString("generic"));
                        temp.addElement(batch);
                        temp.addElement(stkQty);
                        temp.addElement(Double.parseDouble(up));
                        temp.addElement(mrp);
                        temp.addElement(vt);
                        temp.addElement(edate);
                        temp.addElement(rs.getString("formulation"));
                        temp.addElement(rs.getString("ban_flag_id"));
                        data.addElement(temp);                        
                    }
            }
        }
        catch(Exception ex) {
                String ss = " Class : SalesDAO  Method   : loadSubstituteDrug Exception :" + ex.getMessage();
                log.debug(ss);
        }
        return data;
    }

    //sales return and sales Adjustment datas loading table
    @Override
    public Vector loadSalesDetails(String val,int no) {
        ResultSet rs = null;
        Vector temp = null;
        Vector data = new Vector();
        CommonDAO commonDAO = new CommonDAO();
        try {        
                rs = DBConnection.getStatement().executeQuery( "CALL pro_getSalesDetails('" + val + "'," + no + ")");
                while (rs.next()) {
                    temp = new Vector();
                    boolean bo = true;
                    String iname = rs.getString("item_name");
                    String icode = rs.getString("item_code");
                    String batch = rs.getString("batch_no");
                    temp.addElement(icode);
                    temp.addElement(iname);
                    temp.addElement(rs.getString("formulation"));
                    temp.addElement(rs.getInt("fqty"));
                    temp.addElement(rs.getInt("qty"));
                    temp.addElement(batch);
                    temp.addElement(DateUtils.normalFormatExpDate(rs.getDate("expiry_date")));
                    temp.addElement(rs.getDouble("unit_price"));
                    temp.addElement(Value.Round(rs.getString("mrp")));
                    temp.addElement(Value.Round(rs.getString("unit_discount")));
                    temp.addElement(Value.Round(rs.getString("unit_vat")));
                   temp.addElement(Value.Round(rs.getString("fprice")));
                    temp.addElement(Boolean.FALSE);
                    if(!val.equals("ADJUSTMENT")) {
                        int ses = commonDAO.getReturnCompare(val,icode,iname,batch);
                        if (ses > 0) {
                            bo = false;
                        }
                    }
                    else {                        
                        bo=true;
                    }
                    temp.addElement(rs.getInt("adj_id"));                    
                    temp.addElement(bo);
                    data.addElement(temp);
                }
        }
        catch(Exception ex) {               
                String ss = " Class : SalesDAO  Method   : loadSalesDetails Exception :" + ex.getMessage();
                log.debug(ss);
        }
        return data;
    }

    //List bill numbers in Sales Return
    @Override
    public List<String> billNum(String name) {
        List<String> billList = new ArrayList<String>();
        try {
            ResultSet rs = null;
            if (name.equals("") || name == null) {
                rs = DBConnection.getStatement().executeQuery("select bill_no from sales_maintain_bill order by bill_no");
            } else {
                rs = DBConnection.getStatement().executeQuery("select bill_no from sales_maintain_bill where bill_no like'" + name + "%' order by bill_no");
            }
            while (rs.next()) {
                billList.add(rs.getString("bill_no"));
            }

        } catch (Exception ex) {
            String ss = " Class : SalesDAO  Method  : billNum     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return billList;
    }

    //Load previous bill number in Sales
    @Override
    public List<String> previousBillNumber(String name) {
        List<String> billList = new ArrayList<String>();
        try {
            ResultSet rs = null;
            String qry1="";
            String custName = "";
            Pattern p = Pattern.compile("^[0-9]+$");
            if (name != null && name.trim().length() > 2) {
                Matcher m = p.matcher(name.substring(0, 2));
                boolean matchFound = m.matches();
                if (matchFound) {
                    qry1="SELECT cust_name FROM cust_information where mobile_no = '"+name+"'";
                    rs = DBConnection.getStatement().executeQuery(qry1);
                    if(rs!=null && rs.next()){
                        custName = rs.getString("cust_name");
                    }
                } else {
                    custName = "";
                }
            }
            if (name.equals("") || name == null) {
                qry1 = "select bill_no,cust_name from sales_maintain_bill where bill_type!='Account' order by bill_no desc";
            } else if(custName.length() > 1 ){
                qry1 = "select bill_no,cust_name from sales_maintain_bill where bill_type!='Account' and cust_name = '" + custName + "' order by bill_no desc";
            } else {
                qry1 = "select bill_no,cust_name from sales_maintain_bill where bill_type!='Account' and bill_no like '" + name + "%' order by bill_no desc";
            }
            rs= null;
            rs = DBConnection.getStatement().executeQuery(qry1);
            while (rs.next()) {
                billList.add(rs.getString("bill_no")+"-"+rs.getString("cust_name"));
            }
        } catch (Exception ex) {
            ex.printStackTrace();
            String ss = " Class : SalesDAO  Method  : billNum     Exception :" + ex.getMessage();
            log.debug(ss);
        } finally {

        }   
        return billList;
    }
   
    //Load sales bill details in sales return on selecting a bill no
    @Override
    public SalesModel getBillDetails(String no, String tName) {
        String tabName = "sales_" + tName;
        String query = "select * from " + tabName + " where bill_no='" + no + "'";
        SalesModel sales=new SalesModel();
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                if (tabName.equalsIgnoreCase("sales_cards_bill")) {
                    sales.setPaymentMode(rs.getString("payment_mode"));
                    sales.setCardNumber(rs.getString("card_no"));
                    sales.setCardHolderName(rs.getString("card_holders_name"));
                    sales.setBankName(rs.getString("bank_name"));
                    sales.setCardExpiry(rs.getString("card_expiry"));
                }
                sales.setBillDate(rs.getString("bill_date"));
                sales.setCustomerName(rs.getString("cust_name"));
                sales.setDoctorName(rs.getString("doctor_name"));
                sales.setTotalDiscount(rs.getDouble("total_discount"));
                sales.setTotalVAT(rs.getDouble("total_vat"));
                sales.setTotalAmount(rs.getDouble("total_amount"));
                sales.setPaidAmount(rs.getDouble("paid_amount"));
                sales.setBalanceAmount(rs.getDouble("balance_amount"));
                sales.setTotalQuantity(rs.getInt("total_qty"));
                sales.setTotalItems(rs.getInt("total_items"));
            }
        } catch (Exception ex) {
            String ss = " Class : SalesDAO  Method  : getBillDetails     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return sales;
    }

    //Load sales return numbers list in edit
    @Override
    public List<String> srBillNum() {
        List salesReturnNo = new ArrayList();
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select distinct(sales_return_no) from sales_return order by sales_return_no");
            while (rs.next()) {
                salesReturnNo.add(rs.getString("sales_return_no"));
            }

        } catch (Exception ex) {
            String ss = " Class : SalesDAO Method : srBillNum()     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return salesReturnNo;
    }

    //Load sales return details in edit on selecting a return number
    @Override
    public SalesModel srBillDetails(String no) {
        String billNO = no;
        SalesModel sales=new SalesModel();
        SalesModel salesTableItems;
        ResultSet rs=null;
        List salesList = new ArrayList();
        try {
            rs = DBConnection.getStatement().executeQuery("select * from sales_return where sales_return_no='" + billNO + "'");            
            while (rs.next()) {
                sales.setBillNumber(rs.getString("bill_no"));
                sales.setBillDate(rs.getString("bill_date"));
                sales.setSalesReturnDate(rs.getString("sales_return_date"));
                sales.setCustomerName(rs.getString("cust_name"));
                sales.setBillType(rs.getString("bill_type"));
                sales.setDoctorName(rs.getString("doctor_name"));
                sales.setTotalDiscount(rs.getDouble("total_discount"));
                sales.setTotalVAT(rs.getDouble("total_vat"));
                sales.setTotalAmount(rs.getDouble("total_amount"));
                sales.setPaidAmount(rs.getDouble("paid_amount"));
                sales.setBalanceAmount(rs.getDouble("balance_amount"));
                sales.setTotalQuantity(rs.getInt("total_qty"));
                sales.setTotalItems(rs.getInt("total_items"));
                if (sales.getBillType().equalsIgnoreCase("Credit/Debit Card")) {
                    sales.setPaymentMode(rs.getString("payment_mode"));
                    sales.setCardNumber(rs.getString("card_no"));
                    sales.setCardHolderName(rs.getString("card_holders_name"));
                    sales.setBankName(rs.getString("bank_name"));
                    sales.setCardExpiry(rs.getString("card_expiry"));
                }
            }
            String query1 = "select item_code,item_name,formulation,fqty,qty,batch_no,unit_price,expiry_date,mrp,unit_discount,unit_vat,sub_total,adj_id,fprice from sales_return where sales_return_no='" + billNO + "'";
            ResultSet rs1 = DBConnection.getStatement().executeQuery(query1);
            
            rs1.last();
            int rowCount = rs1.getRow();
            rs1.beforeFirst();
            while (rs1.next()) {
                  salesTableItems = new SalesModel();
                  salesTableItems.setItemCode(rs1.getString("item_code"));
                  salesTableItems.setItemName(rs1.getString("item_name"));
                  salesTableItems.setFormulation(rs1.getString("formulation"));
                   salesTableItems.setPquantity(rs1.getInt("fqty"));
                  salesTableItems.setQuantity(rs1.getInt("qty"));
                  salesTableItems.setBatchNumber(rs1.getString("batch_no"));
                  salesTableItems.setReturnExpiryDate(rs1.getString("expiry_date"));
                  salesTableItems.setUnitPrice(rs1.getDouble("unit_price"));
                  salesTableItems.setMrp(rs1.getDouble("mrp"));
                  salesTableItems.setUnitDiscount(rs1.getDouble("unit_discount"));
                  salesTableItems.setUnitVAT(rs1.getDouble("unit_vat"));
                   salesTableItems.setFprice(rs1.getDouble("fprice"));
                  salesTableItems.setSubTotal(rs1.getDouble("sub_total"));
                  salesTableItems.setTotalItems(rs1.getInt("adj_id"));
                  salesList.add(salesTableItems);
                  sales.setListofitems(salesList);

            }

        } catch (Exception ex) {

            String ss =" Class : SalesDAO Method : srBillDetails     Exception :"+ ex.getMessage();
             log.debug(ss);
        }
        return sales;
    }

    //Stock update for Temp Stock
    @Override
    public boolean updateStock(StockModel stock,String type) {
        boolean  updateFlag = false;
        try {
            if(type.equals("update")){
            DBConnection.getStatement().executeUpdate("update stock_statement set qty='" + stock.getStock_qty() + "' where item_code='"+stock.getStock_itemCode()+"' and batch_no='" + stock.getStock_batchNo() + "'");
            DBConnection.getStatement().executeUpdate("insert into stock_register values(now(),'"+stock.getStock_itemCode()+"','"+stock.getStock_itemName()+"','"+stock.getStock_batchNo()+"','"+stock.getStock_minQty() +"','"+stock.getStock_minQty()+"','"+(stock.getStock_qty() +stock.getStock_minQty())+"','Temporary Stock','')");
            }
            else {
            String expDate =DateUtils.changeFormatExpDate(stock.getStock_expiryDate())+"-01";
            DBConnection.getStatement().executeUpdate("INSERT INTO  stock_statement (item_code ,item_name,batch_no ,qty,packing ,expiry_date ,mrp ,selling_price ,formulation,stock_date,ban_flag_id) VALUES ('" + stock.getStock_itemCode() + "','" + stock.getStock_itemName()+ "','" + stock.getStock_batchNo() + "','" + stock.getStock_qty() + "','" +stock.getStock_packing() + "','" + expDate + "','" + stock.getStock_sellingPrice() + "','" + stock.getStock_sellingPrice() + "','" + stock.getStock_formulation() + "',concat(curdate(),\' \',curtime()),'0')");
            DBConnection.getStatement().executeUpdate("insert into stock_register values(now(),'"+stock.getStock_itemCode()+"','"+stock.getStock_itemName()+"','"+stock.getStock_batchNo()+"','0','"+stock.getStock_qty()+"','"+stock.getStock_qty()+"','Temporary Stock','')");
            }
           updateFlag =true;
        }
        catch(Exception ex) {
            String ss =" Class : SalesDAO Method : updateStock     Exception :"+ ex.getMessage();
            log.debug(ss);
        }
        return updateFlag;
    }


    //Load sales bill details on selecting previous bill number
    @Override
    public SalesModel loadEditTable(String billNumber, String type) {
     ResultSet rs =null;
      System.out.println("hi");
      System.out.println(rs);
     SalesModel salesItems;
     SalesModel sales = new SalesModel();
     List salesList = new ArrayList();
     try {
                 System.out.println("loadEditTable");
          if(type.equalsIgnoreCase("cash"))
          {
          rs = DBConnection.getStatement().executeQuery("select * from sales_cash_bill where bill_no ='" + billNumber + "' ");
            System.out.println(rs);
          }
          else if(type.equalsIgnoreCase("credit")) {

          rs = DBConnection.getStatement().executeQuery("select * from sales_credit_bill where bill_no ='" + billNumber + "' ");
          System.out.println(rs);
          }
          else if(type.equalsIgnoreCase("counter")) {
          rs = DBConnection.getStatement().executeQuery("select *,0 as adj_id from sales_accounts where bill_no ='" + billNumber + "' ");
          } else if(type.equalsIgnoreCase("cards")) {
              System.out.println(rs);
          rs = DBConnection.getStatement().executeQuery("select * from sales_cards_bill where bill_no ='" + billNumber + "' ");
          }       
          while(rs.next()) {
              System.out.println("rs");
            salesItems = new SalesModel();
            sales.setBillNumber(rs.getString("bill_no"));
            sales.setBillDate(DateUtils.normalFormatDate(rs.getDate("bill_date")));
            sales.setCustomerName(rs.getString("cust_name"));
            sales.setDoctorName(rs.getString("doctor_name"));
            sales.setTotalQuantity(rs.getInt("total_qty"));
            sales.setTotalItems(rs.getInt("total_items"));
            sales.setTotalDiscount(rs.getDouble("total_discount"));
            sales.setTotalVAT(rs.getDouble("total_vat"));
            sales.setPaidAmount(rs.getDouble("paid_amount"));
            sales.setBalanceAmount(rs.getDouble("balance_amount"));
            sales.setTotalAmount(rs.getDouble("total_amount"));
            salesItems.setItemCode(rs.getString("item_code"));
            salesItems.setItemName(rs.getString("item_name"));
            salesItems.setManufacturerName(rs.getString("mfr_name"));
            salesItems.setFormulation(rs.getString("formulation"));
            salesItems.setBatchNumber(rs.getString("batch_no"));
            salesItems.setQuantity(rs.getInt("qty"));
             System.out.println((rs.getInt("qty")));
            System.out.println("jaii");
              System.out.println((rs.getInt("fqty")));
            salesItems.setPquantity(rs.getInt("fqty"));
            salesItems.setReturnExpiryDate(rs.getString("expiry_date"));
            salesItems.setUnitPrice(rs.getDouble("unit_price"));
            salesItems.setMrp(rs.getDouble("mrp"));
            salesItems.setUnitDiscount(rs.getDouble("unit_discount"));
            salesItems.setUnitVAT(rs.getDouble("unit_vat"));
            salesItems.setFprice(rs.getDouble("fprice"));
            salesItems.setSubTotal(rs.getDouble("sub_total"));
            salesItems.setTotalItems(rs.getInt("adj_id"));
            salesList.add(salesItems);
          }
          sales.setListofitems(salesList);        
     }
     catch(Exception ex) {           
            String ss =" Class : SalesDAO Method : loadEditTable     Exception :"+ ex.getMessage();
            log.debug(ss);
     }
     return sales;
    }

    //Print Sales Bill
    @Override
    public JasperPrint jasperPrint(String billno, String billmodel,JasperReport jasperReport) {
        JasperPrint jasperPrint = null;
        try {
            //File reportSource = new File("printerfiles/Print.jasper");
            DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
            builderFactory.setValidating(false);
            HashMap params1 = new HashMap();
            params1.put("billno", billno);
            params1.put("billmodel", billmodel); 

            // Guru Pharmacy

//           if(billtype=="CustomizeA5" | billtype.equals("CustomizeA5"))
//            {

//            params1.put("billmodel", billmodel.concat("A5"));
//            }
//            else
//            {
//             params1.put("billmodel", billmodel);
//            }
            //JasperReport jasperReport = (JasperReport) JRLoader.loadObject(reportSource);
            jasperPrint = JasperFillManager.fillReport(jasperReport, params1, DBConnection.getStatement().getConnection());
//            JasperPrintManager.printReport(jasperPrint, false);
        } catch (Exception ex) {
            String ss =" Class : SalesDAO Method : jasperPrint     Exception :"+ ex.getMessage();
            log.debug(ss);
        }
        return jasperPrint;
    }


    //Alert in sales for credit customers exceeding the limit
    @Override
    public double getCreditLimit(String custName){
        double creditLimit = 0.00;
        try {
        ResultSet rs = DBConnection.getStatement().executeQuery("select credit_limit from cust_information where cust_name ='"+custName+"'");
        while(rs.next()){
            creditLimit = rs.getDouble("credit_limit");
        }
        }
        catch(Exception e){
             String ss =" Class : SalesDAO Method : getCreditLimit Exception :"+ e.getMessage();
            log.debug(ss);
        }
        return creditLimit;
    }

    //Display Emp Code in Sales Maintenance
    @Override
    public String getSalesEmpCode(String billNo) {
        String employeeid="";
       try {
        ResultSet rs = DBConnection.getStatement().executeQuery("select employee_id from sales_maintain_bill where bill_no ='"+billNo+"'");
        while(rs.next()){
            employeeid = rs.getString("employee_id");
        }
        }
        catch(Exception e){
             String ss =" Class : SalesDAO Method : loadMaintainTable     Exception :"+ e.getMessage();
            log.debug(ss);
        }
        return employeeid;
    }

    //To highlight items having stock less than minimum stock in color
    @Override
    public int getMinStock(String query){
        int minQty = 0;
        int stk = 0;
        int returnFlag = 0;
        try {
        ResultSet rs = DBConnection.getStatement().executeQuery(query);
        while(rs.next()) {
            stk = rs.getInt("quantity");
            minQty = rs.getInt("min_qty");
            if(stk<=minQty){
            returnFlag = 1;
            }
        }
        }
        catch(Exception e){
             String ss =" Class : SalesDAO Method : getMinStock     Exception :"+ e.getMessage();
            log.debug(ss);
        }
        return returnFlag;
    }

    //Print for credit note while entering Sales Return
    @Override
    public void creditNotePrint(String creditNoteno,String returnNumber) {
        try {
            File reportSource = new File("printerfiles/creditNotePrint.jasper");
            DocumentBuilderFactory builderFactory = DocumentBuilderFactory.newInstance();
            builderFactory.setValidating(false);
            HashMap params1 = new HashMap();
            params1.put("creditnote", creditNoteno);
            params1.put("returnno", returnNumber);
            JasperReport jasperReport = (JasperReport) JRLoader.loadObject(reportSource);
            JasperPrint jasperPrint = JasperFillManager.fillReport(jasperReport, params1, DBConnection.getStatement().getConnection());
            JasperPrintManager.printReport(jasperPrint, false);
        } catch (Exception ex) {
            String ss =" Class : SalesDAO Method : creditNotePrint     Exception :"+ ex.getMessage();
            log.debug(ss);
        }
    }

    //Get the list of old dummy bill numbers to avoid duplication of bill numbers
    @Override
    public Boolean getDummyBillNumbers(String dummyBillNumber) {
       Boolean retFlag = false;
       try {
        ResultSet rs = DBConnection.getStatement().executeQuery("select distinct bill_no from sales_dummy_bill");
        while(rs.next()){
            if(dummyBillNumber.equalsIgnoreCase(rs.getString("bill_no"))){
               retFlag = true;
            }
        }
        }
        catch(Exception e){
             String ss =" Class : SalesDAO Method : getDummyBillNumbers     Exception :"+ e.getMessage();
            log.debug(ss);
        }
        return retFlag;
    }

    @Override
    public String[] getCustomerDetails(int custId) {


        String[] cusArray = new String[4];
        cusArray[0] = "";
        cusArray[1] = "";
        cusArray[2] = "0.0";
        cusArray[3] = "";
        int id = 0;
        try {
            String sql = "SELECT cust_address1,mobile_no,family_name,cust_type_id FROM cust_information  where cust_id='" + custId + "' and  cust_flag_id=0";
            ResultSet rs = null;
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                cusArray[0] = rs.getString("cust_address1");
                cusArray[1] = rs.getString("mobile_no");
                cusArray[3] = rs.getString("family_name");
                id = rs.getInt("cust_type_id");
            }
            if (id > 0) {
                //System.out.println("id"+id);
                sql = "select customer_percentage from customer_type_mt where id='" + id + "'";
                rs = DBConnection.getStatement().executeQuery(sql);
                while (rs.next()) {
                    cusArray[2] = rs.getString("customer_percentage");
                    //System.out.println("cusArray"+cusArray[2]);
                }
            }
        } catch (Exception e) {
            String msg = "Class: SalesDAO  Method: getCustomerDetails()  = " + e.getMessage();
            log.debug(msg);
        }
        return cusArray;
    }

    @Override
    public int getCustomerId(String cusName) {
        //System.out.println("--getCustomerId cusName"+cusName);
        int cusid = 0;
        try {
            String query = "select cust_id from cust_information where cust_name='" + cusName + "' and cust_flag_id = 0";
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                cusid = rs.getInt("cust_id");

            }
        } catch (Exception ex) {
            String ss = "Class : SalesDAO  Method  : getCustomerCode Exception:" + ex.getMessage();
            log.debug(ss);
        }
        
        return cusid;
    }
}


