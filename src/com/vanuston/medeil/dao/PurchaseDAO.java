/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.dao;

import com.vanuston.medeil.implementation.Purchase;
import com.vanuston.medeil.model.PurchaseModel;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Logger;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;
import java.sql.*;

/**
 *
 * @author Administrator
 */
public class PurchaseDAO implements Purchase {

    static Logger log = Logger.getLogger(PurchaseDAO.class, "PurchaseDAO");

    @Override
    public Object viewRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean deleteRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    //Save Purchase. Insert in purchase invoice and purchase maintenance tables
    @Override
    public Object createRecord(Object object) {
        Boolean isCreate = false;
        int returnFlag = 0;
        PurchaseModel purchaseModel = (PurchaseModel) object;
        List<PurchaseModel> list = purchaseModel.getListofitems();
        try {
            try {
            for (int index = 0; index < list.size(); index++) {
                PurchaseModel iterateModel = list.get(index);
                CallableStatement purcInvCall = DBConnection.getConnection().prepareCall("{call pro_purchaseInvoice_m( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
                purcInvCall.setString(1, purchaseModel.getPurcBillno());
                purcInvCall.setString(2, purchaseModel.getInvoiceNo());
                purcInvCall.setString(3, purchaseModel.getInvDate());
                purcInvCall.setString(4, purchaseModel.getDistCode());
                purcInvCall.setString(5, purchaseModel.getDistName());
                purcInvCall.setString(6, purchaseModel.getParcelNO());
                purcInvCall.setString(7, purchaseModel.getParcelDetails());
                purcInvCall.setString(8, purchaseModel.getPurcType());
                String icode = iterateModel.getItemCode();
                purcInvCall.setString(9, icode);                
                purcInvCall.setString(10, iterateModel.getItemName());
                purcInvCall.setString(11, iterateModel.getMfrName());
                purcInvCall.setString(12, iterateModel.getBatch().trim());                
                purcInvCall.setInt(13, iterateModel.getQuantity());
                purcInvCall.setString(14, iterateModel.getExpdate());
                purcInvCall.setDouble(15, iterateModel.getUnitprice());
                int pack = Integer.parseInt(iterateModel.getPacking());
                purcInvCall.setInt(16, pack);
                purcInvCall.setInt(17, iterateModel.getFree());
                purcInvCall.setDouble(18, iterateModel.getUnitDis());
                double uvat = iterateModel.getUnitVat();
                purcInvCall.setDouble(19, uvat);
                purcInvCall.setDouble(20, iterateModel.getTotVal());
                double mrp = iterateModel.getMrp();
                purcInvCall.setDouble(21, mrp);
//                updateDrugTable(icode, uvat, pack, mrp);
                purcInvCall.setDouble(22, purchaseModel.getSubTotal());
                purcInvCall.setDouble(23, purchaseModel.getSchDisc());
                purcInvCall.setDouble(24, purchaseModel.getTotDisc());
                purcInvCall.setDouble(25, purchaseModel.getTotVat());
                purcInvCall.setDouble(26, purchaseModel.getTotAmount());
                purcInvCall.setDouble(27, purchaseModel.getPaidAmount());
                purcInvCall.setDouble(28, purchaseModel.getBalAmount());
                purcInvCall.setInt(29, purchaseModel.getTotItem());
                purcInvCall.setInt(30, purchaseModel.getTotQuantity());
                purcInvCall.setBoolean(31, Boolean.valueOf(iterateModel.getPurc_temp_flagid()));
                purcInvCall.setBoolean(32, Boolean.valueOf(iterateModel.getPurc_is_adj()));
                purcInvCall.setInt(33, purchaseModel.getPurc_adj_flagid());
                purcInvCall.setInt(34, purchaseModel.getPr_adjust_type());
                purcInvCall.setString(35, purchaseModel.getPurc_adjust_no());
                purcInvCall.setDouble(36, purchaseModel.getPurc_adjust_amt());
                purcInvCall.setInt(37, index + 1);
                purcInvCall.setString(38, purchaseModel.getActionType());
                purcInvCall.setDouble(39, purchaseModel.getTotPurcAdjAmt());
                purcInvCall.setDouble(40, purchaseModel.getTotPurcAdjDistAmt());
                purcInvCall.setDouble(41, purchaseModel.getTotPurcAdjVAT4Amt());
                purcInvCall.setInt(42, purchaseModel.getTotPurcAdjItems());
                purcInvCall.setInt(43, purchaseModel.getTotPurcAdjQty());
                purcInvCall.setString(44, iterateModel.getFormulation());
                purcInvCall.setDouble(45, iterateModel.getSalesDiscount());
                purcInvCall.registerOutParameter(46, Types.INTEGER);
                purcInvCall.executeUpdate();
                returnFlag = purcInvCall.getInt("status_flag");
            }
            }
            catch(SQLException se){
            String ss = " Class : PurchaseDAO  Method   : prepareCall Exception :" + se.getMessage();
            log.debug(ss);
            }
            try {
            if (returnFlag == 1) {
                DBConnection.getStatement().executeUpdate("INSERT INTO purchase_maintenance(invoice_no, invoice_date, dist_code, dist_name, purchase_type, total_amount,paid_amt, balance_amount, total_items, total_qty,adjust_amount)VALUES('" + purchaseModel.getInvoiceNo() + "','" + purchaseModel.getInvDate() + "','" + purchaseModel.getDistCode() + "','" + purchaseModel.getDistName() + "','" + purchaseModel.getPurcType() + "','" + purchaseModel.getTotAmount() + "','" + purchaseModel.getPaidAmount() + "','" + purchaseModel.getBalAmount() + "','" + purchaseModel.getTotItem() + "','" + purchaseModel.getTotQuantity() + "','" + purchaseModel.getPurc_adjust_amt() + "');");
                if (purchaseModel.getPurc_adj_flagid() == 1) {
                    String[] retval = purchaseModel.getPurc_adjust_no().split(",");
                    for (int i = 0; i < retval.length; i++) {
                        DBConnection.getStatement().executeUpdate("UPDATE purchase_return set pur_inv_adjust_no='" + purchaseModel.getInvoiceNo() + "',pr_flag_id=1 where pur_return_no='" + retval[i] + "';");
                    }
                }
                isCreate = true;
            } else if (returnFlag == 2) {
                DBConnection.getStatement().executeUpdate("UPDATE purchase_maintenance SET invoice_date='" + purchaseModel.getInvDate() + "', dist_code='" + purchaseModel.getDistCode() + "', dist_name='" + purchaseModel.getDistName() + "', purchase_type='" + purchaseModel.getPurcType() + "', total_amount='" + purchaseModel.getTotAmount() + "', paid_amt='" + purchaseModel.getPaidAmount() + "', balance_amount='" + purchaseModel.getBalAmount() + "', total_items='" + purchaseModel.getTotItem() + "', total_qty='" + purchaseModel.getTotQuantity() + "' WHERE invoice_no='" + purchaseModel.getInvoiceNo() + "';");
                if (purchaseModel.getPurc_adj_flagid() == 1) {
                    String[] retval = purchaseModel.getPurc_adjust_no().split(",");
                    for (int i = 0; i < retval.length; i++) {
                        DBConnection.getStatement().executeUpdate("UPDATE purchase_return set pur_inv_adjust_no='" + purchaseModel.getInvoiceNo() + "',pr_flag_id=1 where pur_return_no='" + retval[i] + "';");
                    }
                }
                isCreate = true;
            }
            }catch(SQLException se){
            String ss = " Class : PurchaseDAO  Method   : purchasemaintenance Exception :" + se.getMessage();
            log.debug(ss);
            }
        } 
        catch (Exception e) {
            isCreate = false;
            String ss = " Class : PurchaseDAO  Method   : createRecord Exception :" + e.getMessage();
            log.debug(ss);
        }
        return isCreate;
    }

    
    public void updateDrugTable(String icode, double uvat, int pack, double mrp) {
        try {
            DBConnection.getStatement().executeUpdate("update drugtable set vat = '" + uvat + "', package = '" + pack + "', mrp = '" + mrp + "' where itemcode = '" + icode + "'");
            int chk = getVatValue(uvat);
            if (chk == 0) {
                DBConnection.getStatement().executeUpdate("insert into vat_master(vat_val) values('" + uvat + "')");
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseDAO  Method   : updateDrugTable  Exception :" + e.getMessage();
            log.debug(ss);
        }
    }

    
    int getVatValue(double uvat) {
        int val = 0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("SELECT * FROM vat_master where vat_val = '" + uvat + "'");
            while (rs.next()) {
                val = 1;
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseDAO  Method   : getVatValue  Exception :" + e.getMessage();
            log.debug(ss);
        }
        return val;
    }

    //on clicking Update button, delete old datas in invoice and insert new datas
    @Override
    public Object updateRecord(Object object) {
        Object isCreate = false;
        PurchaseModel purchaseModel = (PurchaseModel) object;
        try {
            int chkval = checkPurchaseInvoiceStockUpdation(purchaseModel.getInvoiceNo());
            if (chkval == 0) {
                DBConnection.getStatement().executeUpdate("delete from purchase_invoice where invoice_no='" + purchaseModel.getInvoiceNo() + "'");
                isCreate = createRecord(purchaseModel);
            }
        } catch (Exception e) {
            isCreate = false;
            String ss = " Class : PurchaseDAO  Method   : updateRecord Exception :" + e.getMessage();
            log.debug(ss);
        }
        return isCreate;
    }

    @Override
    public Object updateRecordPurchase(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    //Save Purchase Return
    @Override
    public Object createRecordPR(Object object) throws RemoteException {
        Boolean isCreate = false;
        PurchaseModel purcRModel = (PurchaseModel) object;
        List<PurchaseModel> list = purcRModel.getListofitems();
        try {
            for (int index = 0; index < list.size(); index++) {
                PurchaseModel iterateModel = list.get(index);
                CallableStatement purcRetCall = DBConnection.getConnection().prepareCall("{call pro_purchaseReturn_m( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
                purcRetCall.setString(1, purcRModel.getPurcRBillno());
                purcRetCall.setString(2, purcRModel.getPurcRBillDate());
                purcRetCall.setString(3, purcRModel.getInvoiceNo());
                purcRetCall.setString(4, purcRModel.getInvDate());
                purcRetCall.setString(5, purcRModel.getDistCode());
                purcRetCall.setString(6, purcRModel.getDistName());
                purcRetCall.setString(7, purcRModel.getParcelNO());
                purcRetCall.setString(8, purcRModel.getParcelDetails());
                purcRetCall.setString(9, purcRModel.getPurcType());
                purcRetCall.setString(10, iterateModel.getItemCode());
                purcRetCall.setString(11, iterateModel.getItemName());
                purcRetCall.setString(12, iterateModel.getMfrName());
                purcRetCall.setString(13, iterateModel.getBatch().trim());
                purcRetCall.setInt(14, iterateModel.getQuantity());
                purcRetCall.setString(15, iterateModel.getExpdate());
                purcRetCall.setDouble(16, iterateModel.getUnitprice());
                purcRetCall.setInt(17, Integer.parseInt(iterateModel.getPacking()));
                purcRetCall.setInt(18, iterateModel.getFree());
                purcRetCall.setDouble(19, iterateModel.getUnitDis());
                purcRetCall.setDouble(20, iterateModel.getUnitVat());
                purcRetCall.setDouble(21, iterateModel.getTotVal());
                purcRetCall.setDouble(22, iterateModel.getMrp());
                purcRetCall.setDouble(23, purcRModel.getSubTotal());
                purcRetCall.setDouble(24, purcRModel.getSchDisc());
                purcRetCall.setDouble(25, purcRModel.getTotDisc());
                purcRetCall.setDouble(26, purcRModel.getTotVat());
                purcRetCall.setDouble(27, purcRModel.getTotAmount());
                purcRetCall.setDouble(28, purcRModel.getPaidAmount());
                purcRetCall.setDouble(29, purcRModel.getBalAmount());
                purcRetCall.setInt(30, purcRModel.getTotItem());
                purcRetCall.setInt(31, purcRModel.getTotQuantity());
                purcRetCall.setString(32, purcRModel.getActionType());
                purcRetCall.registerOutParameter(33, Types.INTEGER);
                purcRetCall.executeUpdate();
                int returnFlag = purcRetCall.getInt("status_flag");
                
                if (returnFlag > 0) {
                    isCreate = true;
                }
            }
        } catch (Exception e) {
            isCreate = false;
            String ss = " Class : PurchaseDAO  Method   : createRecordPR Exception :" + e.getMessage();
            log.debug(ss);
        }
        return isCreate;
    }

    @Override
    public Object updateRecordPR(Object object) throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    
    @Override
    public boolean updateLog(PurchaseModel purcRModel) throws RemoteException {
        boolean isSave = false;
        try {
            String sql = "CALL pro_userlog('" + purcRModel.getModuleName() + "','" + purcRModel.getLogText() + "')";
            if (DBConnection.getStatement().executeUpdate(sql) > 0) {
                isSave = true;
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseDAO  Method   : updateLog Exception :" + e.getMessage();
            log.debug(ss);
            isSave = false;
        }
        return isSave;
    }

    //Get Invoice number List to check whether invoice number is valid in update
    @Override
    public List<String> PurchaseBillNum(String name) {
        List<String> s = new ArrayList();
        try {
            ResultSet rs = null;
            if (name.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select distinct(invoice_no) from purchase_invoice");
            } else {
                rs = DBConnection.getStatement().executeQuery("select distinct(invoice_no) from purchase_invoice where invoice_no like'" + name + "%'");
            }
            while (rs.next()) {
                s.add(rs.getString("invoice_no"));
            }
        } catch (Exception ex) {
            String ss = "Class : PurchaseDAO  Method : PurchaseBillNum    Exception : " + ex.getMessage();
            log.debug(ss);
        }
        return s;
    }

    // Get purchase details in edit on selecting invoice number
    @Override
    public Object purchaseBillDetails(String invNO) throws RemoteException {
        PurchaseModel purcModel = new PurchaseModel();
        PurchaseModel model;
        List<PurchaseModel> purcRBillDetail = new ArrayList<PurchaseModel>();
        String query = "select * from purchase_invoice where invoice_no = '" + invNO + "'";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                model = new PurchaseModel();
                purcModel.setPurc_adj_flagid(rs.getInt("purc_adj_flag_id"));
                purcModel.setPr_adjust_type(rs.getInt("pr_adjust_type"));
                purcModel.setDistName(rs.getString("dist_name"));
                purcModel.setParcelNO(rs.getString("parcel_no"));
                purcModel.setParcelDetails(rs.getString("parcel_details"));
                purcModel.setPurcBillno(rs.getString("purchase_bill_no"));
                purcModel.setInvDate(rs.getString("invoice_date"));
                purcModel.setPurc_adjust_no(rs.getString("pr_adjust_no"));
                purcModel.setPurc_adjust_amt(rs.getDouble("adjust_amt"));
                purcModel.setSchDisc(rs.getDouble("sch_discount"));
                purcModel.setPaidAmount(rs.getDouble("paid_amount"));
                purcModel.setBalAmount(rs.getDouble("balance_amount"));
                purcModel.setTotItem(rs.getInt("total_items"));
                purcModel.setTotQuantity(rs.getInt("total_qty"));
                purcModel.setTotVat(rs.getDouble("total_vat"));
                purcModel.setTotAmount(rs.getDouble("total_amount"));

                model.setItemName(rs.getString("item_name"));
                model.setFormulation(getFormulation(rs.getString("item_code"), rs.getString("item_name")));
                model.setMfrName(rs.getString("mfr_name"));
                model.setQuantity(rs.getInt("qty"));
                model.setFree(rs.getInt("free"));
                model.setBatch(rs.getString("batch_no"));
                model.setExpdate(rs.getString("expiry_date"));
                model.setPacking(rs.getString("packing"));
                model.setUnitprice(rs.getDouble("unit_price"));
                model.setMrp(rs.getDouble("mrp"));
                model.setSalesDiscount(rs.getDouble("sales_discount"));
                model.setUnitDis(rs.getDouble("unit_discount"));
                model.setUnitVat(rs.getDouble("unit_vat"));
                model.setTotVal(rs.getDouble("total_value"));
                model.setItemCode(rs.getString("item_code"));
                boolean temp = rs.getBoolean("purc_temp_flag_id");
                boolean adjust = rs.getBoolean("purc_is_adjust");
                model.setPurc_temp_flagid(Boolean.toString(temp));
                model.setPurc_is_adj(Boolean.toString(adjust));
                purcRBillDetail.add(model);
            }
            purcModel.setListofitems(purcRBillDetail);
        } catch (Exception ex) {
            String ss = "Class : PurchaseDAO  Method : purchaseBillDetails    Exception : " + ex.getMessage();
            log.debug(ss);
        }
        return purcModel;
    }

    //To get purchase invoice details on selecting previous invoice number
    @Override
    public List<String> prePurcBillDetails(String invNO, String iname) {
        List<String> purcBillDetail = new ArrayList<String>();
        String qry = "select * from purchase_invoice where invoice_no = '" + invNO + "' and item_name = '" + iname + "'";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(qry);
            if (rs != null) {
                while (rs.next()) {
                    purcBillDetail.add(rs.getString("item_name"));
                    purcBillDetail.add(getFormulation(rs.getString("item_code"), rs.getString("item_name")));
                    purcBillDetail.add(rs.getString("mfr_name"));
                    purcBillDetail.add(rs.getString("packing"));
                    purcBillDetail.add(rs.getString("unit_price"));
                    purcBillDetail.add(rs.getString("mrp"));
                    purcBillDetail.add(rs.getString("unit_discount"));
                    purcBillDetail.add(rs.getString("unit_vat"));
                    purcBillDetail.add(rs.getString("item_code"));
                }
            }
        } catch (Exception e) {
            String ss = "Class : PurchaseDAO  Method : prePurcBillDetails    Exception : " + e.getMessage();
            log.debug(ss);
        }
        return purcBillDetail;
    }

    
    
    //Get Purchase invoice details in purchase return
    @Override
    public List<String> purcBillDetailsForPR(String invNO) {
        List<String> purcBillDetail = new ArrayList<String>();
        String query = "select distinct(invoice_no),invoice_date,purchase_bill_no,dist_code,dist_name,parcel_no,parcel_details,purchase_type,sch_discount,pr_adjust_no,adjust_amt,pr_adjust_type,purc_adj_flag_id,total_discount,total_vat,total_amount,paid_amount,balance_amount,total_items,total_qty from purchase_invoice where invoice_no='" + invNO + "'";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                purcBillDetail.add(rs.getString("dist_name"));
                purcBillDetail.add(rs.getString("parcel_no"));
                purcBillDetail.add(rs.getString("parcel_details"));
                purcBillDetail.add(rs.getString("invoice_date"));
                purcBillDetail.add(rs.getString("total_qty"));
                purcBillDetail.add(rs.getString("total_items"));
                purcBillDetail.add(rs.getString("total_amount"));
                purcBillDetail.add(rs.getString("paid_amount"));
                purcBillDetail.add(rs.getString("balance_amount"));
                purcBillDetail.add(rs.getString("sch_discount"));
            }
        } catch (Exception ex) {
            String ss = "Class : PurchaseDAO  Method : purcBillDetailsForPR    Exception : " + ex.getMessage();
            log.debug(ss);
        }
        return purcBillDetail;
    }

    //Get Purchase return number list in Purchase return edit
    @Override
    public List<String> PurcRetBill(String no) {
        List<String> s = new ArrayList<String>();
        try {
            ResultSet rs = null;
            if (no.equals("") || no == null) {
                rs = DBConnection.getStatement().executeQuery("select distinct(pur_return_no) from purchase_return where pr_flag_id = 0");
            } else {
                rs = DBConnection.getStatement().executeQuery("select distinct(pur_return_no),total_amount from purchase_return where pur_return_no like'" + no + "%' and pr_flag_id = 0");
            }
            while (rs.next()) {
                s.add(rs.getString("pur_return_no"));
            }
        } catch (Exception ex) {
            String ss = " Class : PurchaseDAO  Method : PurcRetBill    Exception : " + ex.getMessage();
            log.debug(ss);
        }
        return s;
    }

    //Get Purchase return values on selecting return number in edit
    @Override
    public Object purcRBillDetails(String invNO) {
        PurchaseModel purcRModel = new PurchaseModel();
        PurchaseModel model;
        List<PurchaseModel> purcRBillDetail = new ArrayList<PurchaseModel>();
        String query = "CALL pro_getPRBillDetails('" + invNO + "')";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                model = new PurchaseModel();
                purcRModel.setDistName(rs.getString("dist_name"));
                purcRModel.setParcelNO(rs.getString("parcel_no"));
                purcRModel.setParcelDetails(rs.getString("parcel_details"));
                purcRModel.setPurcRBillno(rs.getString("pur_return_no"));
                purcRModel.setPurcRBillDate(rs.getString("pur_return_date"));
                purcRModel.setInvoiceNo(rs.getString("invoice_no"));
                purcRModel.setInvDate(rs.getString("invoice_date"));
                purcRModel.setSchDisc(rs.getDouble("sch_discount"));
                purcRModel.setPaidAmount(rs.getDouble("paid_amount"));
                purcRModel.setBalAmount(rs.getDouble("balance_amount"));
                purcRModel.setTotItem(rs.getInt("total_products"));
                purcRModel.setTotQuantity(rs.getInt("total_qty"));
                purcRModel.setTotDisc(rs.getDouble("total_discount"));
                purcRModel.setTotAmount(rs.getDouble("total_amount"));


                model.setItemName(rs.getString("item_name"));
                model.setFormulation(getFormulation(rs.getString("item_code"), rs.getString("item_name")));
                model.setMfrName(rs.getString("mfr_name"));
                model.setQuantity(rs.getInt("qty"));
                model.setFree(rs.getInt("free"));
                model.setBatch(rs.getString("batch_no"));
                model.setExpdate(rs.getString("expiry_date"));
                model.setPacking(rs.getString("packing"));
                model.setUnitprice(rs.getDouble("purchase_price"));
                model.setMrp(rs.getDouble("mrp"));
                model.setUnitDis(rs.getDouble("unit_discount"));
                model.setUnitVat(rs.getDouble("unit_vat"));
                model.setTotVal(rs.getDouble("total_value"));
                model.setItemCode(rs.getString("item_code"));
                model.setPurc_adj_flagid(rs.getInt("vat_calc_flag"));
                purcRBillDetail.add(model);
            }
            purcRModel.setListofitems(purcRBillDetail);
        } catch (Exception ex) {
            String ss = "Class : PurchaseDAO  Method : purcRBillDetails    Exception : " + ex.getMessage();
            log.debug(ss);
        }
        return purcRModel;
    }

    //Purchase return number and total amount display on adjustment
    @Override
    public List<PurchaseModel> billNumFromDist(String distName) {
        List<PurchaseModel> list = new ArrayList<PurchaseModel>();
        PurchaseModel model;
        try {
            ResultSet rs = null;
            if (distName.equals("") || distName == null); else {
                rs = DBConnection.getStatement().executeQuery("select distinct(pur_return_no),total_amount from purchase_return where dist_name='" + distName + "' and pr_flag_id = 0");
            }
            while (rs.next()) {
                model = new PurchaseModel();
                if (rs.getString("pur_return_no") != null) {
                    model.setInvoiceNo(rs.getString("pur_return_no"));
                    model.setTotAmount(rs.getDouble("total_amount"));
                    list.add(model);
                }
            }
        } catch (Exception ex) {
            String ss = " Class : PurchaseDAO  Method : billNumFromDist    Exception : " + ex.getMessage();
            log.debug(ss);
        }
        return list;
    }

    //To check distributor name list in invoice matches with the dist information in db
    @Override
    public List<String> getDistributorsForPurchase(String name) {
        List<String> distName = new ArrayList<String>();
        try {
            ResultSet rs = null;
            if (name.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select * from dist_information where dist_flag_id = '0'");
            } else {
                rs = DBConnection.getStatement().executeQuery("select * from dist_information where dist_name like'" + name + "%' and dist_flag_id = '0'");
            }
            while (rs.next()) {
                distName.add(rs.getString("dist_name"));
            }
            distName.add("New Distributor...");
        } catch (Exception e) {
            String ss = " Class : PurchaseDAO  Method   : getDistributorsForPurchase Exception :" + e.getMessage();
            log.debug(ss);
        }
        return distName;
    }

    //Get distributor code, tin no, city details on selecting distributor name
    @Override
    public List<String> getSuplierDetailsForPurchase(String name) {
        List<String> distdetails = new ArrayList();
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select dist_code,tin_no,dl_no,dist_city from dist_information where dist_name='" + name + "'");
            while (rs.next()) {
                distdetails.add(rs.getString("dist_code"));
                distdetails.add(rs.getString("dl_no"));
                distdetails.add(rs.getString("tin_no"));
                distdetails.add(rs.getString("dist_city"));
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseDAO  Method   : getSuplierDetailsForPurchase Exception :" + e.getMessage();
            log.debug(ss);
        }
        return distdetails;
    }

    //Unused
    @Override
    public int getPurchaseChecked(String itemCode, Double mrp, Double purchasePrice) {
        int i = 0;
        Double almrp = 0.00;
        Double alpurprice = 0.00;
        
        try {
            String sql = "select unit_price,mrp from purchase_invoice where item_code='" + itemCode + "' order by purchase_bill_no desc limit 0,1;";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                i = 1;
                almrp = rs.getDouble("mrp");
                alpurprice = rs.getDouble("unit_price");
            }
            if (i == 1) {
                if (almrp.equals(mrp) && alpurprice < purchasePrice) {
                    i = 2;
                }
            }
        } catch (Exception e) {
            String msg = "Class: PurchaseDAO  Method: getPurchaseChecked()  = " + e.getMessage();
            log.debug(msg);
        }
        return i;
    }

    //Loading Drug table values 
    @Override
    public List<PurchaseModel> getDrugTableValues(String name) {
        PurchaseModel model;
        List<PurchaseModel> list = new ArrayList<PurchaseModel>();
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("CALL pro_getDrugTables('" + name + "')");
            while (rs.next()) {
                model = new PurchaseModel();
                model.setItemName(rs.getString("itemname"));
                model.setItemCode(rs.getString("itemcode"));
                model.setMfrName(rs.getString("mfgname"));
                model.setPacking(rs.getString("dosage"));
                model.setUnitVat(Double.parseDouble(rs.getString("vat").trim()));
                model.setMrp(Double.parseDouble(rs.getString("mrp").trim()));
                model.setBatch(rs.getString("formulation"));
                model.setUpdate_flagid(rs.getInt("dru_flag_id"));
                model.setPurc_adj_flagid(rs.getInt("vat_calc_flag"));
                list.add(model);
            }
        } catch (Exception e) {            
            String ss = " Class : PurchaseDAO  Method   : getDrugTableValues Exception :" + e.getMessage();
            log.debug(ss);
        }
        return list;
    }

    //Loading Drug table values on selecting barcode
    @Override
    public List<PurchaseModel> getBarcodeValues(String name) {
        PurchaseModel model;
        List<PurchaseModel> list = new ArrayList<PurchaseModel>();
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select * from drugtable where itemcode = '" + name + "'");
            while (rs.next()) {
                model = new PurchaseModel();
                model.setItemName(rs.getString("itemname"));
                model.setItemCode(rs.getString("itemcode"));
                model.setMfrName(rs.getString("mfgname"));
                model.setPacking(rs.getString("dosage"));
                model.setUnitVat(Double.parseDouble(rs.getString("vat").trim()));
                model.setMrp(Double.parseDouble(rs.getString("mrp").trim()));
                model.setBatch(rs.getString("formulation"));
                model.setUpdate_flagid(rs.getInt("dru_flag_id"));
                model.setPurc_adj_flagid(rs.getInt("vat_calc_flag"));
                list.add(model);
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseDAO  Method   : getDrugTableValues Exception :" + e.getMessage();
            log.debug(ss);
        }
        return list;
    }

    //Get Temporary stock load table values to insert in purchase invoice
    @Override
    public List<PurchaseModel> getTempStockValues() {
        PurchaseModel model;
        List<PurchaseModel> list = new ArrayList<PurchaseModel>();
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("SELECT * FROM temp_stocks t,drugtable d where t.item_code=d.itemcode and temp_flag_id = 0");
            while (rs.next()) {
                model = new PurchaseModel();
                model.setItemCode(rs.getString("item_code"));
                model.setItemName(rs.getString("item_name"));
                model.setBatch(rs.getString("batch_no"));
                model.setQuantity(rs.getInt("qty"));
                model.setPacking(rs.getString("packing"));
                model.setExpdate(rs.getDate("expiry_date").toString());
                model.setMrp(Double.parseDouble(rs.getString("mrp")));
                model.setPurc_adj_flagid(rs.getInt("vat_calc_flag"));
                list.add(model);
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseDAO  Method   : getTempStockValues Exception :" + e.getMessage();
            log.debug(ss);
        }
        return list;
    }

    //Load Purchase return adjustment datas
    @Override
    public List<PurchaseModel> getPRAdjustValues(String billNum) {
        PurchaseModel model;
        List<PurchaseModel> list = new ArrayList<PurchaseModel>();
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("CALL pro_getPRBillDetails('" + billNum + "');");
            while (rs.next()) {
                model = new PurchaseModel();
                model.setItemCode(rs.getString("item_code"));
                model.setItemName(rs.getString("item_name"));
                model.setMfrName(rs.getString("mfr_name"));
                model.setQuantity(rs.getInt("qty"));
                model.setFree(rs.getInt("free"));
                model.setPacking(rs.getString("packing"));
                model.setMrp(Double.parseDouble(rs.getString("mrp")));
                model.setUnitVat(Double.parseDouble(rs.getString("unit_vat")));
                model.setPurc_adj_flagid(rs.getInt("vat_calc_flag"));
                list.add(model);
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseDAO  Method   : getPRAdjustValues Exception :" + e.getMessage();
            log.debug(ss);
        }
        return list;
    }

    //Load purchase return datas on selecting invoice number
    @Override
    public List<PurchaseModel> getPurcReturnDatas(String billNum) {
        PurchaseModel model;        
        List<PurchaseModel> list = new ArrayList<PurchaseModel>();
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("CALL pro_getPurchaseDetails('" + billNum + "');");
            while (rs.next()) {
                model = new PurchaseModel();
                model.setItemName(rs.getString("item_name"));
                model.setItemCode(rs.getString("item_code"));
                model.setBatch(rs.getString("batch_no"));
                model.setMfrName(rs.getString("mfr_name"));
                model.setQuantity(rs.getInt("qty"));
                model.setFree(rs.getInt("free"));
                model.setExpdate(rs.getString("expiry_date"));
                model.setPacking(rs.getString("packing"));
                model.setUnitprice(rs.getDouble("purchase_price"));
                model.setMrp(rs.getDouble("mrp"));
                model.setUnitDis(rs.getDouble("unit_discount"));
                model.setUnitVat(rs.getDouble("unit_vat"));
                list.add(model);
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseDAO  Method   : getPurcReturnDatas Exception :" + e.getMessage();
            log.debug(ss);
        }
        return list;
    }


    //To get the packing count from stock statement while setting values in purchase table
    @Override
    public Integer getPackingValue(String itemCode) {
        Integer pack = 1;
        try {
            String sql = "select packing from stock_statement where item_code='" + itemCode + "' order by ss_no desc limit 0,1 ";
            ResultSet rs = null;
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                pack = rs.getInt("packing");
            }
        } catch (Exception ex) {
            String ss = "Class : PurchaseDAO  Method : getPackingValue   Exception : " + ex.getMessage();
            log.debug(ss);
        }
        if (pack == null || pack == 0) {
            pack = 1;
        }
        return pack;
    }


    @Override
    public String getFormulation(String code, String name) {
        String form = "";
        String[] items = name.split("_");
        String query = "select formulation from drugtable where itemname='" + items[0] + "' and itemcode='" + code + "'";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                form = rs.getString("formulation");
            }
        } catch (Exception ex) {
            log.debug("Class : PurchaseDAO  Method  : getFormulation Exception :" + ex.getMessage());
        }
        return form;
    }

    //check same batch number with same item code exists already in DB
    @Override
    public String getStockItmBat(String query) {
        String batch = "";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                batch = rs.getString("batch_no");
            }
        } catch (Exception ex) {
            String ss = "Class : PurchaseDAO  Method  : getStockItmBat Exception:" + ex.getMessage() + " Query :" + query;
            log.debug(ss);
        }
        return batch;
    }

    @Override
    public int getStockQty(String query) {
        int qty = 0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                if (rs.getString("qty") != null && !rs.getString("qty").equals("")) {
                    qty = Integer.parseInt(rs.getString("qty"));
                }
            }
        } catch (Exception ex) {
            String ss = "Class : DBData  Method  : getStockQty Exception:" + ex.getMessage() + " Query :" + query;
            log.debug(ss);
        }
        return qty;
    }

    //Invoice no list to raise an alert that the entered invoice number already exists
    @Override
    public boolean checkInvoice(String invno) {
        boolean boo = true;
        String query = "select distinct invoice_no from purchase_invoice";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                if (rs.getString("invoice_no").equalsIgnoreCase(invno)) {
                    boo = false;
                    break;
                }
            }
        } catch (Exception ex) {
            String ss = "Class : PurchaseDAO  Method : checkInvoice    Exception : " + ex.getMessage();
            log.debug(ss);
        }
        return boo;
    }

    public int checkPurchaseInvoiceStockUpdation(String purchaseInvoiceNo) {
        int status = 0;
        String query1 = "SELECT item_code,batch_no,((qty+free)*packing)as qt FROM purchase_invoice  where invoice_no='" + purchaseInvoiceNo + "'";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query1);
            while (rs.next()) {
                String item_code = rs.getString("item_code");
                String batch_no = rs.getString("batch_no");
                int purqty = rs.getInt("qt");
                stockCalculations(batch_no, item_code, purqty, purchaseInvoiceNo);
            }
        } catch (Exception e) {
            String ss = "Class : GetPurchaseBill Method:checkitembatch   Exception:" + e.getMessage();
            log.debug(ss);
            status = 1;
        }
        return status;
    }

    //Reduce Quantity in Stock after deleting datas in purchase invoice table(used in update)
    public void stockCalculations(String bat, String item_code, int purqty, String purchaseInvoiceNo) {
        try {
            ResultSet rs1 = DBConnection.getStatement().executeQuery("select qty,item_name from stock_statement where item_code='" + item_code + "' and batch_no='" + bat + "' ");
            while (rs1.next()) {
                int stkqty = rs1.getInt("qty");
                String itemName = rs1.getString("item_name");
                int finQty = stkqty - purqty;
                String sql = "";
                String sql1 = "";                
                sql = "update stock_statement set qty='" + finQty + "' where item_code='" + item_code + "' and batch_no='" + bat + "'";                
                sql1 = "insert into stock_register values(now(),'"+item_code+"','"+itemName+"','"+bat+"','"+stkqty+"','"+purqty+"','"+finQty+"','Purchase Delete','"+purchaseInvoiceNo+"')";
                DBConnection.getStatement().executeUpdate(sql1);
                DBConnection.getStatement().executeUpdate(sql);   
            }
        } catch (Exception e) {
            String ss = "Class : GetPurchaseBill Method:checkitembatch   Exception:" + e.getMessage();
            log.debug(ss);
        }
    }

    @Override
    public String chkPrePurcPrice(PurchaseModel model) {
        throw new UnsupportedOperationException("Not supported yet.");
    }


    @Override
    public List<String> prePurcOrderDetails(String invNO, String iname) {
        List<String> purcBillDetail = new ArrayList<String>();
        String qry = "select * from (select * from purchase_order union all select * from purchase_order_later) po,drugtable d where po.item_code=d.itemcode and "
                + "pur_order_no = '" + invNO + "' and item_name = '" + iname + "'";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(qry);
            if (rs != null) {
                while (rs.next()) {
                    purcBillDetail.add(rs.getString("item_name"));
                    purcBillDetail.add(getFormulation(rs.getString("item_code"), rs.getString("item_name")));                    
                    purcBillDetail.add(rs.getString("mfgname"));
                    purcBillDetail.add(rs.getString("qty"));
                    purcBillDetail.add(rs.getString("packing"));
                    purcBillDetail.add(rs.getString("mrp"));
                    purcBillDetail.add(rs.getString("vat"));
                    purcBillDetail.add(rs.getString("item_code"));
                    purcBillDetail.add(rs.getString("vat_calc_flag"));
                 }
            }
        } catch (Exception e) {
            String ss = "Class : PurchaseDAO  Method : prePurcOrderDetails    Exception : " + e.getMessage();
            log.debug(ss);
        }
        return purcBillDetail;
    }

    //Load values from purchase order to purchase invoice on selecting PO number
    @Override
    public PurchaseModel viewPorecords(String invNO) {
        List<PurchaseModel> purcBillList = new ArrayList<PurchaseModel>();
        PurchaseModel purchaseModel = new PurchaseModel();
        PurchaseModel purModel;
        String qry = "select * from (select * from purchase_order union all select * from purchase_order_later) po where pur_order_no ='" + invNO + "' ";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(qry);
            if (rs != null) {
                while (rs.next()) {
                    purModel  = new PurchaseModel();
                    purModel.setItemCode(rs.getString("item_code"));
                    purModel.setItemName(rs.getString("item_name"));
                    purModel.setQuantity(rs.getInt("qty"));
                    purModel.setDistName(rs.getString("dist_name"));
                    purcBillList.add(purModel);
                }
                purchaseModel.setListofitems(purcBillList);
            }
        } catch (Exception e) {
            String ss = "Class : PurchaseDAO  Method : viewPorecords    Exception : " + e.getMessage();
            log.debug(ss);
        }
        return purchaseModel;
    }

    //Get unit price, batch, expiry date of the last purchase invoice for an item
    @Override
    public List<String> getLastPurDetails(String itemCode) {
        List<String> purDetailsList = new ArrayList<String>();
        String unitPrice = "0.00";
        String batch="";
        String expiryDate = "";
        String salesDiscount = "0.00";
        ResultSet rs = null;
        try {
            rs = DBConnection.getStatement().executeQuery("select * from purchase_invoice where item_code='" + itemCode + "' order by purchase_bill_no desc limit 0,1;");
            while(rs.next()) {
                unitPrice = rs.getString("unit_price");
                batch = rs.getString("batch_no");
                expiryDate = rs.getString("expiry_date");
                if(unitPrice == null || unitPrice.equals("")) {
                    unitPrice = "0.00";
                }
                salesDiscount=rs.getString("sales_discount");
                if(salesDiscount == null || salesDiscount.equals("")) {
                    salesDiscount = "0.00";
                }
                }
                purDetailsList.add(unitPrice);
                purDetailsList.add(batch);
                purDetailsList.add(expiryDate);
                purDetailsList.add(salesDiscount);
        }
        catch(Exception e) {
            String ss = "Class : PurchaseDAO  Method : getLastPurDetails    Exception : " + e.getMessage();
            log.debug(ss);
        }
        return purDetailsList;
    }

    //Display batch number, expiry date, quantity at the bottom of the drug loading table on item selection
     @Override
     public List<PurchaseModel> getStockDetails(String itemCode) {
     List<PurchaseModel> stkDetails = new ArrayList<PurchaseModel>();
     PurchaseModel mod;
     try {
     String sql = "SELECT batch_no,expiry_date,qty FROM stock_statement where item_code='"+itemCode+"' and ss_flag_id=0 and qty > 0";
     ResultSet rs = DBConnection.getStatement().executeQuery(sql);
     while(rs.next()) {
       mod = new PurchaseModel();
       mod.setBatch(rs.getString("batch_no"));
       mod.setExpdate(rs.getString("expiry_date"));
       mod.setQuantity(rs.getInt("qty"));
       stkDetails.add(mod);
     }
     }
     catch(Exception e) {
            String ss = "Class : PurchaseDAO  Method : getStockDetails    Exception : " + e.getMessage();
            log.debug(ss);
     }
     return stkDetails;
     }
}
