/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.dao;

import com.vanuston.medeil.implementation.CreditNote;
import com.vanuston.medeil.model.CreditNoteModel;
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
public class CreditNoteDAO implements CreditNote {

    static Logger log = Logger.getLogger(PaymentDAO.class, "com.vanuston.medeil.dao.CreditNoteDAO");

    @Override
    public Object viewRecord(Object creditNoteNo) {
        CreditNoteModel creditNoteModel = new CreditNoteModel();
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select * from credit_note where credit_note_no = '" + creditNoteNo + "' and cre_flag_id=0");
            while (rs.next()) {
                creditNoteModel.setIssuedAgainst(rs.getString("issued_against"));
                creditNoteModel.setCreditOption(rs.getString("credit_opt"));
                creditNoteModel.setInvoiceOrBillNumber(rs.getString("invoiceorbill_no"));
                creditNoteModel.setName(rs.getString("name"));
                creditNoteModel.setAmount(rs.getDouble("amount"));
                creditNoteModel.setDetails(rs.getString("details"));
                creditNoteModel.setCreditDate(rs.getDate("credit_date"));
            }
        } catch (Exception ex) {
            log.debug(ex.getMessage());
        }

        return creditNoteModel;
    }

    @Override
    public boolean deleteRecord(Object creditNoteNo) {
        boolean isDelete = false;
        try {
            String sql = "update  credit_note  set cre_flag_id=1 where credit_note_no='" + creditNoteNo + "'";
            if (DBConnection.getStatement().executeUpdate(sql) > 0) {
                isDelete = true;
            }
        } catch (Exception ex) {
            log.debug(ex.getMessage());
        }
        return isDelete;
    }

    @Override
    public Object createRecord(Object creditNoteModels) {
        boolean isCreate = false;
        CreditNoteModel creditNoteModel = (CreditNoteModel) creditNoteModels;
        try {
            String sql = "CALL pro_creditnote_dao ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
            java.sql.CallableStatement cs = DBConnection.getConnection().prepareCall(sql);
            cs.setString("creditnoteno", creditNoteModel.getCreditNoteNumber());
            cs.setString("issuedagainst", creditNoteModel.getIssuedAgainst());
            cs.setString("creditopt", creditNoteModel.getCreditOption());
            cs.setDate("creditdate", creditNoteModel.getCreditDate());
            cs.setString("invoiceorbillno", creditNoteModel.getInvoiceOrBillNumber());
            cs.setString("creditname", creditNoteModel.getName());
            cs.setDouble("creditamount", creditNoteModel.getAmount());
            cs.setString("creditdetails", creditNoteModel.getDetails());
            cs.setString("functionality", "save");
            cs.registerOutParameter("status_flag", Types.INTEGER);
            cs.executeUpdate();
            if (cs.getInt("status_flag") == 1) {
                isCreate = true;
            }

        } catch (Exception ex) {

           log.debug(ex.getMessage());
        }
        return isCreate;
    }

    @Override
    public Object updateRecord(Object creditNoteModels) {
        boolean isUpdate = false;
        CreditNoteModel creditNoteModel = (CreditNoteModel) creditNoteModels;
        try {
            String sql = "CALL pro_creditnote_dao ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ? )";
            java.sql.CallableStatement cs = DBConnection.getConnection().prepareCall(sql);
            cs.setString("creditnoteno", creditNoteModel.getCreditNoteNumber());
            cs.setString("issuedagainst", creditNoteModel.getIssuedAgainst());
            cs.setString("creditopt", creditNoteModel.getCreditOption());
            cs.setDate("creditdate", creditNoteModel.getCreditDate());
            cs.setString("invoiceorbillno", creditNoteModel.getInvoiceOrBillNumber());
            cs.setString("creditname", creditNoteModel.getName());
            cs.setDouble("creditamount", creditNoteModel.getAmount());
            cs.setString("creditdetails", creditNoteModel.getDetails());
            cs.setString("functionality", "update");
            cs.registerOutParameter("status_flag", Types.INTEGER);
        cs.executeUpdate();
            if (cs.getInt("status_flag") == 2) {
                isUpdate = true;
            }

        } catch (Exception ex) {
             log.debug(ex.getMessage());
        }
        return isUpdate;
    }

    @Override
    public CreditNoteModel viewRecord(String tableName, String No) {
        CreditNoteModel creditNoteModel = new CreditNoteModel();
        List<CreditNoteModel> creditNoteModelList = new ArrayList<CreditNoteModel>();
        if (tableName.equals("purchase_invoice")) {
            try {
                String query = "";
                if (No != null && !No.equals("") && No.trim().length() > 1) {
                    if (No != null || !No.equals("")) {
                        query = "Select distinct(invoice_no),invoice_date,dist_name,total_amount from purchase_invoice where invoice_no like'" + No + "%' ";
                    } else {
                        query = "Select * from purchase_invoice";
                    }
                    ResultSet rs = DBConnection.getStatement().executeQuery(query);
                    while (rs.next()) {
                        creditNoteModel = new CreditNoteModel();
                        creditNoteModel.setInvoiceOrBillNumber(rs.getString("invoice_no"));
                        creditNoteModel.setCreditDate(rs.getDate("invoice_date"));
                        creditNoteModel.setName(rs.getString("dist_name"));
                        creditNoteModel.setAmount(rs.getDouble("total_amount"));
                        creditNoteModelList.add(creditNoteModel);
                    }
                    creditNoteModel.setCreditModelList(creditNoteModelList);
                }
            } catch (Exception e) {
                 log.debug(e.getMessage());
            }
            return creditNoteModel;
        } else if (tableName.equals("sales_maintain_bill")) {
            try {
                String query = "";
                if (No != null && !No.equals("") && No.trim().length() > 1) {
                    if (No != null || !No.equals("")) {
                        query = "Select bill_no,bill_date,cust_name,total_amount from sales_maintain_bill where bill_no like'" + No + "%' ";
                    } else {
                        query = "Select * from sales_maintain_bill";
                    }
                    ResultSet rs = DBConnection.getStatement().executeQuery(query);
                    while (rs.next()) {
                        creditNoteModel = new CreditNoteModel();
                        creditNoteModel.setInvoiceOrBillNumber(rs.getString("bill_no"));
                        creditNoteModel.setCreditDate(rs.getDate("bill_date"));
                        creditNoteModel.setName(rs.getString("cust_name"));
                        creditNoteModel.setAmount(rs.getDouble("total_amount"));
                        creditNoteModelList.add(creditNoteModel);
                    }
                    creditNoteModel.setCreditModelList(creditNoteModelList);
                }
            } catch (Exception e) {
                log.debug(e.getMessage());
            }
            return creditNoteModel;
        }
        return creditNoteModel;
    }
}
