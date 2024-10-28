/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.HospitalDAO;
import com.vanuston.medeil.implementation.Hospital;
import com.vanuston.medeil.model.HospitalModel;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;


/**
 *
 * @author Administrator
 */
public class HospitalController extends UnicastRemoteObject implements Hospital {

    public HospitalController() throws RemoteException {
        super();
    }

    @Override
    public Object createRecord(Object hospitalModels) {
        HospitalModel hospitalModel=(HospitalModel)hospitalModels;
        HospitalDAO hospitalDAO = new HospitalDAO();
        return hospitalDAO.createRecord(hospitalModel);
    }

    @Override
    public Object viewRecord(Object hospitalName) {
        HospitalDAO hospitalDAO=new HospitalDAO();
        return hospitalDAO.viewRecord(hospitalName);
    }

    @Override
    public Object updateRecord(Object hospitalModels) {
        HospitalModel hospitalModel=(HospitalModel)hospitalModels;
        HospitalDAO hospitalDAO = new HospitalDAO();
        return hospitalDAO.updateRecord(hospitalModel);
    }

    @Override
    public boolean deleteRecord(Object hospitalCode) {
        HospitalDAO hospitalDAO = new HospitalDAO();
        return hospitalDAO.deleteRecord( (String) hospitalCode ) ;
    }
}
