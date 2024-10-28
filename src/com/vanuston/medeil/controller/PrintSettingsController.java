/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.PrintSettingsDAO;
import com.vanuston.medeil.implementation.PrintSettings;
import com.vanuston.medeil.util.Logger;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

/**
 *
 * @author Administrator
 */
public class PrintSettingsController extends UnicastRemoteObject implements PrintSettings {

   public PrintSettingsController() throws RemoteException {
        super();
    }
    static Logger log = Logger.getLogger(PrintSettingsController.class, "com.vanuston.medeil.controller.PrintSettingsController");
    @Override
    public Object viewRecord(Object object) {
        PrintSettingsDAO dao = new PrintSettingsDAO();
        return dao.viewRecord(object);
    }

    @Override
    public boolean deleteRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Object createRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Object updateRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
