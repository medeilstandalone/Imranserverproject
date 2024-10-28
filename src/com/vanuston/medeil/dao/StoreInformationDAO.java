/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.dao;

import com.vanuston.medeil.implementation.StoreInformation;
import com.vanuston.medeil.model.StoreInformationModel;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Logger;
import java.sql.ResultSet;
import java.sql.CallableStatement;
import java.sql.Types;

/**
 *
 * @author Administrator
 */
public class StoreInformationDAO implements StoreInformation {

    static Logger log = Logger.getLogger(SettingsDAO.class, "com.vanuston.medeil.dao.StoreInformationDAO");

    @Override
    public Object viewRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean deleteRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Object createRecord(Object object) {
        Boolean insert = false;
        int returnFlagCount = 0;
        StoreInformationModel storeInformationModel = (StoreInformationModel) object;
        try {

            if(storeInformationModel.getSaveType()==1){
            Double setupCostOpenBalance = 0.00;
            String sql = "select open_cash_balance from shop_information";
            ResultSet rs = DBConnection.getStatement().executeQuery(sql);
            while (rs.next()) {
                setupCostOpenBalance = rs.getDouble("open_cash_balance");
            }
            double finalCost = 0.00;
            String curDate = DateUtils.now("yyyy-MM-dd");
            if (setupCostOpenBalance != null) {
                
                finalCost = storeInformationModel.getOpenCashBalanceCost() - setupCostOpenBalance;
           //     sql = "SELECT open_cash_balance, close_cash_balance from dailycashbook where dsb_date='" + curDate + "' ";
                 sql = "SELECT opening_balance, closing_balance from cash_flow ";

                rs = DBConnection.getStatement().executeQuery(sql);
                while (rs.next()) {
                    double openbal = rs.getDouble("opening_balance");
                    double closebal = rs.getDouble("closing_balance");
                    openbal = openbal + finalCost;
                    closebal = closebal + finalCost;
                  //  DBConnection.getStatement().executeUpdate("update dailycashbook set open_cash_balance='" + openbal + "',close_cash_balance='" + closebal + "' where dsb_date='" + curDate + "'");
                      DBConnection.getStatement().executeUpdate("update cash_flow set opening_balance='" + openbal + "',closing_balance='" + closebal + "' ");
                }
            }


        }
            String query = "call pro_saveshopinformation(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            CallableStatement shopInformationCall = DBConnection.getConnection().prepareCall(query);

            shopInformationCall.setString(1, storeInformationModel.getStoreName());
            shopInformationCall.setString(2, storeInformationModel.getOwnerName());
            shopInformationCall.setString(3, storeInformationModel.getStoreAddress1());
            shopInformationCall.setString(4, storeInformationModel.getStoreAddress2());
            shopInformationCall.setString(5, storeInformationModel.getStoreAddress3());
            shopInformationCall.setString(6, storeInformationModel.getStoreCity());
            shopInformationCall.setString(7, storeInformationModel.getStoreState());
            shopInformationCall.setString(8, storeInformationModel.getStoreCountry());
            shopInformationCall.setString(9, storeInformationModel.getStorePinCode());
            shopInformationCall.setString(10, storeInformationModel.getStoreContactNo1());
            shopInformationCall.setString(11, storeInformationModel.getStoreContactNo2());
            shopInformationCall.setString(12, storeInformationModel.getStoreMobileNo());
            shopInformationCall.setString(13, storeInformationModel.getStoreEmailId());
            shopInformationCall.setString(14, storeInformationModel.getDLNo());
            shopInformationCall.setString(15, storeInformationModel.getLicenseHolder());
            shopInformationCall.setString(16, storeInformationModel.getTinNo());
            shopInformationCall.setString(17, storeInformationModel.getCSTNo());
            shopInformationCall.setString(18, storeInformationModel.getPANNo());
          //  shopInformationCall.setString(19, storeInformationModel.getCommodityCode());
            shopInformationCall.setString(19, storeInformationModel.getPharmacistName());
            shopInformationCall.setString(20, storeInformationModel.getPharmacistAddress1());
            shopInformationCall.setString(21, storeInformationModel.getPharmacistAddress2());
            shopInformationCall.setString(22, storeInformationModel.getPharmacistCity());
            shopInformationCall.setString(23, storeInformationModel.getPharmacistState());
            shopInformationCall.setString(24, storeInformationModel.getPharmacistCountry());
            shopInformationCall.setString(25, storeInformationModel.getRegisterationNo());
            shopInformationCall.setString(26, storeInformationModel.getValidity());
            shopInformationCall.setString(27, storeInformationModel.getPharmacistContactNo1());
            shopInformationCall.setString(28, storeInformationModel.getPharmacistMobileNo());
            shopInformationCall.setString(29, storeInformationModel.getPharmacistEmailId());
            shopInformationCall.setString(30, storeInformationModel.getUserName());
            shopInformationCall.setString(31, storeInformationModel.getPassword());
            shopInformationCall.setString(32, storeInformationModel.getConfirmPassword());
            shopInformationCall.setString(33, storeInformationModel.getStoreFaxNo());
            shopInformationCall.setString(34, storeInformationModel.getPharmacistPinCode());
            shopInformationCall.setString(35, storeInformationModel.getStoreRmailPassword());
            shopInformationCall.setDouble(36, storeInformationModel.getOpenCashBalanceCost());
            shopInformationCall.setDouble(37, storeInformationModel.getBulidingCost());
            shopInformationCall.setDouble(38, storeInformationModel.getLeaseAdvanceDepositCost());
            shopInformationCall.setDouble(39, storeInformationModel.getRegisterationFeeCost());
            shopInformationCall.setDouble(40, storeInformationModel.getElectricalLightingCost());
            shopInformationCall.setDouble(41, storeInformationModel.getCarpentaryCost());
            shopInformationCall.setDouble(42, storeInformationModel.getRefrigerationCost());
            shopInformationCall.setDouble(43, storeInformationModel.getAirConditionCost());
            shopInformationCall.setDouble(44, storeInformationModel.getDisplayBoardCost());
            shopInformationCall.setDouble(45, storeInformationModel.getComputerPeripheralsCost());
            shopInformationCall.setDouble(46, storeInformationModel.getOthersCost());
            shopInformationCall.setDouble(47, storeInformationModel.getTotalCost());
            shopInformationCall.setDouble(48, storeInformationModel.getSaveType());
            shopInformationCall.registerOutParameter(49, Types.INTEGER);
            shopInformationCall.executeUpdate();

            int returnFlag = shopInformationCall.getInt("flag");
            if (returnFlag == 1) {
                returnFlagCount++;
            }

            insert = true;

        } catch (Exception e) {
            insert = false;
            log.debug(" Class : ShopInformationDAO  Method   : CreateRecord Exception :" + e.getMessage());
        }
        return insert;
    }

    @Override
    public Object updateRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public StoreInformationModel tableValues() {

        StoreInformationModel listModel = new StoreInformationModel();
        try {

            ResultSet rs = DBConnection.getStatement().executeQuery("select * from shop_information");
            while (rs.next()) {

                listModel.setStoreName(rs.getString("shop_name"));
                listModel.setOwnerName(rs.getString("owner_name"));
                listModel.setStoreAddress1(rs.getString("address1"));
                listModel.setStoreAddress2(rs.getString("address2"));
                listModel.setStoreAddress3(rs.getString("address3"));
                listModel.setStoreCity(rs.getString("city"));
                listModel.setStoreCountry(rs.getString("country"));
                listModel.setStoreState(rs.getString("state"));
                listModel.setStorePinCode(rs.getString("pincode"));
                listModel.setStoreContactNo1(rs.getString("contact_no1"));
                listModel.setStoreContactNo2(rs.getString("contact_no2"));
                listModel.setStoreMobileNo(rs.getString("mobile_no"));
                listModel.setStoreEmailId(rs.getString("email_id"));
                listModel.setStoreFaxNo(rs.getString("fax_no"));
                listModel.setLicenseHolder(rs.getString("license_holder"));
                listModel.setPharmacistName(rs.getString("pharmacist_name"));
                listModel.setPharmacistAddress1(rs.getString("phar_address1"));
                listModel.setPharmacistAddress2(rs.getString("phar_address2"));
                listModel.setPharmacistCity(rs.getString("phar_city"));
                listModel.setPharmacistCountry(rs.getString("phar_country"));
                listModel.setPharmacistState(rs.getString("phar_state"));
                listModel.setPharmacistContactNo1(rs.getString("phar_contact_no1"));
                listModel.setPharmacistMobileNo(rs.getString("phar_contact_no2"));
                listModel.setPharmacistEmailId(rs.getString("phar_email_id"));
                listModel.setDLNo(rs.getString("dl_no"));
                listModel.setTinNo(rs.getString("tin_no"));
                listModel.setCSTNo(rs.getString("cst_no"));
                listModel.setPANNo(rs.getString("Pan_no"));
                listModel.setRegisterationNo(rs.getString("phar_registration_no"));
                listModel.setValidity(rs.getString("phar_validity"));
                listModel.setUserName(rs.getString("phar_user_name"));
                listModel.setPassword(rs.getString("phar_password"));
                listModel.setConfirmPassword(rs.getString("phar_confirm_password"));
                listModel.setPharmacistPinCode(rs.getString("phar_pincode"));
                listModel.setStoreRmailPassword(rs.getString("email_pwd"));
                //SetupCost Values
                listModel.setOpenCashBalanceCost(rs.getDouble("open_cash_balance"));
                listModel.setBulidingCost(rs.getDouble("building_cost"));
                listModel.setLeaseAdvanceDepositCost(rs.getDouble("lease_cost_advance"));
                listModel.setRegisterationFeeCost(rs.getDouble("registration_cost"));
                listModel.setElectricalLightingCost(rs.getDouble("eb_cost"));
                listModel.setCarpentaryCost(rs.getDouble("carpent_cost"));
                listModel.setRefrigerationCost(rs.getDouble("refrigerator_cost"));
                listModel.setAirConditionCost(rs.getDouble("ac_cost"));
                listModel.setDisplayBoardCost(rs.getDouble("displayboard_cost"));
                listModel.setComputerPeripheralsCost(rs.getDouble("computergood_cost"));
                listModel.setOthersCost(rs.getDouble("other_cost"));
                listModel.setTotalCost(rs.getDouble("total_cost"));

            }


        } catch (Exception e) {
            log.debug("Class: StoreInformation Method L tableValues() Error :" + e.getMessage());
        }
        return listModel;
    }
}
