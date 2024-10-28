/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.DamageStockDAO;
import com.vanuston.medeil.implementation.DamageStock;
import com.vanuston.medeil.model.DamageStockModel;
import com.vanuston.medeil.util.Logger;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
/**
 *
 * @author Administrator
 */
public class DamageStockController extends UnicastRemoteObject implements DamageStock {

    public DamageStockController() throws RemoteException {
        super() ;
    }
    Logger log = Logger.getLogger(DamageStockController.class,"DamageStockController");
    @Override
    public Object createRecord(Object damagestockBean) {
        Object flag = false;
        try {
            DamageStockDAO damagestockDAO = new DamageStockDAO();
            flag = damagestockDAO.createRecord(damagestockBean);
        } catch (Exception e) {
            log.debug("Method:DamageStockController Exception:"+e.getMessage());
            flag = false;
        }
        return flag;
    }

    @Override
    public Object viewRecord(Object damagestockBean) {
        Object flag = false;
        try {
            DamageStockDAO damagestockDAO = new DamageStockDAO();
            flag = damagestockDAO.viewRecord(damagestockBean);
        } catch (Exception e) {
            log.debug("Method:viewRecord Exception:"+e.getMessage());
            flag = false;
        }
        return flag;
    }

    @Override
    public Object updateRecord(Object damagestockBeans) {
        Object flag = false;
        try {
            DamageStockModel damagestockBean = (DamageStockModel) damagestockBeans;
            DamageStockDAO damagestockDAO = new DamageStockDAO();
            flag = damagestockDAO.updateRecord(damagestockBean);
        } catch (Exception e) {
            log.debug("Method:updateRecord Exception:"+e.getMessage());
            flag = false;
        }
        return flag;
    }

    @Override
    public boolean deleteRecord(Object damagestockBeans) {
        boolean flag = false;
        try {
            DamageStockDAO damagestockDAO = new DamageStockDAO();
            DamageStockModel damagestockBean = (DamageStockModel) damagestockBeans;
            flag = damagestockDAO.deleteRecord(damagestockBean);
        } catch (Exception e) {
            log.debug("Method:deleteRecord Exception:"+e.getMessage());
            flag = false;
        }
        return flag;
    }

    @Override
    public DamageStockModel viewAllRecord(DamageStockModel damagestockBeans) {       
        DamageStockDAO damagestockDAO = new DamageStockDAO();
        return damagestockDAO.viewAllRecord(damagestockBeans);
    }

}
