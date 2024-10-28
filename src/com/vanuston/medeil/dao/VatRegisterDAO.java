/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.dao;

import com.vanuston.medeil.implementation.VatRegister;
import com.vanuston.medeil.model.DamageStockModel;
import com.vanuston.medeil.model.VatRegisterModel;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.Value;
import java.rmi.RemoteException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class VatRegisterDAO implements VatRegister {

    Logger log = Logger.getLogger(VatRegisterDAO.class, "com.vanuston.medeil.dao.VatRegisterDAO");

    @Override
    public Object viewRecord(Object vatregisterBeans) {
        boolean vatregisterReturn = false;
        VatRegisterModel vatregisterBean = (VatRegisterModel) vatregisterBeans;
        try {
            ResultSet rs = null;
            String query1 = "CALL pro_createvatwise('" + vatregisterBean.getInvoicefromdate() + "','" + vatregisterBean.getInvoicetodate() + "','" + vatregisterBean.getVattype() + "'," + vatregisterBean.getVatpercent() + ",'" + vatregisterBean.getVatmode() + "') ";
            //String query1 = "CALL pro_createvatwise('" + vatregisterBean.getInvoicefromdate() + "','" + vatregisterBean.getInvoicetodate() + "','" + vatregisterBean.getVatmode() + "') ";
            rs = DBConnection.getStatement().executeQuery(query1);
            
            while (rs.next()) {
                if (rs.getString("unit_vat") == "") {
                    vatregisterReturn = false;
                } else {
                    //vatregisterReturn=vatregisterBean.setCustomerName(rs.getString("cust_name"));
                    vatregisterReturn = true;
                }
            }
        } catch (Exception ex) {
            String msg = "Class : viewRecord  Method  : checkDamgeItemExists   = " + ex.getMessage();
            log.debug(msg);
        }
        return vatregisterReturn;
    }

    @Override
    public boolean deleteRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Object createRecord(Object vatregisterBeans) {
        VatRegisterModel vatregisterBean = (VatRegisterModel) vatregisterBeans;
        Object flag = false;
        try {
            if (vatregisterBean.getVattype() == "salesvat") {
                String sql = "CALL pro_createvattables(?,?,?,?,?,?,?,?,?,?,?,?,?,@1)";
                java.sql.PreparedStatement stmt;
                stmt = DBConnection.getConnection().prepareStatement(sql);
                stmt.setString(1, vatregisterBean.getCustomerName());
                stmt.setString(2, "");
                stmt.setString(3, "");
                stmt.setString(4, vatregisterBean.getInvoiceNumber());
                stmt.setString(5, vatregisterBean.getInvoiceDate());
                stmt.setString(6, vatregisterBean.getProductName());
                stmt.setString(7, vatregisterBean.getVat());
                stmt.setInt(8, vatregisterBean.getQty());
                stmt.setDouble(9, vatregisterBean.getSalesAmount());
                stmt.setDouble(10, vatregisterBean.getVatAmount());
                stmt.setDouble(11, vatregisterBean.getTotalAmount());
                stmt.setDouble(12, 0.00);
                stmt.setString(13, "sales");
                stmt.executeUpdate();
                flag = true;
            } else if (vatregisterBean.getVattype() == "purchasevat") {
                String sql = "CALL pro_createvattables(?,?,?,?,?,?,?,?,?,?,?,?,?,@1)";
                java.sql.PreparedStatement stmt;
                stmt = DBConnection.getConnection().prepareStatement(sql);
                stmt.setString(1, "");
                stmt.setString(2, vatregisterBean.getDistname());
                stmt.setString(3, vatregisterBean.getTinNumber());
                stmt.setString(4, vatregisterBean.getInvoiceNumber());
                stmt.setString(5, vatregisterBean.getInvoiceDate());
                stmt.setString(6, vatregisterBean.getProductName());
                stmt.setString(7, vatregisterBean.getVat());
                stmt.setInt(8, vatregisterBean.getQty());
                stmt.setDouble(9, vatregisterBean.getTotalAmount());
                stmt.setDouble(10, vatregisterBean.getVatAmount());
                stmt.setDouble(11, vatregisterBean.getSalesAmount());
                stmt.setDouble(12, vatregisterBean.getNetVatAmount());
                stmt.setString(13, "purchase");
                stmt.executeUpdate();
                flag = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
        }
        return flag;
    }

    @Override
    public Object updateRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public VatRegisterModel viewAllRecord(Object vatregisterBeans) {
        ArrayList<VatRegisterModel> vatregisterListBean = new ArrayList();
        VatRegisterModel vatregisterBean = (VatRegisterModel) vatregisterBeans;
        VatRegisterModel vatregisterAddBean; //=new VatRegisterModel();
        //String[][] s = null;
        try {
            ResultSet rs = null;
            String query = "CALL pro_createvatwise('" + vatregisterBean.getInvoicefromdate() + "','" + vatregisterBean.getInvoicetodate() + "','" + vatregisterBean.getVattype() + "'," + vatregisterBean.getVatpercent() + ",'" + vatregisterBean.getVatmode() + "') ";
            System.out.println("query:"+query);
            
            rs = DBConnection.getStatement().executeQuery(query);
            rs.last();
            int getRow = rs.getRow();
            rs.beforeFirst();
            if (getRow != 0) {
                {
                    
                    while (rs.next()) {
                        {
                            vatregisterAddBean = new VatRegisterModel();
                            vatregisterBean = (VatRegisterModel) vatregisterBeans;
                            if (vatregisterBean.getVatmode().equals("SalesVAT") || vatregisterBean.getVatmode() == "SalesVAT") {                                
                                vatregisterAddBean.setCustomerName(rs.getString("cust_name"));                                
                                vatregisterAddBean.setInvoiceNumber(rs.getString("bill_no"));
                                vatregisterAddBean.setInvoiceDate(rs.getString("bill_date"));
                                vatregisterAddBean.setProductName(rs.getString("item_name"));
                                vatregisterAddBean.setVat(rs.getString("unit_vat"));
                                vatregisterAddBean.setQty(rs.getInt("qty"));
                                vatregisterAddBean.setSalesAmount(rs.getDouble("sub_total"));
                                vatregisterAddBean.setVatAmount(rs.getDouble("vat_amt"));
                                vatregisterListBean.add(vatregisterAddBean);
                            } else if (vatregisterBean.getVatmode().equals("PurchaseVAT") || vatregisterBean.getVatmode() == "PurchaseVAT") {                                
                                vatregisterAddBean.setDistname(rs.getString("dist_name"));
                                vatregisterAddBean.setTinNumber(rs.getString("tin_no"));
                                vatregisterAddBean.setInvoiceNumber(rs.getString("invoice_no"));
                                vatregisterAddBean.setInvoiceDate(rs.getString("invoice_date"));
                                vatregisterAddBean.setProductName(rs.getString("item_name"));
                                vatregisterAddBean.setQty(rs.getInt("qty"));
                                vatregisterAddBean.setTotalAmount(rs.getDouble("total_amount"));
                                vatregisterAddBean.setVat(rs.getString("unit_vat"));
                                vatregisterAddBean.setVatAmount(rs.getDouble("total_vat"));                                
                                if(rs.getInt("vat_calc_flag")==0){
                                vatregisterAddBean.setVatAmount(rs.getDouble("total_vat"));
                                }
                                else {
                                double mrp=rs.getDouble("mrp");
                                int qty=rs.getInt("qty");
                                int freeQty = rs.getInt("free");
                                double unitvat = rs.getDouble("unit_vat");
                                double total_amount=(qty+freeQty)*(mrp-(mrp/(1+unitvat/100)));
                                vatregisterAddBean.setVatAmount(total_amount);
                                }
                                vatregisterListBean.add(vatregisterAddBean);                                
                            }
                            //vatregisterListBean.add(vatregisterAddBean);
                        }
                        //j++;

                    }
                    vatregisterBean.setVatreport(vatregisterListBean);
                }
            } else {                
                vatregisterAddBean = new VatRegisterModel();
                vatregisterBean = (VatRegisterModel) vatregisterBeans;
                if (vatregisterBean.getVatmode().equals("SalesVAT") ) {
                    vatregisterAddBean.setCustomerName("");                    
                    vatregisterListBean.add(vatregisterAddBean);
                } else if (vatregisterBean.getVatmode().equals("PurchaseVAT")) {
                    vatregisterAddBean.setDistname("");
                    vatregisterListBean.add(vatregisterAddBean);
                }
                vatregisterBean.setVatreport(vatregisterListBean);
            }

        } catch (Exception ex) {
            String msg = "Class : VatRegisterDAO  Method  : viewAllRecord()   = " + ex.getMessage();
            //ex.printStackTrace();
            log.debug(msg);
        }
        return vatregisterBean;
    }

    @Override
    public boolean insertSalesVat(List<VatRegisterModel> list) throws RemoteException {
        VatRegisterModel vatregisterBean; // = new VatRegisterModel();
        try {
            String sql = "CALL pro_createvattables(?,?,?,?,?,?,?,?,?,?,?,?,?,@1)";
            java.sql.PreparedStatement stmt;
            stmt = DBConnection.getConnection().prepareStatement(sql);
            for (int i = 0; i < list.size(); i++) {
                vatregisterBean = new VatRegisterModel();
                vatregisterBean = list.get(i);
                if (vatregisterBean.getVattype().equalsIgnoreCase("salesvat")) {
                    stmt.setString(1, vatregisterBean.getCustomerName());
                    stmt.setString(2, "");
                    stmt.setString(3, "");
                    stmt.setString(4, vatregisterBean.getInvoiceNumber());
                    stmt.setString(5, vatregisterBean.getInvoiceDate());
                    stmt.setString(6, vatregisterBean.getProductName());
                    stmt.setString(7, vatregisterBean.getVat());
                    stmt.setInt(8, vatregisterBean.getQty());
                    stmt.setDouble(9, vatregisterBean.getSalesAmount());
                    stmt.setDouble(10, vatregisterBean.getVatAmount());
                    stmt.setDouble(11, vatregisterBean.getTotalAmount());
                    stmt.setDouble(12, 0.00);
                    stmt.setString(13, "sales");
                    stmt.executeUpdate();
                    //flag = true;
                }else if (vatregisterBean.getVattype().equalsIgnoreCase("purchasevat")) {

                stmt.setString(1, "");
                stmt.setString(2, vatregisterBean.getDistname());
                stmt.setString(3, vatregisterBean.getTinNumber());
                stmt.setString(4, vatregisterBean.getInvoiceNumber());
                stmt.setString(5, vatregisterBean.getInvoiceDate());
                stmt.setString(6, vatregisterBean.getProductName());
                stmt.setString(7, vatregisterBean.getVat());
                stmt.setInt(8, vatregisterBean.getQty());
                stmt.setDouble(9, vatregisterBean.getTotalAmount());
                stmt.setDouble(10, vatregisterBean.getVatAmount());
                stmt.setDouble(11, vatregisterBean.getSalesAmount());
                stmt.setDouble(12, vatregisterBean.getNetVatAmount());
                stmt.setString(13, "purchase");
                stmt.executeUpdate();
                //flag = true;
            }
            }

        } catch (Exception e) {
            e.printStackTrace();


        }
        return false;

    }
}
