package com.vanuston.medeil.util;

import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.DBConnection;
import java.sql.ResultSet;
import java.sql.Statement;

public class GetBillPrintSet {
 static Logger log = Logger.getLogger(GetBillPrintSet.class, "Utilities");
    public static String billType = "";
    public static String cols;
    public static String lmargin;
    public static String rmargin;
    public static String pageType;
    public static String logo;
    public static String logoPath;

    public static void getInfo() {

        try {
            Statement stmt = DBConnection.getConnection().createStatement();
            ResultSet rs = stmt.executeQuery("select * from print_settings");
            while (rs.next()) {
                billType = rs.getString("bill_type");
                cols = rs.getString("bill_columns");
                pageType = rs.getString("page_type");
                logo = rs.getString("logo");
                logoPath = rs.getString("img_path");
            }

        } catch (Exception ex) {
            log.debug( "Class : GetBillPrintSet   Method   : getInfo Exception :" + ex.getMessage());
        }
    }

    public static String getBType() {
        getInfo();
        return billType;
    }
}
