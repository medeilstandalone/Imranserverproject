package medil.activate;

import java.io.Serializable;

public class CustomerBean implements Serializable {
	
	public CustomerBean() {}

	/********************************************************************
	 * This bean used to send Customer information to the server.
	 * Don't change properties of this bean. This depends on server Bean.
	 ********************************************************************/
	
	private static final long serialVersionUID = 1L;
	
	public CustomerBean(String shopName, String dlnumber, String cstnumber,
			String customerName, String address, String city, String state,
			String country, String pincode, String mobileNumber, String email, String productLabel) {
		super();
		this.shopName = shopName;
		this.dlnumber = dlnumber;
		this.cstnumber = cstnumber;
		this.customerName = customerName;
		this.address = address;
		this.city = city;
		this.state = state;
		this.country = country;
		this.pincode = pincode;
		this.mobileNumber = mobileNumber;
		this.email = email;
		this.productLabel = productLabel;
	}
	private String shopName;
    private String dlnumber;	// DrugLicenceNumber
    private String cstnumber;	// CustomerSalesTaxnumber
    private String customerName;
	private String address;
	private String city;
	private String state;
	private String country;
	private String pincode;
	private String mobileNumber;
	private String email;
	private String productLabel;
	

	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public String getDlnumber() {
		return dlnumber;
	}
	public void setDlnumber(String dlnumber) {
		this.dlnumber = dlnumber;
	}
	public String getCstnumber() {
		return cstnumber;
	}
	public void setCstnumber(String cstnumber) {
		this.cstnumber = cstnumber;
	}
	public String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(String customerName) {
		this.customerName = customerName;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public String getPincode() {
		return pincode;
	}
	public void setPincode(String pincode) {
		this.pincode = pincode;
	}
	public String getMobileNumber() {
		return mobileNumber;
	}
	public void setMobileNumber(String mobileNumber) {
		this.mobileNumber = mobileNumber;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getProductLabel() {
		return productLabel;
	}
	public void setProductLabel(String productLabel) {
		this.productLabel = productLabel;
	}
}
