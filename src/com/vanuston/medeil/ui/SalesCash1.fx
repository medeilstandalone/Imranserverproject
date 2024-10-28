package com.vanuston.medeil.ui;

import java.lang.Class;
import javafx.scene.image.Image;
import javafx.scene.layout.LayoutInfo;
import javafx.scene.input.KeyCode;
import javafx.scene.image.ImageView;
//import javafx.animation.Timeline;
import java.awt.Dimension;
import java.lang.Exception;
import java.text.SimpleDateFormat;
//import javax.swing.JComponent;
import com.vanuston.medeil.util.Value;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.ui.calendar.theme.Theme;
import com.vanuston.medeil.util.KeyRegistry;
import java.awt.event.KeyAdapter;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.NumberUtils;
import javafx.scene.control.TextBox;
import com.vanuston.medeil.model.SalesModel;
import java.lang.Integer;
import com.vanuston.medeil.model.MsgReturnModel;
import java.util.ArrayList;
import java.util.List;
import com.vanuston.medeil.implementation.Sales;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.util.Validation;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperPrintManager;
import java.io.File;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;
import com.vanuston.medeil.uitables.CashSalesTable1;
import com.vanuston.medeil.uitables.PrescriptionDetails;
import javax.swing.JTable;
import com.vanuston.medeil.uitables.ConfirmDialogBox;
import java.awt.event.KeyEvent;
import com.vanuston.medeil.uitables.DrugSpecifications;
import com.vanuston.medeil.model.SettingsModel;
import java.util.HashMap;
import com.vanuston.medeil.model.DrugSpecificationModel;
import com.vanuston.medeil.uitables.ConfirmDialogBox1;
import javafx.ext.swing.SwingComponent;
import java.lang.System;


def DocInfo = DoctorInformation {};
def CustInfo = CustomerInformation {};

public class SalesCash1 {
    
    var custId = 0;
    var discountPerce: Double = 0.0;
    var cstName = bind txtSalesCaPName.rawText on replace {
        if (cstName != null and cstName.trim().length() > 0 and cstName != "" and cstName != "null") {
            custId = salesController.getCustomerId(cstName);
            var cus = salesController.getCustomerDetails(custId);
            discountPerce = Double.parseDouble(cus[2]);
            if (discountPerce > 0) {
                CashSalesTableObj.setPercentageValues(discountPerce);
                updateIntValues();
            }
        }
    }

    /*function txtSalesCaNoOfDaysOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (txtSalesCaPName.rawText.trim().length() < 0 and txtSalesCaPName.rawText.trim().length() < 0) {
            FXinfo("Please select customer name");
            txtSalesCaPName.requestFocus();
        } else {
            txtSalesCaPName.style = mandatory;
            txtPrescriptionDays.rawText.trim();
        }
    }*/
    
 /*function isValidDouble(val : String) : Double {
        var dVal = 0.0;
        try {
            dVal = Double.parseDouble("{val}");
        } catch(nfe : NumberFormatException) {
            dVal = Double.NaN;
        }
        return dVal;
    }*/
    
    public var rndVal :String = "0.00";
    var netAmt: Double = 0.0;
    var ss: String = "";
    var CashSalesTableObj = new CashSalesTable1();
    var listH = 0.0;
    var imgP = false;
    var imgD = false;
    var alerCnt1 = 0;
    var itNAM1: String = "";
    var itemDis: String = "";
    public var cashBillDate = DateUtils.now("dd-MM-yyyy");
    var dateFlag: Boolean = false;
    var fxCalendar: FXCalendar = FXCalendar { theme: Theme {}; };
    var tinNo = bind CommonDeclare.tin;
    var vatAmt;
    def MessageBox = MessageBox {};
    var expAlert = CashSalesTableObj.alert1;
    var rowNo = 10;
    var settingsController : com.vanuston.medeil.implementation.Settings =  RegistryFactory.getClientStub(RegistryConstants.Configuration) as com.vanuston.medeil.implementation.Settings;
                           //    0        1           2           3            4       5          6               7       8       9      10         11       12          13       14         15
    var colNames: Object[] = ["S.No.", "Code", "Products", "Formulation","P.Qty", "U.Qty.",  "Batch No.", " Expiry", "U.Price", "MRP", "Disc %","Margin", "VAT %", "F.Price", "Amount", "Adj Id"];
    var colType: Class[] = [java.lang.Integer.class, java.lang.String.class, java.lang.String.class,
                java.lang.String.class, java.lang.Integer.class, java.lang.Integer.class,   java.lang.Integer.class,java.lang.Integer.class,  java.lang.String.class,
                java.lang.String.class, java.lang.Double.class, java.lang.Double.class, java.lang.Double.class,
                java.lang.Double.class, java.lang.Double.class, java.lang.Double.class, java.lang.Double.class, java.lang.Integer.class];
    
    var colEditable: Boolean[]= [false, false, false, false, true,true,  true, false, true, true, true, true, true, true, false, false, false];
    var colWidth: Integer[] = [35, 50, 120, 65,40, 40, 45, 66, 56, 50, 46, 40, 40, 40, 50, 65, 0];
    var pntName: List = new ArrayList();
    var commonController : CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;    
    var cashTable = CashSalesTableObj.createTable(rowNo, colNames, colType, colEditable, colWidth, "Sales");
    var salesCashTable = SwingComponent.wrap(CashSalesTableObj.getScrollTable(cashTable));
    var mandatory = CommonDeclare.textbox_mandatory();
    var error = CommonDeclare.textbox_error();
    var selBillType = "Cash" on replace {
                getNetPaidChange();
                getAutoIncre();
        };
    def SalesTypeSelection = SalesTypeSelection {
                selType: bind selBillType with inverse;
            };
    def SalesPlugin = SalesPlugin1{};
    var log: Logger = Logger.getLogger(SalesCash1.class, "Sales");
    var alertSt: Integer = 0;
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
    var botton4LX = bind CommonDeclare.botton43LX;
    var botton21LX = bind CommonDeclare.botton2LX;
    var botton22LX = bind CommonDeclare.botton3LX;
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
    var imgClickdownLX = bind C2LX + Type2TextboxW - 2;
    var imgClickdown1LX = bind C4LX + Type2TextboxW - 102;
    var imgClickdownW = 20.5;
    var imgClickdownH = 20.5;
    var rectbuttonLX = bind 85.13341804 * panelW / 100;
    var ListLX = 0.0;
    var ListLY = 0.0;
    var LabelTINLX = bind 82.23888183 * panelW / 100;
    var AmtPanelLX = bind BottomC4LX + Type4TextboxW + 20;
    var AmtTextW = bind panelW - AmtPanelLX - 30;    
    var TableW = bind (95.29860229 * panelW) / 100 on replace { changeTableSize(TableW,TableH); };
    var TableH = 264.0 on replace { changeTableSize(TableW,TableH); };
    var panelTableLX = bind (panelW - TableW) / 2;
    var panelTableLY = 85.0;
    var rectRemoveRowLX = bind ((panelW + TableW) / 2) - 120;
    var rectRemoveRowLY = bind (panelTableLY + TableH);
    var row:Integer;

    function changeTableSize(i: Double,j: Double): Void {
        salesCashTable.getJComponent().setPreferredSize(new Dimension(i, j));
    }
    var BottomC1LX = bind CommonDeclare.BottomC1LX;
    var BottomC2LX = bind CommonDeclare.BottomC2LX;
    var BottomC3LX = bind CommonDeclare.BottomC3LX;
    var BottomC4LX = bind CommonDeclare.BottomC4LX;
    var balance = "0.00";
    public var getAutoVal:String;
    var salesController : Sales = RegistryFactory.getClientStub (RegistryConstants.Sales) as Sales;
    var empCode:String[] = commonController.getEmployeeCode("").toArray() as String[];
    var valid1:Validation;
    var interactionDesc:String;
    var DrugSpecModel;
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def panelDocInfo: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
    }
    
    public-read def panelCustInfo: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
    }
    
    public-read def lblBarcode: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind LabelTINLX-40
        text: "Label"
    }
    
    def __layoutInfo_txtSalesCaBarcode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtSalesCaBarcode: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind LabelTINLX+35
        layoutInfo: __layoutInfo_txtSalesCaBarcode
    }
    
    public-read def CashDatePicker: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind LabelTINLX+Type3TextboxW+14
        layoutY: 75.0
    }
    
    public-read def imgBill: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind imgClickdownLX
        layoutY: 15.0
        fitWidth: bind imgClickdownW
        fitHeight: bind imgClickdownH+5
    }
    
    public-read def label16: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX
        text: "Label"
    }
    
    public-read def label18: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX-100
        text: "Label"
    }
    
    public-read def cboEmp_code: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: bind C4LX-100
        layoutY: -4.0
        items: bind empCode
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
        text: "Save [F3]"
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
    
    public-read def imgPrescrib: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
    }
    
    def __layoutInfo_btnPrescibe: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnPrescibe: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton4LX
        layoutInfo: __layoutInfo_btnPrescibe
        graphic: imgPrescrib
        text: "Button"
    }
    
    def __layoutInfo_listView: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 733.0
        height: 218.0
    }
    public-read def listView: javafx.scene.control.ListView = javafx.scene.control.ListView {
        layoutX: 50.0
        layoutY: 145.0
        layoutInfo: __layoutInfo_listView
        focusTraversable: false
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
        layoutY: bind rectRemoveRowLY+20
        width: 120.0
        height: 50.0
    }
    
    def __layoutInfo_LabelRemoveRow: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def LabelRemoveRow: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind rectRemoveRowLX
        layoutY: bind rectRemoveRowLY+20
        layoutInfo: __layoutInfo_LabelRemoveRow
        text: "Remove Row  [F12]"
    }
    
    public-read def label15: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 397.0
        layoutY: 499.0
        text: "Label"
    }
    
    public-read def adjust_amount: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C2LX+115
        layoutY: 336.0
        text: "Label"
    }
    
    def __layoutInfo_txtadjust: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtadjust: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX+180
        layoutInfo: __layoutInfo_txtadjust
    }
    
    def __layoutInfo_btnAdjust: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnAdjust: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind C2LX+310
        layoutInfo: __layoutInfo_btnAdjust
        text: "Button"
    }
    
    public-read def lblTotalMargin: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C2LX+285
        text: "Label"
    }
    
    public-read def lblPrescriptionDays: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C2LX+285
        text: "Label"
    }
    
    def __layoutInfo_txtPrescriptionDays: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtPrescriptionDays: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX+420
        layoutInfo: __layoutInfo_txtPrescriptionDays
    }
    
    def __layoutInfo_btnStkAdj: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnStkAdj: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind C2LX+440
        layoutInfo: __layoutInfo_btnStkAdj
        text: "Button"
    }
    
    def __layoutInfo_btnDrugSpec: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnDrugSpec: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind C2LX+300
        layoutInfo: __layoutInfo_btnDrugSpec
        text: "Button"
    }
    
    def __layoutInfo_btnFood: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnFood: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind C2LX+470
        layoutInfo: __layoutInfo_btnFood
        text: "Button"
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
    
    def __layoutInfo_txtSalesCaRoundAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSalesCaRoundAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: true
        layoutInfo: __layoutInfo_txtSalesCaRoundAmt
    }
    
    public-read def label17: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtSalesCaToalAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind AmtTextW
    }
    public-read def txtSalesCaToalAmt: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutInfo: __layoutInfo_txtSalesCaToalAmt
        graphic: label17
        text: "Label"
    }
    
    public-read def panelAmt: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind AmtPanelLX-20
        layoutY: 6.0
        content: [ txtSalesCaToalAmt, ]
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
        width: bind Type2TextboxW
        height: bind listH
    }
    public-read def listSalesCash: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutInfo: __layoutInfo_listSalesCash
        focusTraversable: false
        items: null
    }
    
    public-read def panelCalender: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelCalenderLX
        layoutY: 90.0
    }
    
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_lblBalanceDue: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind AmtTextW
    }
    public-read def lblBalanceDue: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutInfo: __layoutInfo_lblBalanceDue
        graphic: label5
        text: bind balance
    }
    
    public-read def panelBalanceDue: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind AmtPanelLX
        content: [ lblBalanceDue, ]
    }
    
    public-read def panelplugin: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
    }
    
    public-read def panelBillType: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelTableLX
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
    }
    
    public-read def panelInfo: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
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
        layoutX: bind BottomC4LX+20
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
    
    def __layoutInfo_lblSalesCaTotalItm: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type5TextboxW
    }
    public-read def lblSalesCaTotalItm: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 135.0
        layoutY: 392.0
        layoutInfo: __layoutInfo_lblSalesCaTotalItm
        styleClass: "Borderless-text-box"
        onKeyReleased: lblSalesCaTotalItmOnKeyReleased
        focusTraversable: false
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
        focusTraversable: false
        font: Arial_12
    }
    
    public-read def panelTxtColumn1: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind BottomC2LX
        layoutY: 31.0
        content: [ lblSalesCaTotalQty, lblSalesCaTotalItm, txtSalesCaDiscount, txtSalesCaVAT4, txtSalesCaVAT123, ]
    }
    
    def __layoutInfo_txtSalesCaPBillNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtSalesCaPBillNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX
        layoutY: 75.0
        layoutInfo: __layoutInfo_txtSalesCaPBillNo
        focusTraversable: false
        selectOnFocus: false
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtSalesCaDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtSalesCaDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind LabelTINLX+35
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
        focusTraversable: false
        text: bind tinNo
        font: Arial_12
    }
    
    def __layoutInfo_txtSalesCaDName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtSalesCaDName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX-100
        layoutY: 121.0
        layoutInfo: __layoutInfo_txtSalesCaDName
        font: Arial_12
    }
    
    def __layoutInfo_txtSalesCaPName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
        hfill: false
    }
    public-read def txtSalesCaPName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 60.0
        layoutInfo: __layoutInfo_txtSalesCaPName
        style: ""
        styleClass: "text-box"
        effect: null
        text: ""
        promptText: "Enter Customer Name"
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
        layoutY: bind panelButtonsLY+10
        content: [ btnSaveOnly, btnSalesCaSave, btnSalesCaReset, btnPrescibe, ]
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
        layoutX: bind BottomC1LX-20
        content: [ label10, label11, label6, label1, label15, ]
    }
    
    public-read def label14: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX
        layoutY: 75.0
        text: "Bill No"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label8: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX-100
        layoutY: 121.0
        text: "Doctor Name "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind LabelTINLX-20
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
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 60.0
        styleClass: "label"
        text: "Patient Name"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 1.0
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "form-background"
        blocksMouse: false
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
        text: "Sales - Cash Bill"
        font: Arial_25
    }
    
    public-read def Orange: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
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
        height: 32.0
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
    
    def __layoutInfo_imgPName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def imgPName: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind imgClickdownLX
        layoutInfo: __layoutInfo_imgPName
        image: image
        fitWidth: bind imgClickdownW
        fitHeight: bind imgClickdownH+6
    }
    
    public-read def imgCalender: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Calender.png"
    }
    
    public-read def imgDName: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind imgClickdown1LX
        image: imgCalender
        fitWidth: bind imgClickdownW
        fitHeight: bind imgClickdownH+6
    }
    
    public-read def panelTopSection: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ label2, txtSalesCaPName, txtSalesCaDName, label3, lblSalesCaTIN, lblBarcode, label9, label8, txtSalesCaDate, txtSalesCaBarcode, CashDatePicker, txtSalesCaPBillNo, imgDName, imgPName, imgBill, label16, label18, cboEmp_code, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        onMouseClicked: rectangleOnMouseClicked
        blocksMouse: true
        content: [ rectangle, rectHeader, label, panelTopSection, panelButtons, listView, separator, rectRemoveRow, LabelRemoveRow, label14, panelLblColumn1, adjust_amount, txtadjust, btnAdjust, lblTotalMargin, lblPrescriptionDays, txtPrescriptionDays, btnStkAdj, btnDrugSpec, btnFood, panelTable, rectTableBorder, panelTxtColumn1, panelLblColumn2, panelTxtColumn2, panelAmt, rectButton, lblBillHistory, listSalesCash, panelCalender, panelBalanceDue, panelplugin, panelBillType, panelAlert, ]
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
    
    public-read def imgPrescribe: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Import.png"
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "DoctorInfo", "Shown", "CustomerInfo", ]
        actual: 1
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            panelDocInfo.visible = true;
                            panelCustInfo.visible = false;
                            imageView4.image = imageSave;
                            btnCustDocSave.visible = true;
                            btnCustDocSave.text = "Save [F3]";
                            btnSalesBack.visible = true;
                            btnSalesBack.text = "Back to Sales";
                            btnSalesBack.font = Arial_Bold_14;
                            btnSalesBack.action = btnSalesBackAction;
                            panelBack.visible = true;
                            rectangle.visible = false;
                            rectangle.strokeWidth = 2.0;
                            rectangle.arcWidth = 5.0;
                            rectangle.arcHeight = 5.0;
                            rectHeader.visible = false;
                            rectHeader.layoutX = 0.0;
                            rectHeader.fill = linearGradientHeader;
                            rectHeader.width = 0.0;
                            rectHeader.height = 32.0;
                            rectHeader.arcWidth = 0.0;
                            rectHeader.arcHeight = 0.0;
                            label.visible = true;
                            label.layoutX = 0.0;
                            label.effect = null;
                            label.text = "Sales - Cash Bill";
                            label.font = Arial_25;
                            label.hpos = javafx.geometry.HPos.CENTER;
                            label.textFill = javafx.scene.paint.Color.BLACK;
                            label2.layoutY = 60.0;
                            label2.text = "Customer Name";
                            label2.font = Arial_12;
                            txtSalesCaPName.layoutY = 60.0;
                            txtSalesCaPName.onKeyPressed = txtSalesCaPNameOnKeyPressedAtShown;
                            txtSalesCaPName.onKeyReleased = txtSalesCaPNameOnKeyReleasedAtShown;
                            txtSalesCaPName.font = Arial_12;
                            txtSalesCaDName.layoutY = 85.0;
                            txtSalesCaDName.onKeyPressed = txtSalesCaDNameOnKeyPressedAtShown;
                            txtSalesCaDName.onKeyReleased = txtSalesCaDNameOnKeyReleasedAtShown;
                            txtSalesCaDName.promptText = "Enter Doctor Name";
                            txtSalesCaDName.font = Arial_12;
                            label3.visible = true;
                            label3.layoutY = 60.0;
                            label3.text = "TIN No";
                            lblSalesCaTIN.visible = true;
                            lblSalesCaTIN.layoutY = 85.0;
                            lblSalesCaTIN.editable = false;
                            lblSalesCaTIN.font = Arial_12;
                            lblBarcode.visible = false;
                            lblBarcode.layoutY = 0.0;
                            lblBarcode.text = "Label";
                            lblBarcode.textFill = javafx.scene.paint.Color.BLACK;
                            label9.layoutY = 60.0;
                            label9.font = Arial_12;
                            label8.layoutY = 85.0;
                            label8.font = Arial_12;
                            txtSalesCaDate.layoutY = 60.0;
                            txtSalesCaDate.onKeyPressed = txtSalesCaDateOnKeyPressedAtShown;
                            txtSalesCaDate.editable = false;
                            txtSalesCaDate.font = Arial_12;
                            txtSalesCaBarcode.visible = false;
                            txtSalesCaBarcode.layoutY = 0.0;
                            CashDatePicker.visible = true;
                            CashDatePicker.layoutY = 60.0;
                            CashDatePicker.onMouseClicked = CashDatePickerOnMouseClickedAtShown;
                            CashDatePicker.blocksMouse = false;
                            CashDatePicker.image = null;
                            CashDatePicker.fitWidth = 0.0;
                            CashDatePicker.fitHeight = 0.0;
                            txtSalesCaPBillNo.visible = false;
                            txtSalesCaPBillNo.disable = false;
                            txtSalesCaPBillNo.layoutY = 60.0;
                            txtSalesCaPBillNo.styleClass = "text-box";
                            txtSalesCaPBillNo.onKeyPressed = txtSalesCaPBillNoOnKeyPressedAtShown;
                            txtSalesCaPBillNo.focusTraversable = false;
                            txtSalesCaPBillNo.editable = false;
                            txtSalesCaPBillNo.font = Arial_12;
                            imgDName.visible = false;
                            imgDName.layoutY = 0.0;
                            imgDName.scaleX = 1.0;
                            imgDName.scaleY = 1.0;
                            imgDName.image = imgCalender;
                            imgPName.visible = false;
                            imgPName.layoutY = 0.0;
                            imgPName.scaleX = 1.0;
                            imgPName.scaleY = 1.0;
                            imgBill.visible = false;
                            imgBill.layoutY = 15.0;
                            imgBill.image = null;
                            label16.visible = false;
                            label16.layoutY = 0.0;
                            label16.text = "Label";
                            label18.visible = false;
                            label18.opacity = 1.0;
                            label18.layoutY = 0.0;
                            label18.text = "Label";
                            label18.textFill = javafx.scene.paint.Color.BLACK;
                            cboEmp_code.visible = false;
                            cboEmp_code.layoutY = -4.0;
                            panelTopSection.visible = true;
                            panelTopSection.layoutY = 0.0;
                            imageView2.visible = false;
                            imageView2.image = null;
                            btnSaveOnly.visible = false;
                            btnSaveOnly.layoutY = 534.0;
                            btnSaveOnly.text = "Save [F3]";
                            imageView.visible = false;
                            imageView.image = null;
                            btnSalesCaSave.layoutY = 525.0;
                            btnSalesCaSave.onKeyPressed = btnSalesCaSaveOnKeyPressedAtShown;
                            btnSalesCaSave.onKeyReleased = btnSalesCaSaveOnKeyReleasedAtShown;
                            btnSalesCaSave.font = Arial_Bold_14;
                            btnSalesCaSave.action = btnSalesCaSaveActionAtShown;
                            imageView3.visible = false;
                            imageView3.image = null;
                            btnSalesCaReset.layoutY = 525.0;
                            btnSalesCaReset.onKeyReleased = btnSalesCaResetOnKeyReleasedAtShown;
                            btnSalesCaReset.font = Arial_Bold_14;
                            btnSalesCaReset.action = btnSalesCaResetActionAtShown;
                            imgPrescrib.visible = false;
                            imgPrescrib.image = null;
                            imgPrescrib.fitWidth = 0.0;
                            imgPrescrib.fitHeight = 0.0;
                            btnPrescibe.visible = false;
                            btnPrescibe.text = "Button";
                            btnPrescibe.textAlignment = javafx.scene.text.TextAlignment.LEFT;
                            panelButtons.visible = false;
                            listView.visible = true;
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
                            label14.visible = false;
                            label14.layoutY = 60.0;
                            label10.layoutX = 0.0;
                            label10.layoutY = 445.0;
                            label10.text = "Total Products";
                            label10.font = Arial_12;
                            label11.layoutX = 0.0;
                            label11.layoutY = 470.0;
                            label11.text = "Total Quantity";
                            label11.font = Arial_12;
                            label6.layoutX = 0.0;
                            label6.layoutY = 25.0;
                            label6.text = "Discount";
                            label6.font = Arial_12;
                            label1.layoutX = 0.0;
                            label1.layoutY = 50.0;
                            label1.text = "VAT";
                            label1.font = Arial_12;
                            label15.visible = false;
                            label15.layoutX = 397.0;
                            label15.layoutY = 499.0;
                            label15.text = "Label";
                            label15.textFill = javafx.scene.paint.Color.BLACK;
                            panelLblColumn1.visible = false;
                            panelLblColumn1.layoutY = 0.0;
                            adjust_amount.visible = false;
                            adjust_amount.layoutY = 336.0;
                            adjust_amount.text = "Label";
                            txtadjust.visible = false;
                            txtadjust.layoutY = 0.0;
                            btnAdjust.visible = false;
                            btnAdjust.layoutY = 0.0;
                            btnAdjust.text = "Button";
                            lblTotalMargin.visible = false;
                            lblTotalMargin.layoutY = 0.0;
                            lblTotalMargin.text = "Label";
                            lblPrescriptionDays.visible = false;
                            lblPrescriptionDays.layoutY = 0.0;
                            lblPrescriptionDays.text = "Label";
                            txtPrescriptionDays.visible = false;
                            txtPrescriptionDays.layoutY = 0.0;
                            txtPrescriptionDays.promptText = null;
                            btnStkAdj.visible = false;
                            btnStkAdj.layoutY = 0.0;
                            btnStkAdj.text = "Button";
                            btnDrugSpec.visible = false;
                            btnDrugSpec.layoutY = 0.0;
                            btnDrugSpec.text = "Button";
                            btnFood.visible = false;
                            btnFood.layoutY = 0.0;
                            btnFood.text = "Button";
                            panelTable.visible = false;
                            rectTableBorder.visible = false;
                            rectTableBorder.y = 0.0;
                            lblSalesCaTotalQty.managed = true;
                            lblSalesCaTotalQty.layoutX = 0.0;
                            lblSalesCaTotalQty.layoutY = 470.0;
                            lblSalesCaTotalQty.styleClass = "Borderless-text-box";
                            lblSalesCaTotalQty.promptText = "0";
                            lblSalesCaTotalQty.selectOnFocus = true;
                            lblSalesCaTotalQty.editable = false;
                            lblSalesCaTotalQty.font = Arial_12;
                            lblSalesCaTotalItm.layoutX = 0.0;
                            lblSalesCaTotalItm.layoutY = 445.0;
                            lblSalesCaTotalItm.styleClass = "Borderless-text-box";
                            lblSalesCaTotalItm.promptText = "0";
                            lblSalesCaTotalItm.selectOnFocus = true;
                            lblSalesCaTotalItm.editable = false;
                            lblSalesCaTotalItm.font = Arial_12;
                            txtSalesCaDiscount.visible = false;
                            txtSalesCaDiscount.disable = false;
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
                            txtSalesCaVAT4.font = Arial_12;
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
                            label13.font = Arial_12;
                            label4.layoutX = 0.0;
                            label4.layoutY = 0.0;
                            label4.text = "Subtotal";
                            label4.font = Arial_12;
                            label7.layoutX = 70.0;
                            label7.layoutY = 470.0;
                            label7.font = Arial_12;
                            label12.visible = false;
                            label12.opacity = 1.0;
                            label12.layoutY = 0.0;
                            label12.text = "Label";
                            label12.textFill = javafx.scene.paint.Color.BLACK;
                            panelLblColumn2.visible = false;
                            panelLblColumn2.layoutY = 0.0;
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
                            txtSalesCaBalAmt.font = Arial_12;
                            txtSalesCaRoundAmt.visible = true;
                            txtSalesCaRoundAmt.layoutY = 0.0;
                            txtSalesCaRoundAmt.editable = true;
                            panelTxtColumn2.visible = true;
                            panelTxtColumn2.layoutY = 445.0;
                            __layoutInfo_panelTxtColumn2.width = 100.0;
                            __layoutInfo_panelTxtColumn2.height = 100.0;
                            label17.visible = false;
                            label17.text = "Label";
                            label17.textFill = javafx.scene.paint.Color.BLACK;
                            txtSalesCaToalAmt.visible = false;
                            txtSalesCaToalAmt.layoutY = 0.0;
                            txtSalesCaToalAmt.text = "Label";
                            txtSalesCaToalAmt.textAlignment = javafx.scene.text.TextAlignment.LEFT;
                            txtSalesCaToalAmt.hpos = javafx.geometry.HPos.LEFT;
                            txtSalesCaToalAmt.textFill = javafx.scene.paint.Color.BLACK;
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
                            panelCalender.blocksMouse = false;
                            panelCalender.pickOnBounds = false;
                            panelCalender.cache = false;
                            label5.visible = false;
                            label5.text = "Label";
                            label5.textFill = javafx.scene.paint.Color.BLACK;
                            lblBalanceDue.visible = false;
                            lblBalanceDue.layoutX = 0.0;
                            lblBalanceDue.layoutY = 0.0;
                            lblBalanceDue.hpos = javafx.geometry.HPos.LEFT;
                            lblBalanceDue.textFill = javafx.scene.paint.Color.BLACK;
                            panelBalanceDue.visible = false;
                            panelBalanceDue.layoutY = 0.0;
                            panelplugin.visible = false;
                            panelplugin.layoutY = 0.0;
                            panelBillType.visible = false;
                            panelBillType.layoutY = 0.0;
                            panel.visible = false;
                            panelInfo.visible = false;
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
                            panelDocInfo.visible = false;
                            panelCustInfo.visible = false;
                            imageView4.image = imageSave;
                            btnCustDocSave.visible = true;
                            btnCustDocSave.text = "Save [F3]";
                            btnSalesBack.visible = true;
                            btnSalesBack.text = "Back to Sales";
                            btnSalesBack.font = Arial_Bold_14;
                            panelBack.visible = false;
                            rectangle.visible = false;
                            rectangle.strokeWidth = 1.0;
                            rectangle.arcWidth = 5.0;
                            rectangle.arcHeight = 5.0;
                            rectHeader.visible = false;
                            rectHeader.layoutX = 0.0;
                            rectHeader.fill = linearGradient2;
                            rectHeader.width = 1024.0;
                            rectHeader.height = 32.0;
                            rectHeader.arcWidth = 5.0;
                            rectHeader.arcHeight = 5.0;
                            label.visible = false;
                            label.layoutX = 0.0;
                            label.effect = null;
                            label.text = "Sales - Cash Bill - 1";
                            label.font = Arial_25;
                            label.hpos = javafx.geometry.HPos.CENTER;
                            label.textFill = javafx.scene.paint.Color.BLACK;
                            label2.layoutY = 59.0;
                            label2.text = "Customer Name";
                            label2.font = Arial_16;
                            txtSalesCaPName.layoutY = 59.0;
                            txtSalesCaPName.onKeyPressed = txtSalesCaPNameOnKeyPressedAtShown;
                            txtSalesCaPName.onKeyReleased = txtSalesCaPNameOnKeyReleasedAtShown;
                            txtSalesCaPName.font = Arial_16;
                            txtSalesCaDName.layoutY = 59.0;
                            txtSalesCaDName.onKeyPressed = txtSalesCaDNameOnKeyPressedAtShown;
                            txtSalesCaDName.onKeyReleased = txtSalesCaDNameOnKeyReleasedAtShown;
                            txtSalesCaDName.promptText = "Enter Doctor Name";
                            txtSalesCaDName.font = Arial_16;
                            label3.visible = false;
                            label3.layoutY = 30.0;
                            label3.text = "TIN No.";
                            lblSalesCaTIN.visible = false;
                            lblSalesCaTIN.layoutY = 30.0;
                            lblSalesCaTIN.editable = false;
                            lblSalesCaTIN.font = Arial_Bold_14;
                            lblBarcode.visible = true;
                            lblBarcode.layoutY = 59.0;
                            lblBarcode.text = "Barcode";
                            lblBarcode.font = Arial_16;
                            lblBarcode.textFill = DarkGray;
                            label9.layoutY = 30.0;
                            label9.font = Arial_16;
                            label8.layoutY = 59.0;
                            label8.font = Arial_16;
                            txtSalesCaDate.layoutY = 30.0;
                            txtSalesCaDate.onKeyPressed = txtSalesCaDateOnKeyPressedAtShown;
                            txtSalesCaDate.editable = false;
                            txtSalesCaDate.font = Arial_16;
                            txtSalesCaBarcode.visible = true;
                            txtSalesCaBarcode.layoutY = 59.0;
                            txtSalesCaBarcode.onKeyPressed = txtSalesCaBarcodeOnKeyPressedAtShown;
                            txtSalesCaBarcode.font = Arial_Bold_16;
                            CashDatePicker.visible = true;
                            CashDatePicker.layoutY = 30.0;
                            CashDatePicker.onMouseClicked = CashDatePickerOnMouseClickedAtShown;
                            CashDatePicker.blocksMouse = true;
                            CashDatePicker.image = imgCalender;
                            CashDatePicker.fitWidth = 20.0;
                            CashDatePicker.fitHeight = 25.0;
                            txtSalesCaPBillNo.visible = true;
                            txtSalesCaPBillNo.disable = false;
                            txtSalesCaPBillNo.layoutY = 30.0;
                            txtSalesCaPBillNo.styleClass = "text-box";
                            txtSalesCaPBillNo.onKeyPressed = txtSalesCaPBillNoOnKeyPressedAtShown;
                            txtSalesCaPBillNo.onKeyReleased = txtSalesCaPBillNoOnKeyReleasedAtShown;
                            txtSalesCaPBillNo.focusTraversable = true;
                            txtSalesCaPBillNo.editable = true;
                            txtSalesCaPBillNo.font = Arial_Bold_16;
                            imgDName.visible = true;
                            imgDName.layoutY = 59.0;
                            imgDName.onMouseClicked = imgDNameOnMouseClickedAtShown;
                            imgDName.scaleX = 1.0;
                            imgDName.scaleY = 1.0;
                            imgDName.image = image;
                            imgPName.visible = true;
                            imgPName.layoutY = 59.0;
                            __layoutInfo_imgPName.height = 0.0;
                            imgPName.onMouseClicked = imgPNameOnMouseClickedAtShown;
                            imgPName.scaleX = 1.0;
                            imgPName.scaleY = 1.0;
                            imgBill.visible = true;
                            imgBill.layoutY = 30.0;
                            imgBill.onMouseClicked = imgBillOnMouseClickedAtShown;
                            imgBill.image = image;
                            label16.visible = true;
                            label16.layoutY = 30.0;
                            label16.text = "Previous Bill";
                            label16.font = Arial_16;
                            label18.visible = true;
                            label18.opacity = 0.9;
                            label18.layoutY = 30.0;
                            label18.text = "Employee ID";
                            label18.font = Arial_16;
                            label18.textFill = DarkGray;
                            cboEmp_code.visible = true;
                            cboEmp_code.layoutY = 30.0;
                            cboEmp_code.onKeyPressed = cboEmp_codeOnKeyPressedAtShown;
                            cboEmp_code.onMouseClicked = cboEmp_codeOnMouseClickedAtShown;
                            panelTopSection.visible = true;
                            panelTopSection.layoutY = 5.0;
                            imageView2.visible = true;
                            imageView2.image = imageSave;
                            btnSaveOnly.visible = true;
                            btnSaveOnly.cursor = null;
                            btnSaveOnly.layoutY = 0.0;
                            btnSaveOnly.onKeyPressed = btnSaveOnlyOnKeyPressedAtShown;
                            btnSaveOnly.effect = reflectionEffect;
                            btnSaveOnly.text = "Save [F3]";
                            btnSaveOnly.font = Arial_Bold_16;
                            btnSaveOnly.action = btnSaveOnlyActionAtShown;
                            imageView.visible = true;
                            imageView.image = imagePrint;
                            btnSalesCaSave.layoutY = 0.0;
                            btnSalesCaSave.onKeyPressed = btnSalesCaSaveOnKeyPressedAtShown;
                            btnSalesCaSave.onKeyReleased = btnSalesCaSaveOnKeyReleasedAtShown;
                            btnSalesCaSave.font = Arial_Bold_16;
                            btnSalesCaSave.action = btnSalesCaSaveActionAtShown;
                            imageView3.visible = true;
                            imageView3.image = imageReset;
                            btnSalesCaReset.layoutY = 0.0;
                            btnSalesCaReset.onKeyReleased = btnSalesCaResetOnKeyReleasedAtShown;
                            btnSalesCaReset.font = Arial_Bold_16;
                            btnSalesCaReset.action = btnSalesCaResetActionAtShown;
                            imgPrescrib.visible = true;
                            imgPrescrib.image = imgPrescribe;
                            imgPrescrib.fitWidth = 25.0;
                            imgPrescrib.fitHeight = 25.0;
                            btnPrescibe.visible = true;
                            btnPrescibe.onKeyPressed = btnPrescibeOnKeyPressedAtShown;
                            btnPrescibe.effect = reflectionEffect;
                            btnPrescibe.text = "Prescription";
                            btnPrescibe.font = Arial_Bold_16;
                            btnPrescibe.textAlignment = javafx.scene.text.TextAlignment.CENTER;
                            btnPrescibe.action = btnPrescibeActionAtShown;
                            panelButtons.visible = true;
                            listView.visible = false;
                            listView.layoutX = 20.0;
                            listView.layoutY = 85.0;
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
                            label14.visible = false;
                            label14.layoutY = 40.0;
                            label10.layoutX = 0.0;
                            label10.layoutY = 0.0;
                            label10.text = "Products";
                            label10.font = Arial_16;
                            label11.layoutX = 0.0;
                            label11.layoutY = 25.0;
                            label11.text = "Quantity";
                            label11.font = Arial_16;
                            label6.layoutX = 0.0;
                            label6.layoutY = 50.0;
                            label6.text = "Discount";
                            label6.font = Arial_16;
                            label1.layoutX = 0.0;
                            label1.layoutY = 75.0;
                            label1.text = "Total VAT";
                            label1.font = Arial_16;
                            label15.visible = false;
                            label15.layoutX = 0.0;
                            label15.layoutY = 100.0;
                            label15.text = "VAT 12.5%";
                            label15.font = Arial_12;
                            label15.textFill = DarkGray;
                            panelLblColumn1.visible = true;
                            panelLblColumn1.layoutY = 410.0;
                            adjust_amount.visible = true;
                            adjust_amount.layoutY = 375.0;
                            adjust_amount.text = "Adjust Amt.";
                            adjust_amount.font = Arial_12;
                            txtadjust.visible = true;
                            txtadjust.layoutY = 375.0;
                            txtadjust.onKeyPressed = txtadjustOnKeyPressedAtShown;
                            txtadjust.font = Arial_12;
                            btnAdjust.visible = true;
                            btnAdjust.layoutY = 375.0;
                            __layoutInfo_btnAdjust.height = 20.0;
                            btnAdjust.onKeyPressed = btnAdjustOnKeyPressedAtShown;
                            btnAdjust.onMouseClicked = btnAdjustOnMouseClickedAtShown;
                            btnAdjust.text = "Adjust Qty [F7]";
                            btnAdjust.font = Arial_12;
                            lblTotalMargin.visible = true;
                            lblTotalMargin.layoutY = 450.0;
                            lblTotalMargin.text = "";
                            lblTotalMargin.font = Arial_Bold_14;
                            lblPrescriptionDays.visible = true;
                            lblPrescriptionDays.layoutY = 485.0;
                            lblPrescriptionDays.text = "Prescription Days";
                            lblPrescriptionDays.font = Arial_Bold_14;
                            txtPrescriptionDays.visible = true;
                            txtPrescriptionDays.layoutY = 485.0;
                            __layoutInfo_txtPrescriptionDays.height = 22.0;
                            txtPrescriptionDays.promptText = "";
                            txtPrescriptionDays.font = Arial_Bold_16;
                            btnStkAdj.visible = true;
                            btnStkAdj.layoutY = 375.0;
                            __layoutInfo_btnStkAdj.height = 20.0;
                            btnStkAdj.onMouseClicked = btnStkAdjOnMouseClickedAtShown;
                            btnStkAdj.text = "Stock Adjustment to Bill [F8]";
                            btnStkAdj.font = Arial_12;
                            btnDrugSpec.visible = true;
                            btnDrugSpec.layoutY = 402.0;
                            __layoutInfo_btnDrugSpec.height = 20.0;
                            btnDrugSpec.onMouseClicked = btnDrugSpecOnMouseClickedAtShown;
                            btnDrugSpec.text = "Drug Specifications [F9]";
                            btnDrugSpec.font = Arial_12;
                            btnFood.visible = true;
                            btnFood.layoutY = 402.0;
                            __layoutInfo_btnFood.height = 20.0;
                            btnFood.onMouseClicked = btnFoodOnMouseClickedAtShown;
                            btnFood.text = "Food Interaction [F1]";
                            btnFood.font = Arial_12;
                            panelTable.visible = true;
                            rectTableBorder.visible = true;
                            rectTableBorder.y = 0.0;
                            lblSalesCaTotalQty.managed = true;
                            lblSalesCaTotalQty.layoutX = 0.0;
                            lblSalesCaTotalQty.layoutY = 25.0;
                            lblSalesCaTotalQty.styleClass = "text-box";
                            lblSalesCaTotalQty.onKeyReleased = lblSalesCaTotalQtyOnKeyReleasedAtShown;
                            lblSalesCaTotalQty.promptText = "0";
                            lblSalesCaTotalQty.selectOnFocus = false;
                            lblSalesCaTotalQty.editable = false;
                            lblSalesCaTotalQty.font = Arial_14;
                            lblSalesCaTotalItm.layoutX = 0.0;
                            lblSalesCaTotalItm.layoutY = 0.0;
                            lblSalesCaTotalItm.styleClass = "text-box";
                            lblSalesCaTotalItm.promptText = "0";
                            lblSalesCaTotalItm.selectOnFocus = false;
                            lblSalesCaTotalItm.editable = false;
                            lblSalesCaTotalItm.font = Arial_14;
                            txtSalesCaDiscount.visible = true;
                            txtSalesCaDiscount.disable = false;
                            txtSalesCaDiscount.layoutY = 50.0;
                            txtSalesCaDiscount.styleClass = "text-box";
                            txtSalesCaDiscount.onKeyPressed = txtSalesCaDiscountOnKeyPressedAtShown;
                            txtSalesCaDiscount.onKeyReleased = txtSalesCaDiscountOnKeyReleasedAtShown;
                            txtSalesCaDiscount.onKeyTyped = txtSalesCaDiscountOnKeyTypedAtShown;
                            txtSalesCaDiscount.promptText = "0.00";
                            txtSalesCaDiscount.selectOnFocus = false;
                            txtSalesCaDiscount.editable = true;
                            txtSalesCaDiscount.font = Arial_14;
                            txtSalesCaVAT4.layoutX = 0.0;
                            txtSalesCaVAT4.layoutY = 75.0;
                            txtSalesCaVAT4.styleClass = "text-box";
                            txtSalesCaVAT4.text = "";
                            txtSalesCaVAT4.promptText = "0.00";
                            txtSalesCaVAT4.selectOnFocus = false;
                            txtSalesCaVAT4.editable = false;
                            txtSalesCaVAT4.font = Arial_14;
                            txtSalesCaVAT123.visible = false;
                            txtSalesCaVAT123.layoutX = 0.0;
                            txtSalesCaVAT123.layoutY = 100.0;
                            txtSalesCaVAT123.styleClass = "text-box";
                            txtSalesCaVAT123.promptText = "0.00";
                            txtSalesCaVAT123.selectOnFocus = false;
                            txtSalesCaVAT123.editable = false;
                            txtSalesCaVAT123.font = Arial_12;
                            panelTxtColumn1.visible = true;
                            panelTxtColumn1.layoutY = 410.0;
                            label13.layoutX = 0.0;
                            label13.layoutY = 0.0;
                            label13.font = Arial_16;
                            label4.layoutX = 0.0;
                            label4.layoutY = 25.0;
                            label4.text = "Subtotal";
                            label4.font = Arial_16;
                            label7.layoutX = 0.0;
                            label7.layoutY = 50.0;
                            label7.font = Arial_16;
                            label12.visible = true;
                            label12.opacity = 1.0;
                            label12.layoutY = 75.0;
                            label12.text = "Rounded Off";
                            label12.font = Arial_16;
                            label12.textFill = DarkGray;
                            panelLblColumn2.visible = true;
                            panelLblColumn2.layoutY = 410.0;
                            txtSalesCaNetPaid.layoutX = 0.0;
                            txtSalesCaNetPaid.layoutY = 0.0;
                            __layoutInfo_txtSalesCaNetPaid.height = 22.0;
                            txtSalesCaNetPaid.styleClass = "text-box";
                            txtSalesCaNetPaid.onKeyPressed = txtSalesCaNetPaidOnKeyPressedAtShown;
                            txtSalesCaNetPaid.onKeyTyped = txtSalesCaNetPaidOnKeyTypedAtShown;
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
                            txtSalesCaSubTotal.font = Arial_14;
                            txtSalesCaBalAmt.layoutX = 0.0;
                            txtSalesCaBalAmt.layoutY = 50.0;
                            txtSalesCaBalAmt.styleClass = "text-box";
                            txtSalesCaBalAmt.text = "";
                            txtSalesCaBalAmt.promptText = "0.00";
                            txtSalesCaBalAmt.selectOnFocus = false;
                            txtSalesCaBalAmt.editable = false;
                            txtSalesCaBalAmt.font = Arial_16;
                            txtSalesCaRoundAmt.visible = true;
                            txtSalesCaRoundAmt.layoutY = 75.0;
                            txtSalesCaRoundAmt.onKeyPressed = txtSalesCaRoundAmtOnKeyPressedAtShown;
                            txtSalesCaRoundAmt.onKeyTyped = txtSalesCaRoundAmtOnKeyTypedAtShown;
                            txtSalesCaRoundAmt.editable = true;
                            txtSalesCaRoundAmt.font = Arial_14;
                            panelTxtColumn2.visible = true;
                            panelTxtColumn2.layoutY = 410.0;
                            __layoutInfo_panelTxtColumn2.width = 100.0;
                            __layoutInfo_panelTxtColumn2.height = 100.0;
                            label17.visible = true;
                            label17.text = "Total";
                            label17.font = Arial_25;
                            label17.textFill = Gray;
                            txtSalesCaToalAmt.visible = true;
                            txtSalesCaToalAmt.layoutY = 0.0;
                            txtSalesCaToalAmt.text = "0.00";
                            txtSalesCaToalAmt.font = Arial_Bold__65;
                            txtSalesCaToalAmt.textAlignment = javafx.scene.text.TextAlignment.RIGHT;
                            txtSalesCaToalAmt.hpos = javafx.geometry.HPos.RIGHT;
                            txtSalesCaToalAmt.textFill = DarkGray;
                            panelAmt.visible = true;
                            panelAmt.layoutY = 450.0;
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
                            panelCalender.blocksMouse = true;
                            panelCalender.pickOnBounds = false;
                            panelCalender.cache = false;
                            label5.visible = true;
                            label5.text = "Balance Due :";
                            label5.font = Arial_Bold_16;
                            label5.textFill = DarkGray;
                            lblBalanceDue.visible = true;
                            lblBalanceDue.layoutX = 0.0;
                            lblBalanceDue.layoutY = 0.0;
                            lblBalanceDue.font = Arial_Bold_20;
                            lblBalanceDue.hpos = javafx.geometry.HPos.RIGHT;
                            lblBalanceDue.textFill = Orange;
                            panelBalanceDue.visible = true;
                            panelBalanceDue.layoutY = 410.0;
                            panelplugin.visible = true;
                            panelplugin.layoutY = 485.0;
                            panelBillType.visible = true;
                            panelBillType.layoutY = 365.0;
                            panel.visible = true;
                            panelInfo.visible = true;
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
                            panelDocInfo.visible = false;
                            panelCustInfo.visible = true;
                            imageView4.image = imageSave;
                            btnCustDocSave.visible = true;
                            btnCustDocSave.text = "Save [F3]";
                            btnSalesBack.visible = true;
                            btnSalesBack.text = "Back to Sales";
                            btnSalesBack.font = Arial_Bold_14;
                            btnSalesBack.action = btnSalesBackAction;
                            panelBack.visible = true;
                            rectangle.visible = false;
                            rectangle.strokeWidth = 2.0;
                            rectangle.arcWidth = 5.0;
                            rectangle.arcHeight = 5.0;
                            rectHeader.visible = false;
                            rectHeader.layoutX = 0.0;
                            rectHeader.fill = linearGradientHeader;
                            rectHeader.width = 0.0;
                            rectHeader.height = 32.0;
                            rectHeader.arcWidth = 0.0;
                            rectHeader.arcHeight = 0.0;
                            label.visible = true;
                            label.layoutX = 0.0;
                            label.effect = null;
                            label.text = "Sales - Cash Bill";
                            label.font = Arial_25;
                            label.hpos = javafx.geometry.HPos.CENTER;
                            label.textFill = javafx.scene.paint.Color.BLACK;
                            label2.layoutY = 60.0;
                            label2.text = "Customer Name";
                            label2.font = Arial_12;
                            txtSalesCaPName.layoutY = 60.0;
                            txtSalesCaPName.onKeyPressed = txtSalesCaPNameOnKeyPressedAtShown;
                            txtSalesCaPName.onKeyReleased = txtSalesCaPNameOnKeyReleasedAtShown;
                            txtSalesCaPName.font = Arial_12;
                            txtSalesCaDName.layoutY = 85.0;
                            txtSalesCaDName.onKeyPressed = txtSalesCaDNameOnKeyPressedAtShown;
                            txtSalesCaDName.onKeyReleased = txtSalesCaDNameOnKeyReleasedAtShown;
                            txtSalesCaDName.promptText = "Enter Doctor Name";
                            txtSalesCaDName.font = Arial_12;
                            label3.visible = true;
                            label3.layoutY = 60.0;
                            label3.text = "TIN No";
                            lblSalesCaTIN.visible = true;
                            lblSalesCaTIN.layoutY = 85.0;
                            lblSalesCaTIN.editable = false;
                            lblSalesCaTIN.font = Arial_12;
                            lblBarcode.visible = false;
                            lblBarcode.layoutY = 0.0;
                            lblBarcode.text = "Label";
                            lblBarcode.textFill = javafx.scene.paint.Color.BLACK;
                            label9.layoutY = 60.0;
                            label9.font = Arial_12;
                            label8.layoutY = 85.0;
                            label8.font = Arial_12;
                            txtSalesCaDate.layoutY = 60.0;
                            txtSalesCaDate.onKeyPressed = txtSalesCaDateOnKeyPressedAtShown;
                            txtSalesCaDate.editable = false;
                            txtSalesCaDate.font = Arial_12;
                            txtSalesCaBarcode.visible = false;
                            txtSalesCaBarcode.layoutY = 0.0;
                            CashDatePicker.visible = true;
                            CashDatePicker.layoutY = 60.0;
                            CashDatePicker.onMouseClicked = CashDatePickerOnMouseClickedAtShown;
                            CashDatePicker.blocksMouse = false;
                            CashDatePicker.image = null;
                            CashDatePicker.fitWidth = 0.0;
                            CashDatePicker.fitHeight = 0.0;
                            txtSalesCaPBillNo.visible = false;
                            txtSalesCaPBillNo.disable = false;
                            txtSalesCaPBillNo.layoutY = 60.0;
                            txtSalesCaPBillNo.styleClass = "text-box";
                            txtSalesCaPBillNo.onKeyPressed = txtSalesCaPBillNoOnKeyPressedAtShown;
                            txtSalesCaPBillNo.focusTraversable = false;
                            txtSalesCaPBillNo.editable = false;
                            txtSalesCaPBillNo.font = Arial_12;
                            imgDName.visible = false;
                            imgDName.layoutY = 0.0;
                            imgDName.scaleX = 1.0;
                            imgDName.scaleY = 1.0;
                            imgDName.image = imgCalender;
                            imgPName.visible = false;
                            imgPName.layoutY = 0.0;
                            imgPName.scaleX = 1.0;
                            imgPName.scaleY = 1.0;
                            imgBill.visible = false;
                            imgBill.layoutY = 15.0;
                            imgBill.image = null;
                            label16.visible = false;
                            label16.layoutY = 0.0;
                            label16.text = "Label";
                            label18.visible = false;
                            label18.opacity = 1.0;
                            label18.layoutY = 0.0;
                            label18.text = "Label";
                            label18.textFill = javafx.scene.paint.Color.BLACK;
                            cboEmp_code.visible = false;
                            cboEmp_code.layoutY = -4.0;
                            panelTopSection.visible = true;
                            panelTopSection.layoutY = 0.0;
                            imageView2.visible = false;
                            imageView2.image = null;
                            btnSaveOnly.visible = false;
                            btnSaveOnly.layoutY = 534.0;
                            btnSaveOnly.text = "Save [F3]";
                            imageView.visible = false;
                            imageView.image = null;
                            btnSalesCaSave.layoutY = 525.0;
                            btnSalesCaSave.onKeyPressed = btnSalesCaSaveOnKeyPressedAtShown;
                            btnSalesCaSave.onKeyReleased = btnSalesCaSaveOnKeyReleasedAtShown;
                            btnSalesCaSave.font = Arial_Bold_14;
                            btnSalesCaSave.action = btnSalesCaSaveActionAtShown;
                            imageView3.visible = false;
                            imageView3.image = null;
                            btnSalesCaReset.layoutY = 525.0;
                            btnSalesCaReset.onKeyReleased = btnSalesCaResetOnKeyReleasedAtShown;
                            btnSalesCaReset.font = Arial_Bold_14;
                            btnSalesCaReset.action = btnSalesCaResetActionAtShown;
                            imgPrescrib.visible = false;
                            imgPrescrib.image = null;
                            imgPrescrib.fitWidth = 0.0;
                            imgPrescrib.fitHeight = 0.0;
                            btnPrescibe.visible = false;
                            btnPrescibe.text = "Button";
                            btnPrescibe.textAlignment = javafx.scene.text.TextAlignment.LEFT;
                            panelButtons.visible = false;
                            listView.visible = true;
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
                            label14.visible = false;
                            label14.layoutY = 60.0;
                            label10.layoutX = 0.0;
                            label10.layoutY = 445.0;
                            label10.text = "Total Products";
                            label10.font = Arial_12;
                            label11.layoutX = 0.0;
                            label11.layoutY = 470.0;
                            label11.text = "Total Quantity";
                            label11.font = Arial_12;
                            label6.layoutX = 0.0;
                            label6.layoutY = 25.0;
                            label6.text = "Discount";
                            label6.font = Arial_12;
                            label1.layoutX = 0.0;
                            label1.layoutY = 50.0;
                            label1.text = "VAT";
                            label1.font = Arial_12;
                            label15.visible = false;
                            label15.layoutX = 397.0;
                            label15.layoutY = 499.0;
                            label15.text = "Label";
                            label15.textFill = javafx.scene.paint.Color.BLACK;
                            panelLblColumn1.visible = false;
                            panelLblColumn1.layoutY = 0.0;
                            adjust_amount.visible = false;
                            adjust_amount.layoutY = 336.0;
                            adjust_amount.text = "Label";
                            txtadjust.visible = false;
                            txtadjust.layoutY = 0.0;
                            btnAdjust.visible = false;
                            btnAdjust.layoutY = 0.0;
                            btnAdjust.text = "Button";
                            lblTotalMargin.visible = false;
                            lblTotalMargin.layoutY = 0.0;
                            lblTotalMargin.text = "Label";
                            lblPrescriptionDays.visible = false;
                            lblPrescriptionDays.layoutY = 0.0;
                            lblPrescriptionDays.text = "Label";
                            txtPrescriptionDays.visible = false;
                            txtPrescriptionDays.layoutY = 0.0;
                            txtPrescriptionDays.promptText = null;
                            btnStkAdj.visible = false;
                            btnStkAdj.layoutY = 0.0;
                            btnStkAdj.text = "Button";
                            btnDrugSpec.visible = false;
                            btnDrugSpec.layoutY = 0.0;
                            btnDrugSpec.text = "Button";
                            btnFood.visible = false;
                            btnFood.layoutY = 0.0;
                            btnFood.text = "Button";
                            panelTable.visible = false;
                            rectTableBorder.visible = false;
                            rectTableBorder.y = 0.0;
                            lblSalesCaTotalQty.managed = true;
                            lblSalesCaTotalQty.layoutX = 0.0;
                            lblSalesCaTotalQty.layoutY = 470.0;
                            lblSalesCaTotalQty.styleClass = "Borderless-text-box";
                            lblSalesCaTotalQty.promptText = "0";
                            lblSalesCaTotalQty.selectOnFocus = true;
                            lblSalesCaTotalQty.editable = false;
                            lblSalesCaTotalQty.font = Arial_12;
                            lblSalesCaTotalItm.layoutX = 0.0;
                            lblSalesCaTotalItm.layoutY = 445.0;
                            lblSalesCaTotalItm.styleClass = "Borderless-text-box";
                            lblSalesCaTotalItm.promptText = "0";
                            lblSalesCaTotalItm.selectOnFocus = true;
                            lblSalesCaTotalItm.editable = false;
                            lblSalesCaTotalItm.font = Arial_12;
                            txtSalesCaDiscount.visible = false;
                            txtSalesCaDiscount.disable = false;
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
                            txtSalesCaVAT4.font = Arial_12;
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
                            label13.font = Arial_12;
                            label4.layoutX = 0.0;
                            label4.layoutY = 0.0;
                            label4.text = "Subtotal";
                            label4.font = Arial_12;
                            label7.layoutX = 70.0;
                            label7.layoutY = 470.0;
                            label7.font = Arial_12;
                            label12.visible = false;
                            label12.opacity = 1.0;
                            label12.layoutY = 0.0;
                            label12.text = "Label";
                            label12.textFill = javafx.scene.paint.Color.BLACK;
                            panelLblColumn2.visible = false;
                            panelLblColumn2.layoutY = 0.0;
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
                            txtSalesCaBalAmt.font = Arial_12;
                            txtSalesCaRoundAmt.visible = true;
                            txtSalesCaRoundAmt.layoutY = 0.0;
                            txtSalesCaRoundAmt.editable = true;
                            panelTxtColumn2.visible = true;
                            panelTxtColumn2.layoutY = 445.0;
                            __layoutInfo_panelTxtColumn2.width = 100.0;
                            __layoutInfo_panelTxtColumn2.height = 100.0;
                            label17.visible = false;
                            label17.text = "Label";
                            label17.textFill = javafx.scene.paint.Color.BLACK;
                            txtSalesCaToalAmt.visible = false;
                            txtSalesCaToalAmt.layoutY = 0.0;
                            txtSalesCaToalAmt.text = "Label";
                            txtSalesCaToalAmt.textAlignment = javafx.scene.text.TextAlignment.LEFT;
                            txtSalesCaToalAmt.hpos = javafx.geometry.HPos.LEFT;
                            txtSalesCaToalAmt.textFill = javafx.scene.paint.Color.BLACK;
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
                            panelCalender.blocksMouse = true;
                            panelCalender.pickOnBounds = true;
                            panelCalender.cache = true;
                            label5.visible = false;
                            label5.text = "Label";
                            label5.textFill = javafx.scene.paint.Color.BLACK;
                            lblBalanceDue.visible = false;
                            lblBalanceDue.layoutX = 0.0;
                            lblBalanceDue.layoutY = 0.0;
                            lblBalanceDue.hpos = javafx.geometry.HPos.LEFT;
                            lblBalanceDue.textFill = javafx.scene.paint.Color.BLACK;
                            panelBalanceDue.visible = false;
                            panelBalanceDue.layoutY = 0.0;
                            panelplugin.visible = false;
                            panelplugin.layoutY = 0.0;
                            panelBillType.visible = false;
                            panelBillType.layoutY = 0.0;
                            panel.visible = false;
                            panelInfo.visible = false;
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
        [ panelDocInfo, panelCustInfo, panelBack, panel, panelInfo, ]
    }
    // </editor-fold>//GEN-END:main




    function btnFoodOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
            drugSpecification("yes");
    }


    function btnDrugSpecOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
            drugSpecification("no");
    }

    function drugSpecification(foodInteraction:String): Void {
            var rowCount = CashSalesTableObj.getDataRowCount();
            if(rowCount>0 and CashSalesTableObj.jcomp.getSelectedRow()<=rowCount-1)
            {   
                var genericName = commonController.getQueryValue("SELECT  genericname from drugtable where concat(itemname,'_',dosage,' |',formulation)= concat('{CashSalesTableObj.jcomp.getValueAt(CashSalesTableObj.jcomp.getSelectedRow(),2)}',dosage,' |',formulation) or concat(itemname,'_',dosage,' |',formulation)= concat('{CashSalesTableObj.jcomp.getValueAt(CashSalesTableObj.jcomp.getSelectedRow(),2)}',' |',formulation) limit 1");
                if(genericName == ""){
                    FXinfo("Generic Name details not available for this medicine");
            }
                else {
                    var ds:DrugSpecifications = new DrugSpecifications();
                    var itemName = commonController.getQueryValue("SELECT  concat(itemname,'_',dosage,' |',formulation) from drugtable where concat(itemname,'_',dosage,' |',formulation)= concat('{CashSalesTableObj.jcomp.getValueAt(CashSalesTableObj.jcomp.getSelectedRow(),2)}',dosage,' |',formulation) or concat(itemname,'_',dosage,' |',formulation)= concat('{CashSalesTableObj.jcomp.getValueAt(CashSalesTableObj.jcomp.getSelectedRow(),2)}',' |',formulation) limit 1");
                    ds.loadSpecifications(itemName,foodInteraction);
                    ds.setVisible(true);
                }
            }
            else{
                    FXinfo("Please select the Medicine name in Sales Table");
            }
        }

    function txtSalesCaBarcodeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if(event.code == KeyCode.VK_ENTER) {
            var itemCode:String = commonController.getQueryValue("SELECT item_code FROM barcode_mapping where delete_flag=0 and item_id='{txtSalesCaBarcode.rawText.trim()}' or barcode='{txtSalesCaBarcode.rawText.trim()}'");
            if(itemCode=="") {  
                itemCode= commonController.getQueryValue("SELECT itemcode FROM drugtable where substring(item_id,3,9)='{txtSalesCaBarcode.rawText.trim()}' and dru_flag_id!=3");
            }
            var stockExists:String = commonController.getQueryValue("select count(qty) from stock_statement where item_code='{itemCode}' and ss_flag_id=0");
            if(itemCode=="") {
                FXinfo("Select valid barcode");
            }
            else if(stockExists=="0" or stockExists=="") {
                FXinfo("The selected Item/barcode not available in stock");
            }
            else {
                CashSalesTableObj.barcodeSelected = true;
                CashSalesTableObj.itemCode = itemCode;
                CashSalesTableObj.focusSet(0,1,"barcode");
            }
       }
       shortcut(event);
    }

    function btnStkAdjOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        stockAdjustmentToBill();
    }

   function stockAdjustmentToBill():Void {
       var stkAdjustRows=Integer.parseInt(commonController.getQueryValue("SELECT count(*) FROM stock_adjustment s where adjusted_stock <0"));
        if(stkAdjustRows==0) {
            FXinfo("There is no Stock Adjustment available for Sales bill Conversion.Please check");
        }
        else {
            if(CashSalesTableObj.nullVal==1){
                var cn:ConfirmDialogBox = new ConfirmDialogBox(0,"Sales Cash","<html>Selecting this option will reset table values.<br> Do you want to continue?</html> ");
                if(cn.staus==true) {
                    CashSalesTableObj.insertSalesAdjData();
                }
            }
            else {
                CashSalesTableObj.insertSalesAdjData();
            }
        }
   }

    var msgHeader:String;
    
    function checkDrugInteraction() :Integer {
        var d:Integer;
        var salesModel = new SalesModel();
        
        
        try {
            //Generic Name list from prescription table
            var tableItems:List = CashSalesTableObj.getSalesBillItems();
            var tablegenericList = new ArrayList();
            var itemMap = new HashMap();
            itemMap = new HashMap();
            var GenericList = new ArrayList();
            for(i in [0..<tableItems.size()]) {
                salesModel=tableItems.get(i) as SalesModel;
                var tableGenericNames = commonController.getQueryValue("SELECT  genericname from drugtable where concat(itemname,'_',dosage,' |',formulation)= concat('{salesModel.getItemName()}',dosage,' |',formulation) or concat(itemname,'_',dosage,' |',formulation)= concat('{salesModel.getItemName()}',' |',formulation) limit 1");
                var tableGenericName = tableGenericNames.split(",");
                for(j in [0..<tableGenericName.length]) {
                    if(not tableGenericName[j].equals("") and not tablegenericList.contains(tableGenericName[j]))
                    tablegenericList.add(tableGenericName[j].toUpperCase());
                    itemMap.put("{tableGenericName[j].toUpperCase()}", salesModel.getItemName());
                }
            }
            //Generic Name list from Text Box
            var txtGenericNames = commonController.getQueryValue("SELECT  genericname from drugtable where concat(itemname,'_',dosage,' |',formulation)= concat('{salesModel.getItemName()}',dosage,' |',formulation) or concat(itemname,'_',dosage,' |',formulation)= concat('{salesModel.getItemName()}',' |',formulation) limit 1");
            var txtGenericName = txtGenericNames.split(",");
            var txtGenericList = new ArrayList();
            for(j in [0..<txtGenericName.length]) {
                    if(not txtGenericName[j].equals("") and not txtGenericList.contains(txtGenericName[j]))
                    txtGenericList.add(txtGenericName[j].toUpperCase());
            }

            //Interacting generic name list from drug interaction db table
             for(m in [0.. < txtGenericList.size()]) {
                    for(k in [0.. <tablegenericList.size()]) {
                    var interactionDesc:String = commonController.getQueryValue("select distinct interaction_desc from drug_interaction di where di.generic_name ='{tablegenericList.get(k)}'and di.interacting_generic='{txtGenericList.get(m)}';");
                    var interactionDesc1:String = commonController.getQueryValue("select distinct interaction_desc from drug_interaction di where di.generic_name ='{txtGenericList.get(m)}'and di.interacting_generic='{tablegenericList.get(k)}';");
                    if((interactionDesc.equals("") and interactionDesc1.equals(""))) {
                    }
                    else {
                        if(interactionDesc.equals("")) {
                            this.interactionDesc =interactionDesc1;
                        }
                        else {
                            this.interactionDesc = interactionDesc;
                        }
                        d=1;
                        DrugSpecModel = new DrugSpecificationModel();
                        DrugSpecModel.setGenericName(txtGenericList.get(m).toString());
                        DrugSpecModel.setInteractingGenericName(tablegenericList.get(k).toString());
                        DrugSpecModel.setItemName(itemMap.get({tablegenericList.get(k)}).toString());
                        DrugSpecModel.setInteractionDesc(this.interactionDesc);
                        GenericList.add(DrugSpecModel);
                        DrugSpecModel.setDrugSpecificationModelList(GenericList);
                        msgHeader = "{msgHeader} \n{tablegenericList.get(k)} :\n{this.interactionDesc}\n";
                    }
                }
            }
        }
        catch(ex:Exception) {
            var que = " Class : SalesCash1   Method: checkDrugInteraction() )    Exception : {ex}";
            log.debug(que);
        }
        return d;
    }

    function txtSalesCaDiscountOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {        
        shortcut(event);
        if(event.code == KeyCode.VK_ENTER) {
            if(CashSalesTableObj.barcodeFocus==true) {
                txtSalesCaBarcode.requestFocus();
            }
            else {
                txtSalesCaPName.requestFocus();
            }
        }
     }

    function btnPrescibeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB){
            txtSalesCaPBillNo.requestFocus();
            if(event.shiftDown){
                btnSalesCaReset.requestFocus();
            }
        }
    }

    
    var pd:PrescriptionDetails;
    function btnPrescibeActionAtShown(): Void {
        pd = new PrescriptionDetails(CashSalesTableObj.jcomp,"SalesInvoice");
            pd.setVisible(true);
            var isVisible = bind pd.isVisible() on replace{
                if(not isVisible and not pd.isLoaded ){
                    ;
                } else if(not isVisible and pd.isLoaded ) {
                    txtSalesCaPName.text = pd.patientName;
                    txtSalesCaDName.text = pd.doctorName;
                }

            }
    }

    function lblSalesCaTotalQtyOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
     }

    var salesDiscSettings = bind CommonDeclare.salesDiscApply on replace {
        CashSalesTableObj.dtmodel.setCellEditable(0, 9, salesDiscSettings);
    }
    var SPFocus = bind SalesPlugin.focusNextNode on replace {
        if(SPFocus == 1){
            btnSalesCaSave.requestFocus();
        } else if(SPFocus == -1){
            txtSalesCaRoundAmt.requestFocus();
        }
    }
   

    function txtSalesCaDiscountOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
         if(settingsController.getSalesDiscountType()==0){
                txtSalesCaDiscount.editable=false;
            } else {
                txtSalesCaDiscount.editable=true;                
            }
            if(event.code == KeyCode.VK_TAB){
                txtSalesCaBalAmt.requestFocus();
                if(event.shiftDown){
                    btnAdjust.requestFocus();
                }
            }
            shortcut(event);
         }
         var isTabonRdoCash = bind SalesTypeSelection.isTabonRdoCash on replace {
             if(isTabonRdoCash == -1){
                CashSalesTableObj.focusSet();                
             }
         }
         var isTabonRdoCard = bind SalesTypeSelection.isTabonRdoCard on replace {
             if(isTabonRdoCard == 1){
                txtadjust.requestFocus();
             }
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
            else if(Double.parseDouble(txtSalesCaDiscount.rawText) >= CashSalesTableObj.totAmt) {
                FXinfo("Discount Amount cannot be greater than total Amount");
            } else {
                CashSalesTableObj.calcDiscount(txtSalesCaDiscount.rawText.trim());
                calcDiscTotal ("disc");
            }
        }
        else {
            CashSalesTableObj.calcDiscount("0");
            calcDiscTotal("disc");
        }
        }

     function calcDiscTotal (calcType:String): Void {
           System.out.println("eee");
            var ta: Double = Value.Round(CashSalesTableObj.totAmt, 2);
             System.out.println(Value.Round(CashSalesTableObj.totAmt, 2));
            var tda: Double = Value.Round(CashSalesTableObj.totDistAmt, 2);
             System.out.println(Value.Round(CashSalesTableObj.totDistAmt, 2));
            var tvat4: Double = Value.Round(CashSalesTableObj.totVATAmt4, 2);
                System.out.println(Value.Round(CashSalesTableObj.totVATAmt4, 2));
            vatAmt = (tvat4);
            txtSalesCaSubTotal.text = Value.Round(ta);
            lblSalesCaTotalQty.text = "{CashSalesTableObj.totQty}";
              System.out.println({CashSalesTableObj.totQty});
            lblSalesCaTotalItm.text = "{CashSalesTableObj.totItems}";
             System.out.println({CashSalesTableObj.totItems});
            lblTotalMargin.text = "TOTAL MARGIN : {Value.Round(CashSalesTableObj.totMargin)}";
            if(calcType.equals("total")) {
            txtSalesCaDiscount.text = "{Value.Round(tda, 2)}";
            }
            txtSalesCaVAT4.text = Value.Round(tvat4);
            netAmt = ta - tda;
            var autoRoundoff : Integer = 0;
            try {            
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
            if (selBillType.equals("Credit")) {
                var np = txtSalesCaNetPaid.rawText;
                var bal = Double.parseDouble(rndVal) - Double.parseDouble(np);
                txtSalesCaBalAmt.text = Value.Round("{bal}");
            } else {
                txtSalesCaNetPaid.text = rndVal;
                txtSalesCaBalAmt.text = "0.00";
            }
     }
     
    function txtSalesCaRoundAmtOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if(event.code==KeyCode.VK_TAB) {
            SalesPlugin.txtReceived.requestFocus();
            if(event.shiftDown){
                txtSalesCaVAT4.requestFocus();
            }
        }
        shortcut(event);
        }

    function txtSalesCaRoundAmtOnKeyTypedAtShown(event: javafx.scene.input.KeyEvent): Void {        
        if (NumberUtils.isNumeric(txtSalesCaRoundAmt) and not txtSalesCaRoundAmt.rawText.equals("")) {
         txtSalesCaToalAmt.text = "{Value.Round(netAmt+Double.parseDouble(txtSalesCaRoundAmt.text))}";
         if(selBillType.equals("Cash")) {
             txtSalesCaNetPaid.text = txtSalesCaToalAmt.text;
             txtSalesCaBalAmt.text = "0.00";
        } else if (selBillType.equals("Credit") and not txtSalesCaNetPaid.rawText.equals("")) {
                var bal = Double.parseDouble(txtSalesCaToalAmt.text) - Double.parseDouble(txtSalesCaNetPaid.rawText);
                txtSalesCaBalAmt.text = Value.Round("{bal}");
            }
            }
         }

    
    function cboEmp_codeOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        empCode = commonController.getEmployeeCode("").toArray() as String[];
         }

    function txtadjustOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if(event.code == KeyCode.VK_ENTER) {
            btnAdjust.requestFocus();
        }
        else if(event.code == KeyCode.VK_TAB) {
            btnAdjust.requestFocus();
            if(event.shiftDown){
                SalesTypeSelection.rdoCard.requestFocus();
            }
        }
        shortcut(event);
    }

    function btnAdjustOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if(event.code == KeyCode.VK_ENTER) {
            adjustmentAmount();
        }
        if(event.code == KeyCode.VK_TAB) {
            txtSalesCaDiscount.requestFocus();
            if(event.shiftDown){
                txtadjust.requestFocus();
            }
        }
        shortcut(event);
    }

    function btnAdjustOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        adjustmentAmount();
         }
    function adjustmentAmount():Void{
         var returnFlag : Integer;
         var valid1:Validation = new Validation();
         var intValid:Integer;
         if(txtadjust.rawText.trim() !=""){
            intValid = valid1.getNumberValid(txtadjust.text, 1, 6);
            if(intValid ==1){
                FXinfo("Adjustment amount cannot be more than 6 digits.");
            }
            else if(intValid ==0){
                FXinfo("Please enter only numbers.Characters and decimals not allowed");
            }
            else if(txtadjust.rawText.trim().equals("0")){
                FXinfo("Adjustment amount should be greater than zero.");
            }
            else {
                returnFlag = CashSalesTableObj.adjustAmount(Integer.parseInt(txtadjust.text));
                if(returnFlag == 0){
                    FXinfo("Please enter table values.");
                }
                else if(returnFlag == 2){
                    FXinfo("Adjustment Amount greater than total sales Amount");
                }
            }
         }
         else {
                FXinfo("Please enter the Amount in Adjust amt. text box");
         }
         updateIntValues();
    }

    function cboEmp_codeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        empCode = commonController.getEmployeeCode("").toArray() as String[];
        if(event.code==KeyCode.VK_TAB) {
            txtSalesCaDate.requestFocus();
            if(event.shiftDown){
                txtSalesCaPBillNo.requestFocus();
            }
        }
        shortcut(event);
    }              

    function btnSaveOnlyOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if(event.code == KeyCode.VK_ENTER) {
        saveSales(0);
        }
        }

    function txtSalesCaPBillNoOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        getBillNo(txtSalesCaPBillNo.rawText);
    }

    function imgBillOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        getBillNo("");
         }

    function txtSalesCaNetPaidOnKeyTypedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (NumberUtils.isNumeric(txtSalesCaNetPaid)) {
              if (selBillType.equals("Credit") and not txtSalesCaNetPaid.rawText.equals("")) {
                var bal = Double.parseDouble(txtSalesCaToalAmt.text) - Double.parseDouble(txtSalesCaNetPaid.rawText);
                txtSalesCaBalAmt.text = Value.Round("{bal}");
            }
        };
    }

    function lblSalesCaTotalItmOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function rectangleOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {    
    }

    var tmp = bind listSalesCash.visible on replace {
                if (tmp == true)
                    fxCalendar.visible = false;
            }
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    def CustomAlert = CustomAlert {};

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Sales - {selBillType} Payment", type);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {        
        CustomAlert.ShowInfo("Sales - {selBillType} Payment", msg);
        showAlertbox();
    }

    function FXinfo(msg: String, t : TextBox ): Void {
        CustomAlert.ShowInfo("Sales - {selBillType} Payment", msg);
        showAlertbox();
        t.requestFocus();
        t.style = error;
    }

    function rotateImage(img: ImageView): Void {
    }

    function imgPNameOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        listCustomerChanges(0);
        setMandatory();
    }

    function imgDNameOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        listDoctorChanges(0);
    }

    function listSalesCashOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER)
            listSalesCash.visible = false;
    }

    function ShowList(): Void {
        listSalesCash.visible=true;
    }


    function btnSaveOnlyActionAtShown(): Void {
        saveSales(0);
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
                balance = commonController.getCustomerBalance("{cust}");
                if(creditLimitAlert("{cust}").equals(true)) {
                var creditLimit:Double = salesController.getCreditLimit("{txtSalesCaPName.rawText.trim()}");
                FXinfo("Customer oustanding exceeds the Credit Limit - {creditLimit}. To Change credit Limit in Customer Information, press ALT+C. ");
                }
                } else {
                    callCustInfo();
                    listSalesCash.visible = false;
                    imgP = false;
                }
            }
         }
     }
     else {
            listSalesCash.visible= false;
            txtSalesCaPName.requestFocus();
          }
    }

    function creditLimitAlert(custName:String):Boolean{        
        var custos:Double = Double.parseDouble(commonController.getCustomerBalance("{custName}"));
        var creditLimit:Double = salesController.getCreditLimit("{custName}");
        var balamt:Double;
        if(txtSalesCaBalAmt.text!=""){
        balamt = Double.parseDouble(txtSalesCaBalAmt.text);
        }        
        var credit:Boolean = false;
        
        
        
        if(creditLimit!=0 and creditLimit < (custos+balamt)){
            credit = true;
        }
        return credit;
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
                    CashSalesTableObj.focusSet();
                     if (listSalesCash.selectedItem != "New name...") {
            txtSalesCaDName.text = "{listSalesCash.selectedItem}";
            listSalesCash.visible = false;
            CashSalesTableObj.focusSet();
        } else {
            listSalesCash.visible = false;
            callDocInfo();
        }
    }
    }
    }
    else{
        listSalesCash.visible = false;
        txtSalesCaDName.requestFocus();
      }
    }

    function btnCustDocSaveAction(): Void {
     var stateVal = currentState.actual;
     if (stateVal == 2) {
     var retVal = bind CustInfo.save(1);
     saveAndBack(retVal);
     } else if (stateVal == 0) {
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
    

    function saveAndBack(retVal: Integer): Void {
    var stateVal = currentState.actual;
    if (stateVal == 2) {
    var user = bind CustInfo.newCust;
    if (retVal == 1) {
    currentState.actual = currentState.findIndex("Shown");
    txtSalesCaPName.text = user;
    txtSalesCaDName.requestFocus();
    }
    } else if (stateVal == 0) {
     var user = bind DocInfo.newDoc;
    if (retVal == 1) {
    currentState.actual = currentState.findIndex("Shown");
    txtSalesCaDName.text = user;
    CashSalesTableObj.focusSet();
      }
    }
    updateIntValues();
    }

    function btnSalesBackAction(): Void {
        var stateVal = currentState.actual;
        if (stateVal == currentState.findIndex("CustomerInfo")) {
            panelCustInfo.visible = false;
            panelBack.visible = false;
            txtSalesCaPName.text = "";
            txtSalesCaPName.requestFocus();
        } else if (stateVal == currentState.findIndex("DoctorInfo")) {
            panelDocInfo.visible = false;
            panelBack.visible = false;
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
                if (CommonDeclare.currModule == 2 and CommonDeclare.form[1] == 11) {
                    shortcut(short);
                }
            }
    public var hotKeyAddBill = false;
    public var hotKeyCloseBill = false;

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {
        hotKeyAddBill = false;
        hotKeyCloseBill = false;
        if (event.code == kr.print and btnSalesCaSave.disable == false) {
            saveSales(1);
        }
        else if (event.code == kr.save and btnSalesCaSave.disable == false) {
            saveSales(0);
        }
        else if (event.code == KeyCode.VK_F4) {
            if(event.controlDown){
                hotKeyCloseBill = true;
            } else if( btnSalesCaReset.text == "Reset [F4]"){
                resetValues();
            }
        }
//        else if (event.code == kr.rRow) {
//            CashSalesTableObj.removeRow(); updateIntValues(); itNAM1 = "";
//        }
        else if(event.code==KeyCode.VK_F4 and event.controlDown){
            hotKeyAddBill = true;
        }
        else if(event.code==KeyCode.VK_F7) {
            adjustmentAmount();
        }
        else if(event.code==KeyCode.VK_F8) {
            stockAdjustmentToBill();
        }
    }
    public function shortcutOnTable(event: java.awt.event.KeyEvent): Void {
        try {
            if (event.getKeyText(event.getKeyCode()) == "F2" and btnSalesCaSave.disable == false) {
                saveSales(1);
            }
            if (event.getKeyText(event.getKeyCode()) == "F9" and btnSalesCaSave.disable == false) {
                drugSpecification("no");
            }
             if (event.getKeyText(event.getKeyCode()) == "F1" and btnSalesCaSave.disable == false) {
                drugSpecification("yes");
            }
            if (event.getKeyText(event.getKeyCode()) == "F3" and btnSalesCaSave.disable == false) {
                saveSales(0);
            }
            if (event.getKeyText(event.getKeyCode()) == "F4" and btnSalesCaReset.text == "Reset [F4]") {
                resetValues();
            }
//            if (event.getKeyText(event.getKeyCode()) == "F12") {
//                CashSalesTableObj.removeRow(); updateIntValues();
//            }
            if(event.getKeyText(event.getKeyCode()) == "F7") {
                adjustmentAmount();
            }
            else if(event.getKeyText(event.getKeyCode()) == "F8") {
                stockAdjustmentToBill();
            }
        } catch (ex: Exception) {
            log.debug("SalesCash1 shortcutOnTable {ex.getMessage()}");
        }
    }

    function CashDatePickerOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        if (not dateFlag) {
            if (txtSalesCaDate.text != null) {
                var dat = txtSalesCaDate.rawText.split("-");
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
     if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
                txtSalesCaNetPaid.text = Value.Round(txtSalesCaNetPaid.rawText);
                btnSalesCaSave.requestFocus();
        }
        shortcut(event);
    }

    function btnSalesCaSaveOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER){
            saveSales(1);
        }
        if(event.code == KeyCode.VK_TAB){
            btnSaveOnly.requestFocus();
            if(event.shiftDown){
                SalesPlugin.txtReceived.requestFocus();
            }
        }
    }

    function txtSalesCaSubTotalOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
    }

    function rectRemoveRowOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        CashSalesTableObj.removeRow();
        row=null;
        updateIntValues();
        itNAM1 = "";
    }

    function txtSalesCaDNameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB ) {
            listSalesCash.visible = false;            
            if(event.shiftDown and event.code == KeyCode.VK_TAB){
                txtSalesCaPName.requestFocus();
            } else {
                CashSalesTableObj.focusSet();
            }
            updateIntValues();
        }
        if (event.code == KeyCode.VK_ESCAPE) {
            CashSalesTableObj.focusSet();
        }

        if (event.code == KeyCode.VK_DOWN) {
            listDoctorChanges(1);
            listSalesCash.requestFocus();
            listSalesCash.selectFirstRow();
        }

        shortcut(event);
    }

    function txtSalesCaDNameOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        listDoctorChanges(1);
    }
    function setMandatory():Void{
        if(selBillType.equals("Credit"))
        {
            txtSalesCaPName.style = mandatory;
        }

    }

    function txtSalesCaPNameOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        //getPatient(txtSalesCaPName.rawText);
        listCustomerChanges(1);
    }

    function txtSalesCaPNameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        setMandatory();
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB  ) {
            txtSalesCaDName.requestFocus();
            if(event.shiftDown and event.code == KeyCode.VK_TAB){
               txtSalesCaDate.requestFocus();
            }
            listSalesCash.visible = false;
        } else if (event.code == KeyCode.VK_DOWN) {
//            getPatient(txtSalesCaPName.rawText);
            listCustomerChanges(1);
            listSalesCash.requestFocus();
            listSalesCash.selectFirstRow();
        } else if(event.code == KeyCode.VK_ESCAPE){
            txtSalesCaDName.requestFocus();
            listSalesCash.visible = false;
        }
        shortcut(event);

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
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtSalesCaPName.requestFocus();
            if(event.shiftDown and event.code == KeyCode.VK_TAB){
                cboEmp_code.requestFocus();
            }
        }
        shortcut(event);
    }

    function txtSalesCaPBillNoOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB ) {
            cboEmp_code.requestFocus();
            listSalesCash.visible = false;
            if(event.shiftDown and event.code == KeyCode.VK_TAB){
                btnPrescibe.requestFocus();
            }

        } else if (event.code == KeyCode.VK_DOWN) {
            getBillNo(txtSalesCaPBillNo.rawText);
            listSalesCash.requestFocus();
            listSalesCash.selectFirstRow();
        } else if(event.code == KeyCode.VK_ESCAPE){
            txtSalesCaPBillNo.requestFocus();
        }

        shortcut(event);
    }

    function  insertPreviousBillValues(billNo:String):Void {
        if(CashSalesTableObj.nullVal==1) {
            var cn:ConfirmDialogBox = new ConfirmDialogBox(0,"Sales Cash","<html>Selecting this option will reset existing table values.<br> Do you want to continue?</html> ");
            if(cn.staus==true) {
                CashSalesTableObj.clearData();
                CashSalesTableObj.insertPreviousBill(billNo);
            }
            else {
                txtSalesCaPBillNo.text = "";
            }
        }
        else {
            CashSalesTableObj.insertPreviousBill(billNo);
        }
    }
    
     public function getBillNo(s :  String):Void {
        if(not listSalesCash.visible){
        ShowList();        
        listH = 0.0;
        listSalesCash.layoutX = txtSalesCaPBillNo.layoutX;
        listSalesCash.layoutY = txtSalesCaPBillNo.layoutY + txtSalesCaPBillNo.height + 5;
        listSalesCash.width = txtSalesCaPName.width;
        var billInfo: List = new ArrayList();
        billInfo=salesController.previousBillNumber(s);
        listSalesCash.items = billInfo.toArray();
        var billNo: String;
        listSalesCash.onKeyPressed = function(e) {
                if (e.code == KeyCode.VK_ENTER) {
                    billNo   = "{listSalesCash.selectedItem}";
                    txtSalesCaPBillNo.text = billNo;
                    updateIntValues();
                    insertPreviousBillValues(billNo);
                    listSalesCash.visible = false;
                    txtSalesCaPName.requestFocus();
                } else if (e.code == KeyCode.VK_DOWN) {
                    if (listSalesCash.selectedIndex == 0) {
                        listSalesCash.selectFirstRow();
                    }
                } else if (e.code == KeyCode.VK_ESCAPE) {
                    listSalesCash.visible = false;
                    txtSalesCaPBillNo.requestFocus();
                }
            };
        listSalesCash.onMouseReleased = function(e) {
                    billNo = "{listSalesCash.selectedItem}";
                    txtSalesCaPBillNo.text = billNo;
                    insertPreviousBillValues(billNo);
                    listSalesCash.visible = false;
                    txtPrescriptionDays.text = commonController.getQueryValue("select prescription_days from sales_maintain_bill where bill_no='{billNo.substring(0,10)}'");
                    txtSalesCaPName.requestFocus();
        }
        
        var height: Integer = 0;
        if (listSalesCash.items.size() < 9) {
            height = listSalesCash.items.size();
            if (height < 3) {
                listH = (height * 25);
            } else {
                listH = (height * 25) - (height - 2);
            }
        } else {
            height = 8;
            listH = (height * 25) - (height - 2);
        }
      }
      else{
          listSalesCash.visible=false;
          txtSalesCaPBillNo.requestFocus();
      }
     }

    public function disableList(): Void {
        listSalesCash.visible = false;
    }

    function checkValid(): Integer {
        var retVal = 0;
        var pName = txtSalesCaPName.rawText;
        commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
        var chk: Boolean = commonController.isNotAllow(1);        
        var code = commonController.getCustomerCode(pName);
        var freeBillRestrict = commonController.freeBillCount();
        var txtDate:java.util.Date = DateUtils.normalStringToDate(txtSalesCaDate.rawText.trim());
        var billDate:java.util.Date = DateUtils.normalStringToDate(DateUtils.now("dd-MM-yyyy"));
        CashSalesTableObj.salesCalculations();
        if (CashSalesTableObj.nullVal == 0) {
            retVal = 1;
            FXinfo("Sales table is empty. Please enter some values!");
            CashSalesTableObj.focusSet();
        } else if(Double.parseDouble(txtSalesCaToalAmt.text) <=0) {
            retVal = 1;
            FXinfo("Total Amount should be greater than zero");
        } else if (chk) {
            retVal = 1;
            FXinfo("Trial Edition has '10' bills only allowed...Upgrade to Express/Standard/Professional Edition");
        } else if (freeBillRestrict > {CommonDeclare.freeLimit}) {
            retVal = 1;
            FXinfo("You have reached a maximum limit of {CommonDeclare.freeLimit} invoices in MEDEIL - FREE Edition. To continue billing, please purchase/upgrade to the latest edition");
        }  else if(txtSalesCaPName.rawText.trim().length() > 40) {
            FXinfo("Customer Name length cannot be more than 40 characters");
            retVal = 1;
        }  else if(txtSalesCaDName.rawText.trim().length() > 100) {
            FXinfo("Doctor Name length cannot be more than 100 characters");
            retVal = 1;
        }
        else if (selBillType.equals("Credit") and (pName == null or pName.equals("") or pName.length() < 0)) {
            retVal = 1;
            FXinfo("Please enter customer name to give credit !", txtSalesCaPName);
        } else if (selBillType.equals("Credit") and (code == null or code.equals("") or code.length() < 0)) {
            retVal = 1;
            FXinfo("Please select Customer name from dropdown / Name is not in Customer Information!", txtSalesCaPName);
            listCustomerChanges(0);
        } else if (selBillType.equals("Credit") and creditLimitAlert(txtSalesCaPName.rawText.trim()).equals(true)) {
            retVal = 1;
            var creditLimit: Double = salesController.getCreditLimit("{txtSalesCaPName.rawText.trim()}");
            FXinfo("Customer oustanding exceeds the Credit Limit - {creditLimit}.To Change credit Limit in Customer Information, press ALT+C.");
        } else if(txtDate.getTime().compareTo(billDate.getTime())== 1) {
                retVal = 1;
            FXinfo("Bill date is greater than the current date. Please check.");
        } else if (selBillType.equals("Credit") and txtSalesCaNetPaid.text.equals("")) {
            retVal = 1;
            FXinfo("Please enter the paid Amount", txtSalesCaNetPaid);
        } else if (not txtSalesCaRoundAmt.text.equals("") and (Double.parseDouble(txtSalesCaRoundAmt.text) > 0.99 or Double.parseDouble(txtSalesCaRoundAmt.text) < -0.99)) {
            retVal = 1;
            FXinfo("Round off value entered is incorrect. Please check", txtSalesCaRoundAmt);        
        } else if (Integer.parseInt(txtPrescriptionDays.text)>0) {
            if(txtSalesCaPName.text.equals("")){
                retVal = 1;
                FXinfo("Please Enter Customer Name to give Prescription Days", txtSalesCaPName);
            }
            else if(txtSalesCaDName.text.equals("")){
                retVal = 1;
                FXinfo("Please Enter Doctor Name to give Prescription Days", txtSalesCaDName);
            }
        }
        else {
            retVal = 0;
        }
        return retVal;
    }

    public function saveSales(ss: Integer): Void {
        try {
            var check = checkValid();
            updateIntValues();
            var sales= new SalesModel();
            if (check == 0) {
                var sdf = new SimpleDateFormat("dd-MM-yyyy");
                var billDate = DateUtils.changeFormatDate(sdf.parse(txtSalesCaDate.rawText));
                getAutoIncre();
                sales.setModuleType("SALES");
                sales.setCustomerName(txtSalesCaPName.rawText);
                sales.setDoctorName(txtSalesCaDName.rawText);
                sales.setBillNumber(getAutoVal);
                sales.setBillType(selBillType.toLowerCase());
                sales.setBillDate(billDate);
                sales.setTotalDiscount(Double.parseDouble(txtSalesCaDiscount.rawText));
                sales.setTotalAmount(Double.parseDouble(txtSalesCaToalAmt.text));
                sales.setPaidAmount(Double.parseDouble(txtSalesCaNetPaid.rawText));
                sales.setBalanceAmount(Double.parseDouble(txtSalesCaBalAmt.rawText));
                sales.setTotalVAT(Double.parseDouble(txtSalesCaVAT4.rawText));
                sales.setTotalQuantity(Integer.parseInt(lblSalesCaTotalQty.rawText));
                sales.setTotalItems(Integer.parseInt(lblSalesCaTotalItm.rawText));
                System.out.println("sal");

                sales.setListofitems(CashSalesTableObj.getSalesBillItems());//old me changes
//             System.out.println((CashSalesTableObj.getSalesBillItems()));

        // Debug print to see the list of items




                System.out.println("salescash132");
                sales.setAccountNumber("{SalesTypeSelection.paymentAcc}");
                   System.out.println(("{SalesTypeSelection.paymentAcc}"));

                sales.setPaymentMode("{SalesTypeSelection.cardtype}");
                sales.setCardNumber(SalesTypeSelection.cardno);
                sales.setCardHolderName(SalesTypeSelection.cardname);
                sales.setCardExpiry(SalesTypeSelection.carddate);
                sales.setBankName(SalesTypeSelection.cardbank);
                sales.setFprice(CashSalesTableObj.fprice);
                sales.setFormType("");
                sales.setSalesReturnNumber("");
                sales.setSalesReturnDate("0000-00-00");
                sales.setEmployeeID(cboEmp_code.selectedItem.toString());
                sales.setPrescriptionDays(Integer.parseInt(txtPrescriptionDays.rawText));
              // Integer pquantity = CashSalesTable1.getPquantity; // Assuming getPquantity() returns an Integer
         //sales.setPquantity(Integer.parseInt( CashSalesTable1.Pquantity())); // Assuming getPquantity() returns an Integer
      //  sales.setPquantity(pquantity);


                // System.out.println(CashSalesTableObj.Pquantity());
                System.out.println("value");
               
                /*if(customerName != ""){
                        sales.setCustomerName(customerName);
                        sales.setNoOfDays(Integer.valueOf(txtNoOfDays.rawText));
                        sales.setCustomerCategory("acute");
                        sales.setCustomerCategoryCount(2);
                    }else if(txtSalesCaPName.rawText.trim() != "" and txtNoOfDays.rawText.trim() != ""){
                        sales.setNoOfDays(Integer.valueOf(txtNoOfDays.rawText));
                        sales.setCustomerCategory("chronic");
                        sales.setCustomerCategoryCount(++count);
                        }else{
                            sales.setNoOfDays(0);
                            sales.setCustomerCategory("");
                            sales.setCustomerCategoryCount(0);
                            }*/
                var type="";
                var returnObject = new Object();
                returnObject = salesController.createRecord(sales);
                var msgReturnModel: MsgReturnModel = new MsgReturnModel();
                msgReturnModel = returnObject as MsgReturnModel;
                if(msgReturnModel.getReturnMessage()=="0")
                {                             
                   type="save";
                   if (ss == 1) {
                        type = "Print";
                        var reportSource: File = new File("printerfiles/Print.jasper");
                        var jasperReport:JasperReport =  JRLoader.loadObject(reportSource) as JasperReport;
                        var jasperPrint:JasperPrint = salesController.jasperPrint(sales.getBillNumber(), "Sales_{selBillType}",jasperReport);
                        JasperPrintManager.printReport(jasperPrint, false);                        
                    } 
                    FXalert(0);
                    resetValues();
                    commonController.userLog("sales{selBillType}",type);
                }
                else
                {
                FXinfo(msgReturnModel.getReturnMessage());
                CashSalesTableObj.focusSet(msgReturnModel.getRowCount(), msgReturnModel.getColumnCount());
                }
            }
        } catch (ex: Exception) {            
            var que = " Class : SalesCash1   Method: saveSales    Exception : {ex}";
            log.debug(que);
        }
    }

    public function resetValues(): Void {
        /*var billCount:Integer = commonController.freeBillCount();
        if (billCount >= CommonDeclare.freeLimit ) {
            var msg = "You have reached a maximum limit of {CommonDeclare.freeLimit} invoices in MEDEIL - FREE Edition. To continue billing, please purchase/upgrade to the latest edition";
            MessageBox.MsgBox("Medeil - Sales","Warning",msg);
            panelAlert.visible =true;
            delete panelAlert.content;
            insert MessageBox.getDesignRootNodes() into panelAlert.content;
            panel.disable =true;
        }        
        if ( (billCount >= ( (CommonDeclare.freeLimit * 90) /100)) and ( ( (billCount / CommonDeclare.freeLimit) * 100) mod 2 == 0) ) {
            var msg = "You have reached {billCount} out of {CommonDeclare.freeLimit} invoices. For unlimited invoices, please purchase/upgrade to the latest edition";
            MessageBox.MsgBox("Medeil - Sales","Information",msg);
            panelAlert.visible =true;
            delete panelAlert.content;
            insert MessageBox.getDesignRootNodes() into panelAlert.content;
        }*/
//        var salesController : Sales = RegistryFactory.getClientStub (RegistryConstants.Sales) as Sales;
        cashBillDate = DateUtils.now("dd-MM-yyyy");
        txtSalesCaNetPaid.text = "0.00";
        txtSalesCaPName.text = "";
        txtSalesCaDName.text = "";
        txtSalesCaPBillNo.text = "";
        txtSalesCaSubTotal.text = "0.00";
        txtSalesCaDiscount.text = "0.00";
        txtSalesCaVAT4.text = "0.00";
        txtSalesCaToalAmt.text = "0.00";
        lblSalesCaTotalQty.text = "0";
        lblSalesCaTotalItm.text = "0";
        txtSalesCaBalAmt.text = "0.00";
        balance = "0.00";
        getAutoIncre();
        itNAM1 = "";
        CashSalesTableObj.clearData();
        CashSalesTableObj.resetValues();
        alertSt = salesController.getAlertStatus();        
        //lblSalesCaBillNo.requestFocus();
        SalesTypeSelection.resetCardDetails();        
        SalesTypeSelection.rdoCash.selected = true;
        SalesTypeSelection.labelCardDetails.visible = false;
        SalesTypeSelection.img_Card.visible = false;
        selBillType = "Cash" ;
        txtSalesCaPName.style = "";
        txtSalesCaNetPaid.style = "";
        txtSalesCaRoundAmt.style = "";
        updateIntValues();
        cboEmp_code.select(0);        
        txtadjust.text = "";
        listSalesCash.visible = false;
        listView.visible = false;
        SalesPlugin.reset();
        txtSalesCaBarcode.text = "";
        txtSalesCaPName.requestFocus();
        txtPrescriptionDays.text = "0";
    }
    
function getNetPaidChange():Void{
     if (selBillType.equals("Credit")) {
          txtSalesCaNetPaid.text = "0.00";
          txtSalesCaBalAmt.text = txtSalesCaToalAmt.text;
        }
     else {
         txtSalesCaNetPaid.text = txtSalesCaToalAmt.text;
         txtSalesCaBalAmt.text = "0.00";
     }
}

    function getAutoIncre(): String {        
        panelplugin.visible = true;
        if (selBillType.equals("Cash")) {
            txtSalesCaNetPaid.editable = false;
            txtSalesCaPName.style = mandatory;
            txtSalesCaPName.style = "";
            getAutoVal = commonController.getAutoIncrement(cashBillDate, "CashSales");
        } else if (selBillType.equals("Credit")) {
            txtSalesCaNetPaid.editable = true;
           txtSalesCaNetPaid.text = "0.00";//
            txtSalesCaPName.style = mandatory;
            getAutoVal = commonController.getAutoIncrement(cashBillDate, "CreditSales");
        } else if (selBillType.equals("Cards")) {
            txtSalesCaNetPaid.editable = false;
            txtSalesCaPName.style = mandatory;
            txtSalesCaPName.style = "";
            panelplugin.visible = false;
            getAutoVal = commonController.getAutoIncrement(cashBillDate, "CardSales");
        }
      updateIntValues();//
        return getAutoVal;
    }


    public function alertSetting(): Void {
//        var salesController : Sales = RegistryFactory.getClientStub (RegistryConstants.Sales) as Sales;
        alertSt = salesController.getAlertStatus();
        if (alertSt == 1) {
            expAlert = CashSalesTableObj.alert1;
            itemDis = CashSalesTableObj.itN;
            var itNN: String = CashSalesTableObj.itN;

            if (expAlert != null and expAlert.length() > 0) {
                var str: String = "";
                if (itNN != itNAM1) {
                    str = "The product '{itNN}' will expire on {expAlert}";
                    alerCnt1 = 0;
                }
                if (alerCnt1 == 0) {
                    panelAlert.visible = true;
                    delete  panelAlert.content;
                    MessageBox.MsgBox("Sales Cash Bill", "Information", str);
                    insert MessageBox.getDesignRootNodes() into panelAlert.content;
                    itNAM1 = itNN;
                    alerCnt1 = 1;
                }
                CashSalesTableObj.alert1 = "";
                expAlert = "";
            }
        }

    }

    var visit = bind fxCalendar.visible on replace {
                if (dateFlag and not visit) {
                    cashBillDate = fxCalendar.getSelectedDate();
                    dateFlag = false;
                    txtSalesCaPName.requestFocus();
                }
            };

   function updateIntValues(): Void {
      System.out.println("raja");
        try {
               System.out.println("l54");
            CashSalesTableObj.salesCalculations();    
            calcDiscTotal("total");
                           System.out.println("54");
                //    System.out.println(calcDiscTotal("total"));

            if(txtSalesCaNetPaid.text.equals("")) {
                txtSalesCaNetPaid.text = "0.00";
            } else if(txtSalesCaRoundAmt.text.equals("")) {
                txtSalesCaRoundAmt.text = "0.00";
            }
            System.out.println("5224");
       } catch (ex: Exception) {
            log.debug("Class: SalesCash1 Method: UpdateIntValue Exception:{ex.getMessage()}");
        }
    }

    var rotateImg = bind listSalesCash.visible on replace {
                if (imgP and rotateImg) {
                    imgPName.rotate += 180.0;
                } else {
                    imgPName.rotate = 0.0;
                }

                if (imgD and rotateImg) {
                    imgDName.rotate = 180.0;
                } else {
                    imgDName.rotate = 0.0;
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
     delete  panelCustInfo.content;
     insert CustInfo.getDesignRootNodes() into panelCustInfo.content;
     updateIntValues();
    }

    function insertDocForm(): Void {
    DocInfo.currentState.actual = DocInfo.currentState.findIndex("FromSales");
    DocInfo.checkState = 1;
    delete  panelDocInfo.content;
    insert DocInfo.getDesignRootNodes() into panelDocInfo.content;
    updateIntValues();
    }
    
     var tot=bind txtSalesCaToalAmt.text on replace {
         try {
            SalesPlugin.Amount = Double.parseDouble(tot);
         } catch (e) {
             SalesPlugin.Amount =0.0;
         }
     }


    var logUser: String = bind CommonDeclare.user on replace {
                getPrivileges(logUser);
                updateIntValues();
            }

    function getPrivileges(u: String): Void {
//        commonController=new CommonController();
        var uname = u;
        var utype = commonController.getUserType(uname);
        if (utype.equals("User")) {
            var priv = commonController.getPrivileges("sales", uname);
            var ss = priv.split(",");
            var val = Integer.parseInt(ss[0]);
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
        } else {
            btnSalesCaSave.disable = false;
            btnSaveOnly.disable = false;
        }

    }

    var cst = bind txtSalesCaPName.rawText on replace {
//                commonController=new CommonController();
                if (cst != null or cst.trim().length() > 0) { balance = commonController.getCustomerBalance(cst); } else { balance = "0.00"; }
            }

//static function callBillChange(s : String):Void{

//}
function initSalesCash():Void {
//    init {
    
        (cashTable as javax.swing.JTable).addKeyListener(KeyAdapter {
            override public function keyReleased(e: java.awt.event.KeyEvent): Void {
                if(CashSalesTableObj.jcomp.getSelectedRow()!=row and (CashSalesTableObj.jcomp.getValueAt(CashSalesTableObj.jcomp.getSelectedRow(),2).toString()!="")) {
                if(checkDrugInteraction()==1){
                var cn: ConfirmDialogBox1 = new ConfirmDialogBox1(0, "Practice Management","<html>Item Name : {CashSalesTableObj.jcomp.getValueAt(CashSalesTableObj.jcomp.getSelectedRow(),2).toString()} has interaction effects <br> with  already added items.Click on details button to view. <br> Click on yes to add the items anyway.<html>",msgHeader,CashSalesTableObj.jcomp.getValueAt(CashSalesTableObj.jcomp.getSelectedRow(),2).toString(),DrugSpecModel);
                row=CashSalesTableObj.jcomp.getSelectedRow();
                if(cn.staus) {
                    msgHeader="";
                }
                else{
                     CashSalesTableObj.removeRow();
                     CashSalesTableObj.addRow();
                }
                    }
                  }
                alertSetting();
                updateIntValues();
                shortcutOnTable(e);
                var i:Integer = CashSalesTableObj.jcomp.getSelectedRow();
                if(CashSalesTableObj.jcomp.getSelectedColumn()==10) {
                    if(e.getKeyCode()==KeyEvent.VK_ENTER) {
                        if(CashSalesTableObj.barcodeFocus==true) {
                             txtSalesCaBarcode.requestFocus();
                        }
                        else {
                            CashSalesTableObj.jcomp.changeSelection(i + 1, 1, false, false);
                            CashSalesTableObj.jcomp.getModel().setValueAt(i + 2, i + 1, 0);
                            CashSalesTableObj.g.refreshStockTab();
                        }
                    }
                }
            }
            override public function keyTyped(e: java.awt.event.KeyEvent): Void {
                shortcutOnTable(e);
                alertSetting();
                updateIntValues();
            }
        });
        (cashTable as javax.swing.JTable).getSelectionModel().addListSelectionListener(javax.swing.event.ListSelectionListener {
            override public function valueChanged(e: javax.swing.event.ListSelectionEvent): Void {
                updateIntValues();
            }
        });
        if(settingsController.getSalesDiscountType()==0) {
            CommonDeclare.salesDiscApply=true;
         }
         currentState.actual = currentState.findIndex("Shown");
//         txtSalesCaPName.requestFocus();
        CashDatePicker.image = Image { url: "{__DIR__}images/Calender.png" };
        listView.visible = false;
        salesCashTable.layoutX = 0;
        salesCashTable.layoutY = 0;
        getPrivileges(logUser);
        updateIntValues();
        fxCalendar.visible = false;
        panelCalender.content = [fxCalendar,];
        panelTable.content = [salesCashTable,];
//        panelForm.visible = false;
        txtPrescriptionDays.text = "0";
        delete  panelBillType.content;
        insert SalesTypeSelection.getDesignRootNodes() into panelBillType.content;
        insert SalesPlugin.getDesignRootNodes() into panelplugin.content;
    }
    
    public var initFocus = false on replace {
        if(initFocus) {
            txtSalesCaPName.requestFocus();
            initFocus =false;
        }
    }

    public function StartUp(): Void {
        initSalesCash();
//        currentState.actual = currentState.findIndex("Shown");
//        panel.visible =true;
        txtSalesCaPName.requestFocus();
    }

}
