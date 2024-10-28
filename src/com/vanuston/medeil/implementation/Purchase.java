/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.implementation;

import com.vanuston.medeil.model.PurchaseModel;
import java.rmi.RemoteException;
import java.util.List;

/**
 *
 * @author Administrator
 */
public interface Purchase extends BaseImplements {

    Object updateRecordPurchase(Object object) throws RemoteException;

    Object createRecordPR(Object object) throws RemoteException;

    Object updateRecordPR(Object object) throws RemoteException;

    boolean updateLog(PurchaseModel purcModel) throws RemoteException;

    List<String> PurchaseBillNum(String name) throws RemoteException;

    Object purchaseBillDetails(String invNO) throws RemoteException;

    List<String> prePurcBillDetails(String invNO,String icode) throws RemoteException;

    List<String> purcBillDetailsForPR(String invNO) throws RemoteException;

    List<String> PurcRetBill(String no) throws RemoteException;

    Object purcRBillDetails(String invNO) throws RemoteException;

    List<PurchaseModel> billNumFromDist(String name) throws RemoteException;

    List<String> getDistributorsForPurchase(String name) throws RemoteException;

    List<String> getSuplierDetailsForPurchase(String name) throws RemoteException;

    int getPurchaseChecked(String itemCode, Double mrp, Double purchasePrice) throws RemoteException;

    List<PurchaseModel> getDrugTableValues(String name) throws RemoteException;

    List<PurchaseModel> getTempStockValues() throws RemoteException;

    List<PurchaseModel> getPRAdjustValues(String billNum) throws RemoteException;

    List<PurchaseModel> getPurcReturnDatas(String billNum) throws RemoteException;

    Integer getPackingValue(String itemCode) throws RemoteException;

    String getFormulation(String code, String name) throws RemoteException;

    String getStockItmBat(String query) throws RemoteException;

    int getStockQty(String query) throws RemoteException;

    boolean checkInvoice(String invno) throws RemoteException;

    String chkPrePurcPrice(PurchaseModel model) throws RemoteException;

    List<String> prePurcOrderDetails(String invNO, String iname) throws RemoteException;

    PurchaseModel viewPorecords(String invNO) throws RemoteException;

    List<String> getLastPurDetails(String itemCode) throws RemoteException;

    List<PurchaseModel> getStockDetails(String itemCode) throws RemoteException;

    List<PurchaseModel> getBarcodeValues(String val) throws RemoteException;
}
