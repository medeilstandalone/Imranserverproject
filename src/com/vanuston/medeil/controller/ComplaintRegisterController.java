/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.ComplaintRegisterDAO;
import com.vanuston.medeil.implementation.ComplaintRegister;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

/**
 *
 * @author Administrator
 */
public class ComplaintRegisterController extends UnicastRemoteObject implements ComplaintRegister {

    public ComplaintRegisterController() throws RemoteException {
        super () ;
    }


    @Override
    public Object viewRecord(Object billNo) {
        ComplaintRegisterDAO complaintRegisterDAO=new ComplaintRegisterDAO();
        return complaintRegisterDAO.viewRecord(billNo);
    }
    @Override
    public Object viewRecord(Object billNo,Object tablename) {
        ComplaintRegisterDAO complaintRegisterDAO=new ComplaintRegisterDAO();
        return complaintRegisterDAO.viewRecord(billNo,tablename);
    }

    @Override
    public boolean deleteRecord(Object complaintModel) {
        ComplaintRegisterDAO complaintRegisterDAO=new ComplaintRegisterDAO();
        return complaintRegisterDAO.deleteRecord(complaintModel);
    }

    @Override
    public Object createRecord(Object complaintModel) {
        ComplaintRegisterDAO complaintRegisterDAO=new ComplaintRegisterDAO();
        return complaintRegisterDAO.createRecord(complaintModel);
    }

    @Override
    public Object updateRecord(Object complaintModel) {
        ComplaintRegisterDAO complaintRegisterDAO=new ComplaintRegisterDAO();
        return complaintRegisterDAO.updateRecord(complaintModel);
    }
}
