/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.ExpiryReturnDAO;
import com.vanuston.medeil.implementation.ExpiryReturn;
import com.vanuston.medeil.model.ExpiryReturnModel;
import com.vanuston.medeil.util.Logger;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

/**
 *
 * @author Administrator
 */
public class ExpiryReturnController extends UnicastRemoteObject implements ExpiryReturn {
    public ExpiryReturnController() throws RemoteException {
        super() ;
    }
    Logger log =Logger.getLogger(ExpiryReturnController.class,"ExpiryReturnController");
    @Override
    public Object viewRecord(Object expiryreturnBean) {
         Object flag = false;
        try {
           ExpiryReturnDAO expiryreturnDAO = new ExpiryReturnDAO();
            flag = expiryreturnDAO.viewRecord(expiryreturnBean);
        } catch (Exception e) {
            log.debug("Method:viewRecord Exception:"+e.getMessage());
            flag = false;
        }
        return flag;
    }

    @Override
    public boolean deleteRecord(Object expiryreturnBean) {
        boolean flag = false;
        try {
            ExpiryReturnDAO expiryreturnDAO = new ExpiryReturnDAO();
            flag = expiryreturnDAO.deleteRecord(expiryreturnBean);
        } catch (Exception e) {
            log.debug("Method:deleteRecord Exception:"+e.getMessage());
            flag = false;
        }
        return flag;
    }

    @Override
    public Object createRecord(Object expiryreturnBean) {
        Object flag = false;
        try {
            ExpiryReturnDAO expiryreturnDAO = new ExpiryReturnDAO();
            flag = expiryreturnDAO.createRecord(expiryreturnBean);
        } catch (Exception e) {
            log.debug("Method:createRecord Exception:"+e.getMessage());
            flag = false;
        }
        return flag;
    }

    @Override
    public Object updateRecord(Object expiryreturnBean) {
        Object flag = false;
        try {
            ExpiryReturnDAO expiryreturnDAO = new ExpiryReturnDAO();
            flag = expiryreturnDAO.updateRecord(expiryreturnBean);
        } catch (Exception e) {
            log.debug("Method:updateRecord Exception:"+e.getMessage());
            flag = false;
        }
        return flag;
    }

    @Override
    public ExpiryReturnModel viewAllRecord(ExpiryReturnModel expiryreturnBeans) {
        ExpiryReturnModel expiryReturnrList=new ExpiryReturnModel();
        try {
            ExpiryReturnDAO expiryreturnDAO = new ExpiryReturnDAO();
            ExpiryReturnModel expiryreturnBean=(ExpiryReturnModel) expiryreturnBeans;
            expiryReturnrList = expiryreturnDAO.viewAllRecord(expiryreturnBean);
        } catch (Exception e) {
            log.debug("Method:viewAllRecord Exception:"+e.getMessage());
        }
        return expiryReturnrList;
    }

}
