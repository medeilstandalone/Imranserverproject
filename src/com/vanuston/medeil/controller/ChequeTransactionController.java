/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.ChequeTransactionDAO;
import com.vanuston.medeil.implementation.ChequeTransaction;
import com.vanuston.medeil.model.ChequeTransactionModel;
import com.vanuston.medeil.model.MsgReturnModel;
import com.vanuston.medeil.util.Logger;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class ChequeTransactionController extends UnicastRemoteObject implements ChequeTransaction {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	static Logger log = Logger.getLogger(ChequeTransactionController.class, "com.vanuston.medeil.controller.ChequeTransactionController");

      public ChequeTransactionController() throws RemoteException {
        super();
    }

    @Override
    public Object viewRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean deleteRecord(Object object) {
        Boolean delete = false;
        try {
            ChequeTransactionDAO chequeTxnDAO = new ChequeTransactionDAO();
            delete = chequeTxnDAO.deleteRecord(object);
        } catch (Exception e) {
            String ss = " Class : BankBookController  Method   : deleteRecord Exception :" + e.getMessage();
            log.debug(ss);
        }
        return delete;
    }

    @Override
    public Object createRecord(Object object) {
        MsgReturnModel returnModel = new MsgReturnModel();
        ChequeTransactionDAO chequeTxnDAO = new ChequeTransactionDAO();
        Object insert = true;
        try {
            ChequeTransactionModel model = (ChequeTransactionModel) object;
            if (insert.equals(true)) {
                insert = chequeTxnDAO.createRecord(model);
                if (insert.equals(true)) {
                    returnModel.setReturnMessage("0");
                }
            }
        } catch (Exception e) {
            String ss = " Class : BankBookController  Method   : createRecord Exception :" + e.getMessage();
            log.debug(ss);
        }
        return returnModel;
    }

    @Override
    public Object updateRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public int chequeNoAlreadyExists(String checqNo, Integer chq_id) {
        int valid = 0;
        try {
            ChequeTransactionDAO chqtxtDAO = new ChequeTransactionDAO();
            valid = chqtxtDAO.chequeNoAlreadyExists(checqNo, chq_id);

        } catch (Exception e) {
            log.debug("Class : ChequeTransactionController Method:chequeNoAlreadyExists Error: " + e.getMessage());
        }
        return valid;
    }

    @Override
    public int getValidChequeNo(String acccountNo, String chgNo) {
        int valid = 0;
        try {
            ChequeTransactionDAO chqtxtDAO = new ChequeTransactionDAO();
            valid = chqtxtDAO.getValidChequeNo(acccountNo, chgNo);

        } catch (Exception e) {
            log.debug("Class : ChequeTransactionController Method:getValidChequeNo Error: " + e.getMessage());
        }
        return valid;
    }

    @Override
    public boolean chequeTransactionClosingBalanceCalculation(ChequeTransactionModel chqModel) {
        boolean calculation = true;
        try {

            ChequeTransactionDAO chqDAO = new ChequeTransactionDAO();
            calculation = chqDAO.chequeTransactionClosingBalanceCalculation(chqModel);
        } catch (Exception e) {
            log.debug("Class:ChequeTransactionController method :chequeTransactionClosingBalanceCalculation()  " + e.getMessage());
        }
        return calculation;
    }

    @Override
    public List<ChequeTransactionModel> displayChequeTransactionTableValues(String sql) {
        List<ChequeTransactionModel> tableValues = new ArrayList<ChequeTransactionModel>();
        try {
            ChequeTransactionDAO chqDAO = new ChequeTransactionDAO();
            tableValues = chqDAO.displayChequeTransactionTableValues(sql);
        } catch (Exception e) {
            log.debug("Class:ChequeTransactionController method :displayChequeTransactionTableValues()  " + e.getMessage());
        }
        return tableValues;
    }

	@Override
	public ChequeTransactionModel displayChequeTransactionDetails(String ssNo) {
		// TODO Auto-generated method stub
		ChequeTransactionDAO chqDAO = new ChequeTransactionDAO();		 
		return chqDAO.displayChequeTransactionDetails(ssNo);
	}
}
