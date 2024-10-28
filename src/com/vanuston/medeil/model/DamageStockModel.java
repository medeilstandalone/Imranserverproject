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
public class DamageStockModel implements Serializable {
    private static final long serialVersionUID = 1L;
private String damage_stock_date;
private String damage_invoice_no;
private String damage_invoice_date;
private String damage_dist_name;
private String damage_contact_no;
private String damage_item_code;
private String damage_item_name;
private String damage_batch_no;
private String damage_mfr_name;
private String damage_expiry_date;
private int damage_purchased_qty;
private int damage_damaged_qty;
private double damage_unit_price;
private double damage_unit_vat;
private double damage_unit_discount;
private double damage_sub_total;
private double damage_total_amount;
private int damage_free;
private int damage_packing;
private String damage_remarks;

private List<DamageStockModel> damageStock;
    /**
     * @return the damage_stock_date
     */
    public String getDamage_stock_date() {
        return damage_stock_date;
    }

    /**
     * @param damage_stock_date the damage_stock_date to set
     */
    public void setDamage_stock_date(String damage_stock_date) {
        this.damage_stock_date = damage_stock_date;
    }

    /**
     * @return the damage_invoice_no
     */
    public String getDamage_invoice_no() {
        return damage_invoice_no;
    }
    /**
     * @param damage_invoice_no the damage_invoice_no to set
     */
    public void setDamage_invoice_no(String damage_invoice_no) {
        this.damage_invoice_no = damage_invoice_no;
    }
    /**
     * @return the damage_invoice_date
     */
    public String getDamage_invoice_date() {
        return damage_invoice_date;
    }
    /**
     * @param damage_invoice_date the damage_invoice_date to set
     */
    public void setDamage_invoice_date(String damage_invoice_date) {
        this.damage_invoice_date = damage_invoice_date;
    }

    /**
     * @return the damage_dist_name
     */
    public String getDamage_dist_name() {
        return damage_dist_name;
    }

    /**
     * @param damage_dist_name the damage_dist_name to set
     */
    public void setDamage_dist_name(String damage_dist_name) {
        this.damage_dist_name = damage_dist_name;
    }

    /**
     * @return the damage_contact_no
     */
    public String getDamage_contact_no() {
        return damage_contact_no;
    }

    /**
     * @param damage_contact_no the damage_contact_no to set
     */
    public void setDamage_contact_no(String damage_contact_no) {
        this.damage_contact_no = damage_contact_no;
    }

    /**
     * @return the damage_item_code
     */
    public String getDamage_item_code() {
        return damage_item_code;
    }

    /**
     * @param damage_item_code the damage_item_code to set
     */
    public void setDamage_item_code(String damage_item_code) {
        this.damage_item_code = damage_item_code;
    }

    /**
     * @return the damage_item_name
     */
    public String getDamage_item_name() {
        return damage_item_name;
    }

    /**
     * @param damage_item_name the damage_item_name to set
     */
    public void setDamage_item_name(String damage_item_name) {
        this.damage_item_name = damage_item_name;
    }

    /**
     * @return the damage_batch_no
     */
    public String getDamage_batch_no() {
        return damage_batch_no;
    }

    /**
     * @param damage_batch_no the damage_batch_no to set
     */
    public void setDamage_batch_no(String damage_batch_no) {
        this.damage_batch_no = damage_batch_no;
    }

    /**
     * @return the damage_mfr_name
     */
    public String getDamage_mfr_name() {
        return damage_mfr_name;
    }

    /**
     * @param damage_mfr_name the damage_mfr_name to set
     */
    public void setDamage_mfr_name(String damage_mfr_name) {
        this.damage_mfr_name = damage_mfr_name;
    }

    /**
     * @return the damage_expiry_date
     */
    public String getDamage_expiry_date() {
        return damage_expiry_date;
    }

    /**
     * @param damage_expiry_date the damage_expiry_date to set
     */
    public void setDamage_expiry_date(String damage_expiry_date) {
        this.damage_expiry_date = damage_expiry_date;
    }

    /**
     * @return the damage_purchased_qty
     */
    public int getDamage_purchased_qty() {
        return damage_purchased_qty;
    }

    /**
     * @param damage_purchased_qty the damage_purchased_qty to set
     */
    public void setDamage_purchased_qty(int damage_purchased_qty) {
        this.damage_purchased_qty = damage_purchased_qty;
    }

    /**
     * @return the damage_damaged_qty
     */
    public int getDamage_damaged_qty() {
        return damage_damaged_qty;
    }

    /**
     * @param damage_damaged_qty the damage_damaged_qty to set
     */
    public void setDamage_damaged_qty(int damage_damaged_qty) {
        this.damage_damaged_qty = damage_damaged_qty;
    }

    /**
     * @return the damage_unit_price
     */
    public double getDamage_unit_price() {
        return damage_unit_price;
    }

    /**
     * @param damage_unit_price the damage_unit_price to set
     */
    public void setDamage_unit_price(double damage_unit_price) {
        this.damage_unit_price = damage_unit_price;
    }

    /**
     * @return the damage_unit_vat
     */
    public double getDamage_unit_vat() {
        return damage_unit_vat;
    }

    /**
     * @param damage_unit_vat the damage_unit_vat to set
     */
    public void setDamage_unit_vat(double damage_unit_vat) {
        this.damage_unit_vat = damage_unit_vat;
    }

    /**
     * @return the damage_unit_discount
     */
    public double getDamage_unit_discount() {
        return damage_unit_discount;
    }

    /**
     * @param damage_unit_discount the damage_unit_discount to set
     */
    public void setDamage_unit_discount(double damage_unit_discount) {
        this.damage_unit_discount = damage_unit_discount;
    }

    /**
     * @return the damage_sub_total
     */
    public double getDamage_sub_total() {
        return damage_sub_total;
    }

    /**
     * @param damage_sub_total the damage_sub_total to set
     */
    public void setDamage_sub_total(double damage_sub_total) {
        this.damage_sub_total = damage_sub_total;
    }

    /**
     * @return the damage_total_amount
     */
    public double getDamage_total_amount() {
        return damage_total_amount;
    }

    /**
     * @param damage_total_amount the damage_total_amount to set
     */
    public void setDamage_total_amount(double damage_total_amount) {
        this.damage_total_amount = damage_total_amount;
    }

    /**
     * @return the damage_remarks
     */
    public String getDamage_remarks() {
        return damage_remarks;
    }

    /**
     * @param damage_remarks the damage_remarks to set
     */
    public void setDamage_remarks(String damage_remarks) {
        this.damage_remarks = damage_remarks;
    }

    /**
     * @return the damageStock
     */
    public List getDamageStock() {
        return damageStock;
    }
    /**
     * @param damageStock the damageStock to set
     */
    public void setDamageStock(List<DamageStockModel> damageStock) {
        this.damageStock = damageStock;
    }

    /**
     * @return the damage_free
     */
    public int getDamage_free() {
        return damage_free;
    }

    /**
     * @param damage_free the damage_free to set
     */
    public void setDamage_free(int damage_free) {
        this.damage_free = damage_free;
    }

    /**
     * @return the damage_packing
     */
    public int getDamage_packing() {
        return damage_packing;
    }

    /**
     * @param damage_packing the damage_packing to set
     */
    public void setDamage_packing(int damage_packing) {
        this.damage_packing = damage_packing;
    }
}
