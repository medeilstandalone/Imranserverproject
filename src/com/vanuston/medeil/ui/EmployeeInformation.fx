package com.vanuston.medeil.ui;

import java.lang.*;
import javafx.scene.image.*;
import javafx.scene.input.*;
import javax.swing.JFileChooser;
import java.io.File;
import java.net.URL;
import java.text.SimpleDateFormat;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import com.vanuston.medeil.ui.calendar.theme.Theme;
import javafx.stage.Alert;
import javafx.scene.control.TextBox;
import com.vanuston.medeil.model.EmployeeModel;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.uitables.ConfirmDialogBox;
import com.vanuston.medeil.util.Logger ;
import com.vanuston.medeil.util.DateUtils ;
import com.vanuston.medeil.util.Validation ;
import com.vanuston.medeil.util.Value ;
import com.vanuston.medeil.client.RegistryFactory ;
import com.vanuston.medeil.util.RegistryConstants ;
import com.vanuston.medeil.implementation.Employee ;
import java.sql.SQLException ;
import com.vanuston.medeil.util.CommonDeclare ;
import com.vanuston.medeil.util.KeyRegistry ;
import com.vanuston.medeil.util.ImageFilter ;
import com.vanuston.medeil.util.ImagePreview ;
import com.vanuston.medeil.util.Upload ;


var srCode: String;
var LayoutY: Float;
var listH = 0.0;
var BG: String[] = ["Select", "A +ve", "A -ve", "B +ve", "B -ve", "O +ve", "O -ve", "AB +ve", "AB -ve"];
var imgPath: String = "images/User.png";
var image: Image = Image { url: "{__DIR__}images/User.png" };
var selectFile: String;
var selectFilePath: String;
var curDir: File = new File(System.getProperty("user.dir"));
var path: URL = curDir.toURL();
var dobFlag: Boolean = false;
var dojFlag: Boolean = false;
var sdf: SimpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
var fxCalendar = FXCalendar {
            theme: Theme {};
        };
var log: Logger = Logger.getLogger(EmployeeInformation.class, "Masters");

public class EmployeeInformation {
    var employeeController : Employee ;//= RegistryFactory.getClientStub(RegistryConstants.Employee) as Employee;
    var commonController : CommonImplements ;//= RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;

    var panelW = bind CommonDeclare.panelFormW;
    var panelH = bind CommonDeclare.panelFormH;
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY + 10;
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
    var ImagePhotoLX = bind panelW - 190.0;
    var ImagePhotoLY = bind (18.34180432 * panelH) / 100;
    var CalendarLX = bind (32.02033037 * panelW) / 100;
    var CalendarLY = bind (31.9266055 * panelH) / 100;
    var seperatorW = bind CommonDeclare.seperatorW;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;
    var Type4TextboxW = bind CommonDeclare.Type4TextboxW;
    var Type5TextboxW = bind (3.811944091 * panelW) / 100;
    var ImageCalenderLX = bind C2LX + Type3TextboxW + 2;
    var panelCalenderLX = bind C2LX + Type3TextboxW + 22;
    var ListW: Number = 0;
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 397.5
        layoutY: 0.0
        styleClass: "form-background"
        onMouseClicked: rectangleOnMouseClicked
        width: bind panelW
        height: bind panelH
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
    
    def __layoutInfo_separator2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW-70
        height: 3.0
    }
    public-read def separator2: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: 19.0
        layoutY: 260.0
        layoutInfo: __layoutInfo_separator2
    }
    
    def __layoutInfo_separator3: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
    }
    public-read def separator3: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: 39.0
        layoutY: 440.0
        layoutInfo: __layoutInfo_separator3
    }
    
    public-read def imgSave: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
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
    
    def __layoutInfo_txtEmpCode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtEmpCode: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX
        layoutY: 99.0
        layoutInfo: __layoutInfo_txtEmpCode
    }
    
    def __layoutInfo_txtEmpBG: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtEmpBG: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: bind C4LX
        layoutY: 337.0
        layoutInfo: __layoutInfo_txtEmpBG
        items: bind BG
    }
    
    def __layoutInfo_txtEmpMobile: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtEmpMobile: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 419.0
        layoutInfo: __layoutInfo_txtEmpMobile
    }
    
    public-read def imagePhoto: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind ImagePhotoLX
        layoutY: bind ImagePhotoLY
        image: bind image
    }
    
    public-read def lblEmpUpload: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind ImagePhotoLX+40
        layoutY: bind ImagePhotoLY+160
        text: "Label"
    }
    
    public-read def lblEmpRemove: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind ImagePhotoLX+40
        layoutY: bind ImagePhotoLY+180
        text: "Label"
    }
    
    public-read def imageDOJ: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind ImageCalenderLX
        layoutY: 149.0
    }
    
    public-read def imageDOB: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind ImageCalenderLX
        layoutY: 239.0
    }
    
    def __layoutInfo_labelYears: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def labelYears: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C4LX+Type4TextboxW+5
        layoutY: 263.0
        layoutInfo: __layoutInfo_labelYears
        text: "Label"
    }
    
    def __layoutInfo_listEmp: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind ListW
        height: bind listH
    }
    public-read def listEmp: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C2LX
        layoutY: bind LayoutY
        layoutInfo: __layoutInfo_listEmp
        items: null
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
    }
    
    public-read def imageEmpDown: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C2LX+Type1TextboxW-2
        layoutY: 246.0
    }
    
    public-read def imageCountryDown: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C2LX+Type2TextboxW-2
        layoutY: 419.0
    }
    
    public-read def imageStateDpwn: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C2LX+Type2TextboxW-2
        layoutY: 465.0
    }
    
    public-read def EmpCalendarPanel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind CalendarLX
    }
    
    public-read def txtEmpID: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
    }
    
    public-read def Violet: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.011764706
        green: 0.5019608
        blue: 0.7607843
    }
    
    public-read def linearGradient: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#ffffff") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#f5f0e9") }, ]
    }
    
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        opacity: 1.0
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "rectFormHeader"
        fill: linearGradient
        stroke: Violet
        width: bind panelW
        height: 32.0
    }
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
    }
    
    def __layoutInfo_txtEmpAge: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type5TextboxW
    }
    public-read def txtEmpAge: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 287.0
        layoutInfo: __layoutInfo_txtEmpAge
        font: Arial_12
    }
    
    def __layoutInfo_txtEmpDob: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtEmpDob: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 279.0
        layoutInfo: __layoutInfo_txtEmpDob
        font: Arial_12
    }
    
    def __layoutInfo_txtEmpExp: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtEmpExp: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 301.0
        layoutInfo: __layoutInfo_txtEmpExp
        font: Arial_12
    }
    
    def __layoutInfo_txtEmpQualfy: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtEmpQualfy: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 279.0
        layoutInfo: __layoutInfo_txtEmpQualfy
        font: Arial_12
    }
    
    def __layoutInfo_txtEmpAdd3: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtEmpAdd3: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 440.0
        layoutInfo: __layoutInfo_txtEmpAdd3
        font: Arial_12
    }
    
    def __layoutInfo_txtEmpName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
        hfill: false
    }
    public-read def txtEmpName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 158.0
        layoutInfo: __layoutInfo_txtEmpName
        style: ""
        styleClass: "text-box"
        effect: null
        text: ""
        font: Arial_12
    }
    
    def __layoutInfo_txtEmpState: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtEmpState: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutInfo: __layoutInfo_txtEmpState
        font: Arial_12
    }
    
    def __layoutInfo_txtEmpCountry: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtEmpCountry: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 488.0
        layoutInfo: __layoutInfo_txtEmpCountry
        font: Arial_12
    }
    
    def __layoutInfo_txtEmpPincode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtEmpPincode: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 488.0
        layoutInfo: __layoutInfo_txtEmpPincode
        font: Arial_12
    }
    
    def __layoutInfo_txtEmpEmail: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtEmpEmail: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 452.0
        layoutInfo: __layoutInfo_txtEmpEmail
        font: Arial_12
    }
    
    def __layoutInfo_txtEmpPhone: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtEmpPhone: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 392.0
        layoutInfo: __layoutInfo_txtEmpPhone
        font: Arial_12
    }
    
    def __layoutInfo_txtEmpCity: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtEmpCity: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        managed: true
        layoutX: bind C2LX
        layoutY: 467.0
        layoutInfo: __layoutInfo_txtEmpCity
        font: Arial_12
    }
    
    def __layoutInfo_txtEmpAdd2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtEmpAdd2: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 419.0
        layoutInfo: __layoutInfo_txtEmpAdd2
        font: Arial_12
    }
    
    def __layoutInfo_txtEmpAdd1: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtEmpAdd1: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 392.0
        layoutInfo: __layoutInfo_txtEmpAdd1
        font: Arial_12
    }
    
    def __layoutInfo_txtEmpSalary: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtEmpSalary: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 207.0
        layoutInfo: __layoutInfo_txtEmpSalary
        font: Arial_12
    }
    
    def __layoutInfo_txtEmpDoj: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtEmpDoj: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 186.0
        layoutInfo: __layoutInfo_txtEmpDoj
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
    
    def __layoutInfo_btnEmpCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW+50
        height: bind bottonH
    }
    public-read def btnEmpCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton4LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnEmpCancel
        onKeyReleased: btnEmpCancelOnKeyReleased
        effect: reflectionEffect
        graphic: imgCancel
        text: "Cancel [Esc]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnEmpReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnEmpReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton3LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnEmpReset
        onKeyReleased: btnEmpResetOnKeyReleased
        effect: reflectionEffect
        graphic: imageView3
        text: "Reset [F5]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnEmpEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnEmpEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton2LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnEmpEdit
        onKeyReleased: btnEmpEditOnKeyReleased
        effect: reflectionEffect
        graphic: imgEdit
        text: "Edit  [F4]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnEmpSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnEmpSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnEmpSave
        onKeyReleased: btnEmpSaveOnKeyReleased
        translateX: 0.0
        effect: reflectionEffect
        graphic: imgSave
        text: "Save  [F2]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    public-read def panelButtons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: 306.0
        layoutY: bind panelButtonsLY
        content: [ btnEmpSave, btnEmpEdit, btnEmpReset, btnEmpCancel, ]
    }
    
    public-read def toggleGroup: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def rdoEmpFemale: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: bind C2LX+50
        layoutY: 307.0
        onKeyPressed: rdoEmpFemaleOnKeyPressed
        text: "Female"
        font: Arial_12
        toggleGroup: toggleGroup
    }
    
    public-read def rdoEmpMale: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: bind C2LX
        layoutY: 314.0
        onKeyPressed: rdoEmpMaleOnKeyPressed
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
    
    public-read def rectangle3: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        layoutX: bind ImagePhotoLX
        layoutY: bind ImagePhotoLY
        fill: javafx.scene.paint.Color.WHITE
        stroke: DarkGray
        strokeWidth: 2.0
        width: 150.0
        height: 150.0
        arcWidth: 10.0
        arcHeight: 10.0
    }
    
    public-read def label21: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 307.0
        text: "Experience"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label20: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 279.0
        text: "Qualification"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label19: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 344.0
        text: "Blood Group"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label18: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 322.0
        text: "Gender"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label1: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 419.0
        text: "Mobile No"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label14: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        text: "Employee  Code"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label13: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 452.0
        text: "Email Id "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label12: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 500.0
        text: "State "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label11: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 482.0
        text: "Country "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label10: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 467.0
        text: "City "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 186.0
        text: "Date of Joining"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label8: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 279.0
        text: "Date of Birth "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 301.0
        text: "Age"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label6: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 392.0
        text: "Phone No "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 515.0
        text: "Pincode "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 398.0
        text: "Address "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 222.0
        text: "Fixed Salary"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 158.0
        styleClass: "label"
        text: "Employee Name "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.4
    }
    
    public-read def label17: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 19.0
        layoutY: 243.0
        text: "Personal Details"
        font: Arial_18
        textFill: Green
    }
    
    public-read def label16: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 13.0
        layoutY: 368.0
        text: "Contact Details"
        font: Arial_18
        textFill: Green
    }
    
    public-read def label15: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 39.0
        layoutY: 63.0
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
        layoutY: 34.0
        layoutInfo: __layoutInfo_label
        effect: lightingEffect
        text: "Employee Information"
        font: Arial_25
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ rectangle, rectHeader, label, separator, separator2, separator3, label2, label3, label4, label5, label6, label7, label8, label9, label10, label11, label12, label13, panelButtons, label14, txtEmpCode, txtEmpDoj, rdoEmpMale, rdoEmpFemale, txtEmpSalary, txtEmpAdd1, txtEmpAdd2, txtEmpCity, txtEmpPhone, txtEmpEmail, txtEmpPincode, txtEmpCountry, txtEmpState, txtEmpBG, txtEmpName, txtEmpAdd3, label15, label16, label1, txtEmpMobile, label17, label18, label19, label20, label21, txtEmpQualfy, txtEmpExp, txtEmpDob, txtEmpAge, rectangle3, imagePhoto, lblEmpUpload, lblEmpRemove, imageDOJ, imageDOB, labelYears, listEmp, panelAlert, imageEmpDown, imageCountryDown, imageStateDpwn, EmpCalendarPanel, ]
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
    }
    
    public-read def Gray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.4
        green: 0.4
        blue: 0.4
    }
    
    public-read def imageSave: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Save1.png"
    }
    
    public-read def imageBack: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/arrow_Left.png"
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
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#FFFFFF") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#000000") }, ]
    }
    
    public-read def imageDown: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
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
                            rectangle.layoutX = 0.0;
                            rectangle.fill = linearGradient;
                            rectangle.stroke = DarkGray;
                            rectangle.arcWidth = 5.0;
                            rectangle.arcHeight = 5.0;
                            rectHeader.visible = true;
                            rectHeader.disable = true;
                            rectHeader.opacity = 0.25;
                            rectHeader.fill = linearGradientHeader;
                            rectHeader.strokeWidth = 0.0;
                            rectHeader.height = 32.0;
                            rectHeader.arcWidth = 5.0;
                            rectHeader.arcHeight = 5.0;
                            label.layoutX = 1.0;
                            label.layoutY = 0.0;
                            label.text = "Employee Details - alt+E";
                            label.hpos = javafx.geometry.HPos.CENTER;
                            separator.layoutY = 90.0;
                            separator2.layoutX = 30.0;
                            separator2.layoutY = 225.0;
                            __layoutInfo_separator2.height = 0.0;
                            separator3.layoutX = 30.0;
                            separator3.layoutY = 343.0;
                            label2.layoutY = 128.0;
                            label3.layoutY = 174.0;
                            label4.layoutY = 358.0;
                            label5.layoutY = 358.0;
                            label6.layoutY = 381.0;
                            label6.text = "Phone No. ";
                            label7.layoutY = 266.0;
                            label8.layoutY = 246.0;
                            label9.layoutY = 151.0;
                            label10.layoutY = 427.0;
                            label11.layoutY = 450.0;
                            label12.layoutY = 473.0;
                            label13.layoutY = 427.0;
                            label13.text = "Email ID";
                            imgSave.visible = true;
                            imgSave.image = imageSave;
                            btnEmpSave.layoutY = 0.0;
                            btnEmpSave.text = "Save [F3]";
                            btnEmpSave.action = btnEmpSaveActionAtShown;
                            imgEdit.visible = true;
                            imgEdit.layoutX = 0.0;
                            imgEdit.image = imageEdit;
                            btnEmpEdit.layoutY = 0.0;
                            btnEmpEdit.text = "Edit [F6]";
                            btnEmpEdit.action = btnEmpEditActionAtShown;
                            imageView3.visible = true;
                            imageView3.image = imageReset;
                            btnEmpReset.layoutY = 0.0;
                            btnEmpReset.text = "Reset [F4]";
                            btnEmpReset.action = btnEmpResetActionAtShown;
                            imgCancel.visible = true;
                            imgCancel.image = imageCancel;
                            btnEmpCancel.layoutY = 0.0;
                            btnEmpCancel.text = "Cancel [F8]";
                            btnEmpCancel.action = btnEmpCancelActionAtShown;
                            panelButtons.visible = true;
                            panelButtons.layoutX = 0.0;
                            label14.layoutY = 102.0;
                            txtEmpCode.visible = true;
                            txtEmpCode.layoutY = 105.0;
                            txtEmpCode.onKeyPressed = txtEmpCodeOnKeyPressedAtShown;
                            txtEmpCode.promptText = "";
                            txtEmpCode.selectOnFocus = true;
                            txtEmpCode.editable = true;
                            txtEmpCode.font = Arial_12;
                            txtEmpDoj.layoutY = 151.0;
                            txtEmpDoj.onKeyPressed = txtEmpDojOnKeyPressedAtShown;
                            txtEmpDoj.text = "";
                            txtEmpDoj.promptText = "dd-mm-yyyy";
                            txtEmpDoj.editable = false;
                            rdoEmpMale.layoutY = 286.0;
                            rdoEmpMale.onMouseClicked = rdoEmpMaleOnMouseClickedAtShown;
                            rdoEmpFemale.layoutY = 286.0;
                            rdoEmpFemale.onKeyPressed = rdoEmpFemaleOnKeyPressed;
                            rdoEmpFemale.onMouseClicked = rdoEmpFemaleOnMouseClickedAtShown;
                            txtEmpSalary.layoutY = 174.0;
                            txtEmpSalary.onKeyPressed = txtEmpSalaryOnKeyPressedAtShown;
                            txtEmpAdd1.disable = false;
                            txtEmpAdd1.layoutY = 358.0;
                            txtEmpAdd1.onKeyPressed = txtEmpAdd1OnKeyPressedAtShown;
                            txtEmpAdd2.layoutY = 381.0;
                            txtEmpAdd2.onKeyPressed = txtEmpAdd2OnKeyPressedAtShown;
                            txtEmpCity.layoutY = 427.0;
                            txtEmpCity.onKeyPressed = txtEmpCityOnKeyPressedAtShown;
                            txtEmpPhone.layoutY = 381.0;
                            txtEmpPhone.onKeyPressed = txtEmpPhoneOnKeyPressedAtShown;
                            txtEmpEmail.layoutY = 427.0;
                            txtEmpEmail.onKeyPressed = txtEmpEmailOnKeyPressedAtShown;
                            txtEmpPincode.layoutY = 358.0;
                            txtEmpPincode.onKeyPressed = txtEmpPincodeOnKeyPressedAtShown;
                            txtEmpCountry.layoutY = 450.0;
                            txtEmpCountry.onKeyPressed = txtEmpCountryOnKeyPressedAtShown;
                            txtEmpCountry.onKeyReleased = txtEmpCountryOnKeyReleasedAtShown;
                            txtEmpState.layoutY = 473.0;
                            txtEmpState.onKeyPressed = txtEmpStateOnKeyPressedAtShown;
                            txtEmpState.onKeyReleased = txtEmpStateOnKeyReleasedAtShown;
                            txtEmpBG.layoutY = 239.0;
                            __layoutInfo_txtEmpBG.width = 80.0;
                            txtEmpBG.onKeyPressed = txtEmpBGOnKeyPressedAtShown;
                            txtEmpBG.onMouseClicked = txtEmpBGOnMouseClickedAtShown;
                            txtEmpName.layoutY = 128.0;
                            txtEmpName.onKeyPressed = txtEmpNameOnKeyPressedAtShown;
                            txtEmpName.onKeyReleased = txtEmpNameOnKeyReleasedAtShown;
                            txtEmpAdd3.layoutY = 404.0;
                            txtEmpAdd3.onKeyPressed = txtEmpAdd3OnKeyPressedAtShown;
                            label15.layoutX = 35.0;
                            label15.layoutY = 65.0;
                            label16.layoutX = 35.0;
                            label16.layoutY = 318.0;
                            label1.layoutY = 404.0;
                            label1.text = "Mobile No.";
                            txtEmpMobile.layoutY = 404.0;
                            txtEmpMobile.onKeyPressed = txtEmpMobileOnKeyPressedAtShown;
                            txtEmpMobile.font = Arial_12;
                            label17.layoutX = 35.0;
                            label17.layoutY = 200.0;
                            label18.layoutY = 286.0;
                            label19.layoutY = 240.0;
                            label20.layoutY = 286.0;
                            label21.layoutY = 263.0;
                            txtEmpQualfy.layoutY = 286.0;
                            txtEmpQualfy.onKeyPressed = txtEmpQualfyOnKeyPressedAtShown;
                            txtEmpExp.layoutY = 263.0;
                            txtEmpExp.onKeyPressed = txtEmpExpOnKeyPressedAtShown;
                            txtEmpDob.layoutY = 240.0;
                            txtEmpDob.onKeyPressed = txtEmpDobOnKeyPressedAtShown;
                            txtEmpDob.text = "";
                            txtEmpDob.promptText = "dd-mm-yyyy";
                            txtEmpDob.editable = false;
                            txtEmpAge.layoutY = 263.0;
                            txtEmpAge.onKeyPressed = txtEmpAgeOnKeyPressedAtShown;
                            txtEmpAge.editable = false;
                            rectangle3.visible = true;
                            rectangle3.width = 152.0;
                            rectangle3.height = 152.0;
                            imagePhoto.visible = true;
                            imagePhoto.fitWidth = 148.0;
                            imagePhoto.fitHeight = 149.0;
                            lblEmpUpload.visible = true;
                            lblEmpUpload.disable = false;
                            lblEmpUpload.onMouseClicked = lblEmpUploadOnMouseClickedAtShown;
                            lblEmpUpload.text = "Upload Photo";
                            lblEmpUpload.font = Arial_Bold_12;
                            lblEmpUpload.textFill = DarkGray;
                            lblEmpRemove.visible = true;
                            lblEmpRemove.disable = true;
                            lblEmpRemove.onMouseClicked = lblEmpRemoveOnMouseClickedAtShown;
                            lblEmpRemove.text = "Remove Photo";
                            lblEmpRemove.font = Arial_Bold_12;
                            lblEmpRemove.textFill = DarkGray;
                            imageDOJ.visible = true;
                            imageDOJ.onMouseClicked = imageDOJOnMouseClickedAtShown;
                            imageDOJ.blocksMouse = true;
                            imageDOJ.image = Image {url: "{__DIR__}images/Calender.png"};;
                            imageDOJ.fitWidth = 21.0;
                            imageDOJ.fitHeight = 25.0;
                            imageDOB.visible = true;
                            imageDOB.onMouseClicked = imageDOBOnMouseClickedAtShown;
                            imageDOB.blocksMouse = true;
                            imageDOB.image = Image {url: "{__DIR__}images/Calender.png"};;
                            labelYears.visible = true;
                            labelYears.layoutY = 263.0;
                            __layoutInfo_labelYears.height = 21.0;
                            labelYears.text = "Years";
                            labelYears.font = Arial_12;
                            labelYears.textFill = Gray;
                            listEmp.visible = false;
                            listEmp.onKeyPressed = listEmpOnKeyPressedAtShown;
                            listEmp.cellFactory = null;
                            imageEmpDown.visible = false;
                            imageEmpDown.layoutY = 128.0;
                            imageEmpDown.onMouseClicked = imageEmpDownOnMouseClickedAtShown;
                            imageEmpDown.blocksMouse = true;
                            imageEmpDown.image = imageDown;
                            imageCountryDown.visible = true;
                            imageCountryDown.layoutY = 450.0;
                            imageCountryDown.onMouseClicked = imageCountryDownOnMouseClickedAtShown;
                            imageCountryDown.blocksMouse = true;
                            imageCountryDown.image = imageDown;
                            imageStateDpwn.visible = true;
                            imageStateDpwn.layoutY = 473.0;
                            imageStateDpwn.onMouseClicked = imageStateDpwnOnMouseClickedAtShown;
                            imageStateDpwn.blocksMouse = true;
                            imageStateDpwn.image = imageDown;
                            EmpCalendarPanel.visible = true;
                            EmpCalendarPanel.blocksMouse = true;
                            panel.visible = true;
                            panel.managed = false;
                            txtEmpID.visible = false;
                        }
                    }
                ]
            }
        ]
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel, txtEmpID, ]
    }
    // </editor-fold>//GEN-END:main
   function rdoEmpFemaleOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            rdoEmpFemale.selected = true;
            txtEmpBG.requestFocus();
            BG = ["Select", "A +ve", "A -ve", "B +ve", "B -ve", "O +ve", "O -ve", "AB +ve", "AB -ve"];
            txtEmpBG.select(0);            
        }
        if (event.code == KeyCode.VK_TAB) {
           txtEmpBG.requestFocus();
        }        
    }
    function rdoEmpMaleOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            rdoEmpMale.selected = true;
            txtEmpBG.requestFocus();
            BG = ["Select", "A +ve", "A -ve", "B +ve", "B -ve", "O +ve", "O -ve", "AB +ve", "AB -ve"];
            txtEmpBG.select(0);
        }
        if (event.code == KeyCode.VK_TAB) {
            rdoEmpFemale.requestFocus();
        }
    }

    function btnEmpCancelOnKeyReleased(event: javafx.scene.input.KeyEvent)  : Void{
        if (event.code == KeyCode.VK_ENTER) {
        btnEmpCancelActionAtShown();
        }else{ shortcut(event);}
             }

    function btnEmpResetOnKeyReleased(event: javafx.scene.input.KeyEvent)  : Void{
        if (event.code == KeyCode.VK_ENTER) {
        btnEmpResetActionAtShown();
        }else{ shortcut(event);}
             }

    function btnEmpEditOnKeyReleased(event: javafx.scene.input.KeyEvent)  : Void{
        if (event.code == KeyCode.VK_ENTER) {
        btnEmpEditActionAtShown();
        }else{ shortcut(event);}
             }

    function btnEmpSaveOnKeyReleased(event: javafx.scene.input.KeyEvent)  : Void{
        if (event.code == KeyCode.VK_ENTER) {
        btnEmpSaveActionAtShown();
        }else{ shortcut(event);}
        }
    function imageStateDpwnOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent)  : Void {
        getState(0);
    }

    function imageCountryDownOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent)  : Void {
        getCountry(0);
    }

    function imageEmpDownOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent)  : Void {
        getEmp(1);
    }
    function rectangleOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        fxCalendar.visible = false;
        listEmp.visible = false;
    }

var panelAlertLX= bind (panelW-500)/2;
var panelAlertLY= bind (panelH-150)/2;
var mandatoryStyle: String = CommonDeclare.textbox_mandatory();
var errorStyle: String = CommonDeclare.textbox_error();
def CustomAlert=CustomAlert{};

function FXalert(type:Integer):Void{
        CustomAlert.ShowAlert("Employee Information",type);
        showAlertbox();
}

function showAlertbox():Void{
        panelAlert.visible=true;
        delete panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
}

function FXinfo(msg:String):Void{
        CustomAlert.ShowInfo("Employee Information",msg);
        showAlertbox();
}

function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Employee Information", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = errorStyle;
    }

function FXinfo1(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Employee Information", msg);
        showAlertbox();
        err_txtbox.requestFocus();
    }

function txtEmpBGOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {

    BG = ["Select", "A +ve", "A -ve", "B +ve", "B -ve", "O +ve", "O -ve", "AB +ve", "AB -ve"];
    txtEmpBG.select(0);
    txtEmpExp.requestFocus();
}
function txtEmpDobOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        
    if(event.code == KeyCode.VK_ESCAPE){fxCalendar.visible = false;}shortcut(event);
}

function txtEmpDojOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {        
    if(event.code == KeyCode.VK_ESCAPE){fxCalendar.visible = false;}shortcut(event);
}

     def kr = KeyRegistry {};
     var ss = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 4 and CommonDeclare.form[3] == 5) {            
            shortcut(ss);
        }
    }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == kr.save and btnEmpSave.text == "Save [F3]" and not btnEmpSave.disable) {
            save();
        }
        if (event.code == kr.edit and btnEmpEdit.text == "Edit [F6]" and not btnEmpEdit.disable) {
            edit();
        }
        if (event.code == kr.reset and btnEmpReset.text == "Reset [F4]") {
            reset();
        }
        if (event.code == kr.update and btnEmpSave.disable == false) {
            if (btnEmpSave.text == "Update [F7]") { update(); }
        }
        if (event.code == kr.del and btnEmpEdit.disable == false) {
            if (btnEmpEdit.text == "Delete [F5]") { del(); }
        }
        if (event.controlDown and event.code == kr.back) {
            if (btnEmpCancel.text == "Back [Ctrl+Left]") { back(); }
        }
        if (event.code == kr.cancel) {
            if (btnEmpCancel.text == "Cancel [F8]") { cancel(); }
        }
    }

function lblEmpUploadOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {    
    uploadImage();
}

function txtEmpEmailOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {    
    txtEmpEmail.style = "";
    if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB)
        {btnEmpSave.requestFocus();}
        shortcut(event);
}

function txtEmpMobileOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {    
    txtEmpMobile.style = "";
    if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB)
            {txtEmpEmail.requestFocus();}shortcut(event);
     }

function txtEmpPhoneOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
    txtEmpPhone.style = "";
    if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB)
            {txtEmpMobile.requestFocus();}shortcut(event);
     }

function txtEmpPincodeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {    
    txtEmpPincode.style = "";
    if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB)
            {txtEmpPhone.requestFocus();
    }
    shortcut(event);
}
function txtEmpStateOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {    
    txtEmpState.style = "";
    if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
        if (txtEmpCountry.text.length() == 0) {
            txtEmpState.text = "" ;
        }
        txtEmpPincode.requestFocus();
    }    
 }
 function txtEmpStateOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
     getState (1) ;
     if (event.code == KeyCode.VK_DOWN and listEmp.items != null) {
         listEmp.requestFocus();
         listEmp.selectFirstRow();
     }
     if (event.code == KeyCode.VK_ESCAPE) {
         listEmp.visible = false;
         txtEmpState.requestFocus();         
     }
 }
function txtEmpCountryOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
    txtEmpCountry.style = "";        
    if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
        if (event.code == KeyCode.VK_TAB and escPress) {
                escPress = false ;
                commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
                if (commonController.selectCountry(txtEmpCountry.rawText)) {
                    txtEmpState.requestFocus () ;
                    txtEmpState.text = "" ;
                } else {
                    txtEmpPincode.requestFocus () ;
                }
        }
        txtEmpState.requestFocus () ;
     }
}
var escPress = false ;
function txtEmpCountryOnKeyReleasedAtShown (event: javafx.scene.input.KeyEvent): Void {
    getCountry (1) ;
    if (event.code == KeyCode.VK_DOWN and listEmp.items != null) {
        listEmp.requestFocus();
        listEmp.selectFirstRow();
    }
    if (event.code == KeyCode.VK_ESCAPE) {
        escPress = true ;
        listEmp.visible = false;
        txtEmpCountry.requestFocus();        
    }
}
function txtEmpCityOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {    
    txtEmpCity.style = mandatoryStyle;
    if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB)
            {txtEmpCountry.requestFocus();}shortcut(event);
     }

function txtEmpAdd3OnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {    
    txtEmpAdd3.style = "";
    if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB)
            {txtEmpCity.requestFocus();}shortcut(event);
     }

function txtEmpAdd2OnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {    
    txtEmpAdd2.style = "";
    if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB)
            {txtEmpAdd3.requestFocus();}shortcut(event);
     }

function txtEmpAdd1OnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {    
    txtEmpAdd1.style = mandatoryStyle;
    if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB)
            {txtEmpAdd2.requestFocus();}shortcut(event);
     }

function txtEmpQualfyOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {    
    txtEmpQualfy.style = "";
    if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB)
            {txtEmpAdd1.requestFocus();}shortcut(event);
     }

function txtEmpExpOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
    txtEmpExp.style = "";
    if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {        
            txtEmpQualfy.requestFocus();
        }shortcut(event);
}

function txtEmpBGOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
    txtEmpBG.style = "";
    if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB )
            {txtEmpExp.requestFocus();}shortcut(event);
     }

    function txtEmpAgeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtEmpAge.style = "";
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB)
            {rdoEmpMale.requestFocus();}shortcut(event);
     }

function txtEmpSalaryOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
    txtEmpSalary.style = mandatoryStyle;
    if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB)
            {txtEmpDob.requestFocus();}shortcut(event);
     }

function txtEmpNameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
    
    txtEmpName.style = mandatoryStyle;
    if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB)
    {
        //Controller Instance
        commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
        if (commonController.selectEmployee(txtEmpName.rawText)== false and btnEmpSave.text == "Update [F7]") {
            txtEmpName.requestFocus();
            txtEmpName.text = "";
        } else {
            listEmp.visible = false;
            txtEmpDoj.requestFocus();
        }
    }shortcut(event);
}

    function txtEmpCodeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
    txtEmpCode.style = mandatoryStyle;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB){
            txtEmpName.requestFocus();
        }shortcut(event);
    }
    function txtEmpNameOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (btnEmpSave.text == "Update [F7]" and btnEmpEdit.text == "Delete [F5]") {
            listEmp.visible = false;
            getEmp(1);
            if (event.code == KeyCode.VK_DOWN and listEmp.items != null){
                listEmp.requestFocus();
                listEmp.selectFirstRow();
            }
            if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB){
               listEmp.visible = false;
               txtEmpName.requestFocus();
            }
        }
    }
    function lblEmpRemoveOnMouseClickedAtShown (event: javafx.scene.input.MouseEvent): Void {
        var i = Alert.question(" Warning "," You want to Remove Photo? ");
        if(i == true){
            imgPath = "";
            image = Image { url: "{__DIR__}images/User.png" };
            imgPath = "images/User.png";
            lblEmpRemove.disable = true;
        }
    }

    function rdoEmpFemaleOnMouseClickedAtShown (event: javafx.scene.input.MouseEvent): Void {
        rdoEmpMale.selected = false;
        txtEmpBG.requestFocus();
        BG = ["Select", "A +ve", "A -ve", "B +ve", "B -ve", "O +ve", "O -ve", "AB +ve", "AB -ve"];
        txtEmpBG.select(0);
    }

    function rdoEmpMaleOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        rdoEmpFemale.selected = false;
        txtEmpBG.requestFocus();
        BG = ["Select", "A +ve", "A -ve", "B +ve", "B -ve", "O +ve", "O -ve", "AB +ve", "AB -ve"];
        txtEmpBG.select(0);
    }

    function imageDOBOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
    txtEmpDob.style = mandatoryStyle;
    if (not dobFlag) {
        EmpCalendarPanel.layoutY = imageDOB.layoutY + txtEmpDob.height + 5.0;
        if (txtEmpDob.text != null) {
            var dat = txtEmpDob.rawText.split("-");
            var d = Integer.parseInt(dat[0]);
            var m = Integer.parseInt(dat[1]) - 1;
            var y = Integer.parseInt(dat[2]);
            fxCalendar.set(y, m, d);
        } else {
            var dat = "01-01-1980".split("-");
            var d = Integer.parseInt(dat[0]);
            var m = Integer.parseInt(dat[1]) - 1;
            var y = Integer.parseInt(dat[2]);
            fxCalendar.set(y, m, d);
        }
        fxCalendar.visible = true;
        dobFlag = true;
    } else {
        fxCalendar.visible = false;
    }
}

    function imageDOJOnMouseClickedAtShown (event: javafx.scene.input.MouseEvent): Void {
        txtEmpDoj.style = mandatoryStyle;
        if(not dojFlag){
            EmpCalendarPanel.layoutY = imageDOJ.layoutY + txtEmpDoj.height + 5.0;
            if(txtEmpDoj.rawText!=null){
                var dat = txtEmpDoj.rawText.split("-");
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1])-1;
                var y = Integer.parseInt(dat[2]);
                fxCalendar.set(y,m,d);
            }
            else{
                var dat = DateUtils.now("dd-MM-yyyy").split("-");
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1])-1;
                var y = Integer.parseInt(dat[2]);
                fxCalendar.set(y,m,d);
            }
            fxCalendar.visible=true;
            dojFlag=true;
        }else
        {
            fxCalendar.visible=false;
        }
    }

    function btnEmpCancelActionAtShown(): Void {
        cancel();
    }

    function btnEmpResetActionAtShown(): Void {
        reset();
    }

    function btnEmpEditActionAtShown(): Void {
        if (btnEmpEdit.text == "Delete [F5]") {
            del();
        } else {
            edit();
        }
    }

    function btnEmpSaveActionAtShown(): Void {
        if (btnEmpSave.text == "Update [F7]") {
            update();
        }else {
            save();
        }
    }

    public function save(): Void {
    try {
        // Controller Instance
        var employeeModel : EmployeeModel = new EmployeeModel();
        var employeeController : Employee = RegistryFactory.getClientStub(RegistryConstants.Employee) as Employee;

        // controller Instance
        var commonController : CommonImplements =RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
        if (commonController.selectEmployee(txtEmpName.rawText.trim()) ==true) {
            FXinfo("Employee Name already exists",txtEmpName);
            } else if(commonController.employeeCodeExists(txtEmpCode.rawText.trim(),"","save") == true) {
            FXinfo("Employee Code already exists",txtEmpCode);
        }
       else {
           var san: Integer = 0;
            san = clickValid();
            if (san == 10) {
                var gender: String = null;
                if (rdoEmpMale.selected == true) {
                    gender = "Male";
                } else if (rdoEmpFemale.selected == true) {
                    gender = "Female";
                } else {
                    gender = "None";
                }
                employeeModel.setGender(gender);
                employeeModel.setEmployeeCode(txtEmpCode.rawText.replaceAll("'", ""));
                employeeModel.setEmployeeName(txtEmpName.rawText.replaceAll("'", ""));
                employeeModel.setDateOfBirth(DateUtils.changeFormatDate(sdf.parse(txtEmpDob.text)));
                employeeModel.setDateOfJoin(DateUtils.changeFormatDate(sdf.parse(txtEmpDoj.text)));
                employeeModel.setPhoto(imgPath);
                if (txtEmpSalary.text != null) {
                    employeeModel.setFixedSalary(Double.parseDouble(txtEmpSalary.rawText));
               } else if (txtEmpSalary.text == null) {
                    employeeModel.setFixedSalary(Double.parseDouble("0.00"));
               } else if (txtEmpSalary.text == "") {
                    employeeModel.setFixedSalary(Double.parseDouble("0.00"));
               }
                employeeModel.setAge(txtEmpAge.rawText.replaceAll("'", ""));
                employeeModel.setBloodGroup(txtEmpBG.selectedItem.toString());
                employeeModel.setExperience(txtEmpExp.rawText.replaceAll("'", ""));
                if (txtEmpExp.text == null) {
                    employeeModel.setExperience("0.0");
                }
                employeeModel.setQualification(txtEmpQualfy.rawText.replaceAll("'", ""));
                employeeModel.setAddress1(txtEmpAdd1.rawText.replaceAll("'", ""));
                employeeModel.setAddress2(txtEmpAdd2.rawText.replaceAll("'", ""));
                employeeModel.setAddress3(txtEmpAdd3.rawText.replaceAll("'", ""));
                employeeModel.setCity(txtEmpCity.rawText.replaceAll("'", ""));
                employeeModel.setCountry(txtEmpCountry.rawText.replaceAll("'", ""));
                employeeModel.setState(txtEmpState.rawText.replaceAll("'", ""));
                employeeModel.setPincode(txtEmpPincode.rawText.replaceAll("'", ""));
                employeeModel.setPhoneNumber(txtEmpPhone.rawText.replaceAll("'", ""));
                employeeModel.setMobileNumber(txtEmpMobile.rawText.replaceAll("'", ""));
                employeeModel.setEmailid(txtEmpEmail.rawText.replaceAll("'", ""));
                if(employeeController.createRecord(employeeModel).equals(true)) {
                    FXalert(0);
                }
                commonController.updateLog("Employee Information", "Save [F3]");
               txtEmpCode.requestFocus();
                srCode = empCode();
//                if (srCode == "") {
//                    srCode = "EC0000001";
//                }
//                txtEmpCode.text = srCode;
                txtEmpBG.select(0);
                image = Image { url: "{__DIR__}images/User.png" };
                imgPath = "images/User.png";
                clear();
            }
        }
    } catch (e: SQLException) {
        var msg: String = "Class : Employee Information  Method : Save()   = {e.getMessage()}";
        log.debug(msg);
    }
}

    public function update(): Void {

    try {
        var employeeModel : EmployeeModel=new EmployeeModel();
        var san: Integer = 0;
        san = clickValid();
        if(commonController.employeeCodeExists(txtEmpCode.rawText.trim(),txtEmpName.rawText.trim(),"update") == true) {
            FXinfo("Employee Code already exists",txtEmpCode);
        }
        else if (san == 10) {
            var gender: String = null;
            if (rdoEmpMale.selected == true) {
                gender = "Male";
            } else if (rdoEmpFemale.selected == true) {
                gender = "Female";
            } else {
                gender = "None";
            }
                employeeModel.setGender(gender);
                employeeModel.setEmployeeCode(txtEmpCode.rawText.replaceAll("'", ""));
                employeeModel.setEmployeeName(txtEmpName.rawText.replaceAll("'", ""));
                employeeModel.setDateOfBirth(DateUtils.changeFormatDate(sdf.parse(txtEmpDob.text)));
                employeeModel.setDateOfJoin(DateUtils.changeFormatDate(sdf.parse(txtEmpDoj.text)));
                employeeModel.setPhoto(imgPath);
                employeeModel.setFixedSalary(Double.parseDouble(txtEmpSalary.rawText.replaceAll("'", "")));
               if (txtEmpSalary.text != null) {
                    employeeModel.setFixedSalary(Double.parseDouble(txtEmpSalary.rawText));
               } else if (txtEmpSalary.text == null) {
                    employeeModel.setFixedSalary(Double.parseDouble("0.00"));
               } else if (txtEmpSalary.text == "") {
                    employeeModel.setFixedSalary(Double.parseDouble("0.00"));
               }
                employeeModel.setAge(txtEmpAge.rawText.replaceAll("'", ""));
                employeeModel.setBloodGroup(txtEmpBG.selectedItem.toString());
                if(txtEmpExp.rawText!=null){
                    employeeModel.setExperience(txtEmpExp.rawText.replaceAll("'", ""));
                }
                else if (txtEmpExp.text == null) {
                    employeeModel.setExperience("0.0");
                }
                if (txtEmpExp.text == "") {
                    employeeModel.setExperience("0.0");
                }
                employeeModel.setQualification(txtEmpQualfy.rawText.replaceAll("'", ""));
                employeeModel.setAddress1(txtEmpAdd1.rawText.replaceAll("'", ""));
                employeeModel.setAddress2(txtEmpAdd2.rawText.replaceAll("'", ""));
                employeeModel.setAddress3(txtEmpAdd3.rawText.replaceAll("'", ""));
                employeeModel.setCity(txtEmpCity.rawText.replaceAll("'", ""));
                employeeModel.setCountry(txtEmpCountry.rawText.replaceAll("'", ""));
                employeeModel.setState(txtEmpState.rawText.replaceAll("'", ""));
                employeeModel.setPincode(txtEmpPincode.rawText.replaceAll("'", ""));
                employeeModel.setPhoneNumber(txtEmpPhone.rawText.replaceAll("'", ""));
                employeeModel.setMobileNumber(txtEmpMobile.rawText.replaceAll("'", ""));
                employeeModel.setEmailid(txtEmpEmail.rawText.replaceAll("'", ""));
                employeeModel.setEmpid(txtEmpID.rawText.replaceAll("'", ""));
                var cn : ConfirmDialogBox = new ConfirmDialogBox(0,"Employee Details");
                var a =bind cn.staus;
                if (a) {
                    //controller Instance
                    employeeController = RegistryFactory.getClientStub(RegistryConstants.Employee) as Employee;
                    commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
                    employeeController.updateRecord(employeeModel);
                    FXalert(4);
                    commonController.updateLog("Employee Information", "Update [F7]");
                    txtEmpCode.requestFocus();
                    txtEmpBG.select(0);
                    txtEmpCode.text = "";
                    image = Image { url: "{__DIR__}images/User.png" };
                    imgPath = "images/User.png";
                    clear();
                    edit();
                    back();
                }
            }
    } catch (e: SQLException) {
        var msg: String = "Class : Employee Information  Method : Update()   = {e.getMessage()}";
        log.debug(msg);
    }
}

    public function del(): Void {

    try {
        if (txtEmpName.text != null) {
            var cn : ConfirmDialogBox = new ConfirmDialogBox(1,"Employee Details");
            var a =bind cn.staus;
            if (a) {
                //Controller Instance
                employeeController = RegistryFactory.getClientStub(RegistryConstants.Employee) as Employee;
                commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
                employeeController.deleteRecord(txtEmpCode.rawText);
                 FXalert(5);
                commonController.updateLog("Employee Information", "Delete [F5]");
                txtEmpCode.requestFocus();
                image = Image { url: "{__DIR__}images/User.png" };
                clear();
                txtEmpCode.text = "";
                back();
            }            
        } else {
            FXinfo("To delete, please select an Employee Name.");
        }
    } catch (e: Exception) {
        var msg: String = "Class : Employee Information  Method : Delete()   = {e.getMessage()}";
        log.debug(msg);
    }
}
    public function back():Void{
        imgEdit.image=imageEdit;
        imgCancel.image=imageCancel;
            listEmp.visible = false;
            imageEmpDown.visible = false;
            txtEmpCode.requestFocus();
            BG = ["Select","A +ve", "A -ve", "B +ve", "B -ve", "O +ve", "O -ve", "AB +ve", "AB -ve"];
            txtEmpBG.select(0);
            image = Image { url: "{__DIR__}images/User.png" };
			btnEmpSave.disable = false;
                        btnEmpSave.text = "Save [F3]";
            btnEmpEdit.disable = false;
            btnEmpEdit.text = "Edit [F6]";
            btnEmpReset.disable = false;
            btnEmpReset.text = "Reset [F4]";
            clear();
            txtEmpCode.text = "";
            srCode = empCode();
//            if (srCode == "") {
//                srCode = "EC0000001";
//            }
//            txtEmpCode.text = srCode;
            btnEmpCancel.text = "Cancel [F8]";
    }

    public function edit(): Void {
	imgEdit.image=imageCancel;
        imgCancel.image=imageBack;
        imageEmpDown.visible = true;
        txtEmpName.requestFocus();        
        clear();
        btnEmpEdit.text = "Delete [F5]";
        btnEmpCancel.text = "Back [Ctrl+Left]";
        txtEmpCode.text = "";        
        btnEmpSave.text = "Update [F7]";
    }

    public function reset(): Void {
            txtEmpCode.requestFocus();
            clear();
            image = Image { url: "{__DIR__}images/User.png" };            
            txtEmpBG.select(0);
            if(btnEmpSave.text == "Save [F3]"){
            srCode = empCode();
//            if (srCode == "") {
//                srCode = "EC0000001";
//            }
//            txtEmpCode.text = srCode;
            }
    }

    public function cancel(): Void {
        if (btnEmpCancel.text == "Back [Ctrl+Left]") {
            back();
        } else {
            Empty();
            delete panel.content;
            panel.visible = false;
            CommonDeclare.form[3] = 0;
        }
    }

    public function clickValid(): Integer {
        var ename = txtEmpName.rawText.replaceAll("'", "");
        var doj: String = txtEmpDoj.rawText.replaceAll("'", "");
        var salary = txtEmpSalary.rawText.replaceAll("'", "");
        if (txtEmpSalary.rawText == null) {
            salary = "0.0";
        }
        if (txtEmpSalary.rawText == "") {
            salary = "0.0";
        }
        var dob: String = txtEmpDob.rawText.replaceAll("'", "");
        var exp = txtEmpExp.rawText.replaceAll("'", "");
        if (txtEmpExp.rawText == null) {
            exp = "0.0";
        }
        var qual = txtEmpQualfy.rawText.replaceAll("'", "");
        var add1 = txtEmpAdd1.rawText.replaceAll("'", "");
        var add2 = txtEmpAdd2.rawText.replaceAll("'", "");
        var add3 = txtEmpAdd3.rawText.replaceAll("'", "");
        var city = txtEmpCity.rawText.replaceAll("'", "");
        var pin = txtEmpPincode.rawText.replaceAll("'", "");
        var phone = txtEmpPhone.rawText.replaceAll("'", "");
        var mobile = txtEmpMobile.rawText.replaceAll("'", "");
        var email = txtEmpEmail.rawText.replaceAll("'", "");
        var empCode = txtEmpCode.rawText.replaceAll("'", "");
        var cnt: Integer = 0;
        var val: Validation = new Validation();
        var cdate : String [] = DateUtils.now("dd-MM-yyyy").split("-") ;
        var cdateval : Long = Long.parseLong(cdate[0]) + (Long.parseLong (cdate[1]) * 31) + (Long.parseLong (cdate[2]) * 365) ;
        var dojval : Long = 0 ;
        var dobval : Long = 0 ;

        if(doj.length() > 8){
            var jdate: String [] = doj.split("-") ;
            dojval = Long.parseLong(jdate[0]) + (Long.parseLong (jdate[1]) * 31 ) + (Long.parseLong (jdate[2]) * 365) ;
        }
        if (dob.length() > 8) {
                var bdate : String [] = dob.split("-") ;
                dobval = Long.parseLong(bdate[0]) + ( Long.parseLong (bdate[1]) * 31) + (Long.parseLong (bdate[2]) * 365 ) ;
        }
        
        try {
            var en: Integer = 0; en = val.getCharacterValid(ename, 4, 35);
            var sal: Integer = 0; sal = val.getDecimalValid(salary,3,10);
            var ex : Integer = 0; ex = val.getDecimalValid(exp,1, 15);
            var qua : Integer = 10;
            if (qual!=null) qua = val.getCharacterValid(qual,2,15);            
            var adr1: Integer = 0; adr1 = val.getAddressValid(add1, 5, 35);
            var adr2: Integer = 0; adr2 = val.getAddressValid(add2, 5, 35);
            var adr3: Integer = 0; adr3 = val.getAddressValid(add3, 5, 35);
            var cty: Integer = 0; cty = val.getAlphaNumericValid(city, 4, 30);
            var pinc: Integer = 0; pinc = val.getNumberValid(pin, 4, 30);
            var ph: Integer = 10; ph = val.getPhoneNoValid(phone, 6, 15);
            var mob: Integer = 10; mob = val.getPhoneNoValid(mobile, 10, 15);
            var em: Integer = 0; em = val.getEmailIdValid(email, 4, 35);
            var emCode : Integer = 0; emCode = val.getAlphaNumericValid(empCode, 1, 35);
            var e =0.0;
            if(ex==10){
            e=Double.parseDouble(exp);
            }
            var exper : Double =0.0;
            if(ex==10){
            exper=Value.Round(e,0);
            }
            if(empCode.length()<=0) {
              FXinfo( "Please Enter Employee Code.",txtEmpCode);
            }
            else if(emCode == 0){
                FXinfo( "Employee Code can contain only Characters and numbers.",txtEmpCode);
            }
            else if (ename.length() <= 0) {
                FXinfo( "Please Enter Employee Name.",txtEmpName);
            } else if (en == 1) {
                FXinfo1( "Employee Name cannot exceed 35 characters.",txtEmpName);
            } else if (en == 0) {
                FXinfo1( "Employee Name can contain only alphabets and spaces.",txtEmpName);
            }else if(doj.length() <= 0){
                FXinfo( "Please enter Date of Joining.",txtEmpDoj);
            }else if(dojval > cdateval) {
                FXinfo( "Date of joining cannot exceed current date.",txtEmpDoj);
            }else if (txtEmpSalary.rawText.length () <= 0) {
                FXinfo( "Please Enter Employee Salary.",txtEmpSalary);
            }
            else if (sal == 11 ) {
                FXinfo1( "Values with Decimals can be entered for Salary.",txtEmpSalary);
            }
            else if (sal == 0) {
                FXinfo1( "Values with Decimals can be entered for Salary.",txtEmpSalary);
            }else if(dob.length() <= 0){
                FXinfo( "Please enter Date of Birth.",txtEmpDob);
            }else if(dobval > cdateval) {
                    FXinfo( "Please enter the correct Date for Birth date.",txtEmpDob);
            }else if (ex != 10){
                FXinfo1( "Experience textbox accepts only Numeric Values. ",txtEmpExp);
            } else if (exp != null and exper > 99){
                FXinfo1( "Please enter Valid Experience.",txtEmpExp);
            } else if (qua != 10){
                FXinfo1( "Only alphabets can be entered for Qualification!",txtEmpQualfy);
            } else if (add1.length() <= 0) {
                FXinfo( "Please enter the Address of the Employee.",txtEmpAdd1);
            }else if (adr1 == 0) {
                FXinfo1( "Address can contain only alphabets and spaces.",txtEmpAdd1);
            } else if (adr2 == 0) {
                FXinfo1( "Address can contain only alphabets and spaces.",txtEmpAdd2);
            } else if (adr3 == 0) {
                FXinfo1( "Address can contain only alphabets and spaces.",txtEmpAdd3);
            } else if (city.length() <= 0) {
                FXinfo( "Please enter City name.",txtEmpCity);
            } else if (cty == 0) {
                FXinfo1( "City can contain only alphabets and spaces.",txtEmpCity);
            } else if (pinc == 0) {
                FXinfo1( "Pincode can contain Numerals only.",txtEmpPincode);
            } else if (pin != null and pin.length() < 2) {
                FXinfo1( "Please enter a minimum of 2 Digits. ",txtEmpPincode);
            } else if (pin != null and pin.length() > 7) {
                FXinfo1( "Pincode cannot exceed 6 digits.",txtEmpPincode);
            } else if (ph == 0) {
                FXinfo1( "Phone number can contain only numerals and [+-].",txtEmpPhone);
            } else if (phone.length() > 0 and ph == 11) {
                FXinfo1( "Phone Number can contain 6 digits.",txtEmpPhone);
            } else if (phone.length() > 0 and ph == 1) {
                FXinfo1( "Phone Number cannot exceed 15 digits.",txtEmpPhone);
            } else if (mob == 0) {
                FXinfo1( "Mobile number can contain only numerals and [+-].",txtEmpMobile);
            } else if (mobile.length() > 0 and mob == 11) {
                FXinfo1( "Mobile Number can contain 10 digits.",txtEmpMobile);
            } else if (mobile.length() > 0 and mob == 1) {
                FXinfo1( "Mobile Number cannot exceed 15 digits.",txtEmpMobile);
            } else if (mobile != null and mobile.length() < 10) {
                FXinfo1( "Please enter a minimum of 10 Digits.",txtEmpMobile);
            } else if (em == 0) {
                FXinfo1( "Enter valid Email ID",txtEmpEmail) ;
            } else {
                cnt = 10;
            }
        } catch (e: Exception) {
            var msg: String = "Class : Employee Information  Method : clickValid()   = {e.getMessage()}";

            log.debug(msg);
        }
        return cnt;
    }

    function listEmpOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
//        if (listEmp.focused) {
//            if (event.code == KeyCode.VK_DOWN)
//                listEmp.selectFirstRow();
//        }
//        
    }


    public function getEmp(type: Integer) {
        if(not listEmp.visible){
        ListW=txtEmpName.width;
        LayoutY = txtEmpName.layoutY + 25;
        var listControlObj: ListController = new ListController();
        listH = listControlObj.listImageControlView(txtEmpName, listEmp, "employeename", type);
        var selectedItem: String = bind listControlObj.selectedString on replace {        
        if (selectedItem.length() > 0) {
            displayEmp(selectedItem);
        }
        }
        }
        else{
            listEmp.visible = false;
            txtEmpName.requestFocus();
        }
    }

    public function getState(type: Integer) {
        if(not listEmp.visible){
        ListW=txtEmpState.width;
        LayoutY = txtEmpState.layoutY + 25;
        var listControlObj: ListController = new ListController();
        listH = listControlObj.listStateControlView(txtEmpState, txtEmpCountry.rawText, listEmp, "", type);
        }
        else{
            listEmp.visible =false;
            txtEmpState.requestFocus();
        }
    }

    public function getCountry(type: Integer) {
        if(not listEmp.visible){
        listEmp.visible = false;
        ListW=txtEmpCountry.width;
        LayoutY = txtEmpCountry.layoutY + 25;
        var listControlObj: ListController = new ListController();
        listH = listControlObj.listImageControlView(txtEmpCountry, listEmp, "Country", type);
        if (listControlObj.selectedString.length() > 0) {
                    txtEmpState.text = "" ;
                    getState (1) ;
         }
       }
       else{
           listEmp.visible = false;
           txtEmpCountry.requestFocus();
       }
     }

    public function displayEmp(name: String): Void {
        //Controller Instance
        employeeController = RegistryFactory.getClientStub(RegistryConstants.Employee) as Employee;
        var employeeModel : EmployeeModel = employeeController.viewRecord(name) as EmployeeModel;
        var gender1: String;
        try {
                txtEmpCode.text = employeeModel.getEmployeeCode();
                txtEmpDoj.text = employeeModel.getDateOfJoin();
                txtEmpSalary.text = employeeModel.getFixedSalary().toString();
                txtEmpDob.text =employeeModel.getDateOfBirth();
                txtEmpAge.text = employeeModel.getAge();
                gender1 = employeeModel.getGender();
                BG = employeeModel.getBloodGroup();
                txtEmpBG.select(0);
                txtEmpExp.text = employeeModel.getExperience();
                txtEmpQualfy.text = employeeModel.getQualification();
                txtEmpAdd1.text = employeeModel.getAddress1();
                txtEmpAdd2.text = employeeModel.getAddress2();
                txtEmpAdd3.text = employeeModel.getAddress3();
                txtEmpCity.text = employeeModel.getCity();
                txtEmpCountry.text = employeeModel.getCountry();
                txtEmpState.text = employeeModel.getState();
                txtEmpPincode.text = employeeModel.getPincode();
                txtEmpPhone.text = employeeModel.getPhoneNumber();
                txtEmpMobile.text = employeeModel.getMobileNumber();
                txtEmpEmail.text = employeeModel.getEmailid();
                txtEmpID.text = employeeModel.getEmpid();
                if(employeeModel.getPhoto() == "images/User.png"){
                    image = Image { url: "{__DIR__}images/User.png"};
                    imgPath = "images/User.png" ;
                }else{
                    image = Image { url: "{path}uploads/emp_img/{employeeModel.getPhoto()}" };
                    imgPath=employeeModel.getPhoto();
                }
                if (employeeModel.getPhoto()== "images/User.png"){
                    lblEmpRemove.disable = true;
                }else {
                    lblEmpRemove.disable = false;
                }

            if (gender1.equals("Male") or gender1.equals("male")) {
                rdoEmpMale.selected = true;
                rdoEmpFemale.selected = false;
            } else if (gender1.equals("Female") or gender1.equals("female")) {
                rdoEmpMale.selected = false;
                rdoEmpFemale.selected = true;
            } else {
                rdoEmpMale.selected = false;
                rdoEmpFemale.selected = false;
            }
        } catch (e: Exception) {
            var msg: String = "Class : Employee Information  Method : displayEmp()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function clear(): Void {
        var styleDefault = {
            "-fx-border-width:2;"
            "-fx-border-color:#666666;"
            "-fx-background-color:white ;" ;
        } ;
        imgPath="images/User.png";
        txtEmpName.text = "";
        txtEmpDoj.text = "";
        txtEmpSalary.text = "";
        txtEmpDob.text = "";
        txtEmpAge.text = "";
        txtEmpBG.select(0);
        txtEmpExp.text = "";
        txtEmpQualfy.text = "";
        txtEmpAdd1.text = "";
        txtEmpAdd2.text = "";
        txtEmpAdd3.text = "";
        txtEmpCity.text = "";
        txtEmpCountry.text = "";
        txtEmpState.text = "";
        txtEmpPincode.text = "";
        txtEmpPhone.text = "";
        txtEmpMobile.text = "";
        txtEmpEmail.text = "";
        txtEmpCode.text = "";
        rdoEmpMale.selected = true;
        rdoEmpFemale.selected = false;
        lblEmpRemove.disable = true;
        //default style
        txtEmpName.style =  mandatoryStyle;
        txtEmpDoj.style =  mandatoryStyle;
        txtEmpSalary.style =  mandatoryStyle ;
        txtEmpDob.style =  mandatoryStyle ;
        txtEmpAge.style =  styleDefault ;
        txtEmpExp.style =  styleDefault ;
        txtEmpQualfy.style =  styleDefault ;
        txtEmpAdd1.style =  mandatoryStyle ;
        txtEmpAdd2.style =  styleDefault ;
        txtEmpAdd3.style =  styleDefault ;
        txtEmpCity.style =  mandatoryStyle ;
        txtEmpCountry.style =  styleDefault ;
        txtEmpState.style =  styleDefault ;
        txtEmpPincode.style =  styleDefault ;
        txtEmpPhone.style =  styleDefault ;
        txtEmpMobile.style =  styleDefault ;
        txtEmpEmail.style =  styleDefault ;
        txtEmpCode.style = mandatoryStyle ;
    }

    public function Empty(): Void {
        txtEmpName.text = null;
        txtEmpDoj.text = null;
        txtEmpSalary.text = null;
        txtEmpDob.text = null;
        txtEmpAge.text = null;
        txtEmpExp.text = null;
        txtEmpQualfy.text = null;
        txtEmpAdd1.text = null;
        txtEmpAdd2.text = null;
        txtEmpAdd3.text = null;
        txtEmpCity.text = null;
        txtEmpCountry.text = null;
        txtEmpState.text = null;
        txtEmpPincode.text = null;
        txtEmpPhone.text = null;
        txtEmpMobile.text = null;
        txtEmpEmail.text = null;
    }
    
    public function empCode() : String {  

        var code: String = "";
        var finalCode: String = "";
        var vanCode: String = "EC";
        try {
          //controller instance
          commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
          finalCode = commonController.getCustId("employee_information", "emp_code", "EC");
        } catch (e: SQLException) {
            var msg: String = "Class : Employee Information  Method : empCode()   = {e.getMessage()}";
            log.debug(msg);
        }
        return finalCode;
    }

    public function uploadImage(): Void {
            var fc = new JFileChooser();
            var imagefilter = new ImageFilter();
            fc.addChoosableFileFilter(imagefilter);
            fc.setAcceptAllFileFilterUsed(false);
            fc.setAccessory(new ImagePreview(fc));
            if (fc.showDialog(null, "Upload Photos") == JFileChooser.APPROVE_OPTION) {
                selectFile = fc.getSelectedFile().getName();
                selectFilePath = fc.getSelectedFile().getAbsolutePath();
            }
            var baseDir = new File("uploads/emp_img/");
            if (not baseDir.exists()) {
                baseDir.mkdirs();// Changes on 11-03-2011
            }                      
            try{
                Upload.copy(new File("{selectFilePath}"), new File("uploads/emp_img/{selectFile}"));
            }catch (e: Exception) {
                var msg: String = "Class : Employee Information  Method : uploadImage()   = {e.getMessage()}";
                log.debug(msg);
            }

            imgPath = "";
            image = Image { url: "{path}uploads/emp_img/{selectFile}" }
            lblEmpRemove.disable = false;
            imgPath = selectFile;
}

var visit = bind fxCalendar.visible on replace{
    if(dojFlag and not visit){
        getDate(0);
    }else if(dobFlag and not visit){
        getDate(1);
    }
 };

function getDate(i : Integer)
{
    if(i==0){
        txtEmpDoj.text = fxCalendar.getSelectedDate();
        dojFlag = false;
        txtEmpSalary.requestFocus();
    }else if(i==1){
        txtEmpDob.text = fxCalendar.getSelectedDate();
        dobFlag = false;
        var s:String[] = txtEmpDob.text.split("-");
        var c:String[] = DateUtils.now("dd-MM-yyyy").split("-");
        txtEmpAge.text = "{Integer.parseInt(c[2])- Integer.parseInt(s[2])}";
        txtEmpAge.requestFocus();
    }
 }
    public function getPrivileges(u : String): Void {
        var uname = u;
        //Controller Instance
        commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
        var utype = commonController .getUserType(uname);
        if(utype.equals("User"))
        {
            //CommonContrioller Call
            var priv = commonController.getPrivileges("masters", uname);
            var ss = priv.split(",");
            var val = Integer.parseInt(ss[4]);
            if(val == 1)
            {
				btnEmpSave.disable=true;
				if(btnEmpEdit.text!="Edit [F6]")
				{
					btnEmpEdit.disable=true;
				}
				else{
					btnEmpEdit.disable=false;
				}      
            }
            else if(val == 2)
            {				
				if(btnEmpEdit.text!="Edit [F6]")
				{
					btnEmpEdit.disable=true;
				}
				else{
					btnEmpEdit.disable=false;
				}
				btnEmpSave.disable=false;				
                //This code for  READ and WRITE Access
            }
            else if(val == 3)
            {
				btnEmpSave.disable=false;
				btnEmpEdit.disable=false;
                //This code for FULL Access
            }
        }else {
				btnEmpSave.disable=false;
				btnEmpEdit.disable=false;		
		}
    }
var logUser: String =  bind CommonDeclare.user on replace{
            getPrivileges(logUser);
        }

var changPiv =  bind btnEmpSave.text on replace{
            getPrivileges(logUser);
        }

var changPiv1 =  bind btnEmpEdit.text on replace{
            getPrivileges(logUser);
        }		


    public function StartUp(){
        panel.visible = true;
        currentState.actual=currentState.findIndex("Shown");
        panel.content = [ rectangle, rectHeader, label, separator, separator2, separator3, label2, label3, label4, label5, label6, label7, label8, label9, label10, label11, label12, label13, panelButtons, label14, txtEmpDoj, rdoEmpMale, rdoEmpFemale, txtEmpSalary, txtEmpAdd1, txtEmpAdd2, txtEmpCity, txtEmpPhone, txtEmpEmail, txtEmpPincode, txtEmpCountry, txtEmpState, txtEmpBG, txtEmpName, txtEmpAdd3, label15, label16, label1, txtEmpMobile, label17, label18, label19, label20, label21, txtEmpQualfy, txtEmpExp, txtEmpDob, txtEmpAge, rectangle3, imagePhoto, lblEmpUpload, lblEmpRemove, imageDOJ, imageDOB, labelYears, listEmp, txtEmpCode, panelAlert, imageEmpDown, imageCountryDown, imageStateDpwn, EmpCalendarPanel, ];
        txtEmpCode.requestFocus();
        fxCalendar.visible = false;
        txtEmpName.style = mandatoryStyle;
        txtEmpDob.style = mandatoryStyle;
        txtEmpDoj.style = mandatoryStyle;
        txtEmpSalary.style = mandatoryStyle;
        txtEmpAdd1.style = mandatoryStyle;
        txtEmpCity.style = mandatoryStyle;
        txtEmpCode.style = mandatoryStyle;
        EmpCalendarPanel.content = [fxCalendar,];
        imageDOJ.image=Image {url: "{__DIR__}images/Calender.png"};
        imageDOB.image=Image {url: "{__DIR__}images/Calender.png"};
        srCode = empCode();
        txtEmpCode.requestFocus();
//        if (srCode == "") {
//            srCode = "EC0000001";
//        }
//        txtEmpCode.text = srCode;
    }

}