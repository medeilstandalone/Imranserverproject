/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.dao;


import com.vanuston.medeil.model.DrugSpecificationModel;
import java.sql.CallableStatement;
import com.vanuston.medeil.implementation.Prescription;
import com.vanuston.medeil.model.PrescriptionModel;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Logger;
import java.rmi.RemoteException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import javafx.scene.control.CheckBox;


/**
 *
 * @author muralikrishnan
 */
public class PrescriptionDAO implements Prescription {
    static Logger log = Logger.getLogger(PrescriptionDAO.class, "com.vanuston.medeil.dao.PrescriptionDAO");
    SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    @Override
    public Object createRecord(Object object) throws RemoteException {
        PrescriptionModel prescriptionModel=(PrescriptionModel) object;
        List<PrescriptionModel> prescriptionItems = new ArrayList<PrescriptionModel>();
        prescriptionItems=prescriptionModel.getPrescriptionListItems();
        int returnFlag = 0;
        Boolean insert = false;
        try {
        if(prescriptionModel.getInsertType().equals("save")) {
        String sql = "insert into prescription_maintenance (prescription_date, doctor_name, customer_name, age, gender, weight, temperature, blood_sugar, blood_pressure, diagnosis,remarks, consultation_fee, next_visit,created_by,created_on)"
                + "values('"+prescriptionModel.getDate()+"','"+prescriptionModel.getDoctorName()+"','"+prescriptionModel.getPatientName()+"','"+prescriptionModel.getAge()+"','"+prescriptionModel.getGender()+"','"+prescriptionModel.getWeight()+"'"
                + ",'"+prescriptionModel.getTemperature()+"','"+prescriptionModel.getBloodSugar()+"','"+prescriptionModel.getBloodPressure()+"','"+prescriptionModel.getDiagnosis()+"','"+prescriptionModel.getRemarks()+"','"+prescriptionModel.getConsultationFee()+"','"+prescriptionModel.getNextVisit()+"','"+prescriptionModel.getCurrentUser()+"','"+sdf.format(new Date())+"')";
        returnFlag = DBConnection.getStatement().executeUpdate(sql);
        String sql1 = "select max(id) as prescriptionId from prescription_maintenance";
        ResultSet rs = DBConnection.getStatement().executeQuery(sql1);
        while(rs.next()) {
            prescriptionModel.setPrescriptionId(rs.getInt("prescriptionId"));
        }
        if(prescriptionModel.getPatientSymptomsList().size()>0) //Patient Symptoms List
        {
            String sql3 = "insert into med_patient_symptoms_mt(pres_key,patient_symptoms,created_by,created_on) values(?,?,?,?)";
            PreparedStatement ps = DBConnection.getConnection().prepareStatement(sql3);
            for(int j=0;j<prescriptionModel.getPatientSymptomsList().size();j++)
            {
            ps.setInt(1,prescriptionModel.getPrescriptionId());
            ps.setString(2,prescriptionModel.getPatientSymptomsList().get(j));
            ps.setString(3,prescriptionModel.getCurrentUser());
            ps.setString(4,sdf.format(new Date()));
            ps.executeUpdate();
            }
        }
        }
        for(int i=0; i < prescriptionItems.size();i++) {
        PrescriptionModel model = prescriptionItems.get(i);
        CallableStatement cs = (CallableStatement) DBConnection.getConnection().prepareCall("call pro_prescription(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        cs.setInt   (1,  prescriptionModel.getPrescriptionId());
        cs.setString(2,  model.getDoctorName());
        cs.setString(3,  model.getPatientName());
        cs.setInt   (4,  model.getAge());
        cs.setString(5,  model.getGender());
        cs.setString(6,  model.getWeight());
        cs.setString(7,  model.getTemperature());
        cs.setString(8,  model.getBloodSugar());
        cs.setString(9,  model.getBloodPressure());
        cs.setString(10, model.getRemarks());
        cs.setDouble(11, model.getConsultationFee());
        cs.setString(12, model.getNextVisit());
        cs.setString(13, model.getMedicineName());
        cs.setString(14, model.getMorning());
        cs.setString(15, model.getAfternoon());
        cs.setString(16, model.getEvening());
        cs.setString(17, model.getNight());
        cs.setString(18, model.getFood());
        cs.setString(19, model.getDose());
        cs.setDouble(20, model.getTotalMedications());
        cs.setDouble(21, model.getDays());
        cs.setString(22, prescriptionModel.getCurrentUser());
        cs.setString(23, model.getInsertType());
        cs.registerOutParameter(24, Types.INTEGER);
        cs.executeUpdate();
        returnFlag = cs.getInt("retflag");        
        }
        insert = true;
        }
        catch(Exception e) {
            log.debug(" Class : PrescriptionDAO  Method   : CreateRecord Exception :" + e.getMessage());
        }
        System.out.println("Prescription :"+insert);
        return insert;
    }

    @Override
    public Object viewRecord(Object object) throws RemoteException {
       List<PrescriptionModel> prescriptionItems = new ArrayList<PrescriptionModel>();
       PrescriptionModel model = new PrescriptionModel();
       PrescriptionModel prescriptionModel;
       int prescriptionId=(Integer) object;
       try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select *,m.id as prescription_id from prescription p,prescription_maintenance m where m.id=p.pres_key and m.id='"+prescriptionId+"' and del_flag=0");
            while(rs.next()) {
                prescriptionModel = new PrescriptionModel();
                model.setPrescriptionId(rs.getInt("prescription_id"));
                model.setDate(rs.getString("prescription_date"));
                model.setPatientName(rs.getString("customer_name"));
                model.setDoctorName(rs.getString("doctor_name"));
                model.setAge(rs.getInt("age"));
                model.setGender(rs.getString("gender"));
                model.setWeight(rs.getString("weight"));
                model.setTemperature(rs.getString("temperature"));
                model.setBloodSugar(rs.getString("blood_sugar"));
                model.setBloodPressure(rs.getString("blood_pressure"));
                model.setDiagnosis(rs.getString("diagnosis"));
                model.setRemarks(rs.getString("remarks"));
                model.setConsultationFee(rs.getDouble("consultation_fee"));
                model.setNextVisit(rs.getString("next_visit"));
                prescriptionModel.setMedicineName(rs.getString("medicine_name"));
                prescriptionModel.setMorning(rs.getString("morning"));
                prescriptionModel.setAfternoon(rs.getString("afternoon"));
                prescriptionModel.setEvening(rs.getString("evening"));
                prescriptionModel.setNight(rs.getString("night"));
                prescriptionModel.setDays(rs.getDouble("days"));
                prescriptionModel.setFood(rs.getString("food"));
                prescriptionModel.setDose(rs.getString("dose"));
                prescriptionModel.setTotalMedications(rs.getDouble("total_medications"));
                prescriptionItems.add(prescriptionModel);
            }
            model.setPrescriptionListItems(prescriptionItems);
        } catch (Exception ex) {
            log.debug(" Class : PrescriptionDAO  Method   : viewRecord Exception :" + ex.getMessage());
        }
        return model;
    }

    @Override
    public Object updateRecord(Object object) throws RemoteException {
        PrescriptionModel prescriptionModel = (PrescriptionModel) object;
        int returnFlag=0;
        int returnFlag1=0;
        Boolean insert = false;
        try {
        String sql = "delete from prescription where pres_key='"+prescriptionModel.getPrescriptionId()+"'";
        String sql1= "update prescription_maintenance set prescription_date='"+prescriptionModel.getDate()+"',doctor_name='"+prescriptionModel.getDoctorName()+"',"
                + "customer_name='"+prescriptionModel.getPatientName()+"',age='"+prescriptionModel.getAge()+"',gender='"+prescriptionModel.getGender()+"',weight='"+prescriptionModel.getWeight()+"'"
                + ",temperature='"+prescriptionModel.getTemperature()+"',blood_sugar='"+prescriptionModel.getBloodSugar()+"',blood_pressure='"+prescriptionModel.getBloodPressure()+"'"
                + ",diagnosis = '"+prescriptionModel.getDiagnosis()+"', remarks='"+prescriptionModel.getRemarks()+"',consultation_fee='"+prescriptionModel.getConsultationFee()+"',next_visit='"+prescriptionModel.getNextVisit()+"' where id='"+prescriptionModel.getPrescriptionId()+"'";
        String sql2 = "delete from med_patient_symptoms_mt where pres_key='"+prescriptionModel.getPrescriptionId()+"'";
        returnFlag = DBConnection.getStatement().executeUpdate(sql);
        returnFlag1 = DBConnection.getStatement().executeUpdate(sql1);
        DBConnection.getStatement().executeUpdate(sql2);
        if(returnFlag > 0 && returnFlag1 >0) {
            insert = (Boolean) createRecord(object);
        }
        if(prescriptionModel.getPatientSymptomsList().size()>0) //Patient Symptoms List
        {
            List<String> patientSymptomsList = new ArrayList<String>();
            patientSymptomsList=prescriptionModel.getPatientSymptomsList();
            String sql3 = "insert into med_patient_symptoms_mt(pres_key,patient_symptoms,updated_by,updated_on) values(?,?,?,?)";
            PreparedStatement ps = DBConnection.getConnection().prepareStatement(sql3);
            for(int j=0;j<patientSymptomsList.size();j++)
            {
            ps.setInt(1,prescriptionModel.getPrescriptionId());
            ps.setString(2,patientSymptomsList.get(j));
            ps.setString(3,prescriptionModel.getCurrentUser());
            ps.setString(4,sdf.format(new Date()));
            ps.executeUpdate();
            }
        }
        }
        catch(Exception e) {
            log.debug(" Class : PrescriptionDAO  Method   : updateRecord Exception :" + e.getMessage());
        }
        return insert;
    }

    @Override
    public boolean deleteRecord(Object object) throws RemoteException {
        String prescId=(String) object;
        boolean insert = false;
        try {
        String sql = "update prescription_maintenance set del_flag = 1 where id='"+prescId+"'";
        String sql1 = "update med_patient_symptoms_mt set is_active = 0 where pres_key='"+prescId+"'";
        DBConnection.getStatement().executeUpdate(sql);
        DBConnection.getStatement().executeUpdate(sql1);
        insert = true;
        }
        catch(Exception e) {
            log.debug(" Class : PrescriptionDAO  Method   : deleteRecord Exception :" + e.getMessage());
        }
        return insert;
    }

    @Override
    public Object viewAllRecord(String recId, String searchType) {
        List<PrescriptionModel> prescriptionItems = new ArrayList<PrescriptionModel>();
        try {
            if(searchType.equals("prescription_date")) {
                recId=DateUtils.changeFormatDate(recId);
            }
            ResultSet rs = DBConnection.getStatement().executeQuery("select * from prescription_maintenance m where m."+searchType+" like '" + recId + "%' and del_flag=0 order by m.id desc");
            while(rs.next()) {
                PrescriptionModel model = new PrescriptionModel();
                model.setPrescriptionId(rs.getInt("id"));
                model.setDate(rs.getString("prescription_date"));
                model.setPatientName(rs.getString("customer_name"));
                model.setDoctorName(rs.getString("doctor_name"));
                prescriptionItems.add(model);
            }
        } catch (Exception ex) {
            log.debug(" Class : PrescriptionDAO  Method   : viewAllRecord Exception :" + ex.getMessage());
        }
        return prescriptionItems;
    }

    @Override
    public int insertDrugSpecification(DrugSpecificationModel drugSpecificationModel) throws RemoteException {
        DrugSpecificationModel model = drugSpecificationModel;
        int returnFlag = 0;
        try {
        CallableStatement cs = (CallableStatement) DBConnection.getConnection().prepareCall("call pro_drugspecifications(?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
        cs.setString (1, model.getGenericName());
        cs.setString(2,  model.getDescription());
        cs.setString(3,  model.getCategories());
        cs.setString(4,  model.getChemicalFormula());
        cs.setString(5,  model.getIndication());
        cs.setString(6,  model.getPharmaCodynamics());
        cs.setString(7,  model.getMechanism());
        cs.setString(8,  model.getAbsorption());
        cs.setString(9,  model.getVolumeDistribution());
        cs.setString(10, model.getMetabolism());
        cs.setString(11, model.getRouteElimination());
        cs.setString(12, model.getHalfLife());
        cs.setString(13, model.getToxicity());
        cs.setString(14, model.getFoodInteractions());
        cs.setString(15, model.getSaveType());
        cs.registerOutParameter(16, Types.INTEGER);
        cs.executeUpdate();
        returnFlag = cs.getInt("retflag");
    }
        catch(Exception e) {
            log.debug(" Class : PrescriptionDAO  Method   : insertDrugSpecification Exception :" + e.getMessage());
        }
        return returnFlag;
    }

    @Override
    public List<String> getSymptoms() {
        List<String> list = null ;
        try{
            ResultSet rs = DBConnection.getStatement().executeQuery("select symptoms from med_symptoms_list_mt where is_active=1");
            if(rs!=null){
                list=new ArrayList<String>();
                while(rs.next()) {
                    list.add(rs.getString("symptoms"));
                }
            }
        }catch(Exception e){
            log.debug(" Class:PrescriptionDAO Method:getSymptoms Exception:" + e.getMessage());
        }
        return list;
    }

    @Override
    public int addSymptom(String symptom,String user) {
        int a=0;
        try {
            ResultSet rs = DBConnection.getStatement().executeQuery("select * from med_symptoms_list_mt where symptoms='"+symptom+"'");
            while (rs.next()) {
                a = 1;
            }
            if (a == 1) {
                a = 1;
            }
            else{
                String query = "insert into med_symptoms_list_mt(symptoms,created_by,created_on) values(?,?,?)";
                PreparedStatement ps = DBConnection.getConnection().prepareStatement(query);
                ps.setString(1, symptom);
                ps.setString(2,user);
                ps.setString(3,sdf.format(new Date()));
                ps.executeUpdate();
                a=0;
            }
        } catch (Exception ex) {
            log.debug(" Class:PrescriptionDAO Method:addSymptoms Exception:" + ex.getMessage());
        }
        return a;
    }
}
