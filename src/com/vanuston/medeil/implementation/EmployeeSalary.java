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
public interface EmployeeSalary extends BaseImplements, Remote {
Object viewAllRecord() throws RemoteException;
}
