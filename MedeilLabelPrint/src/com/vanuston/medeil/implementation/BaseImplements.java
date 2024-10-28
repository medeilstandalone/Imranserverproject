/*
 *   PROBILZ – Retail Management System (RMS) To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.implementation;

import java.rmi.Remote;
import java.rmi.RemoteException;

/**
 *
 * @author Administrator
 */
public interface BaseImplements extends Remote {
Object createRecord (Object object) throws RemoteException;
Object viewRecord (Object object) throws RemoteException;
Object updateRecord (Object object) throws RemoteException;
boolean deleteRecord (Object object) throws RemoteException;
}
