/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.controller;


import com.vanuston.medeil.dao.StockDAO;
import com.vanuston.medeil.implementation.Stock;
import com.vanuston.medeil.model.StockModel;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.ArrayList;

/**
 *
 * @author Administrator
 */
public class StockController extends UnicastRemoteObject implements Stock {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public StockController() throws RemoteException {
        super () ;
    }

    @Override
    public String getStockQty(String itemCode, String batchNumber) {
        StockDAO stockDAO = new StockDAO();
        String qty = stockDAO.getStockQty(itemCode, batchNumber);
        return qty;
    }

     @Override
    public String getStockFQty(String itemCode, String batchNumber) {
        StockDAO stockDAO = new StockDAO();
        String qty = stockDAO.getStockFQty(itemCode, batchNumber);
        return qty;
    }

 @Override
    public String getStockpackQty(String itemCode, String batchNumber) {
        StockDAO stockDAO = new StockDAO();
        String qty = stockDAO.getStockFQty(itemCode, batchNumber);
        return qty;
    }


    @Override
    public Object viewRecord(Object stockBeans) {   
        try {
            StockModel stockBean = (StockModel) stockBeans;
            StockDAO sdao = new StockDAO();
            stockBeans =sdao.viewRecord(stockBean);
        } catch (Exception e) {
        }
        return stockBeans;
    }

    @Override
    public boolean deleteRecord(Object stockBeans) {
        boolean flag = false;
        try {
            StockModel stockBean = (StockModel) stockBeans;
            StockDAO sdao = new StockDAO();
            flag =sdao.deleteRecord(stockBean);
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    @Override
    public Object createRecord(Object stockBeans) {
        Object flag = false;
        try {
            StockModel stockBean = (StockModel) stockBeans;
            StockDAO sdao = new StockDAO();
            flag =sdao.createRecord(stockBean);
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }
    

    @Override
    public Object updateRecord(Object stockBeans) {
         Object flag = false;
        try {
            StockModel stockBean = (StockModel) stockBeans;
            StockDAO sdao = new StockDAO();
            flag =sdao.updateRecord(stockBean);
        } catch (Exception e) {
            flag = false;
        }
        return flag;
    }

    @Override
    public ArrayList<StockModel> viewAllRecord(Object stockBeans) {
        ArrayList<StockModel> stockList = null;
        //Drug drugAll=null;
        try {
            StockDAO sdao = new StockDAO();
            StockModel stockBean = (StockModel) stockBeans;
            stockList = sdao.viewAllRecord(stockBean);
        } catch (Exception e) {
        }
        return stockList;
    }

    @Override
    public int insertStockAdjustment(ArrayList<StockModel> stkAdjustmentList) throws RemoteException {
        StockDAO stockDAO = new StockDAO();
        int insertFlag= stockDAO.insertStockAdjustment(stkAdjustmentList);
        return insertFlag;
    }

    @Override
    public String getStockmrp(String itemCode, String batchNumber) throws RemoteException {
        StockDAO stockDAO = new StockDAO();
        String stkmrp = stockDAO.getStockmrp(itemCode, batchNumber);
        return stkmrp;
    }


}
