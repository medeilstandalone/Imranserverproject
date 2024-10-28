package com.vanuston.medeil.util;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import com.vanuston.medeil.util.Logger;

public class VersionLookup {
static Logger log = Logger.getLogger(VersionLookup.class, "Utilities");

private static HashMap getModules(String obj,String module) {
        HashMap privilage = new HashMap();
        try {
            GetProductInfo GetProductinfo = new GetProductInfo();
            String version=GetProductinfo.getStatus().toLowerCase();
            String query = "SELECT submodule,"+version+" FROM version_formlookup where object='"+obj+"' and module='"+module+"'";
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                privilage.put(rs.getString("submodule"),rs.getString(version));
            }
        } catch (Exception ex) {
            String ss = "Class:VersionLookup  Method : getModules  Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return privilage;
    }
    private static String getHashResult(String obj,String module,String[] form_list){
        HashMap privilage = getModules(obj,module);
        List<Integer> lst=new ArrayList<Integer>();
        String modules_list[]=form_list;
        for (int i = 0;i < modules_list.length;i++ ){
            
            if(Integer.parseInt(privilage.get(modules_list[i]).toString())==1){
                lst.add(i,3);
            }else{
                lst.add(i,0);
            }
        }
        String result=lst.toString();
        result=result.replace( "[","").replace( "]","" ).replace( " ","" ).trim();
        return result ;
    }
 
   public static String getHome(){
       String home="0,0,0,0,3";
        return home;
    }
    public static String getSales(){
        String modules_list[]={"Cash_Bill",
                               "Counter_Bill",                               
                               "Dummy_Bill",
                               "Sales_Return",
                               "Sales_Maintenance"};
        return getHashResult("Forms","Sales", modules_list);
    }
    public static String getInventory(){
        String modules_list[]={"Purchase_Order",
                               "Purchase_Invoice",
                               "Purchase_Return",
                               "Stock",
                               "Damage_Stock",
                               "Expiry_Return",
                               "SendPurchase_ Order"};
        return getHashResult("Forms","Inventory", modules_list);
    }
        public static String getMasters(){
        String modules_list[]={"Drug_Details",
                               "Hospital_Details",
                               "Doctor_Details",
                               "Distributor_Details",
                               "Employee_Details",
                               "Employee_Salary"};
        return getHashResult("Forms","Masters", modules_list);
    }
        public static String getFinancial(){
        String modules_list[]={
                               "Payment",
                               "Receipt",
                               "Credit_Notes",
                               "Debit_Notes",
                               "DailyCash_Book",
                               "Bank_Details",
                               "Bank_Book",
                               "Cheque_Book",
                               "Cheque_Txn",
                               "VAT_Summary"
                };
        return getHashResult("Forms","Financial", modules_list);
    }
            public static String getCRM(){
        String modules_list[]={"Customer_Details",
                               "Customer_Alerts",
                               "Complaints"};
        return getHashResult("Forms","CRM", modules_list);
    }
            public static String getReports(){
        String modules_list[]={"Sales_Report",
                               "Purchase_Report",
                               "Product_Report",
                               "Stock_Report",
                               "StockAnalysis_Report",
                               "Masters_Report",
                               "Financial_Report",
                               "CRM_Report"
        };
        return getHashResult("Forms","Reports", modules_list);
    }
}
