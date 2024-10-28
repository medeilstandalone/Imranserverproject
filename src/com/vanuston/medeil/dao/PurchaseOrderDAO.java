/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.dao;

import com.vanuston.medeil.implementation.PurchaseOrder;
import com.vanuston.medeil.model.PurchaseOrderModel;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;

/**
 *
 * @author Administrator
 */
public class PurchaseOrderDAO implements PurchaseOrder {

    static Logger log = Logger.getLogger(PurchaseOrderDAO.class, "PurchaseOrderDAO");

    @Override
    public Object viewRecord(Object billNumber) {
        PurchaseOrderModel poModel = (PurchaseOrderModel) billNumber;
        PurchaseOrderModel purcModel = new PurchaseOrderModel();
        PurchaseOrderModel model;
        List<PurchaseOrderModel> list = new ArrayList<PurchaseOrderModel>();
        try {
            String subSt = poModel.getPurcOrderNo().toString().substring(0, 4);
            String sql = "";
            if (subSt.equals("PSOR")) {
                sql = "select * from purchase_order where pur_order_no = '" + poModel.getPurcOrderNo() + "'";
            } else {
                sql = "SELECT * FROM purchase_order_later where pur_order_no = '" + poModel.getPurcOrderNo() + "'";
            }
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                model = new PurchaseOrderModel();
                purcModel.setPurcOrderDate(rs.getString("pur_order_date"));
                purcModel.setPurcOrderDN(rs.getString("dist_name"));
                purcModel.setPurcOrderDC(rs.getString("dist_code"));
                purcModel.setPurcOrderDA(rs.getString("address"));
                purcModel.setPurcOrderDTY(rs.getString("type_of_delivery"));
                purcModel.setPurcOrderPTY(rs.getString("payment_terms"));
                purcModel.setPurcOrderTP(rs.getInt("total_products"));
                purcModel.setPurcOrderTQ(rs.getInt("total_qty"));
                model.setPurcOrderIC(rs.getString("item_code"));
                model.setPurcOrderIN(rs.getString("item_name"));
                model.setPurcOrderQty(rs.getInt("qty"));
                model.setPurcOrderPack(rs.getString("packing"));
                list.add(model);
            }
            purcModel.setListofitems(list);
        } catch (Exception e) {
            String ss = " Class : PurchaseOrderDAO  Method   : viewRecord    Exception :" + e.getMessage();
            log.debug(ss);
        }
        return purcModel;
    }

    @Override
    public Object createRecord(Object object) {
        Boolean isCreate = false;
        PurchaseOrderModel purcModel = (PurchaseOrderModel) object;
        List<PurchaseOrderModel> list = purcModel.getListofitems();
        try {
            for (int index = 0; index < list.size(); index++) {
                PurchaseOrderModel iterateModel = list.get(index);
                CallableStatement purcOrderCall = DBConnection.getConnection().prepareCall("{call pro_purchaseOrder_m( ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)}");
                purcOrderCall.setString(1, purcModel.getPurcOrderNo());
                purcOrderCall.setString(2, purcModel.getPurcOrderDate());
                purcOrderCall.setString(3, purcModel.getPurcOrderDC());
                purcOrderCall.setString(4, purcModel.getPurcOrderDN());
                purcOrderCall.setString(5, purcModel.getPurcOrderDA());
                purcOrderCall.setString(6, purcModel.getPurcOrderDTY());
                purcOrderCall.setString(7, purcModel.getPurcOrderPTY());
                purcOrderCall.setString(8, iterateModel.getPurcOrderIC());
                purcOrderCall.setString(9, iterateModel.getPurcOrderIN().concat("_").concat(iterateModel.getPurcOrderDos()));
                purcOrderCall.setInt(10, iterateModel.getPurcOrderQty());
                purcOrderCall.setString(11, iterateModel.getPurcOrderPack());
                purcOrderCall.setInt(12, purcModel.getPurcOrderTP());
                purcOrderCall.setInt(13, purcModel.getPurcOrderTQ());
                purcOrderCall.setString(14, purcModel.getActionType());
                purcOrderCall.registerOutParameter(15, Types.INTEGER);
                purcOrderCall.executeUpdate();
                int returnFlag = purcOrderCall.getInt("status_flag");
                if (returnFlag > 0) {
                    isCreate = true;
                }
            }
        } catch (Exception e) {
            isCreate = false;
            String ss = " Class : PurchaseOrderDAO  Method   : createRecord Exception :" + e.getMessage();
            log.debug(ss);
        }
        return isCreate;
    }

    @Override
    public Object updateRecordVal(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Object updateRecord(Object object) {
        PurchaseOrderModel poModel = (PurchaseOrderModel) object;
        try {
            String sql = "update purchase_order set pon_flag_id='1' where pur_order_no='" + poModel.getPurcOrderNo() + "'";
            DBConnection.getStatement().executeUpdate(sql);
        } catch (Exception e) {
            String ss = " Class : PurchaseOrderDAO  Method   : updateRecord    Exception :" + e.getMessage();
            log.debug(ss);
        }
        return object;
    }

    @Override
    public Object updateRecord1(Object object) {
        PurchaseOrderModel poModel = (PurchaseOrderModel) object;
        try {
            String sql = "update purchase_order set pon_flag_id='0' where pur_order_no='" + poModel.getPurcOrderNo() + "'";
            DBConnection.getStatement().executeUpdate(sql);
        } catch (Exception e) {
            String ss = " Class : PurchaseOrderDAO  Method   : updateRecord    Exception :" + e.getMessage();
            log.debug(ss);
        }
        return object;
    }

    @Override
    public boolean deleteRecord(Object object) {
        boolean isExc = false;
        PurchaseOrderModel poModel = (PurchaseOrderModel) object;
        try {
            String sql = "delete from " + poModel.getTabName() + " where pur_order_no = '" + poModel.getPurcOrderNo() + "'";
            if (DBConnection.getStatement().executeUpdate(sql) > 0) {
                isExc = true;
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseOrderDAO  Method   : deleteRecord    Exception :" + e.getMessage();
            log.debug(ss);
        }
        return isExc;
    }

    @Override
    public boolean updateLog(PurchaseOrderModel purcModel) {
        boolean isSave = false;
        try {
            String sql = "CALL pro_userlog('Purchase Order','" + purcModel.getLogText() + "')";
            if (DBConnection.getStatement().executeUpdate(sql) > 0) {
                isSave = true;
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseOrderDAO  Method   : updateLog Exception :" + e.getMessage();
            log.debug(ss);
            isSave = false;
        }
        return isSave;
    }

    @Override
    public List<String> getDistributorsForPO(String name) {
        Vector v = new Vector();
        List<String> s = null;
        try {
            ResultSet rs = null;
            if (name.equals("")) {
                rs = DBConnection.getStatement().executeQuery("select * from dist_information where dist_flag_id = '0'");
            } else {
                rs = DBConnection.getStatement().executeQuery("select * from dist_information where dist_name like'" + name + "%' and dist_flag_id = '0'");
            }
            while (rs.next()) {
                v.addElement(rs.getString("dist_name"));
            }
            s = new ArrayList(v.size());
            for (int i = 0; i <= v.size(); i++) {
                if (i != v.size()) {
                    s.add(v.get(i).toString());
                } else if (i == v.size()) {
                    s.add("New Distributor...");
                }
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseOrderDAO  Method   : getDistributorsForPO Exception :" + e.getMessage();
            log.debug(ss);
        }
        return s;
    }

    @Override
    public List<String> getSuplierDetailsForPO(String name) {
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
            String ss = " Class : PurchaseOrderDAO  Method   : getSuplierDetailsForPO Exception :" + e.getMessage();
            log.debug(ss);
        }
        return distdetails;
    }

    @Override
    public List<String> getSuplierDetails(String name) {
        List<String> distdetails = new ArrayList();
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select dist_code,mobile,dist_name,mail_id from dist_information where dist_code ='" + name + "'");
            while (rs.next()) {
                distdetails.add(rs.getString("mobile"));
                distdetails.add(rs.getString("dist_name"));
                distdetails.add(rs.getString("mail_id"));
                distdetails.add(rs.getString("dist_code"));
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseOrderDAO  Method   : getSuplierDetailsForPO Exception :" + e.getMessage();
            log.debug(ss);
        }
        return distdetails;
    }

    @Override
    public List<String> getPurcOrderDetailPDF(String tabName, String billNO) {
        List<String> purcDetail = new ArrayList();
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select d.cno1,p.pur_order_no,p.pur_order_date,p.dist_name,concat(d.dist_address1,',', d.dist_city)as sad,type_of_delivery  from " + tabName + " p,dist_information d where p.pur_order_no='" + billNO + "' and p.dist_code=d.dist_code");
            while (rs.next()) {
                purcDetail.add(rs.getString("dist_name"));
                purcDetail.add(rs.getString("sad"));
                purcDetail.add(rs.getString("type_of_delivery"));
                purcDetail.add(rs.getString("cno1"));
                purcDetail.add(rs.getString("pur_order_date"));
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseOrderDAO  Method   : getSuplierDetailsForPO Exception :" + e.getMessage();
            log.debug(ss);
        }
        return purcDetail;
    }

    @Override
    public Object getPurcOrderTDetailPDF(String tabName, String billNO) {
        List<PurchaseOrderModel> purcDetail = new ArrayList<PurchaseOrderModel>();
        PurchaseOrderModel purcModel = new PurchaseOrderModel();
        PurchaseOrderModel pModal;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select p.item_name, d.mfgname ,p.qty from " + tabName + " p,drugtable d where p.pur_order_no='" + billNO + "' and p.item_code=d.itemcode");
            while (rs.next()) {
                pModal = new PurchaseOrderModel();
                pModal.setPurcOrderIN(rs.getString("item_name"));
                pModal.setPurcOrderDos(rs.getString("mfgname"));
                pModal.setPurcOrderQty(rs.getInt("qty"));
                purcDetail.add(pModal);
            }
            purcModel.setListofitems(purcDetail);
        } catch (Exception e) {
            String ss = " Class : PurchaseOrderDAO  Method   : getSuplierDetailsForPO Exception :" + e.getMessage();
            log.debug(ss);
        }
        return purcModel;
    }

    @Override
    public Object getPurcOrderNowTDetailPDF(String billNO) {
        List<PurchaseOrderModel> purcDetail = new ArrayList<PurchaseOrderModel>();
        PurchaseOrderModel purcModel = new PurchaseOrderModel();
        PurchaseOrderModel pModal;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select  p.item_name,p.qty,d.mfgname,p.dist_code from purchase_order p,drugtable d where p.pur_order_no='" + billNO + "' and p.item_code=d.itemcode");
            while (rs.next()) {
                pModal = new PurchaseOrderModel();
                pModal.setPurcOrderDC(rs.getString("dist_code"));
                pModal.setPurcOrderIN(rs.getString("item_name"));
                pModal.setPurcOrderDos(rs.getString("mfgname"));
                pModal.setPurcOrderQty(rs.getInt("qty"));
                purcDetail.add(pModal);
            }
            purcModel.setListofitems(purcDetail);
        } catch (Exception e) {
            String ss = " Class : PurchaseOrderDAO  Method   : getSuplierDetailsForPO Exception :" + e.getMessage();
            log.debug(ss);
        }
        return purcModel;
    }

    @Override
    public List<PurchaseOrderModel> loadSendPurcOrderTable() {
        List<PurchaseOrderModel> purcDetail = new ArrayList<PurchaseOrderModel>();
        PurchaseOrderModel spModal;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("SELECT distinct(p.pur_order_no),p.dist_name,p.pur_order_no,d.mobile,d.mail_id FROM purchase_order_later p, dist_information d WHERE  d.dist_code=p.dist_code  and p.pol_flag_id=0");
            while (rs.next()) {
                spModal = new PurchaseOrderModel();
                spModal.setPurcOrderNo(rs.getString("pur_order_no"));
                spModal.setPurcOrderDA(rs.getString("dist_name"));
                spModal.setPurcOrderIN(rs.getString("mobile"));
                spModal.setPurcOrderDos(rs.getString("mail_id"));
                purcDetail.add(spModal);
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseOrderDAO  Method   : getSuplierDetailsForPO Exception :" + e.getMessage();
            log.debug(ss);
        }
        return purcDetail;
    }

    @Override
    public List<PurchaseOrderModel> viewSendPurcOrderTable(String billNo) {
        List<PurchaseOrderModel> purcDetail = new ArrayList<PurchaseOrderModel>();
        PurchaseOrderModel spModal;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("SELECT p.item_code,p.item_name,p.qty FROM purchase_order_later p WHERE p.pur_order_no='" + billNo + "'");
            while (rs.next()) {
                spModal = new PurchaseOrderModel();
                spModal.setPurcOrderIC(rs.getString("item_code"));
                spModal.setPurcOrderIN(rs.getString("item_name"));
                spModal.setPurcOrderQty(rs.getInt("qty"));
                purcDetail.add(spModal);
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseOrderDAO  Method   : getSuplierDetailsForPO Exception :" + e.getMessage();
            log.debug(ss);
        }
        return purcDetail;
    }

    @Override
    public Object updateSendPurcOrderTable(Object object) {
        PurchaseOrderModel poModel = (PurchaseOrderModel) object;
        try {
            String sql = "update purchase_order_later set pol_flag_id=1 where pur_order_no='" + poModel.getPurcOrderNo() + "'";
            DBConnection.getStatement().executeUpdate(sql);
        } catch (Exception e) {
            String ss = " Class : PurchaseOrderDAO  Method   : updateRecord    Exception :" + e.getMessage();
            log.debug(ss);
        }
        return object;
    }

    @Override
    public List<PurchaseOrderModel> getSendPurcOrderTablePDF(String billNo) {
        List<PurchaseOrderModel> purcDetail = new ArrayList<PurchaseOrderModel>();
        PurchaseOrderModel pModal;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select  p.item_name,p.qty,d.mfgname,p.dist_code from purchase_order_later p,drugtable d where p.pur_order_no='" + billNo + "' and p.item_code=d.itemcode");
            while (rs.next()) {
                pModal = new PurchaseOrderModel();
                pModal.setPurcOrderDC(rs.getString("dist_code"));
                pModal.setPurcOrderIN(rs.getString("item_name"));
                pModal.setPurcOrderDos(rs.getString("mfgname"));
                pModal.setPurcOrderQty(rs.getInt("qty"));
                purcDetail.add(pModal);
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseOrderDAO  Method   : getSuplierDetailsForPO Exception :" + e.getMessage();
            log.debug(ss);
        }
        return purcDetail;
    }

    @Override
    public List<String> billNum(String name) {
        List<String> s = new ArrayList();
        try {
            ResultSet rs = null;
            String sql1 = "";
            String sql2 = "";
            if (name.equals("")) {
                sql1 = "SELECT distinct(pur_order_no) FROM purchase_order where pon_flag_id = 0 order by pur_order_no asc";
                sql2 = "SELECT distinct(pur_order_no) FROM purchase_order_later where pol_flag_id = 0 order by pur_order_no asc";
            } else {
                sql1 = "SELECT distinct(pur_order_no) FROM purchase_order where pur_order_no like '" + name + "%' and pon_flag_id = 0 order by pur_order_no asc";
                sql2 = "SELECT distinct(pur_order_no) FROM purchase_order_later where pur_order_no like '" + name + "%' and pol_flag_id = 0 order by pur_order_no asc";
            }
            rs = DBConnection.getStatement().executeQuery(sql1);
            while (rs.next()) {
                s.add(rs.getString("pur_order_no"));
            }
            rs = DBConnection.getStatement().executeQuery(sql2);
            while (rs.next()) {
                s.add(rs.getString("pur_order_no"));
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseOrderDAO  Method   : billNum      Exception :" + e.getMessage();
            log.debug(ss);
        }
        return s;
    }

    @Override
    public List<String> getItemDetails(String itCode) {
        List<String> s = new ArrayList();
        try {
            ResultSet rs = null;
            rs = DBConnection.getStatement().executeQuery("select itemname,dosage from drugtable where itemcode='" + itCode + "'");
            while (rs.next()) {
                s.add(rs.getString("itemname"));
                s.add(rs.getString("dosage"));
            }
        } catch (Exception e) {
            String ss = " Class : PurchaseOrderDAO  Method   : getItemDetails Exception :" + e.getMessage();
            log.debug(ss);
        }
        return s;
    }

    @Override
    public Object getDrugTableValues(String searchCode) {

        PurchaseOrderModel purcModel = new PurchaseOrderModel();
        PurchaseOrderModel model;
        List<PurchaseOrderModel> list = new ArrayList<PurchaseOrderModel>();
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("CALL pro_getDrugTables('" + searchCode + "')");
            while (rs.next()) {
                model = new PurchaseOrderModel();
                model.setPurcOrderIN(rs.getString("itemname"));
                model.setPurcOrderIC(rs.getString("itemcode"));
                model.setPurcOrderDos(rs.getString("dosage"));
                model.setPurcOrderPack(rs.getString("dru_flag_id"));
                list.add(model);
            }
            purcModel.setListofitems(list);
        } catch (Exception e) {
            String ss = " Class : PurchaseOrderDAO  Method   : getDrugTableValues Exception :" + e.getMessage();
            log.debug(ss);
        }
        return purcModel;
    }

    @Override
    public int getCheckPurchaseOrderSMS() {
        int i = 0;
        int j = 0;
        try {
            ResultSet rs = null;
            String sql = "";
            sql = "select * from settings_config";
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                i = rs.getInt("send_purorder_enable");
                if (i == 1) {
                    j = rs.getInt("send_purorder_sms");
                    if (j == 0) {
                        i = 2;
                    }
                }
            }
        } catch (Exception ex) {
            String msg = "Class : PurchaseOrderDAO  Method : getCheckPurchaseOrderSMS()  = " + ex.getMessage();
            log.debug(msg);
        }

        return i;
    }

    @Override
    public int getCheckPurchaseOrderEMail() {
        int i = 0;
        int j = 0;
        int k = 0;
        try {
            ResultSet rs = null;
            String sql = "";
            sql = "select * from settings_config";
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                i = rs.getInt("send_purorder_enable");
                if (i == 1) {
                    j = rs.getInt("send_purorder_email");
                    if (j == 0) {
                        i = 2;
                    } else {
                        k = rs.getInt("send_purorder_pdf");
                        if (k == 1) {
                            i = 3;
                        }
                    }
                }
            }
        } catch (Exception ex) {
            String msg = "Class : PurchaseOrderDAO  Method : getCheckPurchaseOrderSMS()  = " + ex.getMessage();
            log.debug(msg);
        }
        return i;
    }

    @Override
    public int getCheckPurchaseOrderEMailHTML() {
        int i = 0;
        int j = 0;
        int k = 0;
        try {
            ResultSet rs = null;
            String sql = "";
            sql = "select * from settings_config";
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                i = rs.getInt("send_purorder_enable");
                if (i == 1) {
                    j = rs.getInt("send_purorder_email");
                    if (j == 0) {
                        i = 2;
                    } else {
                        k = rs.getInt("send_purorder_html");
                        if (k == 1) {
                            i = 3;
                        }
                    }
                }
            }
        } catch (Exception ex) {
            String msg = "Class : PurchaseOrderDAO  Method : getCheckPurchaseOrderSMS()  = " + ex.getMessage();
            log.debug(msg);
        }
        return i;
    }

    @Override
    public List<String> getPoNumbers(String name) {
        List<String> PoNumbers = new ArrayList<String>();
        try {
            ResultSet rs = null;            
            if (name.equals("")) {
                rs = DBConnection.getStatement().executeQuery("SELECT distinct(pur_order_no) FROM purchase_order union all select distinct(pur_order_no) from purchase_order_later order by pur_order_no asc");
            } else {
                rs = DBConnection.getStatement().executeQuery("SELECT distinct(pur_order_no) FROM purchase_order where pur_order_no like'" + name + "%' union all select distinct(pur_order_no) from purchase_order_later where pur_order_no like'" + name + "%' order by pur_order_no asc");
            }
            while (rs.next()) {
                PoNumbers.add(rs.getString("pur_order_no"));
            }
        } catch (Exception ex) {
            String msg = "Class : PurchaseOrderDAO  Method  : getPoNumbers()   = " + ex.getMessage();
            log.debug(msg);
        }
        return PoNumbers;
    }

    
}
