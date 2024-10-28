/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.BankBookDAO;
import com.vanuston.medeil.implementation.BankBook;
import com.vanuston.medeil.model.BankBookModel;
import com.vanuston.medeil.model.MsgReturnModel;
import com.vanuston.medeil.util.Logger;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

/**
 *
 * @author Administrator
 */
public class BankBookController extends UnicastRemoteObject implements BankBook  {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	static Logger log = Logger.getLogger(BankBookController.class, "com.vanuston.medeil.controller.BankBookController");

    public BankBookController() throws RemoteException {
        super();
    }

    @Override
    public Object viewRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean deleteRecord(Object object) {
        Boolean delete = false;
        BankBookModel bankBookModel = (BankBookModel) object;
        try {
            BankBookDAO bankBookDAO = new BankBookDAO();
            bankBookModel.setSaveType("delete");
            if (bankBookModel.getExpenseTowards().equals("shop")) {
                delete = (Boolean) bankBookDAO.dailyCashBookCalculation(object);
            }
            delete = bankBookDAO.deleteRecord(bankBookModel);

        } catch (Exception e) {
            String ss = " Class : BankBookController  Method   : deleteRecord Exception :" + e.getMessage();
            log.debug(ss);
        }
        return delete;
    }

    @Override
    public Object createRecord(Object object) {
        MsgReturnModel returnModel = new MsgReturnModel();
        BankBookDAO bankBookDAO = new BankBookDAO();
        Object insert = true;
        try {
            BankBookModel model = (BankBookModel) object;
            model.setSaveType("save");
            if (model.getExpenseTowards().equals("shop")) {
                insert = bankBookDAO.dailyCashBookCalculation(object);
            }
            model.setBankId(0);
            if (insert.equals(true)) {
                insert = bankBookDAO.createRecord(model);
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
        MsgReturnModel returnModel = new MsgReturnModel();
        BankBookDAO bankBookDAO = new BankBookDAO();
        Object insert = true;
        try {
            BankBookModel model = (BankBookModel) object;
            model.setSaveType("update");

            insert = bankBookDAO.updateRecord(model);
            if (insert.equals(true)) {
                returnModel.setReturnMessage("0");
            }

        } catch (Exception e) {
            String ss = " Class : BankBookController  Method   : createRecord Exception :" + e.getMessage();
            log.debug(ss);
        }
        return returnModel;
    }

    @Override
    public Object dailyCashBookCalculation(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Object displayBankBookDetails(String str) {
        BankBookModel bankBookModel = new BankBookModel();
        try {
            BankBookDAO bankBookDAO = new BankBookDAO();
            bankBookModel = (BankBookModel) bankBookDAO.displayBankBookDetails(str);

        } catch (Exception e) {
            String ss = " Class : BankBookController  Method   : createRecord Exception :" + e.getMessage();
            log.debug(ss);
        }
        return bankBookModel;

    }

    @Override
    public Object viewBankBookTableValues(BankBookModel model) {

        BankBookModel bankBookModel = model;
        try {
            BankBookDAO bankBookDAO = new BankBookDAO();
            bankBookModel = (BankBookModel) bankBookDAO.viewBankBookTableValues(bankBookModel);

        } catch (Exception e) {
            String ss = " Class : BankBookController  Method   : createRecord Exception :" + e.getMessage();
            log.debug(ss);
        }
        return bankBookModel;

    }
}
