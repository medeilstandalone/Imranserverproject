
package com.vanuston.medeil.ui;

import java.lang.*;
import javafx.scene.layout.LayoutInfo;
import java.util.*;
import java.text.SimpleDateFormat;
import java.io.File;
import javafx.scene.image.Image;
//import com.vanuston.medeil.ui.calendar.view.FXCalendar;
//import com.vanuston.medeil.ui.calendar.theme.Theme;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import com.vanuston.medeil.ui.calendar.theme.GrayTheme;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.CommonDeclare;
import javafx.scene.input.KeyCode;
import java.sql.ResultSet;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.model.BarcodePrinterModel;
//import com.vanuston.medeil.util.BarcodePrinter;
//import com.vanuston.medeil.util.PrintServices;
import com.vanuston.medeil.printbarcode.BarcodePrinter;
import com.vanuston.medeil.printbarcode.PrintServices;
import java.text.ParseException;
import com.vanuston.medeil.util.LabelPrintConfig;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import com.vanuston.medeil.util.Validation;


public class ReportBarCodePrint {

var log:Logger=Logger.getLogger(ReportBarCodePrint.class,"Reports");
var panelW=bind CommonDeclare.panelFormW;
var panelH=bind CommonDeclare.panelFormH;
var seperatorW=bind CommonDeclare.seperatorW;
var Type3TextboxW=bind CommonDeclare.Type3TextboxW;
var C1LX=bind(38.88182973*panelW)/100;
var C2LX = bind CommonDeclare.Column2LX;
var C3LX = bind CommonDeclare.Column3LX;
var C4LX = bind CommonDeclare.Column4LX;
var panelCalenderLX:Number;
var panelCalenderLY:Number;
var panelAlertLX= bind (panelW-500)/2;
var panelAlertLY= bind (panelH-150)/2;
//var ImageCalenderLX=bind C1LX-100+Type3TextboxW+2 on replace{
//    panelCalenderLX = ImageCalenderLX + 30.0;
//    };
var ImageCalenderLX=bind vbox.layoutX + txtPkdon.width on replace{
    panelCalenderLX = ImageCalenderLX + 30.0;
    };
var botton2LX=bind CommonDeclare.botton32LX;
var bottonLY=bind CommonDeclare.panelButtonsLY;
var bottonImageW=bind CommonDeclare.bottonImageW;
var bottonImageH=bind CommonDeclare.bottonImageH;
var bottonW=bind CommonDeclare.bottonW;
var bottonH=bind CommonDeclare.bottonH;
var comObj : CommonImplements= RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
var dir1 = new File(".");
var listH = 0.0;
var fxCalendar = FXCalendar {
    theme:GrayTheme{};
    };
 var dateFlag: Boolean = false;
 var dateFlagBBO: Boolean = false;
 public var pkdDate = DateUtils.now("dd-MM-yyyy") ; 
 public var BBODate = DateUtils.now("dd-MM-yyyy") ;
 var isSelectAll = bind chkSelectAll.selected on replace {
        chkShopName.selected = isSelectAll;
        chkProduct.selected = isSelectAll;
        chkMrp.selected = isSelectAll;
 }

    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def chboxPrinter: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: bind C1LX-100
        layoutY: 55.0
        onKeyPressed: chboxPrinterOnKeyPressed
        onKeyReleased: chboxPrinterOnKeyReleased
        onMouseClicked: chboxPrinterOnMouseClicked
        items: null
    }
    
    public-read def hboxSpace: javafx.scene.layout.HBox = javafx.scene.layout.HBox {
        spacing: 6.0
    }
    
    public-read def FromPanel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelCalenderLX
        layoutY: bind panelCalenderLY
        blocksMouse: true
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
    }
    
    def __layoutInfo_panel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
        height: bind panelH
    }
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutInfo: __layoutInfo_panel
    }
    
    def __layoutInfo_listProductName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def listProductName: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind txtProductName.layoutX
        layoutY: bind txtProductName.layoutY+20
        layoutInfo: __layoutInfo_listProductName
        onKeyPressed: listProductNameOnKeyPressed
        items: null
    }
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
    }
    
    public-read def txtPkdon: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        text: bind pkdDate
        promptText: "dd/mm/yyyy"
        font: Arial_12
    }
    
    public-read def chkPkdOn: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        visible: false
        onKeyPressed: chkPkdOnOnKeyPressed
        onMouseClicked: chkPkdOnOnMouseClicked
        text: "Packed On"
        font: Arial_12
    }
    
    public-read def txtBestBfrOn: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        text: bind BBODate
        promptText: "dd/mm/yyyy"
        font: Arial_12
    }
    
    public-read def chkBestBFR: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        visible: false
        onKeyPressed: chkBestBFROnKeyPressed
        onMouseClicked: chkBestBFROnMouseClicked
        text: "Best Before On"
        font: Arial_12
    }
    
    public-read def chkSellPrice: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        visible: false
        layoutY: 0.0
        text: "Selling Price"
        font: Arial_12
    }
    
    public-read def chkMrp: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        layoutY: 0.0
        onMouseClicked: chkMrpOnMouseClicked
        text: "MRP"
        font: Arial_12
    }
    
    public-read def chkProduct: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        layoutY: 0.0
        text: "Product Name"
        font: Arial_12
    }
    
    public-read def chkShopName: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        opacity: 1.0
        layoutY: 0.0
        text: "ShopName"
        font: Arial_12
    }
    
    public-read def txtPONo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C1LX-100
        layoutY: 255.0
        onKeyPressed: txtPONoOnKeyPressed
        font: Arial_12
    }
    
    public-read def lblPONo: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX-300
        layoutY: 255.0
        text: "PO No."
        font: Arial_12
    }
    
    public-read def txtMRP: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: true
        layoutX: bind C1LX-100
        layoutY: 325.0
        font: Arial_12
    }
    
    public-read def lblMRP: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: true
        layoutX: bind C1LX-200
        layoutY: 325.0
        text: "MRP"
        font: Arial_12
    }
    
    public-read def txtWearSize: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C1LX-100
        layoutY: 175.0
        font: Arial_12
    }
    
    public-read def lblWearSize: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX-300
        layoutY: 175.0
        text: "Batch Number"
        font: Arial_12
    }
    
    public-read def lblTotalCopy: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 0.0
        text: ""
        font: Arial_12
    }
    
    def __layoutInfo_txtLabelsPerRow: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW*25/100
    }
    public-read def txtLabelsPerRow: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
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
        layoutY: 0.0
        layoutInfo: __layoutInfo_txtLabelno
        onKeyPressed: txtLabelnoOnKeyPressed
        onKeyReleased: txtLabelnoOnKeyReleased
        promptText: " > 0"
        font: Arial_12
    }
    
    public-read def hboxPrintCopies: javafx.scene.layout.HBox = javafx.scene.layout.HBox {
        layoutX: bind C1LX-100
        layoutY: 135.0
        content: [ txtLabelno, lblX, txtLabelsPerRow, lblTotalCopy, ]
        spacing: 5.0
        nodeVPos: javafx.geometry.VPos.CENTER
    }
    
    public-read def lbPrintlCounts: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX-300
        layoutY: 135.0
        text: "Number of Labels to Print"
        font: Arial_12
    }
    
    def __layoutInfo_txtProductName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtProductName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C1LX-100
        layoutY: 95.0
        layoutInfo: __layoutInfo_txtProductName
        onKeyPressed: txtProductNameOnKeyPressed
        onKeyReleased: txtProductNameOnKeyReleased
        font: Arial_12
    }
    
    public-read def lblProduct: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX-300
        layoutY: 95.0
        text: "Select Product Name"
        font: Arial_12
    }
    
    public-read def lblPrinterName: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX-300
        layoutY: 55.0
        text: "Select Barcode Printer"
        font: Arial_12
    }
    
    def __layoutInfo_txtToDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtToDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C1LX-100
        layoutY: 295.0
        layoutInfo: __layoutInfo_txtToDate
        onKeyPressed: txtToDateOnKeyPressed
        editable: false
        font: Arial_12
        lines: 5.0
    }
    
    def __layoutInfo_txtFromDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtFromDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        managed: true
        layoutX: bind C1LX-100
        layoutY: 255.0
        layoutInfo: __layoutInfo_txtFromDate
        onKeyPressed: txtFromDateOnKeyPressed
        editable: false
        font: Arial_12
    }
    
    public-read def label10: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX-300
        layoutY: 255.0
        text: "From Date"
        font: Arial_12
    }
    
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX-300
        layoutY: 295.0
        text: "To Date"
        font: Arial_12
    }
    
    public-read def Arial_Bold_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
    }
    
    public-read def Arial_14: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 14.0
    }
    
    public-read def chkSelectAll: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        onKeyPressed: chkSelectAllOnKeyPressed
        onMouseClicked: chkSelectAllOnMouseClicked
        text: "Select All"
        font: Arial_14
        selected: false
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
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 0.0
        text: "Include in Print"
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
        text: "Bar Code Print"
        font: Arial_25
        hpos: javafx.geometry.HPos.CENTER
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Balance sheet.png"
    }
    
    public-read def imagebalance: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Report Doctor.png"
        backgroundLoading: false
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: true
        layoutY: 0.0
        image: imagebalance
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_button1: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW+30
        height: bind bottonH
    }
    public-read def button1: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton2LX+25
        layoutY: 500.0
        layoutInfo: __layoutInfo_button1
        onKeyPressed: button1OnKeyPressed
        onKeyReleased: button1OnKeyReleased
        effect: reflectionEffect
        graphic: imageView
        text: "Print Barcodes"
        font: Arial_Bold_16
        textAlignment: javafx.scene.text.TextAlignment.LEFT
        action: button1Action
    }
    
    public-read def linearGradient: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#FFFFFF") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#000000") }, ]
    }
    
    public-read def image2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Calender.png"
    }
    
    public-read def imgDatePick: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        onMouseClicked: imgDatePickOnMouseClicked
        image: image2
    }
    
    public-read def hboxPkdOn: javafx.scene.layout.HBox = javafx.scene.layout.HBox {
        visible: bind chkPkdOn.selected
        disable: false
        content: [ txtPkdon, imgDatePick, ]
        spacing: 0.0
    }
    
    public-read def imgBBODate: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        onMouseClicked: imgBBODateOnMouseClicked
        image: image2
    }
    
    public-read def hboxBBO: javafx.scene.layout.HBox = javafx.scene.layout.HBox {
        visible: bind chkBestBFR.selected
        content: [ txtBestBfrOn, imgBBODate, ]
        spacing: 0.0
    }
    
    public-read def vbox: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        layoutX: bind C1LX-350
        layoutY: 230.0
        content: [ label4, hboxSpace, chkSelectAll, chkShopName, chkProduct, chkMrp, chkSellPrice, chkBestBFR, hboxBBO, chkPkdOn, hboxPkdOn, ]
        spacing: 6.0
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
    
    public-read def imageMultipleSmall: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/barCodeMultipleSmall.png"
    }
    
    public-read def imgPreview: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C3LX-100
        layoutY: 50.0
        image: imageMultipleSmall
    }
    
    public-read def image3: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
        width: 0.0
        height: 22.0
    }
    
    public-read def imageView2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind C1LX-120+Type3TextboxW
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
    
    public-read def PanelDamagedStock: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ rectangle, rectHeader, label, label5, label10, txtFromDate, txtToDate, button1, rdosinglePrint, lblPrinterName, chboxPrinter, lblProduct, txtProductName, imageView2, lbPrintlCounts, hboxPrintCopies, lblWearSize, txtWearSize, lblMRP, txtMRP, lblPONo, txtPONo, rdomulPrint, vbox, label6, rdopaper1, rdopaper2, imgPreview, FromPanel, panelAlert, panel, listProductName, ]
    }
    
    public-read def linearGradientHeader: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#FFFFFF") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#000000") }, ]
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ PanelDamagedStock, ]
    }
    // </editor-fold>//GEN-END:main

    function chkSelectAllOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if(chkSelectAll.selected==true) {
            lblMRP.visible = true;
            txtMRP.visible = true;
        }
        else {
            lblMRP.visible = false;
            txtMRP.visible = false;
        }
         }

    function chkMrpOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if(chkMrp.selected==true) {
            lblMRP.visible = true;
            txtMRP.visible = true;
        }
        else {
            lblMRP.visible = false;
            txtMRP.visible = false;
        }
      }

    function chboxPrinterOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB) {
            txtProductName.requestFocus();            
            if(event.shiftDown){
                button1.requestFocus();
            }
        }
    }

    function chboxPrinterOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_SPACE) {
            loadPrinters();
        }
    }

    function chboxPrinterOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        loadPrinters();
    }

    function chkSelectAllOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            button1.requestFocus();
            if (event.code == KeyCode.VK_TAB) {
                chkShopName.requestFocus();
            }
            if(event.shiftDown){
                txtPONo.requestFocus();
            }
        }
    }

    function txtPONoOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            chkSelectAll.requestFocus();
            if (event.code == KeyCode.VK_TAB) {
                chkSelectAll.requestFocus();
            }
            if(event.shiftDown){
                txtMRP.requestFocus();
            }
        }
    }

    function txtLabelsPerRowOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            chkSelectAll.requestFocus();
            if (event.code == KeyCode.VK_TAB) {
                txtWearSize.requestFocus();
            }
            if(event.shiftDown){
                txtLabelno.requestFocus();
            }
        }        
            var row:Integer=0;
            var col:Integer=1;
            try {
                row=Integer.parseInt(txtLabelno.rawText);
            }catch(e :Exception ){}
            try {
                col=Integer.parseInt(txtLabelsPerRow.rawText);
            }catch(e :Exception ){}
            lblTotalCopy.text="=> {row*col}";
    }

    
    function txtLabelsPerRowOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        var row:Integer=0;
            var col:Integer=1;
            try {
                row=Integer.parseInt(txtLabelno.rawText);
            }catch(e :Exception ){}
            try {
                col=Integer.parseInt(txtLabelsPerRow.rawText);
            }catch(e :Exception ){
                }
            lblTotalCopy.text="=> {row*col}";
    }

    function chkBestBFROnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        //TODO
    }

    function chkBestBFROnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        //TODO
    }

    function txtLabelnoOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            chkSelectAll.requestFocus();
            if (event.code == KeyCode.VK_TAB) {
                txtLabelsPerRow.requestFocus();
            }
            if(event.shiftDown){
                txtProductName.requestFocus();
            }
        }        
        var row:Integer=0;
        var col:Integer=1;
        try {
            row=Integer.parseInt(txtLabelno.rawText);
        }catch(e :Exception ){}
        try {
            col=Integer.parseInt(txtLabelsPerRow.rawText);
        }catch(e :Exception ){}
        lblTotalCopy.text="=> {row*col}";
    }

    function txtLabelnoOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        var row:Integer=0;
        var col:Integer=1;
        try {
            row=Integer.parseInt(txtLabelno.rawText);
        }catch(e :Exception ){}
        try {
            col=Integer.parseInt(txtLabelsPerRow.rawText);
        }catch(e :Exception ){}
        lblTotalCopy.text="=> {row*col}";
    }
    
    var visible = bind fxCalendar.visible on replace {
        if (dateFlag and not visible) {
            pkdDate = fxCalendar.getSelectedDate();
            dateFlag = false;
        }else if(dateFlagBBO and not visible){
            BBODate = fxCalendar.getSelectedDate();
            dateFlagBBO = false;
        }
    };

    function imgDatePickOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {        
        if (not dateFlag) {
            panelCalenderLX = vbox.layoutX + vbox.width + 30.0;
            panelCalenderLY = vbox.layoutY;
            if (txtPkdon.text != null) {
                var dat = txtPkdon.rawText.split("-");
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
    
    function imgBBODateOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {            
            if (not dateFlagBBO) {
            panelCalenderLX =vbox.layoutX + vbox.width + 30.0;
            panelCalenderLY = vbox.layoutY;            
            if (txtBestBfrOn.text != null) {
                var dat = txtBestBfrOn.rawText.split("-");
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
    
    function chkPkdOnOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
    }
    
    function chkPkdOnOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {

    }
    
    function setPackedOn() : Void {

    }


    function txtProductNameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtLabelno.requestFocus();
            if(event.shiftDown){
                chboxPrinter.requestFocus();
            }
        }shortcut(event.code);
         }

    function txtProductNameOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if (event.code != KeyCode.VK_F10 and txtProductName.rawText.length() > 1)
          {
           getProduct(event.code,txtProductName.rawText.trim());
           if (event.code == KeyCode.VK_DOWN)
            {
                listProductName.requestFocus();
                listProductName.selectFirstRow();
           }
           else if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB)
           {
            listProductName.visible = false;
            }
        }
         }

    function listProductNameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if(listProductName.focused)
        if (event.code == KeyCode.VK_DOWN)
        listProductName.selectFirstRow();
         }

    function imageView2OnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if(txtProductName.rawText.length() > 1)
            getProduct(KeyCode.VK_DOWN,"");
         }

    function rdomulPrintOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if(rdopaper1.selected == true) {
         imgPreview.image = imageMultipleA4;
        }
        else if(rdopaper2.selected == true) {
         imgPreview.image = imageMultipleSmall;
        }
        }

    function rdosinglePrintOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if(rdopaper1.selected == true) {
         imgPreview.image = imageSingleA4;
        }
        else if(rdopaper2.selected == true) {
         imgPreview.image = imageSingleSmall;
        }
        }

    function rdopaper1OnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
       if(rdosinglePrint.selected == true) {
         imgPreview.image = imageSingleA4;
       }
       else if(rdomulPrint.selected == true) {
         imgPreview.image = imageMultipleA4;
       }
       }

    function rdopaper2OnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
       if(rdosinglePrint.selected == true) {
         imgPreview.image = imageSingleSmall;
       }
       else if(rdomulPrint.selected == true) {
         imgPreview.image = imageMultipleSmall;
       }
       }
    function button1OnKeyPressed(event: javafx.scene.input.KeyEvent): Void {        
        if(event.code==KeyCode.VK_TAB) {
            txtProductName.requestFocus();
            if(event.shiftDown){
                chkSelectAll.requestFocus();
            }
        }
    }
    function button1OnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if(event.code==KeyCode.VK_ENTER) {
             button1Action();       
        } else {
            shortcut(event.code);
        }
    }

    function rectangle2OnMouseClicked (event: javafx.scene.input.MouseEvent): Void {
        FromPanel.visible=false;
    }

        var KyEvent=bind CommonDeclare.currKyEvent on replace{
            if(CommonDeclare.currModule==7 and CommonDeclare.currRep.equals("SR7".trim())){
            shortcut(KyEvent.code);
            }
            }
        function txtToDateOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {        
            shortcut(event.code);
         }

         function txtFromDateOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {        
            shortcut(event.code);
         }
       
        def CustomAlert=CustomAlert{};
        
        function showAlertbox():Void{
        panelAlert.visible=true;
        delete panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();        
        }
        
        function FXinfo(msg:String):Void{
        CustomAlert.ShowInfo("Bar Code Print",msg);
        showAlertbox();
        }
        
    public function shortcut(kcode:KeyCode): Void {
        if (kcode == CommonDeclare.repKey) {
            button1Action();
        }
        }
    
        
        /*function selectType() :String {
           var type1:String;
           if (chkProduct.selected  and chkMrp.selected) {
                        type1 = "pnamemrp";
                    }
                    else if(chkProduct.selected  and not chkMrp.selected ) {
                        type1 = "pname";
                    } else if(chkMrp.selected  and not chkProduct.selected ) {
                        type1 = "mrp";
                    } else {
                        type1 = "";
                    }
          return type1;
        }*/

        function getProductCode():String {
            var productCode1:String;
            var rs : ResultSet  = DBConnection.getStatement().executeQuery("select mrp,substring(item_id,3,9) as item_id from drugtable where concat(itemname,'_',dosage) = '{txtProductName.text.trim()}' and dru_flag_id!=3");
                while(rs.next()) {
                    productCode1 = rs.getString("item_id");
                    barcodePrinterModel.setProductMrp(rs.getString("mrp"));
                    barcodePrinterModel.setSellingPrice(rs.getString("mrp"));
                }                
                rs = null;
                rs = DBConnection.getStatement().executeQuery("SELECT shop_name FROM shop_information;");
                var shopName:String="";
                while(rs.next()) {
                    if(rs.getString("shop_name") != null)
//                        barcodePrinterModel.setShopName(rs.getString("store_name"));
                        shopName = rs.getString("shop_name");
                        if(txtWearSize.text.trim().length() > 0){
//                            barcodePrinterModel.setShopName("{rs.getString("store_name")}, Size:{txtWearSize.text.trim()}");
                            shopName = "{shopName}, Size:{txtWearSize.text.trim()}";
                        }
                        if(txtMRP.text.trim().length() > 0) {
//                            barcodePrinterModel.setShopName("{rs.getString("store_name")}, {txtColour.text.trim()}");
                            //shopName = "{shopName}, {txtMRP.text.trim()}";
                        }
                        barcodePrinterModel.setShopName(shopName);
                }
                rs= null;
            return productCode1;
        }

        var printCopies = 0;

        function isValidCopies(copies : String) : Boolean {
            try {
                if(copies != null and copies != "") {
                    printCopies = Integer.parseInt(copies);
                }
            } catch(nfe : NumberFormatException ){
                log.debug("isValidCopies Exception:{nfe.getMessage()}");
                return false;
            }
            if(printCopies > 0) {
                return true;
            } else {
                return false;
            }
        }
        
    public function validateDate(date:String) : Boolean {
        var sdf:SimpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
        try {
            sdf.parse(date);
            return true;
        }
        catch(ex:ParseException ) {
            return false;
        }
    }
        function reset() : Void {
            pkdDate = DateUtils.now("dd-MM-yyyy") ;
            BBODate = DateUtils.now("dd-MM-yyyy") ;
        }

        
        var barcodePrinterModel : BarcodePrinterModel = new BarcodePrinterModel();

        function button1Action(): Void {
//        var barcodePrinterModel : BarcodePrinterModel = new BarcodePrinterModel();
        try {
//        var type:String = selectType();
//        var params1  = new HashMap();
//        params1.put("shopid",ShopUserInfo.shopid);
//        params1.put("type",type);
        var valid:Validation = new Validation();
        comObj = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
        if (rdosinglePrint.selected == true) {
            if("{chboxPrinter.selectedItem.toString()}".trim().equals("") or
                 "{chboxPrinter.selectedItem.toString()}".trim().equalsIgnoreCase("null") or
                 "{chboxPrinter.selectedItem.toString()}".trim().equalsIgnoreCase("select") or
                 "{chboxPrinter.selectedItem.toString()}".trim().length()==0) {
                FXinfo("Please select the barcode printer");
                chboxPrinter.requestFocus();
            }else if(txtProductName.rawText.trim().equals("") or txtProductName.rawText.trim().length()==0) {
                FXinfo("Please select the Product Name");
                txtProductName.requestFocus();
//            } else if (txtProductName.rawText.trim().length()>0 and comObj.getPdtName(txtProductName.rawText.trim()).contains(txtProductName.rawText)) {
//                FXinfo("Please select the Product from the list");
            } else if (txtLabelno.rawText.trim().equals("") or txtLabelno.rawText.trim().length() < 1) {
                FXinfo("Please enter the number of labels to print");
                txtLabelno.requestFocus();
            } else if (not isValidCopies(txtLabelno.rawText.trim())) {
                FXinfo("Please enter the valid number of labels to print");
                txtLabelno.requestFocus();
            } else if (txtLabelsPerRow.rawText.trim().equals("") or txtLabelsPerRow.rawText.trim().length() < 1) {
                FXinfo("Please enter the labels per row value");
                txtLabelsPerRow.requestFocus();
            } else if ((not isValidCopies(txtLabelsPerRow.rawText.trim()) or (getInteger(txtLabelsPerRow.rawText.trim())>4)) ) {
                FXinfo("Please enter the valid labels per row value (1 to 4)");
                txtLabelsPerRow.requestFocus();
            } else if (chkPkdOn.selected and txtPkdon.rawText.trim().length()<= 0) {
                FXinfo("Please enter date for packed on");
                txtPkdon.requestFocus();
            } else if (chkBestBFR.selected and txtBestBfrOn.rawText.trim().length()<= 0) {
                FXinfo("Please enter date for Best Before on");
                txtBestBfrOn.requestFocus();
            } else if(valid.getDecimalValid(txtMRP.rawText.trim(), 0, 8)!=10) {
                FXinfo("MRP values is invalid");
                txtMRP.requestFocus();
            }
              else {
                    var productCode:String = getProductCode();                    
                    barcodePrinterModel.setProductName(txtProductName.text.replace("_", " "));
                    if(txtPONo.text.trim().length() > 0){
                        barcodePrinterModel.setProductName("{txtProductName.text.replace("_", " ")}, PO:{txtPONo.text}");
                    }
                    barcodePrinterModel.setProductCode(productCode);
                    barcodePrinterModel.setEnableShopName(chkShopName.selected);
                    barcodePrinterModel.setEnableProductName(chkProduct.selected);
                    barcodePrinterModel.setEnableProductMrp(chkMrp.selected);
                    barcodePrinterModel.setEnableSellingPrice(chkSellPrice.selected);
                    barcodePrinterModel.setEnableProductPacked(chkPkdOn.selected);
                    barcodePrinterModel.setEnableBestBeforeOn(chkBestBFR.selected);
                    barcodePrinterModel.setProductPacked(pkdDate);
                    barcodePrinterModel.setBestBeforeOn(BBODate);
                    barcodePrinterModel.setColour("");
                    barcodePrinterModel.setPONo("");
                    barcodePrinterModel.setPrintSet(getInteger(txtLabelsPerRow.text));                    
                    barcodePrinterModel.setPrintCopies(getInteger(txtLabelno.text.trim()));
                    barcodePrinterModel.setPrinter("{chboxPrinter.selectedItem.toString()}");
                    barcodePrinterModel.setProductMrp(txtMRP.rawText.trim());
                    try {
                        //sending barcode labels to printer for TVS LP44
//                       /*
                        var bp : BarcodePrinter = new BarcodePrinter();
                        bp.sendToPrinter(barcodePrinterModel);
//                        FXinfo("Barcode labels send to printer Sucessfully.");
                        CustomAlert.ShowAlert("Barcode Printer",7);
                        showAlertbox();
                        var lpc:LabelPrintConfig=new LabelPrintConfig();
                        lpc.createLabelPrintConfig(getLabelPrintConfig(barcodePrinterModel));
                        txtProductName.requestFocus();
//                       */

                        //sending barcode labels to printer for Zebra TLP 2844
                        /*
                        var ps  : PrintServices = new PrintServices();
                        if(ps.getPrintService() != null) {
                            ps.PrintJob(ps.getPrintService(), barcodePrinterModel);
//                            ps.printByWindows(barcodePrinterModel);
                        } else {
                            FXinfo("Please check barcode printer services!");
                        }
//                        */
//                        reset();
                    } catch(e:Exception){
                        e.printStackTrace();
                        log.debug("Method:button1Action Exception_1:{e.getMessage()}");
                        FXinfo("Please check barcode printer connection/services!");
                    }                   
                }
        }        
        comObj.queryExecution("CALL pro_userlog('Barcode Printing','{button1.text}')");
        }
    catch (e:Exception)
    {
        var msg:String="Class : ReportBarCodePrint method : button1Action()   = {e.getMessage()}";
        log.debug(msg);
    }   
   }

function getProduct(kcode: javafx.scene.input.KeyCode,iname:String) {        
        var itemName: String[] = [];
        listProductName.visible = true;
        itemName = comObj.getListItems(iname,"","DRUDOSAGE").toArray() as String[]; // GetNameClass.ProductName(iname);
        listProductName.items = itemName;
        var size =  listProductName.items.size();
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
                    txtMRP.text = barcodePrinterModel.getProductMrp();
                };
        listProductName.onMouseClicked = function(e) {
                    txtProductName.text = "{listProductName.selectedItem}";
                    listProductName.visible = false;
                    txtLabelno.requestFocus();
                    getProductCode();
                    txtMRP.text = barcodePrinterModel.getProductMrp();
                }                
    if(size<12) {
            listH=size*25;
            if(size>5)
                listH-=5;
            if(size==0)
                listProductName.visible=false;
         }else{
             listH = 295;
         }
    }
    
    function getInteger(val:String):Integer{
        var intVal :Integer=0;
        try{
            intVal=Integer.parseInt("{val}");
        }catch(e:NumberFormatException){}
        return intVal;
    }

    public function getLabelPrintConfig(bpm:BarcodePrinterModel) : String[] {
        var labelPrintConfig : String[] ="select,1,0,0,0,0,0,0".split(",");
	var flag :Boolean[] =[false,true];
        try{
            labelPrintConfig[0]="{bpm.getPrinter()}";
            labelPrintConfig[1]="{bpm.getPrintSet()}";
            labelPrintConfig[2]="{Arrays.asList(flag).indexOf(bpm.getEnableShopName())}";
            labelPrintConfig[3]="{Arrays.asList(flag).indexOf(bpm.getEnableProductName())}";
            labelPrintConfig[4]="{Arrays.asList(flag).indexOf(bpm.getEnableProductMrp())}";
            labelPrintConfig[5]="{Arrays.asList(flag).indexOf(bpm.getEnableSellingPrice())}";
            labelPrintConfig[6]="{Arrays.asList(flag).indexOf(bpm.getEnableProductPacked())}";
            labelPrintConfig[7]="{Arrays.asList(flag).indexOf(bpm.getEnableBestBeforeOn())}";
        }catch(e:Exception){
            log.debug("ReportBarcodePrint getLabelPrintConfig:{e.getMessage()}");
        }
        return labelPrintConfig;
    }

    public function getLabelPrintConfig(labelPrintConfig:String[] ) : BarcodePrinterModel {
        var bpm : BarcodePrinterModel = new BarcodePrinterModel();
        var flag :Boolean[] =[false,true];
        if(labelPrintConfig!=null){
            if(labelPrintConfig.size()>0){ bpm.setPrinter(labelPrintConfig[0]); }
            if(labelPrintConfig.size()>1){ bpm.setPrintSet(getInteger(labelPrintConfig[1])); }
            if(labelPrintConfig.size()>2){ bpm.setEnableShopName( flag[getInteger(labelPrintConfig[2])] ); }
            if(labelPrintConfig.size()>3){ bpm.setEnableProductName(flag[ getInteger(labelPrintConfig[3])] ); }
            if(labelPrintConfig.size()>4){ bpm.setEnableProductMrp(flag[ getInteger(labelPrintConfig[4])] ); }
            if(labelPrintConfig.size()>5){ bpm.setEnableSellingPrice(flag[ getInteger(labelPrintConfig[5])] ); }
            if(labelPrintConfig.size()>6){ bpm.setEnableProductPacked(flag[ getInteger(labelPrintConfig[6])] ); }
            if(labelPrintConfig.size()>7){ bpm.setEnableBestBeforeOn(flag[ getInteger(labelPrintConfig[7])] ); }
        }        
        return bpm;
    }

    function  getLabelPrintConfig() : BarcodePrinterModel {
        var bpm:BarcodePrinterModel = null;
        try{
            var config : LabelPrintConfig= new LabelPrintConfig();
            var s:String[]  = config.getLabelPrintConfig().split(",");
            bpm=getLabelPrintConfig(s);            
        }catch(e:Exception ){
            e.printStackTrace();
        }
        return bpm;
    }


    function setConfig():Void {        
        var bpm: BarcodePrinterModel = getLabelPrintConfig();
        try{
            if(bpm.getPrinter()!=null and
                bpm.getPrinter().length()>0 and
                not bpm.getPrinter().equalsIgnoreCase("null") and
                bpm.getPrinter()!="select"
              ){
                var prtr:String[] = [""];
                prtr[0]=bpm.getPrinter();
                chboxPrinter.items=Arrays.asList(prtr).toArray();
                chboxPrinter.select(Arrays.asList(bpm.getPrinter()).indexOf("{bpm.getPrinter()}"));
            } else {
                loadPrinters();
            }
            txtLabelsPerRow.text="{bpm.getPrintSet()}";
            chkShopName.selected=bpm.getEnableShopName();
            chkProduct.selected=bpm.getEnableProductName();
            chkMrp.selected=bpm.getEnableProductMrp();
            if(chkMrp.selected) {
                 lblMRP.visible = true;
                 txtMRP.visible = true;
            }
            else {
                 lblMRP.visible = false;
                 txtMRP.visible = false;
            }

            chkSellPrice.selected=bpm.getEnableSellingPrice();
            chkPkdOn.selected=bpm.getEnableProductPacked();
            chkBestBFR.selected=bpm.getEnableBestBeforeOn();
        }catch(e:Exception){
            e.printStackTrace();
        }
    }
    
    function loadPrinters():Void {
        var ps : PrintServices = new PrintServices();
        chboxPrinter.items=ps.listPrinter().toArray();        
    }

    public function Startup() {
        setConfig();
        txtProductName.requestFocus();
        fxCalendar.visible = false;
        FromPanel.content = [fxCalendar,];
        imgPreview.visible = true;
        imgPreview.image = imageSingleA4;
        rdosinglePrint.selected = true;
        rdopaper1.selected = true;
    }
}
