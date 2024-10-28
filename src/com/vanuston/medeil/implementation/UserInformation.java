/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.implementation;

import com.vanuston.medeil.model.UserInformationModel;
import java.rmi.Remote;
import java.rmi.RemoteException;

/**
 *
 * @author Administrator
 */
public interface UserInformation extends BaseImplements,Remote{

    boolean getFormStatus(int type,String moduleType)throws RemoteException;
   UserInformationModel getUserDetails(String uname)throws RemoteException;
   UserInformationModel getEmployeeDetails(String name,String type)throws RemoteException;
   boolean getEmployeeValid(String empcode)throws RemoteException;
}
