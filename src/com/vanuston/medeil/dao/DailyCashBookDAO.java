/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.dao;

import com.vanuston.medeil.implementation.DailyCashBook;
import com.vanuston.medeil.model.DailyCashBookModel;

import java.sql.CallableStatement;
import java.sql.ResultSet;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;
import java.sql.Types;

/**
 *
 * @author Administrator
 */
public class DailyCashBookDAO implements DailyCashBook {

    static Logger log = Logger.getLogger(CommonDAO.class, "com.vanuston.medeil.dao.DailyCashBookDAO");

    @Override
    public Object createRecord(Object dailycashbookBeans) {
        //drugBean=new DrugModel();
        DailyCashBookModel dailycashbookBean = (DailyCashBookModel) dailycashbookBeans;
        boolean flag = false;
        try {
            String sql = "CALL pro_updatedaybook(?,?,?,"
                    + "?,?,?,?,?,?,?,?,?,?,?,?,?,?,"
                    + "?,?,?)";
            CallableStatement stmt = DBConnection.getConnection().prepareCall(sql);
            stmt.setString(1, dailycashbookBean.getDailyCashBookDate());
            stmt.setDouble(2, dailycashbookBean.getOpenCashBalance());
            stmt.setDouble(3, dailycashbookBean.getCloseCashBalance());
            stmt.setDouble(4, dailycashbookBean.getDebitSales());
            stmt.setDouble(5, dailycashbookBean.getDebitReceipts());
            stmt.setDouble(6, dailycashbookBean.getCashIntroduced());
            stmt.setDouble(7, dailycashbookBean.getCashWithdrawal());
            stmt.setDouble(8, dailycashbookBean.getCreditPayments());
            stmt.setDouble(9, dailycashbookBean.getCreditMaintain());
            stmt.setString(10, dailycashbookBean.getExpenses1());
            stmt.setString(11, dailycashbookBean.getExpenses2());
            stmt.setString(12, dailycashbookBean.getExpenses3());
            stmt.setString(13, dailycashbookBean.getExpenses4());
            stmt.setDouble(14, dailycashbookBean.getOtherExpenses1());
            stmt.setDouble(15, dailycashbookBean.getOtherExpenses2());
            stmt.setDouble(16, dailycashbookBean.getOtherExpenses3());
            stmt.setDouble(17, dailycashbookBean.getOtherExpenses4());
            stmt.setDouble(18, dailycashbookBean.getTotalDebit());
            stmt.setDouble(19, dailycashbookBean.getTotalCredit());
            stmt.registerOutParameter(20, Types.INTEGER);
            stmt.executeUpdate();
            if (stmt.getInt(20) == 1) {
                flag = true;
            }
        } catch (Exception e) {
            flag = false;
            log.debug("class: DailyCashBook Method =Create Record " + e.getMessage());
        }
        return flag;
    }

    @Override
    public Object viewRecord(Object dailycashbookBeans) {
        DailyCashBookModel dailycashbookBean = (DailyCashBookModel) dailycashbookBeans;
        int cnt = 0;
        int cont = 0;
        try {
            ResultSet rs = null;
            String sql = "SELECT count(*) from dailycashbook";
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                cnt = rs.getInt("count(*)");
            }
            String sql3 = "SELECT count(*) from dailycashbook where dsb_date='" + dailycashbookBean.getDailyCashBookDate() + "'";
            rs = DBConnection.getStatement().executeQuery(sql3);
            while (rs.next()) {
                cont = rs.getInt("count(*)");
            }
            if (cont == 0) {
                String sql1 = "call pro_cashflow('" + dailycashbookBean.getDailyCashBookDate() + "','" + dailycashbookBean.getDailyCashBookDate() + "',@1)";
                DBConnection.getStatement().executeQuery(sql1);
            }
            String sql2 = "call pro_dailycashbook('" + dailycashbookBean.getDailyCashBookDate() + "',@1)";
            rs = DBConnection.getStatement().executeQuery(sql2);
            while (rs.next()) {
                dailycashbookBean.setOpenCashBalance(rs.getDouble("opening_balance"));
                dailycashbookBean.setCloseCashBalance(rs.getDouble("closing_balance"));
                dailycashbookBean.setDebitSales(rs.getDouble("smcash1"));
                dailycashbookBean.setDebitReceipts(rs.getDouble("receipt1"));
                dailycashbookBean.setCreditPayments(rs.getDouble("payment1"));
                if (cnt > 0) {
                    dailycashbookBean.setCashIntroduced(rs.getDouble(("cashintroduced")));
                    dailycashbookBean.setCashWithdrawal(rs.getDouble("cashwithdrawal"));
                    dailycashbookBean.setCreditMaintain(rs.getDouble("shopmcost1"));
                    dailycashbookBean.setExpenses1(rs.getString("expenses1"));
                    dailycashbookBean.setExpenses2(rs.getString("expenses2"));
                    dailycashbookBean.setExpenses3(rs.getString("expenses3"));
                    dailycashbookBean.setExpenses4(rs.getString("expenses4"));
                    dailycashbookBean.setOtherExpenses1(rs.getDouble("other_expenses1"));
                    dailycashbookBean.setOtherExpenses2(rs.getDouble("other_expenses2"));
                    dailycashbookBean.setOtherExpenses3(rs.getDouble("other_expenses3"));
                    dailycashbookBean.setOtherExpenses4(rs.getDouble("other_expenses4"));
                    dailycashbookBean.setTotalDebit(rs.getDouble("total_debit"));
                    dailycashbookBean.setTotalCredit(rs.getDouble("total_credit"));
                } else {
                    dailycashbookBean.setCashIntroduced(Double.valueOf("0.00"));
                    dailycashbookBean.setCashWithdrawal(Double.valueOf("0.00"));
                    dailycashbookBean.setCreditMaintain(Double.valueOf("0.00"));
                    dailycashbookBean.setExpenses1("");
                    dailycashbookBean.setExpenses2("");
                    dailycashbookBean.setExpenses3("");
                    dailycashbookBean.setExpenses4("");
                    dailycashbookBean.setOtherExpenses1(Double.valueOf("0.00"));
                    dailycashbookBean.setOtherExpenses2(Double.valueOf("0.00"));
                    dailycashbookBean.setOtherExpenses3(Double.valueOf("0.00"));
                    dailycashbookBean.setOtherExpenses4(Double.valueOf("0.00"));
                    dailycashbookBean.setTotalDebit(Double.valueOf("0.00"));
                    dailycashbookBean.setTotalCredit(Double.valueOf("0.00"));
                }
            }
        } catch (Exception e) {
            log.debug("class: DailyCashBook Method =View Record " + e.getMessage());
        }
        return dailycashbookBean;
        //throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean deleteRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Object updateRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
