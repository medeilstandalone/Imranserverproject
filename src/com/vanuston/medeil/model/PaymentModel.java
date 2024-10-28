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
public class PaymentModel implements Serializable {

    private static final long serialVersionUID = 1L;
    private String paymentNumber;
    private String paymentDate;
    private String distributorName;
    private String paymentType;
    private String cardNumber;
    private String bankName;
    private String holderName;
    private String payTypeDate;
    private double totalBalanceDue;
    private String invoiceNumber;
    private String invoiceDate;
    private double invoiceAmount;
    private double paidAmount;
    private double balanceAmount;
    private double totalPaidAmount;
    private double invoiceBalanceAmount;
    private int rowCount;
    private String paymentHiddenNumber;
    private String transactionDetails;
    private String saveType;
    private boolean errorMessage;
    private double creditAmount;
    private double debitAmount;
    private String queryValue;


    List<PaymentModel> listofitems = new ArrayList<PaymentModel>();

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

    public String getCardNumber() {
        return cardNumber;
    }

    public void setCardNumber(String cardNumber) {
        this.cardNumber = cardNumber;
    }

    public String getDistributorName() {
        return distributorName;
    }

    public void setDistributorName(String distributorName) {
        this.distributorName = distributorName;
    }

    public String getHolderName() {
        return holderName;
    }

    public void setHolderName(String holderName) {
        this.holderName = holderName;
    }

    public double getInvoiceAmount() {
        return invoiceAmount;
    }

    public void setInvoiceAmount(double invoiceAmount) {
        this.invoiceAmount = invoiceAmount;
    }

    public double getInvoiceBalanceAmount() {
        return invoiceBalanceAmount;
    }

    public void setInvoiceBalanceAmount(double invoiceBalanceAmount) {
        this.invoiceBalanceAmount = invoiceBalanceAmount;
    }

    public String getInvoiceDate() {
        return invoiceDate;
    }

    public void setInvoiceDate(String invoiceDate) {
        this.invoiceDate = invoiceDate;
    }

    public String getInvoiceNumber() {
        return invoiceNumber;
    }

    public void setInvoiceNumber(String invoiceNumber) {
        this.invoiceNumber = invoiceNumber;
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

    public String getPaymentDate() {
        return paymentDate;
    }

    public void setPaymentDate(String paymentDate) {
        this.paymentDate = paymentDate;
    }

    public String getPaymentNumber() {
        return paymentNumber;
    }

    public void setPaymentNumber(String paymentNumber) {
        this.paymentNumber = paymentNumber;
    }

    public String getPaymentType() {
        return paymentType;
    }

    public void setPaymentType(String paymentType) {
        this.paymentType = paymentType;
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

    public List<PaymentModel> getListofitems() {
        return listofitems;
    }

    public void setListofitems(List<PaymentModel> listofitems) {
        this.listofitems = listofitems;
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
     * @return the paymentHiddenNumber
     */
    public String getPaymentHiddenNumber() {
        return paymentHiddenNumber;
    }

    /**
     * @param paymentHiddenNumber the paymentHiddenNumber to set
     */
    public void setPaymentHiddenNumber(String paymentHiddenNumber) {
        this.paymentHiddenNumber = paymentHiddenNumber;
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
}


