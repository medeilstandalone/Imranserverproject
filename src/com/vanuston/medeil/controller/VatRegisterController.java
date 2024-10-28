/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.VatRegisterDAO;
import com.vanuston.medeil.implementation.VatRegister;
import com.vanuston.medeil.model.VatRegisterModel;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class VatRegisterController extends UnicastRemoteObject implements VatRegister {

    public VatRegisterController() throws RemoteException {
        super () ;
    }
@Override
    public Object viewRecord(Object vatregisterBean) {
        Object flag = false;
        try {
           VatRegisterDAO vatregisterDAO = new VatRegisterDAO();
            flag = vatregisterDAO.viewRecord(vatregisterBean);
        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
        }
        return flag;
    }

    @Override
    public boolean deleteRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Object createRecord(Object vatregisterBean) {
        Object flag = false;
        try {
            VatRegisterDAO vatregisterDAO = new VatRegisterDAO();
            flag = vatregisterDAO.createRecord(vatregisterBean);
        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
        }
        return flag;
    }

    @Override
    public Object updateRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public VatRegisterModel viewAllRecord(Object vatregisterBeans) {
        VatRegisterModel vatRegisterList=new VatRegisterModel();
        try {
            VatRegisterDAO vatregisterDAO = new VatRegisterDAO();
            VatRegisterModel vatregisterBean=(VatRegisterModel) vatregisterBeans;
            vatRegisterList = vatregisterDAO.viewAllRecord(vatregisterBean);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return vatRegisterList;
    }

    @Override
    public boolean insertSalesVat(List<VatRegisterModel> list) throws RemoteException {
        boolean flag = false;
        try {
            VatRegisterDAO vatregisterDAO = new VatRegisterDAO();
            flag = vatregisterDAO.insertSalesVat(list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return flag;
    }
}
