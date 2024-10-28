package com.vanuston.medeil.ui;

import javafx.scene.layout.LayoutInfo;
import javafx.scene.image.Image;
import javafx.ext.swing.SwingComponent;
import javax.swing.JComponent;
import javafx.scene.input.KeyCode;
import javafx.animation.Timeline;
import java.awt.Dimension;
import java.text.SimpleDateFormat;
import java.lang.Class;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.uitables.SalesReturnTable;
import com.vanuston.medeil.util.Value;
import com.vanuston.medeil.ui.calendar.theme.Theme;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import java.lang.Exception;
import javafx.scene.control.TextBox;
import com.vanuston.medeil.util.CommonDeclare;
import java.awt.event.KeyAdapter;
import com.vanuston.medeil.util.KeyRegistry;
import com.vanuston.medeil.model.SalesModel;
import java.util.List;
import java.util.ArrayList;
import com.vanuston.medeil.model.MsgReturnModel;
import com.vanuston.medeil.implementation.Sales;
import com.vanuston.medeil.model.CreditNoteModel;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.uitables.ConfirmDialogBox;
import java.text.DateFormat;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.NumberUtils;
import com.vanuston.medeil.util.Validation;
import java.lang.System;
public class SalesReturn {
    var log: Logger = Logger.getLogger(SalesReturn.class, "SalesReturn");
    var panelW = bind CommonDeclare.panelFormW on replace {
                listSalesReturn.visible = false;
            }
    var panelH = bind CommonDeclare.panelFormH;
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var C1LX = bind CommonDeclare.Column1LX;
    var C2LX = bind CommonDeclare.Column2LX;
    var C3LX = bind CommonDeclare.Column3LX;
    var C4LX = bind CommonDeclare.Column4LX + 20;
    var botton1LX = bind CommonDeclare.botton1LX;
    var botton2LX = bind CommonDeclare.botton2LX;
    var botton3LX = bind CommonDeclare.botton3LX;
    var botton4LX = bind CommonDeclare.botton4LX;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    var bottonW = bind CommonDeclare.bottonW + 15;
    var bottonH = bind CommonDeclare.bottonH;
    var CancelW = bottonW;
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
    var imgClickdownLX = bind C2LX + Type3TextboxW - 2;
    var imgClickdown1LX = bind C4LX + Type3TextboxW - 2;
    var imgClickdownLY = 69.0;
    var imgClickdownLY1 = 92.0;
    var rectbuttonLX = bind 85.13341804 * panelW / 100;
    var listH = 0.0;
    var LabelTINLX = bind 80.23888183 * panelW / 100;
    var AmtPanelLX = bind 48.28462516 * panelW / 100;
    var AmtTextW = bind 40.66073698 * panelW / 100;
    var TableW = bind (95.29860229 * panelW) / 100 on replace {
                changeTableSize(TableW, TableH);
            };
    var TableH = 220.0;
    var panelTableLX = bind (panelW - TableW) / 2;
    var panelTableLY = 150.0;
    var rectRemoveRowLX = bind ((panelW + TableW) / 2) - 120;
    var rectRemoveRowLY = bind panelTableLY + TableH;

    var panelRetNoteLX = bind (panelW -400) / 2;
    var panelRetNoteLY = bind (panelH -300) / 2;
//    var panelRetNoteLX = bind (panelW - 600) / 2;
//    var panelRetNoteLY = bind (panelH - 350) / 2;

//        var panelLX:Number=(panelW - 600) / 2;
//    var panelLY:Number=(panelH- 350) / 2;

var PaymentType: String[] = ["---Select---", "Cash", "Credit", "Credit/Debit Card", "Partial Payment", "Counter Sales"];
var totQty = bind "{SalesReturnTable.totQty}";
var totAmt = bind "{SalesReturnTable.totAmt}";
var totItems = bind "{SalesReturnTable.totItems}";
public var timer: Timeline;

var srDate = DateUtils.now("dd-MM-yyyy");
var sr_CRNo = "";

def SalesReturnNotes = SalesReturnNotes{ note_title: "Credit";  };

var dateFlag: Boolean = false;
var fxCalendar = FXCalendar {
            theme: Theme {};
        };
var rowNo = 12;

          //                  0       1           2           3       4      5       6        7           8       9     10     11      12       13        14
var colNames: Object[] = ["S.No", "Code", "Particulars", "Form","P.Qty", "Qty", "Batch", "Exp.Date", "Price", "MRP", "Dis", "VAT", "F.Price","Amount", "Adj Id"];
var colType: Class[] = [java.lang.Integer.class, java.lang.String.class, java.lang.String.class,
            java.lang.String.class,java.lang.Integer.class, java.lang.Integer.class, java.lang.String.class,
            java.lang.String.class, java.lang.Double.class, java.lang.Double.class,
            java.lang.Double.class, java.lang.Double.class,java.lang.Double.class, java.lang.Double.class,java.lang.Integer.class,];
var colEditable: Boolean[] = [false, false, false, false,true, true, false, false, true, false, true, true, false,false, false];
var colWidth: Integer[] = [40, 60, 120, 90,40, 40, 60, 60, 50, 50, 40, 40,50, 70, 0];
var billInfo: List = new ArrayList();
var srBillInfo: List = new ArrayList();
var commonController:CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
var getAutoVal = commonController.getAutoIncrement(srDate,"SalesReturn");
var SalesReturnTable=new SalesReturnTable();
var srTable: JComponent = SalesReturnTable.createViewTable(rowNo, colNames, colType, colEditable, colWidth);
var salesRtnTable = SwingComponent.wrap(SalesReturnTable.getScrollTable(srTable));
    function changeTableSize(i: Integer, j: Integer): Void {
        salesRtnTable.getJComponent().setPreferredSize(new Dimension(i, j));
    }

    var BottomC1LX = bind CommonDeclare.BottomC1LX;
    var BottomC2LX = bind CommonDeclare.BottomC2LX;
    var BottomC3LX = bind CommonDeclare.BottomC3LX + 10;
    var BottomC4LX = bind CommonDeclare.BottomC4LX + 40;
    
    var panelAlertLX = bind (panelW - 500)/  2;
    var panelAlertLY = bind(  panelH - 150)/  2;
    def CustomAlert = CustomAlert{};

    var ret = bind SalesReturnNotes.panel.visible on replace{
        panel.disable = ret;
        panelRetrnNotes.visible = ret;

    }

var salesController:Sales = RegistryFactory.getClientStub (RegistryConstants.Sales) as Sales;

var paymentMode:String;
var cardNumber:String;
var cardHolderName:String;
var bankName:String;
var cardExpiryDate:String;
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        opacity: 0.25
        layoutX: 397.5
        layoutY: 0.0
        width: bind panelW
        height: 32.0
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
    
    public-read def label17: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 596.0
        layoutY: 442.0
        text: "Label"
    }
    
    public-read def label15: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 590.0
        layoutY: 463.0
        text: "Label"
    }
    
    public-read def panelTable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelTableLX
        blocksMouse: true
    }
    
    public-read def rectTableBorder: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind panelTableLX
        layoutY: 150.0
        styleClass: "rectTableBorder"
        width: bind TableW
        height: bind TableH
    }
    
    public-read def label19: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 368.0
        layoutY: 404.0
        text: "Label"
    }
    
    public-read def label18: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 590.0
        layoutY: 411.0
        text: "Label"
    }
    
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtSalesRetBalance: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSalesRetBalance: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 515.0
        layoutY: 301.0
        layoutInfo: __layoutInfo_txtSalesRetBalance
    }
    
    def __layoutInfo_txtRoundOff: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtRoundOff: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtRoundOff
    }
    
    public-read def cboSalesRetPType: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: bind C2LX
        layoutY: 90.0
        items: bind PaymentType
    }
    
    def __layoutInfo_listView: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def listView: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: 38.0
        layoutY: 163.0
        layoutInfo: __layoutInfo_listView
        items: null
    }
    
    public-read def rectRemoveRow: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        styleClass: "rectbutton"
        width: 100.0
        height: 50.0
    }
    
    def __layoutInfo_label5: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutY: 391.0
        layoutInfo: __layoutInfo_label5
        text: "Label"
    }
    
    public-read def group: javafx.scene.Group = javafx.scene.Group {
        visible: false
        layoutX: bind rectRemoveRowLX
        layoutY: bind rectRemoveRowLY
        content: [ rectRemoveRow, label5, ]
    }
    
    public-read def txtSalesRetBillDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 289.0
        layoutY: 84.0
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind ImageCalenderLX
        layoutY: 69.0
    }
    
    def __layoutInfo_listSalesReturn: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
        height: bind listH
    }
    public-read def listSalesReturn: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: 150.0
        layoutY: 448.0
        layoutInfo: __layoutInfo_listSalesReturn
        items: null
    }
    
    public-read def panel2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelCalenderLX
        layoutY: 84.0
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
    }
    
    public-read def panelRetrnNotes: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelRetNoteLX
        layoutY: bind panelRetNoteLY
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
    
    def __layoutInfo_txtSalesRetTotAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind AmtTextW
    }
    public-read def txtSalesRetTotAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 515.0
        layoutY: 329.0
        layoutInfo: __layoutInfo_txtSalesRetTotAmt
        font: Arial_12
    }
    
    def __layoutInfo_txtSalesRetSubtotal: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSalesRetSubtotal: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 150.0
        layoutY: 329.0
        layoutInfo: __layoutInfo_txtSalesRetSubtotal
        font: Arial_12
    }
    
    def __layoutInfo_txtSalesRetNetPaid: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSalesRetNetPaid: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 150.0
        layoutY: 301.0
        layoutInfo: __layoutInfo_txtSalesRetNetPaid
        font: Arial_12
    }
    
    public-read def panelTxtColumn2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind BottomC4LX
        content: [ txtSalesRetNetPaid, txtSalesRetSubtotal, txtSalesRetBalance, txtRoundOff, ]
    }
    
    def __layoutInfo_txtSalesRetVAT: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSalesRetVAT: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 515.0
        layoutY: 273.0
        layoutInfo: __layoutInfo_txtSalesRetVAT
        font: Arial_12
    }
    
    def __layoutInfo_txtSalesRetDiscount: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSalesRetDiscount: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 150.0
        layoutY: 427.0
        layoutInfo: __layoutInfo_txtSalesRetDiscount
        font: Arial_12
    }
    
    def __layoutInfo_txtSalesRetTotalQty: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type5TextboxW
    }
    public-read def txtSalesRetTotalQty: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 150.0
        layoutY: 399.0
        layoutInfo: __layoutInfo_txtSalesRetTotalQty
        font: Arial_12
    }
    
    def __layoutInfo_txtSalesRetTotalItm: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type5TextboxW
    }
    public-read def txtSalesRetTotalItm: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        managed: true
        layoutX: 150.0
        layoutY: 371.0
        layoutInfo: __layoutInfo_txtSalesRetTotalItm
        font: Arial_12
    }
    
    public-read def panelTxtColumn1: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind BottomC2LX
        content: [ txtSalesRetTotalItm, txtSalesRetTotalQty, txtSalesRetDiscount, txtSalesRetVAT, ]
    }
    
    def __layoutInfo_txtSalesRetSRNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
        hfill: false
    }
    public-read def txtSalesRetSRNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 158.0
        layoutInfo: __layoutInfo_txtSalesRetSRNo
        style: ""
        styleClass: "text-box"
        effect: null
        text: bind getAutoVal
        font: Arial_12
    }
    
    def __layoutInfo_txtSalesRetDName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtSalesRetDName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 273.0
        layoutInfo: __layoutInfo_txtSalesRetDName
        promptText: "Enter Doctor Name"
        font: Arial_12
    }
    
    def __layoutInfo_txtSalesRetSRDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtSalesRetSRDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 158.0
        layoutInfo: __layoutInfo_txtSalesRetSRDate
        text: bind srDate
        font: Arial_12
    }
    
    def __layoutInfo_txtSalesRetCName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtSalesRetCName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 186.0
        layoutInfo: __layoutInfo_txtSalesRetCName
        promptText: "Enter Customer Name"
        font: Arial_12
    }
    
    def __layoutInfo_txtSalesRetBillNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtSalesRetBillNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 130.0
        layoutInfo: __layoutInfo_txtSalesRetBillNo
        text: "Customer Code..."
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
    
    def __layoutInfo_btnSalesRetCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind CancelW
        height: bind bottonH
    }
    public-read def btnSalesRetCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton4LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnSalesRetCancel
        effect: reflectionEffect
        graphic: imgCancel
        text: "Cancel [F8]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnSalesRetReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnSalesRetReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton3LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnSalesRetReset
        effect: reflectionEffect
        graphic: imageView3
        text: "Reset [F4]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnSalesRetEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnSalesRetEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton2LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnSalesRetEdit
        effect: reflectionEffect
        graphic: imgEdit
        text: "Edit  [F6]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnSalesRetSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnSalesRetSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnSalesRetSave
        translateX: 0.0
        effect: reflectionEffect
        graphic: imageView2
        text: "Save  [F3]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    public-read def panelButtons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: bind panelButtonsLY
        content: [ btnSalesRetSave, btnSalesRetEdit, btnSalesRetReset, btnSalesRetCancel, ]
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
    
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 428.0
        layoutY: 357.0
        text: "Alert Type "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def panelAmount: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind AmtPanelLX
        content: [ label7, txtSalesRetTotAmt, ]
    }
    
    public-read def label6: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 428.0
        layoutY: 273.0
        text: "Phone No "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def panelLblColumn2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind BottomC3LX
        content: [ label19, label18, label6, label, ]
    }
    
    public-read def label11: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 50.0
        layoutY: 399.0
        text: "Country "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label10: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 50.0
        layoutY: 371.0
        text: "City *"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def panelLblColumn1: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind BottomC1LX
        content: [ label10, label11, label17, label15, ]
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 130.0
        text: "Gender "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 273.0
        text: "Address *"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 158.0
        text: "Age "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label8: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 186.0
        text: "Family Name "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label14: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 130.0
        text: "Customer Code"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelPaymentType: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 158.0
        styleClass: "label"
        text: "Customer Name *"
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
    
    def __layoutInfo_labelHeading: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
    }
    public-read def labelHeading: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 614.0
        layoutY: 1.0
        layoutInfo: __layoutInfo_labelHeading
        effect: lightingEffect
        text: "Sales Return"
        font: Arial_25
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
    }
    
    public-read def Yellow: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.95
        green: 0.94
        blue: 0.86
    }
    
    public-read def linearGradientHeader: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#ffffff") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#000000") }, ]
    }
    
    public-read def imageSave: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Save1.png"
    }
    
    public-read def imageReset: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Reset.png"
    }
    
    public-read def imageEdit: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Edit.png"
    }
    
    public-read def imageCancel: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Cancel.png"
    }
    
    public-read def Arial_Bold_65: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 65.0
    }
    
    public-read def imageClickDown: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imgSRBNo: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind imgClickdown1LX
        layoutY: bind imgClickdownLY1
        image: imageClickDown
    }
    
    public-read def imgBillNo: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind imgClickdownLX
        layoutY: bind imgClickdownLY
        image: imageClickDown
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: 0.0
        layoutY: 0.0
        content: [ rectangle, rectHeader, labelHeading, labelPaymentType, label14, label8, label3, label4, label9, panelButtons, txtSalesRetBillNo, imgBillNo, txtSalesRetCName, txtSalesRetSRDate, txtSalesRetDName, txtSalesRetSRNo, imgSRBNo, panelLblColumn1, panelTable, rectTableBorder, panelTxtColumn1, panelLblColumn2, panelTxtColumn2, panelAmount, cboSalesRetPType, listView, group, txtSalesRetBillDate, imageView, listSalesReturn, panel2, panelAlert, ]
    }
    
    public-read def panel3: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ panel, panelRetrnNotes, ]
    }
    
    public-read def imageBack: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/arrow_Left.png"
    }
    
    public-read def imageDetails: javafx.scene.image.Image = javafx.scene.image.Image {
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
                            rectHeader.visible = true;
                            rectHeader.layoutX = 0.0;
                            rectHeader.fill = linearGradientHeader;
                            rectHeader.arcWidth = 5.0;
                            rectHeader.arcHeight = 5.0;
                            labelHeading.layoutX = 0.0;
                            labelHeading.text = "Sales Return - ctrl+R";
                            labelHeading.hpos = javafx.geometry.HPos.CENTER;
                            labelHeading.textFill = javafx.scene.paint.Color.BLACK;
                            labelPaymentType.layoutY = 92.0;
                            labelPaymentType.text = "Sales Type";
                            label14.layoutY = 69.0;
                            label14.text = "Sales Bill No.";
                            label8.layoutY = 115.0;
                            label8.text = "Customer Name";
                            label3.layoutY = 92.0;
                            label3.text = "Sales Return No.";
                            label4.layoutY = 115.0;
                            label4.text = "Doctor Name";
                            label9.layoutY = 69.0;
                            label9.text = "Sales Return Date";
                            imageView2.visible = true;
                            imageView2.image = imageSave;
                            btnSalesRetSave.layoutY = 0.0;
                            btnSalesRetSave.onKeyPressed = btnSalesRetSaveOnKeyPressedAtShown;
                            btnSalesRetSave.action = btnSalesRetSaveActionAtShown;
                            imgEdit.visible = true;
                            imgEdit.image = imageEdit;
                            btnSalesRetEdit.layoutY = 0.0;
                            btnSalesRetEdit.onKeyPressed = btnSalesRetEditOnKeyPressedAtShown;
                            btnSalesRetEdit.onMouseClicked = btnSalesRetEditOnMouseClickedAtShown;
                            btnSalesRetEdit.text = "Edit [F6]";
                            btnSalesRetEdit.action = btnSalesRetEditActionAtShown;
                            imageView3.visible = true;
                            imageView3.image = imageReset;
                            btnSalesRetReset.layoutY = 0.0;
                            btnSalesRetReset.onKeyPressed = btnSalesRetResetOnKeyPressedAtShown;
                            btnSalesRetReset.action = btnSalesRetResetActionAtShown;
                            imgCancel.visible = true;
                            imgCancel.image = imageCancel;
                            btnSalesRetCancel.layoutY = 0.0;
                            btnSalesRetCancel.onKeyPressed = btnSalesRetCancelOnKeyPressedAtShown;
                            btnSalesRetCancel.text = "Cancel [F8]";
                            btnSalesRetCancel.action = btnSalesRetCancelActionAtShown;
                            panelButtons.visible = true;
                            txtSalesRetBillNo.layoutY = 69.0;
                            txtSalesRetBillNo.onKeyPressed = txtSalesRetBillNoOnKeyPressedAtShown;
                            txtSalesRetBillNo.onKeyReleased = txtSalesRetBillNoOnKeyReleasedAtShown;
                            txtSalesRetBillNo.text = "";
                            txtSalesRetBillNo.promptText = "Enter Bill Number...";
                            txtSalesRetBillNo.editable = true;
                            imgBillNo.onMouseClicked = imgBillNoOnMouseClickedAtShown;
                            txtSalesRetCName.layoutY = 115.0;
                            txtSalesRetCName.onKeyPressed = txtSalesRetCNameOnKeyPressedAtShown;
                            txtSalesRetCName.editable = false;
                            txtSalesRetSRDate.layoutY = 69.0;
                            txtSalesRetSRDate.editable = false;
                            txtSalesRetDName.layoutY = 115.0;
                            txtSalesRetDName.onKeyPressed = txtSalesRetDNameOnKeyPressedAtShown;
                            txtSalesRetDName.editable = false;
                            txtSalesRetSRNo.layoutY = 92.0;
                            txtSalesRetSRNo.onKeyPressed = txtSalesRetSRNoOnKeyPressedAtShown;
                            txtSalesRetSRNo.onKeyReleased = txtSalesRetSRNoOnKeyReleasedAtShown;
                            txtSalesRetSRNo.editable = false;
                            imgSRBNo.visible = false;
                            imgSRBNo.onMouseClicked = imgSRBNoOnMouseClickedAtShown;
                            imgSRBNo.image = imageClickDown;
                            label10.layoutX = 0.0;
                            label10.layoutY = 0.0;
                            label10.text = "Products";
                            label11.layoutX = 0.0;
                            label11.layoutY = 25.0;
                            label11.text = "Quantity";
                            label17.visible = true;
                            label17.layoutX = 0.0;
                            label17.layoutY = 50.0;
                            label17.text = "Discount";
                            label17.font = Arial_12;
                            label17.textFill = DarkGray;
                            label15.visible = true;
                            label15.layoutX = 0.0;
                            label15.layoutY = 75.0;
                            label15.text = "VAT";
                            label15.font = Arial_12;
                            label15.textFill = DarkGray;
                            panelLblColumn1.visible = true;
                            panelLblColumn1.layoutY = 380.0;
                            panelTable.visible = true;
                            panelTable.layoutY = 150.0;
                            rectTableBorder.visible = true;
                            txtSalesRetTotalItm.layoutX = 0.0;
                            txtSalesRetTotalItm.layoutY = 0.0;
                            txtSalesRetTotalItm.onKeyReleased = txtSalesRetTotalItmOnKeyReleasedAtShown;
                            txtSalesRetTotalItm.selectOnFocus = false;
                            txtSalesRetTotalItm.editable = false;
                            txtSalesRetTotalQty.layoutX = 0.0;
                            txtSalesRetTotalQty.layoutY = 25.0;
                            txtSalesRetTotalQty.selectOnFocus = false;
                            txtSalesRetTotalQty.editable = false;
                            txtSalesRetDiscount.layoutX = 0.0;
                            txtSalesRetDiscount.layoutY = 50.0;
                            txtSalesRetDiscount.selectOnFocus = false;
                            txtSalesRetDiscount.editable = false;
                            txtSalesRetVAT.layoutX = 0.0;
                            txtSalesRetVAT.layoutY = 75.0;
                            txtSalesRetVAT.selectOnFocus = false;
                            txtSalesRetVAT.editable = false;
                            panelTxtColumn1.visible = true;
                            panelTxtColumn1.layoutY = 380.0;
                            label19.visible = true;
                            label19.layoutX = 0.0;
                            label19.layoutY = 0.0;
                            label19.text = "Amt. Paid";
                            label19.font = Arial_12;
                            label19.textFill = DarkGray;
                            label18.visible = true;
                            label18.layoutX = 0.0;
                            label18.layoutY = 25.0;
                            label18.text = "Sub Total ";
                            label18.font = Arial_12;
                            label18.textFill = DarkGray;
                            label6.layoutX = 0.0;
                            label6.layoutY = 50.0;
                            label6.text = "Balance";
                            label.visible = true;
                            label.layoutY = 75.0;
                            label.text = "Round Off";
                            label.font = Arial_12;
                            label.textFill = DarkGray;
                            panelLblColumn2.visible = true;
                            panelLblColumn2.layoutY = 380.0;
                            txtSalesRetNetPaid.layoutX = 0.0;
                            txtSalesRetNetPaid.layoutY = 0.0;
                            txtSalesRetNetPaid.editable = false;
                            txtSalesRetNetPaid.font = Arial_12;
                            txtSalesRetSubtotal.layoutX = 0.0;
                            txtSalesRetSubtotal.layoutY = 25.0;
                            txtSalesRetSubtotal.selectOnFocus = false;
                            txtSalesRetSubtotal.editable = false;
                            txtSalesRetBalance.layoutX = 0.0;
                            txtSalesRetBalance.layoutY = 50.0;
                            txtSalesRetBalance.selectOnFocus = false;
                            txtSalesRetBalance.editable = false;
                            txtRoundOff.visible = true;
                            txtRoundOff.layoutY = 75.0;
                            txtRoundOff.onKeyTyped = txtRoundOffOnKeyTypedAtShown;
                            txtRoundOff.font = Arial_12;
                            panelTxtColumn2.visible = true;
                            panelTxtColumn2.layoutY = 380.0;
                            label7.opacity = 0.5;
                            label7.layoutX = 0.0;
                            label7.layoutY = 25.0;
                            label7.text = "Total";
                            label7.font = Arial_20;
                            txtSalesRetTotAmt.layoutX = 55.0;
                            txtSalesRetTotAmt.layoutY = 0.0;
                            __layoutInfo_txtSalesRetTotAmt.height = 70.0;
                            txtSalesRetTotAmt.styleClass = "Borderless-text-box";
                            txtSalesRetTotAmt.effect = null;
                            txtSalesRetTotAmt.promptText = "0.00";
                            txtSalesRetTotAmt.selectOnFocus = false;
                            txtSalesRetTotAmt.editable = false;
                            txtSalesRetTotAmt.font = Arial_Bold_65;
                            panelAmount.visible = true;
                            panelAmount.layoutY = 415.0;
                            cboSalesRetPType.visible = true;
                            cboSalesRetPType.layoutY = 92.0;
                            listView.visible = false;
                            listView.layoutX = 20.0;
                            listView.layoutY = 150.0;
                            __layoutInfo_listView.width = 750.0;
                            __layoutInfo_listView.height = 229.0;
                            rectRemoveRow.visible = true;
                            rectRemoveRow.onMouseClicked = rectRemoveRowOnMouseClickedAtShown;
                            rectRemoveRow.fill = Yellow;
                            rectRemoveRow.stroke = DarkGray;
                            rectRemoveRow.strokeWidth = 2.0;
                            rectRemoveRow.width = 120.0;
                            rectRemoveRow.height = 20.0;
                            rectRemoveRow.arcWidth = 10.0;
                            rectRemoveRow.arcHeight = 10.0;
                            label5.visible = true;
                            label5.layoutY = 0.0;
                            __layoutInfo_label5.width = 120.0;
                            __layoutInfo_label5.height = 20.0;
                            label5.text = "Remove Row [F12]";
                            label5.font = Arial_Bold_12;
                            label5.textAlignment = javafx.scene.text.TextAlignment.CENTER;
                            label5.hpos = javafx.geometry.HPos.CENTER;
                            label5.textFill = DarkGray;
                            group.visible = true;
                            txtSalesRetBillDate.visible = false;
                            txtSalesRetBillDate.layoutX = 270.0;
                            txtSalesRetBillDate.layoutY = 92.0;
                            imageView.visible = true;
                            imageView.layoutY = 67.0;
                            imageView.onMouseClicked = imageViewOnMouseClickedAtShown;
                            imageView.image = Image {url: "{__DIR__}images/Calender.png"};;
                            listSalesReturn.visible = false;
                            listSalesReturn.layoutX = 156.0;
                            listSalesReturn.layoutY = 92.0;
                            panel2.visible = true;
                            panel2.blocksMouse = true;
                            panelAlert.visible = true;
                            panel.visible = true;
                            panelRetrnNotes.visible = false;
                            panel3.visible = true;
                        }
                    }
                ]
            }
        ]
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel3, ]
    }
    // </editor-fold>//GEN-END:main
  


    function txtSalesRetDNameOnKeyPressedAtShown(  event               : javafx    .scene.input                 .KeyEvent)

         : Void   {
            shortcut  (  event    );

                                    }

                                function txtSalesRetCNameOnKeyPressedAtShown
                              (     event                          :  javafx.scene   .input

             .KeyEvent               )                                                                         : Void             {
            shortcut(

    event               );
                        }


   function imgBillNoOnMouseClickedAtShown     (event :   javafx.scene     .input  .MouseEvent     )


                    {
                    if
                    (
                    btnSalesRetEdit.text

                         ==

                         
                           "Edit [F6]" and    not    btnSalesRetSave .disable   )       {
                        if (not listSalesReturn    .visible)
                               {
                        getBillInfo     (
                 KeyCode.VK_DOWN  )
                      ;



                }

        else          {
            listSalesReturn                                             .visible = false         ;


     txtSalesRetBillNo    .requestFocus();
           }                                                        }

                                  }   function

    imgSRBNoOnMouseClickedAtShown       (event


     : javafx.scene.input.MouseEvent  )

: Void {
        if     (btnSalesRetEdit  .text   ==         "Update [F7]" )
          {
        if(not     listSalesReturn   .visible)
{
                            getSRBillInfo(KeyCode.VK_DOWN);
                        }else{
                            listSalesReturn.visible = false;
                            txtSalesRetSRNo.requestFocus();
                        }
                }
    }

    function txtSalesRetTotalItmOnKeyReleasedAtShown(  event: javafx.scene.input.KeyEvent):  Void {
                    shortcut  ( event);
    }

    function txtRoundOffOnKeyTypedAtShown(  event: javafx.scene.input.KeyEvent):  Void {
        updateIntValues();
    }


function FXalert(type : Integer):Void{
        CustomAlert.ShowAlert("Sales Return",type);
        showAlertbox();
}

function showAlertbox():Void{
        panelAlert.visible=true;
        delete panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
}
function FXinfo(msg:String):Void{
        CustomAlert.ShowInfo("Sales Return",msg);
        showAlertbox();
}
    var mandatory = CommonDeclare.textbox_mandatory();
    var error = CommonDeclare.textbox_error();

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Sales Return", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = error;
    }

    function btnSalesRetCancelActionAtShown(): Void {
        if(btnSalesRetCancel.text == "Back [Ctrl+Left]"){
                back();
        }
        else{
            cancel();
        }

    }

    function mandatory_textboxes() {
        txtSalesRetSRNo.style = mandatory;
        txtSalesRetBillNo.style = mandatory;
    }

    function back(): Void {
                resetValues();
                txtSalesRetSRNo.editable  = false;
                txtSalesRetBillNo.editable = true;
                btnSalesRetSave  .disable  = false;
                txtSalesRetBillNo  .requestFocus();
                getAutoVal = commonController.getAutoIncrement(srDate , "SalesReturn");
                imgSRBNo.visible = false;
                imgBillNo.visible = true;
                btnSalesRetEdit.text   = "Edit [F6]";
                btnSalesRetCancel.text   = "Cancel [F8]";
            CancelW = bottonW;
            imgCancel.image = imageCancel;
            imgEdit.image=imageEdit;
      }
        function imageViewOnMouseClickedAtShown(event:javafx.scene.input.MouseEvent)                                                                         : Void             {
          if(not dateFlag)
          {
            if (txtSalesRetSRDate.text!= null)
              {
                var dat  = txtSalesRetSRDate.rawText.trim().split("-");
                var d =  Integer.parseInt(dat[0]);
                var m =  Integer.parseInt(dat[1])-1;
                var y =  Integer.parseInt(dat[2]);
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
    def kr = KeyRegistry {};

     var short = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 2 and CommonDeclare.form[1] == 7) {
            shortcut(short);
        }
    }
     public function shortcut(event: javafx.scene.input.KeyEvent): Void {

        if (event.code == kr.save and not btnSalesRetSave.disable) {
            saveSalesReturn();
        }
        if (event.code == kr.reset  and btnSalesRetReset.text == "Reset [F4]") {
            resetValues();
        }
        if (event.code == kr.update and not btnSalesRetEdit.disable) {
            txtSalesRetBillNo.editable = false;
            salesReturnEditValues();
        }
        if (event.code == kr.edit and not btnSalesRetEdit.disable and btnSalesRetSave.disable == false) {
            txtSalesRetBillNo.editable = false;
            resetValues();
            txtSalesRetSRNo.editable=true;
            btnSalesRetSave.disable=true;
            txtSalesRetSRNo.requestFocus();
            getAutoVal="";
            imgSRBNo.visible = true;
            imgBillNo.visible = false;
            btnSalesRetEdit.text="Update [F7]";
            btnSalesRetCancel.text="Back [Ctrl+Left]";
            CancelW = bottonW+50;
            imgCancel.image = imageBack;
            imgEdit.image=imageSave;
        }

        if (event.code == kr.cancel and btnSalesRetCancel.text =="Cancel [F8]") {
            cancel();
        }
        if(event.controlDown and event.code == kr.back and btnSalesRetCancel.text == "Back [Ctrl+Left]"){
            back();
        }
        if (event.code == kr.rRow) {
             SalesReturnTable.removeRow();updateValues();
        }
    }
    function cancel():Void{
        panel.visible = false;
        CommonDeclare.form[1] = 0;
      
    }

    function txtSalesRetSRNoOnKeyReleasedAtShown (event: javafx.scene.input.KeyEvent): Void {
                mandatory_textboxes();
                if (btnSalesRetSave.disable and btnSalesRetCancel.text == "Back [Ctrl+Left]")
                {
               if(event.code==KeyCode.VK_ESCAPE)
                {
                    listSalesReturn.visible=false;
                    txtSalesRetSRNo.requestFocus();
                }
                getSRBillInfo(event.code);
                }
    }

    function txtSalesRetSRNoOnKeyPressedAtShown (event: javafx.scene.input.KeyEvent): Void {

            shortcut(event);
                if (btnSalesRetSave.disable and btnSalesRetCancel.text == "Back [Ctrl+Left]")
                {
           if(event.code==KeyCode.VK_ENTER)
            {
                listSalesReturn.visible=false;
            }
            else if(event.code==KeyCode.VK_DOWN)
            {
               getSRBillInfo(event.code);
               listSalesReturn.requestFocus();
               listSalesReturn.selectFirstRow();
           }
           shortcut(event);
           }

    }
    function btnSalesRetEditActionAtShown (): Void {
        salesReturnEditValues();
}

    function btnSalesRetSaveOnKeyPressedAtShown (event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
        saveSalesReturn();
        }else{ shortcut(event);}
    }
    function btnSalesRetEditOnMouseClickedAtShown ( event: javafx.scene.input.MouseEvent): Void {
        txtSalesRetBillNo.editable = false;
        btnSalesRetEditActionAtShown();
    }
    
    function btnSalesRetEditOnKeyPressedAtShown (event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
        txtSalesRetBillNo.editable = false;
        btnSalesRetEditActionAtShown();
        }else{ shortcut(event);}
    }
    function btnSalesRetResetOnKeyPressedAtShown (event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
        resetValues();
        }else{ shortcut(event);}
    }
    function btnSalesRetCancelOnKeyPressedAtShown (event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
        btnSalesRetCancelActionAtShown();
        }else{ shortcut(event);}
    }

    function btnSalesRetSaveActionAtShown(): Void {
            saveSalesReturn();
         }

    function btnSalesRetResetActionAtShown(): Void {
            resetValues();
         }

    function txtSalesRetBillNoOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
            if(event.code==KeyCode.VK_ENTER)
            {
                listSalesReturn.visible=false;
            }
                else if(event.code==KeyCode.VK_DOWN)
                {
                    getBillInfo(event.code);
                    listSalesReturn.requestFocus();
                    listSalesReturn.selectFirstRow();
                }
                 shortcut(event);

         }

    function txtSalesRetBillNoOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
               mandatory_textboxes();

               if(event.code==KeyCode.VK_ESCAPE)
                {
                    listSalesReturn.visible=false;
                    txtSalesRetBillNo.requestFocus();
                }
                else if(event.code==KeyCode.VK_ENTER and btnSalesRetEdit.text=="Edit [F6]")
                {
                    setSalesValues();

                }else if(btnSalesRetEdit.text=="Edit [F6]" )
                {
                   getBillInfo(event.code);
                }
         }

    function rectRemoveRowOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        SalesReturnTable.removeRow();updateValues();
    }
function getSalesType(s : String):String{
               var table_name = "";
               var bill = s.substring(0,3);
                        if(bill.equalsIgnoreCase("SCA"))
                        {
                            PaymentType= ["Cash"];
                            table_name = "cash_bill";
                       }
                       else if(bill.equalsIgnoreCase("SCR"))
                       {
                            PaymentType= ["Credit"];
                            table_name = "credit_bill";
                       }
                       else if(bill.equalsIgnoreCase("SCD"))
                       {
                            PaymentType= ["Credit/Debit Card"];
                            table_name = "cards_bill";
                       }                       
                       else if(bill.equalsIgnoreCase("SAC"))
                       {
                            PaymentType= ["Counter Sales"];
                            table_name = "accounts";
                       }
                   cboSalesRetPType.select(0);

                   return table_name;
}

public function setSalesValues():Void{

    try{

        var billNo   = txtSalesRetBillNo.rawText.trim();
        if(billNo!=null or not billNo.equals(""))
        {
           SalesReturnTable.insertSalesData(billNo);
           var table_name = getSalesType(billNo);
           //salesController = new SalesController();
           SalesReturnTable.salesCalculations();
           var salesValue:SalesModel;
            if(SalesReturnTable.nullVal !=0)
            {
                   salesValue=salesController.getBillDetails(billNo, table_name);
                   txtSalesRetCName.text=salesValue.getCustomerName();
                   txtSalesRetDName.text=salesValue.getDoctorName();
                   txtSalesRetBillDate.text=DateUtils.normalFormatDate(salesValue.getBillDate());
                   
                   txtSalesRetTotAmt.text=salesValue.getTotalAmount().toString();
                   txtSalesRetTotalItm.text=salesValue.getTotalItems().toString();
                   txtSalesRetTotalQty.text=salesValue.getTotalQuantity().toString();
                   txtSalesRetNetPaid.text=salesValue.getPaidAmount().toString();
                   txtSalesRetBalance.text=salesValue.getBalanceAmount().toString();
                   txtSalesRetDiscount.text=salesValue.getTotalDiscount().toString();
                   txtSalesRetVAT.text=salesValue.getTotalVAT().toString();
                   paymentMode = salesValue.getPaymentMode();
                   
                   cardHolderName = salesValue.getCardHolderName();
                   cardNumber = salesValue.getCardNumber();
                   cardExpiryDate = salesValue.getCardExpiry();
                   bankName = salesValue.getBankName();
                   updateIntValues();
             }else{
                       resetValues();
             }
        }
    }catch(e : Exception){}
}

public function getBillInfo(event:javafx.scene.input.KeyCode):Void{
    listSalesReturn.visible=true;
    listSalesReturn.layoutX = txtSalesRetBillNo.layoutX;
    listSalesReturn.layoutY = txtSalesRetBillNo.layoutY + txtSalesRetSRNo.height;
    listH = 0.0;
     //salesController=new SalesController();
     billInfo=salesController.billNum(txtSalesRetBillNo.rawText.trim());
     listSalesReturn.items=billInfo.toArray();
     listSalesReturn.onKeyPressed = function(e){
            if(e.code==KeyCode.VK_ENTER)
            {
                txtSalesRetBillNo.text="{listSalesReturn.selectedItem}";
                setSalesValues();
                listSalesReturn.visible=false;
                txtSalesRetBillNo.requestFocus();
            }
            else if (e.code == KeyCode.VK_DOWN) {
                        if (listSalesReturn.selectedIndex == 0) {
                            listSalesReturn.selectFirstRow();
                        }
            }
            else if(e.code==KeyCode.VK_ESCAPE)
            {
                listSalesReturn.visible=false;
                txtSalesRetBillNo.requestFocus();
            }
     };
     listSalesReturn.onMouseClicked= function(e){

                txtSalesRetBillNo.text="{listSalesReturn.selectedItem}";
                setSalesValues();
                listSalesReturn.visible=false;
                txtSalesRetBillNo.requestFocus();
     };

    var cnt = listSalesReturn.items.size();
    var height: Integer = 0;
    if (cnt < 9) {
        height = cnt;
        if (height < 3) {
            listH = (height * 25);
        } else {
            listH = (height * 25) - (height - 2);
        }
    } else {
        height = 8;
        listH = (height * 25) - (height - 2);
    }
     if(event==KeyCode.VK_ESCAPE or event==KeyCode.VK_TAB or event==KeyCode.VK_ENTER)
            listSalesReturn.visible=false;

}

public function getSRBillInfo(event:javafx.scene.input.KeyCode):Void{
    //salesController=new SalesController();
    listSalesReturn.visible=true;
    listH = 0.0;
    listSalesReturn.layoutX = txtSalesRetSRNo.layoutX;
    listSalesReturn.layoutY = txtSalesRetSRNo.layoutY + txtSalesRetSRNo.height;
    srBillInfo=salesController.srBillNum();
    listSalesReturn.items=srBillInfo.toArray();
    listSalesReturn.onKeyPressed = function(e){
            if(e.code==KeyCode.VK_ENTER)
            {
                getAutoVal="{listSalesReturn.selectedItem}";
                setSrValues();
                listSalesReturn.visible=false;
                txtSalesRetSRNo.requestFocus();
            }
            else if (e.code == KeyCode.VK_DOWN) {
                        if (listSalesReturn.selectedIndex == 0) {
                            listSalesReturn.selectFirstRow();
                        }
            } else if(e.code==KeyCode.VK_ESCAPE)
            {
                listSalesReturn.visible=false;
                txtSalesRetSRNo.requestFocus();
            }
     };
     listSalesReturn.onMouseClicked = function(e){
                getAutoVal="{listSalesReturn.selectedItem}";
                setSrValues();
                listSalesReturn.visible=false;
                txtSalesRetSRNo.requestFocus();
     }

    var cnt = listSalesReturn.items.size();
    var height: Integer = 0;
    if (cnt < 9) {
        height = cnt;
        if (height < 3) {
            listH = (height * 25);
        } else {
            listH = (height * 25) - (height - 2);
        }
    } else {
        height = 8;
        listH = (height * 25) - (height - 2);
    }

if(event==KeyCode.VK_ESCAPE or event==KeyCode.VK_TAB or event==KeyCode.VK_ENTER)
            listSalesReturn.visible=false;
}

function setSrValues():Void{

                   var billNo   = txtSalesRetSRNo.rawText.trim();
                   var tabValues:SalesModel=new SalesModel();
                   tabValues = salesController.srBillDetails(billNo);
                   srDate=DateUtils.normalFormatDate(tabValues.getSalesReturnDate());
                   txtSalesRetBillNo.text=tabValues.getBillNumber();
                        
                   var saleBillNo   = txtSalesRetBillNo.rawText.trim();
                   var table_name   = getSalesType(saleBillNo);
                   
                   txtSalesRetCName.text=tabValues.getCustomerName();
                   txtSalesRetDName.text=tabValues.getDoctorName();
                   txtSalesRetBillDate.text=DateUtils.normalFormatDate(tabValues.getBillDate());
                   txtSalesRetTotAmt.text=tabValues.getTotalAmount().toString();
                   txtSalesRetTotalItm.text=tabValues.getTotalItems().toString();
                   txtSalesRetTotalQty.text=tabValues.getTotalQuantity().toString();
                   txtSalesRetNetPaid.text=tabValues.getPaidAmount().toString();
                   txtSalesRetBalance.text=tabValues.getBalanceAmount().toString();
                   txtSalesRetDiscount.text=tabValues.getTotalDiscount().toString();
                   txtSalesRetVAT.text=tabValues.getTotalVAT().toString();
 System.out.println("ooooooooooqwee");
SalesReturnTable.restuctureViewTable(tabValues);
//System.out.println("View table restructured.");

                   //SalesReturnTable.restuctureViewTable(tabValues);
     //              txtSalesRetSubtotal.text="{Value.Round(Double.parseDouble(tabValues.getTotalAmount().toString())-Double.parseDouble(tabValues.getTotalDiscount().toString())+Double.parseDouble(tabValues.getTotalVAT().toString()),2)}";
                   txtSalesRetSubtotal.text = tabValues.getSubTotal().toString();
                   SalesReturnTable.salesCalculations();
                   SalesReturnTable.focusSet();
		   updateValues();
//                   commonController=new CommonController();
                   sr_CRNo = commonController.getCRNo(billNo);
}
function checkValid():Integer{
    var retVal = 0;
    var billNo = txtSalesRetBillNo.rawText.trim();    
    SalesReturnTable.salesCalculations();
    var tVal     = SalesReturnTable.nullVal;


   if(billNo.equals("") or billNo==null or billNo.trim().length()<0 or tVal == 0)
   {
         FXinfo("Please Select Sales Bill Number", txtSalesRetBillNo);
   }
   else if (not billNo.equals("")){
         var billDate = DateUtils.changeFormatDate(txtSalesRetBillDate.rawText.trim());
         
         var salesReturnDate = DateUtils.changeFormatDate(txtSalesRetSRDate.rawText.trim());
         
         if (billDate.compareTo(salesReturnDate) > 0 ) {
         FXinfo("Sales Return date cannot be before the bill Date.Please provide the correct date.", txtSalesRetSRDate);
        }
         else
        {
         retVal = 1;
        }
   }
   else
   {
         retVal = 1;
   }

return retVal;
}

public function setTableValues(sales:SalesModel): Void {
             
              var sdf = new SimpleDateFormat("dd-MM-yyyy");
              sales.setSalesReturnNumber(txtSalesRetSRNo.text);
              sales.setSalesReturnDate( DateUtils.changeFormatDate(sdf.parse(txtSalesRetSRDate.text)));
              sales.setCustomerName(txtSalesRetCName.rawText);
              sales.setDoctorName(txtSalesRetDName.rawText);
              sales.setBillNumber(txtSalesRetBillNo.text);
              sales.setBillType("{cboSalesRetPType.selectedItem}");
              sales.setBillDate(DateUtils.changeFormatDate(sdf.parse(txtSalesRetBillDate.text)));
              sales.setTotalDiscount(Double.parseDouble(txtSalesRetDiscount.rawText));
              sales.setTotalAmount(Double.parseDouble(txtSalesRetTotAmt.text));
              sales.setPaidAmount(Double.parseDouble(txtSalesRetNetPaid.rawText));
              sales.setBalanceAmount(Double.parseDouble(txtSalesRetBalance.rawText));
              sales.setTotalVAT(Double.parseDouble(txtSalesRetVAT.rawText));
              sales.setTotalQuantity(Integer.parseInt(txtSalesRetTotalQty.rawText));
              sales.setTotalItems(Integer.parseInt(txtSalesRetTotalItm.rawText));             
              sales.setListofitems(SalesReturnTable.getSalesBillItems());
              sales.setFormType("return");
              sales.setAccountNumber("");
              var tabName   = "";
              if(sales.getBillType().equalsIgnoreCase("Cash"))
              {
                       tabName="cash_bill" ;
              }
              else if(sales.getBillType().equalsIgnoreCase("Credit"))
              {
                      tabName="credit_bill" ;
              }
              else if(sales.getBillType().equalsIgnoreCase("Credit/Debit Card") )
              {
                      tabName="cards_bill" ;
                      sales.setPaymentMode(paymentMode);
                      sales.setCardNumber(cardNumber);
                      sales.setCardHolderName(cardHolderName);
                      sales.setBankName(bankName);
                      sales.setCardExpiry(cardExpiryDate);
              }
              else if(sales.getBillType().equalsIgnoreCase("Counter Sales") )
              {
                      tabName="accounts" ;
              }
              sales.setTableName(tabName);
}

public function  saveSalesReturn() : Void {
    try{
    var check = checkValid();
    var sales:SalesModel=new SalesModel();
    if(check == 1) {
              txtSalesRetBillNo.editable =true;
              setTableValues(sales);
              sales.setUpdateFlag("false");
             // salesController=new SalesController();
              var returnObject = new Object();
              returnObject = salesController.createRecord(sales);
              var msgReturnModel: MsgReturnModel = new MsgReturnModel();
              msgReturnModel = returnObject as MsgReturnModel;
              SalesReturnTable.focusSet(msgReturnModel.getRowCount(), msgReturnModel.getColumnCount());
              if(msgReturnModel.getReturnMessage()=="0")
                {
                   FXalert(Integer.parseInt(msgReturnModel.getReturnMessage()));
                   resetValues();
                   var creditModel:CreditNoteModel = new CreditNoteModel();
                   creditModel = salesController.insertCreditNoteNo(sales);
                   var billDate: String = DateUtils.normalFormatDate(sales.getSalesReturnDate());
                   SalesReturnNotes.setValues([creditModel.getCreditNoteNumber(),billDate,sales.getCustomerName().toString(),sales.getSalesReturnNumber().toString(),sales.getTotalAmount().toString(),""]);
                   panelRetrnNotes.visible = true;
                   SalesReturnNotes.Show();
                   
                }
                else
                {
                FXinfo(msgReturnModel.getReturnMessage());
                }
//                commonController=new CommonController();
                commonController.userLog("Sales Return","Save");
                }
           }
           catch(e:Exception){
                var msg = "Class : SalesReturn  Method :saveSalesReturn  Message={e.getMessage()}";
                log.debug(msg);
           }
       }

function checkEditValid():Integer{
    var retVal = 0;
    var billNo = txtSalesRetSRNo.rawText.trim();    
    var pType    = cboSalesRetPType.selectedItem;
    SalesReturnTable.salesCalculations();
    var tVal     = SalesReturnTable.nullVal;

   if(billNo.equals("") or billNo==null or billNo.trim().length()<0 or tVal == 0)
   {
         FXinfo("Please Select Sales Return Bill Number", txtSalesRetSRNo);
   } 
    
    else if (not billNo.equals("")){
         var billDate = DateUtils.changeFormatDate(txtSalesRetBillDate.rawText.trim());
         
         var salesReturnDate = DateUtils.changeFormatDate(txtSalesRetSRDate.rawText.trim());
         
         if (billDate.compareTo(salesReturnDate) > 0 ) {
         FXinfo("Sales Return date cannot be before the bill Date.Please provide the correct date.", txtSalesRetSRDate);
        }
         else
        {
         retVal = 1;
        }
   }
   else if (sr_CRNo=="" or sr_CRNo.equals("") or sr_CRNo.trim().length()<=0)
    {
//          commonController=new CommonController();
          sr_CRNo = commonController.getCRNo(billNo);
          retVal = 1;
    }
    else {
         retVal = 1;
     }

return retVal;
}

function salesReturnEditValues() : Void
{
        try
        {
        if(btnSalesRetEdit.text.equalsIgnoreCase("Update [F7]"))
        {
            var chk = checkEditValid();
            var sales:SalesModel=new SalesModel();
            if(chk == 1)
            {
                    sales.setUpdateFlag("true");
                    setTableValues(sales);
                    var returnObject = new Object();
                    returnObject = salesController.createRecord(sales);
                    var msgReturnModel: MsgReturnModel = new MsgReturnModel();
                    msgReturnModel = returnObject as MsgReturnModel;
                    SalesReturnTable.focusSet(msgReturnModel.getRowCount(), msgReturnModel.getColumnCount());
                    if (msgReturnModel.getReturnMessage() == "1") {
                    var cn:ConfirmDialogBox=new ConfirmDialogBox(0,"Sales Return");
                   var a =bind cn.staus;
                                    if (a) {
                                         var update: Boolean;
                                        update = salesController.updateRecord(sales) as Boolean;
                                        if (update == true) {
                                            FXalert(4);
                                            resetValues();
                                            var creditModel:CreditNoteModel = new CreditNoteModel();
                                            creditModel = salesController.insertCreditNoteNo(sales);
                                            var billDate: String = DateUtils.normalFormatDate(sales.getSalesReturnDate());
                                            SalesReturnNotes.setValues([creditModel.getCreditNoteNumber(),billDate,sales.getCustomerName().toString(),sales.getSalesReturnNumber().toString(),sales.getTotalAmount().toString(),creditModel.getDetails()]);
                                            panelRetrnNotes.visible = true;
                                            SalesReturnNotes.Show();
                                        }                                                                                                     
                                   }
                                    CustomAlert.confirm = false;
            }
            else{
                          FXinfo(msgReturnModel.getReturnMessage());

             }
               commonController.userLog("Sales Return","Update");
        }
        }
        else{
         resetValues();
         txtSalesRetSRNo.editable=true;
         btnSalesRetSave.disable=true;
         txtSalesRetSRNo.requestFocus();
         getAutoVal="";
         imgSRBNo.visible = true;
         imgBillNo.visible = false;  
         btnSalesRetEdit.text="Update [F7]";
         btnSalesRetCancel.text="Back [Ctrl+Left]";
         CancelW = bottonW+50;
         imgCancel.image = imageBack;
         imgEdit.image=imageSave;         
    }

}
catch(e:Exception)
{
    log.debug("Meyhod:salesReturnEditValues Exception = {e.getMessage()}");
}
}


var visit = bind fxCalendar.visible on replace{
    if(dateFlag and not visit)
    {
                srDate=fxCalendar.getSelectedDate();
                dateFlag=false;
                cboSalesRetPType.requestFocus();
    }
 };

    function updateValues(): Void {
        for(i in [0..<5])
        {
            updateIntValues();
        }
    }

    function updateIntValues(): Void {
            var ta : Double = Value.Round(SalesReturnTable.totAmt,2);
            var tda : Double = Value.Round(SalesReturnTable.totDistAmt,2);
            var tvat : Double =Value.Round(SalesReturnTable.totVATAmt,2);
            var netAmt: Double= Value.Round((ta-tda),2);
            txtSalesRetSubtotal.text="{Value.Round(ta)}";
            txtSalesRetTotalQty.text="{SalesReturnTable.totQty}";
            txtSalesRetTotalItm.text="{SalesReturnTable.totItems}";
            txtSalesRetDiscount.text="{Value.Round(tda)}";
            txtSalesRetVAT.text="{Value.Round(tvat)}";
            txtSalesRetTotAmt.text="{Value.Round(netAmt)}";
            txtSalesRetNetPaid.text=txtSalesRetTotAmt.text;
            var autoRoundoff : Integer = 0;
            var settingsController : com.vanuston.medeil.implementation.Settings =  RegistryFactory.getClientStub(RegistryConstants.Configuration) as com.vanuston.medeil.implementation.Settings;
            autoRoundoff = settingsController.getEnableAutoRoundoff()[0];
            var rndVal :String = "0.00";
             if(autoRoundoff==0) {
                var rVal = Value.roundToHalfVal("{netAmt}");
                txtRoundOff.text = Value.Round(rVal - netAmt);
                rndVal = "{Value.Round(Double.parseDouble(txtRoundOff.text)+netAmt)}";
                txtSalesRetTotAmt.text= rndVal;
                txtRoundOff.editable=false;
            }
            else if(autoRoundoff==1) {
                var rVal = Value.roundToWholeVal("{netAmt}");
                txtRoundOff.text = Value.Round(rVal - netAmt);
                rndVal = "{Value.Round(Double.parseDouble(txtRoundOff.text)+netAmt)}";
                txtSalesRetTotAmt.text = rndVal;
                txtRoundOff.editable=false;
            }
            else {
                var valid = new Validation();
                txtRoundOff.editable=true;
                if(not txtRoundOff.rawText.trim().equals("")) {
                    if (NumberUtils.isNumeric(txtRoundOff) and valid.getDecimalValid(txtRoundOff.rawText.trim(), 1, 6)==10) {
                        txtSalesRetTotAmt.text = "{Value.Round(netAmt+Double.parseDouble(txtRoundOff.rawText.trim()))}";
                    }
                }
            }
}

public function resetValues():Void {
    txtSalesRetSRNo.style = mandatory;
    txtSalesRetBillNo.style = mandatory;
    txtSalesRetSRDate.style = mandatory;
    PaymentType = "---Select---";
    listSalesReturn.visible =false;
    txtSalesRetVAT.text="0.00";
    txtSalesRetBalance.text="0.00";
    txtSalesRetBillNo.text="";
    txtSalesRetCName.text="";
    txtSalesRetDName.text="";
    txtSalesRetDiscount.text="0.00";
    txtSalesRetNetPaid.text="0.00";
    txtSalesRetSubtotal.text="0.00";
    txtSalesRetTotAmt.text="0.00";
    txtRoundOff.text = "0.00";
    txtSalesRetTotalItm.text="0";
    txtSalesRetTotalQty.text="0";
    txtSalesRetBillDate.text="";
    cboSalesRetPType.select(0);

    srDate = DateUtils.now("dd-MM-yyyy");

    SalesReturnTable.clearData();
    SalesReturnTable.salesCalculations();
    
    //if(not btnSalesRetSave.disable)
	if(btnSalesRetEdit.text!="Update [F7]")
	{
		getAutoVal = commonController.getAutoIncrement(srDate,"SalesReturn");
    }else{
        getAutoVal = "";
    }
    txtSalesRetBillNo.requestFocus();
	updateValues();
}

function getPrivileges(u : String ):Void{
//        commonController=new CommonController();
        var uname = u;
        var utype = commonController.getUserType(uname);

        if(utype.equals("User"))
        {
            var priv= commonController.getPrivileges("sales", uname);
            var ss = priv.split(",");
            var val = Integer.parseInt(ss[3]);
            if(val == 1)
            {
               btnSalesRetSave.disable = true;
               if(btnSalesRetEdit.text!="Update [F7]")
               {
                   btnSalesRetEdit.disable = false;
               }else{
					btnSalesRetEdit.disable = true;
				}
            }
            else if(val == 2)
            {
				if(btnSalesRetEdit.text!="Update [F7]")
				{	
					btnSalesRetSave.disable = false;
				}
                btnSalesRetEdit.disable = false;                 		
            }
            else if(val == 3)
            {
				if(btnSalesRetEdit.text!="Update [F7]")
				{	
					btnSalesRetSave.disable = false;
				}else{
					btnSalesRetSave.disable = true;
				}
                btnSalesRetEdit.disable = false;  			
            }
        }else {
				if(btnSalesRetEdit.text!="Update [F7]")
				{	
					btnSalesRetSave.disable = false;
				}else{
					btnSalesRetSave.disable = true;
				}
                btnSalesRetEdit.disable = false;  			
		}
    }
var logUser: String =  bind CommonDeclare.user on replace{
            getPrivileges(logUser);updateValues();
        }

var changPiv =  bind btnSalesRetEdit.text on replace{
            getPrivileges(logUser);updateValues();
        }
public function startUp():Void{

		(srTable as javax.swing.JTable).addKeyListener(KeyAdapter{
            override public function keyReleased(e : java.awt.event.KeyEvent): Void{
				updateValues();
        }
            override public function keyTyped(e : java.awt.event.KeyEvent): Void{
				updateValues();
        }		
        });	
		(srTable as javax.swing.JTable).getSelectionModel().addListSelectionListener(javax.swing.event.ListSelectionListener{
            override public function valueChanged(e : javax.swing.event.ListSelectionEvent): Void{
                updateValues();
            }
         });
	//resetValues();
        mandatory_textboxes();
        salesRtnTable.layoutX   =   0;
        salesRtnTable.layoutY   =   0;
        getPrivileges(logUser);updateValues();
        panel.visible = true;
        txtSalesRetBillNo.requestFocus();
        //txtSalesRetBillDate.text = DateUtils.now("dd-MM-yyyy");
        fxCalendar.visible=false;
        panel2.content=[fxCalendar,];
        panelTable.content=[ salesRtnTable,];
        delete panelRetrnNotes.content;
        SalesReturnNotes.panel.visible = false;
        insert SalesReturnNotes.panel into panelRetrnNotes.content;
        getAutoVal = commonController.getAutoIncrement(DateUtils.now("dd-MM-yyyy"),"SalesReturn");
  }
  }