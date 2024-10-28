/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.dao;

import com.vanuston.medeil.implementation.Stock;
import com.vanuston.medeil.model.StockModel;
import java.rmi.RemoteException;
import java.sql.ResultSet;
import java.util.ArrayList;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Logger;
import java.sql.CallableStatement;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author Administrator
 */
public class StockDAO implements Stock {

    static Logger log = Logger.getLogger(StockDAO.class, "com.vanuston.medeil.dao.StockDAO");

    @Override
    public ArrayList<StockModel> viewAllRecord(Object stockBeans) {
        ArrayList<StockModel> stockListBean = new ArrayList();
        StockModel stockBean = (StockModel) stockBeans;
        try {
            String sql = "";
            ResultSet rs = null;

            if (stockBean.getPassValue() == 1) {
                sql="SELECT  *,SUBSTRING_INDEX((item_name),'_',1) AS itemname,if(INSTR(item_name, '_')=0,'',((SUBSTRING_INDEX(item_name,'_',-1))))as 'dosage' FROM stock_statement where ss_flag_id=0  and qty>0 order by ss_no desc limit 0,8";
            } else if (stockBean.getPassValue() == 2) {
                sql = "SELECT  *,SUBSTRING_INDEX((item_name),'_',1) AS itemname,if(INSTR(item_name, '_')=0,'',((SUBSTRING_INDEX(item_name,'_',-1))))as 'dosage' FROM stock_statement  where   ss_flag_id=0 and qty>0 and item_name like '" + stockBean.getStock_itemName() + "%' order by item_name";
            } else if (stockBean.getPassValue() == 3) {
                sql = "SELECT  *,SUBSTRING_INDEX((item_name),'_',1) AS itemname,if(INSTR(item_name, '_')=0,'',((SUBSTRING_INDEX(item_name,'_',-1))))as 'dosage' FROM stock_statement  where ss_flag_id=0 and qty>0 and  item_code like '" + stockBean.getStock_itemCode() + "%' order by item_name";
            } else if (stockBean.getPassValue() == 4) {
                sql = "SELECT  *,SUBSTRING_INDEX((item_name),'_',1) AS itemname,if(INSTR(item_name, '_')=0,'',((SUBSTRING_INDEX(item_name,'_',-1))))as 'dosage' FROM stock_statement where ss_flag_id=0 and qty>0 and  batch_no like '" + stockBean.getStock_batchNo() + "%' order by item_name";
            } else if (stockBean.getPassValue() == 5) {
                sql = "SELECT  *,SUBSTRING_INDEX((item_name),'_',1) AS itemname,if(INSTR(item_name, '_')=0,'',((SUBSTRING_INDEX(item_name,'_',-1))))as 'dosage' FROM stock_statement where ss_flag_id=0   and  qty ='" + stockBean.getStock_qty() + "' order by item_name";
            } else if (stockBean.getPassValue() == 6) {
                sql = "SELECT  *,SUBSTRING_INDEX((item_name),'_',1) AS itemname,if(INSTR(item_name, '_')=0,'',((SUBSTRING_INDEX(item_name,'_',-1))))as 'dosage' FROM stock_statement  where ss_flag_id=0 and qty>0  and item_name like '" + stockBean.getStock_itemName() + "%' order by item_name";
            }
            rs = DBConnection.getStatement().executeQuery(sql);

            while (rs.next()) {
                stockBean = new StockModel();
                stockBean.setStock_ssNo(rs.getInt("ss_no"));
                stockBean.setStock_itemCode(rs.getInt("item_code"));
                stockBean.setStock_itemName(rs.getString("itemname"));
                stockBean.setStock_formulation(rs.getString("formulation"));
                stockBean.setDosage(rs.getString("dosage"));
                stockBean.setStock_rackNo(rs.getString("rack_no"));
                stockBean.setStock_shelfNo(rs.getString("shelf_no"));
                stockBean.setStock_batchNo(rs.getString("batch_no"));
                stockBean.setStock_qty(rs.getInt("qty"));
                stockBean.setStock_expiryDate(DateUtils.normalFormatExpDate(rs.getDate("expiry_date")));
                stockBean.setStock_packing(rs.getInt("packing"));
                stockBean.setStock_mrp(rs.getDouble("mrp"));
                stockBean.setStock_purchasePrice(rs.getDouble("purchase_price"));
                stockBean.setStock_sellingPrice(rs.getDouble("selling_price"));
                stockListBean.add(stockBean);
            }
        } catch (Exception ex) {
            String ss = "Class : StockDAO  Method  : viewAllRecord Exception:" + ex.getMessage();
            log.debug(ss);
        }
        return stockListBean;
    }

    @Override
    public String getStockQty(String itemCode, String batchNumber) {
        String qty = "0";
        String query = "select qty from stock_statement where  item_code='" + itemCode + "' and batch_no='" + batchNumber + "'";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                if (rs.getString("qty") != null && !rs.getString("qty").equals("")) {
                    qty = rs.getString("qty").toString();
                }
            }
        } catch (Exception ex) {
            log.debug("query:"+query);
            String ss = "Class : StockDAO  Method  : getStockQty Exception:" + ex.getMessage();
            log.debug(ss);
        }
        return qty;
    }

        @Override
    public String getStockFQty(String itemCode, String batchNumber) {
        String qty = "0";
        String query = "select qty from stock_statement where  item_code='" + itemCode + "' and batch_no='" + batchNumber + "'";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                if (rs.getString("qty") != null && !rs.getString("qty").equals("")) {
                    qty = rs.getString("qty").toString();
                }
            }
        } catch (Exception ex) {
            log.debug("query:"+query);
            String ss = "Class : StockDAO  Method  : getStockfQty Exception:" + ex.getMessage();
            log.debug(ss);
        }
        return qty;
    }



@Override
    public String getStockpackQty(String itemCode, String batchNumber) {
        String packqty = "0";
        String query = "select packing from stock_statement where  item_code='" + itemCode + "' and batch_no='" + batchNumber + "'";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                if (rs.getString("packing") != null && !rs.getString("packing").equals("")) {
                    packqty = rs.getString("packing").toString();
                }
            }
        } catch (Exception ex) {
            log.debug("query:"+query);
            String ss = "Class : StockDAO  Method  : getStockfQty Exception:" + ex.getMessage();
            log.debug(ss);
        }
        return packqty;
    }

















    @Override
    public Object createRecord(Object stockBeans) {
        StockModel stockBean = (StockModel) stockBeans;
        Object flag = false;
        try {
            String sql = "CALL pro_stockdao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,@1)";
            java.sql.PreparedStatement stmt;
            stmt = DBConnection.getConnection().prepareStatement(sql);

            stmt.setInt(1, Integer.valueOf(stockBean.getStock_ssNo()));
            stmt.setInt(2,0);
            stmt.setInt(3, Integer.valueOf(stockBean.getStock_itemCode()));
            stmt.setString(4, stockBean.getStock_itemName());
            stmt.setString(5, stockBean.getStock_rackNo());
            stmt.setString(6, stockBean.getStock_shelfNo());
            stmt.setString(7, stockBean.getStock_coldStorage());
            stmt.setString(8, stockBean.getStock_batchNo());           
            stmt.setInt(9, stockBean.getStock_qty());
            stmt.setInt(10, stockBean.getStock_packing());
            stmt.setString(11, stockBean.getStock_expiryDate());
            stmt.setDouble(12, stockBean.getStock_mrp());
            stmt.setDouble(13, stockBean.getStock_purchasePrice());
            stmt.setDouble(14, stockBean.getStock_sellingPrice());
//            stmt.setDouble(13, stockBean.getStock_margin());
            stmt.setDouble(15, 0.00);
            stmt.setString(16, stockBean.getStock_formulation());
            stmt.setString(17, stockBean.getStock_date());
            stmt.setInt(18, stockBean.getStock_minQty());
            stmt.setDouble(19, 0.00);
            stmt.setString(20, "save");
            
            stmt.executeUpdate();
            flag = true;
        } catch (Exception ex) {
            String ss = "Class : StockDAO  Method  : createRecord Exception:" + ex.getMessage();
            log.debug(ss);
            flag = false;
        }
        return flag;
    }

    @Override
    public Object viewRecord(Object stockBeans) {
        StockModel stockBean = (StockModel) stockBeans;
        //Object flag = false;
        Object  stockReturn=null;

       
           if(stockBean.getStock_itemName() == "checkitembatch") {
            int qty = -9081;
            String query1 = "select qty from stock_statement where qty>0 and item_code='" + stockBean.getStock_itemCode() + "' and batch_no='" + stockBean.getStock_batchNo() + "'";
            try {
                
                ResultSet rs = DBConnection.getStatement().executeQuery(query1);
                while (rs.next()) {
                    qty = rs.getInt("qty");
                }
            } catch (Exception e) {
                String ss = "Class : ViewReocrd Method: for checkitembatch   Exception:" + e.getMessage();
                log.debug(ss);
            }
            stockReturn = qty;
            //throw new UnsupportedOperationException("Not supported yet.");
        } else if (stockBean.getStock_itemName()=="returnStockNo") {
            int ssno = 0;
            String query1 = "select ss_no from stock_statement where qty>0 and item_code='" + stockBean.getStock_itemCode() + "' and batch_no='" + stockBean.getStock_batchNo() + "'";
            try {

                ResultSet rs = DBConnection.getStatement().executeQuery(query1);
                while (rs.next()) {
                    ssno = rs.getInt("ss_no");
                }
            } catch (Exception e) {
                String ss = "Class : GetPurchaseBill Method:returnStockno()   Exception:" + e.getMessage();
                log.debug(ss);
            }
            stockReturn = ssno;
        }else if (stockBean.getPassValue()==7 ) {                                 
            String query1 = "SELECT  *,SUBSTRING_INDEX((item_name),'_',1) AS itemname,if(INSTR(item_name, '_')=0,'',((SUBSTRING_INDEX(item_name,'_',-1))))as 'dosage' FROM stock_statement where ss_no='"+stockBean.getStock_ssNo()+"' ";
            try {
                ResultSet rs = DBConnection.getStatement().executeQuery(query1);
                while (rs.next()) {
                stockBean.setStock_ssNo(rs.getInt("ss_no"));
                stockBean.setStock_itemCode(rs.getInt("item_code"));
                stockBean.setStock_itemName(rs.getString("itemname"));
                stockBean.setStock_formulation(rs.getString("formulation"));                                                
                stockBean.setDosage(rs.getString("dosage"));
                stockBean.setStock_rackNo(rs.getString("rack_no"));
                stockBean.setStock_shelfNo(rs.getString("shelf_no"));
                stockBean.setStock_coldStorage(rs.getString("cold_storage"));
                stockBean.setStock_batchNo(rs.getString("batch_no"));
                stockBean.setStock_expiryDate(new SimpleDateFormat("MM/yy").format(new SimpleDateFormat("yyyy-MM-dd").parse(rs.getString("expiry_date"))));
                stockBean.setStock_minQty(rs.getInt("min_qty"));
                stockBean.setStock_packing(rs.getInt("packing"));                
                stockBean.setStock_mrp(rs.getDouble("mrp") );
                stockBean.setStock_purchasePrice(rs.getDouble("purchase_price"));
                stockBean.setStock_sellingPrice(rs.getDouble("selling_price") );
                stockBean.setStock_qty(rs.getInt("qty"));
                }
                stockReturn = stockBean;
            } catch (Exception e) {
                String ss = "Class : StockDAO Method:ViewRecord()   Exception:" + e.getMessage();
                log.debug(ss);
            }            
        }
        return stockReturn;
    }

    @Override
    public boolean deleteRecord(Object stockBeans) {
        StockModel stockBean = (StockModel) stockBeans;
        boolean flag = false;
        try {
            String sql = "CALL pro_stockdao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,@1)";
            java.sql.PreparedStatement stmt;
            stmt = DBConnection.getConnection().prepareStatement(sql);
            stmt.setInt(1, Integer.valueOf(stockBean.getStock_ssNo()));
            stmt.setInt(2,0);
            stmt.setInt(3, Integer.valueOf(stockBean.getStock_itemCode()));
            stmt.setString(4, stockBean.getStock_itemName());
            stmt.setString(5, stockBean.getStock_rackNo());
            stmt.setString(6, stockBean.getStock_shelfNo());
            stmt.setString(7, stockBean.getStock_coldStorage());
            stmt.setString(8, stockBean.getStock_batchNo());
            stmt.setInt(9, stockBean.getStock_qty());
            stmt.setInt(10, stockBean.getStock_packing());
            stmt.setString(11, stockBean.getStock_expiryDate());
            stmt.setDouble(12, stockBean.getStock_mrp());
            stmt.setDouble(13, stockBean.getStock_purchasePrice());
            stmt.setDouble(14, stockBean.getStock_sellingPrice());
            stmt.setDouble(15, 0.00);
            stmt.setString(16, stockBean.getStock_formulation());
            stmt.setString(17, stockBean.getStock_date());
            stmt.setInt(18, stockBean.getStock_minQty());
            stmt.setDouble(19, 0.00);
            stmt.setString(20, "delete");
            stmt.executeQuery();
            flag = true;
        } catch (Exception ex) {
            String ss = "Class : StockDAO  Method  : deleteRecord Exception:" + ex.getMessage();
            log.debug(ss);
            flag = false;
        }
        return flag;
    }

    @Override
    public Object updateRecord(Object stockBeans) {
        StockModel stockBean = (StockModel) stockBeans;
        Object flag = false;                
        try {
            if (stockBean.getPassValue() == 1) {
                String sql1 = "update drugtable set mrp='" + stockBean.getStock_mrp() + "' where itemcode='" + stockBean.getStock_itemCode() + "' ";
                DBConnection.getStatement().executeUpdate(sql1);
                flag = true;
            } else {
                String sql = "CALL pro_stockdao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,@1)";
                java.sql.PreparedStatement stmt;
                stmt = DBConnection.getConnection().prepareStatement(sql);
                stmt.setInt(1, Integer.valueOf(stockBean.getStock_ssNo()));
                stmt.setInt(2, Integer.valueOf(stockBean.getPrev_Stock_ssnNO()));
                stmt.setInt(3, Integer.valueOf(stockBean.getStock_itemCode()));
                
                stmt.setString(4, stockBean.getStock_itemName());
                
                stmt.setString(5, stockBean.getStock_rackNo());
                
                stmt.setString(6, stockBean.getStock_shelfNo());
                
                stmt.setString(7, stockBean.getStock_coldStorage());
                
                stmt.setString(8, stockBean.getStock_batchNo());
                
                stmt.setInt(9, stockBean.getStock_qty());
                
                stmt.setInt(10, stockBean.getStock_packing());
                
                stmt.setString(11, stockBean.getStock_expiryDate());
                
                stmt.setDouble(12, stockBean.getStock_mrp());
                
                stmt.setDouble(13, stockBean.getStock_purchasePrice());
                
                stmt.setDouble(14, stockBean.getStock_sellingPrice());
                

                stmt.setDouble(15, 0.00);
                stmt.setString(16, stockBean.getStock_formulation());
                
                stmt.setString(17, stockBean.getStock_date());
                
                stmt.setInt(18, stockBean.getStock_minQty());
                stmt.setDouble(19, 0.00);
                stmt.setString(20, "update");
                stmt.executeUpdate();
                flag = true;
            }
        } catch (Exception ex) {
            String ss = "Class : StockDAO  Method  : updateRecord Exception:" + ex.getMessage();
            log.debug(ss);
            flag = false;
        }
        return flag;
    }
    public boolean isSaled(String itemCode,String batchNo){
        Boolean isSaled = false;
        try{
            String qry = "SELECT count(*) as count FROM sales_cash_bill where item_code='"+itemCode+"' and batch_no='"+batchNo+"';";
            ResultSet rs = null;
            rs = DBConnection.getStatement().executeQuery(qry);
            if(rs!=null && rs.next()){
                if(rs.getInt("count") > 0){
                    isSaled =true;
                }
            }
        }catch(Exception e){
            log.debug("stockDAO isSaled() Exception:"+e.getMessage());
        }
        return isSaled;
    }
    public boolean isPurcReturned(String itemCode,String batchNo){
        Boolean isSaled = false;
        try{
            String qry = "SELECT count(*) as count FROM sales_cash_bill where item_code='"+itemCode+"' and batch_no='"+batchNo+"';";
            ResultSet rs = null;
            rs = DBConnection.getStatement().executeQuery(qry);
            if(rs!=null && rs.next()){
                if(rs.getInt("count") > 0){
                    isSaled =true;
                }
            }
        }catch(Exception e){
            log.debug("stockDAO isPurcReturned() Exception:"+e.getMessage());
        }
        return isSaled;
    }

    @Override
    public int insertStockAdjustment(ArrayList<StockModel> stkAdjustmentList) throws RemoteException {
        StockModel stockBean;
        int returnFlag=0;
        try {
            for(int i=0; i < stkAdjustmentList.size();i++) {
            stockBean = stkAdjustmentList.get(i);
            String sql = "CALL pro_stockadjustment(?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            CallableStatement stmt = DBConnection.getConnection().prepareCall(sql);
            stmt.setInt(1, stockBean.getStock_itemCode());
            stmt.setString(2, stockBean.getStock_itemName());
            stmt.setString(3, stockBean.getStock_formulation());
            stmt.setString(4, stockBean.getStock_batchNo());
            stmt.setString(5, new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("MMM-yyyy").parse(stockBean.getStock_expiryDate())));
            stmt.setInt(6, stockBean.getStock_qty());
            stmt.setInt(7, stockBean.getPhysicalStock());
            stmt.setInt(8, stockBean.getPhysicalStock()-stockBean.getStock_qty());
            stmt.setDouble(9, stockBean.getActualStockvalue());
            stmt.setDouble(10, stockBean.getPhysicalStockvalue());
            stmt.setDouble(11, stockBean.getActualStockvalue()-stockBean.getPhysicalStockvalue());
            stmt.setString(12, stockBean.getRemarks());
            stmt.setString(13, DateUtils.now("yyyy-MM-dd"));
            stmt.registerOutParameter(14, Types.INTEGER);
            stmt.executeUpdate();            
            }
            returnFlag=1;
        } catch (Exception ex) {
           String ss = "Class : StockDAO  Method  : insertStockAdjustment Exception:" + ex.getMessage();
           log.debug(ss);
        }
        return returnFlag;
    }

    @Override
    public String getStockmrp(String itemCode, String batchNumber) throws RemoteException {
         String stkmrp = "0";
        String query = "select stock_mrp from stock_statement where  item_code='" + itemCode + "' and batch_no='" + batchNumber + "'";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                if (rs.getString("stock_mrp") != null && !rs.getString("stock_mrp").equals("")) {
                    stkmrp = rs.getString("stock_mrp").toString();
                }
            }
        } catch (Exception ex) {
            log.debug("query:"+query);
            String ss = "Class : StockDAO  Method  : getStockmrp Exception:" + ex.getMessage();
            log.debug(ss);
        }
        return stkmrp;
    }



}
