/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.dao;

import com.vanuston.medeil.implementation.CustomerAlerts;
import com.vanuston.medeil.model.CustomerAlertModel;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;
 
import java.sql.Types;

/**
 *
 * @author Administrator
 */
public class CustomerAlertDAO implements CustomerAlerts{
    static Logger log = Logger.getLogger(PaymentDAO.class, "com.vanuston.medeil.dao.CustomerAlertDAO");
    @Override
    public Object viewRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean deleteRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Object createRecord(Object customerAlertModels) {
        boolean isCreate = false ;
        CustomerAlertModel customerAlertsModel = (CustomerAlertModel) customerAlertModels ;
        try {
            String sql="CALL pro_customeralerts_dao(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            java.sql.CallableStatement cs=DBConnection.getConnection().prepareCall(sql);

            cs.setInt( "custalertno" , customerAlertsModel.getAlertNo() ) ;
            cs.setString ( "custname" , customerAlertsModel.getCustomerName() ) ;
            cs.setString ( "custcode" , customerAlertsModel.getCustomerCode() ) ;
            cs.setDate ( "alertdate" , customerAlertsModel.getDate())  ;
            cs.setString ( "alerttype" , customerAlertsModel.getAlertType() ) ;
//            if(customerAlertsModel.getAlertType().equals("SMS")) {
                cs.setDate ( "smsdate" , customerAlertsModel.getSmsAlertDate())  ;
                cs.setString ( "smsmobile1" , customerAlertsModel.getMobileNo1() ) ;
                cs.setString ( "smsmobile2" , customerAlertsModel.getMobileNo2() ) ;
                cs.setString ( "smsmsg" , customerAlertsModel.getSmsMessage() ) ;
//            } else {
                cs.setDate ( "emaildate" , customerAlertsModel.getEmailAlertDate())  ;
                cs.setString ( "mailid1" , customerAlertsModel.getEmailId1() ) ;
                cs.setString ( "mailid2" , customerAlertsModel.getEmailId2() ) ;
                cs.setString ( "mailmsg" , customerAlertsModel.getEmailMessage() ) ;
//            }
            cs.setInt ( "calertflagid" , customerAlertsModel.getSentCode() ) ;
            cs.setString("functionality", "save");
            cs.registerOutParameter("status_flag", Types.INTEGER);

           cs.executeUpdate();
            if( cs.getInt("status_flag") == 1 ) {
                isCreate = true ;
            }
      } catch (Exception e) {
        log.debug(e.getMessage());
      }
        return isCreate ;
    }

    @Override
    public Object updateRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
