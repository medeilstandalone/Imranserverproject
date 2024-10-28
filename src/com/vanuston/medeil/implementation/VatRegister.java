/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.implementation;

import com.vanuston.medeil.model.VatRegisterModel;
import java.rmi.RemoteException;
import java.util.List;



public interface VatRegister extends BaseImplements {
  public boolean insertSalesVat(List<VatRegisterModel> list) throws RemoteException;
  public VatRegisterModel viewAllRecord(Object vatregisterBean) throws RemoteException;
}
