/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.controller;

import com.vanuston.medeil.dao.DoctorChargesDAO;
import com.vanuston.medeil.implementation.DoctorCharges;
/**
 *
 * @author vanuston
 */
public class DoctorChargesController implements DoctorCharges{
     @Override
    public Object viewRecord(Object doctorChargesmodel) {
     DoctorChargesDAO doctorChargesDAO=new DoctorChargesDAO();
     return doctorChargesDAO.viewRecord(doctorChargesmodel);
 }
 @Override
    public Object createRecord(Object doctorChargesModel) {
     DoctorChargesDAO doctorChargesDAO=new DoctorChargesDAO();
     return doctorChargesDAO.createRecord(doctorChargesModel);

 }
 @Override
    public Object updateRecord(Object doctorChargesModel) {
     DoctorChargesDAO doctorChargesDAO=new DoctorChargesDAO();
     return doctorChargesDAO.updateRecord(doctorChargesModel);

 }
 @Override
    public boolean deleteRecord(Object doctorChargesModel) {
     DoctorChargesDAO doctorChargesDAO=new DoctorChargesDAO();
     return doctorChargesDAO.deleteRecord(doctorChargesModel);

 }
 public boolean deleteCharge(String id){
      DoctorChargesDAO doctorChargesDAO=new DoctorChargesDAO();
      return doctorChargesDAO.deleteCharge(id);
  }  
}
