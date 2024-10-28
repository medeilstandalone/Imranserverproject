package com.vanuston.medeil.util;

import java.sql.Connection;
import java.sql.DriverManager;
//import java.sql.SQLException;
import java.sql.Statement;
//import javax.sql.DataSource;
//import javax.swing.JOptionPane;


public class DBConnection {    

    public final String NAME = "NAME";
    static Logger log = Logger.getLogger(DBConnection.class, "Utilities");
    private static Connection con = null;
    private static Connection conT = null;
    private static Statement stmt = null;
    private static String protocal = "jdbc:mysql";
    private static String host = "localhost";
    private static String db = "medil";
    private static String dbuser = "root";
    private static String port = "3356";
    private static String driver = "com.mysql.jdbc.Driver";
    static long totalMem = 0 ;
    
    public static Connection getConnection() {        

        if(Runtime.getRuntime().totalMemory()/(1024*1024) > totalMem) {
            log.debug("Method:getConnection Entry Free:"+Runtime.getRuntime().freeMemory()/(1024*1024)+", Total:"+Runtime.getRuntime().totalMemory()/(1024*1024)+", Max:"+Runtime.getRuntime().maxMemory()/(1024*1024));            
        }
        totalMem = Runtime.getRuntime().totalMemory()/(1024*1024);
        long maxMem = (Runtime.getRuntime().maxMemory()/(1024*1024));
        if(totalMem > ( maxMem - ( (10/100) * maxMem))) {
            log.debug("VM has reached a maximum reserved space of the system.Restart the medeil to be avoid data loss/crash");
        }

        if (conT == null) {
            makeTransConnection();
        }
//        return conT;
//        BasicDataSource ds=getDataSource();
//        Connection conn=null;
//        regDriver();
//        try {
//            conn=ds.getConnection();
//            conT = conn;
//        } catch(SQLException e) {
//            log.debug("getConnection(): "+e.getMessage());
//        }        
        return conT;
    }    
    public static Statement getStatement() {
        try {
            stmt = getConnection().createStatement();
        } catch (Exception ex) {
            String ss = "Class : DBConnection  Method  : getStatement     Exception :" + ex.getMessage();
            log.debug(ss);
            conT = null;
        }
        return stmt;
    }

    private static void regDriver() {
        try {
            Class.forName(driver);
        } catch (Exception ex) {
            String ss = "Class : DBConnection  Method  : regDriver  Exception :" + ex.getMessage();
            log.debug(ss);
        }
    }
    private static String getDBConURL() {
        return protocal+"://"+host+":"+port+"/"+db;
    }

//    private static org.apache.commons.dbcp.BasicDataSource getDataSource(){
//
//        String tmp ="MEdeiLDemO@2010";
//            org.apache.commons.dbcp.BasicDataSource ds = new org.apache.commons.dbcp.BasicDataSource();
//            try{
//            ds.setDriverClassName(driver);
//            ds.setUsername(dbuser);
//            ds.setUrl(getDBConURL());
//            ds.setPassword(tmp);
//            ds.setMaxActive(5);
//            ds.setMaxIdle(2);
//        }catch(Exception e){
//            log.debug("getDataSource:"+e.getMessage());
//        }
//        return ds;
//    }
    private static Connection makeTransConnection() {
        log.debug("Class:DBConnection Method:makeTransConnection Entry Free:"+Runtime.getRuntime().freeMemory()/(1024*1024)+", Total:"+Runtime.getRuntime().totalMemory()/(1024*1024)+", Max:"+Runtime.getRuntime().maxMemory()/(1024*1024));
        try {
            String tmp ="MEdeiLDemO@2010";
            if (!tmp.equals("Error")) {
                regDriver();
                conT = DriverManager.getConnection(getDBConURL(), dbuser, tmp);
//                conT = ds.getConnection();
            }
        } catch (Exception ex) {
            String ss = "Class : DBConnection  Method  : makeTransConnection  Exception :" + ex.getMessage();
            log.debug(ss);
            
        }
        log.debug("Class:DBConnection Method:makeTransConnection Exit Max:"+Runtime.getRuntime().totalMemory()/(1024*1024));
        return conT;
    }

    public static Boolean testConnection() {
        Boolean s = true;
        try {

          String tmp ="MEdeiLDemO@2010";
            if (!tmp.equals("Error")) {
                regDriver();
                Connection cn =null;
                cn = DriverManager.getConnection(getDBConURL(), dbuser, tmp);
                if (cn != null) {
                    s = false;
                }
            }
        } catch (Exception ex) {
            String ss = "Class : DBConnection  Method  : testConnection  Exception :" + ex;
            log.debug(ss);

        }
        return s;
    }

    public static void closeAllConnections() {
        try {
            if (con != null) {
                con.close();
            }
            con = null;
        } catch (Exception ex) {
            String ss = "Class : DBConnection  Method  : closeAllConnections     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        try {
            if (conT != null) {
                conT.close();
            }
            conT = null;
        } catch (Exception ex) {
            String ss = "Class : DBConnection  Method  : closeAllConnections     Exception :" + ex.getMessage();
            log.debug(ss);
        }
    }

    @Override
    public void finalize() {
        try {
            if (con != null) {
                con.close();
            }
            con = null;
        } catch (Exception ex) {
            String ss = "Class : DBConnection  Method  : finalize     Exception :" + ex.getMessage();
            log.debug(ss);
        }
        try {
            if (conT != null) {
                conT.close();
            }
            conT = null;
        } catch (Exception ex) {
            String ss = "Class : DBConnection  Method  : finalize     Exception :" + ex.getMessage();
            log.debug(ss);
        }
    }
}
