/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.dao;

import com.vanuston.medeil.implementation.EmployeeSalary;
import com.vanuston.medeil.model.EmployeeSalaryModel;
import java.sql.ResultSet;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;


/**
 *
 * @author San
 */
public class EmployeeSalaryDAO implements EmployeeSalary{
    DBConnection dbConnection;
    Logger log = Logger.getLogger(EmployeeSalaryDAO.class,"EmployeeSalaryDAO");
    @Override
    public Object createRecord(Object employeeSalaryModels) {
        boolean isCreate=false;
        EmployeeSalaryModel employeeSalaryModel=(EmployeeSalaryModel) employeeSalaryModels;
        try{
            dbConnection=new DBConnection();
            String sql="CALL pro_empsalaryinfo_dao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            int i=0;
            java.sql.CallableStatement cs=dbConnection.getConnection().prepareCall(sql);
            cs.setString(++i,employeeSalaryModel.getSalaryId());
            cs.setString(++i,employeeSalaryModel.getEmployeeCode());
            cs.setString(++i,employeeSalaryModel.getEmployeeName());
            cs.setString(++i,employeeSalaryModel.getGender());
            cs.setString(++i,employeeSalaryModel.getAge());
            cs.setString(++i,employeeSalaryModel.getSalaryType());
            cs.setDate(++i,employeeSalaryModel.getDate());
            cs.setString(++i,employeeSalaryModel.getSalaryMonth());
            cs.setString(++i,employeeSalaryModel.getSalaryYear());
            cs.setDouble(++i,employeeSalaryModel.getPaidAmount());
            cs.setString(++i,employeeSalaryModel.getPaidDetails());
            cs.setDouble(++i,employeeSalaryModel.getAdvancePaid());
            cs.setDouble(++i,employeeSalaryModel.getBalanceAmount());
            cs.setDouble(++i,employeeSalaryModel.getFixedSalary());
            cs.setString(++i,"save");
            cs.registerOutParameter(++i, Types.INTEGER);
            
            int statusFlag=0;
            cs.executeUpdate();
            statusFlag=cs.getInt("status_flag");
            if(statusFlag==1){
                isCreate=true;
            }

        }catch(Exception e){
            isCreate=false;
            log.debug("Err in createRecord in employeeSalaryDAO:"+e.getMessage());
            
        }
        return isCreate;
    }
     @Override
    public Object updateRecord(Object employeeSalaryModels) {
         SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd");
        boolean isUpdate=false;
        EmployeeSalaryModel employeeSalaryModel=(EmployeeSalaryModel) employeeSalaryModels;
        try{
            dbConnection=new DBConnection();
            String sql="CALL pro_empsalaryinfo_dao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            int i=0;
            java.sql.CallableStatement cs=dbConnection.getConnection().prepareCall(sql);
            cs.setString(++i,employeeSalaryModel.getSalaryId());
            cs.setString(++i,employeeSalaryModel.getEmployeeCode());
            cs.setString(++i,employeeSalaryModel.getEmployeeName());
            cs.setString(++i,employeeSalaryModel.getGender());
            cs.setString(++i,employeeSalaryModel.getAge());
            cs.setString(++i,employeeSalaryModel.getSalaryType());
            cs.setDate(++i, employeeSalaryModel.getDate());
            cs.setString(++i,employeeSalaryModel.getSalaryMonth());
            cs.setString(++i,employeeSalaryModel.getSalaryYear());
            cs.setDouble(++i,employeeSalaryModel.getPaidAmount());
            cs.setString(++i,employeeSalaryModel.getPaidDetails());
            cs.setDouble(++i,employeeSalaryModel.getAdvancePaid());
            cs.setDouble(++i,employeeSalaryModel.getBalanceAmount());
            cs.setDouble(++i,employeeSalaryModel.getFixedSalary());
            cs.setString(++i,"update");
            cs.registerOutParameter(++i, Types.INTEGER);
            
            int statusFlag=0;
            cs.executeUpdate();
            statusFlag=cs.getInt("status_flag");
            if(statusFlag==2){
                isUpdate=true;
            }

        }catch(Exception e){
            isUpdate=false;
            log.debug("Err in updateRecord in employeeSalaryDAO:"+e.getMessage());
            
        }
        return isUpdate;
    }
    @Override
    public boolean deleteRecord (Object employeeSalaryCode) {
        boolean isDelete = false ;
       try{
           int rs = DBConnection.getStatement().executeUpdate("UPDATE emp_salary_info set esal_flag_id=1 where sal_id = '"+employeeSalaryCode+"'") ;
           if ( rs > 0 )
            isDelete = true;
        } catch (Exception e){
            isDelete = false;
            log.debug ("Err in createDelete in employeeSalaryDAO:"+e.getMessage()) ;
            
        }
        return isDelete;
    }

    

   
    @Override
    public Object viewRecord(Object employeeSalaryModels) {
        DBConnection dbConnection;
        EmployeeSalaryModel employeeSalaryModel=(EmployeeSalaryModel) employeeSalaryModels;
        try{
            String sql="";
            ResultSet rs=null;
            dbConnection=new DBConnection();
            if(employeeSalaryModel.getSalaryId()!=null && employeeSalaryModel.getSalaryId()!=""){
                sql="select * from emp_salary_info where sal_id='"+employeeSalaryModel.getSalaryId()+"' and esal_flag_id=0";
                rs=dbConnection.getStatement().executeQuery(sql);
                while (rs.next()) {
                    employeeSalaryModel.setEmployeeName(rs.getString("emp_name"));
                    employeeSalaryModel.setDate(rs.getDate("sal_date"));
                    employeeSalaryModel.setEmployeeCode(rs.getString("emp_code"));
                    employeeSalaryModel.setGender(rs.getString("gender"));
                    employeeSalaryModel.setAge(rs.getString("age"));
                    employeeSalaryModel.setPaidAmount(rs.getDouble("paid_amt"));
                    employeeSalaryModel.setFixedSalary(rs.getDouble("fixed_sal"));
                    employeeSalaryModel.setPaidDetails(rs.getString("paid_details"));
                    employeeSalaryModel.setSalaryMonth(rs.getString("sal_month"));
                    employeeSalaryModel.setSalaryYear(rs.getString("sal_year"));
                    employeeSalaryModel.setAdvancePaid(rs.getDouble("advance_paid"));
                    employeeSalaryModel.setSalaryType(rs.getString("salary_type"));                    
                }
            }
            else if(employeeSalaryModel.getSalaryMonth()!=null && employeeSalaryModel.getSalaryMonth()!=""){
                sql="select sum(paid_amt) as pamt,salary_type from emp_salary_info where emp_name = '"+employeeSalaryModel.getEmployeeName()+"' and sal_month='"+employeeSalaryModel.getSalaryMonth()+"' and sal_year='"+employeeSalaryModel.getSalaryYear()+"' and esal_flag_id=0";
                rs=dbConnection.getStatement().executeQuery(sql);
                while (rs.next()) {
                    employeeSalaryModel.setPaidAmount(rs.getDouble("pamt"));
                    employeeSalaryModel.setSalaryType(rs.getString("salary_type"));                    
                }
            } else{
                log.debug("sql:"+sql);
            }
       }catch(Exception e){
            log.debug("Err in viewRecord in EmployeeSalaryDAO:"+e.getMessage());
            
        }
      return employeeSalaryModel;
    }

    @Override
    public Object viewAllRecord() {
        EmployeeSalaryModel employeeSalaryModel=new EmployeeSalaryModel();
        String sql = "SELECT sal_id,emp_code,emp_name,sal_date,salary_type,paid_amt,concat(sal_month,'-',sal_year)as sa FROM emp_salary_info where esal_flag_id=0 order by sal_id  desc ";
        try{
            List<EmployeeSalaryModel> employees=new ArrayList<EmployeeSalaryModel>();
            ResultSet rs=DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                employeeSalaryModel=new EmployeeSalaryModel();

                employeeSalaryModel.setSalaryId(rs.getString("sal_id"));
                employeeSalaryModel.setEmployeeCode(rs.getString("emp_code"));
                employeeSalaryModel.setEmployeeName(rs.getString("emp_name"));
                employeeSalaryModel.setDate(rs.getDate("sal_date"));
                employeeSalaryModel.setSalaryMonth(rs.getString("sa"));
                employeeSalaryModel.setSalaryYear(rs.getString("sa"));
                employeeSalaryModel.setPaidAmount(rs.getDouble("paid_amt"));
                employeeSalaryModel.setSalaryType(rs.getString("salary_type"));
                employees.add(employeeSalaryModel);
            }
            employeeSalaryModel.setEmployees(employees);


        }catch(Exception e){
            log.debug("Err in employeeSalaryDAO in viewall"+e.getMessage());
        }
        return employeeSalaryModel;
    }
}
