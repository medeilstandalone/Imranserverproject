/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.DailyCashBookDAO;
import com.vanuston.medeil.implementation.DailyCashBook;
import com.vanuston.medeil.model.DailyCashBookModel;
import com.vanuston.medeil.util.Logger;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

/**
 *
 * @author Administrator
 */
public class DailyCashBookController extends UnicastRemoteObject implements DailyCashBook {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
        Logger log = Logger.getLogger(DailyCashBookController.class,"DailyCashBookController");
	public DailyCashBookController () throws RemoteException {
        super () ;
    }
    
    @Override
    public Object viewRecord(Object dbookBeans) {
        try {
            Object dbbookBean=(DailyCashBookModel)dbookBeans;
        DailyCashBookDAO dailycashbookdao=new DailyCashBookDAO();
        dbookBeans=dailycashbookdao.viewRecord(dbbookBean);
        } catch (Exception e) {            
            log.debug("Method:viewRecord Exception:"+e.getMessage());
        }
        return dbookBeans;
    }

    @Override
    public boolean deleteRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Object createRecord(Object dailycashbookBean) {
        Object flag = false;
        try {
            DailyCashBookDAO dailycashbookdao = new DailyCashBookDAO();
            flag = dailycashbookdao.createRecord(dailycashbookBean);
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    @Override
    public Object updateRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }
}
