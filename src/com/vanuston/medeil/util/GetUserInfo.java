package com.vanuston.medeil.util;

import java.sql.ResultSet;
import java.util.Random;

public class GetUserInfo {

    public static String pwd;
    public static String empName;
    public static String empCode;
    public static String userType;
    public static String home;
    public static String sales;
    public static String inv;
    public static String mas;
    public static String fin;
    public static String crm;
    public static String report;
    static Logger log = Logger.getLogger(GetUserInfo.class, "Utilities");
    
    public String getSessionID() {
        String sname = "";
        Random r = new Random();
        String[] charc = {"A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"};
        String a1 = charc[Math.abs(r.nextInt() % 26)];
        String b1 = charc[Math.abs(r.nextInt() % 26)];
        String c1 = charc[Math.abs(r.nextInt() % 26)];
        String d1 = charc[Math.abs(r.nextInt() % 26)];
        String a = Math.abs(r.nextInt() % 10) + "" + Math.abs(r.nextInt() % 10) + "" + Math.abs(r.nextInt() % 10);
        String b = Math.abs(r.nextInt() % 10) + "" + Math.abs(r.nextInt() % 10) + "" + Math.abs(r.nextInt() % 10);
        sname = a1 + a + "" + b1 + "" + c1 + b + "" + d1;
        return sname;
    }
    public static boolean checkName(String uname) throws Exception {
        boolean boo = true;
        String query = "select user_name from user_info where user_name='" + uname + "' and ui_flag_id=0";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                boo = false;
            }
        } catch (Exception ex) {
            String ss = "Method : checkName     Exception :" + ex.getMessage() + " Query :" + query;
            log.debug(ss);
        }
        return boo;
    }

    public static boolean checkEmpExists(String name, String code) {
        boolean s = false;
        int q;
        String query = null;
        if (name.equalsIgnoreCase("") && code.equalsIgnoreCase("")) {
        } else if (name.equals("") && !code.equalsIgnoreCase("")) {
            query = "SELECT count(*) FROM user_info WHERE emp_code='" + code + "'and ui_flag_id=0";
        } else if (!name.equals("") && code.equalsIgnoreCase("")) {
            query = "SELECT count(*) FROM user_info WHERE emp_name='" + name + "'and ui_flag_id=0";
        }
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                q = rs.getInt("count(*)");
                if (q == 0) {
                    s = true;
                }
            }

        } catch (Exception ex) {
            String ss = "Method : checkEmpExists     Exception :" + ex.getMessage() + " Query :" + query;
            log.debug(ss);
        }
        return s;
    }

    public static String empUserName(String name, String code) throws Exception {
        String s = "";
        int q;
        String query = null;
        if (name.equalsIgnoreCase("") && code.equalsIgnoreCase("")) {
        } else if (name.equals("") && !code.equalsIgnoreCase("")) {
            query = "SELECT user_name FROM user_info WHERE emp_code='" + code + "' and ui_flag_id=0";
        } else if (!name.equals("") && code.equalsIgnoreCase("")) {
            query = "SELECT user_name FROM user_info WHERE emp_name='" + name + "' and ui_flag_id=0";
        }
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                s = rs.getString("user_name");
            }
        } catch (Exception ex) {
            String ss = "Method : empUserName     Exception :" + ex.getMessage() + " Query :" + query;
            log.debug(ss);
        }
        return s;
    }

    public static String[] getUserName(String name) {
        String[] s = null;
        String query = null;
        try {
            int q = 0;
            if (name.equalsIgnoreCase("")) {
                query = "SELECT user_name FROM user_info where ui_flag_id=0";
            } else if (!name.equals("")) {
                query = "SELECT user_name FROM user_info WHERE user_name like'" + name + "%' and ui_flag_id=0";
            }
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            rs.last();
            s = new String[rs.getRow()];
            rs.beforeFirst();
            while (rs.next()) {
                s[q] = rs.getString("user_name");
                q++;
            }
        } catch (Exception ex) {
            String ss = "Method : getUserName     Exception :" + ex.getMessage() + " Query :" + query;
            log.debug(ss);
        }
        return s;
    }

    public static void getUserInfoDet(String uname) {
        String query = "select * from user_info where user_name='" + uname + "'";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                empCode = rs.getString("emp_code");
                empName = rs.getString("emp_name");
                userType = rs.getString("user_type");
                pwd = rs.getString("password");
                home = rs.getString("home");
                sales = rs.getString("sales");
                inv = rs.getString("inventory");
                mas = rs.getString("masters");
                fin = rs.getString("financial");
                crm = rs.getString("crm");
                report = rs.getString("reports");
            }
        } catch (Exception ex) {
            String ss = "Method : getUserInfoDet     Exception :" + ex.getMessage() + " Query :" + query;
            log.debug(ss);
        }
    }

    public static String getUsers(String uname) {
        String query = "select user_name from user_info where user_name='" + uname + "'";
        String pass = "";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                pass = rs.getString("user_name");
            }
        } catch (Exception ex) {
            String ss = "Method : getUsers     Exception :" + ex.getMessage() + " Query :" + query;
            log.debug(ss);
        }
        return pass;
    }

    public static String getPassword(String uname) {
        String query = "select password from user_info where user_name='" + uname + "'";
        String pass = "";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                pass = rs.getString("password");
            }

        } catch (Exception ex) {
            String ss = "Method : getPassword     Exception :" + ex.getMessage() + " Query :" + query;
            log.debug(ss);
        }
        return pass;
    }

    public static String getUserType(String uname) {
        String utype = "";
        if (uname.equals("MedeilAdmin")) {
            utype = "Admin";
        } else {
            String query = "select user_type from user_info where user_name='" + uname + "'";
            try {
                ResultSet rs = DBConnection.getStatement().executeQuery(query);
                while (rs.next()) {
                    utype = rs.getString("user_type");
                }
            } catch (Exception ex) {
                String ss = "Method : getUserType     Exception :" + ex.getMessage() + " Query :" + query;
                log.debug(ss);
            }
        }
        return utype;
    }
    public String getThemeType(String uname) {
        String themeType = "MedilStyle";        
            String query = "select theme_type from user_info where user_name='" + uname + "'";
            try {
                ResultSet rs = DBConnection.getStatement().executeQuery(query);
                while (rs.next()) {
                    themeType = rs.getString("theme_type");
                }
            } catch (Exception ex) {
                String ss = "Method : getUserType     Exception :" + ex.getMessage() + " Query :" + query;
                log.debug(ss);
            }
        return themeType;
    }
    public Boolean setThemeType(String uname,String themeType) {
        Boolean isSet = false;
        if(themeType.length() < 1 ) {
            themeType = "MedilStyle" ;
        }
        String query = "update user_info set theme_type= '"+ themeType + "' where user_name='" + uname + "'";
        try {            
            int rs = DBConnection.getStatement().executeUpdate(query);
            if (rs > 0) {
                isSet = true;
            }
        } catch (Exception ex) {
            String ss = "Method : getUserType     Exception :" + ex.getMessage() + " Query :" + query;
            log.debug(ss);
        }
        return isSet;
    }

    public String getPrivileges(String modname, String uname) {
        String query = "select " + modname + " from user_info where user_name='" + uname + "'";
        String priv = "";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                priv = rs.getString(modname);
            }
        } catch (Exception ex) {
            String ss = "Method : getPrivileges     Exception :" + ex.getMessage() + " Query :" + query;
            log.debug(ss);
        }
        
        return priv;
    }

    public static String getTIN() {
        String tin = "";
        String query = "select tin_no from shop_information";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                tin = rs.getString("tin_no");
            }
        } catch (Exception ex) {
            String ss = "Method : getAdminPass     Exception :" + ex.getMessage() + " Query :" + query;
            log.debug(ss);
        }
        return tin;
    }

    public boolean getSalesBoolean(int n) {
        boolean bo = false;
        try {
            String[] sal = VersionLookup.getSales().split(",");

            if (sal[n].equals("0")) {
                bo = true;
            }
        } catch (Exception ex) {
            String ss = "Method : getSalesBoolean     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return bo;
    }

    public boolean getInventoryBoolean(int n) {
        String[] invnt = VersionLookup.getInventory().split(",");
        boolean bo = false;
        if (invnt[n].equals("0")) {
            bo = true;
        }
        return bo;
    }

    public boolean getMastersBoolean(int n) {
        String[] mastr = VersionLookup.getMasters().split(",");
        boolean bo = false;
        if (mastr[n].equals("0")) {
            bo = true;
        }
        return bo;
    }

    public boolean getFinancialBoolean(int n) {
        String[] finan = VersionLookup.getFinancial().split(",");
        boolean bo = false;
        if (finan[n].equals("0")) {
            bo = true;
        }
        return bo;
    }

    public boolean getCRMBoolean(int n) {
        String[] crm1 = VersionLookup.getCRM().split(",");
        boolean bo = false;
        if (crm1[n].equals("0")) {
            bo = true;
        }
        return bo;
    }

    public boolean getReportsBoolean(int n) {
        String[] rep = VersionLookup.getReports().split(",");
        boolean bo = false;
        if (rep[n].equals("0")) {
            bo = true;
        }
        return bo;
    }

    public static int getSalesInt(int n) {
        String[] sal = VersionLookup.getSales().split(",");
        int bo = 0;
        bo = Integer.parseInt(sal[n]);
        return bo;
    }

    public int getInventoryInt(int n) {
        String[] invnt = VersionLookup.getInventory().split(",");
        int bo = 0;
        bo = Integer.parseInt(invnt[n]);
        return bo;
    }

    public static int getMastersInt(int n) {
        String[] mastr = VersionLookup.getMasters().split(",");
        int bo = 0;
        bo = Integer.parseInt(mastr[n]);
        return bo;
    }

    public int getFinancialInt(int n) {
        String[] finan = VersionLookup.getFinancial().split(",");
        int bo = 0;
        bo = Integer.parseInt(finan[n]);
        return bo;
    }

    public int getCRMInt(int n) {
        String[] crm1 = VersionLookup.getCRM().split(",");
        int bo = 0;
        bo = Integer.parseInt(crm1[n]);
        return bo;
    }

    public int getReportInt(int n) {
        String[] rep = VersionLookup.getReports().split(",");
        int bo = 0;
        bo = Integer.parseInt(rep[n]);
        return bo;
    }

    String updateVal(String s, String m, String user) {
        String salPriv1 = "";
        String salQue = "";
        try {
            salQue = "select " + m + " from user_info where user_name='" + user + "'";
            String[] salPriv = getQueryValue(salQue).split(",");
            String[] salVerLook = s.split(",");
            int sal = 0;
            for (String j : salPriv) {
                if (sal > 0) {
                    salPriv1 += ",";
                }
//                if (!status.equals("Standard")) {
                if (salVerLook[sal].equals("0")) {
                    j = salVerLook[sal];
                }
//                }

                salPriv1 += j;
                sal++;
            }
        } catch (Exception ex) {
            String ss = "Method : updateVal(String , int, String)       Exception :" + ex.getMessage() + "         Query :" + salQue;
            log.debug(ss);
        }
        return salPriv1;
    }

    String updateVal(String m, String user) {
        String salPriv1 = "";
        String salQue = "";
        try {
            salQue = "select " + m + " from user_info where user_name='" + user + "'";

            String[] salPriv = getQueryValue(salQue).split(",");
            //(salQue).split(",");
            int sal = 0;
            for (String j : salPriv) {
                if (sal > 0) {
                    salPriv1 += ",";
                }
                salPriv1 += "3";
                sal++;
            }
        } catch (Exception ex) {
            String ss = "Method : updateVal(String , int, String)       Exception :" + ex.getMessage() + "         Query :" + salQue;
            log.debug(ss);
        }
        return salPriv1;
    }

    public boolean getUserPrivUpdate() {

        String UpdateQue = "";
        try {
            String[] user = getUserName("");
            String status = "Standard";//GetProductInfo.getStatus();

            String salPriv1 = "";
            String invPriv1 = "";
            String masPriv1 = "";
            String finPriv1 = "";
            String crmPriv1 = "";
            String repPriv1 = "";

            for (String i : user) {
                if (status.equals("Standard")) {
                    if (getUserType(i).equals("Admin")) {
                        salPriv1 = updateVal("sales", i);
                        invPriv1 = updateVal("inventory", i);
                        masPriv1 = updateVal("masters", i);
                        finPriv1 = updateVal("financial", i);
                        crmPriv1 = updateVal("crm", i);
                        repPriv1 = updateVal("reports", i);
                    } else {
                        salPriv1 = updateVal(VersionLookup.getSales(), "sales", i);
                        invPriv1 = updateVal(VersionLookup.getInventory(), "inventory", i);
                        masPriv1 = updateVal(VersionLookup.getMasters(), "masters", i);
                        finPriv1 = updateVal(VersionLookup.getFinancial(), "financial", i);
                        crmPriv1 = updateVal(VersionLookup.getCRM(), "crm", i);
                        repPriv1 = updateVal(VersionLookup.getReports(), "reports", i);
                    }
                } else {
                    salPriv1 = updateVal(VersionLookup.getSales(), "sales", i);
                    invPriv1 = updateVal(VersionLookup.getInventory(), "inventory", i);
                    masPriv1 = updateVal(VersionLookup.getMasters(), "masters", i);
                    finPriv1 = updateVal(VersionLookup.getFinancial(), "financial", i);
                    crmPriv1 = updateVal(VersionLookup.getCRM(), "crm", i);
                    repPriv1 = updateVal(VersionLookup.getReports(), "reports", i);
                }
                UpdateQue = "UPDATE user_info SET sales ='" + salPriv1 + "' , inventory ='" + invPriv1 + "' ,  masters ='" + masPriv1 + "' ,  financial ='" + finPriv1 + "' , crm ='" + crmPriv1 + "', reports ='" + repPriv1 + "' where user_name='" + i + "'";
                //     DBData.queryExecution(UpdateQue);
            }
        } catch (Exception ex) {
            String ss = "Method : getUserPrivUpdate        Exception :" + ex.getMessage() + "       Query :" + UpdateQue;
            log.debug(ss);
            return false;
        }
        return true;
    }

    public Boolean getPriv(String modname, String uname) {
        Boolean priv = false;
        try {
            if (checkName(uname) == false) {

                String access = getPrivileges(modname, uname);
                String[] modulePerm = access.split(",");
                for (int i = 0; i < modulePerm.length; i++) {
                    if (Integer.parseInt(modulePerm[i]) != 0) {
                        priv = true;
                    }
                }
            }
        } catch (Exception ex) {
            log.debug("Class :GetUserInfo Method : getPriv    Exception :" + ex.getMessage());
        }

        return priv;
    }

    public Integer getMenuPriv(String module, String submodule) {
        String version = "Standard";
        Integer result = 0;
        try {
            String query = "SELECT " + version + " FROM version_formlookup where object='Settings' and module='" + module + "'and submodule='" + submodule + "'";
            ResultSet rs = DBConnection.getStatement().executeQuery(query);
            while (rs.next()) {
                result = rs.getInt(version);
            }
        } catch (Exception ex) {
            String ss = "Class:GetUserInfo  Method :public static Integer getPriv(String module,String submodule) Exception :" + ex.getMessage();
            log.debug(ss);
        }

        return result;
    }

    public String[] getQueryValue(String que, int cnt) {
        String[] value = new String[cnt];
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(que);
            while (rs.next()) {
                for (int i = 0; i < cnt; i++) {
                    value[i] = rs.getString(i + 1);
                }
            }
        } catch (Exception ex) {
            String ss = "Class : DBData  Method  : getQueryValue():String[]   Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return value;
    }

    public String getQueryValue(String que) {
        String value = "";
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery(que);
            while (rs.next()) {
                value = rs.getString(1);
            }
        } catch (Exception ex) {
            String ss = "Class : DBData  Method  : getQueryValue():StringException:" + ex.getMessage();
            log.debug(ss);
        }
        return value;
    }

    public static String getServerDetails(int n) {

        String value = "";
        try {
            String sql = "";
            if (n == 0) {
                sql = "select ip_address from server_details";
            } else {
                sql = "select port_address from server_details";
            }
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                 value = rs.getString(1);

               
            }
        } catch (Exception ex) {
            String ss = "Class : DBData  Method  : getQueryValue():StringException:" + ex.getMessage();

            log.debug(ss);
        }
        return value;

    }
}
