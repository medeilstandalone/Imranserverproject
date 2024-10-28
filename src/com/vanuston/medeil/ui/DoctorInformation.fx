package com.vanuston.medeil.ui;


import javafx.scene.layout.LayoutInfo;
import javafx.scene.image.Image;
import javafx.scene.input.KeyCode;
import javafx.scene.control.TextBox;
import com.vanuston.medeil.model.DoctorModel;
import com.vanuston.medeil.implementation.Doctor;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.util.Validation;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.KeyRegistry;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.uitables.ConfirmDialogBox;
import java.lang.Exception;
import java.lang.Runtime;

public class DoctorInformation {

    //Controller Instance
    var doctorController : Doctor ; // = RegistryFactory.getClientStub(RegistryConstants.Doctor) as Doctor;
    var commonController : CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    def CustomAlert = CustomAlert {} ;
    //DoctorModel Reference
    var doctorModel=null;
    var listH = 0.0;
    var srCode: String;
    var dcode: String;
    var docname: String;
    var hosname: String;
    var regid: String;
    var add1: String;
    var add2: String;
    var add3: String;
    var city: String;
    var country: String;
    var pincode: String;
    var state: String;
    var special: String;
    var mobile: String;
    var phone: String;
    var mail: String;
    var web: String;
    var style = {
    "-fx-border-width:2;"
    "-fx-border-color:#666666;"
    "-fx-background-color: white ;"
    }

    public var checkState = 0;
    public var checkVal = 0;

    public var isBack = false;    
    public var newDoc: String = "" ;
    var getAutoIncre: String ;
    var subStr1: Integer = 1 ;
    public var value: Integer ;
    
    var log: Logger = Logger.getLogger(DoctorInformation.class, "Utilities");
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    def __layoutInfo_separator: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
        height: 0.0
    }
    public-read def separator: javafx.scene.control.Separator = javafx.scene.control.Separator {
        visible: true
        layoutX: 30.0
        layoutY: 115.0
        layoutInfo: __layoutInfo_separator
    }
    
    public-read def imageView2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imgEdit: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imageView4: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imgCancel: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
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
    
    def __layoutInfo_listDoctor: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listDoctor: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind listLX
        layoutY: bind listLY
        layoutInfo: __layoutInfo_listDoctor
        items: null
    }
    
    public-read def rectDocCharges: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind rectbutton2LX
        layoutY: bind rectbuttonLY
        width: 100.0
        height: 50.0
    }
    
    def __layoutInfo_label17: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def label17: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind rectbutton2LX
        layoutY: bind rectbuttonLY+3
        layoutInfo: __layoutInfo_label17
        text: "Label"
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
    }
    
    def __layoutInfo_btnYes: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnYes: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind panelAlertLX+125
        layoutY: bind panelAlertLY+154
        layoutInfo: __layoutInfo_btnYes
        text: "Button"
    }
    
    public-read def rectangle2: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        styleClass: "rectbutton"
        width: 100.0
        height: 50.0
    }
    
    def __layoutInfo_lbltoDocCharges: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lbltoDocCharges: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutInfo: __layoutInfo_lbltoDocCharges
        styleClass: "rectbutton"
        text: "Label"
    }
    
    public-read def grouptoCharges: javafx.scene.Group = javafx.scene.Group {
        visible: false
        layoutX: bind rectbutton2LX
        layoutY: bind rectbuttonLY
        onKeyPressed: grouptoChargesOnKeyPressed
        onMouseClicked: grouptoChargesOnMouseClicked
        content: [ rectangle2, lbltoDocCharges, ]
    }
    
    public-read def panelCharges: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
    }
    
    public-read def rectbutton: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        styleClass: "rectbutton"
        width: 100.0
        height: 50.0
    }
    
    def __layoutInfo_labelDoctor_Info: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def labelDoctor_Info: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutInfo: __layoutInfo_labelDoctor_Info
        text: "Label"
    }
    
    public-read def grouptoDoc: javafx.scene.Group = javafx.scene.Group {
        visible: false
        layoutX: bind rectbutton1LX
        layoutY: bind rectbuttonLY
        onKeyPressed: grouptoDocOnKeyPressed
        onMouseClicked: grouptoDocOnMouseClicked
        content: [ rectbutton, labelDoctor_Info, ]
    }
    
    public-read def panelDocCharges: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ panelCharges, grouptoDoc, ]
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
    
    def __layoutInfo_txtDoctorSpl: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtDoctorSpl: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 158.0
        layoutInfo: __layoutInfo_txtDoctorSpl
        font: Arial_12
    }
    
    def __layoutInfo_txtDoctorWeb: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtDoctorWeb: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 357.0
        layoutInfo: __layoutInfo_txtDoctorWeb
        font: Arial_12
    }
    
    def __layoutInfo_txtDoctorMob: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtDoctorMob: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 301.0
        layoutInfo: __layoutInfo_txtDoctorMob
        font: Arial_12
    }
    
    def __layoutInfo_txtDoctorAdd3: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtDoctorAdd3: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 329.0
        layoutInfo: __layoutInfo_txtDoctorAdd3
        font: Arial_12
    }
    
    def __layoutInfo_txtDoctorRegID: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
        hfill: false
    }
    public-read def txtDoctorRegID: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 158.0
        layoutInfo: __layoutInfo_txtDoctorRegID
        style: ""
        styleClass: "text-box"
        effect: null
        text: ""
        font: Arial_12
    }
    
    def __layoutInfo_txtDoctorState: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtDoctorState: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 427.0
        layoutInfo: __layoutInfo_txtDoctorState
        font: Arial_12
    }
    
    def __layoutInfo_txtDoctorCountry: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtDoctorCountry: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 399.0
        layoutInfo: __layoutInfo_txtDoctorCountry
        font: Arial_12
    }
    
    def __layoutInfo_txtDoctorPinCode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtDoctorPinCode: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 455.0
        layoutInfo: __layoutInfo_txtDoctorPinCode
        font: Arial_12
    }
    
    def __layoutInfo_txtDoctorMail: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtDoctorMail: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 329.0
        layoutInfo: __layoutInfo_txtDoctorMail
        font: Arial_12
    }
    
    def __layoutInfo_txtDoctorPhone: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtDoctorPhone: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 273.0
        layoutInfo: __layoutInfo_txtDoctorPhone
        font: Arial_12
    }
    
    def __layoutInfo_txtDoctorCity: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtDoctorCity: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        managed: true
        layoutX: bind C2LX
        layoutY: 371.0
        layoutInfo: __layoutInfo_txtDoctorCity
        font: Arial_12
    }
    
    def __layoutInfo_txtDoctorAdd2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtDoctorAdd2: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 301.0
        layoutInfo: __layoutInfo_txtDoctorAdd2
        font: Arial_12
    }
    
    def __layoutInfo_txtDoctorAdd1: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtDoctorAdd1: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 273.0
        layoutInfo: __layoutInfo_txtDoctorAdd1
        font: Arial_12
    }
    
    def __layoutInfo_txtDoctorHName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtDoctorHName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 130.0
        layoutInfo: __layoutInfo_txtDoctorHName
        font: Arial_12
    }
    
    def __layoutInfo_txtDoctorDName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtDoctorDName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 186.0
        layoutInfo: __layoutInfo_txtDoctorDName
        font: Arial_12
    }
    
    def __layoutInfo_txtDoctorDCode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtDoctorDCode: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: true
        disable: false
        layoutX: bind C2LX
        layoutY: 130.0
        layoutInfo: __layoutInfo_txtDoctorDCode
        promptText: "Enter Code Here..."
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
    
    def __layoutInfo_btnDoctorCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind CancelW
        height: bind bottonH
    }
    public-read def btnDoctorCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton4LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnDoctorCancel
        effect: reflectionEffect
        graphic: imgCancel
        text: "Cancel [F8]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
        action: btnDoctorCancelActionAtShown
    }
    
    def __layoutInfo_btnDoctorReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnDoctorReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton3LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnDoctorReset
        onKeyReleased: btnDoctorResetOnKeyReleased
        effect: reflectionEffect
        graphic: imageView4
        text: "Reset [F4]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnDoctorEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnDoctorEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: true
        layoutX: bind botton2LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnDoctorEdit
        onKeyReleased: btnDoctorEditOnKeyReleased
        effect: reflectionEffect
        graphic: imgEdit
        text: "Edit  [F6]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnDoctorSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnDoctorSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnDoctorSave
        onKeyReleased: btnDoctorSaveOnKeyReleased
        translateX: 0.0
        effect: reflectionEffect
        graphic: imageView2
        text: "Save [F3]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    public-read def panelButtons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: bind panelButtonsLY
        content: [ btnDoctorSave, btnDoctorEdit, btnDoctorReset, btnDoctorCancel, ]
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
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 158.0
        text: "Speciality"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label1: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 301.0
        text: "Mobile No"
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
        text: "City *"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 130.0
        text: "Hospital Name"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label8: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 186.0
        text: "Doctor  Name*"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 357.0
        text: "Website"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label6: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 273.0
        text: "Phone No."
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
        text: "Address *"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 158.0
        styleClass: "label"
        text: "Registration ID "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label14: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 130.0
        text: "Doctor Code"
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
        arcWidth: 5.0
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.4
    }
    
    public-read def label16: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 35.0
        layoutY: 234.0
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
    
    public-read def dropShadowEffect: javafx.scene.effect.DropShadow = javafx.scene.effect.DropShadow {
    }
    
    public-read def lightingEffect: javafx.scene.effect.Lighting = javafx.scene.effect.Lighting {
    }
    
    def __layoutInfo_label: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
    }
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 549.0
        layoutY: 34.0
        layoutInfo: __layoutInfo_label
        effect: lightingEffect
        text: "Doctor Details - alt+O"
        font: Arial_25
    }
    
    public-read def Yellow: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.95
        green: 0.94
        blue: 0.86
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    def __layoutInfo_imgDoctorDCode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 195.0
        height: 0.0
    }
    public-read def imgDoctorDCode: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind ImgDocCodeArrow
        layoutY: 132.0
        layoutInfo: __layoutInfo_imgDoctorDCode
        onMouseClicked: imgDoctorDCodeOnMouseClicked
        image: image
        fitWidth: 0.0
        fitHeight: 17.0
    }
    
    public-read def image2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imgDoctorSpl: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind ImgDocSplArrow
        layoutY: 160.0
        onMouseClicked: imgDoctorSplOnMouseClicked
        image: image2
        fitHeight: 17.0
    }
    
    public-read def image3: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imgDoctorState: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind ImgStateArrow
        layoutY: 429.0
        onMouseClicked: imgDoctorStateOnMouseClicked
        image: image3
        fitHeight: 17.0
    }
    
    public-read def image4: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imgDoctorCountry: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind ImgCountryArrow
        layoutY: 401.0
        onMouseClicked: imgDoctorCountryOnMouseClicked
        image: image4
        fitHeight: 17.0
    }
    
    public-read def linearGradientHeader: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
    }
    
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        opacity: 0.25
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "rectFormHeader"
        fill: linearGradientHeader
        width: bind panelW
        height: 32.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        onMouseClicked: panelOnMouseClicked
        content: [ rectangle, rectHeader, label, separator, label14, label2, label4, label5, label6, label7, label8, label9, label10, label11, label12, label13, panelButtons, txtDoctorDCode, txtDoctorDName, txtDoctorHName, txtDoctorAdd1, txtDoctorAdd2, txtDoctorCity, txtDoctorPhone, txtDoctorMail, txtDoctorPinCode, txtDoctorCountry, txtDoctorState, txtDoctorRegID, txtDoctorAdd3, separator2, label15, label16, label1, txtDoctorMob, txtDoctorWeb, txtDoctorSpl, label3, imgDoctorDCode, imgDoctorSpl, imgDoctorState, imgDoctorCountry, listDoctor, rectDocCharges, label17, panelAlert, btnYes, grouptoCharges, ]
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
    
    public-read def imageBack: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/arrow_Left.png"
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "Shown", "FromSales", ]
        actual: 1
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectangle.visible = true;
                            rectangle.arcWidth = 5.0;
                            rectangle.arcHeight = 5.0;
                            rectHeader.visible = true;
                            rectHeader.fill = linearGradientHeader;
                            label.visible = true;
                            label.layoutX = 0.0;
                            label.layoutY = 1.0;
                            label.hpos = javafx.geometry.HPos.CENTER;
                            __layoutInfo_separator.height = 5.0;
                            label4.text = "Address ";
                            label8.text = "Doctor  Name";
                            label10.text = "City ";
                            imageView2.visible = true;
                            imageView2.layoutX = 0.0;
                            imageView2.image = imageSave;
                            btnDoctorSave.visible = true;
                            btnDoctorSave.layoutY = 0.0;
                            btnDoctorSave.text = "Save [F3]";
                            btnDoctorSave.hpos = javafx.geometry.HPos.LEFT;
                            btnDoctorSave.action = btnDoctorSaveActionAtShown;
                            imgEdit.visible = true;
                            imgEdit.image = imageEdit;
                            btnDoctorEdit.visible = true;
                            btnDoctorEdit.layoutY = 0.0;
                            btnDoctorEdit.text = "Edit [F6]";
                            btnDoctorEdit.action = btnDoctorEditActionAtShown;
                            imageView4.visible = true;
                            imageView4.image = imageReset;
                            btnDoctorReset.visible = true;
                            btnDoctorReset.layoutY = 0.0;
                            btnDoctorReset.text = "Reset [F4]";
                            btnDoctorReset.action = btnDoctorResetActionAtShown;
                            imgCancel.visible = true;
                            imgCancel.image = imageCancel;
                            btnDoctorCancel.visible = true;
                            btnDoctorCancel.layoutY = 0.0;
                            btnDoctorCancel.onKeyPressed = btnDoctorCancelOnKeyPressedAtShown;
                            btnDoctorCancel.text = "Cancel [F8]";
                            btnDoctorCancel.action = btnDoctorCancelActionAtShown;
                            panelButtons.visible = true;
                            txtDoctorDCode.onKeyPressed = txtDoctorDCodeOnKeyPressedAtShown;
                            txtDoctorDCode.onKeyReleased = txtDoctorDCodeOnKeyReleasedAtShown;
                            txtDoctorDCode.promptText = "Auto Generate Doctor Code...";
                            txtDoctorDCode.editable = false;
                            txtDoctorDName.onKeyPressed = txtDoctorDNameOnKeyPressedAtShown;
                            txtDoctorHName.onKeyPressed = txtDoctorHNameOnKeyPressedAtShown;
                            txtDoctorAdd1.onKeyPressed = txtDoctorAdd1OnKeyPressedAtShown;
                            txtDoctorAdd2.onKeyPressed = txtDoctorAdd2OnKeyPressedAtShown;
                            txtDoctorAdd2.onKeyReleased = txtDoctorAdd2OnKeyReleasedAtShown;
                            txtDoctorCity.onKeyPressed = txtDoctorCityOnKeyPressedAtShown;
                            txtDoctorPhone.onKeyPressed = txtDoctorPhoneOnKeyPressedAtShown;
                            txtDoctorMail.onKeyPressed = txtDoctorMailOnKeyPressedAtShown;
                            txtDoctorPinCode.onKeyPressed = txtDoctorPinCodeOnKeyPressedAtShown;
                            txtDoctorCountry.onKeyPressed = txtDoctorCountryOnKeyPressedAtShown;
                            txtDoctorCountry.onKeyReleased = txtDoctorCountryOnKeyReleasedAtShown;
                            txtDoctorState.onKeyPressed = txtDoctorStateOnKeyPressedAtShown;
                            txtDoctorState.onKeyReleased = txtDoctorStateOnKeyReleasedAtShown;
                            txtDoctorRegID.onKeyPressed = txtDoctorRegIDOnKeyPressedAtShown;
                            txtDoctorAdd3.onKeyPressed = txtDoctorAdd3OnKeyPressedAtShown;
                            label1.text = "Mobile No.";
                            txtDoctorMob.onKeyPressed = txtDoctorMobOnKeyPressedAtShown;
                            txtDoctorWeb.onKeyPressed = txtDoctorWebOnKeyPressedAtShown;
                            txtDoctorSpl.onKeyPressed = txtDoctorSplOnKeyPressedAtShown;
                            txtDoctorSpl.onKeyReleased = txtDoctorSplOnKeyReleasedAtShown;
                            imgDoctorSpl.onMouseClicked = imgDoctorSplOnMouseClicked;
                            listDoctor.visible = false;
                            rectDocCharges.visible = false;
                            rectDocCharges.styleClass = "rectbutton";
                            rectDocCharges.onMouseClicked = rectDocChargesOnMouseClickedAtShown;
                            rectDocCharges.fill = Yellow;
                            rectDocCharges.stroke = DarkGray;
                            rectDocCharges.width = 100.0;
                            rectDocCharges.height = 20.0;
                            rectDocCharges.arcWidth = 10.0;
                            rectDocCharges.arcHeight = 10.0;
                            label17.visible = false;
                            __layoutInfo_label17.width = 100.0;
                            label17.text = "Doctor Charges";
                            label17.font = Arial_Bold_12;
                            label17.hpos = javafx.geometry.HPos.CENTER;
                            label17.textFill = DarkGray;
                            btnYes.visible = false;
                            __layoutInfo_btnYes.width = 100.0;
                            __layoutInfo_btnYes.height = 30.0;
                            btnYes.text = "  Yes";
                            btnYes.font = Arial_Bold_14;
                            rectangle2.visible = true;
                            rectangle2.fill = Yellow;
                            rectangle2.stroke = Yellow;
                            rectangle2.width = 120.0;
                            rectangle2.height = 20.0;
                            rectangle2.arcWidth = 10.0;
                            rectangle2.arcHeight = 10.0;
                            lbltoDocCharges.visible = true;
                            __layoutInfo_lbltoDocCharges.width = 120.0;
                            __layoutInfo_lbltoDocCharges.height = 20.0;
                            lbltoDocCharges.styleClass = "label";
                            lbltoDocCharges.text = "Doctor Charges >>";
                            lbltoDocCharges.font = Arial_Bold_12;
                            lbltoDocCharges.hpos = javafx.geometry.HPos.CENTER;
                            grouptoCharges.visible = true;
                            grouptoCharges.effect = null;
                            panel.visible = true;
                            panelCharges.visible = true;
                            rectbutton.visible = true;
                            rectbutton.fill = Yellow;
                            rectbutton.height = 20.0;
                            rectbutton.arcWidth = 10.0;
                            rectbutton.arcHeight = 10.0;
                            labelDoctor_Info.visible = true;
                            __layoutInfo_labelDoctor_Info.width = 100.0;
                            __layoutInfo_labelDoctor_Info.height = 20.0;
                            labelDoctor_Info.text = "<< Doctor Info";
                            labelDoctor_Info.font = Arial_Bold_12;
                            labelDoctor_Info.hpos = javafx.geometry.HPos.CENTER;
                            grouptoDoc.visible = true;
                            panelDocCharges.visible = false;
                        }
                    }
                ]
            }
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectangle.visible = true;
                            rectangle.arcWidth = 5.0;
                            rectangle.arcHeight = 5.0;
                            rectHeader.visible = true;
                            rectHeader.fill = linearGradientHeader;
                            label.visible = true;
                            label.layoutX = 0.0;
                            label.layoutY = 1.0;
                            label.hpos = javafx.geometry.HPos.CENTER;
                            __layoutInfo_separator.height = 0.0;
                            label4.text = "Address";
                            label8.text = "Doctor  Name*";
                            label10.text = "City *";
                            imageView2.visible = false;
                            imageView2.layoutX = 0.0;
                            imageView2.image = null;
                            btnDoctorSave.visible = false;
                            btnDoctorSave.layoutY = 525.0;
                            btnDoctorSave.text = "Save [F3]";
                            btnDoctorSave.hpos = javafx.geometry.HPos.CENTER;
                            btnDoctorSave.action = btnDoctorSaveActionAtShown;
                            imgEdit.visible = false;
                            imgEdit.image = null;
                            btnDoctorEdit.visible = false;
                            btnDoctorEdit.layoutY = 525.0;
                            btnDoctorEdit.text = "Edit [F6]";
                            btnDoctorEdit.action = btnDoctorEditActionAtShown;
                            imageView4.visible = false;
                            imageView4.image = null;
                            btnDoctorReset.visible = false;
                            btnDoctorReset.layoutY = 525.0;
                            btnDoctorReset.text = "Reset [F4]";
                            btnDoctorReset.action = btnDoctorResetActionAtShown;
                            imgCancel.visible = false;
                            imgCancel.image = null;
                            btnDoctorCancel.visible = false;
                            btnDoctorCancel.layoutY = 525.0;
                            btnDoctorCancel.onKeyPressed = btnDoctorCancelOnKeyPressedAtShown;
                            btnDoctorCancel.text = "Cancel [F8]";
                            btnDoctorCancel.action = btnDoctorCancelActionAtShown;
                            panelButtons.visible = false;
                            txtDoctorDCode.onKeyPressed = txtDoctorDCodeOnKeyPressedAtShown;
                            txtDoctorDCode.promptText = "Auto Generate Doctor Code...";
                            txtDoctorDCode.editable = false;
                            txtDoctorDName.onKeyPressed = txtDoctorDNameOnKeyPressedAtShown;
                            txtDoctorHName.onKeyPressed = txtDoctorHNameOnKeyPressedAtShown;
                            txtDoctorAdd1.onKeyPressed = txtDoctorAdd1OnKeyPressedAtShown;
                            txtDoctorAdd2.onKeyPressed = txtDoctorAdd2OnKeyPressedAtShown;
                            txtDoctorAdd2.onKeyReleased = txtDoctorAdd2OnKeyReleasedAtShown;
                            txtDoctorCity.onKeyPressed = txtDoctorCityOnKeyPressedAtShown;
                            txtDoctorPhone.onKeyPressed = txtDoctorPhoneOnKeyPressedAtShown;
                            txtDoctorMail.cursor = null;
                            txtDoctorMail.onKeyPressed = txtDoctorMailOnKeyPressedAtShown;
                            txtDoctorPinCode.onKeyPressed = txtDoctorPinCodeOnKeyPressedAtShown;
                            txtDoctorCountry.onKeyPressed = txtDoctorCountryOnKeyPressedAtShown;
                            txtDoctorCountry.onKeyReleased = txtDoctorCountryOnKeyReleasedAtShown;
                            txtDoctorState.onKeyPressed = txtDoctorStateOnKeyPressedAtShown;
                            txtDoctorState.onKeyReleased = txtDoctorStateOnKeyReleasedAtShown;
                            txtDoctorRegID.onKeyPressed = txtDoctorRegIDOnKeyPressedAtShown;
                            txtDoctorAdd3.onKeyPressed = txtDoctorAdd3OnKeyPressedAtShown;
                            label1.text = "Mobile No";
                            txtDoctorMob.onKeyPressed = txtDoctorMobOnKeyPressedAtShown;
                            txtDoctorWeb.onKeyPressed = txtDoctorWebOnKeyPressedAtShown;
                            txtDoctorSpl.onKeyPressed = txtDoctorSplOnKeyPressedAtShown;
                            txtDoctorSpl.onKeyReleased = txtDoctorSplOnKeyReleasedAtFromSales;
                            imgDoctorSpl.onMouseClicked = imgDoctorSplOnMouseClickedAtFromSales;
                            listDoctor.visible = false;
                            rectDocCharges.visible = false;
                            rectDocCharges.styleClass = "rectbutton";
                            rectDocCharges.onMouseClicked = rectDocChargesOnMouseClickedAtShown;
                            rectDocCharges.fill = Yellow;
                            rectDocCharges.stroke = DarkGray;
                            rectDocCharges.width = 100.0;
                            rectDocCharges.height = 20.0;
                            rectDocCharges.arcWidth = 10.0;
                            rectDocCharges.arcHeight = 10.0;
                            label17.visible = false;
                            __layoutInfo_label17.width = 100.0;
                            label17.text = "Doctor Charges";
                            label17.font = Arial_Bold_12;
                            label17.hpos = javafx.geometry.HPos.CENTER;
                            label17.textFill = DarkGray;
                            btnYes.visible = false;
                            btnYes.text = "Button";
                            rectangle2.visible = false;
                            rectangle2.fill = javafx.scene.paint.Color.BLACK;
                            rectangle2.stroke = null;
                            rectangle2.width = 100.0;
                            rectangle2.height = 50.0;
                            rectangle2.arcWidth = 0.0;
                            rectangle2.arcHeight = 0.0;
                            lbltoDocCharges.visible = false;
                            lbltoDocCharges.styleClass = "rectbutton";
                            lbltoDocCharges.text = "Label";
                            lbltoDocCharges.hpos = javafx.geometry.HPos.LEFT;
                            grouptoCharges.visible = false;
                            grouptoCharges.effect = null;
                            panel.visible = true;
                            panelCharges.visible = false;
                            rectbutton.visible = false;
                            rectbutton.fill = javafx.scene.paint.Color.BLACK;
                            rectbutton.height = 50.0;
                            rectbutton.arcWidth = 0.0;
                            rectbutton.arcHeight = 0.0;
                            labelDoctor_Info.visible = false;
                            labelDoctor_Info.text = "Label";
                            labelDoctor_Info.hpos = javafx.geometry.HPos.LEFT;
                            grouptoDoc.visible = false;
                            panelDocCharges.visible = true;
                        }
                    }
                ]
            }
        ]
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel, panelDocCharges, ]
    }
    // </editor-fold>//GEN-END:main


    function panelOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        panel.requestFocus();
         }

    function btnDoctorResetOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
        btnDoctorResetActionAtShown();
        }else{ shortcut(event);}
         }

    function btnDoctorEditOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
        btnDoctorEditActionAtShown();
        }else{ shortcut(event);}
         }
    function btnDoctorSaveOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
        btnDoctorSaveActionAtShown();
        }else{ shortcut(event);}
         }

    function grouptoDocOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        LinktoDoctor();
    }

    function grouptoDocOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        LinktoDoctor();
    }

    function grouptoChargesOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        LinktoCharges();
    }

    function grouptoChargesOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        LinktoCharges();
    }

    function LinktoCharges(): Void {
        value = 3;
        delete  panelCharges.content;
        def DoctorCommission = DoctorCommission {};
        DoctorCommission.StartUp () ;
        insert DoctorCommission.getDesignRootNodes() into panelCharges.content;

        panelDocCharges.visible = true;
        grouptoDoc.visible = true;
    }

    function LinktoDoctor(): Void {
        value = 0;
        panel.visible = true;
        panelDocCharges.visible = false;
        grouptoDoc.visible = false;
    }    
    var mandatory = CommonDeclare.textbox_mandatory();
    var error = CommonDeclare.textbox_error();

    function rectangleOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        panel.requestFocus();
    }

    var panelW = bind CommonDeclare.panelFormW on replace{
        listDoctor.visible=false;
    }

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
    var CancelW = bottonW;
    var bottonH = bind CommonDeclare.bottonH;
    var seperatorW = bind CommonDeclare.seperatorW;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;//200
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;//150
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;//100
    var Type4TextboxW = bind CommonDeclare.Type4TextboxW;//50
    var Type5TextboxW = bind (3.811944091 * panelW / 100);//30
    var ImgDocSplArrow = bind C4LX + Type2TextboxW;
    var ImgCountryArrow = bind C2LX + Type2TextboxW;
    var ImgStateArrow = bind C2LX + Type2TextboxW;
    var ImgDocCodeArrow = bind C2LX + Type3TextboxW;
    var rectbutton1LX = 30.0;
    var rectbutton2LX = bind CommonDeclare.rectbutton2LX;
    var rectbuttonLY = bind CommonDeclare.rectbuttonLY;
    var listLX = 0.0;
    var listLY = 0.0;
    var listW = 0.0;
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Doctor Information", type);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Doctor Information", msg);
        showAlertbox();
    }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Doctor Information", msg);
        showAlertbox();        
        err_txtbox.style = error;
        err_txtbox.requestFocus();
    }

    function imgDoctorSplOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        try {
            txtDoctorSpl.requestFocus();
            getSpecialist(0);
            if (txtDoctorSpl.text.length() > 0 or txtDoctorSpl.text != null){
                txtDoctorAdd1.requestFocus () ;
            }
        } catch (e: Exception) {
            var msg: String = "Class : DoctorInformation method : getSpecialist()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function txtDoctorSplOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        getSpecialist(1);
        if (event.code == KeyCode.VK_DOWN and listDoctor.items != null) {
            listDoctor.requestFocus();
            listDoctor.selectFirstRow();
        }
        if (event.code == KeyCode.VK_ESCAPE ){                
                listDoctor.visible = false ;
                txtDoctorSpl.requestFocus();            
        }

    }

    function imgDoctorDCodeOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {


        if (btnDoctorSave.text == "Update [F7]" and btnDoctorEdit.text == "Delete [F5]") {
            try {
                getDoctorCode(0);
        } catch (e: Exception) {
            var msg: String = "Class : DoctorInformation method : getDoctorCode()   = {e.getMessage()}";
            log.debug(msg);
        }

        }

    }

    function imgDoctorStateOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {

        txtDoctorState.requestFocus();
        getState (0) ;
        if (txtDoctorState.text.length() > 0 or txtDoctorState.text != null) {
            txtDoctorPinCode.requestFocus();
        }
    }

    function imgDoctorCountryOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        txtDoctorCountry.requestFocus () ;
        getCountry (0) ;
    }

    function imgDoctorSplOnMouseClickedAtFromSales(event: javafx.scene.input.MouseEvent): Void {
        txtDoctorSpl.requestFocus();
        getSpecialist(0);
        if (txtDoctorSpl.text.length() > 0 or txtDoctorSpl.text != null){
            txtDoctorAdd1.requestFocus () ;
        }
    }

    function btnDoctorResetActionAtShown(): Void {
        if (btnDoctorReset.text == "Reset [F4]") {
            enable_mandatory() ;
            try {
                clear();
                //Common Controller Call                
                getAutoIncre = commonController.getAutoIncrement("DoctorInfo");
                txtDoctorRegID.requestFocus();
            } catch (e: Exception) {
                var msg: String = "Class : DoctorInformation method : Reset()   = {e.getMessage()}";
                log.debug(msg);
            }
        } 

    }


    function btnDoctorEditActionAtShown(): Void {
        CancelW = bottonW + 50;
        imgEdit.image = imageCancel;
        imgCancel.image = imageBack;
        //doctorEdit();

        if (btnDoctorEdit.text == "Edit [F6]") {
            btnDoctorEdit.text = "Delete [F5]";
            btnDoctorSave.text = "Update [F7]";
            btnDoctorCancel.text = "Back [Ctrl+Left]";
            imgDoctorDCode.visible = true;
            txtDoctorDCode.requestFocus();                
            txtDoctorDCode.disable = false;
            txtDoctorDCode.promptText = "";
            txtDoctorDCode.text="";
            txtDoctorDCode.editable = false ;
            txtDoctorDCode.requestFocus();
        btnDoctorEdit.text = "Delete [F5]";
        imgDoctorDCode.visible = true;
        //doctorEdit();
        }
        else if (btnDoctorEdit.text == "Delete [F5]") {
                doctorDelete();
        }

    }

    function btnDoctorSaveActionAtShown(): Void {

        if (btnDoctorSave.text == "Save [F3]") {
            doctorSave();
        }else     if (btnDoctorSave.text == "Update [F7]") {
            doctorEdit();

        }
    }

    function txtDoctorDCodeOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (btnDoctorSave.text == "Update [F7]" and btnDoctorEdit.text == "Delete [F5]") {
            getDoctorCode(1);
            if (not listDoctor.items.isEmpty() and event.code == KeyCode.VK_DOWN) {
                listDoctor.visible = true;
                listDoctor.requestFocus();
            } else if (listDoctor.items.isEmpty() and event.code == KeyCode.VK_DOWN) {
                listDoctor.visible = false;
            }
        }

    }

    function txtDoctorDCodeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
          txtDoctorDCode.style = mandatory;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtDoctorRegID.requestFocus();
            listDoctor.visible = false;
        }
        shortcut(event);
    }

    function txtDoctorDNameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtDoctorDName.style = mandatory;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            listDoctor.visible = false;
            txtDoctorHName.requestFocus();
        }
        shortcut(event);
    }

    function rectDocChargesOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {

        panel.visible = false;
        panelDocCharges.visible = true;
    }

    function txtDoctorAdd2OnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {

        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
        //txtDoctorMob.requestFocus();
//        txtDoctorAdd3.requestFocus();
        }
        shortcut(event);

    }

    function btnDoctorCancelOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {        
        if (event.code == KeyCode.VK_ENTER ) {
            doctorCancel();
        }
        if (event.code == KeyCode.VK_TAB)
            txtDoctorRegID.requestFocus () ;
    }

    function txtDoctorAdd3OnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtDoctorAdd3.style = style ;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtDoctorCity.requestFocus();
        }
        shortcut(event);
    }

    public function doctorCancel():Void {
        try {
            if (btnDoctorCancel.text == "Cancel [F8]") {
                clear();
                panel.visible = false;
                panelDocCharges.visible = false;
                CommonDeclare.form[3] = 0;
            } else {
               doctorBack();
            }

        } catch (e: Exception) {
            var msg: String = "Class : DoctorInformation method : doctorCancel()   = {e.getMessage()}";
            log.debug(msg);
        }

    }

    public function doctorBack(): Void {
        enable_mandatory();
        try {
            clear();
            CancelW = bottonW;
            imgEdit.image = imageEdit;
            imgCancel.image = imageCancel;
            srCode = docCode();
            if (srCode == "") {
                srCode = "DOC0000001";
            }
            //Common Controller Call            
            getAutoIncre = commonController.getAutoIncrement("DoctorInfo");
            btnDoctorEdit.disable = false;
            btnDoctorSave.disable = false;
            btnDoctorReset.disable = false;			
            btnDoctorCancel.text = "Cancel [F8]";
            btnDoctorEdit.text = "Edit [F6]";
            btnDoctorReset.text = "Reset [F4]";
            btnDoctorSave.text = "Save [F3]";
            btnDoctorSave.visible = true;
            listDoctor.visible = false;
            imgDoctorDCode.visible = false;
            txtDoctorDCode.text = "{docCodeValue()}";
            txtDoctorRegID.requestFocus();
        } catch (e: Exception) {
            var msg: String = "Class : Doctors Informatmation  method : doctorBack()   = {e.getMessage()}";
            log.debug(msg);
        }

    }

    function btnDoctorCancelActionAtShown(): Void {
        if (btnDoctorCancel.text == "Back [Ctrl+Left]") {
            doctorBack();
        } else if (btnDoctorCancel.text == "Cancel [F8]") {
            doctorCancel();
        }else if(btnDoctorCancel.text == "<-- Back"){
            def patientDetails = PatientDetails {};
            delete panel.content;
            insert patientDetails.getDesignRootNodes() into panel.content;
            panel.visible=true;
        }
      }

    function txtDoctorAdd2OnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtDoctorAdd2.style = style ;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB)
            txtDoctorAdd3.requestFocus();
    }
    var escPress = false ;
    function txtDoctorSplOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtDoctorSpl.style = style ;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            
            if (commonController.Specialist(txtDoctorSpl.text).contains(txtDoctorSpl.text)) {
                listDoctor.visible = false ;
                txtDoctorAdd1.requestFocus ();
            }
            else {
                txtDoctorSpl.text = "" ;
                listDoctor.visible = false ;
                txtDoctorAdd1.requestFocus () ;
            }
        }
        shortcut(event);
    }

    function txtDoctorSplOnKeyReleasedAtFromSales(event: javafx.scene.input.KeyEvent): Void {
        getSpecialist(1);
        if (event.code == KeyCode.VK_DOWN) {
            listDoctor.requestFocus();
            listDoctor.selectFirstRow();
        }
        if (event.code == KeyCode.VK_ESCAPE ) {            
            listDoctor.visible = false ;
            txtDoctorSpl.requestFocus();
        }
    }

    function txtDoctorHNameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtDoctorHName.style = style ;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtDoctorSpl.requestFocus();

        }
        shortcut(event);
    }

    function txtDoctorRegIDOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtDoctorRegID.style = style ;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {

            //txtDoctorAdd1.requestFocus();
            txtDoctorDName.requestFocus();
        }
        shortcut(event);
    }

    function txtDoctorAdd1OnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        //txtDoctorAdd1.style = mandatory;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {

            txtDoctorAdd2.requestFocus();
        }
        shortcut(event);
    }

    function txtDoctorCityOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        //txtDoctorCity.style = mandatory;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtDoctorCountry.requestFocus();
        }
        shortcut(event);
    }

    function txtDoctorCountryOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtDoctorCountry.style = style ;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            if (commonController.selectCountry(txtDoctorCountry.text)) {
                    listDoctor.visible = false ;
                    txtDoctorState.requestFocus();
                }
                else {
                    listDoctor.visible = false ;
                    txtDoctorState.text = "" ;
                    txtDoctorPinCode.requestFocus();
                }
            }        
        shortcut(event);
    }

    function txtDoctorCountryOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        getCountry(1);
        if (event.code == KeyCode.VK_DOWN and listDoctor.items !=null ) {
            listDoctor.requestFocus() ;
            listDoctor.selectFirstRow();
        }
        if (event.code == KeyCode.VK_ESCAPE) {            
            listDoctor.visible = false ;
            txtDoctorCountry.requestFocus () ;
        }


    }

    function txtDoctorStateOnKeyPressedAtShown (event: javafx.scene.input.KeyEvent) : Void {
        txtDoctorState.style = style ;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            if(commonController.selectState (txtDoctorCountry.text, txtDoctorState.text)) {
                listDoctor.visible = false ;
                txtDoctorPinCode.requestFocus();
            }
            else {
                if (txtDoctorCountry.text.length() == 0)
                    txtDoctorState.text = "" ;
                listDoctor.visible = false ;                
                txtDoctorPinCode.requestFocus();
            }            
        }
        shortcut(event) ;
    }

    function txtDoctorStateOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {

        getState(1);

        if (event.code == KeyCode.VK_DOWN and listDoctor.items != null) {
            listDoctor.requestFocus();
            listDoctor.selectFirstRow();
        }
        if (event.code == KeyCode.VK_ESCAPE) {
            listDoctor.visible = false;
            txtDoctorState.requestFocus();
        }
    }

    function txtDoctorPinCodeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtDoctorPinCode.style = style ;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtDoctorPhone.requestFocus();
        }
        shortcut(event);
    }

    function txtDoctorPhoneOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtDoctorPhone.style = style ;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtDoctorMob.requestFocus();
        }
        shortcut(event);
    }

    function txtDoctorMobOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtDoctorMob.style = style ;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtDoctorMail.requestFocus();
        }
        shortcut(event);

    }

    function txtDoctorMailOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtDoctorMail.style = style ;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtDoctorWeb.requestFocus();
        }
        shortcut(event);

    }

    function txtDoctorWebOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtDoctorWeb.style = style ;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            btnDoctorSave.requestFocus();
        }
        shortcut(event);

    }

    function getSpecialist(type: Integer) {
        if(not listDoctor.visible){
        try {
            listDoctor.visible = false;
            txtDoctorSpl.requestFocus () ;
            var listControlObj: ListController = new ListController() ;
            listH = listControlObj.listImageControlView(txtDoctorSpl, listDoctor, "Specialist", type) ;            
            listLX = txtDoctorSpl.layoutX;
            listLY = txtDoctorSpl.layoutY + 21;
            listW = Type2TextboxW;
            var selectString = bind listControlObj.selectedString on replace {
                if (selectString.length() > 0) {                    
                    listDoctor.visible = false;
                    txtDoctorAdd1.requestFocus();
                }
            }
        } catch (e: Exception) {
            var msg: String = "Class : DoctorInformation method : getSpecialist()   = {e.getMessage()}";
            log.debug(msg);
        }
      }
       else{
           listDoctor.visible = false;
           txtDoctorSpl.requestFocus();
       }
    }

    function getState(con: Integer) : Void {
        if(not listDoctor.visible){
        try {
         listDoctor.visible = false ;
         var listControlObj: ListController = new ListController();
         listH = listControlObj.listStateControlView(txtDoctorState, txtDoctorCountry.rawText, listDoctor, "", con);
         listLX = txtDoctorState.layoutX;
         listLY = txtDoctorState.layoutY + 21;
         listW = Type2TextboxW;
         var selS = bind listControlObj.selectedString on replace {
             if (selS.length()  > 0) {
                 listDoctor.visible = false ;
                 txtDoctorPinCode.requestFocus();
             }
         }

        } catch (e: Exception) {
            var msg: String = "Class : DoctorInformation method : getState()   = {e.getMessage()}";
            log.debug(msg);
        }
            }
       else{
           listDoctor.visible =false;
           txtDoctorState.requestFocus();
       }
    }

    function getCountry(con: Integer) {
      if(not listDoctor.visible){
        try {
            listDoctor.visible = false ;
            var listControlObj: ListController = new ListController() ;
            listH = listControlObj.listImageControlView(txtDoctorCountry, listDoctor, "Country", con) ;
            listLX = txtDoctorCountry.layoutX ;
            listLY = txtDoctorCountry.layoutY + 21 ;
            listW = Type2TextboxW;

            var selS = bind listControlObj.selectedString on replace {
                if (selS.length() > 0) {
                    txtDoctorState.text = "" ;
                    getState (1) ;
                }
            }
        } catch (e: Exception) {
            var msg: String = "Class : DoctorInformation method : getCountry()   = {e.getMessage()}";
            log.debug(msg);
        }
     }
        else{
            listDoctor.visible =false;
            txtDoctorCountry.requestFocus();
        }
    }

    function getDoctorCode(type: Integer) {
        if(not listDoctor.visible){
        try {
            listDoctor.visible = false ;
            var listControlObj: ListController = new ListController() ;
            listH = listControlObj.listImageControlView(txtDoctorDCode, listDoctor, "DoctorCode", type) ;
            listLX = txtDoctorDCode.layoutX;
            listLY = txtDoctorDCode.layoutY + 21;
            listW = Type3TextboxW;
            var selectString = bind listControlObj.selectedString on replace {
                if (selectString.length() > 0) {
                    listDoctor.visible = false;
                    displayDoctor(selectString) ;                    
                    txtDoctorRegID.requestFocus();
                }
            }
        } catch (e: Exception) {
            var msg: String = "Class : DoctorInformation method : getDoctorCode()   = {e.getMessage()}";
            log.debug(msg);
        }
      }
       else{
           listDoctor.visible = false;
           txtDoctorDCode.requestFocus();
       }
    }

    public function docCode(): String {
        //Common Controller Call        
        var code1=commonController.getAutoIncrement("DoctorInfo");
        var finalCode: String = code1;
    }

    public function docCodeValue(): Integer {
        
        var code: Integer;
        try {
            //Common Controller Call            
            code=Integer.parseInt(commonController.getDocCodeValue("DoctorInfo"));
        } catch (e: Exception) {
            var msg: String = "Class : DoctorInformation method : docCodeValue()   = {e.getMessage()}";
            log.debug(msg);
        }        
        return code;
    }
    function initial(): Void {
        try {
            doctorModel =new DoctorModel();
            //CommonController Call            
            getAutoIncre =commonController.getDocCodeValue("DoctorInfo");
            doctorModel.setDoctorCode(txtDoctorDCode.rawText.trim());
            doctorModel.setDoctorName(txtDoctorDName.rawText.trim());
            doctorModel.setHospitalName(txtDoctorHName.rawText.trim());
            doctorModel.setRegistrationId(txtDoctorRegID.rawText.trim());
            doctorModel.setAddress1(txtDoctorAdd1.rawText.trim());
            doctorModel.setAddress2(txtDoctorAdd2.rawText.trim());
            doctorModel.setAddress3(txtDoctorAdd3.rawText.trim());
            doctorModel.setCity(txtDoctorCity.rawText.trim());
            doctorModel.setCountry(txtDoctorCountry.rawText.trim());
            doctorModel.setPincode(txtDoctorPinCode.rawText.trim());
            doctorModel.setState(txtDoctorState.rawText.trim());
            doctorModel.setSpecialty(txtDoctorSpl.rawText.trim());
            doctorModel.setMobileNumber(txtDoctorMob.rawText.trim());
            doctorModel.setPhoneNumber(txtDoctorPhone.rawText.trim());
            doctorModel.setEmailid(txtDoctorMail.rawText.trim());
            doctorModel.setWebsite(txtDoctorWeb.rawText.trim());     
        } catch (e: Exception) {
            var msg: String = "Class : DoctorInformation method : initial()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function clear(): Void {
        try {            
            txtDoctorDName.text = "";
            txtDoctorHName.text = "";
            txtDoctorRegID.text = "";
            txtDoctorAdd1.text = "";
            txtDoctorAdd2.text = "";
            txtDoctorAdd3.text = "";
            txtDoctorCity.text = "";
            txtDoctorCountry.text = "";
            txtDoctorPinCode.text = "";
            txtDoctorState.text = "";
            txtDoctorSpl.text = "";
            txtDoctorMob.text = "";
            txtDoctorPhone.text = "";
            txtDoctorMail.text = "";
            txtDoctorWeb.text = "";
            //default style
            txtDoctorDCode.style = style ;
            txtDoctorHName.style = style ;
            txtDoctorRegID.style =  style ;
            txtDoctorAdd1.style =  style ;
            txtDoctorAdd2.style =  style ;
            txtDoctorAdd3.style =  style ;
            txtDoctorCity.style =  style ;
            txtDoctorCountry.style =  style ;
            txtDoctorPinCode.style =  style ;
            txtDoctorState.style =  style ;
            txtDoctorSpl.style =  style ;
            txtDoctorMob.style =  style ;
            txtDoctorPhone.style =  style ;
            txtDoctorMail.style =  style ;
            txtDoctorWeb.style =  style ;
            //Common Controller Call            
            getAutoIncre = commonController.getAutoIncrement("DoctorInfo");
            
            txtDoctorDCode.text = "{docCodeValue()}";            
            if ( btnDoctorSave.text != "Save [F3]") {
                txtDoctorDCode.text = "" ;
            }
            listDoctor.visible = false ;
        } catch (e: Exception) {
            var msg: String = "Class : DoctorInformation method : clear()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function doctorSave(): Integer {
        var doct: Integer = 0;
        try {
            var san: Integer = 0;
            san = DoctorInformation();
            if (san == 10) {                
                initial();
                //Common Controller Call                
                getAutoIncre = commonController.getAutoIncrement("DoctorInfo");
                doctorModel.setDoctorCode(docCodeValue().toString());
                newDoc = txtDoctorDName.rawText.trim();
                //Doctor Controller Instance
                    doctorModel.setDoctor_id(getAutoIncre);
                    if(getAutoIncre!=null)
                    doctorController = RegistryFactory.getClientStub(RegistryConstants.Doctor) as Doctor;
                    doctorController.createRecord(doctorModel);
                    //Common Controller Call
                    commonController.updateLog("Doctor Information",btnDoctorSave.text );
                    FXalert(0);
                    txtDoctorDCode.requestFocus();
                    clear();
                    subStr1 = subStr1 + 1;
                    txtDoctorDCode.text = "{docCodeValue()}";
                    checkVal = 1;
                    isBack = not isBack;
            }
        } catch (e: Exception) {
            var msg: String = "Class : DoctorInformation method : doctorSave()()   = {e.getMessage()}";
            log.debug(msg);
           
        }
     return doct;
   }

    public function doctorEdit(): Void {
        getPrivileges() ;
        if (btnDoctorSave.text == "Update [F7]") {
            try {
                if (txtDoctorDCode.text.trim().length() == 0) {
                    txtDoctorDCode.text = "" ;
                    FXinfo("Please select a valid Doctor Code...", txtDoctorDCode) ;
                }else if (txtDoctorDCode.text != null) {
                    var san: Integer = 0 ;
                    san = DoctorInformation() ;
                    if (san == 10) {
                        initial();
                        var cn : ConfirmDialogBox = new ConfirmDialogBox (0,"Doctor Details") ;
                        var a =bind cn.staus;
                        if (a) {
                            //Doctor Controller Call
                            doctorController = RegistryFactory.getClientStub(RegistryConstants.Doctor) as Doctor;
                            doctorController.updateRecord(doctorModel);
                              FXalert(4);
                            //Common Controller Call                            
                            commonController.updateLog("Doctor Information",btnDoctorSave.text );
                            clear () ;
                            txtDoctorDCode.text="";
                            txtDoctorDCode.requestFocus();
                        }                        
                    }
                }

            } catch (e: Exception) {
                var msg: String = "Class : Doctors   method : doctorEdit()   = {e.getMessage()}";
                log.debug(msg);
            }
        }       
    }

    public function doctorDelete(): Void {
        try {
            if (txtDoctorDName.text.trim().length() == 0) {
                txtDoctorDCode.text = "";
                  FXinfo("Please select a valid Doctor Code...", txtDoctorDCode);
            }else  if (txtDoctorDName.text != null) {
                initial();
                var cn : ConfirmDialogBox = new ConfirmDialogBox (1,"Doctor Details");
                var a =bind cn.staus;
                                if (a) {
                                    //Doctor Controller Call
                                    doctorController = RegistryFactory.getClientStub(RegistryConstants.Doctor) as Doctor;
                                    doctorController.deleteRecord(txtDoctorDCode.rawText);
                                      FXalert(5);
                                    //Common Controller Call                                    
                                    commonController.updateLog("Doctor Information",btnDoctorSave.text );
                                    doctorBack();
                                } else {
                                }
                                txtDoctorDCode.text = "";
                                txtDoctorDCode.requestFocus();

                                clear();                                
            }

        } catch (e: Exception) {
            var msg: String = "Class : DoctorInformation method : doctorDelete()   = {e.getMessage()}";
            log.debug(msg);
           
        }
    }

    function displayDoctor(code: String): Void {
        try {

            //Doctor Controller Call
            doctorController = RegistryFactory.getClientStub(RegistryConstants.Doctor) as Doctor;
            var doctorModel1 : DoctorModel=doctorController.viewRecord(code) as DoctorModel;
            getAutoIncre = doctorModel1.getDoctor_id();
            txtDoctorDCode.text = doctorModel1.getDoctorCode();
            txtDoctorDName.text = doctorModel1.getDoctorName();
            txtDoctorHName.text = doctorModel1.getHospitalName();
            txtDoctorRegID.text = doctorModel1.getRegistrationId();
            txtDoctorAdd1.text = doctorModel1.getAddress1();
            txtDoctorAdd2.text = doctorModel1.getAddress2();
            txtDoctorAdd3.text = doctorModel1.getAddress3();
            txtDoctorCity.text = doctorModel1.getCity();
            txtDoctorCountry.text = doctorModel1.getCountry();
            txtDoctorState.text = doctorModel1.getState();
            txtDoctorPinCode.text = doctorModel1.getPincode();
            txtDoctorSpl.text = doctorModel1.getSpecialty();
            txtDoctorMob.text = doctorModel1.getMobileNumber();
            txtDoctorPhone.text = doctorModel1.getPhoneNumber();
            txtDoctorMail.text = doctorModel1.getEmailid();
            txtDoctorWeb.text = doctorModel1.getWebsite();

        } catch (e: Exception) {
            var msg: String = "Class : DoctorInformation method : displayDoctor()   = {e.getMessage()}";
            log.debug(msg);           
        }
    }

    function DoctorInformation(): Integer {

        var cnt: Integer = 0;
        var val: Validation = null;
        val = new Validation();

        var docname = txtDoctorDName.rawText.trim();
        var hosname = txtDoctorHName.rawText.trim();
        var regid = txtDoctorRegID.rawText.trim();
        var add1 = txtDoctorAdd1.rawText.trim();
        var add2 = txtDoctorAdd2.rawText.trim();
        var add3 = txtDoctorAdd3.rawText.trim();
        var city = txtDoctorCity.rawText.trim();
        var pincode = txtDoctorPinCode.rawText.trim();
        var special = txtDoctorSpl.rawText.trim();
        var mobile = txtDoctorMob.rawText.trim();
        var phone = txtDoctorPhone.rawText.trim();
        var mail = txtDoctorMail.rawText.trim();
        var web = txtDoctorWeb.rawText.trim();

        var stateVal = currentState.actual;

        try {            
            var si1: Integer = 0; si1 = val.getAlphaValid(docname, 6, 35);
            var si2: Integer = 0; si2 = val.getAlphaSpecialValid(hosname, 3, 35);
            var si3: Integer = 0; si3 = val.getAlphaNumericValid(regid, 5, 35);
            var si4: Integer = 0; si4 = val.getAddressValid(add1, 4, 35);
            var sia2: Integer = 0; sia2 = val.getAddressValid(add2, 4, 35);
            var sia3: Integer = 0; sia3 = val.getAddressValid(add3, 4, 35);
            var si5: Integer = 0; si5 = val.getAddressValid(city, 2, 30);

            var si8: Integer = 0; si8 = val.getAlphaValid(special, 2, 35);
            var si9: Integer = 0; si9 = val.getNumberValid(pincode, 4, 8);

            var si10: Integer = 10;
            if (mobile.length() > 0) {
                si10 = val.getMobileNoValid(mobile, 6, 12);
            }
            var si11: Integer = 10 ;
            if (phone.length() > 0) {
                si11 = val.getPhoneNoValid(phone, 6, 20);
            }            
            var si12: Integer = 0; si12 = val.getEmailIdValid(mail, 10, 40);
            var si13: Integer = 0; si13 = val.getWebsiteValid(web, 4, 30);            
            if (stateVal == 0) {                
                if (docname.trim().length() <= 0) {
                    FXinfo("Please enter Doctor Name!", txtDoctorDName);
                }
                else if (si1 == 0) {
                    FXinfo("Doctor Name can contain only alphabets and spaces.) ", txtDoctorDName);
                } else if (si1 < 7) {
                    FXinfo("Please enter a minimum of 6 characters.)", txtDoctorDName);
                } else if (si1 > 36) {
                    FXinfo("Doctor Name cannot exceed 35 characters.)", txtDoctorDName);

                } else if (si2 == 0) {
                    FXinfo("Hospital Name can contain only alphabets and spaces.)");
                } //                else if (si2 < 4) {
                //                    FXinfo("Please enter a minimum of 3 Characters )", txtDoctorHName);
                //                }
                else if (si2 > 36) {
                    FXinfo("Hospital Name cannot exceed 35 Characters.)", txtDoctorHName);
                } else if (si4 == 0) {
                    FXinfo("Address1 will accept both alphabets and numerals.)", txtDoctorAdd1);
                } //                else if (si4 < 5) {
                //                    FXinfo("Please Enter Address1(Need Miniumum 4 Characters )", txtDoctorAdd1);
                //                }
                else if (si4 > 36) {
                    FXinfo("Address1 cannot exceed 35 characters.)", txtDoctorAdd1);
                } else if (sia2 == 0) {
                    FXinfo("Address2 will accept both alphabets and numerals.)", txtDoctorAdd1);
                } //                else if (sia2 < 5) {
                //                    FXinfo("Please Enter Address2(Need Miniumum 4 Characters )", txtDoctorAdd1);
                //                }
                else if (sia2 > 36) {
                    FXinfo("Address2 cannot exceed 35 characters.)", txtDoctorAdd2);
                } else if (sia3 == 0) {
                    FXinfo("Address3 will accept both alphabets and numerals.", txtDoctorAdd1);
                } //                else if (sia3 < 5) {
                //                    FXinfo("Please Enter Address3(Need Miniumum 4 Characters )", txtDoctorAdd3);
                //                }
                else if (sia3 > 36) {
                    FXinfo("Address3 cannot exceed 35 characters.", txtDoctorAdd3);
                } else if (si5 == 0) {
                    FXinfo("Please enter only alphabets.", txtDoctorCity);
                } //                else if (si5 < 3) {
                //                    FXinfo("Please Enter City(Need Miniumum 2 Character's )", txtDoctorCity);
                //                }
                else if (si5 > 31) {
                    FXinfo("City can accept a maximum of 30 Characters only)", txtDoctorCity);
                } else if (si9 == 0) {
                    FXinfo("Please enter only Numerals.", txtDoctorPinCode);
                } else if (si9 == 1) {
                    FXinfo("Please enter valid PinCode", txtDoctorPinCode);
                } else if (si9 < 5) {
                    FXinfo("PinCode requires a minimum of 4 Characters.", txtDoctorPinCode);
                } else if (si10 == 0) {
                    FXinfo("Please enter only Numerals.", txtDoctorMob);
                } else if (si10 == 11) {
                    FXinfo("Minimum of 10 numerals are required!", txtDoctorMob);
                } else if (si10 == 1) {
                    FXinfo("Cannot exceed more than 12 numerals!", txtDoctorMob);
                } else if (si11 == 0) {
                    FXinfo("Please enter only Numerals.", txtDoctorPhone);
                } else if (si11 == 11) {
                    FXinfo("Minimum of 6 numerals are required.", txtDoctorPhone);
                } else if (si11 == 1) {
                    FXinfo("Cannot exceed more than 20 numerals.", txtDoctorPhone);
                } else if (si12 == 0) {
                    FXinfo("Email ID will accept both alphabets and numerals.", txtDoctorMail);
                } else if (si12 == 11 and mail.trim().length() > 0) {
                    FXinfo("Invalid EmailId.", txtDoctorMail);
                } else if (si12 == 1 and mail.trim().length() > 0) {
                    FXinfo("EmailId cannot exceed 40 characters.", txtDoctorMail) ;
                } else if (si13 == 0) {
                    FXinfo( "Website(Only Characters and No's Allowed ) ");
                    txtDoctorWeb.requestFocus();
                }
                else if (si13 == 11 and web.trim().length()>0) {
                    FXinfo( "Enter Website (Only 35 Characters  Allowed )");
                    txtDoctorWeb.requestFocus();
                }
                else if (txtDoctorCountry.rawText.length() > 0 and not commonController.selectCountry(txtDoctorCountry.rawText)) {
                    FXinfo ("Please Enter a valid Country", txtDoctorCountry) ;
                }
                else if (txtDoctorState.rawText.length() > 0 and not commonController.selectState (txtDoctorCountry.rawText, txtDoctorState.rawText)) {
                    FXinfo ("Please Enter a valid State", txtDoctorState) ;
                }
                else if (txtDoctorSpl.rawText.length() > 0 and not commonController.Specialist (txtDoctorSpl.rawText).contains (txtDoctorSpl.rawText)) {
                    FXinfo ("Please Enter a valid Specialist", txtDoctorSpl) ;                    
                }
                else {
                    cnt = 10;
                }
            } else if (stateVal == 1) {                
                if (docname.trim().length() <= 0) {
                    FXinfo("Please enter Doctor Name", txtDoctorDName);
                }
//                else if (si1 < 7) {
//                    FXinfo("Please enter a minimum of 6 characters for Doctor Name.", txtDoctorDName);
//                } else if (si1 > 36) {
//                    FXinfo("Doctor Name cannot exceed 35 characters.", txtDoctorDName);
//                }

                else {
                    cnt = 10;
                }
            }
        } catch (e: Exception) {
            var msg: String = "Class : Doctor Information  method : DoctorInformation()   = {e.getMessage()}";
            log.debug(msg);
           
        }
        return cnt;
    }

    public function getPrivileges(): Void {
        var uname = CommonDeclare.user;
        //CommonController Call        
        var utype = commonController.getUserType(uname);
        try {
            if (utype.equals("User")) {
                //Common Controller Call
                var priv = commonController.getPrivileges("masters", uname);
                var ss = priv.split(",");
                var val = Integer.parseInt(ss[2]);
                if (val == 1) {
                    btnDoctorEdit.disable = true;
                    btnDoctorReset.disable = true;
                } else if (val == 2) {
                    btnDoctorReset.disable = true;
                } else if (val == 3) {
                    btnDoctorSave.disable = false;
                    btnDoctorSave.disable = false;
                    btnDoctorSave.disable = false;
                }
            }
        } catch (e: Exception) {
            var msg: String = "Class : DoctorInformation method : getPrivileges()   = {e.getMessage()}";
            log.debug(msg);
           
        }
    }
    public function getPrivileges(u : String): Void {
        var uname = u;
         //CommonController Call
        var utype = commonController.getUserType(uname);
        if(utype.equals("User"))
        {
          //Common Controller Call
            var priv = commonController.getPrivileges("masters", uname);
            var ss = priv.split(",");
            var val = Integer.parseInt(ss[2]);
            if(val == 1)
            {
				btnDoctorSave.disable=true;
				if(btnDoctorEdit.text!="Edit [F6]")
				{
					btnDoctorEdit.disable=true;
				}
				else{
					btnDoctorEdit.disable=false;
				}      
            }
            else if(val == 2)
            {				
				if(btnDoctorEdit.text!="Edit [F6]")
				{
					btnDoctorEdit.disable=true;
				}
				else{
					btnDoctorEdit.disable=false;
				}
				btnDoctorSave.disable=false;				
                //This code for  READ and WRITE Access
            }
            else if(val == 3)
            {
				btnDoctorSave.disable=false;
				btnDoctorEdit.disable=false;
                //This code for FULL Access
            }
        }else {
				btnDoctorSave.disable=false;
				btnDoctorEdit.disable=false;		
		}
    }
var logUser: String =  bind CommonDeclare.user on replace{
            getPrivileges(logUser);
        }

var changPiv =  bind btnDoctorEdit.text on replace{
            getPrivileges(logUser);
        }

var changPiv1 =  bind btnDoctorSave.text on replace{
            getPrivileges(logUser);
        }		
    def kr = KeyRegistry {};
    var key = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 4 and CommonDeclare.form[3] == 3) {
            shortcut(key);
        }
        if (CommonDeclare.currModule == 2 and currentState.actual == currentState.findIndex("FromSales")) {
            shortcut(key);
        }
    }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {
        if (currentState.actual==1) {
            if (event.code == kr.save and btnDoctorSave.text == "Save [F3]") {
                doctorSave();
            }        
            if (event.code == kr.reset and btnDoctorReset.text == "Reset [F4]") {             
                clear();
                btnDoctorReset.requestFocus();
            }
	} else if (currentState.actual != 1) {
            if (event.code == kr.save and btnDoctorSave.text == "Save [F3]" and not btnDoctorSave.disable) {
                doctorSave();
            }
            if (event.code == kr.edit and btnDoctorEdit.text == "Edit [F6]" and not btnDoctorEdit.disable) {
                btnDoctorEditActionAtShown();
            }
            if (event.code == kr.update and btnDoctorSave.text == "Update [F7]" and not btnDoctorSave.disable) {
                doctorEdit(); 
            }
            if (event.code == kr.del and btnDoctorEdit.text == "Delete [F5]" and not btnDoctorEdit.disable) {
                doctorDelete();
            }
             if (event.code == kr.reset and btnDoctorReset.text == "Reset [F4]") {
                clear();
                btnDoctorReset.requestFocus();
            }
            if (event.controlDown == true and event.code == kr.back) {
                if (btnDoctorCancel.text == "Back [Ctrl+Left]") { doctorBack(); }
            }
            if (event.code == kr.cancel) {
                if (btnDoctorCancel.text == "Cancel [F8]") {
                    doctorCancel () ;
                }
            }
        } else if(currentState.actual == 1) {
              if (event.controlDown and event.code == kr.back) {
                    isBack = not isBack;
                }
        }
    }
    public function DocSales(): Void {
        currentState.actual = currentState.findIndex("FromSales");
    }

    function enable_mandatory(): Void {
        txtDoctorDName.style = mandatory;                
    }

    public function Startup(): Void {
        btnDoctorResetActionAtShown();
        panel.visible = true;
        LinktoDoctor();
        srCode = docCode();
        if (srCode == "" and docCodeValue() == 0) {
            srCode = "DOC0000001";
            txtDoctorDCode.text = "{docCodeValue()}";
        }
        txtDoctorDCode.text = "{docCodeValue()}";
        getAutoIncre = srCode;
        txtDoctorDCode.editable = false;
        //Common Controller Call        
        getAutoIncre = commonController.getAutoIncrement("DoctorInfo");
        if (checkState == 0) {
            currentState.actual = currentState.findIndex("Shown");
        }
        clear();
        txtDoctorDName.requestFocus();
    }
}
