/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Vanuston
 */
public class PurchaseOrderModel implements Serializable {

    private static final long serialVersionUID = 1L;
    private String purcOrderNO;
    private String purcOrderDate;
    private String distName;
    private String distCode;
    private String distAddress;
    private String deliveryType;
    private String paymentType;
    private String itemCode;
    private String itemName;
    private String dosage;
    private Integer quantity;
    private String packing;
    private Integer totProduct;
    private Integer totQuantity;
    private Integer pon_flag;
    private String logText;
    private String actionType;
    private String searchString;
    private String searchSubstr;
    private String tabName;

    public String getTabName() {
        return tabName;
    }

    public void setTabName(String tabName) {
        this.tabName = tabName;
    }

    public String getSearchString() {
        return searchString;
    }

    public String getSearchSubstr() {
        return searchSubstr;
    }

    public void setSearchSubstr(String searchSubstr) {
        this.searchSubstr = searchSubstr;
    }

    public void setSearchString(String searchString) {
        this.searchString = searchString;
    }
    List<PurchaseOrderModel> listofitems = new ArrayList<PurchaseOrderModel>();

    public String getPurcOrderNo() {
        return purcOrderNO;
    }

    public void setPurcOrderNo(String purcOrderNO) {
        this.purcOrderNO = purcOrderNO;
    }

    public String getPurcOrderDate() {
        return purcOrderDate;
    }

    public void setPurcOrderDate(String purcOrderDate) {
        this.purcOrderDate = purcOrderDate;
    }

    public String getPurcOrderDN() {
        return distName;
    }

    public void setPurcOrderDN(String distName) {
        this.distName = distName;
    }

    public String getPurcOrderDC() {
        return distCode;
    }

    public void setPurcOrderDC(String distCode) {
        this.distCode = distCode;
    }

    public String getPurcOrderDA() {
        return distAddress;
    }

    public void setPurcOrderDA(String distAddress) {
        this.distAddress = distAddress;
    }

    public String getPurcOrderDTY() {
        return deliveryType;
    }

    public void setPurcOrderDTY(String deliveryType) {
        this.deliveryType = deliveryType;
    }

    public String getPurcOrderPTY() {
        return paymentType;
    }

    public void setPurcOrderPTY(String paymentType) {
        this.paymentType = paymentType;
    }

    public String getPurcOrderIC() {
        return itemCode;
    }

    public void setPurcOrderIC(String itemCode) {
        this.itemCode = itemCode;
    }

    public String getPurcOrderIN() {
        return itemName;
    }

    public void setPurcOrderIN(String itemName) {
        this.itemName = itemName;
    }

    public String getPurcOrderDos() {
        return dosage;
    }

    public void setPurcOrderDos(String dosage) {
        this.dosage = dosage;
    }

    public int getPurcOrderQty() {
        return quantity;
    }

    public void setPurcOrderQty(int quantity) {
        this.quantity = quantity;
    }

    public String getPurcOrderPack() {
        return packing;
    }

    public void setPurcOrderPack(String packing) {
        this.packing = packing;
    }

    public int getPurcOrderTP() {
        return totProduct;
    }

    public void setPurcOrderTP(int totProduct) {
        this.totProduct = totProduct;
    }

    public int getPurcOrderTQ() {
        return totQuantity;
    }

    public void setPurcOrderTQ(int totQuantity) {
        this.totQuantity = totQuantity;
    }

    public int getPurcOrderPOF() {
        return pon_flag;
    }

    public void setPurcOrderPOF(int pon_flag) {
        this.pon_flag = pon_flag;
    }

    public String getLogText() {
        return logText;
    }

    public void SetLogText(String logText) {
        this.logText = logText;
    }

    public List<PurchaseOrderModel> getListofitems() {
        return listofitems;
    }

    public void setListofitems(List<PurchaseOrderModel> listofitems) {
        this.listofitems = listofitems;
    }

    public String getActionType() {
        return actionType;
    }

    public void setActionType(String actionType) {
        this.actionType = actionType;
    }
}
