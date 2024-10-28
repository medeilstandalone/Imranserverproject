package com.vanuston.medeil.model;

import java.io.Serializable;

public class DistributorModel implements Serializable{

	private static final long serialVersionUID = 1L;
	
	private String distributorCode;
	private String distributorName;
	private String ownerName;
	private String authorizedDistributor;
	private String TINNumber;
	private String CSTNumber;
	private String DLNumber;
	private String creditDays;
	private String address1;
	private String address2;
	private String address3;
	private String city;
	private String country;
	private String state;
	private String pincode;
	private String contactNumber1;
	private String contactNumber2;
	private String mobileNumber;
	private String faxNumber;
	private String emailid;
	private String website;
	public String getDistributorCode() {
		return distributorCode;
	}
	public void setDistributorCode(String distributorCode) {
		this.distributorCode = distributorCode;
	}
	public String getDistributorName() {
		return distributorName;
	}
	public void setDistributorName(String distributorName) {
		this.distributorName = distributorName;
	}
	public String getOwnerName() {
		return ownerName;
	}
	public void setOwnerName(String ownerName) {
		this.ownerName = ownerName;
	}
	public String getAuthorizedDistributor() {
		return authorizedDistributor;
	}
	public void setAuthorizedDistributor(String authorizedDistributor) {
		this.authorizedDistributor = authorizedDistributor;
	}
	public String getTINNumber() {
		return TINNumber;
	}
	public void setTINNumber(String number) {
		TINNumber = number;
	}
	public String getCSTNumber() {
		return CSTNumber;
	}
	public void setCSTNumber(String number) {
		CSTNumber = number;
	}
	public String getDLNumber() {
		return DLNumber;
	}
	public void setDLNumber(String number) {
		DLNumber = number;
	}
	public String getCreditDays() {
		return creditDays;
	}
	public void setCreditDays(String creditDays) {
		this.creditDays = creditDays;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getAddress3() {
		return address3;
	}
	public void setAddress3(String address3) {
		this.address3 = address3;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public String getContactNumber1() {
		return contactNumber1;
	}
	public void setContactNumber1(String contactNumber1) {
		this.contactNumber1 = contactNumber1;
	}
	public String getContactNumber2() {
		return contactNumber2;
	}
	public void setContactNumber2(String contactNumber2) {
		this.contactNumber2 = contactNumber2;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getFaxNumber() {
		return faxNumber;
	}
	public void setFaxNumber(String faxNumber) {
		this.faxNumber = faxNumber;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getWebsite() {
		return website;
	}
	public void setWebsite(String website) {
		this.website = website;
	}
	
}
