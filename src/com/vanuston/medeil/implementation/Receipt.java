/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.implementation;

import java.rmi.NotBoundException;
import java.rmi.Remote;
import java.rmi.RemoteException;

/**
 *
 * @author Administrator
 */
public interface Receipt extends BaseImplements,Remote {

    Object getCustomerBalanceAmount(Object object) throws RemoteException,NotBoundException;

    Object getBillDetails(Object object) throws RemoteException;

    Object getReceiptTableValues(Object object) throws RemoteException;
}
