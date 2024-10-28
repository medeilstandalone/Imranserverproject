/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.ChequeBookDAO;
import com.vanuston.medeil.implementation.ChequeBook;
import com.vanuston.medeil.model.ChequeBookModel;
import com.vanuston.medeil.model.MsgReturnModel;
import com.vanuston.medeil.util.Logger;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class ChequeBookController extends UnicastRemoteObject implements ChequeBook {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	static Logger log = Logger.getLogger(ChequeBookController.class, "com.vanuston.medeil.controller.ChequeBookController");

     public ChequeBookController() throws RemoteException {
        super();
    }

    @SuppressWarnings("unchecked")
	@Override
    public Object viewRecord(Object object) {
        List<ChequeBookModel> listValues = new ArrayList<ChequeBookModel>();
        ChequeBookModel chqModel = (ChequeBookModel) object;
        try {
            ChequeBookDAO chqBookDAO = new ChequeBookDAO();
            listValues = (ArrayList)chqBookDAO.viewRecord(chqModel);

        } catch (Exception e) {
            log.debug("Class: ChequeBookController  Method: loadChequeTableValues()  = " + e.getMessage());
        }
        return listValues;

    }

    @Override
    public boolean deleteRecord(Object object) {
        Boolean delete = false;
        ChequeBookModel chequeBookModel = (ChequeBookModel) object;
        try {
            ChequeBookDAO chequeBookDAO = new ChequeBookDAO();
            chequeBookModel.setSaveType("delete");
            delete = chequeBookDAO.deleteRecord(chequeBookModel);

        } catch (Exception e) {
            String ss = " Class : ChequeBookController  Method   : deleteRecord Exception :" + e.getMessage();
            log.debug(ss);
        }
        return delete;
    }

    @Override
    public Object createRecord(Object object) {
        MsgReturnModel returnModel = new MsgReturnModel();
        ChequeBookDAO chequeBookDAO = new ChequeBookDAO();
        Object insert = true;
        try {
            ChequeBookModel model = (ChequeBookModel) object;

            if (insert.equals(true)) {
                insert = chequeBookDAO.createRecord(model);
                if (insert.equals(true)) {
                    returnModel.setReturnMessage("0");
                }
            }
        } catch (Exception e) {
            String ss = " Class : ChequeBookController  Method   : createRecord Exception :" + e.getMessage();
            log.debug(ss);
        }
        return returnModel;
    }

    @Override
    public Object updateRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public ChequeBookModel getChqUsed(ChequeBookModel chqBookModel) {

        ChequeBookModel chequeBookModel = chqBookModel;
        try {
            ChequeBookDAO chqBookDAO = new ChequeBookDAO();
            chequeBookModel = chqBookDAO.getChqUsed(chqBookModel);

        } catch (Exception e) {
            String ss = " Class : ChequeBookController  Method   : getChqUsed Exception :" + e.getMessage();
            log.debug(ss);
        }
        return chequeBookModel;

    }

    @Override
    public List<String> getChequeBookIDList(String accountNo) {
        List<String> chequeBokIdList = new ArrayList<String>();
        try {
            ChequeBookDAO chqBookDAO = new ChequeBookDAO();
            chequeBokIdList = chqBookDAO.getChequeBookIDList(accountNo);
        } catch (Exception e) {
            String ss = " Class : ChequeBookController  Method   : getChqUsed Exception :" + e.getMessage();
            log.debug(ss);
        }

        return chequeBokIdList;
    }

    @Override
    public HashMap<String,String> getDetails(String acc_no, String id) {
        HashMap<String,String> details = new HashMap<String,String>();

        try {
            ChequeBookDAO chqBookDAO = new ChequeBookDAO();
            details = chqBookDAO.getDetails(acc_no, id);
        } catch (Exception e) {
            String ss = " Class : ChequeBookController  Method   : getDetails Exception :" + e.getMessage();
            log.debug(ss);
        }

        return details;
    }

    @Override
    public HashMap<String,String>  getStatus(String acc_no, String id) {
        HashMap<String,String> details = new HashMap<String,String> ();

        try {
            ChequeBookDAO chqBookDAO = new ChequeBookDAO();
            details = chqBookDAO.getStatus(acc_no, id);
        } catch (Exception e) {
            String ss = " Class : ChequeBookController  Method   : getStatus Exception :" + e.getMessage();
            log.debug(ss);
        }

        return details;
    }

    @Override
    public Integer getChequeBookValid(String acc_no, String id) {
        Integer cnt = 0;
        try {
            ChequeBookDAO chqBookDAO = new ChequeBookDAO();
            cnt = chqBookDAO.getChequeBookValid(acc_no, id);
        } catch (Exception e) {
            String ss = " Class : ChequeBookController  Method   : getChequeBookValid Exception :" + e.getMessage();
            log.debug(ss);
        }
        return cnt;
    }

    @Override
    public List<ChequeBookModel> loadChequeTableValues() {
        List<ChequeBookModel> listValues = new ArrayList<ChequeBookModel>();

        try {
            ChequeBookDAO chqBookDAO = new ChequeBookDAO();
            listValues = chqBookDAO.loadChequeTableValues();

        } catch (Exception e) {
            log.debug("Class: ChequeBookController  Method: loadChequeTableValues()  = " + e.getMessage());
        }
        return listValues;
    }
}
