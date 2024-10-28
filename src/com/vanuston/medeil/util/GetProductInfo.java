package com.vanuston.medeil.util;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CommonImplements;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import medil.activate.CheckValid;

public class GetProductInfo {

    public Integer install = 0;
    CommonImplements commonController;
    
    public GetProductInfo() throws RemoteException, NotBoundException {
        commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);

    }
    DateUtils dutil = new DateUtils();
    static Logger log = Logger.getLogger(GetProductInfo.class, "GetProductInfo");

    public Integer getValidity() {
        Integer validity = 0;
        String query = "select validity from license_details";
        try {
            commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
            validity = commonController.getQueryWitCol(query, "validity");
        } catch (Exception ex) {
            String ss = "Class:GetProductInfo  Method : getValidity    Exception :" + ex + " Query :" + query;
            log.debug(ss);
        }
        return validity;
    }

    public String getStatus() {
        String Status = "";
        String query = "select mode from license_details";
        try {
            commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
            Status = commonController.getQueryValue(query);
        } catch (Exception ex) {
            String ss = "Class:GetProductInfo  Method : getStatus    Exception :" + ex.getMessage() + " Query :" + query;
            log.debug(ss);
        }
        return Status;
    }

    public String getLicenceHolder() {
        String licenceTo = "";
        String query = "select lic_holder_name from license_details";
        try {
            commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
            licenceTo = commonController.getQueryValue(query);
        } catch (Exception ex) {
            String ss = "Class:GetProductInfo  Method : getLicenceHolder    Exception :" + ex.getMessage() + " Query :" + query;
            log.debug(ss);
        }
        return licenceTo;
    }

    public String getActivationCode() {
        String act_code = "";
        String query = "select act_code from license_details";
        try {
            commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
            act_code = commonController.getQueryValue(query);
        } catch (Exception ex) {
            String ss = "Class:GetProductInfo  Method : getLicenceHolder    Exception :" + ex.getMessage() + " Query :" + query;
            log.debug(ss);
        }
        return act_code;
    }

    public String getInstallDate() {
        String date_time = "Nil";
        String query = "select date_time from license_details";
        try {
            commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
            date_time = commonController.getQueryValue(query);
        } catch (Exception ex) {
            String ss = "Class:GetProductInfo  Method : getInstallDate    Exception :" + ex.getMessage() + " Query :" + query;
            log.debug(ss);
        }
        return date_time;
    }

    public String getExpiryDate() {
        String date_time = null;
        String query = "select validity,date_time from license_details";
        try {
            int valid = getValidity();
            Date Expiry = dutil.chngeFormatStringToDate(getInstallDate());
            Calendar c = Calendar.getInstance();
            c.setTime(Expiry);
            c.add(Calendar.DATE, valid);
            date_time = dutil.changeFormatDate(c.getTime());
        } catch (Exception ex) {
            String ss = "Class:GetProductInfo  Method : getExpiryDate    Exception :" + ex.getMessage() + " Query :" + query;
            log.debug(ss);
        }
        return date_time;
    }

    public Integer getLicenceCount() {
        Integer cnt = 0;
        try {
            commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
            cnt = commonController.selectCountQuryExe("select count(*) from license_details");
        } catch (Exception e) {
            log.debug("Method:getLicenceCount Exception:"+e.getMessage());
        }
        return cnt;
    }

    public Integer getRemainingDays() {
        int RemainingDays = 0;
        String installedDate = null;
        try {
            installedDate = getInstallDate();
            int valid = getValidity();
            Date insdDate = dutil.chngeFormatStringToDate(installedDate);
            Date currDate = dutil.chngeFormatStringToDate(dutil.now("yyyy-MM-dd"));
            Long DaysUsed = currDate.getTime() - insdDate.getTime();
            DaysUsed /= (24 * 60 * 60 * 1000);
            RemainingDays = (valid - 1) - DaysUsed.intValue();
        } catch (Exception ex) {
            String ss = "Class:GetProductInfo  Method : getExpiryDate    Exception :" + ex;
            log.debug(ss);
        }
        return RemainingDays;
    }

    public Boolean CheckActivate() {
        Boolean act = false;
        try {
            LogReg logR = new LogReg();
            Integer RemainingDays = logR.getRemainingDays();
            Integer getLice = getLicenceCount();
            if (getLice <= 0) {
                log.debug("Class:GetProductInfo   Licence details not available in database");
            } else {
                WinRegistry winReg = new WinRegistry();
                install = getLicenceCount();
                String mode = getStatus();
                String licence_holder = getLicenceHolder();
                String activation_code = getActivationCode();

                if (mode.equals("Trial")) {
                    if (RemainingDays >= 0) {
                        act = true;
                    }
                } else if (mode.equals("Professional") || mode.equals("Standard") || mode.equals("Express") || mode.equalsIgnoreCase("Free")) {
                    if (activation_code.equals("") || activation_code == null || licence_holder.equals("") || licence_holder == null) {
                        act = true;
                    } else {
                        ArrayList regVal = winReg.getValue();
                        if (regVal.get(0) == "NA") {
                            act = false;
                            log.debug("Invalid installed date in registartion entry!");
                        } else {
                            if (activation_code.equals(winReg.convertHexToString(regVal.get(2).toString())) && licence_holder.equals(winReg.convertHexToString(regVal.get(3).toString()))) {
                                if (RemainingDays >= 0) {
                                    act = new CheckValid().isValid(licence_holder, activation_code);                                    
                                }
                            }
                        }
                    }
                }
            }
        } catch (Exception ex) {
            String ss = "Class:GetProductInfo Method : CheckActivate    Exception " + ex.getMessage();
            log.debug(ss);
        }
        return act;
    }

    public Integer get_shop_flag_id() {
        Integer flag = 0;
        String query = "select flag_id from shop_information";
        try {
            commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
            flag = commonController.getQueryWitCol(query, "flag_id");
        } catch (Exception ex) {
            String ss = "Class:GetProductInfo  Method : get_shop_flag_id    Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return flag;
    }

    public Integer get_settings_flag_id() {
        Integer flag = 0;
        String query = "select flag_id from settings_config";
        try {
            commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
            flag = commonController.getQueryWitCol(query, "flag_id");
        } catch (Exception ex) {
            String ss = "Class:GetProductInfo  Method : get_settings_flag_id    Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return flag;
    }

    public Boolean configurated() {
        Boolean result = false;
        try {
            if (get_shop_flag_id() == 1 && get_settings_flag_id() == 1 && install > 0) {
                result = true;
            }
        } catch (Exception ex) {
            String ss = "Class:GetProductInfo  Method : configurated    Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return result;
    }

    public static String getMotherboardSN() {
        String result = "";
        try {
            File file = File.createTempFile("Board_Serial", ".vbs");
            file.deleteOnExit();
            FileWriter fw = new java.io.FileWriter(file);

            String vbs =
                    "Set objWMIService = GetObject(\"winmgmts:\\\\.\\root\\cimv2\")\n"
                    + "Set colItems = objWMIService.ExecQuery _ \n"
                    + " (\"Select * from Win32_BaseBoard\") \n"
                    + "For Each objItem in colItems \n"
                    + " Wscript.Echo objItem.SerialNumber \n"
                    + " exit for  \n"
                    + "Next \n";

            fw.write(vbs);
            fw.close();
            Process p = Runtime.getRuntime().exec("cscript //NoLogo " + file.getPath());
            BufferedReader input =
                    new BufferedReader(new InputStreamReader(p.getInputStream()));
            String line;
            while ((line = input.readLine()) != null) {
                result += line;
            }
            input.close();
        } catch (Exception e) {
            log.debug("Class : Class :SendSystemInfo  Method :getMotherboardSN() " + e.getMessage());
        }
        log.debug("Class : Class :SendSystemInfo  Method :MotherboardSN=" + result);

        return "AZRQ93000W2V";
    }

    public static String HDD_DriveSN(String drive) {
        String result = "";
        try {
            File file = File.createTempFile("HDD_Serial", ".vbs");
            file.deleteOnExit();
            FileWriter fw = new java.io.FileWriter(file);

            String vbs = "Set objFSO = CreateObject(\"Scripting.FileSystemObject\")\n"
                    + "Set colDrives = objFSO.Drives\n"
                    + "Set objDrive = colDrives.item(\"" + drive + "\")\n"
                    + "Wscript.Echo objDrive.SerialNumber";
            fw.write(vbs);
            fw.close();
            Process p = Runtime.getRuntime().exec("cscript //NoLogo " + file.getPath());
            BufferedReader input =
                    new BufferedReader(new InputStreamReader(p.getInputStream()));
            String line;
            while ((line = input.readLine()) != null) {
                result += line;
            }
            input.close();
        } catch (Exception e) {
            log.debug("Class : Class :SendSystemInfo  Method :HDD_DriveSN(String drive) " + e.getMessage());
        }
     
        return "457401905";
    }
    public static void StockMaintenanceInsert(String today) {

        try {

//            String sql="select * from drugtable where itemcode NOT IN (select item_code from stock_Statement)";
//
//            ResultSet rs=DBConnection.getStatement().executeQuery(sql);
//            while(rs.next()){
//            //    itemcode, item_id, therapeutic, subtherapeutic, indication, itemname, dosage, vat, company_name, mfgname, genericname_dosage, genericname, formulation_length, formulation, schedule, package, mrp, dru_flag_id, created_date
//            String sql1="insert into stock_statement values('"+rs.getString("itemcode")+"', null, '"+rs.getString("itemname").concat("_").concat(rs.getString("dosage"))+"', '', '', '', 'NA', 0, 1, '2025-01-01', '"+rs.getString("mrp")+"', 0.00,'"+rs.getString("mrp")+"', 0.0, '"+rs.getString("formulation")+"', '2012-04-23', 0, 0, 0)";

//            DBConnection.getStatement().executeUpdate(sql1);
//
//            }



            int cnt = 0;
            ResultSet rs = null;
            String sq = "select count(ss_no) as sa  from stock_statement where stock_date='" + today + "'";
            log.debug(sq);
            rs = DBConnection.getStatement().executeQuery(sq);
            while (rs.next()) {
                cnt = rs.getInt("sa");
            }
            if (cnt == 0) {
                String sql = "insert into stock_maintenance (stock_date, item_code,item_name,batch_no,opening_stock,unit_price,total_amount) select '"+today+"',ss.item_code, ss.item_name, ss.batch_no, ss.qty, ss.purchase_price, (ss.qty * ss.purchase_price) from stock_statement ss where ss.qty>0";
                    log.debug("Method:StockMaintenanceInsert query_2:"+sql);
		    int results=DBConnection.getStatement().executeUpdate(sql);

		    int result1 = DBConnection.getStatement().executeUpdate("update stock_statement set stock_date='" + today + "'");
                    log.debug("Method:StockMaintenanceInsert query_3:update stock_statement set stock_date='" + today + "'"+", results 0:"+results+", 1:"+result1);

                /*rs = DBConnection.getStatement().executeQuery("select *  from stock_statement where qty>0");
                while (rs.next()) {
                    String sql = "insert into stock_maintenance(stock_date,item_code,item_name,batch_no,opening_stock,unit_price,total_amount)values('" + today + "','" + rs.getString("item_code") + "','" + rs.getString("item_name") + "','" + rs.getString("batch_no") + "','" + rs.getString("qty") + "','" + rs.getString("purchase_price") + "','" + rs.getInt("qty") * rs.getDouble("purchase_price") + "') ";
                    DBConnection.getStatement().executeUpdate(sql);
                }
                DBConnection.getStatement().executeUpdate("update stock_statement set stock_date='" + today + "'");*/
            }

             DBConnection.getStatement().executeUpdate("update server_details set ip_address='" +RegistryFactory.serverHostIP + "'");
        } catch (Exception ex) {
            String msg = "Class : GetInformation  Method : StockMaintenanceInsert()   =" + ex.getMessage();
            log.debug(msg);
        }
    }

}
