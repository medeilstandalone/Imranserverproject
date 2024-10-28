/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

/**
 *
 * @author vanuston
 */
public class DoctorChargesModel implements Serializable {

    private static final long serialVersionUID = 1L;
    
    private String doctorcommisionCode;
    private String doctorCommisionName;
    private Date commisionStartDate;
    private Date commisionEndDate;
    private String itemCode;
    private String itemName;
    private int quantity;
    private double sellingPrice;
    private double amount;
    private double doctorMargin;
    private double chargeAmount;
    private double totalAmount;
    private String chargeId;
    private Date chargeDate;
    private List<DoctorChargesModel> chargesModelList;

    public List<DoctorChargesModel> getChargesModelList() {
        return chargesModelList;
    }

    public void setChargesModelList(List<DoctorChargesModel> chargesModelList) {
        this.chargesModelList = chargesModelList;
    }


    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public double getChargeAmount() {
        return chargeAmount;
    }

    public void setChargeAmount(double chargeAmount) {
        this.chargeAmount = chargeAmount;
    }

    public Date getChargeDate() {
        return chargeDate;
    }

    public void setChargeDate(Date chargeDate) {
        this.chargeDate = chargeDate;
    }

    public String getChargeId() {
        return chargeId;
    }

    public void setChargeId(String chargeId) {
        this.chargeId = chargeId;
    }

    public Date getCommisionEndDate() {
        return commisionEndDate;
    }

    public void setCommisionEndDate(Date commisionEndDate) {
        this.commisionEndDate = commisionEndDate;
    }

    public Date getCommisionStartDate() {
        return commisionStartDate;
    }

    public void setCommisionStartDate(Date commisionStartDate) {
        this.commisionStartDate = commisionStartDate;
    }

    public String getDoctorCommisionName() {
        return doctorCommisionName;
    }

    public void setDoctorCommisionName(String doctorCommisionName) {
        this.doctorCommisionName = doctorCommisionName;
    }

    public double getDoctorMargin() {
        return doctorMargin;
    }

    public void setDoctorMargin(double doctorMargin) {
        this.doctorMargin = doctorMargin;
    }

    public String getDoctorcommisionCode() {
        return doctorcommisionCode;
    }

    public void setDoctorcommisionCode(String doctorcommisionCode) {
        this.doctorcommisionCode = doctorcommisionCode;
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

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public double getSellingPrice() {
        return sellingPrice;
    }

    public void setSellingPrice(double sellingPrice) {
        this.sellingPrice = sellingPrice;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }

}
