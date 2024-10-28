/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.EmployeeSalaryDAO;
import com.vanuston.medeil.implementation.EmployeeSalary;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

/**
 *
 * @author Administrator
 */
public class EmployeeSalaryController extends UnicastRemoteObject implements EmployeeSalary {

    public EmployeeSalaryController() throws RemoteException {
        super () ;
    }

    @Override
    public Object createRecord(Object employeeSalaryModel) {
        EmployeeSalaryDAO employeeSalaryDAO=new EmployeeSalaryDAO();
        return employeeSalaryDAO.createRecord(employeeSalaryModel);
    }
    @Override
    public Object updateRecord(Object employeeSalaryModel) {
        EmployeeSalaryDAO employeeSalaryDAO=new EmployeeSalaryDAO();
        return employeeSalaryDAO.updateRecord(employeeSalaryModel);
    }
    @Override
    public boolean deleteRecord(Object employeeSalaryModel) {
        EmployeeSalaryDAO employeeSalaryDAO=new EmployeeSalaryDAO();
        return employeeSalaryDAO.deleteRecord(employeeSalaryModel);
    }
    @Override
    public Object viewRecord(Object employeeSalaryModel) {
        EmployeeSalaryDAO employeeSalaryDAO=new EmployeeSalaryDAO();
        return employeeSalaryDAO.viewRecord(employeeSalaryModel);
    }
    @Override
    public Object viewAllRecord() {
        EmployeeSalaryDAO employeeSalaryDAO=new EmployeeSalaryDAO();
        return employeeSalaryDAO.viewAllRecord();
        
    }
}
