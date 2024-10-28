/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.CommonDAO;
import com.vanuston.medeil.implementation.CommonImplements;
//import com.vanuston.medeil.util.BillRestriction;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class CommonController extends UnicastRemoteObject implements CommonImplements {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    public CommonController() throws RemoteException {
        super();

    }
    CommonDAO commonDAO;

    @Override
    public String getAutoIncrement(String date, String name) {
        commonDAO = new CommonDAO();
        return commonDAO.getAutoIncrement(date, name);
    }

    @Override
    public List<String> customerName(String name) {
        commonDAO = new CommonDAO();
        return commonDAO.customerName(name);
    }

    @Override
    public List<String> customerName1(String name) throws RemoteException {
        commonDAO = new CommonDAO();
        return commonDAO.customerName1(name);
    }


    @Override
    public String getCustomerBalance(String name) {
        commonDAO = new CommonDAO();
        return commonDAO.getCustomerBalance(name);
    }

    @Override
    public String getCustomerCode(String name) {
        commonDAO = new CommonDAO();
        return commonDAO.getCustomerCode(name);
    }

    @Override
    public String getUserType(String uname) {
        commonDAO = new CommonDAO();
        return commonDAO.getUserType(uname);
    }

    @Override
    public Boolean isNotAllow(int modname) {
        commonDAO = new CommonDAO();
        return commonDAO.isNotAllow(modname);
    }

    @Override
    public String getShopTinNo() {
        commonDAO = new CommonDAO();
        return commonDAO.getShopTinNo();
    }

    @Override
    public List<String> getDistributors(String name) {
        commonDAO = new CommonDAO();
        return commonDAO.getDistributors(name);
    }

    @Override
    public List<String> getChequeNumbers(String type) {
        commonDAO = new CommonDAO();
        return commonDAO.getChequeNumbers(type);
    }

    @Override
    public double getCreditAmount(String name, String type) {
        commonDAO = new CommonDAO();
        return commonDAO.getCreditAmount(name, type);
    }

    @Override
    public double getDebitAmount(String name, String type) {
        commonDAO = new CommonDAO();
        return commonDAO.getDebitAmount(name, type);
    }

    @Override
    public double getBillAmount(String query) {
        commonDAO = new CommonDAO();
        return commonDAO.getBillAmount(query);
    }

    @Override
    public List<String> getAccountNumbers() {
        commonDAO = new CommonDAO();
        return commonDAO.getAccountNumbers();
    }

    @Override
    public String getAccountNoBankName(String accountNo) {
        commonDAO = new CommonDAO();
        return commonDAO.getAccountNoBankName(accountNo);
    }

    @Override
    public String getAccountBalance(String accountno) {
        commonDAO = new CommonDAO();
        return commonDAO.getAccountBalance(accountno);
    }

    @Override
    public boolean getUserLog(String formName, String actionName) {
        commonDAO = new CommonDAO();
        return commonDAO.getUserLog(formName, actionName);
    }

    @Override
    //For Uses this method to DrugInfornation List View's
    public List<String> getListItems(String textFieldValue, String therapeuticValue, String listType) {
        commonDAO = new CommonDAO();
        return commonDAO.getListItems(textFieldValue, therapeuticValue, listType);
    }

    @Override
    public String getMasterAutoIncrement(String formName) {
        commonDAO = new CommonDAO();

        return commonDAO.getMasterAutoIncrement(formName);
    }

    @Override
    public int getAddVAT(String ms) {
        commonDAO = new CommonDAO();
        return commonDAO.getAddVAT(ms);
    }

    @Override
    public int getAddFormulation(String ms) {
        commonDAO = new CommonDAO();
        return commonDAO.getAddFormulation(ms);
    }


    
    @Override
    public int getAddTherapeutic(String ms) {
        commonDAO = new CommonDAO();
        int addTherapeutic = commonDAO.getAddTherapeutic(ms);
        return addTherapeutic;
    }

    @Override
    public boolean selectEmployee(String employee) {
        commonDAO = new CommonDAO();
        return commonDAO.selectEmployee(employee);
    }

    @Override
    public Object createRecord1(Object labelmodels) throws RemoteException {
        commonDAO = new CommonDAO();
        return commonDAO.createRecord1(labelmodels);
    }


    @Override
    public Object createRecord(Object dailyCashBookModel) {
        commonDAO = new CommonDAO();
        return commonDAO.createRecord(dailyCashBookModel);
    }

    @Override
    public Object viewCashBook(Object dailyCashBookModels) {
        commonDAO = new CommonDAO();
        return commonDAO.viewCashBook(dailyCashBookModels);
    }

    @Override
    public List<String> Distributors(String name) {
        commonDAO = new CommonDAO();
        return commonDAO.Distributors(name);
    }

    @Override
    public List<String> HospitalName(String hospitalName) {
        commonDAO = new CommonDAO();
        return commonDAO.HospitalName(hospitalName);

    }

    @Override
    public List<String> Country(String name) {
        commonDAO = new CommonDAO();
        return commonDAO.Country(name);
    }

    @Override
    public List<String> State(String country, String name) {
        commonDAO = new CommonDAO();
        return commonDAO.State(country, name);
    }

    @Override
    public boolean updateLog(String moduleInfo, String logInfo) {
        commonDAO = new CommonDAO();
        return commonDAO.updateLog(moduleInfo, logInfo);
    }

    @Override
    public List<String> getEmployers(String empName) {
        commonDAO = new CommonDAO();
        return commonDAO.getEmployers(empName);

    }

    @Override
    public boolean selectState(String country, String state) {
        commonDAO = new CommonDAO();
        return commonDAO.selectState(country, state);
    }

    @Override
    public boolean selectCountry(String country) {
        commonDAO = new CommonDAO();
        return commonDAO.selectCountry(country);
    }

    @Override
    public String getEmpSalId(String dbtable, String frontChar) {
        commonDAO = new CommonDAO();
        return commonDAO.getEmpSalId(dbtable, frontChar);
    }

    @Override
    public String getDoctorId() {
        commonDAO = new CommonDAO();
        return commonDAO.getDoctorId();
    }
   
    @Override
    public String getDocId(String dbtable, String frontChar) {
        commonDAO = new CommonDAO();
        return commonDAO.getDocId(dbtable, frontChar);
    }

    @Override
    public String getDocCodeValue(String name) {
        commonDAO = new CommonDAO();
        return commonDAO.getDocCodeValue(name);
    }

    @Override
    public List<String> DoctorCode(String name) {
        commonDAO = new CommonDAO();
        return commonDAO.DoctorCode(name);
    }

    @Override
    public String getAutoIncrement(String name) {
        commonDAO = new CommonDAO();
        return commonDAO.getAutoIncrement(name);
    }

    @Override
    public List<String> Specialist(String name) {
        commonDAO = new CommonDAO();
        return commonDAO.Specialist(name);
    }

    @Override
    public String getDocCommisionNo(String dbtable, String frontChar) {
        commonDAO = new CommonDAO();
        return commonDAO.getDocCommisionNo(dbtable, frontChar);
    }

    @Override
    public String getDocCommCode(String name) {
        commonDAO = new CommonDAO();
        return commonDAO.getDocCommCode(name);
    }

    @Override
    public List<String> getDoctorName(String name) {
        commonDAO = new CommonDAO();
        return commonDAO.getDoctorName(name);
    }

    @Override
    public List<String> getPatientName(String name) {
        commonDAO = new CommonDAO();
        return commonDAO.getPatientName(name);
    }

    @Override
    public List<String> getShopName() {
        commonDAO = new CommonDAO();
        List<String> shopDetails = commonDAO.getShopName();
        return shopDetails;
    }

    @Override
    public List<String> getSettingConfig() {
        commonDAO = new CommonDAO();
        List<String> setting = commonDAO.getSettingConfig();
        return setting;
    }

    @Override
    public int getCompare(String query) {
        commonDAO = new CommonDAO();
        int privilege = commonDAO.getCompare(query);
        return privilege;
    }

    @Override
    public String getQueryValue(String que) {
        commonDAO = new CommonDAO();
        String privilege = commonDAO.getQueryValue(que);
        return privilege;
    }

    @Override
    public int getQueryWitCol(String query, String col) {
        commonDAO = new CommonDAO();
        int privilege = commonDAO.getQueryWitCol(query, col);
        return privilege;
    }

    @Override
    public int selectCountQuryExe(String query) {
        commonDAO = new CommonDAO();
        int privilege = commonDAO.selectCountQuryExe(query);
        return privilege;
    }

    @Override
    public List<String> getChequeDetails(String chqNo) {
        commonDAO = new CommonDAO();
        return commonDAO.getChequeDetails(chqNo);
    }

    @Override
    public List<String> getEmployeeCode(String code) {
        commonDAO = new CommonDAO();
        return commonDAO.getEmployeeCode(code);
    }

    @Override
    public String getProductType() {
        commonDAO = new CommonDAO();
        return commonDAO.getProductType();
    }

    @Override
    public List<String> getUserName(String type) {
        commonDAO = new CommonDAO();
        return commonDAO.getUserName(type);
    }

    @Override
    public boolean checkUserNameExists(String str) {
        commonDAO = new CommonDAO();
        return commonDAO.checkUserNameExists(str);

    }

    @Override
    public String checkSMSConf() {
        commonDAO = new CommonDAO();
        return commonDAO.checkSMSConf();
    }

    @Override
    public boolean selectCustomer(String name) {
        commonDAO = new CommonDAO();
        return commonDAO.selectCustomer(name);
    }

    @Override
    public int selectCount(String dbTable, String name) {
        commonDAO = new CommonDAO();
        return commonDAO.selectCount(dbTable, name);
    }

    @Override
    public int selectCount(String dbTable, String columnname, String name) {
        commonDAO = new CommonDAO();
        return commonDAO.selectCount(dbTable, columnname, name);
    }

    @Override
    public boolean selectPatientName(String name){
        commonDAO = new CommonDAO();
        return commonDAO.selectPatientName(name);
    }
    
    @Override
    public String getShopDetails() {
        commonDAO = new CommonDAO();
        return commonDAO.getShopDetails();
    }

    @Override
    public List<String> CustomerName(String name) {
        commonDAO = new CommonDAO();
        return commonDAO.CustomerName(name);
    }

    @Override
    public String getCustId(String dbtable, String columnName, String frontChar) {
        commonDAO = new CommonDAO();
        return commonDAO.getCustId(dbtable, columnName, frontChar);
    }

    @Override
    public boolean selectRecord(String distName) {
        commonDAO = new CommonDAO();
        return commonDAO.selectRecord(distName);
    }

    @Override
    public String getName(String code) {
        commonDAO = new CommonDAO();
        return commonDAO.getName(code);
    }

    @Override
    public String getCode(String name) {
        commonDAO = new CommonDAO();
        return commonDAO.getCode(name);
    }

    @Override
    public String getMobileNo(String code, String name) {
        commonDAO = new CommonDAO();
        return commonDAO.getMobileNo(code, name);
    }

    @Override
    public String getEmailId(String code, String name) {
        commonDAO = new CommonDAO();
        return commonDAO.getEmailId(code, name);
    }

    @Override
    public String checkEmailConf() {
        commonDAO = new CommonDAO();
        return commonDAO.checkEmailConf();
    }

    @Override
    public List<String> GetProductDetails(String bno, String btype) {
        commonDAO = new CommonDAO();
        return commonDAO.GetProductDetails(bno, btype);
    }

    @Override
    public List<String> CompliantNumber(String name) {
        commonDAO = new CommonDAO();
        return commonDAO.CompliantNumber(name);
    }

    @Override
    public List<String> ComplaintRegisterBillNo(String name) {
        commonDAO = new CommonDAO();
        return commonDAO.ComplaintRegisterBillNo(name);
    }

    @Override
    public List<String> CreditNoteDetails(String name) {
        commonDAO = new CommonDAO();
        return commonDAO.CreditNoteDetails(name);
    }

    @Override
    public boolean selectCreditNote(String creditNoteno) {
        commonDAO = new CommonDAO();
        return commonDAO.selectCreditNote(creditNoteno);
    }

    @Override
    public double CustTotAmt(String billNo, String custName) {
        commonDAO = new CommonDAO();
        return commonDAO.CustTotAmt(billNo, custName);
    }

    @Override
    public double DistTotAmt(String invoiceNo, String distName) {
        commonDAO = new CommonDAO();
        return commonDAO.DistTotAmt(invoiceNo, distName);
    }

    @Override
    public String getPrivileges(String modname, String uname) {
        commonDAO = new CommonDAO();
        return commonDAO.getPrivileges(modname, uname);
    }

    @Override
    public List<String> getBankNameList() {
        commonDAO = new CommonDAO();
        return commonDAO.getBankNameList();
    }

    @Override
    public boolean checkExistance(String tablename, String acNo) {
        commonDAO = new CommonDAO();
        return commonDAO.checkExistance(tablename, acNo);
    }

    @Override
    public List<String> getNoteNo(String tableName, String noteNo) {
        commonDAO = new CommonDAO();
        return commonDAO.getNoteNo(tableName, noteNo);
    }

    @Override
    public List<String> getQueryValue(String query, int cnt) {
        commonDAO = new CommonDAO();
        return commonDAO.getQueryValue(query, cnt);
    }

    @Override
    public boolean selectDistributor(String distName) {
        commonDAO = new CommonDAO();
        return commonDAO.selectDistributor(distName);
    }

    @Override
    public boolean selectDebitNote(String debitNoteno) {
        commonDAO = new CommonDAO();
        return commonDAO.selectDebitNote(debitNoteno);
    }

    @Override
    public int getReturnCompare(String value, String itemCode, String itemName, String batch) throws RemoteException {
        commonDAO = new CommonDAO();
        int compareCount = commonDAO.getReturnCompare(value, itemCode, itemName, batch);
        return compareCount;
    }

    @Override
    public int getReturnCompare(String itemCode, String itemName) throws RemoteException {
        commonDAO = new CommonDAO();
        int compareCount = commonDAO.getReturnCompare(itemCode, itemName);
        return compareCount;
    }

    @Override
    public String getAlertType() throws RemoteException {
        commonDAO = new CommonDAO();
        String alertType = commonDAO.getAlertType();
        return alertType;
    }

    @Override
    public String getAlertInterval() throws RemoteException {
        commonDAO = new CommonDAO();
        String alertInterval = commonDAO.getAlertInterval();
        return alertInterval;
    }

    @Override
    public String getExpiryDate(String itemCode, String batchNumber, String alertType, String alertValue) throws RemoteException {
        commonDAO = new CommonDAO();
        String expiryStock = commonDAO.getExpiryDate(itemCode, batchNumber, alertType, alertValue);
        return expiryStock;
    }

    @Override
    public String getDummyExpiryDate() throws RemoteException {
        commonDAO = new CommonDAO();
        String edate = commonDAO.getDummyExpiryDate();
        return edate;
    }

    @Override
    public String getProduct(String itemCode) throws RemoteException {
        commonDAO = new CommonDAO();
        String drugName = commonDAO.getProduct(itemCode);
        return drugName;
    }

    @Override
    public String getDosage(String itemCode, String itemName) throws RemoteException {
        commonDAO = new CommonDAO();

        String dosage = commonDAO.getDosage(itemCode, itemName);

        return dosage;
    }

    @Override
    public String getFormulation(String itemCode, String itemName) throws RemoteException {
        commonDAO = new CommonDAO();
        String formulation = commonDAO.getFormulation(itemCode, itemName);
        return formulation;
    }

    @Override
    public int checkItemBatch(String code1, String batch) throws RemoteException {
        commonDAO = new CommonDAO();
        int qty = commonDAO.checkItemBatch(code1, batch);
        return qty;
    }

    @Override
    public String getCRNo(String srno) throws RemoteException {
        commonDAO = new CommonDAO();
        String creditNoteNo = commonDAO.getCRNo(srno);
        return creditNoteNo;
    }

    @Override
    public void userLog(String formName, String type) throws RemoteException {
        commonDAO = new CommonDAO();
        commonDAO.userLog(formName, type);
    }

    @Override
    public int queryExecution(String query) throws RemoteException {
        CommonDAO commonDAO = new CommonDAO();
        int privilege = commonDAO.queryExecution(query);
        return privilege;
    }

    @Override
    public List<String> getYear(String name) {
        commonDAO = new CommonDAO();
        return commonDAO.getYear(name);
    }

    @Override
    public int countMaintCost(String cyear, String month) {
        commonDAO = new CommonDAO();
        return commonDAO.countMaintCost(cyear, month);
    }

    @Override
    public List<String> getMonthList(String year) {
        commonDAO = new CommonDAO();
        return commonDAO.getMonthList(year);
    }

    @Override
    public boolean setChequeFlag(String chqNo, int value) {
        commonDAO = new CommonDAO();
        return commonDAO.setChequeFlag(chqNo, value);
    }

    @Override
    public String getTruncateQuery(String que) {
        commonDAO = new CommonDAO();
        String privilege = commonDAO.getTruncateQuery(que);
        return privilege;
    }

    @Override
    public HashMap getModules(String str1, String str2, String str3) {
        commonDAO = new CommonDAO();
        return commonDAO.getModules(str1, str2, str3);
    }

    @Override
    public String ShopName() throws RemoteException {
        commonDAO = new CommonDAO();
        return commonDAO.ShopName();
    }

    @Override
    public List<String> getDrugGenerics(String name, String listType)  throws RemoteException {
        commonDAO = new CommonDAO();
        return commonDAO.getDrugGenerics(name, listType);
    }
    @Override
    public List<String> getDrugProducts(String name, String listType)  throws RemoteException {
        commonDAO = new CommonDAO();
        return commonDAO.getDrugProducts(name, listType);
    }

    @Override
    public String getExpiryDrugNames() throws RemoteException {
        commonDAO = new CommonDAO();
        return commonDAO.getExpiryDrugNames();
    }
        @Override
    public List<String> getVatValues()  throws RemoteException {
        commonDAO = new CommonDAO();
        return commonDAO.getVatValues();
    }

           @Override
    public boolean employeeCodeExists(String empcode, String empname,String mode) {
        commonDAO = new CommonDAO();
        return commonDAO.employeeCodeExists(empcode, empname,mode);
    }

    @Override
    public List<Double> getSalesPurchase() {
        commonDAO = new CommonDAO();
        return commonDAO.getSalesPurchase();
    }

    @Override
    public Integer freeBillCount() {
        commonDAO = new CommonDAO();
        return commonDAO.freeBillCount();
    }

    @Override
    public List<Integer> getPrescriptionNo(int prescriptionNo) {
        commonDAO = new CommonDAO();
        return commonDAO.getPrescriptionNo(prescriptionNo);
    }

    @Override
    public List<String> getDepartment(String dept){
        commonDAO = new CommonDAO();
        return commonDAO.getDepartment(dept);
    }

    @Override
    public List<String> getPrescriptionNo1(String presno) throws RemoteException {
        commonDAO = new CommonDAO();
        return commonDAO.getPrescriptionNo1(presno);
    }

    @Override
    public String getfprice(String itemCode, String batchNumber) throws RemoteException {
        commonDAO = new CommonDAO();
        return commonDAO.getfprice(itemCode, batchNumber);
    }

  

   

}
