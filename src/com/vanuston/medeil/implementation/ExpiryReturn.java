/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.implementation;

import com.vanuston.medeil.model.ExpiryReturnModel;
import java.rmi.RemoteException;

/**
 *
 * @author Administrator
 */
public interface ExpiryReturn extends BaseImplements {
public ExpiryReturnModel viewAllRecord(ExpiryReturnModel expiryreturnBean)throws RemoteException;
}
