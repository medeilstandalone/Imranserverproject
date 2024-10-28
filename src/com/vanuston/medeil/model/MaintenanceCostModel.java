package com.vanuston.medeil.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class MaintenanceCostModel implements Serializable {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	private Date date ;
	private String month ;
	private int year ;
	private int serialNo ;
	private String particular ;
	private String dueDate ;
	private String paymentStatus ;
	private String paymentType ;
	private String chequeNo ;
	private Double amount ;
	private Double netTotal ;
        private String bankName ;
        private String accountNo ;

	private List<MaintenanceCostModel> maintenanceCostList ;

    public String getAccountNo() {
        return accountNo;
    }

    public void setAccountNo(String accountNo) {
        this.accountNo = accountNo;
    }

    public String getBankName() {
        return bankName;
    }

    public void setBankName(String bankName) {
        this.bankName = bankName;
    }


	public List<MaintenanceCostModel> getMaintenanceCostList() {
		return maintenanceCostList;
	}
	public void setMaintenanceCostList(
			List<MaintenanceCostModel> maintenanceCostList) {
		this.maintenanceCostList = maintenanceCostList;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getMonth() {
		return month;
	}
	public void setMonth(String month) {
		this.month = month;
	}
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getSerialNo() {
		return serialNo;
	}
	public void setSerialNo(int serialNo) {
		this.serialNo = serialNo;
	}
	public String getParticular() {
		return particular;
	}
	public void setParticular(String particular) {
		this.particular = particular;
	}
	public String getDueDate() {
		return dueDate;
	}
	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}
	public String getPaymentStatus() {
		return paymentStatus;
	}
	public void setPaymentStatus(String paymentStatus) {
		this.paymentStatus = paymentStatus;
	}
	public String getPaymentType() {
		return paymentType;
	}
	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}
	public String getChequeNo() {
		return chequeNo;
	}
	public void setChequeNo(String chequeNo) {
		this.chequeNo = chequeNo;
	}
	public Double getAmount() {
		return amount;
	}
	public void setAmount(Double amount) {
		this.amount = amount;
	}
	public Double getNetTotal() {
		return netTotal;
	}
	public void setNetTotal(Double netTotal) {
		this.netTotal = netTotal;
	}


}
