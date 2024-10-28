package com.vanuston.medeil.model;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;

public class EmployeeSalaryModel implements Serializable{
	
	private static final long serialVersionUID = 1L;
	private String salaryId;
	private Date date;
	private String salaryMonth;
	private String salaryYear;
	private String employeeName;
	private String employeeCode;
	private String gender;
	private String age;
	private String salaryType;
	private Double advancePaid;
	private Double balanceAmount;
	private Double fixedSalary;
	private Double paidAmount;
	private String paidDetails;
        private List<EmployeeSalaryModel> employees;

    public List<EmployeeSalaryModel> getEmployees() {
        return employees;
    }

    public void setEmployees(List<EmployeeSalaryModel> employees) {
        this.employees = employees;
    }

        public String getSalaryId() {
            return salaryId;
        }

        public void setSalaryId(String salaryId) {
            this.salaryId = salaryId;
        }

	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getSalaryMonth() {
		return salaryMonth;
	}
	public void setSalaryMonth(String salaryMonth) {
		this.salaryMonth = salaryMonth;
	}
	public String getSalaryYear() {
		return salaryYear;
	}
	public void setSalaryYear(String salaryYear) {
		this.salaryYear = salaryYear;
	}
	public String getEmployeeName() {
		return employeeName;
	}
	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}
	public String getEmployeeCode() {
		return employeeCode;
	}
	public void setEmployeeCode(String employeeCode) {
		this.employeeCode = employeeCode;
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
	public String getSalaryType() {
		return salaryType;
	}
	public void setSalaryType(String salaryType) {
		this.salaryType = salaryType;
	}
	public Double getAdvancePaid() {
		return advancePaid;
	}
	public void setAdvancePaid(Double advancePaid) {
		this.advancePaid = advancePaid;
	}
	public Double getBalanceAmount() {
		return balanceAmount;
	}
	public void setBalanceAmount(Double balanceAmount) {
		this.balanceAmount = balanceAmount;
	}
	public Double getFixedSalary() {
		return fixedSalary;
	}
	public void setFixedSalary(Double fixedSalary) {
		this.fixedSalary = fixedSalary;
	}
	public Double getPaidAmount() {
		return paidAmount;
	}
	public void setPaidAmount(Double paidAmount) {
		this.paidAmount = paidAmount;
	}
	public String getPaidDetails() {
		return paidDetails;
	}
	public void setPaidDetails(String paidDetails) {
		this.paidDetails = paidDetails;
	}


}
