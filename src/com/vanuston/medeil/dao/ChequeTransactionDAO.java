/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.dao;

import com.vanuston.medeil.implementation.ChequeTransaction;
import com.vanuston.medeil.model.ChequeTransactionModel;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Logger;
import java.sql.ResultSet;
import java.sql.CallableStatement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class ChequeTransactionDAO implements ChequeTransaction {

    static Logger log = Logger.getLogger(ChequeTransactionDAO.class, "com.vanuston.medeil.dao.ChequeTransactionDAO");

    public Object viewRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean deleteRecord(Object object) {
        Boolean delete = false;
        try {
            DBConnection.getStatement().executeUpdate("update cheque_transaction set chq_flag_id=8  where chq_id='" + object + "'");
            delete = true;

        } catch (Exception e) {
            delete = false;
            log.debug(" Class : ChequeTransactionDAO  Method   : CreateRecord Exception :" + e.getMessage());
        }

        return delete;
    }

    @Override
    public Object createRecord(Object object) {
        Boolean insert = false;
        int returnFlagCount = 0;
        ChequeTransactionModel chequeTxnModel = (ChequeTransactionModel) object;
        try {
            CallableStatement chequeTxnCall = DBConnection.getConnection().prepareCall("{call pro_savechequetransaction(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?, ?, ?, ?, ?, ?)}");
            chequeTxnCall.setString(1, chequeTxnModel.getChequeNumber());
            chequeTxnCall.setString(2, chequeTxnModel.getAccountNumber());
            chequeTxnCall.setString(3, chequeTxnModel.getTransactionType());
            chequeTxnCall.setString(4, chequeTxnModel.getBankName());
            chequeTxnCall.setString(5, chequeTxnModel.getIssuedDate());
            chequeTxnCall.setString(6, chequeTxnModel.getChequeStatus());
            chequeTxnCall.setString(7, chequeTxnModel.getDepositDate());
            chequeTxnCall.setString(8, chequeTxnModel.getClearedDate());
            chequeTxnCall.setString(9, chequeTxnModel.getIssuedTo());
            chequeTxnCall.setDouble(10, chequeTxnModel.getAmount());
            chequeTxnCall.setString(11, chequeTxnModel.getCreated_on());
            chequeTxnCall.setInt(12, chequeTxnModel.getFlagValue());
            chequeTxnCall.setString(13, chequeTxnModel.getParticulars());
            chequeTxnCall.setInt(14, chequeTxnModel.getChequeID());
            chequeTxnCall.setInt(15, chequeTxnModel.getPaidFlag());
            chequeTxnCall.setString(16, chequeTxnModel.getSaveType());
            chequeTxnCall.registerOutParameter(17, Types.INTEGER);
            chequeTxnCall.executeUpdate();
            int returnFlag = chequeTxnCall.getInt("flag");
            if (returnFlag == 1) {
                returnFlagCount++;
            }

            insert = true;

        } catch (Exception e) {
            insert = false;
            log.debug(" Class : ChequeTransactionDAO  Method   : CreateRecord Exception :" + e.getMessage());
        }
        return insert;
    }

    @Override
    public int chequeNoAlreadyExists(String checqNo, Integer chq_id) {
        int valid = 0;
        int chq_no = 0;
        try {
            String sql = "";

            sql = "select chq_id from  cheque_transaction where chq_no='" + checqNo + "' and chq_flag_id!=8";

            ResultSet rs = null;
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                chq_no = rs.getInt("chq_id");
            }

        } catch (Exception e) {
            String msg = "Class: ChequeTransactionDAO  Method: chequeNoAlreadyExists()  = " + e.getMessage();
            log.debug(msg);
        }
        if (chq_no == chq_id) {
            valid = 0;
        } else if (chq_no <= 0) {
            valid = 0;
        } else if (chq_no != chq_id) {
            valid = 1;
        }

        return valid;
    }

    @Override
    public int getValidChequeNo(String acccountNo, String chgNo) {
        int i = 0;
        try {
            String sql = "select chq_id  from chequeno_list   where account_no='" + acccountNo + "' and cheque_no='" + chgNo + "'";
            ResultSet rs = null;
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                i = 10;
            }
        } catch (Exception e) {
            String msg = "Class: ChequeTransactionDAO  Method: getValidChequeNo()  = " + e.getMessage();
            log.debug(msg);
        }
        return i;
    }

    @Override
    public boolean chequeTransactionClosingBalanceCalculation(ChequeTransactionModel chqModel) {
        ChequeTransactionModel chqTxnModel = chqModel;
        boolean calculation = true;
        try {

            double close_balance = 0.00;
            double finalBalance = 0.00;
            double Amount = chqTxnModel.getAmount();

            String bank_branch_name = "";
            String curDate = DateUtils.now("yyyy-MM-dd");
            String sql = "select bank_id,closing_balance,bank_branch_name from bank_book where account_no='" + chqTxnModel.getAccountNumber() + "' order by bank_id desc limit 0,1";
            ResultSet rs = null;
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                close_balance = rs.getDouble("closing_balance");
                bank_branch_name = rs.getString("bank_branch_name");
            }
            if (chqTxnModel.getTransactionType().equals("Payable")) {
                finalBalance = close_balance - Amount;
                sql = "insert into  bank_book(cur_date,account_no,bank_branch_name,opening_balance,depit_amount,credit_amount,expense_towards,transaction_type,closing_balance,cheque_no,bank_flag_id) values('" + curDate + "','" + chqTxnModel.getAccountNumber() + "','" + bank_branch_name + "','" + close_balance + "','" + Amount + "','0.00','Shop','Withdrawal','" + finalBalance + "','" + chqTxnModel.getChequeNumber() + "','1') ";
            } else {
                finalBalance = close_balance + Amount;
                sql = "insert into  bank_book(cur_date,account_no,bank_branch_name,opening_balance,depit_amount,credit_amount,expense_towards,transaction_type,closing_balance,cheque_no,bank_flag_id) values('" + curDate + "','" + chqTxnModel.getAccountNumber() + "','" + bank_branch_name + "','" + close_balance + "','0.00','" + Amount + "','Shop','Deposit','" + finalBalance + "','" + chqTxnModel.getChequeNumber() + "','1') ";
            }

            DBConnection.getStatement().executeUpdate(sql);

        } catch (Exception e) {
            String msg = "Class: ChequeTransactionDAO  Method: getChqueNo()  = " + e.getMessage();
            log.debug(msg);
            calculation = false;
        }
        return calculation;
    }

    @Override
    public Object updateRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public List<ChequeTransactionModel> displayChequeTransactionTableValues(String sql) {
        List<ChequeTransactionModel> tableValues = new ArrayList<ChequeTransactionModel>();

        try {
            String presentDate = DateUtils.now("MM-yy");
            ChequeTransactionModel listModel;
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                listModel = new ChequeTransactionModel();
                listModel.setChequeID(rs.getInt("chq_id"));
                listModel.setChequeNumber(rs.getString("chq_no"));
                listModel.setIssuedDate(DateUtils.normalFormatDate(rs.getDate("issued_date")));
                String depositDate = rs.getString("deposit_date");
                if (depositDate != null && !depositDate.equals("null")) {
                    depositDate = DateUtils.normalFormatDate(rs.getDate("deposit_date"));
                }
                listModel.setDepositDate(depositDate);
                listModel.setTransactionType(rs.getString("txn_type"));
                listModel.setIssuedTo(rs.getString("issued_to"));
                listModel.setAmount(rs.getDouble("Amount"));
                listModel.setAccountNumber(rs.getString("acc_no"));
                presentDate = rs.getString("cleared_date");
                if (presentDate != null && !presentDate.equals("null")) {
                    presentDate = DateUtils.normalFormatDate(rs.getDate("cleared_date"));
                }
                listModel.setClearedDate(presentDate);
                listModel.setBankName(rs.getString("bank_name"));
                listModel.setChequeStatus(rs.getString("chq_status"));
                tableValues.add(listModel);
            }
        } catch (Exception e) {
            String msg = "Class: ChequeTransactionDAO  Method: displayChequeTransactionTableValues()  = " + e.getMessage();
            log.debug(msg);

        }
        return tableValues;
    }

	@Override
	public ChequeTransactionModel displayChequeTransactionDetails(String ssNo) {
		ChequeTransactionModel chqModel=new ChequeTransactionModel();
		try{
			
		String sql = "SELECT  *  FROM cheque_transaction where   chq_id='"+ssNo+"'";
        ResultSet rs = DBConnection.getStatement().executeQuery(sql);
        while(rs.next()){
        	chqModel.setChequeID(rs.getInt("chq_id"));        	
        	chqModel.setIssuedDate(DateUtils.normalFormatDate(rs.getDate("issued_date")));              
              String deposit_date = rs.getString("deposit_date");
              if (deposit_date != null && deposit_date != "null") {
                  deposit_date = DateUtils.normalFormatDate(rs.getDate("deposit_date"));
              } else {
                  deposit_date = null;
              }
              chqModel.setDepositDate(deposit_date);
              
              chqModel.setTransactionType(rs.getString("txn_type"));
              chqModel.setChequeStatus(rs.getString("chq_status"));
              chqModel.setAccountNumber( rs.getString("acc_no"));
              chqModel.setBankName(rs.getString("bank_name"));
              chqModel.setParticulars(rs.getString("particulars"));
               
              String presentDate= rs.getString("cleared_date");
              if (presentDate != null && presentDate != "null") {
                  presentDate = DateUtils.normalFormatDate(rs.getDate("cleared_date"));
              } else {
                  presentDate = null;
              }
              
              chqModel.setClearedDate(presentDate);
              chqModel.setIssuedTo(rs.getString("issued_to"));
              chqModel.setAmount(rs.getDouble("Amount"));
              chqModel.setChequeNumber(rs.getString("chq_no"));
              
        }
			
		}catch(Exception e){
			log.debug("Class:ChequeTransactionController method :displayChequeTransactionDetails()  " + e.getMessage());
		}
		
		return chqModel;
	}
}
