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
 * @author Administrator
 */
public class BankAccountModel implements Serializable{

private static final long serialVersionUID = 1L;

private int bankId;
private String accountNumber;
private String accountHolder;
private String accountType;
private Date openDate;
private double OpeningBalance;
private String balanceType;
private String accountStatus;
private String bankName;
private String branch;
private String address;
private List<BankAccountModel> bankAccountModelList ;

    public List<BankAccountModel> getBankAccountModelList() {
        return bankAccountModelList;
    }

    public void setBankAccountModelList(List<BankAccountModel> bankAccountModelList) {
        this.bankAccountModelList = bankAccountModelList;
    }


    public double getOpeningBalance() {
        return OpeningBalance;
    }

    public void setOpeningBalance(double OpeningBalance) {
        this.OpeningBalance = OpeningBalance;
    }

    public String getAccountHolder() {
        return accountHolder;
    }

    public void setAccountHolder(String accountHolder) {
        this.accountHolder = accountHolder;
    }

    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }

    public String getAccountStatus() {
        return accountStatus;
    }

    public void setAccountStatus(String accountStatus) {
        this.accountStatus = accountStatus;
    }

    public String getAccountType() {
        return accountType;
    }

    public void setAccountType(String accountType) {
        this.accountType = accountType;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getBalanceType() {
        return balanceType;
    }

    public void setBalanceType(String balanceType) {
        this.balanceType = balanceType;
    }

    public int getBankId() {
        return bankId;
    }

    public void setBankId(int bankId) {
        this.bankId = bankId;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public Date getOpenDate() {
        return openDate;
    }

    public void setOpenDate(Date openDate) {
        this.openDate = openDate;
    }
}
