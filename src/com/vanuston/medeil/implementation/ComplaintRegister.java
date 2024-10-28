/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.implementation;

import java.rmi.RemoteException;

/**
 *
 * @author Administrator
 */
public interface ComplaintRegister extends BaseImplements{
    Object viewRecord(Object billNo,Object tablename) throws RemoteException ;

}
