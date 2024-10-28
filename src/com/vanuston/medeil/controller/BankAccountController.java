/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.BankAccountDAO;
import com.vanuston.medeil.dao.BankBookDAO;
import com.vanuston.medeil.implementation.BankAccount;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

/**
 *
 * @author Administrator
 */
public class BankAccountController extends UnicastRemoteObject implements BankAccount {

    
	private static final long serialVersionUID = 1L;
	public BankAccountController() throws RemoteException {
        super();
    }    
    
    @Override
    public Object viewRecord(Object bankDetails) {
        BankAccountDAO bankAccountDAO = new BankAccountDAO () ;
        return bankAccountDAO.viewRecord (bankDetails) ;
    }
    
    @Override
    public boolean deleteRecord(Object acNo) {
        BankAccountDAO bankAccountDAO = new BankAccountDAO () ;
        return bankAccountDAO.deleteRecord (acNo) ;
    }

    @Override
    public Object createRecord(Object Model) {

    	if (Model.getClass().toString().substring (32).equals ("BankAccountModel")) {
    		BankAccountDAO bankAccountDAO = new BankAccountDAO () ;
    		return bankAccountDAO.createRecord (Model) ;
    	} else {
    		BankBookDAO bankBookDAO = new BankBookDAO () ;
    		return bankBookDAO.createRecord (Model) ;
    	}
    }

    @Override
    public Object updateRecord(Object bankAccountModel) {
        BankAccountDAO bankAccountDAO = new BankAccountDAO () ;
        return bankAccountDAO.updateRecord (bankAccountModel) ;
    }    
}
