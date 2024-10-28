/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.CustomerAlertDAO;
import com.vanuston.medeil.implementation.CustomerAlerts;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

/**
 *
 * @author Administrator
 */
public class CustomerAlertsController extends UnicastRemoteObject implements CustomerAlerts {

    public CustomerAlertsController () throws RemoteException {
        super () ;
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
    public Object createRecord(Object customerModels) {
        CustomerAlertDAO customerAlertDAO = new CustomerAlertDAO();
        return customerAlertDAO.createRecord(customerModels);
    }

    @Override
    public Object updateRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
