/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.dao;

import com.vanuston.medeil.implementation.ComplaintRegister;
import com.vanuston.medeil.model.ComplaintModel;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;
import java.sql.ResultSet;
import java.sql.Types;

/**
 *
 * @author Administrator
 */
public class ComplaintRegisterDAO implements ComplaintRegister{
static Logger log = Logger.getLogger(PaymentDAO.class, "com.vanuston.medeil.dao.ComplaintRegisterDAO");
    @Override
    public Object viewRecord(Object billNo) {
        ComplaintModel complaintModel = new ComplaintModel();
        try {
            String sql="select * from compliants_register where bill_no = '"+billNo+"'";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                complaintModel.setCustomerName( rs.getString("cust_name") );
                complaintModel.setDoctorName( rs.getString("doctor_name") );
                complaintModel.setBillDate( rs.getDate("bill_date") );
                complaintModel.setCompliantDate( rs.getDate("cdate") );
                complaintModel.setCompliantType( rs.getString("compliant_to") );
                complaintModel.setComplaints( rs.getString("complaints") );
                complaintModel.setItemName( rs.getString("item_name") );
                complaintModel.setManufacturerName( rs.getString("mfr_name") );
                complaintModel.setBatchNumber( rs.getString("batch_no") );
                complaintModel.setEmployeeName( rs.getString("emp_name") );                
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return complaintModel ;
    }
    @Override
    public Object viewRecord(Object billNo,Object tablename) {
        ComplaintModel complaintModel = new ComplaintModel();
        try {
            String sql="select * from "+tablename+" where bill_no = '"+billNo+"'";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                if(tablename.equals("sales_maintain_bill")) {
                    complaintModel.setCustomerName( rs.getString("cust_name") );
                    complaintModel.setDoctorName( rs.getString("doctor_name") );
                    complaintModel.setBillDate( rs.getDate("bill_date") );
                    complaintModel.setCompliantType( rs.getString("bill_type") );
                } else {
                    complaintModel.setManufacturerName( rs.getString("mfr_name") );
                    complaintModel.setBatchNumber( rs.getString("batch_no") );
                }
            }
        } catch (Exception e) {
           log.debug(e.getMessage());
        }
        return complaintModel ;
    }
    @Override
    public boolean deleteRecord(Object billNo) {
        boolean isDelete = false ;
        try {
            int rs = DBConnection.getStatement().executeUpdate("UPDATE compliants_register set cr_flag_id = 1 where bill_no = '"+billNo+"'") ;
            if ( rs > 0 )
                isDelete = true ;
        } catch (Exception e) {

           log.debug(e.getMessage());
        }
        return isDelete ;
    }

    @Override
    public Object createRecord(Object complaintModels) {
        boolean isCreate = false ;
        ComplaintModel complaintModel = (ComplaintModel) complaintModels ;
        try {
            String sql = "CALL pro_complaintsregister_dao(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            java.sql.CallableStatement cs= DBConnection.getConnection().prepareCall(sql);
            cs.setString("billno", complaintModel.getBillNumber());
            cs.setDate ( "billdate", complaintModel.getBillDate() ) ;
            cs.setString ( "custname", complaintModel.getCustomerName() ) ;
            cs.setString ( "doctorname", complaintModel.getDoctorName() ) ;
            cs.setDate ( "crdate", complaintModel.getCompliantDate() ) ;
            cs.setString ( "compliantto", complaintModel.getCompliantType() ) ;
            cs.setString ( "itemname", complaintModel.getItemName() ) ;
            cs.setString ( "mfrname", complaintModel.getManufacturerName() ) ;
            cs.setString ( "batchno", complaintModel.getBatchNumber() ) ;
            cs.setString ( "crcomplaints", complaintModel.getComplaints() ) ;
            cs.setString ( "empname", complaintModel.getEmployeeName() ) ;
            cs.setString ( "functionality", "save") ;
            cs.registerOutParameter("status_flag", Types.INTEGER);

           cs.executeUpdate();
            if(cs.getInt("status_flag") == 1 ){
                isCreate = true ;
            }

        } catch (Exception e) {
           log.debug(e.getMessage());
        }
        return isCreate ;
    }

    @Override
    public Object updateRecord(Object complaintModels) {
        boolean isUpdate = false ;
        ComplaintModel complaintModel = (ComplaintModel) complaintModels ;
        try {
            String sql = "CALL pro_complaintsregister_dao(?,?,?,?,?,?,?,?,?,?,?,?,?)";
            java.sql.CallableStatement cs= DBConnection.getConnection().prepareCall(sql);
            cs.setString("billno", complaintModel.getBillNumber());
            cs.setDate ( "billdate", complaintModel.getBillDate() ) ;
            cs.setString ( "custname", complaintModel.getCustomerName() ) ;
            cs.setString ( "doctorname", complaintModel.getDoctorName() ) ;
            cs.setDate ( "crdate", complaintModel.getCompliantDate() ) ;
            cs.setString ( "compliantto", complaintModel.getCompliantType() ) ;
            cs.setString ( "itemname", complaintModel.getItemName() ) ;
            cs.setString ( "mfrname", complaintModel.getManufacturerName() ) ;
            cs.setString ( "batchno", complaintModel.getBatchNumber() ) ;
            cs.setString ( "crcomplaints", complaintModel.getComplaints() ) ;
            cs.setString ( "empname", complaintModel.getEmployeeName() ) ;
            cs.setString ( "functionality", "update") ;
            cs.registerOutParameter("status_flag", Types.INTEGER);

           cs.executeUpdate();
            if(cs.getInt("status_flag") == 2 ){
                isUpdate = true ;
            }

        } catch (Exception e) {
           log.debug(e.getMessage());
        }
        return isUpdate ;
    }
}
