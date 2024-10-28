package com.vanuston.medeil.ui;

import javafx.scene.layout.LayoutInfo;
import javafx.scene.image.Image;
import javafx.ext.swing.SwingComponent;
import javax.swing.JComponent;
import javafx.scene.input.KeyCode;
import java.awt.Dimension;
import java.text.SimpleDateFormat;
import java.lang.Class;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Value;
import com.vanuston.medeil.ui.calendar.theme.Theme;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import com.vanuston.medeil.util.KeyRegistry;
import java.awt.event.KeyAdapter;
import javafx.scene.image.ImageView;
import javafx.animation.Timeline;
import com.vanuston.medeil.util.CommonDeclare;
import java.lang.Exception;

import com.vanuston.medeil.uitables.CounterSalesTable;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.model.SalesModel;
import com.vanuston.medeil.model.MsgReturnModel;
//import java.util.List;
//import java.util.ArrayList;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.implementation.Sales;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.util.NumberUtils;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperPrintManager;
import java.io.File;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;
import com.vanuston.medeil.util.Validation;
   def DocInfo = DoctorInformation {};
   def CustInfo = CustomerInformation {};
public class SalesCounterBill {

    var log: Logger = Logger.getLogger(SalesCounterBill.class, "Sales");
    var alertSt: Integer = 0;
    public var timer: Timeline;
  
    public var rndVal: String = "0.00";
    var netAmt: Double = 0.0;

    var CounterSalesTableObj = new CounterSalesTable();
    var listH = 0.0;
    var vatAmt;
    var commonController : CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    
    var apBillDate = DateUtils.now("dd-MM-yyyy") on replace {
    getAutoVal = commonController.getAutoIncrement(apBillDate, "AccountSales"); };
    var dateFlag: Boolean = false;
    var fxCalendar = FXCalendar {
                theme: Theme {};
            };
            var getAutoVal: String;

    var tinNo = bind CommonDeclare.tin;
    var rowNo = 14;
    var colNames: Object[] = ["S.No.", "Code", "Particulars", "Form.", "Qty.", "Batch No.", " Expiry", "Price", "MRP", "Disc %","Margin", "VAT %", "Amount", "Item Code"];
    var colType: Class[] = [java.lang.Integer.class, java.lang.String.class, java.lang.String.class,
                java.lang.String.class, java.lang.Integer.class, java.lang.String.class,
                java.lang.String.class, java.lang.Double.class, java.lang.Double.class,java.lang.Double.class,
                java.lang.Double.class, java.lang.Double.class, java.lang.Double.class, java.lang.String.class];
    var colEditable: Boolean[] = [false, true, false, false, true, false, false, true, false, true, false, false, false, false];
    var colWidth: Integer[] = [35, 60, 125, 60, 40, 66, 56, 45, 41, 40, 40, 40, 80, 5];
    
    var accTable: JComponent = CounterSalesTableObj.createTable(rowNo, colNames, colType, colEditable, colWidth, "CounterSales");
    var salesAccountTable = SwingComponent.wrap(CounterSalesTableObj.getScrollTable(accTable));
    def MessageBox = MessageBox {};
    var alerCnt1 = 0;
    var itNAM1: String = "";
    var itemDis: String = "";
    var expAlert = CounterSalesTableObj.alert1;
    var panelW = bind CommonDeclare.panelFormW on replace {
        listSalesAccPay.visible = false;
    }
    var imgRotate = bind listSalesAccPay.visible on replace {
        if (not imgRotate) {
            imgDName.rotate = 0.0;
            imgPName.rotate = 0.0;
        }
    }
    var panelH = bind CommonDeclare.panelFormH;
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var C1LX = bind CommonDeclare.Column1LX;
    var C2LX = bind CommonDeclare.Column2LX;
    var C3LX = bind CommonDeclare.Column3LX;
    var C4LX = bind CommonDeclare.Column4LX;
    var botton1LX = bind CommonDeclare.botton2LX;
    var botton2LX = bind CommonDeclare.botton3LX;
    var botton3LX = bind CommonDeclare.botton33LX;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    var bottonW = bind CommonDeclare.bottonW + 15;
    var bottonH = bind CommonDeclare.bottonH;
    var rectbutton1LX = bind CommonDeclare.rectbutton1LX;
    var rectbutton2LX = bind CommonDeclare.rectbutton2LX;
    var rectbuttonLY = bind CommonDeclare.rectbuttonLY;
    var seperatorW = bind CommonDeclare.seperatorW;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;
    var Type4TextboxW = bind CommonDeclare.Type4TextboxW + 30;
    var Type5TextboxW = bind CommonDeclare.Type4TextboxW;
    var ImageCalenderLX = bind C4LX + Type3TextboxW + 2;
    var panelCalenderLX = bind C4LX + 100;
    var imgClickdownLX = bind C2LX + Type1TextboxW - 2;
    var imgClickdown1LX = bind C4LX + Type1TextboxW - 2;
    var imgClickdownW = 20.5;
    var imgClickdownH = 20.5;
    var imgClickdownLY = 55;
    var rectbuttonLX = bind 85.13341804 * panelW / 100;
    var ListLX = 0.0;
    var ListLY = 0.0;
     var LabelTINLX = bind 82.23888183 * panelW / 100;
    var AmtPanelLX = bind BottomC4LX + Type4TextboxW + 20;
    var AmtTextW = bind panelW - AmtPanelLX - 30;
    var TableW = bind (95.29860229 * panelW) / 100 on replace {
        changeTableSize(TableW);
    };
    var TableH = 320.0;
    var panelTableLX = bind (panelW - TableW) / 2;
    var panelTableLY = 85.0;
    var rectRemoveRowLX = bind ((panelW + TableW) / 2) - 120;
    var rectRemoveRowLY = bind (panelTableLY + TableH);
    function changeTableSize(i: Integer): Void {
        salesAccountTable.getJComponent().setPreferredSize(new Dimension(i, TableH));
    }

    var BottomC1LX = bind CommonDeclare.BottomC1LX;
    var BottomC2LX = bind CommonDeclare.BottomC2LX;
    var BottomC3LX = bind CommonDeclare.BottomC3LX-30;
    var BottomC4LX = bind CommonDeclare.BottomC4LX-30;
    var balance = "0.00";
    def SalesPlugin=SalesPlugin1{};
    var salesController : Sales = RegistryFactory.getClientStub (RegistryConstants.Sales) as Sales;
    var empCode:String[] = commonController.getEmployeeCode("").toArray() as String[];
    var valid1:Validation;
    var settingsController : com.vanuston.medeil.implementation.Settings =  RegistryFactory.getClientStub(RegistryConstants.Configuration) as com.vanuston.medeil.implementation.Settings;

    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def panelDocInfo: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
    }
    
    public-read def panelCustInfo: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
    }
    
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 0.25
        layoutX: 0.0
        layoutY: 0.0
        width: bind panelW
        height: 32.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imageView2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnSalesOnly: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnSalesOnly: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton2LX
        layoutInfo: __layoutInfo_btnSalesOnly
        graphic: imageView2
        text: "Button"
    }
    
    public-read def imageView3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def panelTable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelTableLX
        layoutY: bind panelTableLY+15
        blocksMouse: true
    }
    
    public-read def rectTableBorder: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind panelTableLX
        layoutY: bind panelTableLY+15
        styleClass: "rectTableBorder"
        width: bind TableW
        height: bind TableH
    }
    
    public-read def APDatePicker: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind LabelTINLX+Type3TextboxW+14
        layoutY: 50.0
    }
    
    public-read def Employee_ID: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX
        layoutY: 0.0
        text: "Label"
    }
    
    public-read def cboEmp_code: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: bind C4LX
        layoutY: -5.0
        items: bind empCode
    }
    
    public-read def rectButton: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind rectbuttonLX
        layoutY: 531.0
        width: 100.0
        height: 50.0
    }
    
    def __layoutInfo_lblBillHistory: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblBillHistory: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind rectbuttonLX
        layoutY: 532.0
        layoutInfo: __layoutInfo_lblBillHistory
        text: "Label"
    }
    
    public-read def rectRemoveRow: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind rectRemoveRowLX
        layoutY: bind rectRemoveRowLY+20
        width: 120.0
        height: 50.0
    }
    
    def __layoutInfo_labelRemoveRow: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def labelRemoveRow: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind rectRemoveRowLX
        layoutY: bind rectRemoveRowLY+20
        layoutInfo: __layoutInfo_labelRemoveRow
        text: "Remove Row  [F12]"
    }
    
    public-read def label15: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 404.0
        layoutY: 499.0
        text: "Label"
    }
    
    def __layoutInfo_listSalesAccPay: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
        height: bind listH
    }
    public-read def listSalesAccPay: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutInfo: __layoutInfo_listSalesAccPay
        focusTraversable: true
        items: null
    }
    
    def __layoutInfo_listView: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 733.0
        height: 218.0
    }
    public-read def listView: javafx.scene.control.ListView = javafx.scene.control.ListView {
        layoutX: 50.0
        layoutY: 145.0
        layoutInfo: __layoutInfo_listView
        focusTraversable: true
        items: null
    }
    
    public-read def lblTotalMargin: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX
        text: "Label"
    }
    
    def __layoutInfo_txtSalesAPVAT12: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSalesAPVAT12: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 467.0
        layoutY: 493.0
        layoutInfo: __layoutInfo_txtSalesAPVAT12
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtSalesAPRoundAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSalesAPRoundAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtSalesAPRoundAmt
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def label12: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def lblBalanceDue: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
    }
    
    public-read def panelBalanceDue: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind AmtPanelLX
        content: [ label12, lblBalanceDue, ]
    }
    
    public-read def panelCalender: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelCalenderLX
        layoutY: 98.0
    }
    
    public-read def panelplugin: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
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
    
    def __layoutInfo_txtSalesAPBalAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSalesAPBalAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 678.0
        layoutY: 444.0
        layoutInfo: __layoutInfo_txtSalesAPBalAmt
        text: "100.00"
        font: Arial_12
    }
    
    def __layoutInfo_txtSalesAPSubTotal: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSalesAPSubTotal: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 678.0
        layoutY: 398.0
        layoutInfo: __layoutInfo_txtSalesAPSubTotal
        text: "100.00"
        font: Arial_12
    }
    
    def __layoutInfo_txtSalesAPNetPaid: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSalesAPNetPaid: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 678.0
        layoutY: 421.0
        layoutInfo: __layoutInfo_txtSalesAPNetPaid
        text: "100.00"
        font: Arial_12
    }
    
    public-read def panelTxtColumn2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind BottomC4LX+75
        layoutY: 499.0
        content: [ txtSalesAPNetPaid, txtSalesAPSubTotal, txtSalesAPBalAmt, txtSalesAPRoundAmt, ]
    }
    
    def __layoutInfo_txtSalesAPVAT4: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSalesAPVAT4: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 678.0
        layoutY: 467.0
        layoutInfo: __layoutInfo_txtSalesAPVAT4
        text: "100.00"
        font: Arial_12
    }
    
    def __layoutInfo_txtSalesAPDiscount: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSalesAPDiscount: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 678.0
        layoutY: 490.0
        layoutInfo: __layoutInfo_txtSalesAPDiscount
        text: "100.00"
        font: Arial_12
    }
    
    def __layoutInfo_lblSalesAPTotalQty: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type5TextboxW
    }
    public-read def lblSalesAPTotalQty: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 135.0
        layoutY: 419.0
        layoutInfo: __layoutInfo_lblSalesAPTotalQty
        font: Arial_12
    }
    
    def __layoutInfo_lblSalesAPTotalItm: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type5TextboxW
    }
    public-read def lblSalesAPTotalItm: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 135.0
        layoutY: 392.0
        layoutInfo: __layoutInfo_lblSalesAPTotalItm
        font: Arial_12
    }
    
    public-read def panelTxtColumn1: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind BottomC2LX
        layoutY: 142.0
        content: [ lblSalesAPTotalItm, lblSalesAPTotalQty, txtSalesAPDiscount, txtSalesAPVAT4, txtSalesAPVAT12, ]
    }
    
    def __layoutInfo_lblSalesAPTIN: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def lblSalesAPTIN: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind LabelTINLX+45
        layoutY: 75.0
        layoutInfo: __layoutInfo_lblSalesAPTIN
        styleClass: "Borderless-text-box"
        text: bind tinNo
        font: Arial_12
    }
    
    def __layoutInfo_txtSalesAPDName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtSalesAPDName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 121.0
        layoutInfo: __layoutInfo_txtSalesAPDName
        promptText: "Enter Doctor Name"
        font: Arial_12
    }
    
    def __layoutInfo_txtSalesAPPName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
        hfill: false
    }
    public-read def txtSalesAPPName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 98.0
        layoutInfo: __layoutInfo_txtSalesAPPName
        style: ""
        styleClass: "text-box"
        effect: null
        text: ""
        promptText: "Enter Customer Name"
        font: Arial_12
    }
    
    def __layoutInfo_txtSalesAPDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtSalesAPDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind LabelTINLX+35
        layoutY: 75.0
        layoutInfo: __layoutInfo_txtSalesAPDate
        text: bind apBillDate
        font: Arial_12
    }
    
    def __layoutInfo_lblSalesAPBillNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def lblSalesAPBillNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 75.0
        layoutInfo: __layoutInfo_lblSalesAPBillNo
        styleClass: "Borderless-text-box"
        text: bind getAutoVal
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
    
    def __layoutInfo_btnSalesAPReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnSalesAPReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton3LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnSalesAPReset
        effect: reflectionEffect
        graphic: imageView3
        text: "Reset [F5]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnSalesAPSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnSalesAPSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnSalesAPSave
        translateX: 0.0
        effect: reflectionEffect
        graphic: imageView
        text: "Print  [F2]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    public-read def panelButtons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: bind panelButtonsLY
        content: [ btnSalesAPSave, btnSalesOnly, btnSalesAPReset, ]
    }
    
    public-read def toggleGroup: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def Arial_25: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 25.0
    }
    
    public-read def DarkGray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.2
        blue: 0.2
    }
    
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 600.0
        layoutY: 490.0
        text: "Balance"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 600.0
        layoutY: 398.0
        text: "subtotal"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label13: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 600.0
        layoutY: 467.0
        text: "Amt. Paid"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def panelLblColumn2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind BottomC3LX+50
        layoutY: 505.0
        content: [ label13, label4, label7, label3, ]
    }
    
    public-read def label1: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 600.0
        layoutY: 444.0
        text: "VAT"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label6: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 600.0
        layoutY: 421.0
        text: "discount"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label11: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 44.0
        layoutY: 421.0
        text: "Total Quantity"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label10: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 44.0
        layoutY: 398.0
        text: "Total Products"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def panelLblColumn1: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind BottomC1LX
        layoutY: 43.0
        content: [ label10, label11, label6, label1, label15, ]
    }
    
    public-read def labelTIN: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind LabelTINLX
        layoutY: 75.0
        text: "TIN No"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind LabelTINLX-10
        layoutY: 75.0
        text: "Date"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label8: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 121.0
        text: "Doctor Name "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelCustomer_Name_: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 98.0
        styleClass: "label"
        text: "Customer Name "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelBill_No: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 75.0
        text: "Bill No"
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
        layoutX: 560.0
        layoutY: 1.0
        layoutInfo: __layoutInfo_label
        styleClass: "labelFormHeading"
        effect: lightingEffect
        text: "Sales - Cash Bill"
        font: Arial_25
    }
    
    public-read def Orange: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
        blue: 0.0
    }
    
    public-read def Arial_30: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 30.0
    }
    
    public-read def Gray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.4
        green: 0.4
        blue: 0.4
    }
    
    def __layoutInfo_txtSalesAPToalAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind AmtTextW
    }
    public-read def txtSalesAPToalAmt: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 253.0
        layoutY: 611.0
        layoutInfo: __layoutInfo_txtSalesAPToalAmt
        graphic: label2
        text: "Total Amount"
        font: Arial_20
        textFill: Gray
    }
    
    public-read def panelTxtColumn4: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind AmtPanelLX-100
        layoutY: 28.0
        content: [ txtSalesAPToalAmt, ]
    }
    
    public-read def Yellow: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.95
        green: 0.94
        blue: 0.86
    }
    
    public-read def linearGradientHeader: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#FFFFFF") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#000000") }, ]
    }
    
    public-read def imagePrint: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Printer.png"
    }
    
    public-read def imageSave: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Save1.png"
    }
    
    public-read def imageView4: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageSave
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnCustDocSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnCustDocSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX
        layoutY: bind panelButtonsLY
        layoutInfo: __layoutInfo_btnCustDocSave
        effect: reflectionEffect
        graphic: imageView4
        text: "Save [F3]"
        font: Arial_Bold_14
        action: btnCustDocSaveAction
    }
    
    public-read def imageReset: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Reset.png"
    }
    
    public-read def Arial_Bold_65: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 65.0
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imgPName: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind imgClickdownLX
        image: image
        fitWidth: bind imgClickdownW
        fitHeight: bind imgClickdownH+6
    }
    
    public-read def image2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imgDName: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind imgClickdown1LX
        onMouseClicked: imgDNameOnMouseClickedAtShown
        image: image2
        fitWidth: bind imgClickdownW
        fitHeight: bind imgClickdownH+6
    }
    
    public-read def panelTopSection: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ labelBill_No, labelCustomer_Name_, label8, lblSalesAPBillNo, txtSalesAPDate, txtSalesAPPName, txtSalesAPDName, imgPName, label9, APDatePicker, imgDName, labelTIN, lblSalesAPTIN, Employee_ID, cboEmp_code, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        content: [ rectangle, rectHeader, label, panelButtons, panelTable, rectTableBorder, panelTopSection, rectButton, lblBillHistory, rectRemoveRow, labelRemoveRow, panelLblColumn1, listSalesAccPay, listView, lblTotalMargin, panelTxtColumn1, panelLblColumn2, panelTxtColumn2, panelTxtColumn4, panelBalanceDue, panelCalender, panelplugin, panelAlert, ]
    }
    
    public-read def imageBack: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/arrow_Left.png"
    }
    
    public-read def imageView5: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageBack
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnSalesBack: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnSalesBack: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton2LX
        layoutY: bind panelButtonsLY
        layoutInfo: __layoutInfo_btnSalesBack
        effect: reflectionEffect
        graphic: imageView5
        text: "Back To Sales"
        font: Arial_Bold_14
        action: btnSalesBackAction
    }
    
    public-read def panelBack: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        disable: false
        content: [ btnCustDocSave, btnSalesBack, ]
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "Shown", "DoctorInfo", "CustomerInfo", ]
        actual: 0
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            panelDocInfo.visible = false;
                            panelCustInfo.visible = false;
                            btnCustDocSave.text = "Save [F3]";
                            panelBack.visible = false;
                            panelBack.disable = false;
                            rectHeader.visible = true;
                            rectHeader.styleClass = "rectFormHeader";
                            rectHeader.fill = linearGradientHeader;
                            label.layoutX = 0.0;
                            label.text = "Counter Bill - ctrl+C";
                            label.hpos = javafx.geometry.HPos.CENTER;
                            label.textFill = javafx.scene.paint.Color.BLACK;
                            imageView.visible = true;
                            imageView.image = imagePrint;
                            btnSalesAPSave.layoutY = 0.0;
                            btnSalesAPSave.onKeyPressed = btnSalesAPSaveOnKeyPressedAtShown;
                            btnSalesAPSave.onKeyReleased = btnSalesAPSaveOnKeyReleasedAtShown;
                            btnSalesAPSave.text = "Print [F2]";
                            btnSalesAPSave.font = Arial_Bold_16;
                            btnSalesAPSave.action = btnSalesAPSaveActionAtShown;
                            imageView2.visible = true;
                            imageView2.image = imageSave;
                            btnSalesOnly.visible = true;
                            btnSalesOnly.layoutY = 0.0;
                            btnSalesOnly.onKeyPressed = btnSalesOnlyOnKeyPressedAtShown;
                            btnSalesOnly.effect = reflectionEffect;
                            btnSalesOnly.text = "Save [F3]";
                            btnSalesOnly.font = Arial_Bold_16;
                            btnSalesOnly.action = btnSalesOnlyActionAtShown;
                            imageView3.visible = true;
                            imageView3.image = imageReset;
                            btnSalesAPReset.visible = false;
                            btnSalesAPReset.layoutY = 0.0;
                            btnSalesAPReset.onKeyPressed = btnSalesAPResetOnKeyPressedAtShown;
                            btnSalesAPReset.text = "Reset [F5]";
                            btnSalesAPReset.action = btnSalesAPResetActionAtShown;
                            panelButtons.visible = true;
                            panelTable.visible = true;
                            rectTableBorder.visible = true;
                            labelBill_No.visible = true;
                            labelBill_No.layoutY = 30.0;
                            labelBill_No.text = "Bill No.";
                            labelBill_No.font = Arial_16;
                            labelCustomer_Name_.visible = true;
                            labelCustomer_Name_.layoutY = 59.0;
                            labelCustomer_Name_.font = Arial_16;
                            label8.visible = true;
                            label8.layoutY = 59.0;
                            label8.font = Arial_16;
                            lblSalesAPBillNo.visible = true;
                            lblSalesAPBillNo.layoutY = 30.0;
                            lblSalesAPBillNo.onKeyPressed = lblSalesAPBillNoOnKeyPressedAtShown;
                            lblSalesAPBillNo.onKeyReleased = lblSalesAPBillNoOnKeyReleasedAtShown;
                            lblSalesAPBillNo.font = Arial_Bold_16;
                            txtSalesAPDate.visible = true;
                            txtSalesAPDate.layoutY = 30.0;
                            txtSalesAPDate.onKeyPressed = txtSalesAPDateOnKeyPressedAtShown;
                            txtSalesAPDate.editable = false;
                            txtSalesAPDate.font = Arial_16;
                            txtSalesAPPName.visible = true;
                            txtSalesAPPName.layoutY = 59.0;
                            txtSalesAPPName.onKeyPressed = txtSalesAPPNameOnKeyPressedAtShown;
                            txtSalesAPPName.onKeyReleased = txtSalesAPPNameOnKeyReleasedAtShown;
                            txtSalesAPPName.font = Arial_16;
                            txtSalesAPDName.visible = true;
                            txtSalesAPDName.layoutY = 59.0;
                            txtSalesAPDName.onKeyPressed = txtSalesAPDNameOnKeyPressedAtShown;
                            txtSalesAPDName.onKeyReleased = txtSalesAPDNameOnKeyReleasedAtShown;
                            txtSalesAPDName.font = Arial_16;
                            imgPName.visible = true;
                            imgPName.layoutY = 59.0;
                            imgPName.onMouseClicked = imgPNameOnMouseClickedAtShown;
                            imgPName.scaleX = 1.0;
                            imgPName.scaleY = 1.0;
                            label9.visible = true;
                            label9.layoutY = 30.0;
                            label9.font = Arial_16;
                            APDatePicker.visible = true;
                            APDatePicker.layoutY = 30.0;
                            APDatePicker.onMouseClicked = APDatePickerOnMouseClickedAtShown;
                            APDatePicker.image = Image {url: "{__DIR__}images/Calender.png"};;
                            APDatePicker.fitWidth = 20.0;
                            APDatePicker.fitHeight = 25.0;
                            imgDName.visible = true;
                            imgDName.layoutY = 59.0;
                            imgDName.scaleX = 1.0;
                            labelTIN.visible = false;
                            labelTIN.managed = true;
                            labelTIN.layoutY = 30.0;
                            labelTIN.text = "TIN No.";
                            labelTIN.font = Arial_12;
                            lblSalesAPTIN.visible = false;
                            lblSalesAPTIN.layoutY = 30.0;
                            lblSalesAPTIN.editable = false;
                            lblSalesAPTIN.font = Arial_Bold_14;
                            Employee_ID.visible = true;
                            Employee_ID.layoutY = 30.0;
                            Employee_ID.text = "Employee ID";
                            Employee_ID.font = Arial_16;
                            cboEmp_code.visible = true;
                            cboEmp_code.layoutY = 30.0;
                            cboEmp_code.onKeyPressed = cboEmp_codeOnKeyPressedAtShown;
                            cboEmp_code.onMouseClicked = cboEmp_codeOnMouseClickedAtShown;
                            panelTopSection.visible = true;
                            panelTopSection.layoutY = 5.0;
                            rectButton.visible = false;
                            rectButton.layoutY = 520.0;
                            rectButton.styleClass = "rectbutton";
                            rectButton.onMouseClicked = rectButtonOnMouseClickedAtShown;
                            rectButton.fill = Yellow;
                            rectButton.stroke = DarkGray;
                            rectButton.strokeWidth = 1.0;
                            rectButton.width = 100.0;
                            rectButton.height = 20.0;
                            rectButton.arcWidth = 10.0;
                            rectButton.arcHeight = 10.0;
                            lblBillHistory.visible = false;
                            lblBillHistory.layoutY = 522.0;
                            __layoutInfo_lblBillHistory.width = 100.0;
                            lblBillHistory.text = "Bill History >>";
                            lblBillHistory.font = Arial_Bold_12;
                            lblBillHistory.hpos = javafx.geometry.HPos.CENTER;
                            lblBillHistory.textFill = DarkGray;
                            rectRemoveRow.visible = true;
                            rectRemoveRow.styleClass = "rectbutton";
                            rectRemoveRow.onKeyPressed = rectRemoveRowOnKeyPressedAtShown;
                            rectRemoveRow.onMouseClicked = rectRemoveRowOnMouseClickedAtShown;
                            rectRemoveRow.fill = Yellow;
                            rectRemoveRow.stroke = DarkGray;
                            rectRemoveRow.strokeWidth = 1.0;
                            rectRemoveRow.height = 20.0;
                            rectRemoveRow.arcWidth = 10.0;
                            rectRemoveRow.arcHeight = 10.0;
                            labelRemoveRow.visible = true;
                            __layoutInfo_labelRemoveRow.width = 120.0;
                            __layoutInfo_labelRemoveRow.height = 20.0;
                            labelRemoveRow.font = Arial_Bold_12;
                            labelRemoveRow.hpos = javafx.geometry.HPos.CENTER;
                            labelRemoveRow.textFill = DarkGray;
                            label10.layoutX = 0.0;
                            label10.layoutY = 0.0;
                            label10.text = "Products";
                            label10.font = Arial_16;
                            label11.layoutX = 0.0;
                            label11.layoutY = 25.0;
                            label11.text = "Quantity";
                            label11.font = Arial_16;
                            label6.visible = true;
                            label6.layoutX = 0.0;
                            label6.layoutY = 75.0;
                            label6.text = "Discount";
                            label6.font = Arial_16;
                            label1.visible = true;
                            label1.layoutX = 0.0;
                            label1.layoutY = 50.0;
                            label1.text = "Total VAT";
                            label1.font = Arial_16;
                            label15.visible = false;
                            label15.layoutX = 0.0;
                            label15.layoutY = 100.0;
                            label15.text = "VAT 12 .5%";
                            label15.font = Arial_12;
                            label15.textFill = DarkGray;
                            panelLblColumn1.visible = true;
                            panelLblColumn1.managed = true;
                            panelLblColumn1.layoutY = 430.0;
                            listSalesAccPay.visible = false;
                            listSalesAccPay.onKeyPressed = listSalesAccPayOnKeyPressedAtShown;
                            listView.visible = false;
                            listView.layoutX = 20.0;
                            listView.layoutY = 85.0;
                            __layoutInfo_listView.width = 750.0;
                            __layoutInfo_listView.height = 350.0;
                            listView.items = null;
                            lblTotalMargin.visible = true;
                            lblTotalMargin.layoutY = 440.0;
                            lblTotalMargin.text = "";
                            lblTotalMargin.font = Arial_Bold_16;
                            lblTotalMargin.textFill = javafx.scene.paint.Color.BLACK;
                            lblSalesAPTotalItm.layoutX = 0.0;
                            lblSalesAPTotalItm.layoutY = 0.0;
                            lblSalesAPTotalItm.onKeyReleased = lblSalesAPTotalItmOnKeyReleasedAtShown;
                            lblSalesAPTotalItm.selectOnFocus = false;
                            lblSalesAPTotalItm.editable = false;
                            lblSalesAPTotalItm.font = Arial_16;
                            lblSalesAPTotalQty.layoutX = 0.0;
                            lblSalesAPTotalQty.layoutY = 25.0;
                            lblSalesAPTotalQty.selectOnFocus = false;
                            lblSalesAPTotalQty.editable = false;
                            lblSalesAPTotalQty.font = Arial_16;
                            txtSalesAPDiscount.visible = true;
                            txtSalesAPDiscount.layoutX = 0.0;
                            txtSalesAPDiscount.layoutY = 75.0;
                            txtSalesAPDiscount.onKeyPressed = txtSalesAPDiscountOnKeyPressedAtShown;
                            txtSalesAPDiscount.onKeyTyped = txtSalesAPDiscountOnKeyTypedAtShown;
                            txtSalesAPDiscount.text = "";
                            txtSalesAPDiscount.promptText = "0.00";
                            txtSalesAPDiscount.selectOnFocus = false;
                            txtSalesAPDiscount.editable = true;
                            txtSalesAPDiscount.font = Arial_16;
                            txtSalesAPVAT4.visible = true;
                            txtSalesAPVAT4.layoutX = 0.0;
                            txtSalesAPVAT4.layoutY = 50.0;
                            txtSalesAPVAT4.text = "";
                            txtSalesAPVAT4.promptText = "0.00";
                            txtSalesAPVAT4.selectOnFocus = false;
                            txtSalesAPVAT4.editable = false;
                            txtSalesAPVAT4.font = Arial_16;
                            txtSalesAPVAT12.visible = false;
                            txtSalesAPVAT12.layoutX = 0.0;
                            txtSalesAPVAT12.layoutY = 100.0;
                            txtSalesAPVAT12.promptText = "0.00";
                            txtSalesAPVAT12.selectOnFocus = false;
                            txtSalesAPVAT12.editable = false;
                            txtSalesAPVAT12.font = Arial_12;
                            panelTxtColumn1.visible = true;
                            panelTxtColumn1.layoutY = 430.0;
                            label13.layoutX = 0.0;
                            label13.layoutY = 0.0;
                            label13.font = Arial_16;
                            label4.layoutX = 0.0;
                            label4.layoutY = 25.0;
                            label4.text = "Subtotal";
                            label4.font = Arial_16;
                            label7.visible = false;
                            label7.layoutX = 0.0;
                            label7.layoutY = 50.0;
                            label3.visible = true;
                            label3.layoutY = 50.0;
                            label3.text = "Rounded Off";
                            label3.font = Arial_16;
                            label3.textFill = DarkGray;
                            panelLblColumn2.visible = true;
                            panelLblColumn2.layoutY = 430.0;
                            txtSalesAPNetPaid.layoutX = 0.0;
                            txtSalesAPNetPaid.layoutY = 0.0;
                            txtSalesAPNetPaid.onKeyPressed = txtSalesAPNetPaidOnKeyPressedAtShown;
                            txtSalesAPNetPaid.onKeyReleased = txtSalesAPNetPaidOnKeyReleasedAtShown;
                            txtSalesAPNetPaid.text = "";
                            txtSalesAPNetPaid.promptText = "0.00";
                            txtSalesAPNetPaid.editable = false;
                            txtSalesAPNetPaid.font = Arial_16;
                            txtSalesAPSubTotal.layoutX = 0.0;
                            txtSalesAPSubTotal.layoutY = 25.0;
                            txtSalesAPSubTotal.onKeyPressed = txtSalesAPSubTotalOnKeyPressedAtShown;
                            txtSalesAPSubTotal.text = "";
                            txtSalesAPSubTotal.promptText = "0.00";
                            txtSalesAPSubTotal.selectOnFocus = false;
                            txtSalesAPSubTotal.editable = false;
                            txtSalesAPSubTotal.font = Arial_16;
                            txtSalesAPBalAmt.visible = false;
                            txtSalesAPBalAmt.disable = false;
                            txtSalesAPBalAmt.layoutX = 0.0;
                            txtSalesAPBalAmt.layoutY = 50.0;
                            txtSalesAPBalAmt.text = "";
                            txtSalesAPBalAmt.promptText = "0.00";
                            txtSalesAPBalAmt.selectOnFocus = false;
                            txtSalesAPBalAmt.editable = false;
                            txtSalesAPRoundAmt.visible = true;
                            txtSalesAPRoundAmt.layoutY = 50.0;
                            txtSalesAPRoundAmt.onKeyPressed = txtSalesAPRoundAmtOnKeyPressedAtShown;
                            txtSalesAPRoundAmt.onKeyTyped = txtSalesAPRoundAmtOnKeyTypedAtShown;
                            txtSalesAPRoundAmt.font = Arial_16;
                            panelTxtColumn2.visible = true;
                            panelTxtColumn2.layoutY = 430.0;
                            label2.visible = true;
                            label2.text = "Total";
                            label2.font = Arial_20;
                            label2.textFill = Gray;
                            txtSalesAPToalAmt.layoutX = 0.0;
                            txtSalesAPToalAmt.layoutY = 0.0;
                            txtSalesAPToalAmt.text = "0.00";
                            txtSalesAPToalAmt.font = Arial_Bold_65;
                            txtSalesAPToalAmt.textAlignment = javafx.scene.text.TextAlignment.RIGHT;
                            txtSalesAPToalAmt.hpos = javafx.geometry.HPos.RIGHT;
                            txtSalesAPToalAmt.textFill = DarkGray;
                            panelTxtColumn4.visible = true;
                            panelTxtColumn4.layoutY = 485.0;
                            label12.visible = false;
                            label12.disable = false;
                            label12.layoutY = 2.0;
                            label12.text = "Balance Due :";
                            label12.font = Arial_Bold_14;
                            label12.textFill = DarkGray;
                            lblBalanceDue.visible = false;
                            lblBalanceDue.layoutX = 100.0;
                            lblBalanceDue.font = Arial_Bold_20;
                            lblBalanceDue.textFill = Orange;
                            panelBalanceDue.visible = true;
                            panelBalanceDue.layoutY = 380.0;
                            panelCalender.visible = true;
                            panelCalender.layoutY = 80.0;
                            panelCalender.blocksMouse = true;
                            panelplugin.visible = true;
                            panelplugin.layoutY = 505.0;
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
                            panelDocInfo.visible = true;
                            panelCustInfo.visible = false;
                            btnCustDocSave.text = "Save [F3]";
                            panelBack.visible = true;
                            panelBack.disable = false;
                            rectHeader.visible = false;
                            rectHeader.styleClass = "";
                            rectHeader.fill = javafx.scene.paint.Color.BLACK;
                            label.layoutX = 0.0;
                            label.text = "Sales - Account Payment Bill";
                            label.hpos = javafx.geometry.HPos.CENTER;
                            label.textFill = javafx.scene.paint.Color.BLACK;
                            imageView.visible = false;
                            imageView.image = null;
                            btnSalesAPSave.layoutY = 525.0;
                            btnSalesAPSave.onKeyPressed = btnSalesAPSaveOnKeyPressedAtShown;
                            btnSalesAPSave.onKeyReleased = btnSalesAPSaveOnKeyReleasedAtShown;
                            btnSalesAPSave.text = "Save [F2]";
                            btnSalesAPSave.font = Arial_Bold_14;
                            btnSalesAPSave.action = btnSalesAPSaveActionAtShown;
                            imageView2.visible = false;
                            imageView2.image = null;
                            btnSalesOnly.visible = false;
                            btnSalesOnly.layoutY = 0.0;
                            btnSalesOnly.text = "Button";
                            imageView3.visible = false;
                            imageView3.image = null;
                            btnSalesAPReset.visible = true;
                            btnSalesAPReset.layoutY = 525.0;
                            btnSalesAPReset.onKeyPressed = btnSalesAPResetOnKeyPressedAtShown;
                            btnSalesAPReset.text = "Reset [F5]";
                            btnSalesAPReset.action = btnSalesAPResetActionAtShown;
                            panelButtons.visible = false;
                            panelTable.visible = false;
                            rectTableBorder.visible = false;
                            labelBill_No.visible = true;
                            labelBill_No.layoutY = 60.0;
                            labelBill_No.text = "Bill No";
                            labelBill_No.font = Arial_12;
                            labelCustomer_Name_.visible = true;
                            labelCustomer_Name_.layoutY = 85.0;
                            labelCustomer_Name_.font = Arial_12;
                            label8.visible = true;
                            label8.layoutY = 85.0;
                            label8.font = Arial_12;
                            lblSalesAPBillNo.visible = true;
                            lblSalesAPBillNo.layoutY = 60.0;
                            lblSalesAPBillNo.onKeyPressed = lblSalesAPBillNoOnKeyPressedAtShown;
                            lblSalesAPBillNo.font = Arial_12;
                            txtSalesAPDate.visible = true;
                            txtSalesAPDate.layoutY = 60.0;
                            txtSalesAPDate.onKeyPressed = txtSalesAPDateOnKeyPressedAtShown;
                            txtSalesAPDate.editable = false;
                            txtSalesAPDate.font = Arial_12;
                            txtSalesAPPName.visible = true;
                            txtSalesAPPName.layoutY = 85.0;
                            txtSalesAPPName.onKeyPressed = txtSalesAPPNameOnKeyPressedAtShown;
                            txtSalesAPPName.onKeyReleased = txtSalesAPPNameOnKeyReleasedAtShown;
                            txtSalesAPPName.font = Arial_12;
                            txtSalesAPDName.visible = true;
                            txtSalesAPDName.layoutY = 85.0;
                            txtSalesAPDName.onKeyPressed = txtSalesAPDNameOnKeyPressedAtShown;
                            txtSalesAPDName.onKeyReleased = txtSalesAPDNameOnKeyReleasedAtShown;
                            txtSalesAPDName.font = Arial_12;
                            imgPName.visible = false;
                            imgPName.layoutY = 0.0;
                            imgPName.scaleX = 1.0;
                            imgPName.scaleY = 1.0;
                            label9.visible = true;
                            label9.layoutY = 60.0;
                            label9.font = Arial_12;
                            APDatePicker.visible = true;
                            APDatePicker.layoutY = 50.0;
                            APDatePicker.onMouseClicked = APDatePickerOnMouseClickedAtShown;
                            APDatePicker.image = Image {url: "{__DIR__}images/Calender.png"};;
                            APDatePicker.fitWidth = 0.0;
                            APDatePicker.fitHeight = 0.0;
                            imgDName.visible = false;
                            imgDName.layoutY = 0.0;
                            imgDName.scaleX = 1.0;
                            labelTIN.visible = true;
                            labelTIN.managed = true;
                            labelTIN.layoutY = 60.0;
                            labelTIN.text = "TIN No";
                            labelTIN.font = Arial_12;
                            lblSalesAPTIN.visible = true;
                            lblSalesAPTIN.layoutY = 85.0;
                            lblSalesAPTIN.editable = false;
                            lblSalesAPTIN.font = Arial_12;
                            Employee_ID.visible = false;
                            Employee_ID.layoutY = 0.0;
                            Employee_ID.text = "Label";
                            cboEmp_code.visible = false;
                            cboEmp_code.layoutY = -5.0;
                            panelTopSection.visible = false;
                            panelTopSection.layoutY = 0.0;
                            rectButton.visible = true;
                            rectButton.layoutY = 531.0;
                            rectButton.styleClass = "rectbutton";
                            rectButton.fill = Yellow;
                            rectButton.stroke = DarkGray;
                            rectButton.strokeWidth = 1.0;
                            rectButton.width = 100.0;
                            rectButton.height = 20.0;
                            rectButton.arcWidth = 10.0;
                            rectButton.arcHeight = 10.0;
                            lblBillHistory.visible = true;
                            lblBillHistory.layoutY = 534.0;
                            __layoutInfo_lblBillHistory.width = 100.0;
                            lblBillHistory.text = "Bill History >>";
                            lblBillHistory.font = Arial_Bold_12;
                            lblBillHistory.hpos = javafx.geometry.HPos.CENTER;
                            lblBillHistory.textFill = DarkGray;
                            rectRemoveRow.visible = true;
                            rectRemoveRow.styleClass = "rectbutton";
                            rectRemoveRow.onKeyPressed = rectRemoveRowOnKeyPressedAtShown;
                            rectRemoveRow.onMouseClicked = rectRemoveRowOnMouseClickedAtShown;
                            rectRemoveRow.fill = Yellow;
                            rectRemoveRow.stroke = DarkGray;
                            rectRemoveRow.strokeWidth = 1.0;
                            rectRemoveRow.height = 20.0;
                            rectRemoveRow.arcWidth = 10.0;
                            rectRemoveRow.arcHeight = 10.0;
                            labelRemoveRow.visible = true;
                            __layoutInfo_labelRemoveRow.width = 100.0;
                            labelRemoveRow.font = Arial_Bold_12;
                            labelRemoveRow.hpos = javafx.geometry.HPos.CENTER;
                            labelRemoveRow.textFill = DarkGray;
                            label10.layoutX = 0.0;
                            label10.layoutY = 445.0;
                            label10.text = "Total Products";
                            label10.font = Arial_12;
                            label11.layoutX = 0.0;
                            label11.layoutY = 470.0;
                            label11.text = "Total Quantity";
                            label11.font = Arial_12;
                            label6.visible = true;
                            label6.layoutX = 0.0;
                            label6.layoutY = 25.0;
                            label6.text = "Discount";
                            label6.font = Arial_12;
                            label1.visible = true;
                            label1.layoutX = 0.0;
                            label1.layoutY = 50.0;
                            label1.text = "VAT";
                            label1.font = Arial_12;
                            label15.visible = false;
                            label15.layoutX = 404.0;
                            label15.layoutY = 499.0;
                            label15.text = "Label";
                            label15.textFill = javafx.scene.paint.Color.BLACK;
                            panelLblColumn1.visible = true;
                            panelLblColumn1.managed = true;
                            panelLblColumn1.layoutY = 0.0;
                            listSalesAccPay.visible = false;
                            listView.visible = true;
                            listView.layoutX = 20.0;
                            listView.layoutY = 120.0;
                            __layoutInfo_listView.width = 750.0;
                            __layoutInfo_listView.height = 288.0;
                            listView.items = null;
                            lblTotalMargin.visible = false;
                            lblTotalMargin.layoutY = 0.0;
                            lblTotalMargin.text = "Label";
                            lblTotalMargin.textFill = javafx.scene.paint.Color.BLACK;
                            lblSalesAPTotalItm.layoutX = 0.0;
                            lblSalesAPTotalItm.layoutY = 445.0;
                            lblSalesAPTotalItm.selectOnFocus = true;
                            lblSalesAPTotalItm.editable = false;
                            lblSalesAPTotalItm.font = Arial_12;
                            lblSalesAPTotalQty.layoutX = 0.0;
                            lblSalesAPTotalQty.layoutY = 470.0;
                            lblSalesAPTotalQty.selectOnFocus = true;
                            lblSalesAPTotalQty.editable = false;
                            lblSalesAPTotalQty.font = Arial_12;
                            txtSalesAPDiscount.visible = true;
                            txtSalesAPDiscount.layoutX = 0.0;
                            txtSalesAPDiscount.layoutY = 25.0;
                            txtSalesAPDiscount.text = "";
                            txtSalesAPDiscount.promptText = "0.00";
                            txtSalesAPDiscount.selectOnFocus = true;
                            txtSalesAPDiscount.editable = false;
                            txtSalesAPDiscount.font = Arial_12;
                            txtSalesAPVAT4.visible = true;
                            txtSalesAPVAT4.layoutX = 0.0;
                            txtSalesAPVAT4.layoutY = 50.0;
                            txtSalesAPVAT4.text = "";
                            txtSalesAPVAT4.promptText = "0.00";
                            txtSalesAPVAT4.selectOnFocus = true;
                            txtSalesAPVAT4.editable = false;
                            txtSalesAPVAT4.font = Arial_12;
                            txtSalesAPVAT12.visible = false;
                            txtSalesAPVAT12.layoutX = 467.0;
                            txtSalesAPVAT12.layoutY = 493.0;
                            txtSalesAPVAT12.promptText = null;
                            txtSalesAPVAT12.selectOnFocus = true;
                            txtSalesAPVAT12.editable = true;
                            panelTxtColumn1.visible = true;
                            panelTxtColumn1.layoutY = 0.0;
                            label13.layoutX = 70.0;
                            label13.layoutY = 445.0;
                            label13.font = Arial_12;
                            label4.layoutX = 0.0;
                            label4.layoutY = 0.0;
                            label4.text = "Subtotal";
                            label4.font = Arial_12;
                            label7.visible = true;
                            label7.layoutX = 70.0;
                            label7.layoutY = 470.0;
                            label3.visible = false;
                            label3.layoutY = 0.0;
                            label3.text = "Label";
                            label3.textFill = javafx.scene.paint.Color.BLACK;
                            panelLblColumn2.visible = true;
                            panelLblColumn2.layoutY = 445.0;
                            txtSalesAPNetPaid.layoutX = 50.0;
                            txtSalesAPNetPaid.layoutY = 445.0;
                            txtSalesAPNetPaid.onKeyPressed = txtSalesAPNetPaidOnKeyPressedAtShown;
                            txtSalesAPNetPaid.text = "";
                            txtSalesAPNetPaid.promptText = "0.00";
                            txtSalesAPNetPaid.editable = true;
                            txtSalesAPNetPaid.font = Arial_Bold_14;
                            txtSalesAPSubTotal.layoutX = 0.0;
                            txtSalesAPSubTotal.layoutY = 0.0;
                            txtSalesAPSubTotal.onKeyPressed = txtSalesAPSubTotalOnKeyPressedAtShown;
                            txtSalesAPSubTotal.text = "";
                            txtSalesAPSubTotal.promptText = "0.00";
                            txtSalesAPSubTotal.selectOnFocus = true;
                            txtSalesAPSubTotal.editable = false;
                            txtSalesAPSubTotal.font = Arial_12;
                            txtSalesAPBalAmt.visible = true;
                            txtSalesAPBalAmt.disable = false;
                            txtSalesAPBalAmt.layoutX = 50.0;
                            txtSalesAPBalAmt.layoutY = 470.0;
                            txtSalesAPBalAmt.text = "";
                            txtSalesAPBalAmt.promptText = "0.00";
                            txtSalesAPBalAmt.selectOnFocus = true;
                            txtSalesAPBalAmt.editable = false;
                            txtSalesAPRoundAmt.visible = false;
                            txtSalesAPRoundAmt.layoutY = 0.0;
                            panelTxtColumn2.visible = true;
                            panelTxtColumn2.layoutY = 445.0;
                            label2.visible = false;
                            label2.text = "Label";
                            label2.textFill = javafx.scene.paint.Color.BLACK;
                            txtSalesAPToalAmt.layoutX = 0.0;
                            txtSalesAPToalAmt.layoutY = 445.0;
                            txtSalesAPToalAmt.text = "Total Amount";
                            txtSalesAPToalAmt.font = Arial_20;
                            txtSalesAPToalAmt.textAlignment = javafx.scene.text.TextAlignment.LEFT;
                            txtSalesAPToalAmt.hpos = javafx.geometry.HPos.LEFT;
                            txtSalesAPToalAmt.textFill = Gray;
                            panelTxtColumn4.visible = true;
                            panelTxtColumn4.layoutY = 0.0;
                            label12.visible = false;
                            label12.disable = false;
                            label12.layoutY = 0.0;
                            label12.text = "Label";
                            label12.textFill = javafx.scene.paint.Color.BLACK;
                            lblBalanceDue.visible = false;
                            lblBalanceDue.layoutX = 0.0;
                            lblBalanceDue.textFill = javafx.scene.paint.Color.BLACK;
                            panelBalanceDue.visible = false;
                            panelBalanceDue.layoutY = 0.0;
                            panelCalender.visible = true;
                            panelCalender.layoutY = 80.0;
                            panelCalender.blocksMouse = false;
                            panelplugin.visible = false;
                            panelplugin.layoutY = 0.0;
                            panel.visible = false;
                        }
                    }
                ]
            }
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            panelDocInfo.visible = false;
                            panelCustInfo.visible = true;
                            btnCustDocSave.text = "Save [F3]";
                            panelBack.visible = true;
                            panelBack.disable = false;
                            rectHeader.visible = false;
                            rectHeader.styleClass = "";
                            rectHeader.fill = javafx.scene.paint.Color.BLACK;
                            label.layoutX = 0.0;
                            label.text = "Sales - Account Payment Bill";
                            label.hpos = javafx.geometry.HPos.CENTER;
                            label.textFill = javafx.scene.paint.Color.BLACK;
                            imageView.visible = false;
                            imageView.image = null;
                            btnSalesAPSave.layoutY = 525.0;
                            btnSalesAPSave.onKeyPressed = btnSalesAPSaveOnKeyPressedAtShown;
                            btnSalesAPSave.onKeyReleased = btnSalesAPSaveOnKeyReleasedAtShown;
                            btnSalesAPSave.text = "Save [F2]";
                            btnSalesAPSave.font = Arial_Bold_14;
                            btnSalesAPSave.action = btnSalesAPSaveActionAtShown;
                            imageView2.visible = false;
                            imageView2.image = null;
                            btnSalesOnly.visible = false;
                            btnSalesOnly.layoutY = 0.0;
                            btnSalesOnly.text = "Button";
                            imageView3.visible = false;
                            imageView3.image = null;
                            btnSalesAPReset.visible = true;
                            btnSalesAPReset.layoutY = 525.0;
                            btnSalesAPReset.onKeyPressed = btnSalesAPResetOnKeyPressedAtShown;
                            btnSalesAPReset.text = "Reset [F5]";
                            btnSalesAPReset.action = btnSalesAPResetActionAtShown;
                            panelButtons.visible = false;
                            panelTable.visible = false;
                            rectTableBorder.visible = false;
                            labelBill_No.visible = true;
                            labelBill_No.layoutY = 60.0;
                            labelBill_No.text = "Bill No";
                            labelBill_No.font = Arial_12;
                            labelCustomer_Name_.visible = true;
                            labelCustomer_Name_.layoutY = 85.0;
                            labelCustomer_Name_.font = Arial_12;
                            label8.visible = true;
                            label8.layoutY = 85.0;
                            label8.font = Arial_12;
                            lblSalesAPBillNo.visible = true;
                            lblSalesAPBillNo.layoutY = 60.0;
                            lblSalesAPBillNo.onKeyPressed = lblSalesAPBillNoOnKeyPressedAtShown;
                            lblSalesAPBillNo.font = Arial_12;
                            txtSalesAPDate.visible = true;
                            txtSalesAPDate.layoutY = 60.0;
                            txtSalesAPDate.onKeyPressed = txtSalesAPDateOnKeyPressedAtShown;
                            txtSalesAPDate.editable = false;
                            txtSalesAPDate.font = Arial_12;
                            txtSalesAPPName.visible = true;
                            txtSalesAPPName.layoutY = 85.0;
                            txtSalesAPPName.onKeyPressed = txtSalesAPPNameOnKeyPressedAtShown;
                            txtSalesAPPName.onKeyReleased = txtSalesAPPNameOnKeyReleasedAtShown;
                            txtSalesAPPName.font = Arial_12;
                            txtSalesAPDName.visible = true;
                            txtSalesAPDName.layoutY = 85.0;
                            txtSalesAPDName.onKeyPressed = txtSalesAPDNameOnKeyPressedAtShown;
                            txtSalesAPDName.onKeyReleased = txtSalesAPDNameOnKeyReleasedAtShown;
                            txtSalesAPDName.font = Arial_12;
                            imgPName.visible = false;
                            imgPName.layoutY = 0.0;
                            imgPName.scaleX = 1.0;
                            imgPName.scaleY = 1.0;
                            label9.visible = true;
                            label9.layoutY = 60.0;
                            label9.font = Arial_12;
                            APDatePicker.visible = true;
                            APDatePicker.layoutY = 50.0;
                            APDatePicker.onMouseClicked = APDatePickerOnMouseClickedAtShown;
                            APDatePicker.image = Image {url: "{__DIR__}images/Calender.png"};;
                            APDatePicker.fitWidth = 0.0;
                            APDatePicker.fitHeight = 0.0;
                            imgDName.visible = false;
                            imgDName.layoutY = 0.0;
                            imgDName.scaleX = 1.0;
                            labelTIN.visible = true;
                            labelTIN.managed = true;
                            labelTIN.layoutY = 60.0;
                            labelTIN.text = "TIN No";
                            labelTIN.font = Arial_12;
                            lblSalesAPTIN.visible = true;
                            lblSalesAPTIN.layoutY = 85.0;
                            lblSalesAPTIN.editable = false;
                            lblSalesAPTIN.font = Arial_12;
                            Employee_ID.visible = false;
                            Employee_ID.layoutY = 0.0;
                            Employee_ID.text = "Label";
                            cboEmp_code.visible = false;
                            cboEmp_code.layoutY = -5.0;
                            panelTopSection.visible = false;
                            panelTopSection.layoutY = 0.0;
                            rectButton.visible = true;
                            rectButton.layoutY = 531.0;
                            rectButton.styleClass = "rectbutton";
                            rectButton.fill = Yellow;
                            rectButton.stroke = DarkGray;
                            rectButton.strokeWidth = 1.0;
                            rectButton.width = 100.0;
                            rectButton.height = 20.0;
                            rectButton.arcWidth = 10.0;
                            rectButton.arcHeight = 10.0;
                            lblBillHistory.visible = true;
                            lblBillHistory.layoutY = 534.0;
                            __layoutInfo_lblBillHistory.width = 100.0;
                            lblBillHistory.text = "Bill History >>";
                            lblBillHistory.font = Arial_Bold_12;
                            lblBillHistory.hpos = javafx.geometry.HPos.CENTER;
                            lblBillHistory.textFill = DarkGray;
                            rectRemoveRow.visible = true;
                            rectRemoveRow.styleClass = "rectbutton";
                            rectRemoveRow.onKeyPressed = rectRemoveRowOnKeyPressedAtShown;
                            rectRemoveRow.onMouseClicked = rectRemoveRowOnMouseClickedAtShown;
                            rectRemoveRow.fill = Yellow;
                            rectRemoveRow.stroke = DarkGray;
                            rectRemoveRow.strokeWidth = 1.0;
                            rectRemoveRow.height = 20.0;
                            rectRemoveRow.arcWidth = 10.0;
                            rectRemoveRow.arcHeight = 10.0;
                            labelRemoveRow.visible = true;
                            __layoutInfo_labelRemoveRow.width = 100.0;
                            labelRemoveRow.font = Arial_Bold_12;
                            labelRemoveRow.hpos = javafx.geometry.HPos.CENTER;
                            labelRemoveRow.textFill = DarkGray;
                            label10.layoutX = 0.0;
                            label10.layoutY = 445.0;
                            label10.text = "Total Products";
                            label10.font = Arial_12;
                            label11.layoutX = 0.0;
                            label11.layoutY = 470.0;
                            label11.text = "Total Quantity";
                            label11.font = Arial_12;
                            label6.visible = true;
                            label6.layoutX = 0.0;
                            label6.layoutY = 25.0;
                            label6.text = "Discount";
                            label6.font = Arial_12;
                            label1.visible = true;
                            label1.layoutX = 0.0;
                            label1.layoutY = 50.0;
                            label1.text = "VAT";
                            label1.font = Arial_12;
                            label15.visible = false;
                            label15.layoutX = 404.0;
                            label15.layoutY = 499.0;
                            label15.text = "Label";
                            label15.textFill = javafx.scene.paint.Color.BLACK;
                            panelLblColumn1.visible = true;
                            panelLblColumn1.managed = true;
                            panelLblColumn1.layoutY = 0.0;
                            listSalesAccPay.visible = false;
                            listView.visible = true;
                            listView.layoutX = 20.0;
                            listView.layoutY = 120.0;
                            __layoutInfo_listView.width = 750.0;
                            __layoutInfo_listView.height = 288.0;
                            listView.items = null;
                            lblTotalMargin.visible = false;
                            lblTotalMargin.layoutY = 0.0;
                            lblTotalMargin.text = "Label";
                            lblTotalMargin.textFill = javafx.scene.paint.Color.BLACK;
                            lblSalesAPTotalItm.layoutX = 0.0;
                            lblSalesAPTotalItm.layoutY = 445.0;
                            lblSalesAPTotalItm.selectOnFocus = true;
                            lblSalesAPTotalItm.editable = false;
                            lblSalesAPTotalItm.font = Arial_12;
                            lblSalesAPTotalQty.layoutX = 0.0;
                            lblSalesAPTotalQty.layoutY = 470.0;
                            lblSalesAPTotalQty.selectOnFocus = true;
                            lblSalesAPTotalQty.editable = false;
                            lblSalesAPTotalQty.font = Arial_12;
                            txtSalesAPDiscount.visible = true;
                            txtSalesAPDiscount.layoutX = 0.0;
                            txtSalesAPDiscount.layoutY = 25.0;
                            txtSalesAPDiscount.text = "";
                            txtSalesAPDiscount.promptText = "0.00";
                            txtSalesAPDiscount.selectOnFocus = true;
                            txtSalesAPDiscount.editable = false;
                            txtSalesAPDiscount.font = Arial_12;
                            txtSalesAPVAT4.visible = true;
                            txtSalesAPVAT4.layoutX = 0.0;
                            txtSalesAPVAT4.layoutY = 50.0;
                            txtSalesAPVAT4.text = "";
                            txtSalesAPVAT4.promptText = "0.00";
                            txtSalesAPVAT4.selectOnFocus = true;
                            txtSalesAPVAT4.editable = false;
                            txtSalesAPVAT4.font = Arial_12;
                            txtSalesAPVAT12.visible = false;
                            txtSalesAPVAT12.layoutX = 467.0;
                            txtSalesAPVAT12.layoutY = 493.0;
                            txtSalesAPVAT12.promptText = null;
                            txtSalesAPVAT12.selectOnFocus = true;
                            txtSalesAPVAT12.editable = true;
                            panelTxtColumn1.visible = true;
                            panelTxtColumn1.layoutY = 0.0;
                            label13.layoutX = 70.0;
                            label13.layoutY = 445.0;
                            label13.font = Arial_12;
                            label4.layoutX = 0.0;
                            label4.layoutY = 0.0;
                            label4.text = "Subtotal";
                            label4.font = Arial_12;
                            label7.visible = true;
                            label7.layoutX = 70.0;
                            label7.layoutY = 470.0;
                            label3.visible = false;
                            label3.layoutY = 0.0;
                            label3.text = "Label";
                            label3.textFill = javafx.scene.paint.Color.BLACK;
                            panelLblColumn2.visible = true;
                            panelLblColumn2.layoutY = 445.0;
                            txtSalesAPNetPaid.layoutX = 50.0;
                            txtSalesAPNetPaid.layoutY = 445.0;
                            txtSalesAPNetPaid.onKeyPressed = txtSalesAPNetPaidOnKeyPressedAtShown;
                            txtSalesAPNetPaid.text = "";
                            txtSalesAPNetPaid.promptText = "0.00";
                            txtSalesAPNetPaid.editable = true;
                            txtSalesAPNetPaid.font = Arial_Bold_14;
                            txtSalesAPSubTotal.layoutX = 0.0;
                            txtSalesAPSubTotal.layoutY = 0.0;
                            txtSalesAPSubTotal.onKeyPressed = txtSalesAPSubTotalOnKeyPressedAtShown;
                            txtSalesAPSubTotal.text = "";
                            txtSalesAPSubTotal.promptText = "0.00";
                            txtSalesAPSubTotal.selectOnFocus = true;
                            txtSalesAPSubTotal.editable = false;
                            txtSalesAPSubTotal.font = Arial_12;
                            txtSalesAPBalAmt.visible = true;
                            txtSalesAPBalAmt.disable = false;
                            txtSalesAPBalAmt.layoutX = 50.0;
                            txtSalesAPBalAmt.layoutY = 470.0;
                            txtSalesAPBalAmt.text = "";
                            txtSalesAPBalAmt.promptText = "0.00";
                            txtSalesAPBalAmt.selectOnFocus = true;
                            txtSalesAPBalAmt.editable = false;
                            txtSalesAPRoundAmt.visible = false;
                            txtSalesAPRoundAmt.layoutY = 0.0;
                            panelTxtColumn2.visible = true;
                            panelTxtColumn2.layoutY = 445.0;
                            label2.visible = false;
                            label2.text = "Label";
                            label2.textFill = javafx.scene.paint.Color.BLACK;
                            txtSalesAPToalAmt.layoutX = 0.0;
                            txtSalesAPToalAmt.layoutY = 445.0;
                            txtSalesAPToalAmt.text = "Total Amount";
                            txtSalesAPToalAmt.font = Arial_20;
                            txtSalesAPToalAmt.textAlignment = javafx.scene.text.TextAlignment.LEFT;
                            txtSalesAPToalAmt.hpos = javafx.geometry.HPos.LEFT;
                            txtSalesAPToalAmt.textFill = Gray;
                            panelTxtColumn4.visible = true;
                            panelTxtColumn4.layoutY = 0.0;
                            label12.visible = false;
                            label12.disable = false;
                            label12.layoutY = 0.0;
                            label12.text = "Label";
                            label12.textFill = javafx.scene.paint.Color.BLACK;
                            lblBalanceDue.visible = false;
                            lblBalanceDue.layoutX = 0.0;
                            lblBalanceDue.textFill = javafx.scene.paint.Color.BLACK;
                            panelBalanceDue.visible = false;
                            panelBalanceDue.layoutY = 0.0;
                            panelCalender.visible = true;
                            panelCalender.layoutY = 80.0;
                            panelCalender.blocksMouse = false;
                            panelplugin.visible = false;
                            panelplugin.layoutY = 0.0;
                            panel.visible = false;
                        }
                    }
                ]
            }
        ]
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panelDocInfo, panelCustInfo, panelBack, panel, ]
    }
    // </editor-fold>//GEN-END:main
    var salesDiscSettings = bind CommonDeclare.salesDiscApply on replace {
        CounterSalesTableObj.dtmodel.setCellEditable(0, 9, salesDiscSettings);
    }

    function txtSalesAPDiscountOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
         if(settingsController.getSalesDiscountType()==0){
                txtSalesAPDiscount.editable=false;
            }
            else {
                txtSalesAPDiscount.editable=true;
            }
         }

    function txtSalesAPDiscountOnKeyTypedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if(not txtSalesAPDiscount.rawText.trim().equals("")) {
            var intValid:Integer;
            valid1 = new Validation();
            intValid = valid1.getDecimalValid(txtSalesAPDiscount.rawText, 1, 6);
            if(intValid ==1){
                FXinfo("Discount amount cannot be more than 6 digits.");
            }
            else if(intValid ==0){
                FXinfo("Please enter only numbers.Characters not allowed");
            }
            else if(Double.parseDouble(txtSalesAPDiscount.rawText) >= CounterSalesTableObj.totAmt) {
                FXinfo("Discount Amount cannot be greater than total Amount");
            }
            else {
                CounterSalesTableObj.calcDiscount(txtSalesAPDiscount.rawText.trim());
                calcDiscTotal ("disc");
            }
        }
        else {
            CounterSalesTableObj.calcDiscount("0");
            calcDiscTotal("disc");
        }
        }

     function calcDiscTotal (calcType:String): Void {
        try{
        CounterSalesTableObj.salesCalculations();
        var ta: Double = Value.Round(CounterSalesTableObj.totAmt, 2);
        var tda: Double = Value.Round(CounterSalesTableObj.totDistAmt, 2);
        var tvat4: Double = Value.Round(CounterSalesTableObj.totVATAmt4, 2);
        vatAmt = (tvat4);
        txtSalesAPSubTotal.text = Value.Round(ta);
        lblSalesAPTotalQty.text = "{CounterSalesTableObj.totQty}";
        lblSalesAPTotalItm.text = "{CounterSalesTableObj.totItems}";
        lblTotalMargin.text = "TOTAL MARGIN : {Value.Round(CounterSalesTableObj.totMargin)}";
        if(calcType.equals("total")) {
            txtSalesAPDiscount.text = Value.Round(tda);
         }
        txtSalesAPVAT4.text = Value.Round(tvat4);
        netAmt = (ta - tda);
        var autoRoundoff : Integer = 0;
        try {
            var settingsController : com.vanuston.medeil.implementation.Settings =  RegistryFactory.getClientStub(RegistryConstants.Configuration) as com.vanuston.medeil.implementation.Settings;
            autoRoundoff = settingsController.getEnableAutoRoundoff()[0];
        }catch(e1:Exception){
            log.debug("updateIntValues() settingsCtrl Exception:{e1.getMessage()}");
        }
        if(autoRoundoff==0) {
            var rVal = Value.roundToHalfVal("{netAmt}");
            txtSalesAPRoundAmt.text = Value.Round(rVal - netAmt);
            rndVal = "{Value.Round(Double.parseDouble(txtSalesAPRoundAmt.text)+netAmt)}";
            txtSalesAPToalAmt.text = rndVal;
            txtSalesAPRoundAmt.editable=false;
        }
        else if(autoRoundoff==1) {
            var rVal = Value.roundToWholeVal("{netAmt}");
            txtSalesAPRoundAmt.text = Value.Round(rVal - netAmt);
            rndVal = "{Value.Round(Double.parseDouble(txtSalesAPRoundAmt.text)+netAmt)}";
            txtSalesAPToalAmt.text = rndVal;
            txtSalesAPRoundAmt.editable=false;
        }
        else {
            txtSalesAPRoundAmt.text = Value.Round(0.00);
            rndVal = "{Value.Round(Double.parseDouble(txtSalesAPRoundAmt.text)+netAmt)}";
            txtSalesAPToalAmt.text = rndVal;
            txtSalesAPRoundAmt.editable=true;
        }
        txtSalesAPNetPaid.text = txtSalesAPToalAmt.text;
        var pay : Double=Double.parseDouble(txtSalesAPNetPaid.rawText);
        var bal = Value.Round((Double.parseDouble(rndVal) - pay));
        txtSalesAPBalAmt.text = bal;       
        }catch(ex : Exception){
             log.debug("calcDiscTotal() settingsCtrl Exception:{ex.getMessage()}");
        }
     }
     
    function txtSalesAPRoundAmtOnKeyPressedAtShown (event: javafx.scene.input.KeyEvent): Void {
        if(event.code==KeyCode.VK_TAB) {
            if(event.shiftDown){
                CounterSalesTableObj.focusSet();
            } else {
                btnSalesAPSave.requestFocus();
            }
        }
        shortcut(event);
    }

    function txtSalesAPRoundAmtOnKeyTypedAtShown (event: javafx.scene.input.KeyEvent): Void {
         if (NumberUtils.isNumeric(txtSalesAPRoundAmt) and not txtSalesAPRoundAmt.rawText.equals("")) {
         txtSalesAPToalAmt.text = "{Value.Round(netAmt+Double.parseDouble(txtSalesAPRoundAmt.text))}";
         txtSalesAPNetPaid.text = txtSalesAPToalAmt.text;
         txtSalesAPBalAmt.text = "0.00";     
            }
    }

    function cboEmp_codeOnMouseClickedAtShown (event: javafx.scene.input.MouseEvent): Void {
        empCode = commonController.getEmployeeCode("").toArray() as String[];
    }

    function cboEmp_codeOnKeyPressedAtShown (event: javafx.scene.input.KeyEvent): Void {
        empCode = commonController.getEmployeeCode("").toArray() as String[];
        if(event.code==KeyCode.VK_TAB) {
            if(event.shiftDown){
                btnSalesOnly.requestFocus();
            } else {
                txtSalesAPDate.requestFocus();
            }
        }
        shortcut(event);
        
    }

    function btnSalesOnlyOnKeyPressedAtShown (event: javafx.scene.input.KeyEvent): Void {
         if(event.code==KeyCode.VK_ENTER ) {
                saveSales(0);
         } else if(event.code==KeyCode.VK_TAB ) {
             if(event.shiftDown){
                 btnSalesAPSave.requestFocus();
             } else {
                cboEmp_code.requestFocus();
             }



         }


    }

    function lblSalesAPBillNoOnKeyReleasedAtShown (event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function textboxOnKeyReleasedAtShown (event: javafx.scene.input.KeyEvent): Void {
       shortcut(event);
    }

   
    function lblSalesAPTotalItmOnKeyReleasedAtShown (event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function rectangleOnMouseClicked (event: javafx.scene.input.MouseEvent): Void {
    
    }
var tmp=bind listSalesAccPay.visible on  replace{
    if(tmp==true)
    fxCalendar.visible = false;
}

var panelAlertLX= bind (panelW-500)/2;
var panelAlertLY= bind (panelH-150)/2;
def CustomAlert=CustomAlert{};
function FXalert(type:Integer):Void{
        CustomAlert.ShowAlert("Sales - Counter Bill",type);
        showAlertbox();
}
function showAlertbox():Void{
        panelAlert.visible=true;
        delete panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
}
function FXinfo(msg:String):Void{
        CustomAlert.ShowInfo("Sales - Counter Bill",msg);
        showAlertbox();
}
function rotateImage(img:ImageView):Void{
    }
       function imgPNameOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
       listCustomerChanges(0);
       listSalesAccPay.requestFocus();
       listSalesAccPay.selectFirstRow();         
   }
   function imgDNameOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        listDoctorChanges(0);
       listSalesAccPay.requestFocus();
       listSalesAccPay.selectFirstRow();
   }
    function listSalesAccPayOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
             if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER)
            listSalesAccPay.visible = false;
         }
    function txtSalesAPNetPaidOnKeyReleasedAtShown (event: javafx.scene.input.KeyEvent): Void {
        updateIntValues();
    }

    function btnSalesOnlyActionAtShown (): Void {
        saveSales(0);
    }
    function btnCustDocSaveAction(): Void {
                var stateVal = currentState.actual;
            if (stateVal == 2) {
                  var retVal = bind CustInfo.save(1);
                  saveAndBack(retVal);
            } else if (stateVal == 1) {
                 var retVal = bind DocInfo.doctorSave();
                  saveAndBack(retVal);
            }
    }

     var ret1 = bind CustInfo.checkVal on replace {
         saveAndBack(ret1);
     }
     var ret2 = bind DocInfo.checkVal on replace {
         saveAndBack(ret2);
    }
     var bk = bind CustInfo.isBack on replace {
            btnSalesBackAction();
     }
     var bk1 = bind DocInfo.isBack on replace {
             btnSalesBackAction();
     }

    function saveAndBack(retVal : Integer): Void {
        var stateVal = currentState.actual;
        if (stateVal == 2) {
                  var user = bind CustInfo.newCust;
            if (retVal == 1) {
                currentState.actual = currentState.findIndex("Shown");
                txtSalesAPPName.text = user;
                //btnSalesBackAction();
                txtSalesAPDName.requestFocus();
            }
        } else if (stateVal == 1) {
              var user = bind DocInfo.newDoc;
            if (retVal == 1) {
                currentState.actual = currentState.findIndex("Shown");
                  txtSalesAPDName.text = user;
                //btnSalesBackAction();
                CounterSalesTableObj.focusSet();
            }
        }
		updateIntValues();
    }

function rectButtonOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
}
function btnSalesBackAction(): Void {
        var stateVal = currentState.actual;
        if (stateVal == 2) {
            panelCustInfo.visible = false;
            panelBack.visible = false;
            txtSalesAPPName.text = "";
            txtSalesAPPName.requestFocus();
        } else if (stateVal == 1) {
            panelDocInfo.visible = false;
            panelBack.visible = false;
            txtSalesAPDName.text = "";
            txtSalesAPDName.requestFocus();
        }
        currentState.actual = currentState.findIndex("Shown");
		updateIntValues();
    }

    function btnSalesAPSaveOnKeyReleasedAtShown (event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }
	def kr = KeyRegistry {};

     var short = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 2 and CommonDeclare.form[1] == 2) {            
            shortcut(short);
        }
    }
    public function shortcut(event: javafx.scene.input.KeyEvent): Void {

        if (event.code == kr.print and btnSalesAPSave.disable == false) {
            saveSales(1);
        }
        if (event.code == kr.save and btnSalesAPSave.disable == false) {
            saveSales(0);
        }
        if (event.code == kr.rRow) {
              CounterSalesTableObj.removeRow();updateIntValues(); itNAM1="";
        }
    }

    function APDatePickerOnMouseClickedAtShown (event: javafx.scene.input.MouseEvent): Void {
        if(not dateFlag)
        {
            if(txtSalesAPDate.text!=null)
            {
                var dat = txtSalesAPDate.rawText.split("-");
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1])-1;
                var y = Integer.parseInt(dat[2]);
                fxCalendar.set(y,m,d);
            }
            else
            {
                var dat = DateUtils.now("dd-MM-yyyy").split("-");
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1])-1;
                var y = Integer.parseInt(dat[2]);
                fxCalendar.set(y,m,d);
            }
            fxCalendar.visible=not fxCalendar.visible;
            dateFlag=true;
        }else
        {
            fxCalendar.visible=false;
        }
    }

    function rectRemoveRowOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
                CounterSalesTableObj.removeRow();updateIntValues();itNAM1="";
         }

    function txtSalesAPNetPaidOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
            if(event.code==KeyCode.VK_ENTER or event.code==KeyCode.VK_TAB)
            {
                txtSalesAPBalAmt.text ="{Value.Round(Double.parseDouble(txtSalesAPToalAmt.text) - Double.parseDouble(txtSalesAPNetPaid.rawText),2)}";
                btnSalesAPSave.requestFocus();
            }shortcut(event);
         }

    function txtSalesAPSubTotalOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
            txtSalesAPNetPaid.requestFocus();
            shortcut(event);
            }

    function rectRemoveRowOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {

         }

    function btnSalesAPResetOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
            if(event.code==KeyCode.VK_ENTER) {
                Msgbox("Confirm", "Do you want to Reset Counter Billl? ");
            }
         }

    function btnSalesAPResetActionAtShown(): Void {
                Msgbox("Confirm", "Do you want to Reset Counter Billl? ");
         }

    function btnSalesAPSaveOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
           if(event.code==KeyCode.VK_ENTER){
                saveSales(1);
           }else if(event.code==KeyCode.VK_TAB){
               if(event.shiftDown){
                   txtSalesAPRoundAmt.requestFocus();
               } else {
                    btnSalesOnly.requestFocus();
               }


           }

    }

    function btnSalesAPSaveActionAtShown(): Void {
            saveSales(1);
         }

    function txtSalesAPDNameOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        listDoctorChanges(1);
         }
    function txtSalesAPPNameOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        listCustomerChanges(1);
        shortcut(event);
         }
    function txtSalesAPDNameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if(event.code==KeyCode.VK_ENTER or event.code==KeyCode.VK_TAB or event.code==KeyCode.VK_ESCAPE) {
            listSalesAccPay.visible=false;
            if(event.shiftDown){
               txtSalesAPPName.requestFocus();
            } else {
                CounterSalesTableObj.focusSet();
            }
        }else if(event.code==KeyCode.VK_DOWN) {
            listDoctorChanges(1);
            listSalesAccPay.requestFocus();
            listSalesAccPay.selectFirstRow();
        } 
        shortcut(event);
    }

    function txtSalesAPPNameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {        
           if(event.code==KeyCode.VK_ENTER or event.code==KeyCode.VK_TAB or event.code==KeyCode.VK_ESCAPE) {
            listSalesAccPay.visible=false;
            if(event.shiftDown ){
               txtSalesAPDate.requestFocus();
            } else{
                txtSalesAPDName.requestFocus();
            }

//            cboEmp_code.requestFocus();
           } else if(event.code==KeyCode.VK_DOWN) {
               listCustomerChanges(1);
               listSalesAccPay.requestFocus();
               listSalesAccPay.selectFirstRow();
           }
           shortcut(event);
         }

    function txtSalesAPDateOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
            if(event.code==KeyCode.VK_ENTER or event.code==KeyCode.VK_TAB){
                if(event.shiftDown){
                    cboEmp_code.requestFocus();
                } else {
                    txtSalesAPPName.requestFocus();
                }
            }
            shortcut(event);
         }

    function lblSalesAPBillNoOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if(event.code==KeyCode.VK_ENTER)
                {txtSalesAPDate.requestFocus();}
                
                shortcut(event);
         }
 function listCustomerChanges(type: Integer): Void {
        if(not listSalesAccPay.visible){
        var listControlObj: ListController = new ListController();
        listSalesAccPay.visible = true;
        listH = 0.0;
        listSalesAccPay.layoutX = txtSalesAPPName.layoutX;
        listSalesAccPay.layoutY = txtSalesAPPName.layoutY + txtSalesAPPName.height + 5;
        listH = listControlObj.listImageControlView(txtSalesAPPName, listSalesAccPay, "salescustomer", type);
         var selS: String = bind listControlObj.selectedString on replace {
                
                if (selS.length() > 0) {
                    //txtSalesAPDName.requestFocus();
                    if (listSalesAccPay.selectedItem != "New name...") {
                    var cust = "{listSalesAccPay.selectedItem}";
                    txtSalesAPPName.text = cust;
                    listSalesAccPay.visible = false;
                    cboEmp_code.requestFocus();
                    balance = commonController.getCustomerBalance("{cust}");
        } else {
            callCustInfo();
            listSalesAccPay.visible = false;
        }
    }
    }
    }
    else{
        listSalesAccPay.visible = false;
        txtSalesAPPName.requestFocus();
    }
    }


    function listDoctorChanges(type: Integer): Void {
        if(not listSalesAccPay.visible){
        var listControlObj: ListController = new ListController();
         listSalesAccPay.visible = true;
        listH = 0.0;
        listSalesAccPay.layoutX = txtSalesAPDName.layoutX;
        listSalesAccPay.layoutY = txtSalesAPDName.layoutY + txtSalesAPDName.height + 5;
        listH = listControlObj.listImageControlView(txtSalesAPDName, listSalesAccPay, "salesdoctor", type);
         var selS: String = bind listControlObj.selectedString on replace {
                
                if (selS.length() > 0) {
                    //CounterSalesTableObj.focusSet();
                     if (listSalesAccPay.selectedItem != "New name...") {
            txtSalesAPDName.text = "{listSalesAccPay.selectedItem}";
            listSalesAccPay.visible = false;
            CounterSalesTableObj.focusSet();
        } else {
            listSalesAccPay.visible = false;
            callDocInfo();
    }
    }
    }
    }
    else{
        listSalesAccPay.visible = false;
        txtSalesAPDName.requestFocus();
    }
    }


function callCustInfo():Void{
                            insertCustomerForm();
                            currentState.actual = currentState.findIndex("CustomerInfo");
                              CustInfo.txtCustName.requestFocus();
}

function callDocInfo():Void{
                             DocInfo.Startup();
                            insertDocForm();
                            currentState.actual = currentState.findIndex("DoctorInfo");
                             DocInfo.txtDoctorDName.requestFocus();
}
    function insertCustomerForm(): Void {
        CustInfo.FromSales();
        delete panelCustInfo.content;
        insert CustInfo.getDesignRootNodes() into panelCustInfo.content;
    }

    function insertDocForm(): Void {
         DocInfo.currentState.actual = DocInfo.currentState.findIndex("FromSales");
         DocInfo.checkState = 1;
        delete panelDocInfo.content;
        insert DocInfo.getDesignRootNodes() into panelDocInfo.content;
        updateIntValues();
    }

function checkValid():Integer{
    var retVal = 0;
    var txtDate:java.util.Date = DateUtils.normalStringToDate(txtSalesAPDate.rawText.trim());
    var billDate:java.util.Date = DateUtils.normalStringToDate(DateUtils.now("dd-MM-yyyy"));
    var chk:Boolean=commonController.isNotAllow(1);
    if(CounterSalesTableObj.nullVal == 0)
    {
        retVal = 1;
        FXinfo("Sales table is empty. Please enter some values!");
      //  CounterSalesTableObj.focusSet();
    }
    else if(Double.parseDouble(txtSalesAPToalAmt.text) <=0) {
            retVal = 1;
            FXinfo("Total Amount should be greater than zero");
    }else if (chk){
        retVal = 1;
        FXinfo("Trial Edition has '10' bills only allowed...Upgrade to Lite/Rich/Premium/Ultimate Edition");
    } else if(txtSalesAPPName.rawText.trim().length() > 40) {
            FXinfo("Customer Name length cannot be more than 40 characters");
            retVal = 1;
        }  else if(txtSalesAPDName.rawText.trim().length() > 100) {
            FXinfo("Doctor Name length cannot be more than 100 characters");
            retVal = 1;
        }
    else if(txtDate.getTime().compareTo(billDate.getTime())== 1) {
            retVal = 1;
            FXinfo("Bill date is greater than the current date. Please check.");
        }
     else if(not txtSalesAPRoundAmt.text.equals("") and (Double.parseDouble(txtSalesAPRoundAmt.text) > 0.99 or Double.parseDouble(txtSalesAPRoundAmt.text)<-0.99) ) {
            retVal = 1;
            FXinfo("Round off value entered is incorrect. Please check");
        }
    else{
        retVal = 0;
    }
   return retVal;
}

function saveSales(ss:Integer) : Void{
    try{
        var check = checkValid();
        updateIntValues();
        var sales= new SalesModel();
        if(check == 0)    {
              var sdf = new SimpleDateFormat("dd-MM-yyyy");
              var billDate  = DateUtils.changeFormatDate(sdf.parse(txtSalesAPDate.rawText));
              sales.setCustomerName(txtSalesAPPName.rawText);
              sales.setDoctorName(txtSalesAPDName.rawText);
              sales.setBillNumber(lblSalesAPBillNo.rawText);
              sales.setBillDate(billDate);
              sales.setBillType("counter");
              sales.setTotalDiscount(Double.parseDouble(txtSalesAPDiscount.rawText));
              sales.setTotalAmount(Double.parseDouble(txtSalesAPToalAmt.text));
              sales.setPaidAmount(Double.parseDouble(txtSalesAPNetPaid.rawText));
              sales.setBalanceAmount(Double.parseDouble(txtSalesAPBalAmt.rawText));
              sales.setTotalVAT(Double.parseDouble(txtSalesAPVAT4.rawText));
              sales.setTotalQuantity(Integer.parseInt(lblSalesAPTotalQty.rawText));
              sales.setTotalItems(Integer.parseInt(lblSalesAPTotalItm.rawText));
               sales.setListofitems(CounterSalesTableObj.getSalesBillItems());
              sales.setAccountNumber("");
              sales.setPaymentMode("");
              sales.setCardNumber("");
              sales.setCardHolderName("");
              sales.setCardExpiry("");
              sales.setBankName("");
              sales.setFormType("");
              sales.setSalesReturnNumber("");
              sales.setSalesReturnDate("0000-00-00");
              sales.setEmployeeID(cboEmp_code.selectedItem.toString());
              //var salesController:Sales=new SalesController();
                
                var returnObject = new Object();
                returnObject = salesController.createRecord(sales);
                var msgReturnModel: MsgReturnModel = new MsgReturnModel();
                msgReturnModel = returnObject as MsgReturnModel;
                //CounterSalesTableObj.focusSet(msgReturnModel.getRowCount(), msgReturnModel.getColumnCount());
                var type="";
                if(msgReturnModel.getReturnMessage()=="0")
                {
                   resetValues();
                   type = "Save";
                   if (ss == 1) {                        
                        type = "Print";
                        var reportSource: File = new File("printerfiles/Print.jasper");
                        var jasperReport:JasperReport =  JRLoader.loadObject(reportSource) as JasperReport;                        
                        var jasperPrint:JasperPrint = salesController.jasperPrint(sales.getBillNumber(), "Sales_Counter",jasperReport);
                        JasperPrintManager.printReport(jasperPrint, false);                        
                    }
                    FXalert(0);
                }
                else
                {
                FXinfo(msgReturnModel.getReturnMessage());
                CounterSalesTableObj.focusSet(msgReturnModel.getRowCount(), msgReturnModel.getColumnCount());
                }
               commonController.userLog("sales Counter Bill",type);
                

          }
         } catch (ex: Exception) {
                
                var que = " Class : SalesCounter   Method: saveSales    Exception : {ex}";
                log.debug(que);
       }
}
function resetValues(): Void{
//commonController=new CommonController();
apBillDate = DateUtils.now("dd-MM-yyyy");
CounterSalesTableObj.clearData();
CounterSalesTableObj.resetValues();
txtSalesAPPName.text="";
txtSalesAPDName.text="";
txtSalesAPSubTotal.text="0.00";
txtSalesAPDiscount.text="0.00";
txtSalesAPVAT4.text="0.00";
txtSalesAPToalAmt.text="0.00";
lblSalesAPTotalQty.text="0";
lblSalesAPTotalItm.text="0";
txtSalesAPBalAmt.text="0";
txtSalesAPNetPaid.text="0.00";
txtSalesAPRoundAmt.style = "";
txtSalesAPRoundAmt.text = "0.00";
//alertSt=salescontroller.getAlertStatus();
//commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
getAutoVal = commonController.getAutoIncrement(apBillDate,"AccountSales");
txtSalesAPPName.requestFocus();
itNAM1="";
cboEmp_code.select(0);
}
var visit = bind fxCalendar.visible on replace{
    if (not visit and dateFlag) {
            apBillDate = fxCalendar.getSelectedDate();
            dateFlag = false;
            txtSalesAPPName.requestFocus();
        }
 };    
    function updateIntValues(): Void {
    try{
        CounterSalesTableObj.salesCalculations();
        calcDiscTotal("total");
        if(txtSalesAPNetPaid.text.equals("")) {
                txtSalesAPNetPaid.text = "0.00";
            } else if(txtSalesAPRoundAmt.text.equals("")) {
                txtSalesAPRoundAmt.text = "0.00";
            }
        /*var ta: Double = Value.Round(CounterSalesTableObj.totAmt, 2);
        var tda: Double = Value.Round(CounterSalesTableObj.totDistAmt, 2);
        var tvat4: Double = Value.Round(CounterSalesTableObj.totVATAmt4, 2);
            vatAmt = (tvat4);
        txtSalesAPSubTotal.text = Value.Round(ta);
        lblSalesAPTotalQty.text = "{CounterSalesTableObj.totQty}";
        lblSalesAPTotalItm.text = "{CounterSalesTableObj.totItems}";
        txtSalesAPDiscount.text = Value.Round(tda);
        txtSalesAPVAT4.text = Value.Round(tvat4);
        netAmt = (ta - tda);
        var autoRoundoff : Boolean = true;
        try {
            var settingsController : com.vanuston.medeil.implementation.Settings =  RegistryFactory.getClientStub(RegistryConstants.Configuration) as com.vanuston.medeil.implementation.Settings;
            autoRoundoff = settingsController.getEnableAutoRoundoff()[0];
        }catch(e1:Exception){
            log.debug("updateIntValues() settingsCtrl Exception:{e1.getMessage()}");
        }     
        if(autoRoundoff) {
            var rVal = Value.roundToHalfVal("{netAmt}");
            txtSalesAPRoundAmt.text = Value.Round(rVal - netAmt);
            rndVal = "{Value.Round(Double.parseDouble(txtSalesAPRoundAmt.text)+netAmt)}";
            txtSalesAPToalAmt.text = rndVal;
            txtSalesAPRoundAmt.editable=false;
        } else {            
            txtSalesAPRoundAmt.text = Value.Round(0.00);
            rndVal = "{Value.Round(Double.parseDouble(txtSalesAPRoundAmt.text)+netAmt)}";
            txtSalesAPToalAmt.text = rndVal;
            txtSalesAPRoundAmt.editable=true;
        }

        txtSalesAPNetPaid.text = txtSalesAPToalAmt.text;
        var pay : Double=Double.parseDouble(txtSalesAPNetPaid.rawText);
        var bal = Value.Round((Double.parseDouble(rndVal) - pay));

        txtSalesAPBalAmt.text = bal;
        if(txtSalesAPNetPaid.text.equals("")) {
                txtSalesAPNetPaid.text = "0.00";
            } else if(txtSalesAPRoundAmt.text.equals("")) {
                txtSalesAPRoundAmt.text = "0.00";
            }*/
    }catch(ex : Exception){
    }
    }
    public function Msgbox(type: String, Message: String) {
        MessageBox.MsgBox("Shown", type, Message);
    }
    public function MsgValue(val: Integer) {
        if (val == 1) {
            resetValues();
        }
        if (val == 2) {
            panelAlert.visible = false;
        }
    }
    public function alertSetting(): Void {
        //var salesController:Sales=new SalesController();
        //salesController= RegistryFactory.getClientStub (RegistryConstants.Sales) as Sales;
        expAlert = CounterSalesTableObj.alert1;
        alertSt=salesController.getAlertStatus();
        itemDis = CounterSalesTableObj.itN;
        var itNN: String = CounterSalesTableObj.itN;
        if(alertSt==1) {
            if (expAlert != null and expAlert.length() > 0) {
                panelAlert.visible = true;
                var str: String = "";
                if (itNN != itNAM1) {
                    str = "The product '{itNN}' will expire on {expAlert}";
                    alerCnt1 = 0;
                }
                if (alerCnt1 == 0) {
                    panelAlert.visible = true;
                    delete  panelAlert.content;
                    MessageBox.MsgBox("Sales Counter Bill","Information",str);
                    insert MessageBox.getDesignRootNodes() into panelAlert.content;
                    itNAM1 = itNN;
                    alerCnt1 = 1;
                }
                CounterSalesTableObj.alert1="";
                expAlert = "";
            }
        }
    }
    var tot=bind txtSalesAPToalAmt.text on replace {
        try {
            SalesPlugin.Amount = Double.parseDouble(tot);
         } catch (e) {
             SalesPlugin.Amount =0.0;
         }
     }
    function getPrivileges():Void   {
//        commonController=new CommonController();
//         commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
        var uname = CommonDeclare.user;
        var utype = commonController.getUserType(uname);

        if(utype.equals("User"))
        {
            var priv= commonController.getPrivileges("sales",uname);
            var ss = priv.split(",");
            var val = Integer.parseInt(ss[1]);
            if(val == 1)
            {
               btnSalesAPSave.disable=true;
               btnSalesOnly.disable=true;
            } 
            else if(val == 2)
            {
                btnSalesAPSave.disable = false;
                btnSalesOnly.disable = false;
            }
            else if(val == 3)
            {
                btnSalesAPSave.disable = false;
                btnSalesOnly.disable = false;
            }
        }
        else
         {
            btnSalesAPSave.disable = false;
            btnSalesOnly.disable = false;
         }

    }
    var ctrlPressed = false;
    public function startUp():Void {
        (accTable as javax.swing.JTable).addKeyListener(KeyAdapter {
//            override public function keyPressed(e : java.awt.event.KeyEvent): Void {
//                if(e.isControlDown()) {
//                    ctrlPressed = true;
//                }
//                println("ctrlPressed:{ctrlPressed}, {e.getKeyCode() == e.VK_TAB}");
//                if(e.getKeyCode() == e.VK_TAB) {
//                    if(ctrlPressed){
//                        println("txtSalesAPRoundAmt.requestFocus");
//                        txtSalesAPRoundAmt.requestFocus();
//                        ctrlPressed =false;
//                    }
//                }
//                if(not e.isControlDown()) {
//                    ctrlPressed = false;
//                }
//                else {
//                    ctrlPressed = false;
//                }
//            }
            override public function keyReleased(e : java.awt.event.KeyEvent): Void {
                alertSetting();
		updateIntValues();
            }
            override public function keyTyped(e : java.awt.event.KeyEvent): Void {
                alertSetting();
		updateIntValues();
            }
        });	
	(accTable as javax.swing.JTable).getSelectionModel().addListSelectionListener(javax.swing.event.ListSelectionListener {
            override public function valueChanged(e : javax.swing.event.ListSelectionEvent): Void {
                updateIntValues();
            }
         });	
	if(settingsController.getSalesDiscountType()==0) {
            CommonDeclare.salesDiscApply=true;
         }
        currentState.actual = currentState.findIndex("Shown");
        //panelSalesCounter.visible= true ;
        salesAccountTable.layoutX = 0;
        salesAccountTable.layoutY = 0;
        getPrivileges();
        getAutoVal = commonController.getAutoIncrement(apBillDate,"AccountSales");
        delete  panelAlert.content;
        insert MessageBox.getDesignRootNodes() into panelAlert.content;
        txtSalesAPPName.requestFocus();
        panelCalender.content = [fxCalendar,];
        fxCalendar.visible = false;
        panelTable.content = [salesAccountTable,];
        listView.visible = false;
        
        //delete panelplugin.content;
        //insert SalesPlugin.getDesignRootNodes() into panelplugin.content;
    }

}