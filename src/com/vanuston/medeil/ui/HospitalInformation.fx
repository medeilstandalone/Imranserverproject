package com.vanuston.medeil.ui;

import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.Validation;
import com.vanuston.medeil.util.CommonDeclare;
import javafx.scene.control.TextBox;
import com.vanuston.medeil.util.KeyRegistry;
import com.vanuston.medeil.model.HospitalModel;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.implementation.Hospital;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.uitables.ConfirmDialogBox;
import java.lang.Exception;
import javafx.scene.input.KeyCode;

var user = bind CommonDeclare.user;
var log: Logger = Logger.getLogger(HospitalInformation.class, "Masters");

public class HospitalInformation {

    var hospitalController: Hospital; //= RegistryFactory.getClientStub(RegistryConstants.Hospital) as Hospital;
    var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    var style = {
                "-fx-border-width:2;"
                "-fx-border-color:#666666;"
                "-fx-background-color: white ;"
            }
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        onMouseClicked: rectangleOnMouseClicked
        width: bind panelW
        height: bind panelH
    }
    
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "rectFormHeader"
        width: bind panelW
    }
    
    def __layoutInfo_separator: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
        height: 0.0
    }
    public-read def separator: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: 30.0
        layoutY: 85.0
        layoutInfo: __layoutInfo_separator
    }
    
    def __layoutInfo_txtHSPHName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtHSPHName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX
        layoutInfo: __layoutInfo_txtHSPHName
    }
    
    def __layoutInfo_txtHSPEst: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtHSPEst: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C4LX
        layoutY: 94.0
        layoutInfo: __layoutInfo_txtHSPEst
    }
    
    def __layoutInfo_separator2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
        height: 3.0
    }
    public-read def separator2: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: 30.0
        layoutY: 190.0
        layoutInfo: __layoutInfo_separator2
    }
    
    def __layoutInfo_txtHSPFax: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtHSPFax: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 228.0
        layoutInfo: __layoutInfo_txtHSPFax
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_separator3: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
    }
    public-read def separator3: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: 30.0
        layoutY: 393.0
        layoutInfo: __layoutInfo_separator3
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imgEdit: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imgReset: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imgCancel: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_listCustCountry: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listCustCountry: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C2LX
        layoutY: 420.0
        layoutInfo: __layoutInfo_listCustCountry
        items: null
    }
    
    def __layoutInfo_listCountry: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listCountry: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C2LX
        layoutY: 319.0
        layoutInfo: __layoutInfo_listCountry
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    def __layoutInfo_listCustState: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listCustState: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C2LX
        layoutY: 448.0
        layoutInfo: __layoutInfo_listCustState
        items: null
    }
    
    def __layoutInfo_listHospitalName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listHospitalName: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C2LX
        layoutY: 145.0
        layoutInfo: __layoutInfo_listHospitalName
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    def __layoutInfo_listState: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listState: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C2LX
        layoutY: 336.0
        layoutInfo: __layoutInfo_listState
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    def __layoutInfo_txtHSPHCode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtHSPHCode: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 511.0
        layoutY: 159.0
        layoutInfo: __layoutInfo_txtHSPHCode
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
    }
    
    public-read def Violet: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.011764706
        green: 0.5019608
        blue: 0.7607843
    }
    
    public-read def linearGradient: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#ffffff") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#f5f0e9") }, ]
    }
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
    }
    
    def __layoutInfo_txtHSPSpl: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtHSPSpl: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 456.0
        layoutInfo: __layoutInfo_txtHSPSpl
        font: Arial_12
    }
    
    def __layoutInfo_txtHSPCpMail: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtHSPCpMail: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 431.0
        layoutInfo: __layoutInfo_txtHSPCpMail
        font: Arial_12
    }
    
    def __layoutInfo_txtHSPCpMob: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtHSPCpMob: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 408.0
        layoutInfo: __layoutInfo_txtHSPCpMob
        font: Arial_12
    }
    
    def __layoutInfo_txtHSPCpDest: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtHSPCpDest: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 456.0
        layoutInfo: __layoutInfo_txtHSPCpDest
        font: Arial_12
    }
    
    def __layoutInfo_txtHSPCperson: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtHSPCperson: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 431.0
        layoutInfo: __layoutInfo_txtHSPCperson
        font: Arial_12
    }
    
    def __layoutInfo_txtHSPOName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtHSPOName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 408.0
        layoutInfo: __layoutInfo_txtHSPOName
        font: Arial_12
    }
    
    def __layoutInfo_txtAmbulanceNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtAmbulanceNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 320.0
        layoutInfo: __layoutInfo_txtAmbulanceNo
        font: Arial_12
    }
    
    def __layoutInfo_txtHelpLine: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtHelpLine: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 297.0
        layoutInfo: __layoutInfo_txtHelpLine
        font: Arial_12
    }
    
    def __layoutInfo_txtHSPWeb: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtHSPWeb: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 274.0
        layoutInfo: __layoutInfo_txtHSPWeb
        font: Arial_12
    }
    
    def __layoutInfo_txtHSPMail: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtHSPMail: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 251.0
        layoutInfo: __layoutInfo_txtHSPMail
        font: Arial_12
    }
    
    def __layoutInfo_txtContactNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtContactNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 205.0
        layoutInfo: __layoutInfo_txtContactNo
        font: Arial_12
    }
    
    def __layoutInfo_txtPinCode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 117.0
    }
    public-read def txtPinCode: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 343.0
        layoutInfo: __layoutInfo_txtPinCode
        font: Arial_12
    }
    
    def __layoutInfo_txtHSPState: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtHSPState: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 320.0
        layoutInfo: __layoutInfo_txtHSPState
        onKeyPressed: txtHSPStateOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtHSPCountry: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtHSPCountry: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: true
        layoutX: bind C2LX
        layoutY: 297.0
        layoutInfo: __layoutInfo_txtHSPCountry
        onKeyPressed: txtHSPCountryOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtHSPCity: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtHSPCity: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        managed: true
        layoutX: bind C2LX
        layoutY: 274.0
        layoutInfo: __layoutInfo_txtHSPCity
        font: Arial_12
    }
    
    def __layoutInfo_txtHSPAdd3: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtHSPAdd3: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 251.0
        layoutInfo: __layoutInfo_txtHSPAdd3
        font: Arial_12
    }
    
    def __layoutInfo_txtHSPAdd2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtHSPAdd2: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 228.0
        layoutInfo: __layoutInfo_txtHSPAdd2
        font: Arial_12
    }
    
    def __layoutInfo_txtHSPAdd1: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtHSPAdd1: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 205.0
        layoutInfo: __layoutInfo_txtHSPAdd1
        font: Arial_12
    }
    
    def __layoutInfo_txtHSPHq: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtHSPHq: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 123.0
        layoutInfo: __layoutInfo_txtHSPHq
        font: Arial_12
    }
    
    def __layoutInfo_txtHSPGroup: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtHSPGroup: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 146.0
        layoutInfo: __layoutInfo_txtHSPGroup
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
    
    def __layoutInfo_btnHSPCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind CancelW
        height: 30.0
    }
    public-read def btnHSPCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton4LX
        layoutY: 520.0
        layoutInfo: __layoutInfo_btnHSPCancel
        effect: reflectionEffect
        graphic: imgCancel
        text: "Cancel [Esc]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnHSPReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: 30.0
    }
    public-read def btnHSPReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton3LX
        layoutY: 520.0
        layoutInfo: __layoutInfo_btnHSPReset
        effect: reflectionEffect
        graphic: imgReset
        text: "Reset [F5]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnHSPEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: 30.0
    }
    public-read def btnHSPEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton2LX
        layoutY: 520.0
        layoutInfo: __layoutInfo_btnHSPEdit
        effect: reflectionEffect
        graphic: imgEdit
        text: "Edit  [F4]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnHSPSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: 30.0
    }
    public-read def btnHSPSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX
        layoutY: 520.0
        layoutInfo: __layoutInfo_btnHSPSave
        translateX: 0.0
        effect: reflectionEffect
        graphic: imageView
        text: "Save  [F2]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    public-read def panelButtons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutY: bind panelButtonsLY
        content: [ btnHSPSave, btnHSPEdit, btnHSPReset, btnHSPCancel, ]
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
    
    public-read def label24: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 456.0
        text: "Specialty"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label23: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 431.0
        text: "Mail Id"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label22: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 408.0
        text: "Mobile No"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label21: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 456.0
        text: "Designation"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label20: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 431.0
        text: "Contact Person"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label19: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 408.0
        text: "MD/Owner Name"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def panelPerson: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: bind panelPersonLY
        content: [ label4, separator3, label19, label20, label21, txtHSPOName, txtHSPCperson, txtHSPCpDest, label22, label23, label24, txtHSPCpMob, txtHSPCpMail, txtHSPSpl, ]
    }
    
    public-read def label18: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 320.0
        text: "Ambulance No"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label17: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 297.0
        text: "Help Line"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 274.0
        text: "Website"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label13: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 251.0
        text: "Mail ID"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelFax: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 228.0
        text: "Fax"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelPhone_No: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 205.0
        text: "Phone No "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelPincode: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 343.0
        text: "Pincode "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelState: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 320.0
        text: "State "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelCountry: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 297.0
        text: "Country "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelCity: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 274.0
        text: "City *"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelAddress: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 205.0
        text: "Address *"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 123.0
        text: "Head Quarters"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label8: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 146.0
        text: "Group"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 100.0
        text: "Established in"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 123.0
        styleClass: "label"
        text: "Hospital Name *"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.4
    }
    
    public-read def label16: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 30.0
        layoutY: 165.0
        text: "Contact Details"
        font: Arial_18
        textFill: Green
    }
    
    public-read def label15: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 30.0
        layoutY: 60.0
        text: "General Details"
        font: Arial_18
        textFill: Green
    }
    
    public-read def dropShadowEffect: javafx.scene.effect.DropShadow = javafx.scene.effect.DropShadow {
    }
    
    public-read def lightingEffect: javafx.scene.effect.Lighting = javafx.scene.effect.Lighting {
    }
    
    def __layoutInfo_LblHeader: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
    }
    public-read def LblHeader: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 530.0
        layoutY: 19.0
        layoutInfo: __layoutInfo_LblHeader
        effect: lightingEffect
        text: "Hospital Details - alt+H"
        font: Arial_25
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
    }
    
    public-read def linearGradientHeader: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
    }
    
    public-read def Arial_Bold_25: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 25.0
    }
    
    public-read def imageSave: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Save1.png"
    }
    
    public-read def imageReset: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Reset.png"
    }
    
    public-read def imageEdit: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Edit.png"
    }
    
    public-read def imageCancel: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Cancel.png"
    }
    
    public-read def imageBack: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/arrow_Left.png"
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imageView2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind C2LX+Type1TextboxW
        layoutY: 41.0
        image: image
    }
    
    public-read def panelGeneral: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: bind panelGeneralLY
        content: [ label15, separator, label2, txtHSPHName, label9, txtHSPEst, label8, txtHSPGroup, label3, txtHSPHq, imageView2, ]
    }
    
    public-read def image2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imageView3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C2LX+Type2TextboxW
        layoutY: 115.0
        image: image2
    }
    
    public-read def image3: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imageView4: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C2LX+Type1TextboxW
        layoutY: 115.0
        image: image3
    }
    
    public-read def panelContact: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: bind panelContactLY
        content: [ label16, separator2, labelAddress, labelCity, labelCountry, labelState, labelPincode, txtHSPAdd1, txtHSPAdd2, txtHSPAdd3, txtHSPCity, txtHSPCountry, txtHSPState, txtPinCode, labelPhone_No, labelFax, label13, label7, label17, label18, txtContactNo, txtHSPMail, txtHSPFax, txtHSPWeb, txtHelpLine, txtAmbulanceNo, imageView3, imageView4, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: 0.0
        layoutY: 0.0
        content: [ rectangle, rectHeader, LblHeader, panelGeneral, panelContact, panelPerson, panelButtons, listCustCountry, listCountry, listCustState, listHospitalName, listState, txtHSPHCode, panelAlert, ]
    }
    
    public-read def scene: javafx.scene.Scene = javafx.scene.Scene {
        content: getDesignRootNodes ()
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "Shown", ]
        actual: 0
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectangle.visible = true;
                            rectangle.styleClass = "form-background";
                            rectangle.onMouseClicked = rectangleOnMouseClicked;
                            rectangle.blocksMouse = true;
                            rectHeader.visible = true;
                            rectHeader.opacity = 0.25;
                            rectHeader.fill = linearGradientHeader;
                            rectHeader.height = 32.0;
                            rectHeader.arcWidth = 5.0;
                            rectHeader.arcHeight = 5.0;
                            LblHeader.visible = true;
                            LblHeader.layoutX = 0.0;
                            LblHeader.layoutY = 2.0;
                            LblHeader.styleClass = "labelFormHeading";
                            LblHeader.effect = null;
                            LblHeader.text = "Hospital Details - alt+H";
                            LblHeader.font = Arial_25;
                            LblHeader.textAlignment = javafx.scene.text.TextAlignment.RIGHT;
                            LblHeader.hpos = javafx.geometry.HPos.CENTER;
                            LblHeader.textFill = DarkGray;
                            label15.managed = true;
                            label15.effect = null;
                            label15.textWrap = false;
                            label15.textFill = Green;
                            __layoutInfo_separator.height = 5.0;
                            label2.layoutY = 100.0;
                            label2.text = "Hospital Name ";
                            txtHSPHName.visible = true;
                            txtHSPHName.layoutY = 100.0;
                            txtHSPHName.onKeyPressed = txtHSPHNameOnKeyPressedAtHidden;
                            txtHSPHName.onKeyReleased = txtHSPHNameOnKeyReleasedAtHidden;
                            txtHSPHName.font = Arial_12;
                            txtHSPEst.visible = true;
                            txtHSPEst.layoutY = 100.0;
                            txtHSPEst.onKeyPressed = txtHSPEstOnKeyPressedAtHidden;
                            txtHSPEst.promptText = "year";
                            txtHSPEst.font = Arial_12;
                            label8.layoutY = 129.0;
                            txtHSPGroup.layoutY = 129.0;
                            txtHSPGroup.styleClass = "text-box";
                            txtHSPGroup.onKeyPressed = txtHSPGroupOnKeyPressedAtHidden;
                            label3.layoutY = 135.0;
                            label3.text = "Headquarters";
                            txtHSPHq.layoutY = 129.0;
                            txtHSPHq.onKeyPressed = txtHSPHqOnKeyPressedAtHidden;
                            imageView2.layoutY = 100.0;
                            imageView2.onMouseClicked = imageView2OnMouseClickedAtShown;
                            imageView2.blocksMouse = true;
                            panelGeneral.visible = true;
                            label16.layoutY = 0.0;
                            separator2.layoutY = 25.0;
                            labelAddress.layoutY = 40.0;
                            labelAddress.text = "Address ";
                            labelCity.layoutY = 109.0;
                            labelCity.text = "City ";
                            labelCountry.layoutY = 132.0;
                            labelState.layoutY = 155.0;
                            labelState.text = "State";
                            labelPincode.layoutY = 178.0;
                            txtHSPAdd1.layoutY = 40.0;
                            txtHSPAdd1.onKeyPressed = txtHSPAdd1OnKeyPressedAtHidden;
                            txtHSPAdd2.layoutY = 63.0;
                            txtHSPAdd2.onKeyPressed = txtHSPAdd2OnKeyPressedAtHidden;
                            txtHSPAdd3.layoutY = 86.0;
                            txtHSPAdd3.onKeyPressed = txtHSPAdd3OnKeyPressedAtHidden;
                            txtHSPCity.layoutY = 109.0;
                            txtHSPCity.styleClass = "text-box";
                            txtHSPCity.onKeyPressed = txtHSPCityOnKeyPressedAtHidden;
                            txtHSPCountry.layoutY = 132.0;
                            txtHSPCountry.onKeyReleased = txtHSPCountryOnKeyReleasedAtHidden;
                            txtHSPState.layoutY = 155.0;
                            txtHSPState.onKeyReleased = txtHSPStateOnKeyReleasedAtHidden;
                            txtPinCode.layoutY = 178.0;
                            __layoutInfo_txtPinCode.width = 95.0;
                            txtPinCode.onKeyPressed = txtPinCodeOnKeyPressedAtHidden;
                            txtPinCode.text = "";
                            labelPhone_No.layoutY = 40.0;
                            labelPhone_No.text = "Phone No.";
                            labelFax.layoutY = 63.0;
                            labelFax.text = "Fax No.";
                            label13.layoutY = 86.0;
                            label13.text = "Email ID";
                            label7.layoutY = 109.0;
                            label17.layoutY = 132.0;
                            label17.text = "Helpline";
                            label18.layoutY = 155.0;
                            label18.text = "Ambulance Contact No.";
                            txtContactNo.layoutY = 40.0;
                            txtContactNo.onKeyPressed = txtContactNoOnKeyPressedAtHidden;
                            txtContactNo.promptText = "Area Code - Phone Number";
                            txtHSPMail.layoutY = 86.0;
                            txtHSPMail.onKeyPressed = txtHSPMailOnKeyPressedAtHidden;
                            txtHSPMail.promptText = "xyz@domain.com";
                            txtHSPFax.layoutY = 63.0;
                            txtHSPFax.onKeyPressed = txtHSPFaxOnKeyPressedAtHidden;
                            txtHSPFax.font = Arial_12;
                            txtHSPWeb.layoutY = 109.0;
                            txtHSPWeb.onKeyPressed = txtHSPWebOnKeyPressedAtHidden;
                            txtHelpLine.layoutY = 132.0;
                            txtHelpLine.onKeyPressed = txtHelpLineOnKeyPressedAtHidden;
                            txtAmbulanceNo.layoutY = 155.0;
                            txtAmbulanceNo.onKeyPressed = txtAmbulanceNoOnKeyPressedAtHidden;
                            txtAmbulanceNo.promptText = "Contact Phone Number";
                            imageView3.visible = true;
                            imageView3.layoutY = 132.0;
                            imageView3.onMouseClicked = imageView3OnMouseClickedAtShown;
                            imageView3.blocksMouse = true;
                            imageView4.visible = true;
                            imageView4.layoutY = 155.0;
                            imageView4.onMouseClicked = imageView4OnMouseClickedAtShown;
                            imageView4.blocksMouse = true;
                            panelContact.visible = true;
                            label4.visible = true;
                            label4.layoutX = 30.0;
                            label4.layoutY = 0.0;
                            label4.text = "Contact Person Details";
                            label4.font = Arial_18;
                            label4.textFill = Green;
                            separator3.layoutY = 25.0;
                            label19.layoutY = 40.0;
                            label20.layoutY = 63.0;
                            label21.layoutY = 88.0;
                            txtHSPOName.layoutY = 40.0;
                            txtHSPOName.onKeyPressed = txtHSPONameOnKeyPressedAtHidden;
                            txtHSPCperson.layoutY = 63.0;
                            txtHSPCperson.onKeyPressed = txtHSPCpersonOnKeyPressedAtHidden;
                            txtHSPCperson.promptText = "Contact Person name...";
                            txtHSPCpDest.layoutY = 88.0;
                            txtHSPCpDest.onKeyPressed = txtHSPCpDestOnKeyPressedAtHidden;
                            label22.layoutY = 40.0;
                            label22.text = "Mobile No.";
                            label23.layoutY = 63.0;
                            label24.layoutY = 88.0;
                            txtHSPCpMob.layoutY = 40.0;
                            txtHSPCpMob.onKeyPressed = txtHSPCpMobOnKeyPressedAtHidden;
                            txtHSPCpMail.layoutY = 63.0;
                            txtHSPCpMail.onKeyPressed = txtHSPCpMailOnKeyPressedAtHidden;
                            txtHSPSpl.layoutY = 88.0;
                            txtHSPSpl.onKeyPressed = txtHSPSplOnKeyPressedAtHidden;
                            panelPerson.visible = true;
                            imageView.visible = true;
                            imageView.opacity = 1.0;
                            imageView.layoutX = 0.0;
                            imageView.layoutY = 0.0;
                            imageView.image = imageSave;
                            imageView.y = 0.0;
                            btnHSPSave.layoutY = 0.0;
                            __layoutInfo_btnHSPSave.height = 40.0;
                            btnHSPSave.onKeyPressed = btnHSPSaveOnKeyPressedAtHidden;
                            btnHSPSave.onMouseClicked = btnHSPSaveOnMouseClickedAtHidden;
                            btnHSPSave.text = "Save [F3]";
                            btnHSPSave.font = Arial_Bold_14;
                            btnHSPSave.graphicHPos = javafx.geometry.HPos.LEFT;
                            btnHSPSave.graphicVPos = javafx.geometry.VPos.CENTER;
                            btnHSPSave.graphicTextGap = 4.0;
                            imgEdit.visible = true;
                            imgEdit.image = imageEdit;
                            btnHSPEdit.layoutY = 0.0;
                            __layoutInfo_btnHSPEdit.height = 40.0;
                            btnHSPEdit.onKeyPressed = btnHSPEditOnKeyPressedAtHidden;
                            btnHSPEdit.onMouseClicked = btnHSPEditOnMouseClickedAtHidden;
                            btnHSPEdit.text = "Edit [F6]";
                            btnHSPEdit.font = Arial_Bold_14;
                            imgReset.visible = true;
                            imgReset.image = imageReset;
                            btnHSPReset.layoutY = 0.0;
                            __layoutInfo_btnHSPReset.height = 40.0;
                            btnHSPReset.onKeyPressed = btnHSPResetOnKeyPressedAtShown;
                            btnHSPReset.onMouseClicked = btnHSPResetOnMouseClickedAtShown;
                            btnHSPReset.text = "Reset [F4]";
                            btnHSPReset.font = Arial_Bold_14;
                            imgCancel.visible = true;
                            imgCancel.image = imageCancel;
                            btnHSPCancel.layoutY = 0.0;
                            __layoutInfo_btnHSPCancel.height = 40.0;
                            btnHSPCancel.onKeyPressed = btnHSPCancelOnKeyPressedAtShown;
                            btnHSPCancel.onMouseClicked = btnHSPCancelOnMouseClickedAtShown;
                            btnHSPCancel.effect = reflectionEffect;
                            btnHSPCancel.text = "Cancel [F8]";
                            panelButtons.visible = true;
                            listCountry.visible = false;
                            listCountry.layoutY = 325.0;
                            listCountry.onKeyPressed = listCountryOnKeyPressedAtHidden;
                            listHospitalName.visible = false;
                            listHospitalName.layoutY = 122.0;
                            listHospitalName.onKeyPressed = listHospitalNameOnKeyPressedAtHidden;
                            listState.visible = false;
                            listState.layoutY = 343.0;
                            txtHSPHCode.visible = false;
                            __layoutInfo_txtHSPHCode.width = 134.0;
                            panelAlert.visible = true;
                            panel.visible = true;
                            panel.opacity = 1.0;
                            panel.blocksMouse = false;
                            reflectionEffect.input = null;
                            reflectionEffect.topOpacity = 0.54;
                            reflectionEffect.bottomOpacity = 0.0;
                            reflectionEffect.fraction = 0.6;
                        }
                    }
                ]
            }
        ]
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel, ]
    }
    // </editor-fold>//GEN-END:main

    function rectangleOnMouseClicked(event: javafx.scene.input.KeyEvent): Void {
        listCountry.visible = false;
        listCustCountry.visible = false;
        listCustState.visible = false;
        listHospitalName.visible = false;
        listState.visible = false;
    }

    function txtHSPStateOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        txtHSPState.style = mandatory;
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            if (commonController.selectState(txtHSPCountry.text, txtHSPState.text)) {
                listState.visible = false;
                txtPinCode.requestFocus();
            } else {
                txtHSPState.text = "";
                listState.visible = false;
                txtPinCode.requestFocus();
            }
        }
        shortcut(event);
    }

    var escPress = false;

    function txtHSPCountryOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        txtHSPCountry.style = mandatory;
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            if (commonController.selectCountry(txtHSPCountry.text)) {
                listCountry.visible = false;
                txtHSPState.requestFocus();
            } else {
                listCountry.visible = false;
                txtHSPCountry.text = "";
                txtPinCode.requestFocus();
            }
        }
        shortcut(event);
    }

    function imageView4OnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        HideList();
        if (txtHSPCountry.text.length() > 0) {
            getState(0);
        } else {
            txtHSPCountry.requestFocus();
        }

    }

    function imageView3OnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        HideList();
        if(not listCountry.visible){
        getCountry(0);
        }
       else
       {
           listCountry.visible= false;
           txtHSPCountry.requestFocus();
        }
    }

    function imageView2OnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        HideList();
        if(not listHospitalName.visible){
            getHospital(0);
        }
       else{
           listHospitalName.visible =false;
           txtHSPHName.requestFocus();
       }
    }

    var mandatory = CommonDeclare.textbox_mandatory();
    var error = CommonDeclare.textbox_error();

    function HideList() {
        listCountry.visible = false;
        listCustCountry.visible = false;
        listCustState.visible = false;
        listHospitalName.visible = false;
        listState.visible = false;
    }

    function rectangleOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        HideList();
    }

    var panelW = bind CommonDeclare.panelFormW;
    var panelH = bind CommonDeclare.panelFormH;
    var panelGeneralLY = 0;
    var panelContactLY = bind (30.275 * panelH / 100);
    var panelPersonLY = bind (67.5229 * panelH / 100);
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var C1LX = bind CommonDeclare.Column1LX;
    var C2LX = bind CommonDeclare.Column2LX;
    var C3LX = bind CommonDeclare.Column3LX;
    var C4LX = bind CommonDeclare.Column4LX;
    var botton1LX = bind CommonDeclare.botton1LX;
    var botton2LX = bind CommonDeclare.botton2LX;
    var botton3LX = bind CommonDeclare.botton3LX;
    var botton4LX = bind CommonDeclare.botton4LX;
    var bottonW = bind CommonDeclare.bottonW;
    var CancelW = bottonW + 10;
    var bottonH = bind CommonDeclare.bottonH;
    var seperatorW = bind CommonDeclare.seperatorW;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;
    var Type3TextboxW = bind CommonDeclare.Type4TextboxW;
    var listW = Type3TextboxW;
    var listH = 0.0;
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    def CustomAlert = CustomAlert {};

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Hospital Information", type);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Hospital Information", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = error;
    }

    def kr = KeyRegistry {};
    var ss = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 4 and CommonDeclare.form[3] == 2) {
            shortcut(ss);
        }
    }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {
        if (event.controlDown or event.altDown or event.shiftDown) {
            kr.actionKey = event.code;
        }
        if (event.code == kr.save and btnHSPSave.text == "Save [F3]" and not btnHSPSave.disable) {
            SaveClick();
        } else if (event.code == kr.edit and btnHSPEdit.text == "Edit [F6]" and not btnHSPEdit.disable) {
            editclick();
        } else if (event.code == kr.reset and btnHSPReset.text == "Reset [F4]") {
            clearHospital();
        } else if (event.code == kr.update and btnHSPSave.text == "Update [F7]" and not btnHSPSave.disable) {
            SaveClick();
        } else if (event.code == kr.del) {
            if (btnHSPEdit.text == "Delete [F5]" and not btnHSPEdit.disable) { deleteClick();
            }
        }
        if (event.controlDown and event.code == KeyCode.VK_LEFT) {
            if (btnHSPCancel.text == "Back [Ctrl+Left]") { viewClick();
            }
        }
        if (event.code == kr.cancel) {
            if (btnHSPCancel.text == "Cancel [F8]") { panel.visible = false; CancelForm();
            }
        }
    }

    function btnHSPCancelOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        if (btnHSPCancel.text == "Back [Ctrl+Left]") { viewClick();
        } else { panel.visible = false; CancelForm(); }
    }

    function btnHSPCancelOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_SPACE) {
            if (btnHSPCancel.text == "Back [Ctrl+Left]") {
                viewClick();
            } else {
                panel.visible = false; CancelForm();
            }
        } else if (event.code == KeyCode.VK_TAB) {
            txtHSPHName.requestFocus();
        } else {
            shortcut(event);
        }
    }

    function btnHSPResetOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_SPACE) {
            clearHospital(); } else {
            shortcut(event);
        }
    }

    function btnHSPResetOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {

        clearHospital();
    }

    function btnHSPEditOnMouseClickedAtHidden(event: javafx.scene.input.MouseEvent): Void {
        if (btnHSPEdit.text == "Delete [F5]") {
            deleteClick();
        } else {
            editclick();
        }
    }

    function btnHSPEditOnKeyPressedAtHidden(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_SPACE) {
            if (btnHSPEdit.text == "Delete [F5]") {
                deleteClick();
            } else {
                editclick();
            } } else {
            shortcut(event);
        }
    }

    function btnHSPSaveOnMouseClickedAtHidden(event: javafx.scene.input.MouseEvent): Void {
        SaveClick();
    }

    function btnHSPSaveOnKeyPressedAtHidden(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_SPACE) {
            SaveClick();
        } else {
            shortcut(event);
        }
    }

    function txtHSPSplOnKeyPressedAtHidden(event: javafx.scene.input.KeyEvent): Void {
        txtHSPSpl.style = style;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { btnHSPSave.requestFocus(); }
        shortcut(event);
    }

    function txtHSPCpMailOnKeyPressedAtHidden(event: javafx.scene.input.KeyEvent): Void {
        txtHSPCpMail.style = style;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtHSPSpl.requestFocus(); }
        shortcut(event);
    }

    function txtHSPCpMobOnKeyPressedAtHidden(event: javafx.scene.input.KeyEvent): Void {
        txtHSPCpMob.style = style;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtHSPCpMail.requestFocus(); }
        shortcut(event);
    }

    function txtHSPCpDestOnKeyPressedAtHidden(event: javafx.scene.input.KeyEvent): Void {
        txtHSPCpDest.style = style;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtHSPCpMob.requestFocus(); }
        shortcut(event);
    }

    function txtHSPCpersonOnKeyPressedAtHidden(event: javafx.scene.input.KeyEvent): Void {
        txtHSPCperson.style = style;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtHSPCpDest.requestFocus(); }
        shortcut(event);
    }

    function txtHSPONameOnKeyPressedAtHidden(event: javafx.scene.input.KeyEvent): Void {
        txtHSPOName.style = style;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtHSPCperson.requestFocus(); }
        shortcut(event);
    }

    function txtAmbulanceNoOnKeyPressedAtHidden(event: javafx.scene.input.KeyEvent): Void {
        txtAmbulanceNo.style = style;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtHSPOName.requestFocus(); }
        shortcut(event);
    }

    function txtHelpLineOnKeyPressedAtHidden(event: javafx.scene.input.KeyEvent): Void {
        txtHelpLine.style = style;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtAmbulanceNo.requestFocus(); }
        shortcut(event);
    }

    function txtHSPWebOnKeyPressedAtHidden(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtHelpLine.requestFocus(); }
        shortcut(event);
    }

    function txtHSPMailOnKeyPressedAtHidden(event: javafx.scene.input.KeyEvent): Void {
        txtHSPMail.style = style;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtHSPWeb.requestFocus(); }
        shortcut(event);
    }

    function txtHSPFaxOnKeyPressedAtHidden(event: javafx.scene.input.KeyEvent): Void {
        txtHSPFax.style = style;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtHSPMail.requestFocus(); }
        shortcut(event);
    }

    function txtContactNoOnKeyPressedAtHidden(event: javafx.scene.input.KeyEvent): Void {
        txtContactNo.style = mandatory;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtHSPFax.requestFocus(); }
        shortcut(event);
    }

    function txtPinCodeOnKeyPressedAtHidden(event: javafx.scene.input.KeyEvent): Void {
        txtPinCode.style = mandatory;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtContactNo.requestFocus(); }
        shortcut(event);
    }

    function txtHSPStateOnKeyReleasedAtHidden(event: javafx.scene.input.KeyEvent): Void {
        txtHSPState.style = mandatory;
        getState(1);
        if (event.code == KeyCode.VK_DOWN) {
            listState.requestFocus();
            listState.selectFirstRow();
        }
        if (event.code == KeyCode.VK_ESCAPE) {
            escPress = true;
            listState.visible = false;
            txtHSPState.requestFocus();
        }
        if (event.code == KeyCode.VK_TAB) {
            escPress = true;
        }

    }

    function txtHSPCountryOnKeyReleasedAtHidden(event: javafx.scene.input.KeyEvent): Void {
        getCountry(1);
        if (event.code == KeyCode.VK_DOWN) {
            listCountry.requestFocus();
            listCountry.selectFirstRow();
        }
        if (event.code == KeyCode.VK_ESCAPE) {
            escPress = true;
            listCountry.visible = false;
            txtHSPCountry.requestFocus();
        }
    }

    function txtHSPCityOnKeyPressedAtHidden(event: javafx.scene.input.KeyEvent): Void {

        txtHSPCity.style = mandatory;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtHSPCountry.requestFocus(); }
        shortcut(event);
    }

    function txtHSPAdd3OnKeyPressedAtHidden(event: javafx.scene.input.KeyEvent): Void {
        txtHSPAdd3.style = style;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtHSPCity.requestFocus(); }
        shortcut(event);
    }

    function txtHSPAdd2OnKeyPressedAtHidden(event: javafx.scene.input.KeyEvent): Void {
        txtHSPAdd2.style = style;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtHSPAdd3.requestFocus(); }
        shortcut(event);
    }

    function txtHSPAdd1OnKeyPressedAtHidden(event: javafx.scene.input.KeyEvent): Void {
        txtHSPAdd1.style = mandatory;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtHSPAdd2.requestFocus(); }
        shortcut(event);
    }

    function txtHSPHqOnKeyPressedAtHidden(event: javafx.scene.input.KeyEvent): Void {
        txtHSPHq.style = style;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtHSPAdd1.requestFocus(); }
        shortcut(event);
    }

    function txtHSPEstOnKeyPressedAtHidden(event: javafx.scene.input.KeyEvent): Void {
        txtHSPEst.style = style;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtHSPHq.requestFocus(); }
        shortcut(event);
    }

    function txtHSPGroupOnKeyPressedAtHidden(event: javafx.scene.input.KeyEvent): Void {
        txtHSPGroup.style = style;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtHSPEst.requestFocus(); }
        shortcut(event);
    }

    function txtHSPHNameOnKeyReleasedAtHidden(event: javafx.scene.input.KeyEvent): Void {

        if (btnHSPSave.text == "Update [F7]" and btnHSPEdit.text == "Delete [F5]") {
            getHospital(1);
            if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
                if (txtHSPHName.rawText.trim() == null or txtHSPHName.rawText.trim() == "null") {
                    txtHSPHName.text = "";
                }
            }
            if (event.code == KeyCode.VK_DOWN) {
                listHospitalName.requestFocus();
                listHospitalName.selectFirstRow();
            }
            if (event.code == KeyCode.VK_ESCAPE) {
                listHospitalName.visible = false;
                txtHSPHName.requestFocus();
            }
        }
    }

    function txtHSPHNameOnKeyPressedAtHidden(event: javafx.scene.input.KeyEvent): Void {
        txtHSPHName.style = mandatory;
        if (btnHSPSave.text == "Update [F7]" and btnHSPEdit.text == "Delete [F5]") {
            if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
                if (txtHSPHName.rawText.trim() == null or txtHSPHName.rawText.trim().length() == 0 or txtHSPHName.rawText.trim() == "null") {
                    txtHSPHName.text = " ";
                }
                listHospitalName.visible = false;
            }
        } else {
            if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
                txtHSPGroup.requestFocus();
            }
        }
        shortcut(event);
    }

    function listCountryOnKeyPressedAtHidden(event: javafx.scene.input.KeyEvent): Void {

        if (listHospitalName.focused) {
            if (event.code == KeyCode.VK_DOWN)
                listHospitalName.selectFirstRow();
        }
    }

    function listHospitalNameOnKeyPressedAtHidden(event: javafx.scene.input.KeyEvent): Void {

        if (listHospitalName.focused) {
            if (event.code == KeyCode.VK_DOWN)
                listHospitalName.selectFirstRow();
        }
    }

    function viewClick(): Void {
        CancelW = bottonW + 10;
        imgEdit.image = imageEdit;
        imgCancel.image = imageCancel;
        btnHSPSave.text = "Save [F3]";
        btnHSPEdit.text = "Edit [F6]";
        btnHSPCancel.text = "Cancel [F8]";
        clearHospital();
        var finalCode: String = getHospitalCode();
        txtHSPHName.requestFocus();
        listHospitalName.visible = false;
        txtHSPHCode.text = finalCode;
        imageView2.visible = false;
    }

    function valClick(): Integer {

        var cnt: Integer = 0;
        var val: Validation = null;
        val = new Validation();
        try {

            var txtHSPHName1 = txtHSPHName.rawText.trim();
            var txtHSPGroup1 = txtHSPGroup.rawText.trim();
            var txtHSPEst1 = txtHSPEst.rawText.trim();
            var txtHSPHq1 = txtHSPHq.rawText.trim();
            var txtHSPAdd11 = txtHSPAdd1.rawText.trim();
            var txtHSPAdd21 = txtHSPAdd2.rawText.trim();
            var txtHSPAdd31 = txtHSPAdd3.rawText.trim();
            var txtHSPCity1 = txtHSPCity.rawText.trim();
            var txtHSPCountry1 = txtHSPCountry.rawText.trim();
            var txtHSPState1 = txtHSPState.rawText.trim();
            var txtHSPFax1 = txtHSPFax.rawText.trim();
            var txtHSPMail1 = txtHSPMail.rawText.trim();

            var txtHSPOName1 = txtHSPOName.rawText.trim();
            var txtHSPCperson1 = txtHSPCperson.rawText.trim();
            var txtHSPCpDest1 = txtHSPCpDest.rawText.trim();
            var txtHSPCpMob1 = txtHSPCpMob.rawText.trim();
            var txtHSPCpMail1 = txtHSPCpMail.rawText.trim();
            var txtHSPSpl1 = txtHSPSpl.rawText.trim();
            var txtContactNo1 = txtContactNo.rawText.trim();
            var txtPinCode1 = txtPinCode.rawText.trim();
            var txtAmbulanceNo1 = txtAmbulanceNo.rawText.trim();
            var txtHelpLine1 = txtHelpLine.rawText.trim();

            var si1: Integer = 0; si1 = txtHSPHName1.trim().length();
            var si2: Integer = 0; si2 = val.getAlphaNumericValid(txtHSPGroup1, 2, 30);
            var si3: Integer = 10; si3 = val.getNumberValid(txtHSPEst1, 4, 4);
            var si4: Integer = 0; si4 = val.getAddressValid(txtHSPHq1, 4, 30);
            var si5: Integer = 0; si5 = val.getAddressValid(txtHSPAdd11, 4, 30);
            var si6: Integer = 0; si6 = val.getAddressValid(txtHSPAdd21, 2, 30);
            var si7: Integer = 0; si7 = val.getAddressValid(txtHSPAdd31, 2, 30);
            var si8: Integer = 0; si8 = val.getAddressValid(txtHSPCity1, 2, 30);
            var si9: Integer = 0; si9 = txtHSPCountry1.trim().length();
            var si10: Integer = 0; si10 = txtHSPState1.trim().length();
            var si11: Integer = 10; si11 = val.getPhoneNoValid(txtHSPFax1, 8, 20);
            var si12: Integer = 10; si12 = val.getEmailIdValid(txtHSPMail1, 10, 40);
            var si14: Integer = 0; si14 = val.getCharacterValid(txtHSPOName1, 5, 20);
            var si15: Integer = 0; si15 = val.getCharacterValid(txtHSPCperson1, 2, 35);
            var si16: Integer = 0; si16 = val.getAlphaNumericValid(txtHSPCpDest1, 2, 35);
            var si17: Integer = 10; si17 = val.getMobileNoValid(txtHSPCpMob1, 10, 13);
            var si18: Integer = 0; si18 = val.getEmailIdValid(txtHSPCpMail1, 10, 30);
            var si19: Integer = 0; si19 = val.getAddressValid(txtHSPSpl1, 4, 30);
            var si20: Integer = 10; si20 = val.getPhoneNoValid(txtContactNo1, 8, 20);
            var si21: Integer = 10; si21 = val.getNumberValid(txtPinCode1, 6, 10);
            var si22: Integer = 10; si22 = val.getPhoneNoValid(txtAmbulanceNo1, 2, 20);
            var si23: Integer = 0; si23 = val.getPhoneNoValid(txtHelpLine1, 2, 20);

            if (txtHSPHName1.trim().length() <= 0) {
                FXinfo("Please enter a value for Hospital Name.", txtHSPHName);
            } else if (si1 < 4) {
                FXinfo("Please enter a minimum of 6 characters for Hospital Name.", txtHSPHName);
            } else if (si1 > 35) {
                FXinfo("Hospital Name cannot exceed 35 characters.", txtHSPHName);
            } else if (txtHSPGroup1 != null and txtHSPGroup1.trim().length() > 0 and si2 == 0) {
                FXinfo("Group can contain only alphabets and spaces.", txtHSPGroup);
            } else if (si2 == 1) {
                FXinfo("Group Name cannot exceed 30 characters.", txtHSPGroup);
            } else if (txtHSPEst1.trim().length() > 0 and si3 != 10) {
                FXinfo("Please enter valid value for Established Year e.g.: 1996, 2010.", txtHSPEst);
            } else if (txtHSPHq1 != null and txtHSPHq1.trim().length() > 0 and si4 == 0) {
                FXinfo("Head Quarters can contain only alphabets and numbers.)", txtHSPGroup);
            } else if (si4 == 1) {
                FXinfo("Head Quarters cannot exceed 35 characters.)", txtHSPGroup);
            } else if (txtHSPAdd11.trim().length() <= 0) {
                FXinfo("Please enter hospital address", txtHSPAdd1);
            } else if (si5 == 0) {
                FXinfo("Address1 can contain only alphabets and numbers.", txtHSPAdd1);
            } else if (si5 == 1) {
                FXinfo("Address1 cannot exceed 30 characters.", txtHSPAdd1);
            } else if (si6 == 1) {
                FXinfo("Address2 cannot exceed 30 characters.", txtHSPAdd2);
            } else if (si7 == 1) {
                FXinfo("Address3 cannot exceed 30 characters.)", txtHSPAdd3);
            } else if (txtHSPCity1.trim().length() <= 0) {
                FXinfo("Please enter a value for City", txtHSPCity);
            } else if (si8 == 11) {
                FXinfo("Please enter a valid City Name  ", txtHSPCity);
            } else if (si8 == 0) {
                FXinfo("City can contain only alphabets and numbers.", txtHSPCity);
            } else if (si8 == 1) {
                FXinfo("City cannot exceed 30 characters.", txtHSPCity);
            } else if (txtHSPCountry1 == null or txtHSPCountry1.trim().length() <= 0) {
                FXinfo("Please select Country.", txtHSPCountry);
            } else if (txtHSPCountry1.trim().length() > 0 and not commonController.selectCountry(txtHSPCountry.rawText)) {
                FXinfo("Please Enter a valid Country.", txtHSPCountry);
            } else if (txtHSPState1 == null or txtHSPState1.trim().length() <= 0) {
                FXinfo("Please select State.", txtHSPState);
            } else if (txtHSPState1.trim().length() > 0 and not commonController.selectState(txtHSPCountry.rawText, txtHSPState.rawText)) {
                FXinfo("Please Enter a valid State.", txtHSPState);
            } else if (txtPinCode1.trim().length() <= 0) {
                FXinfo("Please enter a Pincode.", txtPinCode);
            } else if (si21 != 10) {
                FXinfo("Please enter a valid Pincode.", txtPinCode);
            } else if (txtContactNo1.trim().length() <= 0) {
                FXinfo("Please enter Contact Number.", txtContactNo);
            } else if (si20 == 11) {
                FXinfo("Please enter valid Contact Number.", txtContactNo);
            } else if (si20 == 0) {
                FXinfo("Contact Number can contain only numbers.", txtContactNo);
            } else if (si20 == 1) {
                FXinfo("Contact Number cannot accept more than 20 numbers.", txtContactNo);
            } else if (txtHSPFax1 != null and txtHSPFax1.trim().length() > 0 and si11 == 0) {
                FXinfo("Fax Number can contain only numbers.", txtHSPFax);
            } else if (txtHSPFax1.trim().length() > 0 and si11 == 1) {
                FXinfo("Fax Number cannot accept more than 20 numbers.", txtHSPFax);
            } else if (txtHSPFax1.trim().length() > 0 and si11 == 11) {
                FXinfo("Fax Number can contain minimum of 8 numbers.", txtHSPFax);
            } else if (txtHSPMail1 != null and txtHSPMail1.trim().length() > 0 and si12 != 10) {
                FXinfo("Please enter a valid Mail ID ", txtHSPMail);
            } else if (si12 == 1) {
                FXinfo("Mail ID cannot accept more than 40 characters.", txtHSPMail);
            } else if (txtAmbulanceNo1 != null and txtAmbulanceNo1.trim().length() > 0 and si22 != 10) {
                FXinfo("Please enter a valid value for Ambulance Number.", txtAmbulanceNo);
            } else if (txtHelpLine1 != null and txtHelpLine1.trim().length() > 0 and (si23 == 0 or si23 == 11)) {
                FXinfo("Please enter a valid value for Help Line Number.", txtHelpLine);
            } else if (si23 == 1) {
                FXinfo("Please enter a valid value for Help Line Number.", txtHelpLine);
            } else if (txtHSPOName1 != null and txtHSPOName1.trim().length() > 0 and si14 == 0) {
                FXinfo("Owner Name can contain only alphabets and spaces.", txtHSPOName);
            } else if (si14 == 1) {
                FXinfo("Owner Name cannot exceed 35 characters.", txtHSPOName);
            } else if (txtHSPCperson1 != null and txtHSPCperson1.trim().length() > 0 and si15 == 0) {
                FXinfo("Contact Person Name can contain only alphabets and spaces.", txtHSPCperson);
            } else if (si15 == 1) {
                FXinfo("Contact Person Name cannot exceed 35 characters.", txtHSPCperson);
            } else if (txtHSPCpDest1 != null and txtHSPCpDest1.trim().length() > 0 and si16 == 0) {
                FXinfo("Designation can contain only alphabets and spaces.", txtHSPCpDest);
            } else if (si16 == 1) {
                FXinfo("Designation cannot exceed 35 characters.", txtHSPCpDest);
            } else if (txtHSPCpMob1 != null and txtHSPCpMob1.trim().length() > 0 and si17 == 0) {
                FXinfo("Mobile Number can contain only numbers.", txtHSPCpMob);
            } else if (txtHSPCpMob1 != null and txtHSPCpMob1.trim().length() > 0 and si17 == 11) {
                FXinfo("Mobile Number can contain minimum of 10 digits.", txtHSPCpMob);
            } else if (txtHSPCpMob1 != null and txtHSPCpMob1.trim().length() > 0 and si17 == 1) {
                FXinfo("Mobile Number cannot exceed of 13 digits.", txtHSPCpMob);
            } else if (txtHSPCpMail1 != null and txtHSPCpMail1.trim().length() > 0 and si18 == 0) {
                FXinfo("Please enter valid Email ID for the Contact Person.", txtHSPCpMail);
            } else if (si18 == 1) {
                FXinfo("Please enter valid Email ID for the Contact Person.", txtHSPCpMail);
            } else if (txtHSPSpl1 != null and txtHSPSpl1.trim().length() > 0 and si19 == 0) {
                FXinfo("Please enter a valid value for Speciality.", txtHSPSpl);
            } else if (si19 == 1) {
                FXinfo("Speciality cannot exceed 30 characters.", txtHSPSpl);
            } else if (txtHSPSpl1 != null and txtHSPSpl1.trim().length() > 0 and si19 == 0) {
                FXinfo("Please enter a valid value for Speciality.", txtHSPSpl);
            } else {
                cnt = 10;
            }

        } catch (e: Exception) {
            var msg: String = "Class : Hospital Information Method : ValClick()   = {e.getMessage()}";
            log.debug(msg);
        }
        return cnt;
    }

    function deleteClick(): Void {
        try {
            var hospitalModel: HospitalModel = new HospitalModel();
            var hcod: String = "";
            hcod = txtHSPHCode.rawText.trim();
            if (hcod != null and hcod.trim().length() > 0) {
                var cn: ConfirmDialogBox = new ConfirmDialogBox(1, "Hospital Details");
                var a = bind cn.staus;
                if (a) {

                    hospitalController = RegistryFactory.getClientStub(RegistryConstants.Hospital) as Hospital;
                    hospitalController.deleteRecord(hcod);
                    FXalert(5);
                    //CommonController Call
                    commonController.updateLog("HospitalInformation", "delete");
                    btnHSPSave.text = "Save [F3]";
                    btnHSPEdit.text = "Edit [F6]";
                    btnHSPCancel.text = "Cancel [F8]";
                    clearHospital();
                    var finalCode: String = getHospitalCode();
                    txtHSPHName.requestFocus();
                    txtHSPHCode.text = finalCode;
                    imageView2.visible = false;
                    imgCancel.image = imageCancel;
                }
            } else {
                FXinfo("Please select a Hospital to delete ", txtHSPHName);
            }

        } catch (e: Exception) {
            var msg: String = "Class : Hospital Information Method : deleteClick()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function editclick(): Void {
        clearHospital();
        CancelW = bottonW + 50;
        imgEdit.image = imageCancel;
        imgCancel.image = imageBack;
        btnHSPSave.text = "Update [F7]";
        btnHSPEdit.text = "Delete [F5]";
        btnHSPCancel.text = "Back [Ctrl+Left]";
        txtHSPHCode.text = "";
        txtHSPHName.requestFocus();
        imageView2.visible = true;
    }

    function getHospital(type: Integer): Void {

        listHospitalName.visible = false;
        var listControlObj: ListController = new ListController();
        listH = listControlObj.listImageControlView(txtHSPHName, listHospitalName, "Hospital", type);
        listW = txtHSPHName.width;
        var selectString = bind listControlObj.selectedString on replace {
            if (selectString.length() > 0) {
                listHospitalName.visible = false;
                displayHospitalName(selectString);
                txtHSPGroup.requestFocus();
            }
        }
    }

    function displayHospitalName(name: String): Void {

        try {
            //Controller Instance
            hospitalController = RegistryFactory.getClientStub(RegistryConstants.Hospital) as Hospital;
            var hospitalModel: HospitalModel = hospitalController.viewRecord(name) as HospitalModel;
            txtHSPHCode.text = hospitalModel.getHospitalCode();
            txtHSPHName.text = hospitalModel.getHospitalName();
            txtHSPGroup.text = hospitalModel.getGroup();
            txtHSPEst.text = hospitalModel.getEstablishedYear();
            txtHSPHq.text = hospitalModel.getHeadquarters();
            txtHSPAdd1.text = hospitalModel.getAddress1();
            txtHSPAdd2.text = hospitalModel.getAddress2();
            txtHSPAdd3.text = hospitalModel.getAddress3();
            txtHSPCity.text = hospitalModel.getCity();
            txtHSPCountry.text = hospitalModel.getCountry();
            txtHSPState.text = hospitalModel.getState();
            txtHSPFax.text = hospitalModel.getFaxNumber();
            txtHSPMail.text = hospitalModel.getOfficialMailid();
            txtHSPWeb.text = hospitalModel.getWebsite();
            txtHSPOName.text = hospitalModel.getHospitalOwnerName();
            txtHSPCperson.text = hospitalModel.getContactPersonName();
            txtHSPCpDest.text = hospitalModel.getContactPersonDesignation();
            txtHSPCpMob.text = hospitalModel.getContactPersonMobileNumber();
            txtHSPCpMail.text = hospitalModel.getContactPersonEmailid();
            txtHSPSpl.text = hospitalModel.getSpecialty();
            txtContactNo.text = hospitalModel.getPhoneNumber();
            txtPinCode.text = hospitalModel.getPincode();
            txtAmbulanceNo.text = hospitalModel.getAmbulanceNumber();
            txtHelpLine.text = hospitalModel.getHelpline();
        } catch (e: Exception) {
            var msg: String = "Class : Hospital Information Method : displayHospitalname()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function clearHospital(): Void {
        ResetStyle();
        txtHSPHName.text = "";
        txtHSPGroup.text = "";
        txtHSPEst.text = "";
        txtHSPHq.text = "";
        txtHSPAdd1.text = "";
        txtHSPAdd2.text = "";
        txtHSPAdd3.text = "";
        txtHSPCity.text = "";
        txtHSPCountry.text = "";
        txtHSPState.text = "";
        txtHSPFax.text = "";
        txtHSPMail.text = "";
        txtHSPWeb.text = "";
        txtHSPOName.text = "";
        txtHSPCperson.text = "";
        txtHSPCpDest.text = "";
        txtHSPCpMob.text = "";
        txtHSPCpMail.text = "";
        txtHSPSpl.text = "";
        txtContactNo.text = "";
        txtPinCode.text = "";
        txtAmbulanceNo.text = "";
        txtHelpLine.text = "";
        txtHSPHCode.text = getHospitalCode();
        txtHSPHName.requestFocus();
        listHospitalName.visible = false;
        txtHSPHName.style = mandatory;
        imgEdit.image = imageEdit;
        listCountry.visible = false;
        listState.visible = false;
    }

    function ResetStyle() {
        txtHSPHName.style = mandatory;
        txtHSPGroup.style = style;
        txtHSPEst.style = style;
        txtHSPHq.style = style;
        txtHSPAdd1.style = mandatory;
        txtHSPAdd2.style = style;
        txtHSPAdd3.style = style;
        txtHSPCity.style = mandatory;
        txtHSPCountry.style = mandatory;
        txtHSPState.style = mandatory;
        txtHSPFax.style = style;
        txtHSPMail.style = style;
        txtHSPWeb.style = style;
        txtHSPOName.style = style;
        txtHSPCperson.style = style;
        txtHSPCpDest.style = style;
        txtHSPCpMob.style = style;
        txtHSPCpMail.style = style;
        txtHSPSpl.style = style;
        txtContactNo.style = mandatory;
        txtPinCode.style = mandatory;
        txtAmbulanceNo.style = style;
        txtHelpLine.style = style;
    }

    function SaveClick(): Void {
        // This function is used to save the Hospital information
        try {
            //HospitalController Call
            var hospitalModel: HospitalModel = new HospitalModel();
            var san: Integer = 0;
            san = valClick();
            if (san == 10) {
                hospitalModel.setHospitalCode(txtHSPHCode.rawText.trim().replace("'", ""));
                hospitalModel.setHospitalName(txtHSPHName.rawText.trim().replace("'", ""));
                hospitalModel.setGroup(txtHSPGroup.rawText.trim().replace("'", ""));
                hospitalModel.setEstablishedYear(txtHSPEst.rawText.trim().replace("'", ""));
                hospitalModel.setHeadquarters(txtHSPHq.rawText.trim().replace("'", ""));
                hospitalModel.setAddress1(txtHSPAdd1.rawText.trim().replace("'", ""));
                hospitalModel.setAddress2(txtHSPAdd2.rawText.trim().replace("'", ""));
                hospitalModel.setAddress3(txtHSPAdd3.rawText.trim().replace("'", ""));
                hospitalModel.setCity(txtHSPCity.rawText.trim().replace("'", ""));
                hospitalModel.setCountry(txtHSPCountry.rawText.trim().replace("'", ""));
                hospitalModel.setState(txtHSPState.rawText.trim().replace("'", ""));
                hospitalModel.setFaxNumber(txtHSPFax.rawText.trim().replace("'", ""));
                hospitalModel.setOfficialMailid(txtHSPMail.rawText.trim().replace("'", ""));
                hospitalModel.setWebsite(txtHSPWeb.rawText.trim().replace("'", ""));
                hospitalModel.setHospitalOwnerName(txtHSPOName.rawText.trim().replace("'", ""));
                hospitalModel.setContactPersonName(txtHSPCperson.rawText.trim().replace("'", ""));
                hospitalModel.setContactPersonDesignation(txtHSPCpDest.rawText.trim().replace("'", ""));
                hospitalModel.setContactPersonMobileNumber(txtHSPCpMob.rawText.trim().replace("'", ""));
                hospitalModel.setContactPersonEmailid(txtHSPCpMail.rawText.trim().replace("'", ""));
                hospitalModel.setSpecialty(txtHSPSpl.rawText.trim().replace("'", ""));
                hospitalModel.setPhoneNumber(txtContactNo.rawText.trim().replace("'", ""));
                hospitalModel.setPincode(txtPinCode.rawText.trim().replace("'", ""));
                hospitalModel.setAmbulanceNumber(txtAmbulanceNo.rawText.trim().replace("'", ""));
                hospitalModel.setHelpline(txtHelpLine.rawText.trim().replace("'", ""));
                var txtHSPHCode2 = getHospitalCode();
                if (btnHSPSave.text == "Save [F3]") {
                    //HospitalController Call
                    hospitalController = RegistryFactory.getClientStub(RegistryConstants.Hospital) as Hospital;
                    if (hospitalController.createRecord(hospitalModel).equals(true)) {
                        FXalert(0);
                    }
                    //CommonController Call
                    commonController.updateLog("Hospital Information", "save");
                    clearHospital();
                    var finalCode: String = getHospitalCode();
                    txtHSPHName.requestFocus();
                    txtHSPHCode.text = finalCode;
                    btnHSPSave.text = "Save [F3]";
                    btnHSPEdit.text = "Edit [F6]";
                    btnHSPCancel.text = "Cancel [F8]";
                    imageView2.visible = false;

                } else {
                    var cn: ConfirmDialogBox = new ConfirmDialogBox(0, "Hospital Details");
                    var a = bind cn.staus;
                    if (a) {
                        //HospitalController Call
                        hospitalController = RegistryFactory.getClientStub(RegistryConstants.Hospital) as Hospital;
                        hospitalController.updateRecord(hospitalModel);
                        //CommonController Call
                        FXalert(4);
                        commonController.updateLog("HospitalInformation", "update");
                        clearHospital();
                        var finalCode: String = getHospitalCode();
                        txtHSPHName.requestFocus();
                        txtHSPHCode.text = finalCode;
                        btnHSPSave.text = "Save [F3]";
                        btnHSPEdit.text = "Edit [F6]";
                        btnHSPCancel.text = "Cancel [F8]";
                        imageView2.visible = false;
                        imgCancel.image = imageCancel;
                    }
                }
            }
        } catch (e: Exception) {
            var msg: String = "Class : Hospital Information Method : SaveClick()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function getHospitalCode(): String {
        //Controller Instance
        var code: String = "";
        var finalCode: String = "";
        var vanCode: String = "H";
        try {
            //Controller Instance
            finalCode = commonController.getCustId("hospital_information", "hospital_code", "H");
        } catch (e: Exception) {
            var msg: String = "Class : Hospital Information Method : getHospitalCode()   = {e.getMessage()}";
            log.debug(msg);
        }
        return finalCode;
    }

    function getState(con: Integer): Void {
        if(not listCustState.visible){
        listState.visible = false;
        var listControlObj: ListController = new ListController();
        listH = listControlObj.listStateControlView(txtHSPState, txtHSPCountry.rawText, listState, "", con);
        listW = txtHSPState.width;
        var selS = bind listControlObj.selectedString on replace {
            if (selS.length() > 0) {
                listState.visible = false;
                txtPinCode.requestFocus();
            }
        }
      }
       else{
           listCustState.visible= false;
           txtHSPState.requestFocus();
       }
    }

    function getCountry(type: Integer): Void {
        listCountry.visible = false;
        var listControlObj: ListController = new ListController();
        listH = listControlObj.listImageControlView(txtHSPCountry, listCountry, "Country", type);
        listW = txtHSPCountry.width;
        var selS = bind listControlObj.selectedString on replace {
            if (selS.length() > 0) {
                txtHSPState.text = "";
                getState(1);
            }
        }
    }

    public function disableList(): Void {
        listCustCountry.visible = false;
        listCustState.visible = false;
    }

    public function getPrivileges(u: String): Void {
        var uname = u;
        //Controller Instance        
        var utype = commonController.getUserType(uname);
        if (utype.equals("User")) {
            //CommonController Call
            var priv = commonController.getPrivileges("masters", uname);
            var ss = priv.split(",");
            var val = Integer.parseInt(ss[1]);
            if (val == 1) {
                btnHSPSave.disable = true;
                if (btnHSPEdit.text != "Edit [F6]") {
                    btnHSPEdit.disable = true;
                } else {
                    btnHSPEdit.disable = false;
                }
            } else if (val == 2) {
                if (btnHSPEdit.text != "Edit [F6]") {
                    btnHSPEdit.disable = true;
                } else {
                    btnHSPEdit.disable = false;
                }
                btnHSPSave.disable = false;
            //This code for  READ and WRITE Access
            } else if (val == 3) {
                btnHSPSave.disable = false;
                btnHSPEdit.disable = false;
            //This code for FULL Access
            }
        } else {
            btnHSPSave.disable = false;
            btnHSPEdit.disable = false;
        }
    }

    var logUser: String = bind CommonDeclare.user on replace {
        getPrivileges(logUser);
    }
    var changPiv = bind btnHSPSave.text on replace {
        getPrivileges(logUser);
    }
    var changPiv1 = bind btnHSPEdit.text on replace {
        getPrivileges(logUser);
    }

    public function Startup(): Void {

        //Mandatory textboxes
        currentState.actual=currentState.findIndex("Shown");
        txtHSPHName.requestFocus();
        txtHSPHName.style = mandatory;
        txtHSPAdd1.style = mandatory;
        txtHSPCity.style = mandatory;
        txtHSPCountry.style = mandatory;
        txtHSPState.style = mandatory;
        txtPinCode.style = mandatory;
        txtContactNo.style = mandatory;

        panel.visible = true;
        var finalCode: String = getHospitalCode();
        if (finalCode == "") {
            finalCode = "H0000001";
        }
        txtHSPHCode.text = finalCode;
        clearHospital();
        imageView2.visible = false;
//        txtHSPHName.requestFocus();
        disableList();
        getPrivileges(logUser);

        imageView2.visible = false;
        txtHSPHName.requestFocus();
    }

    public function CancelForm(): Void {
        CommonDeclare.form[3] = 0;
    }

}

