/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.PurchaseDAO;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.implementation.Purchase;
import com.vanuston.medeil.model.MsgReturnModel;
import com.vanuston.medeil.model.PurchaseModel;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Validation;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class PurchaseController extends UnicastRemoteObject implements Purchase {

    private static final long serialVersionUID = 1L;

    public PurchaseController() throws RemoteException {
        super();
    }
    static Logger log = Logger.getLogger(PurchaseController.class, "PurchaseController");
    DateUtils dutils = new DateUtils();

    @Override
    public Object viewRecord(Object object) throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean deleteRecord(Object object) throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    //Check validation and return message to UI or send model to DAO based on validation output
    @Override
    public Object createRecord(Object object) throws RemoteException {
        MsgReturnModel returnModel = new MsgReturnModel();
        PurchaseDAO purcDAO = new PurchaseDAO();
        Object insert;
        try {
            PurchaseModel model = (PurchaseModel) object;
            returnModel = (MsgReturnModel) purchaseTableValidation(model);
            if (!returnModel.isReturnFlag()) {
                insert = purcDAO.createRecord(model);
                if (insert.equals(true)) {
                    returnModel.setReturnMessage("0");
                }
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseController  Method   : createRecord Exception :" + e.getMessage();
            log.debug(ss);
        }
        return returnModel;
    }

    //Raise an alert to indicate Purchase price is higher with same MRP of previous purchase
    @Override
    public String chkPrePurcPrice(PurchaseModel model) throws RemoteException {
        List<PurchaseModel> list = model.getListofitems();
        String cnfrm = "";
        try {
            PurchaseModel purchaseModel;
            String items_names = "";
            int jx = 1;
            for (int index = 0; index < list.size(); index++) {
                purchaseModel = new PurchaseModel();
                purchaseModel = list.get(index);
                String code = purchaseModel.getItemCode();
                Double mp = purchaseModel.getMrp();
                Double purcPrice = purchaseModel.getUnitprice();
                String name = purchaseModel.getItemName();
                int checkPu = getPurchaseChecked(code, mp, purcPrice);
                if (checkPu == 2) {
                    String jxL = String.valueOf(jx).concat(".");
                    items_names = items_names.concat(jxL).concat(name).concat(" ");
                    jx++;
                }
            }
            if (!items_names.equals("") || items_names.length() > 0) {
                cnfrm = "<html> The Following items have Purchase Price higher than previous purchase price  with same MRP." + items_names + ".   Do you want to continue saving? </html>";
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseController  Method   : createRecord Exception :" + e.getMessage();
            log.debug(ss);
        }
        return cnfrm;
    }

    //check expiry date is in the specified format
    public boolean validateExpiryDate(PurchaseModel purchaseModel) {
        boolean retFlag = true;
        try {
        Validation valid = new Validation();       
        String expDate = purchaseModel.getExpdate();                               
        if(expDate.length() == 5) {
            String expMonth = expDate.substring(0,2);
            
            if(valid.getNumberValid(expMonth, 0, 2) != 10) {                 
                 retFlag = false;             
            }
            else {
                if(Integer.parseInt(expMonth) > 12 || Integer.parseInt(expMonth) == 0 ) {
                 retFlag = false;
                }
            }
            String expYear =  expDate.substring(3,5);
            
            if(valid.getNumberValid(expYear, 0, 2) != 10) {
                   retFlag = false;            
            }
             else {
                if(Integer.parseInt(expYear) == 0) {
                 retFlag = false;
                }
            }
            
            if(!expDate.substring(2,3).equals("/")) {
                     retFlag = false;
                     
            }
        }
         else {
           retFlag = false;
         }
        }
        catch(Exception e) {
            String ss = " Class : PurchaseController  Method   : ValidateExpiryDate Exception :" + e.getMessage();
            log.debug(ss);
        }
        return retFlag;
    }

    //Purchase table validation
    public Object purchaseTableValidation(PurchaseModel model) throws RemoteException {
        CommonImplements comCon = new CommonController();
        MsgReturnModel returnModel = new MsgReturnModel();
        List<PurchaseModel> list = model.getListofitems();
        returnModel.setReturnFlag(false);
        returnModel.setReturnMessage("0");
        try {
            PurchaseModel purchaseModel;
            if (list != null && list.size() > 0) {
                for (int index = 0; index < list.size(); index++) {
                    purchaseModel = new PurchaseModel();
                    purchaseModel = list.get(index);
                    if (String.valueOf(purchaseModel.getQuantity()).equals("")) {
                        returnModel.setRowCount(index);
                        returnModel.setColumnCount(9);
                        returnModel.setReturnMessage(purchaseModel.getItemName() + ", this Medicine's Quantity is Empty. Please Enter Some Value.");
                        returnModel.setReturnFlag(true);
                        break;
                    } else {
                        if ((purchaseModel.getQuantity()+purchaseModel.getFree()) <= 0) {
                            returnModel.setRowCount(index);
                            returnModel.setColumnCount(4);
                            returnModel.setReturnMessage(purchaseModel.getItemName() + ", this Medicine's Quantity Zero/Negative.");
                            returnModel.setReturnFlag(true);
                            break;
                        }
                    }
                    if (purchaseModel.getBatch().equals("")) {
                        returnModel.setRowCount(index);
                        returnModel.setColumnCount(6);
                        returnModel.setReturnMessage(purchaseModel.getItemName() + ", this Medicine's Batch Number Empty. Please Enter Some Value.");
                        returnModel.setReturnFlag(true);
                        break;
                    }
                    if (purchaseModel.getExpdate().equals("")) {
                        returnModel.setRowCount(index);
                        returnModel.setColumnCount(7);
                        returnModel.setReturnMessage(purchaseModel.getItemName() + ", this Medicine's ExpiryDate Empty. Please Enter Some Value.");
                        returnModel.setReturnFlag(true);
                        break;
                    }
                    if (!purchaseModel.getExpdate().equals("0000-00-00")) {
                        String expdate = "";
                        if(validateExpiryDate(purchaseModel)) {
                        expdate = new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("MM/yy").parse((purchaseModel.getExpdate())));
                        purchaseModel.setExpdate(expdate);
                        }
                        else {
                                returnModel.setRowCount(index);
                                returnModel.setColumnCount(7);
                                returnModel.setReturnMessage("Expiry date format or the date and year entered is incorrect.Please check.");
                                returnModel.setReturnFlag(true);
                                break;
                        }
                        Date edate = dutils.normalStringToDate(dutils.normalFormatDate(expdate));
                        String exdate = new SimpleDateFormat("MM-yy").format(edate);
                        int year = Integer.parseInt(exdate.substring(3, exdate.length()));
                        int currYr = Integer.parseInt(dutils.now("yy"));
                        if (year < currYr) {
                            returnModel.setRowCount(index);
                            returnModel.setColumnCount(7);
                            returnModel.setReturnMessage("The item " + purchaseModel.getItemName() + " is past its expiration date.");
                            returnModel.setReturnFlag(true);
                            break;
                        }
                        if (year == currYr) {
                            int month = Integer.parseInt(exdate.substring(0, 2));
                            int currMon = Integer.parseInt(dutils.now("MM"));
                            if (month == currMon) {
                                returnModel.setRowCount(index);
                                returnModel.setColumnCount(7);
                                returnModel.setReturnMessage("Warning!!! The item " + purchaseModel.getItemName() + ", will expire this month!!!");
                                returnModel.setReturnFlag(true);
                                break;
                            }
                            else if(month < currMon) {
                                returnModel.setRowCount(index);
                                returnModel.setColumnCount(7);
                                returnModel.setReturnMessage("The item " + purchaseModel.getItemName() + " is past its expiration date.");
                                returnModel.setReturnFlag(true);
                                break;
                            }
                        }
                    } else {
                        returnModel.setRowCount(index);
                        returnModel.setColumnCount(7);
                        returnModel.setReturnMessage(purchaseModel.getItemName() + " this Medicine's Expiry Date is Empty. Please Enter Some Value.");
                        returnModel.setReturnFlag(true);
                        break;
                    }
                    if (purchaseModel.getPacking().equals("")) {
                        returnModel.setRowCount(index);
                        returnModel.setColumnCount(8);
                        returnModel.setReturnMessage(purchaseModel.getItemName() + ", this Medicine's Packing Value is Empty. Please Enter Some Value.");
                        returnModel.setReturnFlag(true);
                        break;
                    } else {
                        int pa = Integer.parseInt(purchaseModel.getPacking());
                        if (pa <= 0) {
                            returnModel.setRowCount(index);
                            returnModel.setColumnCount(8);
                            returnModel.setReturnMessage(purchaseModel.getItemName() + ", this Medicine's Packing value is Zero/Negative.");
                            returnModel.setReturnFlag(true);
                            break;
                        }
                    }
                    String unitPrice = String.valueOf(purchaseModel.getUnitprice());
                    if (unitPrice.equals("")) {
                        returnModel.setRowCount(index);
                        returnModel.setColumnCount(9);
                        returnModel.setReturnMessage(purchaseModel.getItemName() + ", this Medicine's Purchase Price is Empty. Please Enter Some Value.");
                        returnModel.setReturnFlag(true);
                        break;
                    } else {
                        double up = purchaseModel.getUnitprice();
                        if (up <= 0) {
                            returnModel.setRowCount(index);
                            returnModel.setColumnCount(9);
                            returnModel.setReturnMessage(purchaseModel.getItemName() + ", this Medicine's Purchase Price is Zero/Negative.");
                            returnModel.setReturnFlag(true);
                            break;
                        }
                    }
                    String mrp = String.valueOf(purchaseModel.getMrp());
                    if (mrp.equals("")) {
                        returnModel.setRowCount(index);
                        returnModel.setColumnCount(10);
                        returnModel.setReturnMessage(purchaseModel.getItemName() + ", this Medicine's MRP is Empty. Please Enter Some Value.");
                        returnModel.setReturnFlag(true);
                        break;
                    } else {
                        double mp = purchaseModel.getMrp();
                        if (mp <= 0) {
                            returnModel.setRowCount(index);
                            returnModel.setColumnCount(10);
                            returnModel.setReturnMessage(purchaseModel.getItemName() + ", this Medicine's MRP is Zero/Negative.");
                            returnModel.setReturnFlag(true);
                            break;
                        }
                    }
                    if(purchaseModel.getUnitprice() > purchaseModel.getMrp()) {
                        returnModel.setRowCount(index);
                        returnModel.setColumnCount(9);
                        returnModel.setReturnMessage(purchaseModel.getItemName() + ", Purchase price is higher than MRP. Please check.");
                        returnModel.setReturnFlag(true);
                        break;
                    }
                    if (model.getActionType().equals("save")) {
                        boolean chkInv = checkInvoice(purchaseModel.getInvoiceNo());
                        if (chkInv) {
                        } else {
                            returnModel.setReturnMessage("Invoice Number is already available in the system. Change to Edit mode to change values for the given Invoice Number.");
                            returnModel.setReturnFlag(true);
                            break;
                        }
                    }
                    if (model.getActionType().equals("update")) {
                        //Alert to restrict batch modifications if already in Sales
                        int batchExists = Integer.parseInt(comCon.getQueryValue("SELECT count(*) FROM (select item_code,batch_no from sales_Cash_bill where batch_no='"+purchaseModel.getInvoiceNo()+"' and item_code='"+purchaseModel.getItemCode()+"' union "
                                + "select item_code,batch_no from sales_Credit_bill where batch_no='"+purchaseModel.getInvoiceNo()+"' and item_code='"+purchaseModel.getItemCode()+"' union "
                                + "select item_code,batch_no from sales_Cards_bill where batch_no='"+purchaseModel.getInvoiceNo()+"' and item_code='"+purchaseModel.getItemCode()+"' union "
                                + "select item_code,batch_no from sales_accounts where batch_no='"+purchaseModel.getInvoiceNo()+"' and item_code='"+purchaseModel.getItemCode()+"') s "));
                        if ((purchaseModel.getQuantity()+purchaseModel.getFree()) <= 0) {
                            returnModel.setRowCount(index);
                            returnModel.setColumnCount(4);
                            returnModel.setReturnMessage(purchaseModel.getItemName() + ", this Medicine's Quantity Zero/Negative.");
                            returnModel.setReturnFlag(true);
                            break;
                        } 
                        else if(batchExists > 0 && (!purchaseModel.getBatch().equalsIgnoreCase(purchaseModel.getInvoiceNo()))) {
                            returnModel.setRowCount(index);
                            returnModel.setColumnCount(4);
                            returnModel.setReturnMessage("Cannot modify batch number for item " + purchaseModel.getItemName() + ", since it has already been sold.");
                            returnModel.setReturnFlag(true);
                            break;
                        }
                        else {
                            int sVal = comCon.getCompare("CALL pro_checkPurUpdatItems('" + model.getInvoiceNo() + "','" + purchaseModel.getItemCode() + "','" + purchaseModel.getItemName() + "','" + purchaseModel.getBatch() + "');");
                            if (sVal == 1) {
                               String que1 = "SELECT sum((packing * qty)+(free * packing)) as compare FROM `purchase_invoice` WHERE item_code='" + purchaseModel.getItemCode() + "' and item_name='" + purchaseModel.getItemName() + "' and batch_no='" + purchaseModel.getBatch() + "'";
                               String que2 = "SELECT (packing * qty)+(free * packing) as compare FROM `purchase_invoice` WHERE invoice_no='" + model.getInvoiceNo() + "' and item_code='" + purchaseModel.getItemCode() + "' and item_name='" + purchaseModel.getItemName() + "' and batch_no='" + purchaseModel.getBatch() + "'";
                               String que3 = "select sum(qty) as compare from (select qty,batch_no,item_code from sales_cash_bill where batch_no='" + purchaseModel.getBatch() + "' and  item_code='" + purchaseModel.getItemCode() + "'"
                                       + " union all select qty,batch_no,item_code from sales_credit_bill where batch_no='" + purchaseModel.getBatch() + "' and  item_code='" + purchaseModel.getItemCode() + "' "
                                       + " union all select qty,batch_no,item_code from sales_accounts where batch_no='" + purchaseModel.getBatch() + "' and  item_code='" + purchaseModel.getItemCode() + "')s3";
                               String que4 = "select (qty+free)*packing as compare from purchase_return where invoice_no='" + model.getInvoiceNo() + "' and batch_no='" + purchaseModel.getBatch() + "' and item_name='" + purchaseModel.getItemName() + "' and item_code='" + purchaseModel.getItemCode() + "'";
                                int cntPur = comCon.getCompare(que1);
                                int oldpurQty = comCon.getCompare(que2);
                                int cntSales = comCon.getCompare(que3);                                
                                int cntPR = comCon.getCompare(que4);
                                if ((purchaseModel.getQuantity()+purchaseModel.getFree())*Integer.parseInt(purchaseModel.getPacking()) < cntPR ||
                                        (cntPur+((purchaseModel.getQuantity()+purchaseModel.getFree())* Integer.parseInt(purchaseModel.getPacking())) - oldpurQty) < cntSales) {
                                    returnModel.setRowCount(index);
                                    returnModel.setColumnCount(4);
                                    returnModel.setReturnMessage("Cannot update item " + purchaseModel.getItemName() + ", it has already been returned or sold.");
                                    returnModel.setReturnFlag(true);
                                    break;
                                }
                            }
                        }                                        
                        
                    }
                }
            } else {
                returnModel.setReturnMessage("Table is Empty.Please Enter Correct Values");
                returnModel.setReturnFlag(true);
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseController  Method   : purchaseTableValidation Exception :" + e.getMessage();
            log.debug(ss);
        }
        return returnModel;
    }

    @Override
    public Object updateRecord(Object object) throws RemoteException {
        MsgReturnModel returnModel = new MsgReturnModel();
        PurchaseDAO purcDAO = new PurchaseDAO();
        Object insert;
        try {
            PurchaseModel model = (PurchaseModel) object;
            MsgReturnModel tempModel = (MsgReturnModel) purchaseTableValidation(model);
            returnModel = tempModel;
            if (!returnModel.isReturnFlag()) {
                insert = purcDAO.updateRecord(model);
                if (insert.equals(true)) {
                    returnModel.setReturnMessage("0");
                }
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseController  Method   : updateRecord Exception :" + e.getMessage();
            log.debug(ss);
        }
        return returnModel;
    }

    @Override
    public Object updateRecordPurchase(Object object) throws RemoteException {
        MsgReturnModel returnModel = new MsgReturnModel();
        try {
            PurchaseModel model = (PurchaseModel) object;
            MsgReturnModel tempModel = (MsgReturnModel) purchaseTableValidation(model);
            returnModel = tempModel;
            if (!returnModel.isReturnFlag()) {
                returnModel.setReturnMessage("1");
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseController  Method   : updateRecordPurchase Exception :" + e.getMessage();
            log.debug(ss);
        }
        return returnModel;
    }

    @Override
    public Object createRecordPR(Object object) throws RemoteException {
        MsgReturnModel returnModel = new MsgReturnModel();
        PurchaseDAO purcDAO = new PurchaseDAO();
        Object insert;
        try {
            PurchaseModel model = (PurchaseModel) object;
            MsgReturnModel tempModel = (MsgReturnModel) purcRTableValidation(model);
            returnModel = tempModel;
            if (!returnModel.isReturnFlag()) {
                insert = purcDAO.createRecordPR(model);
                if (insert.equals(true)) {
                    returnModel.setReturnMessage("0");
                }
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseController  Method   : createRecordPR Exception :" + e.getMessage();
            log.debug(ss);
        }
        return returnModel;
    }

    @Override
    public Object updateRecordPR(Object object) throws RemoteException {
        MsgReturnModel returnModel = new MsgReturnModel();
        try {
            PurchaseModel model = (PurchaseModel) object;
            MsgReturnModel tempModel = (MsgReturnModel) purcRTableValidation(model);
            returnModel = tempModel;
            if (!returnModel.isReturnFlag()) {
                returnModel.setReturnMessage("1");
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseController  Method   : updateRecordPR Exception :" + e.getMessage();
            log.debug(ss);
        }
        return returnModel;
    }

    //Purchase return table validation
    public Object purcRTableValidation(PurchaseModel model) throws RemoteException {
        MsgReturnModel returnModel = new MsgReturnModel();
        List<PurchaseModel> list = model.getListofitems();
        returnModel.setReturnFlag(false);
        returnModel.setReturnMessage("0");
        try {
            PurchaseModel purcRModel;
            if (list != null && list.size() > 0) {
                for (int index = 0; index < list.size(); index++) {
                    purcRModel = new PurchaseModel();
                    purcRModel = list.get(index);

                    if ((purcRModel.getQuantity()+purcRModel.getFree()) <= 0) {
                        returnModel.setRowCount(index);
                        returnModel.setColumnCount(4);
                        returnModel.setReturnMessage(purcRModel.getItemName() + ", this Medicine's Quantity Zero/Negative.");
                        returnModel.setReturnFlag(true);
                        break;
                    }
                    if (purcRModel.getBatch().equals("")) {
                        returnModel.setRowCount(index);
                        returnModel.setColumnCount(6);
                        returnModel.setReturnMessage(purcRModel.getItemName() + ", this Medicine's Batch Number Empty. Please Enter Some Value.");
                        returnModel.setReturnFlag(true);
                        break;
                    }
                    if (purcRModel.getExpdate().equals("")) {
                        returnModel.setRowCount(index);
                        returnModel.setColumnCount(7);
                        returnModel.setReturnMessage(purcRModel.getItemName() + ", this Medicine's ExpiryDate Empty. Please Enter Some Value.");
                        returnModel.setReturnFlag(true);
                        break;
                    }
                    if (purcRModel.getPacking().equals("")) {
                        returnModel.setRowCount(index);
                        returnModel.setColumnCount(8);
                        returnModel.setReturnMessage(purcRModel.getItemName() + ", this Medicine's Packing Value Empty. Please Enter Some Value.");
                        returnModel.setReturnFlag(true);
                        break;
                    } else {
                        int pa = Integer.parseInt(purcRModel.getPacking());
                        if (pa <= 0) {
                            returnModel.setRowCount(index);
                            returnModel.setColumnCount(8);
                            returnModel.setReturnMessage(purcRModel.getItemName() + ", this Medicine's Packing Zero/Negative.");
                            returnModel.setReturnFlag(true);
                            break;
                        }
                    }
                    String unitPrice = String.valueOf(purcRModel.getUnitprice());
                    if (unitPrice.equals("")) {
                        returnModel.setRowCount(index);
                        returnModel.setColumnCount(9);
                        returnModel.setReturnMessage(purcRModel.getItemName() + ", this Medicine's Unit Price Empty. Please Enter Some Value.");
                        returnModel.setReturnFlag(true);
                        break;
                    } else {
                        double up = purcRModel.getUnitprice();
                        if (up <= 0) {
                            returnModel.setRowCount(index);
                            returnModel.setColumnCount(9);
                            returnModel.setReturnMessage(purcRModel.getItemName() + ", this Medicine's Unit Price Zero/Negative.");
                            returnModel.setReturnFlag(true);
                            break;
                        }
                    }
                    String mrp = String.valueOf(purcRModel.getMrp());
                    if (mrp.equals("")) {
                        returnModel.setRowCount(index);
                        returnModel.setColumnCount(10);
                        returnModel.setReturnMessage(purcRModel.getItemName() + ", this Medicine's MRP Price Empty. Please Enter Some Value.");
                        returnModel.setReturnFlag(true);
                        break;
                    } else {
                        double mp = purcRModel.getMrp();
                        if (mp <= 0) {
                            returnModel.setRowCount(index);
                            returnModel.setColumnCount(10);
                            returnModel.setReturnMessage(purcRModel.getItemName() + ", this Medicine's MRP Price Zero/Negative.");
                            returnModel.setReturnFlag(true);
                            break;
                        }
                    }
                    if (model.getActionType().equals("save")) {
                        int q = (purcRModel.getQuantity() + purcRModel.getFree())*Integer.parseInt(purcRModel.getPacking());
                        String isBatch = getStockItmBat("select batch_no from stock_statement where item_name='" + purcRModel.getItemName() + "' and item_code='" + purcRModel.getItemCode() + "' and batch_no='" + purcRModel.getBatch() + "'");
                        int purcQty = getStockQty("select qty * packing as qty from purchase_invoice where item_code='" + purcRModel.getItemCode() + "' and invoice_no='" + model.getInvoiceNo() + "' and batch_no='" + purcRModel.getBatch() + "'");
                        int purcFQty = getStockQty("select free as qty from purchase_invoice where item_code='" + purcRModel.getItemCode() + "' and invoice_no='" + model.getInvoiceNo() + "' and batch_no='" + purcRModel.getBatch() + "'");
                        int stkQty = getStockQty("select qty from stock_statement where item_code='" + purcRModel.getItemCode() + "' and batch_no='" + purcRModel.getBatch() + "'");
                        if (purcRModel.getBatch().equals(isBatch)) {
                            if (purcQty >= (purcRModel.getQuantity()*Integer.parseInt(purcRModel.getPacking()))) {
                                if (purcFQty >= purcRModel.getFree()) {
                                    if (stkQty >= q) {
                                    } else {
                                        returnModel.setRowCount(index);
                                        returnModel.setColumnCount(4);
                                        returnModel.setReturnMessage("The Quantity for Product " + purcRModel.getItemName() + " is Higher than Stock Quantity.");
                                        returnModel.setReturnFlag(true);
                                        break;
                                    }
                                } else {
                                    returnModel.setRowCount(index);
                                    returnModel.setColumnCount(5);
                                    returnModel.setReturnMessage("The Free Value for this Product " + purcRModel.getItemName() + " is Higher than Purchased Free Quantity");
                                    returnModel.setReturnFlag(true);
                                    break;
                                }
                            } else {
                                returnModel.setRowCount(index);
                                returnModel.setColumnCount(4);
                                returnModel.setReturnMessage("The Quantity for Product " + purcRModel.getItemName() + " is Higher than Purchased Quantity.");
                                returnModel.setReturnFlag(true);
                                break;
                            }
                        } else {
                            returnModel.setRowCount(index);
                            returnModel.setColumnCount(6);
                            returnModel.setReturnMessage("There are No Stock available for this Batch Number of Product." + purcRModel.getItemName());
                            returnModel.setReturnFlag(true);
                            break;
                        }
                    } else {
                        int q = (purcRModel.getQuantity() + purcRModel.getFree())*Integer.parseInt(purcRModel.getPacking());
                        String isBatch = getStockItmBat("select batch_no from stock_statement where item_name='" + purcRModel.getItemName() + "' and item_code='" + purcRModel.getItemCode() + "' and batch_no='" + purcRModel.getBatch() + "'");
                        int purcQty = getStockQty("select qty * packing as qty from purchase_invoice where item_code='" + purcRModel.getItemCode() + "' and invoice_no='" + model.getInvoiceNo() + "' and batch_no='" + purcRModel.getBatch() + "'");
                        int purcFQty = getStockQty("select free as qty from purchase_invoice where item_code='" + purcRModel.getItemCode() + "' and invoice_no='" + model.getInvoiceNo() + "' and batch_no='" + purcRModel.getBatch() + "'");
                        int purcRQty = getStockQty("select (qty + free)*packing as qty from purchase_return where item_code='" + purcRModel.getItemCode() + "' and invoice_no='" + model.getInvoiceNo() + "' and batch_no='" + purcRModel.getBatch() + "'");
                        int stkQty = getStockQty("select qty from stock_statement where item_code='" + purcRModel.getItemCode() + "' and batch_no='" + purcRModel.getBatch() + "'");
                        if (purcRModel.getBatch().equals(isBatch)) {
                            if (purcQty >= (purcRModel.getQuantity()*Integer.parseInt(purcRModel.getPacking()))) {
                                if (purcFQty >= purcRModel.getFree()) {
                                    if (stkQty + purcRQty >= q) {
                                    } else {
                                        returnModel.setRowCount(index);
                                        returnModel.setColumnCount(4);
                                        returnModel.setReturnMessage("The Quantity for Product " + purcRModel.getItemName() + " is Higher than Stock Quantity.");
                                        returnModel.setReturnFlag(true);
                                        break;
                                    }
                                } else {
                                    returnModel.setRowCount(index);
                                    returnModel.setColumnCount(5);
                                    returnModel.setReturnMessage("The Free Value for this Product " + purcRModel.getItemName() + " is Higher than Purchased Free Quantity");
                                    returnModel.setReturnFlag(true);
                                    break;
                                }
                            } else {
                                returnModel.setRowCount(index);
                                returnModel.setColumnCount(4);
                                returnModel.setReturnMessage("The Quantity for Product " + purcRModel.getItemName() + " is Higher than Purchased Quantity.");
                                returnModel.setReturnFlag(true);
                                break;
                            }
                        } else {
                            returnModel.setRowCount(index);
                            returnModel.setColumnCount(6);
                            returnModel.setReturnMessage("There are No Stock available for this Batch Number of Product." + purcRModel.getItemName());
                            returnModel.setReturnFlag(true);
                            break;
                        }
                    }
                }
            } else {
                returnModel.setReturnMessage("Table is Empty.Please Enter Correct Values");
                returnModel.setReturnFlag(true);
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseController  Method   : purcRTableValidation Exception :" + e.getMessage();
            log.debug(ss);
        }
        return returnModel;
    }

    @Override
    public boolean updateLog(PurchaseModel purcModel) throws RemoteException {
        PurchaseDAO purcDAO = new PurchaseDAO();
        boolean isSave = false;
        try {
            if (purcDAO.updateLog(purcModel)) {
                isSave = true;
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseController  Method   : updateLog Exception :" + e.getMessage();
            log.debug(ss);
            isSave = false;
        }
        return isSave;
    }

    @Override
    public List<String> PurchaseBillNum(String name) throws RemoteException {
        PurchaseDAO purcDAO = new PurchaseDAO();
        List<String> details = purcDAO.PurchaseBillNum(name);
        return details;
    }

    @Override
    public Object purchaseBillDetails(String invNO) throws RemoteException {
        PurchaseModel poModel = new PurchaseModel();
        try {
            PurchaseDAO purcRDAO = new PurchaseDAO();
            poModel = (PurchaseModel) purcRDAO.purchaseBillDetails(invNO);
        } catch (Exception e) {
            String ss = " Class : PurchaseController  Method   : purchaseBillDetails    Exception :" + e.getMessage();
            log.debug(ss);
        }
        return poModel;
    }

    @Override
    public List<String> prePurcBillDetails(String invNO, String iname) throws RemoteException {
        PurchaseDAO purcDAO = new PurchaseDAO();
        List<String> details = purcDAO.prePurcBillDetails(invNO, iname);
        return details;
    }

    @Override
    public List<String> purcBillDetailsForPR(String invNO) throws RemoteException {
        PurchaseDAO purcDAO = new PurchaseDAO();
        List<String> details = purcDAO.purcBillDetailsForPR(invNO);
        return details;
    }

    @Override
    public List<String> PurcRetBill(String name) throws RemoteException {
        PurchaseDAO purcDAO = new PurchaseDAO();
        List<String> details = purcDAO.PurcRetBill(name);
        return details;
    }

    @Override
    public Object purcRBillDetails(String invNO) throws RemoteException {
        PurchaseModel poModel = new PurchaseModel();
        try {
            PurchaseDAO purcRDAO = new PurchaseDAO();
            poModel = (PurchaseModel) purcRDAO.purcRBillDetails(invNO);
        } catch (Exception e) {
            String ss = " Class : PurchaseController  Method   : purcRBillDetails    Exception :" + e.getMessage();
            log.debug(ss);
        }
        return poModel;
    }

    @Override
    public List<PurchaseModel> billNumFromDist(String name) throws RemoteException {
        PurchaseDAO purcDAO = new PurchaseDAO();
        List<PurchaseModel> details = purcDAO.billNumFromDist(name);
        return details;
    }

    @Override
    public List<String> getDistributorsForPurchase(String name) throws RemoteException {
        PurchaseDAO purcDAO = new PurchaseDAO();
        List<String> distributors = purcDAO.getDistributorsForPurchase(name);
        return distributors;
    }

    @Override
    public List<String> getSuplierDetailsForPurchase(String name) throws RemoteException {
        PurchaseDAO purcDAO = new PurchaseDAO();
        List<String> distributors = purcDAO.getSuplierDetailsForPurchase(name);
        return distributors;
    }

    @Override
    public int getPurchaseChecked(String itemCode, Double mrp, Double purchasePrice) throws RemoteException {
        PurchaseDAO purcDAO = new PurchaseDAO();
        int retVal = purcDAO.getPurchaseChecked(itemCode, mrp, purchasePrice);
        return retVal;
    }

    @Override
    public List<PurchaseModel> getDrugTableValues(String name) throws RemoteException {
        PurchaseDAO purcDAO = new PurchaseDAO();
        List<PurchaseModel> details = purcDAO.getDrugTableValues(name);
        return details;
    }

    @Override
    public List<PurchaseModel> getTempStockValues() throws RemoteException {
        PurchaseDAO purcDAO = new PurchaseDAO();
        List<PurchaseModel> details = purcDAO.getTempStockValues();
        return details;
    }

    @Override
    public List<PurchaseModel> getPRAdjustValues(String billNum) throws RemoteException {
        PurchaseDAO purcDAO = new PurchaseDAO();
        List<PurchaseModel> details = purcDAO.getPRAdjustValues(billNum);
        return details;
    }

    @Override
    public List<PurchaseModel> getPurcReturnDatas(String billNum) throws RemoteException {
        PurchaseDAO purcDAO = new PurchaseDAO();
        List<PurchaseModel> details = purcDAO.getPurcReturnDatas(billNum);
        return details;
    }

    @Override
    public Integer getPackingValue(String itemCode) throws RemoteException {
        PurchaseDAO purcDAO = new PurchaseDAO();
        int details = purcDAO.getPackingValue(itemCode);
        return details;
    }

    @Override
    public String getFormulation(String code, String name) throws RemoteException {
        PurchaseDAO purcDAO = new PurchaseDAO();
        String details = purcDAO.getFormulation(code, name);
        return details;
    }

    @Override
    public String getStockItmBat(String query) throws RemoteException {
        PurchaseDAO purcDAO = new PurchaseDAO();
        String details = purcDAO.getStockItmBat(query);
        return details;
    }

    @Override
    public int getStockQty(String query) throws RemoteException {
        PurchaseDAO purcDAO = new PurchaseDAO();
        int details = purcDAO.getStockQty(query);
        return details;
    }

    @Override
    public boolean checkInvoice(String invno) throws RemoteException {
        PurchaseDAO purcDAO = new PurchaseDAO();
        boolean details = purcDAO.checkInvoice(invno);
        return details;
    }

       @Override
    public List<String> prePurcOrderDetails(String invNO, String iname) throws RemoteException  {
        PurchaseDAO purcDAO = new PurchaseDAO();
        List details = purcDAO.prePurcOrderDetails(invNO,iname);
        return details;

    }

       @Override
    public PurchaseModel viewPorecords(String invNO) throws RemoteException  {
        PurchaseDAO purcDAO = new PurchaseDAO();
        PurchaseModel details = (PurchaseModel) purcDAO.viewPorecords(invNO);
        return details;

    }

    @Override
    public List<String> getLastPurDetails(String itemCode) {
        PurchaseDAO purcDAO = new PurchaseDAO();
        return purcDAO.getLastPurDetails(itemCode);
       }

    @Override
    public List<PurchaseModel> getStockDetails(String itemCode) throws RemoteException {
         PurchaseDAO purcDAO = new PurchaseDAO();
         return purcDAO.getStockDetails(itemCode);
    }

    @Override
    public List<PurchaseModel> getBarcodeValues(String val) throws RemoteException {
         PurchaseDAO purcDAO = new PurchaseDAO();
         return purcDAO.getBarcodeValues(val);
    }
}
