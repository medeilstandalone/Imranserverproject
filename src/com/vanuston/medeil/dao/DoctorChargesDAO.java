/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.dao;

import com.vanuston.medeil.implementation.DoctorCharges;
import com.vanuston.medeil.model.DoctorChargesModel;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;

/**
 *
 * @author san
 */
public class DoctorChargesDAO implements DoctorCharges {
    Logger log =Logger.getLogger(DoctorChargesDAO.class,"DoctorChargesDAO");
 @Override
    public Object viewRecord(Object doctorChargesmodels) {
     DoctorChargesModel doctorChargesModel=(DoctorChargesModel) doctorChargesmodels;
     try{
         List<DoctorChargesModel> modelList=new ArrayList<DoctorChargesModel>();
         String sql="";
         if(doctorChargesModel.getChargeId()!=null){             
             sql="select * from doctor_charges where dch_id='"+doctorChargesModel.getChargeId()+"' and cha_flag_id=0 group by dch_id order by charge_date  desc ";
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
         log.debug("Err in viewRecord() in DoctorChargesDAO:"+e.getMessage());         
     }
     return doctorChargesModel;
 }
 @Override
    public Object createRecord(Object doctorChargesModels) {
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
         log.debug("Err in createRecord in DoctorChargesDAO:"+e.getMessage());
         
     }
     return isCreate;

 }
 @Override
    public Object updateRecord(Object doctorChargesModels) {
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
         log.debug("Err in updateRecord in DoctorChargesDAO:"+e.getMessage());
     }
     return isUpdate;

 }
 @Override
    public boolean deleteRecord(Object doctorChargesModels) {
     boolean isDelete=false;
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
        cs.setString("functionality", "delete");
        cs.registerOutParameter("status_flag", Types.INTEGER);
        
        cs.executeUpdate();
        if(cs.getInt("status_flag")==3){
            isDelete=true;
        }
     }catch(Exception e){
         isDelete=false;
         log.debug("Err in deleteRecord in DoctorChargesDAO:"+e.getMessage());
     }
     return isDelete;

 }
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
}
