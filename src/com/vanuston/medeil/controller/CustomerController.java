/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.CustomerDAO;
import com.vanuston.medeil.implementation.Customer;
import com.vanuston.medeil.model.CustomerModel;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class CustomerController extends UnicastRemoteObject implements Customer {

    public CustomerController() throws RemoteException {
    }

    @Override
    public Object viewRecord(Object name) {
        CustomerDAO customerDAO = new CustomerDAO();
        return customerDAO.viewRecord(name);
    }

    @Override
    public boolean deleteRecord(Object customerModels) {
        CustomerDAO customerDAO = new CustomerDAO();
        return customerDAO.deleteRecord(customerModels);
    }

    @Override
    public Object createRecord(Object customerModels) {
        CustomerDAO customerDAO = new CustomerDAO();
        return customerDAO.createRecord(customerModels);
    }

    @Override
    public Object updateRecord(Object customerModels) {
        CustomerDAO customerDAO = new CustomerDAO();
        return customerDAO.updateRecord(customerModels);
    }

    @Override
    public CustomerModel viewAllRecord(Object customerBeans) throws RemoteException {
        CustomerModel cusomterList = new CustomerModel();
        try {
            CustomerDAO CustomerDAO = new CustomerDAO();
            CustomerModel customerBean = (CustomerModel) customerBeans;
            cusomterList = CustomerDAO.viewAllRecord(customerBean);
        } catch (Exception e) {
        }
        return cusomterList;
    }

    @Override
    public boolean deletePatientDetailsRecord(Object customerModels)  {
        CustomerDAO customerDAO = new CustomerDAO();
        return customerDAO.deletePatientDetailsRecord(customerModels);
    }

    @Override
    public Object createPatientDetailsRecord(Object customerModels) {
        CustomerDAO customerDAO = new CustomerDAO();
        return customerDAO.createPatientDetailsRecord(customerModels);

    }

    @Override
    public Object updatePatientDetailsRecord(Object customerModels) {
        CustomerDAO customerDAO = new CustomerDAO();
        return customerDAO.updatePatientDetailsRecord(customerModels);
        
    }

    @Override
    public List<String> getAllergies() {
        return new CustomerDAO().getAllergies();
    }

    @Override
    public int addAllergie(String allergie)  {
        return new CustomerDAO().addAllergie(allergie);
    }

    @Override
    public List<String> getHealthConditions()  {
        return new CustomerDAO().getHealthConditions();
    }

    @Override
    public int addHealthCondition(String healthCondition) {
        return new CustomerDAO().addHealthCondition(healthCondition);
    }


}
