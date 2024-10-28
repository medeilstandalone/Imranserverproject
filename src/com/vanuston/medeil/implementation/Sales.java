/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.implementation;

import com.vanuston.medeil.model.SalesModel;
import com.vanuston.medeil.model.StockModel;
import com.vanuston.medeil.model.CreditNoteModel;

import java.rmi.RemoteException;
import java.util.List;
import java.util.Vector;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;

/**
 *
 * @author Administrator
 */
public interface Sales extends BaseImplements {
boolean insertTempStock (SalesModel sales) throws RemoteException;
boolean stockAdd(SalesModel model) throws RemoteException;
boolean stockSub(SalesModel model) throws RemoteException;
Object viewAllRecords () throws RemoteException;
Integer getAlertStatus() throws RemoteException;
Object salesTableValidation(List<SalesModel> list,String billType,String formType,String billNumber, String tableName) throws RemoteException;
int getTotTempQty(int index, int i, List<SalesModel> list) throws RemoteException;
String getSoldQty(String billnumber,String itemCode, String batchNumber, String billType) throws RemoteException;
Integer getSoldQty(String billnumber,String itemCode, String batchNumber, String billType, String tableName) throws RemoteException;
Vector loadDummyStockTable(String value) throws RemoteException;
Vector loadStockTable(String value) throws RemoteException;
Vector loadSubstituteDrug(String value,int purRate, int stk) throws RemoteException;
Vector loadSalesDetails(String value, int no) throws RemoteException;
Vector loadStockTable(String val, Object dos) throws RemoteException;
boolean updateStock(StockModel stock, String type) throws RemoteException;
SalesModel loadEditTable(String billNumber, String type) throws RemoteException;
List srBillNum() throws RemoteException;
SalesModel getBillDetails(String no, String tName) throws RemoteException;
List billNum(String name) throws RemoteException;
SalesModel srBillDetails(String no) throws RemoteException;
CreditNoteModel insertCreditNoteNo(SalesModel sales) throws RemoteException;
SalesModel loadSalesMaintain(String nowDate) throws RemoteException;
SalesModel loadSalesMaintain(String option, String val) throws RemoteException;
Boolean updateCreditDetails(String details,String creditNoteNo) throws RemoteException;
List previousBillNumber(String name) throws RemoteException;
JasperPrint jasperPrint(String billno, String billmodel, JasperReport jasperReport) throws RemoteException;
double getCreditLimit(String custName) throws RemoteException;
String getSalesEmpCode(String billNo) throws RemoteException;
int getMinStock(String Query) throws RemoteException;
void creditNotePrint(String creditNoteno,String returnNumber) throws RemoteException;
Boolean getDummyBillNumbers(String dummyBillNumber) throws RemoteException;
SalesModel getStockItem(String val,double qty) throws RemoteException;
String[] getCustomerDetails(int custId) throws RemoteException;
int getCustomerId(String cusName) throws RemoteException;
}
