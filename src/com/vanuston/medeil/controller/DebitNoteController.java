/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.DebitNoteDAO;
import com.vanuston.medeil.implementation.DebitNote;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

/**
 *
 * @author Administrator
 */
public class DebitNoteController extends UnicastRemoteObject implements DebitNote {

    public DebitNoteController() throws RemoteException {
        super () ;
    }


    @Override
    public Object viewRecord (Object NoteNo) {
        DebitNoteDAO debitNoteDAO = new DebitNoteDAO () ;
        return debitNoteDAO.viewRecord (NoteNo) ;
    }

    @Override
    public boolean deleteRecord (Object NoteNo) {
        DebitNoteDAO debitNoteDAO = new DebitNoteDAO () ;
        return debitNoteDAO.deleteRecord (NoteNo) ;
    }

    @Override
    public Object createRecord (Object debitNoteModels) {
        DebitNoteDAO debitNoteDAO = new DebitNoteDAO () ;
        return debitNoteDAO.createRecord (debitNoteModels) ;
    }

    @Override
    public Object updateRecord(Object debitNoteModels) {
        DebitNoteDAO debitNoteDAO = new DebitNoteDAO () ;
        return debitNoteDAO.updateRecord (debitNoteModels) ;
    }
}
