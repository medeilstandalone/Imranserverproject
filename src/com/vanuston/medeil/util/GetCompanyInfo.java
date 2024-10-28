package com.vanuston.medeil.util;

import java.sql.ResultSet;

public class GetCompanyInfo {

    static Logger log = Logger.getLogger(GetCompanyInfo.class, "Utilities");

 public static String com_name="VANUSTON INTELLIGENCE Private Limited";
 public static String address1="8/110, First Floor, G.S.T Road ";
 public static String address2="Pallavaram, Chennai - 600 043 ";
 public static String address3="INDIA";
 public static String ph_no1="+91-44-42119714 ";
 public static String ph_no2="+ 91-44-22641950";
 public static String fax_no="+ 91-44-22641951 ";
 public static String contact_mail="contact@medeil.com";
 public static String support_mail="support@medeil.com";
 public static String messenger_id="medeil-support";
 public static String messenger_type="skype";
 public static String web="www.medeil.com";
 public static String buynow_link="www.medeil.com\\buynow.jsp";
 public static String update_link="www.medeil.com\\update.jsp";



    public void get() {
        String query = "select * from company_info";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                String com_nameDB=rs.getString("com_name").trim();
                if(com_nameDB!=null && com_nameDB.length()>0){
                com_name=com_nameDB;}
                String address1DB=rs.getString("address1").trim();
                if(address1DB!=null && address1DB.length()>0){
                address1=address1DB;}
                String address2DB=rs.getString("address2").trim();
                if(address2DB!=null && address2DB.length()>0){
                address2=address2DB;}
                String address3DB=rs.getString("address3").trim();
                if(address3DB!=null && address3DB.length()>0){
                address3=address3DB;}
                String ph_no1DB=rs.getString("ph_no1").trim();
                if(ph_no1DB!=null && ph_no1DB.length()>0){
                ph_no1=ph_no1DB;}
                String ph_no2DB=rs.getString("ph_no2").trim();
                if(ph_no2DB!=null && ph_no2DB.length()>0){
                ph_no2=ph_no2DB;}
                String fax_noDB=rs.getString("fax_no").trim();
                if(fax_noDB!=null && fax_noDB.length()>0){
                fax_no=fax_noDB;}
                String contact_mailDB=rs.getString("contact_mail").trim();
                if(contact_mailDB!=null && contact_mailDB.length()>0){
                contact_mail=contact_mailDB;}
                String support_mailDB=rs.getString("support_mail").trim();
                if(support_mailDB!=null && support_mailDB.length()>0){
                support_mail=support_mailDB;}
                String messenger_idDB=rs.getString("messenger_id").trim();
                if(messenger_idDB!=null && messenger_idDB.length()>0){
                messenger_id=messenger_idDB;}
                String messenger_typeDB=rs.getString("messenger_type").trim();
                if(messenger_typeDB!=null && messenger_typeDB.length()>0){
                messenger_type=messenger_typeDB;}
                String webDB=rs.getString("web").trim();
                if(webDB !=null && webDB.length()>0){
                web=webDB;}
                String buynow_linkDB=rs.getString("buynow_link").trim();
                if(buynow_linkDB!=null && buynow_linkDB.length()>0){
                buynow_link=buynow_linkDB;}
                String update_linkDB=rs.getString("update_link").trim();
                if(update_linkDB!=null && update_linkDB.length()>0){
                update_link=update_linkDB;
                    }
            }
        } catch (Exception ex) {
            String ss = "Class : GetCompanyInfo  Method : get  Exception :" + ex.getMessage() ;
            log.debug(ss);
        }
    }
}
