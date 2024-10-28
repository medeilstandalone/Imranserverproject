/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.implementation;

import com.vanuston.medeil.model.BankBookModel;
import java.rmi.Remote;
import java.rmi.RemoteException;

/**
 *
 * @author Administrator
 */
public interface BankBook extends BaseImplements,Remote{
Object dailyCashBookCalculation(Object object)throws RemoteException;
Object displayBankBookDetails(String str)throws RemoteException;
Object viewBankBookTableValues(BankBookModel model)throws RemoteException;
}
