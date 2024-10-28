/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.dao;

import java.sql.PreparedStatement;
import com.vanuston.medeil.implementation.Customer;
import com.vanuston.medeil.model.CustomerModel;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;
import java.rmi.RemoteException;
import java.sql.ResultSet;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
/**
 *
 * @author San
 */

public class CustomerDAO implements Customer {

    static Logger log = Logger.getLogger(CustomerDAO.class, "com.vanuston.medeil.dao.CustomerDAO");
    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    @Override
    public Object viewRecord(Object name) {
        CustomerModel customerModel = new CustomerModel();
        try {
            String sql = "select * from cust_information where cust_name = '" + name + "'";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                customerModel.setCustomerCode(rs.getString("cust_code"));
                 customerModel.setCusttypeid(rs.getString("cust_type_id"));
                customerModel.setFamilyName(rs.getString("family_name"));
                customerModel.setAge(rs.getString("age"));
                customerModel.setGender(rs.getString("gender"));
                customerModel.setAddress1(rs.getString("cust_address1"));
                customerModel.setAddress2(rs.getString("cust_address2"));
                customerModel.setAddress3(rs.getString("cust_address3"));
                customerModel.setCity(rs.getString("cust_city"));
                customerModel.setCountry(rs.getString("cust_country"));
                customerModel.setState(rs.getString("cust_state"));
                customerModel.setPincode(rs.getString("cust_pincode"));
                customerModel.setPhoneNumber(rs.getString("phone_no"));
                customerModel.setMobileNumber(rs.getString("mobile_no"));
                customerModel.setEmailid(rs.getString("email_id"));
                customerModel.setAlertType(rs.getString("alert_type"));
                customerModel.setCreditLimit(rs.getDouble("credit_limit"));
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return customerModel;
    }

    @Override
    public boolean deleteRecord(Object customerName) {
        boolean isDelete = false;
        
        try {
            int rs = DBConnection.getStatement().executeUpdate("update cust_information set cust_flag_id = 1 where cust_name = '" + customerName + "'");
            if (rs > 0) {
                isDelete = true;
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return isDelete;
    }

    @Override
    public Object createRecord(Object customerModels) {
        boolean iscreate = false;
        CustomerModel customerModel = (CustomerModel) customerModels;
        try {
            String sql = "CALL pro_customerinfo_dao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            java.sql.CallableStatement cs = DBConnection.getConnection().prepareCall(sql);
            cs.setString("custcode", customerModel.getCustomerCode());
            cs.setString("custTypeId", customerModel.getCusttypeid());
            cs.setString("familyname", customerModel.getFamilyName());
            cs.setString("custname", customerModel.getCustomerName());
            cs.setString("custage", customerModel.getAge());
            cs.setString("custgender", customerModel.getGender());
            cs.setString("custaddress1", customerModel.getAddress1());
            cs.setString("custaddress2", customerModel.getAddress2());
            cs.setString("custaddress3", customerModel.getAddress3());
            cs.setString("custcity", customerModel.getCity());
            cs.setString("custstate", customerModel.getState());
            cs.setString("custcountry", customerModel.getCountry());
            cs.setString("custpincode", customerModel.getPincode());
            cs.setString("phoneno", customerModel.getPhoneNumber());
            cs.setString("mobileno", customerModel.getMobileNumber());
            cs.setString("emailid", customerModel.getEmailid());
            cs.setString("alerttype", customerModel.getAlertType());
            cs.setDouble("creditlimit", customerModel.getCreditLimit());
            cs.setInt("sentflagid", customerModel.getSMSFlag());
            cs.setString("functionality", "save");
            cs.registerOutParameter("status_flag", Types.INTEGER);
            cs.executeUpdate();
            if (cs.getInt("status_flag") == 1) {
                iscreate = true;
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
       
        return iscreate;
    }

    @Override
    public Object updateRecord(Object customerModels) {
        boolean isUpdate = false;
        CustomerModel customerModel = (CustomerModel) customerModels;
        try {
            String sql = "CALL pro_customerinfo_dao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            java.sql.CallableStatement cs = DBConnection.getConnection().prepareCall(sql);
            cs.setString("custcode", customerModel.getCustomerCode());
            cs.setString("custTypeId", customerModel.getCusttypeid());
            cs.setString("familyname", customerModel.getFamilyName());
            cs.setString("custname", customerModel.getCustomerName());
            cs.setString("custage", customerModel.getAge());
            cs.setString("custgender", customerModel.getGender());
            cs.setString("custaddress1", customerModel.getAddress1());
            cs.setString("custaddress2", customerModel.getAddress2());
            cs.setString("custaddress3", customerModel.getAddress3());
            cs.setString("custcity", customerModel.getCity());
            cs.setString("custstate", customerModel.getState());
            cs.setString("custcountry", customerModel.getCountry());
            cs.setString("custpincode", customerModel.getPincode());
            cs.setString("phoneno", customerModel.getPhoneNumber());
            cs.setString("mobileno", customerModel.getMobileNumber());
            cs.setString("emailid", customerModel.getEmailid());
            cs.setString("alerttype", customerModel.getAlertType());
            cs.setDouble("creditlimit", customerModel.getCreditLimit());
            cs.setInt("sentflagid", customerModel.getSMSFlag());
            cs.setString("functionality", "update");
            cs.registerOutParameter("status_flag", Types.INTEGER);
            cs.executeUpdate();
            if (cs.getInt("status_flag") == 2) {
                isUpdate = true;
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return isUpdate;
    }

    @Override
    public CustomerModel viewAllRecord(Object customerBeans) throws RemoteException {
        
        ArrayList<CustomerModel> customerListBean = new ArrayList();
        CustomerModel customerBean = (CustomerModel) customerBeans;
        CustomerModel CustomerAddBean; //=new VatRegisterModel();
        try {
            if (customerBean.getChkValue().equals("getCustDiscountInfo")) {

                CustomerAddBean = new CustomerModel();
                customerBean = (CustomerModel) customerBeans;
                ResultSet rs = null;

                rs = DBConnection.getStatement().executeQuery("SELECT customer_type,customer_percentage FROM customer_type_mt where id = '" + customerBean.getCusttypeid() + "'");

                while (rs.next()) {
                    CustomerAddBean.setCustomerType(rs.getString("customer_type"));
                    CustomerAddBean.setCustomerPercentage(rs.getDouble("customer_percentage"));
                    customerListBean.add(CustomerAddBean);
                }
                customerBean.setCustomerinfoList(customerListBean);

            } else if (customerBean.getChkValue().equals("getCustDiscount")) {

                CustomerAddBean = new CustomerModel();
                customerBean = (CustomerModel) customerBeans;
                ResultSet rs = null;
                rs = DBConnection.getStatement().executeQuery("SELECT id,customer_percentage FROM customer_type_mt where customer_type = '" + customerBean.getCusttypeid() + "'");

                while (rs.next()) {
                    CustomerAddBean.setCustomerType(rs.getString("id"));
                    CustomerAddBean.setCustomerPercentage(rs.getDouble("customer_percentage"));
                    customerListBean.add(CustomerAddBean);
                }
                customerBean.setCustomerinfoList(customerListBean);

            } else if (customerBean.getChkValue().equals("getCustDiscType")) {

                CustomerAddBean = new CustomerModel();
                customerBean = (CustomerModel) customerBeans;
                ResultSet rs = null;
                rs = DBConnection.getStatement().executeQuery("SELECT * FROM customer_type_mt ");
                while (rs.next()) {
                    CustomerAddBean = new CustomerModel();
                    CustomerAddBean.setCustomerType(rs.getString("customer_type"));
                    customerListBean.add(CustomerAddBean);
                }
                customerBean.setCustomerinfoList(customerListBean);
            }
        } catch (Exception e) {
            String msg = "Class : CustomerDAO  Method : viewAllRecord()   =" + e.getMessage() + "";
            log.debug(msg);
        }
        return customerBean;
    }

    @Override
    public boolean deletePatientDetailsRecord(Object patientName) {
        boolean isDelete = false;
        try {
            int rs = DBConnection.getStatement().executeUpdate("update med_patient_details_mt set is_active = 0 where cust_name = '" + patientName + "'");
            DBConnection.getStatement().executeUpdate("update med_patient_allergies_mt set is_active = 0 where cust_name = '" + patientName + "'");
            DBConnection.getStatement().executeUpdate("update med_patient_health_conditions_mt set is_active = 0 where cust_name='" + patientName + "'");
            if (rs > 0) {
                isDelete = true;
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return isDelete;
    }

    @Override
    public Object createPatientDetailsRecord(Object customerModels) {
        boolean iscreate = false;
        CustomerModel customerModel = (CustomerModel) customerModels;
        try {
                String sql = "select cust_code,cust_name from cust_information where cust_name = '"+customerModel.getPatientName()+"' or mobile_no = '"+customerModel.getPatientName()+"' and cust_flag_id = 0";
                ResultSet rs = DBConnection.getStatement().executeQuery(sql);
                while(rs.next()) {
                customerModel.setCustomerCode(rs.getString("cust_code"));
                customerModel.setPatientName(rs.getString("cust_name"));
            }
            String sql1 = "CALL pro_patient_details_dao(?,?,?,?,?,?,?,?,?,?,?)";
            java.sql.CallableStatement cs = DBConnection.getConnection().prepareCall(sql1);
            cs.setString("custCode", customerModel.getCustomerCode());
            cs.setString("custDate",customerModel.getDate());
            cs.setString("custName", customerModel.getPatientName());
            cs.setString("doctorName", customerModel.getDoctorName());
            cs.setString("Department", customerModel.getDepartment());
            cs.setString("wardNumber", customerModel.getWardNumber());
            cs.setString("roomNumber",customerModel.getRoomNumber());
            cs.setString("custType",customerModel.getCustType());
            cs.setString("createdBy",customerModel.getCurrentUser());
            cs.setString("functionality","save");
            cs.registerOutParameter("status_flag", Types.INTEGER);
            cs.executeUpdate();
            if (cs.getInt("status_flag") == 1) {
                iscreate = true;
            }
            if(customerModel.getAllergiesList().size()>0)
            {
                String sql2 = "insert into med_patient_allergies_mt(cust_code,cust_name,patient_allergies,created_by,created_on) values(?,?,?,?,?)";
                PreparedStatement ps = DBConnection.getConnection().prepareStatement(sql2);
                for(int j=0;j<customerModel.getAllergiesList().size();j++)
                {
                ps.setString(1,customerModel.getCustomerCode());
                ps.setString(2,customerModel.getPatientName());
                ps.setString(3,customerModel.getAllergiesList().get(j));
                ps.setString(4,customerModel.getCurrentUser());
                ps.setString(5,sdf.format(new Date()));
                ps.executeUpdate();
                }
            }
            if(customerModel.getHealthConditionsList().size()>0)
            {
                String sql3 = "insert into med_patient_health_conditions_mt(cust_code,cust_name,patient_health_conditions,created_by,created_on) values(?,?,?,?,?)";
                PreparedStatement ps = DBConnection.getConnection().prepareStatement(sql3);
                for(int j=0;j<customerModel.getHealthConditionsList().size();j++)
                {
                ps.setString(1,customerModel.getCustomerCode());
                ps.setString(2,customerModel.getPatientName());
                ps.setString(3,customerModel.getHealthConditionsList().get(j));
                ps.setString(4,customerModel.getCurrentUser());
                ps.setString(5,sdf.format(new Date()));
                ps.executeUpdate();
                }
            }
      } catch (Exception e) {
            String msg = "Class : CustomerDAO  Method : createPatientDetailsRecord()   =" + e.getMessage() + "";
            log.debug(msg);
        }
        return iscreate;
    }

    @Override
    public Object updatePatientDetailsRecord(Object customerModels) {
        boolean isUpdate = false;
        CustomerModel customerModel = (CustomerModel) customerModels;
        try {
            String sql = "select cust_code,cust_name from cust_information where cust_name = '"+customerModel.getPatientName()+"' or mobile_no = '"+customerModel.getPatientName()+"' and cust_flag_id = 0";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while(rs.next()) {
                customerModel.setCustomerCode(rs.getString("cust_code"));
                customerModel.setPatientName(rs.getString("cust_name"));
            }
            String sql1 = "delete from med_patient_allergies_mt where cust_code='"+customerModel.getCustomerCode()+"' and cust_name='"+customerModel.getPatientName()+"'";
            String sql2 = "delete from med_patient_health_conditions_mt where cust_code='"+customerModel.getCustomerCode()+"' and cust_name='"+customerModel.getPatientName()+"'";
            DBConnection.getStatement().executeUpdate(sql1);
            DBConnection.getStatement().executeUpdate(sql2);
            String sql3 = "CALL pro_patient_details_dao(?,?,?,?,?,?,?,?,?,?,?)";
            java.sql.CallableStatement cs = DBConnection.getConnection().prepareCall(sql3);
            cs.setString("custCode", customerModel.getCustomerCode());
            cs.setString("custDate",customerModel.getDate());
            cs.setString("custName", customerModel.getPatientName());
            cs.setString("doctorName", customerModel.getDoctorName());
            cs.setString("Department", customerModel.getDepartment());
            cs.setString("wardNumber", customerModel.getWardNumber());
            cs.setString("roomNumber",customerModel.getRoomNumber());
            cs.setString("custType",customerModel.getCustType());
            cs.setString("createdBy",customerModel.getCurrentUser());
            cs.setString("functionality","update");
            cs.registerOutParameter("status_flag", Types.INTEGER);
            cs.executeUpdate();
            if (cs.getInt("status_flag") == 2) {
                isUpdate = true;
            }
            if(customerModel.getAllergiesList().size()>0)
            {
                String sql4 = "insert into med_patient_allergies_mt(cust_code,cust_name,patient_allergies,updated_by,updated_on) values(?,?,?,?,?)";
                PreparedStatement ps = DBConnection.getConnection().prepareStatement(sql4);
                for(int j=0;j<customerModel.getAllergiesList().size();j++)
                {
                   ps.setString(1,customerModel.getCustomerCode());
                   ps.setString(2,customerModel.getPatientName());
                   ps.setString(3,customerModel.getAllergiesList().get(j));
                   ps.setString(4,customerModel.getCurrentUser());
                   ps.setString(5,sdf.format(new Date()));
                   ps.executeUpdate();
                }
            }
            if(customerModel.getHealthConditionsList().size()>0)
            {
                String sql5 = "insert into med_patient_health_conditions_mt(cust_code,cust_name,patient_health_conditions,updated_by,updated_on) values(?,?,?,?,?)";
                PreparedStatement ps = DBConnection.getConnection().prepareStatement(sql5);
                for(int j=0;j<customerModel.getHealthConditionsList().size();j++)
                {
                ps.setString(1,customerModel.getCustomerCode());
                ps.setString(2,customerModel.getPatientName());
                ps.setString(3,customerModel.getHealthConditionsList().get(j));
                ps.setString(4,customerModel.getCurrentUser());
                ps.setString(5,sdf.format(new Date()));
                ps.executeUpdate();
                }
            }
        } catch (Exception e) {
            String msg = "Class : CustomerDAO  Method : updatePatientDetailsRecord()   =" + e.getMessage() + "";
            log.debug(msg);
        }
        
        return isUpdate;
   }

    @Override
    public List<String> getAllergies() {
        List<String> list = null ;
        try{
            ResultSet rs = DBConnection.getStatement().executeQuery("select allergies from med_allergies_list_mt where is_active=1");
            if(rs!=null){
                list=new ArrayList<String>();
                while(rs.next()) {
                    list.add(rs.getString("allergies"));
                }
            }
        }catch(Exception e){
            log.debug(" Class:CustomerDAO Method:getAllergies Exception:" + e.getMessage());
        }
        return list;
    }

    @Override
    public int addAllergie(String allergie) {
        int a=0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select * from med_allergies_list_mt where allergies='"+allergie+"'");
            while (rs.next()) {
                a = 1;
            }
            if (a == 1) {
                a = 1;
            }
            else{
                String query = "insert into med_allergies_list_mt(allergies) values(?)";
                PreparedStatement ps=DBConnection.getConnection().prepareStatement(query);
                ps.setString(1, allergie);
                ps.executeUpdate();
                a=0;
            }
        } catch (Exception ex) {
            log.debug(" Class:CustomerDAO Method:addAllergie Exception:" + ex.getMessage());
        }
        return a;
    }

    @Override
    public List<String> getHealthConditions() {
        List<String> list = null ;
        try{
            ResultSet rs = DBConnection.getStatement().executeQuery("select health_conditions from med_health_conditions_list_mt where is_active=1");
            if(rs!=null){
                list=new ArrayList<String>();
                while(rs.next()) {
                    list.add(rs.getString("health_conditions"));
                }
            }
        }catch(Exception e){
            log.debug(" Class:CustomerDAO Method:getHealthConditions Exception:" + e.getMessage());
        }
        return list;
    }

    @Override
    public int addHealthCondition(String healthCondition) {
        int a=0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select * from med_health_conditions_list_mt where health_conditions='"+healthCondition+"'");
            while (rs.next()) {
                a = 1;
            }
            if (a == 1) {
                a = 1;
            }
            else{
                String query = "insert into med_health_conditions_list_mt(health_conditions) values(?)";
                PreparedStatement ps=DBConnection.getConnection().prepareStatement(query);
                ps.setString(1, healthCondition);
                ps.executeUpdate();
                a=0;
            }
        } catch (Exception ex) {
            log.debug(" Class:CustomerDAO Method:addHealthCondtion Exception:" + ex.getMessage());
        }
        return a;
    }
}
