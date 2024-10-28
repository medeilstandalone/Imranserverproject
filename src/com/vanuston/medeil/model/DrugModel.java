/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.model;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class DrugModel implements Serializable {

    private static final long serialVersionUID = 1L;
    private int drug_id;
    private String drug_code;
    private String drug_name;
    private String generic_name;
    private String classification;
    private String sub_classification;
    private String indication;
    private String mfr_name;
    private String formulation;
    private String dosage;
    private String pack;
    private String schedule;
    private double mrp;
    private double VAT_percentage;
    private String mfr_name_short;
    private String genericname_short;
    private String formulation_short;
    private String getDrugCharacter;
    private int passVale;
    private int vat_calc_flag;
    private List<String> barcode;
    private String userName;
    private String therapeuticName;

    public List<String> getBarcode() {
        return barcode;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public void setBarcode(List<String> barcode) {
        this.barcode = barcode;
    }

    

    public int getVat_calc_flag() {
        return vat_calc_flag;
    }

    public void setVat_calc_flag(int vat_calc_flag) {
        this.vat_calc_flag = vat_calc_flag;
    }

    public String getDrug_code() {
        return drug_code;
    }

    public void setDrug_code(String drug_code) {
        this.drug_code = drug_code;
    }

    public String getDrug_name() {
        return drug_name;
    }

    public void setDrug_name(String drug_name) {
        this.drug_name = drug_name;
    }

    public String getGeneric_name() {
        return generic_name;
    }

    public void setGeneric_name(String generic_name) {
        this.generic_name = generic_name;
    }

    public String getClassification() {
        return classification;
    }

    public void setClassification(String classification) {
        this.classification = classification;
    }

    public String getSub_classification() {
        return sub_classification;
    }

    public void setSub_classification(String sub_classification) {
        this.sub_classification = sub_classification;
    }

    public String getIndication() {
        return indication;
    }

    public void setIndication(String indication) {
        this.indication = indication;
    }

    public String getMfr_name() {
        return mfr_name;
    }

    public void setMfr_name(String mfr_name) {
        this.mfr_name = mfr_name;
    }

    public String getFormulation() {
        return formulation;
    }

    public void setFormulation(String formulation) {
        this.formulation = formulation;
    }

    public String getDosage() {
        return dosage;
    }

    public void setDosage(String dosage) {
        this.dosage = dosage;
    }

    public String getPack() {
        return pack;
    }

    public void setPack(String pack) {
        this.pack = pack;
    }

    public String getSchedule() {
        return schedule;
    }

    public void setSchedule(String schedule) {
        this.schedule = schedule;
    }

    public double getMrp() {
        return mrp;
    }

    public void setMrp(double mrp) {
        this.mrp = mrp;
    }

    public double getVAT_percentage() {
        return VAT_percentage;
    }

    public void setVAT_percentage(double VAT_percentage) {
        this.VAT_percentage = VAT_percentage;
    }

    /**
     * @return the genericname_short
     */
    public String getGenericname_short() {
        return genericname_short;
    }

    /**
     * @return the formulation_short
     */
    public String getFormulation_short() {
        return formulation_short;
    }

    public String getMfr_name_short() {
        return mfr_name_short;
    }


    public void setMfr_name_short(String mfr_name_short) {
        this.mfr_name_short = mfr_name_short;
    }

    public void setFormulation_short(String formulation_short) {
        this.formulation_short = formulation_short;
    }
    
    public void setGenericname_short(String genericname_short) {
        this.genericname_short = genericname_short;
    }

    /**
     * @return the drug_id
     */
    public int getDrug_id() {
        return drug_id;
    }

    /**
     * @param drug_id the drug_id to set
     */
    public void setDrug_id(int drug_id) {
        this.drug_id = drug_id;
    }

    /**
     * @return the passVale
     */
    public int getPassVale() {
        return passVale;
    }

    /**
     * @param passVale the passVale to set
     */
    public void setPassVale(int passVale) {
        this.passVale = passVale;
    }

    /**
     * @return the getDrugCharacter
     */
    public String getGetDrugCharacter() {
        return getDrugCharacter;
    }

    /**
     * @param getDrugCharacter the getDrugCharacter to set
     */
    public void setGetDrugCharacter(String getDrugCharacter) {
        this.getDrugCharacter = getDrugCharacter;
    }

    /**
     * @return the getTherapeuticName
     */
    public String getTherapeuticName() {
        return therapeuticName;
    }

    /**
     * @param getTherapeuticName the getTherapeuticName to set
     */
    public void setTherapeuticName(String therapeuticName) {
        this.therapeuticName = therapeuticName;
    }
}
