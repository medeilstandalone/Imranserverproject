package com.vanuston.medeil.ui;

import java.lang.System;

import javafx.scene.Node;
import javafx.scene.text.Font;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;

import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.input.MouseEvent;

import javafx.scene.layout.HBox;
import javafx.scene.layout.Panel;
import javafx.scene.layout.LayoutInfo;

import javafx.scene.shape.Rectangle ;
import javafx.scene.effect.Lighting ;
import javafx.scene.effect.Reflection;
import javafx.scene.effect.DropShadow;

import javafx.scene.control.Label;
import javafx.scene.control.Button;
import javafx.scene.control.TextBox;
import javafx.scene.control.CheckBox;
import javafx.scene.control.Separator;
import javafx.scene.control.ToggleGroup;

import javafx.scene.paint.Color;
import javafx.scene.paint.LinearGradient;

import org.netbeans.javafx.design.DesignState;

import com.vanuston.medeil.util.SendMail;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Validation;
import com.vanuston.medeil.util.KeyRegistry;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import com.vanuston.medeil.ui.calendar.theme.Theme;
import javafx.stage.Alert;
import java.lang.Thread;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.model.CustomerAlertModel;
import java.sql.Date;


var smsDatFlag: Boolean = false;
var emailDatFlag: Boolean = false;
var fxCalendar = FXCalendar {
            theme: Theme {};
        };
public var isSave = 0;
var custCodeSms;
var custCodeEmail;

public class CustomerAlerts {

    var commonController : CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements ;
    var customerAlertController : com.vanuston.medeil.implementation.CustomerAlerts = RegistryFactory.getClientStub(RegistryConstants.CustomerAlerts) as com.vanuston.medeil.implementation.CustomerAlerts ;
    //Controller Instance
    var getAutoVal = commonController.getAutoIncrement("cAlert");

    var panelW = bind CommonDeclare.panelFormW;
    var panelH = bind CommonDeclare.panelFormH;
    var one = bind CommonDeclare.one;
    var two = bind CommonDeclare.two;
    var five = bind CommonDeclare.five;
    var ten = bind CommonDeclare.ten;
    var eighty = bind (8 * ten);
    var hundred = bind CommonDeclare.hundred;
    var twoHund = bind CommonDeclare.twoHund;
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var CheckLX = bind (13.34180432 * panelW) / 100;
    var panelLX = bind (31.00381194 * panelW) / 100;
    var C1LX = bind (8 * ten) + five;
    var C2lblLX = bind twoHund + hundred;
    var C2LX = bind twoHund + hundred + (6 * ten) + five;
    var panelRW = bind (31.00381194 * panelW) / 100;
    var msgW = bind (2 * twoHund) + (5 * ten);
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;
    var Type4TextboxW = bind (panelW * 3.176620076) / 100;
    var botton1LX = bind CommonDeclare.botton31LX;
    var botton2LX = bind CommonDeclare.botton32LX;
    var botton3LX = bind CommonDeclare.botton33LX;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    var buttonW = bind CommonDeclare.bottonW;
    var buttonH = bind CommonDeclare.bottonH;
    var seperatorW = bind CommonDeclare.seperatorW;
    var listH = 0.0;
    var listW = 0.0;
    var listLX = 0.0;
    var listLY = 0.0;

    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def rectangle2: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 397.5
        layoutY: 0.0
        styleClass: "rectFormHeader"
        width: bind panelW
        height: 575.0
    }
    
    def __layoutInfo_separator: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
        height: 0.0
    }
    public-read def separator: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: bind 3 * ten
        layoutY: 120.0
        layoutInfo: __layoutInfo_separator
    }
    
    def __layoutInfo_separator2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
    }
    public-read def separator2: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: bind 3 * ten
        layoutY: 256.0
        layoutInfo: __layoutInfo_separator2
    }
    
    def __layoutInfo_separator3: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
    }
    public-read def separator3: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: bind 3 * ten
        layoutY: 389.0
        layoutInfo: __layoutInfo_separator3
    }
    
    public-read def imgCRCancel: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imgCRReset: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imgCRSave: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imgDateEmail: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind C1LX + Type3TextboxW
        layoutY: 60.0
        onMouseClicked: imgDateEmailOnMouseClicked
    }
    
    def __layoutInfo_txtRemMsgEmail: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind msgW
        height: 55.0
    }
    public-read def txtRemMsgEmail: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C1LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_txtRemMsgEmail
        onKeyPressed: txtRemMsgEmailOnKeyPressed
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 0.0
        layoutY: 114.0
        text: "Label"
    }
    
    def __layoutInfo_txtCustAlrtEName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtCustAlrtEName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C1LX
        layoutY: 120.0
        layoutInfo: __layoutInfo_txtCustAlrtEName
        onKeyPressed: txtCustAlrtENameOnKeyPressed
        onKeyReleased: txtCustAlrtENameOnKeyReleased
    }
    
    def __layoutInfo_listCustAlert2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listCustAlert2: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind listLX
        layoutY: bind listLY
        layoutInfo: __layoutInfo_listCustAlert2
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    public-read def imgDateSms: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind C1LX + Type3TextboxW
        layoutY: 60.0
        onMouseClicked: imgDateSmsOnMouseClicked
    }
    
    def __layoutInfo_txtRemSMob1: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtRemSMob1: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C1LX + msgW - txtRemSMob1.width
        layoutY: 60.0
        layoutInfo: __layoutInfo_txtRemSMob1
        onKeyPressed: txtRemSMob1OnKeyPressed
    }
    
    def __layoutInfo_txtRemSMob2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtRemSMob2: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C1LX + msgW- txtRemSMob2.width
        layoutY: 88.0
        layoutInfo: __layoutInfo_txtRemSMob2
    }
    
    def __layoutInfo_txtRemMsgSms: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind msgW
        height: 55.0
    }
    public-read def txtRemMsgSms: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C1LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_txtRemMsgSms
        onKeyPressed: txtRemMsgSmsOnKeyPressed
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 0.0
        layoutY: 54.0
        text: "Label"
    }
    
    def __layoutInfo_txtCustAlrtName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtCustAlrtName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C1LX
        layoutY: 60.0
        layoutInfo: __layoutInfo_txtCustAlrtName
        onKeyPressed: txtCustAlrtNameOnKeyPressed
        onKeyReleased: txtCustAlrtNameOnKeyReleased
    }
    
    def __layoutInfo_listCustAlert1: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listCustAlert1: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind listLX
        layoutY: bind listLY
        layoutInfo: __layoutInfo_listCustAlert1
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    public-read def imageClose: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 932.0
        layoutY: 12.0
        onMouseClicked: imageCloseOnMouseClicked
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
    }
    
    public-read def panelAlertMsg: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
    }
    
    public-read def DatePickPanel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
    }
    
    public-read def panelHomePage: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
    }
    
    public-read def Violet: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.011764706
        green: 0.5019608
        blue: 0.7607843
    }
    
    public-read def linearGradient: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#ffffff") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#f5f0e9") }, ]
    }
    
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        opacity: 1.0
        layoutX: 0.0
        layoutY: 0.0
        onMouseClicked: rectangleOnMouseClicked
        fill: linearGradient
        stroke: Violet
        width: bind panelW
        height: bind panelH
    }
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 6.0
        layoutY: 11.0
        text: "Message"
        font: Arial_12
    }
    
    def __layoutInfo_txtRemSDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtRemSDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C1LX
        layoutY: 60.0
        layoutInfo: __layoutInfo_txtRemSDate
        onKeyPressed: txtRemSDateOnKeyPressed
        promptText: "dd - mm - yyyy"
        font: Arial_12
    }
    
    public-read def label10: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 6.0
        layoutY: 20.0
        text: "Message"
        font: Arial_12
    }
    
    def __layoutInfo_txtRemEDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtRemEDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C1LX
        layoutY: 60.0
        layoutInfo: __layoutInfo_txtRemEDate
        onKeyPressed: txtRemEDateOnKeyPressed
        promptText: "dd - mm - yyyy"
        font: Arial_12
    }
    
    def __layoutInfo_txtRemEMail2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtRemEMail2: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C1LX + msgW - txtRemEMail2.width
        layoutY: 88.0
        layoutInfo: __layoutInfo_txtRemEMail2
        onKeyPressed: txtRemEMail2OnKeyPressed
        promptText: "xyz@domain.com"
        font: Arial_12
    }
    
    def __layoutInfo_txtRemEMail1: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtRemEMail1: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C1LX + msgW - txtRemEMail1.width
        layoutY: 60.0
        layoutInfo: __layoutInfo_txtRemEMail1
        onKeyPressed: txtRemEMail1OnKeyPressed
        promptText: "xyz@domain.com"
        font: Arial_12
    }
    
    public-read def chkRemEmail: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        layoutX: bind hundred
        layoutY: 444.0
        onKeyReleased: chkRemEmailOnKeyReleased
        onMouseClicked: chkRemEmailOnMouseClicked
        text: "Email"
        font: Arial_12
    }
    
    public-read def chkRemSms: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        layoutX: bind hundred
        layoutY: 309.0
        onKeyReleased: chkRemSmsOnKeyReleased
        onMouseClicked: chkRemSmsOnMouseClicked
        text: "SMS"
        font: Arial_12
    }
    
    public-read def Arial_Bold_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
    }
    
    public-read def Arial_14: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 14.0
    }
    
    public-read def Arial_Bold_14: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 14.0
    }
    
    public-read def Arial_16: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 16.0
    }
    
    public-read def Arial_Bold_16: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 16.0
    }
    
    public-read def Arial_18: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 18.0
    }
    
    public-read def Arial_Bold_18: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 18.0
    }
    
    public-read def Arial_20: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 20.0
    }
    
    public-read def Arial_Bold_20: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 20.0
    }
    
    public-read def reflectionEffect: javafx.scene.effect.Reflection = javafx.scene.effect.Reflection {
    }
    
    def __layoutInfo_btnRemSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind buttonW
        height: bind buttonH
    }
    public-read def btnRemSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton2LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnRemSave
        onKeyReleased: btnRemSaveOnKeyReleased
        translateX: 0.0
        effect: reflectionEffect
        graphic: imgCRSave
        text: "Save  [F2]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
        action: btnRemSaveAction
    }
    
    def __layoutInfo_btnRemSend: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind buttonW
        height: bind buttonH
    }
    public-read def btnRemSend: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnRemSend
        onKeyReleased: btnRemSendOnKeyReleased
        effect: reflectionEffect
        graphic: imgCRReset
        text: "Reset [F5]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
        action: btnRemSendAction
    }
    
    def __layoutInfo_btnRemReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind buttonW
        height: bind buttonH
    }
    public-read def btnRemReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton3LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnRemReset
        onKeyReleased: btnRemResetOnKeyReleased
        effect: reflectionEffect
        graphic: imgCRCancel
        text: "Cancel [Esc]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    public-read def panelButton: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: bind panelButtonsLY
        content: [ btnRemReset, btnRemSend, btnRemSave, ]
    }
    
    def __layoutInfo_btnCustEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 100.0
        height: 30.0
    }
    public-read def btnCustEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 279.0
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnCustEdit
        effect: reflectionEffect
        text: "Edit  [F4]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    public-read def toggleGroup: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def Arial_25: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
        size: 25.0
    }
    
    public-read def DarkGray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.2
        blue: 0.2
    }
    
    public-read def label18: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C2lblLX
        layoutY: 88.0
        text: "Mobile No. 2"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label17: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C2lblLX
        layoutY: 60.0
        text: "Mobile No. 1"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label12: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 60.0
        text: "Date"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def panelSMS: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        disable: false
        layoutX: bind twoHund
        layoutY: 270.0
        content: [ txtRemSDate, label12, imgDateSms, label17, label18, txtRemSMob1, txtRemSMob2, txtRemMsgSms, label9, label2, txtCustAlrtName, listCustAlert1, ]
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 60.0
        text: "Date"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label11: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C2lblLX - (4 * ten)
        layoutY: 88.0
        text: "Email ID 2"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C2lblLX - (4 * ten)
        layoutY: 60.0
        text: "Email ID 1"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def panelEmail: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutX: bind twoHund
        layoutY: 400.0
        content: [ txtRemEMail1, txtRemEMail2, txtRemEDate, label7, label11, label4, imgDateEmail, txtRemMsgEmail, label10, label3, txtCustAlrtEName, listCustAlert2, ]
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.4
    }
    
    public-read def label15: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind (4 * ten)+1
        layoutY: 91.0
        text: "Reminder Settings"
        font: Arial_18
        textFill: Green
    }
    
    public-read def dropShadowEffect: javafx.scene.effect.DropShadow = javafx.scene.effect.DropShadow {
    }
    
    public-read def lightingEffect: javafx.scene.effect.Lighting = javafx.scene.effect.Lighting {
    }
    
    def __layoutInfo_label: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
    }
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 636.0
        layoutY: 34.0
        layoutInfo: __layoutInfo_label
        effect: lightingEffect
        text: "Reminder"
        font: Arial_25
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        disable: false
        content: [ rectangle, rectangle2, label, separator, btnCustEdit, label15, separator2, separator3, chkRemSms, chkRemEmail, panelButton, panelEmail, panelSMS, imageClose, panelAlert, panelAlertMsg, ]
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
    }
    
    public-read def imageSave: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Save1.png"
    }
    
    public-read def linearGradientHeader: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
    }
    
    public-read def imageReset: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/MailSend.png"
    }
    
    public-read def imageCancel: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Cancel.png"
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "Shown", "FScreen", ]
        actual: 0
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectangle.visible = true;
                            rectangle.styleClass = "linear-gradient";
                            rectangle.stroke = DarkGray;
                            rectangle.arcWidth = 5.0;
                            rectangle.arcHeight = 5.0;
                            rectangle2.visible = true;
                            rectangle2.opacity = 0.25;
                            rectangle2.layoutX = 0.0;
                            rectangle2.fill = linearGradientHeader;
                            rectangle2.height = 32.0;
                            label.layoutX = 0.0;
                            label.layoutY = 1.0;
                            label.text = "Customer Alerts - alt+A";
                            label.textAlignment = javafx.scene.text.TextAlignment.LEFT;
                            label.hpos = javafx.geometry.HPos.CENTER;
                            label.graphicHPos = javafx.geometry.HPos.LEFT;
                            separator.layoutY = 65.0;
                            __layoutInfo_separator.height = 6.0;
                            label15.layoutY = 40.0;
                            label15.text = "Alert Settings";
                            separator2.layoutY = 195.0;
                            separator3.layoutY = 385.0;
                            chkRemSms.layoutY = 134.0;
                            chkRemEmail.layoutY = 300.0;
                            imgCRCancel.visible = true;
                            imgCRCancel.image = imageCancel;
                            btnRemReset.layoutY = 0.0;
                            btnRemReset.text = "Reset [F4]";
                            btnRemReset.action = btnRemResetAction;
                            imgCRReset.visible = true;
                            imgCRReset.image = imageReset;
                            btnRemSend.layoutY = 0.0;
                            btnRemSend.text = "Send";
                            imgCRSave.visible = true;
                            imgCRSave.image = imageSave;
                            btnRemSave.layoutY = 0.0;
                            btnRemSave.text = "Save [F3]";
                            panelButton.visible = true;
                            txtRemEMail1.layoutY = 100.0;
                            txtRemEMail2.layoutY = 130.0;
                            txtRemEDate.layoutY = 130.0;
                            label7.layoutY = 100.0;
                            label11.layoutY = 130.0;
                            label4.layoutY = 130.0;
                            imgDateEmail.layoutY = 130.0;
                            __layoutInfo_txtRemMsgEmail.height = 85.0;
                            txtRemMsgEmail.font = Arial_12;
                            txtRemMsgEmail.multiline = true;
                            label10.layoutX = -6.0;
                            label10.layoutY = 54.0;
                            label10.textFill = DarkGray;
                            label3.visible = true;
                            label3.layoutY = 100.0;
                            label3.text = "Name";
                            label3.font = Arial_12;
                            label3.textFill = DarkGray;
                            txtCustAlrtEName.visible = true;
                            txtCustAlrtEName.layoutY = 100.0;
                            listCustAlert2.visible = false;
                            panelEmail.layoutY = 210.0;
                            txtRemSDate.layoutY = 90.0;
                            txtRemSDate.editable = false;
                            label12.layoutY = 90.0;
                            imgDateSms.layoutY = 90.0;
                            label17.layoutY = 60.0;
                            label18.layoutY = 88.0;
                            txtRemSMob1.layoutY = 60.0;
                            txtRemSMob1.font = Arial_12;
                            txtRemSMob2.font = Arial_12;
                            txtRemMsgSms.font = Arial_12;
                            txtRemMsgSms.multiline = true;
                            label9.layoutX = 0.0;
                            label9.layoutY = 24.0;
                            label9.font = Arial_12;
                            label9.textFill = DarkGray;
                            label2.visible = true;
                            label2.layoutY = 60.0;
                            label2.text = "Name";
                            label2.font = Arial_12;
                            label2.textFill = DarkGray;
                            txtCustAlrtName.visible = true;
                            listCustAlert1.visible = false;
                            listCustAlert1.items = [ "Item 1", "Item 2", "Item 3", ];
                            panelSMS.visible = true;
                            panelSMS.layoutY = 75.0;
                            imageClose.visible = false;
                            imageClose.layoutX = 772.0;
                            imageClose.layoutY = 0.0;
                            panel.visible = true;
                            panel.onKeyPressed = panelOnKeyPressedAtFScreen;
                            DatePickPanel.visible = true;
                        }
                    }
                ]
            }
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectangle.visible = false;
                            rectangle.styleClass = "";
                            rectangle.stroke = Violet;
                            rectangle.arcWidth = 0.0;
                            rectangle.arcHeight = 0.0;
                            rectangle2.visible = false;
                            rectangle2.opacity = 1.0;
                            rectangle2.layoutX = 512.0;
                            rectangle2.fill = javafx.scene.paint.Color.BLACK;
                            rectangle2.height = 575.0;
                            label.layoutX = 0.0;
                            label.layoutY = 25.0;
                            label.text = "Customer Alerts - alt+A";
                            label.textAlignment = javafx.scene.text.TextAlignment.CENTER;
                            label.hpos = javafx.geometry.HPos.RIGHT;
                            label.graphicHPos = javafx.geometry.HPos.CENTER;
                            separator.layoutY = 85.0;
                            __layoutInfo_separator.height = 6.0;
                            label15.layoutY = 60.0;
                            label15.text = "Alert Settings";
                            separator2.layoutY = 215.0;
                            separator3.layoutY = 410.0;
                            chkRemSms.layoutY = 134.0;
                            chkRemEmail.layoutY = 300.0;
                            imgCRCancel.visible = true;
                            imgCRCancel.image = null;
                            btnRemReset.layoutY = 525.0;
                            btnRemReset.text = "Cancel [Esc]";
                            imgCRReset.visible = true;
                            imgCRReset.image = null;
                            btnRemSend.layoutY = 525.0;
                            btnRemSend.text = "Reset [F5]";
                            imgCRSave.visible = true;
                            imgCRSave.image = null;
                            btnRemSave.layoutY = 525.0;
                            btnRemSave.text = "Save  [F2]";
                            panelButton.visible = false;
                            txtRemEMail1.layoutY = 120.0;
                            txtRemEMail2.layoutY = 148.0;
                            txtRemEDate.layoutY = 150.0;
                            label7.layoutY = 126.0;
                            label11.layoutY = 148.0;
                            label4.layoutY = 150.0;
                            imgDateEmail.layoutY = 150.0;
                            __layoutInfo_txtRemMsgEmail.height = 114.0;
                            txtRemMsgEmail.font = Arial_12;
                            txtRemMsgEmail.multiline = true;
                            label10.layoutX = -6.0;
                            label10.layoutY = 54.0;
                            label10.textFill = DarkGray;
                            label3.visible = true;
                            label3.layoutY = 120.0;
                            label3.text = "Name";
                            label3.font = Arial_12;
                            label3.textFill = DarkGray;
                            txtCustAlrtEName.visible = true;
                            txtCustAlrtEName.layoutY = 120.0;
                            listCustAlert2.visible = false;
                            panelEmail.layoutY = 230.0;
                            txtRemSDate.layoutY = 90.0;
                            txtRemSDate.editable = false;
                            label12.layoutY = 90.0;
                            imgDateSms.layoutY = 90.0;
                            label17.layoutY = 60.0;
                            label18.layoutY = 88.0;
                            txtRemSMob1.layoutY = 60.0;
                            txtRemMsgSms.font = Arial_12;
                            txtRemMsgSms.multiline = true;
                            label9.layoutX = 0.0;
                            label9.layoutY = 24.0;
                            label9.font = Arial_12;
                            label9.textFill = DarkGray;
                            label2.visible = true;
                            label2.layoutY = 60.0;
                            label2.text = "Name";
                            label2.font = Arial_12;
                            label2.textFill = DarkGray;
                            txtCustAlrtName.visible = true;
                            listCustAlert1.visible = false;
                            listCustAlert1.items = null;
                            panelSMS.visible = true;
                            panelSMS.layoutY = 95.0;
                            imageClose.visible = false;
                            imageClose.layoutX = 1008.0;
                            imageClose.layoutY = 1.0;
                            panel.visible = true;
                            panel.onKeyPressed = panelOnKeyPressedAtFScreen;
                            DatePickPanel.visible = true;
                        }
                    }
                ]
            }
        ]
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel, DatePickPanel, panelHomePage, ]
    }
    // </editor-fold>//GEN-END:main

    function btnRemSaveOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
        btnRemSaveAction();
        }else{ shortcut(event);}
         }
    function btnRemSendOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
        btnRemSendAction();
        }else{ shortcut(event);}
         }
    function btnRemResetOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
        btnRemResetAction();
        }else{ shortcut(event);}
         }
    function txtRemSDateOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
            mandatory_textboxes(1);
            shortcut(event);
         }

    function txtRemSMob1OnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
            mandatory_textboxes(1);
            shortcut(event);
         }
    function txtCustAlrtNameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        mandatory_textboxes(1);
        shortcut(event);
         }
    function txtCustAlrtENameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        mandatory_textboxes(2);
        shortcut(event);
    }
    function txtRemMsgEmailOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        mandatory_textboxes(2);
        shortcut(event);
    }

    function txtRemEDateOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        mandatory_textboxes(2);
        shortcut(event);
    }

    function txtRemEMail2OnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        mandatory_textboxes(2);
        shortcut(event);
    }

    function txtRemEMail1OnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        mandatory_textboxes(2);
        shortcut(event);
    }

    function btnRemSendAction(): Void {
        saveCustomerAlert(1);
    }

    function btnRemResetAction(): Void {
        resetAlertSms();
        resetAlertEmail();
    }

    function rectangleOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        listCustAlert1.visible = false;
        listCustAlert2.visible = false;
    }

    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;

    var mandatory = CommonDeclare.textbox_mandatory();
    var error = CommonDeclare.textbox_error();
    def CustomAlert = CustomAlert {};
    def SendSMSNew = SendSmsAlerts {};
    def SendEmail = SendEmailAlerts {};

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Customer Alerts", type);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Customer Alerts", msg);
        showAlertbox();
    }
    function FXinfo(tit : String ,msg: String): Void {
        CustomAlert.ShowInfo(tit, msg);
        showAlertbox();
    }
    function FXAlert(tit : String ,type : Integer,msg: String): Void {
        CustomAlert.ShowAlert("Cusomer Alerts - {tit}", type, "", msg);
        showAlertbox();
    }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Customer Alerts", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = error;
    }

    function mandatory_textboxes(i: Integer): Void {
         if (i == 1 or i==3) {
            txtRemMsgSms.style = mandatory;
            txtCustAlrtName.style = mandatory;
            txtRemSDate.style = mandatory;
            txtRemSMob1.style = mandatory;
        }
        if (i == 2 or i==3) {
            txtRemMsgEmail.style = mandatory;
            txtCustAlrtEName.style = mandatory;
            txtRemEDate.style = mandatory;
            txtRemEMail1.style = mandatory;
        }
    }

    def kr = KeyRegistry {};
    var short = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 2 and CommonDeclare.form[2] == 3) {
            shortcut(short);
        }
    }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == kr.save and btnRemSave.text == "Save [F3]"and btnRemSave.disable == false) {
            saveCustomerAlert(0);
        }
        if (event.code == kr.reset and btnRemReset.text == "Reset [F4]") {
            resetAlertEmail();
            resetAlertSms();
        }
    }
    function txtCustAlrtNameOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        getCustomer("sms");
        if (event.code == KeyCode.VK_DOWN) {
            listCustAlert1.visible = true;
            listCustAlert1.requestFocus();
            listCustAlert1.selectFirstRow();
        } else if (event.code == KeyCode.VK_ESCAPE) {
            listCustAlert1.visible = false;
        }
    }

    function txtCustAlrtENameOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        getCustomer("email");
        if (event.code == KeyCode.VK_DOWN) {
            listCustAlert2.visible = true;
            listCustAlert2.requestFocus();
            listCustAlert2.selectFirstRow();
        } else if (event.code == KeyCode.VK_ESCAPE) {
            listCustAlert2.visible = false;
        }
    }

    function txtRemMsgSmsOnKeyPressed(event: javafx.scene.input.KeyEvent) {
        mandatory_textboxes(1);
        shortcut(event);
    }

    function btnRemSaveAction(): Void {
        saveCustomerAlert(0);
    }

    function chkRemEmailOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_SPACE) {
            chkRemEmail.selected = true;
            disEnablePanel();
        }
    }

    function chkRemSmsOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_SPACE) {
            chkRemEmail.selected = true;
            disEnablePanel();
        }
    }

    function panelOnKeyPressedAtFScreen(event: javafx.scene.input.KeyEvent): Void {

    }

    function imgDateEmailOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if (not emailDatFlag) {
            DatePickPanel.layoutX = imgDateEmail.layoutX + 5.0;
            DatePickPanel.layoutY = imgDateEmail.layoutY + 20.0;

            if (txtRemEDate.rawText.trim() != null) {
                var dat = txtRemEDate.rawText.trim().split("-");
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1]) - 1;
                var y = Integer.parseInt(dat[2]);
                fxCalendar.set(y, m, d);
            } else {
                var dat = DateUtils.now("dd-MM-yyyy").split("-");
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1]) - 1;
                var y = Integer.parseInt(dat[2]);

                fxCalendar.set(y, m, d);

            }
            fxCalendar.visible = true;
            emailDatFlag = true;
        } else {
            fxCalendar.visible = false;
        }
    }

    function imgDateSmsOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {

        if (not smsDatFlag) {
            DatePickPanel.layoutX = imgDateSms.layoutX + 5.0;
            DatePickPanel.layoutY = imgDateSms.layoutY + 20.0;

            if (txtRemSDate.rawText.trim() != null) {
                var dat = txtRemSDate.rawText.trim().split("-");
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1]) - 1;
                var y = Integer.parseInt(dat[2]);
                fxCalendar.set(y, m, d);
            } else {
                var dat = DateUtils.now("dd-MM-yyyy").split("-");
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1]) - 1;
                var y = Integer.parseInt(dat[2]);

                fxCalendar.set(y, m, d);

            }
            fxCalendar.visible = true;
            smsDatFlag = true;
        } else {
            fxCalendar.visible = false;
        }
    }

    function imageCloseOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        panel.visible = false;
        panelHomePage.visible = true;
        delete  panelHomePage.content;
    }

    function chkRemEmailOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        disEnablePanel();
    }

    function chkRemSmsOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        disEnablePanel();
    }

    public function disEnablePanel(): Void {
        if (chkRemEmail.selected) {
            //Controller Instance
            var getMess = commonController.checkEmailConf();
//            var getMess = AlertsDetails.checkEmailConf();
            if (not getMess.equals("Done")) {
                FXinfo("{getMess}");
                chkRemEmail.selected = false;
            }else{
                panelEmail.disable = false;
                txtRemMsgEmail.requestFocus();
                mandatory_textboxes(1);
            }
        } else {
            panelEmail.disable = true;
        }

        if (chkRemSms.selected) {
            //Controller Instance
            var getMess = commonController.checkSMSConf();
            if (not getMess.equals("Done")) {
                FXinfo("{getMess}");
                chkRemSms.selected = false;
            }else{
                panelSMS.disable = false;
                txtRemMsgSms.requestFocus();
                mandatory_textboxes(2);
            }
        } else {
            panelSMS.disable = true;
        }
    }

    function getCustomer(name: String): Void {
        var layX;
        var layY;
        var layW;
        var custname;

        listH = 0.0;

        if (name.equals("sms")) {
            layX = txtCustAlrtName.layoutX;
            layY = txtCustAlrtName.layoutY + txtCustAlrtName.height;
            layW = txtCustAlrtName.width;
            custname = txtCustAlrtName.rawText.trim();
            if (custname == null)
                custname = "";

            listLX = layX;
            listLY = layY;
            listW = layW;

            listCustAlert1.visible = true;
            //Controller Instance
            listCustAlert1.items = commonController.customerName(custname).toArray() as String[] ;


            listCustAlert1.onKeyPressed = function(e) {
                        if (e.code == KeyCode.VK_ENTER) {
                            selectCust(name);
                        } else if (e.code == KeyCode.VK_ESCAPE) {
                            listCustAlert1.visible = false;
                            txtCustAlrtName.requestFocus();
                        }
                    };

            listCustAlert1.onMouseClicked = function(e) {
                        selectCust(name);
                    }
            var height1: Integer = 0;
            if (listCustAlert1.items.size() < 9) {
                height1 = listCustAlert1.items.size();
            } else {
                height1 = 8;
            }
            for (i in [1..height1]) {
                listH += 26.0;
            }
        } else if (name.equals("email")) {
            layX = C1LX;
            layY = 125.0;
            layW = Type2TextboxW;

            custname = txtCustAlrtEName.rawText.trim();
            if (custname == null)
                custname = "";

            listLX = layX;
            listLY = layY;
            listW = layW;

            listCustAlert2.visible = true;
            //Controller Instance
            listCustAlert2.items = commonController.customerName(custname).toArray() as String[] ;
//
        //     delete listCustAlert2.items[listCustAlert2.items.size() - 1] from listCustAlert2.items;

            listCustAlert2.onKeyPressed = function(e) {
                        if (e.code == KeyCode.VK_ENTER) {
                            selectCust(name);
                        } else if (e.code == KeyCode.VK_ESCAPE) {
                            listCustAlert1.visible = false;
                            txtCustAlrtName.requestFocus();
                        }
                    };

            listCustAlert2.onMouseClicked = function(e) {
                        selectCust(name);
                    }

            var height: Integer = 0;
            if (listCustAlert2.items.size() < 9) {
                height = listCustAlert2.items.size();
            } else {
                height = 8;
            }

            for (i in [1..height]) {
                listH += 25.0;
            }
        }
    }

    function selectCust(name: String) {
        if (name.equals("sms")) {
            if (listCustAlert1.selectedItem != "Please add new Customer in Customer Information Form") {
                var selectItem = "{listCustAlert1.selectedItem}";
                //Controller Instance
                var code = commonController.getCode(selectItem);


                txtCustAlrtName.text = selectItem;
                if (code != null and selectItem != null)
                    txtRemSMob1.text = commonController.getMobileNo(code, selectItem);

                txtRemSDate.requestFocus();
                custCodeSms = code;
            }
            listCustAlert1.visible = false;
            mandatory_textboxes(1);

        } else if (name.equals("email")) {
            if (listCustAlert1.selectedItem != "Please add new Customer in Customer Information Form") {
                var selectItem = "{listCustAlert2.selectedItem}";
                var code = commonController.getCode(selectItem);
//                var code = GetPatientName.getCode(selectItem);
//                if (code != null and selectItem != null)
//                    GetPatientName.getDetails(code, selectItem);

                txtCustAlrtEName.text = selectItem;
                txtRemEDate.requestFocus();
                if (code != null and selectItem != null)
                    txtRemEMail1.text = commonController.getEmailId(code, selectItem);
//                txtRemEMail1.text = GetPatientName.cust_email;
                custCodeEmail = code;
            }
            listCustAlert2.visible = false;
            mandatory_textboxes(2);
        }
    }
function checkDate(tb : TextBox):Boolean{
    var ret = true;
    var date = tb.rawText.trim();
    if(not DateUtils.now("dd-MM-yyyy").equals(date))
    {
        var d = date.split("-");
        var day = DateUtils.now("dd");
        var mon = DateUtils.now("MM");
        var yr = DateUtils.now("yyyy");
        if(d[2]!=null)
        {
            if(d[2]!=yr or Integer.parseInt(d[1])<Integer.parseInt(mon) or Integer.parseInt(d[0])<Integer.parseInt(day))
            {
                ret = false;
                FXinfo("Selected date should not be lesser than Today's Date {day}-{mon}-{yr}.",tb);
            }
        }
    }
    return ret;
}

    function checkSmsAlert(): Integer {

        var retVal: Integer = 0;
        var v = new Validation();
        var cname = txtCustAlrtName.rawText.trim();
        var mob1 = txtRemSMob1.rawText.trim();
        var mob2 = txtRemSMob2.rawText.trim();
        var msg = txtRemMsgSms.rawText.trim();
        var date = txtRemSDate.rawText.trim();

//        var n1 = v.getMobileNoValid(mob1, 10, 10);
        var n1 = v.getMobNoValid(mob1);
//        var n2 = v.getMobileNoValid(mob2, 10, 10);
        var n2 = v.getMobNoValid(mob2);
        //Controller Instance
        var getMess = commonController.checkSMSConf();
        if (not getMess.equals("Done")) {
            FXinfo(getMess);
        }
        else if (cname.trim().length() <= 0) {
            FXinfo("Please enter customer name",txtCustAlrtName);
        } else if (mob1.trim().length() <= 0) {
            FXinfo("Please enter mobile number.",txtRemSMob1);
        }
        else if (n1 == 4) {
            FXinfo(" Please Enter only numeric value in mobile number !",txtRemSMob1);
        }
        else if (n1 ==1 or n1 == 11) {
            FXinfo("Only 10 digits can be entered for mobile number excluding country code.",txtRemSMob1);
        }
        else if (n2 == 4 and mob2.trim().length() > 0) {
            FXinfo("Please enter only numbers.",txtRemSMob2);
        }
        else if ((n2 == 1 or n2==11) and mob2.trim().length() > 0) {
            FXinfo("Only 10 digits can be entered for mobile number excluding country code.",txtRemSMob2);
        }
        else if (msg.trim().length() <= 0) {
            FXinfo("Please enter message !",txtRemMsgSms);
        }
        else if (date.trim().length() <= 0) {
            FXinfo("Please select valid Date",txtRemSDate);
        }
        else if (not checkDate(txtRemSDate)) {
            retVal = 0;
        }//Controller Instance
        else if (commonController.getCode(cname) == null) {
            FXinfo("Customer not found in Customer Master. Please add the new Customer info in Customer Master before setting Alert.",txtCustAlrtName);        }
        else {
            retVal = 1;
        }
        return retVal;
    }
    function checkEmailAlert(): Integer {

        var retVal: Integer = 0;
        var cname = txtCustAlrtEName.rawText.trim();
        var email1 = txtRemEMail1.rawText.trim();
        var email2 = txtRemEMail2.rawText.trim();
        var msg = txtRemMsgEmail.rawText.trim();
        var date = txtRemEDate.rawText.trim();
        var v = new Validation();

        var n1 = v.getEmailIdValid(email1, 5, 50);
        var n2 = v.getEmailIdValid(email2, 5, 50);
        //Controller Instance
        var getMess = commonController.checkEmailConf();

        if (not getMess.equals("Done")) {
            FXinfo("{getMess}");
        }
        else if (cname.trim().length() <= 0) {
            FXinfo("Please enter customer name",txtCustAlrtEName);
        }
        else if (email1.trim().length() <= 0) {
            FXinfo("Please enter Email id",txtRemEMail1);
        }
        else if (n1!=10) {
            FXinfo("Entered Email ID is invalid. Please verify.",txtRemEMail1);
            retVal = 0;
        }
        else if (n1==11) {
            FXinfo("Entered Email ID is invalid. Please verify.",txtRemEMail1);
            retVal = 0;
        }
        else if (n1==1) {
            FXinfo("Entered Email ID is too long. Please verify.",txtRemEMail1);
            retVal = 0;
        }
        else if (email2.trim().length() > 0 and n2!=10) {
            FXinfo("Entered Email ID is invalid. Please verify.",txtRemEMail2);
            retVal = 0;
        }
        else if (email2.trim().length() > 0 and n2==11) {
            FXinfo("Entered Email ID is invalid. Please verify.",txtRemEMail2);
            retVal = 0;
        }
        else if (email2.trim().length() > 0 and n2==1) {
            FXinfo("Entered Email ID is too long. Please verify.",txtRemEMail2);
            retVal = 0;
        }
        else if (msg.trim().length() <= 0) {
            FXinfo("Please enter mobile number.",txtRemMsgEmail);
        } else if (date.trim().length() <= 0) {
            FXinfo("Please select valid Date.",txtRemEDate);
        }
        else if (not checkDate(txtRemEDate)) {
            retVal = 0;
        }
        //Controller Instance
        else if (commonController.getCode(cname) == null) {
            FXinfo("Customer not found in Customer Master. Please add the new Customer info in Customer Master before setting Alert." , txtCustAlrtEName);
        } else {
            retVal = 1;
        }
        return retVal;
    }

    function sendMail(mess: String, id: String[]): Void {

        new SendMail("msd.143mca@gmail.com", "", id, "Customer Drug Purchase Alerts From Pharmacy", mess);
    }

    function sendSMS(mess: String, mobNO: String[]): Boolean{
        var ret = true;
        if (mobNO[0].trim().length() > 0) {
            ret = SendSMSNew.sendSMS(mobNO[0], mess);
        }
        if (mobNO[1].trim().length() > 0) {
            ret = SendSMSNew.sendSMS(mobNO[1], mess);
        }
        return ret;
    }

    public function saveCustomerAlert(val: Integer) {
        var s = 0;
        var s1 = 0;
        isSave = 5;
        
        if (chkRemSms.selected) {
            var ss = checkSmsAlert();
            if (ss == 1) {
                var smsMessage = txtRemMsgSms.rawText.trim();
                var sentCode = 0;
                var opt = true;
                if (val == 1) {                    
                    if (DateUtils.now("dd-MM-yyyy").equals(txtRemSDate.rawText.trim())) {
                        sentCode = 1;
                        opt = sendSMS(smsMessage, [txtRemSMob1.rawText.trim(), txtRemSMob2.rawText.trim()]);
                        Thread.sleep(1000);
                    } else {
                        opt = Alert.confirm("Customer Alerts", "Sms can't send right now check date?\n do u continue to send later?");
                    }
                }
                var mess = bind SendSMSNew.msg;
                var chck = bind SendSMSNew.isSent;
                var chck1 = bind SendSMSNew.rand on replace{
                    if(chck){
                        FXAlert("SMS Alerts For Customer \"{txtCustAlrtName.rawText.trim()}\"", 41, mess);
                    }else{
                        FXAlert("SMS Alerts For Customer \"{txtCustAlrtName.rawText.trim()}\"", 42, mess);
                    }
                }
                if (opt) {
                    var customerAlertModel : CustomerAlertModel =new CustomerAlertModel () ;

                    customerAlertModel.setAlertNo (Integer.parseInt(getAutoVal)) ;
                    customerAlertModel.setDate (Date.valueOf(DateUtils.now("yyyy-MM-dd")) ) ;
                    customerAlertModel.setAlertType ("SMS") ;
                    customerAlertModel.setCustomerName(txtCustAlrtName.rawText.trim());
                    customerAlertModel.setCustomerCode (custCodeSms) ;
                    customerAlertModel.setSmsAlertDate(Date.valueOf( DateUtils.changeFormatDate(txtRemSDate.rawText.trim())) ) ;
                    customerAlertModel.setMobileNo1(txtRemSMob1.rawText.trim());
                    customerAlertModel.setMobileNo2(txtRemSMob2.rawText.trim());
                    customerAlertModel.setSmsMessage(smsMessage);
                    customerAlertModel.setSentCode(sentCode);
                    //Controller Instance
                    if(customerAlertController.createRecord(customerAlertModel) == true ) {

                    }
                    else {

                    }
                    

                    

                    if (val != 1) {
                        FXalert(0);
                    }
                    isSave = 1;
                }else{
                    s = 1;
                }
            } else {
                s = 1;
            }
        }
        if (chkRemEmail.selected) {
            var ss = checkEmailAlert();
            if (ss == 1) {
                var emailMessage = txtRemMsgEmail.rawText.trim();
                var sentCode = 0;
                var opt = true;
                if (val == 1) {
                    if (DateUtils.now("dd-MM-yyyy").equals(txtRemEDate.rawText.trim())) {
                        sentCode = 1;
                        SendEmail.sendEMail([txtRemEMail1.rawText.trim() , txtRemEMail1.rawText.trim()], emailMessage);
                        Thread.sleep(1000);

                    } else {
                        opt = Alert.confirm("Customer Alerts", "Email cannot be send right now. Please check date?\n Do you want the alert to be sent later?");
                    }
                }
                var mess = bind SendEmail.msg1;
                var chck = bind SendEmail.isSentMail on replace{
                    FXinfo("Email Alerts For Customer \"{txtCustAlrtEName.rawText.trim()}\"", mess);
                }
                var chck1 = bind SendEmail.rand1 on replace{
                    FXinfo("Email Alerts For Customer \"{txtCustAlrtEName.rawText.trim()}\"", mess);
                }
                if (opt) {
                    var customerAlertModel : CustomerAlertModel =new CustomerAlertModel () ;

                    customerAlertModel.setAlertNo (Integer.parseInt(getAutoVal) ) ;
                    customerAlertModel.setDate (Date.valueOf(DateUtils.now("yyyy-MM-dd"))) ;
                    customerAlertModel.setAlertType ("EMail") ;
                    customerAlertModel.setCustomerName(txtCustAlrtName.rawText.trim());
                    customerAlertModel.setCustomerCode (custCodeEmail) ;
                    customerAlertModel.setEmailAlertDate ( Date.valueOf(DateUtils.changeFormatDate(txtRemSDate.rawText.trim()) ) ) ;
                    customerAlertModel.setEmailId1(txtRemSMob1.rawText.trim());
                    customerAlertModel.setEmailId2(txtRemSMob2.rawText.trim());
                    customerAlertModel.setEmailMessage(emailMessage);
                    customerAlertModel.setSentCode(sentCode);
                    //Controller Instance
                    if(customerAlertController.createRecord(customerAlertModel) == true ) {

                    }
                    else {

                    }
              
                  
                    isSave = 2;
                }else {
                    s1 = 1;
                }
            } else {
                s1 = 1;
            }
        }
        if (not chkRemSms.selected and not chkRemEmail.selected) {
            FXinfo("Select any one alert!");
        }
        if (s != 1) {
            resetAlertSms();
        }
        if (s1 != 1) {
            resetAlertEmail();
        }
        isSave = 0;
    }

    public function resetAlertSms(): Void {

        txtCustAlrtName.text = "";
        txtRemSDate.text = DateUtils.now("dd-MM-yyyy");
        txtRemSMob1.text = "";
        txtRemSMob2.text = "";
        txtRemMsgSms.text = "";
        chkRemSms.selected = false;
        isSave = -1;
        disEnablePanel();

    }

    public function resetAlertEmail(): Void {

        txtCustAlrtEName.text = "";
        txtRemEDate.text = DateUtils.now("dd-MM-yyyy");
        txtRemEMail1.text = "";
        txtRemEMail2.text = "";
        txtRemMsgEmail.text = "";

        chkRemEmail.selected = false;
        isSave = 0;
        disEnablePanel();

    }

    var visit = bind fxCalendar.visible on replace {
        if (not fxCalendar.visible and smsDatFlag) {
            txtRemSDate.text = fxCalendar.getSelectedDate();
            smsDatFlag = false;
            emailDatFlag = false;
        }
        if (not fxCalendar.visible and emailDatFlag) {
            txtRemEDate.text = fxCalendar.getSelectedDate();
            smsDatFlag = false;
            emailDatFlag = false;
        }
    }

    public function getPrivileges(u : String): Void {
        var uname = u;

        var utype = commonController.getUserType(uname);
        if(utype.equals("User"))
        {

            var priv = commonController.getPrivileges("crm", uname);
            var ss = priv.split(",");
            var val = Integer.parseInt(ss[0]);
            if(val == 1)
            {
				btnRemSave.disable=true;
				btnRemSend.disable=true;   
            }
            else if(val == 2)
            {				
				btnRemSave.disable=false;
				btnRemSend.disable=false;			
                //This code for  READ and WRITE Access
            }
            else if(val == 3)
            {
				btnRemSave.disable=false;
				btnRemSend.disable=false;
                //This code for FULL Access
            }
        }else {
				btnRemSave.disable=false;
				btnRemSend.disable=false;		
		}
    }
    var logUser: String =  bind CommonDeclare.user on replace {
        getPrivileges(logUser);
    }

    public function startUp(): Void {
        currentState.actual=currentState.findIndex("Shown");
        disEnablePanel();
        mandatory_textboxes(3);
        imgDateSms.image = Image { url: "{__DIR__}images/Calender.png" };
        imgDateEmail.image = Image { url: "{__DIR__}images/Calender.png" };
        imageClose.image = Image { url: "{__DIR__}images/FrmClose.png" };

        txtRemEDate.text = DateUtils.now("dd-MM-yyyy");
        txtRemSDate.text = DateUtils.now("dd-MM-yyyy");

        fxCalendar.visible = false;
        DatePickPanel.content = [fxCalendar,];
        chkRemSms.requestFocus();
    }

}
