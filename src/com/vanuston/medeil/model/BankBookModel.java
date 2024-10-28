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
public class BankBookModel implements Serializable {

    private static final long serialVersionUID = 1L;
    private int bankId;
    private String accountNumber;
    private String bankBranchName;
    private double openingBalance;
    private double debitAmount;
    private double creditAmount;
    private String expenseTowards;
    private String transactionType;
    private double closingBalance;
    private String transactionDetails;
    private String chequeNumber;
    private double amount;
    private boolean returnFlag;
    private String saveType;
    private String editTransactionType;
    private double editamount;
    private String query;
    private String bankBookDate;
    private List<BankBookModel> listofitems = new ArrayList<BankBookModel>();

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public String getBankBranchName() {
        return bankBranchName;
    }

    public void setBankBranchName(String bankBranchName) {
        this.bankBranchName = bankBranchName;
    }

    public int getBankId() {
        return bankId;
    }

    public void setBankId(int bankId) {
        this.bankId = bankId;
    }

    public String getChequeNumber() {
        return chequeNumber;
    }

    public void setChequeNumber(String chequeNumber) {
        this.chequeNumber = chequeNumber;
    }

    public double getClosingBalance() {
        return closingBalance;
    }

    public void setClosingBalance(double closingBalance) {
        this.closingBalance = closingBalance;
    }

    public double getCreditAmount() {
        return creditAmount;
    }

    public void setCreditAmount(double creditAmount) {
        this.creditAmount = creditAmount;
    }

    public double getDebitAmount() {
        return debitAmount;
    }

    public void setDebitAmount(double debitAmount) {
        this.debitAmount = debitAmount;
    }

    public String getExpenseTowards() {
        return expenseTowards;
    }

    public void setExpenseTowards(String expenseTowards) {
        this.expenseTowards = expenseTowards;
    }

    public double getOpeningBalance() {
        return openingBalance;
    }

    public void setOpeningBalance(double openingBalance) {
        this.openingBalance = openingBalance;
    }

    public String getTransactionDetails() {
        return transactionDetails;
    }

    public void setTransactionDetails(String transactionDetails) {
        this.transactionDetails = transactionDetails;
    }

    public String getTransactionType() {
        return transactionType;
    }

    public void setTransactionType(String transactionType) {
        this.transactionType = transactionType;
    }

    /**
     * @return the amount
     */
    public double getAmount() {
        return amount;
    }

    /**
     * @param amount the amount to set
     */
    public void setAmount(double amount) {
        this.amount = amount;
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
     * @return the saveType
     */
    public String getSaveType() {
        return saveType;
    }

    public void setSaveType(String saveType) {
        this.saveType = saveType;
    }

    public String getEditTransactionType() {
        return editTransactionType;
    }

    public void setEditTransactionType(String editTransactionType) {
        this.editTransactionType = editTransactionType;
    }

    public double getEditAmount() {
        return editamount;
    }

    public void setEditAmount(double editamount) {
        this.editamount = editamount;
    }

    /**
     * @return the query
     */
    public String getQuery() {
        return query;
    }

    /**
     * @param query the query to set
     */
    public void setQuery(String query) {
        this.query = query;
    }

    /**
     * @return the bankBookDate
     */
    public String getBankBookDate() {
        return bankBookDate;
    }

    /**
     * @param bankBookDate the bankBookDate to set
     */
    public void setBankBookDate(String bankBookDate) {
        this.bankBookDate = bankBookDate;
    }

    /**
     * @return the listofitems
     */
    public List<BankBookModel> getListofitems() {
        return listofitems;
    }

    /**
     * @param listofitems the listofitems to set
     */
    public void setListofitems(List<BankBookModel> listofitems) {
        this.listofitems = listofitems;
    }
}
