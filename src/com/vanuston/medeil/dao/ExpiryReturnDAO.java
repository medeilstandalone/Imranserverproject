/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.dao;

import com.vanuston.medeil.implementation.ExpiryReturn;
import com.vanuston.medeil.model.ExpiryReturnModel;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Logger;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;


/**
 *
 * @author Administrator
 */
public class ExpiryReturnDAO implements ExpiryReturn {
    Logger log=Logger.getLogger(ExpiryReturnDAO.class,"ExpiryReturnDAO");
    int qty = 0;
    @Override
    public Object viewRecord(Object expiryreturnBeans) {
        Object expiryreturn="" ;
        
        ExpiryReturnModel expiryreturnBean = (ExpiryReturnModel) expiryreturnBeans;

        
        if(expiryreturnBean.getExpiry_checkVal().equals("getcountQueryValue") || expiryreturnBean.getExpiry_checkVal()=="getcountQueryValue")
        {
             
            int value = 0;
          try {
               if(expiryreturnBean.getExpiry_from_date()!=null || expiryreturnBean.getExpiry_to_date()!=null || ! expiryreturnBean.getExpiry_dist_name().equals(""))
              {
             String que="SELECT count(*)  FROM purchase_invoice p,stock_statement s where p.invoice_date>='" + DateUtils.changeFormatDate(expiryreturnBean.getExpiry_from_date()) + "' and p.invoice_date<='" + DateUtils.changeFormatDate(expiryreturnBean.getExpiry_to_date() )+ "' and p.dist_name='" + expiryreturnBean.getExpiry_dist_name() + "' and s.qty>0 and p.item_name=s.item_name  and p.item_code=s.item_code  and p.batch_no=s.batch_no";
            ResultSet rs = DBConnection.getStatement().executeQuery(que);
            while (rs.next()) {
                value = rs.getInt("count(*)");
                
            }
              }

        } catch (Exception ex) {
            
            log.debug("Method:viewRecord() IntException:" + ex.getMessage());
        }
        expiryreturn=value;
        }
        else if(expiryreturnBean.getExpiry_checkVal().equals("getQueryValue") ||expiryreturnBean.getExpiry_checkVal() == "getQueryValue")
        {
            String value = "";
          try {
             String que="SELECT details FROM debit_note WHERE debit_note_no='"+expiryreturnBean.getExpiry_debit_note_no()+"'";
             
            ResultSet rs = DBConnection.getStatement().executeQuery(que);
            while (rs.next()) {
                value = rs.getString("details");
                
            }
        } catch (Exception ex) {            
            
            log.debug("Method  : viewRecord() StringException:" + ex.getMessage());
        }
        expiryreturn=value;
        }else
        if(expiryreturnBean.getExpiry_checkVal().equals("checkExpiryReturn") || expiryreturnBean.getExpiry_checkVal()=="checkExpiryReturn")
        {            
        try {
            ResultSet rs = null;
            String sql = "";
            sql = "SELECT qty FROM stock_statement where item_name='" + expiryreturnBean.getExpiry_item_name() + "' and batch_no='" + expiryreturnBean.getExpiry_batch_no() + "'  ";
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                qty = rs.getInt("qty");
            }
        } catch(Exception e)
        {
        log.debug("Method : viewRecord() StringException:" + e.getMessage());
        }
        expiryreturn=qty ;

        }else if(expiryreturnBean.getExpiry_checkVal().equals("checkExpiryReturnStock") || expiryreturnBean.getExpiry_checkVal()=="checkExpiryReturnStock")
        {
            int qty = 0;
        try {
           ResultSet rs = null;
            String sql = "";
            sql = "SELECT (qty+free_qty)as qty FROM expiryreturn where item_name='" +  expiryreturnBean.getExpiry_item_name() + "' and batch_no='" + expiryreturnBean.getExpiry_batch_no() + "'  ";
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                qty = rs.getInt("qty");
            }
        }
        catch(Exception e)
        {
        log.debug("Method:viewRecord() IntException:" + e.getMessage());
        }
        expiryreturn=qty ;
        }
        return expiryreturn;
    }

    @Override
    public boolean deleteRecord(Object expiryreturnBeans) {
        ExpiryReturnModel expiryreturnBean = (ExpiryReturnModel) expiryreturnBeans;
        
        boolean flag = false;
        try{
            ResultSet rs = null;
            int itemCode=0;
            String sql = "SELECT item_code FROM stock_statement where item_name='" + expiryreturnBean.getExpiry_item_name() + "' and batch_no='" + expiryreturnBean.getExpiry_batch_no() + "'  ";
            rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                itemCode = rs.getInt("item_code");
            }
            String sql1 = "delete from  expiryreturn  where item_name='"+expiryreturnBean.getExpiry_item_name()+"' and batch_no='"+expiryreturnBean.getExpiry_batch_no()+"' and formulation='"+expiryreturnBean.getExpiry_formulation()+"'  ";
            DBConnection.getStatement().executeUpdate(sql1);
            String sql2 = "update stock_statement set ss_flag_id=0 where item_name='" + expiryreturnBean.getExpiry_item_name() + "' and batch_no='" + expiryreturnBean.getExpiry_batch_no() + "'";
            DBConnection.getStatement().executeUpdate(sql2);            
            String sql3 = "insert into stock_register values(now(),'"+itemCode+"','"+expiryreturnBean.getExpiry_item_name()+"','"+expiryreturnBean.getExpiry_batch_no()+"','"+qty+"','"+(expiryreturnBean.getExpiry_qty()+expiryreturnBean.getExpiry_free_qty())+"','"+(qty+(expiryreturnBean.getExpiry_qty()+expiryreturnBean.getExpiry_free_qty()))+"','Exp. Return delete','"+expiryreturnBean.getExpiry_dist_name()+"')";
            DBConnection.getStatement().executeUpdate(sql3);
            flag = true;
        }catch(Exception e)
        {
            log.debug("Method:deleteRecord() IntException:" + e.getMessage());
        }
         return flag;
    }

    @Override
    public Object createRecord(Object expiryreturnBeans) {

        ExpiryReturnModel expiryreturnBean = (ExpiryReturnModel) expiryreturnBeans;
        List<ExpiryReturnModel> expiryreturnList=expiryreturnBean.getExpiryreturn();
        Object flag = false;
        try{
            
            for(int i=0;i<expiryreturnList.size();i++)
            {
            expiryreturnBean= expiryreturnList.get(i);

            String sql = "CALL pro_expiryreturndao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,@1)";
            java.sql.PreparedStatement stmt;
            stmt = DBConnection.getConnection().prepareStatement(sql);
            stmt.setString(1, expiryreturnBean.getExpiry_dist_name());
            stmt.setString(2,expiryreturnBean.getExpiry_from_date());
            stmt.setString(3, expiryreturnBean.getExpiry_to_date());
            stmt.setString(4, DateUtils.now("yyyy-MM-dd"));
            stmt.setDouble(5, expiryreturnBean.getExpiry_discount());
            stmt.setString(6,  expiryreturnBean.getExpiry_item_name());
            stmt.setString(7, expiryreturnBean.getExpiry_formulation());
            stmt.setString(8, expiryreturnBean.getExpiry_mfgname());
            stmt.setString(9, expiryreturnBean.getExpiry_batch_no());
            stmt.setInt(10, expiryreturnBean.getExpiry_qty());
            stmt.setInt(11, expiryreturnBean.getExpiry_free_qty());
            stmt.setString(12, expiryreturnBean.getExpiry_date());
            stmt.setDouble(13, expiryreturnBean.getExpiry_purchase_rate());
            stmt.setDouble(14, expiryreturnBean.getExpiry_mrp());
            stmt.setDouble(15, expiryreturnBean.getExpiry_item_total_amount());
            stmt.setDouble(16, expiryreturnBean.getExpiry_sub_total());
            stmt.setDouble(17, expiryreturnBean.getExpiry_dis_amount());
            stmt.setDouble(18, expiryreturnBean.getExpiry_roundoff_amount());
            stmt.setDouble(19, expiryreturnBean.getExpiry_total_amount());
            stmt.setInt(20, expiryreturnBean.getExpiry_return_basedon());
            stmt.setInt(21, expiryreturnBean.getExpiry_include_exclude());
            stmt.setString(22, expiryreturnBean.getExpiry_debit_note_no());
            stmt.setString(23, "save");
            stmt.executeUpdate();
            flag = true;
            }
        }catch(Exception e)
        {
            log.debug("Method:deleteRecord() IntException:" + e.getMessage());
        }
         return flag;
    }

    @Override
    public Object updateRecord(Object expiryreturnBeans) {
        ExpiryReturnModel expiryreturnBean = (ExpiryReturnModel) expiryreturnBeans;
        List<ExpiryReturnModel> expiryreturnList=expiryreturnBean.getExpiryreturn();
        Object flag = false;
        try{
            if(expiryreturnBean.getExpiry_checkVal().equals("updateReturnNotes") || expiryreturnBean.getExpiry_checkVal()=="updateReturnNotes")
        {
                String tabName=expiryreturnBean.getExpiry_dist_name().toLowerCase().concat("_note");
                String debitNoteNo=expiryreturnBean.getExpiry_dist_name().toLowerCase().concat("_note_no");
                
               String sql = "UPDATE "+tabName+" SET details='"+expiryreturnBean.getExpiry_batch_no()+"' WHERE  "+debitNoteNo+"='"+expiryreturnBean.getExpiry_debit_note_no()+"'";
               
               DBConnection.getStatement().executeUpdate(sql);
            }
            else if(expiryreturnBean.getExpiry_checkVal().equals("updateStock") || expiryreturnBean.getExpiry_checkVal() == "updateStock")
            {
                String sql="update stock_statement set qty='"+expiryreturnBean.getExpiry_qty()+"' where item_name='"+expiryreturnBean.getExpiry_item_name()+"' and batch_no='"+expiryreturnBean.getExpiry_batch_no()+"' and formulation='"+expiryreturnBean.getExpiry_formulation()+"'";
                DBConnection.getStatement().executeUpdate(sql);
            }else{
            
            for(int i=0;i<expiryreturnList.size();i++)
            {
            expiryreturnBean= expiryreturnList.get(i);
            
            String sql = "CALL pro_expiryreturndao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,@1)";
            java.sql.PreparedStatement stmt;
            stmt = DBConnection.getConnection().prepareStatement(sql);
            stmt.setString(1, expiryreturnBean.getExpiry_dist_name());
            
            stmt.setString(2,expiryreturnBean.getExpiry_from_date());
            
            stmt.setString(3, expiryreturnBean.getExpiry_to_date());
            
            stmt.setString(4, DateUtils.now("yyyy-MM-dd"));
            stmt.setDouble(5, expiryreturnBean.getExpiry_discount());
            
            stmt.setString(6,  expiryreturnBean.getExpiry_item_name());
            
            stmt.setString(7, expiryreturnBean.getExpiry_formulation());
            
            stmt.setString(8, expiryreturnBean.getExpiry_mfgname());
            
            stmt.setString(9, expiryreturnBean.getExpiry_batch_no());
            
            stmt.setInt(10, expiryreturnBean.getExpiry_qty());
            
            stmt.setInt(11, expiryreturnBean.getExpiry_free_qty());
            
            stmt.setString(12, expiryreturnBean.getExpiry_date());
            
            stmt.setDouble(13, expiryreturnBean.getExpiry_purchase_rate());
            
            stmt.setDouble(14, expiryreturnBean.getExpiry_mrp());
            
            stmt.setDouble(15, expiryreturnBean.getExpiry_item_total_amount());
            
            stmt.setDouble(16, expiryreturnBean.getExpiry_sub_total());
            
            stmt.setDouble(17, expiryreturnBean.getExpiry_dis_amount());
            
            stmt.setDouble(18, expiryreturnBean.getExpiry_roundoff_amount());
            
            stmt.setDouble(19, expiryreturnBean.getExpiry_total_amount());
            
            stmt.setInt(20, expiryreturnBean.getExpiry_return_basedon());
            
            stmt.setInt(21, expiryreturnBean.getExpiry_include_exclude());
            
            stmt.setString(22, expiryreturnBean.getExpiry_debit_note_no());
            
            stmt.setString(23, "update");
            stmt.executeUpdate();
            stmt.close();
            flag = true;
            }
            }
        }catch(Exception e)

        {
            log.debug("Method:updateRecord() IntException:" + e.getMessage());
        }
         return flag;
    }

    @Override
    public ExpiryReturnModel viewAllRecord(ExpiryReturnModel expiryreturnBeans) {
        ArrayList<ExpiryReturnModel> expiryreturnListBean;// = new ArrayList();
        ExpiryReturnModel expiryreturnBean=(ExpiryReturnModel) expiryreturnBeans;
        ExpiryReturnModel expiryreturnAddBean;
        
        if(expiryreturnBean.getExpiry_checkVal().equals("loadExpiryReturnDateTable") || expiryreturnBean.getExpiry_checkVal()=="loadExpiryReturnDateTable")
        {
        try{
            expiryreturnListBean = new ArrayList<ExpiryReturnModel>();
        String sql = "";
            ResultSet rs = null;
            sql = "SELECT  dist_name,from_date,to_date,curr_date,discount,item_name,formulation,mfgname,batch_no,qty,free_qty,expiry_date,purchase_rate,"
                    + "mrp,item_total_amount,sub_total,dis_amount,roundoff_amount,total_amount,return_basedon,include_exclude,debit_note_no FROM expiryreturn where  curr_date='" + expiryreturnBean.getExpiry_curr_date() + "' and dist_name='" + expiryreturnBean.getExpiry_dist_name() + "' and total_amount='" + expiryreturnBean.getExpiry_total_amount() + "'";
            rs = DBConnection.getStatement().executeQuery(sql);
            
            while (rs.next()) {
                expiryreturnAddBean = new ExpiryReturnModel();
                expiryreturnBean.setExpiry_dist_name(rs.getString("dist_name"));
                expiryreturnBean.setExpiry_from_date(DateUtils.normalFormatDate(rs.getString("from_date")));
                expiryreturnBean.setExpiry_to_date(DateUtils.normalFormatDate(rs.getString("to_date")));
                expiryreturnAddBean.setExpiry_curr_date(rs.getString("curr_date"));
                expiryreturnBean.setExpiry_discount(rs.getDouble("discount"));
                expiryreturnAddBean.setExpiry_item_name(rs.getString("item_name"));
                expiryreturnAddBean.setExpiry_formulation(rs.getString("formulation"));
                expiryreturnAddBean.setExpiry_mfgname(rs.getString("mfgname"));
                expiryreturnAddBean.setExpiry_batch_no(rs.getString("batch_no"));
                expiryreturnAddBean.setExpiry_qty(rs.getInt("qty"));
                expiryreturnAddBean.setExpiry_free_qty(rs.getInt("free_qty"));
                expiryreturnAddBean.setExpiry_date(DateUtils.normalFormatDate(rs.getString("expiry_date")));
                expiryreturnAddBean.setExpiry_purchase_rate(rs.getDouble("purchase_rate"));
                expiryreturnAddBean.setExpiry_mrp(rs.getDouble("mrp"));
                expiryreturnAddBean.setExpiry_item_total_amount(rs.getDouble("item_total_amount"));
                expiryreturnBean.setExpiry_sub_total(rs.getDouble("sub_total"));
                expiryreturnBean.setExpiry_dis_amount(rs.getDouble("dis_amount"));
                expiryreturnBean.setExpiry_roundoff_amount(rs.getDouble("roundoff_amount"));
                expiryreturnBean.setExpiry_item_total_amount(rs.getDouble("total_amount"));
                expiryreturnBean.setExpiry_return_basedon(rs.getInt("return_basedon"));
                expiryreturnBean.setExpiry_include_exclude(rs.getInt("include_exclude"));
                expiryreturnBean.setExpiry_debit_note_no(rs.getString("debit_note_no"));
                expiryreturnListBean.add(expiryreturnAddBean);
            }
            expiryreturnBean.setExpiryreturn(expiryreturnListBean);

        } catch (Exception e)
        {
        log.debug("Method:deleteRecord() IntException:" + e.getMessage());

         }
        }
        else if(expiryreturnBean.getExpiry_checkVal().equals("loadExpiryReturnTable") || expiryreturnBean.getExpiry_checkVal() == "loadExpiryReturnTable")
        {
            
        try{
            expiryreturnListBean = new ArrayList<ExpiryReturnModel>();
        String sql = "";
            ResultSet rs = null;
            if ( expiryreturnBean.getExpiry_item_name()!= null || expiryreturnBean.getExpiry_item_name() != "") {
                sql = "SELECT p.item_code,p.item_name, p.mfr_name,p.batch_no,p.total_qty,s.qty  FROM purchase_invoice p,stock_statement s where p.invoice_date>='" + expiryreturnBean.getExpiry_from_date() + "' and p.invoice_date<='" + expiryreturnBean.getExpiry_to_date() + "' and p.dist_name='" + expiryreturnBean.getExpiry_dist_name() + "' and curdate() > p.expiry_date and s.qty>0 and p.item_name=s.item_name  and p.item_code=s.item_code  and p.batch_no=s.batch_no and  p.item_name like '" + expiryreturnBean.getExpiry_item_name() + "%';";
            } else {
                sql = "SELECT  p.item_code,p.item_name, p.mfr_name,p.batch_no,p.total_qty,s.qty  FROM purchase_invoice p,stock_statement s where p.invoice_date>='" + expiryreturnBean.getExpiry_from_date() + "' and p.invoice_date<='" +  expiryreturnBean.getExpiry_to_date() + "' and p.dist_name='" + expiryreturnBean.getExpiry_dist_name() + "' and curdate() > p.expiry_date and s.qty>0 and p.item_name=s.item_name and p.item_code=s.item_code and p.batch_no=s.batch_no; ";
            }
            rs = DBConnection.getStatement().executeQuery(sql);
            
            while (rs.next()) {
                expiryreturnAddBean = new ExpiryReturnModel();
                expiryreturnAddBean.setExpiry_item_code(rs.getString("p.item_code"));
                
                expiryreturnAddBean.setExpiry_item_name(rs.getString("p.item_name"));
                
                expiryreturnAddBean.setExpiry_mfgname(rs.getString("p.mfr_name"));
                
                expiryreturnAddBean.setExpiry_batch_no(rs.getString("p.batch_no"));
                
                expiryreturnAddBean.setExpiry_qty(rs.getInt("qty"));
                
                expiryreturnListBean.add(expiryreturnAddBean);
            }
            
            expiryreturnBean.setExpiryreturn(expiryreturnListBean);

        } catch (Exception e)
        {
        log.debug("Method:deleteRecord() IntException:" + e.getMessage());
                
         }
        }
        else if (expiryreturnBean.getExpiry_checkVal().equals("loadExpiryReturn") || expiryreturnBean.getExpiry_checkVal() == "loadExpiryReturn")
        {
        try{
            expiryreturnListBean = new ArrayList<ExpiryReturnModel>();
            String sql = "";
            ResultSet rs = null;
            sql = "SELECT  dist_name,curr_date,item_name,batch_no,qty,total_amount FROM expiryreturn order by exp_no  desc  limit 0,12";
            rs = DBConnection.getStatement().executeQuery(sql);

            while (rs.next()) {
                expiryreturnAddBean = new ExpiryReturnModel();
                expiryreturnAddBean.setExpiry_curr_date(DateUtils.normalFormatDate(rs.getDate("curr_date")));
                expiryreturnAddBean.setExpiry_dist_name(rs.getString("dist_name"));
                expiryreturnAddBean.setExpiry_item_name(rs.getString("item_name"));
                expiryreturnAddBean.setExpiry_batch_no(rs.getString("batch_no"));
                expiryreturnAddBean.setExpiry_qty(rs.getInt("qty"));
                expiryreturnAddBean.setExpiry_total_amount(rs.getDouble("total_amount"));
                expiryreturnListBean.add(expiryreturnAddBean);
            }

            expiryreturnBean.setExpiryreturn(expiryreturnListBean);

        } catch (Exception e)
        {
        log.debug("Method:deleteRecord() IntException:" + e.getMessage());
         }
        }else
        if(expiryreturnBean.getExpiry_checkVal().equals("setExpiryReturnValues") || expiryreturnBean.getExpiry_checkVal()=="setExpiryReturnValues")
        {

        try{
            expiryreturnListBean = new ArrayList<ExpiryReturnModel>();
               ResultSet   rs=null;
                String sql = "select  p.packing,p.item_name,p.batch_no,p.mfr_name,s.qty,p.free,p.expiry_date,p.unit_price,s.formulation,p.mrp from purchase_invoice p,stock_statement s where p.item_code='" + expiryreturnBean.getExpiry_item_code() + "' and  s.item_code='" + expiryreturnBean.getExpiry_item_code() + "' and p.dist_name='" + expiryreturnBean.getExpiry_dist_name() + "' and p.invoice_date>='" + expiryreturnBean.getExpiry_from_date() + "' and p.invoice_date<='" + expiryreturnBean.getExpiry_to_date()  + "' and p.batch_no='" +  expiryreturnBean.getExpiry_batch_no() + "' and s.batch_no='" + expiryreturnBean.getExpiry_batch_no() + "' and  p.item_name=s.item_name and p.item_code=s.item_code and p.batch_no=s.batch_no and  p.item_name='" + expiryreturnBean.getExpiry_item_name()  + "' and curdate() > p.expiry_date and s.qty>0;";
                
                rs = DBConnection.getStatement().executeQuery(sql);
                while (rs.next()) {
                    expiryreturnAddBean = new ExpiryReturnModel();
                    expiryreturnAddBean.setExpiry_item_name(rs.getString("item_name"));
                    expiryreturnAddBean.setExpiry_formulation(rs.getString("formulation"));
                    expiryreturnAddBean.setExpiry_mfgname(rs.getString("mfr_name"));
                    expiryreturnAddBean.setExpiry_batch_no(rs.getString("batch_no"));
                    expiryreturnAddBean.setExpiry_qty(rs.getInt("qty"));
                    expiryreturnAddBean.setExpiry_free_qty(rs.getInt("free"));
                    expiryreturnAddBean.setExpiry_date(rs.getString("expiry_date"));
                    expiryreturnAddBean.setExpiry_unit_price(rs.getDouble("unit_price"));                    
                    expiryreturnAddBean.setExpiry_mrp(rs.getDouble("mrp"));
                    expiryreturnAddBean.setExpiry_packing(rs.getInt("packing"));
                    expiryreturnListBean.add(expiryreturnAddBean);
            }
                 expiryreturnBean.setExpiryreturn(expiryreturnListBean);

        } catch (Exception e)
        {
        log.debug("Method:deleteRecord() IntException:" + e.getMessage());
         }
         }else
        if(expiryreturnBean.getExpiry_checkVal().equals("loadEditExpiryReturnTable"))
        {
        try{
            ExpiryReturnModel expiryreturnFrom =new ExpiryReturnModel();
            expiryreturnListBean = new ArrayList<ExpiryReturnModel>();
               ResultSet   rs=null;
                String sql = "SELECT  dist_name,curr_date,item_name,batch_no,qty,total_amount FROM expiryreturn where dist_name='" + expiryreturnBean.getExpiry_dist_name() + "' order by  exp_no desc";
                
                rs = DBConnection.getStatement().executeQuery(sql);
                while (rs.next()) {
                    expiryreturnAddBean = new ExpiryReturnModel();                    
                    expiryreturnAddBean.setExpiry_curr_date(DateUtils.normalFormatDate(rs.getString("curr_date")));
                    expiryreturnAddBean.setExpiry_dist_name(rs.getString("dist_name"));
                    expiryreturnAddBean.setExpiry_item_name(rs.getString("item_name"));
                    expiryreturnAddBean.setExpiry_batch_no(rs.getString("batch_no"));
                    expiryreturnAddBean.setExpiry_qty(rs.getInt("qty"));
                    expiryreturnAddBean.setExpiry_total_amount(rs.getDouble("total_amount"));                    
                    expiryreturnListBean.add(expiryreturnAddBean);
            }
                 expiryreturnBean.setExpiryreturn(expiryreturnListBean);

        } catch (Exception e)
        {
        log.debug("Method:deleteRecord() IntException:" + e.getMessage());
         }

       
    }
     return expiryreturnBean;
    }
}
