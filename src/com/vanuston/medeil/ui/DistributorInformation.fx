package com.vanuston.medeil.ui;

import java.lang.*;
import javafx.scene.input.*;
import com.vanuston.medeil.util.Validation;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.util.Logger;
import javafx.scene.control.TextBox;
import com.vanuston.medeil.util.KeyRegistry;
import com.vanuston.medeil.model.DistributorModel;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.implementation.Distributor;
import com.vanuston.medeil.uitables.ConfirmDialogBox;

public class DistributorInformation {
var commonController : CommonImplements ;//= RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements ;
var  distributorController : Distributor ;//= RegistryFactory.getClientStub(RegistryConstants.Distributor) as Distributor ;

    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 0.25
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "rectFormHeader"
        width: bind panelW
        height: 32.0
    }
    
    def __layoutInfo_separator: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
        height: 0.0
    }
    public-read def separator: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: 30.0
        layoutY: 115.0
        layoutInfo: __layoutInfo_separator
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
    
    public-read def imageCountryDown: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C2LX+Type2TextboxW-2
        layoutY: 296.0
        onMouseClicked: imageCountryDownOnMouseClicked
    }
    
    public-read def imageStateDown: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C2LX+Type2TextboxW-2
        layoutY: 424.0
        onMouseClicked: imageStateDownOnMouseClicked
    }
    
    def __layoutInfo_separator2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
        height: 3.0
    }
    public-read def separator2: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: 30.0
        layoutY: 275.0
        layoutInfo: __layoutInfo_separator2
    }
    
    def __layoutInfo_txtMastersdistrCNo2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtMastersdistrCNo2: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 318.0
        layoutInfo: __layoutInfo_txtMastersdistrCNo2
        onKeyPressed: txtMastersdistrCNo2OnKeyPressed
    }
    
    def __layoutInfo_txtMastersdistrSpeciality: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtMastersdistrSpeciality: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 213.0
        layoutInfo: __layoutInfo_txtMastersdistrSpeciality
        onKeyPressed: txtMastersdistrSpecialityOnKeyPressed
    }
    
    def __layoutInfo_txtMastersdistrTIN: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtMastersdistrTIN: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 130.0
        layoutInfo: __layoutInfo_txtMastersdistrTIN
        onKeyPressed: txtMastersdistrTINOnKeyPressed
    }
    
    def __layoutInfo_txtMastersdistrDL: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtMastersdistrDL: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 186.0
        layoutInfo: __layoutInfo_txtMastersdistrDL
        onKeyPressed: txtMastersdistrDLOnKeyPressed
    }
    
    def __layoutInfo_txtMastersdistrCreditDays: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtMastersdistrCreditDays: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 214.0
        layoutInfo: __layoutInfo_txtMastersdistrCreditDays
        onKeyPressed: txtMastersdistrCreditDaysOnKeyPressed
    }
    
    def __layoutInfo_txtMastersdistrFax: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtMastersdistrFax: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 374.0
        layoutInfo: __layoutInfo_txtMastersdistrFax
        onKeyPressed: txtMastersdistrFaxOnKeyPressed
    }
    
    def __layoutInfo_listDistributor: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listDistributor: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C2LX
        layoutY: bind listLayoutY
        layoutInfo: __layoutInfo_listDistributor
        onKeyPressed: listDistributorOnKeyPressed
        items: null
    }
    
    public-read def imageDistDown: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C2LX+Type1TextboxW-2
        layoutY: 213.0
        onMouseClicked: imageDistDownOnMouseClicked
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
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
    
    def __layoutInfo_txtMastersdistrWeb: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtMastersdistrWeb: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 430.0
        layoutInfo: __layoutInfo_txtMastersdistrWeb
        onKeyPressed: txtMastersdistrWebOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtMastersdistrEmail: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtMastersdistrEmail: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 402.0
        layoutInfo: __layoutInfo_txtMastersdistrEmail
        onKeyPressed: txtMastersdistrEmailOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtMastersdistrDName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
        hfill: false
    }
    public-read def txtMastersdistrDName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 158.0
        layoutInfo: __layoutInfo_txtMastersdistrDName
        style: ""
        styleClass: "text-box"
        onKeyPressed: txtMastersdistrDNameOnKeyPressed
        onKeyReleased: txtMastersdistrDNameOnKeyReleased
        effect: null
        text: ""
        font: Arial_12
    }
    
    def __layoutInfo_txtMastersdistrState: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtMastersdistrState: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 430.0
        layoutInfo: __layoutInfo_txtMastersdistrState
        onKeyPressed: txtMastersdistrStateOnKeyPressed
        onKeyReleased: txtMastersdistrStateOnKeyReleased
        font: Arial_12
    }
    
    def __layoutInfo_txtMastersdistrCountry: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtMastersdistrCountry: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 402.0
        layoutInfo: __layoutInfo_txtMastersdistrCountry
        onKeyPressed: txtMastersdistrCountryOnKeyPressed
        onKeyReleased: txtMastersdistrCountryOnKeyReleased
        font: Arial_12
    }
    
    def __layoutInfo_txtMastersdistrPin: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtMastersdistrPin: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 458.0
        layoutInfo: __layoutInfo_txtMastersdistrPin
        onKeyPressed: txtMastersdistrPinOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtMastersdistrMob: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtMastersdistrMob: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 346.0
        layoutInfo: __layoutInfo_txtMastersdistrMob
        onKeyPressed: txtMastersdistrMobOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtMastersdistrCNo1: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtMastersdistrCNo1: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 290.0
        layoutInfo: __layoutInfo_txtMastersdistrCNo1
        onKeyPressed: txtMastersdistrCNo1OnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtMastersdistrCity: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtMastersdistrCity: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        managed: true
        layoutX: bind C2LX
        layoutY: 374.0
        layoutInfo: __layoutInfo_txtMastersdistrCity
        onKeyPressed: txtMastersdistrCityOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtMastersdistrAdd3: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtMastersdistrAdd3: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 346.0
        layoutInfo: __layoutInfo_txtMastersdistrAdd3
        onKeyPressed: txtMastersdistrAdd3OnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtMastersdistrAdd2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtMastersdistrAdd2: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 318.0
        layoutInfo: __layoutInfo_txtMastersdistrAdd2
        onKeyPressed: txtMastersdistrAdd2OnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtMastersdistrAdd1: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtMastersdistrAdd1: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 290.0
        layoutInfo: __layoutInfo_txtMastersdistrAdd1
        onKeyPressed: txtMastersdistrAdd1OnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtMastersdistrCST: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtMastersdistrCST: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 158.0
        layoutInfo: __layoutInfo_txtMastersdistrCST
        onKeyPressed: txtMastersdistrCSTOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtMastersdistrOName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtMastersdistrOName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 186.0
        layoutInfo: __layoutInfo_txtMastersdistrOName
        onKeyPressed: txtMastersdistrONameOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtMastersdistrDCode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtMastersdistrDCode: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 130.0
        layoutInfo: __layoutInfo_txtMastersdistrDCode
        onKeyPressed: txtMastersdistrDCodeOnKeyPressed
        text: ""
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
    
    def __layoutInfo_btnMastersdistrCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind CancelW
        height: bind bottonH
    }
    public-read def btnMastersdistrCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton4LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnMastersdistrCancel
        onKeyReleased: btnMastersdistrCancelOnKeyReleased
        effect: reflectionEffect
        graphic: imgCancel
        text: "Cancel [Esc]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnMastersdistrReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnMastersdistrReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton3LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnMastersdistrReset
        onKeyReleased: btnMastersdistrResetOnKeyReleased
        effect: reflectionEffect
        graphic: imageView3
        text: "Reset [F5]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnMastersdistrEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnMastersdistrEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton2LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnMastersdistrEdit
        onKeyReleased: btnMastersdistrEditOnKeyReleased
        effect: reflectionEffect
        graphic: imgEdit
        text: "Edit  [F4]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnMastersdistrSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnMastersdistrSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnMastersdistrSave
        onKeyReleased: btnMastersdistrSaveOnKeyReleased
        translateX: 0.0
        effect: reflectionEffect
        graphic: imageView
        text: "Save  [F2]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    public-read def panelButtons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: bind panelButtonsLY
        content: [ btnMastersdistrSave, btnMastersdistrEdit, btnMastersdistrReset, btnMastersdistrCancel, ]
    }
    
    public-read def toggleGroup: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def Arial_25: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
        size: 25.0
    }
    
    def __layoutInfo_label: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
    }
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 1.0
        layoutInfo: __layoutInfo_label
        effect: null
        text: "Distributor Information"
        font: Arial_25
        hpos: javafx.geometry.HPos.CENTER
    }
    
    public-read def DarkGray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.2
        blue: 0.2
    }
    
    public-read def label21: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 430.0
        text: "Website"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label20: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 402.0
        text: "Email"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label19: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 214.0
        text: "Credit days  "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label18: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 186.0
        text: "D.L Number "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label17: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 213.0
        text: "Authorized Distributor"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label1: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 318.0
        text: "Contact No 2"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label14: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 130.0
        text: "Distributor Code"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label13: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 346.0
        text: "Mobile No."
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label12: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 430.0
        text: "State "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label11: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 402.0
        text: "Country "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label10: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 374.0
        text: "City "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 130.0
        text: "TIN Number "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label8: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 186.0
        text: "Owner Name "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 374.0
        text: "Fax No."
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label6: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 290.0
        text: "Contact No. 1"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 458.0
        text: "Pincode "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 290.0
        text: "Address "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 158.0
        text: "C.S.T. No."
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 158.0
        styleClass: "label"
        text: "Distriubutor Name "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        opacity: 1.0
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "form-background"
        onMouseClicked: rectangleOnMouseClicked
        fill: linearGradient
        stroke: DarkGray
        width: bind panelW
        height: bind panelH
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.4
    }
    
    public-read def label16: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 34.0
        layoutY: 249.0
        text: "Contact Details"
        font: Arial_18
        textFill: Green
    }
    
    public-read def label15: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 35.0
        layoutY: 91.0
        text: "General Details"
        font: Arial_18
        textFill: Green
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ rectangle, rectHeader, label, separator, label2, label3, label4, label5, label6, label7, label8, label9, label10, label11, label12, label13, panelButtons, txtMastersdistrDCode, label14, txtMastersdistrOName, txtMastersdistrCST, txtMastersdistrAdd1, txtMastersdistrAdd2, txtMastersdistrAdd3, txtMastersdistrCity, txtMastersdistrCNo1, txtMastersdistrMob, txtMastersdistrPin, txtMastersdistrCountry, imageCountryDown, txtMastersdistrState, imageStateDown, txtMastersdistrDName, separator2, label15, label16, label1, txtMastersdistrCNo2, txtMastersdistrSpeciality, label17, label18, label19, txtMastersdistrTIN, txtMastersdistrDL, txtMastersdistrCreditDays, label20, txtMastersdistrFax, txtMastersdistrEmail, label21, txtMastersdistrWeb, listDistributor, imageDistDown, panelAlert, ]
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
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
    
    public-read def linearGradientHeader: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
    }
    
    public-read def imageBack: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/arrow_Left.png"
    }
    
    public-read def imageDown: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "Shown", "FromPurchase", ]
        actual: 1
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectangle.visible = true;
                            rectangle.blocksMouse = true;
                            rectangle.strokeWidth = 1.0;
                            rectangle.arcWidth = 5.0;
                            rectangle.arcHeight = 5.0;
                            rectHeader.visible = true;
                            rectHeader.fill = linearGradientHeader;
                            rectHeader.strokeWidth = 0.0;
                            label.layoutX = 0.0;
                            label.text = "Distributor Details - alt+S";
                            __layoutInfo_separator.height = 5.0;
                            label2.layoutY = 158.0;
                            label4.text = "Address ";
                            label8.layoutY = 185.0;
                            label9.text = "TIN No.";
                            label10.text = "City ";
                            imageView.visible = true;
                            imageView.image = imageSave;
                            btnMastersdistrSave.visible = true;
                            btnMastersdistrSave.layoutY = 0.0;
                            btnMastersdistrSave.text = "Save [F3]";
                            btnMastersdistrSave.action = btnMastersdistrSaveActionAtShown;
                            imgEdit.visible = true;
                            imgEdit.image = imageEdit;
                            btnMastersdistrEdit.visible = true;
                            btnMastersdistrEdit.layoutY = 0.0;
                            btnMastersdistrEdit.text = "Edit [F6]";
                            btnMastersdistrEdit.action = btnMastersdistrEditActionAtShown;
                            imageView3.visible = true;
                            imageView3.image = imageReset;
                            btnMastersdistrReset.visible = true;
                            btnMastersdistrReset.layoutY = 0.0;
                            btnMastersdistrReset.text = "Reset [F4]";
                            btnMastersdistrReset.action = btnMastersdistrResetActionAtShown;
                            imgCancel.visible = true;
                            imgCancel.image = imageCancel;
                            btnMastersdistrCancel.visible = true;
                            btnMastersdistrCancel.layoutY = 0.0;
                            btnMastersdistrCancel.text = "Cancel [F8]";
                            btnMastersdistrCancel.action = btnMastersdistrCancelActionAtShown;
                            panelButtons.visible = true;
                            txtMastersdistrDCode.styleClass = "Borderless-text-box";
                            txtMastersdistrDCode.font = Arial_Bold_14;
                            txtMastersdistrPin.promptText = "";
                            imageCountryDown.visible = true;
                            imageCountryDown.layoutY = 402.0;
                            imageCountryDown.blocksMouse = true;
                            imageCountryDown.image = imageDown;
                            imageStateDown.visible = true;
                            imageStateDown.layoutY = 430.0;
                            imageStateDown.blocksMouse = true;
                            imageStateDown.image = imageDown;
                            __layoutInfo_separator2.height = 5.0;
                            label1.text = "Contact No. 2";
                            txtMastersdistrCNo2.font = Arial_12;
                            txtMastersdistrSpeciality.opacity = 1.0;
                            txtMastersdistrSpeciality.focusTraversable = true;
                            txtMastersdistrSpeciality.font = Arial_12;
                            label17.text = "Authorized Distributor";
                            label18.text = "D.L. No.";
                            txtMastersdistrTIN.text = "";
                            txtMastersdistrTIN.font = Arial_12;
                            txtMastersdistrDL.font = Arial_12;
                            txtMastersdistrCreditDays.font = Arial_12;
                            txtMastersdistrFax.font = Arial_12;
                            listDistributor.visible = false;
                            imageDistDown.visible = false;
                            imageDistDown.layoutY = 158.0;
                            imageDistDown.blocksMouse = true;
                            imageDistDown.image = imageDown;
                            panelAlert.visible = true;
                            panel.visible = true;
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
                            rectangle.blocksMouse = false;
                            rectangle.strokeWidth = 1.0;
                            rectangle.arcWidth = 0.0;
                            rectangle.arcHeight = 0.0;
                            rectHeader.visible = true;
                            rectHeader.fill = javafx.scene.paint.Color.BLACK;
                            rectHeader.strokeWidth = 1.0;
                            label.layoutX = 0.0;
                            label.text = "Distributor Details - alt+S";
                            __layoutInfo_separator.height = 0.0;
                            label2.layoutY = 158.0;
                            label4.text = "Address ";
                            label8.layoutY = 185.0;
                            label9.text = "TIN Number ";
                            label10.text = "City ";
                            imageView.visible = false;
                            imageView.image = null;
                            btnMastersdistrSave.visible = false;
                            btnMastersdistrSave.layoutY = 525.0;
                            btnMastersdistrSave.text = "Save [F2]";
                            btnMastersdistrSave.action = btnMastersdistrSaveActionAtShown;
                            imgEdit.visible = false;
                            imgEdit.image = null;
                            btnMastersdistrEdit.visible = false;
                            btnMastersdistrEdit.layoutY = 525.0;
                            btnMastersdistrEdit.text = "Edit [F4]";
                            btnMastersdistrEdit.action = btnMastersdistrEditActionAtShown;
                            imageView3.visible = false;
                            imageView3.image = null;
                            btnMastersdistrReset.visible = false;
                            btnMastersdistrReset.layoutY = 525.0;
                            btnMastersdistrReset.text = "Reset [F5]";
                            btnMastersdistrReset.action = btnMastersdistrResetActionAtShown;
                            imgCancel.visible = false;
                            imgCancel.image = null;
                            btnMastersdistrCancel.visible = false;
                            btnMastersdistrCancel.layoutY = 525.0;
                            btnMastersdistrCancel.text = "Cancel [Ctrl+C]";
                            btnMastersdistrCancel.action = btnMastersdistrCancelActionAtShown;
                            panelButtons.visible = false;
                            txtMastersdistrDCode.styleClass = "text-box";
                            txtMastersdistrDCode.font = Arial_12;
                            txtMastersdistrPin.promptText = null;
                            imageCountryDown.visible = false;
                            imageCountryDown.layoutY = 296.0;
                            imageCountryDown.blocksMouse = false;
                            imageCountryDown.image = null;
                            imageStateDown.visible = false;
                            imageStateDown.layoutY = 424.0;
                            imageStateDown.blocksMouse = false;
                            imageStateDown.image = null;
                            __layoutInfo_separator2.height = 3.0;
                            label1.text = "Contact No 2";
                            txtMastersdistrSpeciality.opacity = 1.0;
                            txtMastersdistrSpeciality.focusTraversable = true;
                            label17.text = "Authorized Distributor";
                            label18.text = "D.L Number ";
                            txtMastersdistrTIN.text = null;
                            listDistributor.visible = false;
                            imageDistDown.visible = false;
                            imageDistDown.layoutY = 213.0;
                            imageDistDown.blocksMouse = false;
                            imageDistDown.image = null;
                            panelAlert.visible = false;
                            panel.visible = true;
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

    function btnMastersdistrCancelOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            btnMastersdistrCancelActionAtShown();
        } else { shortcut(event); }
    }

    function btnMastersdistrResetOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            btnMastersdistrResetActionAtShown();
        } else { shortcut(event); }
    }

    function btnMastersdistrEditOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            btnMastersdistrEditActionAtShown();
        } else { shortcut(event); }

    }

    function btnMastersdistrSaveOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            btnMastersdistrSaveActionAtShown();
        } else { shortcut(event); }
    }

    function imageStateDownOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if(not listDistributor.visible){
            getState(0);
        }
        else{
            listDistributor.visible = false;
            txtMastersdistrState.requestFocus();
        }
    }

    function imageCountryDownOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if(not listDistributor.visible){
            getCountry(0);
       }
       else{
           listDistributor.visible = false;
           txtMastersdistrCountry.requestFocus();
       }
    }

    function imageDistDownOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        getDist(0);
    }


    var srCode: String;
    var listLayoutY: Float;
    var listH = 0.0;
    public var tempDistName: String = "";
    public var tempDistCode: String = "";
    public var tempDistDLNo: String = "";
    public var tempDistTinNo: String = "";
    public var tempDistAdd: String = "";
    public var isSave = 0; //: String = "";
    public var checkState = 0;
    public var checkVal = 1;
    public var isBack = false;
    var log: Logger = Logger.getLogger(DistributorInformation.class, "Masters");

    function rectangleOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        listDistributor.visible = false;
    }

    var panelW = bind CommonDeclare.panelFormW on replace {
        listDistributor.visible = false;
    }
    var panelH = bind CommonDeclare.panelFormH;
    var listW = 0.0;
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var C1LX = bind CommonDeclare.Column1LX;
    var C2LX = bind CommonDeclare.Column2LX + 25.0;
    var C3LX = bind CommonDeclare.Column3LX + 25.0;
    var C4LX = bind CommonDeclare.Column4LX + 25.0;
    var botton1LX = bind CommonDeclare.botton1LX;
    var botton2LX = bind CommonDeclare.botton2LX;
    var botton3LX = bind CommonDeclare.botton3LX;
    var botton4LX = bind CommonDeclare.botton4LX;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    var bottonW = bind CommonDeclare.bottonW;
    var CancelW = bottonW;
    var bottonH = bind CommonDeclare.bottonH;
    var seperatorW = bind CommonDeclare.seperatorW;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;//200
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;//150
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;//100
    var Type4TextboxW = bind CommonDeclare.Type4TextboxW;//50
    var Type5TextboxW = bind (3.811944091 * panelW / 100);//30
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    var mandatoryStyle: String = CommonDeclare.textbox_mandatory();
    var errorStyle: String = CommonDeclare.textbox_error();
    def CustomAlert = CustomAlert {};

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Distributor Information", type);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Distributor Information", msg);
        showAlertbox();
    }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Distributor Information", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = errorStyle;
    }

    function FXinfo1(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Distributor Information", msg);
        showAlertbox();
        err_txtbox.requestFocus();
    }

    def kr = KeyRegistry {};
    var ss = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 4 and CommonDeclare.form[3] == 4) {
            shortcut(ss);
        }
        if (CommonDeclare.currModule == 3 and CommonDeclare.form[2] == 2 and currentState.actual == currentState.findIndex("FromPurchase")) {
            shortcut(ss);
        }
    }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {
         if (event.controlDown or event.altDown or event.shiftDown) {
            kr.actionKey = event.code;
        }

        if (currentState.actual == currentState.findIndex("FromPurchase")) {
            if (event.code == kr.save) {
                save(1);
            }
            if (event.code == kr.reset) {
                reset();
            }
            if (event.controlDown and event.code == kr.back) {
                {
                    isBack = not isBack;
                }
            }
        } else {
            if (event.code == kr.save and btnMastersdistrSave.text == "Save [F3]" and not btnMastersdistrSave.disable) {
                save(0);
            }
            if (event.code == kr.edit and btnMastersdistrEdit.text == "Edit [F6]" and not btnMastersdistrEdit.disable) {
                edit();
            }
            if (event.code == kr.reset and btnMastersdistrReset.text == "Reset [F4]") {
                reset();
            }
            if (event.code == kr.update and btnMastersdistrSave.disable == false) {
                if (btnMastersdistrSave.text == "Update [F7]" and not btnMastersdistrSave.disable) { update(); }
            }
            if (event.code == kr.del and btnMastersdistrEdit.disable == false and not btnMastersdistrEdit.disable) {
                if (btnMastersdistrEdit.text == "Delete [F5]") { del(); }
            }
            if (event.controlDown and event.code == kr.back) {
                if (btnMastersdistrCancel.text == "Back [Ctrl+Left]") { back(); }
            }
            if (event.code == kr.cancel) {
                if (btnMastersdistrCancel.text == "Cancel [F8]") { cancel(); }
            }
        }
    }

    function txtMastersdistrStateOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        txtMastersdistrState.style = "";
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            var i: Boolean = false;
            //CommonController Call
            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements ;
            i=commonController.selectState(txtMastersdistrCountry.rawText, txtMastersdistrState.rawText);
            if (i==false) {
                txtMastersdistrState.requestFocus();
                txtMastersdistrState.text = "";
            } else {
                txtMastersdistrPin.requestFocus();
            }
        }
    }

    function txtMastersdistrCountryOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        txtMastersdistrCountry.style = "";
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            var i: Boolean = false;
            //CommonController Call
            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements ;
            i=commonController.selectCountry(txtMastersdistrCountry.rawText);
            if (i == false) {
                txtMastersdistrCountry.requestFocus();
                txtMastersdistrCountry.text = "";
            } else {
                txtMastersdistrState.requestFocus();
            }
        }
    }

    function txtMastersdistrWebOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {

        listDistributor.visible = false;
        txtMastersdistrWeb.style = "";
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { btnMastersdistrSave.requestFocus(); }
        shortcut(event);
    }

    function txtMastersdistrEmailOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {

        listDistributor.visible = false;
        txtMastersdistrEmail.style = "";
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtMastersdistrWeb.requestFocus(); }
        shortcut(event);
    }

    function txtMastersdistrFaxOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {

        listDistributor.visible = false;
        txtMastersdistrFax.style = "";
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtMastersdistrEmail.requestFocus(); }
        shortcut(event);
    }

    function txtMastersdistrMobOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {

        listDistributor.visible = false;
        txtMastersdistrMob.style = "";
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtMastersdistrFax.requestFocus(); }
        shortcut(event);
    }

    function txtMastersdistrCNo2OnKeyPressed(event: javafx.scene.input.KeyEvent): Void {

        listDistributor.visible = false;
        txtMastersdistrCNo2.style = "";
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtMastersdistrMob.requestFocus(); }
        shortcut(event);
    }

    function txtMastersdistrCNo1OnKeyPressed(event: javafx.scene.input.KeyEvent): Void {

        listDistributor.visible = false;
        txtMastersdistrCNo1.style = "";
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtMastersdistrCNo2.requestFocus(); }
        shortcut(event);
    }

    function txtMastersdistrPinOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {

        listDistributor.visible = false;
        txtMastersdistrPin.style = "";
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtMastersdistrCNo1.requestFocus(); }
        shortcut(event);
    }

    function txtMastersdistrCityOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {

        listDistributor.visible = false;
        txtMastersdistrCity.style = mandatoryStyle;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtMastersdistrCountry.requestFocus(); }
        shortcut(event);
    }

    function txtMastersdistrAdd3OnKeyPressed(event: javafx.scene.input.KeyEvent): Void {

        listDistributor.visible = false;
        txtMastersdistrAdd3.style = "";
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtMastersdistrCity.requestFocus(); }
        shortcut(event);
    }

    function txtMastersdistrAdd2OnKeyPressed(event: javafx.scene.input.KeyEvent): Void {

        listDistributor.visible = false;
        txtMastersdistrAdd2.style = "";
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtMastersdistrAdd3.requestFocus(); }
        shortcut(event);
    }

    function txtMastersdistrAdd1OnKeyPressed(event: javafx.scene.input.KeyEvent): Void {

        listDistributor.visible = false;
        txtMastersdistrAdd1.style = mandatoryStyle;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtMastersdistrAdd2.requestFocus(); }
        shortcut(event);
    }

    function txtMastersdistrCreditDaysOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {

        listDistributor.visible = false;
        txtMastersdistrCreditDays.style = "";
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtMastersdistrAdd1.requestFocus(); }
        shortcut(event);
    }

    function txtMastersdistrDLOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {

        listDistributor.visible = false;
        txtMastersdistrDL.style = "";
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtMastersdistrCreditDays.requestFocus(); }
        shortcut(event);
    }

    function txtMastersdistrCSTOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {

        listDistributor.visible = false;
        txtMastersdistrCST.style = "";
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtMastersdistrDL.requestFocus(); }
        shortcut(event);
    }

    function txtMastersdistrTINOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {

        listDistributor.visible = false;
        txtMastersdistrTIN.style = mandatoryStyle;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtMastersdistrCST.requestFocus(); }
        shortcut(event);
    }

    function txtMastersdistrSpecialityOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {

        listDistributor.visible = false;
        txtMastersdistrSpeciality.style = "";
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtMastersdistrTIN.requestFocus(); }
        shortcut(event);
    }

    function txtMastersdistrONameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {

        listDistributor.visible = false;
        txtMastersdistrOName.style = "";
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtMastersdistrSpeciality.requestFocus(); }
        shortcut(event);
    }

    function txtMastersdistrDNameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {

        txtMastersdistrDName.style = mandatoryStyle;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            //DistributorController Call
            var distributorModel : DistributorModel =new DistributorModel();
            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements ;
            if (commonController.selectDistributor (txtMastersdistrDName.rawText) and btnMastersdistrSave.text == "Update [F7]") {
                txtMastersdistrDName.requestFocus();
                txtMastersdistrDName.text = "";
            } else {
                listDistributor.visible = false;
                txtMastersdistrOName.requestFocus();
            }
        }
        shortcut(event);
    }

    function txtMastersdistrDCodeOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {

        txtMastersdistrDCode.style = "";
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtMastersdistrDName.requestFocus(); }
        shortcut(event);
    }

    function btnMastersdistrCancelActionAtShown(): Void {
        cancel();
    }

    function btnMastersdistrResetActionAtShown(): Void {

        reset();
    }

    function btnMastersdistrEditActionAtShown(): Void {

        if (btnMastersdistrEdit.text == "Delete [F5]") {
            del();
        } else {
            edit();
        }
    }

    function btnMastersdistrSaveActionAtShown(): Void {
        if (btnMastersdistrSave.text == "Update [F7]") {
            update();
        } else {
            save(0);
        }
    }
    public function save(chk: Integer): Integer {

        var retVal: Integer = 1;
        try {
            var isExist: Boolean = false;
            //Controller Instance
            var distributorModel : DistributorModel =new DistributorModel();
            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements ;
            isExist = commonController.selectDistributor (txtMastersdistrDName.text);
            if (not isExist) {

                var san: Integer = 0;
                san = clickValid(chk);
                if (san == 10) {
                    distributorModel.setDistributorCode(txtMastersdistrDCode.rawText.replaceAll("'", ""));
                    distributorModel.setDistributorName(txtMastersdistrDName.rawText.replaceAll("'", "").trim());
                    distributorModel.setOwnerName(txtMastersdistrOName.rawText.replaceAll("'", ""));
                    distributorModel.setAuthorizedDistributor(txtMastersdistrSpeciality.rawText.replaceAll("'", ""));
                    distributorModel.setTINNumber(txtMastersdistrTIN.rawText.replaceAll("'", ""));
                    distributorModel.setCSTNumber(txtMastersdistrCST.rawText.replaceAll("'", ""));
                    distributorModel.setDLNumber(txtMastersdistrDL.rawText.replaceAll("'", ""));
                    distributorModel.setCreditDays(txtMastersdistrCreditDays.rawText.replaceAll("'", ""));
                    distributorModel.setAddress1(txtMastersdistrAdd1.rawText.replaceAll("'", ""));
                    distributorModel.setAddress2(txtMastersdistrAdd2.rawText.replaceAll("'", ""));
                    distributorModel.setAddress3(txtMastersdistrAdd3.rawText.replaceAll("'", ""));
                    distributorModel.setCity(txtMastersdistrCity.rawText.replaceAll("'", ""));
                    distributorModel.setCountry(txtMastersdistrCountry.rawText.replaceAll("'", ""));
                    distributorModel.setState(txtMastersdistrState.rawText.replaceAll("'", ""));
                    distributorModel.setPincode(txtMastersdistrPin.rawText.replaceAll("'", ""));
                    distributorModel.setContactNumber1(txtMastersdistrCNo1.rawText.replaceAll("'", ""));
                    distributorModel.setContactNumber2(txtMastersdistrCNo2.rawText.replaceAll("'", ""));
                    distributorModel.setFaxNumber(txtMastersdistrFax.rawText.replaceAll("'", ""));
                    distributorModel.setMobileNumber(txtMastersdistrMob.rawText.replaceAll("'", ""));
                    distributorModel.setEmailid(txtMastersdistrEmail.rawText.replaceAll("'", ""));
                    distributorModel.setWebsite(txtMastersdistrWeb.rawText.replaceAll("'", ""));
                    //DistributorController Call
                    distributorController = RegistryFactory.getClientStub(RegistryConstants.Distributor) as Distributor ;
                    var status : Object=distributorController.createRecord(distributorModel);
                    var statusinfo : String="is Created  :";
                    statusinfo.concat(status.toString());
                    FXinfo(statusinfo);
                    txtMastersdistrDName.requestFocus();
                    if(status.equals(true)) {
                        retVal=1;
                    }
                    //CommonController Call
                    commonController.updateLog("DistributorInformation",btnMastersdistrSave.text);
                    FXalert(0);
                    txtMastersdistrDCode.requestFocus();
                    checkVal = 1;
                    srCode = distCode();
                    if (srCode == "") {
                        srCode = "DC0000001";
                    }
                    txtMastersdistrDCode.text = srCode;
                    tempDistName = distributorModel.getDistributorName();
                    tempDistCode = distributorModel.getDistributorCode();
                    tempDistDLNo = distributorModel.getDLNumber();
                    tempDistTinNo = distributorModel.getTINNumber();
                    tempDistAdd = distributorModel.getCity();

                    clear();
                    isSave = Math.abs(new java.util.Random().nextInt() mod 100);
                    retVal = 0;
                }
            } else {
                FXinfo("Distributor Name exists already!");
                txtMastersdistrDName.requestFocus();
            }
        } catch (e: Exception) {
            var msg: String = "Class : Distributor Information  Method : Save()   = {e.getMessage()}";
            log.debug(msg);
        }
        return retVal;
    }
    public function update(): Void {
        try {
            //DistributorController Call
            var distributorModel : DistributorModel =new DistributorModel();
            var san: Integer = 0;
            san = clickValid(0);
            if (san == 10) {
                    distributorModel.setDistributorCode(txtMastersdistrDCode.rawText.replaceAll("'", ""));
                    distributorModel.setDistributorName(txtMastersdistrDName.rawText.replaceAll("'", ""));
                    distributorModel.setOwnerName(txtMastersdistrOName.rawText.replaceAll("'", ""));
                    distributorModel.setAuthorizedDistributor(txtMastersdistrSpeciality.rawText.replaceAll("'", ""));
                    distributorModel.setTINNumber(txtMastersdistrTIN.rawText.replaceAll("'", ""));
                    distributorModel.setCSTNumber(txtMastersdistrCST.rawText.replaceAll("'", ""));
                    distributorModel.setDLNumber(txtMastersdistrDL.rawText.replaceAll("'", ""));
                    distributorModel.setCreditDays(txtMastersdistrCreditDays.rawText.replaceAll("'", ""));
                    distributorModel.setAddress1(txtMastersdistrAdd1.rawText.replaceAll("'", ""));
                    distributorModel.setAddress2(txtMastersdistrAdd2.rawText.replaceAll("'", ""));
                    distributorModel.setAddress3(txtMastersdistrAdd3.rawText.replaceAll("'", ""));
                    distributorModel.setCity(txtMastersdistrCity.rawText.replaceAll("'", ""));
                    distributorModel.setCountry(txtMastersdistrCountry.rawText.replaceAll("'", ""));
                    distributorModel.setState(txtMastersdistrState.rawText.replaceAll("'", ""));
                    distributorModel.setPincode(txtMastersdistrPin.rawText.replaceAll("'", ""));
                    distributorModel.setContactNumber1(txtMastersdistrCNo1.rawText.replaceAll("'", ""));
                    distributorModel.setContactNumber2(txtMastersdistrCNo2.rawText.replaceAll("'", ""));
                    distributorModel.setFaxNumber(txtMastersdistrFax.rawText.replaceAll("'", ""));
                    distributorModel.setMobileNumber(txtMastersdistrMob.rawText.replaceAll("'", ""));
                    distributorModel.setEmailid(txtMastersdistrEmail.rawText.replaceAll("'", ""));
                    distributorModel.setWebsite(txtMastersdistrWeb.rawText.replaceAll("'", ""));                    
                    var cn : ConfirmDialogBox = new ConfirmDialogBox(0,"Distributor Details");
                    var a =bind cn.staus;
                    if (a) {
                        //DistributorController Call
                        distributorController = RegistryFactory.getClientStub(RegistryConstants.Distributor) as Distributor ;
                        distributorController.updateRecord(distributorModel);
                        //CommonController Call
                        commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements ;
                        commonController.updateLog("DistributorInformation",btnMastersdistrEdit.text);
                        clear();
                        txtMastersdistrDCode.text =distCode();
                          FXalert(4);
                        txtMastersdistrDCode.requestFocus();
                    }
            }
        } catch (e: Exception) {
            var msg: String = "Class : Distributor Information  Method : Update()   = {e.getMessage()}";
            log.debug(msg);
        }
    }
    public function del(): Void {

        try {
            if (txtMastersdistrDName.text != null) {
                var cn : ConfirmDialogBox = new ConfirmDialogBox(1, "Distributor Details");
                var a =bind cn.staus;
                if (a) {
                    //DistributorController Call
                    distributorController = RegistryFactory.getClientStub(RegistryConstants.Distributor) as Distributor ;
                    distributorController.deleteRecord(txtMastersdistrDCode.rawText);
                    //CommonController Call
                    commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements ;
                    commonController.updateLog("DistributorInformation",btnMastersdistrEdit.text);
                    txtMastersdistrDCode.text =  distCode();
                    clear();
                      FXalert(5);
                    txtMastersdistrDCode.requestFocus();
                }
            } else {
                FXinfo("Please select a Distributor Name to Delete.");
            }
        } catch (e: Exception) {
            var msg: String = "Class : Distributor Information  Method : Delete()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function back(): Void {
        imgCancel.image = imageCancel;
        imgEdit.image = imageEdit;
        CancelW = bottonW;
        imageDistDown.visible = false;
        listDistributor.visible = false;		
        txtMastersdistrDCode.requestFocus();
        btnMastersdistrSave.disable = false;		
        btnMastersdistrSave.text = "Save [F3]";
        btnMastersdistrEdit.disable = false;
        btnMastersdistrEdit.text = "Edit [F6]";
        btnMastersdistrReset.disable = false;
        btnMastersdistrReset.text = "Reset [F4]";
        clear();
        txtMastersdistrDCode.text =  distCode();
        srCode = distCode();
        if (srCode == "") {
            srCode = "DC0000001";
        }
        txtMastersdistrDCode.text =  distCode();
        btnMastersdistrCancel.text = "Cancel [F8]";
    }

    public function edit(): Void {
        imageDistDown.visible = true;
        imgCancel.image = imageBack;
        imgEdit.image = imageCancel;
        CancelW=bottonW+50;
        txtMastersdistrDName.requestFocus();
        clear();
        btnMastersdistrEdit.text = "Delete [F5]";
        btnMastersdistrCancel.text = "Back [Ctrl+Left]";
       txtMastersdistrDCode.text =  distCode();
        btnMastersdistrSave.text = "Update [F7]";
    }

    public function cancel(): Void {
        if (btnMastersdistrCancel.text == "Back [Ctrl+Left]") {
            back();
        } else {
            Empty();
            tempDistName = null;
            tempDistCode = null;
            tempDistDLNo = null;
            tempDistTinNo = null;
            tempDistAdd = null;
            delete  panel.content;
            panel.visible = false;
            CommonDeclare.form[3] = 0;
        }
    }

    public function reset(): Void {

        txtMastersdistrDName.requestFocus();
        clear();
       txtMastersdistrDCode.text = distCode();
        if (btnMastersdistrSave.text == "Save [F3]") {
            srCode = distCode();
            if (srCode == "") {
                srCode = "DC0000001";
            }
            txtMastersdistrDCode.text = srCode;
        }
    }

    function listDistributorOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {

        if (listDistributor.focused) {
            if (event.code == KeyCode.VK_DOWN)
                listDistributor.selectFirstRow();
        }
    }

    function txtMastersdistrStateOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {

        getState(1);
        if (event.code == KeyCode.VK_DOWN and listDistributor.items != null) {
            listDistributor.requestFocus();
            listDistributor.selectFirstRow();
        }
        if (event.code == KeyCode.VK_ESCAPE) {
            listDistributor.visible = false;
            txtMastersdistrState.requestFocus();
        }
    }

    function txtMastersdistrCountryOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {

        getCountry(1);
        if (event.code == KeyCode.VK_DOWN and listDistributor.items != null) {
            listDistributor.requestFocus();
            listDistributor.selectFirstRow();
        }
        if (event.code == KeyCode.VK_ESCAPE) {
            listDistributor.visible = false;
            txtMastersdistrCountry.requestFocus();
        }
    }

    function txtMastersdistrDNameOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {

        if (btnMastersdistrSave.text == "Update [F7]" and btnMastersdistrEdit.text == "Delete [F5]") {
            getDist(1);
            if (event.code == KeyCode.VK_DOWN and listDistributor.items != null) {
                listDistributor.requestFocus();
                listDistributor.selectFirstRow();
            }
            if (event.code == KeyCode.VK_ESCAPE) {
                listDistributor.visible = false;
                txtMastersdistrDName.requestFocus();
            }
        }
    }

    public function getState(con: Integer) {

         listDistributor.visible = false ;
         listLayoutY = txtMastersdistrState.layoutY + 25;
         listW = Type2TextboxW;
         var listControlObj: ListController = new ListController();
         listH = listControlObj.listStateControlView(txtMastersdistrState, txtMastersdistrCountry.rawText, listDistributor, "", con);

         var selS = bind listControlObj.selectedString on replace {
             if (selS.length()  > 0) {
                 listDistributor.visible = false ;
                 txtMastersdistrPin.requestFocus();
             }

         }
    }

    public function getCountry(type: Integer): Void {
        
        listDistributor.visible = false ;
        var listControlObj: ListController = new ListController() ;
        listH = listControlObj.listImageControlView(txtMastersdistrCountry, listDistributor, "Country", type) ;
        listLayoutY = txtMastersdistrCountry.layoutY + 25 ;
        listW = Type2TextboxW ;
        

        var selS = bind listControlObj.selectedString on replace {
            if (selS.length() > 0) {
                txtMastersdistrState.text = "" ;
                getState (1) ;
            }

        }
    }

    public function getDist(con: Integer) {
        if(not listDistributor.visible){
        listDistributor.visible = false ;
        var listControlObj: ListController = new ListController() ;
        listH = listControlObj.listImageControlView(txtMastersdistrDName, listDistributor, "Distributor", con) ;
        listLayoutY = txtMastersdistrDName.layoutY + 25;
        listW = Type1TextboxW ;
        var selectString = bind listControlObj.selectedString on replace {
            if (selectString.length() > 0) {
                displayDistributor(selectString) ;
                txtMastersdistrOName.requestFocus();
            }
           }
         }
       else{
           listDistributor.visible = false;
           txtMastersdistrDName.requestFocus();
       }
    }

    public function displayDistributor(name: String): Void {
        try {
            //DistributorController Call
            var distributorModel : DistributorModel =new DistributorModel();
            distributorController = RegistryFactory.getClientStub(RegistryConstants.Distributor) as Distributor ;
            distributorModel=distributorController.viewRecord(name) as DistributorModel;
                txtMastersdistrDCode.text = distributorModel.getDistributorCode();
                txtMastersdistrOName.text = distributorModel.getOwnerName();
                txtMastersdistrSpeciality.text = distributorModel.getAuthorizedDistributor();
                txtMastersdistrTIN.text = distributorModel.getTINNumber();
                txtMastersdistrCST.text = distributorModel.getCSTNumber();
                txtMastersdistrDL.text = distributorModel.getDLNumber();
                txtMastersdistrCreditDays.text = distributorModel.getCreditDays();
                txtMastersdistrAdd1.text = distributorModel.getAddress1();
                txtMastersdistrAdd2.text = distributorModel.getAddress2();
                txtMastersdistrAdd3.text = distributorModel.getAddress3();
                txtMastersdistrCity.text = distributorModel.getCity();
                txtMastersdistrCountry.text = distributorModel.getCountry();
                txtMastersdistrState.text = distributorModel.getState();
                txtMastersdistrPin.text = distributorModel.getPincode();
                txtMastersdistrCNo1.text = distributorModel.getContactNumber1();
                txtMastersdistrCNo2.text = distributorModel.getContactNumber2();
                txtMastersdistrFax.text = distributorModel.getFaxNumber();
                txtMastersdistrMob.text = distributorModel.getMobileNumber();
                txtMastersdistrEmail.text = distributorModel.getEmailid();
                txtMastersdistrWeb.text =distributorModel.getWebsite();
        } catch (e: Exception) {
            var msg: String = "Class : Distributor Information  Method : DisplayDistributor()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function clickValid(chk: Integer): Integer {

        var dcode = txtMastersdistrDCode.rawText.replaceAll("'", "");
        var dname = txtMastersdistrDName.rawText.replaceAll("'", "");
        var oname = txtMastersdistrOName.rawText.replaceAll("'", "");
        var author = txtMastersdistrSpeciality.rawText.replaceAll("'", "");
        var tin = txtMastersdistrTIN.rawText.replaceAll("'", "");
        var cst = txtMastersdistrCST.rawText.replaceAll("'", "");
        var dl = txtMastersdistrDL.rawText.replaceAll("'", "");
        var creditdays = txtMastersdistrCreditDays.rawText.replaceAll("'", "");
        var address1 = txtMastersdistrAdd1.rawText.replaceAll("'", "");
        var address2 = txtMastersdistrAdd2.rawText.replaceAll("'", "");
        var address3 = txtMastersdistrAdd3.rawText.replaceAll("'", "");
        var city = txtMastersdistrCity.rawText.replaceAll("'", "");
        var country = txtMastersdistrCountry.rawText.replaceAll("'", "");
        var state = txtMastersdistrState.rawText.replaceAll("'", "");
        var pin = txtMastersdistrPin.rawText.replaceAll("'", "");
        var c1 = txtMastersdistrCNo1.rawText.replaceAll("'", "");
        var c2 = txtMastersdistrCNo2.rawText.replaceAll("'", "");
        var fax = txtMastersdistrFax.rawText.replaceAll("'", "");
        var mobile = txtMastersdistrMob.rawText.replaceAll("'", "");
        var mail = txtMastersdistrEmail.rawText.replaceAll("'", "");
        var web = txtMastersdistrWeb.rawText.replaceAll("'", "");
        var cnt: Integer = 0;
        var val: Validation = new Validation();
        try {
            var dn: Integer = 0; dn = val.getAlphaNumericValid(dname, 4, 65);
            var ona: Integer = 0; ona = val.getAlphaNumericValid(oname, 4, 35);
            var au: Integer = 0; au = val.getAddressValid(author, 4, 75);
            var t: Integer = 0; t = val.getAddressValid(tin, 4, 25);
            var c: Integer = 0; c = val.getAddressValid(cst, 4, 25);
            var d: Integer = 0; d = val.getAddressValid(dl, 4, 25);
            var cd: Integer = 0; cd = val.getNumberValid(creditdays, 1, 25);
            var ad1: Integer = 0; ad1 = val.getAddressValid(address1, 4, 100);
            var ad2: Integer = 0; ad2 = val.getAddressValid(address2, 4, 100);
            var ad3: Integer = 0; ad3 = val.getAddressValid(address3, 4, 100);
            var cty: Integer = 0; cty = val.getAlphaNumericValid(city, 4, 25);
            var con: Integer = 0; con = val.getAlphaNumericValid(country, 4, 25);
            var ste: Integer = 0; ste = val.getAlphaNumericValid(state, 4, 25);
            var pinc: Integer = 0; pinc = val.getNumberValid(pin, 4, 30);
            var co1: Integer = 0; co1 = val.getPhoneNoValid(c1, 4, 30);
            var co2: Integer = 0; co2 = val.getPhoneNoValid(c2, 4, 30);
            var f: Integer = 0; f = val.getPhoneNoValid(fax, 4, 30);
            var mob: Integer = 0; mob = val.getPhoneNoValid(mobile, 4, 30);
            var em: Integer = 0; em = val.getEmailIdValid(mail, 4, 35);
            var w: Integer = 0; w = val.getWebsiteValid(web, 4, 30);

            if (dname.length() <= 0) {
                FXinfo("Please Enter Distributor Name", txtMastersdistrDName);
            } else if (dn == 1) {
                FXinfo1("Distributor Name not to exceed 35 Characters.", txtMastersdistrDName);
            } else if (ona == 0) {
                FXinfo1("Please enter only alphabets.", txtMastersdistrOName);
            } else if (au == 0) {
                FXinfo1("Please enter only alphabets.", txtMastersdistrSpeciality);
            } else if (t == 0) {
                FXinfo1("TIN number accepts both alphabets and numerals.", txtMastersdistrTIN);
            } else if (tin.length() <= 0) {
                FXinfo("Please Enter TIN Number", txtMastersdistrTIN);
            } else if (c == 0) {
                FXinfo1("C.S.T number accepts both alphabets and numerals.", txtMastersdistrCST);
            } else if (cd == 0) {
                FXinfo1("Only numerals are accepted.", txtMastersdistrCreditDays);
            } else if (address1.length() <= 0) {
                FXinfo("Please enter address.", txtMastersdistrAdd1);
            } else if (city.length() <= 0) {
                FXinfo("Please enter city.", txtMastersdistrCity);
            } else if (cty == 0) {
                FXinfo1("City accepts both alphabets and numerals.", txtMastersdistrCity);
            } else if (pinc == 0) {
                FXinfo1("Pincode accepts only numerals.", txtMastersdistrPin);
            } else if (pin != null and pin.length() < 2) {
                FXinfo1("Pincode requires a minimum of two digits.", txtMastersdistrPin);
            } else if (pin != null and pin.length() > 6) {
                FXinfo1("Pincode can accept a maximum of six digits.", txtMastersdistrPin);
            } else if (co1 == 0) {
                FXinfo1("Only numerals and [+-] can be entered.", txtMastersdistrCNo1);
            } else if (c1 != null and c1.length() < 7) {
                FXinfo1("Phone Number requires a minimum of six digits.", txtMastersdistrCNo1);
            } else if (co2 == 0) {
                FXinfo1("Only numerals and [+-] can be entered.", txtMastersdistrCNo2);
            } else if (c2 != null and c2.length() < 6) {
                FXinfo1("Phone Number requires a minimum of six digits.", txtMastersdistrCNo2);
            } else if (mob == 0) {
                FXinfo1("Only numerals and [+-] can be entered.", txtMastersdistrMob);
            } else if (mobile != null and mobile.length() < 10) {
                FXinfo1("Mobile Number can accept a maximum of ten digits.", txtMastersdistrMob);
            } else if (f == 0) {
                FXinfo1("Only Numerals and [+-] can be entered.", txtMastersdistrFax);
            } else if (fax != null and fax.length() < 6) {
                FXinfo1("Phone Number requires a minimum of six digits.", txtMastersdistrFax);
            } else if (em == 0) {
                FXinfo1("Please Enter valid Email ID.", txtMastersdistrEmail);
            } else if (w == 0) {
                FXinfo1("Enter valid Website Name.", txtMastersdistrWeb);
            } else {
                cnt = 10;
            }
        } catch (e: Exception) {
            var msg: String = "Class : Distributor Information  Method : ClickValid()   = {e.getMessage()}";
            log.debug(msg);
        }
        return cnt;
    }

    public function distCode(): String {
        var code: String = "";
        var finalCode: String = "";
        var vanCode: String = "DC";
        try {
            //Controller Instance
            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements ;
            finalCode = commonController.getCustId("dist_information", "dist_code", "DC");
        } catch (e: Exception) {
            var msg: String = "Class : Distributor Information  Method : distCode()   = {e.getMessage()}";
            log.debug(msg);
        }
        return finalCode;
    }

    public function Empty(): Void {
        txtMastersdistrDName.text = null;
        txtMastersdistrOName.text = null;
        txtMastersdistrSpeciality.text = null;
        txtMastersdistrTIN.text = null;
        txtMastersdistrCST.text = null;
        txtMastersdistrDL.text = null;
        txtMastersdistrCreditDays.text = null;
        txtMastersdistrAdd1.text = null;
        txtMastersdistrAdd2.text = null;
        txtMastersdistrAdd3.text = null;
        txtMastersdistrCNo1.text = null;
        txtMastersdistrCNo2.text = null;
        txtMastersdistrCity.text = null;
        txtMastersdistrPin.text = null;
        txtMastersdistrFax.text = null;
        txtMastersdistrMob.text = null;
        txtMastersdistrEmail.text = null;
        txtMastersdistrWeb.text = null;
        txtMastersdistrCountry.text = null;
        txtMastersdistrState.text = null;
    }

    public function clear(): Void {
        txtMastersdistrDName.text = "";
        txtMastersdistrOName.text = "";
        txtMastersdistrSpeciality.text = "";
        txtMastersdistrTIN.text = "";
        txtMastersdistrCST.text = "";
        txtMastersdistrDL.text = "";
        txtMastersdistrCreditDays.text = "";
        txtMastersdistrAdd1.text = "";
        txtMastersdistrAdd2.text = "";
        txtMastersdistrAdd3.text = "";
        txtMastersdistrCNo1.text = "";
        txtMastersdistrCNo2.text = "";
        txtMastersdistrCity.text = "";
        txtMastersdistrPin.text = "";
        txtMastersdistrFax.text = "";
        txtMastersdistrMob.text = "";
        txtMastersdistrEmail.text = "";
        txtMastersdistrWeb.text = "";
        txtMastersdistrCountry.text = "";
        txtMastersdistrState.text = "";
        listDistributor.visible = false ;
    }

    public function getPrivileges(u : String): Void {
        var uname = u;
        //CommonController Call
        commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements ;
        var utype = commonController.getUserType(uname);
        if(utype.equals("User"))
        {
            //CommonController Call
            var priv = commonController.getPrivileges("masters", uname);
            var ss = priv.split(",");
            var val = Integer.parseInt(ss[3]);
            if(val == 1)
            {
				btnMastersdistrSave.disable=true;
				if(btnMastersdistrEdit.text!="Edit [F6]")
				{
					btnMastersdistrEdit.disable=true;
				}
				else{
					btnMastersdistrEdit.disable=false;
				}      
            }
            else if(val == 2)
            {				
				if(btnMastersdistrEdit.text!="Edit [F6]")
				{
					btnMastersdistrEdit.disable=true;
				}
				else{
					btnMastersdistrEdit.disable=false;
				}
				btnMastersdistrSave.disable=false;				
                //This code for  READ and WRITE Access
            }
            else if(val == 3)
            {
				btnMastersdistrSave.disable=false;
				btnMastersdistrEdit.disable=false;
                //This code for FULL Access
            }
        }else {
				btnMastersdistrSave.disable=false;
				btnMastersdistrEdit.disable=false;		
		}
    }
var logUser: String =  bind CommonDeclare.user on replace{
            getPrivileges(logUser);
        }

var changPiv =  bind btnMastersdistrEdit.text on replace{
            getPrivileges(logUser);
        }
        var changPiv1 =  bind btnMastersdistrSave.text on replace{
            getPrivileges(logUser);
        }

    public function StartUp(): Void {
        panel.visible = true;
        panel.content = [rectangle, rectHeader, label, separator, label2, label3, label4, label5, label6, label7, label8, label9, label10, label11, label12, label13, panelButtons, txtMastersdistrDCode, label14, txtMastersdistrOName, txtMastersdistrCST, txtMastersdistrAdd1, txtMastersdistrAdd2, txtMastersdistrAdd3, txtMastersdistrCity, txtMastersdistrCNo1, txtMastersdistrMob, txtMastersdistrPin, txtMastersdistrCountry, txtMastersdistrState, txtMastersdistrDName, separator2, label15, label16, label1, txtMastersdistrCNo2, txtMastersdistrSpeciality, label17, label18, label19, txtMastersdistrTIN, txtMastersdistrDL, txtMastersdistrCreditDays, label20, txtMastersdistrFax, txtMastersdistrEmail, label21, txtMastersdistrWeb, listDistributor, imageDistDown, imageCountryDown, imageStateDown,panelAlert];
        txtMastersdistrAdd1.style = mandatoryStyle;
        txtMastersdistrDName.style = mandatoryStyle;
        txtMastersdistrTIN.style = mandatoryStyle;
        txtMastersdistrCity.style = mandatoryStyle;
        srCode = distCode();
        if (srCode == "") {
            srCode = "DC0000001";
        }
        txtMastersdistrDCode.text = srCode;
        txtMastersdistrDName.requestFocus();
        txtMastersdistrDCode.editable = false;
        if (checkState == 0) {
            currentState.actual = currentState.findIndex("Shown");
        }
        txtMastersdistrDName.requestFocus();
    }
}


