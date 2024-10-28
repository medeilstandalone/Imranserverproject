/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.model;

import java.io.Serializable;

/**
 *
 * @author saran
 */
public class UserInformationModel implements Serializable {

    private static final long serialVersionUID = 1L;

    private String userName;
    private String passWord;
    private String confirmPassword;
    private String Home;
    private String Inventory;
    private String Finance;
    private String Masters;
    private String Sales;
    private String Reports;
    private String CRM;
    private String saveType;
    private String employeeCode;
    private String employeeName;
    private String userType;
    private boolean userValid;
    private String query;

    /**
     * @return the userName
     */
    public String getUserName() {
        return userName;
    }

    /**
     * @param userName the userName to set
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * @return the passWord
     */
    public String getPassWord() {
        return passWord;
    }

    /**
     * @param passWord the passWord to set
     */
    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    /**
     * @return the confirmPassword
     */
    public String getConfirmPassword() {
        return confirmPassword;
    }

    /**
     * @param confirmPassword the confirmPassword to set
     */
    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    /**
     * @return the Home
     */
    public String getHome() {
        return Home;
    }

    /**
     * @param Home the Home to set
     */
    public void setHome(String Home) {
        this.Home = Home;
    }

    /**
     * @return the Inventory
     */
    public String getInventory() {
        return Inventory;
    }

    /**
     * @param Inventory the Inventory to set
     */
    public void setInventory(String Inventory) {
        this.Inventory = Inventory;
    }

    /**
     * @return the Finance
     */
    public String getFinance() {
        return Finance;
    }

    /**
     * @param Finance the Finance to set
     */
    public void setFinance(String Finance) {
        this.Finance = Finance;
    }

    /**
     * @return the Masters
     */
    public String getMasters() {
        return Masters;
    }

    /**
     * @param Masters the Masters to set
     */
    public void setMasters(String Masters) {
        this.Masters = Masters;
    }

    /**
     * @return the Sales
     */
    public String getSales() {
        return Sales;
    }

    /**
     * @param Sales the Sales to set
     */
    public void setSales(String Sales) {
        this.Sales = Sales;
    }

    /**
     * @return the Reports
     */
    public String getReports() {
        return Reports;
    }

    /**
     * @param Reports the Reports to set
     */
    public void setReports(String Reports) {
        this.Reports = Reports;
    }

    /**
     * @return the CRM
     */
    public String getCRM() {
        return CRM;
    }

    /**
     * @param CRM the CRM to set
     */
    public void setCRM(String CRM) {
        this.CRM = CRM;
    }

    /**
     * @return the saveType
     */
    public String getSaveType() {
        return saveType;
    }

    /**
     * @param saveType the saveType to set
     */
    public void setSaveType(String saveType) {
        this.saveType = saveType;
    }

    /**
     * @return the employeeCode
     */
    public String getEmployeeCode() {
        return employeeCode;
    }

    /**
     * @param employeeCode the employeeCode to set
     */
    public void setEmployeeCode(String employeeCode) {
        this.employeeCode = employeeCode;
    }

    /**
     * @return the employeeName
     */
    public String getEmployeeName() {
        return employeeName;
    }

    /**
     * @param employeeName the employeeName to set
     */
    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    /**
     * @return the userType
     */
    public String getUserType() {
        return userType;
    }

    /**
     * @param userType the userType to set
     */
    public void setUserType(String userType) {
        this.userType = userType;
    }

    /**
     * @return the userValid
     */
    public boolean isUserValid() {
        return userValid;
    }

    /**
     * @param userValid the userValid to set
     */
    public void setUserValid(boolean userValid) {
        this.userValid = userValid;
    }

}
