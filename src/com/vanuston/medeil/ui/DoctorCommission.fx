package com.vanuston.medeil.ui;

import javafx.ext.swing.SwingComponent;

import javafx.scene.input.KeyCode;
import javafx.scene.image.Image;
import java.text.SimpleDateFormat;
import java.awt.Dimension;
import javafx.scene.control.TextBox;
import java.awt.event.KeyAdapter;
import java.awt.event.MouseAdapter;
import com.vanuston.medeil.implementation.CommonImplements;
import java.sql.Date;
import com.vanuston.medeil.implementation.Doctor;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.uitables.DoctorChargersTable;
import com.vanuston.medeil.util.KeyRegistry;
import com.vanuston.medeil.util.Validation;
import com.vanuston.medeil.model.DoctorChargesModel;
import com.vanuston.medeil.util.Value;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.uitables.ConfirmDialogBox;
import com.vanuston.medeil.uitables.DoctorCommissionTable;
import com.vanuston.medeil.ui.calendar.theme.GrayTheme;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import java.lang.Class;
import java.lang.Exception;



public class DoctorCommission {

    var log: Logger = Logger.getLogger(DoctorCommission.class, "Masters");

    var doctorChargesController : Doctor ;//= RegistryFactory.getClientStub(RegistryConstants.Doctor) as Doctor ;
    var commonController : CommonImplements ;//= RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    var doctorChargersTable : DoctorChargersTable = new DoctorChargersTable () ;

    var sar:Integer=0;
    var sar1:Integer=0;

    var mandatory = CommonDeclare.textbox_mandatory();
    var style = {
    "-fx-border-width:2;"
    "-fx-border-color:#666666;"
    "-fx-background-color: white ;"
    }
    var error = CommonDeclare.textbox_error();
    def CustomAlert = CustomAlert {};
    var botton3LX: Number;
    var botton4LX: Number;
    var btnDocCommEditText="Edit [F6]";
    var btnDocCommSaveText="Save  [F3]";
    var btnDocCommResetText="Reset [F4]";
    var btnDocCommCancelText="Cancel [F8]";
    var txtDocCommNameText="";

var sal_Flag: Boolean = false;
    var sal1_Flag: Boolean = false;
    var fxCalendar = FXCalendar {
                theme: GrayTheme {};
            };
    var rowNo = 12;
    var colNames: Object[] = ["S.No.", "Item Code", "Item Name", "Selling Price", "Quantity", "Amount", "Margin %", "Charged Amount"];
    var colType: Class[] = [java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.Double.class, java.lang.Integer.class, java.lang.Double.class, java.lang.Double.class, java.lang.Double.class];
    var colEditable: Boolean[] = [false, false, false, false, false, false, true, false];
    var colWidth: Integer[] = [45, 80, 155, 80, 70, 110, 80, 110];
    //def DoctorCommissionTable
    def DoctorCommissionTable = DoctorCommissionTable {} ;
    var DoctorCommisionFxTable = DoctorCommissionTable.createTable(rowNo, colNames, colType, colEditable, colWidth);
    var doctorChargersSalTable = SwingComponent.wrap(DoctorCommissionTable.getScrollTable(DoctorCommisionFxTable));
    var rowNo1 = 12;
    var colNames1: Object[] = ["CH_ID", "Date", "Doctor Code", "Doctor Name", "Start Date", "End Date", "Amount"];
    var colType1: Class[] = [java.lang.String.class, java.lang.String.class, java.lang.String.class,
                java.lang.String.class, java.lang.String.class, java.lang.String.class,
                java.lang.String.class];
    var colEditable1: Boolean[] = [false, false, false, false, false, false, false];
    var colWidth1: Integer[] = [90, 90, 90, 160, 80, 80, 110];
    var doctorChargersFxTable = doctorChargersTable.createTable(rowNo1, colNames1, colType1, colEditable1, colWidth1);
    var doctorCharTab = SwingComponent.wrap(doctorChargersTable.getScrollTable(doctorChargersFxTable));
    var charDoctorId: String = "";

    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def panelTable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelTableLX
        layoutY: bind panelTableLY
        blocksMouse: true
    }
    
    public-read def panelViewTable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelTableLX
        layoutY: bind panelTableLY
        blocksMouse: true
    }
    
    public-read def rectTableBorder: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind panelTableLX
        layoutY: bind panelTableLY
        styleClass: "rectTableBorder"
        width: bind TableW
        height: bind TableH
    }
    
    def __layoutInfo_txtDocCommDName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtDocCommDName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind SearchTextboxLX
        layoutY: 110.0
        layoutInfo: __layoutInfo_txtDocCommDName
        onKeyPressed: txtDocCommDNameOnKeyPressedAtViewAll
        onKeyReleased: txtDocCommDNameOnKeyReleasedAtViewAll
    }
    
    def __layoutInfo_txtHiddenId: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtHiddenId: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 84.0
        layoutY: 32.0
        layoutInfo: __layoutInfo_txtHiddenId
    }
    
    def __layoutInfo_txtCommissionAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind AmountTextboxW
        height: 70.0
    }
    public-read def txtCommissionAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 80.0
        layoutInfo: __layoutInfo_txtCommissionAmt
        styleClass: "Borderless-text-box"
        text: bind ChargesAmount
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: true
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_listDocComm: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listDocComm: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: 150.0
        layoutY: 448.0
        layoutInfo: __layoutInfo_listDocComm
        items: null
    }
    
    public-read def imgStartDate: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind Type3TextboxW+C4LX
        layoutY: 88.0
        blocksMouse: true
    }
    
    public-read def imgEndDate: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind Type3TextboxW+C4LX
        layoutY: 110.0
        blocksMouse: true
    }
    
    public-read def imageView5: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
    }
    
    def __layoutInfo_searchButton: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def searchButton: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind buttonSearchLX
        layoutY: 110.0
        layoutInfo: __layoutInfo_searchButton
        graphic: imageView5
        text: "Button"
    }
    
    public-read def sDatePanel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind C4LX
        layoutY: 104.0
        blocksMouse: true
    }
    
    public-read def eDatePanel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind C4LX
        layoutY: 126.0
    }
    
    def __layoutInfo_txtChargeCode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtChargeCode: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 160.0
        layoutY: 45.0
        layoutInfo: __layoutInfo_txtChargeCode
    }
    
    def __layoutInfo_listDoctorName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listDoctorName: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind listLX
        layoutY: bind listLY
        layoutInfo: __layoutInfo_listDoctorName
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    def __layoutInfo_listSearch: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listSearch: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind listLX
        layoutY: bind listLY
        layoutInfo: __layoutInfo_listSearch
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    public-read def rectViewAll: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        width: 100.0
        height: 50.0
    }
    
    def __layoutInfo_label4: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: true
        layoutX: 0.0
        layoutInfo: __layoutInfo_label4
        styleClass: "rectbutton"
        text: "Label"
    }
    
    public-read def groupViewAll: javafx.scene.Group = javafx.scene.Group {
        visible: false
        layoutX: bind rectViewAllLX
        layoutY: bind rectbuttonLY
        content: [ rectViewAll, label4, ]
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
    
    def __layoutInfo_txtDocCommName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
        hfill: false
    }
    public-read def txtDocCommName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 110.0
        layoutInfo: __layoutInfo_txtDocCommName
        style: ""
        styleClass: "text-box"
        effect: null
        font: Arial_12
    }
    
    def __layoutInfo_txtDocCommEDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtDocCommEDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 110.0
        layoutInfo: __layoutInfo_txtDocCommEDate
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtDocCommSDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtDocCommSDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: true
        layoutX: bind C4LX
        layoutY: 88.0
        layoutInfo: __layoutInfo_txtDocCommSDate
        onKeyReleased: txtDocCommSDateOnKeyReleasedAtShown
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtDocCommCode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtDocCommCode: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 88.0
        layoutInfo: __layoutInfo_txtDocCommCode
        text: ""
        promptText: "Doctor Code..."
        selectOnFocus: false
        editable: true
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
    
    def __layoutInfo_btnDocCommSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnDocCommSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnDocCommSave
        translateX: 0.0
        effect: reflectionEffect
        graphic: imageView
        text: bind btnDocCommSaveText
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
    
    public-read def label14: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 88.0
        text: "Doctor Code "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 88.0
        text: "Start Date "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 484.0
        layoutY: 468.0
        font: Arial_16
        textFill: DarkGray
    }
    
    public-read def panelAmt: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind AmtPanelLX
        content: [ label7, txtCommissionAmt, ]
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 110.0
        text: "End Date "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 110.0
        styleClass: "label"
        text: "Doctor Name "
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
        text: "Doctor Commission"
        font: Arial_25
        hpos: javafx.geometry.HPos.CENTER
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
    }
    
    public-read def Sandal: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.8
        blue: 0.2
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
    
    public-read def Arial_Bold_62: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 65.0
        oblique: false
        embolden: false
    }
    
    public-read def imageSave: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Save1.png"
    }
    
    public-read def imageEdit: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Edit.png"
    }
    
    public-read def imageView2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageEdit
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnDocCommEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnDocCommEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton2LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnDocCommEdit
        effect: reflectionEffect
        graphic: imageView2
        text: bind btnDocCommEditText
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    public-read def imageReset: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Reset.png"
    }
    
    public-read def imageView3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageReset
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnDocCommReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnDocCommReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton3LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_btnDocCommReset
        effect: reflectionEffect
        graphic: imageView3
        text: bind btnDocCommResetText
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    public-read def imageCancel: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Cancel.png"
    }
    
    public-read def imageView4: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageCancel
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnDocCommCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW+30
        height: bind bottonH
    }
    public-read def btnDocCommCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton4LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnDocCommCancel
        effect: reflectionEffect
        graphic: imageView4
        text: bind btnDocCommCancelText
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    public-read def panelButtons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: bind panelButtonsLY
        content: [ btnDocCommSave, btnDocCommEdit, btnDocCommReset, btnDocCommCancel, ]
    }
    
    public-read def imageCalendar: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Calender.png"
    }
    
    public-read def imageSearch: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Search.png"
    }
    
    public-read def imageBack: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/arrow_Left.png"
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imageView6: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind Type1TextboxW+C2LX
        layoutY: 53.0
        image: image
    }
    
    public-read def image2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imageView7: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind SearchTextboxLX+Type1TextboxW
        layoutY: 76.0
        blocksMouse: true
        image: image2
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        content: [ rectangle, rectHeader, label, panelTable, txtDocCommCode, label2, panelViewTable, rectTableBorder, txtDocCommDName, txtHiddenId, label3, panelAmt, label9, panelButtons, label14, txtDocCommSDate, txtDocCommEDate, txtDocCommName, listDocComm, imgStartDate, imgEndDate, searchButton, sDatePanel, eDatePanel, imageView7, txtChargeCode, listDoctorName, listSearch, groupViewAll, panelAlert, imageView6, ]
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "Shown", "ViewAll", ]
        actual: 0
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectangle.visible = true;
                            rectHeader.visible = true;
                            rectHeader.opacity = 0.25;
                            rectHeader.layoutX = 0.0;
                            label.layoutX = 0.0;
                            label.layoutY = 1.0;
                            label.text = "Doctor Charges";
                            label.hpos = javafx.geometry.HPos.CENTER;
                            panelTable.visible = true;
                            txtDocCommCode.visible = true;
                            txtDocCommCode.layoutY = 110.0;
                            txtDocCommCode.onKeyPressed = txtDocCommCodeOnKeyPressedAtShown;
                            txtDocCommCode.onKeyReleased = txtDocCommCodeOnKeyReleasedAtShown;
                            txtDocCommCode.promptText = "";
                            txtDocCommCode.editable = false;
                            label2.visible = true;
                            label2.onKeyReleased = label2OnKeyReleasedAtShown;
                            label2.text = "Doctor Code";
                            panelViewTable.visible = true;
                            rectTableBorder.visible = true;
                            txtDocCommDName.visible = false;
                            txtHiddenId.visible = false;
                            __layoutInfo_txtHiddenId.width = 110.0;
                            txtHiddenId.onKeyReleased = txtHiddenIdOnKeyReleasedAtShown;
                            label3.visible = true;
                            label7.visible = true;
                            label7.layoutX = 0.0;
                            label7.layoutY = 28.0;
                            label7.text = "Amount";
                            label7.font = Arial_18;
                            txtCommissionAmt.visible = true;
                            txtCommissionAmt.promptText = "0.00";
                            txtCommissionAmt.selectOnFocus = false;
                            txtCommissionAmt.editable = false;
                            txtCommissionAmt.font = Arial_Bold_62;
                            panelAmt.visible = true;
                            panelAmt.layoutY = 400.0;
                            label9.visible = true;
                            label9.layoutY = 82.0;
                            imageView.visible = true;
                            imageView.image = imageSave;
                            btnDocCommSave.visible = true;
                            btnDocCommSave.layoutY = 0.0;
                            btnDocCommSave.onKeyPressed = btnDocCommSaveOnKeyPressedAtShown;
                            btnDocCommSave.onMouseClicked = btnDocCommSaveOnMouseClickedAtShown;
                            btnDocCommEdit.visible = true;
                            btnDocCommEdit.layoutY = 0.0;
                            btnDocCommEdit.onKeyPressed = btnDocCommEditOnKeyPressedAtShown;
                            btnDocCommEdit.onMouseClicked = btnDocCommEditOnMouseClickedAtShown;
                            btnDocCommReset.onKeyPressed = btnDocCommResetOnKeyPressedAtShown;
                            btnDocCommReset.onMouseClicked = btnDocCommResetOnMouseClickedAtShown;
                            imageView4.image = imageCancel;
                            btnDocCommCancel.layoutY = 0.0;
                            btnDocCommCancel.onKeyPressed = btnDocCommCancelOnKeyPressedAtShown;
                            btnDocCommCancel.onMouseClicked = btnDocCommCancelOnMouseClickedAtShown;
                            panelButtons.visible = true;
                            label14.visible = true;
                            label14.text = "Doctor Name";
                            txtDocCommSDate.visible = true;
                            txtDocCommSDate.layoutY = 82.0;
                            txtDocCommSDate.onKeyPressed = txtDocCommSDateOnKeyPressedAtShown;
                            txtDocCommSDate.promptText = "dd-mm-yyyy";
                            txtDocCommEDate.visible = true;
                            txtDocCommEDate.onKeyPressed = txtDocCommEDateOnKeyPressedAtShown;
                            txtDocCommEDate.promptText = "dd-mm-yyyy";
                            txtDocCommName.visible = true;
                            txtDocCommName.layoutY = 82.0;
                            txtDocCommName.onKeyPressed = txtDocCommNameOnKeyPressedAtShown;
                            txtDocCommName.onKeyReleased = txtDocCommNameOnKeyReleasedAtShown;
                            listDocComm.layoutY = 200.0;
                            imgStartDate.visible = true;
                            imgStartDate.layoutY = 82.0;
                            imgStartDate.onKeyPressed = imgStartDateOnKeyPressedAtShown;
                            imgStartDate.onMouseClicked = imgStartDateOnMouseClickedAtShown;
                            imgStartDate.image = imageCalendar;
                            imgEndDate.visible = true;
                            imgEndDate.onKeyPressed = imgEndDateOnKeyPressedAtShown;
                            imgEndDate.onMouseClicked = imgEndDateOnMouseClickedAtShown;
                            imgEndDate.image = imageCalendar;
                            imageView5.visible = false;
                            imageView5.image = null;
                            searchButton.visible = false;
                            searchButton.layoutY = 110.0;
                            searchButton.styleClass = "button";
                            searchButton.text = "Button";
                            sDatePanel.visible = true;
                            eDatePanel.visible = true;
                            eDatePanel.blocksMouse = true;
                            imageView7.visible = false;
                            imageView7.layoutY = 76.0;
                            imageView7.blocksMouse = true;
                            txtChargeCode.visible = false;
                            __layoutInfo_txtChargeCode.width = 128.0;
                            txtChargeCode.editable = false;
                            listDoctorName.visible = false;
                            listDoctorName.onKeyPressed = listDoctorNameOnKeyPressedAtShown;
                            listSearch.visible = false;
                            rectViewAll.styleClass = "rectbutton";
                            rectViewAll.onMouseClicked = rectViewAllOnMouseClickedAtShown;
                            rectViewAll.fill = Sandal;
                            rectViewAll.stroke = DarkGray;
                            rectViewAll.strokeWidth = 2.0;
                            rectViewAll.width = 100.0;
                            rectViewAll.height = 20.0;
                            rectViewAll.arcWidth = 10.0;
                            rectViewAll.arcHeight = 10.0;
                            __layoutInfo_label4.width = 100.0;
                            __layoutInfo_label4.height = 20.0;
                            label4.text = "View All";
                            label4.font = Arial_Bold_12;
                            label4.hpos = javafx.geometry.HPos.CENTER;
                            label4.textFill = javafx.scene.paint.Color.BLACK;
                            groupViewAll.visible = true;
                            panelAlert.visible = true;
                            imageView6.visible = true;
                            imageView6.layoutY = 82.0;
                            imageView6.onMouseClicked = imageView6OnMouseClickedAtShown;
                            imageView6.blocksMouse = true;
                            panel.visible = true;
                            panel.blocksMouse = true;
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
                            rectHeader.visible = true;
                            rectHeader.opacity = 0.25;
                            rectHeader.layoutX = 0.0;
                            label.layoutX = 0.0;
                            label.layoutY = 1.0;
                            label.text = "Doctor Charges";
                            label.hpos = javafx.geometry.HPos.CENTER;
                            panelTable.visible = false;
                            txtDocCommCode.visible = false;
                            txtDocCommCode.layoutY = 88.0;
                            txtDocCommCode.promptText = "Doctor Code...";
                            txtDocCommCode.editable = true;
                            label2.visible = true;
                            label2.text = "Doctor Name ";
                            panelViewTable.visible = true;
                            rectTableBorder.visible = true;
                            txtDocCommDName.visible = true;
                            txtHiddenId.visible = false;
                            label3.visible = false;
                            label7.visible = false;
                            label7.layoutX = 484.0;
                            label7.layoutY = 468.0;
                            label7.text = null;
                            label7.font = Arial_16;
                            txtCommissionAmt.visible = false;
                            txtCommissionAmt.promptText = null;
                            txtCommissionAmt.selectOnFocus = true;
                            txtCommissionAmt.editable = true;
                            panelAmt.visible = false;
                            panelAmt.layoutY = 0.0;
                            label9.visible = false;
                            label9.layoutY = 88.0;
                            imageView.visible = true;
                            imageView.image = null;
                            btnDocCommSave.visible = false;
                            btnDocCommSave.layoutY = 525.0;
                            btnDocCommEdit.visible = false;
                            btnDocCommEdit.layoutY = 525.0;
                            btnDocCommEdit.onKeyPressed = btnDocCommEditOnKeyPressedAtViewAll;
                            btnDocCommReset.onKeyReleased = btnDocCommResetOnKeyReleasedAtViewAll;
                            imageView4.image = imageBack;
                            btnDocCommCancel.layoutY = 0.0;
                            btnDocCommCancel.onKeyReleased = btnDocCommCancelOnKeyReleasedAtViewAll;
                            btnDocCommCancel.onMouseClicked = btnDocCommCancelOnMouseClickedAtViewAll;
                            panelButtons.visible = true;
                            label14.visible = false;
                            label14.text = "Doctor Code ";
                            txtDocCommSDate.visible = false;
                            txtDocCommSDate.layoutY = 88.0;
                            txtDocCommSDate.promptText = null;
                            txtDocCommEDate.visible = false;
                            txtDocCommEDate.promptText = null;
                            txtDocCommName.visible = false;
                            txtDocCommName.layoutY = 110.0;
                            listDocComm.layoutY = 448.0;
                            imgStartDate.visible = false;
                            imgStartDate.layoutY = 88.0;
                            imgStartDate.image = null;
                            imgEndDate.visible = false;
                            imgEndDate.image = null;
                            imageView5.visible = true;
                            imageView5.image = imageSearch;
                            searchButton.visible = true;
                            searchButton.layoutY = 110.0;
                            __layoutInfo_searchButton.width = 100.0;
                            __layoutInfo_searchButton.height = 25.0;
                            searchButton.styleClass = "button";
                            searchButton.onKeyPressed = searchButtonOnKeyPressedAtViewAll;
                            searchButton.onMouseClicked = searchButtonOnMouseClickedAtViewAll;
                            searchButton.text = "Search";
                            searchButton.font = Arial_Bold_14;
                            sDatePanel.visible = false;
                            eDatePanel.visible = false;
                            eDatePanel.blocksMouse = false;
                            imageView7.visible = true;
                            imageView7.layoutY = 110.0;
                            imageView7.onMouseClicked = imageView7OnMouseClickedAtViewAll;
                            imageView7.blocksMouse = true;
                            txtChargeCode.visible = false;
                            txtChargeCode.editable = true;
                            listDoctorName.visible = false;
                            listSearch.visible = false;
                            listSearch.onKeyPressed = listSearchOnKeyPressedAtViewAll;
                            rectViewAll.styleClass = "";
                            rectViewAll.fill = javafx.scene.paint.Color.BLACK;
                            rectViewAll.stroke = null;
                            rectViewAll.strokeWidth = 1.0;
                            rectViewAll.width = 100.0;
                            rectViewAll.height = 50.0;
                            rectViewAll.arcWidth = 0.0;
                            rectViewAll.arcHeight = 0.0;
                            label4.text = "Label";
                            label4.hpos = javafx.geometry.HPos.LEFT;
                            label4.textFill = javafx.scene.paint.Color.BLACK;
                            groupViewAll.visible = false;
                            panelAlert.visible = true;
                            imageView6.visible = false;
                            imageView6.layoutY = 53.0;
                            imageView6.blocksMouse = false;
                            panel.visible = true;
                            panel.blocksMouse = false;
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



var ChargesAmount:String="0.00";
    function txtDocCommSDateOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function txtHiddenIdOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {      
        shortcut(event);
    }

    function txtDocCommCodeOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {       
        shortcut(event);
    }

    function label2OnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {        
        shortcut(event);
    }

    function btnDocCommCancelOnKeyReleasedAtViewAll(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER ) {
            back () ;
        } else { 
            txtDocCommDName.requestFocus();  
        }
        shortcut(event);
    }
    function btnDocCommCancelOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
                panel.visible = false;
        } else {
            txtDocCommName.requestFocus();
        }
        shortcut(event);
    }
    function btnDocCommCancelOnMouseClickedAtViewAll(event: javafx.scene.input.MouseEvent): Void {
        back () ;
    }

    function imageView7OnMouseClickedAtViewAll(event: javafx.scene.input.MouseEvent): Void {
        getDoctorSearchDetails (0) ;

    }

    function imageView6OnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        getDoctorDetails(0);
    }

    var listLX = 0.0;
    var listLY = 0.0;
    var listW = 0.0;

    var panelW = bind CommonDeclare.panelFormW on replace {
        botton3LX = CommonDeclare.botton3LX;
        botton4LX = CommonDeclare.botton4LX;
        changeTableSize(TableW,TableH);
    }

    var panelH = bind CommonDeclare.panelFormH;
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var C1LX = bind CommonDeclare.Column1LX;
    var C2LX = bind CommonDeclare.Column2LX;
    var C3LX = bind CommonDeclare.Column3LX;
    var C4LX = bind CommonDeclare.Column4LX;
    var botton1LX = bind CommonDeclare.botton1LX;
    var botton2LX = bind CommonDeclare.botton2LX;
    var temp = bind currentState.actual on replace {
        if (currentState.actual == 0) {
            botton3LX = CommonDeclare.botton3LX;
            botton4LX = CommonDeclare.botton4LX;
        } else if (currentState.actual == 1) {
            botton3LX = CommonDeclare.botton2LX;
            botton4LX = CommonDeclare.botton3LX;
        }

    }
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;

    var botton21LX = bind CommonDeclare.botton41LX;
    var botton22LX = bind CommonDeclare.botton42LX;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    var bottonW = bind CommonDeclare.bottonW;
    var bottonH = bind CommonDeclare.bottonH;
    var seperatorW = bind CommonDeclare.seperatorW;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;
    var Type4TextboxW = bind CommonDeclare.Type4TextboxW;
    var Type5TextboxW = bind (3.811944091 * panelW / 100);
    var AmountTextboxW = bind CommonDeclare.AmountTextboxW;
    var DetailsTextLW = bind (84.87928844 * panelW / 100) - C1LX;
    var ImageCalenderLX = bind C2LX + Type3TextboxW + 2;
    var panelCalenderLX = bind C2LX + Type3TextboxW + 22;
    var labelSearchLX = bind C1LX;
    var SearchTextboxLX = bind (labelSearchLX + 100);
    var buttonSearchLX = bind (SearchTextboxLX + Type1TextboxW + 25);
    var rectbutton2LX = bind CommonDeclare.rectbutton2LX;
    var rectbuttonLY = bind CommonDeclare.rectbuttonLY;
    var panelTableLY = bind (25.88990826 * panelH / 100);
    var panelTableLX = bind (panelW - TableW) / 2;
    var AmtPanelLX = bind 48.28462516 * panelW / 100;
     var TableH=248.0;
    var TableW = bind (95.29860229 * panelW) / 100 on replace {
        changeTableSize(TableW,TableH);
    };
   
    var rectViewAllLX = bind ((panelW + TableW) / 2) - 100;
    var listH = 0.0;

    function changeTableSize(i: Integer,j: Integer): Void {
        doctorChargersSalTable.getJComponent().setPreferredSize(new Dimension(i, j));
        doctorCharTab.getJComponent().setPreferredSize(new Dimension(i, j));
    }

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Doctor Charges", type);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Doctor Charges", msg);
        showAlertbox();
    }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Doctor Charges", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = error;
    }   

    function rectangleOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        listDocComm.visible = false;
        listDoctorName.visible = false;
        listSearch.visible = false;
        sDatePanel.visible = false;
        eDatePanel.visible = false;
    }

   function btnDocCommEditOnKeyPressedAtViewAll(event: javafx.scene.input.KeyEvent): Void {
       shortcut(event);
    }
    function btnDocCommEditOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            editClick();
        } else if (event.code == KeyCode.VK_TAB){
            btnDocCommReset.requestFocus();
        } else {
            shortcut(event);
        }
    }
    function txtDocCommCodeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {

        shortcut(event);
    }

    def kr = KeyRegistry {};
    var ss = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 4 and CommonDeclare.form[3] == 31) {
            shortcut(ss);
        }
    }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {
        
         if (event.controlDown or event.altDown or event.shiftDown) {
            kr.actionKey = event.code;
        }
        if (event.code == kr.save) {
            saveclick();
        }
        if (event.code == kr.edit) {
            editClick();
        }
        if (event.code == kr.reset and currentState.actual ==  currentState.findIndex("Shown")) {
            clearAll();
        }
        if (event.code == kr.update) {
            saveclick();
        }

        if (event.code == kr.del) {
            if (btnDocCommEditText == "Delete [F5]") { deleteClick(); }
        }
        if (event.controlDown == true and event.code == kr.back) {
            if (btnDocCommCancelText == "Back [Ctrl+Left]") { back(); }
        }
        if (event.code == kr.cancel) {
            if (btnDocCommCancelText == "Cancel [F8]") { panel.visible = false; }
        }
    }

    function deleteClick(): Void {
        try {
            var sdf = new SimpleDateFormat("dd-MM-yyyy");
            var txtDocCommSDate1: String = ""; txtDocCommSDate1 = txtDocCommSDate.text;
            txtDocCommSDate1 = txtDocCommSDate1.trim();
            if (txtDocCommSDate1 != null and txtDocCommSDate1.trim().length() == 10) {
                txtDocCommSDate1 = DateUtils.changeFormatDate(sdf.parse(txtDocCommSDate.text));
            }
            var txtDocCommEDate1: String = ""; txtDocCommEDate1 = txtDocCommEDate.text;
            txtDocCommEDate1 = txtDocCommEDate1.trim();
            if (txtDocCommEDate1 != null and txtDocCommEDate1.trim().length() == 10) {
                txtDocCommEDate1 = DateUtils.changeFormatDate(sdf.parse(txtDocCommEDate.text));
            }
            var txtDocCommName1 = txtDocCommNameText;
            var txtDocCommCode1 = txtDocCommCode.text;
            var val: Validation = null;
            val = new Validation();
            if (txtDocCommName1 == null or txtDocCommName1.trim().length() == 0) {
                FXinfo("Please enter Doctor Name      ", txtDocCommName);
            } else if (txtDocCommCode1 == null or txtDocCommCode1.trim().length() == 0) {
                FXinfo("Please enter Doctor Name      ", txtDocCommCode);
            } else if (txtDocCommSDate1 == null or txtDocCommSDate1.trim().length() < 10) {
                FXinfo("Please enter valid start date    ", txtDocCommSDate);
            } else if (txtDocCommEDate1 == null or txtDocCommEDate1.trim().length() < 10) {
                FXinfo("Please enter valid end date      ", txtDocCommName);
            } else {
                var cn : ConfirmDialogBox = new ConfirmDialogBox(1,"Doctor Charges");
                var a =bind cn.staus;
                if (a) {
                    //DoctorChargesController Call
                    doctorChargesController = RegistryFactory.getClientStub(RegistryConstants.Doctor) as Doctor ;
                    if (doctorChargesController.deleteDoctorCharges(charDoctorId)) {
                        FXinfo("DoctorCommision Record of {charDoctorId} is deleted.") ;
                    }
                    //CommonController Call
                    commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
                    commonController.updateLog("DoctorChargers", "delete");
                    clearAll();
                      FXalert(5);
                }
            }
        } catch (e: Exception) {
            var msg: String = "Class : Doctor commisioon  method : deleteClick()  = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function searchButtonOnKeyPressedAtViewAll(event: javafx.scene.input.KeyEvent): Void {
        listSearch.visible = false;
        if (event.code == KeyCode.VK_ENTER) {
            searchclick(); 
        }
        shortcut(event);
    }

    function searchclick(): Void {
        var docName: String = "";
        docName = txtDocCommDName.text;        
        if (doctorChargersTable.loadDoctorChargers(docName) <= 0) {
            FXinfo("No Records Found.");
        }

    }

    function searchButtonOnMouseClickedAtViewAll(event: javafx.scene.input.MouseEvent): Void {
        listSearch.visible = false;
        searchclick();
    }

    function txtDocCommDNameOnKeyReleasedAtViewAll(event: javafx.scene.input.KeyEvent): Void {
         getDoctorSearchDetails (1) ;

        if (event.code == KeyCode.VK_DOWN or listSearch.items != null) {
            listSearch.requestFocus () ;
            listSearch.selectFirstRow () ;
        }
        if (event.code == KeyCode.VK_ESCAPE) {
            listSearch.visible = false;
            txtDocCommDName.requestFocus();
        }
        shortcut(event);
    }

    function txtDocCommDNameOnKeyPressedAtViewAll(event: javafx.scene.input.KeyEvent): Void {
        txtDocCommDName.style = mandatory;
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
             if(sar1==0 or txtDocCommDName.text.trim()==null or txtDocCommDName.text.trim().trim().length()==0 or txtDocCommDName.text.trim()=="null"){
              txtDocCommDName.text= "";
             }
            listSearch.visible = false;
            searchButton.requestFocus();
        }
         shortcut(event);
    }

    function listSearchOnKeyPressedAtViewAll(event: javafx.scene.input.KeyEvent): Void {
        if (listSearch.focused) {
            if (event.code == KeyCode.VK_DOWN)
                listSearch.selectFirstRow();
        }
    }

    function btnDocCommEditOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        editClick();
    }
    function btnDocCommCancelOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        panel.visible = false ;
    }

    function editClick(): Void {
        if (btnDocCommEditText == "Edit [F6]") {
            charDoctorId = "";
            if (doctorChargersTable.loadDoctorChargers() <= 0) {
                FXinfo("No Records found.");
            }
            currentState.actual = currentState.findIndex("ViewAll");
            doctorCharTab.visible = true;
            txtDocCommDName.text = "" ;
            doctorChargersSalTable.visible = false;
             btnDocCommCancelText="Back [Ctrl+Left]";
        } else {
            deleteClick();
        }
    }   

    function btnDocCommResetOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        clearAll();        
    }
    function btnDocCommResetOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            clearAll();
        } else if (event.code == KeyCode.VK_TAB) {
            btnDocCommCancel.requestFocus();
        } else {
            shortcut(event);
        }
    }

    function btnDocCommResetOnKeyReleasedAtViewAll(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            clearAll();
        } else {
            shortcut(event);
        }
    }


    function btnDocCommSaveOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        
        if (event.code == KeyCode.VK_ENTER) {
            saveclick();
        } else if (event.code == KeyCode.VK_TAB) {
            btnDocCommEdit.requestFocus();
        } else {
            shortcut(event);
        }

    }

    function getDoctorCommisonNo(): String {
        var code: String = "";
        var finalCode: String="";
        try {
            //Controller Instance
            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
            finalCode= commonController.getDocCommisionNo("doctor_charges","DCH");
        } catch (e: Exception) {
            var msg: String = "Class : Doctor commisioon  method : getDoctorCommisionNo()  = {e.getMessage()}";
            log.debug(msg);
       }
        return finalCode;
    }

    function clearAll(): Void {
        if(btnDocCommCancelText=="Cancel [F8]") {
            txtHiddenId.style = style;
            txtDocCommSDate.style = mandatory;
            txtDocCommEDate.style = mandatory ;
            txtDocCommName.style = mandatory;
            txtHiddenId.text = "";
            txtDocCommSDate.text = "";
            txtDocCommEDate.text = "";
            txtDocCommNameText = "";
            txtDocCommName.text = "";
            txtDocCommCode.text = "";
            charDoctorId = "";
            DoctorCommissionTable.clearAllValues();
            doctorChargersTable.loadDoctorChargersALL() ;
            txtDocCommName.requestFocus() ;
            DoctorCommissionTable.salesId = "" ;
            DoctorCommissionTable.finalChargeamount = 0.0 ;
            ChargesAmount= "0.00" ;
            btnDocCommEditText="Edit [F6]" ;
            btnDocCommSaveText="Save  [F3]" ;
            btnDocCommResetText="Reset [F4]" ;
            btnDocCommCancelText="Cancel [F8]" ;
        } else {
            listDocComm.visible = false ;
            listDoctorName.visible = false ;
            txtDocCommDName.text="";
            txtDocCommDName.style = mandatory ;
            txtDocCommDName.requestFocus();
        }

    }

    function saveclick(): Void {
        var rowCnt = DoctorCommissionTable.totalRow();
        var txtDcotorChargeNo = getDoctorCommisonNo();
        var sdf: SimpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
        var txtDocCommSDate1: String = ""; txtDocCommSDate1 = txtDocCommSDate.text;
        txtDocCommSDate1 = txtDocCommSDate1.trim();
        if (txtDocCommSDate1 != null and txtDocCommSDate1.trim().length() == 10) {
            txtDocCommSDate1 = DateUtils.changeFormatDate(sdf.parse(txtDocCommSDate.text));
        }
        var txtDocCommEDate1: String = ""; txtDocCommEDate1 = txtDocCommEDate.text;
        txtDocCommEDate1 = txtDocCommEDate1.trim();
        if (txtDocCommEDate1 != null and txtDocCommEDate1.trim().length() == 10) {
            txtDocCommEDate1 = DateUtils.changeFormatDate(sdf.parse(txtDocCommEDate.text));
        }
        var txtDocCommName1 = txtDocCommNameText;
        var txtDocCommCode1 = txtDocCommCode.text;
        var txtDocCommTotAmt1 = ChargesAmount ;
        try {
            var val: Validation = null;
            val = new Validation();
            if (txtDocCommName1 == null or txtDocCommName1.trim().length() == 0) {
                FXinfo("Please enter doctor name ", txtDocCommName);
            } else if (txtDocCommCode1 == null or txtDocCommCode1.trim().length() == 0) {
                FXinfo("Please enter doctor name ", txtDocCommCode);
            } else if (txtDocCommSDate1 == null or txtDocCommSDate1.trim().length() < 10) {
                FXinfo("Please enter Start date  ", txtDocCommSDate);
            } else if (txtDocCommEDate1 == null or txtDocCommEDate1.trim().length() < 10) {
                FXinfo("Please enter end date      ", txtDocCommName);
            } else if (rowCnt == 0) {
                FXinfo("Please enter a value for commission ");
                DoctorCommissionTable.focusSet();
            } else {                
                if (btnDocCommSaveText == "Update [F7]") {                    
                    var cn : ConfirmDialogBox = new ConfirmDialogBox(0,"Doctor Charges");
                    var a =bind cn.staus;
                    if (a) {
                        //DoctorChargesController Call
                        doctorChargesController = RegistryFactory.getClientStub(RegistryConstants.Doctor) as Doctor ;
                        doctorChargesController.deleteCharge(charDoctorId);
                        txtDcotorChargeNo = txtHiddenId.text;
                        var tableContents = DoctorCommissionTable.getTableContenets();
                        for (i in [0..<rowCnt]) {
                            var itemCode = tableContents[i][1];
                            var itemName = tableContents[i][2];
                            var sellingPrice = tableContents[i][3];
                            var qty = tableContents[i][4];
                            var amt = tableContents[i][5];
                            var margin = tableContents[i][6];
                            if (margin.length() == 0 ) {
                                FXinfo("Please enter Margin % ");
                            }
                            var chargeAmt = tableContents[i][7];
                            if (txtDocCommTotAmt1 != null and txtDocCommTotAmt1.trim().length() > 0) {
                                var doctorChargesModel : DoctorChargesModel=new DoctorChargesModel();
                                doctorChargesModel.setDoctorcommisionCode(txtDocCommCode1);
                                doctorChargesModel.setDoctorCommisionName(txtDocCommName1);
                                doctorChargesModel.setCommisionStartDate(Date.valueOf(DateUtils.changeFormatDate(txtDocCommSDate.text)));
                                doctorChargesModel.setCommisionEndDate(Date.valueOf(DateUtils.changeFormatDate(txtDocCommEDate.text)));
                                doctorChargesModel.setItemCode(itemCode);
                                doctorChargesModel.setItemName(itemName);                                                
                                doctorChargesModel.setQuantity(Integer.parseInt(qty));
                                doctorChargesModel.setSellingPrice(Double.parseDouble(sellingPrice));
                                doctorChargesModel.setAmount(Double.parseDouble(amt));
                                doctorChargesModel.setDoctorMargin(Double.parseDouble(margin));
                                doctorChargesModel.setChargeAmount(Double.parseDouble(chargeAmt));
                                doctorChargesModel.setTotalAmount(Double.parseDouble(txtDocCommTotAmt1));
                                doctorChargesModel.setChargeId(txtDcotorChargeNo);
                                //DoctorChargesController Call
                                doctorChargesController.updateDoctorCharges(doctorChargesModel);
                                //CommonController Call
                                commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
                                commonController.updateLog("DoctorChargers", "update");
                            }
                        }
                         FXalert(4);
                        clearAll();
                    }
                } else {
                    var tableContents = DoctorCommissionTable.getTableContenets();
                    for (i in [0..<rowCnt]) {
                        var itemCode = tableContents[i][1];
                        var itemName = tableContents[i][2];
                        var sellingPrice = tableContents[i][3];
                        var qty = tableContents[i][4];
                        var amt = tableContents[i][5];
                        var margin = tableContents[i][6];
                        var chargeAmt = tableContents[i][7];
                        if (txtDocCommTotAmt1 != null and txtDocCommTotAmt1.trim().length() > 0) {
                            var doctorChargesModel : DoctorChargesModel=new DoctorChargesModel();
                            doctorChargesModel.setDoctorcommisionCode(txtDocCommCode1);
                            doctorChargesModel.setDoctorCommisionName(txtDocCommName1);
                            doctorChargesModel.setCommisionStartDate(Date.valueOf(DateUtils.changeFormatDate(txtDocCommSDate.text)));
                            doctorChargesModel.setCommisionEndDate(Date.valueOf(DateUtils.changeFormatDate(txtDocCommEDate.text)));                            
                            doctorChargesModel.setItemCode(itemCode);
                            doctorChargesModel.setItemName(itemName);
                            doctorChargesModel.setQuantity(Integer.parseInt(qty));
                            doctorChargesModel.setSellingPrice(Double.parseDouble(sellingPrice));
                            doctorChargesModel.setAmount(Double.parseDouble(amt));
                            doctorChargesModel.setDoctorMargin(Double.parseDouble(margin));
                            doctorChargesModel.setChargeAmount(Double.parseDouble(chargeAmt));
                            doctorChargesModel.setTotalAmount(Double.parseDouble(txtDocCommTotAmt1));
                            doctorChargesModel.setChargeId(txtDcotorChargeNo);
                            //DoctorChargesController Call
                            doctorChargesController = RegistryFactory.getClientStub(RegistryConstants.Doctor) as Doctor ;
                            doctorChargesController.createDoctorCharges(doctorChargesModel);
                            //CommonController Call
                            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
                            commonController.updateLog("DoctorChargers", "save");
                             
                        }
                    }
                    FXalert(0);
                    clearAll();
                }
            }
        } catch (e: Exception) {
            var msg: String = "Class : Doctor commisioon  method : saveClick()  = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function btnDocCommSaveOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        saveclick();
    }

    function txtDocCommEDateOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtDocCommEDate.style = mandatory;
        listDoctorName.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            DoctorCommissionTable.focusSet();
        } shortcut(event) ;
    }

    function txtDocCommSDateOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtDocCommSDate.style = mandatory;
        listDoctorName.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtDocCommSDate.requestFocus();
        } shortcut(event);
    }

    function txtDocCommNameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtDocCommName.style = mandatory;
        DoctorCommissionTable.clearAllValues();
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
             if(commonController.getDoctorName(txtDocCommName.rawText).contains(txtDocCommName.rawText)){
                listDoctorName.visible =false ;
                txtDocCommSDate.requestFocus() ;
             } else {
                 listDoctorName.visible = false ;
                 txtDocCommName.text = "";
                 txtDocCommSDate.requestFocus () ;
             }
        }
        shortcut(event);
    }

    function txtDocCommNameOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        
        getDoctorDetails(1);
//        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
//            if(txtDocCommNameText.trim()==null or txtDocCommNameText.trim()=="null" ) {
//                    txtDocCommNameText=" ";
//            }
//        }
        if (event.code == KeyCode.VK_DOWN) {
            listDoctorName.requestFocus();
            listDoctorName.selectFirstRow();
        }
        if (event.code == KeyCode.VK_ESCAPE) {
            listDoctorName.visible = false ;
            txtDocCommName.requestFocus();
        }

    }

    function getDoctorSearchDetails(type: Integer) {
        if(not listSearch.visible){
        var listControlObj: ListController = new ListController() ;
        listH = listControlObj.listImageControlView(txtDocCommDName, listSearch, "DoctorName", type) ;
        listLX = SearchTextboxLX;
        listLY = txtDocCommDName.layoutY + 22;
        listW = Type1TextboxW;
        var selectString = bind listControlObj.selectedString on replace {
                if (selectString.length() > 0) {
                    listSearch.visible = false ;
                    txtDocCommDName.text = selectString ;
                    searchButton.requestFocus () ;
                }
            }
     }
     else{
         listSearch.visible = false;
         txtDocCommDName.requestFocus();
     }
    }

//    function getDoctorDetails(event: javafx.scene.input.KeyEvent): Void {
    function getDoctorDetails(type: Integer): Void {
        if(not listDoctorName.visible){
        try {
        listDoctorName.visible = false ;
        txtDocCommCode.text = "";
        var listControlObj: ListController = new ListController() ;
        listH = listControlObj.listImageControlView(txtDocCommName, listDoctorName, "DoctorName", type) ;
        listLX = C2LX;
        listLY = txtDocCommName.layoutY + 22;
        listW = Type1TextboxW;
        var selectString = bind listControlObj.selectedString on replace {
                if (selectString.length() > 0) {
                    listDoctorName.visible = false;
                    txtDocCommNameText = selectString ;
                    displayDoctorCommisionDetails(selectString);
                    DoctorCommissionTable.doctorName = txtDocCommNameText;
                    txtDocCommSDate.requestFocus();
                }
        }
        } catch (e:Exception ) {
            log.debug("Err in getDoctorDetails : {e.getMessage()}");
         
        }
       }
       else{
           listDoctorName.visible=false;
           txtDocCommName.requestFocus();
       }
    }

    function displayDoctorCommisionDetails(name: String): Void {
        try {
            //CommonController Call
            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
            txtDocCommCode.text = commonController.getDocCommCode(name);
        } catch (e: Exception) {
            var msg: String = "Class : Doctor commisioon  method : displayDoctorCommisionNo()  = {e.getMessage()}";
            log.debug(msg);
        }
    }
    function listDoctorNameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (listDoctorName.focused) {
            if (event.code == KeyCode.VK_DOWN)
                listDoctorName.selectFirstRow();
        }
    }
    function imgEndDateOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        listDoctorName.visible = false;
        sDatePanel.visible = true;
        eDatePanel.visible = true;
        datePickclick1();
    }

    function imgEndDateOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        listDoctorName.visible = false;
        sDatePanel.visible = true;
        eDatePanel.visible = true;
        datePickclick1();
    }

    function datePickclick1(): Void {
        if (not sal1_Flag) {
            eDatePanel.layoutY = txtDocCommEDate.layoutY + txtDocCommEDate.height + 5.0;
            if (txtDocCommEDate.text != null) {
                var dat = txtDocCommEDate.rawText.trim().split("-");
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
            sal1_Flag = true;
        } else {
            fxCalendar.visible = false;
        }
    }

    function imgStartDateOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        sDatePanel.visible = true;
        eDatePanel.visible = true;
        listDoctorName.visible = false;
        datePickclick();

    }

    function imgStartDateOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        sDatePanel.visible = true;
        listDoctorName.visible = false;
        datePickclick();
    }

    function rectViewAllOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        currentState.actual = currentState.findIndex("ViewAll");
        txtDocCommDName.text = "" ;
        doctorCharTab.visible = true;
        doctorChargersSalTable.visible = false;
        charDoctorId = "";
        if (doctorChargersTable.loadDoctorChargers() <= 0) {
            FXinfo("No Records found");
        }
        btnDocCommCancelText="Back [Ctrl+Left]";
    }
    function back(): Void {
        currentState.actual = currentState.findIndex("Shown");
        doctorCharTab.visible = false;
        doctorChargersSalTable.visible = true;
        txtDocCommName.requestFocus();
          btnDocCommCancelText="Cancel [F8]";
        clearAll();
    }

    function back1(): Void {
        currentState.actual = currentState.findIndex("Shown");
        doctorCharTab.visible = false;
        doctorChargersSalTable.visible = true;
        txtDocCommName.requestFocus();
         btnDocCommCancelText="Cancel [F8]";
    }
    function btnDocCommCancelActionAtViewAll(): Void {
        back();
    }
    function datePickclick(): Void {
        sDatePanel.visible = true;
        if (not sal_Flag) {
            sDatePanel.layoutY = txtDocCommSDate.layoutY + txtDocCommSDate.height + 5.0;
            if (txtDocCommSDate.text != null) {
                var dat = txtDocCommSDate.rawText.trim().split("-");
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
            sal_Flag = true;
        } else {
            fxCalendar.visible = false;
        }
    }

    var visit = bind fxCalendar.visible on replace {
        if (sal_Flag and not visit) {
            getDate(0);
        }
        if (sal1_Flag and not visit) {
            getDate(1);
        }
    };
    function getDate(i: Integer) {
        if (i == 0) {
            txtDocCommSDate.text = fxCalendar.getSelectedDate();
            DoctorCommissionTable.sDate = txtDocCommSDate.text;
            txtDocCommEDate.requestFocus();
            sal_Flag = false;
            sal1_Flag = false;
        }
        if (i == 1) {
            txtDocCommEDate.text = fxCalendar.getSelectedDate();
            DoctorCommissionTable.eDate = txtDocCommEDate.text;
            DoctorCommissionTable.focusSet();
            sal_Flag = false;
            sal1_Flag = false;
        }
    }
    function displayCharge(id): Void {
        try {
            //DoctorChargesController Call
            var doctorChargesModels:DoctorChargesModel=new DoctorChargesModel();
            doctorChargesModels.setChargeId(id as String);
            doctorChargesController = RegistryFactory.getClientStub(RegistryConstants.Doctor) as Doctor ;
            var doctorChargesModel:DoctorChargesModel=doctorChargesController.viewDoctorCharges(doctorChargesModels) as DoctorChargesModel;

            txtDocCommNameText = doctorChargesModel.getDoctorCommisionName();
            txtDocCommCode.text = doctorChargesModel.getDoctorcommisionCode();
            txtDocCommSDate.text = DateUtils.normalFormatDate(doctorChargesModel.getCommisionStartDate());
            txtDocCommEDate.text = DateUtils.normalFormatDate(doctorChargesModel.getCommisionEndDate());
            ChargesAmount= Value.Round(doctorChargesModel.getTotalAmount());
        } catch (e: Exception) {
            var msg: String = "Class : Doctor commisioon  method : displayCharge()  = {e.getMessage()}";
            log.debug(msg);
        }
    }

def dName = bind txtDocCommNameText on replace{

    };
def startDate = bind txtDocCommSDate.rawText on replace{

    DoctorCommissionTable.sDate  = startDate;
    };
def endDate = bind txtDocCommEDate.rawText on replace{

    DoctorCommissionTable.eDate  = endDate;
    };

    public function updateValues(): Void {

      try {

        if (doctorChargersTable.chargeId != null and doctorChargersTable.chargeId.trim().length() > 8) {
            back1();
            charDoctorId = doctorChargersTable.chargeId;
            txtHiddenId.text = charDoctorId;
            doctorChargersTable.chargeId = "";
            DoctorCommissionTable.loadDoctorCommisonTable (charDoctorId) ;
            displayCharge(charDoctorId);
            btnDocCommSaveText = "Update [F7]";
            btnDocCommEditText = "Delete [F5]";
        } else {
            if (charDoctorId == "" or charDoctorId.trim().length() == 0) {
                btnDocCommSaveText = "Save  [F3]";
                btnDocCommEditText = "Edit [F6]";
            } else {
                btnDocCommSaveText = "Update [F7]";
                btnDocCommEditText = "Delete [F5]";
            }
        }
        if (DoctorCommissionTable.finalChargeamount <= 0) {
            ChargesAmount= "0.00";
        } else {
            var totA: Double = 0.0;
            totA = DoctorCommissionTable.finalChargeamount;

            ChargesAmount= Value.Round(totA);
        }
         } catch (e: Exception) {
            var msg: String = "Class : Doctor commisioon  method : updateValues()  = {e.getMessage()}";
            log.debug(msg);
        }
    }
    function mandatory_textbox(): Void {
        txtDocCommDName.style = mandatory;
        txtDocCommSDate.style = mandatory;
        txtDocCommEDate.style = mandatory;
        txtDocCommName.style = mandatory;
    }
    public function StartUp(): Void {

 currentState.actual = 0;
        panel.visible = true;
 (DoctorCommisionFxTable as javax.swing.JTable).addKeyListener(KeyAdapter{

            override public function keyReleased(e : java.awt.event.KeyEvent): Void{

                DoctorCommissionTable.doctorCommisionCalculations();
                updateValues();
            }

        });

(DoctorCommisionFxTable as javax.swing.JTable).addKeyListener(KeyAdapter{

            override public function keyTyped(e : java.awt.event.KeyEvent): Void{

                DoctorCommissionTable.doctorCommisionCalculations();
                updateValues();
            }

        });
	(DoctorCommisionFxTable as javax.swing.JTable).addMouseListener(MouseAdapter{
            override public function mouseClicked(e : java.awt.event.MouseEvent): Void {
              DoctorCommissionTable.doctorCommisionCalculations();
                updateValues();
            }
        });

		(doctorChargersFxTable as javax.swing.JTable).addMouseListener(MouseAdapter{
            override public function mouseClicked(e : java.awt.event.MouseEvent): Void {                  
                  if (doctorChargersTable.chargeId != null or doctorChargersTable.chargeId != "" ) {
                      currentState.actual = currentState.findIndex("Shown");
                      txtDocCommName.text = doctorChargersTable.doctorViewChargeTable.getModel().getValueAt(doctorChargersTable.doctorViewChargeTable.getSelectedRow(), 3).toString() ;
                      doctorChargersTable.viewDoctorChargersCalculations();
                      updateValues();
                  }
            }
        });
        
        charDoctorId = "";
        doctorChargersSalTable.layoutX = 0;
        doctorChargersSalTable.layoutY = 0;
        doctorChargersSalTable.visible = true;
        doctorCharTab.layoutX = 0;
        doctorCharTab.layoutY = 0;
        panelViewTable.content = [doctorCharTab,];
        panelTable.content = [doctorChargersSalTable,];
        doctorCharTab.visible = false;
        fxCalendar.visible = false;
        sDatePanel.content = [fxCalendar,];
        eDatePanel.content = [fxCalendar,];
            DoctorCommissionTable.focusSet();
         clearAll();
        mandatory_textbox();


    }
}

