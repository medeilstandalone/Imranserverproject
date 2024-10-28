/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.ReceiptDAO;
import com.vanuston.medeil.implementation.Receipt;
import com.vanuston.medeil.model.MsgReturnModel;
import com.vanuston.medeil.model.ReceiptModel;
import com.vanuston.medeil.util.Logger;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.List;
import java.rmi.NotBoundException;
/**
 *
 * @author Administrator
 */
public class ReceiptController extends UnicastRemoteObject implements Receipt {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	static Logger log = Logger.getLogger(ReceiptController.class, "com.vanuston.medeil.controller.ReceiptController");

      public ReceiptController() throws RemoteException {
        super();
    }

    @Override
    public Object viewRecord(Object object) {
        ReceiptModel receiptModel = (ReceiptModel) object;
        ReceiptDAO receiptDAO = new ReceiptDAO();
        try {
            receiptModel = (ReceiptModel) receiptDAO.viewRecord(receiptModel);
        } catch (Exception e) {
            String ss = " Class : ReceiptController  Method   : viewRecord Exception :" + e.getMessage();
            log.debug(ss);
        }
        return receiptModel;
    }

    @Override
    public boolean deleteRecord(Object object) {
        MsgReturnModel returnModel = new MsgReturnModel();
        ReceiptDAO receiptDAO = new ReceiptDAO();
        boolean insert = false;
        try {
            ReceiptModel model = (ReceiptModel) object;
            MsgReturnModel tempModel = (MsgReturnModel) ReceiptTableValidation(model.getListofitems());
            
            returnModel = tempModel;
            if (!returnModel.isReturnFlag()) {
                
                model.setSaveType("delete");
                insert = receiptDAO.deleteRecord(model);

            }
        } catch (Exception e) {
            String ss = " Class : ReceiptController  Method   : deleteRecord Exception :" + e.getMessage();
            log.debug(ss);
        }
        return insert;
    }

    @Override
    public Object createRecord(Object object) {

        MsgReturnModel returnModel = new MsgReturnModel();
        ReceiptDAO receiptDAO = new ReceiptDAO();
        Object insert;
        try {
            ReceiptModel model = (ReceiptModel) object;
            MsgReturnModel tempModel = (MsgReturnModel) ReceiptTableValidation(model.getListofitems());
            
            returnModel = tempModel;
            if (!returnModel.isReturnFlag()) {
                
                model.setSaveType("save");
                insert = receiptDAO.createRecord(model);
                if (insert.equals(true)) {
                    returnModel.setReturnMessage("0");
                }
            }
        } catch (Exception e) {
            String ss = " Class : ReceiptController  Method   : createRecord Exception :" + e.getMessage();
            log.debug(ss);
        }
        return returnModel;
    }

    @Override
    public Object updateRecord(Object object) {
        MsgReturnModel returnModel = new MsgReturnModel();
        ReceiptDAO receiptDAO = new ReceiptDAO();
        Object insert;
        try {
            ReceiptModel model = (ReceiptModel) object;
            MsgReturnModel tempModel = (MsgReturnModel) ReceiptTableValidation(model.getListofitems());
            
            returnModel = tempModel;
            if (!returnModel.isReturnFlag()) {
                
                model.setSaveType("update");
                insert = receiptDAO.updateRecord(model);
                if (insert.equals(true)) {
                    returnModel.setReturnMessage("0");
                }
            }
        } catch (Exception e) {
            String ss = " Class : ReceiptController  Method   : updateRecord Exception :" + e.getMessage();
            log.debug(ss);
        }
        return returnModel;
    }

    public Object ReceiptTableValidation(List<ReceiptModel> list) {
        MsgReturnModel returnModel = new MsgReturnModel();

        try {
            ReceiptModel receiptModel;
            // Validation for quantity and price checked in sales jtable along with comparison of stockqty and sales qty.
            for (int index = 0; index < list.size(); index++) {
                receiptModel = new ReceiptModel();
                receiptModel = list.get(index);
                if (receiptModel.getBillNumber() == null || receiptModel.getBillNumber().equals("") || receiptModel.getBillNumber().equals("null") || receiptModel.getPaidAmount() <= 0 ||  receiptModel.getPaidAmount()>receiptModel.getBillBalanceAmount() ) {
                    returnModel.setRowCount(index);
                    returnModel.setColumnCount(5);
                    returnModel.setReturnMessage("Please Enter Valid Bill Amount");
                    returnModel.setReturnFlag(true);
                } else {
                    returnModel.setReturnFlag(false);
                }
            }

        } catch (Exception e) {
            String ss = " Class : ReceiptController  Method   : ReceiptTableValidation Exception :" + e.getMessage();
            log.debug(ss);
        }
        return returnModel;
    }

    @Override
    public Object getCustomerBalanceAmount(Object object)throws RemoteException,NotBoundException{
        ReceiptModel receiptModel = new ReceiptModel();
        ReceiptDAO receiptDAO = new ReceiptDAO();
        receiptModel.setCustomerName(object.toString());
        try {
            receiptModel = (ReceiptModel) receiptDAO.getCustomerBalanceAmount(receiptModel);

        } catch (Exception e) {
            String ss = " Class : ReceiptController  Method   : salesTableValidation Exception :" + e.getMessage();
            log.debug(ss);
        }
        return receiptModel;
    }

    @Override
    public Object getReceiptTableValues(Object object) {

        ReceiptDAO receiptDAO = new ReceiptDAO();
        ReceiptModel receiptModel = (ReceiptModel) object;
        try {
            receiptModel = (ReceiptModel) receiptDAO.getReceiptTableValues(receiptModel);

        } catch (Exception e) {
            String ss = " Class : ReceiptController  Method   : getReceiptTableValues Exception :" + e.getMessage();
            log.debug(ss);
        }
        return receiptModel;
    }

    @Override
    public Object getBillDetails(Object obj) {
        ReceiptDAO receiptDAO = new ReceiptDAO();
        ReceiptModel receiptModel = new ReceiptModel();
        try {
            receiptModel = (ReceiptModel) receiptDAO.getBillDetails(obj);

        } catch (Exception e) {
            String ss = " Class : ReceiptController  Method   : getBillDetails  Exception :" + e.getMessage();
            log.debug(ss);
        }
        return receiptModel;
    }
}
