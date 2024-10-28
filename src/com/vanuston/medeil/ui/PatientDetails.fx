

package com.vanuston.medeil.ui;

import javafx.scene.input.KeyCode;
import javafx.scene.control.TextBox;
import com.vanuston.medeil.implementation.Customer;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.util.KeyRegistry;
import com.vanuston.medeil.util.Validation;
import java.lang.Exception;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.uitables.ConfirmDialogBox;
import java.util.ArrayList;
import java.util.List;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import com.vanuston.medeil.ui.calendar.theme.Theme;
import javafx.scene.image.Image;
import com.vanuston.medeil.model.CustomerModel;
import javafx.scene.Node;
import javafx.scene.control.ToggleGroup;
import javafx.scene.control.ListView;
import javafx.scene.control.RadioButton;
import javafx.scene.control.Button;
import javafx.scene.effect.Reflection;
import javafx.scene.text.Font;
import javafx.scene.effect.DropShadow;
import javafx.scene.shape.Rectangle;
import javafx.scene.paint.LinearGradient;
import javafx.scene.input.MouseEvent;
import javafx.scene.image.ImageView;
import org.netbeans.javafx.design.DesignState;
import javafx.scene.layout.LayoutInfo;
import com.vanuston.medeil.util.RegistryConstants;
import javafx.scene.control.Label;
import javafx.scene.input.KeyEvent;
import javafx.scene.paint.Color;
import javafx.scene.layout.Panel;
import javafx.scene.effect.Lighting;
import com.vanuston.medeil.util.DateUtils;
import java.text.SimpleDateFormat;

var healthconditions:ArrayList = ArrayList{};
var allergies:ArrayList = ArrayList{};
def docInfo = new DoctorInformation();

public class PatientDetails  {
    public var cashBillDate = DateUtils.now("dd-MM-yyyy");
    var patientDetailsController: Customer = RegistryFactory.getClientStub(RegistryConstants.Customer) as Customer;
    var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    var log: Logger = Logger.getLogger(PatientDetails.class, "PatientDetailsInfo");
    var listH = 0.0;
    public var isBack = false;
    var panelW = bind CommonDeclare.panelFormW on replace {
        Type5TextboxW = panelW * 3.811944091 / 100;
        listViewPatient.visible = false;
    }
    var Type5TextboxW = panelW * 3.811944091 / 100;
    var panelH = bind CommonDeclare.panelFormH;
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var C1LX = bind CommonDeclare.Column2LX+50;
    var C2LX = bind CommonDeclare.Column3LX-100;
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
    var botton21LX = bind CommonDeclare.botton2LX;
    var botton22LX = bind CommonDeclare.botton3LX;
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
    var dateFlag: Boolean = false;
    var errorStyle: String = CommonDeclare.textbox_error();
    def CustomAlert = CustomAlert {};
    
    var fxCalendar = FXCalendar {
            theme: Theme {};
     };
       
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def lblPatientDate: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX
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
    
    public-read def rdoInPatient: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: bind C2LX
        text: "Radio Button"
    }
    
    public-read def rdoOutPatient: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: bind C2LX+130
        text: "Radio Button"
    }
    
    def __layoutInfo_txtPatientDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW-200
    }
    public-read def txtPatientDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX
        layoutInfo: __layoutInfo_txtPatientDate
        text: bind cashBillDate
    }
    
    public-read def imgCalendar: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C2LX+txtPatientDate.width
    }
    
    def __layoutInfo_txtDepartment: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtDepartment: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: true
        layoutX: bind C2LX
        layoutY: 186.0
        layoutInfo: __layoutInfo_txtDepartment
    }
    
    def __layoutInfo_txtWardNumber: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtWardNumber: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX
        layoutInfo: __layoutInfo_txtWardNumber
    }
    
    def __layoutInfo_txtRoomNumber: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtRoomNumber: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX
        layoutInfo: __layoutInfo_txtRoomNumber
    }
    
    public-read def panelMsgBox: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: 152.0
        layoutY: 288.0
    }
    
    public-read def imagePatientList: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C2LX+Type1TextboxW-2
        layoutY: 267.0
        onMouseClicked: imagePatientListOnMouseClicked
    }
    
    public-read def imageDoctorList: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C2LX+Type1TextboxW-2
        layoutY: 160.0
        onMouseClicked: imageDoctorListOnMouseClicked
    }
    
    public-read def imageDepartmentList: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C2LX+Type1TextboxW-2
        layoutY: 420.0
        blocksMouse: true
    }
    
    def __layoutInfo_listViewPatient: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listViewPatient: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C2LX
        layoutInfo: __layoutInfo_listViewPatient
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    public-read def datePanel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind C2LX
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
    }
    
    public-read def txtId: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 6.0
        layoutY: 44.0
    }
    
    public-read def rectPatientAllergies: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind C2LX+Type1TextboxW+20
        width: 100.0
        height: 50.0
    }
    
    public-read def rectHealthConditions: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind C2LX+Type1TextboxW+160
        width: 100.0
        height: 50.0
    }
    
    public-read def rectCustDetails: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind C2LX+Type1TextboxW+160
        width: 100.0
        height: 50.0
    }
    
    public-read def lblPatientAllergies: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C2LX+Type1TextboxW+25
        text: "Patient Allergies"
    }
    
    public-read def lblHealthConditions: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C2LX+Type1TextboxW+165
        text: "Health Conditions"
    }
    
    public-read def lblCustomerDetails: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C2LX+Type1TextboxW+165
        text: "Label"
    }
    
    public-read def panelPopUp: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind C1LX-20
    }
    
    public-read def panelPopUp2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind C2LX+90
    }
    
    def __layoutInfo_panelDepartment: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
        height: bind panelH
    }
    public-read def panelDepartment: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelAlertLX+150
        layoutY: bind panelAlertLY+70
        layoutInfo: __layoutInfo_panelDepartment
    }
    
    public-read def panelCalendar: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
    }
    
    public-read def panelDocInfo: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
    }
    
    public-read def imgDocSave: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnDocSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnDocSave: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton21LX
        layoutY: bind panelButtonsLY
        layoutInfo: __layoutInfo_btnDocSave
        graphic: imgDocSave
        text: "Button"
    }
    
    public-read def imgDocBack: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
    }
    
    def __layoutInfo_btnDocBack: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnDocBack: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton22LX
        layoutY: bind panelButtonsLY
        layoutInfo: __layoutInfo_btnDocBack
        graphic: imgDocBack
        text: "Button"
    }
    
    public-read def panelBack: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ btnDocSave, btnDocBack, ]
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
    
    def __layoutInfo_txtRefDoctorName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtRefDoctorName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 186.0
        layoutInfo: __layoutInfo_txtRefDoctorName
        onKeyPressed: txtRefDoctorNameOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtPatientName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
        hfill: false
    }
    public-read def txtPatientName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 158.0
        layoutInfo: __layoutInfo_txtPatientName
        style: ""
        styleClass: "text-box"
        onKeyPressed: txtPatientNameOnKeyPressed
        effect: null
        text: ""
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
    
    def __layoutInfo_btnCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind CancelW
        height: bind bottonH
    }
    public-read def btnCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton4LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_btnCancel
        effect: reflectionEffect
        graphic: imgCancel
        text: "Cancel [F8]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
        action: btnCancelAction
    }
    
    def __layoutInfo_btnReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton3LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_btnReset
        effect: reflectionEffect
        graphic: imageView3
        text: "Reset [F4]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
        action: btnResetAction
    }
    
    def __layoutInfo_btnEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton2LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_btnEdit
        effect: reflectionEffect
        graphic: imgEdit
        text: "Edit [F6]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
        action: btnEditAction
    }
    
    def __layoutInfo_btnSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_btnSave
        translateX: 0.0
        effect: reflectionEffect
        graphic: imageView
        text: "Save [F3]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
        action: btnSaveAction
    }
    
    public-read def panelButtons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: bind panelButtonsLY
        content: [ btnSave, btnEdit, btnReset, btnCancel, ]
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
    
    public-read def lblRoomNumber: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 186.0
        text: "Room Number"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def lblWardNumber: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 455.0
        text: "Ward Number"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def lblDepartment: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 273.0
        text: "Department"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def lblRefDoctorName: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 158.0
        text: "Referrred Doctor Name"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def lblPatientName: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 158.0
        styleClass: "label"
        text: "Patient Name/Mobile Number"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def lblPatientType: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 130.0
        text: "Patient Type"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 1.0
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "form-background"
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
    
    public-read def dropShadowEffect: javafx.scene.effect.DropShadow = javafx.scene.effect.DropShadow {
    }
    
    public-read def lightingEffect: javafx.scene.effect.Lighting = javafx.scene.effect.Lighting {
    }
    
    def __layoutInfo_lblPatientDetails: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
    }
    public-read def lblPatientDetails: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 1.0
        layoutInfo: __layoutInfo_lblPatientDetails
        effect: lightingEffect
        text: "PatientDetails"
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
        content: [ rectangle, rectHeader, lblPatientDetails, lblPatientDate, lblPatientType, lblPatientName, lblRefDoctorName, lblDepartment, lblWardNumber, lblRoomNumber, panelButtons, rdoInPatient, rdoOutPatient, txtPatientDate, imgCalendar, txtPatientName, txtRefDoctorName, txtDepartment, txtWardNumber, txtRoomNumber, panelMsgBox, imagePatientList, imageDoctorList, imageDepartmentList, listViewPatient, datePanel, panelAlert, txtId, rectPatientAllergies, rectHealthConditions, rectCustDetails, lblPatientAllergies, lblHealthConditions, lblCustomerDetails, panelPopUp, panelPopUp2, panelDepartment, panelCalendar, ]
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
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Calender.png"
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "DocInfo", "Shown", ]
        actual: 1
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectangle.blocksMouse = false;
                            lblPatientDetails.text = "PatientDetails";
                            lblPatientDate.visible = false;
                            lblPatientDate.layoutY = 0.0;
                            lblPatientDate.text = "Label";
                            lblPatientDate.textFill = javafx.scene.paint.Color.BLACK;
                            lblPatientType.layoutY = 130.0;
                            lblPatientType.text = "Patient Type";
                            lblPatientName.layoutY = 158.0;
                            lblPatientName.text = "Patient Name/Mobile Number";
                            lblRefDoctorName.layoutY = 158.0;
                            lblRefDoctorName.text = "Referrred Doctor Name";
                            lblDepartment.visible = true;
                            lblDepartment.layoutY = 273.0;
                            lblDepartment.text = "Department";
                            lblWardNumber.visible = true;
                            lblWardNumber.layoutY = 455.0;
                            lblWardNumber.text = "Ward Number";
                            lblRoomNumber.visible = true;
                            lblRoomNumber.layoutY = 186.0;
                            lblRoomNumber.text = "Room Number";
                            imageView.visible = false;
                            imageView.image = null;
                            btnSave.text = "Save [F3]";
                            btnSave.action = btnSaveAction;
                            imgEdit.visible = false;
                            imgEdit.image = null;
                            btnEdit.text = "Edit [F6]";
                            btnEdit.action = btnEditAction;
                            imageView3.visible = false;
                            imageView3.image = null;
                            btnReset.text = "Reset [F4]";
                            btnReset.action = btnResetAction;
                            imgCancel.visible = false;
                            imgCancel.layoutX = 0.0;
                            imgCancel.image = null;
                            btnCancel.text = "Cancel [F8]";
                            btnCancel.hpos = javafx.geometry.HPos.CENTER;
                            btnCancel.graphicTextGap = 4.0;
                            btnCancel.action = btnCancelAction;
                            panelButtons.visible = false;
                            rdoInPatient.visible = false;
                            rdoInPatient.layoutY = 0.0;
                            rdoInPatient.text = "Radio Button";
                            rdoInPatient.toggleGroup = null;
                            rdoOutPatient.visible = false;
                            rdoOutPatient.layoutY = 0.0;
                            rdoOutPatient.text = "Radio Button";
                            rdoOutPatient.toggleGroup = null;
                            rdoOutPatient.selected = false;
                            txtPatientDate.visible = false;
                            txtPatientDate.layoutY = 0.0;
                            txtPatientDate.editable = true;
                            imgCalendar.visible = false;
                            imgCalendar.layoutY = 0.0;
                            imgCalendar.image = null;
                            txtPatientName.layoutY = 158.0;
                            txtPatientName.onKeyPressed = txtPatientNameOnKeyPressed;
                            txtPatientName.editable = true;
                            txtRefDoctorName.layoutY = 186.0;
                            txtRefDoctorName.onKeyPressed = txtRefDoctorNameOnKeyPressed;
                            txtRefDoctorName.editable = true;
                            txtDepartment.visible = true;
                            txtDepartment.layoutY = 186.0;
                            txtWardNumber.visible = false;
                            txtWardNumber.layoutY = 0.0;
                            txtRoomNumber.visible = false;
                            txtRoomNumber.layoutY = 0.0;
                            panelMsgBox.layoutX = 152.0;
                            panelMsgBox.layoutY = 288.0;
                            imagePatientList.visible = false;
                            imagePatientList.layoutY = 267.0;
                            imagePatientList.onMouseClicked = imagePatientListOnMouseClicked;
                            imagePatientList.blocksMouse = false;
                            imagePatientList.image = null;
                            imageDoctorList.visible = false;
                            imageDoctorList.layoutY = 160.0;
                            imageDoctorList.onMouseClicked = imageDoctorListOnMouseClicked;
                            imageDoctorList.blocksMouse = false;
                            imageDoctorList.image = null;
                            imageDepartmentList.visible = false;
                            imageDepartmentList.layoutY = 420.0;
                            imageDepartmentList.blocksMouse = true;
                            imageDepartmentList.image = null;
                            datePanel.visible = true;
                            datePanel.blocksMouse = false;
                            txtId.visible = false;
                            txtId.text = null;
                            rectPatientAllergies.visible = false;
                            rectPatientAllergies.layoutY = 0.0;
                            rectPatientAllergies.styleClass = "";
                            rectPatientAllergies.fill = javafx.scene.paint.Color.BLACK;
                            rectPatientAllergies.stroke = null;
                            rectPatientAllergies.strokeWidth = 1.0;
                            rectPatientAllergies.width = 100.0;
                            rectPatientAllergies.height = 50.0;
                            rectPatientAllergies.arcWidth = 0.0;
                            rectPatientAllergies.arcHeight = 0.0;
                            rectHealthConditions.visible = false;
                            rectHealthConditions.layoutY = 0.0;
                            rectHealthConditions.styleClass = "";
                            rectHealthConditions.fill = javafx.scene.paint.Color.BLACK;
                            rectHealthConditions.stroke = null;
                            rectHealthConditions.strokeWidth = 1.0;
                            rectHealthConditions.width = 100.0;
                            rectHealthConditions.height = 50.0;
                            rectHealthConditions.arcWidth = 0.0;
                            rectHealthConditions.arcHeight = 0.0;
                            rectCustDetails.visible = false;
                            rectCustDetails.layoutY = 0.0;
                            rectCustDetails.styleClass = "";
                            rectCustDetails.fill = javafx.scene.paint.Color.BLACK;
                            rectCustDetails.stroke = null;
                            rectCustDetails.width = 100.0;
                            rectCustDetails.height = 50.0;
                            rectCustDetails.arcWidth = 0.0;
                            rectCustDetails.arcHeight = 0.0;
                            lblPatientAllergies.visible = false;
                            lblPatientAllergies.layoutY = 0.0;
                            lblPatientAllergies.text = "Patient Allergies";
                            lblPatientAllergies.textFill = javafx.scene.paint.Color.BLACK;
                            lblHealthConditions.visible = false;
                            lblHealthConditions.layoutY = 0.0;
                            lblHealthConditions.text = "Health Conditions";
                            lblHealthConditions.textFill = javafx.scene.paint.Color.BLACK;
                            lblCustomerDetails.visible = false;
                            lblCustomerDetails.layoutY = 0.0;
                            lblCustomerDetails.text = "Label";
                            lblCustomerDetails.textFill = javafx.scene.paint.Color.BLACK;
                            panelPopUp.visible = false;
                            panelPopUp2.visible = false;
                            panelDepartment.visible = false;
                            panelCalendar.visible = false;
                            panelCalendar.blocksMouse = false;
                            panel.visible = false;
                            panelDocInfo.visible = true;
                            imgDocSave.visible = true;
                            imgDocSave.image = imageSave;
                            btnDocSave.visible = true;
                            btnDocSave.text = "Save [F3]";
                            btnDocSave.font = Arial_Bold_14;
                            btnDocSave.action = btnDocSaveActionAtDocInfo;
                            imgDocBack.visible = true;
                            imgDocBack.image = imageBack;
                            btnDocBack.visible = true;
                            btnDocBack.text = "Back";
                            btnDocBack.font = Arial_Bold_14;
                            btnDocBack.action = btnDocBackActionAtDocInfo;
                            panelBack.visible = true;
                        }
                    }
                ]
            }
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectangle.blocksMouse = true;
                            lblPatientDetails.text = "Patient Details";
                            lblPatientDate.visible = true;
                            lblPatientDate.layoutY = 115.0;
                            lblPatientDate.text = "Date";
                            lblPatientDate.font = Arial_12;
                            lblPatientDate.textFill = DarkGray;
                            lblPatientType.layoutY = 80.0;
                            lblPatientType.text = "Patient Type";
                            lblPatientName.layoutY = 150.0;
                            lblPatientName.text = "Patient Name";
                            lblRefDoctorName.layoutY = 185.0;
                            lblRefDoctorName.text = "Referrred Doctor Name";
                            lblDepartment.visible = false;
                            lblDepartment.layoutY = 220.0;
                            lblDepartment.text = "Department";
                            lblWardNumber.visible = false;
                            lblWardNumber.layoutY = 255.0;
                            lblWardNumber.text = "Ward Number";
                            lblRoomNumber.visible = false;
                            lblRoomNumber.layoutY = 290.0;
                            lblRoomNumber.text = "Room Number";
                            imageView.visible = true;
                            imageView.image = imageSave;
                            btnSave.onKeyPressed = btnSaveOnKeyPressed;
                            btnSave.text = "Save [F3]";
                            btnSave.action = btnSaveAction;
                            imgEdit.visible = true;
                            imgEdit.image = imageEdit;
                            btnEdit.onKeyPressed = btnEditOnKeyPressed;
                            btnEdit.text = "Edit [F6]";
                            btnEdit.action = btnEditAction;
                            imageView3.visible = true;
                            imageView3.image = imageReset;
                            btnReset.onKeyPressed = btnEditOnKeyPressed;
                            btnReset.text = "Reset [F4]";
                            btnReset.action = btnResetAction;
                            imgCancel.visible = true;
                            imgCancel.layoutX = 0.0;
                            imgCancel.image = imageCancel;
                            btnCancel.text = "Cancel [F8]";
                            btnCancel.hpos = javafx.geometry.HPos.CENTER;
                            btnCancel.graphicTextGap = 4.0;
                            btnCancel.action = btnCancelAction;
                            panelButtons.visible = true;
                            rdoInPatient.visible = true;
                            rdoInPatient.layoutY = 80.0;
                            rdoInPatient.onMouseClicked = rdoInPatientOnMouseClickedAtShown;
                            rdoInPatient.text = "In Patient";
                            rdoInPatient.font = Arial_12;
                            rdoInPatient.toggleGroup = toggleGroup;
                            rdoOutPatient.visible = true;
                            rdoOutPatient.layoutY = 80.0;
                            rdoOutPatient.onMouseClicked = rdoOutPatientOnMouseClickedAtShown;
                            rdoOutPatient.text = "Out Patient";
                            rdoOutPatient.font = Arial_12;
                            rdoOutPatient.toggleGroup = toggleGroup;
                            rdoOutPatient.selected = true;
                            txtPatientDate.visible = true;
                            txtPatientDate.layoutY = 115.0;
                            txtPatientDate.editable = false;
                            imgCalendar.visible = true;
                            imgCalendar.layoutY = 115.0;
                            imgCalendar.onMouseClicked = imgCalendarOnMouseClickedAtShown;
                            imgCalendar.image = image;
                            txtPatientName.layoutY = 150.0;
                            __layoutInfo_txtPatientName.height = 21.0;
                            txtPatientName.onKeyPressed = txtPatientNameOnKeyPressed;
                            txtPatientName.editable = false;
                            txtRefDoctorName.layoutY = 185.0;
                            txtRefDoctorName.onKeyPressed = txtRefDoctorNameOnKeyPressed;
                            txtRefDoctorName.editable = false;
                            txtDepartment.visible = false;
                            txtDepartment.layoutY = 220.0;
                            txtDepartment.onKeyPressed = txtDepartmentOnKeyPressedAtShown;
                            txtDepartment.font = Arial_12;
                            txtWardNumber.visible = false;
                            txtWardNumber.layoutY = 255.0;
                            txtWardNumber.onKeyPressed = txtWardNumberOnKeyPressedAtShown;
                            txtWardNumber.font = Arial_12;
                            txtRoomNumber.visible = false;
                            txtRoomNumber.layoutY = 290.0;
                            txtRoomNumber.onKeyPressed = txtRoomNumberOnKeyPressedAtShown;
                            panelMsgBox.layoutX = 180.0;
                            panelMsgBox.layoutY = 260.0;
                            imagePatientList.visible = true;
                            imagePatientList.layoutY = 150.0;
                            imagePatientList.onMouseClicked = imagePatientListOnMouseClicked;
                            imagePatientList.blocksMouse = true;
                            imagePatientList.image = imageDown;
                            imageDoctorList.visible = true;
                            imageDoctorList.layoutY = 185.0;
                            imageDoctorList.onMouseClicked = imageDoctorListOnMouseClicked;
                            imageDoctorList.blocksMouse = true;
                            imageDoctorList.image = imageDown;
                            imageDepartmentList.visible = false;
                            imageDepartmentList.layoutY = 220.0;
                            imageDepartmentList.onMouseClicked = imageDepartmentListOnMouseClickedAtShown;
                            imageDepartmentList.blocksMouse = true;
                            imageDepartmentList.image = imageDown;
                            datePanel.visible = true;
                            datePanel.blocksMouse = true;
                            txtId.visible = false;
                            txtId.text = "0";
                            rectPatientAllergies.visible = true;
                            rectPatientAllergies.layoutY = 400.0;
                            rectPatientAllergies.styleClass = "rectbutton";
                            rectPatientAllergies.onMouseClicked = rectPatientAllergiesOnMouseClickedAtShown;
                            rectPatientAllergies.fill = javafx.scene.paint.Color.YELLOW;
                            rectPatientAllergies.stroke = DarkGray;
                            rectPatientAllergies.strokeWidth = 2.0;
                            rectPatientAllergies.width = 110.0;
                            rectPatientAllergies.height = 20.0;
                            rectPatientAllergies.arcWidth = 10.0;
                            rectPatientAllergies.arcHeight = 10.0;
                            rectHealthConditions.visible = true;
                            rectHealthConditions.layoutY = 400.0;
                            rectHealthConditions.styleClass = "rectbutton";
                            rectHealthConditions.onMouseClicked = rectHealthConditionsOnMouseClickedAtShown;
                            rectHealthConditions.fill = javafx.scene.paint.Color.YELLOW;
                            rectHealthConditions.stroke = DarkGray;
                            rectHealthConditions.strokeWidth = 1.0;
                            rectHealthConditions.width = 110.0;
                            rectHealthConditions.height = 20.0;
                            rectHealthConditions.arcWidth = 10.0;
                            rectHealthConditions.arcHeight = 10.0;
                            rectCustDetails.visible = true;
                            rectCustDetails.layoutY = 447.0;
                            rectCustDetails.styleClass = "rectbutton";
                            rectCustDetails.onMouseClicked = rectCustDetailsOnMouseClickedAtShown;
                            rectCustDetails.fill = javafx.scene.paint.Color.YELLOW;
                            rectCustDetails.stroke = DarkGray;
                            rectCustDetails.width = 110.0;
                            rectCustDetails.height = 20.0;
                            rectCustDetails.arcWidth = 10.0;
                            rectCustDetails.arcHeight = 10.0;
                            lblPatientAllergies.visible = true;
                            lblPatientAllergies.layoutY = 402.0;
                            lblPatientAllergies.text = "Patient Allergies";
                            lblPatientAllergies.font = Arial_Bold_12;
                            lblPatientAllergies.textFill = DarkGray;
                            lblHealthConditions.visible = true;
                            lblHealthConditions.layoutY = 402.0;
                            lblHealthConditions.text = "Health Conditions";
                            lblHealthConditions.font = Arial_Bold_12;
                            lblHealthConditions.textFill = DarkGray;
                            lblCustomerDetails.visible = true;
                            lblCustomerDetails.layoutY = 449.0;
                            lblCustomerDetails.text = "Customer Details";
                            lblCustomerDetails.font = Arial_Bold_12;
                            lblCustomerDetails.textFill = DarkGray;
                            panelPopUp.visible = false;
                            panelPopUp2.visible = false;
                            panelDepartment.visible = false;
                            panelCalendar.visible = true;
                            panelCalendar.onMouseClicked = panelCalendarOnMouseClickedAtShown;
                            panelCalendar.blocksMouse = true;
                            panel.visible = true;
                            panelDocInfo.visible = false;
                            imgDocSave.visible = false;
                            imgDocSave.image = null;
                            btnDocSave.visible = false;
                            btnDocSave.text = "Button";
                            imgDocBack.visible = false;
                            imgDocBack.image = null;
                            btnDocBack.visible = false;
                            btnDocBack.text = "Button";
                            panelBack.visible = false;
                        }
                    }
                ]
            }
        ]
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel, panelDocInfo, panelBack, ]
    }
    // </editor-fold>//GEN-END:main

    function imgCalendarOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        if (not dateFlag) {
            panelCalendar.layoutX = imgCalendar.layoutX+20;
            panelCalendar.layoutY = imgCalendar.layoutY;
            if (txtPatientDate.text != null) {
                var dat = txtPatientDate.rawText.split("-");
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
            fxCalendar.visible = not fxCalendar.visible;
            dateFlag = true;
        } else {
            fxCalendar.visible = false;
        }
    }

 

    function panelCalendarOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
       listViewPatient.visible=false;
    }

   

    function btnDocBackActionAtDocInfo (): Void {
        panelDocInfo.visible = false;
        panelBack.visible = false;
        txtDepartment.text = "";
        txtDepartment.requestFocus();
        currentState.actual = currentState.findIndex("Shown");
    }

    function btnDocSaveActionAtDocInfo(): Void {
        var stateVal = currentState.actual;        if(stateVal == 0){
            var doc = bind docInfo.newDoc;
            var retVal = bind docInfo.doctorSave();
            if (retVal == 0) {
                currentState.actual = currentState.findIndex("Shown");
                txtRefDoctorName.text = doc;
                if(rdoInPatient.selected == true){
                    txtDepartment.requestFocus();
               }
            }
        }
     }
    

    function txtRoomNumberOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtDepartment.requestFocus(); }
        shortcut(event);
    }

    function imageDepartmentListOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        getDepartment(0);
    }

    public function getDepartment(con: Integer): Void {
        if(not listViewPatient.visible){
        listViewPatient.visible = false;
        var listControlObj: ListController = new ListController() ;
        listH = listControlObj.listImageControlView(txtDepartment, listViewPatient, "Department", con);
        listW = txtDepartment.width;
        listViewPatient.layoutY = txtDepartment.layoutY + 22;
        }
        else{
            listViewPatient.visible = false;
            txtDepartment.requestFocus();
        }
    }

    function txtWardNumberOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtRoomNumber.requestFocus(); }
        shortcut(event);
    }


    function txtDepartmentOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtWardNumber.requestFocus(); }
        shortcut(event);
     }

    function rectCustDetailsOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
            def customerInformation = CustomerInformation {};
            delete panel.content;
            insert customerInformation.getDesignRootNodes() into panel.content;
            customerInformation.StartUp();
            panel.visible=true;
    }

    function rdoOutPatientOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
            listViewPatient.visible=false;
            lblWardNumber.visible=false;
            lblRoomNumber.visible=false;
            lblDepartment.visible=false;
            txtWardNumber.visible=false;
            txtRoomNumber.visible=false;
            txtDepartment.visible=false;
            imageDepartmentList.visible=false;
            txtPatientName.requestFocus();
   }

    function rectHealthConditionsOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        def healthConditions = HealthConditions{};
        delete  panelPopUp2.content;
        insert healthConditions.panelReturnNotes into panelPopUp2.content;
        healthConditions.initShow();
        panelPopUp2.visible = true;
    }

    function rectPatientAllergiesOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        def patientAllergies = PatientAllergies{};
        delete  panelPopUp.content;
        insert patientAllergies.panelReturnNotes into panelPopUp.content;
        patientAllergies.initShow();
        panelPopUp.visible = true;
    }


    function rdoInPatientOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
          listViewPatient.visible=false;
          lblDepartment.visible=true;
          lblWardNumber.visible=true;
          lblRoomNumber.visible=true;
          txtDepartment.visible=true;
          txtWardNumber.visible=true;
          txtRoomNumber.visible=true;
          imageDepartmentList.visible=true;
          txtPatientName.requestFocus();
    }

    def kr = KeyRegistry {};
    var ss = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 6 and CommonDeclare.form[5] == 1) {
            shortcut(ss);
        }
    }

    function callDocInfo(): Void {
        docInfo.Startup();
        insertDocForm();
        currentState.actual = currentState.findIndex("DocInfo");
    }

    function insertDocForm(): Void {
        docInfo.currentState.actual = docInfo.currentState.findIndex("FromSales");
        docInfo.checkState = 1;
        delete  panelDocInfo.content;
        insert docInfo.getDesignRootNodes() into panelDocInfo.content;
    }

    public function getDoctor(con: Integer): Void {
        if(not listViewPatient.visible){
        listViewPatient.visible = false;
        var listControlObj: ListController = new ListController() ;
        listW = txtRefDoctorName.width;
        listViewPatient.layoutY = txtRefDoctorName.layoutY + 22;
        listH = listControlObj.listImageControlView(txtRefDoctorName, listViewPatient, "DoctorName", con);
        var selS: String = bind listControlObj.selectedString on replace {
        if (selS.length() > 0) {
          if (listViewPatient.selectedItem != "New name...") {
          txtRefDoctorName.text = "{listViewPatient.selectedItem}";
          listViewPatient.visible = false;
        } else {
            listViewPatient.visible = false;
            callDocInfo();
        }
       }
      }
      txtDepartment.requestFocus();
      }
      else{
          listViewPatient.visible = false;
          txtRefDoctorName.requestFocus();
    }
   }
 
    public function shortcut(event: javafx.scene.input.KeyEvent): Void {
            if (event.code == kr.save and btnSave.text == "Save [F3]" and not btnSave.disable) {
                save(0);
            }
            if (event.code == kr.edit and btnEdit.text == "Edit [F6]" and not btnEdit.disable) {
                edit();
            }
            if (event.code == kr.reset and btnReset.text == "Reset [F4]") {
                reset();
            }
            if (event.code == kr.update and btnSave.disable == false) {
                if (btnSave.text == "Update [F7]") { update(0); }
            }
            if (event.code == kr.del and btnEdit.disable == false) {
                if (btnEdit.text == "Delete [F5]") { del(); }
            }
            if (event.controlDown and event.code == kr.back) {
                if (btnCancel.text == "Back [Ctrl+Left]") { back(); }
            }
            if (event.code == kr.cancel) {
                if (btnCancel.text == "Cancel [F8]") { cancel(); }
            }
    }

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Patient Details", type);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Patient Details", msg);
        showAlertbox();
    }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Patient Details", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = errorStyle;
    }
    
    var visit = bind fxCalendar.visible on replace {
        if (dateFlag and not visit) {
            cashBillDate = fxCalendar.getSelectedDate();
            dateFlag = false;
            txtPatientName.requestFocus();
        }
    };
   
    function imagePatientListOnMouseClicked(event: javafx.scene.input.MouseEvent): Void{
         getPatient(0);
    }


    function imageDoctorListOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
         getDoctor(0);
    }


    function txtPatientNameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtRefDoctorName.requestFocus(); }
        shortcut(event);        
    }



    function txtRefDoctorNameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtDepartment.requestFocus(); }
        shortcut(event);
    }


    function btnCancelAction(): Void {
        cancel();
    }

    function btnResetAction(): Void {
        reset();
    }

    function btnEditAction(): Void {
        if (btnEdit.text == "Delete [F5]") {
            del();
        } else {
            edit();
        }
    }
    
    function btnSaveOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER ) {
             save(0) ; 
        }
    }

    function btnEditOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
         if (event.code == KeyCode.VK_ENTER ) {
            if (btnEdit.text == "Delete [F5]") { del() ; }
            else { edit() ; }
        }
    }

    function btnResetOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
         if (event.code == KeyCode.VK_ENTER ) {
           reset () ;
         }
    }

    function btnSaveAction(): Void {
        if(btnSave.text == "Save [F3]"){
            save(0);
        }
        else{
            update(0);
        }
    }

    public function patientAllergies(al:ArrayList)
    {
       allergies = al;
    }

    public function patientHealthConditions(hc:ArrayList)
    {
       healthconditions = hc;
    }

    public function save(chk: Integer): Void {
      try {
              var i:Boolean = false;
              var san: Integer = 0;
              var sdf = new SimpleDateFormat("dd-MM-yyyy");
              var patDate = DateUtils.changeFormatDate(sdf.parse(txtPatientDate.rawText));
              i=commonController.selectPatientName(txtPatientName.rawText.trim().replaceAll("'",""));
              san = clickValid(chk);
              if(i==false){
                if (san == 1) {
                    //PatientDetailsController Call
                    var custType: String = null;
                    if (rdoOutPatient.selected == true) {
                        custType = "Out Patient";
                    } else if (rdoInPatient.selected == true) {
                        custType = "In Patient";
                    } else {
                        custType = "None";
                    }
                    var customerModel : CustomerModel = new CustomerModel();
                    customerModel.setDate(patDate);
                    customerModel.setPatientName(txtPatientName.rawText.trim().replaceAll("'",""));
                    customerModel.setDoctorName(txtRefDoctorName.rawText.trim().replaceAll("'", ""));
                    customerModel.setDepartment(txtDepartment.rawText.trim().replaceAll("'", ""));
                    customerModel.setWardNumber(txtWardNumber.rawText.trim().replaceAll("'", ""));
                    customerModel.setRoomNumber(txtRoomNumber.rawText.trim().replaceAll("'", ""));
                    customerModel.setCustType(custType);
                    customerModel.setAllergiesList(allergies);
                    customerModel.setHealthConditionsList(healthconditions);
                    customerModel.setCurrentUser(CommonDeclare.user);
                    var isCreate:Boolean= patientDetailsController.createPatientDetailsRecord(customerModel) as Boolean;
                    if(isCreate) {
                      FXalert(0);
                      commonController.updateLog("Patient Details Info",btnSave.text);
                      txtPatientName.requestFocus();
                      clear();
                    }
                    allergies.clear();
                    healthconditions.clear();
                    PatientAllergies.selAllergies.clear();
                    HealthConditions.selHealthConditions.clear();
                   }
                 }
              else{
                    FXinfo("Patient Name already Exists.");
               }
      }catch (e: Exception) {
            var msg: String = "Class : PatientDetailsInfo  Method : Save()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function update(chk: Integer): Void {
      try {
              var san: Integer = 0;
              var sdf = new SimpleDateFormat("dd-MM-yyyy");
              var patDate = DateUtils.changeFormatDate(sdf.parse(txtPatientDate.rawText));
              san = clickValid(chk);
              if (san == 1) {
                    //PatientDetailsController Call
                var custType: String = null;
                 if (rdoOutPatient.selected == true) {
                     custType = "Out Patient";
                 } else if (rdoInPatient.selected == true) {
                        custType = "In Patient";
                 } else {
                        custType = "None";
                 }
                 var customerModel : CustomerModel = new CustomerModel();
                 customerModel.setDate(patDate);
                 customerModel.setPatientName(txtPatientName.rawText.trim().replaceAll("'",""));
                 customerModel.setDoctorName(txtRefDoctorName.rawText.trim().replaceAll("'", ""));
                 customerModel.setDepartment(txtDepartment.rawText.trim().replaceAll("'", ""));
                 customerModel.setWardNumber(txtWardNumber.rawText.trim().replaceAll("'", ""));
                 customerModel.setRoomNumber(txtRoomNumber.rawText.trim().replaceAll("'", ""));
                 customerModel.setCustType(custType);
                 customerModel.setAllergiesList(allergies);
                 customerModel.setHealthConditionsList(healthconditions);
                 customerModel.setCurrentUser(CommonDeclare.user);
                 var cn: ConfirmDialogBox = new ConfirmDialogBox(0, "Patient Details Info");
                 var a = bind cn.staus;
                 if(a){
                    var isCreate:Boolean=patientDetailsController.updatePatientDetailsRecord(customerModel) as Boolean;
                    if(isCreate){
                       FXalert(4);
                       commonController.updateLog("Patient Details Info", btnEdit.text);
                       clear();
                       txtPatientName.requestFocus();
                     }
                  }
                  allergies.clear();
                  healthconditions.clear();
                  PatientAllergies.selAllergies.clear();
                  HealthConditions.selHealthConditions.clear();
             }
                 
          }catch (e: Exception) {
            var msg: String = "Class : PatientDetailsInfo  Method : Update()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function del(): Void {
       try {
            if (txtPatientName.text != null) {
                var cn: ConfirmDialogBox = new ConfirmDialogBox(1, "Patient Details Info");
                var a = bind cn.staus;
                if (a) {
                    //Controller Call
                    var isCreate:Boolean=patientDetailsController.deletePatientDetailsRecord(txtPatientName.rawText) as Boolean;
                    if(isCreate){
                    commonController.updateLog("Patient Details Info", btnReset.text);
                    FXalert(5);
                    clear();
                    txtPatientName.requestFocus();
                    }
                    allergies.clear();
                    healthconditions.clear();
                    PatientAllergies.selAllergies.clear();
                    HealthConditions.selHealthConditions.clear();
                  }
            } else {
                FXinfo("Please select the Patient Name to be Deleted.");
            }
        } catch (e: Exception) {
            var msg: String = "Class : PatientDetailsInfo  Method : Delete()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function back(): Void {
        imgCancel.image = imageCancel;
        imgEdit.image = imageEdit;
        CancelW = bottonW;
        listViewPatient.visible = false;
        btnSave.disable = false;
        btnSave.text = "Save [F3]";
        btnEdit.disable = false;
        btnEdit.text = "Edit [F6]";
        btnReset.disable = false;
        btnReset.text = "Reset [F4]";
        clear();
        btnCancel.text = "Cancel [F8]";
    }

    public function edit(): Void {
        clear();
        txtPatientName.requestFocus();
        btnCancel.text = "Back [Ctrl+Left]";
        btnSave.text = "Update [F7]";
        btnEdit.text = "Delete [F5]";
        CancelW = bottonW + 50;
        imgEdit.image = imageCancel;
        imgCancel.image = imageBack;
    }

    public function reset(): Void {
        clear();
        listViewPatient.visible = false;
        txtPatientName.requestFocus();
    }

    public function cancel(): Void {
        if (btnCancel.text == "Back [Ctrl+Left]") {
            back();
        } else {
//            Empty();
            delete  panel.content;
            panel.visible = false;
            CommonDeclare.form[5] = 0;
        }
    }

    public function getPatient(con: Integer): Void {
        if(not listViewPatient.visible){
        listViewPatient.visible = false;
        var listControlObj: ListController = new ListController();
        if(btnSave.text=="Save [F3]"){
        listH = listControlObj.listImageControlView(txtPatientName, listViewPatient, "Customer", con);
        }
        else{
        listH = listControlObj.listImageControlView(txtPatientName, listViewPatient, "PatientName", con);
        }
        listW = txtPatientName.width;
        listViewPatient.layoutY = txtPatientName.layoutY + 22;
        if(btnSave.text=="Update [F7]"){
            var selectString = bind listControlObj.selectedString on replace {
            if (selectString.length() > 0) {
                txtRefDoctorName.requestFocus();
                var patInfo:List = commonController.getQueryValue("select p.doctor_name,p.department,p.ward_number,p.room_number from cust_information c,med_patient_details_mt p where p.cust_code=c.cust_code and p.cust_name='{selectString}' or c.mobile_no='{selectString}' and p.is_active=1 and c.cust_flag_id=0",4);
                txtRefDoctorName.text=patInfo.get(0).toString();
                txtDepartment.text=patInfo.get(1).toString();
                txtWardNumber.text=patInfo.get(2).toString();
                txtRoomNumber.text=patInfo.get(3).toString();               
              }
           }
           txtPatientName.requestFocus();
        }if(listControlObj.selectedString!="")
        {
            txtRefDoctorName.requestFocus();
        }
       }
       else{
           listViewPatient.visible = false;
           txtPatientName.requestFocus();
       }
    }

    public function clear(): Void {
        txtPatientName.text = "";
        txtRefDoctorName.text = "";
        txtDepartment.text = "";
        txtWardNumber.text = "";
        txtRoomNumber.text = "";
        cashBillDate = DateUtils.now("dd-MM-yyyy");
        fxCalendar.visible = false;
    }

    public function clickValid(ch: Integer): Integer {
        var patName = txtPatientName.rawText.replaceAll("'","");
        var refDocName = txtRefDoctorName.rawText.replaceAll("'","");
        var dept = txtDepartment.rawText.replaceAll("'", "");
        var wardNo = txtWardNumber.rawText.replaceAll("'", "");
        var roomNo = txtRoomNumber.rawText.replaceAll("'", "");
        var cnt: Integer = 0;
        var val: Validation = new Validation();
        try {
            var dpt: Integer = 0; dpt = val.getAlphaNumericValid(dept, 1, 50);
            var wn: Integer = 0; wn = val.getAlphaNumericValid(wardNo, 1, 100);
            var rn: Integer = 0; rn = val.getAlphaNumericValid(roomNo, 1, 100);
            if(patName.length()<=0){
                FXinfo("Please Enter the Patient Name", txtPatientName); 
            }else if(refDocName.length()<=0){
                FXinfo("Please Enter the Doctor Name", txtRefDoctorName);
            }
            else if (dept.length() <= 0 and rdoInPatient.selected==true) {
                FXinfo("Please Enter the Department Number", txtDepartment);
            } else if (wardNo.length() <= 0 and rdoInPatient.selected==true) {
                FXinfo("Please Enter the Ward Number", txtWardNumber);
            } else if (roomNo.length() <= 0 and rdoInPatient.selected==true) {
                FXinfo("Please Enter the Room Number", txtRoomNumber);
            } else if (dpt == 1 and rdoInPatient.selected==true) {
                FXinfo("Department can be only 50 characters.", txtDepartment);
            } else if (wn == 1 and rdoInPatient.selected==true) {
                FXinfo("Ward Number can be only 50 characters.", txtWardNumber);
            } else if (rn == 1 and rdoInPatient.selected==true) {
                FXinfo("Room Number can be only 50 characters.", txtRoomNumber);
           }
            
            else {
                cnt = 1;
            }

        } catch (e: Exception) {
            var msg: String = "Class : PatientDetailsInfo  Method : ClickValid()   = {e.getMessage()}";
            log.debug(msg);
        }
        return cnt;
    }


      public function StartUp(): Void {
        reset();
        fxCalendar.visible = false;
        txtPatientName.requestFocus();
        panelCalendar.content=[fxCalendar];
    }
}
