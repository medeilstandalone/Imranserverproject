/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.model;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class VatRegisterModel implements Serializable{

private static final long serialVersionUID = 1L;
private String customerName;
private String productName;
private String distname;
private String tinNumber;
private String invoiceNumber;
private String invoiceDate;
private String vat;
private int qty;
private double salesAmount;
private double vatAmount;
private double totalAmount;
private double netVatAmount;
private String invoicefromdate;
private String invoicetodate;
private String vattype;
private double vatpercent;
private String vatmode;
private List Vatreport;
    public String getDistname() {
        return distname;
    }

    public void setDistname(String distname) {
        this.distname = distname;
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

    public double getNetVatAmount() {
        return netVatAmount;
    }

    public void setNetVatAmount(double netVatAmount) {
        this.netVatAmount = netVatAmount;
    }

    public String getTinNumber() {
        return tinNumber;
    }

    public void setTinNumber(String tinNumber) {
        this.tinNumber = tinNumber;
    }

    public double getTotalAmount() {
        return totalAmount;
    }

    public void setTotalAmount(double totalAmount) {
        this.totalAmount = totalAmount;
    }
private double vat4;
private double vat125;

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public int getQty() {
        return qty;
    }

    public void setQty(int qty) {
        this.qty = qty;
    }

    public double getSalesAmount() {
        return salesAmount;
    }

    public void setSalesAmount(double salesAmount) {
        this.salesAmount = salesAmount;
    }

    public String getVat() {
        return vat;
    }

    public void setVat(String vat) {
        this.vat = vat;
    }

    public double getVat125() {
        return vat125;
    }

    public void setVat125(double vat125) {
        this.vat125 = vat125;
    }

    public double getVat4() {
        return vat4;
    }

    public void setVat4(double vat4) {
        this.vat4 = vat4;
    }

    public double getVatAmount() {
        return vatAmount;
    }

    public void setVatAmount(double vatAmount) {
        this.vatAmount = vatAmount;
    }

    /**
     * @return the invoicefromdate
     */
    public String getInvoicefromdate() {
        return invoicefromdate;
    }

    /**
     * @param invoicefromdate the invoicefromdate to set
     */
    public void setInvoicefromdate(String invoicefromdate) {
        this.invoicefromdate = invoicefromdate;
    }

    /**
     * @return the invoicetodate
     */
    public String getInvoicetodate() {
        return invoicetodate;
    }

    /**
     * @param invoicetodate the invoicetodate to set
     */
    public void setInvoicetodate(String invoicetodate) {
        this.invoicetodate = invoicetodate;
    }

    /**
     * @return the vattype
     */
    public String getVattype() {
        return vattype;
    }

    /**
     * @param vattype the vattype to set
     */
    public void setVattype(String vattype) {
        this.vattype = vattype;
    }

    /**
     * @return the vatpercent
     */
    public double getVatpercent() {
        return vatpercent;
    }

    /**
     * @param vatpercent the vatpercent to set
     */
    public void setVatpercent(double vatpercent) {
        this.vatpercent = vatpercent;
    }

    /**
     * @return the vatmode
     */
    public String getVatmode() {
        return vatmode;
    }

    /**
     * @param vatmode the vatmode to set
     */
    public void setVatmode(String vatmode) {
        this.vatmode = vatmode;
    }

    /**
     * @return the Vatreport
     */
    public List getVatreport() {
        return Vatreport;
    }

    /**
     * @param Vatreport the Vatreport to set
     */
    public void setVatreport(List Vatreport) {
        this.Vatreport = Vatreport;
    }
}
