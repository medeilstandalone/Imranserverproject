/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.implementation;

import com.vanuston.medeil.model.PurchaseOrderModel;
import java.rmi.RemoteException;
import java.util.List;

/**
 *
 * @author Administrator
 */
public interface PurchaseOrder extends BaseImplements {

    boolean updateLog(PurchaseOrderModel purcModel) throws RemoteException;

    List<String> getDistributorsForPO(String name) throws RemoteException;

    List<String> getSuplierDetailsForPO(String name) throws RemoteException;

    List<String> billNum(String name) throws RemoteException;

    List<String> getItemDetails(String name) throws RemoteException;

    Object getDrugTableValues(String name) throws RemoteException;

    List<String> getPurcOrderDetailPDF(String tabName, String billNO) throws RemoteException;

    Object getPurcOrderTDetailPDF(String tabName, String billNO) throws RemoteException;

    int getCheckPurchaseOrderSMS() throws RemoteException;

    int getCheckPurchaseOrderEMail() throws RemoteException;

    int getCheckPurchaseOrderEMailHTML() throws RemoteException;

    Object updateRecordVal(Object object) throws RemoteException;

    Object updateRecord1(Object object) throws RemoteException;

    List<String> getSuplierDetails(String name) throws RemoteException;

    Object getPurcOrderNowTDetailPDF(String billNO) throws RemoteException;

    List<PurchaseOrderModel> loadSendPurcOrderTable() throws RemoteException;

    List<PurchaseOrderModel> viewSendPurcOrderTable(String billNo) throws RemoteException;

    Object updateSendPurcOrderTable(Object billNo) throws RemoteException;

    List<PurchaseOrderModel> getSendPurcOrderTablePDF(String billNo) throws RemoteException;

    List<String> getPoNumbers(String name) throws RemoteException;
}
