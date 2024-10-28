package com.vanuston.medeil.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import com.vanuston.medeil.util.DateUtils;

public class SalesModel implements Serializable {
	
	private static final long serialVersionUID = 1L;

        private String moduleType = "SALES";
	private String billNumber;
	private String customerName;
	private String billDate;
	private String doctorName;
	private String itemCode;
	private String itemName;
	private String manufacturerName;
	private String formulation;
	private String batchNumber;
	private Integer quantity;
        private Integer pquantity;
	private Double unitPrice;
	private String expiryDate;
	private Double mrp;
	private Double unitDiscount;
	private Double unitVAT;
	private Double subTotal;
	private Double totalDiscount;
	private Double totalVAT;
	private Double totalAmount;
	private Double paidAmount;
	private Double balanceAmount;
	private Integer totalItems;
	private Integer totalQuantity;
	private String billType;
	private String paymentMode;
	private String cardNumber;
	private String cardHolderName;
	private String bankName;
	private String cardExpiry;
        private String accountNumber;
	private String salesReturnNumber;
        private String salesReturnDate;
        private String formType;
        private String tableName;
        private String oldItemCode;
        private String oldBatch;
        private Integer oldQty;
         private Integer getOldFQty;
        private String returnExpiryDate;
        private String updateFlag;
        private int rowCount;
        private int packing;
        private String employeeID;
        private int prescriptionDays;
        private Double fprice;

    public Integer getGetOldFQty() {
        return getOldFQty;
    }

    public void setGetOldFQty(Integer getOldFQty) {
        this.getOldFQty = getOldFQty;
    }

   








    public Double getFprice() {
        return fprice;
    }

    public void setFprice(Double frpice) {
        this.fprice = frpice;
    }


 

    public String getEmployeeID() {
        return employeeID;
    }

    public void setEmployeeID(String employeeID) {
        this.employeeID = employeeID;
    }


    public int getPacking() {
        return packing;
    }

    public void setPacking(int packing) {
        this.packing = packing;
    }

    public int getRowCount() {
        return rowCount;
    }

    public void setRowCount(int rowCount) {
        this.rowCount = rowCount;
    }

    public String getUpdateFlag() {
        return updateFlag;
    }

    public void setUpdateFlag(String updateFlag) {
        this.updateFlag = updateFlag;
    }
     

    public String getReturnExpiryDate() {
        return returnExpiryDate;
    }

    public void setReturnExpiryDate(String returnExpiryDate) {
        String formatExpiry;
        formatExpiry=DateUtils.normalFormatExpDate(returnExpiryDate);
        this.returnExpiryDate = formatExpiry;
    }
    public String getTableName() {
        return tableName;
    }
    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    public String getSalesReturnDate() {
        return salesReturnDate;
    }

    public void setSalesReturnDate(String salesReturnDate) {
        this.salesReturnDate = salesReturnDate;
    }

    public String getOldBatch() {
        return oldBatch;
    }

    public void setOldBatch(String oldBatch) {
        this.oldBatch = oldBatch;
    }

    public String getOldItemCode() {
        return oldItemCode;
    }

    public void setOldItemCode(String oldItemCode) {
        this.oldItemCode = oldItemCode;
    }

    public Integer getOldQty() {
        return oldQty;
    }

    public void setOldQty(Integer oldQty) {
        this.oldQty = oldQty;
    }


    public String getFormType() {
        return formType;
    }

    public void setFormType(String formType) {
        this.formType = formType;
    }


    public String getAccountNumber() {
        return accountNumber;
    }

    public void setAccountNumber(String accountNumber) {
        this.accountNumber = accountNumber;
    }


    public String getModuleType() {
        return moduleType;
    }
    public void setModuleType(String moduleType) {
        this.moduleType = moduleType;
    }
    
	List<SalesModel> listofitems ;

         public Integer getPquantity() {
        return pquantity;
    }

    public void setPquantity(Integer pquantity) {
        this.pquantity = pquantity;
    }


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
	public String getBillDate() {
		return billDate;
	}
	public void setBillDate(String billDate) {
		this.billDate = billDate;
	}
	public String getDoctorName() {
		return doctorName;
	}
	public void setDoctorName(String doctorName) {
		this.doctorName = doctorName;
	}
	public String getItemCode() {
		return itemCode;
	}
	public void setItemCode(String itemCode) {
		this.itemCode = itemCode;
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
	public String getFormulation() {
		return formulation;
	}
	public void setFormulation(String formulation) {
		this.formulation = formulation;
	}
	public String getBatchNumber() {
		return batchNumber;
	}
	public void setBatchNumber(String batchNumber) {
		this.batchNumber = batchNumber;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public Double getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(Double unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getExpiryDate() {
		return expiryDate;
	}
	public void setExpiryDate(String expiryDate) {                
                if(this.moduleType.equals("SALES")) {
                    String formatExpiry;
                    formatExpiry=DateUtils.changeFormatExpDate(expiryDate)+"-01";
                    this.expiryDate = formatExpiry; 
                } else {
                    this.expiryDate = expiryDate;
                }
                    
	}
	public Double getMrp() {
		return mrp;
	}
	public void setMrp(Double mrp) {
		this.mrp = mrp;
	}
	public Double getUnitDiscount() {
		return unitDiscount;
	}
	public void setUnitDiscount(Double unitDiscount) {
		this.unitDiscount = unitDiscount;
	}
	public Double getUnitVAT() {
		return unitVAT;
	}
	public void setUnitVAT(Double unitVAT) {
		this.unitVAT = unitVAT;
	}
	public Double getSubTotal() {
		return subTotal;
	}
	public void setSubTotal(Double subTotal) {
		this.subTotal = subTotal;
	}
	public Double getTotalDiscount() {
		return totalDiscount;
	}
	public void setTotalDiscount(Double totalDiscount) {
		this.totalDiscount = totalDiscount;
	}
	public Double getTotalVAT() {
		return totalVAT;
	}
	public void setTotalVAT(Double totalVAT) {
		this.totalVAT = totalVAT;
	}
	public Double getTotalAmount() {
		return totalAmount;
	}
	public void setTotalAmount(Double totalAmount) {
		this.totalAmount = totalAmount;
	}
	public Double getPaidAmount() {
		return paidAmount;
	}
	public void setPaidAmount(Double paidAmount) {
		this.paidAmount = paidAmount;
	}
	public Double getBalanceAmount() {
		return balanceAmount;
	}
	public void setBalanceAmount(Double balanceAmount) {
		this.balanceAmount = balanceAmount;
	}
	public Integer getTotalItems() {
		return totalItems;
	}
	public void setTotalItems(Integer totalItems) {
		this.totalItems = totalItems;
	}
	public Integer getTotalQuantity() {
		return totalQuantity;
	}
	public void setTotalQuantity(Integer totalQuantity) {
		this.totalQuantity = totalQuantity;
	}
	public String getBillType() {
		return billType;
	}
	public void setBillType(String billType) {
		this.billType = billType;
	}
	public String getPaymentMode() {
		return paymentMode;
	}
	public void setPaymentMode(String paymentMode) {
		this.paymentMode = paymentMode;
	}
	public String getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	public String getCardHolderName() {
		return cardHolderName;
	}
	public void setCardHolderName(String cardHolderName) {
		this.cardHolderName = cardHolderName;
	}
	public String getBankName() {
		return bankName;
	}
	public void setBankName(String bankName) {
		this.bankName = bankName;
	}
	public String getCardExpiry() {
		return cardExpiry;
	}
	public void setCardExpiry(String cardExpiry) {
		this.cardExpiry = cardExpiry;
	}
	public String getSalesReturnNumber() {
		return salesReturnNumber;
	}
	public void setSalesReturnNumber(String salesReturnNumber) {
		this.salesReturnNumber = salesReturnNumber;
	}
	public List<SalesModel> getListofitems() {
		return listofitems;
	}
	public void setListofitems(List<SalesModel> listofitems) {
		this.listofitems = listofitems;
	}

        public int getPrescriptionDays() {
            return prescriptionDays;
        }

        public void setPrescriptionDays(int prescriptionDays) {
            this.prescriptionDays = prescriptionDays;
        }

   
	
    }
