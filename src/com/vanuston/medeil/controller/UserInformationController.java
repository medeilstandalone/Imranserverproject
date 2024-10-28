/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.UserInformationDAO;
import com.vanuston.medeil.implementation.UserInformation;
import com.vanuston.medeil.model.MsgReturnModel;
import com.vanuston.medeil.model.UserInformationModel;
import com.vanuston.medeil.util.Logger;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

/**
 *
 * @author Administrator
 */
public class UserInformationController extends UnicastRemoteObject implements UserInformation {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	static Logger log = Logger.getLogger(UserInformationController.class, "com.vanuston.medeil.controller.UserInformationController");

      public UserInformationController() throws RemoteException {
        super();
    }

    UserInformationDAO userInfoDAO;

    @Override
    public Object viewRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean deleteRecord(Object object) {
         userInfoDAO=new UserInformationDAO();
         return userInfoDAO.deleteRecord(object);
    }

    @Override
    public Object createRecord(Object object) {
        MsgReturnModel returnModel = new MsgReturnModel();
        UserInformationDAO userInformationDAO = new UserInformationDAO();
        Object insert = true;
        try {
            UserInformationModel model = (UserInformationModel) object;

            if (insert.equals(true)) {
                insert = userInformationDAO.createRecord(model);
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
    public boolean getFormStatus(int type, String moduleType) {
        userInfoDAO = new UserInformationDAO();
        return userInfoDAO.getFormStatus(type, moduleType);
    }

    @Override
    public UserInformationModel getUserDetails(String uname) {
        userInfoDAO = new UserInformationDAO();
        return userInfoDAO.getUserDetails(uname);
    }

    @Override
    public UserInformationModel getEmployeeDetails(String name, String type) {
        userInfoDAO = new UserInformationDAO();
        return userInfoDAO.getEmployeeDetails(name, type);
    }

    @Override
    public boolean getEmployeeValid(String empcode) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
