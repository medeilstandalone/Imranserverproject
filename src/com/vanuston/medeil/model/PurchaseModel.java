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
public class PurchaseModel implements Serializable {

    private static final long serialVersionUID = 1L;
    private String purcBillno;
    private String purcRBillno;
    private String purcRBillDate;
    private String invoiceNo;
    private String invDate;
    private String distName;
    private String distCode;
    private String parcelNO;
    private String parcelDetails;
    private String purcType;
    private String itemCode;
    private String itemName;
    private String formulation;
    private String mfrName;
    private String batch;
    private Integer quantity;
    private String expdate;
    private double unitprice;
    private String packing;
    private Integer free;
    private double unitDis;
    private double unitVat;
    private double totVal;
    private double mrp;
    private double subTotal;
    private double schDisc;
    private double totDisc;
    private double totVat;
    private double totAmount;
    private double paidAmount;
    private double balAmount;
    private Integer totItem;
    private Integer totQuantity;
    private String purc_temp_flagid;
    private String purc_is_adj;
    private Integer purc_adj_flagid;
    private Integer pr_adjust_type;
    private String purc_adjust_no;
    private double purc_adjust_amt;
    private int serno;
    private int update_flagid;
    private String actionType;
    private String logText;
    private String moduleName;
    List<PurchaseModel> listofitems = new ArrayList<PurchaseModel>();
    private double totPurcAdjAmt;
    private double totPurcAdjDistAmt;
    private double totPurcAdjVAT4Amt;
    private int totPurcAdjItems;
    private int totPurcAdjQty;
    private String compareText;
    private double salesDiscount;

    public String getCompareText() {
        return compareText;
    }

    public void setCompareText(String compareText) {
        this.compareText = compareText;
    }

    public double getTotPurcAdjAmt() {
        return totPurcAdjAmt;
    }

    public void setTotPurcAdjAmt(double totPurcAdjAmt) {
        this.totPurcAdjAmt = totPurcAdjAmt;
    }

    public double getTotPurcAdjDistAmt() {
        return totPurcAdjDistAmt;
    }

    public void setTotPurcAdjDistAmt(double totPurcAdjDistAmt) {
        this.totPurcAdjDistAmt = totPurcAdjDistAmt;
    }

    public int getTotPurcAdjItems() {
        return totPurcAdjItems;
    }

    public void setTotPurcAdjItems(int totPurcAdjItems) {
        this.totPurcAdjItems = totPurcAdjItems;
    }

    public int getTotPurcAdjQty() {
        return totPurcAdjQty;
    }

    public void setTotPurcAdjQty(int totPurcAdjQty) {
        this.totPurcAdjQty = totPurcAdjQty;
    }

    public double getTotPurcAdjVAT4Amt() {
        return totPurcAdjVAT4Amt;
    }

    public void setTotPurcAdjVAT4Amt(double totPurcAdjVAT4Amt) {
        this.totPurcAdjVAT4Amt = totPurcAdjVAT4Amt;
    }

    public String getLogText() {
        return logText;
    }

    public void setLogText(String logText) {
        this.logText = logText;
    }

    public String getModuleName() {
        return moduleName;
    }

    public void setModuleName(String moduleName) {
        this.moduleName = moduleName;
    }

    public String getActionType() {
        return actionType;
    }

    public void setActionType(String actionType) {
        this.actionType = actionType;
    }

    public List<PurchaseModel> getListofitems() {
        return listofitems;
    }

    public void setListofitems(List<PurchaseModel> listofitems) {
        this.listofitems = listofitems;
    }

    public String getPurcRBillDate() {
        return purcRBillDate;
    }

    public void setPurcRBillDate(String purcRBillDate) {
        this.purcRBillDate = purcRBillDate;
    }

    public String getFormulation() {
        return formulation;
    }

    public void setFormulation(String formulation) {
        this.formulation = formulation;
    }

    public double getBalAmount() {
        return balAmount;
    }

    public void setBalAmount(double balAmount) {
        this.balAmount = balAmount;
    }

    public String getBatch() {
        return batch;
    }

    public void setBatch(String batch) {
        this.batch = batch;
    }

    public String getDistCode() {
        return distCode;
    }

    public void setDistCode(String distCode) {
        this.distCode = distCode;
    }

    public String getDistName() {
        return distName;
    }

    public void setDistName(String distName) {
        this.distName = distName;
    }

    public String getExpdate() {
        return expdate;
    }

    public void setExpdate(String expdate) {
        this.expdate = expdate;
    }

    public Integer getFree() {
        return free;
    }

    public void setFree(Integer free) {
        this.free = free;
    }

    public String getInvDate() {
        return invDate;
    }

    public void setInvDate(String invDate) {
        this.invDate = invDate;
    }

    public String getInvoiceNo() {
        return invoiceNo;
    }

    public void setInvoiceNo(String invoiceNo) {
        this.invoiceNo = invoiceNo;
    }

    public String getItemCode() {
        return itemCode;
    }

    public void setItemCode(String itemCode) {
        this.itemCode = itemCode;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public String getMfrName() {
        return mfrName;
    }

    public void setMfrName(String mfrName) {
        this.mfrName = mfrName;
    }

    public double getMrp() {
        return mrp;
    }

    public void setMrp(double mrp) {
        this.mrp = mrp;
    }

    public String getPacking() {
        return packing;
    }

    public void setPacking(String packing) {
        this.packing = packing;
    }

    public double getPaidAmount() {
        return paidAmount;
    }

    public void setPaidAmount(double paidAmount) {
        this.paidAmount = paidAmount;
    }

    public String getParcelDetails() {
        return parcelDetails;
    }

    public void setParcelDetails(String parcelDetails) {
        this.parcelDetails = parcelDetails;
    }

    public String getParcelNO() {
        return parcelNO;
    }

    public void setParcelNO(String parcelNO) {
        this.parcelNO = parcelNO;
    }

    public Integer getPr_adjust_type() {
        return pr_adjust_type;
    }

    public void setPr_adjust_type(Integer pr_adjust_type) {
        this.pr_adjust_type = pr_adjust_type;
    }

    public String getPurcBillno() {
        return purcBillno;
    }

    public void setPurcBillno(String purcBillno) {
        this.purcBillno = purcBillno;
    }

    public String getPurcRBillno() {
        return purcRBillno;
    }

    public void setPurcRBillno(String purcRBillno) {
        this.purcRBillno = purcRBillno;
    }

    public String getPurcType() {
        return purcType;
    }

    public void setPurcType(String purcType) {
        this.purcType = purcType;
    }

    public Integer getPurc_adj_flagid() {
        return purc_adj_flagid;
    }

    public void setPurc_adj_flagid(Integer purc_adj_flagid) {
        this.purc_adj_flagid = purc_adj_flagid;
    }

    public double getPurc_adjust_amt() {
        return purc_adjust_amt;
    }

    public void setPurc_adjust_amt(double purc_adjust_amt) {
        this.purc_adjust_amt = purc_adjust_amt;
    }

    public String getPurc_adjust_no() {
        return purc_adjust_no;
    }

    public void setPurc_adjust_no(String purc_adjust_no) {
        this.purc_adjust_no = purc_adjust_no;
    }

    public String getPurc_is_adj() {
        return purc_is_adj;
    }

    public void setPurc_is_adj(String purc_is_adj) {
        this.purc_is_adj = purc_is_adj;
    }

    public String getPurc_temp_flagid() {
        return purc_temp_flagid;
    }

    public void setPurc_temp_flagid(String purc_temp_flagid) {
        this.purc_temp_flagid = purc_temp_flagid;
    }

    public Integer getQuantity() {
        return quantity;
    }

    public void setQuantity(Integer quantity) {
        this.quantity = quantity;
    }

    public double getSchDisc() {
        return schDisc;
    }

    public void setSchDisc(double schDisc) {
        this.schDisc = schDisc;
    }

    public int getSerno() {
        return serno;
    }

    public void setSerno(int serno) {
        this.serno = serno;
    }

    public double getSubTotal() {
        return subTotal;
    }

    public void setSubTotal(double subTotal) {
        this.subTotal = subTotal;
    }

    public double getTotAmount() {
        return totAmount;
    }

    public void setTotAmount(double totAmount) {
        this.totAmount = totAmount;
    }

    public double getTotDisc() {
        return totDisc;
    }

    public void setTotDisc(double totDisc) {
        this.totDisc = totDisc;
    }

    public Integer getTotItem() {
        return totItem;
    }

    public void setTotItem(Integer totItem) {
        this.totItem = totItem;
    }

    public Integer getTotQuantity() {
        return totQuantity;
    }

    public void setTotQuantity(Integer totQuantity) {
        this.totQuantity = totQuantity;
    }

    public double getTotVal() {
        return totVal;
    }

    public void setTotVal(double totVal) {
        this.totVal = totVal;
    }

    public double getTotVat() {
        return totVat;
    }

    public void setTotVat(double totVat) {
        this.totVat = totVat;
    }

    public double getUnitDis() {
        return unitDis;
    }

    public void setUnitDis(double unitDis) {
        this.unitDis = unitDis;
    }

    public double getUnitVat() {
        return unitVat;
    }

    public void setUnitVat(double unitVat) {
        this.unitVat = unitVat;
    }

    public double getUnitprice() {
        return unitprice;
    }

    public void setUnitprice(double unitprice) {
        this.unitprice = unitprice;
    }

    public int getUpdate_flagid() {
        return update_flagid;
    }

    public void setUpdate_flagid(int update_flagid) {
        this.update_flagid = update_flagid;
    }

    /**
     * @return the salesDiscount
     */
    public double getSalesDiscount() {
        return salesDiscount;
    }

    /**
     * @param salesDiscount the salesDiscount to set
     */
    public void setSalesDiscount(double salesDiscount) {
        this.salesDiscount = salesDiscount;
    }
}
