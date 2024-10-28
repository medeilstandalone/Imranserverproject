/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.DoctorDAO;
import com.vanuston.medeil.implementation.Doctor;
import com.vanuston.medeil.model.DoctorChargesModel;
import java.rmi.RemoteException;
import java.rmi.server.UnicastRemoteObject;

/**
 *
 * @author Administrator
 */
public class DoctorController extends UnicastRemoteObject implements Doctor {

    public DoctorController() throws RemoteException {
    	super();

    }

    @Override
    public Object viewRecord(Object name) {
        DoctorDAO doctorDAO=new DoctorDAO();
        return doctorDAO.viewRecord(name);
    }

    @Override
    public boolean deleteRecord(Object doctorCode) {
        DoctorDAO doctorDAO=new DoctorDAO();
        return doctorDAO.deleteRecord( (String) doctorCode ) ;
    }

    @Override
    public Object createRecord(Object doctorModels) {
        DoctorDAO doctorDAO=new DoctorDAO();
        return doctorDAO.createRecord(doctorModels);
    }

    @Override
    public Object updateRecord(Object doctorModels) {
        DoctorDAO doctorDAO=new DoctorDAO();
        return doctorDAO.updateRecord(doctorModels);
    }
    @Override
    public Object viewDoctorCharges(Object doctorChargesmodel) {
     DoctorDAO doctorDAO=new DoctorDAO();
     return doctorDAO.viewDoctorCharges(doctorChargesmodel);
 }
 @Override
    public Object createDoctorCharges(Object doctorChargesModel) {
     DoctorDAO doctorDAO=new DoctorDAO();
     return doctorDAO.createDoctorCharges(doctorChargesModel);

 }
 @Override
    public Object updateDoctorCharges(Object doctorChargesModel) {
     DoctorDAO doctorDAO=new DoctorDAO();
     return doctorDAO.updateDoctorCharges(doctorChargesModel);

 }
 @Override
    public boolean deleteDoctorCharges(Object doctorChargesModel) {
     DoctorDAO doctorDAO=new DoctorDAO();
     return doctorDAO.deleteDoctorCharges(doctorChargesModel);

 }
    @Override
 public boolean deleteCharge(String id){
      DoctorDAO doctorDAO=new DoctorDAO();
      return doctorDAO.deleteCharge(id);
  }
    @Override
  public int sumQty(String tableName,Object doctorChargesModels) {
      DoctorDAO doctorDAO=new DoctorDAO();
      return doctorDAO.sumQty(tableName, doctorChargesModels) ;
  }
    @Override
  public double sumPaidAmt(String invoiceNo,double invoiceAmt) {
      DoctorDAO doctorDAO=new DoctorDAO ();
      return doctorDAO.sumPaidAmt (invoiceNo, invoiceAmt) ;
  }
    @Override
    public Object viewRecord(DoctorChargesModel doctorChargesModels,String tableName ) {
        DoctorDAO doctorDAO=new DoctorDAO ();
      return doctorDAO.viewRecord (doctorChargesModels, tableName) ;
    }
}
