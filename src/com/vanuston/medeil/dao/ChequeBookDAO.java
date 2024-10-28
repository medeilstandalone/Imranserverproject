/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.dao;

import java.sql.CallableStatement;
import com.vanuston.medeil.implementation.ChequeBook;
import com.vanuston.medeil.model.ChequeBookModel;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Logger;
import java.sql.ResultSet;
import java.sql.Types;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class ChequeBookDAO implements ChequeBook {

    static Logger log = Logger.getLogger(ChequeBookDAO.class, "com.vanuston.medeil.dao.ChequeBookDAO");

    @Override
    public Object viewRecord(Object object) {

        ChequeBookModel chqModel = (ChequeBookModel) object;
        String query = "";
        if (chqModel.getStatus().equals("")) {
            query = "select cheque_no,cheque_status,chq_flag_id from chequeno_list where book_name='" + chqModel.getBookID() + "' and account_no='" + chqModel.getAccountNumber() + "' and cheque_status!='' order by cheque_no";
        } else {
            query = "select cheque_no,cheque_status,chq_flag_id from chequeno_list where book_name='" + chqModel.getBookID() + "' and account_no='" + chqModel.getAccountNumber() + "'and cheque_status='" + chqModel.getStatus() + "' order by cheque_no";
        }
        List<ChequeBookModel> listvalues = new ArrayList<ChequeBookModel>();
        ChequeBookModel listModel;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                listModel = new ChequeBookModel();
                listModel.setChequeNo(rs.getString("cheque_no"));
                query = "select cast(date(issued_date) as CHAR(14)) as issueddate,issued_to,Amount from cheque_transaction where acc_no='" + chqModel.getAccountNumber() + "' and chq_no='" + listModel.getChequeNo() + "'";
                ResultSet rs1 = DBConnection.getStatement().executeQuery(query);
                while (rs1.next()) {
                    listModel.setIssuedDate(rs1.getString("issueddate"));
                    listModel.setRemaining(rs1.getString("issued_to"));
                    listModel.setChequeAmount(rs1.getString("Amount"));
                }
                listModel.setStatus(rs.getString("cheque_status"));
                listvalues.add(listModel);
            }


        } catch (Exception e) {

            log.debug("Class: ChequeBookDAO  Method: viewRecord()  = " + e.getMessage());

        }
        return listvalues;

    }

    @Override
    public boolean deleteRecord(Object object) {
        Boolean delete = false;

        try {
            ChequeBookModel bankBookModel = (ChequeBookModel) object;
            DBConnection.getStatement().executeUpdate("UPDATE cheque_book set flag_id=1 where acc_no='" + bankBookModel.getAccountNumber() + "' and book_id='" + bankBookModel.getBookID() + "' and flag_id=0");
            createRecord(bankBookModel);

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
        ChequeBookModel chequeBookModel = (ChequeBookModel) object;

        try {
            //      var query = "INSERT INTO cheque_book (book_id,acc_no,leaves,issued_date,start_no,end_no,status,remarks,flag_id) ""VALUES('{book_id}','{ac_no}',{leaves},'{date}','{start}','{end}',0,'{remarks}',0)";
            CallableStatement bankbookCall = DBConnection.getConnection().prepareCall("{call pro_chequeinsert(?, ?, ?, ?, ?, ?, ?, ?, ?)}");
            bankbookCall.setString(1, chequeBookModel.getBookID());
            bankbookCall.setString(2, chequeBookModel.getAccountNumber());
            bankbookCall.setString(3, chequeBookModel.getLeaves());
            bankbookCall.setString(4, chequeBookModel.getIssuedDate());
            bankbookCall.setString(5, chequeBookModel.getStartNumber());
            bankbookCall.setString(6, chequeBookModel.getEndNumber());
            bankbookCall.setString(7, chequeBookModel.getRemarks());
            bankbookCall.setString(8, chequeBookModel.getSaveType());
            bankbookCall.registerOutParameter(9, Types.INTEGER);
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
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public ChequeBookModel getChqUsed(ChequeBookModel chqBookModel) {
        int rows = 0;
        ChequeBookModel chequeBookModel = chqBookModel;
        try {
            String qry = "select * from chequeno_list where book_name='" + chqBookModel.getBookID() + "' and account_no='" + chqBookModel.getAccountNumber() + "' and chq_flag_id=1";

            ResultSet rs = DBConnection.getStatement().executeQuery(qry);
            while (rs.next()) {
                rows++;
            }


            chequeBookModel.setRecordCount(rows);
        } catch (Exception e) {
            String ss = " Class : ChequeBookDAO  Method   : getChqUsed Exception :" + e.getMessage();
            log.debug(ss);
        }

        return chequeBookModel;

    }

    @Override
    public List<String> getChequeBookIDList(String accountNo) {

        List<String> chequeBokIdList = new ArrayList<String>();
        chequeBokIdList.add("-- Select --");
        try {
            String qry = "select book_id  from cheque_book where acc_no='" + accountNo + "' and status=0 and flag_id=0 ORDER BY book_id ";
            ResultSet rs = DBConnection.getStatement().executeQuery(qry);
            while (rs.next()) {
                chequeBokIdList.add(rs.getString("book_id"));
            }

        } catch (Exception e) {
            String ss = " Class : ChequeBookDAO  Method   : getChequeBookIDList() Exception :" + e.getMessage();
            log.debug(ss);
        }

        return chequeBokIdList;
    }

    @Override
    public HashMap<String,String> getStatus(String acc_no, String id) {
        HashMap<String,String> details = new HashMap<String,String>();
        try {
            details.put("Cleared", getChqInfo("Cleared", acc_no, id));
            details.put("Returned", getChqInfo("Returned", acc_no, id));
            details.put("Stopped Payment", getChqInfo("Stopped Payment", acc_no, id));
            details.put("Lost", getChqInfo("Lost", acc_no, id));
            details.put("In progress", getChqInfo("In progress", acc_no, id));
            details.put("Cancelled", getChqInfo("Cancelled", acc_no, id));
            details.put("Misused", getChqInfo("Misused", acc_no, id));
        } catch (Exception e) {
            log.debug("Class: ChequeBookDAO  Method: getStatus()  = " + e.getMessage());
        }
        return details;
    }

    public String getChqInfo(String param, String ac_no, String bid) {
        int rows = 0;
        try {
            String qry = "select * from chequeno_list where book_name='" + bid + "' and account_no='" + ac_no + "' and cheque_status='" + param + "'";
            ResultSet rs = DBConnection.getStatement().executeQuery(qry);
            while (rs.next()) {
                rows++;
            }
        } catch (Exception e) {
            log.debug("Class: ChequeBookDAO  Method: getChqInfo()  = " + e.getMessage());
        }
        return "" + rows + "".trim();
    }

    @Override
    public HashMap<String,String> getDetails(String acc_no, String id) {
        HashMap<String,String>  details = new HashMap<String,String> ();
        System.out.println("getChequeDetails");
        try {
            String qry = "select leaves,cast(date(issued_date) as CHAR(14)) as issuedate,start_no,end_no,remarks  from cheque_book where acc_no='" + acc_no + "' and book_id='" + id + "'  ORDER BY book_id ";

            ResultSet rs = DBConnection.getStatement().executeQuery(qry);
            while (rs.next()) {
                details.put("start_no", rs.getString("start_no"));
                details.put("end_no", rs.getString("end_no"));
                details.put("leaves", rs.getString("leaves"));
                details.put("issued_date", rs.getString("issuedate"));
                details.put("remarks", rs.getString("remarks"));
            }
        } catch (Exception e) {
            log.debug("Class: ChequeBookDAO  Method: getChequeDetails()  = " + e.getMessage());
        }
        return details;
    }

    @Override
    public Integer getChequeBookValid(String acc_no, String id) {
        int cnt = 0;
        try {
            String qry = "select count(*)as cnt from cheque_book where acc_no='" + acc_no + "' and book_id='" + id + "'";
            ResultSet rs = DBConnection.getStatement().executeQuery(qry);
            while (rs.next()) {
                cnt = rs.getInt("cnt");
            }
        } catch (Exception e) {
            log.debug("Class: ChequeBookDAO  Method: getChequeDetails()  = " + e.getMessage());
        }
        return cnt;
    }

    @Override
    public List<ChequeBookModel> loadChequeTableValues() {

        List<ChequeBookModel> listvalues = new ArrayList<ChequeBookModel>();
        ChequeBookModel listModel;
        try {

            String query = "select book_id,acc_no,leaves,cast(date(issued_date) as CHAR(14)) as issuedate,start_no,end_no,status,remarks,status from cheque_book where flag_id=0 order by acc_no,book_id,issued_date desc";

            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                listModel = new ChequeBookModel();
                listModel.setAccountNumber(rs.getString("acc_no"));
                listModel.setBookID(rs.getString("book_id"));
                listModel = getChqUsed(listModel);
                listModel.setLeaves(rs.getString("leaves"));
                String dt = rs.getString("issuedate");
                listModel.setIssuedDate(rs.getString("issuedate"));
                String remaining = "" + (Integer.parseInt(listModel.getLeaves()) - listModel.getRecordCount());
                listModel.setRemaining(remaining);
                if (dt.trim().length() > 0) {
                    if (dt.substring(0, 4).equals("0000")) {
                        listModel.setIssuedDate("");
                    } else {
                        listModel.setIssuedDate(DateUtils.normalFormatDate(rs.getString("issuedate")));
                    }
                } else {
                    listModel.setIssuedDate("");
                }
                listModel.setStartNumber(rs.getString("start_no"));
                listModel.setEndNumber(rs.getString("end_no"));

                if (rs.getInt("status") == 0) {
                    listModel.setStatus("Available");
                } else {
                    listModel.setStatus("Completed");
                }
                listvalues.add(listModel);
            }


        } catch (Exception e) {

            log.debug("Class: ChequeBookDAO  Method: getChequeDetails()  = " + e.getMessage());

        }
        return listvalues;
    }
}
