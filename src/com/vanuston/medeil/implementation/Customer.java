/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.implementation;

import com.vanuston.medeil.model.CustomerModel;
import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.List;

/**
 *
 * @author Administrator
 */
public interface Customer extends BaseImplements, Remote {

    public CustomerModel viewAllRecord(Object customerBean) throws RemoteException;
    Object createPatientDetailsRecord (Object object) throws RemoteException;
    Object updatePatientDetailsRecord (Object object) throws RemoteException;
    boolean deletePatientDetailsRecord (Object object) throws RemoteException;
    List<String> getAllergies() throws RemoteException;
    List<String> getHealthConditions() throws RemoteException;
    public int addAllergie(String allergie) throws RemoteException;
    public int addHealthCondition(String healthCondition) throws RemoteException;

    }
