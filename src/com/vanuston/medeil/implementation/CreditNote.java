/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.implementation;

import com.vanuston.medeil.model.CreditNoteModel;
import java.rmi.Remote;
import java.rmi.RemoteException;

/**
 *
 * @author Administrator
 */
public interface CreditNote extends BaseImplements, Remote {
CreditNoteModel viewRecord(String tableName, String No) throws RemoteException ;
}
