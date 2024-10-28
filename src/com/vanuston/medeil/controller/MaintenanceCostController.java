/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.controller;

import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.List;

import com.vanuston.medeil.dao.MaintenanceCostDAO;
import com.vanuston.medeil.implementation.MaintenanceCost;
import com.vanuston.medeil.model.MaintenanceCostModel;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;

/**
 *
 * @author Administrator
 */
public class MaintenanceCostController extends UnicastRemoteObject implements MaintenanceCost  {
	
	
    /**
	 * 
    	 */
         Logger log = Logger.getLogger(MaintenanceCostController.class,"MaintenanceCostController");
	private static final long serialVersionUID = 1L;

	public MaintenanceCostController() throws RemoteException {
		super();
		
		// TODO Auto-generated constructor stub
	}

	@Override
    public Object viewRecord(Object maintenanceCostModels) {
		MaintenanceCostDAO maintenanceCostDAO = new MaintenanceCostDAO () ;
        return maintenanceCostDAO.viewRecord (maintenanceCostModels) ;
    }

    @Override
    public boolean deleteRecord(Object maintenanceCostModels) {
    	MaintenanceCostDAO maintenanceCostDAO = new MaintenanceCostDAO () ;
        return maintenanceCostDAO.deleteRecord(maintenanceCostModels) ;
    }


    @Override
    public Object createRecord(Object maintenanceCostModels) {
    	try {
    		
    	MaintenanceCostModel maintenanceCostModel = (MaintenanceCostModel) maintenanceCostModels ;
    	MaintenanceCostDAO maintenanceCostDAO = new MaintenanceCostDAO () ;
    	if (  maintenanceCostModel.getMaintenanceCostList() != null ) {
    		List<MaintenanceCostModel> models =  maintenanceCostModel.getMaintenanceCostList () ;    		
    		Boolean isCreate = false ;
    		for (int i = 0; i < models.size(); i++ ) {
    			maintenanceCostModel = models.get(i) ;
    			isCreate = (Boolean) maintenanceCostDAO.createRecord (maintenanceCostModel) ;
    		}
    		return isCreate ; 
    	} else {	
    		return maintenanceCostDAO.createRecord (maintenanceCostModel) ;
    	}	
    	}catch (Exception e) {
    		log.debug("Err in maintenanceCostController in createRecord() :" + e) ;
    		
    		return false ;
    	}
    }

    @Override
    public Object updateRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
    @Override
    public boolean deleteMaintenanceCost(MaintenanceCostModel maintenanceCostModel) {
    	MaintenanceCostDAO maintenanceCostDAO = new MaintenanceCostDAO () ;
        return maintenanceCostDAO.deleteMaintenanceCost (maintenanceCostModel) ;
    }
    @Override
    public List<MaintenanceCostModel> getChequeDetails() {
    	MaintenanceCostDAO maintenanceCostDAO = new MaintenanceCostDAO () ;		 
		return maintenanceCostDAO.getChequeDetails() ;
	}
}
