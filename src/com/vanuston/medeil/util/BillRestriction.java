/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.util;


public class BillRestriction {
    String[] tSubName = new String[]{"Cash_Bill","Credit_Bill","Counter_Bill","Creditcard_Bill","PartialPayment_Bill","Dummy_Bill","purchase_maintenance"};
    String[] tName = new String[]{"Cash_Bill","Credit_Bill","Account","CD_Card_Bill","Partial_Paid","Dummy_Bill","purchase_maintenance"};
//    String[] tName1 = new String[]{"sales_maintain_bill","sales_maintain_bill","sales_maintain_bill","sales_maintain_bill","sales_maintain_bill","sales_dummy_bill","purchase_invoice"};
    public boolean isNotAllow(int modName)
    {
        boolean s = false;

        String que = "SELECT mode FROM license_details;";
        String mode =  ""; //DBData.getQueryValue(que);
        if(mode.equalsIgnoreCase("Trial"))
        {
            String CntQue = "SELECT trial FROM version_tablelookup where submodule='"+tSubName[modName-1]+"'";
            String CntQueMod = "";
            if(modName<=6)
            {
                CntQueMod = "SELECT count(*) FROM sales_maintain_bill where bill_type='"+tName[modName-1]+"'";
            }else if(modName==7){
                CntQueMod = "SELECT count(*) FROM purchase_maintenance";
            }
            int num =0;// DBData.getQueryWitCol(CntQue, mode.toLowerCase());
            int rwCount = 0;
            if(CntQueMod.length()>0)
            {
                rwCount =0;// DBData.selectCountQuryExe(CntQueMod);
            }
            if(rwCount >= num)
            {
                s = true;
            }
        }
        return s;
    }
}
