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
public class DailyCashBookModel implements Serializable{

private static final long serialVersionUID = 1L;

private String date;
private double openCashBalance;
private double closeCashBalance;
private double debitSales;
private double debitReceipts;
private double cashIntroduced;
private double cashWithdrawal;
private double creditPayments;
private double creditMaintain;
private String expenses1;
private String expenses2;
private String expenses3;
private String expenses4;
private double otherExpenses1;
private double otherExpenses2;
private double otherExpenses3;
private double otherExpenses4;
private double totalDebit;
private double totalCredit;
private String dailyCashBookDate;
    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }
    public double getCashIntroduced() {
        return cashIntroduced;
    }

    public void setCashIntroduced(double cashIntroduced) {
        this.cashIntroduced = cashIntroduced;
    }

    public double getCashWithdrawal() {
        return cashWithdrawal;
    }

    public void setCashWithdrawal(double cashWithdrawal) {
        this.cashWithdrawal = cashWithdrawal;
    }

    public double getCloseCashBalance() {
        return closeCashBalance;
    }

    public void setCloseCashBalance(double closeCashBalance) {
        this.closeCashBalance = closeCashBalance;
    }

    public double getCreditMaintain() {
        return creditMaintain;
    }

    public void setCreditMaintain(double creditMaintain) {
        this.creditMaintain = creditMaintain;
    }

    public double getCreditPayments() {
        return creditPayments;
    }

    public void setCreditPayments(double creditPayments) {
        this.creditPayments = creditPayments;
    }

    public double getDebitReceipts() {
        return debitReceipts;
    }

    public void setDebitReceipts(double debitReceipts) {
        this.debitReceipts = debitReceipts;
    }

    public double getDebitSales() {
        return debitSales;
    }

    public void setDebitSales(double debitSales) {
        this.debitSales = debitSales;
    }

    public String getExpenses1() {
        return expenses1;
    }

    public void setExpenses1(String expenses1) {
        this.expenses1 = expenses1;
    }

    public String getExpenses2() {
        return expenses2;
    }

    public void setExpenses2(String expenses2) {
        this.expenses2 = expenses2;
    }

    public String getExpenses3() {
        return expenses3;
    }

    public void setExpenses3(String expenses3) {
        this.expenses3 = expenses3;
    }

    public String getExpenses4() {
        return expenses4;
    }

    public void setExpenses4(String expenses4) {
        this.expenses4 = expenses4;
    }

    public double getOpenCashBalance() {
        return openCashBalance;
    }

    public void setOpenCashBalance(double openCashBalance) {
        this.openCashBalance = openCashBalance;
    }

    public double getOtherExpenses1() {
        return otherExpenses1;
    }

    public void setOtherExpenses1(double otherExpenses1) {
        this.otherExpenses1 = otherExpenses1;
    }

    public double getOtherExpenses2() {
        return otherExpenses2;
    }

    public void setOtherExpenses2(double otherExpenses2) {
        this.otherExpenses2 = otherExpenses2;
    }

    public double getOtherExpenses3() {
        return otherExpenses3;
    }

    public void setOtherExpenses3(double otherExpenses3) {
        this.otherExpenses3 = otherExpenses3;
    }

    public double getOtherExpenses4() {
        return otherExpenses4;
    }

    public void setOtherExpenses4(double otherExpenses4) {
        this.otherExpenses4 = otherExpenses4;
    }

    public double getTotalCredit() {
        return totalCredit;
    }

    public void setTotalCredit(double totalCredit) {
        this.totalCredit = totalCredit;
    }

    public double getTotalDebit() {
        return totalDebit;
    }

    public void setTotalDebit(double totalDebit) {
        this.totalDebit = totalDebit;
    }

    /**
     * @return the dailyCashBookDate
     */
    public String getDailyCashBookDate() {
        return dailyCashBookDate;
    }

    /**
     * @param dailyCashBookDate the dailyCashBookDate to set
     */
    public void setDailyCashBookDate(String dailyCashBookDate) {
        this.dailyCashBookDate = dailyCashBookDate;
    }

}
