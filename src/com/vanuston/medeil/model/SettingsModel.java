/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.model;

import java.io.Serializable;

/**
 *
 * @author saran
 */
public class SettingsModel implements Serializable {

    private static final long serialVersionUID = 1L;
    private String alertMonth;
    private String alertWeek;
    private String alertDays;
    private String expiryAlertStatus;
    private String updateAutomatic;
    private String updateManual;
    private String updateTime;
    private String updateSession;
    private String updateDay;
    private String ways2smsUserName;
    private String way2smsPassword;
    private String one60UserName;
    private String one160Password;
    private String alternateUserName;
    private String alternatePassword;
    private String default_sms_gw;
    private String send_purchase_order_enable;
    private String send_purchase_order_pdf;
    private String send_purchase_order_sms;
    private String send_purchase_order_html;
    private String send_purchase_order_email;
    private String maintenance_cost_days;
    private String maintenance_cost_alert;
    private String reminder_email;
    private String reminder_sms;
    private String alertStaus;
    private String emial_user_name;
    private String email_user_password;
    private String sms_mobile_no;
    private String serverAddress;
    private String serverPort;
    private Boolean enableAutoRoundoff;
    private Double consultationFee;
    private Double followupVisitFee;
    private Integer followupDays;
    
    public Double getConsultationFee() {
        return consultationFee;
    }

    public void setConsultationFee(Double consultationFee) {
        this.consultationFee = consultationFee;
    }

    public Integer getFollowupDays() {
        return followupDays;
    }

    public void setFollowupDays(Integer followupDays) {
        this.followupDays = followupDays;
    }

    public Double getFollowupVisitFee() {
        return followupVisitFee;
    }

    public void setFollowupVisitFee(Double followupVisitFee) {
        this.followupVisitFee = followupVisitFee;
    }

    public Boolean getEnableAutoRoundoff() {
        return enableAutoRoundoff;
    }

    public void setEnableAutoRoundoff(Boolean enableAutoRoundoff) {
        this.enableAutoRoundoff = enableAutoRoundoff;
    }
    
    

    public String getAlertMonth() {
        return alertMonth;
    }

    public void setAlertMonth(String alertMonth) {
        this.alertMonth = alertMonth;
    }

    public String getAlertWeek() {
        return alertWeek;
    }

    public void setAlertWeek(String alertWeek) {
        this.alertWeek = alertWeek;
    }

    public String getAlertDays() {
        return alertDays;
    }

    public void setAlertDays(String alertDays) {
        this.alertDays = alertDays;
    }

    public String getExpiryAlertStatus() {
        return expiryAlertStatus;
    }

    public void setExpiryAlertStatus(String expiryAlertStatus) {
        this.expiryAlertStatus = expiryAlertStatus;
    }

    public String getUpdateAutomatic() {
        return updateAutomatic;
    }

    public void setUpdateAutomatic(String updateAutomatic) {
        this.updateAutomatic = updateAutomatic;
    }

    public String getUpdateManual() {
        return updateManual;
    }

    public void setUpdateManual(String updateManual) {
        this.updateManual = updateManual;
    }

    public String getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(String updateTime) {
        this.updateTime = updateTime;
    }

    public String getUpdateSession() {
        return updateSession;
    }

    public void setUpdateSession(String updateSession) {
        this.updateSession = updateSession;
    }

    public String getUpdateDay() {
        return updateDay;
    }

    public void setUpdateDay(String updateDay) {
        this.updateDay = updateDay;
    }

    public String getWays2smsUserName() {
        return ways2smsUserName;
    }

    public void setWays2smsUserName(String ways2smsUserName) {
        this.ways2smsUserName = ways2smsUserName;
    }

    public String getWay2smsPassword() {
        return way2smsPassword;
    }

    public void setWay2smsPassword(String way2smsPassword) {
        this.way2smsPassword = way2smsPassword;
    }

    public String getOne60UserName() {
        return one60UserName;
    }

    public void setOne60UserName(String one60UserName) {
        this.one60UserName = one60UserName;
    }

    /**
     * @return the one160Password
     */
    public String getOne160Password() {
        return one160Password;
    }

    public void setOne160Password(String one160Password) {
        this.one160Password = one160Password;
    }

    public String getAlternateUserName() {
        return alternateUserName;
    }

    public void setAlternateUserName(String alternateUserName) {
        this.alternateUserName = alternateUserName;
    }

    public String getAlternatePassword() {
        return alternatePassword;
    }

    public void setAlternatePassword(String alternatePassword) {
        this.alternatePassword = alternatePassword;
    }

    public String getDefault_sms_gw() {
        return default_sms_gw;
    }

    public void setDefault_sms_gw(String default_sms_gw) {
        this.default_sms_gw = default_sms_gw;
    }

    public String getSend_purchase_order_enable() {
        return send_purchase_order_enable;
    }

    public void setSend_purchase_order_enable(String send_purchase_order_enable) {
        this.send_purchase_order_enable = send_purchase_order_enable;
    }

    public String getSend_purchase_order_pdf() {
        return send_purchase_order_pdf;
    }

    public void setSend_purchase_order_pdf(String send_purchase_order_pdf) {
        this.send_purchase_order_pdf = send_purchase_order_pdf;
    }

    public String getSend_purchase_order_sms() {
        return send_purchase_order_sms;
    }

    public void setSend_purchase_order_sms(String send_purchase_order_sms) {
        this.send_purchase_order_sms = send_purchase_order_sms;
    }

    public String getSend_purchase_order_html() {
        return send_purchase_order_html;
    }

    public void setSend_purchase_order_html(String send_purchase_order_html) {
        this.send_purchase_order_html = send_purchase_order_html;
    }

    public String getSend_purchase_order_email() {
        return send_purchase_order_email;
    }

    public void setSend_purchase_order_email(String send_purchase_order_email) {
        this.send_purchase_order_email = send_purchase_order_email;
    }

    public String getMaintenance_cost_days() {
        return maintenance_cost_days;
    }

    public void setMaintenance_cost_days(String maintenance_cost_days) {
        this.maintenance_cost_days = maintenance_cost_days;
    }

    public String getMaintenance_cost_alert() {
        return maintenance_cost_alert;
    }

    public void setMaintenance_cost_alert(String maintenance_cost_alert) {
        this.maintenance_cost_alert = maintenance_cost_alert;
    }

    public String getReminder_email() {
        return reminder_email;
    }

    public void setReminder_email(String reminder_email) {
        this.reminder_email = reminder_email;
    }

    public String getReminder_sms() {
        return reminder_sms;
    }

    public void setReminder_sms(String reminder_sms) {
        this.reminder_sms = reminder_sms;
    }

    /**
     * @return the alertStaus
     */
    public String getAlertStaus() {
        return alertStaus;
    }

    /**
     * @param alertStaus the alertStaus to set
     */
    public void setAlertStaus(String alertStaus) {
        this.alertStaus = alertStaus;
    }

    /**
     * @return the emial_user_name
     */
    public String getEmial_user_name() {
        return emial_user_name;
    }

    /**
     * @param emial_user_name the emial_user_name to set
     */
    public void setEmial_user_name(String emial_user_name) {
        this.emial_user_name = emial_user_name;
    }

    /**
     * @return the email_user_password
     */
    public String getEmail_user_password() {
        return email_user_password;
    }

    /**
     * @param email_user_password the email_user_password to set
     */
    public void setEmail_user_password(String email_user_password) {
        this.email_user_password = email_user_password;
    }

    /**
     * @return the sms_mobile_no
     */
    public String getSms_mobile_no() {
        return sms_mobile_no;
    }

    /**
     * @param sms_mobile_no the sms_mobile_no to set
     */
    public void setSms_mobile_no(String sms_mobile_no) {
        this.sms_mobile_no = sms_mobile_no;
    }

    /**
     * @return the serverAddress
     */
    public String getServerAddress() {
        return serverAddress;
    }

    /**
     * @param serverAddress the serverAddress to set
     */
    public void setServerAddress(String serverAddress) {
        this.serverAddress = serverAddress;
    }

    /**
     * @return the serverPort
     */
    public String getServerPort() {
        return serverPort;
    }

    /**
     * @param serverPort the serverPort to set
     */
    public void setServerPort(String serverPort) {
        this.serverPort = serverPort;
    }

  }
