/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.dao;

import com.vanuston.medeil.implementation.DamageStock;
import com.vanuston.medeil.model.DamageStockModel;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;
import java.sql.ResultSet;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public class DamageStockDAO implements DamageStock {

    static Logger log = Logger.getLogger(StockDAO.class, "com.vanuston.medeil.dao.DamageStockDAO");

    @Override
    public Object createRecord(Object damagestockBeans) {

        DamageStockModel damagestockBean = (DamageStockModel) damagestockBeans;
        DamageStockModel listDamagestock;
        Object flag = false;

        try {


            for (int i = 0; i < damagestockBean.getDamageStock().size(); i++) {
                listDamagestock = (DamageStockModel) damagestockBean.getDamageStock().get(i);

                String sql = "CALL pro_damagestockdao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,@1)";
                java.sql.PreparedStatement stmt;
                stmt = DBConnection.getConnection().prepareStatement(sql);
                stmt.setString(1, damagestockBean.getDamage_stock_date());
              
                stmt.setString(2, damagestockBean.getDamage_invoice_no());
              
                stmt.setString(3, listDamagestock.getDamage_invoice_date());
              
                stmt.setString(4, damagestockBean.getDamage_dist_name());
              
                stmt.setString(5, damagestockBean.getDamage_contact_no());
              
                stmt.setString(6, listDamagestock.getDamage_item_code());
              
                stmt.setString(7, listDamagestock.getDamage_item_name());
              
                stmt.setString(8, listDamagestock.getDamage_batch_no());
              
                stmt.setString(9, listDamagestock.getDamage_mfr_name());
              
                stmt.setString(10, listDamagestock.getDamage_expiry_date());
              
                stmt.setDouble(11, listDamagestock.getDamage_purchased_qty());
              
                stmt.setDouble(12, listDamagestock.getDamage_damaged_qty());
              
//            stmt.setDouble(13, listDamagestock.getStock_margin());
                stmt.setDouble(13, listDamagestock.getDamage_unit_price());
              
                stmt.setDouble(14, listDamagestock.getDamage_unit_vat());
              
                stmt.setDouble(15, listDamagestock.getDamage_unit_discount());
              
                stmt.setDouble(16, listDamagestock.getDamage_sub_total());
              
                stmt.setDouble(17, listDamagestock.getDamage_total_amount());
              
                if (listDamagestock.getDamage_remarks() == "" || listDamagestock.getDamage_remarks().equals(null)) {
                    stmt.setString(18, "");
                } else {
                    stmt.setString(18, listDamagestock.getDamage_remarks());
                }
                stmt.setString(19, "save");
                stmt.executeUpdate();
                flag = true;
            }
        } catch (Exception e) {
          log.debug(e.getMessage());
            flag = false;
        }
        return flag;
    }

    @Override
    public Object viewRecord(Object damagestockBeans) {
        DamageStockModel damagestockBean = (DamageStockModel) damagestockBeans;
        //Object flag = false;
        Object damagestockReturn = null;
        String dqty = "0";
        Boolean s = true;


        if (damagestockBean.getDamage_mfr_name() == "checkExistsfromstkedit" || damagestockBean.getDamage_mfr_name().equals("checkExistsfromstkedit")) {
            try {
                ResultSet rs = null;
                String query1 = "select exists(select * from damage_stocks) as 'check' from dual";
                rs = DBConnection.getStatement().executeQuery(query1);
                while (rs.next()) {
                    s = rs.getBoolean("check");

                    damagestockBean.setDamage_mfr_name(rs.getString("check"));
                }
            } catch (Exception ex) {
                String msg = "Class : viewRecord  Method  : checkDamgeItemExists   = " + ex.getMessage();
                log.debug(msg);
            }
            damagestockReturn = s;
        } else if (damagestockBean.getDamage_mfr_name() == "checkDamgeItemExists" || damagestockBean.getDamage_mfr_name().equals("checkDamgeItemExists")) {
            try {
                ResultSet rs = null;
                String query1 = "select * from damage_stocks d,purchase_invoice p where p.invoice_no='" + damagestockBean.getDamage_invoice_no() + "' and d.invoice_no='" + damagestockBean.getDamage_invoice_no() + "'";
                rs = DBConnection.getStatement().executeQuery(query1);
                while (rs.next()) {
                    if (damagestockBean.getDamage_item_name() == null && damagestockBean.getDamage_invoice_no() == null) {
                        s = true;
                    } else {
                        s = false;
                    }
                }
            } catch (Exception ex) {
                String msg = "Class : viewRecord  Method  : checkDamgeItemExists   = " + ex.getMessage();
                log.debug(msg);
            }
            damagestockReturn = s;
        } else if (damagestockBean.getDamage_mfr_name() == "checkExists" || damagestockBean.getDamage_mfr_name().equals("checkExists")) {
            try {

                ResultSet rs = null;
                //String query1 = "select * from damage_stocks d,purchase_invoice p where p.item_name='" + damagestockBean.getDamage_item_name() + "'and p.invoice_no='" + damagestockBean.getDamage_invoice_no() + "' and d.item_name='" + damagestockBean.getDamage_item_name() + "' and d.invoice_no='" + damagestockBean.getDamage_invoice_no() + "'";
                String query1 = "select * from damage_stocks d,purchase_invoice p where p.invoice_no='" + damagestockBean.getDamage_invoice_no() + "' and d.invoice_no='" + damagestockBean.getDamage_invoice_no() + "'";
                //String query1 = "SELECT invoice_no,item_name,batch_no FROM(SELECT invoice_no,item_name,batch_no FROM damage_stocks AS S  UNION ALL SELECT invoice_no,item_name,batch_no FROM purchase_invoice AS D)  AS alias_table GROUP BY  invoice_no,item_name,batch_no HAVING COUNT(*)=1 and invoice_no=invoice_no='" + damagestockBean.getDamage_invoice_no() + "' ORDER BY item_name,batch_no";

                rs = DBConnection.getStatement().executeQuery(query1);
                while (rs.next()) {


                    if (damagestockBean.getDamage_invoice_no()!= "" || !damagestockBean.getDamage_invoice_no().equals("")) {

                        s = true;

                    } else {
                        s = false;

                    }
                }
            } catch (Exception ex) {

                String msg = "Class : viewRecord  Method  : checkExists  = " + ex.getMessage();
                log.debug(msg);
            }
            damagestockReturn = s;
        } else if (!damagestockBean.getDamage_mfr_name().equals("checkExists") || !damagestockBean.getDamage_mfr_name().equals("checkDamgeItemExists") || !damagestockBean.getDamage_mfr_name().equals("checkExistsfromstkedit")) {
            String query1 = "select count(damaged_qty) as damage,damaged_qty from damage_stocks where item_name='" + damagestockBean.getDamage_item_name() + "' and batch_no='" + damagestockBean.getDamage_batch_no() + "' group by item_name";
            try {
                ResultSet rs = DBConnection.getStatement().executeQuery(query1);
                while (rs.next()) {
                    int damage = rs.getInt("damage");
                    if (damage == 0) {
                        dqty = "0";
                    } else {
                        dqty = rs.getString("damaged_qty");
                    }
                }
            } catch (Exception e) {
                String ss = "Class : ViewReocrd Method: for checkitembatch   Exception:" + e.getMessage();
                log.debug(ss);
            }
            damagestockReturn = dqty;

        }
        return damagestockReturn;
    }

    @Override
    public Object updateRecord(Object damagestockBeans) {
        DamageStockModel damagestockBean = (DamageStockModel) damagestockBeans;
        DamageStockModel listDamagestock;
        Object flag = false;


        try {


            for (int i = 0; i < damagestockBean.getDamageStock().size(); i++) {
                listDamagestock = (DamageStockModel) damagestockBean.getDamageStock().get(i);


                String sql = "CALL pro_damagestockdao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,@1)";
                java.sql.PreparedStatement stmt;
                stmt = DBConnection.getConnection().prepareStatement(sql);
                stmt.setString(1, damagestockBean.getDamage_stock_date());
               
                stmt.setString(2, damagestockBean.getDamage_invoice_no());
               
                stmt.setString(3, listDamagestock.getDamage_invoice_date());
               
                stmt.setString(4, damagestockBean.getDamage_dist_name());
               
                stmt.setString(5, damagestockBean.getDamage_contact_no());
               
                stmt.setString(6, listDamagestock.getDamage_item_code());
               
                stmt.setString(7, listDamagestock.getDamage_item_name());

                stmt.setString(8, listDamagestock.getDamage_batch_no());

                stmt.setString(9, listDamagestock.getDamage_mfr_name());

                stmt.setString(10, listDamagestock.getDamage_expiry_date());

                stmt.setDouble(11, listDamagestock.getDamage_purchased_qty());

                stmt.setDouble(12, listDamagestock.getDamage_damaged_qty());

                stmt.setDouble(13, listDamagestock.getDamage_unit_price());

                stmt.setDouble(14, listDamagestock.getDamage_unit_vat());

                stmt.setDouble(15, listDamagestock.getDamage_unit_discount());

                stmt.setDouble(16, listDamagestock.getDamage_sub_total());

                stmt.setDouble(17, listDamagestock.getDamage_total_amount());

                if (listDamagestock.getDamage_remarks().equals("") || listDamagestock.getDamage_remarks() == null) {
                    stmt.setString(18, "");
                } else {
                    stmt.setString(18, listDamagestock.getDamage_remarks());
                }
                stmt.setString(19, "update");
                stmt.executeUpdate();
                flag = true;
            }
        } catch (Exception e) {
         log.debug(e.getMessage());
            flag = false;
        }
        return flag;
    }

    @Override
    public boolean deleteRecord(Object damagestockBeans) {
        DamageStockModel damagestockBean = (DamageStockModel) damagestockBeans;
        boolean flag = false;
        try {
            String sql = "CALL pro_damagestockdao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,@1)";
            java.sql.PreparedStatement stmt;
            stmt = DBConnection.getConnection().prepareStatement(sql);
            stmt.setInt(1, Integer.valueOf(damagestockBean.getDamage_stock_date()));
            stmt.setString(2, damagestockBean.getDamage_invoice_no());
            stmt.setString(3, damagestockBean.getDamage_invoice_date());
            stmt.setString(4, damagestockBean.getDamage_dist_name());
            stmt.setString(5, damagestockBean.getDamage_contact_no());
            stmt.setString(6, damagestockBean.getDamage_item_code());
            stmt.setString(7, damagestockBean.getDamage_item_name());
            stmt.setString(8, damagestockBean.getDamage_batch_no());
            stmt.setString(9, damagestockBean.getDamage_mfr_name());
            stmt.setString(10, damagestockBean.getDamage_expiry_date());
            stmt.setDouble(11, damagestockBean.getDamage_purchased_qty());
            stmt.setDouble(12, damagestockBean.getDamage_damaged_qty());
//            stmt.setDouble(13, damagestockBean.getStock_margin());
            stmt.setDouble(13, damagestockBean.getDamage_unit_price());
            stmt.setDouble(14, damagestockBean.getDamage_unit_vat());
            stmt.setDouble(15, damagestockBean.getDamage_unit_discount());
            stmt.setDouble(16, damagestockBean.getDamage_sub_total());
            stmt.setDouble(17, damagestockBean.getDamage_total_amount());
            stmt.setString(18, damagestockBean.getDamage_remarks());
            stmt.setString(19, "delete");
            stmt.executeUpdate();
            flag = true;
        } catch (Exception e) {
          log.debug(e.getMessage());
            flag = false;
        }
        return flag;
    }

    @Override
    public DamageStockModel viewAllRecord(DamageStockModel damagestockBeans) {
        ArrayList<DamageStockModel> damagestockListBean = new ArrayList();
//        DamageStockModel damagestockBeancheck = (DamageStockModel) damagestockBeans;
        DamageStockModel damagestockBean = (DamageStockModel) damagestockBeans;
        DamageStockModel damagestockAddBean;
       
        if (damagestockBean.getDamage_mfr_name() .equals("getDistNamePhone") || damagestockBean.getDamage_mfr_name() == "getDistNamePhone"  ) {
            try {
       
                ResultSet rs = null;
                if (damagestockBean.getDamage_mfr_name() .equals("") || damagestockBean.getDamage_invoice_no() == "") {
                    rs = DBConnection.getStatement().executeQuery("select distinct(invoice_no),p.dist_name,d.cno1 from purchase_invoice p,stock_statement s,dist_information d"); // where invoice_no= '" + invoiceno + "' order by invoice_no");
                } else {
                    rs = DBConnection.getStatement().executeQuery("select distinct(invoice_no),p.dist_name,d.cno1 from purchase_invoice p,stock_statement s,dist_information d where p.invoice_no='" + damagestockBean.getDamage_invoice_no() + "' and p.dist_name=d.dist_name");
                }
                while (rs.next()) {
                    damagestockBean.setDamage_dist_name(rs.getString("p.dist_name"));
                    damagestockBean.setDamage_contact_no(rs.getString("d.cno1"));
                }
            } catch (Exception ex) {
                String msg = "Class :  viewRecord Method  : getDistNamePhone   = " + ex.getMessage();
                log.debug(msg);
            }
        }

        else if(damagestockBean.getDamage_mfr_name() == "getItemandBatch" || damagestockBean.getDamage_mfr_name() .equals("getItemandBatch")  || damagestockBean.getDamage_mfr_name() == "getEditItemandBatch" || damagestockBean.getDamage_mfr_name() .equals("getEditItemandBatch") || damagestockBean.getDamage_mfr_name() == "getDamagedInvoiceNo" ||  damagestockBean.getDamage_mfr_name() .equals("getDamagedInvoiceNo")) {
            try {

                ResultSet rs = null;
                String query = "";
                if (damagestockBean.getDamage_mfr_name().equals("getItemandBatch") || damagestockBean.getDamage_mfr_name() == "getItemandBatch") {
                    
                  
                    query = "SELECT item_name,batch_no,invoice_no,invoice_date,damaged_qty,qty,unit_vat,unit_discount,unit_price,packing FROM(SELECT item_name,batch_no,invoice_no,invoice_date,damaged_qty,qty,unit_vat,unit_discount,unit_price,packing FROM damage_stocks AS S UNION ALL SELECT item_name,batch_no,invoice_no,invoice_date,qty,qty,unit_vat,unit_discount,unit_price,packing FROM purchase_invoice AS D)  AS alias_table GROUP BY  invoice_no,item_name,batch_no HAVING COUNT(*)=1 and invoice_no='" + damagestockBean.getDamage_invoice_no() + "' ORDER BY item_name,batch_no,qty";
                } else if (damagestockBean.getDamage_mfr_name().equals("getEditItemandBatch") || damagestockBean.getDamage_mfr_name() == "getEditItemandBatch") {
                    query = "select * from damage_stocks where item_name='" + damagestockBean.getDamage_item_name() + "' and invoice_no='" + damagestockBean.getDamage_invoice_no() + "'";
                } else if (damagestockBean.getDamage_mfr_name().equals("getDamagedInvoiceNo") || damagestockBean.getDamage_mfr_name() == "getDamagedInvoiceNo") {

                    query = "select * from damage_stocks where invoice_no='" + damagestockBean.getDamage_invoice_no() + "' order by item_name desc";
                }
             
                rs = DBConnection.getStatement().executeQuery(query);                
                while (rs.next()) {
                    damagestockAddBean = new DamageStockModel();
                    if (damagestockBean.getDamage_mfr_name().equals("getItemandBatch") || damagestockBean.getDamage_mfr_name() == "getItemandBatch") {
                        damagestockAddBean.setDamage_item_name(rs.getString("item_name"));
                        damagestockAddBean.setDamage_batch_no(rs.getString("batch_no"));
                        damagestockAddBean.setDamage_damaged_qty(0);
                        damagestockAddBean.setDamage_purchased_qty(rs.getInt("qty"));                        
                        damagestockAddBean.setDamage_invoice_date(rs.getString("invoice_date"));
                         
                        damagestockAddBean.setDamage_unit_vat(rs.getDouble("unit_vat"));
                        damagestockAddBean.setDamage_unit_discount(rs.getDouble("unit_discount"));

                       damagestockAddBean.setDamage_unit_price(rs.getDouble("unit_price") / rs.getInt("packing"));
                       damagestockAddBean.setDamage_remarks("");                        
                    } else if (damagestockBean.getDamage_mfr_name().equals("getEditItemandBatch") || damagestockBean.getDamage_mfr_name().equals("getDamagedInvoiceNo") || damagestockBean.getDamage_mfr_name() == "getEditItemandBatch" || damagestockBean.getDamage_mfr_name() == "getDamagedInvoiceNo") {

                        {

                            damagestockAddBean.setDamage_damaged_qty(rs.getInt("damaged_qty"));
                            damagestockAddBean.setDamage_item_name(rs.getString("item_name"));

                            damagestockAddBean.setDamage_batch_no(rs.getString("batch_no"));
                            damagestockAddBean.setDamage_invoice_date(rs.getString("invoice_date"));

                            damagestockAddBean.setDamage_purchased_qty(rs.getInt("qty"));
                            damagestockAddBean.setDamage_damaged_qty(rs.getInt("damaged_qty"));
                            damagestockAddBean.setDamage_unit_vat(rs.getDouble("unit_vat"));
                            damagestockAddBean.setDamage_unit_discount(rs.getDouble("unit_discount"));
                            damagestockAddBean.setDamage_unit_price(rs.getDouble("unit_price"));
                            damagestockAddBean.setDamage_total_amount(rs.getDouble("sub_total"));
                            damagestockAddBean.setDamage_remarks(rs.getString("remarks"));
                            damagestockAddBean.setDamage_dist_name(rs.getString("dist_name"));
                            damagestockAddBean.setDamage_contact_no(rs.getString("contact_no"));

                        }
                    }
                    damagestockListBean.add(damagestockAddBean);
                }
                damagestockBean.setDamageStock(damagestockListBean);
            } catch (Exception e) {
               log.debug(e.getMessage());
            }

        }

       
        return damagestockBean;
    }
}
