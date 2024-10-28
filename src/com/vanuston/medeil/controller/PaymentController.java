/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.PaymentDAO;
import com.vanuston.medeil.implementation.Payment;
import com.vanuston.medeil.model.MsgReturnModel;
import com.vanuston.medeil.model.PaymentModel;
import com.vanuston.medeil.util.Logger;
 
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.List;

public class PaymentController extends UnicastRemoteObject implements Payment {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	static Logger log = Logger.getLogger(PaymentController.class, "com.vanuston.medeil.controller.PaymentController");

    public PaymentController() throws RemoteException {
        super();

    }

    @Override
    public Object viewRecord(Object object) throws RemoteException {
        PaymentModel paymentModel = (PaymentModel) object;
        PaymentDAO paymentDAO = new PaymentDAO();
        try {
            paymentModel = (PaymentModel) paymentDAO.viewRecord(paymentModel);
        } catch (Exception e) {
            
            String ss = " Class : PaymentController  Method   : salesTableValidation Exception :" + e.getMessage();
            log.debug(ss);
        }
        return paymentModel;
    }

    @Override
    public boolean deleteRecord(Object object) {
        MsgReturnModel returnModel = new MsgReturnModel();
        PaymentDAO paymentDAO = new PaymentDAO();
        boolean insert = false;
        try {
            PaymentModel model = (PaymentModel) object;
            MsgReturnModel tempModel = (MsgReturnModel) paymentTableValidation(model.getListofitems());
            
            returnModel = tempModel;
            if (!returnModel.isReturnFlag()) {
                
                model.setSaveType("delete");
                insert = paymentDAO.deleteRecord(model);

            }
        } catch (Exception e) {
            String ss = " Class : PaymentController  Method   : CreateRecord Exception :" + e.getMessage();
            log.debug(ss);
        }
        return insert;
    }

    @Override
    public Object createRecord(Object object) {
        MsgReturnModel returnModel = new MsgReturnModel();
        PaymentDAO paymentDAO = new PaymentDAO();
        Object insert;
        try {
            PaymentModel model = (PaymentModel) object;
            MsgReturnModel tempModel = (MsgReturnModel) paymentTableValidation(model.getListofitems());
            
            returnModel = tempModel;
            if (!returnModel.isReturnFlag()) {
                
                model.setSaveType("save");
                insert = paymentDAO.createRecord(model);
                if (insert.equals(true)) {
                    returnModel.setReturnMessage("0");
                }
            }
        } catch (Exception e) {

            String ss = " Class : PaymentController  Method   : CreateRecord Exception :" + e.getMessage();
            log.debug(ss);
        }
        return returnModel;
    }

    @Override
    public Object updateRecord(Object object) {
        MsgReturnModel returnModel = new MsgReturnModel();
        PaymentDAO paymentDAO = new PaymentDAO();
        Object insert;
        try {
            PaymentModel model = (PaymentModel) object;
            MsgReturnModel tempModel = (MsgReturnModel) paymentTableValidation(model.getListofitems());
            
            returnModel = tempModel;
            if (!returnModel.isReturnFlag()) {
                
                model.setSaveType("save");
                insert = paymentDAO.updateRecord(model);
                if (insert.equals(true)) {
                    returnModel.setReturnMessage("0");
                }
            }
        } catch (Exception e) {
            String ss = " Class : PaymentController  Method   : updateRecord Exception :" + e.getMessage();
            log.debug(ss);
        }
        return returnModel;
    }

    @SuppressWarnings("unchecked")
	public Object paymentTableValidation(Object object) {
        MsgReturnModel returnModel = new MsgReturnModel();
        List<PaymentModel> list = (List) object;
        try {
            PaymentModel paymentModel;
            // Validation for quantity and price checked in sales jtable along with comparison of stockqty and sales qty.
            for (int index = 0; index < list.size(); index++) {
                paymentModel = new PaymentModel();
                paymentModel = list.get(index);
                if (paymentModel.getInvoiceNumber() == null || paymentModel.getInvoiceNumber().equals("") || paymentModel.getInvoiceNumber().equals("null") || paymentModel.getPaidAmount() <= 0 || paymentModel.getPaidAmount()>paymentModel.getInvoiceBalanceAmount()) {
                    returnModel.setRowCount(index);
                    returnModel.setColumnCount(5);
                    returnModel.setReturnMessage("Please Enter Valid Invoice Amount");
                    returnModel.setReturnFlag(true);
                } else {
                    returnModel.setReturnFlag(false);
                }
            }

        } catch (Exception e) {
            String ss = " Class : PaymentController  Method   : paymentTableValidation Exception :" + e.getMessage();
            log.debug(ss);
        }
        return returnModel;
    }

    @Override
    public Object getDistributorBalanceAmount(Object object) {

        PaymentModel paymentModel = new PaymentModel();
        PaymentDAO paymentDAO = new PaymentDAO();
        paymentModel.setDistributorName(object.toString());
        try {

            paymentModel = (PaymentModel) paymentDAO.getDistributorBalanceAmount(paymentModel);

        } catch (Exception e) {
            String ss = " Class : PaymentController  Method   : getDistributorBalanceAmount Exception :" + e.getMessage();
            log.debug(ss);
        }
        return paymentModel;
    }

    @Override
    public Object getPaymentTableValues(Object object) {

        PaymentDAO paymentDAO = new PaymentDAO();
        PaymentModel paymentModel = (PaymentModel) object;
        try {
            paymentModel = (PaymentModel) paymentDAO.getPaymentTableValues(paymentModel);

        } catch (Exception e) {
            String ss = " Class : PaymentController  Method   : getPaymentTableValues Exception :" + e.getMessage();
            log.debug(ss);
        }
        return paymentModel;
    }

    @Override
    public Object getInvoiceDetails(String str) {
        PaymentDAO paymentDAO = new PaymentDAO();
        PaymentModel paymentModel = new PaymentModel();
        try {
            paymentModel = (PaymentModel) paymentDAO.getInvoiceDetails(str);

        } catch (Exception e) {
            String ss = " Class : PaymentController  Method   : getInvoiceDetails Exception :" + e.getMessage();
            log.debug(ss);
        }
        return paymentModel;
    }
}
