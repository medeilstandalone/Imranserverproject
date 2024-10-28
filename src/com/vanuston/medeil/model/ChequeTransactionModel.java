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
public class ChequeTransactionModel implements Serializable{

private static final long serialVersionUID = 1L;
private String chequeNumber;
private String accountNumber;
private String transactionType;
private String bankName;
private String issuedDate;
private String chequeStatus;
private String depositDate;
private String clearedDate;
private String issuedTo;
private double amount;
private boolean returnFlag;
private String particulars;
private int chequeID;
private String saveType;
private String created_on;
private int flagValue;
private int paidFlag;
    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getChequeNumber() {
        return chequeNumber;
    }

    public void setChequeNumber(String chequeNumber) {
        this.chequeNumber = chequeNumber;
    }

    public String getChequeStatus() {
        return chequeStatus;
    }

    public void setChequeStatus(String chequeStatus) {
        this.chequeStatus = chequeStatus;
    }

    public String getClearedDate() {
        return clearedDate;
    }

    public void setClearedDate(String clearedDate) {
        this.clearedDate = clearedDate;
    }

    public String getDepositDate() {
        return depositDate;
    }

    public void setDepositDate(String depositDate) {
        this.depositDate = depositDate;
    }

    public String getIssuedDate() {
        return issuedDate;
    }

    public void setIssuedDate(String issuedDate) {
        this.issuedDate = issuedDate;
    }

    public String getIssuedTo() {
        return issuedTo;
    }

    public void setIssuedTo(String issuedTo) {
        this.issuedTo = issuedTo;
    }

    public String getTransactionType() {
        return transactionType;
    }

    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }

    /**
     * @return the returnFlag
     */
    public boolean isReturnFlag() {
        return returnFlag;
    }

    /**
     * @param returnFlag the returnFlag to set
     */
    public void setReturnFlag(boolean returnFlag) {
        this.returnFlag = returnFlag;
    }

    /**
     * @return the particulars
     */
    public String getParticulars() {
        return particulars;
    }

    /**
     * @param particulars the particulars to set
     */
    public void setParticulars(String particulars) {
        this.particulars = particulars;
    }

    /**
     * @return the chequeID
     */
    public int getChequeID() {
        return chequeID;
    }

    /**
     * @param chequeID the chequeID to set
     */
    public void setChequeID(int chequeID) {
        this.chequeID = chequeID;
    }

    /**
     * @return the saveType
     */
    public String getSaveType() {
        return saveType;
    }

    /**
     * @param saveType the saveType to set
     */
    public void setSaveType(String saveType) {
        this.saveType = saveType;
    }

    /**
     * @return the created_on
     */
    public String getCreated_on() {
        return created_on;
    }

    /**
     * @param created_on the created_on to set
     */
    public void setCreated_on(String created_on) {
        this.created_on = created_on;
    }

    /**
     * @return the flagValue
     */
    public int getFlagValue() {
        return flagValue;
    }

    /**
     * @param flagValue the flagValue to set
     */
    public void setFlagValue(int flagValue) {
        this.flagValue = flagValue;
    }

    /**
     * @return the paidFlag
     */
    public int getPaidFlag() {
        return paidFlag;
    }

    /**
     * @param paidFlag the paidFlag to set
     */
    public void setPaidFlag(int paidFlag) {
        this.paidFlag = paidFlag;
    }
}
