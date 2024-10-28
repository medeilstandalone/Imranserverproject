/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.DrugDAO;
import com.vanuston.medeil.implementation.Drug;
import com.vanuston.medeil.model.DrugModel;
import com.vanuston.medeil.util.Logger;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class DrugController extends UnicastRemoteObject implements Drug {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
        public static Logger log = Logger.getLogger(DrugController.class, "DrugController");
	public DrugController() throws RemoteException {
        super () ;
    }
    
    @Override
    public ArrayList<DrugModel> viewAllRecord(Object drugObject) {
        List<DrugModel> drugList = new ArrayList<DrugModel>();
        //Drug drugAll=null;
        try {
            DrugDAO ddao = new DrugDAO();
            DrugModel drugBean = (DrugModel) drugObject;
            drugList = ddao.viewAllRecord(drugBean);
        } catch (Exception e) {
            log.debug("class : DrugController Method : viewAllRecord() Exception:"+e.getMessage());            
        }
        return (ArrayList<DrugModel>) drugList;
    }
	
	//Generic Search Method
    @Override
    public ArrayList<DrugModel> SearchRecord(Object drugObject) {
        List<DrugModel> drugList = new ArrayList<DrugModel>();
        try {
            DrugDAO ddao = new DrugDAO();
            DrugModel drugBean = (DrugModel) drugObject;
            drugList = ddao.SearchRecord(drugBean);
        } catch (Exception e) {
            log.debug("class : DrugController Method : SearchRecord() Exception:"+e.getMessage());
        }
        return (ArrayList<DrugModel>) drugList;
    }

    @Override
    public Object createRecord(Object drugBean) {
        Object flag = false;
        try {
            DrugDAO ddao = new DrugDAO();
            flag = ddao.createRecord(drugBean);
        } catch (Exception e) {
            log.debug("Method:createRecord Exception:"+e.getMessage());
            flag = false;
        }
        return flag;
    }

    @Override
    public Object updateRecord(Object drugBeans) {
        Object flag = false;
        try {
            DrugModel drugBean = (DrugModel) drugBeans;
            DrugDAO ddao = new DrugDAO();
            flag = ddao.updateRecord(drugBean);
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    @Override
    public Object viewRecord(Object drugBeans) {
        try {
            Object drugBean = (DrugModel) drugBeans;
            DrugDAO ddao = new DrugDAO();
            drugBeans = ddao.viewRecord(drugBean);
        } catch (Exception e) {
            log.debug("Method:viewRecord Exception:"+e.getMessage());
        }
        return drugBeans;
    }

    @Override
    public boolean deleteRecord(Object drugBeans) {
        boolean flag = false;
        try {
            DrugDAO ddao = new DrugDAO();
            DrugModel drugBean = (DrugModel) drugBeans;
            flag = ddao.deleteRecord(drugBean);
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }
}
