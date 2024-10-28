/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.implementation;
import com.vanuston.medeil.model.ChequeBookModel;
import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author Administrator
 */
public interface ChequeBook extends BaseImplements,Remote {

    ChequeBookModel getChqUsed(ChequeBookModel chequeBookModel)throws RemoteException;
    List<String> getChequeBookIDList(String accountNo)throws RemoteException;
    HashMap<String,String> getDetails(String acc_no, String id)throws RemoteException;
    HashMap<String,String> getStatus(String acc_no, String id)throws RemoteException;
    Integer getChequeBookValid(String acc_no, String id)throws RemoteException;
    List<ChequeBookModel> loadChequeTableValues()throws RemoteException;
}
