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
public interface Payment extends BaseImplements,Remote {

   Object getPaymentTableValues(Object object)throws RemoteException;
   Object getDistributorBalanceAmount(Object object)throws RemoteException,NotBoundException;
   Object getInvoiceDetails(String str)throws RemoteException;
}
