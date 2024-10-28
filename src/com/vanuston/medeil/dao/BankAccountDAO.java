/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.dao;

import com.vanuston.medeil.implementation.BankAccount;
import com.vanuston.medeil.model.BankAccountModel;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class BankAccountDAO implements  BankAccount{
 static Logger log = Logger.getLogger(PaymentDAO.class, "com.vanuston.medeil.dao.BankAccountDAO");
    @Override
    public Object viewRecord(Object acNo) {
        BankAccountModel bankAccountModel = new BankAccountModel () ;
        try {
            String sql ;
            if (acNo==null || acNo.equals("null") || acNo.equals("")) {
                sql = "select * from bank_details where bd_flag_id = '0'" ;
            } else {
                sql = "select * from bank_details where acc_number = '" + acNo + "' and bd_flag_id = '0'" ;
            }
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            List<BankAccountModel> bankAccounts =  new ArrayList<BankAccountModel> () ;
            while (rs.next()) {
                bankAccountModel = new BankAccountModel () ;
                bankAccountModel.setAccountNumber(rs.getString ("acc_number")) ;
                bankAccountModel.setAccountHolder (rs.getString ("acc_holder")) ;
                bankAccountModel.setAccountType (rs.getString ("acc_type")) ;
                bankAccountModel.setAccountStatus (rs.getString ("acc_status")) ;
                bankAccountModel.setBankName (rs.getString ("bank_name")) ;
                bankAccountModel.setBranch (rs.getString ("branch")) ;
                bankAccountModel.setAddress (rs.getString ("address")) ;
                bankAccountModel.setOpenDate (rs.getDate ("open_date")) ;
                bankAccountModel.setOpeningBalance (rs.getDouble ("opening_bal")) ;
                bankAccountModel.setBalanceType (rs.getString ("bal_type")) ;
                bankAccounts.add (bankAccountModel) ;
            }
            bankAccountModel.setBankAccountModelList (bankAccounts) ;
        } catch (Exception e) {
         log.debug(e.getMessage());
        }
        return bankAccountModel ;
    }

    @Override
    public boolean deleteRecord(Object acNo) {
        boolean isDelete = false ;
        try {
            if (DBConnection.getStatement().executeUpdate("update bank_details set bd_flag_id = '1' where acc_number = '" + acNo + "'") > 0) {
                isDelete =true ;
            }
        } catch (Exception e) {
           log.debug(e.getMessage());
        }
        return isDelete ;
    }

    @Override
    public Object createRecord(Object bankAccountModels) {
        boolean isCreate = false ;
        BankAccountModel bankAccountModel = (BankAccountModel) bankAccountModels ;
        try {        	
            String sql = "CALL pro_bankaccount_dao (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) " ;
            java.sql.CallableStatement cs = DBConnection.getConnection().prepareCall (sql) ;
            cs.setString ("accnumber", bankAccountModel.getAccountNumber ()) ;
            cs.setString ("accholder", bankAccountModel.getAccountHolder ()) ;
            cs.setString ("acctype", bankAccountModel.getAccountType ()) ;
            cs.setDate ("opendate", bankAccountModel.getOpenDate ()) ;
            cs.setDouble ("openingbal", bankAccountModel.getOpeningBalance ()) ;
            cs.setString ("baltype", bankAccountModel.getBalanceType ()) ;
            cs.setString ("accstatus", bankAccountModel.getAccountStatus ()) ;
            cs.setString ("bankname", bankAccountModel.getBankName ()) ;
            cs.setString ("bankbranch", bankAccountModel.getBranch ()) ;
            cs.setString ("bankaddress", bankAccountModel.getAddress ()) ;
            cs.setString ("functionality", "save") ;
            cs.registerOutParameter("status_flag", Types.INTEGER) ;
               cs.executeUpdate ();
            if ( cs.getInt("status_flag") == 1) {
                isCreate = true ;
            }
        } catch (Exception e) {
          log.debug(e.getMessage());
        }
        return isCreate ;
    }

    @Override
    public Object updateRecord(Object bankAccountModels) {
        boolean isUpdate = false ;
        BankAccountModel bankAccountModel = (BankAccountModel) bankAccountModels ;
        try {
            String sql = "CALL pro_bankaccount_dao (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ;" ;
            java.sql.CallableStatement cs = DBConnection.getConnection().prepareCall (sql) ;
            cs.setString ("accnumber", bankAccountModel.getAccountNumber ()) ;
            cs.setString ("accholder", bankAccountModel.getAccountHolder ()) ;
            cs.setString ("acctype", bankAccountModel.getAccountType ()) ;
            cs.setDate ("opendate", bankAccountModel.getOpenDate ()) ;
            cs.setDouble ("openingbal", bankAccountModel.getOpeningBalance ()) ;
            cs.setString ("baltype", bankAccountModel.getBalanceType ()) ;
            cs.setString ("accstatus", bankAccountModel.getAccountStatus ()) ;
            cs.setString ("bankname", bankAccountModel.getBankName ()) ;
            cs.setString ("bankbranch", bankAccountModel.getBranch ()) ;
            cs.setString ("bankaddress", bankAccountModel.getAddress ()) ;
            cs.setString ("functionality", "update") ;
            cs.registerOutParameter("status_flag", Types.INTEGER) ;
            cs.executeUpdate ();
          
            if ( cs.getInt("status_flag") == 2) {
                isUpdate = true ;
            }
        } catch (Exception e) {
           log.debug(e.getMessage());
        }
        return isUpdate ;
    } 
 }
