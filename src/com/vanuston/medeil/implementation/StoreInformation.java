/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.implementation;

import com.vanuston.medeil.model.StoreInformationModel;
import java.rmi.Remote;
import java.rmi.RemoteException;


/**
 *
 * @author Administrator
 */
public interface StoreInformation extends BaseImplements,Remote  {
StoreInformationModel tableValues()throws RemoteException;
}
