/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.EmployeeDAO;
import com.vanuston.medeil.implementation.Employee;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

/**
 *
 * @author San
 */
public class EmployeeController extends UnicastRemoteObject implements Employee {

    public EmployeeController() throws RemoteException {
        super();
    }

    @Override
    public Object viewRecord (Object employeeName) {
        EmployeeDAO employeeDAO = new EmployeeDAO();
        return employeeDAO.viewRecord(employeeName);
    }

    @Override
    public boolean deleteRecord(Object employeeModel) {
        EmployeeDAO employeeDAO = new EmployeeDAO();
        return employeeDAO.deleteRecord(employeeModel);
    }

    @Override
    public Object createRecord (Object employeeModel) {
        EmployeeDAO employeeDAO = new EmployeeDAO();
        return employeeDAO.createRecord(employeeModel);
    }

    @Override
    public Object updateRecord (Object employeeModel) {
        EmployeeDAO employeeDAO = new EmployeeDAO();
        return employeeDAO.updateRecord(employeeModel);
    }
}
