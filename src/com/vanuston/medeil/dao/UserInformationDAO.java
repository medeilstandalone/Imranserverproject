/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.dao;

import com.vanuston.medeil.implementation.UserInformation;
import com.vanuston.medeil.model.UserInformationModel;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.VersionLookup;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.Types;

/**
 *
 * @author Administrator
 */
public class UserInformationDAO implements UserInformation {

    static Logger log = Logger.getLogger(SettingsDAO.class, "com.vanuston.medeil.dao.UserInformationDAO");

    @Override
    public Object viewRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean deleteRecord(Object object) {
        boolean delete = false;
        UserInformationModel userInfoModel=(UserInformationModel)object;

        try {
            String sql="UPDATE user_info SET ui_flag_id=1,user_name='"+userInfoModel.getUserName().concat("_").concat(userInfoModel.getEmployeeName())+"' where user_name='"+userInfoModel.getUserName()+"'";
            
             DBConnection.getStatement().executeUpdate("UPDATE user_info SET ui_flag_id=1,user_name='"+userInfoModel.getUserName().concat("_").concat(userInfoModel.getEmployeeName())+"' where user_name='"+userInfoModel.getUserName()+"'");
             delete=true;
        } catch (Exception e) {
            log.debug("Class: UserInformationDAO method:DeleteRecors  Error = " + e.getMessage());
             delete=false;
        }
        return delete;
    }

    @Override
    public Object createRecord(Object object) {
        Boolean insert = false;
        int returnFlagCount = 0;
        UserInformationModel UserInformationModel = (UserInformationModel) object;
        try {

//insert into user_info (user_name, password, user_type, emp_name, emp_code, home, sales, inventory, masters, financial, crm, reports)values('{uname}','{pwd}','{utype}','{empName}','{empCode}','{h1},{h2},{h3},{h4},{h5}','{s1},{s2},{s3},{s4},{s5}','{inv1},{inv2},{inv3},{inv4},{inv5},{inv6},{inv7}','{m1},{m2},{m3},{m4},{m5},{m6}','{f1},{f2},{f3},{f4},{f5},{f6},{f7},{f8},{f9},{f10}','{crm1},{crm2},{crm3}','{r1},{r2},{r3},{r4},{r5},{r6},{r7},{r8}')";
            String query = "call pro_saveuserinformation(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            CallableStatement userInformationCall = DBConnection.getConnection().prepareCall(query);
            userInformationCall.setString(1, UserInformationModel.getUserName());
            userInformationCall.setString(2, UserInformationModel.getPassWord());
            userInformationCall.setString(3, UserInformationModel.getUserType());
            userInformationCall.setString(4, UserInformationModel.getEmployeeName());
            userInformationCall.setString(5, UserInformationModel.getEmployeeCode());
            userInformationCall.setString(6, UserInformationModel.getHome());
            userInformationCall.setString(7, UserInformationModel.getSales());
            userInformationCall.setString(8, UserInformationModel.getInventory());
            userInformationCall.setString(9, UserInformationModel.getMasters());
            userInformationCall.setString(10, UserInformationModel.getFinance());
            userInformationCall.setString(11, UserInformationModel.getCRM());
            userInformationCall.setString(12, UserInformationModel.getReports());
            userInformationCall.setString(13, UserInformationModel.getSaveType());
            userInformationCall.registerOutParameter(14, Types.INTEGER);
            userInformationCall.executeUpdate();
            int returnFlag = userInformationCall.getInt("flag");
            if (returnFlag == 1) {
                returnFlagCount++;
            }

            insert = true;

        } catch (Exception e) {
            insert = false;
            log.debug(" Class : UserInformationDAO  Method   : CreateRecord Exception :" + e.getMessage());
        }
        return insert;
    }

    @Override
    public Object updateRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean getFormStatus(int type, String moduleType) {
        boolean status = false;
        try {

            VersionLookup ver = new VersionLookup();
            String[] mod = new String[12];
            if (moduleType.equals("sales")) {
                mod = ver.getSales().split(",");
            } else if (moduleType.equals("inventory")) {
                mod = ver.getInventory().split(",");
            } else if (moduleType.equals("finance")) {
                mod = ver.getFinancial().split(",");
            } else if (moduleType.equals("masters")) {
                mod = ver.getMasters().split(",");
            } else if (moduleType.equals("crm")) {
                mod = ver.getCRM().split(",");
            } else if (moduleType.equals("reports")) {
                mod = ver.getReports().split(",");
            }

            if (mod[type].equals("0")) {
                status = true;
            }
        } catch (Exception e) {
            log.debug("Class : User InformationDAO Method : getFormStatus Error = " + e.getMessage());            
        }
        return status;
    }

    @Override
    public UserInformationModel getUserDetails(String uname) {
        String query = "select * from user_info where user_name='" + uname + "'";
        UserInformationModel userInformationModel = new UserInformationModel();
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                userInformationModel.setEmployeeCode(rs.getString("emp_code"));
                userInformationModel.setEmployeeName(rs.getString("emp_name"));
                userInformationModel.setUserType(rs.getString("user_type"));
                userInformationModel.setPassWord(rs.getString("password"));
                userInformationModel.setHome(rs.getString("home"));
                userInformationModel.setSales(rs.getString("sales"));
                userInformationModel.setInventory(rs.getString("inventory"));
                userInformationModel.setMasters(rs.getString("masters"));
                userInformationModel.setFinance(rs.getString("financial"));
                userInformationModel.setCRM(rs.getString("crm"));
                userInformationModel.setReports(rs.getString("reports"));
            }
        } catch (Exception ex) {
            log.debug("class : UserInformationDAO Method :getUserDetails()     Exception :" + ex.getMessage() + " Query :" + query);

        }
        return userInformationModel;
    }

    @Override
    public UserInformationModel getEmployeeDetails(String name, String type) {
        UserInformationModel userInfoModel = new UserInformationModel();
        userInfoModel.setUserValid(true);
        try {
            String sql = "";
            if (type.endsWith("code")) {
                sql = "select emp_code,emp_name from employee_information where emp_code='" + name + "' and emp_flag_id=0";
            } else {
                sql = "select emp_code,emp_name from employee_information where emp_name='" + name + "' and emp_flag_id=0";
            }
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                userInfoModel.setEmployeeCode(rs.getString("emp_code"));
                userInfoModel.setEmployeeName(rs.getString("emp_name"));
                userInfoModel.setUserValid(getEmployeeValid(rs.getString("emp_code")));
            }
        } catch (Exception e) {
            log.debug("Class : UserInformationDAO Method :getEmployeeDetails() Error = " + e.getMessage());
        }
        return userInfoModel;
    }

    @Override
    public boolean getEmployeeValid(String empcode) {
        boolean valid = true;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select * from user_info where emp_code='" + empcode + "' and ui_flag_id=0");
            while (rs.next()) {
                valid = false;
            }
        } catch (Exception e) {
            log.debug("Class : UserInformationDAO Method :getEmployeeValid() Error = " + e.getMessage());
        }
        return valid;
    }
}
