/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.dao;

import com.vanuston.medeil.implementation.Employee;
import com.vanuston.medeil.model.EmployeeModel;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.sql.Date;
import java.sql.SQLException;
import java.sql.Types;

/**
 *
 * @author San
 */
public class EmployeeDAO implements Employee {
    Logger log = Logger.getLogger(EmployeeDAO.class,"EmployeeDAO");
    SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
    @Override
    public Object viewRecord(Object employeeName) {
        EmployeeModel employeeModel = new EmployeeModel();
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select * from employee_information where emp_name = '"+employeeName+"'");
            int i;
            while (rs.next()) {
                i=1;
                employeeModel.setEmpid(rs.getString(i));
                employeeModel.setEmployeeCode(rs.getString(++i));
                employeeModel.setEmployeeName(rs.getString(++i));
                employeeModel.setDateOfBirth(sdf.format(rs.getDate(++i)).toString());
                employeeModel.setDateOfJoin(sdf.format(rs.getDate(++i)).toString());
                employeeModel.setPhoto(rs.getString(++i));
                employeeModel.setAddress1(rs.getString(++i));
                employeeModel.setAddress2(rs.getString(++i));
                employeeModel.setAddress3(rs.getString(++i));
                employeeModel.setCity(rs.getString(++i));
                employeeModel.setState(rs.getString(++i));
                employeeModel.setCountry(rs.getString(++i));
                employeeModel.setPincode(rs.getString(++i));
                employeeModel.setPhoneNumber(rs.getString(++i));
                employeeModel.setMobileNumber(rs.getString(++i));
                employeeModel.setEmailid(rs.getString(++i));
                employeeModel.setQualification(rs.getString(++i));
                employeeModel.setExperience(rs.getString(++i));
                employeeModel.setAge(rs.getString(++i));
                employeeModel.setGender(rs.getString(++i));
                employeeModel.setBloodGroup(rs.getString(++i));
                employeeModel.setFixedSalary(rs.getDouble(++i));                
            }
        } catch(Exception e) {
            log.debug("Err in vieRecord in EmployeeDAO:"+e.getMessage());
            
        }
        return employeeModel;
    }

    @Override
    public boolean deleteRecord(Object employeeCode) {
        boolean isDelete = false;
        try {
            int rs = DBConnection.getStatement().executeUpdate("UPDATE employee_information set emp_flag_id=1 where emp_code= '"+employeeCode+"'") ;
            if ( rs > 0 )
                isDelete = true;
        } catch(Exception e){
            isDelete=false;
            log.debug("Err in deleteRecord in EmployeeDAO:"+e.getMessage());
            
        }
        return isDelete;
    }

    @Override
    public Object createRecord(Object employeeModels) {
        EmployeeModel employeeModel=(EmployeeModel)employeeModels;
        DBConnection dbConnection;
        Boolean isCreate = false;

        try {
            dbConnection=new DBConnection();
            dbConnection.getConnection();
            int i=0;
            String sql="CALL pro_employeeinfo_dao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            java.sql.CallableStatement cs=dbConnection.getConnection().prepareCall(sql);
            cs.setString(++i,"");
            cs.setString(++i,employeeModel.getEmployeeCode());
            cs.setString(++i,employeeModel.getEmployeeName());
            try{
            cs.setDate(++i,Date.valueOf(employeeModel.getDateOfBirth()));
            cs.setDate(++i,Date.valueOf(employeeModel.getDateOfJoin()));
            } catch (SQLException sqle) {
                isCreate=false;
                cs.close();
                log.debug("Err in Date setting:"+sqle.getMessage());
            }
            cs.setString(++i,employeeModel.getPhoto());
            cs.setString(++i,employeeModel.getAddress1());
            cs.setString(++i,employeeModel.getAddress2());
            cs.setString(++i,employeeModel.getAddress3());
            cs.setString(++i,employeeModel.getCity());
            cs.setString(++i,employeeModel.getState());
            cs.setString(++i,employeeModel.getCountry());
            cs.setString(++i,employeeModel.getPincode());
            cs.setString(++i,employeeModel.getPhoneNumber());
            cs.setString(++i,employeeModel.getMobileNumber());
            cs.setString(++i,employeeModel.getEmailid());
            cs.setString(++i,employeeModel.getQualification());
            cs.setString(++i,employeeModel.getExperience());
            cs.setString(++i,employeeModel.getAge());
            cs.setString(++i,employeeModel.getGender());
            cs.setString(++i,employeeModel.getBloodGroup());
            cs.setDouble(++i,employeeModel.getFixedSalary());
            cs.setString(++i,"save");
            cs.registerOutParameter(++i, Types.INTEGER);
            
            cs.executeUpdate();
            int sf=cs.getInt("status_flag");
            if(sf==1) {
                isCreate = true;
            }
        } catch(Exception e){
            isCreate=false;
            log.debug("Err in createRecord in EmployeeDAO:"+e.getMessage());
            
        }
        return isCreate;
    }

    @Override
    public Object updateRecord(Object employeeModels) {
        EmployeeModel employeeModel=(EmployeeModel)employeeModels;
        DBConnection dbConnection;
        boolean isUpdate = false;

        try {
            dbConnection=new DBConnection();
            dbConnection.getConnection();
            int i=0;
            String sql="CALL pro_employeeinfo_dao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            java.sql.CallableStatement cs=dbConnection.getConnection().prepareCall(sql);
            cs.setString(++i,employeeModel.getEmpid());
            cs.setString(++i,employeeModel.getEmployeeCode());
            cs.setString(++i,employeeModel.getEmployeeName());
            try{
            cs.setDate(++i,Date.valueOf(employeeModel.getDateOfBirth()));
            cs.setDate(++i,Date.valueOf(employeeModel.getDateOfJoin()));
            } catch (SQLException sqle) {
                isUpdate=false;
                cs.close();
                log.debug("Err in Date setting:"+sqle.getMessage());
            }
            cs.setString(++i,employeeModel.getPhoto());
            cs.setString(++i,employeeModel.getAddress1());
            cs.setString(++i,employeeModel.getAddress2());
            cs.setString(++i,employeeModel.getAddress3());
            cs.setString(++i,employeeModel.getCity());
            cs.setString(++i,employeeModel.getState());
            cs.setString(++i,employeeModel.getCountry());
            cs.setString(++i,employeeModel.getPincode());
            cs.setString(++i,employeeModel.getPhoneNumber());
            cs.setString(++i,employeeModel.getMobileNumber());
            cs.setString(++i,employeeModel.getEmailid());
            cs.setString(++i,employeeModel.getQualification());
            cs.setString(++i,employeeModel.getExperience());
            cs.setString(++i,employeeModel.getAge());
            cs.setString(++i,employeeModel.getGender());
            cs.setString(++i,employeeModel.getBloodGroup());
            cs.setDouble(++i,employeeModel.getFixedSalary());
            cs.setString(++i,"update");
            cs.registerOutParameter(++i, Types.INTEGER);
            
            cs.executeUpdate();
            int sf=cs.getInt("status_flag");
            if(sf==2) {
                isUpdate = true;
            }
        } catch(Exception e){
            isUpdate=false;
            log.debug("Err in updateRecord in EmployeeDAO:"+e.getMessage());
            
        }
        return isUpdate;
    }
    
}
