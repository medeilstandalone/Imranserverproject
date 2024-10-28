/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.implementation;

import com.vanuston.medeil.model.MaintenanceCostModel;
import java.rmi.RemoteException;
import java.util.List;

/**
 *
 * @author Administrator
 */
public interface MaintenanceCost extends BaseImplements  {
    boolean deleteMaintenanceCost(MaintenanceCostModel maintainCostModel) throws RemoteException;
    List<MaintenanceCostModel> getChequeDetails()throws RemoteException ;
}
