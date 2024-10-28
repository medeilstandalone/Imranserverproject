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
 * @author Administrator
 */
public class ReceiptModel implements Serializable {

    private static final long serialVersionUID = 1L;
    private String receiptNumber;
    private String receiptDate;
    private String customerName;
    private String paymentType;
    private String cardNumber;
    private String bankName;
    private String holderName;
    private String payTypeDate;
    private double totalBalanceDue;
    private String billNumber;
    private String billDate;
    private double billAmount;
    private double paidAmount;
    private double balanceAmount;
    private double totalPaidAmount;
    private double billBalanceAmount;
    private int rowCount;
    private String receiptHiddenNumber;
    private String transactionDetails;
    private String saveType;
    private boolean errorMessage;
    private double creditAmount;
    private double debitAmount;
    private String queryValue;
    private List<ReceiptModel> listofitems = new ArrayList<ReceiptModel>();

    public double getBalanceAmount() {
        return balanceAmount;
    }

    public void setBalanceAmount(double balanceAmount) {
        this.balanceAmount = balanceAmount;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public double getBillAmount() {
        return billAmount;
    }

    public void setBillAmount(double billAmount) {
        this.billAmount = billAmount;
    }

    public double getBillBalanceAmount() {
        return billBalanceAmount;
    }

    public void setBillBalanceAmount(double billBalanceAmount) {
        this.billBalanceAmount = billBalanceAmount;
    }

    public String getBillDate() {
        return billDate;
    }

    public void setBillDate(String billDate) {
        this.billDate = billDate;
    }

    public String getBillNumber() {
        return billNumber;
    }

    public void setBillNumber(String billNumber) {
        this.billNumber = billNumber;
    }

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getHolderName() {
        return holderName;
    }

    public void setHolderName(String holderName) {
        this.holderName = holderName;
    }

    public double getPaidAmount() {
        return paidAmount;
    }

    public void setPaidAmount(double paidAmount) {
        this.paidAmount = paidAmount;
    }

    public String getPayTypeDate() {
        return payTypeDate;
    }

    public void setPayTypeDate(String payTypeDate) {
        this.payTypeDate = payTypeDate;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
    }

    public String getReceiptDate() {
        return receiptDate;
    }

    public void setReceiptDate(String receiptDate) {
        this.receiptDate = receiptDate;
    }

    public String getReceiptNumber() {
        return receiptNumber;
    }

    public void setReceiptNumber(String receiptNumber) {
        this.receiptNumber = receiptNumber;
    }

    public double getTotalBalanceDue() {
        return totalBalanceDue;
    }

    public void setTotalBalanceDue(double totalBalanceDue) {
        this.totalBalanceDue = totalBalanceDue;
    }

    public double getTotalPaidAmount() {
        return totalPaidAmount;
    }

    public void setTotalPaidAmount(double totalPaidAmount) {
        this.totalPaidAmount = totalPaidAmount;
    }

    /**
     * @return the rowCount
     */
    public int getRowCount() {
        return rowCount;
    }

    /**
     * @param rowCount the rowCount to set
     */
    public void setRowCount(int rowCount) {
        this.rowCount = rowCount;
    }

    /**
     * @return the receiptHiddenNumber
     */
    public String getReceiptHiddenNumber() {
        return receiptHiddenNumber;
    }

    /**
     * @param receiptHiddenNumber the receiptHiddenNumber to set
     */
    public void setReceiptHiddenNumber(String receiptHiddenNumber) {
        this.receiptHiddenNumber = receiptHiddenNumber;
    }

    /**
     * @return the transactionDetails
     */
    public String getTransactionDetails() {
        return transactionDetails;
    }

    /**
     * @param transactionDetails the transactionDetails to set
     */
    public void setTransactionDetails(String transactionDetails) {
        this.transactionDetails = transactionDetails;
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
     * @return the errorMessage
     */
    public boolean isErrorMessage() {
        return errorMessage;
    }

    /**
     * @param errorMessage the errorMessage to set
     */
    public void setErrorMessage(boolean errorMessage) {
        this.errorMessage = errorMessage;
    }

    /**
     * @return the creditAmount
     */
    public double getCreditAmount() {
        return creditAmount;
    }

    /**
     * @param creditAmount the creditAmount to set
     */
    public void setCreditAmount(double creditAmount) {
        this.creditAmount = creditAmount;
    }

    /**
     * @return the debitAmount
     */
    public double getDebitAmount() {
        return debitAmount;
    }

    /**
     * @param debitAmount the debitAmount to set
     */
    public void setDebitAmount(double debitAmount) {
        this.debitAmount = debitAmount;
    }

    /**
     * @return the queryValue
     */
    public String getQueryValue() {
        return queryValue;
    }

    /**
     * @param queryValue the queryValue to set
     */
    public void setQueryValue(String queryValue) {
        this.queryValue = queryValue;
    }

    /**
     * @return the listofitems
     */
    public List<ReceiptModel> getListofitems() {
        return listofitems;
    }

    /**
     * @param listofitems the listofitems to set
     */
    public void setListofitems(List<ReceiptModel> listofitems) {
        this.listofitems = listofitems;
    }
}
