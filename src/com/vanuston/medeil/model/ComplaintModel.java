package com.vanuston.medeil.model;

import java.io.Serializable;
import java.sql.Date;

public class ComplaintModel implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String billNumber;
	private String customerName;
	private Date compliantDate;
	private Date billDate;
	private String doctorName;
	private String compliantType;
	private String itemName;
	private String manufacturerName;
	private String batchNumber;
	private String complaints;
	private String employeeName;
	public String getBillNumber() {
		return billNumber;
	}
	public void setBillNumber(String billNumber) {
		this.billNumber = billNumber;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public Date getCompliantDate() {
		return compliantDate;
	}
	public void setCompliantDate(Date compliantDate) {
		this.compliantDate = compliantDate;
	}
	public Date getBillDate() {
		return billDate;
	}
	public void setBillDate(Date billDate) {
		this.billDate = billDate;
	}
	public String getDoctorName() {
		return doctorName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	public String getCompliantType() {
		return compliantType;
	}
	public void setCompliantType(String compliantType) {
		this.compliantType = compliantType;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public String getManufacturerName() {
		return manufacturerName;
	}
	public void setManufacturerName(String manufacturerName) {
		this.manufacturerName = manufacturerName;
	}
	public String getBatchNumber() {
		return batchNumber;
	}
	public void setBatchNumber(String batchNumber) {
		this.batchNumber = batchNumber;
	}
	public String getComplaints() {
		return complaints;
	}
	public void setComplaints(String complaints) {
		this.complaints = complaints;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	
}
