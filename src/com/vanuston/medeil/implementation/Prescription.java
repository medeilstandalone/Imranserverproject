/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.implementation;

import com.vanuston.medeil.model.DrugSpecificationModel;
import java.rmi.Remote;
import java.rmi.RemoteException;
import java.util.List;

/**
 *
 * @author muralikrishnan
 */
public interface Prescription extends BaseImplements, Remote {
    public Object viewAllRecord(String recId, String searchType) throws RemoteException;
    public int insertDrugSpecification(DrugSpecificationModel drugSpecificationModel) throws RemoteException;
    List<String> getSymptoms() throws RemoteException;
    public int addSymptom(String symptom,String user) throws RemoteException;
}
