/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.StoreInformationDAO;
import com.vanuston.medeil.implementation.StoreInformation;
import com.vanuston.medeil.model.MsgReturnModel;
import com.vanuston.medeil.model.StoreInformationModel;
import com.vanuston.medeil.util.Logger;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

/**
 *
 * @author Administrator
 */
public class StoreInformationController extends UnicastRemoteObject implements StoreInformation {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	static Logger log = Logger.getLogger(StoreInformationController.class, "com.vanuston.medeil.controller.StoreInformationController");

      public StoreInformationController() throws RemoteException {
        super();
    }
    @Override
    public Object viewRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean deleteRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Object createRecord(Object object) {
        MsgReturnModel returnModel = new MsgReturnModel();
        StoreInformationDAO storeInformationDAO = new StoreInformationDAO();
        Object insert = true;
        try {
            StoreInformationModel model = (StoreInformationModel) object;

            if (insert.equals(true)) {
                insert = storeInformationDAO.createRecord(model);
                if (insert.equals(true)) {
                    returnModel.setReturnMessage("0");
                }
            }
        } catch (Exception e) {
            String ss = " Class : StoreInformationController  Method   : createRecord Exception :" + e.getMessage();
            log.debug(ss);
        }
        return returnModel;
    }

    @Override
    public Object updateRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public StoreInformationModel tableValues() {
        StoreInformationModel listModel = new StoreInformationModel();
        try {
            StoreInformationDAO storeInfoDAO = new StoreInformationDAO();
            listModel = storeInfoDAO.tableValues();
        } catch (Exception e) {
            log.debug("Class: StoreInformationController Method:tableValues Error = " + e.getMessage());
        }
        return listModel;
    }
}
