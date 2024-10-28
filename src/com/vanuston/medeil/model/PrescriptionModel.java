/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.model;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author muralikrishnan
 */
public class PrescriptionModel implements Serializable {

private int prescriptionId;
private int drugCode;

private String doctorName;
private String patientName;
private int age;
private String gender;
private String weight;
private String temperature;
private String bloodSugar;
private String bloodPressure;
private String remarks;
private double consultationFee;
private String nextVisit;
private String medicineName;
private String morning;
private String afternoon;
private String evening;
private String night;
private double days;
private String food;
private String dose;
private String date;
private double totalMedications;
private List prescriptionListItems;
private String insertType;
private String diagnosis;
private List patientSymptomsList;
private String currentUser;


    public String getDiagnosis() {
        return diagnosis;
    }

    public void setDiagnosis(String diagnosis) {
        this.diagnosis = diagnosis;
    }


    public int getDrugCode() {
        return drugCode;
    }

    public void setDrugCode(int drugCode) {
        this.drugCode = drugCode;
    }


    /**
     * @return the doctorName
     */
    public String getDoctorName() {
        return doctorName;
    }

    /**
     * @param doctorName the doctorName to set
     */
    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    /**
     * @return the customerName
     */
    public String getPatientName() {
        return patientName;
    }

    /**
     * @param customerName the customerName to set
     */
    public void setPatientName(String patientName) {
        this.patientName = patientName;
    }

    /**
     * @return the age
     */
    public int getAge() {
        return age;
    }

    /**
     * @param age the age to set
     */
    public void setAge(int age) {
        this.age = age;
    }

    /**
     * @return the gender
     */
    public String getGender() {
        return gender;
    }

    /**
     * @param gender the gender to set
     */
    public void setGender(String gender) {
        this.gender = gender;
    }

    /**
     * @return the weight
     */
    public String getWeight() {
        return weight;
    }

    /**
     * @param weight the weight to set
     */
    public void setWeight(String weight) {
        this.weight = weight;
    }

    /**
     * @return the temperature
     */
    public String getTemperature() {
        return temperature;
    }

    /**
     * @param temperature the temperature to set
     */
    public void setTemperature(String temperature) {
        this.temperature = temperature;
    }

    /**
     * @return the bloodSugar
     */
    public String getBloodSugar() {
        return bloodSugar;
    }

    /**
     * @param bloodSugar the bloodSugar to set
     */
    public void setBloodSugar(String bloodSugar) {
        this.bloodSugar = bloodSugar;
    }

    /**
     * @return the bloodPressure
     */
    public String getBloodPressure() {
        return bloodPressure;
    }

    /**
     * @param bloodPressure the bloodPressure to set
     */
    public void setBloodPressure(String bloodPressure) {
        this.bloodPressure = bloodPressure;
    }

    /**
     * @return the remarks
     */
    public String getRemarks() {
        return remarks;
    }

    /**
     * @param remarks the remarks to set
     */
    public void setRemarks(String remarks) {
        this.remarks = remarks;
    }

    /**
     * @return the consultationFee
     */
    public double getConsultationFee() {
        return consultationFee;
    }

    /**
     * @param consultationFee the consultationFee to set
     */
    public void setConsultationFee(double consultationFee) {
        this.consultationFee = consultationFee;
    }

    /**
     * @return the nextVisit
     */
    public String getNextVisit() {
        return nextVisit;
    }

    /**
     * @param nextVisit the nextVisit to set
     */
    public void setNextVisit(String nextVisit) {
        this.nextVisit = nextVisit;
    }

    /**
     * @return the medicineName
     */
    public String getMedicineName() {
        return medicineName;
    }

    /**
     * @param medicineName the medicineName to set
     */
    public void setMedicineName(String medicineName) {
        this.medicineName = medicineName;
    }

    /**
     * @return the morning
     */
    public String getMorning() {
        return morning;
    }

    /**
     * @param morning the morning to set
     */
    public void setMorning(String morning) {
        this.morning = morning;
    }

    /**
     * @return the afternoon
     */
    public String getAfternoon() {
        return afternoon;
    }

    /**
     * @param afternoon the afternoon to set
     */
    public void setAfternoon(String afternoon) {
        this.afternoon = afternoon;
    }

    /**
     * @return the evening
     */
    public String getEvening() {
        return evening;
    }

    /**
     * @param evening the evening to set
     */
    public void setEvening(String evening) {
        this.evening = evening;
    }

    /**
     * @return the night
     */
    public String getNight() {
        return night;
    }

    /**
     * @param night the night to set
     */
    public void setNight(String night) {
        this.night = night;
    }

    /**
     * @return the food
     */
    public String getFood() {
        return food;
    }

    /**
     * @param food the food to set
     */
    public void setFood(String food) {
        this.food = food;
    }

    /**
     * @return the dose
     */
    public String getDose() {
        return dose;
    }

    /**
     * @param dose the dose to set
     */
    public void setDose(String dose) {
        this.dose = dose;
    }

    /**
     * @return the totalMedications
     */
    public double getTotalMedications() {
        return totalMedications;
    }

    /**
     * @param totalMedications the totalMedications to set
     */
    public void setTotalMedications(double totalMedications) {
        this.totalMedications = totalMedications;
    }

    /**
     * @return the prescriptionListItems
     */
    public List getPrescriptionListItems() {
        return prescriptionListItems;
    }

    /**
     * @param prescriptionListItems the prescriptionListItems to set
     */
    public void setPrescriptionListItems(List prescriptionListItems) {
        this.prescriptionListItems = prescriptionListItems;
    }

    /**
     * @return the days
     */
    public double getDays() {
        return days;
    }

    /**
     * @param days the days to set
     */
    public void setDays(double days) {
        this.days = days;
    }

    /**
     * @return the date
     */
    public String getDate() {
        return date;
    }

    /**
     * @param date the date to set
     */
    public void setDate(String date) {
        this.date = date;
    }

    /**
     * @return the prescriptionId
     */
    public int getPrescriptionId() {
        return prescriptionId;
    }

    /**
     * @param prescriptionId the prescriptionId to set
     */
    public void setPrescriptionId(int prescriptionId) {
        this.prescriptionId = prescriptionId;
    }

    /**
     * @return the insertType
     */
    public String getInsertType() {
        return insertType;
    }

    /**
     * @param insertType the insertType to set
     */
    public void setInsertType(String insertType) {
        this.insertType = insertType;
    }

     /**
     * @return the patientSymptomsList
     */
    public List<String> getPatientSymptomsList() {
        return patientSymptomsList;
    }

    /**
     * @param patientSymptomsList the patientSymptomsList to set
     */
    public void setPatientSymptomsList(List<String> patientSymptomsList) {
        this.patientSymptomsList=patientSymptomsList;
    }
    /**
     * @return the currentUserName
     */
    public String getCurrentUser() {
        return currentUser;
    }

    /**
     * @param userName the currentUserName to set
     */
    public void setCurrentUser(String userName) {
        this.currentUser = userName;
    }
}
