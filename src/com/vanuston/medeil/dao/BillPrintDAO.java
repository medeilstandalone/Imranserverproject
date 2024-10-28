/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.dao;

import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;
import java.sql.ResultSet;

/**
 *
 * @author Administrator
 */
public class BillPrintDAO {
    static Logger log=Logger.getLogger(BillPrintDAO.class,"com.vanuston.medeil.DAO.BillPrintDAO");
    ResultSet rs=null;
    public Boolean billPrintSetup(String billType, String col,String imageFormat,String imagePath) {
        Boolean returnFlag = false;
        try {
            DBConnection.getStatement().executeUpdate("truncate print_settings");
            DBConnection.getStatement().executeUpdate("insert into print_settings values ('"+billType+"','"+col+"','"+imageFormat+"','"+"Logo"+"','"+imagePath+"')");
            returnFlag = true;
        }
        catch (Exception e) {
            
            String ss = "Class : BillPrintDAO  Method  : billPrintSetup():StringException:" + e.getMessage();
            log.debug(ss);
        }
        return returnFlag;
    }
    public String getQueryValue1(String billtype)
    {
        String getQuery="";
         try {
            rs=DBConnection.getStatement().executeQuery(billtype);
            while(rs.next())
            {
                getQuery=rs.getString("bill_type");
            }
            //DBConnection.getStatement().executeUpdate("insert into print_settings values ('"+billType+"','"+""+"','"+imageFormat+"','"+"Logo"+"','"+imagePath+"')");

        }
        catch (Exception e) {
            
            String ss = "Class : BillPrintDAO  Method  : billPrintSetup():StringException:" + e.getMessage();
            log.debug(ss);
        }
        return getQuery;
    }
    public String getQueryValue2(String billtype)
    {
        String getQuery="";
         try {
            rs=DBConnection.getStatement().executeQuery(billtype);
            while(rs.next())
            {
                getQuery=rs.getString("page_type");
            }            

        }
        catch (Exception e) {
            
            String ss = "Class : BillPrintDAO  Method  : billPrintSetup():StringException:" + e.getMessage();
            log.debug(ss);
        }
        return getQuery;
    }
    public String getQueryValue3(String billtype)
    {
        String getQuery="";
         try {
            rs=DBConnection.getStatement().executeQuery(billtype);
            while(rs.next())
            {
                getQuery=rs.getString("img_path");
            }            
        }
        catch (Exception e) {
            
            String ss = "Class : BillPrintDAO  Method  : billPrintSetup():StringException:" + e.getMessage();
            log.debug(ss);
        }
        return getQuery;
    }

    public int isExists() {
        //boolean bo = false;
        int val=0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select count(*) from print_settings");
            while (rs.next()) {
                val = rs.getInt("count(*)");
                if (val == 1) {
                    val=1;
                    break;
                }
            }
        } catch (Exception ex) {
            log.debug( "Class : BillPrint Method  : isExists Exception :" + ex.getMessage());
        }
        return val;
    }
}
