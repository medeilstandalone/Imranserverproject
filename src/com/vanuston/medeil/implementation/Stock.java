/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.implementation;
import com.vanuston.medeil.model.StockModel;
import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public interface Stock extends BaseImplements,Remote{
  String getStockQty(String itemCode, String batchNumber) throws RemoteException;
  String getStockmrp(String itemCode, String batchNumber) throws RemoteException;
  ArrayList<StockModel> viewAllRecord(Object stockBean)throws RemoteException;
  int insertStockAdjustment(ArrayList<StockModel> stkAdjustmentList) throws RemoteException;
 String getStockFQty(String itemCode, String batchNumber) throws RemoteException;
 String getStockpackQty(String itemCode, String batchNumber) throws RemoteException;
}
