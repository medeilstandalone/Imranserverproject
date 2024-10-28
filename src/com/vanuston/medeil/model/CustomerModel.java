package com.vanuston.medeil.model;

import java.io.Serializable;
import java.util.List;

public class CustomerModel implements Serializable {

	private static final long serialVersionUID = 1L;
        private String patientName;
        private String wardNumber;
        private String roomNumber;
        private String custType;
        private String doctorName;
        private String department;
	private String customerCode;
	private String customerName;
	private String familyName;
	private String gender;
	private String age;
	private String address1;
	private String address2;
	private String address3;
	private String city;
	private String country;
	private String state;
	private String pincode;
	private String phoneNumber;
	private String mobileNumber;
	private String emailid;
	private String alertType;
        private double creditLimit;
	private Integer SMSFlag;
        private String chkValue;
        private List customerinfoList;
        private String customerType;
        private String custtypeid;
        private double customerPercentage;
        private List allergiesList;
        private List healthConditionsList;
        private String currentUser;
        private String date;
        
    public String getChkValue() {
        return chkValue;
    }

    public void setChkValue(String chkValue) {
        this.chkValue = chkValue;
    }

    public double getCustomerPercentage() {
        return customerPercentage;
    }

    public void setCustomerPercentage(double customerPercentage) {
        this.customerPercentage = customerPercentage;
    }

    public String getCustomerType() {
        return customerType;
    }

    public void setCustomerType(String customerType) {
        this.customerType = customerType;
    }

    public List getCustomerinfoList() {
        return customerinfoList;
    }

    public void setCustomerinfoList(List customerinfoList) {
        this.customerinfoList = customerinfoList;
    }

    public String getCusttypeid() {
        return custtypeid;
    }

    public void setCusttypeid(String custtypeid) {
        this.custtypeid = custtypeid;
    }

    public double getCreditLimit() {
        return creditLimit;
    }

    public void setCreditLimit(double creditLimit) {
        this.creditLimit = creditLimit;
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
	public String getFamilyName() {
		return familyName;
	}
	public void setFamilyName(String familyName) {
		this.familyName = familyName;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getAge() {
		return age;
	}
	public void setAge(String age) {
		this.age = age;
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
	public String getPhoneNumber() {
		return phoneNumber;
	}
	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public String getAlertType() {
		return alertType;
	}
	public void setAlertType(String alertType) {
		this.alertType = alertType;
	}
	public Integer getSMSFlag() {
		return SMSFlag;
	}
	public void setSMSFlag(Integer flag) {
		SMSFlag = flag;
	}

            /**
     * @return the currentUserName
     */
    public String getCurrentUser() {
        return currentUser;
    }

    /**
     * @param userName the currentUserName to set
     */
    public void setCurrentUser(String userName) {
        this.currentUser = userName;
    }
    
    public void setPatientName(String patientName){
        this.patientName=patientName;
    }

     public String getPatientName(){
        return this.patientName;
    }

    public void setWardNumber(String wardNumber){
        this.wardNumber=wardNumber;
    }

    public String getWardNumber(){
        return this.wardNumber;
    }

    public void setRoomNumber(String roomNumber){
        this.roomNumber=roomNumber;
    }

    public String getRoomNumber(){
        return this.roomNumber;
    }

    public void setDoctorName(String doctorName){
        this.doctorName=doctorName;
    }

    public String getDoctorName(){
        return this.doctorName;
    }

    public void setDepartment(String department){
        this.department=department;
    }

    public String getDepartment(){
        return this.department;
    }

         /**
     * @return the allergiesList
     */
    public List<String> getAllergiesList() {
        return allergiesList;
    }

    /**
     * @param allergiesList to set
     */
    public void setAllergiesList(List<String> allergiesList) {
        this.allergiesList=allergiesList;
    }

             /**
     * @return the healthConditionsList
     */
    public List<String> getHealthConditionsList() {
        return healthConditionsList;
    }

    /**
     * @param healthConditionsList to set
     */
    public void setHealthConditionsList(List<String> healthConditionsList) {
        this.healthConditionsList=healthConditionsList;
    }

    public void setCustType(String custType){
        this.custType = custType;
    }

    public String getCustType(){
        return custType;
    }

    public String getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(String date) {
        this.date = date;
    }
}
