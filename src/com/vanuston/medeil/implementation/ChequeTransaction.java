/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.implementation;

import com.vanuston.medeil.model.ChequeTransactionModel;
import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.List;

/**
 *
 * @author Administrator
 */
public interface ChequeTransaction extends BaseImplements,Remote {
int chequeNoAlreadyExists(String checqNo, Integer chq_id)throws RemoteException;
int getValidChequeNo(String acccountNo, String chgNo)throws RemoteException;
 boolean chequeTransactionClosingBalanceCalculation(ChequeTransactionModel chqModel)throws RemoteException;
 List<ChequeTransactionModel> displayChequeTransactionTableValues(String sql)throws RemoteException;
 ChequeTransactionModel displayChequeTransactionDetails(String ssNo)throws RemoteException;
}
