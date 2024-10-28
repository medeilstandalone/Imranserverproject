/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author muralikrishnan
 */
public class DrugSpecificationModel implements Serializable{

   private String itemName;
   private String genericName;
   private String description;
   private String categories;
   private String chemicalFormula;
   private String indication;
   private String pharmaCodynamics;
   private String mechanism;
   private String absorption;
   private String volumeDistribution;
   private String metabolism;
   private String routeElimination;
   private String halfLife;
   private String toxicity;
   private String foodInteractions;
   private String saveType;
   private String interactingGenericName;
   private ArrayList<DrugSpecificationModel> DrugSpecificationModelList;
   private String interactionDesc;

    public String getInteractionDesc() {
        return interactionDesc;
    }

    public void setInteractionDesc(String interactionDesc) {
        this.interactionDesc = interactionDesc;
    }

   public String getInteractingGenericName() {
        return interactingGenericName;
    }

    public void setInteractingGenericName(String interactingGenericName) {
        this.interactingGenericName = interactingGenericName;
    }

   public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public ArrayList<DrugSpecificationModel> getDrugSpecificationModelList() {
        return DrugSpecificationModelList;
    }

    public void setDrugSpecificationModelList(ArrayList<DrugSpecificationModel> DrugSpecificationModelList) {
        this.DrugSpecificationModelList = DrugSpecificationModelList;
    }

    public String getSaveType() {
        return saveType;
    }

    public void setSaveType(String saveType) {
        this.saveType = saveType;
    }

    public String getGenericName() {
        return genericName;
    }

    public void setGenericName(String genericName) {
        this.genericName = genericName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getCategories() {
        return categories;
    }

    public void setCategories(String categories) {
        this.categories = categories;
    }

    public String getChemicalFormula() {
        return chemicalFormula;
    }

    public void setChemicalFormula(String chemicalFormula) {
        this.chemicalFormula = chemicalFormula;
    }

    public String getIndication() {
        return indication;
    }

    public void setIndication(String indication) {
        this.indication = indication;
    }

    public String getPharmaCodynamics() {
        return pharmaCodynamics;
    }

    public void setPharmaCodynamics(String pharmaCodynamics) {
        this.pharmaCodynamics = pharmaCodynamics;
    }

    public String getMechanism() {
        return mechanism;
    }

    public void setMechanism(String mechanism) {
        this.mechanism = mechanism;
    }

    public String getAbsorption() {
        return absorption;
    }

    public void setAbsorption(String absorption) {
        this.absorption = absorption;
    }

    public String getVolumeDistribution() {
        return volumeDistribution;
    }

    public void setVolumeDistribution(String volumeDistribution) {
        this.volumeDistribution = volumeDistribution;
    }

    public String getMetabolism() {
        return metabolism;
    }

    public void setMetabolism(String metabolism) {
        this.metabolism = metabolism;
    }

    public String getRouteElimination() {
        return routeElimination;
    }

    public void setRouteElimination(String routeElimination) {
        this.routeElimination = routeElimination;
    }

    public String getHalfLife() {
        return halfLife;
    }

    public void setHalfLife(String halfLife) {
        this.halfLife = halfLife;
    }

    public String getToxicity() {
        return toxicity;
    }

    public void setToxicity(String toxicity) {
        this.toxicity = toxicity;
    }

    public String getFoodInteractions() {
        return foodInteractions;
    }

    public void setFoodInteractions(String foodInteractions) {
        this.foodInteractions = foodInteractions;
    }
   
  
   
}
