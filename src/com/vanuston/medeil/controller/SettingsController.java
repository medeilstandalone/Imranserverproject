/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.SettingsDAO;
import com.vanuston.medeil.implementation.Settings;
import com.vanuston.medeil.model.CustomerTypeModel;
import com.vanuston.medeil.model.MsgReturnModel;
import com.vanuston.medeil.model.SettingsModel;
import com.vanuston.medeil.util.Logger;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

/**
 *
 * @author saran
 */
public class SettingsController extends UnicastRemoteObject implements Settings {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	static Logger log = Logger.getLogger(SettingsController.class, "com.vanuston.medeil.controller.SettingsController");

    public SettingsController() throws RemoteException {
        super();
    }

    @Override
    public Object createRecord(Object object) {
        MsgReturnModel returnModel = new MsgReturnModel();
        SettingsDAO settingsDAO = new SettingsDAO();
        Object insert = true;
        try {
            SettingsModel model = (SettingsModel) object;
            if (insert.equals(true)) {
                insert = settingsDAO.createRecord(model);
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
    public Object viewRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Object updateRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean deleteRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public SettingsModel displaySettingValues() {
        SettingsModel settingsModel = new SettingsModel();
        try {
            SettingsDAO settingDAO = new SettingsDAO();
            settingsModel = settingDAO.displaySettingValues();
        } catch (Exception e) {
            log.debug("Class: SettingController Method : displaySettingsValues Error = " + e.getMessage());
        }
        return settingsModel;
    }

    @Override
    public Integer[] getEnableAutoRoundoff() throws RemoteException {
        SettingsDAO settingDAO = new SettingsDAO();
        return settingDAO.getEnableAutoRoundoff();
    }

    @Override
    public Integer setEnableAutoRoundoff(Integer[] isAutornd) throws RemoteException {
        SettingsDAO settingDAO = new SettingsDAO();
        return settingDAO.setEnableAutoRoundoff(isAutornd);
    }

    @Override
    public int setSalesDiscountType(int salesDiscType) throws RemoteException {
        SettingsDAO settingDAO = new SettingsDAO();
        return settingDAO.setSalesDiscountType(salesDiscType);
    }

    @Override
    public int getSalesDiscountType() throws RemoteException {
        SettingsDAO settingDAO = new SettingsDAO();
        return settingDAO.getSalesDiscountType();
    }

    @Override
    public int getSalesInvoiceSettings() throws RemoteException {
        SettingsDAO settingDAO = new SettingsDAO();
        return settingDAO.getSalesInvoiceSettings();
    }
	
	@Override
    public CustomerTypeModel viewCustomerType () {
        CustomerTypeModel customerTypeModel = new CustomerTypeModel();
        try {
            SettingsDAO settingDAO = new SettingsDAO();
            customerTypeModel = settingDAO.viewCustomerType();
        } catch (Exception e) {
            log.debug("Class: SettingsController Method : viewCustomerType Error = " + e.getMessage());
        }
        return customerTypeModel ;
    }
	
	@Override
    public Boolean createCustomerType(CustomerTypeModel customerTypeModel){
       Boolean isCreate = false ;
        try {
            SettingsDAO settingDAO = new SettingsDAO();
            isCreate = settingDAO.createCustomerType(customerTypeModel);
        } catch (Exception e) {
            log.debug("Class: SettingController Method : createCustomerType Error = " + e.getMessage());
        }
        return isCreate;
    }
}
