/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.dao;

import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;



import com.vanuston.medeil.implementation.MaintenanceCost;
import com.vanuston.medeil.model.MaintenanceCostModel;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;

/**
 *
 * @author Administrator
 */
public class MaintenanceCostDAO implements MaintenanceCost {
    static Logger log = Logger.getLogger(MaintenanceCostDAO.class, "MaintenanceCostDAO");

    @Override
    public Object viewRecord(Object maintenanceCostModels) {
    	MaintenanceCostModel maintenanceCostModel = (MaintenanceCostModel) maintenanceCostModels ;
    	try { 
    		String sql = "" ;                                
    		if (maintenanceCostModel.getMonth() != null && maintenanceCostModel.getMonth().equals(""))
                    sql = "select * from maintain_cost where cmonth = (SELECT cmonth FROM maintain_cost order by main_id desc limit 0,1) and cyear = '" + maintenanceCostModel.getYear () + "' and payment_status='Default' and mc_flag_id = '0'" ;
    		else
                    sql = "select * from maintain_cost where cmonth ='" + maintenanceCostModel.getMonth () + "' and cyear = '" + maintenanceCostModel.getYear () + "' and mc_flag_id = '0'" ;
    		ResultSet rs = DBConnection.getStatement().executeQuery(sql);
    		List<MaintenanceCostModel> maintenanceCostList = new ArrayList<MaintenanceCostModel> () ;
    		while (rs.next()) {
    			maintenanceCostModel = new MaintenanceCostModel () ;
    			maintenanceCostModel.setDate (rs.getDate ("sdate")) ;
    			maintenanceCostModel.setMonth(rs.getString ("cmonth")) ;
    			maintenanceCostModel.setYear (rs.getInt("cyear")) ;
    			maintenanceCostModel.setParticular (rs.getString ("particular")) ;
    			maintenanceCostModel.setPaymentStatus (rs.getString ("payment_status")) ;
    			maintenanceCostModel.setPaymentType (rs.getString ("payment_type")) ;
    			maintenanceCostModel.setDueDate (rs.getString ("due_date")) ;
    			maintenanceCostModel.setSerialNo(rs.getInt ("s_no")) ;
    			maintenanceCostModel.setChequeNo(rs.getString ("cheque_no")) ;
    			maintenanceCostModel.setAmount(rs.getDouble ("amount")) ;
    			maintenanceCostModel.setNetTotal(rs.getDouble("net_total")) ;
    			maintenanceCostList.add (maintenanceCostModel) ;
    		}
    		maintenanceCostModel.setMaintenanceCostList (maintenanceCostList) ;    		
    	} catch (Exception e) {
    		log.debug ("Err in viewRecord() in MaintenanceCostDAO : " + e) ;
    	}
        return maintenanceCostModel ;
    }

    @Override
    public boolean deleteRecord(Object maintenanceCostModels) {
    	boolean isDelete = false ;
    	MaintenanceCostModel maintenanceCostModel = (MaintenanceCostModel) maintenanceCostModels ;
    	try {
    		String sql = "update maintain_cost set mc_flag_id = '1' where cmonth = '" + maintenanceCostModel.getMonth() + "' and cyear = '" + maintenanceCostModel.getYear() + "'" ;
    		if ( DBConnection.getStatement().executeUpdate(sql) > 0 )
    			isDelete = true ;
    	} catch (Exception e) {
    		isDelete = false ;
    		log.debug("Err in deleteRecord() in MaintenanceCostDAO :" + e) ;
    	}
        return isDelete ;
    }

    @Override
    public Object createRecord(Object maintenanceCostModels) {
        boolean isCreate = false ;
        MaintenanceCostModel maintenaceCostModel = (MaintenanceCostModel) maintenanceCostModels ;
        try {        
        		String sql = "CALL pro_maintenancecost_dao(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ;" ;
	        	java.sql.CallableStatement cs = DBConnection.getConnection().prepareCall(sql) ;
	        	cs.setDate ("mcsdate", maintenaceCostModel.getDate ()) ;
	        	cs.setString ("mccmonth", maintenaceCostModel.getMonth ()) ;
	        	cs.setInt("mccyear", maintenaceCostModel.getYear()) ;
	        	cs.setInt ("mcs_no", maintenaceCostModel.getSerialNo ()) ;
	        	cs.setString ("mcparticular", maintenaceCostModel.getParticular ()) ;
	        	cs.setString ("mcdue_date", maintenaceCostModel.getDueDate ()) ;
	        	cs.setString ("mcpayment_status", maintenaceCostModel.getPaymentStatus ()) ;
	        	cs.setString ("mcpayment_type", maintenaceCostModel.getPaymentType ()) ;
	        	cs.setString ("mccheque_no", maintenaceCostModel.getChequeNo ()) ;
	        	cs.setDouble ("mcamount", maintenaceCostModel.getAmount ()) ;
	        	cs.setDouble ("mcnet_total", maintenaceCostModel.getNetTotal ()) ;
	        	cs.setString ("functionality", "save") ;
	        	cs.registerOutParameter("status_flag", Types.INTEGER) ;
	        	cs.executeUpdate () ;
	        	if (cs.getInt("status_flag") == 1) 
	        		isCreate = true ;        	  	
        } catch (Exception e) {
        	isCreate = false ;
        	log.debug("Err in createRecord() in MaintenanceCostDAO : " + e) ;
        }
        return isCreate ;
    }

    @Override
    public Object updateRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    @Override
    public boolean deleteMaintenanceCost(MaintenanceCostModel maintenanceCostModel) {
    	boolean isDelete = false ;
    	try {
    		String sql = "delete from maintain_cost where cmonth = '" + maintenanceCostModel.getMonth() + "' and cyear = '" + maintenanceCostModel.getYear() + "'";
            if (DBConnection.getStatement().executeUpdate(sql) > 0)
            	isDelete =true ;    		
    	} catch (Exception e) {
    		log.debug("Err in deleteMaintenanceCost() in MaintenanceCostDAO : " + e) ;
    	}
    	return isDelete ; 
    }
    @Override
    public List<MaintenanceCostModel> getChequeDetails() {
        List<MaintenanceCostModel> details = new ArrayList<MaintenanceCostModel>();
        MaintenanceCostModel model;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("SELECT * FROM cheque_transaction where particulars = 'Shop Maintenance' and chq_status = 'Cleared' and chq_flag_id = '0' and paid_flag_id = '0'");
            while (rs.next()) {
                model = new MaintenanceCostModel();
                model.setChequeNo (rs.getString("chq_no"));
                model.setAmount (rs.getDouble("Amount"));
                model.setBankName(rs.getString("bank_name"));
                model.setAccountNo(rs.getString("acc_no"));
                details.add(model);
            }
        } catch (Exception e) {
            String ss = "Class : MaintenanceCostDAO  Method   : LoadMintainTable Exception :" + e.getMessage();

        }
        return details;
    }
}
