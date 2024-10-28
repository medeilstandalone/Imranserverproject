package com.vanuston.medeil.ui;

import java.lang.*;
import javafx.scene.layout.LayoutInfo;
import java.util.*;
import java.text.SimpleDateFormat;
import java.io.File;
import javafx.scene.image.Image;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import com.vanuston.medeil.ui.calendar.theme.GrayTheme;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.CommonDeclare;
import javafx.scene.input.KeyCode;
import java.sql.ResultSet;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.util.RegistryConstants;
import java.text.ParseException;
import com.vanuston.medeil.util.LabelPrintConfig;
import com.vanuston.medeil.util.Validation;
import com.vanuston.medeil.model.LabelPrinterModel;
import com.vanuston.medeil.labelprint.PrintServices;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.labelprint.LabelPrinter;
import com.vanuston.medeil.model.MsgReturnModel;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperPrintManager;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;
import com.vanuston.medeil.implementation.Sales;


public class LabelPrintSettings {

    var log: Logger = Logger.getLogger(LabelPrintSettings.class, "Reports");
    var panelW = bind CommonDeclare.panelFormW;
    var panelH = bind CommonDeclare.panelFormH;
    var seperatorW = bind CommonDeclare.seperatorW;
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;
    var C1LX = bind (38.88182973 * panelW) / 100;
    var C2LX = bind CommonDeclare.Column2LX;
    var C3LX = bind CommonDeclare.Column3LX;
    var C4LX = bind CommonDeclare.Column4LX;
    var panelCalenderLX: Number;
    var panelCalenderLY: Number;
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    var botton2LX = bind CommonDeclare.botton32LX;
    var bottonLY = bind CommonDeclare.panelButtonsLY;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    var bottonW = bind CommonDeclare.bottonW;
    var bottonH = bind CommonDeclare.bottonH;
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;
    //var labelController : LabelPrintSetting = RegistryFactory.getClientStub(RegistryConstants.PrescriptionFormat) as LabelPrintSetting;
    //var prescriptionController : Prescription = RegistryFactory.getClientStub(RegistryConstants.PrescriptionFormat) as Prescription;
    var comObj: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    var commonController : CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    var dir1 = new File(".");
    var listH = 0.0;
    var listW = Type2TextboxW;
    var fxCalendar = FXCalendar {
                theme: GrayTheme {};
            };



    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def chboxPrinterBrand: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: bind C1LX-100
        layoutY: 55.0
        onKeyPressed: chboxPrinterBrandOnKeyPressed
        items: [ "TVS", "Others", ]
    }
    
    public-read def chboxPrinter: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: bind C1LX-100
        layoutY: 95.0
        onKeyPressed: chboxPrinterOnKeyPressed
        onKeyReleased: chboxPrinterOnKeyReleased
        onMouseClicked: chboxPrinterOnMouseClicked
        items: null
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX-300
        layoutY: 55.0
        text: "Select Prescription No"
    }
    
    public-read def drugFilledDate: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX-300
        layoutY: 250.0
        text: "Filled By"
        font: null
    }
    
    def __layoutInfo_txtDrugFilledDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 100.0
    }
    public-read def txtDrugFilledDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C1LX-100
        layoutY: 250.0
        layoutInfo: __layoutInfo_txtDrugFilledDate
        text: bind filledDate
    }
    
    public-read def drugExpiry: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX-300
        layoutY: 300.0
        text: "Discarded By"
    }
    
    def __layoutInfo_txtDrugDiscardedDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 100.0
    }
    public-read def txtDrugDiscardedDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C1LX-100
        layoutY: 300.0
        layoutInfo: __layoutInfo_txtDrugDiscardedDate
        text: bind discardedDate
    }
    
    public-read def federalCaution: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        visible: true
        layoutX: bind C4LX-100
        layoutY: 55.0
        onMouseClicked: federalCautionOnMouseClicked
        text: "Federal Caution"
        font: null
    }
    
    def __layoutInfo_txtFederalCaution: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 300.0
        height: 50.0
    }
    public-read def txtFederalCaution: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: true
        disable: true
        layoutX: bind C4LX-75
        layoutY: 80.0
        layoutInfo: __layoutInfo_txtFederalCaution
    }
    
    public-read def drugCaution: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        visible: true
        layoutX: bind C4LX-100
        layoutY: 135.0
        onMouseClicked: drugCautionOnMouseClicked
        text: "Drug Interaction"
        font: null
    }
    
    def __layoutInfo_txtDrugCaution: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 300.0
        height: 50.0
    }
    public-read def txtDrugCaution: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: true
        disable: true
        layoutX: bind C4LX-75
        layoutY: 160.0
        layoutInfo: __layoutInfo_txtDrugCaution
    }
    
    public-read def lblQty: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C4LX-150
        layoutY: 222.0
        text: "Qty: "
        font: null
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C4LX-125
        layoutY: 262.0
        text: "M"
    }
    
    public-read def chkmrng: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        layoutX: bind C4LX-125
        layoutY: 282.0
        text: ""
    }
    
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C4LX-95
        layoutY: 262.0
        text: "A"
    }
    
    public-read def chkan: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        layoutX: bind C4LX-95
        layoutY: 282.0
        text: ""
    }
    
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C4LX-65
        layoutY: 262.0
        text: "E"
    }
    
    public-read def chkeve: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        layoutX: bind C4LX-65
        layoutY: 282.0
        text: ""
    }
    
    public-read def label8: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C4LX-35
        layoutY: 262.0
        text: "N"
    }
    
    public-read def chkngt: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        layoutX: bind C4LX-35
        layoutY: 282.0
        text: ""
    }
    
    public-read def FromPanel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelCalenderLX
        layoutY: bind panelCalenderLY-50
        blocksMouse: true
    }
    
    def __layoutInfo_panel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
        height: bind panelH
    }
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutInfo: __layoutInfo_panel
    }
    
    def __layoutInfo_listSalesCash: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW+100
        height: bind listH
    }
    public-read def listSalesCash: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind txtProductName.layoutX
        layoutY: 75.0
        layoutInfo: __layoutInfo_listSalesCash
        onKeyPressed: listSalesCashOnKeyPressed
        items: null
    }
    
    def __layoutInfo_listProductName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW+100
        height: bind listH
    }
    public-read def listProductName: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind txtProductName.layoutX
        layoutY: bind txtProductName.layoutY+20
        layoutInfo: __layoutInfo_listProductName
        onKeyPressed: listProductNameOnKeyPressed
        items: null
    }
    
    def __layoutInfo_lstPrescription: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW+100
        height: bind listH
    }
    public-read def lstPrescription: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind txtProductName.layoutX
        layoutY: 115.0
        layoutInfo: __layoutInfo_lstPrescription
        onKeyPressed: listPriscriptionOnKeyPressed
        items: null
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
    }
    
    def __layoutInfo_listdoctorname: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW+100
        height: bind listH
    }
    public-read def listdoctorname: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C1LX-100
        layoutY: 160.0
        layoutInfo: __layoutInfo_listdoctorname
        onKeyPressed: listdoctornameOnKeyPressed
        items: null
    }
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
    }
    
    def __layoutInfo_txtdoctorname: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW+100
    }
    public-read def txtdoctorname: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C1LX-100
        layoutY: 140.0
        layoutInfo: __layoutInfo_txtdoctorname
        onKeyReleased: txtdoctornameOnKeyReleased
        font: Arial_12
    }
    
    public-read def lbldoctor: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX-300
        layoutY: 140.0
        text: "Select Doctor Name"
        font: Arial_12
    }
    
    public-read def txtQTY: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX-125
        layoutY: 220.0
        font: Arial_12
    }
    
    public-read def lblTotalCopy: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutY: 0.0
        text: ""
        font: Arial_12
    }
    
    def __layoutInfo_txtLabelsPerRow: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW*25/100
    }
    public-read def txtLabelsPerRow: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutY: 0.0
        layoutInfo: __layoutInfo_txtLabelsPerRow
        onKeyPressed: txtLabelsPerRowOnKeyPressed
        onKeyReleased: txtLabelsPerRowOnKeyReleased
        font: Arial_12
    }
    
    def __layoutInfo_lblX: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW*5/100
    }
    public-read def lblX: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 0.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_lblX
        text: "X"
        font: Arial_12
    }
    
    def __layoutInfo_txtLabelno: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW*25/100
    }
    public-read def txtLabelno: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutY: 0.0
        layoutInfo: __layoutInfo_txtLabelno
        onKeyPressed: txtLabelnoOnKeyPressed
        onKeyReleased: txtLabelnoOnKeyReleased
        promptText: " > 0"
        font: Arial_12
    }
    
    public-read def hboxPrintCopies: javafx.scene.layout.HBox = javafx.scene.layout.HBox {
        visible: false
        layoutX: bind C1LX-100
        layoutY: 255.0
        content: [ txtLabelno, lblX, txtLabelsPerRow, lblTotalCopy, ]
        spacing: 5.0
        nodeVPos: javafx.geometry.VPos.CENTER
    }
    
    public-read def lbPrintlCounts: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX-300
        layoutY: 255.0
        text: "Number of Labels to Print"
        font: Arial_12
    }
    
    def __layoutInfo_txtProductName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW+100
    }
    public-read def txtProductName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C1LX-100
        layoutY: 195.0
        layoutInfo: __layoutInfo_txtProductName
        onKeyPressed: txtProductNameOnKeyPressed
        onKeyReleased: txtProductNameOnKeyReleased
        font: Arial_12
    }
    
    public-read def lblProduct: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX-300
        layoutY: 195.0
        text: "Select Product Name"
        font: Arial_12
    }
    
    def __layoutInfo_txtPrescription: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW+100
    }
    public-read def txtPrescription: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C1LX-100
        layoutY: 55.0
        layoutInfo: __layoutInfo_txtPrescription
        onKeyPressed: txtPrescriptionOnKeyPressed
        onKeyReleased: txtPrescriptionOnKeyReleased
        translateY: 0.0
        promptText: "Enter Prescription No"
        font: Arial_12
    }
    
    def __layoutInfo_txtSalesCaPName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW+100
    }
    public-read def txtSalesCaPName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: true
        layoutX: bind C1LX-100
        layoutY: 95.0
        layoutInfo: __layoutInfo_txtSalesCaPName
        onKeyPressed: txtSalesCaPNameOnKeyPressed
        onKeyReleased: txtSalesCaPNameOnKeyReleased
        promptText: ""
        font: Arial_12
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX-300
        layoutY: 95.0
        text: "Select Patient Name"
        font: Arial_12
    }
    
    public-read def lblPrinterName: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX-300
        layoutY: 95.0
        text: "select Label Driver"
        font: Arial_12
    }
    
    public-read def lblPrinterbrand: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX-300
        layoutY: 55.0
        text: "Select Label Brand"
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
    
    public-read def label6: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX-100
        layoutY: 380.0
        text: "Paper Size"
        font: Arial_Bold_14
    }
    
    public-read def Arial_16: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 16.0
    }
    
    public-read def Arial_Bold_16: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 16.0
    }
    
    public-read def reflectionEffect: javafx.scene.effect.Reflection = javafx.scene.effect.Reflection {
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
        layoutY: 7.0
        layoutInfo: __layoutInfo_label
        effect: null
        text: "Label Print"
        font: Arial_25
        hpos: javafx.geometry.HPos.CENTER
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Balance sheet.png"
    }
    
    public-read def imagebalance: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Printer.png"
        backgroundLoading: false
    }
    
    public-read def imageView3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        cursor: null
        image: imagebalance
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_button: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW+30
        height: bind bottonH
    }
    public-read def button: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton2LX+25
        layoutY: 500.0
        layoutInfo: __layoutInfo_button
        effect: reflectionEffect
        graphic: imageView3
        text: "Print Labels"
        font: Arial_Bold_16
        action: buttonAction
    }
    
    public-read def linearGradient: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#FFFFFF") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#000000") }, ]
    }
    
    public-read def image2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Calender.png"
    }
    
    public-read def linearGradient2: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#FFFFFF") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#000000") }, ]
    }
    
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        opacity: 0.25
        fill: linearGradient2
        stroke: null
        width: bind panelW
        height: 40.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def toggleGroup: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def rdomulPrint: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: bind C1LX-350
        layoutY: 220.0
        onMouseClicked: rdomulPrintOnMouseClicked
        text: "Multiple Item Print"
        font: Arial_12
        toggleGroup: toggleGroup
    }
    
    public-read def rdosinglePrint: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: bind C1LX-350
        layoutY: 100.0
        onMouseClicked: rdosinglePrintOnMouseClicked
        text: "Single Item Multiple Print"
        font: Arial_12
        toggleGroup: toggleGroup
    }
    
    public-read def toggleGroup2: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    def __layoutInfo_rdopaper2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: 15.0
    }
    public-read def rdopaper2: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: bind C1LX-100
        layoutY: 450.0
        layoutInfo: __layoutInfo_rdopaper2
        onMouseClicked: rdopaper2OnMouseClicked
        text: "5.4\" X 11.6 \" inches"
        font: Arial_12
        toggleGroup: toggleGroup2
    }
    
    def __layoutInfo_rdopaper1: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: 15.0
    }
    public-read def rdopaper1: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: bind C1LX-100
        layoutY: 420.0
        layoutInfo: __layoutInfo_rdopaper1
        onMouseClicked: rdopaper1OnMouseClicked
        text: "8.2\" X11.6 \" inches"
        font: Arial_12
        toggleGroup: toggleGroup2
    }
    
    public-read def imageSingleA4: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/barCodeSingleA4.png"
    }
    
    public-read def imageSingleSmall: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/barCodeSingleSmall.png"
        placeholder: null
    }
    
    public-read def imageMultipleA4: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/barCodeMultipleA4.png"
    }
    
    public-read def imageLabePrinter: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/labelprinter.png"
        width: 0.0
        height: 0.0
        placeholder: null
    }
    
    public-read def imgPreview: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: true
        disable: false
        layoutX: bind C3LX+80
        layoutY: 310.0
        image: imageLabePrinter
        fitWidth: 450.0
        fitHeight: 225.0
    }
    
    public-read def image3: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
        width: 0.0
        height: 22.0
    }
    
    public-read def imageView2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind C1LX-20+Type3TextboxW
        layoutY: bind txtProductName.layoutY+1.5
        onMouseClicked: imageView2OnMouseClicked
        image: image3
        fitWidth: bind txtProductName.height-3
        fitHeight: bind txtProductName.height-3
    }
    
    public-read def imageBBODate: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Calender.png"
    }
    
    public-read def darkGray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.2
        blue: 0.2
    }
    
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        styleClass: "form-background"
        fill: linearGradient
        stroke: darkGray
        width: bind panelW
        height: bind panelH
    }
    
    public-read def linearGradientHeader: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#FFFFFF") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#000000") }, ]
    }
    
    public-read def image4: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Calender.png"
    }
    
    public-read def imgDrugFilledDatePicker: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind C1LX
        layoutY: 250.0
        onMouseClicked: DrugFilledDatePickerOnMouseClickedAtShown
        image: image4
        fitWidth: 21.0
        fitHeight: 21.0
    }
    
    public-read def image5: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Calender.png"
    }
    
    public-read def imgDrugDiscardedDatePicker: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind C1LX
        layoutY: 300.0
        onMouseClicked: DrugDiscardDatePickerOnMouseClickedAtShown
        image: image5
        fitWidth: 21.0
        fitHeight: 21.0
    }
    
    public-read def PanelLabelPrint: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ rectangle, rectHeader, label, rdosinglePrint, lblPrinterbrand, chboxPrinterBrand, lblPrinterName, chboxPrinter, label2, txtSalesCaPName, label3, txtPrescription, lblProduct, txtProductName, imageView2, lbPrintlCounts, hboxPrintCopies, drugFilledDate, txtDrugFilledDate, imgDrugFilledDatePicker, drugExpiry, txtDrugDiscardedDate, imgDrugDiscardedDatePicker, federalCaution, txtFederalCaution, drugCaution, txtDrugCaution, lblQty, txtQTY, label4, chkmrng, label5, chkan, label7, chkeve, label8, chkngt, label6, imgPreview, FromPanel, panel, listSalesCash, listProductName, lstPrescription, rdopaper1, rdopaper2, rdomulPrint, panelAlert, button, lbldoctor, txtdoctorname, listdoctorname, ]
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ PanelLabelPrint, ]
    }
    // </editor-fold>//GEN-END:main


    var labelPrinterModel: LabelPrinterModel = new LabelPrinterModel();
    var filledDate = DateUtils.now("dd-MM-yyyy");
    var discardedDate = DateUtils.now("dd-MM-yyyy");
    var cashBillDate = DateUtils.now("dd-MM-yyyy");
    var dateFlag: Boolean = false;
    var dateFlagBBO: Boolean = false;
    
    var visit = bind fxCalendar.visible on replace {
        if (dateFlag and not visit) {
            cashBillDate = fxCalendar.getSelectedDate();
            dateFlag = false;
            txtSalesCaPName.requestFocus();
        }
    };
    var visible = bind fxCalendar.visible on replace {
        if (dateFlag and not visible) {
            filledDate = fxCalendar.getSelectedDate();
            dateFlag = false;
        } else if (dateFlagBBO and not visible) {
            discardedDate = fxCalendar.getSelectedDate();
            dateFlagBBO = false;
        }
    };

    function rdosinglePrintOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if (rdopaper1.selected == true) {
            imgPreview.image = imageSingleA4;
        } else if (rdopaper2.selected == true) {
            imgPreview.image = imageSingleSmall;
        }
    }

    function rdopaper1OnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if (rdosinglePrint.selected == true) {
            imgPreview.image = imageSingleA4;
        } else if (rdomulPrint.selected == true) {
            imgPreview.image = imageMultipleA4;
        }
    }

    function rdopaper2OnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if (rdosinglePrint.selected == true) {
            imgPreview.image = imageSingleSmall;
        } else if (rdomulPrint.selected == true) {
            imgPreview.image = imageLabePrinter;
        }
    }

    function rdomulPrintOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if (rdopaper1.selected == true) {
            imgPreview.image = imageMultipleA4;
        } else if (rdopaper2.selected == true) {
            imgPreview.image = imageLabePrinter;
        }
    }

    public function disEnable(): Void {
        if (federalCaution.selected) {
            txtFederalCaution.disable = false;
            getPatientDetails();
        } else {
            txtFederalCaution.disable = true;
        }
        if (drugCaution.selected) {
            txtDrugCaution.disable = false;
            txtDrugCaution.text = labelPrinterModel.getDrugCaution();
        }else {
            txtDrugCaution.disable = true;
        }
    }

    function federalCautionOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        disEnable();
    }

     function chboxPrinterBrandOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB) {
            chboxPrinter.requestFocus();
            if(event.shiftDown){
              //  button1.requestFocus();
            }
        }
    }

    function drugCautionOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        disEnable();
    }

        function DrugFilledDatePickerOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
            //println("--DrugFilledDatePickerOnMouseClickedAtShown");
        if (not dateFlag) {
            panelCalenderLX =C1LX+ 30.0;
            panelCalenderLY = 295;

            if (txtDrugFilledDate.text != null) {
                var dat = txtDrugFilledDate.rawText.split("-");
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1])-1;
                var y = Integer.parseInt(dat[2]);
                fxCalendar.set(y, m, d);
                //println("if y {y}, m {m}, d {d}");
                //println("dat[1]{dat[1]}");
            } else {
                var dat = DateUtils.now("dd-MM-yyyy").split("-");
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1])-1;
                var y = Integer.parseInt(dat[2]);
                fxCalendar.set(y, m, d);
                //println("else y {y}, m {m}, d {d}");
                //println("dat[1]{dat[1]}");
            }
            if(dateFlagBBO){
                dateFlagBBO=false;
               fxCalendar.visible = not fxCalendar.visible;
            }
            fxCalendar.visible = not fxCalendar.visible;
            dateFlag = true;
        } else {
            fxCalendar.visible = false;
        }
    }
    function DrugDiscardDatePickerOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        //println("--DrugDiscardDatePickerOnMouseClickedAtShown");
            if (not dateFlagBBO) {
            panelCalenderLX =C1LX+30.0;
            panelCalenderLY = 335 ;

            if (txtDrugDiscardedDate.text != null) {
                var dat = txtDrugDiscardedDate.rawText.split("-");
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1]) - 1;
                var y = Integer.parseInt(dat[2]);
                fxCalendar.set(y, m, d);
                //println("y {y}, m {m}, d {d}");
            } else {
                var dat = DateUtils.now("dd-MM-yyyy").split("-");
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1]) - 1;
                var y = Integer.parseInt(dat[2]);
                fxCalendar.set(y, m, d);
                //println("y {y}, m {m}, d {d}");
            }
            if(dateFlag){
                dateFlag=false;
                fxCalendar.visible = not fxCalendar.visible;
            }
            fxCalendar.visible = not fxCalendar.visible;
            dateFlagBBO = true;
        } else {
            fxCalendar.visible = false;
        }
    }


    function chboxPrinterOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        //println("----chboxPrinterOnKeyPressed");
        if (event.code == KeyCode.VK_TAB) {
            txtProductName.requestFocus();
            if (event.shiftDown) {
               // button1.requestFocus();
            }
        }
    }

    function chboxPrinterOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        //println("----chboxPrinterOnKeyReleased");
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_SPACE) {
            loadPrinters();
        }
    }

    function chboxPrinterOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        //println("----chboxPrinterOnMouseClicked");
        loadPrinters();
    }

    function txtLabelsPerRowOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        //println("----txtLabelsPerRowOnKeyPressed");
        var row: Integer = 0;
        var col: Integer = 1;
        try {
            row = Integer.parseInt(txtLabelno.rawText);
        } catch (e: Exception) { }
        try {
            col = Integer.parseInt(txtLabelsPerRow.rawText);
        } catch (e: Exception) { }
        lblTotalCopy.text = "=> {row * col}";
    }

    function txtLabelsPerRowOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        //println("----txtLabelsPerRowOnKeyReleased");
        var row: Integer = 0;
        var col: Integer = 1;
        try {
            row = Integer.parseInt(txtLabelno.rawText);
        } catch (e: Exception) { }
        try {
            col = Integer.parseInt(txtLabelsPerRow.rawText);
        } catch (e: Exception) {
        }
        lblTotalCopy.text = "=> {row * col}";
    }

    function txtLabelnoOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        //println("----txtLabelnoOnKeyPressed");
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            if (event.code == KeyCode.VK_TAB) {
                txtLabelsPerRow.requestFocus();
            }
            if (event.shiftDown) {
                txtProductName.requestFocus();
            }
        }
        var row: Integer = 0;
        var col: Integer = 1;
        try {
            row = Integer.parseInt(txtLabelno.rawText);
        } catch (e: Exception) { }
        try {
            col = Integer.parseInt(txtLabelsPerRow.rawText);
        } catch (e: Exception) { }
        lblTotalCopy.text = "=> {row * col}";
    }

    function txtLabelnoOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        //println("----txtLabelnoOnKeyReleased");
        var row: Integer = 0;
        var col: Integer = 1;
        try {
            row = Integer.parseInt(txtLabelno.rawText);
        } catch (e: Exception) { }
        try {
            col = Integer.parseInt(txtLabelsPerRow.rawText);
        } catch (e: Exception) { }
        lblTotalCopy.text = "=> {row * col}";
    }

    function txtProductNameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        
    }

    function txtProductNameOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        //println("----txtProductNameOnKeyReleased");
        if (event.code != KeyCode.VK_F10 and txtProductName.rawText.length() > 1) {
            getProduct(event.code, txtProductName.rawText.trim());
            if (event.code == KeyCode.VK_DOWN) {
                listProductName.requestFocus();
                listProductName.selectFirstRow();
            } else if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB) {
                listProductName.visible = false;
            }
        }
    }

    function listProductNameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        //println("----listProductNameOnKeyPressed");
        if (listProductName.focused)
            if (event.code == KeyCode.VK_DOWN)
                listProductName.selectFirstRow();
    }

    function imageView2OnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        //println("----imageView2OnMouseClicked");
        if (txtProductName.rawText.length() > 1)
            getProduct(KeyCode.VK_DOWN, "");
    }

    function button1OnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        //println("----button1OnKeyPressed");
        if (event.code == KeyCode.VK_TAB) {
            txtProductName.requestFocus();
        }
    }

    function button1OnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        //println("----button1OnKeyReleased");
        if (event.code == KeyCode.VK_ENTER) {
           // button1Action();
        } else {
            shortcut(event.code);
        }
    }

    var KyEvent = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 7 and CommonDeclare.currRep.equals("SR7".trim())) {
            shortcut(KyEvent.code);
        }
    }

    def CustomAlert = CustomAlert {};

    function showAlertbox(): Void {
        //println("----showAlertbox");
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        //println("----FXinfo");
        CustomAlert.ShowInfo("Label Print", msg);
        showAlertbox();
    }

    public function shortcut(kcode: KeyCode): Void {
        //println("----shortcut");
        if (kcode == CommonDeclare.repKey) {
           // button1Action();
        }
    }

    function getProductCode(): LabelPrinterModel {

        var rs: ResultSet = DBConnection.getStatement().executeQuery("select mrp,substring(item_id,3,9) as item_id from drugtable where concat(itemname,'_',dosage) = '{txtProductName.text.trim()}' and dru_flag_id!=3");
        while (rs.next()) {
            labelPrinterModel.setProductCode(rs.getString("item_id"));
            labelPrinterModel.setProductMrp(rs.getString("mrp"));
            labelPrinterModel.setSellingPrice(rs.getString("mrp"));
        }
        rs = null;
        rs = DBConnection.getStatement().executeQuery("SELECT * FROM shop_information");
        var shopName: String = "";
        var shopAddress1: String = "";
        var shopAddress2: String = "";
        var shopAddress3: String = "";
        var shopCity: String = "";
        var shopState: String = "";
        var shopZIP: String = "";
        var shopMobileNO: String = "";
        while (rs.next()) {
            if (rs.getString("shop_name") != null)
            shopName = rs.getString("shop_name");
            //println("shopName: {shopName}");
            shopAddress1 = rs.getString("address1");
            //println("shopAddress1: {shopAddress1}");
            shopAddress2 = rs.getString("address2");
            shopAddress3 = rs.getString("address3");
            shopCity = rs.getString("city");
            shopState = rs.getString("state");
            shopZIP = rs.getString("pincode");
            shopMobileNO = rs.getString("mobile_no");
            labelPrinterModel.setShopName(shopName);
        }
        rs = null;
        return labelPrinterModel;
    }

    var printCopies = 0;

    function isValidCopies(copies: String): Boolean {
        try {
            if (copies != null and copies != "") {
                printCopies = Integer.parseInt(copies);
            }
        } catch (nfe: NumberFormatException) {
            log.debug("isValidCopies Exception:{nfe.getMessage()}");
            return false;
        }
        if (printCopies > 0) {
            return true;
        } else {
            return false;
        }
    }

    public function validateDate(date: String): Boolean {
        var sdf: SimpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
        try {
            sdf.parse(date);
            return true;
        } catch (ex: ParseException) {
            return false;
        }
    }

     function buttonAction(): Void {
         savelabel(1);
         }
         public function savelabel(ss: Integer): Void {
         try{
             var labelPrinterModel1 =new LabelPrinterModel();
             var valid: Validation = new Validation();
             comObj = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
              if (txtPrescription.rawText.trim().length() <= 0) {
                    FXinfo("Please select Prescription no");
                    txtSalesCaPName.requestFocus();
                } else if (txtProductName.rawText.trim().equals("") or txtProductName.rawText.trim().length() == 0) {
                    FXinfo("Please select the Product Name");
                    txtProductName.requestFocus();
                }else if (txtQTY.rawText.trim().length() <= 0) {
                    FXinfo("Please enter the quantity");
                    txtQTY.requestFocus();
                }
                    labelPrinterModel1.setProductName(txtProductName.text.replace("_", " "));
                    labelPrinterModel1.setDoctorName(txtdoctorname.text.trim());
                    labelPrinterModel1.setProductPacked(filledDate);
                    labelPrinterModel1.setBestBeforeOn(discardedDate);
                    labelPrinterModel1.setFederalCaution(txtFederalCaution.rawText.trim());
                    labelPrinterModel1.setDrugCaution(txtDrugCaution.rawText.trim());
                    labelPrinterModel1.setPrescreptionNO(getInteger(txtPrescription.rawText.trim()));
                    labelPrinterModel1.setCustomerName(txtSalesCaPName.text.trim());
                    labelPrinterModel1.setQTY(txtQTY.rawText.trim());

                    if (chkmrng.selected) {
                        labelPrinterModel1.setMorning("Y");
                    } else {
                        labelPrinterModel1.setMorning("N");
                    }
                    if (chkan.selected) {
                        labelPrinterModel1.setNoon("Y");
                    } else {
                        labelPrinterModel1.setNoon("N");
                    }
                    if (chkeve.selected) {
                        labelPrinterModel1.setEvening("Y");
                    } else {
                        labelPrinterModel1.setEvening("N");
                    }
                    if (chkngt.selected) {
                        labelPrinterModel1.setNight("Y");
                    } else {
                        labelPrinterModel1.setNight("N");
                    }                  
                     var type="";
                var returnObject = new Object();
                returnObject = commonController.createRecord1(labelPrinterModel1);
                System.out.println("Returnobject");
                System.out.println(returnObject);            
                if(returnObject.equals(true))
                {
                    System.out.println("retunmsg");
                    Logger.write("LabelPrinterModel   ==== >");
                    type="save";
                   if (ss == 1) {
                       Logger.write("LabelPrinterModel   ==== >");
                       var salesController : Sales = RegistryFactory.getClientStub(RegistryConstants.Sales) as Sales;
                        type = "Print";
                        var reportSource: File = new File("printerfiles/LabelPrint.jasper");
                        Logger.write("LabelPrinterModel   ==== >");
                        var jasperReport:JasperReport =  JRLoader.loadObject(reportSource) as JasperReport;
                        Logger.write("LabelPrinterModel   ==== >");
                        var jasperPrint:JasperPrint = salesController.jasperPrint(String.valueOf(labelPrinterModel1.getPrescreptionNO()), "Labelprint",jasperReport);
                        Logger.write("LabelPrinterModel   ==== >");
                        JasperPrintManager.printReport(jasperPrint, false);
                        Logger.write("LabelPrinterModel   ==== >");
                    }
                    Logger.write("LabelPrinterModel   ==== >");
                    FXalert(7);
                    clear();
                }



         }
        catch (e: Exception) {
            e.printStackTrace();
            var msg: String = "Class : LabelPrintSettings method : button1Action()   = {e.getMessage()}";
            log.debug(msg);
         }

         }
   function clear(): Void{
       txtSalesCaPName.text="";
       txtPrescription.text="";
       txtdoctorname.text="";
       txtProductName.text="";
       txtFederalCaution.text="";
       txtDrugCaution.text="";
       txtQTY.text="";
       chkmrng.selected=false;
       chkan.selected=false;
       chkeve.selected=false;
       chkngt.selected=false;
       federalCaution.selected=false;
       drugCaution.selected=false;

   }

         
    /*function button1Action(): Void {
         try {
            var valid: Validation = new Validation();
            comObj = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
            if (rdosinglePrint.selected == true) {
                if ("{chboxPrinter.selectedItem.toString()}".trim().equals("") or "{chboxPrinter.selectedItem.toString()}".trim().equalsIgnoreCase("null") or "{chboxPrinter.selectedItem.toString()}".trim().equalsIgnoreCase("select") or "{chboxPrinter.selectedItem.toString()}".trim().length() == 0) {
                    FXinfo("Please select the label printer!");
                    chboxPrinter.requestFocus();
                } else if (chboxPrinterBrand.selectedItem.toString().trim().equals("") or "{chboxPrinterBrand.selectedItem.toString()}".trim().equalsIgnoreCase("null") or "{chboxPrinterBrand.selectedItem.toString()}".trim().equalsIgnoreCase("select") or "{chboxPrinterBrand.selectedItem.toString()}".trim().length() == 0) {
                    FXinfo("Please select the printer brand!");
                    chboxPrinterBrand.requestFocus();
                } else if (txtSalesCaPName.rawText.trim().length() <= 0) {
                    FXinfo("Please select patient name");
                    txtSalesCaPName.requestFocus();
                } else if (txtPrescription.rawText.trim().length() <= 0) {
                    FXinfo("Please select Prescription no");
                    txtSalesCaPName.requestFocus();
                } else if (txtProductName.rawText.trim().equals("") or txtProductName.rawText.trim().length() == 0) {
                    FXinfo("Please select the Product Name");
                    txtProductName.requestFocus();
                } else if (txtLabelno.rawText.trim().equals("") or txtLabelno.rawText.trim().length() < 1) {
                    FXinfo("Please enter the number of labels to print");
                    txtLabelno.requestFocus();
                } else if (not isValidCopies(txtLabelno.rawText.trim())) {
                    FXinfo("Please enter the valid number of labels to print");
                    txtLabelno.requestFocus();
                } else if (txtLabelsPerRow.rawText.trim().equals("") or txtLabelsPerRow.rawText.trim().length() < 1) {
                    FXinfo("Please enter the labels per row value");
                    txtLabelsPerRow.requestFocus();
                } else if ((not isValidCopies(txtLabelsPerRow.rawText.trim()) or (getInteger(txtLabelsPerRow.rawText.trim()) > 4))) {
                    FXinfo("Please enter the valid labels per row value (1 to 4)");
                    txtLabelsPerRow.requestFocus();
                } else if (txtQTY.rawText.trim().length() <= 0) {
                    FXinfo("Please enter the quantity");
                    txtQTY.requestFocus();
                } else {
                    getShopDetails();
                    getPatientDetails();
                    labelPrinterModel.setProductName(txtProductName.text.replace("_", " "));
                    labelPrinterModel.setPrintSet(getInteger(txtLabelsPerRow.text));
                    labelPrinterModel.setPrintCopies(getInteger(txtLabelno.text.trim()));
                    labelPrinterModel.setPrinter("{chboxPrinter.selectedItem.toString()}");
                    labelPrinterModel.setProductPacked(filledDate);
                    labelPrinterModel.setBestBeforeOn(discardedDate);
                    if(txtFederalCaution.rawText.trim()==""){
                    labelPrinterModel.setFederalCaution("");
                    }
                    else{
                    labelPrinterModel.setFederalCaution(txtFederalCaution.rawText.trim());
                    }
                    if(txtDrugCaution.rawText.trim()==""){
                    labelPrinterModel.setDrugCaution(txtDrugCaution.rawText.trim());
                    }
                    else{
                    labelPrinterModel.setPrescreptionNO(getInteger(txtPrescription.rawText.trim()));
                    }
                    labelPrinterModel.setCustomerName(txtSalesCaPName.text.trim());
                    labelPrinterModel.setQTY(txtQTY.rawText.trim());

                    if (chkmrng.selected) {
                        labelPrinterModel.setMorning("Y");
                    } else {
                        labelPrinterModel.setMorning("N");
                    }
                    if (chkan.selected) {
                        labelPrinterModel.setNoon("Y");
                    } else {
                        labelPrinterModel.setNoon("N");
                    }
                    if (chkeve.selected) {
                        labelPrinterModel.setEvening("Y");
                    } else {
                        labelPrinterModel.setEvening("N");
                    }
                    if (chkngt.selected) {
                        labelPrinterModel.setNight("Y");
                    } else {
                        labelPrinterModel.setNight("N");
                    }
                    try {
                        //sending barcode labels to printer for TVS
                        if (chboxPrinterBrand.selectedItem == "TVS") {
                            System.out.println("TVS");
                            var bp: LabelPrinter = new LabelPrinter();
                            bp.sendToPrinter(labelPrinterModel);
                            CustomAlert.ShowAlert("Label Printer", 7);
                            showAlertbox();
                            txtProductName.requestFocus();
                        } else {
                            //sending barcode labels to printer for Zebra TLP 2844
                            System.out.println("Zebra");
                            var ps: PrintServices = new PrintServices();
                            if (ps.getPrintService(labelPrinterModel.getPrinter()) != null) {
                               ps.PrintJob(ps.getPrintService(labelPrinterModel.getPrinter()), labelPrinterModel);
                                CustomAlert.ShowAlert("Label Printer", 7);
                                showAlertbox();
                                txtProductName.requestFocus();
                            } else {
                                FXinfo("Please check barcode printer services!");
                            }
                        }
                        var lpc: LabelPrintConfig = new LabelPrintConfig();
                        lpc.createLabelPrintConfig(getLabelPrintConfig(labelPrinterModel));
                    } catch (e: Exception) {
                        e.printStackTrace();
                        log.debug("Method:button1Action Exception_1:{e.getMessage()}");
                        FXinfo("Please check label printer connection/services!");
                    }
                }
            }
            comObj.queryExecution("CALL pro_userlog('label printing','{button1.text}')");
        } catch (e: Exception) {
            e.printStackTrace();
            var msg: String = "Class : LabelPrintSettings method : button1Action()   = {e.getMessage()}";
            log.debug(msg);
        }
    }*/
   function FXalert(type: Integer): Void {
      //  CustomAlert.ShowAlert("Sales - {selBillType} Payment",type);
        CustomAlert.ShowAlert("Alert",type);
        showAlertbox();
    }
    
    function getProduct(kcode: javafx.scene.input.KeyCode, iname: String) {

        var itemName: String[] = [];
        listProductName.visible = true;
        itemName = comObj.getListItems(iname, "", "DRUDOSAGE").toArray() as String[]; // GetNameClass.ProductName(iname);
        listProductName.items = itemName;
        var size = listProductName.items.size();
        listProductName.onKeyPressed = function(e) {
                    if (e.code == KeyCode.VK_ENTER) {
                        txtProductName.text = "{listProductName.selectedItem}";
                        listProductName.visible = false;
                        txtLabelno.requestFocus();
                    } else if (e.code == KeyCode.VK_DOWN) {
                        if (listProductName.selectedIndex == 0) {
                            listProductName.selectFirstRow();
                        }
                    } else if (e.code == KeyCode.VK_ESCAPE) {
                        listProductName.visible = false;
                        txtProductName.requestFocus();
                    }
                    getProductCode();
                };
        listProductName.onMouseClicked = function(e) {
                    txtProductName.text = "{listProductName.selectedItem}";
                    listProductName.visible = false;
                    txtLabelno.requestFocus();
                    getProductCode();
                }
        if (size < 12) {
            listH = size * 25;
            if (size > 5)
                listH -= 5;
            if (size == 0)
                listProductName.visible = false;
        } else {
            listH = 295;
        }
    }

    function getInteger(val: String): Integer {
        //println("----getInteger");
        var intVal: Integer = 0;
        try {
            intVal = Integer.parseInt("{val}");
        } catch (e: NumberFormatException) { }
        return intVal;
    }

    public function getLabelPrintConfig(lpm: LabelPrinterModel): String[] {
        //println("----startgetLabelPrintConfigup");
        var labelPrintConfig: String[] = "select,1,0,0,0,0,0,0".split(",");
        var flag: Boolean[] = [false, true];
        try {
            labelPrintConfig[0] = "{lpm.getPrinter()}";
            labelPrintConfig[1] = "{lpm.getPrintSet()}";

        } catch (e: Exception) {
            log.debug("ReportBarcodePrint getLabelPrintConfig:{e.getMessage()}");
        }
        return labelPrintConfig;
    }

    public function getLabelPrintConfig(labelPrintConfig: String[]): LabelPrinterModel {
        //println("----getLabelPrintConfig");
        var lpm: LabelPrinterModel = new LabelPrinterModel();
        var flag: Boolean[] = [false, true];
        if (labelPrintConfig != null) {
            if (labelPrintConfig.size() > 0) { lpm.setPrinter(labelPrintConfig[0]); }
            if (labelPrintConfig.size() > 1) { lpm.setPrintSet(getInteger(labelPrintConfig[1])); }

        }
        return lpm;
    }

    function getLabelPrintConfig(): LabelPrinterModel {
        //println("----getLabelPrintConfig");
        var lpm: LabelPrinterModel = null;
        try {
            var config: LabelPrintConfig = new LabelPrintConfig();
            var s: String[] = config.getLabelPrintConfig().split(",");
            lpm = getLabelPrintConfig(s);
        } catch (e: Exception) {
            e.printStackTrace();
        }
        return lpm;
    }

    function setConfig(): Void {
        //println("----setConfig");
        var lpm: LabelPrinterModel = getLabelPrintConfig();
        try {
            if (lpm.getPrinter() != null and lpm.getPrinter().length() > 0 and not lpm.getPrinter().equalsIgnoreCase("null") and lpm.getPrinter() != "select") {
                //println("setConfig if");
                var prtr: String[] = [""];
                prtr[0] = lpm.getPrinter();
                chboxPrinter.items = Arrays.asList(prtr).toArray();
                chboxPrinter.select(Arrays.asList(lpm.getPrinter()).indexOf("{lpm.getPrinter()}"));
            } else {
    
                loadPrinters();
            }
            txtLabelsPerRow.text = "{lpm.getPrintSet()}";
        } catch (e: Exception) {
            e.printStackTrace();
        }
    }

    function loadPrinters(): Void {
        var ps: PrintServices = new PrintServices();
        chboxPrinter.items = ps.listPrinter().toArray();

    }


    //Added on 23/12/2014
    function getPatientDetails(): LabelPrinterModel {
        //println("----getPatientName");
        //var rs: ResultSet = DBConnection.getStatement().executeQuery("select age, gender, cust_name, cust_address1, cust_city  from cust_information where cust_name = '{txtSalesCaPName.text.trim()}'");
        var rs: ResultSet = DBConnection.getStatement().executeQuery("select age, gender, cust_name, cust_address1, cust_city  from cust_information where cust_name = '{txtSalesCaPName.text.trim()}'");
        while (rs.next()) {
            labelPrinterModel.setCustomerName(rs.getString("cust_name"));
            labelPrinterModel.setAge(rs.getString("age"));
            labelPrinterModel.setSex(rs.getString("gender"));
            labelPrinterModel.setCustomerAddress(rs.getString("cust_address1"));
            labelPrinterModel.setCustomerCity(rs.getString("cust_city"));
        }
        return labelPrinterModel;
    }
    function getdoctor(kcode: javafx.scene.input.KeyCode, name: String) {
       var doctorname: String[] = [];
        listdoctorname.visible = true;
        doctorname = comObj.getDoctorName(name).toArray() as String[]; // GetNameClass.ProductName(iname);
        listdoctorname.items = doctorname;
        var size = listdoctorname.items.size();
        listdoctorname.onKeyPressed = function(e) {
                    if (e.code == KeyCode.VK_ENTER) {
                        //println("if");
                        txtdoctorname.text = "{listdoctorname.selectedItem}";
                        listdoctorname.visible = false;
                        txtProductName.requestFocus();
                    } else if (e.code == KeyCode.VK_DOWN) {
                        //println("else if (e.code == KeyCode.VK_DOWN)");
                        if (listdoctorname.selectedIndex == 0) {
                            //println("if (listSalesCash.selectedIndex == 0)");
                            listdoctorname.selectFirstRow();
                        }
                    } else if (e.code == KeyCode.VK_ESCAPE) {
                        //println("else if");
                        listdoctorname.visible = false;
                        txtdoctorname.requestFocus();
                    }
                   // getPatientDetails();
                };
        listdoctorname.onMouseClicked = function(e) {
                    txtdoctorname.text = "{listSalesCash.selectedItem}";
                    listdoctorname.visible = false;
                    txtProductName.requestFocus();
                    //getPatientDetails();
                    //println("getPatientName getPatientName end");
                }
            if (size < 12) {
                listH = size * 25;
                if (size > 5)
                    listH -= 5;
                if (size == 0)
                    listdoctorname.visible = false;
            } else {
                listH = 295;
            }
    }

    function getPatient(kcode: javafx.scene.input.KeyCode, iname: String) {
        //println("----getPatient");
        var patientName: String[] = [];
        listSalesCash.visible = true;
        patientName = comObj.customerName(iname).toArray() as String[]; // GetNameClass.ProductName(iname);
        listSalesCash.items = patientName;
        var size = listSalesCash.items.size();
        listSalesCash.onKeyPressed = function(e) {
                    if (e.code == KeyCode.VK_ENTER) {
                        //println("if");
                        txtSalesCaPName.text = "{listSalesCash.selectedItem}";
                        listSalesCash.visible = false;
                        txtPrescription.requestFocus();
                    } else if (e.code == KeyCode.VK_DOWN) {
                        //println("else if (e.code == KeyCode.VK_DOWN)");
                        if (listSalesCash.selectedIndex == 0) {
                            //println("if (listSalesCash.selectedIndex == 0)");
                            listSalesCash.selectFirstRow();
                        }
                    } else if (e.code == KeyCode.VK_ESCAPE) {
                        //println("else if");
                        listSalesCash.visible = false;
                        txtSalesCaPName.requestFocus();
                    }
                   // getPatientDetails();

                };
        listSalesCash.onMouseClicked = function(e) {
                    txtSalesCaPName.text = "{listSalesCash.selectedItem}";
                    listSalesCash.visible = false;
                    txtPrescription.requestFocus();
                   // getPatientDetails();
                    //println("getPatientName getPatientName end");
                }
            if (size < 12) {
                listH = size * 25;
                if (size > 5)
                    listH -= 5;
                if (size == 0)
                    listSalesCash.visible = false;
            } else {
                listH = 295;
            }
    }

    function getPrescriptionNo(): Integer {
        //println("----getPrescriptionName");
        var prescriptionNo: Integer;
        var rs: ResultSet = DBConnection.getStatement().executeQuery("select id from prescription where id = '{txtPrescription.text.trim()}'");
        while (rs.next()) {
            prescriptionNo = rs.getInt("id");
        }
        return prescriptionNo;
    }

    function getPrescription(kcode: javafx.scene.input.KeyCode, preNo: Integer) {
        //println("----getPrescription");
        var prescriptionNo: Integer[] = [];
        lstPrescription.visible = true;
        prescriptionNo = comObj.getPrescriptionNo(preNo).toArray() as Integer[]; // GetNameClass.ProductName(iname);
        lstPrescription.items = prescriptionNo;        
        var size = lstPrescription.items.size();
        lstPrescription.onKeyPressed = function(e) {
           
                    if (e.code == KeyCode.VK_ENTER) {
                        //println("if");
                        txtPrescription.text = "{lstPrescription.selectedItem}";
                        lstPrescription.visible = false;
                        txtdoctorname.requestFocus();
                    } else if (e.code == KeyCode.VK_DOWN) {
                        //println("else if (e.code == KeyCode.VK_DOWN)");
                        if (lstPrescription.selectedIndex == 0) {
                            //println("if (listSalesCash.selectedIndex == 0)");
                            lstPrescription.selectFirstRow();
                        }
                    } else if (e.code == KeyCode.VK_ESCAPE) {
                        //println("else if");
                        lstPrescription.visible = false;
                        txtPrescription.requestFocus();
                    }
                    //getPrescriptionNo();
                    
                };
        lstPrescription.onMouseClicked = function(e) {
                    txtPrescription.text = "{lstPrescription.selectedItem}";
                    lstPrescription.visible = false;
                    txtdoctorname.requestFocus();
                    //getPrescriptionNo();
                    //println("getPrescriptionName getPrescriptionName end");
                }                
        if (size < 12) {
            listH = size * 25;
            if (size > 5)
                listH -= 5;
            if (size == 0)
                lstPrescription.visible = false;
        } else {
            listH = 295;
        }
    }
    


    function txtSalesCaPNameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        //println("----txtSalesCaPNameOnKeyPressed");
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtLabelno.requestFocus();
            if (event.shiftDown) {
                chboxPrinter.requestFocus();
            }
        } shortcut(event.code);
    }
       

    function txtSalesCaPNameOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        //println("----txtSalesCaPNameOnKeyReleased");
        if (event.code != KeyCode.VK_F10 and txtSalesCaPName.rawText.length() > 1) {
            //getPatient(event.code, txtSalesCaPName.rawText.trim());
            if (event.code == KeyCode.VK_DOWN) {
                listSalesCash.requestFocus();
                listSalesCash.selectFirstRow();
            } else if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB) {
                listSalesCash.visible = false;
            }
        }
    }
    function txtdoctornameOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
          if (event.code != KeyCode.VK_F10 and txtdoctorname.rawText.length() > 1) {
           // getdoctor(event.code, txtdoctorname.rawText.trim());
            if (event.code == KeyCode.VK_DOWN) {
                listdoctorname.requestFocus();
                listdoctorname.selectFirstRow();
            } else if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB) {
                listdoctorname.visible = false;
            }
        }
         }

    /*function txtPrescriptionOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        //println("----txtPrescriptionOnKeyPressed");
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtLabelno.requestFocus();
            if (event.shiftDown) {
                chboxPrinter.requestFocus();
            }
        } shortcut(event.code);
    }*/
    function txtPrescriptionOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtProductName.requestFocus();

                shortcut(event.code);
         }
    }

   /* function txtPrescriptionOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        //println("----txtPrescriptionOnKeyReleased");
        if (event.code != KeyCode.VK_F10 and txtPrescription.rawText.length() >= 1) {
            getPrescription(event.code, Integer.parseInt(txtPrescription.rawText));
            if (event.code == KeyCode.VK_DOWN) {
                lstPrescription.requestFocus();
                lstPrescription.selectFirstRow();
            } else if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB) {
                lstPrescription.visible = false;
            }
        }
    }*/
    function txtPrescriptionOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        getPrescription(1);
         if (event.code == KeyCode.VK_DOWN) {
            lstPrescription.requestFocus();
            lstPrescription.selectFirstRow();
        } else if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB) {
            lstPrescription.visible = false;
            txtPrescription.requestFocus();
        }
    }

  public function getPrescription(con: Integer): Void {
     try{
         lstPrescription.visible = false;
       // listdoctorview.visible=false;
        var listControlObj: ListController = new ListController();
        if(button.text=="Print Labels"){
         System.out.println("presno");
        listH = listControlObj.listImageControlView(txtPrescription, lstPrescription, "presno", con);
        listW = txtPrescription.width;
        lstPrescription.layoutY = txtPrescription.layoutY + 22;
        var selS: String = bind listControlObj.selectedString on replace {
         if (selS.length() > 0) {
                    txtPrescription.requestFocus();
         if (lstPrescription.selectedItem != "New name...") {
            txtPrescription.text = "{lstPrescription.selectedItem}";
            var customerDetails:List = commonController.getQueryValue("select customer_name,doctor_name from prescription_maintenance where id ='{txtPrescription.rawText.trim()}'", 2);
            txtSalesCaPName.text = customerDetails.get(0).toString();
            txtdoctorname.text = customerDetails.get(1).toString();
         }
         }}
         }
     }
     catch(ex:Exception) {
            var que = " Class : LabelPrintSettings   Method: getPrescription() )    Exception : {ex}";
            log.debug(que);
        }

  }

    function listSalesCashOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        //println("----listSalesCashOnKeyPressed");
        if (listSalesCash.focused)
            if (event.code == KeyCode.VK_DOWN)
                listSalesCash.selectFirstRow();
    }

     function listdoctornameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
            if (listdoctorname.focused)
            if (event.code == KeyCode.VK_DOWN)
                listdoctorname.selectFirstRow();
         }

    function listPriscriptionOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        //println("----listPriscriptionOnKeyPressed");
        if (lstPrescription.focused)
            if (event.code == KeyCode.VK_DOWN)
                lstPrescription.selectFirstRow();
    }

        function getShopDetails(){
        //println("----getShopDetails");
        var rs: ResultSet = DBConnection.getStatement().executeQuery("select * from shop_information");
        while (rs.next()) {
           labelPrinterModel.setShopName(rs.getString("shop_name"));
            labelPrinterModel.setShopAddress1(rs.getString("address1"));
            labelPrinterModel.setShopAddress2(rs.getString("address2"));
            labelPrinterModel.setShopAddress3(rs.getString("address3"));
            labelPrinterModel.setShopCity(rs.getString("city"));
            labelPrinterModel.setShopState(rs.getString("state"));
            labelPrinterModel.setShopMobilNo(rs.getString("mobile_no"));
        }
    }

    public function Startup() {
        //println("----startup");
        setConfig();
        txtProductName.requestFocus();
        fxCalendar.visible = false;
        FromPanel.content = [fxCalendar,];
        imgPreview.visible = true;
        imgPreview.image = imageLabePrinter;
        rdosinglePrint.selected = true;
    }

}