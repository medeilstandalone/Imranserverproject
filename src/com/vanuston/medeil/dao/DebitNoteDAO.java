/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.dao;

import com.vanuston.medeil.implementation.DebitNote;
import com.vanuston.medeil.model.DebitNoteModel;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

/**
 *
 * @author Administrator
 */
public class DebitNoteDAO implements DebitNote {

    static Logger log = Logger.getLogger(PaymentDAO.class, "com.vanuston.medeil.dao.DebitNoteDAO");

    @Override
    public Object viewRecord(Object NoteNo) {

        DebitNoteModel debitNoteModel = new DebitNoteModel();
        try {
            String sql = "select * from debit_note where debit_note_no = '" + NoteNo + "'";

            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                debitNoteModel.setIssuedAgainst(rs.getString("issued_against"));
                debitNoteModel.setDebitOption(rs.getString("debit_opt"));
                debitNoteModel.setDebitDate((rs.getDate("debit_date")));
                debitNoteModel.setInvoiceOrBillNumber(rs.getString("invoiceorbill_no"));
                debitNoteModel.setName(rs.getString("name"));
                debitNoteModel.setAmount(rs.getDouble("amount"));
                debitNoteModel.setDetails(rs.getString("details"));
            }
        } catch (SQLException ex) {
            log.debug(ex.getMessage());
        }
        return debitNoteModel;
    }

    @Override
    public boolean deleteRecord(Object NoteNo) {
        boolean isDelete = false;
        try {
            if (DBConnection.getStatement().executeUpdate("update debit_note set dn_flag_id = '1' where debit_note_no ='" + NoteNo + "'") > 0) {
                isDelete = true;
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return isDelete;
    }

    @Override
    public Object createRecord(Object debitNoteModels) {
        boolean isCreate = false;
        DebitNoteModel debitNoteModel = (DebitNoteModel) debitNoteModels;
        try {
            String sql = "CALL pro_debitnote_dao (?, ?, ?, ?, ?, ?, ?, ?, ?, ?);";
            java.sql.CallableStatement cs = DBConnection.getConnection().prepareCall(sql);
            cs.setString("debitnoteno", debitNoteModel.getDebitNoteNumber());
            cs.setString("issuedagainst", debitNoteModel.getIssuedAgainst());
            cs.setString("debitopt", debitNoteModel.getDebitOption());
            cs.setDate("debitdate", debitNoteModel.getDebitDate());
            cs.setString("invoiceorbillno", debitNoteModel.getInvoiceOrBillNumber());
            cs.setString("debitname", debitNoteModel.getName());
            cs.setDouble("debitamount", debitNoteModel.getAmount());
            cs.setString("debitdetails", debitNoteModel.getDetails());
            cs.setString("functionality", "save");
            cs.registerOutParameter("status_flag", Types.INTEGER);
            cs.executeUpdate();
            if (cs.getInt("status_flag") == 1) {
                isCreate = true;
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return isCreate;
    }

    @Override
    public Object updateRecord(Object debitNoteModels) {
        boolean isUpdate = false;
        DebitNoteModel debitNoteModel = (DebitNoteModel) debitNoteModels;
        try {
            String sql = "CALL pro_debitnote_dao ( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?) ;";
            java.sql.CallableStatement cs = DBConnection.getConnection().prepareCall(sql);
            cs.setString("debitnoteno", debitNoteModel.getDebitNoteNumber());
            cs.setString("issuedagainst", debitNoteModel.getIssuedAgainst());
            cs.setString("debitopt", debitNoteModel.getDebitOption());
            cs.setDate("debitdate", debitNoteModel.getDebitDate());
            cs.setString("invoiceorbillno", debitNoteModel.getInvoiceOrBillNumber());
            cs.setString("debitname", debitNoteModel.getName());
            cs.setDouble("debitamount", debitNoteModel.getAmount());
            cs.setString("debitdetails", debitNoteModel.getDetails());
            cs.setString("functionality", "update");
            cs.registerOutParameter("status_flag", Types.INTEGER);
            cs.executeUpdate();
            if (cs.getInt("status_flag") == 2) {
                isUpdate = true;
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
        }
        return isUpdate;
    }
}
