/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.dao;

import com.vanuston.medeil.implementation.Doctor;
import com.vanuston.medeil.model.DoctorChargesModel;
import com.vanuston.medeil.model.DoctorModel;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.Value;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class DoctorDAO implements Doctor {
    Logger log =Logger.getLogger(DoctorDAO.class,"DoctorDAO");
     @Override
    public Object viewRecord(Object code) {
        DoctorModel doctorModel=new DoctorModel();
        try{
            String query = "select * from doctors_information where doctor_code = '"+code+"' and doc_flag_id=0 ";
            ResultSet rs = DBConnection.getStatement().executeQuery(query);

            while (rs.next()) {
             doctorModel.setDoctor_id(rs.getString("doctor_id"));
             doctorModel.setDoctorCode(rs.getString("doctor_code"));
             doctorModel.setDoctorName(rs.getString("doctor_name"));
             doctorModel.setHospitalName(rs.getString("hospital_name"));
             doctorModel.setRegistrationId(rs.getString("registration_id"));
             doctorModel.setAddress1(rs.getString("doc_address1"));
             doctorModel.setAddress2(rs.getString("doc_address2"));
             doctorModel.setAddress3(rs.getString("doc_address3"));
             doctorModel.setCity(rs.getString("doc_city"));
             doctorModel.setCountry(rs.getString("doc_country"));
             doctorModel.setState(rs.getString("doc_state"));
             doctorModel.setPincode(rs.getString("doc_pincode"));
             doctorModel.setSpecialty(rs.getString("specialist"));
             doctorModel.setMobileNumber(rs.getString("mobile_no"));
             doctorModel.setPhoneNumber(rs.getString("phone_no"));
             doctorModel.setEmailid(rs.getString("email_id"));
             doctorModel.setWebsite(rs.getString("website"));
            }
        }catch(Exception e){
            log.debug("Err in viewRecord in DoctorDAO:"+e.getMessage());
            
        }

        return doctorModel;
    }

    @Override
    public boolean deleteRecord(Object doctorCode) {
         boolean isDelete=false;        
        try{
            int rs = DBConnection.getStatement().executeUpdate("UPDATE doctors_information set doc_flag_id=1 where doctor_code = '"+doctorCode+"'") ;
            if ( rs > 0 )
                isDelete = true;
        }catch(Exception e){
            log.debug("Err in deleteRecord of DoctorDAO:"+e.getMessage());            
        }
        return isDelete;
    }

    @Override
    public Object createRecord(Object doctorsModels) {
        boolean isCreate=false;
        DoctorModel doctorModel=(DoctorModel) doctorsModels;
        try{
            int i=0;
            String sql="CALL pro_doctorsinfo_dao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            java.sql.CallableStatement cs=DBConnection.getConnection().prepareCall(sql);
            cs.setString(++i,doctorModel.getDoctor_id());
            cs.setString(++i,doctorModel.getDoctorCode());
            cs.setString(++i,doctorModel.getDoctorName());
            cs.setString(++i,doctorModel.getRegistrationId());
            cs.setString(++i,doctorModel.getAddress1());
            cs.setString(++i,doctorModel.getAddress2());
            cs.setString(++i,doctorModel.getAddress3());
            cs.setString(++i,doctorModel.getCity());
            cs.setString(++i,doctorModel.getState());
            cs.setString(++i,doctorModel.getCountry());
            cs.setString(++i,doctorModel.getPincode());
            cs.setString(++i,doctorModel.getHospitalName());
            cs.setString(++i,doctorModel.getSpecialty());
            cs.setString(++i,doctorModel.getMobileNumber());
            cs.setString(++i,doctorModel.getPhoneNumber());
            cs.setString(++i,doctorModel.getEmailid());
            cs.setString(++i,doctorModel.getWebsite());
            cs.setString(++i,"save");
            cs.registerOutParameter(++i, Types.INTEGER);
            
            cs.executeUpdate();
            int sf=cs.getInt("status_flag");
            if(sf==1) {
                isCreate = true;
            }
        }catch(Exception e){
            log.debug("Err in createRecord of DoctorDAO:"+e.getMessage());
            
        }

        return isCreate;
    }

    @Override
    public Object updateRecord(Object doctorModels) {
         boolean isUpdate=false;
        DoctorModel doctorModel=(DoctorModel) doctorModels;
        try{
            int i=0;
            String sql="CALL pro_doctorsinfo_dao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            java.sql.CallableStatement cs=DBConnection.getConnection().prepareCall(sql);
            cs.setString(++i,doctorModel.getDoctor_id());
            cs.setString(++i,doctorModel.getDoctorCode());
            cs.setString(++i,doctorModel.getDoctorName());
            cs.setString(++i,doctorModel.getRegistrationId());
            cs.setString(++i,doctorModel.getAddress1());
            cs.setString(++i,doctorModel.getAddress2());
            cs.setString(++i,doctorModel.getAddress3());
            cs.setString(++i,doctorModel.getCity());
            cs.setString(++i,doctorModel.getState());
            cs.setString(++i,doctorModel.getCountry());
            cs.setString(++i,doctorModel.getPincode());
            cs.setString(++i,doctorModel.getHospitalName());
            cs.setString(++i,doctorModel.getSpecialty());
            cs.setString(++i,doctorModel.getMobileNumber());
            cs.setString(++i,doctorModel.getPhoneNumber());
            cs.setString(++i,doctorModel.getEmailid());
            cs.setString(++i,doctorModel.getWebsite());
            cs.setString(++i,"update");
            cs.registerOutParameter(++i, Types.INTEGER);

            cs.executeUpdate();
            int sf=cs.getInt("status_flag");
            if(sf==2) {
                isUpdate = true;
            }
        }catch(Exception e){
            log.debug("Err in updateRecord of DoctorDAO:"+e.getMessage());
            
        }

        return isUpdate;
    }
    @Override
    public Object viewDoctorCharges(Object doctorChargesmodels) {
     DoctorChargesModel doctorChargesModel=(DoctorChargesModel) doctorChargesmodels;
     try{
         List<DoctorChargesModel> modelList=new ArrayList<DoctorChargesModel>();
         String sql="";
         if(doctorChargesModel.getChargeId()!=null){
             sql="select * from doctor_charges where dch_id='"+doctorChargesModel.getChargeId()+"' and cha_flag_id=0   order by charge_date  desc ";
         }else if(doctorChargesModel.getDoctorCommisionName()!=null){
             sql = "SELECT  distinct(DCH_ID), Doctor_code,doctor_name,start_date,end_date,total_amount,charge_date,item_code,item_name,unit_price,qty,Amount,doc_margin,charge_amt FROM doctor_charges where doctor_name='" + doctorChargesModel.getDoctorCommisionName()+"' and cha_flag_id=0 group by dch_id order by charge_date ";
         }else {
             sql = "SELECT  distinct(DCH_ID), Doctor_code,doctor_name,start_date,end_date,total_amount,charge_date,item_code,item_name,unit_price,qty,Amount,doc_margin,charge_amt FROM doctor_charges where cha_flag_id=0 group by dch_id order by charge_date  desc ";
         }
         ResultSet rs=DBConnection.getStatement().executeQuery(sql);
         while (rs.next()) {
                doctorChargesModel = new DoctorChargesModel();
                doctorChargesModel.setChargeId(rs.getString("dch_id"));
                doctorChargesModel.setDoctorCommisionName(rs.getString("doctor_name"));
                doctorChargesModel.setDoctorcommisionCode(rs.getString("doctor_code"));
                doctorChargesModel.setCommisionStartDate(rs.getDate("start_date"));
                doctorChargesModel.setCommisionEndDate(rs.getDate("end_date"));
                doctorChargesModel.setTotalAmount(rs.getDouble("total_amount"));
                doctorChargesModel.setItemCode(rs.getString("item_code"));
                doctorChargesModel.setItemName(rs.getString("item_name"));
                doctorChargesModel.setSellingPrice(rs.getDouble("unit_price"));
                doctorChargesModel.setQuantity(rs.getInt("qty"));
                doctorChargesModel.setAmount(rs.getDouble("Amount"));
                doctorChargesModel.setDoctorMargin(rs.getDouble("doc_margin"));
                doctorChargesModel.setChargeAmount(rs.getDouble("charge_amt"));
                doctorChargesModel.setChargeDate(rs.getDate("charge_date"));
                modelList.add(doctorChargesModel);
            }
         doctorChargesModel.setChargesModelList(modelList);
     }catch(Exception e){
         log.debug("Err in viewDoctorCharges() in DoctorChargesDAO:"+e.getMessage());
         
     }
     return doctorChargesModel;
 }
    @Override
 public Object createDoctorCharges(Object doctorChargesModels) {
     boolean isCreate=false;
     DoctorChargesModel doctorChargesModel=(DoctorChargesModel) doctorChargesModels;
     try{
        String sql="CALL pro_doccharges_dao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
        java.sql.CallableStatement cs=DBConnection.getConnection().prepareCall(sql);
        cs.setString("doctorcode",doctorChargesModel.getDoctorcommisionCode());
        cs.setString("doctorname",doctorChargesModel.getDoctorCommisionName());
        cs.setDate("startdate",doctorChargesModel.getCommisionStartDate());
        cs.setDate("enddate",doctorChargesModel.getCommisionEndDate());
        cs.setString("itemcode",doctorChargesModel.getItemCode());
        cs.setString("itemname",doctorChargesModel.getItemName());
        cs.setInt("docqty",doctorChargesModel.getQuantity());
        cs.setDouble("unitprice",doctorChargesModel.getSellingPrice());
        cs.setDouble("docamount",doctorChargesModel.getAmount());
        cs.setDouble("docmargin",doctorChargesModel.getDoctorMargin());
        cs.setDouble("chargeamt",doctorChargesModel.getChargeAmount());
        cs.setDouble("totalamount",doctorChargesModel.getTotalAmount());
        cs.setString("dchid",doctorChargesModel.getChargeId());
        ResultSet rs=DBConnection.getStatement().executeQuery("select now()");
        rs.first();
        cs.setDate("chargedate",rs.getDate("now()"));
        cs.setString("functionality", "save");
        cs.registerOutParameter("status_flag", Types.INTEGER);
        
        cs.executeUpdate();
        if(cs.getInt("status_flag")==1){
            isCreate=true;
        }
     }catch(Exception e){
         isCreate=false;
         log.debug("Err in createDoctorCharges in DoctorChargesDAO:"+e.getMessage());
         
     }
     return isCreate;

 }
    @Override
 public Object updateDoctorCharges(Object doctorChargesModels) {
     boolean isUpdate=false;
     DoctorChargesModel doctorChargesModel=(DoctorChargesModel) doctorChargesModels;
     try{
        String sql="CALL pro_doccharges_dao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?) ";
        java.sql.CallableStatement cs=DBConnection.getConnection().prepareCall(sql);
        cs.setString("doctorcode",doctorChargesModel.getDoctorcommisionCode());
        cs.setString("doctorname",doctorChargesModel.getDoctorCommisionName());
        cs.setDate("startdate",doctorChargesModel.getCommisionStartDate());
        cs.setDate("enddate",doctorChargesModel.getCommisionEndDate());
        cs.setString("itemcode",doctorChargesModel.getItemCode());
        cs.setString("itemname",doctorChargesModel.getItemName());
        cs.setInt("docqty",doctorChargesModel.getQuantity());
        cs.setDouble("unitprice",doctorChargesModel.getSellingPrice());
        cs.setDouble("docamount",doctorChargesModel.getAmount());
        cs.setDouble("docmargin",doctorChargesModel.getDoctorMargin());
        cs.setDouble("chargeamt",doctorChargesModel.getChargeAmount());
        cs.setDouble("totalamount",doctorChargesModel.getTotalAmount());
        cs.setString("dchid",doctorChargesModel.getChargeId());
        ResultSet rs=DBConnection.getStatement().executeQuery("select now()");
        rs.first();
        cs.setDate("chargedate",rs.getDate("now()"));
        cs.setString("functionality", "update");
        cs.registerOutParameter("status_flag", Types.INTEGER);

        cs.executeUpdate();
        if(cs.getInt("status_flag")==2){
            isUpdate=true;
        }
     }catch(Exception e){
         isUpdate=false;
         log.debug("Err in updateDoctorCharges in DoctorChargesDAO:"+e.getMessage());
         
     }
     return isUpdate;

 }
    @Override
 public boolean deleteDoctorCharges(Object doctorChargesCode) {
     boolean isDelete=false;
     try{
         int rs = DBConnection.getStatement().executeUpdate("update  doctor_charges set cha_flag_id=1 where dch_id= '"+doctorChargesCode+"'") ;
         isDelete=true;
     }catch(Exception e){
         isDelete=false;
         log.debug("Err in deleteDoctorCharges in DoctorChargesDAO:"+e.getMessage());
         
     }
     return isDelete;

 }
    @Override
 public boolean deleteCharge(String dchId){
     boolean isDelete=false;
     try{
         String sql1 = "delete from doctor_charges where dch_id='"+dchId+"'";
         if(DBConnection.getStatement().executeUpdate(sql1)>0){
             isDelete=true;
         }

     }catch(Exception e){
         log.debug("Err in deleteCharge(dchId) from DoctorChargesDAO:"+e.getMessage());
         
     }
     return isDelete;
 }
    @Override
    public int sumQty(String tableName,Object doctorChargesModels) {
        DoctorChargesModel doctorChargesModel = (DoctorChargesModel) doctorChargesModels ;
        Integer qty = 0;
        try {
                String sql = "";
                sql = "select  sum(qty) as qt from "+tableName+" where item_code='" + doctorChargesModel.getItemCode () + "' and doctor_name='" + doctorChargesModel.getDoctorCommisionName() + "' and bill_date>='" + doctorChargesModel.getCommisionStartDate() + "' and bill_date<='" + doctorChargesModel.getCommisionEndDate() + "' ";                

                ResultSet rs = DBConnection.getStatement().executeQuery(sql);
                while (rs.next()) {
                    qty = rs.getInt("qt");
                }

        } catch ( Exception e) {
            log.debug("Err in sumQty() in DoctorDAO : "+e.getMessage() );
        }
        return qty ;
    }
    public double sumPaidAmt(String invoiceNo,double invoiceAmt) {
        double invoiceBal = 0.0 ;
        try {
            String query = "Select sum(paid_amt)as amt from payment  where invoice_no='" + invoiceNo + "'  ";
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                invoiceBal = rs.getDouble("amt");
            }


        } catch (Exception e) {
            log.debug("Err in sumPaidAmt in DoctorDAO : "+e.getMessage()) ;
        }
        return Value.Round(invoiceAmt-invoiceBal,2) ;

    }
    @Override
    public Object viewRecord(DoctorChargesModel doctorChargesModels,String tableName ) {
        DoctorChargesModel doctorChargesModel =new DoctorChargesModel () ;
        List<DoctorChargesModel> listDoctorChargesModel  = new ArrayList<DoctorChargesModel> () ;
        try {
            String query = "";
            if ( doctorChargesModels.getItemName() != null || doctorChargesModels.getItemName() != "" ) {
                query = " SELECT distinct(item_code),item_name,unit_price  FROM "+ tableName +"  where bill_date>='" + doctorChargesModels.getCommisionStartDate() + "' and bill_date<='" + doctorChargesModels.getCommisionEndDate() + "' and doctor_name='" + doctorChargesModels.getDoctorCommisionName() + "' and  item_name like '" + doctorChargesModels.getItemName() + "%';";
            } else {
                query = " SELECT distinct(item_code),item_name,unit_price  FROM "+ tableName +"  where bill_date>='" + doctorChargesModels.getCommisionStartDate() + "' and bill_date<='" + doctorChargesModels.getCommisionEndDate() + "' and doctor_name='" + doctorChargesModels.getDoctorCommisionName() + "'; ";
            }

            ResultSet rs = DBConnection.getStatement().executeQuery (query) ;
            while (rs.next()) {

                doctorChargesModel = new DoctorChargesModel () ;
                doctorChargesModel.setItemCode ( rs.getString ("item_code") ) ;
                doctorChargesModel.setItemName ( rs.getString ("item_name") ) ;
                doctorChargesModel.setSellingPrice ( rs.getDouble ("unit_price") ) ;
                listDoctorChargesModel.add (doctorChargesModel) ;
            }
            doctorChargesModel.setChargesModelList (listDoctorChargesModel) ;

        } catch (Exception e) {
            log.debug("Err in viewRecord(itemName) : "+e.getMessage()) ;
        }
        return doctorChargesModel ;
    }
}
