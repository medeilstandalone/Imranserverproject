/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.model;

import java.io.Serializable;
import java.sql.Date;

/**
 *
 * @author Administrator
 */
public class DebitNoteModel implements Serializable{

private static final long serialVersionUID = 1L;

private String debitNoteNumber;
private String issuedAgainst;
private String debitOption;
private Date debitDate;
private String invoiceOrBillNumber;
private String name;
private double amount;
private String details;

    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Date getDebitDate() {
        return debitDate;
    }

    public void setDebitDate(Date debitDate) {
        this.debitDate = debitDate;
    }

    public String getDebitNoteNumber() {
        return debitNoteNumber;
    }

    public void setDebitNoteNumber(String debitNoteNumber) {
        this.debitNoteNumber = debitNoteNumber;
    }

    public String getDebitOption() {
        return debitOption;
    }

    public void setDebitOption(String debitOption) {
        this.debitOption = debitOption;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getInvoiceOrBillNumber() {
        return invoiceOrBillNumber;
    }

    public void setInvoiceOrBillNumber(String invoiceOrBillNumber) {
        this.invoiceOrBillNumber = invoiceOrBillNumber;
    }

    public String getIssuedAgainst() {
        return issuedAgainst;
    }

    public void setIssuedAgainst(String issuedAgainst) {
        this.issuedAgainst = issuedAgainst;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
