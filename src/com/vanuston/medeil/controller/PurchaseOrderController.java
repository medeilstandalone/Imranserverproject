/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.PurchaseOrderDAO;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.implementation.PurchaseOrder;
import com.vanuston.medeil.model.MsgReturnModel;
import com.vanuston.medeil.model.PurchaseOrderModel;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Logger;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class PurchaseOrderController extends UnicastRemoteObject implements PurchaseOrder {

    private static final long serialVersionUID = 1L;

    public PurchaseOrderController() throws RemoteException {
        super();
    }
    static Logger log = Logger.getLogger(SalesController.class, "PurchaseOrderController");
    DateUtils dutil = new DateUtils();

    @Override
    public Object viewRecord(Object billNum) throws RemoteException {
        PurchaseOrderModel purcModel = (PurchaseOrderModel) billNum;
        PurchaseOrderModel poModel = new PurchaseOrderModel();
        try {
            PurchaseOrderDAO purchaseOrderDAO = new PurchaseOrderDAO();
            poModel = (PurchaseOrderModel) purchaseOrderDAO.viewRecord(purcModel);
        } catch (Exception e) {
            String ss = " Class : PurchaseOrderController  Method   : viewRecord    Exception :" + e.getMessage();
            log.debug(ss);
        }
        return poModel;
    }

    @Override
    public boolean deleteRecord(Object object) throws RemoteException {
        PurchaseOrderDAO purcDAO = new PurchaseOrderDAO();
        Boolean retVal = purcDAO.deleteRecord(object);
        return retVal;
    }

    public Object purcTableValidation(PurchaseOrderModel model) throws RemoteException {
        MsgReturnModel returnModel = new MsgReturnModel();
        List<PurchaseOrderModel> list = model.getListofitems();
        returnModel.setReturnFlag(false);
        returnModel.setReturnMessage("0");
        try {
            PurchaseOrderModel purcModel;
            for (int index = 0; index < list.size(); index++) {
                purcModel = new PurchaseOrderModel();
                purcModel = list.get(index);
                if (purcModel.getPurcOrderQty() <= 0) {
                    returnModel.setRowCount(index);
                    returnModel.setColumnCount(4);
                    returnModel.setReturnMessage(purcModel.getPurcOrderIN() + " this Medicine's Quantity is Empty or Zero. Please Enter Some Value.");
                    returnModel.setReturnFlag(true);
                    break;
                }
                if (Integer.parseInt(purcModel.getPurcOrderPack()) <= 0) {
                    returnModel.setRowCount(index);
                    returnModel.setColumnCount(5);
                    returnModel.setReturnMessage(purcModel.getPurcOrderIN() + " this Medicine's Pack is Empty or Zero. Please Enter Some Value.");
                    returnModel.setReturnFlag(true);
                    break;
                }
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseOrderController  Method   : purcTableValidation Exception :" + e.getMessage();
            log.debug(ss);
        }
        return returnModel;
    }

    @Override
    public Object createRecord(Object object) throws RemoteException {
        CommonImplements commonController = new CommonController();
        MsgReturnModel returnModel = new MsgReturnModel();
        PurchaseOrderDAO purcDAO = new PurchaseOrderDAO();
        Object insert;
        try {
            PurchaseOrderModel model = (PurchaseOrderModel) object;
            returnModel = (MsgReturnModel) purcTableValidation(model);
            if (!returnModel.isReturnFlag()) {
                if (model.getActionType().equals("OrderNow") && model.getSearchString().equals("Update [F7]") && model.getSearchSubstr().equals("PSOL")) {
                    model.setPurcOrderNo(model.getPurcOrderNo());
                    model.setTabName("purchase_order_later");
                    boolean isExc = deleteRecord(model);
                    if (isExc == true) {
                        model.setPurcOrderNo(commonController.getAutoIncrement(dutil.normalFormatDate(model.getPurcOrderDate()), "PurchaseOrder"));
                    }
                } else if (model.getActionType().equals("OrderNow") && model.getSearchString().equals("Update [F7]") && model.getSearchSubstr().equals("PSOR")) {
                    model.setPurcOrderNo(model.getPurcOrderNo());
                    model.setTabName("purchase_order");
                    deleteRecord(model);
                } else if (model.getActionType().equals("Update") && model.getLogText().equals("Update [F7]") && model.getSearchSubstr().equals("PSOR")) {
                    model.setTabName("purchase_order");
                    model.setActionType("OrderNow");
                    deleteRecord(model);
                } else if (model.getActionType().equals("Update") && model.getLogText().equals("Update [F7]") && model.getSearchSubstr().equals("PSOL")) {
                    model.setTabName("purchase_order_later");
                    model.setActionType("Save");
                    deleteRecord(model);
                }
                insert = purcDAO.createRecord(model);
                if (insert.equals(true)) {
                    returnModel.setReturnMessage("0");
                }
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseOrderController  Method   : createRecord Exception :" + e.getMessage();
            log.debug(ss);
        }
        return returnModel;
    }

    @Override
    public Object updateRecordVal(Object object) throws RemoteException {
        MsgReturnModel returnModel = new MsgReturnModel();
        try {
            PurchaseOrderModel model = (PurchaseOrderModel) object;
            MsgReturnModel tempModel = (MsgReturnModel) purcTableValidation(model);
            returnModel = tempModel;
            if (!returnModel.isReturnFlag()) {
                returnModel.setReturnMessage("1");
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseController  Method   : updateRecordPurchase Exception :" + e.getMessage();
            log.debug(ss);
        }
        return returnModel;
    }

    @Override
    public Object updateRecord(Object object) throws RemoteException {
        PurchaseOrderDAO purcDAO = new PurchaseOrderDAO();
        Object retVal = purcDAO.updateRecord(object);
        return retVal;
    }

    @Override
    public Object updateRecord1(Object object) throws RemoteException {
        PurchaseOrderDAO purcDAO = new PurchaseOrderDAO();
        Object retVal = purcDAO.updateRecord1(object);
        return retVal;
    }

    @Override
    public boolean updateLog(PurchaseOrderModel purcModel) throws RemoteException {
        PurchaseOrderDAO purchaseOrderDAO = new PurchaseOrderDAO();
        boolean isSave = false;
        try {
            if (purchaseOrderDAO.updateLog(purcModel)) {
                isSave = true;
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseOrderController  Method   : updateLog Exception :" + e.getMessage();
            log.debug(ss);
            isSave = false;
        }
        return isSave;
    }

    @Override
    public List<String> getDistributorsForPO(String name) throws RemoteException {
        PurchaseOrderDAO purchaseOrderDAO = new PurchaseOrderDAO();
        List<String> distributors = purchaseOrderDAO.getDistributorsForPO(name);
        return distributors;
    }

    @Override
    public List<String> getSuplierDetailsForPO(String name) throws RemoteException {
        PurchaseOrderDAO purchaseOrderDAO = new PurchaseOrderDAO();
        List<String> distributors = purchaseOrderDAO.getSuplierDetailsForPO(name);
        return distributors;
    }

    @Override
    public List<String> getSuplierDetails(String name) throws RemoteException {
        PurchaseOrderDAO purchaseOrderDAO = new PurchaseOrderDAO();
        List<String> distributors = purchaseOrderDAO.getSuplierDetails(name);
        return distributors;
    }

    @Override
    public List<String> getPurcOrderDetailPDF(String tabName, String billNO) throws RemoteException {
        PurchaseOrderDAO purchaseOrderDAO = new PurchaseOrderDAO();
        List<String> details = purchaseOrderDAO.getPurcOrderDetailPDF(tabName, billNO);
        return details;
    }

    @Override
    public Object getPurcOrderTDetailPDF(String tabName, String billNO) throws RemoteException {
        PurchaseOrderDAO purchaseOrderDAO = new PurchaseOrderDAO();
        Object details = purchaseOrderDAO.getPurcOrderTDetailPDF(tabName, billNO);
        return details;
    }

    @Override
    public Object getPurcOrderNowTDetailPDF(String billNO) throws RemoteException {
        PurchaseOrderDAO purchaseOrderDAO = new PurchaseOrderDAO();
        Object details = purchaseOrderDAO.getPurcOrderNowTDetailPDF(billNO);
        return details;
    }

    @Override
    public List<PurchaseOrderModel> loadSendPurcOrderTable() throws RemoteException {
        PurchaseOrderDAO purchaseOrderDAO = new PurchaseOrderDAO();
        List<PurchaseOrderModel> details = purchaseOrderDAO.loadSendPurcOrderTable();
        return details;
    }

    @Override
    public List<PurchaseOrderModel> viewSendPurcOrderTable(String billNo) throws RemoteException {
        PurchaseOrderDAO purchaseOrderDAO = new PurchaseOrderDAO();
        List<PurchaseOrderModel> details = purchaseOrderDAO.viewSendPurcOrderTable(billNo);
        return details;
    }

    @Override
    public Object updateSendPurcOrderTable(Object billNo) throws RemoteException {
        PurchaseOrderDAO purcDAO = new PurchaseOrderDAO();
        Object retVal = purcDAO.updateSendPurcOrderTable(billNo);
        return retVal;
    }

    @Override
    public List<PurchaseOrderModel> getSendPurcOrderTablePDF(String billNo) throws RemoteException {
        PurchaseOrderDAO purchaseOrderDAO = new PurchaseOrderDAO();
        List<PurchaseOrderModel> details = purchaseOrderDAO.getSendPurcOrderTablePDF(billNo);
        return details;
    }

    @Override
    public List<String> billNum(String name) throws RemoteException {
        PurchaseOrderDAO purchaseOrderDAO = new PurchaseOrderDAO();
        List<String> iname = purchaseOrderDAO.billNum(name);
        return iname;
    }

    @Override
    public List<String> getItemDetails(String name) throws RemoteException {
        PurchaseOrderDAO purchaseOrderDAO = new PurchaseOrderDAO();
        List<String> details = purchaseOrderDAO.getItemDetails(name);
        return details;
    }

    @Override
    public Object getDrugTableValues(String name) throws RemoteException {
        PurchaseOrderDAO purchaseOrderDAO = new PurchaseOrderDAO();
        Object details = purchaseOrderDAO.getDrugTableValues(name);
        return details;
    }

    @Override
    public int getCheckPurchaseOrderSMS() throws RemoteException {
        PurchaseOrderDAO purchaseOrderDAO = new PurchaseOrderDAO();
        int details = purchaseOrderDAO.getCheckPurchaseOrderSMS();
        return details;
    }

    @Override
    public int getCheckPurchaseOrderEMail() throws RemoteException {
        PurchaseOrderDAO purchaseOrderDAO = new PurchaseOrderDAO();
        int details = purchaseOrderDAO.getCheckPurchaseOrderEMail();
        return details;
    }

    @Override
    public int getCheckPurchaseOrderEMailHTML() throws RemoteException {
        PurchaseOrderDAO purchaseOrderDAO = new PurchaseOrderDAO();
        int details = purchaseOrderDAO.getCheckPurchaseOrderEMailHTML();
        return details;
    }

    @Override
    public List<String> getPoNumbers(String name) throws RemoteException {
        PurchaseOrderDAO purchaseOrderDAO = new PurchaseOrderDAO();
        return purchaseOrderDAO.getPoNumbers(name);
    }

    public boolean checkEmptyField(String testString, String type) throws RemoteException {
        boolean flag = false;
        try {
            int qty = 0;
            double prz = 0.0;
            if (type.equalsIgnoreCase("QTY")) {
                qty = Integer.parseInt(testString);
                if (qty > 0) {
                    flag = true;
                } else {
                    flag = false;
                }
            } else {
                prz = Double.parseDouble(testString);
                if (prz > 0) {
                    flag = true;
                } else {
                    flag = false;
                }
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseOrderController  Method   : checkEmptyField Exception :" + e.getMessage();
            log.debug(ss);
        }
        return flag;
    }
 
}
