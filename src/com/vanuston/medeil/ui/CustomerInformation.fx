package com.vanuston.medeil.ui;

import javafx.scene.input.KeyCode;
import javafx.scene.control.TextBox;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.implementation.Customer;
import com.vanuston.medeil.model.CustomerModel;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.util.KeyRegistry;
import com.vanuston.medeil.util.Validation;
import java.lang.Exception;
import java.lang.Thread;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.uitables.ConfirmDialogBox;
import com.vanuston.medeil.util.Value;
import java.sql.SQLException;

public class CustomerInformation {

    var customerController: Customer = RegistryFactory.getClientStub(RegistryConstants.Customer) as Customer;
    var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    //var customerController: Customer;//= RegistryFactory.getClientStub(RegistryConstants.Customer) as Customer ;
    //var commonController: CommonImplements;//= RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements ;
    def SendSMSNew = SendSmsAlerts {};
    var log: Logger = Logger.getLogger(CustomerInformation.class, "CRM");
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    def __layoutInfo_separator: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
        height: 0.0
    }
    public-read def separator: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: 30.0
        layoutY: 115.0
        layoutInfo: __layoutInfo_separator
    }
    
    public-read def labelCustomerType: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: true
        layoutX: bind C1LX
        layoutY: 216.0
        text: "Customer Type"
    }
    
    def __layoutInfo_cboCustomerType: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW-40
    }
    public-read def cboCustomerType: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: true
        layoutX: bind C2LX
        layoutY: 216.0
        layoutInfo: __layoutInfo_cboCustomerType
        items: bind custDiscType
    }
    
    public-read def lblCreditLimit: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX
        layoutY: 186.0
        text: "Label"
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
    
    public-read def imageView3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imgCancel: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_txtCreditLimit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtCreditLimit: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C4LX
        layoutY: 186.0
        layoutInfo: __layoutInfo_txtCreditLimit
    }
    
    def __layoutInfo_txtDiscountPer: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtDiscountPer: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: true
        layoutX: bind C4LX
        layoutY: 216.0
        layoutInfo: __layoutInfo_txtDiscountPer
    }
    
    public-read def optCustAlert: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: bind C4LX
        layoutY: 357.0
        onKeyPressed: optCustAlertOnKeyPressed
        onMouseClicked: optCustAlertOnMouseClicked
        items: bind alertItem
    }
    
    def __layoutInfo_separator2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
        height: 3.0
    }
    public-read def separator2: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: 30.0
        layoutY: 258.0
        layoutInfo: __layoutInfo_separator2
    }
    
    public-read def panelMsgBox: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: 152.0
        layoutY: 288.0
    }
    
    public-read def imageCustDown: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C2LX+Type1TextboxW-2
        layoutY: 173.0
        onMouseClicked: imageCustDownOnMouseClicked
    }
    
    public-read def imageCountryDown: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C2LX+Type2TextboxW-2
        layoutY: 267.0
        onMouseClicked: imageCountryDownOnMouseClicked
    }
    
    public-read def imageStateDown: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C2LX+Type2TextboxW-2
        layoutY: 420.0
        onMouseClicked: imageStateDownOnMouseClicked
    }
    
    def __layoutInfo_listViewCustomer: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listViewCustomer: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C2LX
        layoutInfo: __layoutInfo_listViewCustomer
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
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
    
    def __layoutInfo_txtCustMobile: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtCustMobile: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 301.0
        layoutInfo: __layoutInfo_txtCustMobile
        onKeyPressed: txtCustMobileOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtCustAdd3: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtCustAdd3: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 329.0
        layoutInfo: __layoutInfo_txtCustAdd3
        onKeyPressed: txtCustAdd3OnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtCustState: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtCustState: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 427.0
        layoutInfo: __layoutInfo_txtCustState
        onKeyPressed: txtCustStateOnKeyPressed
        onKeyReleased: txtCustStateOnKeyReleased
        font: Arial_12
    }
    
    def __layoutInfo_txtCustCountry: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtCustCountry: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 399.0
        layoutInfo: __layoutInfo_txtCustCountry
        onKeyPressed: txtCustCountryOnKeyPressed
        onKeyReleased: txtCustCountryOnKeyReleased
        font: Arial_12
    }
    
    def __layoutInfo_txtCustPincode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtCustPincode: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 455.0
        layoutInfo: __layoutInfo_txtCustPincode
        onKeyPressed: txtCustPincodeOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtCustEmail: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtCustEmail: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 329.0
        layoutInfo: __layoutInfo_txtCustEmail
        onKeyPressed: txtCustEmailOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtCustPhone: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtCustPhone: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 273.0
        layoutInfo: __layoutInfo_txtCustPhone
        onKeyPressed: txtCustPhoneOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtCustCity: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtCustCity: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        managed: true
        layoutX: bind C2LX
        layoutY: 371.0
        layoutInfo: __layoutInfo_txtCustCity
        onKeyPressed: txtCustCityOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtCustAdd2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtCustAdd2: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 301.0
        layoutInfo: __layoutInfo_txtCustAdd2
        onKeyPressed: txtCustAdd2OnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtCustAdd1: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtCustAdd1: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 273.0
        layoutInfo: __layoutInfo_txtCustAdd1
        onKeyPressed: txtCustAdd1OnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtCustAge: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type5TextboxW
    }
    public-read def txtCustAge: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 158.0
        layoutInfo: __layoutInfo_txtCustAge
        onKeyPressed: txtCustAgeOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtCustFName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtCustFName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 186.0
        layoutInfo: __layoutInfo_txtCustFName
        onKeyPressed: txtCustFNameOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtCustName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
        hfill: false
    }
    public-read def txtCustName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 158.0
        layoutInfo: __layoutInfo_txtCustName
        style: ""
        styleClass: "text-box"
        onKeyPressed: txtCustNameOnKeyPressed
        onKeyReleased: txtCustNameOnKeyReleased
        effect: null
        text: ""
        font: Arial_12
    }
    
    def __layoutInfo_txtCustCCode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtCustCCode: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 130.0
        layoutInfo: __layoutInfo_txtCustCCode
        onKeyPressed: txtCustCCodeOnKeyPressed
        text: ""
        promptText: ""
        selectOnFocus: false
        editable: false
        font: Arial_12
    }
    
    public-read def Arial_Bold_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
    }
    
    public-read def Arial_14: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 14.0
    }
    
    public-read def chkSendCustID: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        visible: false
        layoutX: bind C4LX
        layoutY: 427.0
        onKeyPressed: chkSendCustIDOnKeyPressed
        onMouseClicked: chkSendCustIDOnMouseClicked
        text: "Send Customer ID by SMS"
        font: Arial_14
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
    
    def __layoutInfo_btnCustCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind CancelW
        height: bind bottonH
    }
    public-read def btnCustCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton4LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_btnCustCancel
        onKeyReleased: btnCancelOnKeyReleased
        effect: reflectionEffect
        graphic: imgCancel
        text: "Cancel [Esc]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
        action: btnCustCancelActionAtShown
    }
    
    def __layoutInfo_btnCustReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnCustReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton3LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_btnCustReset
        onKeyReleased: btnResetOnKeyReleased
        effect: reflectionEffect
        graphic: imageView3
        text: "Reset [F5]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnCustEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnCustEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton2LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_btnCustEdit
        onKeyReleased: btnEditOnKeyReleased
        effect: reflectionEffect
        graphic: imgEdit
        text: "Edit [F4]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
        action: btnCustEditActionAtShown
    }
    
    def __layoutInfo_btnCustSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnCustSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_btnCustSave
        onKeyReleased: btnSaveOnKeyReleased
        translateX: 0.0
        effect: reflectionEffect
        graphic: imageView
        text: "Save [F2]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
        action: btnCustSaveActionAtShown
    }
    
    public-read def panelButtons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: bind panelButtonsLY
        content: [ btnCustSave, btnCustEdit, btnCustReset, btnCustCancel, ]
    }
    
    public-read def toggleGroup: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def rdoCustFemale: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: bind C4LX+50
        layoutY: 130.0
        onKeyPressed: rdoCustFemaleOnKeyPressed
        text: "Female"
        font: Arial_12
        toggleGroup: toggleGroup
    }
    
    public-read def rdoCustMale: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: bind C4LX
        layoutY: 130.0
        onKeyPressed: rdoCustMaleOnKeyPressed
        text: "Male"
        font: Arial_12
        toggleGroup: toggleGroup
        selected: true
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
    
    public-read def label1: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 301.0
        text: "Mobile No."
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def lblPatientDetails: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: true
        layoutX: bind C4LX+160
        layoutY: 457.0
        text: "Patient Details"
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def rectPatientDetails: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        layoutX: bind C4LX+150
        layoutY: 455.0
        fill: javafx.scene.paint.Color.YELLOW
        stroke: DarkGray
        strokeWidth: 2.0
        width: 110.0
        height: 20.0
        arcWidth: 10.0
        arcHeight: 10.0
    }
    
    public-read def discPrec: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: true
        layoutX: bind C3LX
        layoutY: 216.0
        text: "Discount (%)"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label13: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 329.0
        text: "Email ID"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label12: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 427.0
        text: "State "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label11: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 399.0
        text: "Country "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label10: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 371.0
        text: "City "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 130.0
        text: "Gender "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label8: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 186.0
        text: "Family Name "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 357.0
        text: "Alert Type "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label6: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 273.0
        text: "Phone No. "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 455.0
        text: "Pincode "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 273.0
        text: "Address "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 158.0
        text: "Age "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 158.0
        styleClass: "label"
        text: "Customer Name "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label14: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 130.0
        text: "Customer Code"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 1.0
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "form-background"
        onMouseClicked: rectangleOnMouseClicked
        fill: linearGradient
        stroke: DarkGray
        width: bind panelW
        height: bind panelH
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.4
    }
    
    public-read def label16: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 36.0
        layoutY: 234.0
        text: "Contact Details"
        font: Arial_18
        textFill: Green
    }
    
    public-read def label15: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 36.0
        layoutY: 91.0
        text: "General Details"
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
        layoutX: 0.0
        layoutY: 1.0
        layoutInfo: __layoutInfo_label
        effect: lightingEffect
        text: "Customer Details - alt+C"
        font: Arial_25
        hpos: javafx.geometry.HPos.CENTER
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
    }
    
    public-read def linearGradientHeader: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
    }
    
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 0.25
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "rectFormHeader"
        fill: linearGradientHeader
        width: bind panelW
        height: 32.0
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ rectangle, rectHeader, label, separator, label14, label2, label3, label4, label5, label6, label7, label8, labelCustomerType, cboCustomerType, label9, label10, label11, label12, label13, lblCreditLimit, discPrec, rectPatientDetails, lblPatientDetails, panelButtons, txtCustCCode, txtCustName, txtCustFName, txtCreditLimit, txtDiscountPer, rdoCustMale, rdoCustFemale, txtCustAge, txtCustAdd1, txtCustAdd2, txtCustCity, txtCustPhone, txtCustEmail, txtCustPincode, txtCustCountry, txtCustState, optCustAlert, txtCustAdd3, separator2, label15, label16, label1, txtCustMobile, chkSendCustID, panelMsgBox, imageCustDown, imageCountryDown, imageStateDown, listViewCustomer, panelAlert, ]
    }
    
    public-read def imageSave: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Save1.png"
    }
    
    public-read def imageEdit: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Edit.png"
    }
    
    public-read def imageReset: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Reset.png"
    }
    
    public-read def imageCancel: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Cancel.png"
    }
    
    public-read def imageDown: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imageBack: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/arrow_Left.png"
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "Shown", "FromSales", ]
        actual: 0
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectangle.blocksMouse = true;
                            __layoutInfo_separator.height = 5.0;
                            label4.text = "Address ";
                            labelCustomerType.visible = true;
                            labelCustomerType.text = "Customer Type";
                            labelCustomerType.font = Arial_12;
                            labelCustomerType.textFill = DarkGray;
                            cboCustomerType.onKeyPressed = cboCustomerTypeOnKeyPressed;
                            cboCustomerType.onMouseClicked = cboCustomerTypeOnMouseClicked;
                            lblCreditLimit.visible = true;
                            lblCreditLimit.text = "Credit Limit";
                            lblCreditLimit.font = Arial_12;
                            discPrec.visible = true;
                            discPrec.layoutY = 216.0;
                            discPrec.text = "Discount (%)";
                            discPrec.font = Arial_12;
                            discPrec.textFill = DarkGray;
                            rectPatientDetails.visible = true;
                            rectPatientDetails.layoutY = 455.0;
                            rectPatientDetails.onMouseClicked = rectPatientDetailsOnMouseClickedAtShown;
                            rectPatientDetails.fill = javafx.scene.paint.Color.YELLOW;
                            rectPatientDetails.stroke = DarkGray;
                            rectPatientDetails.strokeWidth = 2.0;
                            rectPatientDetails.width = 110.0;
                            rectPatientDetails.height = 20.0;
                            rectPatientDetails.arcWidth = 10.0;
                            rectPatientDetails.arcHeight = 10.0;
                            lblPatientDetails.visible = true;
                            lblPatientDetails.layoutY = 457.0;
                            lblPatientDetails.text = "Patient Details";
                            lblPatientDetails.font = Arial_Bold_12;
                            lblPatientDetails.textFill = DarkGray;
                            imageView.visible = true;
                            imageView.image = imageSave;
                            btnCustSave.visible = true;
                            btnCustSave.onKeyReleased = btnSaveOnKeyReleased;
                            btnCustSave.text = "Save [F3]";
                            imgEdit.visible = true;
                            imgEdit.image = imageEdit;
                            btnCustEdit.visible = true;
                            btnCustEdit.text = "Edit [F6]";
                            imageView3.visible = true;
                            imageView3.image = imageReset;
                            btnCustReset.visible = true;
                            btnCustReset.text = "Reset [F4]";
                            btnCustReset.action = btnCustResetActionAtShown;
                            imgCancel.visible = true;
                            imgCancel.layoutX = 0.0;
                            imgCancel.image = imageCancel;
                            btnCustCancel.visible = true;
                            btnCustCancel.text = "Cancel [F8]";
                            btnCustCancel.hpos = javafx.geometry.HPos.CENTER;
                            btnCustCancel.graphicTextGap = 4.0;
                            panelButtons.visible = true;
                            txtCustName.layoutY = 158.0;
                            __layoutInfo_txtCustName.height = 21.0;
                            txtCreditLimit.visible = true;
                            txtCreditLimit.onKeyPressed = txtCreditLimitOnKeyPressedAtShown;
                            txtCreditLimit.font = Arial_12;
                            txtDiscountPer.visible = true;
                            txtDiscountPer.layoutY = 216.0;
                            txtDiscountPer.editable = false;
                            rdoCustMale.onMouseClicked = rdoCustMaleOnMouseClickedAtShown;
                            rdoCustMale.focusTraversable = true;
                            rdoCustMale.toggleGroup = toggleGroup;
                            rdoCustFemale.onMouseClicked = rdoCustFemaleOnMouseClickedAtShown;
                            txtCustAdd2.promptText = "Area/Location";
                            __layoutInfo_separator2.height = 5.0;
                            chkSendCustID.visible = true;
                            panelMsgBox.layoutX = 180.0;
                            panelMsgBox.layoutY = 260.0;
                            imageCustDown.visible = false;
                            imageCustDown.layoutY = 158.0;
                            imageCustDown.blocksMouse = true;
                            imageCustDown.image = imageDown;
                            imageCountryDown.visible = true;
                            imageCountryDown.layoutY = 399.0;
                            imageCountryDown.blocksMouse = true;
                            imageCountryDown.image = imageDown;
                            imageStateDown.visible = true;
                            imageStateDown.layoutY = 427.0;
                            imageStateDown.blocksMouse = true;
                            imageStateDown.image = imageDown;
                            listViewCustomer.visible = false;
                            listViewCustomer.items = [ "Item 1", "Item 2", "Item 3", ];
                        }
                    }
                ]
            }
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectangle.blocksMouse = false;
                            __layoutInfo_separator.height = 0.0;
                            label4.text = "Address ";
                            labelCustomerType.visible = true;
                            labelCustomerType.text = "Customer Type";
                            labelCustomerType.textFill = javafx.scene.paint.Color.BLACK;
                            lblCreditLimit.visible = true;
                            lblCreditLimit.text = "Credit Limit";
                            discPrec.visible = true;
                            discPrec.layoutY = 216.0;
                            discPrec.text = "Discount (%)";
                            discPrec.font = Arial_12;
                            discPrec.textFill = DarkGray;
                            rectPatientDetails.visible = true;
                            rectPatientDetails.layoutY = 455.0;
                            rectPatientDetails.fill = javafx.scene.paint.Color.YELLOW;
                            rectPatientDetails.stroke = DarkGray;
                            rectPatientDetails.strokeWidth = 2.0;
                            rectPatientDetails.width = 110.0;
                            rectPatientDetails.height = 20.0;
                            rectPatientDetails.arcWidth = 10.0;
                            rectPatientDetails.arcHeight = 10.0;
                            lblPatientDetails.visible = true;
                            lblPatientDetails.layoutY = 457.0;
                            lblPatientDetails.text = "Patient Details";
                            lblPatientDetails.font = Arial_Bold_12;
                            lblPatientDetails.textFill = DarkGray;
                            imageView.visible = false;
                            imageView.image = null;
                            btnCustSave.visible = false;
                            btnCustSave.onKeyReleased = btnSaveOnKeyReleased;
                            btnCustSave.text = "Save [F2]";
                            imgEdit.visible = false;
                            imgEdit.image = null;
                            btnCustEdit.visible = false;
                            btnCustEdit.text = "Edit [F4]";
                            imageView3.visible = false;
                            imageView3.image = null;
                            btnCustReset.visible = false;
                            btnCustReset.text = "Reset [F5]";
                            btnCustReset.action = btnCustResetActionAtShown;
                            imgCancel.visible = false;
                            imgCancel.layoutX = 0.0;
                            imgCancel.image = null;
                            btnCustCancel.visible = false;
                            btnCustCancel.text = "Cancel [Ctrl+C]";
                            btnCustCancel.hpos = javafx.geometry.HPos.CENTER;
                            btnCustCancel.graphicTextGap = 4.0;
                            panelButtons.visible = false;
                            txtCustName.layoutY = 158.0;
                            __layoutInfo_txtCustName.height = 21.0;
                            txtCreditLimit.visible = true;
                            txtDiscountPer.visible = true;
                            txtDiscountPer.layoutY = 216.0;
                            txtDiscountPer.editable = true;
                            rdoCustMale.onMouseClicked = rdoCustMaleOnMouseClickedAtShown;
                            rdoCustMale.focusTraversable = true;
                            rdoCustMale.toggleGroup = toggleGroup;
                            rdoCustFemale.onMouseClicked = rdoCustFemaleOnMouseClickedAtShown;
                            txtCustAdd2.promptText = null;
                            __layoutInfo_separator2.height = 3.0;
                            chkSendCustID.visible = true;
                            panelMsgBox.layoutX = 180.0;
                            panelMsgBox.layoutY = 260.0;
                            imageCustDown.visible = false;
                            imageCustDown.layoutY = 173.0;
                            imageCustDown.blocksMouse = false;
                            imageCustDown.image = null;
                            imageCountryDown.visible = true;
                            imageCountryDown.layoutY = 267.0;
                            imageCountryDown.blocksMouse = false;
                            imageCountryDown.image = null;
                            imageStateDown.visible = true;
                            imageStateDown.layoutY = 420.0;
                            imageStateDown.blocksMouse = false;
                            imageStateDown.image = null;
                            listViewCustomer.visible = false;
                            listViewCustomer.onKeyPressed = listViewCustomerOnKeyPressedAtFromSales;
                            listViewCustomer.items = null;
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

    function rectPatientDetailsOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
         def patDetails = PatientDetails {};
         delete panel.content;
         insert patDetails.getDesignRootNodes() into panel.content;
         patDetails.StartUp();
         panel.visible=true;
    }

    function txtCreditLimitOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtCustAdd1.requestFocus();
        }
        shortcut(event);
    }

    var custDiscType= null;
    var srCode: String = null;
    var listH = 0.0;
    var alertItem: String[] = ["---Select---", "Home Delivery", "Email", "Phone Call", "SMS"];
    public var checkState = 0;
    public var checkVal = 0;
    public var isBack = false;
    public var newCust: String = "";
    var panelW = bind CommonDeclare.panelFormW on replace {
        Type5TextboxW = panelW * 3.811944091 / 100;
        listViewCustomer.visible = false;
    }
    var Type5TextboxW = panelW * 3.811944091 / 100;
    var panelH = bind CommonDeclare.panelFormH;
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var C1LX = bind CommonDeclare.Column1LX;
    var C2LX = bind CommonDeclare.Column2LX;
    var C3LX = bind CommonDeclare.Column3LX;
    var C4LX = bind CommonDeclare.Column4LX;
    var botton1LX = bind CommonDeclare.botton1LX;
    var botton2LX = bind CommonDeclare.botton2LX;
    var botton3LX = bind CommonDeclare.botton3LX;
    var botton4LX = bind CommonDeclare.botton4LX;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    var bottonW = bind CommonDeclare.bottonW;
    var bottonH = bind CommonDeclare.bottonH;
    var CancelW = bottonW;
    var seperatorW = bind CommonDeclare.seperatorW;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;
    var Type4TextboxW = bind CommonDeclare.Type4TextboxW;
    var rectbutton2LX = bind CommonDeclare.rectbutton2LX;
    var rectbuttonLY = bind CommonDeclare.rectbuttonLY;
    var listW = Type2TextboxW;
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    var mandatoryStyle: String = CommonDeclare.textbox_mandatory();
    var errorStyle: String = CommonDeclare.textbox_error();
    def CustomAlert = CustomAlert {};

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Customer Information", type);
        showAlertbox();
    }



    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Customer Information", msg);
        showAlertbox();
    }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Customer Information", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = errorStyle;
    }

    function rectangleOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        listViewCustomer.visible = false;
    }

    function chkSendCustIDOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        checkSMS();
    }

    function chkSendCustIDOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        checkSMS();
    }

    function checkSMS(): Void {
        //CommonController Call
        commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
        var msg = commonController.checkSMSConf();
        if (not msg.equals("Done")) {
            FXinfo("{msg}");
            chkSendCustID.selected = false;
        }
    }

    function optCustAlertOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB) {
            btnCustSave.requestFocus();
        }
    }

    function rdoCustFemaleOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            rdoCustFemale.selected = true;
            rdoCustMale.selected = false;
            txtCustAge.requestFocus();
        }
        if (event.code == KeyCode.VK_TAB) {
            txtCustAge.requestFocus();
        }
    }

    function rdoCustMaleOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            rdoCustMale.selected = true;
            rdoCustFemale.selected = false;
            txtCustAge.requestFocus();
        }
    }

    function imageStateDownOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        getState(0);
    }

    function imageCountryDownOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        getCountry(0);
    }

    function imageCustDownOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        getCust(0);
    }

    function optCustAlertOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
    
        alertItem = ["---Select---", "Home Delivery", "Mail", "Phone Call", "SMS"];
        optCustAlert.select(0);
    }

    def kr = KeyRegistry {};
    var ss = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 6 and CommonDeclare.form[5] == 1) {
            shortcut(ss);
        }
        if (CommonDeclare.currModule == 2 and currentState.actual == currentState.findIndex("FromSales")) {
            shortcut(ss);
        }
    }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {

        var ck = currentState.actual;
        if (ck == 0) {
            if (event.code == kr.save and btnCustSave.text == "Save [F3]" and not btnCustSave.disable) {
                save(0);
            }
            if (event.code == kr.edit and btnCustEdit.text == "Edit [F6]" and not btnCustEdit.disable) {
                edit();
            }
            if (event.code == kr.reset and btnCustReset.text == "Reset [F4]") {
                reset();
            }
            if (event.code == kr.update and btnCustSave.disable == false) {
                if (btnCustSave.text == "Update [F7]") { update(); }
            }
            if (event.code == kr.del and btnCustEdit.disable == false) {
                if (btnCustEdit.text == "Delete [F5]") { del(); }
            }
            if (event.controlDown and event.code == kr.back) {
                if (btnCustCancel.text == "Back [Ctrl+Left]") { back(); }
            }
            if (event.code == kr.cancel) {
                if (btnCustCancel.text == "Cancel [F8]") { cancel(); }
            }
        } else if (ck == 1) {
            if (event.code == kr.save) {
                save(1);
            }
            if (event.controlDown and event.code == kr.back) {
                isBack = not isBack;
            }
        }
    }

    function txtCustEmailOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
     
        txtCustEmail.style = "";
        listViewCustomer.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            optCustAlert.requestFocus();
            alertItem = ["---Select---", "Home Delivery", "Mail", "Phone Call", "SMS"];
            optCustAlert.select(0);
        }
        shortcut(event);
    }

    function txtCustMobileOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
   
        txtCustMobile.style = "";
        listViewCustomer.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtCustEmail.requestFocus(); }
        shortcut(event);
    }

    function txtCustPhoneOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
  
        txtCustPhone.style = "";
        listViewCustomer.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtCustMobile.requestFocus(); }
        shortcut(event);
    }

    function txtCustPincodeOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        
        txtCustPincode.style = "";
        listViewCustomer.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtCustPhone.requestFocus(); }
        shortcut(event);
    }

    function txtCustStateOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {

        txtCustState.style = "";
        if (event.code == KeyCode.VK_ENTER) {
            var i: Boolean = false;
            //CommonController Call
            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
            i = commonController.selectState(txtCustCountry.rawText, txtCustState.rawText);
            if (i == false) {
                txtCustState.requestFocus();
                txtCustState.text = "";
            } else {
                txtCustPincode.requestFocus();
            }
        } else if (event.code == KeyCode.VK_TAB) {
            txtCustPincode.requestFocus();
        }

    }

    function txtCustCountryOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
     
        txtCustCountry.style = "";
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            //CommonController Call
            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
            if (not commonController.selectCountry(txtCustCountry.rawText)) {
                txtCustCountry.requestFocus();
                txtCustCountry.text = "";
            } else {
                txtCustState.requestFocus();
            }
        }
    }

    function txtCustCityOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
       
        txtCustCity.style = mandatoryStyle;
        listViewCustomer.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtCustCountry.requestFocus(); }
        shortcut(event);
    }

    function txtCustAdd3OnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        
        txtCustAdd3.style = "";
        listViewCustomer.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtCustCity.requestFocus(); }
        shortcut(event);
    }

    function txtCustAdd2OnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
       
        txtCustAdd2.style = "";
        listViewCustomer.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtCustAdd3.requestFocus(); }
        shortcut(event);
    }

    function txtCustAdd1OnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
   
        txtCustAdd1.style = mandatoryStyle;
        listViewCustomer.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtCustAdd2.requestFocus(); }
        shortcut(event);
    }

    function txtCustAgeOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
       
        txtCustAge.style = mandatoryStyle;
        listViewCustomer.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtCreditLimit.requestFocus(); }
        shortcut(event);
    }

    function txtCustFNameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
       
        txtCustFName.style = "";
        listViewCustomer.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { rdoCustMale.requestFocus(); }
        shortcut(event);
    }

    function txtCustNameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        
        txtCustName.style = mandatoryStyle;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            var i: Boolean = false;
            //CommonController Call
            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
            i = commonController.selectCustomer(txtCustName.rawText);
            if (i == false and btnCustSave.text == "Update [F7]") {
                txtCustName.requestFocus();
                txtCustName.text = "";
            } else {
                listViewCustomer.visible = false;
                txtCustFName.requestFocus();
            }
        }
        shortcut(event);
    }

    function txtCustCCodeOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
      
        listViewCustomer.visible = false;
        shortcut(event);
        txtCustName.requestFocus();
    }

    function rdoCustFemaleOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        
        rdoCustMale.selected = false;
        txtCustAge.requestFocus();
    }

    function rdoCustMaleOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
       
        rdoCustFemale.selected = false;
        txtCustAge.requestFocus();
    }

    function listViewCustomerOnKeyPressedAtFromSales(event: javafx.scene.input.KeyEvent): Void {
        
        if (listViewCustomer.focused) {
            if (event.code == KeyCode.VK_DOWN)
                listViewCustomer.selectFirstRow();
        }
    }

    function txtCustStateOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
      
        getState(1);
        if (event.code == KeyCode.VK_DOWN and listViewCustomer.items != null) {
            listViewCustomer.requestFocus();
            listViewCustomer.selectFirstRow();
        }
        if (event.code == KeyCode.VK_ESCAPE) {
            listViewCustomer.visible = false;
            txtCustState.requestFocus();
        }
    }

    function txtCustCountryOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
       
        txtCustCountry.style = "";
        getCountry(1);
        if (event.code == KeyCode.VK_DOWN and listViewCustomer.items != null) {
            listViewCustomer.requestFocus();
            listViewCustomer.selectFirstRow();
        }
        if (event.code == KeyCode.VK_ESCAPE) {
            listViewCustomer.visible = false;
            txtCustCountry.requestFocus();
        }

    }

    function txtCustNameOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        
        if (btnCustSave.text == "Update [F7]" and btnCustEdit.text == "Delete [F5]") {
            getCust(1);
            if (event.code == KeyCode.VK_DOWN and listViewCustomer.items != null) {
                listViewCustomer.requestFocus();
                listViewCustomer.selectFirstRow();
            }
            if (event.code == KeyCode.VK_ESCAPE) {
                listViewCustomer.visible = false;
                txtCustName.requestFocus();
            }
        }
    }

    function btnCustCancelActionAtShown(): Void {
        
        cancel();
    }

    function btnCustResetActionAtShown(): Void {
        
        reset();
    }

    function btnCustEditActionAtShown(): Void {
        
        if (btnCustEdit.text == "Delete [F5]") {
            del();
        } else {
            edit();
        }
    }

    function btnSaveOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        
        if (event.code == KeyCode.VK_ENTER) {
            if (btnCustSave.text == "Update [F7]") { update(); } else { save(0); }
        }

    }

    function btnEditOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
       
        if (event.code == KeyCode.VK_ENTER) {
            if (btnCustEdit.text == "Delete [F5]") { del(); } else { edit(); }
        }
    }

    function btnResetOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
       
        if (event.code == KeyCode.VK_ENTER) {
            reset();
        }
    }

    function btnCancelOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        
        if (event.code == KeyCode.VK_ENTER) {
            if (btnCustCancel.text == "Cancel [F8]") { cancel(); } else { back(); }
        }
    }

    function btnCustSaveActionAtShown(): Void {
        
        if (btnCustSave.text == "Update [F7]") {
            update();
        } else {
            save(0);
        }
    }

    public function save(chk: Integer): Integer {
        
        var cust = 0;
        try {

            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
            var i: Integer = commonController.selectCount("cust_information", txtCustName.rawText);
            if (i == 0) {
                var san: Integer = 0;
                san = clickValid(chk);
                if (san == 10) {
                    var gender: String = null;
                    if (rdoCustMale.selected == true) {
                        gender = "Male";
                    } else if (rdoCustFemale.selected == true) {
                        gender = "Female";
                    } else {
                        gender = "None";
                    }
                    //CustomerController Call
                    var customerModel: CustomerModel = new CustomerModel();
                    customerModel.setCustomerCode(txtCustCCode.rawText);
                    customerModel.setCusttypeid(custTypeId);
                    customerModel.setFamilyName(txtCustFName.rawText);
                    customerModel.setCustomerName(txtCustName.rawText);
                    customerModel.setAge(txtCustAge.rawText);
                    customerModel.setGender(gender);
                    customerModel.setAddress1(txtCustAdd1.rawText);
                    customerModel.setAddress2(txtCustAdd2.rawText);
                    customerModel.setAddress3(txtCustAdd3.rawText);
                    customerModel.setCity(txtCustCity.rawText);
                    customerModel.setCountry(txtCustCountry.rawText);
                    customerModel.setState(txtCustState.rawText);
                    customerModel.setPincode(txtCustPincode.rawText);
                    customerModel.setPhoneNumber(txtCustPhone.rawText);
                    customerModel.setMobileNumber(txtCustMobile.rawText);
                    customerModel.setEmailid(txtCustEmail.rawText);
                    customerModel.setAlertType(optCustAlert.selectedItem.toString());
                    if (txtCreditLimit.rawText.trim() != "") {
                        customerModel.setCreditLimit(Double.parseDouble(txtCreditLimit.rawText));
                    } else {
                        customerModel.setCreditLimit(0.00);
                    }
                    var sendID = chkSendCustID.selected;
                    customerModel.setSMSFlag(0);
                    var alert = optCustAlert.selectedItem.toString();
                    if (optCustAlert.selectedItem == "---Select---") {
                        alert = "";
                    }
                    FXalert(0);
                    if (chkSendCustID.selected) { customerModel.setSMSFlag(sendCustomerID(txtCustCCode.rawText, txtCustMobile.rawText)); }
                    //Controller  Call
                    customerController = RegistryFactory.getClientStub(RegistryConstants.Customer) as Customer;
                    customerController.createRecord(customerModel);
                    commonController.updateLog("Customer Information", btnCustSave.text);
                    newCust = txtCustName.rawText;
                    checkVal = 1;
                    txtCustCCode.requestFocus();
                    srCode = custCode();
                    if (srCode == "") {
                        srCode = "CC0000001";
                    }
                    txtCustCCode.text = srCode;
                    optCustAlert.select(0);
                    clear();
                    cust = 1;
                }
            } else {
                FXinfo("Customer Name Already Exists.");
                txtCustName.requestFocus();
            }
        } catch (e: Exception) {
            var msg: String = "Class : CustomerInformation  Method : Save()   = {e.getMessage()}";
            log.debug(msg);
        }
        return cust;
    }

    function sendCustomerID(ID: String, mob: String): Integer {
        
        var result = 0;
        var v = new Validation();
        var n = v.getMobileNoValid(mob, 10, 10);
        if (mob.length() <= 0) {
            FXinfo("Invalid mobile number.", txtCustMobile);
        } else if (n != 10) {
            FXinfo("Please enter only numbers.", txtCustMobile);
        } else if (n == 1 or n == 11) {
            FXinfo("Only 10 digits can be entered for mobile number excluding country code.", txtCustMobile);
        } else {
            //CommonController Call
            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
            var smsMessage = "Thank you for purchasing medicines from {commonController.getShopDetails()}.Your ID is {ID}";
            var mobile: String = {
                        mob
                    };
            SendSMSNew.sendSMS(mobile, smsMessage);
            Thread.sleep(1000);
            var chck1 = bind SendSMSNew.rand on replace {
                if (SendSMSNew.isSent) {
                    FXinfo("SMS Alerts :{SendSMSNew.msg}");
                }
            }
        }
        return result;
    }

    public function update(): Void {
       
        try {
            var san: Integer = 0;
            san = clickValid(0);
            if (san == 10) {
                var gender: String = null;
                if (rdoCustMale.selected == true) {
                    gender = "Male";
                } else if (rdoCustFemale.selected == true) {
                    gender = "Female";
                } else {
                    gender = "None";
                }
                //CustomerController Call
                //                    var customerController:Customer=new CustomerController();
                var customerModel: CustomerModel = new CustomerModel();
                customerModel.setCustomerCode(txtCustCCode.rawText);
                customerModel.setFamilyName(txtCustFName.rawText);
                customerModel.setCustomerName(txtCustName.rawText);
                customerModel.setCusttypeid(custTypeId);
                customerModel.setAge(txtCustAge.rawText);
                customerModel.setGender(gender);
                customerModel.setAddress1(txtCustAdd1.rawText);
                customerModel.setAddress2(txtCustAdd2.rawText);
                customerModel.setAddress3(txtCustAdd3.rawText);
                customerModel.setCity(txtCustCity.rawText);
                customerModel.setCountry(txtCustCountry.rawText);
                customerModel.setState(txtCustState.rawText);
                customerModel.setPincode(txtCustPincode.rawText);
                customerModel.setPhoneNumber(txtCustPhone.rawText);
                customerModel.setMobileNumber(txtCustMobile.rawText);
                customerModel.setEmailid(txtCustEmail.rawText);
                if (txtCreditLimit.rawText.trim() != "") {
                    customerModel.setCreditLimit(Double.parseDouble(txtCreditLimit.rawText));
                } else {
                    customerModel.setCreditLimit(0.00);
                }
                var alert = optCustAlert.selectedItem.toString();
                var sendID = chkSendCustID.selected;
                if (optCustAlert.selectedItem == "---Select---") {
                    alert = "";
                }
                customerModel.setAlertType(alert);
                var cn: ConfirmDialogBox = new ConfirmDialogBox(0, "Customer Details");
                var a = bind cn.staus;
                if (a) {
                    var sentStatus = 0;
                    sendID = chkSendCustID.selected;
                    if (sendID) { sentStatus = sendCustomerID(txtCustCCode.rawText, txtCustMobile.rawText); }
                    customerModel.setSMSFlag(sentStatus);
                    //Controller Call
                    customerController = RegistryFactory.getClientStub(RegistryConstants.Customer) as Customer;
                    commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
                    customerController.updateRecord(customerModel);
                    commonController.updateLog("Customer Information", btnCustEdit.text);
                    optCustAlert.select(0);
                    txtCustCCode.text = "";
                    txtCustCCode.requestFocus();
                    FXalert(4);
                    clear();
                }
            }
        } catch (e: Exception) {
            var msg: String = "Class : Customer Information  Method : Update()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function del(): Void {
       
        try {
            if (txtCustName.text != null) {
                var gender: String = null;
                if (rdoCustMale.selected == true) {
                    gender = "Male";
                } else if (rdoCustFemale.selected == true) {
                    gender = "Female";
                } else {
                    gender = "None";
                }
                //CustomerController Call
                var alert = optCustAlert.selectedItem.toString();
                var sendID = chkSendCustID.selected;
                if (optCustAlert.selectedItem == "---Select---") {
                    alert = "";
                }
                var cn: ConfirmDialogBox = new ConfirmDialogBox(1, "Customer Details");
                var a = bind cn.staus;
                if (a) {
                    var sentStatus = 0;
                    sendID = chkSendCustID.selected;
                    if (sendID) { sentStatus = sendCustomerID(txtCustCCode.rawText, txtCustMobile.rawText); }
                    //Controller Call
                    customerController = RegistryFactory.getClientStub(RegistryConstants.Customer) as Customer;
                    commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
                    customerController.deleteRecord(txtCustName.rawText);
                    commonController.updateLog("Customer Information", btnCustReset.text);
                    txtCustCCode.text = "";
                    txtCustCCode.requestFocus();
                    FXalert(5);
                    clear();
                }
            } else {
                FXinfo("Please select the Customer Name to be Deleted.");
            }
        } catch (e: Exception) {
            var msg: String = "Class : Customer Information  Method : Delete()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function back(): Void {
       
        CancelW = bottonW;
        imgEdit.image = imageEdit;
        imgCancel.image = imageCancel;
        alertItem = ["---Select---", "Home Delivery", "Mail", "Phone Call", "SMS"];
        optCustAlert.select(0);
        imageCustDown.visible = false;
        listViewCustomer.visible = false;
        txtCustCCode.requestFocus();
        btnCustSave.disable = false;
        btnCustEdit.disable = false;
        btnCustReset.disable = false;
        btnCustSave.text = "Save [F3]";
        btnCustEdit.text = "Edit [F6]";
        btnCustReset.text = "Reset [F4]";
        clear();
        srCode = custCode();
        if (srCode == "") {
            srCode = "CC0000001";
        }
        txtCustCCode.text = srCode;
        btnCustCancel.text = "Cancel [F8]";
        getPrivileges(logUser);
    }

    public function edit(): Void {
       
        imageCustDown.visible = true;
        txtCustName.requestFocus();
        clear();
        btnCustCancel.text = "Back [Ctrl+Left]";
        txtCustCCode.text = null;
        btnCustSave.text = "Update [F7]";
        btnCustEdit.text = "Delete [F5]";
        CancelW = bottonW + 50;
        imgEdit.image = imageCancel;
        imgCancel.image = imageBack;
    }

    public function reset(): Void {
       
        clear();
        optCustAlert.select(0);
        if (btnCustSave.text == "Save [F3]") {
            srCode = custCode();
            if (srCode == "") {
                srCode = "CC0000001";
            }
            txtCustCCode.text = srCode;
        }
        txtCustCCode.requestFocus();
    }

    public function cancel(): Void {
       
        if (btnCustCancel.text == "Back [Ctrl+Left]") {
            back();
        } else {
            Empty();
            delete  panel.content;
            panel.visible = false;
            CommonDeclare.form[5] = 0;
        }
    }

    public function getCust(con: Integer): Void {
        
        if(not listViewCustomer.visible){
        listViewCustomer.visible = false;
        var listControlObj: ListController = new ListController();
        listH = listControlObj.listImageControlView(txtCustName, listViewCustomer, "Customer", con);
        listW = txtCustName.width;
        listViewCustomer.layoutY = txtCustName.layoutY + 22;
        var selectString = bind listControlObj.selectedString on replace {
            if (selectString.length() > 0) {
                displayCustomer(selectString);
                txtCustFName.requestFocus();
            }
         }
      }
    else{
        listViewCustomer.visible =false;
        txtCustName.requestFocus();
      }
    }

//        var custName: String[] = [];
//        listH = 0.0;
//        listViewCustomer.visible = true;
//        listW = txtCustName.width;
//        listViewCustomer.layoutY = txtCustName.layoutY + 22;
//        var size = listViewCustomer.items.size();
//        if (not listViewCustomer.items.isEmpty()) {
//            for (i in [0..<size])
//                listViewCustomer.items[i] = null;
//            txtCustName.requestFocus();
//        } if (con == 0) {
//            //CommonController Call
//            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements ;
//            custName = commonController.customerName(txtCustName.rawText.trim()).toArray() as String[];
//        } else {
//            //CommonController Call
//            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements ;
//            custName = commonController.customerName("").toArray() as String[];
//        }
//        listViewCustomer.clearSelection();
//        listViewCustomer.items = custName;
//        listViewCustomer.onKeyPressed = function(e) {
//                    if (e.code == KeyCode.VK_ENTER) {
//                        txtCustName.text = "{listViewCustomer.selectedItem}";
//                        var sam: String = txtCustName.text;
//                        displayCustomer(sam);
//                        listViewCustomer.visible = false;
//                        txtCustFName.requestFocus();
//                    } else if (e.code == KeyCode.VK_DOWN) {
//                        if (listViewCustomer.selectedIndex == 0) {
//                            listViewCustomer.selectFirstRow();
//                        }
//                    } else if (e.code == KeyCode.VK_ESCAPE) {
//                        listViewCustomer.visible = false;
//                        txtCustName.requestFocus();
//                    }
//                };
//        listViewCustomer.onMouseClicked = function(e) {
//                    txtCustName.text = "{listViewCustomer.selectedItem}";
//                    var sam: String = txtCustName.text;
//                    displayCustomer(sam);
//                    listViewCustomer.visible = false;
//                    txtCustFName.requestFocus();
//                }
//        var height: Integer = 0;
//        if (listViewCustomer.items.size() < 9) {
//            height = listViewCustomer.items.size();
//        } else {
//            height = 8;
//        }
//        for (i in [1..height]) {
//            listH += 25.0;
//        }
    

    public function getState(con: Integer) {
       
        if(not listViewCustomer.visible){
        listViewCustomer.visible = false;
        var listControlObj: ListController = new ListController();
        listH = listControlObj.listStateControlView(txtCustState, txtCustCountry.rawText, listViewCustomer, "", con);
        listViewCustomer.layoutY = txtCustState.layoutY + 22;
        listW = txtCustState.width;

        var selS = bind listControlObj.selectedString on replace {
            if (selS.length() > 0) {
                listViewCustomer.visible = false;
                txtCustPincode.requestFocus();
            }
        }
      }
       else{
           listViewCustomer.visible = false;
           txtCustState.requestFocus();
       }
    }

    public function getCountry(con: Integer) {
        
        if(not listViewCustomer.visible){
        listViewCustomer.visible = false;
        var listControlObj: ListController = new ListController();
        listH = listControlObj.listImageControlView(txtCustCountry, listViewCustomer, "Country", con);
        listViewCustomer.layoutY = txtCustCountry.layoutY + 22;
        listW = txtCustCountry.width;

        var selS = bind listControlObj.selectedString on replace {
            if (selS.length() > 0) {
                txtCustState.text = "";
                getState(1);
            }
        }
     }
       else{
           listViewCustomer.visible =false;
           txtCustCountry.requestFocus();
       }
    }



    public function Empty(): Void {
      
        txtCustFName.text = null;
        txtCustName.text = null;
        txtCustAge.text = null;
        txtCustAdd1.text = null;
        txtCustAdd2.text = null;
        txtCustAdd3.text = null;
        txtCustCity.text = null;
        txtCustCountry.text = null;
        txtCustState.text = null;
        txtCustPincode.text = null;
        txtCustPhone.text = null;
        txtCustMobile.text = null;
        txtCustEmail.text = null;
    }

       
    function getCustDiscount(cType): String[] {
        
        var customerBean:CustomerModel=new CustomerModel();
        var customerAddBean;
        var disc: String[] = "";
        try {
            customerBean.setChkValue("getCustDiscount");
            customerBean.setCusttypeid(cType.toString());

            var custList=customerController.viewAllRecord(customerBean) as CustomerModel;
            custList.getCustomerinfoList().size();
            customerBean.getCustomerinfoList();
            for(i in[0..<custList.getCustomerinfoList().size()])
            {
                customerAddBean=custList.getCustomerinfoList().get(i) as CustomerModel;
                disc[0] = customerAddBean.getCustomerType();
                disc[1] = customerAddBean.getCustomerPercentage().toString();
            }

        } catch (e: SQLException) {
            var msg: String = "Class : CustomerInformation  Method : getCustDiscount()   = {e.getMessage()}";
            log.debug(msg);
        }
     
        return disc;
    }

        public function clear(): Void {
        
        txtCustFName.text = "";
        txtCustName.text = "";
        txtCustAge.text = "";
        txtCustAdd1.text = "";
        txtCustAdd2.text = "";
        txtCustAdd3.text = "";
        txtCustCity.text = "";
        txtCustCountry.text = "";
        txtCustState.text = "";
        txtCustPincode.text = "";
        txtCustPhone.text = "";
        txtCustMobile.text = "";
        txtCustEmail.text = "";
        txtCreditLimit.text = "";
        rdoCustMale.selected = true;
        rdoCustFemale.selected = false;
        listViewCustomer.visible = false;
        custDiscType = "";
        custDiscType = getCustDiscType();
        chkSendCustID.selected = false;
        txtCreditLimit.text="0.00";
    }

    function cboCustomerTypeOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            custDiscType = getCustDiscType();
            txtCustFName.requestFocus();
//            var custDiscType = commonController.CustomerType().toArray();
        }
    }

    function cboCustomerTypeOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        
        custDiscType = getCustDiscType();

    }

    public function custCode(): String {
        
        //CommonController Call
        commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
        var finalCode: String = "";
        finalCode = commonController.getCustId("cust_information", "cust_code", "CC");
    }

    function getCustDiscType(): String[] {
        
        var customerBean:CustomerModel=new CustomerModel();

        var temp: String[] = null;
        var val: String[] = null;

        var s = 0;
        try {
            customerBean.setChkValue("getCustDiscType");
            customerBean=customerController.viewAllRecord(customerBean) as CustomerModel;
            var custList=customerBean.getCustomerinfoList();
            
            for(i in[0..<custList.size()])
            {
                customerBean=custList.get(i) as CustomerModel;
                temp[i] = customerBean.getCustomerType();

                val = temp;
            }
        } catch (e: Exception) {
            var msg: String = "Class : CustomerInformation  Method : getCustDiscType()   = {e.getMessage()}";
            log.debug(msg);
        }
        
        return temp;
    }

    var custTypeId = "";
    var ct = bind cboCustomerType.selectedItem on replace {
        var custDisc = getCustDiscount(cboCustomerType.selectedItem.toString());
        custTypeId = custDisc[0];
        txtDiscountPer.text = custDisc[1];
        txtCustFName.requestFocus();
    }


    function getCustDiscountInfo(cId): String[] {
        
        var customerBean=new CustomerModel();
        var customerAddBean;
        var disc: String[] = "";
        try {
            customerBean.setChkValue("getCustDiscountInfo");
            customerBean.setCusttypeid(cId.toString());
//            var custList:List=new ArrayList();
            var custList=customerController.viewAllRecord(customerBean) as CustomerModel;
            custList.getCustomerinfoList().size();
            customerBean.getCustomerinfoList();
            for(i in[0..<custList.getCustomerinfoList().size()])
            {
                customerAddBean=custList.getCustomerinfoList().get(i) as CustomerModel;
                disc[0] = customerAddBean.getCustomerType();
                disc[1] = customerAddBean.getCustomerPercentage().toString();
            }
        } catch (e: SQLException) {
            var msg: String = "Class : Customer Information  Method : getCustDiscountInfo()   = {e.getMessage()}";
            log.debug(msg);
        }
        return disc;
    }

    public function displayCustomer(name: String): Void {
        
        var customerBean = new CustomerModel();
            customerBean.setChkValue("displayCustomer");
            customerBean.setCustomerName(name);
        var gender1: String;
        try {

            customerController = RegistryFactory.getClientStub(RegistryConstants.Customer) as Customer;
            var customerModel = customerController.viewRecord(name) as CustomerModel;
            txtCustCCode.text = customerModel.getCustomerCode();
            txtCustFName.text = customerModel.getFamilyName();
            txtCustAge.text = customerModel.getAge();
            var custType = getCustDiscountInfo(customerModel.getCusttypeid());
            custDiscType = custType[0] ;
            cboCustomerType.select(0);
            txtDiscountPer.text = custType[1];
            gender1 = customerModel.getGender();
            txtCustAdd1.text = customerModel.getAddress1();
            txtCustAdd2.text = customerModel.getAddress2();
            txtCustAdd3.text = customerModel.getAddress3();
            txtCustCity.text = customerModel.getCity();
            txtCustCountry.text = customerModel.getCountry();
            txtCustState.text = customerModel.getState();
            txtCustPincode.text = customerModel.getPincode();
            txtCustPhone.text = customerModel.getPhoneNumber();
            txtCustMobile.text = customerModel.getMobileNumber();
            txtCustEmail.text = customerModel.getEmailid();
            txtCreditLimit.text = Value.Round(customerModel.getCreditLimit().toString());
            alertItem = customerModel.getAlertType();
            optCustAlert.select(0);
            if (gender1.equalsIgnoreCase("Male")) {
                rdoCustMale.selected = true;
                rdoCustFemale.selected = false;
            } else if (gender1.equals("Female") or gender1.equals("female")) {
                rdoCustMale.selected = false;
                rdoCustFemale.selected = true;
            } else {
                rdoCustMale.selected = false;
                rdoCustFemale.selected = false;
            }
        } catch (e: Exception) {
            var msg: String = "Class : Customer Information  Method : DisplayCustomer()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function clickValid(ch: Integer): Integer {
        var cname = txtCustName.rawText.replaceAll("'", "");
        var age = txtCustAge.rawText.replaceAll("'", "");
        var address1 = txtCustAdd1.rawText.replaceAll("'", "");
        var address2 = txtCustAdd2.rawText.replaceAll("'", "");
        var address3 = txtCustAdd3.rawText.replaceAll("'", "");
        var city = txtCustCity.rawText.replaceAll("'", "");
        var country = txtCustCountry.rawText.replaceAll("'", "");
        var state = txtCustState.rawText.replaceAll("'", "");
        var pin = txtCustPincode.rawText.replaceAll("'", "");
        var phone = txtCustPhone.rawText.replaceAll("'", "");
        var mobile = txtCustMobile.rawText.replaceAll("'", "");
        var mail = txtCustEmail.rawText.replaceAll("'", "");
        var credit = txtCreditLimit.rawText;
        var cnt: Integer = 0;
        var val: Validation = new Validation();
        var chk: Integer = currentState.actual;
        var custType=cboCustomerType.selectedItem;
        if(custType==null or custType.equals("null") or custType.toString().trim().equals("")){
            custType="";
        }

        try {
            var cn: Integer = 0; cn = val.getAlphaNumericValid(cname, 4, 35);
//            var fn: Integer = 0; fn = val.getAlphaNumericValid(fname, 4, 35);
            var cage: Integer = 0; cage = val.getNumberValid(age, 1, 3);
            var adr1: Integer = 0; adr1 = val.getAddressValid(address1, 5, 100);
            var adr2: Integer = 0; adr2 = val.getAddressValid(address2, 5, 100);
            var adr3: Integer = 0; adr3 = val.getAddressValid(address3, 5, 100);
            var cty: Integer = 0; cty = val.getAlphaNumericValid(city, 4, 30);
            var con: Integer = 0; con = val.getCharacterValid(country, 4, 30);
            var ste: Integer = 0; ste = val.getCharacterValid(state, 4, 30);
            var pinc: Integer = 0; pinc = val.getNumberValid(pin, 4, 30);
            var cred: Integer = 0; cred = val.getDecimalValid(credit, 0, 8);

            var ph: Integer = 0; ph = val.getPhoneNoValid(phone, 4, 30);
            var mob: Integer = 0; mob = val.getPhoneNoValid(mobile, 4, 30);
            var em: Integer = 0; em = val.getEmailIdValid(mail, 4, 35);
            var al: Integer = 0; al = optCustAlert.selectedIndex;
            var aheno: Integer = 0;
            def mobNo = commonController.getQueryValue("select count(*) from cust_information where mobile_no != ''  and mobile_no = '{txtCustMobile.rawText.trim()}' ");
            if (cage == 10) {
                aheno = Integer.parseInt(age);
            }
            if (cname.length() <= 0) {
                FXinfo("Please Enter Customer Name.", txtCustName);
            } else if (cn == 1) {
                FXinfo("Customer Name accepts a maximum of 35 characters."); txtCustName.requestFocus();
//            } else if (fn == 0) {
//                FXinfo("Only Alphabets can be entered for Family Name."); txtCustFName.requestFocus();
            } else if (txtCustAge.rawText.length() <= 0) {
                FXinfo("Entered age is Invalid. Please Enter a valid value for Age.", txtCustAge);
            } else if (age.length() > 2) {
                FXinfo("Maximum of two digits can only be entered for Age."); txtCustAge.requestFocus();
            } else if (cage == 0) {
                FXinfo("Only Numeric value can be entered for Age."); txtCustAge.requestFocus();
            } else if (cboCustomerType.selectedItem == null) {
                FXinfo("Please select the Customer Type."); cboCustomerType.requestFocus();
            } else if (aheno < 1) {
                FXinfo("Please enter correct age."); txtCustAge.requestFocus();
            } else if (cred == 0 and credit != "") {
                FXinfo("Only Numeric value can be entered for Credit Limit"); txtCreditLimit.requestFocus();
            } else if (credit.length() > 10) {
                FXinfo("Credit Limit cannot be more than 10 digits"); txtCreditLimit.requestFocus();
            } else if (address1.length() <= 0 and ch == 0) {
                FXinfo("Please Enter Address.", txtCustAdd1);
            } else if (adr1 == 0) {
                FXinfo("Address (Only Characters and Numbers are Allowed)."); txtCustAdd1.requestFocus();
            } else if (adr2 == 0) {
                FXinfo("Address (Only Characters and Numbers are Allowed)."); txtCustAdd2.requestFocus();
            } else if (adr3 == 0) {
                FXinfo("Address (Only Characters and Numbers are Allowed)."); txtCustAdd3.requestFocus();
            } else if (city.length() <= 0) {
                FXinfo("Please Enter City.", txtCustCity);
            } else if (cty == 0) {
                FXinfo("City (Only Characters and Numbers are Allowed)."); txtCustCity.requestFocus();
            } else if (pinc == 0) {
                FXinfo("Only Numeric value can be entered for Pincode."); txtCustPincode.requestFocus();
            } else if (pin != null and pin.length() < 2) {
                FXinfo("Length of Pincode cannot be less than Two Digits."); txtCustPincode.requestFocus();
            } else if (pin != null and pin.length() > 7) {
                FXinfo("Length of Pincode cannot exceed Six Digits."); txtCustPincode.requestFocus();
            } else if (ph == 0) {
                FXinfo("Only Numeric values and [+-] can be entered for Phone number."); txtCustPhone.requestFocus();
            } else if (phone != null and phone.length() < 6) {
                FXinfo("Phone Number length cannot be less than Six Digits."); txtCustPhone.requestFocus();
            } else if (mob == 0) {
                FXinfo("Only Numeric values and [+-] can be entered for Phone number."); txtCustMobile.requestFocus();
            } else if (mobile != null and mobile.length() < 10) {
                FXinfo("Mobile Number length cannot be less than Ten Digits."); txtCustMobile.requestFocus();
            } else if (em == 0) {
                FXinfo("Please Enter Valid Email ID."); txtCustEmail.requestFocus();
            } else if(custType.toString().trim().length()<=0) {
                  FXinfo("Please Select Customer Type.");
             }else if(mobNo != "0"){
                FXinfo("This mobile number already exists.");
                txtCustMobile.requestFocus();
            } else {
                cnt = 10;
            }
        } catch (e: Exception) {
            var msg: String = "Class : CustomerInformation  Method : ClickValid()   = {e.getMessage()}";
            log.debug(msg);
        }
        return cnt;
    }

    function mandatory(): Void {
        
        txtCustName.style = mandatoryStyle;
        txtCustCity.style = mandatoryStyle;
        txtCustAge.style = mandatoryStyle;
        txtCustAdd1.style = mandatoryStyle;
        if (currentState.actual == 0) {
            txtCustAdd1.style = mandatoryStyle;
        }
    }

    public function getPrivileges(u: String): Void {
        
        var uname = u;
        //CommonController Call
        commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
        var utype = commonController.getUserType(uname);
        if (utype.equals("User")) {

            var priv = commonController.getPrivileges("crm", uname);
            var ss = priv.split(",");
            var val = Integer.parseInt(ss[0]);
            if (val == 1) {
                btnCustSave.disable = true;
                if (btnCustEdit.text != "Edit [F6]") {
                    btnCustEdit.disable = true;
                } else {
                    btnCustEdit.disable = false;
                }
            } else if (val == 2) {
                if (btnCustEdit.text != "Edit [F6]") {
                    btnCustEdit.disable = true;
                } else {
                    btnCustEdit.disable = false;
                }
                btnCustSave.disable = false;
            //This code for  READ and WRITE Access
            } else if (val == 3) {
                btnCustSave.disable = false;
                btnCustEdit.disable = false;
            //This code for FULL Access
            }
        } else {
            btnCustSave.disable = false;
            btnCustEdit.disable = false;
        }
    }

    var logUser: String = bind CommonDeclare.user on replace {
        getPrivileges(logUser);
    }
    var changPiv = bind btnCustSave.text on replace {
        getPrivileges(logUser);
    }
    var changPiv1 = bind btnCustEdit.text on replace {
        getPrivileges(logUser);
    }

    public function FromSales(): Void {
        
        currentState.actual = currentState.findIndex("FromSales");
        checkState = 1;
        StartUp();
    }

    public function StartUp(): Void {
       
        panel.visible = true;
        optCustAlert.select(0);
        reset();
        panel.content = [rectangle, rectHeader, label, separator, label14, label2, label3, label4, label5, label6, label7, label8, label9, label10, label11, label12, label13, lblCreditLimit, panelButtons, txtCustName, txtCustCCode, txtCustFName, txtCreditLimit, rdoCustMale, rdoCustFemale, txtCustAge, txtCustAdd1, txtCustAdd2, txtCustCity, txtCustPhone, txtCustEmail, txtCustPincode, txtCustCountry, txtCustState, optCustAlert, txtCustAdd3, separator2, label15, label16, label1, txtCustMobile, chkSendCustID, panelMsgBox, imageCustDown, imageCountryDown, imageStateDown, cboCustomerType,  labelCustomerType, txtDiscountPer , discPrec,rectPatientDetails,lblPatientDetails,listViewCustomer, panelAlert];
        txtCustCCode.editable = false;
        txtCustCCode.requestFocus();
        mandatory();
        srCode = custCode();
        if (srCode == "") {
            srCode = "CC0000001";
        }
        txtCustCCode.text = srCode;
        if (checkState == 0) {
            currentState.actual = currentState.findIndex("Shown");
        }
        getPrivileges(logUser);
        txtCustName.requestFocus();
    }

}
