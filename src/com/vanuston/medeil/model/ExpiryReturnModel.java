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
public class ExpiryReturnModel  implements Serializable{

private static final long serialVersionUID = 1L;
private int expiry_exp_no;
    private String expiry_dist_name;
    private String expiry_from_date;
    private String expiry_to_date;
    private String expiry_curr_date;
    private double expiry_discount;
    private String expiry_item_code;
    private String expiry_item_name;
    private String expiry_formulation;
    private String expiry_mfgname;
    private String expiry_batch_no;
    private int expiry_qty;
    private int expiry_free_qty;
    private String expiry_date;
    private double expiry_purchase_rate;
    private double expiry_mrp;
    private double expiry_item_total_amount;
    private double expiry_sub_total;
    private double expiry_dis_amount;
    private double expiry_roundoff_amount;
    private double expiry_total_amount;
    private int expiry_return_basedon;
    private int expiry_include_exclude;
    private String expiry_debit_note_no;
    private double expiry_unit_price;
    private int expiry_packing;

private String expiry_checkVal;
private List<ExpiryReturnModel> expiryreturn;
    /**
     * @return the expiry_exp_no
     */
    public int getExpiry_exp_no() {
        return expiry_exp_no;
    }

    /**
     * @param expiry_exp_no the expiry_exp_no to set
     */
    public void setExpiry_exp_no(int expiry_exp_no) {
        this.expiry_exp_no = expiry_exp_no;
    }

    /**
     * @return the expiry_dist_name
     */
    public String getExpiry_dist_name() {
        return expiry_dist_name;
    }

    /**
     * @param expiry_dist_name the expiry_dist_name to set
     */
    public void setExpiry_dist_name(String expiry_dist_name) {
        this.expiry_dist_name = expiry_dist_name;
    }

    /**
     * @return the expiry_from_date
     */
    public String getExpiry_from_date() {
        return expiry_from_date;
    }

    /**
     * @param expiry_from_date the expiry_from_date to set
     */
    public void setExpiry_from_date(String expiry_from_date) {
        this.expiry_from_date = expiry_from_date;
    }

    /**
     * @return the expiry_to_date
     */
    public String getExpiry_to_date() {
        return expiry_to_date;
    }

    /**
     * @param expiry_to_date the expiry_to_date to set
     */
    public void setExpiry_to_date(String expiry_to_date) {
        this.expiry_to_date = expiry_to_date;
    }

    /**
     * @return the expiry_curr_date
     */
    public String getExpiry_curr_date() {
        return expiry_curr_date;
    }

    /**
     * @param expiry_curr_date the expiry_curr_date to set
     */
    public void setExpiry_curr_date(String expiry_curr_date) {
        this.expiry_curr_date = expiry_curr_date;
    }

    /**
     * @return the expiry_discount
     */
    public double getExpiry_discount() {
        return expiry_discount;
    }

    /**
     * @param expiry_discount the expiry_discount to set
     */
    public void setExpiry_discount(double expiry_discount) {
        this.expiry_discount = expiry_discount;
    }

    /**
     * @return the expiry_item_code
     */
    public String getExpiry_item_code() {
        return expiry_item_code;
    }

    /**
     * @param expiry_item_code the expiry_item_code to set
     */
    public void setExpiry_item_code(String expiry_item_code) {
        this.expiry_item_code = expiry_item_code;
    }

    /**
     * @return the expiry_item_name
     */
    public String getExpiry_item_name() {
        return expiry_item_name;
    }

    /**
     * @param expiry_item_name the expiry_item_name to set
     */
    public void setExpiry_item_name(String expiry_item_name) {
        this.expiry_item_name = expiry_item_name;
    }

    /**
     * @return the expiry_formulation
     */
    public String getExpiry_formulation() {
        return expiry_formulation;
    }

    /**
     * @param expiry_formulation the expiry_formulation to set
     */
    public void setExpiry_formulation(String expiry_formulation) {
        this.expiry_formulation = expiry_formulation;
    }

    /**
     * @return the expiry_mfgname
     */
    public String getExpiry_mfgname() {
        return expiry_mfgname;
    }

    /**
     * @param expiry_mfgname the expiry_mfgname to set
     */
    public void setExpiry_mfgname(String expiry_mfgname) {
        this.expiry_mfgname = expiry_mfgname;
    }

    /**
     * @return the expiry_batch_no
     */
    public String getExpiry_batch_no() {
        return expiry_batch_no;
    }

    /**
     * @param expiry_batch_no the expiry_batch_no to set
     */
    public void setExpiry_batch_no(String expiry_batch_no) {
        this.expiry_batch_no = expiry_batch_no;
    }

    /**
     * @return the expiry_qty
     */
    public int getExpiry_qty() {
        return expiry_qty;
    }

    /**
     * @param expiry_qty the expiry_qty to set
     */
    public void setExpiry_qty(int expiry_qty) {
        this.expiry_qty = expiry_qty;
    }

    /**
     * @return the expiry_free_qty
     */
    public int getExpiry_free_qty() {
        return expiry_free_qty;
    }

    /**
     * @param expiry_free_qty the expiry_free_qty to set
     */
    public void setExpiry_free_qty(int expiry_free_qty) {
        this.expiry_free_qty = expiry_free_qty;
    }

    /**
     * @return the expiry_date
     */
    public String getExpiry_date() {
        return expiry_date;
    }

    /**
     * @param expiry_date the expiry_date to set
     */
    public void setExpiry_date(String expiry_date) {
        this.expiry_date = expiry_date;
    }

    /**
     * @return the expiry_purchase_rate
     */
    public double getExpiry_purchase_rate() {
        return expiry_purchase_rate;
    }

    /**
     * @param expiry_purchase_rate the expiry_purchase_rate to set
     */
    public void setExpiry_purchase_rate(double expiry_purchase_rate) {
        this.expiry_purchase_rate = expiry_purchase_rate;
    }

    /**
     * @return the expiry_mrp
     */
    public double getExpiry_mrp() {
        return expiry_mrp;
    }

    /**
     * @param expiry_mrp the expiry_mrp to set
     */
    public void setExpiry_mrp(double expiry_mrp) {
        this.expiry_mrp = expiry_mrp;
    }

    /**
     * @return the expiry_item_total_amount
     */
    public double getExpiry_item_total_amount() {
        return expiry_item_total_amount;
    }

    /**
     * @param expiry_item_total_amount the expiry_item_total_amount to set
     */
    public void setExpiry_item_total_amount(double expiry_item_total_amount) {
        this.expiry_item_total_amount = expiry_item_total_amount;
    }

    /**
     * @return the expiry_sub_total
     */
    public double getExpiry_sub_total() {
        return expiry_sub_total;
    }

    /**
     * @param expiry_sub_total the expiry_sub_total to set
     */
    public void setExpiry_sub_total(double expiry_sub_total) {
        this.expiry_sub_total = expiry_sub_total;
    }

    /**
     * @return the expiry_dis_amount
     */
    public double getExpiry_dis_amount() {
        return expiry_dis_amount;
    }

    /**
     * @param expiry_dis_amount the expiry_dis_amount to set
     */
    public void setExpiry_dis_amount(double expiry_dis_amount) {
        this.expiry_dis_amount = expiry_dis_amount;
    }

    /**
     * @return the expiry_roundoff_amount
     */
    public double getExpiry_roundoff_amount() {
        return expiry_roundoff_amount;
    }

    /**
     * @param expiry_roundoff_amount the expiry_roundoff_amount to set
     */
    public void setExpiry_roundoff_amount(double expiry_roundoff_amount) {
        this.expiry_roundoff_amount = expiry_roundoff_amount;
    }

    /**
     * @return the expiry_total_amount
     */
    public double getExpiry_total_amount() {
        return expiry_total_amount;
    }

    /**
     * @param expiry_total_amount the expiry_total_amount to set
     */
    public void setExpiry_total_amount(double expiry_total_amount) {
        this.expiry_total_amount = expiry_total_amount;
    }

    /**
     * @return the expiry_return_basedon
     */
    public int getExpiry_return_basedon() {
        return expiry_return_basedon;
    }

    /**
     * @param expiry_return_basedon the expiry_return_basedon to set
     */
    public void setExpiry_return_basedon(int expiry_return_basedon) {
        this.expiry_return_basedon = expiry_return_basedon;
    }

    /**
     * @return the expiry_include_exclude
     */
    public int getExpiry_include_exclude() {
        return expiry_include_exclude;
    }

    /**
     * @param expiry_include_exclude the expiry_include_exclude to set
     */
    public void setExpiry_include_exclude(int expiry_include_exclude) {
        this.expiry_include_exclude = expiry_include_exclude;
    }

    /**
     * @return the expiry_debit_note_no
     */
    public String getExpiry_debit_note_no() {
        return expiry_debit_note_no;
    }

    /**
     * @param expiry_debit_note_no the expiry_debit_note_no to set
     */
    public void setExpiry_debit_note_no(String expiry_debit_note_no) {
        this.expiry_debit_note_no = expiry_debit_note_no;
    }

    /**
     * @return the expiry_checkVal
     */
    public String getExpiry_checkVal() {
        return expiry_checkVal;
    }

    /**
     * @param expiry_checkVal the expiry_checkVal to set
     */
    public void setExpiry_checkVal(String expiry_checkVal) {
        this.expiry_checkVal = expiry_checkVal;
    }

    /**
     * @return the expiry_unit_price
     */
    public double getExpiry_unit_price() {
        return expiry_unit_price;
    }

    /**
     * @param expiry_unit_price the expiry_unit_price to set
     */
    public void setExpiry_unit_price(double expiry_unit_price) {
        this.expiry_unit_price = expiry_unit_price;
    }

    /**
     * @return the expiry_packing
     */
    public int getExpiry_packing() {
        return expiry_packing;
    }

    /**
     * @param expiry_packing the expiry_packing to set
     */
    public void setExpiry_packing(int expiry_packing) {
        this.expiry_packing = expiry_packing;
    }

    /**
     * @return the expiryreturn
     */
    public List<ExpiryReturnModel> getExpiryreturn() {
        return expiryreturn;
    }

    /**
     * @param expiryreturn the expiryreturn to set
     */
    public void setExpiryreturn(List<ExpiryReturnModel> expiryreturn) {
        this.expiryreturn = expiryreturn;
    }
}
