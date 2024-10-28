package com.vanuston.medeil.ui;

import java.lang.Class;
import javafx.scene.image.Image;
import javafx.scene.layout.LayoutInfo;
import javafx.ext.swing.SwingComponent;
import javafx.scene.input.KeyCode;
import java.awt.Dimension;
import java.text.SimpleDateFormat;
import com.vanuston.medeil.ui.calendar.theme.Theme;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import com.vanuston.medeil.uitables.DummySalesTable;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Value;
import com.vanuston.medeil.util.CommonDeclare;
import javafx.scene.image.ImageView;
import java.lang.Exception;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.KeyRegistry;
import java.awt.event.KeyAdapter;
import com.vanuston.medeil.model.SalesModel;
import com.vanuston.medeil.model.MsgReturnModel;
import java.util.List;
import java.util.ArrayList;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.implementation.Sales;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.util.NumberUtils;
import com.vanuston.medeil.util.Validation;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperPrintManager;
import java.io.File;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;


 def DocInfo=DoctorInformation{};
 def CustInfo= CustomerInformation{};




public class SalesDummy {
    
public var rndVal: String= "0.00";
var netAmt:Double = 0.0;
var ss:String ="";

//var roundOff = bind ss on replace {
//    rndVal = whole();
//}
//function whole():String{
//    var rVal = Value.roundToWholeVal("{netAmt}");
//    ss = Value.Round(rVal-netAmt);
//    return Value.Round(rVal);
//}

var listH = 0.0;
var imgP = false;
var imgD = false;
var DummySalesTableObj = new DummySalesTable();


var commonController:CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
var log: Logger = Logger.getLogger(SalesDummy.class, "Sales");
  var cashBillDate = DateUtils.now("dd-MM-yyyy") on replace {
//    commonController=new CommonController();
    getAutoVal = commonController.getAutoIncrement(cashBillDate,"DummySales")};
var dateFlag: Boolean = false;
var fxCalendar: FXCalendar = FXCalendar { theme: Theme {}; };
//var commonController1:CommonImplements=new CommonController();
var tinNo = commonController.getShopTinNo();
var vatAmt;
var rowNo = 14;
var colNames: Object[] = ["S.No.", "Code", "Particulars", "Form.", "Qty.", "Batch No.", " Expiry", "Price", "MRP", "Disc %", "VAT %", "Amount"];

var colType: Class[] = [java.lang.Integer.class, java.lang.String.class, java.lang.String.class,
            java.lang.String.class, java.lang.Integer.class, java.lang.String.class,
            java.lang.String.class, java.lang.Double.class, java.lang.Double.class,
            java.lang.Double.class, java.lang.Double.class, java.lang.Double.class];

var colEditable: Boolean[] = [false, false, false, false, true, true, false, true, false, true, false, false];
var colWidth: Integer[] = [40, 60, 125, 75, 40, 66, 66, 50, 46, 40, 40, 80];
var pntName: List = new ArrayList();
var getAutoVal = commonController.getAutoIncrement(cashBillDate,"DummySales");
var dummyTable = DummySalesTableObj.createTable(rowNo, colNames, colType, colEditable, colWidth, "Sales");
var salesDummyTable = SwingComponent.wrap(DummySalesTableObj.getScrollTable(dummyTable));
    var s: String;
    var panelW = bind CommonDeclare.panelFormW on replace {
        listSalesCash.visible = false;
    }
    var panelH = bind CommonDeclare.panelFormH;
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var C1LX = bind CommonDeclare.Column1LX;
    var C2LX = bind CommonDeclare.Column2LX;
    var C3LX = bind CommonDeclare.Column3LX;
    var C4LX = bind CommonDeclare.Column4LX;
    var botton1LX = bind CommonDeclare.botton31LX;
    var botton2LX = bind CommonDeclare.botton32LX;
    var botton3LX = bind CommonDeclare.botton33LX;

    var botton21LX=bind CommonDeclare.botton2LX;
    var botton22LX=bind CommonDeclare.botton3LX;

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
    var panelCalenderLX = bind C4LX;
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
    var TableW = bind (95.29860229 * panelW) / 100 on replace { changeTableSize(TableW); };
    var TableH=290.0;
    var panelTableLX = bind (panelW - TableW) / 2;
    var panelTableLY =85.0;
    var rectRemoveRowLX = bind ((panelW + TableW) / 2) - 120;
    var rectRemoveRowLY = bind (panelTableLY + TableH);
    function changeTableSize(i: Integer): Void {
        salesDummyTable.getJComponent().setPreferredSize(new Dimension(i, TableH));
    }

    var BottomC1LX = bind CommonDeclare.BottomC1LX;
    var BottomC2LX = bind CommonDeclare.BottomC2LX;
    var BottomC3LX = bind CommonDeclare.BottomC3LX;
    var BottomC4LX = bind CommonDeclare.BottomC4LX;
    var valid1:Validation;
    var settingsController : com.vanuston.medeil.implementation.Settings =  RegistryFactory.getClientStub(RegistryConstants.Configuration) as com.vanuston.medeil.implementation.Settings;
    
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def panelForm: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
    }
    
    public-read def panelDocInfo: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
    }
    
    public-read def panelCustInfo: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
    }
    
    public-read def imageView2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnSaveOnly: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnSaveOnly: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton2LX
        layoutY: 534.0
        layoutInfo: __layoutInfo_btnSaveOnly
        graphic: imageView2
        text: "Button"
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imageView3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_listView: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 733.0
        height: 218.0
    }
    public-read def listView: javafx.scene.control.ListView = javafx.scene.control.ListView {
        layoutX: 50.0
        layoutY: 145.0
        layoutInfo: __layoutInfo_listView
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    def __layoutInfo_separator: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def separator: javafx.scene.control.Separator = javafx.scene.control.Separator {
        visible: false
        layoutX: 325.0
        layoutY: 49.0
        layoutInfo: __layoutInfo_separator
    }
    
    public-read def rectRemoveRow: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind rectRemoveRowLX
        layoutY: bind rectRemoveRowLY
        width: 120.0
        height: 50.0
    }
    
    def __layoutInfo_LabelRemoveRow: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def LabelRemoveRow: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind rectRemoveRowLX
        layoutY: bind rectRemoveRowLY
        layoutInfo: __layoutInfo_LabelRemoveRow
        text: "Remove Row  [F12]"
    }
    
    def __layoutInfo_lblSalesCaBillNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def lblSalesCaBillNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX
        layoutInfo: __layoutInfo_lblSalesCaBillNo
    }
    
    public-read def CashDatePicker: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind ImageCalenderLX
        layoutY: 75.0
    }
    
    public-read def label15: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 397.0
        layoutY: 499.0
        text: "Label"
    }
    
    def __layoutInfo_txtSalesCaDiscount: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSalesCaDiscount: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtSalesCaDiscount
        styleClass: "Borderless-text-box"
    }
    
    def __layoutInfo_txtSalesCaVAT123: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSalesCaVAT123: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 468.0
        layoutY: 499.0
        layoutInfo: __layoutInfo_txtSalesCaVAT123
        styleClass: "Borderless-text-box"
    }
    
    public-read def label12: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def panelTable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
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
    
    def __layoutInfo_txtSalesCaRoundAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSalesCaRoundAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: true
        layoutInfo: __layoutInfo_txtSalesCaRoundAmt
        onKeyTyped: txtSalesCaRoundAmtOnKeyTyped
    }
    
    public-read def label16: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_rectButton: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def rectButton: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind rectbuttonLX
        layoutY: 531.0
        layoutInfo: __layoutInfo_rectButton
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
    
    def __layoutInfo_listSalesCash: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
        height: bind listH
    }
    public-read def listSalesCash: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutInfo: __layoutInfo_listSalesCash
        items: null
    }
    
    public-read def panelCalender: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelCalenderLX
        layoutY: 90.0
    }
    
    def __layoutInfo_panelMsgBx1: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def panelMsgBx1: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutInfo: __layoutInfo_panelMsgBx1
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
    
    def __layoutInfo_txtSalesCaBalAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSalesCaBalAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 678.0
        layoutY: 444.0
        layoutInfo: __layoutInfo_txtSalesCaBalAmt
        styleClass: "Borderless-text-box"
        text: "100.00"
        font: Arial_12
    }
    
    def __layoutInfo_txtSalesCaSubTotal: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSalesCaSubTotal: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 2.0
        layoutY: 1.0
        layoutInfo: __layoutInfo_txtSalesCaSubTotal
        styleClass: "Borderless-text-box"
        text: "100.00"
        font: Arial_12
    }
    
    def __layoutInfo_txtSalesCaNetPaid: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSalesCaNetPaid: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 678.0
        layoutY: 421.0
        layoutInfo: __layoutInfo_txtSalesCaNetPaid
        styleClass: "text-box"
        text: "100.00"
        font: Arial_12
    }
    
    def __layoutInfo_panelTxtColumn2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def panelTxtColumn2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind BottomC4LX
        layoutY: 416.0
        layoutInfo: __layoutInfo_panelTxtColumn2
        content: [ txtSalesCaNetPaid, txtSalesCaSubTotal, txtSalesCaBalAmt, txtSalesCaRoundAmt, ]
    }
    
    def __layoutInfo_txtSalesCaVAT4: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSalesCaVAT4: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 24.0
        layoutInfo: __layoutInfo_txtSalesCaVAT4
        styleClass: "Borderless-text-box"
        text: "100.00"
        font: Arial_12
    }
    
    def __layoutInfo_lblSalesCaTotalQty: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type5TextboxW
    }
    public-read def lblSalesCaTotalQty: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 135.0
        layoutY: 419.0
        layoutInfo: __layoutInfo_lblSalesCaTotalQty
        styleClass: "Borderless-text-box"
        font: Arial_12
    }
    
    def __layoutInfo_lblSalesCaTotalItm: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type5TextboxW
    }
    public-read def lblSalesCaTotalItm: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 135.0
        layoutY: 392.0
        layoutInfo: __layoutInfo_lblSalesCaTotalItm
        styleClass: "Borderless-text-box"
        font: Arial_12
    }
    
    public-read def panelTxtColumn1: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind BottomC2LX
        layoutY: 31.0
        content: [ lblSalesCaTotalItm, lblSalesCaTotalQty, txtSalesCaDiscount, txtSalesCaVAT4, txtSalesCaVAT123, ]
    }
    
    def __layoutInfo_txtSalesCaPName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
        hfill: false
    }
    public-read def txtSalesCaPName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 34.0
        layoutInfo: __layoutInfo_txtSalesCaPName
        style: ""
        styleClass: "text-box"
        effect: null
        text: ""
        promptText: "Enter Customer Name"
        font: Arial_12
    }
    
    def __layoutInfo_txtSalesCaDName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtSalesCaDName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 121.0
        layoutInfo: __layoutInfo_txtSalesCaDName
        font: Arial_12
    }
    
    def __layoutInfo_txtSalesCaDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtSalesCaDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 75.0
        layoutInfo: __layoutInfo_txtSalesCaDate
        text: bind cashBillDate
        font: Arial_12
    }
    
    def __layoutInfo_lblSalesCaTIN: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def lblSalesCaTIN: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind LabelTINLX+45
        layoutY: 75.0
        layoutInfo: __layoutInfo_lblSalesCaTIN
        styleClass: "Borderless-text-box"
        text: bind tinNo
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
    
    def __layoutInfo_btnSalesCaReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnSalesCaReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton3LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnSalesCaReset
        effect: reflectionEffect
        graphic: imageView3
        text: "Reset [F4]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnSalesCaSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnSalesCaSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnSalesCaSave
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
        content: [ btnSaveOnly, btnSalesCaSave, btnSalesCaReset, ]
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
        layoutX: bind BottomC3LX
        content: [ label13, label4, label7, label12, ]
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
        content: [ label10, label11, label6, label1, label15, ]
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 98.0
        styleClass: "label"
        text: "Patient Name"
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
    
    public-read def label14: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 75.0
        text: "Bill No"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 75.0
        text: "Date"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind LabelTINLX
        layoutY: 75.0
        text: "TIN No"
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
        red: 0.05
        green: 0.32
        blue: 0.07
    }
    
    public-read def dropShadowEffect: javafx.scene.effect.DropShadow = javafx.scene.effect.DropShadow {
    }
    
    public-read def lightingEffect: javafx.scene.effect.Lighting = javafx.scene.effect.Lighting {
    }
    
    def __layoutInfo_label: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
    }
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 1.0
        layoutInfo: __layoutInfo_label
        styleClass: "labelFormHeading"
        effect: lightingEffect
        text: "Dummy Bill"
        font: Arial_25
    }
    
    public-read def Orange: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.8
        blue: 0.4
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
    
    def __layoutInfo_txtSalesCaToalAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind AmtTextW
    }
    public-read def txtSalesCaToalAmt: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 344.0
        layoutY: 398.0
        layoutInfo: __layoutInfo_txtSalesCaToalAmt
        graphic: label16
        text: "Total Amount"
        font: Arial_20
        textFill: Gray
    }
    
    public-read def panelAmt: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind AmtPanelLX
        layoutY: 6.0
        content: [ txtSalesCaToalAmt, ]
    }
    
    public-read def Yellow: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.95686275
        green: 0.9490196
        blue: 0.8627451
    }
    
    public-read def reflectionEffect2: javafx.scene.effect.Reflection = javafx.scene.effect.Reflection {
    }
    
    public-read def linearGradient2: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
    }
    
    public-read def linearGradientHeader: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
    }
    
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 0.25
        layoutY: 0.0
        fill: linearGradientHeader
        width: bind panelW
        height: 32.0
    }
    
    public-read def panelTitlebar: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ rectangle, rectHeader, label, ]
    }
    
    public-read def Arial_Bold__65: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 65.0
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
        visible: true
        layoutX: bind botton21LX
        layoutY: bind panelButtonsLY
        layoutInfo: __layoutInfo_btnCustDocSave
        graphic: imageView4
        text: "Save [F3]"
        font: Arial_Bold_14
        action: btnCustDocSaveAction
    }
    
    public-read def imageReset: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Reset.png"
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imgPName: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind imgClickdownLX
        layoutY: bind imgClickdownLY
        image: image
        fitWidth: bind imgClickdownW
        fitHeight: bind imgClickdownH
    }
    
    public-read def image2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imgDName: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind imgClickdown1LX
        layoutY: bind imgClickdownLY
        image: image2
        fitWidth: bind imgClickdownW
        fitHeight: bind imgClickdownH
    }
    
    public-read def panelTopSection: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ lblSalesCaBillNo, lblSalesCaTIN, txtSalesCaDate, txtSalesCaDName, CashDatePicker, label3, label9, label14, label8, txtSalesCaPName, label2, imgPName, imgDName, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ panelButtons, listView, separator, rectRemoveRow, LabelRemoveRow, panelTopSection, panelLblColumn1, panelTxtColumn1, panelLblColumn2, panelTable, rectTableBorder, panelTxtColumn2, panelAmt, rectButton, lblBillHistory, listSalesCash, panelCalender, panelMsgBx1, panelAlert, ]
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
        visible: true
        layoutX: bind botton22LX
        layoutY: bind panelButtonsLY
        layoutInfo: __layoutInfo_btnSalesBack
        graphic: imageView5
        text: "Back to Sales"
        font: Arial_Bold_14
    }
    
    public-read def panelBack: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
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
                            panelForm.visible = false;
                            panelDocInfo.visible = false;
                            panelCustInfo.visible = false;
                            btnCustDocSave.visible = true;
                            btnSalesBack.visible = true;
                            btnSalesBack.text = "Back to Sales";
                            btnSalesBack.font = Arial_Bold_14;
                            panelBack.visible = false;
                            rectangle.visible = true;
                            rectangle.strokeWidth = 1.0;
                            rectangle.arcWidth = 5.0;
                            rectangle.arcHeight = 5.0;
                            rectHeader.visible = true;
                            rectHeader.layoutX = 0.0;
                            rectHeader.styleClass = "rectFormHeader";
                            rectHeader.fill = linearGradient2;
                            rectHeader.height = 32.0;
                            rectHeader.arcWidth = 5.0;
                            rectHeader.arcHeight = 5.0;
                            label.layoutX = 0.0;
                            label.effect = null;
                            label.text = "Dummy Bill - ctrl+D";
                            label.font = Arial_25;
                            label.hpos = javafx.geometry.HPos.CENTER;
                            label.textFill = javafx.scene.paint.Color.BLACK;
                            panelTitlebar.visible = true;
                            imageView2.visible = true;
                            imageView2.image = imageSave;
                            btnSaveOnly.visible = true;
                            btnSaveOnly.cursor = null;
                            btnSaveOnly.layoutY = 0.0;
                            btnSaveOnly.onKeyPressed = btnSaveOnlyOnKeyPressedAtShown;
                            btnSaveOnly.effect = reflectionEffect;
                            btnSaveOnly.text = "Save [F3]";
                            btnSaveOnly.font = Arial_Bold_14;
                            btnSaveOnly.action = btnSaveOnlyActionAtShown;
                            imageView.visible = true;
                            imageView.image = imagePrint;
                            btnSalesCaSave.layoutY = 0.0;
                            btnSalesCaSave.onKeyPressed = btnSalesCaSaveOnKeyPressedAtShown;
                            btnSalesCaSave.onKeyReleased = btnSalesCaSaveOnKeyReleasedAtShown;
                            btnSalesCaSave.action = btnSalesCaSaveActionAtShown;
                            imageView3.visible = true;
                            imageView3.image = imageReset;
                            btnSalesCaReset.layoutY = 0.0;
                            btnSalesCaReset.onKeyReleased = btnSalesCaResetOnKeyReleasedAtShown;
                            btnSalesCaReset.text = "Reset [F4]";
                            btnSalesCaReset.action = btnSalesCaResetActionAtShown;
                            panelButtons.visible = true;
                            listView.layoutX = 20.0;
                            listView.layoutY = 120.0;
                            __layoutInfo_listView.width = 750.0;
                            __layoutInfo_listView.height = 268.0;
                            listView.items = null;
                            separator.visible = false;
                            separator.layoutX = 30.0;
                            separator.layoutY = 50.0;
                            __layoutInfo_separator.width = 725.0;
                            __layoutInfo_separator.height = 0.0;
                            rectRemoveRow.visible = true;
                            rectRemoveRow.styleClass = "rectbutton";
                            rectRemoveRow.onMouseClicked = rectRemoveRowOnMouseClickedAtShown;
                            rectRemoveRow.fill = Yellow;
                            rectRemoveRow.stroke = DarkGray;
                            rectRemoveRow.strokeWidth = 1.0;
                            rectRemoveRow.height = 20.0;
                            rectRemoveRow.arcWidth = 10.0;
                            rectRemoveRow.arcHeight = 10.0;
                            LabelRemoveRow.visible = true;
                            __layoutInfo_LabelRemoveRow.width = 120.0;
                            __layoutInfo_LabelRemoveRow.height = 20.0;
                            LabelRemoveRow.font = Arial_Bold_12;
                            LabelRemoveRow.hpos = javafx.geometry.HPos.CENTER;
                            LabelRemoveRow.textFill = DarkGray;
                            lblSalesCaBillNo.visible = true;
                            lblSalesCaBillNo.layoutY = 30.0;
                            lblSalesCaBillNo.styleClass = "text-box";
                            lblSalesCaBillNo.onKeyPressed = lblSalesCaBillNoOnKeyPressedAtShown;
                            lblSalesCaBillNo.editable = true;
                            lblSalesCaBillNo.font = Arial_Bold_14;
                            lblSalesCaTIN.layoutY = 30.0;
                            lblSalesCaTIN.editable = false;
                            lblSalesCaTIN.font = Arial_Bold_14;
                            txtSalesCaDate.layoutY = 30.0;
                            txtSalesCaDate.onKeyPressed = txtSalesCaDateOnKeyPressedAtShown;
                            txtSalesCaDate.editable = false;
                            txtSalesCaDName.layoutY = 55.0;
                            txtSalesCaDName.onKeyPressed = txtSalesCaDNameOnKeyPressedAtShown;
                            txtSalesCaDName.onKeyReleased = txtSalesCaDNameOnKeyReleasedAtShown;
                            txtSalesCaDName.promptText = "Enter Doctor Name";
                            CashDatePicker.visible = true;
                            CashDatePicker.layoutY = 30.0;
                            CashDatePicker.onMouseClicked = CashDatePickerOnMouseClickedAtShown;
                            CashDatePicker.blocksMouse = true;
                            label3.layoutY = 30.0;
                            label3.text = "TIN No.";
                            label9.layoutY = 30.0;
                            label14.layoutY = 30.0;
                            label14.text = "Bill No.";
                            label8.layoutY = 55.0;
                            txtSalesCaPName.layoutY = 55.0;
                            txtSalesCaPName.onKeyPressed = txtSalesCaPNameOnKeyPressedAtShown;
                            txtSalesCaPName.onKeyReleased = txtSalesCaPNameOnKeyReleasedAtShown;
                            label2.layoutY = 55.0;
                            label2.text = "Customer Name";
                            imgPName.visible = true;
                            imgPName.onMouseClicked = imgPNameOnMouseClickedAtShown;
                            imgPName.scaleX = 1.0;
                            imgPName.scaleY = 1.0;
                            imgDName.visible = true;
                            imgDName.onMouseClicked = imgDNameOnMouseClickedAtShown;
                            imgDName.scaleX = 1.0;
                            imgDName.scaleY = 1.0;
                            panelTopSection.visible = true;
                            panelTopSection.layoutY = 5.0;
                            label10.layoutX = 0.0;
                            label10.layoutY = 0.0;
                            label10.text = "Products";
                            label11.layoutX = 0.0;
                            label11.layoutY = 25.0;
                            label11.text = "Quantity";
                            label6.layoutX = 0.0;
                            label6.layoutY = 50.0;
                            label6.text = "Discount";
                            label1.layoutX = 0.0;
                            label1.layoutY = 75.0;
                            label1.text = "Total VAT";
                            label15.visible = false;
                            label15.layoutX = 0.0;
                            label15.layoutY = 100.0;
                            label15.text = "VAT 12.5%";
                            label15.font = Arial_12;
                            label15.textFill = DarkGray;
                            panelLblColumn1.visible = true;
                            panelLblColumn1.layoutY = 380.0;
                            lblSalesCaTotalItm.layoutX = 0.0;
                            lblSalesCaTotalItm.layoutY = 0.0;
                            lblSalesCaTotalItm.styleClass = "text-box";
                            lblSalesCaTotalItm.promptText = "0";
                            lblSalesCaTotalItm.selectOnFocus = false;
                            lblSalesCaTotalItm.editable = false;
                            lblSalesCaTotalQty.managed = true;
                            lblSalesCaTotalQty.layoutX = 0.0;
                            lblSalesCaTotalQty.layoutY = 25.0;
                            lblSalesCaTotalQty.styleClass = "text-box";
                            lblSalesCaTotalQty.promptText = "0";
                            lblSalesCaTotalQty.selectOnFocus = false;
                            lblSalesCaTotalQty.editable = false;
                            txtSalesCaDiscount.visible = true;
                            txtSalesCaDiscount.layoutY = 50.0;
                            txtSalesCaDiscount.styleClass = "text-box";
                            txtSalesCaDiscount.onKeyPressed = txtSalesCaDiscountOnKeyPressedAtShown;
                            txtSalesCaDiscount.onKeyTyped = txtSalesCaDiscountOnKeyTypedAtShown;
                            txtSalesCaDiscount.promptText = "0.00";
                            txtSalesCaDiscount.selectOnFocus = false;
                            txtSalesCaDiscount.editable = true;
                            txtSalesCaDiscount.font = Arial_12;
                            txtSalesCaVAT4.layoutX = 0.0;
                            txtSalesCaVAT4.layoutY = 75.0;
                            txtSalesCaVAT4.styleClass = "text-box";
                            txtSalesCaVAT4.text = "";
                            txtSalesCaVAT4.promptText = "0.00";
                            txtSalesCaVAT4.selectOnFocus = false;
                            txtSalesCaVAT4.editable = false;
                            txtSalesCaVAT123.visible = false;
                            txtSalesCaVAT123.layoutX = 0.0;
                            txtSalesCaVAT123.layoutY = 100.0;
                            txtSalesCaVAT123.styleClass = "text-box";
                            txtSalesCaVAT123.promptText = "0.00";
                            txtSalesCaVAT123.selectOnFocus = false;
                            txtSalesCaVAT123.editable = false;
                            txtSalesCaVAT123.font = Arial_12;
                            panelTxtColumn1.visible = true;
                            panelTxtColumn1.layoutY = 380.0;
                            label13.layoutX = 0.0;
                            label13.layoutY = 0.0;
                            label4.layoutX = 0.0;
                            label4.layoutY = 25.0;
                            label4.text = "Subtotal";
                            label7.layoutX = 0.0;
                            label7.layoutY = 50.0;
                            label12.visible = true;
                            label12.layoutY = 75.0;
                            label12.text = "Rounded Off";
                            label12.font = Arial_12;
                            label12.textFill = DarkGray;
                            panelLblColumn2.visible = true;
                            panelLblColumn2.layoutY = 380.0;
                            panelTable.visible = true;
                            panelTable.blocksMouse = true;
                            rectTableBorder.visible = true;
                            txtSalesCaNetPaid.layoutX = 0.0;
                            txtSalesCaNetPaid.layoutY = 0.0;
                            __layoutInfo_txtSalesCaNetPaid.height = 22.0;
                            txtSalesCaNetPaid.styleClass = "text-box";
                            txtSalesCaNetPaid.onKeyPressed = txtSalesCaNetPaidOnKeyPressedAtShown;
                            txtSalesCaNetPaid.onKeyReleased = txtSalesCaNetPaidOnKeyReleasedAtShown;
                            txtSalesCaNetPaid.text = "";
                            txtSalesCaNetPaid.promptText = "0.00";
                            txtSalesCaNetPaid.editable = false;
                            txtSalesCaNetPaid.font = Arial_Bold_16;
                            txtSalesCaSubTotal.layoutX = 0.0;
                            txtSalesCaSubTotal.layoutY = 28.0;
                            txtSalesCaSubTotal.styleClass = "text-box";
                            txtSalesCaSubTotal.onKeyPressed = txtSalesCaSubTotalOnKeyPressedAtShown;
                            txtSalesCaSubTotal.text = "";
                            txtSalesCaSubTotal.promptText = "0.00";
                            txtSalesCaSubTotal.selectOnFocus = false;
                            txtSalesCaSubTotal.editable = false;
                            txtSalesCaSubTotal.font = Arial_12;
                            txtSalesCaBalAmt.layoutX = 0.0;
                            txtSalesCaBalAmt.layoutY = 50.0;
                            txtSalesCaBalAmt.styleClass = "text-box";
                            txtSalesCaBalAmt.text = "";
                            txtSalesCaBalAmt.promptText = "0.00";
                            txtSalesCaBalAmt.selectOnFocus = false;
                            txtSalesCaBalAmt.editable = false;
                            txtSalesCaRoundAmt.visible = true;
                            txtSalesCaRoundAmt.layoutY = 75.0;
                            txtSalesCaRoundAmt.onKeyPressed = txtSalesCaRoundAmtOnKeyPressedAtShown;
                            txtSalesCaRoundAmt.font = Arial_12;
                            panelTxtColumn2.visible = true;
                            panelTxtColumn2.layoutY = 380.0;
                            __layoutInfo_panelTxtColumn2.width = 100.0;
                            __layoutInfo_panelTxtColumn2.height = 100.0;
                            label16.visible = true;
                            label16.text = "Total";
                            label16.font = Arial_20;
                            label16.textFill = Gray;
                            txtSalesCaToalAmt.layoutX = 0.0;
                            txtSalesCaToalAmt.layoutY = 0.0;
                            txtSalesCaToalAmt.text = "0.00";
                            txtSalesCaToalAmt.font = Arial_Bold__65;
                            txtSalesCaToalAmt.textAlignment = javafx.scene.text.TextAlignment.RIGHT;
                            txtSalesCaToalAmt.hpos = javafx.geometry.HPos.RIGHT;
                            txtSalesCaToalAmt.textFill = DarkGray;
                            panelAmt.visible = true;
                            panelAmt.layoutY = 400.0;
                            rectButton.visible = false;
                            rectButton.managed = true;
                            rectButton.layoutY = 520.0;
                            __layoutInfo_rectButton.width = 100.0;
                            __layoutInfo_rectButton.height = 25.0;
                            rectButton.styleClass = "rectbutton";
                            rectButton.onMouseClicked = rectButtonOnMouseClickedAtShown;
                            rectButton.effect = null;
                            rectButton.fill = Yellow;
                            rectButton.stroke = DarkGray;
                            rectButton.strokeWidth = 1.0;
                            rectButton.width = 100.0;
                            rectButton.height = 20.0;
                            rectButton.arcWidth = 10.0;
                            rectButton.arcHeight = 10.0;
                            lblBillHistory.visible = false;
                            lblBillHistory.opacity = 1.0;
                            lblBillHistory.layoutY = 523.0;
                            __layoutInfo_lblBillHistory.width = 100.0;
                            lblBillHistory.text = " Bill History >>";
                            lblBillHistory.font = Arial_Bold_12;
                            lblBillHistory.hpos = javafx.geometry.HPos.CENTER;
                            lblBillHistory.textFill = DarkGray;
                            listSalesCash.visible = false;
                            listSalesCash.onKeyPressed = listSalesCashOnKeyPressedAtShown;
                            panelCalender.visible = true;
                            panelCalender.layoutY = 80.0;
                            panelMsgBx1.visible = false;
                            panelMsgBx1.layoutX = 190.0;
                            panelMsgBx1.layoutY = 199.0;
                            __layoutInfo_panelMsgBx1.width = 500.0;
                            __layoutInfo_panelMsgBx1.height = 300.0;
                            panel.visible = true;
                            reflectionEffect2.topOpacity = 0.17;
                            reflectionEffect2.bottomOpacity = 0.0;
                            reflectionEffect2.fraction = 0.72;
                        }
                    }
                ]
            }
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            panelForm.visible = false;
                            panelDocInfo.visible = true;
                            panelCustInfo.visible = false;
                            btnCustDocSave.visible = true;
                            btnSalesBack.visible = true;
                            btnSalesBack.text = "Back to Sales";
                            btnSalesBack.font = Arial_Bold_14;
                            btnSalesBack.action = btnSalesBackActionAtSalesMaintain;
                            panelBack.visible = true;
                            rectangle.visible = false;
                            rectangle.strokeWidth = 2.0;
                            rectangle.arcWidth = 5.0;
                            rectangle.arcHeight = 5.0;
                            rectHeader.visible = false;
                            rectHeader.layoutX = 0.0;
                            rectHeader.styleClass = "";
                            rectHeader.fill = linearGradientHeader;
                            rectHeader.height = 32.0;
                            rectHeader.arcWidth = 0.0;
                            rectHeader.arcHeight = 0.0;
                            label.layoutX = 0.0;
                            label.effect = null;
                            label.text = "Dummy Bill";
                            label.font = Arial_25;
                            label.hpos = javafx.geometry.HPos.CENTER;
                            label.textFill = javafx.scene.paint.Color.BLACK;
                            panelTitlebar.visible = false;
                            imageView2.visible = false;
                            imageView2.image = null;
                            btnSaveOnly.visible = false;
                            btnSaveOnly.layoutY = 534.0;
                            btnSaveOnly.text = "Button";
                            imageView.visible = false;
                            imageView.image = null;
                            btnSalesCaSave.layoutY = 525.0;
                            btnSalesCaSave.onKeyPressed = btnSalesCaSaveOnKeyPressedAtShown;
                            btnSalesCaSave.onKeyReleased = btnSalesCaSaveOnKeyReleasedAtShown;
                            btnSalesCaSave.action = btnSalesCaSaveActionAtShown;
                            imageView3.visible = false;
                            imageView3.image = null;
                            btnSalesCaReset.layoutY = 525.0;
                            btnSalesCaReset.onKeyReleased = btnSalesCaResetOnKeyReleasedAtShown;
                            btnSalesCaReset.text = "Reset [F4]";
                            btnSalesCaReset.action = btnSalesCaResetActionAtShown;
                            panelButtons.visible = false;
                            listView.layoutX = 20.0;
                            listView.layoutY = 120.0;
                            __layoutInfo_listView.width = 750.0;
                            __layoutInfo_listView.height = 288.0;
                            listView.items = null;
                            separator.visible = false;
                            separator.layoutX = 30.0;
                            separator.layoutY = 50.0;
                            __layoutInfo_separator.width = 725.0;
                            __layoutInfo_separator.height = 0.0;
                            rectRemoveRow.visible = true;
                            rectRemoveRow.styleClass = "rectbutton";
                            rectRemoveRow.onMouseClicked = rectRemoveRowOnMouseClickedAtShown;
                            rectRemoveRow.fill = Yellow;
                            rectRemoveRow.stroke = DarkGray;
                            rectRemoveRow.strokeWidth = 1.0;
                            rectRemoveRow.height = 20.0;
                            rectRemoveRow.arcWidth = 10.0;
                            rectRemoveRow.arcHeight = 10.0;
                            LabelRemoveRow.visible = true;
                            __layoutInfo_LabelRemoveRow.width = 100.0;
                            LabelRemoveRow.font = Arial_Bold_12;
                            LabelRemoveRow.hpos = javafx.geometry.HPos.CENTER;
                            LabelRemoveRow.textFill = DarkGray;
                            lblSalesCaBillNo.visible = false;
                            lblSalesCaBillNo.layoutY = 0.0;
                            lblSalesCaBillNo.styleClass = "text-box";
                            lblSalesCaBillNo.editable = true;
                            lblSalesCaTIN.layoutY = 85.0;
                            lblSalesCaTIN.editable = false;
                            lblSalesCaTIN.font = Arial_12;
                            txtSalesCaDate.layoutY = 60.0;
                            txtSalesCaDate.onKeyPressed = txtSalesCaDateOnKeyPressedAtShown;
                            txtSalesCaDate.editable = false;
                            txtSalesCaDName.layoutY = 85.0;
                            txtSalesCaDName.onKeyPressed = txtSalesCaDNameOnKeyPressedAtShown;
                            txtSalesCaDName.onKeyReleased = txtSalesCaDNameOnKeyReleasedAtShown;
                            txtSalesCaDName.promptText = "Enter Doctor Name";
                            CashDatePicker.visible = true;
                            CashDatePicker.layoutY = 60.0;
                            CashDatePicker.onMouseClicked = CashDatePickerOnMouseClickedAtShown;
                            CashDatePicker.blocksMouse = false;
                            label3.layoutY = 60.0;
                            label3.text = "TIN No";
                            label9.layoutY = 60.0;
                            label14.layoutY = 60.0;
                            label14.text = "Bill No";
                            label8.layoutY = 85.0;
                            txtSalesCaPName.layoutY = 85.0;
                            txtSalesCaPName.onKeyPressed = txtSalesCaPNameOnKeyPressedAtShown;
                            txtSalesCaPName.onKeyReleased = txtSalesCaPNameOnKeyReleasedAtShown;
                            label2.layoutY = 85.0;
                            label2.text = "Customer Name";
                            imgPName.visible = false;
                            imgPName.scaleX = 1.0;
                            imgPName.scaleY = 1.0;
                            imgDName.visible = false;
                            imgDName.scaleX = 1.0;
                            imgDName.scaleY = 1.0;
                            panelTopSection.visible = false;
                            panelTopSection.layoutY = 0.0;
                            label10.layoutX = 0.0;
                            label10.layoutY = 445.0;
                            label10.text = "Total Products";
                            label11.layoutX = 0.0;
                            label11.layoutY = 470.0;
                            label11.text = "Total Quantity";
                            label6.layoutX = 0.0;
                            label6.layoutY = 25.0;
                            label6.text = "Discount";
                            label1.layoutX = 0.0;
                            label1.layoutY = 50.0;
                            label1.text = "VAT";
                            label15.visible = false;
                            label15.layoutX = 397.0;
                            label15.layoutY = 499.0;
                            label15.text = "Label";
                            label15.textFill = javafx.scene.paint.Color.BLACK;
                            panelLblColumn1.visible = false;
                            panelLblColumn1.layoutY = 0.0;
                            lblSalesCaTotalItm.layoutX = 0.0;
                            lblSalesCaTotalItm.layoutY = 445.0;
                            lblSalesCaTotalItm.styleClass = "Borderless-text-box";
                            lblSalesCaTotalItm.promptText = "0";
                            lblSalesCaTotalItm.selectOnFocus = true;
                            lblSalesCaTotalItm.editable = false;
                            lblSalesCaTotalQty.managed = true;
                            lblSalesCaTotalQty.layoutX = 0.0;
                            lblSalesCaTotalQty.layoutY = 470.0;
                            lblSalesCaTotalQty.styleClass = "Borderless-text-box";
                            lblSalesCaTotalQty.promptText = "0";
                            lblSalesCaTotalQty.selectOnFocus = true;
                            lblSalesCaTotalQty.editable = false;
                            txtSalesCaDiscount.visible = false;
                            txtSalesCaDiscount.layoutY = 0.0;
                            txtSalesCaDiscount.styleClass = "Borderless-text-box";
                            txtSalesCaDiscount.promptText = null;
                            txtSalesCaDiscount.selectOnFocus = true;
                            txtSalesCaDiscount.editable = true;
                            txtSalesCaVAT4.layoutX = 0.0;
                            txtSalesCaVAT4.layoutY = 0.0;
                            txtSalesCaVAT4.styleClass = "Borderless-text-box";
                            txtSalesCaVAT4.text = "";
                            txtSalesCaVAT4.promptText = "0.00";
                            txtSalesCaVAT4.selectOnFocus = true;
                            txtSalesCaVAT4.editable = false;
                            txtSalesCaVAT123.visible = false;
                            txtSalesCaVAT123.layoutX = 468.0;
                            txtSalesCaVAT123.layoutY = 499.0;
                            txtSalesCaVAT123.styleClass = "Borderless-text-box";
                            txtSalesCaVAT123.promptText = null;
                            txtSalesCaVAT123.selectOnFocus = true;
                            txtSalesCaVAT123.editable = true;
                            panelTxtColumn1.visible = true;
                            panelTxtColumn1.layoutY = 0.0;
                            label13.layoutX = 70.0;
                            label13.layoutY = 445.0;
                            label4.layoutX = 0.0;
                            label4.layoutY = 0.0;
                            label4.text = "Subtotal";
                            label7.layoutX = 70.0;
                            label7.layoutY = 470.0;
                            label12.visible = false;
                            label12.layoutY = 0.0;
                            label12.text = "Label";
                            label12.textFill = javafx.scene.paint.Color.BLACK;
                            panelLblColumn2.visible = false;
                            panelLblColumn2.layoutY = 0.0;
                            panelTable.visible = true;
                            panelTable.blocksMouse = true;
                            rectTableBorder.visible = false;
                            txtSalesCaNetPaid.layoutX = 50.0;
                            txtSalesCaNetPaid.layoutY = 445.0;
                            txtSalesCaNetPaid.styleClass = "text-box";
                            txtSalesCaNetPaid.onKeyPressed = txtSalesCaNetPaidOnKeyPressedAtShown;
                            txtSalesCaNetPaid.text = "";
                            txtSalesCaNetPaid.promptText = "0.00";
                            txtSalesCaNetPaid.editable = true;
                            txtSalesCaNetPaid.font = Arial_Bold_12;
                            txtSalesCaSubTotal.layoutX = 0.0;
                            txtSalesCaSubTotal.layoutY = 0.0;
                            txtSalesCaSubTotal.styleClass = "Borderless-text-box";
                            txtSalesCaSubTotal.onKeyPressed = txtSalesCaSubTotalOnKeyPressedAtShown;
                            txtSalesCaSubTotal.text = "";
                            txtSalesCaSubTotal.promptText = "0.00";
                            txtSalesCaSubTotal.selectOnFocus = true;
                            txtSalesCaSubTotal.editable = false;
                            txtSalesCaSubTotal.font = Arial_12;
                            txtSalesCaBalAmt.layoutX = 50.0;
                            txtSalesCaBalAmt.layoutY = 470.0;
                            txtSalesCaBalAmt.styleClass = "Borderless-text-box";
                            txtSalesCaBalAmt.text = "";
                            txtSalesCaBalAmt.promptText = "0.00";
                            txtSalesCaBalAmt.selectOnFocus = true;
                            txtSalesCaBalAmt.editable = false;
                            txtSalesCaRoundAmt.visible = true;
                            txtSalesCaRoundAmt.layoutY = 0.0;
                            panelTxtColumn2.visible = true;
                            panelTxtColumn2.layoutY = 445.0;
                            __layoutInfo_panelTxtColumn2.width = 100.0;
                            __layoutInfo_panelTxtColumn2.height = 100.0;
                            label16.visible = false;
                            label16.text = "Label";
                            label16.textFill = javafx.scene.paint.Color.BLACK;
                            txtSalesCaToalAmt.layoutX = 0.0;
                            txtSalesCaToalAmt.layoutY = 439.0;
                            txtSalesCaToalAmt.text = "Total Amount";
                            txtSalesCaToalAmt.font = Arial_20;
                            txtSalesCaToalAmt.textAlignment = javafx.scene.text.TextAlignment.LEFT;
                            txtSalesCaToalAmt.hpos = javafx.geometry.HPos.LEFT;
                            txtSalesCaToalAmt.textFill = Gray;
                            panelAmt.visible = true;
                            panelAmt.layoutY = 0.0;
                            rectButton.visible = true;
                            rectButton.managed = true;
                            rectButton.layoutY = 531.0;
                            __layoutInfo_rectButton.width = 100.0;
                            __layoutInfo_rectButton.height = 25.0;
                            rectButton.styleClass = "rectbutton";
                            rectButton.onMouseClicked = rectButtonOnMouseClickedAtShown;
                            rectButton.effect = null;
                            rectButton.fill = Yellow;
                            rectButton.stroke = DarkGray;
                            rectButton.strokeWidth = 1.0;
                            rectButton.width = 100.0;
                            rectButton.height = 20.0;
                            rectButton.arcWidth = 10.0;
                            rectButton.arcHeight = 10.0;
                            lblBillHistory.visible = true;
                            lblBillHistory.opacity = 1.0;
                            lblBillHistory.layoutY = 534.0;
                            __layoutInfo_lblBillHistory.width = 100.0;
                            lblBillHistory.text = " Bill History >>";
                            lblBillHistory.font = Arial_Bold_12;
                            lblBillHistory.hpos = javafx.geometry.HPos.CENTER;
                            lblBillHistory.textFill = DarkGray;
                            listSalesCash.visible = false;
                            panelCalender.visible = true;
                            panelCalender.layoutY = 80.0;
                            panelMsgBx1.visible = false;
                            panelMsgBx1.layoutX = 190.0;
                            panelMsgBx1.layoutY = 199.0;
                            __layoutInfo_panelMsgBx1.width = 500.0;
                            __layoutInfo_panelMsgBx1.height = 300.0;
                            panel.visible = false;
                            reflectionEffect2.topOpacity = 0.17;
                            reflectionEffect2.bottomOpacity = 0.0;
                            reflectionEffect2.fraction = 0.72;
                        }
                    }
                ]
            }
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            panelForm.visible = false;
                            panelDocInfo.visible = false;
                            panelCustInfo.visible = true;
                            btnCustDocSave.visible = true;
                            btnSalesBack.visible = true;
                            btnSalesBack.text = "Back to Sales";
                            btnSalesBack.font = Arial_Bold_14;
                            btnSalesBack.action = btnSalesBackActionAtSalesMaintain;
                            panelBack.visible = true;
                            rectangle.visible = false;
                            rectangle.strokeWidth = 2.0;
                            rectangle.arcWidth = 5.0;
                            rectangle.arcHeight = 5.0;
                            rectHeader.visible = false;
                            rectHeader.layoutX = 0.0;
                            rectHeader.styleClass = "";
                            rectHeader.fill = linearGradientHeader;
                            rectHeader.height = 32.0;
                            rectHeader.arcWidth = 0.0;
                            rectHeader.arcHeight = 0.0;
                            label.layoutX = 0.0;
                            label.effect = null;
                            label.text = "Dummy Bill";
                            label.font = Arial_25;
                            label.hpos = javafx.geometry.HPos.CENTER;
                            label.textFill = javafx.scene.paint.Color.BLACK;
                            panelTitlebar.visible = false;
                            imageView2.visible = false;
                            imageView2.image = null;
                            btnSaveOnly.visible = false;
                            btnSaveOnly.layoutY = 534.0;
                            btnSaveOnly.text = "Button";
                            imageView.visible = false;
                            imageView.image = null;
                            btnSalesCaSave.layoutY = 525.0;
                            btnSalesCaSave.onKeyPressed = btnSalesCaSaveOnKeyPressedAtShown;
                            btnSalesCaSave.onKeyReleased = btnSalesCaSaveOnKeyReleasedAtShown;
                            btnSalesCaSave.action = btnSalesCaSaveActionAtShown;
                            imageView3.visible = false;
                            imageView3.image = null;
                            btnSalesCaReset.layoutY = 525.0;
                            btnSalesCaReset.onKeyReleased = btnSalesCaResetOnKeyReleasedAtShown;
                            btnSalesCaReset.text = "Reset [F4]";
                            btnSalesCaReset.action = btnSalesCaResetActionAtShown;
                            panelButtons.visible = false;
                            listView.layoutX = 20.0;
                            listView.layoutY = 120.0;
                            __layoutInfo_listView.width = 750.0;
                            __layoutInfo_listView.height = 288.0;
                            listView.items = null;
                            separator.visible = false;
                            separator.layoutX = 30.0;
                            separator.layoutY = 50.0;
                            __layoutInfo_separator.width = 725.0;
                            __layoutInfo_separator.height = 0.0;
                            rectRemoveRow.visible = true;
                            rectRemoveRow.styleClass = "rectbutton";
                            rectRemoveRow.onMouseClicked = rectRemoveRowOnMouseClickedAtShown;
                            rectRemoveRow.fill = Yellow;
                            rectRemoveRow.stroke = DarkGray;
                            rectRemoveRow.strokeWidth = 1.0;
                            rectRemoveRow.height = 20.0;
                            rectRemoveRow.arcWidth = 10.0;
                            rectRemoveRow.arcHeight = 10.0;
                            LabelRemoveRow.visible = true;
                            __layoutInfo_LabelRemoveRow.width = 100.0;
                            LabelRemoveRow.font = Arial_Bold_12;
                            LabelRemoveRow.hpos = javafx.geometry.HPos.CENTER;
                            LabelRemoveRow.textFill = DarkGray;
                            lblSalesCaBillNo.visible = false;
                            lblSalesCaBillNo.layoutY = 0.0;
                            lblSalesCaBillNo.styleClass = "text-box";
                            lblSalesCaBillNo.editable = true;
                            lblSalesCaTIN.layoutY = 85.0;
                            lblSalesCaTIN.editable = false;
                            lblSalesCaTIN.font = Arial_12;
                            txtSalesCaDate.layoutY = 60.0;
                            txtSalesCaDate.onKeyPressed = txtSalesCaDateOnKeyPressedAtShown;
                            txtSalesCaDate.editable = false;
                            txtSalesCaDName.layoutY = 85.0;
                            txtSalesCaDName.onKeyPressed = txtSalesCaDNameOnKeyPressedAtShown;
                            txtSalesCaDName.onKeyReleased = txtSalesCaDNameOnKeyReleasedAtShown;
                            txtSalesCaDName.promptText = "Enter Doctor Name";
                            CashDatePicker.visible = true;
                            CashDatePicker.layoutY = 60.0;
                            CashDatePicker.onMouseClicked = CashDatePickerOnMouseClickedAtShown;
                            CashDatePicker.blocksMouse = false;
                            label3.layoutY = 60.0;
                            label3.text = "TIN No";
                            label9.layoutY = 60.0;
                            label14.layoutY = 60.0;
                            label14.text = "Bill No";
                            label8.layoutY = 85.0;
                            txtSalesCaPName.layoutY = 85.0;
                            txtSalesCaPName.onKeyPressed = txtSalesCaPNameOnKeyPressedAtShown;
                            txtSalesCaPName.onKeyReleased = txtSalesCaPNameOnKeyReleasedAtShown;
                            label2.layoutY = 85.0;
                            label2.text = "Customer Name";
                            imgPName.visible = false;
                            imgPName.scaleX = 1.0;
                            imgPName.scaleY = 1.0;
                            imgDName.visible = false;
                            imgDName.scaleX = 1.0;
                            imgDName.scaleY = 1.0;
                            panelTopSection.visible = false;
                            panelTopSection.layoutY = 0.0;
                            label10.layoutX = 0.0;
                            label10.layoutY = 445.0;
                            label10.text = "Total Products";
                            label11.layoutX = 0.0;
                            label11.layoutY = 470.0;
                            label11.text = "Total Quantity";
                            label6.layoutX = 0.0;
                            label6.layoutY = 25.0;
                            label6.text = "Discount";
                            label1.layoutX = 0.0;
                            label1.layoutY = 50.0;
                            label1.text = "VAT";
                            label15.visible = false;
                            label15.layoutX = 397.0;
                            label15.layoutY = 499.0;
                            label15.text = "Label";
                            label15.textFill = javafx.scene.paint.Color.BLACK;
                            panelLblColumn1.visible = false;
                            panelLblColumn1.layoutY = 0.0;
                            lblSalesCaTotalItm.layoutX = 0.0;
                            lblSalesCaTotalItm.layoutY = 445.0;
                            lblSalesCaTotalItm.styleClass = "Borderless-text-box";
                            lblSalesCaTotalItm.promptText = "0";
                            lblSalesCaTotalItm.selectOnFocus = true;
                            lblSalesCaTotalItm.editable = false;
                            lblSalesCaTotalQty.managed = true;
                            lblSalesCaTotalQty.layoutX = 0.0;
                            lblSalesCaTotalQty.layoutY = 470.0;
                            lblSalesCaTotalQty.styleClass = "Borderless-text-box";
                            lblSalesCaTotalQty.promptText = "0";
                            lblSalesCaTotalQty.selectOnFocus = true;
                            lblSalesCaTotalQty.editable = false;
                            txtSalesCaDiscount.visible = false;
                            txtSalesCaDiscount.layoutY = 0.0;
                            txtSalesCaDiscount.styleClass = "Borderless-text-box";
                            txtSalesCaDiscount.promptText = null;
                            txtSalesCaDiscount.selectOnFocus = true;
                            txtSalesCaDiscount.editable = true;
                            txtSalesCaVAT4.layoutX = 0.0;
                            txtSalesCaVAT4.layoutY = 0.0;
                            txtSalesCaVAT4.styleClass = "Borderless-text-box";
                            txtSalesCaVAT4.text = "";
                            txtSalesCaVAT4.promptText = "0.00";
                            txtSalesCaVAT4.selectOnFocus = true;
                            txtSalesCaVAT4.editable = false;
                            txtSalesCaVAT123.visible = false;
                            txtSalesCaVAT123.layoutX = 468.0;
                            txtSalesCaVAT123.layoutY = 499.0;
                            txtSalesCaVAT123.styleClass = "Borderless-text-box";
                            txtSalesCaVAT123.promptText = null;
                            txtSalesCaVAT123.selectOnFocus = true;
                            txtSalesCaVAT123.editable = true;
                            panelTxtColumn1.visible = true;
                            panelTxtColumn1.layoutY = 0.0;
                            label13.layoutX = 70.0;
                            label13.layoutY = 445.0;
                            label4.layoutX = 0.0;
                            label4.layoutY = 0.0;
                            label4.text = "Subtotal";
                            label7.layoutX = 70.0;
                            label7.layoutY = 470.0;
                            label12.visible = false;
                            label12.layoutY = 0.0;
                            label12.text = "Label";
                            label12.textFill = javafx.scene.paint.Color.BLACK;
                            panelLblColumn2.visible = false;
                            panelLblColumn2.layoutY = 0.0;
                            panelTable.visible = true;
                            panelTable.blocksMouse = true;
                            rectTableBorder.visible = false;
                            txtSalesCaNetPaid.layoutX = 50.0;
                            txtSalesCaNetPaid.layoutY = 445.0;
                            txtSalesCaNetPaid.styleClass = "text-box";
                            txtSalesCaNetPaid.onKeyPressed = txtSalesCaNetPaidOnKeyPressedAtShown;
                            txtSalesCaNetPaid.text = "";
                            txtSalesCaNetPaid.promptText = "0.00";
                            txtSalesCaNetPaid.editable = true;
                            txtSalesCaNetPaid.font = Arial_Bold_12;
                            txtSalesCaSubTotal.layoutX = 0.0;
                            txtSalesCaSubTotal.layoutY = 0.0;
                            txtSalesCaSubTotal.styleClass = "Borderless-text-box";
                            txtSalesCaSubTotal.onKeyPressed = txtSalesCaSubTotalOnKeyPressedAtShown;
                            txtSalesCaSubTotal.text = "";
                            txtSalesCaSubTotal.promptText = "0.00";
                            txtSalesCaSubTotal.selectOnFocus = true;
                            txtSalesCaSubTotal.editable = false;
                            txtSalesCaSubTotal.font = Arial_12;
                            txtSalesCaBalAmt.layoutX = 50.0;
                            txtSalesCaBalAmt.layoutY = 470.0;
                            txtSalesCaBalAmt.styleClass = "Borderless-text-box";
                            txtSalesCaBalAmt.text = "";
                            txtSalesCaBalAmt.promptText = "0.00";
                            txtSalesCaBalAmt.selectOnFocus = true;
                            txtSalesCaBalAmt.editable = false;
                            txtSalesCaRoundAmt.visible = true;
                            txtSalesCaRoundAmt.layoutY = 0.0;
                            panelTxtColumn2.visible = true;
                            panelTxtColumn2.layoutY = 445.0;
                            __layoutInfo_panelTxtColumn2.width = 100.0;
                            __layoutInfo_panelTxtColumn2.height = 100.0;
                            label16.visible = false;
                            label16.text = "Label";
                            label16.textFill = javafx.scene.paint.Color.BLACK;
                            txtSalesCaToalAmt.layoutX = 0.0;
                            txtSalesCaToalAmt.layoutY = 439.0;
                            txtSalesCaToalAmt.text = "Total Amount";
                            txtSalesCaToalAmt.font = Arial_20;
                            txtSalesCaToalAmt.textAlignment = javafx.scene.text.TextAlignment.LEFT;
                            txtSalesCaToalAmt.hpos = javafx.geometry.HPos.LEFT;
                            txtSalesCaToalAmt.textFill = Gray;
                            panelAmt.visible = true;
                            panelAmt.layoutY = 0.0;
                            rectButton.visible = true;
                            rectButton.managed = true;
                            rectButton.layoutY = 531.0;
                            __layoutInfo_rectButton.width = 100.0;
                            __layoutInfo_rectButton.height = 25.0;
                            rectButton.styleClass = "rectbutton";
                            rectButton.onMouseClicked = rectButtonOnMouseClickedAtShown;
                            rectButton.effect = null;
                            rectButton.fill = Yellow;
                            rectButton.stroke = DarkGray;
                            rectButton.strokeWidth = 1.0;
                            rectButton.width = 100.0;
                            rectButton.height = 20.0;
                            rectButton.arcWidth = 10.0;
                            rectButton.arcHeight = 10.0;
                            lblBillHistory.visible = true;
                            lblBillHistory.opacity = 1.0;
                            lblBillHistory.layoutY = 534.0;
                            __layoutInfo_lblBillHistory.width = 100.0;
                            lblBillHistory.text = " Bill History >>";
                            lblBillHistory.font = Arial_Bold_12;
                            lblBillHistory.hpos = javafx.geometry.HPos.CENTER;
                            lblBillHistory.textFill = DarkGray;
                            listSalesCash.visible = false;
                            panelCalender.visible = true;
                            panelCalender.layoutY = 80.0;
                            panelMsgBx1.visible = false;
                            panelMsgBx1.layoutX = 190.0;
                            panelMsgBx1.layoutY = 199.0;
                            __layoutInfo_panelMsgBx1.width = 500.0;
                            __layoutInfo_panelMsgBx1.height = 300.0;
                            panel.visible = false;
                            reflectionEffect2.topOpacity = 0.17;
                            reflectionEffect2.bottomOpacity = 0.0;
                            reflectionEffect2.fraction = 0.72;
                        }
                    }
                ]
            }
        ]
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panelForm, panelDocInfo, panelCustInfo, panelBack, panelTitlebar, panel, ]
    }
    // </editor-fold>//GEN-END:main
     var salesDiscSettings = bind CommonDeclare.salesDiscApply on replace {
        DummySalesTableObj.dtmodel.setCellEditable(0, 9, salesDiscSettings);
    }
    function txtSalesCaDiscountOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
         if(settingsController.getSalesDiscountType()==0){
                txtSalesCaDiscount.editable=false;
            }
            else {
                txtSalesCaDiscount.editable=true;
            }
         shortcut(event);
         }
    function txtSalesCaDiscountOnKeyTypedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if(not txtSalesCaDiscount.rawText.trim().equals("")) {
            var intValid:Integer;
            valid1 = new Validation();
            intValid = valid1.getDecimalValid(txtSalesCaDiscount.rawText, 1, 6);
            if(intValid ==1){
                FXinfo("Discount amount cannot be more than 6 digits.");
            }
            else if(intValid ==0){
                FXinfo("Please enter only numbers.Characters not allowed");
            }
            else if(Double.parseDouble(txtSalesCaDiscount.rawText) >= DummySalesTableObj.totAmt) {
                FXinfo("Discount Amount cannot be greater than total Amount");
            }
            else {
                DummySalesTableObj.calcDiscount(txtSalesCaDiscount.rawText.trim());
                calcDiscTotal ("disc");
            }
        }
        else {
            DummySalesTableObj.calcDiscount("0");
            calcDiscTotal("disc");
        }
        }

     function calcDiscTotal (calcType:String): Void {
            var ta: Double = Value.Round(DummySalesTableObj.totAmt, 2);
            var tda: Double = Value.Round(DummySalesTableObj.totDistAmt, 2);
            var tvat4: Double = Value.Round(DummySalesTableObj.totVATAmt4, 2);
            vatAmt = (tvat4);
            txtSalesCaSubTotal.text = Value.Round(ta);
            lblSalesCaTotalQty.text = "{DummySalesTableObj.totQty}";
            lblSalesCaTotalItm.text = "{DummySalesTableObj.totItems}";
            if(calcType.equals("total")) {
            txtSalesCaDiscount.text = "{Value.Round(tda, 2)}";
            }
            txtSalesCaVAT4.text = Value.Round(tvat4);
            netAmt = ta - tda;
            var autoRoundoff : Integer = 0;
            try {
            var settingsController : com.vanuston.medeil.implementation.Settings =  RegistryFactory.getClientStub(RegistryConstants.Configuration) as com.vanuston.medeil.implementation.Settings;
            autoRoundoff = settingsController.getEnableAutoRoundoff()[0];
            } catch(e1:Exception){
            log.debug("calcDiscTotal() settingsCtrl Exception:{e1.getMessage()}");
            }
            if(autoRoundoff==0) {
                var rVal = Value.roundToHalfVal("{netAmt}");
                txtSalesCaRoundAmt.text = Value.Round(rVal - netAmt);
                rndVal = "{Value.Round(Double.parseDouble(txtSalesCaRoundAmt.text)+netAmt)}";
                txtSalesCaToalAmt.text = rndVal;
                txtSalesCaRoundAmt.editable=false;
            }
            else if(autoRoundoff==1) {
                var rVal = Value.roundToWholeVal("{netAmt}");
                txtSalesCaRoundAmt.text = Value.Round(rVal - netAmt);
                rndVal = "{Value.Round(Double.parseDouble(txtSalesCaRoundAmt.text)+netAmt)}";
                txtSalesCaToalAmt.text = rndVal;
                txtSalesCaRoundAmt.editable=false;
            }
            else {
                txtSalesCaRoundAmt.text = Value.Round(0.00);
                rndVal = "{Value.Round(netAmt)}";
                txtSalesCaToalAmt.text = rndVal;
                txtSalesCaRoundAmt.editable=true;
            }
             txtSalesCaNetPaid.text = rndVal;
             txtSalesCaBalAmt.text = "0.00";
     }

    function txtSalesCaRoundAmtOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if(event.code==KeyCode.VK_TAB) {
         btnSalesCaSave.requestFocus();
        }
        shortcut(event);
         }

    function txtSalesCaRoundAmtOnKeyTyped(event: javafx.scene.input.KeyEvent): Void {
         if (NumberUtils.isNumeric(txtSalesCaRoundAmt) and not txtSalesCaRoundAmt.rawText.equals("")) {
         txtSalesCaToalAmt.text = "{Value.Round(netAmt+Double.parseDouble(txtSalesCaRoundAmt.text))}";
         txtSalesCaNetPaid.text = txtSalesCaToalAmt.text;
         txtSalesCaBalAmt.text = "0.00";
            }
         }

    function btnSaveOnlyOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            saveSales(0);
    }
         }

    function rectangleOnMouseClicked(event: javafx.scene.input.MouseEvent): Void { fxCalendar.visible = false;

         }
var tmp=bind listSalesCash.visible on  replace{
    if(tmp==true)
    fxCalendar.visible = false;
}
var panelAlertLX= bind (panelW-500)/2;
var panelAlertLY= bind (panelH-150)/2;


def CustomAlert=CustomAlert{};
function FXalert(type:Integer):Void{
        CustomAlert.ShowAlert("Sales - Dummy Bill",type);
        showAlertbox();
}
function showAlertbox():Void{
        panelAlert.visible=true;
        delete panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
}
function FXinfo(msg:String):Void{
        CustomAlert.ShowInfo("Sales - Dummy Bill",msg);
        showAlertbox();
}
    function rotateImage(img: ImageView): Void {

    }

    function imgPNameOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        listCustomerChanges(0);
    }

    function imgDNameOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        listDoctorChanges(0);
    }

    function listSalesCashOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER)
            listSalesCash.visible = false;
    }

    function ShowList(): Void {
        listSalesCash.visible = true

    }

    function txtSalesCaNetPaidOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        updateIntValues();
        shortcut(event);
    }

    function btnSaveOnlyActionAtShown(): Void {
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

    function saveAndBack(retVal: Integer): Void {
        var stateVal = currentState.actual;
        if (stateVal == 2) {
             var user = bind CustInfo.newCust;
            if (retVal == 1) {
                currentState.actual = currentState.findIndex("Shown");
                 txtSalesCaPName.text = user;
                btnSalesBackActionAtSalesMaintain();
                txtSalesCaDName.requestFocus();
            }
        } else if (stateVal == 1) {
             var user = bind DocInfo.newDoc;
            if (retVal == 1) {
                currentState.actual = currentState.findIndex("Shown");
                 txtSalesCaDName.text = user;
                btnSalesBackActionAtSalesMaintain();
                DummySalesTableObj.focusSet();
            }
        }
		updateIntValues();
    }

    function btnSalesBackActionAtSalesMaintain(): Void {
        var stateVal = currentState.actual;
       
        if (stateVal == 2) {
       panelCustInfo.visible=false;
       panelBack.visible=false;
       txtSalesCaPName.text = "";
            txtSalesCaPName.requestFocus();
        } else if (stateVal == 1) {
       panelDocInfo.visible=false;
       panelBack.visible=false;
       txtSalesCaDName.text = "";
            txtSalesCaDName.requestFocus();
        }
        currentState.actual = currentState.findIndex("Shown");
		updateIntValues();
    }

    function rectButtonOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
    }
def kr = KeyRegistry {};
    var short = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 2 and CommonDeclare.form[1] == 6) {
            shortcut(short);
        }
    }
    public function shortcut(event: javafx.scene.input.KeyEvent): Void {

        if (event.code == kr.print and btnSalesCaSave.disable == false) {
            saveSales(1);
        }
        if (event.code == kr.save and btnSalesCaSave.disable == false) {
            saveSales(0);
        }
        if (event.code == kr.reset and btnSalesCaReset.text == "Reset [F4]") {
            resetValues();
        }
        if (event.code == kr.rRow) {
            DummySalesTableObj.removeRow();updateIntValues();
        }
    }

    function CashDatePickerOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        if (not dateFlag) {
            if (txtSalesCaDate.text != null) {
                var dat = txtSalesCaDate.rawText.trim().split("-");
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

    function txtSalesCaNetPaidOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) { btnSalesCaSave.requestFocus(); }
        shortcut(event);
    }

    function btnSalesCaSaveOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER)
            saveSales(1);
    }

    function txtSalesCaSubTotalOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
    }

    function rectRemoveRowOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        DummySalesTableObj.removeRow();updateIntValues();
    }

    function txtSalesCaDNameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ESCAPE) {
            listSalesCash.visible = false;
            DummySalesTableObj.focusSet();
        }
        if (event.code == KeyCode.VK_DOWN) {
            listDoctorChanges(1);
            listSalesCash.requestFocus();
            listSalesCash.selectFirstRow();
        } shortcut(event);
    }

    function txtSalesCaDNameOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        listDoctorChanges(1);
    }

    function txtSalesCaPNameOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        listCustomerChanges(1);
    }

    function txtSalesCaPNameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ESCAPE) {
            txtSalesCaDName.requestFocus();
            listSalesCash.visible = false;
        } else if (event.code == KeyCode.VK_DOWN) {
            listCustomerChanges(1);
            listSalesCash.requestFocus();
            listSalesCash.selectFirstRow();
        } shortcut(event);

    }

    function btnSalesCaResetOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER)
            resetValues();
    }

    function btnSalesCaResetActionAtShown(): Void {
        resetValues();
    }

    function btnSalesCaSaveOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function btnSalesCaSaveActionAtShown(): Void {
        saveSales(1);
    }

    function txtSalesCaDateOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) { txtSalesCaPName.requestFocus(); }
        shortcut(event);
    }

    function lblSalesCaBillNoOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) { txtSalesCaDate.requestFocus(); }
        shortcut(event);
    }

    function rectButtonOnMouseExitedAtShown(event: javafx.scene.input.MouseEvent): Void {

        rectButton.fill = Yellow;
    }

    function rectButtonOnMouseEnteredAtShown(event: javafx.scene.input.MouseEvent): Void {
        rectButton.fill = Orange;
    }

    public function disableList(): Void {
        listSalesCash.visible = false;
    }

    function checkValid(): Integer {
        var retVal = 0;        
        var validation = new Validation();  
        //var dummyYear = DateUtils.now("yy");
        var dummyYear = getAutoVal.substring(3,5);        
        var txtDate:java.util.Date = DateUtils.normalStringToDate(txtSalesCaDate.rawText.trim());
        var billDate:java.util.Date = DateUtils.normalStringToDate(DateUtils.now("dd-MM-yyyy"));
        var salesController : Sales = RegistryFactory.getClientStub (RegistryConstants.Sales) as Sales;
       if (DummySalesTableObj.nullVal == 0) {
            retVal = 1;
            FXinfo("Sales table is empty. Please enter some values!");
          //  DummySalesTableObj.focusSet();
        }
        else if(Double.parseDouble(txtSalesCaToalAmt.text) <=0) {
            retVal = 1;
            FXinfo("Total Amount should be greater than zero");
        }
        else if(lblSalesCaBillNo.rawText.equals("")) {
            retVal = 1;
            FXinfo("Please enter the dummy bill number");
        }
        else if(lblSalesCaBillNo.rawText.trim().length() != 10) {
            retVal = 1;
            FXinfo("Dummy bill number should have ten characters");
        }
        else if(not lblSalesCaBillNo.rawText.trim().substring(0,3).equalsIgnoreCase("SCY")){
            retVal = 1;
            FXinfo("Please enter the bill number's first three characters as SCY");
        }
        else if(not lblSalesCaBillNo.rawText.trim().substring(3,5).equals(dummyYear)){
            retVal = 1;
            FXinfo("Please enter the current year after the bill series SCY in YY format Eg.12");
        }
        else if(validation.getNumberValid(lblSalesCaBillNo.rawText.trim().substring(5,10), 0, 5) == 0) {
            retVal = 1;
            FXinfo("Characters not allowed for bill number's last five digits");
        }
        else if (Integer.parseInt(lblSalesCaBillNo.rawText.trim().substring(5,10)) > 90000) {
            retVal = 1;
            FXinfo("Dummy bill number last five digits value should be less than 90000");
        }
        else if (salesController.getDummyBillNumbers(lblSalesCaBillNo.rawText.trim()).equals(true)) {
            retVal = 1;
            FXinfo("The given Dummy bill number already exists.Please modify.");
        }
        else if(txtDate.getTime().compareTo(billDate.getTime())== 1) {
                retVal = 1;
            FXinfo("Bill date is greater than the current date. Please check.");
        }
        else if(txtSalesCaPName.rawText.trim().length() > 40) {
            FXinfo("Customer Name length cannot be more than 40 characters");
            retVal = 1;
        }  else if(txtSalesCaDName.rawText.trim().length() > 100) {
            FXinfo("Doctor Name length cannot be more than 100 characters");
            retVal = 1;
        }
        else if(not txtSalesCaRoundAmt.text.equals("") and (Double.parseDouble(txtSalesCaRoundAmt.text) > 0.99 or Double.parseDouble(txtSalesCaRoundAmt.text)<-0.99) ) {
            retVal = 1;
            FXinfo("Round off value entered is incorrect. Please check");
        }
        else {
            retVal = 0;
        }
        return retVal;
    }

    public function saveSales(ss: Integer): Void {
        var check = checkValid();
        updateIntValues();
        var sales=new SalesModel();
        if (check == 0) {
              var sdf = new SimpleDateFormat("dd-MM-yyyy");
              var billDate  = DateUtils.changeFormatDate(sdf.parse(txtSalesCaDate.rawText));
              sales.setCustomerName(txtSalesCaPName.rawText);
              sales.setDoctorName(txtSalesCaDName.rawText);
              sales.setBillNumber(lblSalesCaBillNo.rawText);
              sales.setBillDate(billDate);
              sales.setBillType("dummy");
              sales.setTotalDiscount(Double.parseDouble(txtSalesCaDiscount.rawText));
              sales.setTotalAmount(Double.parseDouble(txtSalesCaToalAmt.text));
              sales.setPaidAmount(Double.parseDouble(txtSalesCaNetPaid.rawText));
              sales.setBalanceAmount(Double.parseDouble(txtSalesCaBalAmt.rawText));
              sales.setTotalVAT(Double.parseDouble(txtSalesCaVAT4.rawText));
              sales.setTotalQuantity(Integer.parseInt(lblSalesCaTotalQty.rawText));
              sales.setTotalItems(Integer.parseInt(lblSalesCaTotalItm.rawText));
              sales.setListofitems(DummySalesTableObj.getSalesBillItems());
              sales.setAccountNumber("");
              sales.setPaymentMode("");
              sales.setCardNumber("");
              sales.setCardHolderName("");
              sales.setCardExpiry("");
              sales.setBankName("");
              sales.setFormType("");
              sales.setSalesReturnNumber("");
              sales.setSalesReturnDate("0000-00-00");
              //var salesController:Sales=new SalesController();
              var salesController : Sales = RegistryFactory.getClientStub (RegistryConstants.Sales) as Sales;
                var returnObject = new Object();
                returnObject = salesController.createRecord(sales);
                var msgReturnModel: MsgReturnModel = new MsgReturnModel();
                msgReturnModel = returnObject as MsgReturnModel;
                //DummySalesTableObj.focusSet(msgReturnModel.getRowCount(), msgReturnModel.getColumnCount());
                var type="";
                if(msgReturnModel.getReturnMessage()=="0")
                {
                   type = "save";                   
                   resetValues();
                   if (ss == 1) {                        
                        type = "Print";
                        var reportSource: File = new File("printerfiles/Print.jasper");
                        var jasperReport:JasperReport =  JRLoader.loadObject(reportSource) as JasperReport;
                        var jasperPrint:JasperPrint = salesController.jasperPrint(sales.getBillNumber(), "Sales_Cash_1", jasperReport);
                        JasperPrintManager.printReport(jasperPrint, false);                        
                    }
                    FXalert(0);
                }
                else
                {
                FXinfo(msgReturnModel.getReturnMessage());
                DummySalesTableObj.focusSet(msgReturnModel.getRowCount(), msgReturnModel.getColumnCount());
                }
//               commonController=new CommonController();
               commonController.userLog("Sales Dummy",type);
        }


    }

    public function resetValues(): Void {
        cashBillDate = DateUtils.now("dd-MM-yyyy");
        txtSalesCaPName.text = "";
        txtSalesCaDName.text = "";
        txtSalesCaSubTotal.text = "0.00";
        txtSalesCaDiscount.text = null;
        txtSalesCaVAT4.text = null;
//-        txtSalesCaVAT12.text = null;
        txtSalesCaToalAmt.text = "0.00";
        lblSalesCaTotalQty.text = "0";
        lblSalesCaTotalItm.text = "0";
        txtSalesCaBalAmt.text = "0.00";
//        commonController=new CommonController();
        getAutoVal = commonController.getAutoIncrement(cashBillDate,"DummySales");
        lblSalesCaBillNo.text = getAutoVal;
        DummySalesTableObj.clearData();
        DummySalesTableObj.resetValues();
        txtSalesCaPName.requestFocus();
		updateIntValues();
    }
    var visit = bind fxCalendar.visible on replace {
        if (dateFlag and not visit) {
            cashBillDate = fxCalendar.getSelectedDate();
            dateFlag = false;
            txtSalesCaPName.requestFocus();
        }
    };

       
    function updateIntValues(): Void {
    try{
        DummySalesTableObj.salesCalculations();
        calcDiscTotal("total");
        if(txtSalesCaNetPaid.text.equals("")) {
                txtSalesCaNetPaid.text = "0.00";
         }
         else if(txtSalesCaRoundAmt.text.equals("")) {
                txtSalesCaRoundAmt.text = "0.00";
        }
        /*var ta: Double = Value.Round(DummySalesTableObj.totAmt, 2);
        var tda: Double = Value.Round(DummySalesTableObj.totDistAmt, 2);
        var tvat4: Double = Value.Round(DummySalesTableObj.totVATAmt4, 2);
       //- var tvat12: Double = Value.Round(DummySalesTableObj.totVATAmt12, 2);
  vatAmt = (tvat4 );
      //-  vatAmt = (tvat4 + tvat12);
        txtSalesCaSubTotal.text = Value.Round(ta);
        lblSalesCaTotalQty.text = "{DummySalesTableObj.totQty}";
        lblSalesCaTotalItm.text = "{DummySalesTableObj.totItems}";
        txtSalesCaDiscount.text = "{Value.Round(tda,2)}";
        txtSalesCaVAT4.text = Value.Round(tvat4);
//-        txtSalesCaVAT12.text = Value.Round(tvat12);        
        netAmt = ta - tda ;
        var autoRoundoff : Boolean = true;
        try {
            var settingsController : com.vanuston.medeil.implementation.Settings =  RegistryFactory.getClientStub(RegistryConstants.Configuration) as com.vanuston.medeil.implementation.Settings;
            autoRoundoff = settingsController.getEnableAutoRoundoff()[0];
        }catch(e1:Exception){
            log.debug("updateIntValues() settingsCtrl Exception:{e1.getMessage()}");
        }
        if(autoRoundoff) {
            var rVal = Value.roundToHalfVal("{netAmt}");
            txtSalesCaRoundAmt.text = Value.Round(rVal - netAmt);
            rndVal = "{Value.Round(Double.parseDouble(txtSalesCaRoundAmt.text)+netAmt)}";
            txtSalesCaToalAmt.text = rndVal;
            txtSalesCaRoundAmt.editable = false;
        } else {            
            txtSalesCaRoundAmt.text = Value.Round(0.00);
            rndVal = "{Value.Round(listCustomerChanges(typDouble.parseDouble(txtSalesCaRoundAmt.text)+netAmt)}";
            txtSalesCaToalAmt.text = rndVal;
            txtSalesCaRoundAmt.editable = true;
        }
        
        txtSalesCaNetPaid.text = rndVal;
        txtSalesCaBalAmt.text = "0.00";
         if(txtSalesCaNetPaid.text.equals("")) {
                txtSalesCaNetPaid.text = "0.00";
         }
         else if(txtSalesCaRoundAmt.text.equals("")) {
                txtSalesCaRoundAmt.text = "0.00";
        }*/
        }catch(ex:Exception ){
        var msg: String = "Class : SalesDummy method : updateIntValues()()   = {ex.getMessage()}";
        log.debug(msg);
        }
    }

    var rotateImg = bind listSalesCash.visible on replace {
        if (imgP and rotateImg) {
            imgPName.rotate = 180.0;
        } else {
            imgPName.rotate = 0.0;
        }

        if (imgD and rotateImg) {
            imgDName.rotate = 180.0;
        } else {
            imgDName.rotate = 0.0;
        }
    }

function listCustomerChanges(type: Integer): Void {
        if(not listSalesCash.visible){
        var listControlObj: ListController = new ListController();
        listSalesCash.visible = true;
        listH = 0.0;
        listSalesCash.layoutX = txtSalesCaPName.layoutX;
        listSalesCash.layoutY = txtSalesCaPName.layoutY + txtSalesCaPName.height + 5;
        listH = listControlObj.listImageControlView(txtSalesCaPName, listSalesCash, "salescustomer", type);
         var selS: String = bind listControlObj.selectedString on replace {

                if (selS.length() > 0) {
                    txtSalesCaDName.requestFocus();
                    if (listSalesCash.selectedItem != "New name...") {
                    var cust = "{listSalesCash.selectedItem}";
                    txtSalesCaPName.text = cust;
                    listSalesCash.visible = false;
                    imgP = false;
                    txtSalesCaDName.requestFocus();
//                    balance = commonController.getCustomerBalance("{cust}");
        } else {
            callCustInfo();
            listSalesCash.visible = false;
            imgP = false;
        }
    }
    }
        }
    else{
        listSalesCash.visible=false;
        txtSalesCaPName.requestFocus();
    }
}


    function listDoctorChanges(type: Integer): Void {
        if(not listSalesCash.visible){
        var listControlObj: ListController = new ListController();
         listSalesCash.visible = true;
        listH = 0.0;
        listSalesCash.layoutX = txtSalesCaDName.layoutX;
        listSalesCash.layoutY = txtSalesCaDName.layoutY + txtSalesCaDName.height + 5;
        listH = listControlObj.listImageControlView(txtSalesCaDName, listSalesCash, "salesdoctor", type);
         var selS: String = bind listControlObj.selectedString on replace {
                
                if (selS.length() > 0) {
                    DummySalesTableObj.focusSet();
                     if (listSalesCash.selectedItem != "New name...") {
            txtSalesCaDName.text = "{listSalesCash.selectedItem}";
            listSalesCash.visible = false;
            DummySalesTableObj.focusSet();
        } else {
            listSalesCash.visible = false;
            callDocInfo();
    }
    }
    }
    }
    else{
        listSalesCash.visible=false;
        txtSalesCaDName.requestFocus();
    }
    }

    function callCustInfo(): Void {
        insertCustomerForm();
        currentState.actual = currentState.findIndex("CustomerInfo");
         CustInfo.txtCustName.requestFocus();

    }

    function callDocInfo(): Void {
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
    }

    var val: String = bind txtSalesCaToalAmt.text.trim();
    var logUser = bind CommonDeclare.user on replace {
        getPrivileges(logUser);updateIntValues();
    }

    function getPrivileges(u : String): Void {
//        commonController=new CommonController();
        var uname = u;
        var utype = commonController.getUserType(uname);

        if (utype.equals("User")) {
            var priv = commonController.getPrivileges("sales", uname);
            var ss = priv.split(",");
            var val = Integer.parseInt(ss[2]);
            if (val == 1) {
                btnSalesCaSave.disable = true;
                btnSaveOnly.disable = true;
            } else if (val == 2) {
                btnSalesCaSave.disable = false;
                btnSaveOnly.disable = false; 
            } else if (val == 3) {
                btnSalesCaSave.disable = false;
                btnSaveOnly.disable = false; 
            }
        }else 
            {
                btnSalesCaSave.disable = false;
                btnSaveOnly.disable = false;
            }
    }
    public function startUp(): Void {
	
		(dummyTable as javax.swing.JTable).addKeyListener(KeyAdapter{
            override public function keyReleased(e : java.awt.event.KeyEvent): Void{
				updateIntValues();
        }
            override public function keyTyped(e : java.awt.event.KeyEvent): Void{
				updateIntValues();
        }		
        });	
		(dummyTable as javax.swing.JTable).getSelectionModel().addListSelectionListener(javax.swing.event.ListSelectionListener{
            override public function valueChanged(e : javax.swing.event.ListSelectionEvent): Void{
                updateIntValues();
            }
         });        
	if(settingsController.getSalesDiscountType()==0) {
            CommonDeclare.salesDiscApply=true;
         }
        panelMsgBx1.visible = false;
        CashDatePicker.image = Image { url: "{__DIR__}images/Calender.png" };
        listView.visible = false;
        salesDummyTable.layoutX = 0;
        salesDummyTable.layoutY = 0;
        txtSalesCaDate.requestFocus();
        fxCalendar.visible = false;
        panelCalender.content = [fxCalendar,];
        panelTable.content = [salesDummyTable,];
        panelForm.visible = false;
        lblSalesCaBillNo.text = getAutoVal;
    }

}

