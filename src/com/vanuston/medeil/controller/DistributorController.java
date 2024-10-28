/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.DistributorDAO;
import com.vanuston.medeil.implementation.Distributor;
import com.vanuston.medeil.model.DistributorModel;
import com.vanuston.medeil.util.Logger;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
/**
 *
 * @author San
 */
public class DistributorController extends UnicastRemoteObject implements Distributor{

    Logger log = Logger.getLogger(DistributorController.class,"DistributorController");
    public DistributorController() throws RemoteException {
        super();
    }

    @Override
    public Object createRecord(Object distributorModel) {
        Object isCreate=(boolean)false;
        try{
            DistributorDAO distributorDAO=new DistributorDAO();
            isCreate=distributorDAO.createRecord(distributorModel);
            if(isCreate.equals(true)){
                isCreate=true;
            }
        }
        catch(Exception e){
            log.debug("err in Controller in createrecord():"+e);
            return isCreate=false;
        }
        return isCreate;
    }

    @Override
    public Object updateRecord(Object distributorModel) {
        Object isUpdate=false;
        try{
            DistributorDAO distributorDAO=new DistributorDAO();
            isUpdate=distributorDAO.updateRecord(distributorModel);
            if(isUpdate.equals(true)){
                isUpdate=true;
            }
        }
        catch(Exception e){
            log.debug("err in Controller in updaterecord():"+e.getMessage());
            return isUpdate=false;
        }
        return isUpdate;
    }

    @Override
    public boolean deleteRecord(Object distributorModel) {
        boolean isDelete=false;
        try{
            DistributorDAO distributorDAO=new DistributorDAO();
            if(distributorDAO.deleteRecord(distributorModel)){
                isDelete=true;
            }
        }
        catch(Exception e){
            log.debug("err in Controller in deleterecord():"+e);
            return isDelete=false;
        }
        return isDelete;
    }
    @Override
    public Object viewRecord(Object distributorName) {
         DistributorModel distributorModel=new DistributorModel();
         Object object=distributorModel;
        try {
            DistributorDAO distributorDAO=new DistributorDAO();
            object=(DistributorModel)distributorDAO.viewRecord(distributorName);
        } catch (Exception e) {
            log.debug("Err dao in viewRecords : "+e.getMessage());
        }

        return object;
    }

//    public DistributorModel selectMaxRecord() {
//        DistributorModel distributorModel=null;
//        try {
//            DistributorDAO distributorDAO=new DistributorDAO();
//            distributorModel=distributorDAO.selectMaxRecord();
//        } catch(Exception e) {

//        }
//        return distributorModel;
//
//    }
}
