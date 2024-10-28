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
public class CreditNoteModel implements Serializable{

private static final long serialVersionUID = 1L;

private String creditNoteNumber;    
private String issuedAgainst;
private String creditOption;
private Date creditDate;
private String invoiceOrBillNumber;
private String name;
private double amount;
private String details;
private List<CreditNoteModel> creditModelList ;

    public List<CreditNoteModel> getCreditModelList() {
        return creditModelList;
    }

    public void setCreditModelList(List<CreditNoteModel> creditModelList) {
        this.creditModelList = creditModelList;
    }


    public double getAmount() {
        return amount;
    }

    public void setAmount(double amount) {
        this.amount = amount;
    }

    public Date getCreditDate() {
        return creditDate;
    }

    public void setCreditDate(Date creditDate) {
        this.creditDate = creditDate;
    }

    public String getCreditNoteNumber() {
        return creditNoteNumber;
    }

    public void setCreditNoteNumber(String creditNoteNumber) {
        this.creditNoteNumber = creditNoteNumber;
    }

    public String getCreditOption() {
        return creditOption;
    }

    public void setCreditOption(String creditOption) {
        this.creditOption = creditOption;
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
