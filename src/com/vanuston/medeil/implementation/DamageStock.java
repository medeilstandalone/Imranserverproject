/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.implementation;

import com.vanuston.medeil.model.DamageStockModel;
import java.rmi.RemoteException;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public interface DamageStock extends BaseImplements {
public DamageStockModel viewAllRecord(DamageStockModel drugBean) throws RemoteException;
}
