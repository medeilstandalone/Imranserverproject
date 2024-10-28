/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.dao;

 
import com.vanuston.medeil.implementation.Receipt;
import com.vanuston.medeil.model.ReceiptModel;
import java.sql.CallableStatement;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.List;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;
import java.util.ArrayList;
import com.vanuston.medeil.util.DateUtils;
 
import java.rmi.NotBoundException;
import java.rmi.RemoteException;

/**
 *
 * @author Administrator
 */
public class ReceiptDAO implements Receipt {

    static Logger log = Logger.getLogger(PaymentDAO.class, "com.vanuston.medeil.dao.ReceiptDAO");
 
    @Override
    public Object viewRecord(Object object) {
        ReceiptModel receiptModel = (ReceiptModel) object;
        boolean get = true;
        try {
            String sql = "select * from Receipt where receipt_no='" + receiptModel.getReceiptNumber() + "' and rec_flag_id=0";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                receiptModel.setCustomerName(rs.getString("cust_name"));
                receiptModel = (ReceiptModel) getCustomerBalanceAmount(receiptModel);
                receiptModel.setPaymentType(rs.getString("pay_type"));
                receiptModel.setReceiptNumber(rs.getString("receipt_no"));
                receiptModel.setReceiptDate(DateUtils.normalFormatDate(rs.getDate("receipt_date")));
                receiptModel.setCardNumber(rs.getString("card_no"));
                receiptModel.setBankName(rs.getString("bank_name"));
                receiptModel.setHolderName(rs.getString("Holder_name"));
                receiptModel.setPayTypeDate(rs.getString("PayType_Date"));
                receiptModel.setTotalPaidAmount(rs.getDouble("total_paid_amt"));
                receiptModel.setBalanceAmount(rs.getDouble("balance_amt"));
                receiptModel.setCustomerName(rs.getString("cust_name"));
                receiptModel.setTotalBalanceDue(receiptModel.getTotalPaidAmount() + receiptModel.getTotalBalanceDue());
            }


        } catch (Exception e) {

            get = false;
            log.debug(" Class : PaymentDAO  Method   : ViewRecord Exception :" + e.getMessage());
        }
        receiptModel.setErrorMessage(get);

        return receiptModel;
    }

    @Override
    public boolean deleteRecord(Object object) {
        Boolean insert = false;
        int returnFlagCount = 0;
        ReceiptModel receiptModel = (ReceiptModel) object;
        List<ReceiptModel> list = receiptModel.getListofitems();

        try {

            // Sales cash, credit, cards Insert
            for (int index = 0; index < list.size(); index++) {
                ReceiptModel iterateModel = list.get(index);
                CallableStatement salesCall = DBConnection.getConnection().prepareCall("{call pro_savereceipt(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)}");
                salesCall.setString(1, receiptModel.getReceiptHiddenNumber());
                salesCall.setString(2, receiptModel.getReceiptDate());
                salesCall.setString(3, receiptModel.getCustomerName());
                salesCall.setString(4, receiptModel.getPaymentType());
                salesCall.setString(5, receiptModel.getCardNumber());
                salesCall.setString(6, receiptModel.getBankName());
                salesCall.setString(7, receiptModel.getHolderName());
                salesCall.setString(8, receiptModel.getPayTypeDate());
                salesCall.setDouble(9, receiptModel.getTotalBalanceDue());
                salesCall.setString(10, iterateModel.getBillNumber());
                salesCall.setString(11, iterateModel.getBillDate());
                salesCall.setDouble(12, iterateModel.getBillAmount());
                salesCall.setDouble(13, iterateModel.getPaidAmount());
                salesCall.setDouble(14, receiptModel.getBalanceAmount());
                salesCall.setDouble(15, receiptModel.getTotalPaidAmount());
                salesCall.setDouble(16, iterateModel.getBillBalanceAmount());
                salesCall.setString(17, iterateModel.getTransactionDetails());
                salesCall.setString(18, receiptModel.getSaveType());
                salesCall.registerOutParameter(19, Types.INTEGER);
                salesCall.executeUpdate();
                int returnFlag = salesCall.getInt("flag");
                if (returnFlag == 1) {
                    returnFlagCount++;
                }
            }
            insert = true;

        } catch (Exception e) {

            insert = false;
            log.debug(" Class : ReceiptDAO  Method   : deleteRecord Exception :" + e.getMessage());
        }
        return insert;

    }

    @Override
    public Object createRecord(Object object) {
        Boolean insert = false;
        int returnFlagCount = 0;
        ReceiptModel receiptModel = (ReceiptModel) object;
        List<ReceiptModel> list = receiptModel.getListofitems();

        try {
            // Sales cash, credit, cards Insert
            for (int index = 0; index < list.size(); index++) {
                ReceiptModel iterateModel = list.get(index);
                CallableStatement salesCall = DBConnection.getConnection().prepareCall("{call pro_savereceipt(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?)}");
                salesCall.setString(1, receiptModel.getReceiptNumber());
                salesCall.setString(2, receiptModel.getReceiptDate());
                salesCall.setString(3, receiptModel.getCustomerName());
                salesCall.setString(4, receiptModel.getPaymentType());
                salesCall.setString(5, receiptModel.getCardNumber());
                salesCall.setString(6, receiptModel.getBankName());
                salesCall.setString(7, receiptModel.getHolderName());
                salesCall.setString(8, receiptModel.getPayTypeDate());
                salesCall.setDouble(9, receiptModel.getTotalBalanceDue());
                salesCall.setString(10, iterateModel.getBillNumber());
                salesCall.setString(11, iterateModel.getBillDate());
                salesCall.setDouble(12, iterateModel.getBillAmount());
                salesCall.setDouble(13, iterateModel.getPaidAmount());
                salesCall.setDouble(14, receiptModel.getBalanceAmount());
                salesCall.setDouble(15, receiptModel.getTotalPaidAmount());
                salesCall.setDouble(16, iterateModel.getBillBalanceAmount());
                salesCall.setString(17, iterateModel.getTransactionDetails());
                salesCall.setString(18, receiptModel.getSaveType());
                salesCall.registerOutParameter(19, Types.INTEGER);
                salesCall.executeUpdate();
                int returnFlag = salesCall.getInt("flag");
                if (returnFlag == 1) {
                    returnFlagCount++;
                }
            }
            insert = true;

        } catch (Exception e) {

            insert = false;
            log.debug(" Class : ReceiptDAO  Method   : CreateRecord Exception :" + e.getMessage());
        }
        return insert;
    }

    @Override
    public Object updateRecord(Object object) {
        Object insert = false;
        try {
            ReceiptModel receiptModel = (ReceiptModel) object;
            String sql = "delete from  receipt where receipt_no='" + receiptModel.getReceiptHiddenNumber() + "' ";
            
            DBConnection.getStatement().executeUpdate(sql);
            insert = createRecord(object);
        } catch (Exception e) {

            insert = false;
            log.debug(" Class : ReceiptDAO  Method   : CreateRecord Exception :" + e.getMessage());
        }
        return insert;
    }

    @Override
    public Object getCustomerBalanceAmount(Object object) throws RemoteException,NotBoundException {
        ReceiptModel receiptModel = (ReceiptModel) object;
        boolean get = true;
      CommonDAO comObj = new CommonDAO();
          
        try {
            double paidAmount = 0.0;
            receiptModel.setPaidAmount(paidAmount);
            String sql = "select sum(paid_amt)as pamt from receipt where cust_name = '" + receiptModel.getCustomerName() + "' and rec_flag_id=0 ";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                paidAmount = rs.getDouble("pamt");
                receiptModel.setPaidAmount(paidAmount);
            }
            receiptModel.setTotalPaidAmount(0.00);
            sql = "select sum(paid_amount)as pamt,sum(total_amount) as tam from sales_maintain_bill where cust_name = '" + receiptModel.getCustomerName() + "'";
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                paidAmount += rs.getDouble("pamt");
                receiptModel.setPaidAmount(paidAmount);
                receiptModel.setTotalPaidAmount(rs.getDouble("tam"));

            }
            receiptModel.setCreditAmount(comObj.getCreditAmount(receiptModel.getCustomerName(), "Customer"));
            receiptModel.setDebitAmount(comObj.getDebitAmount(receiptModel.getCustomerName(), "Customer"));
            receiptModel.setTotalBalanceDue(receiptModel.getTotalPaidAmount() - receiptModel.getPaidAmount() + receiptModel.getDebitAmount() - receiptModel.getCreditAmount());

        } catch (Exception e) {
            get = false;
            log.debug(" Class : Receipt  Method   : getDistributorBalanceAmount Exception :" + e.getMessage());
        }
        receiptModel.setErrorMessage(get);

        return receiptModel;
    }

    @Override
    public Object getReceiptTableValues(Object object) {

        List<ReceiptModel> receiptItems = new ArrayList<ReceiptModel>();
        ReceiptModel receiptModel = (ReceiptModel) object;
        try {
            ReceiptModel recModel;

            ResultSet rs = DBConnection.getStatement().executeQuery(receiptModel.getQueryValue());
            while (rs.next()) {
                recModel = new ReceiptModel();
                recModel.setBillNumber(rs.getString("invoice_no"));
                recModel.setBillDate(rs.getString("invoice_date"));
                recModel.setBillAmount(rs.getDouble("invoice_amt"));
                recModel.setBillBalanceAmount(rs.getDouble("bill_bal_amt"));
                recModel.setPaidAmount(rs.getDouble("paid_amt"));
                recModel.setReceiptDate(DateUtils.normalFormatDate(rs.getDate("receipt_date")));
                recModel.setReceiptNumber(rs.getString("receipt_no"));
                recModel.setCustomerName(rs.getString("cust_name"));
                receiptModel.setBalanceAmount(rs.getDouble("balance_amt"));
                receiptModel.setTotalPaidAmount(rs.getDouble("total_paid_amt"));
                receiptItems.add(recModel);
            }
            receiptModel.setListofitems(receiptItems);
        } catch (Exception e) {
            log.debug(" Class : PaymentDAO  Method   : getPaymentTableValues Exception :" + e.getMessage());
        }

        return receiptModel;
    }

    @Override
    public Object getBillDetails(Object obj) {
        ReceiptModel receiptModel = new ReceiptModel();
        List<ReceiptModel> receiptItems = new ArrayList<ReceiptModel>();
        ReceiptModel recModel;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(obj.toString());
            while (rs.next()) {
                recModel = new ReceiptModel();
                recModel.setBillNumber(rs.getString("bill_no"));
                recModel.setBillDate(rs.getString("bill_date"));
                recModel.setTotalPaidAmount(rs.getDouble("total_amount"));
                receiptItems.add(recModel);
            }
            receiptModel.setListofitems(receiptItems);
        } catch (Exception e) {
            log.debug(" Class : PaymentDAO  Method   : getPaymentTableValues Exception :" + e.getMessage());
        }
        return receiptModel;
    }
}
