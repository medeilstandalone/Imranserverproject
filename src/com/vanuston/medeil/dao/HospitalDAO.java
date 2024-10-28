/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.dao;

import com.vanuston.medeil.implementation.Hospital;
import com.vanuston.medeil.model.HospitalModel;
import java.sql.ResultSet;
import java.sql.Types;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;

/**
 *
 * @author Administrator
 */
public class HospitalDAO implements Hospital {
    Logger log = Logger.getLogger(HospitalDAO.class,"HospitalDAO");
    @Override
    public Object createRecord(Object hospitalModels) {
        boolean isCreate = false;
        HospitalModel hospitalModel=(HospitalModel)hospitalModels;        
        try {            
            int i=0;
            String sql="CALL pro_hospitalinfo_dao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            java.sql.CallableStatement cs=DBConnection.getConnection().prepareCall(sql);
            cs.setString(++i,hospitalModel.getHospitalCode());
            cs.setString(++i,hospitalModel.getHospitalName());
            cs.setString(++i,hospitalModel.getSpecialty());
            cs.setString(++i,hospitalModel.getGroup());
            cs.setString(++i,hospitalModel.getEstablishedYear());
            cs.setString(++i,hospitalModel.getHeadquarters());
            cs.setString(++i,hospitalModel.getAddress1());
            cs.setString(++i,hospitalModel.getAddress2());
            cs.setString(++i,hospitalModel.getAddress3());
            cs.setString(++i,hospitalModel.getCity());
            cs.setString(++i,hospitalModel.getState());
            cs.setString(++i,hospitalModel.getCountry());
            cs.setString(++i,hospitalModel.getPincode());
            cs.setString(++i,hospitalModel.getWebsite());
            cs.setString(++i,hospitalModel.getOfficialMailid());
            cs.setString(++i,hospitalModel.getPhoneNumber());
            cs.setString(++i,hospitalModel.getFaxNumber());
            cs.setString(++i,hospitalModel.getAmbulanceNumber());
            cs.setString(++i,hospitalModel.getHelpline());
            cs.setString(++i,hospitalModel.getHospitalOwnerName());
            cs.setString(++i,hospitalModel.getContactPersonName());
            cs.setString(++i,hospitalModel.getContactPersonDesignation());
            cs.setString(++i,hospitalModel.getContactPersonMobileNumber());
            cs.setString(++i,hospitalModel.getContactPersonEmailid());
            cs.setString(++i,hospitalModel.getPincode());
            cs.setString(++i,"save");
            cs.registerOutParameter(++i, Types.INTEGER);
            
            cs.executeUpdate();
            int sf=cs.getInt("status_flag");
            if(sf==1) {
                isCreate = true;
            }
        }
        catch(Exception e) {
            isCreate=false;
            log.debug("Err in HospitalDAO method createRecord() :"+e.getMessage());            
        }
        return isCreate;
    }

    @Override
    public Object viewRecord(Object hospitalName) {
        String hospName=(String)hospitalName;
        HospitalModel hospitalModel=new HospitalModel();
        try {
            int i;
            String sql="select * from hospital_information where hospital_Name = '"+hospName+"' and hos_flag_id=0";
            ResultSet rs=DBConnection.getConnection().createStatement().executeQuery(sql);
            while(rs.next()){
                i=1;
                hospitalModel.setHospitalCode(rs.getString(++i));
                hospitalModel.setHospitalName(rs.getString(++i));
                hospitalModel.setSpecialty(rs.getString(++i));
		hospitalModel.setGroup(rs.getString(++i));
		hospitalModel.setEstablishedYear(rs.getString(++i));
		hospitalModel.setHeadquarters(rs.getString(++i));
		hospitalModel.setAddress1(rs.getString(++i));
		hospitalModel.setAddress2(rs.getString(++i));
		hospitalModel.setAddress3(rs.getString(++i));
		hospitalModel.setCity(rs.getString(++i));
                hospitalModel.setState(rs.getString(++i));
		hospitalModel.setCountry(rs.getString(++i));
		hospitalModel.setPincode(rs.getString(++i));
                hospitalModel.setWebsite(rs.getString(++i));
                hospitalModel.setOfficialMailid(rs.getString(++i));
                hospitalModel.setPhoneNumber(rs.getString(++i));
		hospitalModel.setFaxNumber(rs.getString(++i));
		hospitalModel.setAmbulanceNumber(rs.getString(++i));
                hospitalModel.setHelpline(rs.getString(++i));
                hospitalModel.setHospitalOwnerName(rs.getString(++i));
		hospitalModel.setContactPersonName(rs.getString(++i));
                hospitalModel.setContactPersonDesignation(rs.getString(++i));
                hospitalModel.setContactPersonMobileNumber(rs.getString(++i));
                hospitalModel.setContactPersonEmailid(rs.getString(++i));
                hospitalModel.setPincode(rs.getString(++i));
            }

        } catch(Exception e) {
            log.debug("err in dao in viewRecords:"+e);
        }
        return hospitalModel;
    }

    @Override
    public Object updateRecord(Object hospitalModels) {
           boolean isUpdate = false;
        HospitalModel hospitalModel=(HospitalModel)hospitalModels;
        try {        
            int i=0;
            String sql="CALL pro_hospitalinfo_dao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            java.sql.CallableStatement cs=DBConnection.getConnection().prepareCall(sql);
            cs.setString(++i,hospitalModel.getHospitalCode());
            cs.setString(++i,hospitalModel.getHospitalName());
            cs.setString(++i,hospitalModel.getSpecialty());
            cs.setString(++i,hospitalModel.getGroup());
            cs.setString(++i,hospitalModel.getEstablishedYear());
            cs.setString(++i,hospitalModel.getHeadquarters());
            cs.setString(++i,hospitalModel.getAddress1());
            cs.setString(++i,hospitalModel.getAddress2());
            cs.setString(++i,hospitalModel.getAddress3());
            cs.setString(++i,hospitalModel.getCity());
            cs.setString(++i,hospitalModel.getState());
            cs.setString(++i,hospitalModel.getCountry());
            cs.setString(++i,hospitalModel.getPincode());
            cs.setString(++i,hospitalModel.getWebsite());
            cs.setString(++i,hospitalModel.getOfficialMailid());
            cs.setString(++i,hospitalModel.getPhoneNumber());
            cs.setString(++i,hospitalModel.getFaxNumber());
            cs.setString(++i,hospitalModel.getAmbulanceNumber());
            cs.setString(++i,hospitalModel.getHelpline());
            cs.setString(++i,hospitalModel.getHospitalOwnerName());
            cs.setString(++i,hospitalModel.getContactPersonName());
            cs.setString(++i,hospitalModel.getContactPersonDesignation());
            cs.setString(++i,hospitalModel.getContactPersonMobileNumber());
            cs.setString(++i,hospitalModel.getContactPersonEmailid());
            cs.setString(++i,hospitalModel.getPincode());
            cs.setString(++i,"update");
            cs.registerOutParameter(++i, Types.INTEGER);
            
            cs.executeUpdate();
            int sf=cs.getInt("status_flag");
            if(sf==1) {
                isUpdate = true;
            }
        }
        catch(Exception e) {
            isUpdate=false;
            log.debug("Err in HospitalDAO method updateRecord() :"+e.getMessage());
            
        }
        return isUpdate;
    }

    @Override
    public boolean deleteRecord(Object hospitalCode) {
        boolean isDelete = false;
        try {
            int rs = DBConnection.getStatement().executeUpdate("update hospital_information set hos_flag_id=1 where hospital_code = '"+hospitalCode+"'") ;
            if ( rs > 0 )
                isDelete = true;
        }
        catch(Exception e) {
            isDelete=false;
            log.debug("Err in HospitalDAO method deleteRecord() :"+e.getMessage());
            
        }
        return isDelete;
    }
   
}
