/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.dao;

import com.vanuston.medeil.implementation.Distributor;
import com.vanuston.medeil.model.DistributorModel;
import java.sql.ResultSet;
import java.sql.Types;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;

/**
 *
 * @author San
 */
public class DistributorDAO implements Distributor {
    Logger log = Logger.getLogger(DistributorDAO.class,"DistributorDAO");
    @Override
    public Object createRecord(Object distributorModel) {
        boolean isCreate = false;
        DistributorModel distributorInfoModel=(DistributorModel)distributorModel;
        DBConnection dbConnection;
        try {
            dbConnection=new DBConnection();
            dbConnection.getConnection();
            String sql="CALL pro_distinfo_dao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            java.sql.CallableStatement cs=dbConnection.getConnection().prepareCall(sql);
            cs.setString(1,distributorInfoModel.getDistributorCode());
            cs.setString(2,distributorInfoModel.getDistributorName());
            cs.setString(3,distributorInfoModel.getOwnerName());
            cs.setString(4,distributorInfoModel.getAuthorizedDistributor());
            cs.setString(5,distributorInfoModel.getTINNumber());
            cs.setString(6,distributorInfoModel.getCSTNumber());
            cs.setString(7,distributorInfoModel.getDLNumber());
            cs.setString(8,distributorInfoModel.getCreditDays());
            cs.setString(9,distributorInfoModel.getAddress1());
            cs.setString(10,distributorInfoModel.getAddress2());
            cs.setString(11,distributorInfoModel.getAddress3());
            cs.setString(12,distributorInfoModel.getCity());
            cs.setString(13,distributorInfoModel.getCountry());
            cs.setString(14,distributorInfoModel.getState());
            cs.setString(15,distributorInfoModel.getPincode());
            cs.setString(16,distributorInfoModel.getContactNumber1());
            cs.setString(17,distributorInfoModel.getContactNumber2());
            cs.setString(18,distributorInfoModel.getFaxNumber());
            cs.setString(19,distributorInfoModel.getMobileNumber());
            cs.setString(20,distributorInfoModel.getEmailid());
            cs.setString(21,distributorInfoModel.getWebsite());
            cs.setString(22,"save");
            cs.registerOutParameter(23, Types.INTEGER);
            
            cs.executeUpdate();
            int sf=cs.getInt("status_flag");
            if(sf==1) {
                isCreate = true;
            }
        }
        catch(Exception e) {
            isCreate=false;
            log.debug("Err in DAO method createRecord() :"+e.getMessage());
        }
        return isCreate;
    }
    

    @Override
    public Object updateRecord(Object distributorModel) {
        boolean isUpdate = false;
        DBConnection dbConnection;
        int statusFlag=0;
        DistributorModel distributorInfoModel=(DistributorModel)distributorModel;
        try {
            dbConnection=new DBConnection();
            String sql="CALL pro_distinfo_dao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            java.sql.CallableStatement cs=dbConnection.getConnection().prepareCall(sql);
            cs.setString(1,distributorInfoModel.getDistributorCode());
            cs.setString(2,distributorInfoModel.getDistributorName());
            cs.setString(3,distributorInfoModel.getOwnerName());
            cs.setString(4,distributorInfoModel.getAuthorizedDistributor());
            cs.setString(5,distributorInfoModel.getTINNumber());
            cs.setString(6,distributorInfoModel.getCSTNumber());
            cs.setString(7,distributorInfoModel.getDLNumber());
            cs.setString(8,distributorInfoModel.getCreditDays());
            cs.setString(9,distributorInfoModel.getAddress1());
            cs.setString(10,distributorInfoModel.getAddress2());
            cs.setString(11,distributorInfoModel.getAddress3());
            cs.setString(12,distributorInfoModel.getCity());
            cs.setString(13,distributorInfoModel.getCountry());
            cs.setString(14,distributorInfoModel.getState());
            cs.setString(15,distributorInfoModel.getPincode());
            cs.setString(16,distributorInfoModel.getContactNumber1());
            cs.setString(17,distributorInfoModel.getContactNumber2());
            cs.setString(18,distributorInfoModel.getFaxNumber());
            cs.setString(19,distributorInfoModel.getMobileNumber());
            cs.setString(20,distributorInfoModel.getEmailid());
            cs.setString(21,distributorInfoModel.getWebsite());
            cs.setString(22,"update");
            cs.registerOutParameter(23, Types.INTEGER);
            cs.executeUpdate();
            statusFlag=cs.getInt("status_flag");
            if(statusFlag==2)
                isUpdate = true;
        }
        catch(Exception e) {
            isUpdate=false;
            log.debug("Err in DAO method updateRecord() :"+e.getMessage());
        }
        return isUpdate;
    }

    @Override
    public boolean deleteRecord(Object distCode) {
        boolean isDelete = false;        
        try {
            int rs = DBConnection.getStatement().executeUpdate("UPDATE dist_information set dist_flag_id=1 where dist_code= '"+distCode+"'") ;
            if( rs > 0 )
                isDelete = true;        }
        catch(Exception e) {
            isDelete=false;
            log.debug("Err in DAO method deleteRecord() :"+e.getMessage());            
        }
        return isDelete;
        
    }

    @Override
    public Object  viewRecord(Object distributorName) {
        DistributorModel distributorModel=new DistributorModel();
        try {
            int i;
            String sql="select * from dist_information where dist_name = '"+distributorName+"'";
            ResultSet rs=DBConnection.getConnection().createStatement().executeQuery(sql);
            while(rs.next()){
                i=1;
                distributorModel.setDistributorCode(rs.getString(++i));
                distributorModel.setDistributorName(rs.getString(++i));
                distributorModel.setOwnerName(rs.getString(++i));
                distributorModel.setAuthorizedDistributor(rs.getString(++i));
                distributorModel.setTINNumber(rs.getString(++i));
                distributorModel.setCSTNumber(rs.getString(++i));
                distributorModel.setDLNumber(rs.getString(++i));
                distributorModel.setCreditDays(rs.getString(++i));
                distributorModel.setAddress1(rs.getString(++i));
                distributorModel.setAddress2(rs.getString(++i));
                distributorModel.setAddress3(rs.getString(++i));
                distributorModel.setCity(rs.getString(++i));
                distributorModel.setCountry(rs.getString(++i));
                distributorModel.setState(rs.getString(++i));
                distributorModel.setPincode(rs.getString(++i));
                distributorModel.setContactNumber1(rs.getString(++i));
                distributorModel.setContactNumber2(rs.getString(++i));
                distributorModel.setFaxNumber(rs.getString(++i));
                distributorModel.setMobileNumber(rs.getString(++i));
                distributorModel.setEmailid(rs.getString(++i));
                distributorModel.setWebsite(rs.getString(++i));

            }

        } catch(Exception e) {
            log.debug("err in dao in viewRecords:"+e.getMessage());
        }
        return distributorModel;
    }

    public boolean selectRecord(String distributorName) {
        boolean isSelect = false;
        try {
            ResultSet rs=DBConnection.getStatement().executeQuery("select * from dist_information where dist_name='"+distributorName+"' and dist_flag_id = '0'");
            while(rs.next()){
                isSelect = true;
            }
        } catch(Exception e) {
            log.debug("Err in Controller in selectRecord() :"+e.getMessage());
            isSelect = false;
        }
        return isSelect;
    }
//    public boolean updateLog(DistributorModel distributorInfoModel){
//        boolean isSave=false;
//        try{
//            String sql="CALL pro_userlog('Distributor Information','"+distributorInfoModel.getLogText()+"')";

//            if(DBConnection.getStatement().executeUpdate(sql)>0){
//                isSave=true;
//            }
//        }
//        catch(Exception e){

//            isSave=false;
//        }
//        return isSave;
//    }
    public DistributorModel selectMaxRecord()  {
         DistributorModel distributorModel=new DistributorModel();
        try {
            ResultSet  rs=DBConnection.getStatement().executeQuery("select max(dist_code)as dist_code from dist_information");
            while(rs.next()){
                distributorModel.setDistributorCode(rs.getString("dist_code"));
            }
            
        } catch(Exception e) {
            log.debug("Method:selectMaxRecord Exception:"+e.getMessage());
        }
        return distributorModel;

    }
}
