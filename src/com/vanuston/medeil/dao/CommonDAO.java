/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.dao;

import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.model.DailyCashBookModel;
import com.vanuston.medeil.model.LabelPrinterModel;
import java.rmi.RemoteException;
import java.sql.ResultSet;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.Value;
import java.sql.CallableStatement;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.sql.Date;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.HashMap;

/**
 *
 * @author Administrator
 */
public class CommonDAO implements CommonImplements {

    static Logger log = Logger.getLogger(CommonDAO.class, "com.vanuston.medeil.DAO.CommonDAO");

    @Override
    public String getAutoIncrement(String date, String name) {
        String autoVal = null;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("CALL pro_getAutoIncrement('" + DateUtils.changeFormatDate(date) + "','" + name + "');");
            while (rs.next()) {
                autoVal = rs.getString(1);
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDAO  Method  : getAutoIncrement Exception:" + ex.getMessage() + " Form Name :" + name;
            log.debug(ss);
        }
        return autoVal;
    }

    @Override
    public List<String> customerName(String name) {
        List<String> customers = new ArrayList<String>();

        try {
            ResultSet rs = null;
            if (name.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select cust_name from cust_information where cust_flag_id!=1");
            } else {
                rs = DBConnection.getStatement().executeQuery("select cust_name from cust_information where cust_name like'" + name + "%' and cust_flag_id!=1");
            }
            int i = 0;
            while (rs.next()) {

                customers.add(rs.getString("cust_name"));
                i++;
            }

        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : customerName     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return customers;
    }

    @Override
    public List<String> customerName1(String name) {
        List<String> customers = new ArrayList<String>();

        try {
            ResultSet rs = null;
            if (name.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select concat(cust_name,' - ',mobile_no) as cust_name from cust_information where cust_flag_id!=1");
            } else {
                rs = DBConnection.getStatement().executeQuery("select concat(cust_name,' - ',mobile_no) as cust_name from cust_information where cust_name like'" + name + "%' and cust_flag_id!=1");
            }
            int i = 0;
            while (rs.next()) {

                customers.add(rs.getString("cust_name"));
                i++;
            }

        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : customerName     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return customers;
    }

    @Override
    public List<String> getPatientName(String name) {
        List<String> patientName = new ArrayList<String>();

        try {
            ResultSet rs = null;
            if (name.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select cust_name from med_patient_details_mt where is_active=1");
            } else {
                rs = DBConnection.getStatement().executeQuery("select cust_name from med_patient_details_mt where cust_name like'" + name + "%' and is_active=1");
            }
            int i = 0;
            while (rs.next()) {
                patientName.add(rs.getString("cust_name"));
                i++;
            }

        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : getPatientName     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return patientName;
    }

    @Override
    public String getCustomerBalance(String customer) {
        double bal = 0.00;
        String retVal = "";
        if (!customer.trim().equals("") || customer != null) {
            try {
                ResultSet rs = DBConnection.getStatement().executeQuery("CALL pro_custos('individual_list','" + customer.trim() + "');");
                while (rs.next()) {
                    bal = rs.getDouble("outstanding");
                }
            } catch (Exception ex) {
                String ss = "Class : CommonDAO  Method  : getBalance Exception:" + ex.getMessage();
                log.debug(ss);
            }
        }
        retVal = Value.Round(bal);
        return retVal;
    }

    @Override
    public String getCustomerCode(String name) {
        String custName = null;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select cust_code from cust_information where cust_name='" + name + "'");
            while (rs.next()) {
                custName = rs.getString("cust_code");
            }
        } catch (Exception ex) {
            String ss = "Class : getCustomerCode   Method  : getCode  Exception :" + ex.getMessage() + " For Patient: " + name;
            log.debug(ss);
        }
        return custName;
    }

    @Override
    public String getShopTinNo() {
        String TinNO = null;
        String query = "SELECT tin_no FROM shop_information";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                TinNO = rs.getString("tin_no");
            }

        } catch (Exception ex) {
            String ss = "Class : DBData  Method  : getShopTinNoException:" + ex.getMessage();
            log.debug(ss);
        }
        return TinNO;
    }

    @Override
    public List<String> getDistributors(String name) {
        List<String> distributors = new ArrayList<String>();

        try {
            ResultSet rs = null;
            if (name.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select * from dist_information where dist_flag_id = '0'");
            } else {
                rs = DBConnection.getStatement().executeQuery("select * from dist_information where dist_name like'" + name + "%' and dist_flag_id = '0'");
            }
            while (rs.next()) {
                distributors.add(rs.getString("dist_name"));
            }

        } catch (Exception e) {
            String ss = "Class : CommonDAO  Method  : getDistributors:" + e.getMessage();
            log.debug(ss);
        }
        return distributors;
    }

    @Override
    public List<String> getChequeNumbers(String type) {
        List<String> chequeList = new ArrayList<String>();

        try {
            chequeList.add("-- Select --");
            String sql = "select chq_no from cheque_transaction where chq_flag_id=0 and paid_flag_id=0 and particulars='" + type + "'";
            ResultSet rs = null;
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                chequeList.add(rs.getString("chq_no"));
            }
        } catch (Exception e) {
            String ss = "Class : CommonDAO  Method  : getchequeNumbers:" + e.getMessage();
            log.debug(ss);
        }
        return chequeList;
    }

    @Override
    public List<String> getAccountNumbers() {
        List<String> accountNumbersList = new ArrayList<String>();

        try {
            String sql = "select acc_number from bank_details where bd_flag_id=0";
            accountNumbersList.add("-- Select --");
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                accountNumbersList.add(rs.getString("acc_number"));
            }
        } catch (Exception e) {
            String msg = "Class: CommonDAO  Method: getBankAccountNo()  = " + e.getMessage();
            log.debug(msg);
        }
        return accountNumbersList;
    }

    @Override
    public double getCreditAmount(String name, String type) {
        double amount = 0.00;
        try {
            ResultSet rs = null;
            String sql = "";
            sql = "SELECT sum(amount)as amt FROM credit_note where issued_against='" + type.trim() + "' and name='" + name.trim() + "'  and cre_flag_id=0";

            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                amount = rs.getDouble("amt");
            }
        } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method : getCreditAmount()  = " + ex.getMessage();
            log.debug(msg);
        }
        return amount;
    }

    @Override
    public double getDebitAmount(String name, String type) {
        double amount = 0.00;
        name = name.trim();
        type = type.trim();
        try {
            ResultSet rs = null;
            String sql = "";
            sql = "SELECT sum(amount)as amt FROM debit_note where issued_against='" + type + "' and name='" + name + "'  and dn_flag_id=0";

            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                amount = rs.getDouble("amt");
            }
        } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method : getDebitAmout()  = " + ex.getMessage();
            log.debug(msg);
        }
        return amount;
    }

    @Override
    public double getBillAmount(String sql) {
        double amount = 0.00;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                amount = rs.getDouble("amt");
            }


        } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method :   = " + ex.getMessage();
            log.debug(msg);
        }
        return amount;
    }

    @Override
    public String getAccountNoBankName(String acccountNo) {

        String bankName = "";
        try {
            String sql = "select concat(bank_name,', ',branch ) as ban from bank_details   where acc_number='" + acccountNo + "'";
            ResultSet rs = null;
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                bankName = rs.getString("ban");
            }
        } catch (Exception e) {
            String msg = "Class: CommonDAO  Method: accountNoBankName()  = " + e.getMessage();
            log.debug(msg);
      }
        return bankName;
    }

    @Override
    public String getAccountBalance(String accountno) {

        String closingBalance = "0.00";

        try {
            String sql = "select closing_balance from bank_book where  account_no='" + accountno + "'  and bank_flag_id!=2 order by bank_id desc limit 0,1";
            ResultSet rs = null;
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                closingBalance = Value.Round(rs.getDouble("closing_balance"));
            }
        } catch (Exception e) {
            String msg = "Class: CommonDAO  Method: getAccountBalance()  = " + e.getMessage();
            log.debug(msg);

        }
        return closingBalance;

    }

    @Override
    public List<String> getListItems(String getTextFieldValue, String getTherapeuticValue, String listType) {
        List<String> v = new ArrayList<String>();

        try {
            ResultSet rs = null;
            getTextFieldValue = getTextFieldValue.trim();
            if (listType.equals("DRU") || listType.equals("")) {
                if (getTextFieldValue.equals("") || getTextFieldValue == "") {
                    rs = DBConnection.getStatement().executeQuery("select * from drugtable");
                } else {
                    rs = DBConnection.getStatement().executeQuery("select * from drugtable where itemname like'" + getTextFieldValue + "%'");
                }
                while (rs.next()) {
                    // v.addElement(rs.getString("itemname"));
                    v.add(rs.getString("itemname"));
                }
                v.add("Others");
            } else if (listType.equals("DRUDOSAGE") || listType.equals("")) {
                if (getTextFieldValue.equals("") || getTextFieldValue == "") {
                    rs = DBConnection.getStatement().executeQuery("select * from drugtable where dru_flag_id!=3");
                } else {
                    rs = DBConnection.getStatement().executeQuery("select * from drugtable where itemname like'" + getTextFieldValue + "%' and dru_flag_id!=3");
                }
                while (rs.next()) {
                    v.add(rs.getString("itemname").trim()+"_"+rs.getString("dosage").trim());
                }
            } else if (listType.equals("THE") || listType == "THE") {
                if (getTextFieldValue.equals("") || getTextFieldValue == "") {
                    rs = DBConnection.getStatement().executeQuery("select distinct(therapeutic_class) from therapeutics order by therapeutic_class");
                } else {
                    rs = DBConnection.getStatement().executeQuery("select distinct(therapeutic_class) from therapeutics where therapeutic_class like'" + getTextFieldValue + "%' order by therapeutic_class");
                }
                while (rs.next()) {
                    v.add(rs.getString("therapeutic_class").trim());
                }
                v.add("Others");
            } else if (listType.equals("STH") || listType == "STH") {
                if (getTextFieldValue.equals("") || getTextFieldValue == "") {
                    rs = DBConnection.getStatement().executeQuery("select distinct(subtherapeutic_subclass) from therapeutics where therapeutic_class='" + getTherapeuticValue + "' order by subtherapeutic_subclass ");
                } else {
                    rs = DBConnection.getStatement().executeQuery("select distinct(subtherapeutic_subclass) from therapeutics where therapeutic_class='" + getTherapeuticValue + "' and subtherapeutic_subclass like'" + getTextFieldValue + "%' order by subtherapeutic_subclass");

                }
                while (rs.next()) {
                    v.add(rs.getString("subtherapeutic_subclass").trim());
                }
                //v.add("Others");
            } else if (listType.equals("FOR") || listType == "FOR") {
                if (getTextFieldValue.equals("") || getTextFieldValue == "") {
                    rs = DBConnection.getStatement().executeQuery("select distinct(formulation) from formulations order by formulation");
                } else {
                    rs = DBConnection.getStatement().executeQuery("select distinct(formulation) from formulations where formulation like'" + getTextFieldValue + "%' order by formulation");
                }
                while (rs.next()) {
                    v.add(rs.getString("formulation").trim());
                }
                v.add("Others");
            } else if (listType.equals("DEP") || listType == "DEP") {
                if (getTextFieldValue.equals("") || getTextFieldValue == "") {
                    rs = DBConnection.getStatement().executeQuery("select distinct(department) from departments order by department");
                } else {
                    rs = DBConnection.getStatement().executeQuery("select distinct(department) from departments where department like'" + getTextFieldValue + "%' order by department");
                }
                while (rs.next()) {
                    v.add(rs.getString("department").trim());
                }
                v.add("Others");
            }else if (listType.equals("MFR") || listType == "MFR") {
                if (getTextFieldValue.equals("") || getTextFieldValue == "") {
                    rs = DBConnection.getStatement().executeQuery("SELECT distinct company_name FROM medil.drugtable d where company_name!='" + " " + "' and  company_name is not null order by company_name asc");
                } else {
                    rs = DBConnection.getStatement().executeQuery("SELECT distinct company_name FROM medil.drugtable d where company_name!='" + " " + "' and  company_name is not null and company_name like '" + getTextFieldValue + "%' order by company_name asc");
                }
                while (rs.next()) {
                    v.add(rs.getString("company_name"));
                }
                v.add("Others");
            } else if (listType.equals("VAT") || listType == "VAT") {
                String sql = "SELECT * FROM vat_master  order by vat_val";
                v.add("---Select---");
                rs = DBConnection.getStatement().executeQuery(sql);
                while (rs.next()) {
                    v.add(rs.getString("vat_val"));
                }
            } else if (listType.equals("invoiceno") || listType == "invoiceno") {
                if (getTextFieldValue != null) {
                    if (getTextFieldValue.equals("") || getTextFieldValue == "") {
                        rs = DBConnection.getStatement().executeQuery("select distinct(invoice_no) from damage_stocks"); // where invoice_no= '" + invoiceno + "' order by invoice_no");
                    } else {
                        rs = DBConnection.getStatement().executeQuery("select distinct(invoice_no) from damage_stocks where invoice_no like '" + getTextFieldValue + "%'");
                    }
                    while (rs.next()) {
                        v.add(rs.getString("invoice_no"));
                    }
                } else {
                    getTextFieldValue = "";
                }
            } else if (listType.equals("purinvoiceno") || listType == "purinvoiceno") {
                if (getTextFieldValue != null) {
                    if (getTextFieldValue.equals("") || getTextFieldValue == "") {
                        rs = DBConnection.getStatement().executeQuery("select distinct(invoice_no) from purchase_invoice"); // where invoice_no= '" + invoiceno + "' order by invoice_no");
                    } else {
                        rs = DBConnection.getStatement().executeQuery("select distinct (p.invoice_no) from purchase_invoice p,stock_statement s,dist_information d where p.invoice_no like'" + getTextFieldValue + "%'");
                    }
                    while (rs.next()) {
                        v.add(rs.getString("invoice_no"));
                    }
                }
            } else if (listType.equals("itemandbatch") || listType == "itemandbatch") {

                if (getTextFieldValue.equals("") || getTextFieldValue == "") {
                    rs = DBConnection.getStatement().executeQuery("select * from purchase_invoice"); // where invoice_no= '" + invoiceno + "' order by invoice_no");
                } else {
                    rs = DBConnection.getStatement().executeQuery("select p.item_name,s.item_name,p.dist_name,s.batch_no from purchase_invoice p,stock_statement s where p.invoice_no like '" + getTextFieldValue + "%' and p.batch_no=s.batch_no");
                }
                while (rs.next()) {
                    v.add(rs.getString("item_name"));
                }
            } else if (listType.equals("InvoiceDamage") || listType == "InvoiceDamage") {

                if (getTextFieldValue.equals("") || getTextFieldValue == "") {
                    rs = DBConnection.getStatement().executeQuery("select distinct(invoice_no) from damage_stocks"); // where invoice_no= '" + invoiceno + "' order by invoice_no");
                } else {
                    rs = DBConnection.getStatement().executeQuery("select distinct(invoice_no) from damage_stocks where invoice_no like '" + getTextFieldValue + "%'");
                }
                while (rs.next()) {
                    v.add(rs.getString("invoice_no"));
                }
            } else if (listType.equals("DISTRI") || listType == "DISTRI") {
                if (getTextFieldValue.equals("") || getTextFieldValue == "") {
                    rs = DBConnection.getStatement().executeQuery("select * from dist_information where dist_flag_id=0");
                } else {
                    rs = DBConnection.getStatement().executeQuery("select * from dist_information where dist_flag_id=0 and dist_name like'" + getTextFieldValue + "%'");
                }
                while (rs.next()) {
                    // v.addElement(rs.getString("itemname"));
                    v.add(rs.getString("dist_name"));
                }
            }

        } catch (Exception ex) {
            String msg = "Class : GetListItems Method :   =" + ex.getMessage();
            log.debug(msg);

        }
        return v;
    }

    @Override
    public String getPrivileges(String modname, String uname) {
        String query = "select " + modname + " from user_info where user_name='" + uname + "'";

        String priv = "";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                priv = rs.getString(modname);
            }
        } catch (Exception ex) {
            String ss = "Method : getPrivillages     Exception :" + ex.getMessage() + " Query :" + query;
            log.debug(ss);
        }
       return priv;
    }

    @Override
    public String getUserType(String uname) {
        String utype = "";
        if (uname.equals("MedeilAdmin")) {
            utype = "Admin";
        } else {
            String query = "select user_type from user_info where user_name='" + uname + "'";
            try {
                ResultSet rs = DBConnection.getStatement().executeQuery(query);
                while (rs.next()) {
                    utype = rs.getString("user_type");
                }
            } catch (Exception ex) {
                String ss = "Method : getUserType     Exception :" + ex.getMessage() + " Query :" + query;
                log.debug(ss);
            }
        }
        return utype;
    }

    @Override
    public boolean getUserLog(String formName, String actionName) {
        boolean userLog = false;
        try {
            DBConnection.getStatement().executeUpdate("CALL pro_userlog('" + formName + "','" + actionName + "');");
            userLog = true;
        } catch (Exception ex) {
            String ss = "Class : DBData  Method  : getAutoIncrementException:" + ex.getMessage() + " Form Name :" + formName;
            log.debug(ss);
        }
        return userLog;
    }

    @Override
    public String getMasterAutoIncrement(String formName) {
        String autoVal = null;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("CALL pro_mastersautoincrement('" + formName + "');");
            while (rs.next()) {
                autoVal = rs.getString(1);
            }
        } catch (Exception ex) {
            String ss = "Class : DBData  Method  : getAutoIncrementException:" + ex.getMessage() + " Form Name :" + formName;
            log.debug(ss);
        }
        return autoVal;
    }

    @Override
    public int getAddFormulation(String ms) {
        int a = 0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select * from formulations where formulation='" + ms + "'");
            while (rs.next()) {
                a = 1;
            }
            if (a == 1) {
                a = 1;
            } else {
                //formulation = txtFormulation.rawText;
                DBConnection.getStatement().executeUpdate("insert into formulations(formulation) values('" + ms + "')");
            }
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(CommonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }



    @Override
    public int getAddTherapeutic(String ms) {
        int a = 0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select * from therapeutics where therapeutic_class='" + ms + "'");
            while (rs.next()) {
                a = 1;
            }
            if (a == 1) {
                a = 1;
            } else {
                //formulation = txtFormulation.rawText;
                DBConnection.getStatement().executeUpdate("insert into therapeutics values('" + ms + "','')");
            }
        } catch (SQLException ex) {
            java.util.logging.Logger.getLogger(CommonDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return a;
    }

    @Override
    public int getAddVAT(String ms) {
        int a = 0;
        try {

            ResultSet rs = DBConnection.getStatement().executeQuery("select * from vat_master where vat_val='" + ms + "'");
            while (rs.next()) {
                a = 1;
            }
            if (a == 1) {
                a = 1;
            } else {
                //VAT = txtVAT.rawText;
                DBConnection.getStatement().executeUpdate("insert into vat_master(vat_val) values('" + ms + "')");
                a = 0;
            }
        } catch (SQLException ex) {
        }
        return a;
    }

    @Override
    public Object createRecord1(Object labelmodels) throws RemoteException {
        boolean isCreate = false;        
        LabelPrinterModel labelprintmodel = (LabelPrinterModel) labelmodels;
        try{
          int i=0;
          String sql="CALL pro_labelprint_dao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
          CallableStatement cs=DBConnection.getConnection().prepareCall(sql);
          Logger.write("LabelPrinterModel   ==== >"+labelprintmodel.getPrescreptionNO()+" ==== "+
                  String.valueOf(i++));
          cs.setInt(1,Integer.valueOf(labelprintmodel.getPrescreptionNO()));
          Logger.write("LabelPrinterModel   ==== >"+labelprintmodel.getCustomerName());
          cs.setString(2,labelprintmodel.getCustomerName());
          Logger.write("LabelPrinterModel   ==== >"+labelprintmodel.getDoctorName());
          cs.setString(3,labelprintmodel.getDoctorName());
          Logger.write("LabelPrinterModel   ==== >"+labelprintmodel.getProductName());
          cs.setString(4,labelprintmodel.getProductName());
          Logger.write("LabelPrinterModel   ==== >"+labelprintmodel.getDrugCaution());
          cs.setString(5,labelprintmodel.getDrugCaution());
          Logger.write("LabelPrinterModel   ==== >"+labelprintmodel.getFederalCaution());
          cs.setString(6,labelprintmodel.getFederalCaution());
          Logger.write("LabelPrinterModel   ==== >"+labelprintmodel.getProductPacked());
          cs.setString(7,labelprintmodel.getProductPacked());
          Logger.write("LabelPrinterModel   ==== >"+labelprintmodel.getBestBeforeOn());
          cs.setString(8,labelprintmodel.getBestBeforeOn());
          Logger.write("LabelPrinterModel   ==== >"+labelprintmodel.getQTY());
          cs.setInt(9,Integer.parseInt(labelprintmodel.getQTY()));
          Logger.write("LabelPrinterModel   ==== >"+labelprintmodel.getMorning());
          cs.setString(10,labelprintmodel.getMorning());
          Logger.write("LabelPrinterModel   ==== >"+labelprintmodel.getNoon());
          cs.setString(11,labelprintmodel.getNoon());
          Logger.write("LabelPrinterModel   ==== >"+labelprintmodel.getEvening());
          cs.setString(12,labelprintmodel.getEvening());
          Logger.write("LabelPrinterModel   ==== >"+labelprintmodel.getNight());
          cs.setString(13,labelprintmodel.getNight());
          Logger.write("LabelPrinterModel   ==== >"+labelprintmodel.getPrescreptionNO());
          cs.setString(14,"save");
          cs.registerOutParameter(15, Types.INTEGER);
          Logger.write("LabelPrinterModel   ==== >"+labelprintmodel.getPrescreptionNO());
          cs.executeUpdate();
          Logger.write("LabelPrinterModel   ==== >"+labelprintmodel.getPrescreptionNO());
           int sf=cs.getInt("status_flag");
            if(sf==1) {
                isCreate = true;
            }         
        }

        catch (Exception e) {
            isCreate = false;
            log.debug("Err in createRecord1 in CommonDAO :" + e);
        }
        System.out.println(isCreate);
        return isCreate;
        
    }


    @Override
    public Object createRecord(Object dailyCashBookModels) {
        boolean isCreate = false;
        DailyCashBookModel dailyCashBookModel = (DailyCashBookModel) dailyCashBookModels;
        try {
            int i = 0;
            String sql = "CAll pro_updatedaybook (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            CallableStatement cs = DBConnection.getConnection().prepareCall(sql);
            cs.setDate(++i, Date.valueOf(dailyCashBookModel.getDate()));
            cs.setDouble(++i, dailyCashBookModel.getOpenCashBalance());
            cs.setDouble(++i, dailyCashBookModel.getCloseCashBalance());
            cs.setDouble(++i, dailyCashBookModel.getDebitSales());
            cs.setDouble(++i, dailyCashBookModel.getDebitReceipts());
            cs.setDouble(++i, dailyCashBookModel.getCashIntroduced());
            cs.setDouble(++i, dailyCashBookModel.getCashWithdrawal());
            cs.setDouble(++i, dailyCashBookModel.getCreditPayments());
            cs.setDouble(++i, dailyCashBookModel.getCreditMaintain());
            cs.setString(++i, "Employee Salary");
            cs.setString(++i, dailyCashBookModel.getExpenses2());
            cs.setString(++i, dailyCashBookModel.getExpenses3());
            cs.setString(++i, dailyCashBookModel.getExpenses4());
            cs.setDouble(++i, dailyCashBookModel.getOtherExpenses1());
            cs.setDouble(++i, dailyCashBookModel.getOtherExpenses2());
            cs.setDouble(++i, dailyCashBookModel.getOtherExpenses3());
            cs.setDouble(++i, dailyCashBookModel.getOtherExpenses4());
            cs.setDouble(++i, dailyCashBookModel.getTotalDebit());
            cs.setDouble(++i, dailyCashBookModel.getTotalCredit());
            cs.registerOutParameter(++i, Types.INTEGER);
            cs.executeUpdate();

            if (cs.getInt("flag") == 1) {
                isCreate = true;
            }
        } catch (Exception e) {
            isCreate = false;
            log.debug("Err in createRecord in CommonDAO :" + e);
        }
        return isCreate;
    }

    @Override
    public Object viewCashBook(Object dailyCashBookModels) {
        DailyCashBookModel dailyCashBookModel = (DailyCashBookModel) dailyCashBookModels;
        String bookdate = dailyCashBookModel.getDate();
        try {
            ResultSet rs = null;
            if (bookdate == null ? "" != null : !bookdate.equals("")) {                         
                String sql2 = "call pro_dailycashbook('" + bookdate + "',@flag)";
                rs = DBConnection.getStatement().executeQuery(sql2);
            }
            dailyCashBookModel = new DailyCashBookModel();
            while (rs.next()) {
                    dailyCashBookModel.setOpenCashBalance(rs.getDouble("opening_balance"));
                    dailyCashBookModel.setCloseCashBalance(rs.getDouble("closing_balance"));
                    dailyCashBookModel.setDebitSales(rs.getDouble("smcash1"));
                    dailyCashBookModel.setDebitReceipts(rs.getDouble("receipt1"));
                    dailyCashBookModel.setCreditPayments(rs.getDouble("payment1"));
                    dailyCashBookModel.setCashIntroduced(rs.getDouble("cashintroduced"));
                    dailyCashBookModel.setCashWithdrawal(rs.getDouble("cashwithdrawal"));
                    dailyCashBookModel.setCreditMaintain(rs.getDouble("shopmcost1"));
                    dailyCashBookModel.setExpenses1(rs.getString("expenses1"));
                    dailyCashBookModel.setExpenses2(rs.getString("expenses2"));
                    dailyCashBookModel.setExpenses3(rs.getString("expenses3"));
                    dailyCashBookModel.setExpenses4(rs.getString("expenses4"));
                    dailyCashBookModel.setOtherExpenses1(rs.getDouble("other_expenses1"));
                    dailyCashBookModel.setOtherExpenses2(rs.getDouble("other_expenses2"));
                    dailyCashBookModel.setOtherExpenses3(rs.getDouble("other_expenses3"));
                    dailyCashBookModel.setOtherExpenses4(rs.getDouble("other_expenses4"));
                    dailyCashBookModel.setTotalDebit(rs.getDouble("total_debit"));
                    dailyCashBookModel.setTotalCredit(rs.getDouble("total_credit"));                                   
               
            }
        } catch (Exception e) {
            log.debug("Err in viewRecord() in CommonDAO:" + e.getMessage());
        }
        return dailyCashBookModel;
    }

    @Override
    public List<String> State(String country, String name) {
        List<String> stateList = new ArrayList<String>();

        try {
            ResultSet rs = null;
            if (name.equals("") || name == null) {
                rs = DBConnection.getStatement().executeQuery("select distinct(state) from state where country= '" + country + "' order by state");
            } else {
                rs = DBConnection.getStatement().executeQuery("select distinct(state) from state where country='" + country + "' and state like '" + name + "%' order by state");
            }
            while (rs.next()) {
                stateList.add(rs.getString("state"));
            }



        } catch (Exception ex) {
            String msg = "Class : GetSelectClass  Method  : State()   = " + ex.getMessage();
            log.debug(msg);
        }
        return stateList;
    }

    @Override
    public List<String> Country(String name) {
        List<String> countries = new ArrayList<String>();

        try {
            ResultSet rs = null;
            if (name.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select distinct(country) from state");
            } else {
                rs = DBConnection.getStatement().executeQuery("select distinct(country) from state where country like '" + name + "%'");
            }
            while (rs.next()) {
                countries.add(rs.getString("country"));
            }
        } catch (Exception e) {
        }
        return countries;
    }

    @Override
    public boolean updateLog(String moduleInfo, String logInfo) {
        boolean isSave = false;
        try {
            String sql = "CALL pro_userlog('" + moduleInfo + "','" + logInfo + "')";

            if (DBConnection.getStatement().executeUpdate(sql) > 0) {
                isSave = true;
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
            isSave = false;
        }
        return isSave;
    }

    @Override
    public List<String> HospitalName(String hospitalName) {
        List<String> hospitals = new ArrayList<String>();

        try {
            ResultSet rs = null;
            if (hospitalName.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select hospital_name from hospital_information where   hos_flag_id=0 order by hospital_name");
            } else {
                rs = DBConnection.getStatement().executeQuery("select hospital_name from hospital_information where   hos_flag_id=0 and hospital_name like'" + hospitalName + "%' order by hospital_name");
            }
            while (rs.next()) {
                hospitals.add(rs.getString("hospital_name"));
            }


        } catch (Exception e) {
        }
        return hospitals;

    }

    @Override
    public List<String> Distributors(String name) {
        List<String> distributors = new ArrayList<String>();

        try {
            ResultSet rs = null;
            if (name.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select * from dist_information where dist_flag_id = '0'");
            } else {
                rs = DBConnection.getStatement().executeQuery("select * from dist_information where dist_name like'" + name + "%' and dist_flag_id = '0'");
            }
            while (rs.next()) {
                distributors.add(rs.getString("dist_name"));
            }

        } catch (Exception e) {
        }
        return distributors;

    }

    @Override
    public List<String> getEmployers(String empName) {
        List<String> employers = new ArrayList<String>();

        try {
            ResultSet rs = null;
            if (empName.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select * from employee_information where emp_flag_id = '0'");
            } else {
                rs = DBConnection.getStatement().executeQuery("select emp_name from employee_information where emp_name like'" + empName + "%' and emp_flag_id = '0'");
            }
            while (rs.next()) {
                employers.add(rs.getString("emp_name"));
            }

        } catch (Exception e) {
        }
        return employers;

    }

    @Override
    public boolean selectState(String country, String state) {
        boolean isSelect = false;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select distinct(state) from state where country = '" + country + "' and state ='" + state + "'");
            while (rs.next()) {
                isSelect = true;
            }
        } catch (Exception e) {
            isSelect = false;

        }
        return isSelect;
    }

    @Override
    public boolean selectCountry(String country) {
        boolean isSelect = false;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select distinct(country) from state where country = '" + country + "'");
            while (rs.next()) {
                isSelect = true;
            }
        } catch (Exception e) {
            isSelect = false;

        }
        return isSelect;
    }

    @Override
    public boolean selectEmployee(String employee) {
        boolean isSelect = false;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select emp_name from employee_information where emp_name ='" + employee + "' and emp_flag_id = '0'");
            while (rs.next()) {
                isSelect = true;
            }

        } catch (Exception e) {
            isSelect = false;

        }
        return isSelect;
    }

    @Override
    public String getEmpSalId(String dbtable, String frontChar) {
        String empSalId = frontChar, idString;
        String zerofill[] = {"", "000000", "00000", "0000", "000", "00", "0"};
        int id;
        String sql = "select max(sal_id) as sal_id from " + dbtable + " ";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                empSalId = rs.getString("sal_id");
            }
            if (empSalId.equals("") || empSalId == null) {
                empSalId = "ESA0000001";
            } else {
                id = Integer.parseInt(empSalId.substring(frontChar.length()));
                idString = "" + id;
                id = id + 1;
                empSalId = frontChar + zerofill[idString.length()] + id;
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }

        return empSalId;

    }

    @Override
    public String getDoctorId() {
        String code = "";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select * from doctors_information");
            while (rs.next()) {
                code = rs.getString("doctor_id");
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return code;
    }

    @Override
    public String getDocCodeValue(String name) {
        String autoIncreId = "";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("CALL pro_autoincre('" + name + "');");
            while (rs.next()) {
                autoIncreId = rs.getString("aid");
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return autoIncreId;
    }

    @Override
    public List<String> DoctorCode(String name) {
        List<String> v = new ArrayList<String>();


        try {
            ResultSet rs = null;
            if (name.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select * from doctors_information");
            } else {
                rs = DBConnection.getStatement().executeQuery("select * from doctors_information where doctor_code like '" + name + "%' or doctor_code like '%" + name + "' or doctor_code like '%" + name + "%' and doc_flag_id= 0");
            }
            while (rs.next()) {
                if (rs.getInt("doc_flag_id") == 0) {
                    v.add(rs.getString("doctor_code"));
                }
            }


        } catch (Exception ex) {
            String msg = "Class : GetSelectClass  Method  : DoctorCode()   = " + ex.getMessage();
            log.debug(msg);
        }
        return v;
    }

    @Override
    public String getDocId(String dbtable, String frontChar) {
        String code = frontChar, idString;
        String zerofill[] = {"", "000000", "00000", "0000", "000", "00", "0"};
        int id;
        String sql = "select * from " + dbtable + " ";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                code = rs.getString("doctor_id");
            }
            if (code.equals("") || code == null) {
                code = "DOC0000001";
            } else {
                id = Integer.parseInt(code.substring(frontChar.length()));
                id = id + 1;
                idString = "" + id;
                code = frontChar + zerofill[idString.length()] + id;
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }

        return code;
   }

    @Override
    public String getDocCommisionNo(String dbtable, String frontChar) {
        String code = "", idString;
        String zerofill[] = {"", "000000", "00000", "0000", "000", "00", "0"};
        int id;
        String sql = "select * from " + dbtable + " ";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                code = rs.getString("dch_id");
            }
            if (code.equals("") || code == null) {
                code = "DCH0000001";
            } else {
                id = Integer.parseInt(code.substring(frontChar.length()));
                id = id + 1;
                idString = String.valueOf(id);
                code = frontChar + zerofill[idString.length()] + id;
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return code;

    }

    @Override
    public String getAutoIncrement(String name) {
        String autoVal = null;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("CALL pro_autoincre('" + name + "');");
            while (rs.next()) {
                autoVal = rs.getString(1);
            }
        } catch (Exception ex) {
            String ss = "Class : DBData  Method  : getAutoIncrementException:" + ex.getMessage() + " Form Name :" + name;
            log.debug(ss);
        }
        return autoVal;
    }

    @Override
    public List<String> Specialist(String name) {
        List<String> v = new ArrayList<String>();
        List<String> s = new ArrayList<String>();

        try {
            ResultSet rs = null;
            if (name.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select distinct(specialist) from doctor_specialist");
            } else {
                rs = DBConnection.getStatement().executeQuery("select distinct(specialist) from doctor_specialist where specialist like '" + name + "%'");
            }
            while (rs.next()) {
                v.add(rs.getString("specialist"));
            }
            s = v;
            for (int i = 0; i < v.size(); i++) {
                s.set(i, "" + v.get(i));
            }


        } catch (Exception ex) {
            String msg = "Class : GetSelectClass  Method  : Specialist()   = " + ex.getMessage();
            log.debug(msg);
        }
        return s;
    }

    @Override
    public String getDocCommCode(String name) {
        String DocCommCode = "";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select doctor_id from doctors_information where doctor_name = '" + name + "'");
            while (rs.next()) {
                DocCommCode = rs.getString("doctor_id");
            }
        } catch (Exception e) {
            log.debug("Err in getDoccommCode(name) in CommonDAO:" + e);
        }
        return DocCommCode;
    }

    @Override
    public List<String> getDoctorName(String name) {
        List<String> v = new ArrayList<String>();
        try {
            ResultSet rs = null;
            if (name.trim().length() == 0) {
                rs = DBConnection.getStatement().executeQuery("select doctor_name from doctors_information where doc_flag_id=0");
            } else {
                rs = DBConnection.getStatement().executeQuery("select doctor_name from doctors_information where doc_flag_id=0 and doctor_name like'" + name + "%'");
            }
            while (rs.next()) {
                v.add(rs.getString("doctor_name"));
            }
       } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method : getDoctorName()  = " + ex.getMessage();
            log.debug(msg);
        }
        return v;
    }
    //getCompare() By Saravanakumar

    @Override
    public int getCompare(String query) {
        int qty = 0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                if (rs.getString("compare") != null) {
                    qty = rs.getInt("compare");
                }
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDao  Method  : getCompare Exception:" + ex.getMessage() + " Query :" + query;
            log.debug(ss);
        }
        return qty;
    }

    //getShopName() By Saravanakumar
    @Override
    public List<String> getShopName() {
        List<String> sname = new ArrayList<String>();
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("SELECT * FROM shop_information");
            while (rs.next()) {
                if (rs != null) {
                    sname.add(rs.getString("shop_name"));
                    sname.add(rs.getString("address1"));
                    sname.add(rs.getString("city"));
                    sname.add(rs.getString("state"));
                    sname.add(rs.getString("pincode"));
                    sname.add(rs.getString("contact_no1"));
                    sname.add(rs.getString("fax_no"));
                    sname.add(rs.getString("email_id"));
                }
            }
        } catch (Exception ex) {
            String ss = "Class : DBData  Method  : getShopNameException:" + ex.getMessage();
            log.debug(ss);
        }
        return sname;
    }

    //getSettingConfig() By Saravanakumar
    @Override
    public List<String> getSettingConfig() {
        List<String> scon = new ArrayList<String>();

        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select * from settings_config");
            while (rs.next()) {
                if (rs != null) {
                    scon.add(rs.getString("email_username"));
                    scon.add(rs.getString("email_password"));
                    scon.add(rs.getString("defaultsms_gw"));
                    scon.add(rs.getString("way2sms_user"));
                    scon.add(rs.getString("way2sms_pass"));
                    scon.add(rs.getString("160by2_user"));
                    scon.add(rs.getString("160by2_pass"));
                }
            }


        } catch (Exception ex) {
            String ss = "Class : DBData  Method  : getShopNameException:" + ex.getMessage();
            log.debug(ss);
        }
        return scon;
    }

    @Override
    public String getQueryValue(String que) {
        String value = "";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(que);
            while (rs.next()) {
                value = rs.getString(1);
            }
        } catch (Exception ex) {
            String ss = "Class : DBData  Method  : getQueryValue():StringException:" + ex.getMessage();
            log.debug(ss);
        }
        return value;
    }

    @Override
    public int getQueryWitCol(String query, String col) {
        int qty = 0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                if (rs.getString(col) != null) {
                    qty = rs.getInt(col);
                }
            }
        } catch (Exception ex) {
            String ss = "Class : DBData  Method  : getQueryWitCol:" + ex.getMessage() + " Query :" + query;
            log.debug(ss);
        }

        return qty;
    }

    @Override
    public int selectCountQuryExe(String query) {
        int save = 0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                save = rs.getInt("count(*)");
            }
        } catch (Exception ex) {
            String ss = "Class : DBData  Method  : selectCountQuryExe Exception:" + ex.getMessage();
            log.debug(ss);
        }
        return save;
    }

    @Override
    public List<String> getChequeDetails(String chqNo) {

        List<String> chequeList = new ArrayList<String>();

        chequeList.add("");
        chequeList.add("");
        chequeList.add("");
        try {
            String sql = "select issued_to,bank_name,Amount from  cheque_transaction where chq_no='" + chqNo + "'";
            ResultSet rs = null;
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                chequeList.set(0, rs.getString("issued_to"));
                chequeList.set(1, rs.getString("bank_name"));
                chequeList.set(2, rs.getString("Amount"));

            }
        } catch (Exception e) {
            String msg = "Class: CommonDAO  Method: getChequeDetails()  = " + e.getMessage();
            log.debug(msg);

        }
        return chequeList;

    }

    @Override
    public List<String> getEmployeeCode(String code) {
        List<String> employers = new ArrayList<String>();

        try {
            ResultSet rs = null;
            if (code.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select * from employee_information where emp_flag_id = '0'");
            } else {
                rs = DBConnection.getStatement().executeQuery("select * from employee_information where emp_code like'" + code + "%' and emp_flag_id = '0'");
            }
            employers.add("---Select---");

            while (rs.next()) {
                employers.add(rs.getString("emp_code"));
            }


        } catch (Exception e) {
            String msg = "Class: CommonDAO  Method: getEmployeeCode()  = " + e.getMessage();
            log.debug(msg);
        }
        return employers;
    }

    @Override
    public String getProductType() {
        String productType = "";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select mode from license_details");
            while (rs.next()) {
                productType = rs.getString("mode");
            }
        } catch (Exception e) {
            log.debug("Class: CommonDAO  method:getProductType Error = " + e.getMessage());
        }
        return productType;
    }

    @Override
    public List<String> getUserName(String type) {
        List<String> userList = new ArrayList<String>();

        String query = "";
        try {

            if (type.equals("")) {
                query = "SELECT user_name FROM user_info where ui_flag_id=0";
            } else {
                query = "SELECT user_name FROM user_info WHERE user_name like'" + type + "%' and ui_flag_id=0";
            }
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                userList.add(rs.getString("user_name"));
            }


        } catch (Exception e) {
            log.debug("Class : UserInformatonDAO Method:getUserName() Error = " + e.getMessage());
        }
        return userList;

    }

    @Override
    public boolean checkUserNameExists(String str) {
        boolean userName = true;
        try {

            String sql = "select user_name from user_info where user_name='" + str + "' and ui_flag_id=0";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                userName = false;
            }

        } catch (Exception e) {
            log.debug("Class : CommonDAO  method:checkUserNameExists Error= " + e.getMessage());

        }
        return userName;
    }

    @Override
    public int selectCount(String dbTable, String name) {
        int count = 0;
        try {
            String sql = "select count(*)  from " + dbTable + " where cust_name='" + name + "' and cust_flag_id = '0'";
            ResultSet rs = DBConnection.getConnection().createStatement().executeQuery(sql);
            while (rs.next()) {
                count = rs.getInt("count(*)");
            }
        } catch (Exception e) {
            count = 0;
            log.debug(e.getMessage());
        }
        return count;
    }

    public List<String> GetProductDetails(String bno, String btype) {
        List<String> s = new ArrayList<String>();
        String tname = null;

        if (btype.equals("Cash_Bill")) {
            tname = "sales_cash_bill";
        } else if (btype.equals("Account")) {
            tname = "sales_accounts";
        } else if (btype.equals("Partial_Paid")) {
            tname = "sales_partitions_bill";
        } else if (btype.equals("Credit_Bill")) {
            tname = "sales_credit_bill";
        } else if (btype.equals("CD_Card_Bill")) {
            tname = "sales_cards_bill";
        }
        try {
            ResultSet rs = null;
            rs = DBConnection.getStatement().executeQuery("select * from " + tname + " where bill_no = '" + bno + "'");
            while (rs.next()) {
                s.add(rs.getString("item_name"));
            }


        } catch (Exception ex) {
            String msg = "Class : GetNameClass  Method  : GetProductDetails()   = " + ex.getMessage();
            log.debug(msg);
        }
        return s;
    }

    @Override
    public List<String> CompliantNumber(String name) {
        List<String> s = new ArrayList<String>();

        try {
            ResultSet rs = null;
            if (name.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select bill_no from compliants_register where cr_flag_id = '0' order by bill_no");
            } else {
                rs = DBConnection.getStatement().executeQuery("select bill_no from compliants_register where   bill_no like'" + name + "%' and cr_flag_id = '0' order by bill_no");
            }
            while (rs.next()) {
                s.add(rs.getString("bill_no"));
            }



        } catch (Exception ex) {
            String msg = "Class : GetNameClass  Method  : ComplaintNumber()   = " + ex.getMessage();
            log.debug(msg);
        }
        return s;
    }

    public List<String> ComplaintRegisterBillNo(String name) {
        List<String> s = new ArrayList<String>();

        try {
            ResultSet rs = null;
            if (name.equals("")) {
                rs = DBConnection.getStatement().executeQuery("SELECT bill_no FROM sales_maintain_bill s where bill_no not in (select bill_no from compliants_register) order by s.bill_no");
            } else {
                rs = DBConnection.getStatement().executeQuery("SELECT bill_no FROM sales_maintain_bill s where bill_no not in (select bill_no from compliants_register) and s.bill_no like'" + name + "%' order by s.bill_no ");
            }
            while (rs.next()) {
                s.add(rs.getString("bill_no"));
            }

        } catch (Exception ex) {
            String msg = "Class : GetNameClass  Method  : SalesMaintainBill()   = " + ex.getMessage();
            log.debug(msg);
        }
        return s;
    }

    @Override
    public List<String> CreditNoteDetails(String name) {
        List<String> customer = new ArrayList<String>();

        try {
            ResultSet rs = null;
            name = name.trim();
            if (name.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select credit_note_no from credit_note where cre_flag_id=0 order by credit_note_no");
            } else {
                rs = DBConnection.getStatement().executeQuery("select credit_note_no from credit_note where  cre_flag_id=0 and credit_note_no like'" + name + "%' order by credit_note_no");
            }
            while (rs.next()) {
                customer.add(rs.getString("credit_note_no"));
            }


        } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method : creditNoteDetails()  = " + ex.getMessage();
            log.debug(msg);
        }

        return customer;
    }

    @Override
    public boolean selectCreditNote(String creditNoteno) {
        boolean isSelect = false;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select credit_note_no from credit_note where  cre_flag_id=0 and credit_note_no = '{txtCNoteNo.rawText}'");
            while (rs.next()) {
                isSelect = true;
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return isSelect;
    }

    @Override
    public double CustTotAmt(String billNo, String custName) {
        double totAmt = 0.0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select total_amount from sales_maintain_bill where bill_no = '" + billNo + "' and cust_name = '" + custName + "'");
            while (rs.next()) {
                totAmt = rs.getDouble("total_amount");
            }

        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return totAmt;

    }

    @Override
    public double DistTotAmt(String invoiceNo, String distName) {
        double totAmt = 0.0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select total_amount from purchase_invoice  where invoice_no = '" + invoiceNo + "' and dist_name = '" + distName + "'");
            while (rs.next()) {
                totAmt = rs.getDouble("total_amount");
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return totAmt;

    }

    public List<String> getchequeNumbers(String type) {
        List<String> chequeList = new ArrayList<String>();

        try {
            chequeList.add("-- Select --");
            String sql = "select chq_no from cheque_transaction where chq_flag_id=0 and paid_flag_id=0 and particulars='" + type + "'";
            ResultSet rs = null;
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                chequeList.add(rs.getString("chq_no"));
            }

        } catch (Exception e) {
            String ss = "Class : CommonDAO  Method  : getchequeNumbers:" + e.getMessage();
            log.debug(ss);
        }
        return chequeList;
    }

    public double getCreditAmout(String name, String type) {
        double amount = 0.00;
        try {
            ResultSet rs = null;
            String sql = "";
            sql = "SELECT sum(amount)as amt FROM credit_note where issued_against='" + type.trim() + "' and name='" + name.trim() + "'  and cre_flag_id=0";

            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                amount = rs.getDouble("amt");
            }
        } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method : getCreditAmout()  = " + ex.getMessage();
            log.debug(msg);
        }
        return amount;
    }

    public double getDebitAmout(String name, String type) {
        double amount = 0.00;
        name = name.trim();
        type = type.trim();
        try {
            ResultSet rs = null;
            String sql = "";
            sql = "SELECT sum(amount)as amt FROM debit_note where issued_against='" + type + "' and name='" + name + "'  and dn_flag_id=0";

            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                amount = rs.getDouble("amt");
            }
        } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method : getDebitAmout()  = " + ex.getMessage();
            log.debug(msg);
        }
        return amount;
    }

    @Override
    public String checkSMSConf() {
        String ret = "Done";
        String que = "SELECT way2sms_user,way2sms_pass,160by2_user,160by2_pass,defaultsms_gw FROM settings_config";
        int cnt = 5;
        String[] getV = new String[cnt];
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(que);
            while (rs.next()) {
                for (int i = 0; i < cnt; i++) {
                    getV[i] = rs.getString(i + 1);
                }
                if (getV[4].trim().equals("0") && (getV[0].trim().length() == 0 || getV[1].trim().length() == 0)) {
                    ret = "Please, provide way2sms Username & Password";
                } else if (getV[4].trim().equals("1") && (getV[2].trim().length() == 0 || getV[3].trim().length() == 0)) {
                    ret = "Please, provide 160by2 Username & Password";
                }
            }
        } catch (Exception ex) {
            String ss = "Class : DBData  Method  : getShopNameException:" + ex.getMessage();
            log.debug(ss);
        }
        return ret;
    }

    @Override
    public boolean selectCustomer(String name) {
        boolean isSelect = false;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select cust_name from cust_information where cust_name='" + name + "' and cust_flag_id = '0'");
            while (rs.next()) {
                isSelect = true;
            }
        } catch (Exception e) {
            isSelect = false;
            String ss = "Class : CommonDAO  Method  : selectCustomer:" + e.getMessage();
            log.debug(ss);
        }
        return isSelect;
    }

    @Override
    public String getShopDetails() {
        String sname = "";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("SELECT concat(shop_name,',',city,', ',contact_no1)as shop FROM shop_information");
            while (rs.next()) {
                if (rs.getString("shop") != null) {
                    sname = rs.getString("shop");
                }
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDAO  Method  : getShopNameException:" + ex.getMessage();
            log.debug(ss);
        }
        return sname;
    }

    @Override
    public List<String> CustomerName(String name) {
        List<String> customers = new ArrayList<String>();

        try {
            ResultSet rs = null;
            if (name.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select * from cust_information where cust_flag_id = '0'");
            } else {
                rs = DBConnection.getStatement().executeQuery("select * from cust_information where cust_name like'" + name + "%' and cust_flag_id = '0'");
            }
            while (rs.next()) {
                customers.add(rs.getString("cust_name"));
            }


        } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method  : CustomerName()   = " + ex.getMessage();
            log.debug(msg);
        }
        return customers;
    }

    @Override
    public String getCustId(String dbtable, String columnName, String frontChar) {
        NumberFormat nf = new DecimalFormat("0000000");
        int id = 0;
        String code = frontChar + nf.format(id);
        String sql = "select * from " + dbtable + " ";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            if (rs.wasNull()) {
                code = frontChar + nf.format(id += 1);
            } else {
                while (rs.next()) {
                    code = rs.getString(columnName);
                }
                id = Integer.parseInt(code.substring(frontChar.length()));
                id += 1;
                code = frontChar + nf.format(id);
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }

        return code;
    }

    @Override
    public boolean selectRecord(String distributorName) {
        boolean isSelect = false;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select * from dist_information where dist_name='" + distributorName + "' and dist_flag_id = '0'");
            while (rs.next()) {
                isSelect = true;
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
            isSelect = false;
        }
        return isSelect;
    }

    @Override
    public String getName(String code) {
        String custCode = null;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select cust_name from cust_information where cust_code='" + code + "'");
            while (rs.next()) {
                custCode = rs.getString("cust_name");
            }
        } catch (Exception ex) {
            String ss = "Class : GetPRAdjust   Method  : getName     Exception :" + ex.getMessage() + " For Code: " + code;
            log.debug(ss);
        }
        return custCode;
    }

    @Override
    public String getCode(String name) {
        String custName = null;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select cust_code from cust_information where cust_name='" + name + "'");
            while (rs.next()) {
                custName = rs.getString("cust_code");
            }
        } catch (Exception ex) {
            String ss = "Class : GetPRAdjust   Method  : getCode     Exception :" + ex.getMessage() + " For Patient: " + name;
            log.debug(ss);
        }
        return custName;
    }

    @Override
    public String getMobileNo(String code, String name) {
        String custCode = code;
        String custName = name;
        String mobileNo = "";

        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select mobile_no,email_id from cust_information where cust_name='" + custName + "' and cust_code='" + custCode + "'");
            while (rs.next()) {
                mobileNo = rs.getString("mobile_no");
            }
        } catch (Exception ex) {
            String ss = "Class : GetPRAdjust   Method  : getDetails     Exception :" + ex.getMessage() + " For Name :" + name + " and Code: " + code;
            log.debug(ss);
        }
        return mobileNo;
    }

    @Override
    public String getEmailId(String code, String name) {
        String custCode = code;
        String custName = name;
        String emailId = "";

        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select mobile_no,email_id from cust_information where cust_name='" + custName + "' and cust_code='" + custCode + "'");
            while (rs.next()) {
                emailId = rs.getString("email_id");
            }
        } catch (Exception ex) {
            String ss = "Class : GetPRAdjust   Method  : getDetails     Exception :" + ex.getMessage() + " For Name :" + name + " and Code: " + code;
            log.debug(ss);
        }
        return emailId;
    }

    @Override
    public String checkEmailConf() {
        String ret = "Done";
        int cnt = 4;
        String[] getV = new String[cnt];
        try {
            String que = "SELECT email_username,email_password,alt_email_username, alt_email_password FROM settings_config";
            ResultSet rs = DBConnection.getStatement().executeQuery(que);
            while (rs.next()) {
                for (int i = 0; i < cnt; i++) {
                    getV[i] = rs.getString(i + 1);
                }
            }
//        String[] getV = DBData.getQueryValue(que, 4);
            if ((getV[0].trim().length() == 0 || getV[1].trim().length() == 0)) {
                ret = "Please, provide Email ID & Password";
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return ret;
    }

    @Override
    public int selectCount(String dbTable, String columnname, String name) {
        int count = 0;
        try {
            String sql = "select count(*)  from " + dbTable + " where " + columnname + "='" + name + "' and cust_flag_id = '0'";
            ResultSet rs = DBConnection.getConnection().createStatement().executeQuery(sql);
            while (rs.next()) {
                count = rs.getInt("count(*)");
            }
        } catch (Exception e) {
            count = 0;
            log.debug(e.getMessage());
        }
        return count;
    }

    @Override
    public boolean selectPatientName(String name) {
       boolean isSelect=false;
        try {
            String sql = "select * from med_patient_details_mt where cust_name='" + name + "' and is_active = '1'";
            ResultSet rs = DBConnection.getConnection().createStatement().executeQuery(sql);
            while (rs.next()) {
                isSelect=true;
            }
        } catch (Exception e) {
            isSelect = false;
            log.debug(e.getMessage());
        }
        return isSelect;
    }

    @Override
    public List<String> getBankNameList() {
        List<String> bankNames = new ArrayList<String>();
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("SELECT distinct(bankName) FROM bankvalue order by bankName asc");
            while (rs.next()) {
                bankNames.add(rs.getString("bankName"));
            }

        } catch (SQLException ex) {
            log.debug(ex.getMessage());
        }
        return bankNames;
    }

    @Override
    public boolean checkExistance(String tablename, String acNo) {
        boolean isExist = false;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select * from " + tablename + " where acc_number ='" + acNo + "' and bd_flag_id = '0'");
            while (rs.next()) {
                isExist = true;
            }
        } catch (SQLException ex) {
            log.debug(ex.getMessage());
        }
        return isExist;
    }

    @Override
    public List<String> getQueryValue(String query, int count) {
        List<String> value = new ArrayList<String>();

        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                for (int i = 0; i < count; i++) {
                    value.add(rs.getString(i + 1));
                }
            }



        } catch (Exception ex) {
            String ss = "Class : CommonDAO  Method  : getQueryValue():String[]   Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return value;
    }

    @Override
    public List<String> getNoteNo(String tableName, String noteNo) {
        List<String> customer = new ArrayList<String>();


        try {
            ResultSet rs = null;
            noteNo = noteNo.trim();
            if (tableName.equals("credit_note")) {
                if (noteNo.equals("")) {
                    rs = DBConnection.getStatement().executeQuery("select credit_note_no from " + tableName + " where cre_flag_id=0 order by credit_note_no");
                } else {
                    rs = DBConnection.getStatement().executeQuery("select credit_note_no from " + tableName + " where  cre_flag_id = 0 and credit_note_no like'" + noteNo + "%' order by credit_note_no");
                }
                while (rs.next()) {
                    customer.add(rs.getString("credit_note_no"));
                }
            } else {
                if (noteNo.equals("")) {
                    rs = DBConnection.getStatement().executeQuery("select debit_note_no from " + tableName + " where dn_flag_id=0 order by debit_note_no");
                } else {
                    rs = DBConnection.getStatement().executeQuery("select debit_note_no from " + tableName + " where  dn_flag_id = 0 and debit_note_no like'" + noteNo + "%' order by debit_note_no");
                }
                while (rs.next()) {
                    customer.add(rs.getString("debit_note_no"));
                }
            }

        } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method : getNoteList()  = " + ex.getMessage();
            log.debug(msg);
        }

        return customer;
    }

    @Override
    public boolean selectDistributor(String distributorName) {
        boolean isSelect = false;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select * from dist_information where dist_name='" + distributorName + "' and dist_flag_id = '0'");
            while (rs.next()) {
                isSelect = true;
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
            isSelect = false;
        }
        return isSelect;
    }


    @Override
    public boolean selectDebitNote(String debitNoteno) {
        boolean isSelect = false;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select debit_note_no from debit_note where debit_note_no = '" + debitNoteno + "' and dn_flag_id = '0'");
            while (rs.next()) {
                isSelect = true;
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return isSelect;
    }

    @Override
    public int getReturnCompare(String value, String itemCode, String itemName, String batch) {
        int qty = 0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select count(*) as compare from sales_return where bill_no='" + value + "' and item_code='" + itemCode + "' and item_name='" + itemName + "' and batch_no='" + batch + "'");
            while (rs.next()) {
                if (rs.getString("compare") != null) {
                    qty = Integer.parseInt(rs.getString("compare"));
                }
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDAO  Method  : getCompare Exception:" + ex.getMessage();
            log.debug(ss);
        }
        return qty;
    }

    @Override
    public int getReturnCompare(String itemCode, String itemName) {
        int qty = 0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("SELECT count(*)as compare FROM stock_statement WHERE item_name = '" + itemName + "' AND item_code = '" + itemCode + "' and qty != 0");
            while (rs.next()) {
                if (rs.getString("compare") != null) {
                    qty = Integer.parseInt(rs.getString("compare"));
                }
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDAO  Method  : getCompare() Exception:" + ex.getMessage();
            log.debug(ss);
        }
        return qty;
    }

    @Override
    public String getAlertType() {
        String ty = "";
        int mon = 0;
        int week = 0;
        try {

            ResultSet rs = DBConnection.getStatement().executeQuery("SELECT * FROM  alert_setting");
            while (rs.next()) {
                mon = rs.getInt("alert_month");

                week = rs.getInt("alert_week");
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDAO  Method  : getAlertTypeException:" + ex.getMessage();
            log.debug(ss);
        }
        if (mon > 0) {
            ty = "month";
        } else if (week > 0) {
            ty = "week";
        } else {
            ty = "day";
        }
        return ty;
    }

    @Override
    public String getAlertInterval() {
        String alertDays = "1";
        try {
            String alertType = "";
            alertType = getAlertType();
            String alertType1 = "";
            if (alertType.equals("month")) {
                alertType1 = "alert_month";
            } else if (alertType.equals("week")) {
                alertType1 = "alert_week";
            } else {
                alertType1 = "alert_days";
            }
            String sql = "";
            sql = (" select " + alertType1 + " as al  from alert_setting");
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                if (rs.getString("al") != null) {
                    alertDays = rs.getString("al");
                }
            }
        } catch (Exception ex) {
            String ss = " Class : commonDAO  Method  : getAlertInterval   Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return alertDays;
    }

    @Override
    public String getExpiryDate(String itemCode, String batchNumber, String alertType, String alertValue) {
        String expiry = "";
        String qry= "select expiry_date from stock_statement where item_code='" + itemCode + "'  and batch_no='" + batchNumber + "' and expiry_date between curdate() and DATE_ADD(curdate(),INTERVAL " + alertValue + "  " + alertType + ")";
        try {

            String sql = "";
            ResultSet rs = DBConnection.getStatement().executeQuery(qry);
            while (rs.next()) {
                if (rs.getString("expiry_date") != null) {
                    expiry = DateUtils.normalFormatDate(rs.getDate("expiry_date"));
                }
            }
        } catch (Exception ex) {
            log.debug("qry:"+qry);
            String ss = "Class : CommonDAO  Method  : getExpiryDate Exception:" + ex.getMessage();
            log.debug(ss);
        }
        return expiry;
    }

    @Override
    public String getDummyExpiryDate() {
        String edate = DateUtils.now("MM-yy");
        String query = "select DATE_FORMAT(now(),'%b-%Y') as da";
        ResultSet rs = null;
        try {
            rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                edate = rs.getString("da");
                String[] arr = edate.split("-");
                String yearIn = String.valueOf(Integer.parseInt(arr[1]) + 2);
                edate = arr[0] + "-" + yearIn;
            }
        } catch (SQLException ex) {
            log.debug("query:"+query);
            String ss = "Class : CommonDAO  Method  : getExpiryDate Exception:" + ex.getMessage();
            log.debug(ss);
        }
        return edate;
    }

    @Override
    public String getProduct(String itemCode) {
        String itemName = null;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select itemname from drugtable where itemcode=" + itemCode + "");
            while (rs.next()) {
                itemName = rs.getString("itemname");
            }
        } catch (Exception ex) {
            log.debug("Class : CommonDAO  Method  : getProduct Exception :" + ex.getMessage());
        }

        return itemName;
    }

    @Override
    public String getDosage(String itemCode, String itemName) {
        String dosage = "";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select dosage from drugtable where itemname = '" + itemName + "' and itemcode = '" + itemCode + "'");
            while (rs.next()) {
                if (rs.getString("dosage") != null) {
                    dosage = rs.getString("dosage");
                }
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDAO  Method  : getDosage Exception:" + ex.getMessage();
            log.debug(ss);
        }
        return dosage;
    }

    @Override
    public String getFormulation(String itemCode, String itemName) {
        String dosage = "";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select formulation from drugtable where itemname = '" + itemName + "' and itemcode = '" + itemCode + "'");
            while (rs.next()) {
                if (rs.getString("formulation") != null) {
                    dosage = rs.getString("formulation");
                }
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDAO  Method  : getDosage Exception:" + ex.getMessage();
            log.debug(ss);
        }
        return dosage;
    }


@Override
    public List<String> getDepartment(String name) {
        List<String> v = new ArrayList<String>();

        try {
            ResultSet rs = null;
            if (name.trim().length() == 0) {
                rs = DBConnection.getStatement().executeQuery("select distinct(department) from med_patient_details_mt order by department");
            } else {
                rs = DBConnection.getStatement().executeQuery("select distinct(department) from med_patient_details_mt where department like '" + name + "%' order by department;");
            }
            while (rs.next()) {
                if(rs.getString("department").length()>0){
                    v.add(rs.getString("department"));
                }
                
            }
       } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method : getDepartment()  = " + ex.getMessage();
            log.debug(msg);
        }
        
        return v;
        
    }
    
    @Override
    public int checkItemBatch(String code1, String batch) {
        int qty = -9081;
        String query1 = "select qty from stock_statement where item_code='" + code1 + "' and batch_no='" + batch + "'";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query1);
            while (rs.next()) {
                qty = rs.getInt("qty");
            }
        } catch (Exception e) {
            String ss = "Class : CommonDAO Method:checkitembatch   Exception:" + e.getMessage();
            log.debug(ss);
        }
        return qty;
    }

    @Override
    public String getCRNo(String srno) {
        String CreditNoteNumber = "";
        ResultSet rs = null;
        try {
            rs = DBConnection.getStatement().executeQuery("SELECT credit_note_no FROM credit_note where invoiceorbill_no='" + srno + "'");
            while (rs.next()) {
                rs.getString(1);
            }
        } catch (Exception e) {
            String ss = "Class : CreditNoteDAO  Method  : getQueryValue():StringException:" + e.getMessage();
            log.debug(ss);
        }

        return CreditNoteNumber;
    }

    @Override
    public void userLog(String formName, String type) {

        try {
            DBConnection.getStatement().executeUpdate("call pro_userlog('" + formName + "','" + type + "')");
        } catch (Exception ex) {
            String ss = "Class : CommonDAO  Method  : userLog Exception:" + ex.getMessage();
            log.debug(ss);
        }
    }

    @Override
    public Boolean isNotAllow(int modName) {
        boolean s = false;
        String[] tSubName = new String[]{"Cash_Bill", "Credit_Bill", "Counter_Bill", "Creditcard_Bill", "PartialPayment_Bill", "Dummy_Bill", "purchase_maintenance"};
        String[] tName = new String[]{"Cash_Bill", "Credit_Bill", "Account", "CD_Card_Bill", "Partial_Paid", "Dummy_Bill", "purchase_maintenance"};
        String que = "SELECT mode FROM license_details;";
        String mode = getQueryValue(que);
        if (mode.equalsIgnoreCase("Trial")) {
            String CntQue = "SELECT trial FROM version_tablelookup where submodule='" + tSubName[modName - 1] + "'";
            String CntQueMod = "";
            if (modName <= 6) {
                CntQueMod = "SELECT count(*) FROM sales_maintain_bill where bill_type='" + tName[modName - 1] + "'";
            } else if (modName == 7) {
                CntQueMod = "SELECT count(*) FROM purchase_maintenance";
            }
            int num = getQueryWitCol(CntQue, mode.toLowerCase());
            int rwCount = 0;
            if (CntQueMod.length() > 0) {
                rwCount = selectCountQuryExe(CntQueMod);
            }
            if (rwCount >= num) {
                s = true;
            }
        }
        return s;
    }

    @Override
    public Integer freeBillCount() {
        Boolean billRestrict = false;
        Integer billCount = -1;
        try {
        String que = "SELECT mode FROM license_details;";
        String mode = getQueryValue(que);        
        if(mode.equalsIgnoreCase("Free")) {
            String que1 = "select count(*) from sales_maintain_bill";            
            billCount = selectCountQuryExe(que1);
//            ResultSet rs = DBConnection.getStatement().executeQuery("SELECT vat_val FROM vat_master where id =1");
//            while (rs.next()) {
//                billCount -= rs.getInt("vat_val");
//            }
        }
        }
        catch(Exception e) {
            log.debug("Class:CommonDAO  method :freeBillRestrict Exception:  " + e.getMessage());
        }        
        return billCount;
    }

    @Override
    public int queryExecution(String q) {
        int save = 0;
        try {
            save = DBConnection.getStatement().executeUpdate(q);
        } catch (Exception ex) {
            String ss = "Class : DBData  Method  : queryExecution Exception:" + ex.getMessage() + "Query :" + q;
            log.debug(ss);
        }
        return save;
    }

    @Override
    public List<String> getYear(String name) {
        List<String> years = new ArrayList<String>();
        try {
            ResultSet rs = null;
            if (name == "") {
                rs = DBConnection.getStatement().executeQuery("select distinct(cyear) from maintain_cost where mc_flag_id = '0' order by cyear ");
            } else {
                rs = DBConnection.getStatement().executeQuery("select distinct(cyear) from maintain_cost where cyear like'" + name + "%' and mc_flag_id = '0' order by cyear");
            }
            while (rs.next()) {
                years.add(rs.getString("cyear"));
            }
        } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method  : getYear()   = " + ex.getMessage();
            log.debug(msg);
        }
        return years;
    }

    @Override
    public int countMaintCost(String cyear, String month) {
        int count = 0;
        try {
            String sql = "select count(*)  from maintain_cost where cmonth ='" + month + "' and cyear = '" + cyear + "' and mc_flag_id = '0'";
            ResultSet rs = DBConnection.getConnection().createStatement().executeQuery(sql);
            while (rs.next()) {
                count = rs.getInt("count(*)");
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return count;
    }

    @Override
    public List<String> getMonthList(String year) {
        List<String> monthList = new ArrayList<String>();
        try {
            String sql = "select distinct(cmonth) from maintain_cost where cyear = '" + year + "' and mc_flag_id = '0'";
            ResultSet rs = DBConnection.getConnection().createStatement().executeQuery(sql);
            while (rs.next()) {
                monthList.add(rs.getString("cmonth"));
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return monthList;
    }

    @Override
    public boolean setChequeFlag(String chqNo, int value) {
        boolean isSet = false;
        try {
            String sql = "update cheque_transaction set paid_flag_id = '" + value + "' where chq_no = '" + chqNo + "'";
            if (DBConnection.getConnection().createStatement().executeUpdate(sql) > 0) {
                isSet = true;
            }
        } catch (Exception e) {
            isSet = false;
            log.debug(e.getMessage());
        }
        return isSet;
    }

    @Override
    public String getTruncateQuery(String que) {
        String value = "";
        try {
            DBConnection.getStatement().executeUpdate(que);

        } catch (Exception ex) {
            String ss = "Class : CommonDAO  Method  : getQueryValue():StringException:" + ex.getMessage();
            log.debug(ss);
        }
        return value;
    }

    @Override
    public HashMap getModules(String str1, String str2, String str3) {
        HashMap moduleMap = new HashMap();
        try {
            String query = "SELECT submodule," + str1 + " FROM version_formlookup where object='" + str2 + "' and module='" + str3 + "'";
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                moduleMap.put(rs.getString("submodule"), rs.getString(str1));
            }
        } catch (Exception e) {
            String ss = "Class : DBData  Method  : getModules():StringException:" + e.getMessage();
            log.debug(ss);
        }

        return moduleMap;
    }

    @Override
    public String ShopName() throws RemoteException {

        String shopName = "";
        try {

            String sql = "select shop_name from shop_information";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                shopName = rs.getString("shop_name");
            }
        } catch (Exception e) {
            log.debug("Class : CommonDAO method : ShopName Error = " + e.getMessage());
        }

        return shopName;
    }
    public ResultSet rsGen;
    public List<String> names = new ArrayList<String>();
    public String sql;

    @Override
    public List<String> getDrugGenerics(String name, String listType) {
        names.clear();
        try {
            if (name.equals("")) {
                if (listType.equals("drug")) {
                    sql = "select distinct(genericname) from drugtable where dru_flag_id!=1";
                } else {
                    sql = "SELECT distinct d.genericname FROM drugtable d,stock_statement s where s.item_code=d.itemcode and s.ban_flag_id!=1";
                }
            } else {
                if (listType.equals("drug")) {
                    sql = "select distinct(genericname) from drugtable where genericname like'" + name + "%' and dru_flag_id!=1";
                } else {
                    sql = "SELECT distinct d.genericname FROM drugtable d,stock_statement s where s.item_code=d.itemcode and d.genericname like'" + name + "%' and s.ban_flag_id!=1";
                }
            }
            rsGen = DBConnection.getStatement().executeQuery(sql);
            if (rsGen != null) {
                while (rsGen.next()) {
                    names.add(rsGen.getString("genericname"));
                }
            } else {
                names.add("No Values");
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : getDrugGenerics()     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return names;
    }

    @Override
    public List<String> getDrugProducts(String name, String listType) throws RemoteException {
        names.clear();
        try {
            if (name.equals("")) {
                if (listType.equals("drug")) {
                    sql = "select distinct itemname from drugtable where dru_flag_id != 1;";
                } else {
                    sql = "SELECT distinct d.itemname FROM drugtable d,stock_statement s where s.item_code=d.itemcode and s.ban_flag_id!=1";
                }
            } else {
                if (listType.equals("drug")) {
                    sql = "select distinct itemname from drugtable where itemname like '" + name + "%' and dru_flag_id != 1;";
                } else {
                    sql = "SELECT distinct d.itemname FROM drugtable d,stock_statement s where s.item_code=d.itemcode and s.item_name like'" + name + "%' and s.ban_flag_id!=1";
                }
            }
            rsGen = DBConnection.getStatement().executeQuery(sql);
            while (rsGen.next()) {
                names.add(rsGen.getString("itemname"));
            }
        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : getDrugProducts()     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return names;
    }

    @Override
    public String getExpiryDrugNames() throws RemoteException {
        String expiryDrugNames = "<-----------------------------------------";

        try {
            int i = 0;
            String typeAler = getAlertType();
            String typeVal = getAlertInterval();
            String sql1 = "select   SUBSTRING_INDEX(concat(item_name,'_',formulation,','),'_',3) as expiry_drugname from stock_statement where  qty>0 and  expiry_date between curdate() and DATE_ADD(curdate(),INTERVAL " + typeVal + "  " + typeAler + ")";

            ResultSet rs = DBConnection.getStatement().executeQuery(sql1);
            while (rs.next()) {
                if (i == 0) {
                    expiryDrugNames = expiryDrugNames.concat(" Expiry Drug Names :  ");
                }
                expiryDrugNames = expiryDrugNames.concat(rs.getString("expiry_drugname") + "  ");

                i++;
            }

            if (i > 0) {
                expiryDrugNames = expiryDrugNames.concat(" --------------    ");
                i = 10;
            }
            sql1 = "select   SUBSTRING_INDEX(concat(item_name,'_',formulation,','),'_',3) as minstock_drugname from stock_statement where   qty>0  and qty<=min_qty";
            rs = DBConnection.getStatement().executeQuery(sql1);
            while (rs.next()) {
                if (i == 10) {
                    expiryDrugNames = expiryDrugNames.concat(" Minimum Stock Drug Names :  ");
                }
                expiryDrugNames = expiryDrugNames.concat(rs.getString("minstock_drugname"));
                i++;
            }

            if (i <= 0) {
                expiryDrugNames = "";
            } else {
                expiryDrugNames=expiryDrugNames.replaceAll("__", "_");
                expiryDrugNames = expiryDrugNames.concat("   ----------------------------------------->");
            }

        } catch (Exception e) {
            log.debug("Class:CommonDAO  method :getExpiryDrugNames Exception:  " + e.getMessage());
        }
        return expiryDrugNames;
    }
    
        @Override
    public List<String> getVatValues() {
        ResultSet rs = null;
        List<String> vatList = new ArrayList<String>();
        try {
        rs = DBConnection.getStatement().executeQuery("select * from vat_master");
        vatList.add("---Select---");
        while(rs.next()) {
            vatList.add(rs.getString("vat_val"));
        }
        }
        catch(Exception e) {
            log.debug("Class:CommonDAO  method :getVatValues Exception:  " + e.getMessage());
        }
        return vatList;
    }

    @Override
    public boolean employeeCodeExists(String empcode, String empname,String mode) {
        ResultSet rs = null;
        boolean exists = false;
        String empOldcode;
        try {
          if(mode.equals("save")) {
          rs = DBConnection.getStatement().executeQuery("select * from employee_information where emp_code='"+empcode+"'");
          while(rs.next()){
              exists = true;
          }
          }
          else if(mode.equals("update")) {
          rs = DBConnection.getStatement().executeQuery("select * from employee_information where emp_name!='"+empname+"'");
          while(rs.next()) {
              empOldcode=rs.getString("emp_code");
              if(empcode.equalsIgnoreCase(empOldcode)) {
                  exists = true;
                  break;
              }
          }
          }
        }
        catch(Exception e) {
            log.debug("Class:CommonDAO  method :employeeCodeExists Exception:  " + e.getMessage());
        }
        return exists;
    }

        @Override
        public List<Double> getSalesPurchase() {
        List<Double> salespurList = new ArrayList<Double>();
        try {
                String sql1="call pro_getsalespurchase()";
                ResultSet rs = DBConnection.getStatement().executeQuery(sql1);
                while(rs.next()) {
                salespurList.add(rs.getDouble("monthcashsales"));
                salespurList.add(rs.getDouble("monthcreditsales"));
                salespurList.add(rs.getDouble("monthcardsales"));
                salespurList.add(rs.getDouble("monthtotalsales"));
                salespurList.add(rs.getDouble("todaycashsales"));
                salespurList.add(rs.getDouble("todaycreditsales"));
                salespurList.add(rs.getDouble("todaycardsales"));
                salespurList.add(rs.getDouble("todaytotalsales"));
                salespurList.add(rs.getDouble("monthpurchase"));
                salespurList.add(rs.getDouble("todaypurchase"));
                }
            }
                catch(Exception e) {
                    log.debug("Class:CommonDAO  method :getSalesPurchase Exception:  " + e.getMessage());
                }
        return salespurList;
    }

    @Override
    public List<Integer> getPrescriptionNo(int prescriptionNo) {
        List<Integer> prescNo = new ArrayList<Integer>();
        try {
            ResultSet rs = null;
            rs = DBConnection.getStatement().executeQuery("select * from prescription where id like'" + prescriptionNo + "%'");
            while (rs.next()) {
                prescNo.add(rs.getInt("id"));
            }
        } catch (Exception ex) {
            String msg = "Class : CommonDAO  Method  : getPrescriptionNo()   = " + ex.getMessage();
            log.debug(msg);
        }
        return prescNo;
    }

    @Override
    public List<String> getPrescriptionNo1(String presno) throws RemoteException {
         List<String> prescNo = new ArrayList<String>();

        try {
            System.out.println("Prescriptionno "+presno);
            ResultSet rs = null;
            if (presno.equals("")) {
               //  System.out.println("customerName6  ifffff");
                rs = DBConnection.getStatement().executeQuery("select id from prescription_maintenance");
            } else {
                rs = DBConnection.getStatement().executeQuery("select id from prescription_maintenance where id like'" + presno + "%'");
            }
            
                //rs = DBConnection.getStatement().executeQuery("select id from prescription_maintenance where id like'" + presno + "%'");
            
            int i = 0;
            while (rs.next()) {
                prescNo.add(rs.getString("id"));
                i++;
            }

        } catch (Exception ex) {
            String ss = "Class : CommonDAO   Method  : presno     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return prescNo;
    }

    @Override
    public String getfprice(String itemCode, String batchNumber) throws RemoteException {
         String qty = "0";
        String query = "select qty from stock_statement where  item_code='" + itemCode + "' and batch_no='" + batchNumber + "'";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                if (rs.getString("qty") != null && !rs.getString("qty").equals("")) {
                    qty = rs.getString("qty").toString();
                }
            }
        } catch (Exception ex) {
            log.debug("query:"+query);
            String ss = "Class : StockDAO  Method  : getStockQty Exception:" + ex.getMessage();
            log.debug(ss);
        }
        return qty;
    }


    
}

