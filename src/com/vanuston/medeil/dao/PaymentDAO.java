/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.dao;

  
import com.vanuston.medeil.implementation.Payment;
import com.vanuston.medeil.model.PaymentModel;
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
public class PaymentDAO implements Payment {

    static Logger log = Logger.getLogger(PaymentDAO.class, "com.vanuston.medeil.dao.PaymentDAO");
    

    @Override
    public Object viewRecord(Object object) {
        PaymentModel paymentModel = (PaymentModel) object;
        boolean get = true;
        try {
            String sql = "select * from payment where payment_no='" + paymentModel.getPaymentNumber() + "' and pay_flag_id=0";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                paymentModel.setDistributorName(rs.getString("dist_name"));
                paymentModel = (PaymentModel) getDistributorBalanceAmount(paymentModel);
                paymentModel.setPaymentType(rs.getString("pay_type"));
                paymentModel.setPaymentNumber(rs.getString("payment_no"));
                paymentModel.setPaymentDate(DateUtils.normalFormatDate(rs.getDate("payment_date")));
                paymentModel.setCardNumber(rs.getString("card_no"));
                paymentModel.setBankName(rs.getString("bank_name"));
                paymentModel.setHolderName(rs.getString("Holder_name"));
                paymentModel.setPayTypeDate(rs.getString("PayType_Date"));
                paymentModel.setTotalPaidAmount(rs.getDouble("total_paid_amt"));
                paymentModel.setBalanceAmount(rs.getDouble("balance_amt"));
                paymentModel.setDistributorName(rs.getString("dist_name"));
                paymentModel.setTotalBalanceDue(paymentModel.getTotalPaidAmount() + paymentModel.getTotalBalanceDue());
            }


        } catch (Exception e) {

            get = false;
            log.debug(" Class : PaymentDAO  Method   : ViewRecord Exception :" + e.getMessage());
        }
        paymentModel.setErrorMessage(get);

        return paymentModel;
    }

    @Override
    public boolean deleteRecord(Object object) {
        Boolean insert = false;
        int returnFlagCount = 0;
        PaymentModel paymentModel = (PaymentModel) object;
        List<PaymentModel> list = paymentModel.getListofitems();

        try {

            // Sales cash, credit, cards Insert
            for (int index = 0; index < list.size(); index++) {
                PaymentModel iterateModel = list.get(index);
                CallableStatement salesCall = DBConnection.getConnection().prepareCall("{call pro_savepayment(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?)}");
                salesCall.setString(1, paymentModel.getPaymentHiddenNumber());
                salesCall.setString(2, paymentModel.getPaymentDate());
                salesCall.setString(3, paymentModel.getDistributorName());
                salesCall.setString(4, paymentModel.getPaymentType());
                salesCall.setString(5, paymentModel.getCardNumber());
                salesCall.setString(6, paymentModel.getBankName());
                salesCall.setString(7, paymentModel.getHolderName());
                salesCall.setString(8, paymentModel.getPayTypeDate());
                salesCall.setDouble(9, paymentModel.getTotalBalanceDue());
                salesCall.setString(10, iterateModel.getInvoiceNumber());
                salesCall.setString(11, iterateModel.getInvoiceDate());
                salesCall.setDouble(12, iterateModel.getInvoiceAmount());
                salesCall.setDouble(13, iterateModel.getPaidAmount());
                salesCall.setDouble(14, paymentModel.getBalanceAmount());
                salesCall.setDouble(15, paymentModel.getTotalPaidAmount());
                salesCall.setDouble(16, iterateModel.getInvoiceBalanceAmount());
                salesCall.setString(17, iterateModel.getQueryValue());
                salesCall.setString(18, paymentModel.getTransactionDetails());
                salesCall.setString(19, paymentModel.getSaveType());
                salesCall.registerOutParameter(20, Types.INTEGER);
                salesCall.executeUpdate();
                int returnFlag = salesCall.getInt("flag");
                if (returnFlag == 1) {
                    returnFlagCount++;
                }
            }
            insert = true;

        } catch (Exception e) {
            insert = false;
            log.debug(" Class : PaymentDAO  Method   : deleteRecord Exception :" + e.getMessage());
        }
        return insert;
    }

    @Override
    public Object createRecord(Object object) {

        Boolean insert = false;
        int returnFlagCount = 0;
        PaymentModel paymentModel = (PaymentModel) object;
        List<PaymentModel> list = paymentModel.getListofitems();

        try {

            // Sales cash, credit, cards Insert
            for (int index = 0; index < list.size(); index++) {
                PaymentModel iterateModel = list.get(index);
                CallableStatement salesCall = DBConnection.getConnection().prepareCall("{call pro_savepayment(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?,?,?)}");
                salesCall.setString(1, paymentModel.getPaymentNumber());
                salesCall.setString(2, paymentModel.getPaymentDate());
                salesCall.setString(3, paymentModel.getDistributorName());
                salesCall.setString(4, paymentModel.getPaymentType());
                salesCall.setString(5, paymentModel.getCardNumber());
                salesCall.setString(6, paymentModel.getBankName());
                salesCall.setString(7, paymentModel.getHolderName());
                salesCall.setString(8, paymentModel.getPayTypeDate());
                salesCall.setDouble(9, paymentModel.getTotalBalanceDue());
                salesCall.setString(10, iterateModel.getInvoiceNumber());
                salesCall.setString(11, iterateModel.getInvoiceDate());
                salesCall.setDouble(12, iterateModel.getInvoiceAmount());
                salesCall.setDouble(13, iterateModel.getPaidAmount());
                salesCall.setDouble(14, paymentModel.getBalanceAmount());
                salesCall.setDouble(15, paymentModel.getTotalPaidAmount());
                salesCall.setDouble(16, iterateModel.getInvoiceBalanceAmount());
                salesCall.setString(17, iterateModel.getQueryValue());
                salesCall.setString(18, paymentModel.getTransactionDetails());
                salesCall.setString(19, paymentModel.getSaveType());
                salesCall.registerOutParameter(20, Types.INTEGER);
                salesCall.executeUpdate();
                int returnFlag = salesCall.getInt("flag");
                if (returnFlag == 1) {
                    returnFlagCount++;
                }
            }
            insert = true;

        } catch (Exception e) {
            insert = false;
            log.debug(" Class : PaymentDAO  Method   : CreateRecord Exception :" + e.getMessage());
        }
        return insert;

    }

    @Override
    public Object updateRecord(Object object) {
        Object insert = false;
        try {
            PaymentModel paymentModel = (PaymentModel) object;
            String sql = "delete from  payment where payment_no='" + paymentModel.getPaymentHiddenNumber() + "' ";
            
            DBConnection.getStatement().executeUpdate(sql);
            insert = createRecord(object);
        } catch (Exception e) {
            
            insert = false;
            log.debug(" Class : PaymentDAO  Method   : CreateRecord Exception :" + e.getMessage());
        }
        return insert;
    }

    @Override
    public Object getDistributorBalanceAmount(Object object)throws RemoteException,NotBoundException {

        PaymentModel paymentModel = (PaymentModel) object;
        boolean get = true;
         
          CommonDAO comObj=new CommonDAO();


        try {
            paymentModel.setPaidAmount(0.00);

            String sql = "select sum(paid_amt)as pamt from payment where dist_name = '" + paymentModel.getDistributorName() + "' and pay_flag_id=0 ";

            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                paymentModel.setPaidAmount(rs.getDouble("pamt"));
            }
            paymentModel.setTotalPaidAmount(0.00);
            sql = "select sum(total_amount) as tam from purchase_maintenance where dist_name = '" + paymentModel.getDistributorName() + "'";
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                paymentModel.setTotalPaidAmount(rs.getDouble("tam"));
            }
            sql = "SELECT sum(pi.adjust_amt) as adjamt FROM (select distinct(pur_inv_adjust_no),invoice_no from purchase_return group by pur_inv_adjust_no) pr, "+
                   "(select distinct(invoice_no),trim(dist_name) as distname,adjust_amt,pr_adjust_no,purc_adj_flag_id from purchase_invoice) pi where pr.pur_inv_adjust_no = pi.invoice_no and distname='" + paymentModel.getDistributorName() + "'";
            rs = DBConnection.getStatement().executeQuery(sql);
            double adjustamt =0.00;
            while (rs.next()) {
                adjustamt = rs.getDouble("adjamt");
            }
            paymentModel.setCreditAmount(comObj.getCreditAmount(paymentModel.getDistributorName(), "Distributor"));
            paymentModel.setDebitAmount(comObj.getDebitAmount(paymentModel.getDistributorName(), "Distributor")-adjustamt);
            paymentModel.setTotalBalanceDue(paymentModel.getTotalPaidAmount() - paymentModel.getPaidAmount());

        } catch (Exception e) {           
            get = false;
            log.debug(" Class : PaymentDAO  Method   : getDistributorBalanceAmount Exception :" + e.getMessage());
        }
        paymentModel.setErrorMessage(get);

        return paymentModel;
    }

    @Override
    public Object getPaymentTableValues(Object object) {

        List<PaymentModel> paymentItems = new ArrayList<PaymentModel>();
        PaymentModel paymentModel = (PaymentModel) object;
        try {
            PaymentModel payModel;

            ResultSet rs = DBConnection.getStatement().executeQuery(paymentModel.getQueryValue());
            while (rs.next()) {
                payModel = new PaymentModel();
                payModel.setInvoiceNumber(rs.getString("invoice_no"));
                payModel.setInvoiceDate(rs.getString("invoice_date"));
                payModel.setInvoiceAmount(rs.getDouble("invoice_amt"));
                payModel.setInvoiceBalanceAmount(rs.getDouble("inv_bal_amt"));
                payModel.setPaidAmount(rs.getDouble("paid_amt"));
                payModel.setTransactionDetails(rs.getString("remarks"));
                payModel.setPaymentDate(DateUtils.normalFormatDate(rs.getDate("payment_date")));
                payModel.setPaymentNumber(rs.getString("payment_no"));
                payModel.setDistributorName(rs.getString("dist_name"));
                paymentModel.setBalanceAmount(rs.getDouble("balance_amt"));
                paymentModel.setTotalPaidAmount(rs.getDouble("total_paid_amt"));
                paymentItems.add(payModel);
            }
            paymentModel.setListofitems(paymentItems);
        } catch (Exception e) {

            log.debug(" Class : PaymentDAO  Method   : getPaymentTableValues Exception :" + e.getMessage());
        }

        return paymentModel;
    }

    @Override
    public Object getInvoiceDetails(String str) {
        PaymentModel paymentModel = new PaymentModel();
        List<PaymentModel> paymentItems = new ArrayList<PaymentModel>();
        PaymentModel payModel;

        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(str);
            while (rs.next()) {
                 payModel = new PaymentModel();
                paymentModel.setPaidAmount(rs.getDouble("paid_amt"));
                payModel.setInvoiceNumber(rs.getString("invoice_no"));
                payModel.setInvoiceDate(rs.getString("invoice_date"));
                payModel.setTotalPaidAmount(rs.getDouble("total_amount"));
                paymentItems.add(payModel);
            }
            paymentModel.setListofitems(paymentItems);
        } catch (Exception e) {
            log.debug(" Class : PaymentDAO  Method   : getPaymentTableValues Exception :" + e.getMessage());
        }
        return paymentModel;
    }
}
