/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.implementation;

import com.vanuston.medeil.model.DoctorChargesModel;
import java.rmi.Remote;
import java.rmi.RemoteException;

/**
 *
 * @author Administrator
 */
public interface Doctor extends BaseImplements, Remote {
    Object createDoctorCharges (Object object) throws RemoteException ;
    Object viewDoctorCharges (Object object) throws RemoteException ;
    Object updateDoctorCharges (Object object) throws RemoteException ;
    boolean deleteDoctorCharges (Object object) throws RemoteException ;
    boolean deleteCharge(String id) throws RemoteException ;
    int sumQty(String tableName,Object doctorChargesModels) throws RemoteException ;
    double sumPaidAmt(String invoiceNo,double invoiceAmt) throws RemoteException ;
    Object viewRecord(DoctorChargesModel doctorChargesModels,String tableName ) throws RemoteException ;

}
