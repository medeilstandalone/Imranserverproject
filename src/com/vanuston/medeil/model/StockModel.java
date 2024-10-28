/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.model;

import java.io.Serializable;

/**
 *
 * @author Administrator
 */
public class StockModel implements Serializable{
    private static final long serialVersionUID = 1L;
private int Stock_itemCode;
private int  Stock_ssNo;
private int Prev_Stock_ssnNO;
private String  Stock_itemName;
private String Stock_rackNo;
private String  Stock_shelfNo;
private String  Stock_coldStorage;
private String Stock_batchNo;
private int Stock_qty;
private int Stock_packing;
private String Stock_expiryDate;
private double Stock_mrp;
private double Stock_purchasePrice;
private double Stock_sellingPrice;
private double Stock_margin;
private String Stock_formulation;
private String stock_date;
private int Stock_minQty;
private String dosage;
private int passValue;
private String getDrugCharacter;
private double vat;
private int physicalStock;
private double actualStockvalue;
private double physicalStockvalue;
private String remarks;

    public double getActualStockvalue() {
        return actualStockvalue;
    }

    public void setActualStockvalue(double actualStockvalue) {
        this.actualStockvalue = actualStockvalue;
    }

    public int getPhysicalStock() {
        return physicalStock;
    }

    public void setPhysicalStock(int physicalStock) {
        this.physicalStock = physicalStock;
    }

    public double getPhysicalStockvalue() {
        return physicalStockvalue;
    }

    public void setPhysicalStockvalue(double physicalStockvalue) {
        this.physicalStockvalue = physicalStockvalue;
    }

    public String getRemarks() {
        return remarks;
    }

    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    public double getVat() {
        return vat;
    }

    public void setVat(double vat) {
        this.vat = vat;
    }

    /**
     * @return the Stock_itemCode
     */
    public int getStock_itemCode() {
        return Stock_itemCode;
    }

    /**
     * @param Stock_itemCode the Stock_itemCode to set
     */
    public void setStock_itemCode(int Stock_itemCode) {
        this.Stock_itemCode = Stock_itemCode;
    }

    /**
     * @return the Stock_ssNo
     */
    public int getStock_ssNo() {
        return Stock_ssNo;
    }

    /**
     * @param Stock_ssNo the Stock_ssNo to set
     */
    public void setStock_ssNo(int Stock_ssNo) {
        this.Stock_ssNo = Stock_ssNo;
    }

    /**
     * @return the Stock_itemName
     */
    public String getStock_itemName() {
        return Stock_itemName;
    }

    /**
     * @param Stock_itemName the Stock_itemName to set
     */
    public void setStock_itemName(String Stock_itemName) {
        this.Stock_itemName = Stock_itemName;
    }

    /**
     * @return the Stock_rackNo
     */
    public String getStock_rackNo() {
        return Stock_rackNo;
    }

    /**
     * @param Stock_rackNo the Stock_rackNo to set
     */
    public void setStock_rackNo(String Stock_rackNo) {
        this.Stock_rackNo = Stock_rackNo;
    }

    /**
     * @return the Stock_shelfNo
     */
    public String getStock_shelfNo() {
        return Stock_shelfNo;
    }

    /**
     * @param Stock_shelfNo the Stock_shelfNo to set
     */
    public void setStock_shelfNo(String Stock_shelfNo) {
        this.Stock_shelfNo = Stock_shelfNo;
    }

    /**
     * @return the Stock_coldStorage
     */
    public String getStock_coldStorage() {
        return Stock_coldStorage;
    }

    /**
     * @param Stock_coldStorage the Stock_coldStorage to set
     */
    public void setStock_coldStorage(String Stock_coldStorage) {
        this.Stock_coldStorage = Stock_coldStorage;
    }

    /**
     * @return the Stock_batchNo
     */
    public String getStock_batchNo() {
        return Stock_batchNo;
    }

    /**
     * @param Stock_batchNo the Stock_batchNo to set
     */
    public void setStock_batchNo(String Stock_batchNo) {
        this.Stock_batchNo = Stock_batchNo;
    }

    /**
     * @return the Stock_qty
     */
    public int getStock_qty() {
        return Stock_qty;
    }

    /**
     * @param Stock_qty the Stock_qty to set
     */
    public void setStock_qty(int Stock_qty) {
        this.Stock_qty = Stock_qty;
    }

    /**
     * @return the Stock_packing
     */
    public int getStock_packing() {
        return Stock_packing;
    }

    /**
     * @param Stock_packing the Stock_packing to set
     */
    public void setStock_packing(int Stock_packing) {
        this.Stock_packing = Stock_packing;
    }

    /**
     * @return the Stock_expiryDate
     */
    public String getStock_expiryDate() {
        return Stock_expiryDate;
    }

    /**
     * @param Stock_expiryDate the Stock_expiryDate to set
     */
    public void setStock_expiryDate(String Stock_expiryDate) {
        this.Stock_expiryDate = Stock_expiryDate;
    }

    /**
     * @return the Stock_mrp
     */
    public double getStock_mrp() {
        return Stock_mrp;
    }

    /**
     * @param Stock_mrp the Stock_mrp to set
     */
    public void setStock_mrp(double Stock_mrp) {
        this.Stock_mrp = Stock_mrp;
    }

    /**
     * @return the Stock_purchasePrice
     */
    public double getStock_purchasePrice() {
        return Stock_purchasePrice;
    }

    /**
     * @param Stock_purchasePrice the Stock_purchasePrice to set
     */
    public void setStock_purchasePrice(double Stock_purchasePrice) {
        this.Stock_purchasePrice = Stock_purchasePrice;
    }

    /**
     * @return the Stock_sellingPrice
     */
    public double getStock_sellingPrice() {
        return Stock_sellingPrice;
    }

    /**
     * @param Stock_sellingPrice the Stock_sellingPrice to set
     */
    public void setStock_sellingPrice(double Stock_sellingPrice) {
        this.Stock_sellingPrice = Stock_sellingPrice;
    }

    /**
     * @return the Stock_margin
     */
    public double getStock_margin() {
        return Stock_margin;
    }

    /**
     * @param Stock_margin the Stock_margin to set
     */
    public void setStock_margin(double Stock_margin) {
        this.Stock_margin = Stock_margin;
    }

    /**
     * @return the Stock_formulation
     */
    public String getStock_formulation() {
        return Stock_formulation;
    }

    /**
     * @param Stock_formulation the Stock_formulation to set
     */
    public void setStock_formulation(String Stock_formulation) {
        this.Stock_formulation = Stock_formulation;
    }

    /**
     * @return the stock_date
     */
    public String getStock_date() {
        return stock_date;
    }

    /**
     * @param stock_date the stock_date to set
     */
    public void setStock_date(String stock_date) {
        this.stock_date = stock_date;
    }

    /**
     * @return the Stock_minQty
     */
    public int getStock_minQty() {
        return Stock_minQty;
    }

    /**
     * @param Stock_minQty the Stock_minQty to set
     */
    public void setStock_minQty(int Stock_minQty) {
        this.Stock_minQty = Stock_minQty;
    }

    /**
     * @return the passValue
     */
    public int getPassValue() {
        return passValue;
    }

    /**
     * @param passValue the passValue to set
     */
    public void setPassValue(int passValue) {
        this.passValue = passValue;
    }

    /**
     * @return the dosage
     */
    public String getDosage() {
        return dosage;
    }

    /**
     * @param dosage the dosage to set
     */
    public void setDosage(String dosage) {
        this.dosage = dosage;
    }

    /**
     * @return the getDrugCharacter
     */
    public String getGetDrugCharacter() {
        return getDrugCharacter;
    }

    /**
     * @param getDrugCharacter the getDrugCharacter to set
     */
    public void setGetDrugCharacter(String getDrugCharacter) {
        this.getDrugCharacter = getDrugCharacter;
    }

    /**
     * @return the Prev_Stock_ssnNO
     */
    public int getPrev_Stock_ssnNO() {
        return Prev_Stock_ssnNO;
    }

    /**
     * @param Prev_Stock_ssnNO the Prev_Stock_ssnNO to set
     */
    public void setPrev_Stock_ssnNO(int Prev_Stock_ssnNO) {
        this.Prev_Stock_ssnNO = Prev_Stock_ssnNO;
    }


}
