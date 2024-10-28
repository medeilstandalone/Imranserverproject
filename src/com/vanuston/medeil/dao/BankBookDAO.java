/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.dao;

import com.vanuston.medeil.implementation.BankBook;
import com.vanuston.medeil.model.BankBookModel;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.DateUtils;
import java.sql.ResultSet;
import java.sql.CallableStatement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class BankBookDAO implements BankBook {

    static Logger log = Logger.getLogger(PaymentDAO.class, "com.vanuston.medeil.dao.BankBookDAO");

    @Override
    public Object viewRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean deleteRecord(Object object) {
        Boolean delete = false;

        try {
            BankBookModel bankBookModel = (BankBookModel) object;

            DBConnection.getStatement().executeUpdate("delete from bank_book where bank_id='" + bankBookModel.getBankId() + "'");
            bankBookClosingBalanceCalculation(bankBookModel);
            delete = true;

        } catch (Exception e) {
            delete = false;
            log.debug(" Class : BankBookDAO  Method   : CreateRecord Exception :" + e.getMessage());
        }

        return delete;
    }

    @Override
    public Object createRecord(Object object) {
        Boolean insert = false;
        int returnFlagCount = 0;
        BankBookModel bankBookModel = (BankBookModel) object;

        //insert into bank_book(cur_date,account_no,bank_branch_name,opening_balance,depit_amount,credit_amount,expense_towards,transaction_type,closing_balance,Transaction_details)values('{curDate}','{cboAcNo1}','{txtBank_Branch1}','{openBalance}','{depitAmount}','{creditAmount}','{cboStatus1}','{cboTxnType1}','{closeBalance}','{txtDesc1}'
        try {
            // Sales cash, credit, cards Insert


            CallableStatement bankbookCall = DBConnection.getConnection().prepareCall("{call pro_savebankbook(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?)}");
            bankbookCall.setString(1, bankBookModel.getAccountNumber());
            bankbookCall.setString(2, bankBookModel.getBankBranchName());
            bankbookCall.setDouble(3, bankBookModel.getOpeningBalance());
            bankbookCall.setDouble(4, bankBookModel.getDebitAmount());
            bankbookCall.setDouble(5, bankBookModel.getCreditAmount());
            bankbookCall.setString(6, bankBookModel.getExpenseTowards());
            bankbookCall.setString(7, bankBookModel.getTransactionType());
            bankbookCall.setDouble(8, bankBookModel.getClosingBalance());
            bankbookCall.setString(9, bankBookModel.getTransactionDetails());
            bankbookCall.setString(10, bankBookModel.getSaveType());
            bankbookCall.setInt(11, bankBookModel.getBankId());
            bankbookCall.registerOutParameter(12, Types.INTEGER);
            bankbookCall.executeUpdate();
            int returnFlag = bankbookCall.getInt("flag");
            if (returnFlag == 1) {
                returnFlagCount++;
            }

            insert = true;

        } catch (Exception e) {
            insert = false;
            log.debug(" Class : BankBookDAO  Method   : CreateRecord Exception :" + e.getMessage());
        }
        return insert;
    }

    @Override
    public Object updateRecord(Object object) {
        Object insert = false;
        BankBookModel bankbookModel = (BankBookModel) object;
        try {

            if (bankbookModel.getAmount() != bankbookModel.getEditAmount()) {
                if (bankbookModel.getExpenseTowards().equals("shop")) {
                    insert = dailyCashBookCalculation(bankbookModel);
                }
                bankBookClosingBalanceCalculation(bankbookModel);
            }

            insert = createRecord(bankbookModel);


        } catch (Exception e) {
            insert = false;
            log.debug(" Class : BankBookDAO  Method   : updateRecord Exception :" + e.getMessage());

        }
        return insert;
    }

    @Override
    public Object dailyCashBookCalculation(Object object) {
        Boolean insert = false;
        try {

            BankBookModel bankBookModel = (BankBookModel) object;
            String curDate = DateUtils.now("yyyy-MM-dd");
            double cur_close_balance = 0.00;
            double cur_cash_intro = 0.00;
            double cur_cash_withdraw = 0.00;
            String sql = "";
            sql = "select close_cash_balance,cash_intro,cash_withdrawal   from dailycashbook where  dsb_date='" + curDate + "' ";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                cur_close_balance = rs.getDouble("close_cash_balance");
                cur_cash_intro = rs.getDouble("cash_intro");
                cur_cash_withdraw = rs.getDouble("cash_withdrawal");

            }
            if (bankBookModel.getTransactionType().equals("Deposit")) {  // Status 0 means  withdraw amount for daily cash book.  closingbalance=closingbakance-Amount;
                cur_cash_withdraw = cur_cash_withdraw + bankBookModel.getAmount();
                cur_close_balance = cur_close_balance - bankBookModel.getAmount();
            } else {  //Status 1 means introduced Amount for daily cash book. closingbalance=closingbalance+Amount;
                cur_cash_intro = cur_cash_intro + bankBookModel.getAmount();
                cur_close_balance = cur_close_balance + bankBookModel.getAmount();
            }
            sql = "update dailycashbook set close_cash_balance='" + cur_close_balance + "',cash_withdrawal='" + cur_cash_withdraw + "',cash_intro='" + cur_cash_intro + "'  where dsb_date='" + curDate + "'";

            DBConnection.getStatement().executeUpdate(sql);
            insert = true;
        } catch (Exception e) {
            String msg = "Class: BankBookDAO  Method: dailyCashBookCalculation()  = " + e.getMessage();
            log.debug(msg);
            insert = false;
        }
        return insert;
    }

    @Override
    public Object displayBankBookDetails(String str) {

        BankBookModel bankBookModel = new BankBookModel();
        try {

            String sql = "SELECT  *  FROM bank_book where bank_id='" + str + "'  ";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                bankBookModel.setBankId(rs.getInt("bank_id"));
                bankBookModel.setAccountNumber(rs.getString("account_no"));
                bankBookModel.setBankBranchName(rs.getString("bank_branch_name"));
                bankBookModel.setExpenseTowards(rs.getString("expense_towards"));
                bankBookModel.setTransactionType(rs.getString("transaction_type"));
                double creAmount = rs.getDouble("credit_amount");
                if (creAmount > 0) {
                    bankBookModel.setCreditAmount(rs.getDouble("credit_amount"));
                    bankBookModel.setEditAmount(rs.getDouble("credit_amount"));
                } else {
                    bankBookModel.setDebitAmount(rs.getDouble("depit_amount"));
                    bankBookModel.setEditAmount(rs.getDouble("depit_amount"));
                }
                bankBookModel.setTransactionDetails(rs.getString("Transaction_details"));
                bankBookModel.setOpeningBalance(rs.getDouble("opening_balance"));
                bankBookModel.setClosingBalance(rs.getDouble("closing_balance"));
                bankBookModel.setEditTransactionType(rs.getString("transaction_type"));
            }
        } catch (Exception e) {
            String msg = "Class: BankBookDAO  Method: displayBankBookDetails()  = " + e.getMessage();
            log.debug(msg);
        }
        return bankBookModel;
    }

    public void bankBookClosingBalanceCalculation(BankBookModel model) {
        try {
            int ban_id = 0;
            String sql = "select max(bank_id) as ban from bank_book where  account_no='" + model.getAccountNumber() + "' ";
            ResultSet rs = null;
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                ban_id = rs.getInt("ban");
            }
            if (ban_id != model.getBankId()) {
                for (int i = model.getBankId() + 1; i <= ban_id; i++) {
                    String sql1 = "";
                    if (model.getTransactionType().equals("Deposit")) {
                        sql1 = "update bank_book set opening_balance=opening_balance+" + model.getEditAmount() + ",closing_balance=closing_balance+" + model.getEditAmount() + " where bank_id='" + i + "' and account_no='" + model.getAccountNumber() + "' ";
                    } else {
                        sql1 = "update bank_book set opening_balance=opening_balance-" + model.getEditAmount() + ",closing_balance=closing_balance-" + model.getEditAmount() + " where bank_id='" + i + "' and account_no='" + model.getAccountNumber() + "' ";
                    }

                    DBConnection.getStatement().executeUpdate(sql1);
                }
            }

        } catch (Exception e) {
            String msg = "Class: BankBookDAO  Method: bankBookClosingBalanceCalculation()  = " + e.getMessage();
            log.debug(msg);

        }
    }

    @Override
    public Object viewBankBookTableValues(BankBookModel model) {
        BankBookModel bankBookModel = model;
        BankBookModel listModel;
        try {
            List<BankBookModel> bankBookBookList = new ArrayList<BankBookModel>();
            ResultSet rs = DBConnection.getStatement().executeQuery(bankBookModel.getQuery());
            while (rs.next()) {
                listModel = new BankBookModel();
                listModel.setBankId(rs.getInt("bank_id"));
                listModel.setAccountNumber(rs.getString("account_no"));
                listModel.setBankBookDate(DateUtils.normalFormatDate(rs.getDate("cur_date")));
                listModel.setTransactionType(rs.getString("transaction_type"));
                listModel.setTransactionDetails(rs.getString("Transaction_details"));
                listModel.setDebitAmount(rs.getDouble("depit_amount"));
                listModel.setCreditAmount(rs.getDouble("credit_amount"));
                listModel.setClosingBalance(rs.getDouble("closing_balance"));
                bankBookBookList.add(listModel);
            }
            bankBookModel.setListofitems(bankBookBookList);
        } catch (Exception e) {
            String ss = " Class : BankBookDAO  Method   : viewBankBookTableValues() Exception :" + e.getMessage();
            log.debug(ss);
        }
        return bankBookModel;

    }
}
