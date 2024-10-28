/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.CreditNoteDAO;
import com.vanuston.medeil.implementation.CreditNote;
import com.vanuston.medeil.model.CreditNoteModel;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;


/**
 *
 * @author Administrator
 */
public class CreditNoteController extends UnicastRemoteObject implements CreditNote {

    public CreditNoteController () throws RemoteException {
        super () ;
    }


    @Override
    public Object viewRecord (Object name) {
        CreditNoteDAO creditNoteDAO = new CreditNoteDAO () ;
        return creditNoteDAO.viewRecord (name) ;
    }

    @Override
    public boolean deleteRecord(Object creditNoteNo) {
        CreditNoteDAO creditNoteDAO = new CreditNoteDAO () ;
        return creditNoteDAO.deleteRecord (creditNoteNo) ;
    }

    @Override
    public Object createRecord(Object creditNoteModel) {
        CreditNoteDAO creditNoteDAO = new CreditNoteDAO () ;
        return creditNoteDAO.createRecord (creditNoteModel) ;
    }

    @Override
    public Object updateRecord(Object creditNoteModel) {
        CreditNoteDAO creditNoteDAO = new CreditNoteDAO () ;
        return creditNoteDAO.updateRecord (creditNoteModel) ;
    }
    @Override
    public CreditNoteModel viewRecord(String tableName, String No) {
        CreditNoteDAO creditNoteDAO = new CreditNoteDAO () ;
        return creditNoteDAO.viewRecord (tableName, No) ;
    }
}
