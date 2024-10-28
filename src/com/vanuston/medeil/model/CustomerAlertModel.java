package com.vanuston.medeil.model;

import java.io.Serializable;
import java.sql.Date;

public class CustomerAlertModel implements Serializable {

	private static final long serialVersionUID = 1L;

        private int alertNo;
        private String customerCode;
        private String customerName ;
        private Date date;
	private String alertType;
        private Date smsAlertDate;
	private String mobileNo1;
	private String mobileNo2;
        private String smsMessage;
        private Date emailAlertDate;
	private String emailId1;
	private String emailId2;
        private String emailMessage;
        private int sentCode;

    public int getAlertNo() {
        return alertNo;
    }

    public void setAlertNo(int alertNo) {
        this.alertNo = alertNo;
    }

    public String getAlertType() {
        return alertType;
    }

    public void setAlertType(String alertType) {
        this.alertType = alertType;
    }

    public String getCustomerCode() {
        return customerCode;
    }

    public void setCustomerCode(String customerCode) {
        this.customerCode = customerCode;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getEmailAlertDate() {
        return emailAlertDate;
    }

    public void setEmailAlertDate(Date emailAlertDate) {
        this.emailAlertDate = emailAlertDate;
    }

    public String getEmailId1() {
        return emailId1;
    }

    public void setEmailId1(String emailId1) {
        this.emailId1 = emailId1;
    }

    public String getEmailId2() {
        return emailId2;
    }

    public void setEmailId2(String emailId2) {
        this.emailId2 = emailId2;
    }

    public String getEmailMessage() {
        return emailMessage;
    }

    public void setEmailMessage(String emailMessage) {
        this.emailMessage = emailMessage;
    }

    public String getMobileNo1() {
        return mobileNo1;
    }

    public void setMobileNo1(String mobileNo1) {
        this.mobileNo1 = mobileNo1;
    }

    public String getMobileNo2() {
        return mobileNo2;
    }

    public void setMobileNo2(String mobileNo2) {
        this.mobileNo2 = mobileNo2;
    }

    public int getSentCode() {
        return sentCode;
    }

    public void setSentCode(int sentCode) {
        this.sentCode = sentCode;
    }

    public Date getSmsAlertDate() {
        return smsAlertDate;
    }

    public void setSmsAlertDate(Date smsAlertDate) {
        this.smsAlertDate = smsAlertDate;
    }

    public String getSmsMessage() {
        return smsMessage;
    }

    public void setSmsMessage(String smsMessage) {
        this.smsMessage = smsMessage;
    }

        
}
