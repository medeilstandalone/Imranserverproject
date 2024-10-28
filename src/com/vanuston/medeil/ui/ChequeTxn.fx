package com.vanuston.medeil.ui;

import javafx.scene.input.KeyCode;
import com.vanuston.medeil.ui.calendar.theme.Theme;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import com.vanuston.medeil.util.Logger;
import java.lang.Exception;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.util.NumberUtils;
import javafx.scene.control.TextBox;
import java.text.SimpleDateFormat;
import com.vanuston.medeil.uitables.ChequeTransactionTable;
import javafx.ext.swing.SwingComponent;
import java.awt.Dimension;

import java.awt.event.MouseAdapter;
import java.lang.Void;

import com.vanuston.medeil.util.KeyRegistry;
import com.vanuston.medeil.model.ChequeTransactionModel;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.model.MsgReturnModel;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.uitables.ConfirmDialogBox;

public class ChequeTxn {

    var log: Logger = Logger.getLogger(ChequeTxn.class, "Finanical");
    var curDateFlag: Boolean = false;
    var curDateFlag1: Boolean = false;
    var curDateFlag2: Boolean = false;
    var curDateFlag3: Boolean = false;
    var curDateFlag4: Boolean = false;
    var fxCalendar = FXCalendar {
                theme: Theme {};
            };
    var panelCalenderLX = 0.0;
    var panelCalenderLY = 0.0;
     var comObj : CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;


     var chqTxnConttroller: com.vanuston.medeil.implementation.ChequeTransaction=RegistryFactory.getClientStub(RegistryConstants.ChequeTransaction) as  com.vanuston.medeil.implementation.ChequeTransaction;//Controller Call

    var panelW = bind CommonDeclare.panelFormW on replace {
        panelDate.visible = false;
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
    var rectbutton1LX = bind CommonDeclare.rectbutton1LX;
    var rectbutton2LX = bind CommonDeclare.rectbutton2LX;
    var rectbuttonLY = bind CommonDeclare.rectbuttonLY;
    var seperatorW = bind CommonDeclare.seperatorW;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;//100
    var Type4TextboxW = bind CommonDeclare.Type4TextboxW;
    var ImageCalenderLX = bind C2LX + Type3TextboxW + 5;
    var ImageCalender1LX = bind C4LX + Type3TextboxW + 5;
    var bottonW = bind CommonDeclare.bottonW;
    var bottonH = bind CommonDeclare.bottonH;
    var buttonLY = 0.0;
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    def CustomAlert = CustomAlert {};
    var mandatory = CommonDeclare.textbox_mandatory();
    var error = CommonDeclare.textbox_error();
    var chequeTxnTable = new ChequeTransactionTable();
    var chequeViewtable = chequeTxnTable.createTable();
    var chequeTable = SwingComponent.wrap(chequeTxnTable.getScrollTable(chequeViewtable));
    var panelTableLY = 230.0;
    var AccountNo=comObj.getAccountNumbers().toArray();
    var btnSaveName;
    var btEditName;
    var particulars: String[] = ["-- Select --", "Payment", "Receipt", "Shop Maintenance"];
    var Status: String[] = ["-- Select --", "Cleared", "Returned", "Cancelled", "Stopped Payment", "Misused", "Lost", "In Progress"];
    var TxnType: String[] = ["-- Select --", "Payable", "Receivable"];
    var recordVal:String="No Records Found";
    function changeTableSize(i: Integer, j: Integer): Void {
        chequeTable.getJComponent().setPreferredSize(new Dimension(i, j));
    }

    var TableW = bind (95.29860229 * panelW) / 100 on replace {
        var n: Integer = currentState.actual;
        if (n == 0) {
            changeTableSize(TableW, 230);
        } else {
            changeTableSize(TableW, 350);
        }
    };
    var TableH = 210.0 on replace {
        var n: Integer = currentState.actual;
        if (n == 0) {
            changeTableSize(TableW, 230);
        } else {
            changeTableSize(TableW, 350);
        }
    };
    var panelTableLX = bind (panelW - TableW) / 2;
    var EditW = bottonW + 10;
    var cheque_id: Integer = 0;
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_separator: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
    }
    public-read def separator: javafx.scene.control.Separator = javafx.scene.control.Separator {
        visible: false
        layoutInfo: __layoutInfo_separator
    }
    
    public-read def rectTableBorder: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        layoutX: bind panelTableLX
        layoutY: bind panelTableLY
        styleClass: "rectTableBorder"
        width: bind TableW
        height: bind TableH
    }
    
    def __layoutInfo_panelTable: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: bind TableH
    }
    public-read def panelTable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelTableLX
        layoutY: bind panelTableLY
        layoutInfo: __layoutInfo_panelTable
    }
    
    def __layoutInfo_cboTxnType: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def cboTxnType: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: bind C2LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_cboTxnType
        onKeyPressed: cboTxnTypeOnKeyPressed
        onMouseClicked: cboTxnTypeOnMouseClicked
        items: bind TxnType
    }
    
    def __layoutInfo_cboStatus: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def cboStatus: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: bind C2LX
        layoutY: 54.0
        layoutInfo: __layoutInfo_cboStatus
        onKeyPressed: cboStatusOnKeyPressed
        onMouseClicked: cboStatusOnMouseClicked
        items: bind Status
    }
    
    def __layoutInfo_cboParticulars: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def cboParticulars: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: bind C4LX
        layoutY: 54.0
        layoutInfo: __layoutInfo_cboParticulars
        onKeyPressed: cboParticularsOnKeyPressed
        onMouseClicked: cboParticularsOnMouseClicked
        items: bind particulars
    }
    
    def __layoutInfo_cboAcNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def cboAcNo: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: true
        layoutX: bind C4LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_cboAcNo
        onKeyPressed: cboAcNoOnKeyPressed
        onMouseClicked: cboAcNoOnMouseClicked
        items: bind AccountNo
    }
    
    def __layoutInfo_txtClearedDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtClearedDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: true
        layoutX: bind C4LX
        layoutY: 81.0
        layoutInfo: __layoutInfo_txtClearedDate
        onKeyPressed: txtClearedDateOnKeyPressed
    }
    
    public-read def imgClearedDate: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind ImageCalender1LX
        layoutY: 81.0
        onKeyPressed: imgClearedDateOnKeyPressed
        onMouseClicked: imgClearedDateOnMouseClicked
    }
    
    def __layoutInfo_label7: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 81.0
        layoutInfo: __layoutInfo_label7
        text: "Label"
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_chkViewStatus: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def chkViewStatus: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: 89.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_chkViewStatus
        items: bind Status
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 430.0
        layoutY: 0.0
        text: "Label"
    }
    
    public-read def imgViewFrom: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 549.0
        layoutY: 294.0
    }
    
    def __layoutInfo_txtViewFrom: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtViewFrom: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 471.0
        layoutY: 294.0
        layoutInfo: __layoutInfo_txtViewFrom
    }
    
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 600.0
        layoutY: 293.0
        text: "Label"
    }
    
    public-read def imgViewTo: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 714.0
        layoutY: 293.0
    }
    
    def __layoutInfo_txtViewTo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtViewTo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 628.0
        layoutY: 293.0
        layoutInfo: __layoutInfo_txtViewTo
    }
    
    def __layoutInfo_btnSearch: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnSearch: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 737.0
        layoutY: 42.0
        layoutInfo: __layoutInfo_btnSearch
        text: "Button"
    }
    
    def __layoutInfo_panelView: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def panelView: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutInfo: __layoutInfo_panelView
        content: [ label3, chkViewStatus, label4, imgViewFrom, txtViewFrom, label5, imgViewTo, txtViewTo, btnSearch, ]
    }
    
    public-read def imageView2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
    }
    
    def __layoutInfo_btnBack: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW+40
        height: bind bottonH
    }
    public-read def btnBack: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton2LX-25
        layoutY: bind buttonLY
        layoutInfo: __layoutInfo_btnBack
        graphic: imageView2
        text: "Button"
    }
    
    def __layoutInfo_listView: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 716.0
    }
    public-read def listView: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: 43.0
        layoutY: 200.0
        layoutInfo: __layoutInfo_listView
        items: null
    }
    
    public-read def labelRecordCount: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutY: bind panelButtonsLY-20
        text: bind recordVal
    }
    
    public-read def panelDate: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelCalenderLX
        layoutY: bind panelCalenderLY+50
        blocksMouse: true
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
    }
    
    public-read def rectangle2: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        width: 100.0
        height: 50.0
    }
    
    def __layoutInfo_label6: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def label6: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutInfo: __layoutInfo_label6
        text: "Label"
    }
    
    public-read def group: javafx.scene.Group = javafx.scene.Group {
        visible: false
        layoutX: bind rectbutton2LX
        layoutY: bind rectbuttonLY
        content: [ rectangle2, label6, ]
    }
    
    public-read def Violet: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.011764706
        green: 0.5019608
        blue: 0.7607843
    }
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
    }
    
    def __layoutInfo_txtDepositedDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtDepositedDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 108.0
        layoutInfo: __layoutInfo_txtDepositedDate
        onKeyPressed: txtDepositedDateOnKeyPressed
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtBankName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtBankName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 27.0
        layoutInfo: __layoutInfo_txtBankName
        onKeyPressed: txtBankNameOnKeyPressed
        text: bind bankName
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtIssuedDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtIssuedDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 81.0
        layoutInfo: __layoutInfo_txtIssuedDate
        styleClass: "text-box"
        onKeyPressed: txtIssuedDateOnKeyPressed
        text: ""
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtChequeNum: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtChequeNum: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 27.0
        layoutInfo: __layoutInfo_txtChequeNum
        onKeyPressed: txtChequeNumOnKeyPressed
        onKeyReleased: txtChequeNumOnKeyReleased
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
    
    def __layoutInfo_txtFavour: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
        height: 37.0
    }
    public-read def txtFavour: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 135.0
        layoutInfo: __layoutInfo_txtFavour
        onKeyPressed: txtFavourOnKeyPressed
        text: ""
        font: Arial_Bold_14
        multiline: true
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
    
    public-read def toggleGroup: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
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
        layoutY: 0.0
        layoutInfo: __layoutInfo_label
        text: "Cheque Transaction  Details - ctrl+W"
        font: Arial_25
        hpos: javafx.geometry.HPos.CENTER
    }
    
    public-read def linearGradient: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#ffffff") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#f5f0e9") }, ]
    }
    
    public-read def DarkGray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.2
        blue: 0.2
    }
    
    public-read def label8: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 54.0
        text: "Particulars"
        font: Arial_12
        textFill: DarkGray
    }
    
    def __layoutInfo_labelAmount: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: 37.0
    }
    public-read def labelAmount: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 108.0
        layoutInfo: __layoutInfo_labelAmount
        text: "Amount"
        font: Arial_Bold_16
        textFill: DarkGray
    }
    
    public-read def labelStatus: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 53.0
        text: "Status"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelName_of_Bank: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 27.0
        text: "Name of Bank"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelAccount_Number: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 6.0
        text: "Account Number"
        font: Arial_12
        textFill: DarkGray
    }
    
    def __layoutInfo_labelIssued_To_In_Favour_of: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: 37.0
    }
    public-read def labelIssued_To_In_Favour_of: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 135.0
        layoutInfo: __layoutInfo_labelIssued_To_In_Favour_of
        text: "Payee"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelDeposited_Date: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 108.0
        text: "Deposited Date"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelIssued_Date: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 81.0
        text: "Issued Date"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelTxnType: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 0.0
        text: "Cheque Type"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelCheque_No: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 27.0
        text: "Cheque No."
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 0.25
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "rectFormHeader"
        fill: DarkGray
        stroke: null
        width: bind panelW
        height: 32.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def panelheader: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        content: [ rectHeader, label, label2, separator, ]
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
    
    public-read def Yellow: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.95
        green: 0.94
        blue: 0.86
    }
    
    public-read def imageCalendar: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Calender.png"
    }
    
    public-read def imgIssuedDate: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind ImageCalenderLX
        layoutY: 81.0
        onKeyPressed: imgIssuedDateOnKeyPressed
        onMouseClicked: imgIssuedDateOnMouseClicked
        image: imageCalendar
    }
    
    public-read def imgDepositedDate: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind ImageCalenderLX
        layoutY: 108.0
        onKeyPressed: imgDepositedDateOnKeyPressed
        onMouseClicked: imgDepositedDateOnMouseClicked
        image: imageCalendar
    }
    
    public-read def imageSave: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Save1.png"
    }
    
    public-read def imgSave: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageSave
        fitWidth: 36.0
        fitHeight: 36.0
    }
    
    def __layoutInfo_btnSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX
        layoutY: bind buttonLY
        layoutInfo: __layoutInfo_btnSave
        onKeyPressed: btnSaveOnKeyPressed
        graphic: imgSave
        text: bind btnSaveName
        font: Arial_Bold_14
        action: btnSaveAction
    }
    
    public-read def imageEdit: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Edit.png"
    }
    
    public-read def imgEdit: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageEdit
        fitWidth: 36.0
        fitHeight: 36.0
    }
    
    def __layoutInfo_btnEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: true
        layoutX: bind botton2LX
        layoutY: bind buttonLY
        layoutInfo: __layoutInfo_btnEdit
        onKeyPressed: btnEditOnKeyPressed
        effect: reflectionEffect
        graphic: imgEdit
        text: bind btEditName
        font: Arial_Bold_14
    }
    
    public-read def imageReset: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Reset.png"
    }
    
    public-read def imgReset: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageReset
        fitWidth: 36.0
        fitHeight: 36.0
    }
    
    def __layoutInfo_btnReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton3LX
        layoutY: bind buttonLY
        layoutInfo: __layoutInfo_btnReset
        onKeyPressed: btnResetOnKeyPressed
        effect: reflectionEffect
        graphic: imgReset
        text: "Reset [F4]"
        font: Arial_Bold_14
        action: btnResetAction
    }
    
    public-read def imageCancel: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Cancel.png"
    }
    
    public-read def imgCancel: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageCancel
        fitWidth: 36.0
        fitHeight: 36.0
    }
    
    def __layoutInfo_btnCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton4LX
        layoutY: bind buttonLY
        layoutInfo: __layoutInfo_btnCancel
        onKeyPressed: btnCancelOnKeyPressed
        effect: reflectionEffect
        graphic: imgCancel
        text: "Cancel [F8]"
        font: Arial_Bold_14
        action: btnCancelAction
    }
    
    public-read def panelButtons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutY: bind panelButtonsLY
        content: [ btnSave, btnEdit, btnReset, btnCancel, btnBack, ]
    }
    
    public-read def imageBack: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/arrow_Left.png"
    }
    
    public-read def linearGradientHeader: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#FFFFFF") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#000000") }, ]
    }
    
    public-read def Arial_Bold_50: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 30.0
    }
    
    def __layoutInfo_txtAmount: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
        height: 37.0
    }
    public-read def txtAmount: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 108.0
        layoutInfo: __layoutInfo_txtAmount
        onKeyReleased: txtAmountOnKeyReleased
        onKeyTyped: txtAmountOnKeyTyped
        text: ""
        font: Arial_Bold_50
    }
    
    def __layoutInfo_panelpage: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 787.0
        height: 100.0
    }
    public-read def panelpage: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutY: 50.0
        layoutInfo: __layoutInfo_panelpage
        content: [ labelCheque_No, labelTxnType, labelIssued_Date, labelDeposited_Date, labelIssued_To_In_Favour_of, txtChequeNum, txtIssuedDate, cboTxnType, labelAccount_Number, labelName_of_Bank, labelStatus, labelAmount, txtBankName, txtAmount, txtFavour, txtDepositedDate, cboStatus, imgDepositedDate, imgIssuedDate, label8, cboParticulars, cboAcNo, txtClearedDate, imgClearedDate, label7, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ rectangle, panelheader, rectTableBorder, panelTable, panelpage, panelView, panelButtons, listView, labelRecordCount, panelDate, panelAlert, group, ]
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.87058824
        green: 0.8392157
        blue: 0.8392157
    }
    
    public-read def imageclickdown: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imageSearch: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Search.png"
    }
    
    public-read def toggleGroup2: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "Shown", "View", ]
        actual: 0
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            label2.visible = false;
                            label2.layoutX = 0.0;
                            label2.layoutY = 0.0;
                            label2.text = "Label";
                            label2.textFill = javafx.scene.paint.Color.BLACK;
                            separator.visible = false;
                            separator.layoutX = 0.0;
                            separator.layoutY = 0.0;
                            labelIssued_To_In_Favour_of.font = Arial_12;
                            txtChequeNum.onKeyPressed = txtChequeNumOnKeyPressedAtShown;
                            txtIssuedDate.onKeyReleased = txtIssuedDateOnKeyReleasedAtShown;
                            labelAccount_Number.text = "Account No";
                            labelName_of_Bank.text = "Bank Name";
                            txtAmount.onKeyPressed = txtAmountOnKeyPressedAtShown;
                            cboAcNo.visible = true;
                            txtClearedDate.visible = true;
                            txtClearedDate.editable = false;
                            imgClearedDate.visible = true;
                            imgClearedDate.layoutY = 81.0;
                            imgClearedDate.image = imageCalendar;
                            label7.layoutY = 83.0;
                            __layoutInfo_label7.width = 81.0;
                            label7.text = "Cleared Date";
                            label7.font = Arial_12;
                            panelpage.visible = true;
                            label3.visible = false;
                            label3.layoutX = 0.0;
                            label3.text = "Label";
                            label3.textFill = javafx.scene.paint.Color.BLACK;
                            chkViewStatus.visible = false;
                            chkViewStatus.layoutX = 89.0;
                            label4.visible = false;
                            label4.layoutX = 430.0;
                            label4.layoutY = 0.0;
                            label4.text = "Label";
                            label4.textFill = javafx.scene.paint.Color.BLACK;
                            imgViewFrom.visible = false;
                            imgViewFrom.layoutX = 549.0;
                            imgViewFrom.layoutY = 294.0;
                            imgViewFrom.image = null;
                            txtViewFrom.visible = false;
                            txtViewFrom.layoutX = 471.0;
                            txtViewFrom.layoutY = 294.0;
                            txtViewFrom.editable = true;
                            label5.visible = false;
                            label5.layoutX = 600.0;
                            label5.layoutY = 293.0;
                            label5.text = "Label";
                            label5.textFill = javafx.scene.paint.Color.BLACK;
                            imgViewTo.visible = false;
                            imgViewTo.layoutX = 714.0;
                            imgViewTo.layoutY = 293.0;
                            imgViewTo.image = null;
                            txtViewTo.visible = false;
                            txtViewTo.layoutX = 628.0;
                            txtViewTo.layoutY = 293.0;
                            txtViewTo.editable = true;
                            btnSearch.visible = false;
                            btnSearch.layoutX = 737.0;
                            btnSearch.layoutY = 42.0;
                            btnSearch.text = "Button";
                            panelView.visible = false;
                            panelView.layoutY = 0.0;
                            btnSave.visible = true;
                            btnEdit.visible = true;
                            btnEdit.action = btnEditActionAtShown;
                            btnReset.visible = true;
                            btnCancel.visible = true;
                            imageView2.visible = false;
                            imageView2.image = null;
                            btnBack.visible = false;
                            btnBack.text = "Button";
                            panelButtons.visible = true;
                            listView.visible = false;
                            listView.layoutY = 230.0;
                            __layoutInfo_listView.width = 712.0;
                            __layoutInfo_listView.height = 230.0;
                            labelRecordCount.visible = false;
                            labelRecordCount.layoutX = 0.0;
                            labelRecordCount.textFill = javafx.scene.paint.Color.BLACK;
                            panelDate.blocksMouse = true;
                            rectangle2.visible = true;
                            rectangle2.styleClass = "rectbutton";
                            rectangle2.fill = linearGradient;
                            rectangle2.stroke = DarkGray;
                            rectangle2.strokeWidth = 2.0;
                            rectangle2.width = 100.0;
                            rectangle2.height = 20.0;
                            rectangle2.arcWidth = 5.0;
                            rectangle2.arcHeight = 5.0;
                            label6.visible = true;
                            __layoutInfo_label6.width = 100.0;
                            __layoutInfo_label6.height = 20.0;
                            label6.onMouseClicked = label6OnMouseClickedAtShown;
                            label6.text = "View";
                            label6.font = Arial_Bold_12;
                            label6.hpos = javafx.geometry.HPos.CENTER;
                            group.visible = true;
                        }
                    }
                ]
            }
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            label2.visible = true;
                            label2.layoutX = 37.0;
                            label2.layoutY = 51.0;
                            label2.text = "View Cheque Transactions";
                            label2.font = Arial_18;
                            label2.textFill = Green;
                            separator.visible = true;
                            separator.layoutX = 37.0;
                            separator.layoutY = 75.0;
                            __layoutInfo_separator.height = 5.0;
                            labelIssued_To_In_Favour_of.font = Arial_12;
                            txtChequeNum.onKeyPressed = txtChequeNumOnKeyPressed;
                            labelAccount_Number.text = "Account Number";
                            labelName_of_Bank.text = "Name of Bank";
                            cboAcNo.visible = true;
                            txtClearedDate.visible = true;
                            txtClearedDate.editable = true;
                            imgClearedDate.visible = false;
                            imgClearedDate.layoutY = 81.0;
                            imgClearedDate.image = null;
                            label7.layoutY = 81.0;
                            label7.text = "Label";
                            panelpage.visible = false;
                            label3.visible = true;
                            label3.layoutX = 37.0;
                            label3.text = "Cheque Status";
                            label3.font = Arial_12;
                            label3.textFill = DarkGray;
                            chkViewStatus.visible = true;
                            chkViewStatus.layoutX = 130.0;
                            __layoutInfo_chkViewStatus.width = 120.0;
                            chkViewStatus.onKeyPressed = chkViewStatusOnKeyPressedAtView;
                            label4.visible = true;
                            label4.layoutX = 306.0;
                            label4.layoutY = 3.0;
                            label4.text = "From";
                            label4.font = Arial_12;
                            label4.textFill = DarkGray;
                            imgViewFrom.visible = true;
                            imgViewFrom.layoutX = 463.0;
                            imgViewFrom.layoutY = 0.0;
                            imgViewFrom.onKeyPressed = imgViewFromOnKeyPressedAtView;
                            imgViewFrom.onMouseClicked = imgViewFromOnMouseClickedAtView;
                            imgViewFrom.image = imageCalendar;
                            txtViewFrom.visible = true;
                            txtViewFrom.layoutX = 360.0;
                            txtViewFrom.layoutY = 0.0;
                            __layoutInfo_txtViewFrom.width = 100.0;
                            txtViewFrom.onKeyPressed = txtViewFromOnKeyPressedAtView;
                            txtViewFrom.editable = false;
                            label5.visible = true;
                            label5.layoutX = 520.0;
                            label5.layoutY = 0.0;
                            label5.text = "To";
                            label5.font = Arial_12;
                            label5.textFill = DarkGray;
                            imgViewTo.visible = true;
                            imgViewTo.layoutX = 655.0;
                            imgViewTo.layoutY = 0.0;
                            imgViewTo.onKeyPressed = imgViewToOnKeyPressedAtView;
                            imgViewTo.onMouseClicked = imgViewToOnMouseClickedAtView;
                            imgViewTo.image = imageCalendar;
                            txtViewTo.visible = true;
                            txtViewTo.layoutX = 550.0;
                            txtViewTo.layoutY = 0.0;
                            __layoutInfo_txtViewTo.width = 100.0;
                            txtViewTo.onKeyPressed = txtViewToOnKeyPressedAtView;
                            txtViewTo.editable = false;
                            btnSearch.visible = true;
                            btnSearch.layoutX = 690.0;
                            btnSearch.layoutY = 0.0;
                            __layoutInfo_btnSearch.width = 70.0;
                            __layoutInfo_btnSearch.height = 30.0;
                            btnSearch.onKeyPressed = btnSearchOnKeyPressedAtView;
                            btnSearch.text = "GO";
                            btnSearch.action = btnSearchActionAtView;
                            panelView.visible = true;
                            panelView.layoutY = 95.0;
                            __layoutInfo_panelView.width = 787.0;
                            __layoutInfo_panelView.height = 30.0;
                            btnSave.visible = false;
                            btnEdit.visible = false;
                            btnEdit.action = btnEditActionAtView;
                            btnReset.visible = true;
                            btnCancel.visible = false;
                            imageView2.visible = true;
                            imageView2.image = imageBack;
                            btnBack.visible = true;
                            btnBack.text = "Back [Ctrl+Left]";
                            btnBack.font = Arial_Bold_14;
                            btnBack.action = btnBackActionAtView;
                            panelButtons.visible = true;
                            listView.visible = false;
                            listView.layoutY = 130.0;
                            __layoutInfo_listView.width = 716.0;
                            __layoutInfo_listView.height = 350.0;
                            labelRecordCount.visible = true;
                            labelRecordCount.layoutX = 20.0;
                            labelRecordCount.font = Arial_Bold_16;
                            labelRecordCount.textFill = Green;
                            panelDate.blocksMouse = true;
                            rectangle2.visible = false;
                            rectangle2.styleClass = "";
                            rectangle2.fill = javafx.scene.paint.Color.BLACK;
                            rectangle2.stroke = null;
                            rectangle2.strokeWidth = 1.0;
                            rectangle2.width = 100.0;
                            rectangle2.height = 50.0;
                            rectangle2.arcWidth = 0.0;
                            rectangle2.arcHeight = 0.0;
                            label6.visible = false;
                            label6.text = "Label";
                            label6.hpos = javafx.geometry.HPos.LEFT;
                            group.visible = false;
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

    function btnBackActionAtView(): Void {
        back();
    }

    function txtAmountOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function txtIssuedDateOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function cboParticularsOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        cboParticulars.show();
    }

    function cboParticularsOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_DOWN) {
            cboParticulars.show();
        }
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            imgIssuedDate.requestFocus();
        } shortcut(event);
    }

    function txtChequeNumOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            cboStatus.requestFocus();
        }
        txtChequeNum.style = mandatory;
    }

    function txtAmountOnKeyTyped(event: javafx.scene.input.KeyEvent): Void {
        if (NumberUtils.isNumeric(txtAmount)) {
            txtAmount.style = mandatory;
        }
        shortcut(event);
    }

    function txtAmountOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB) {
            btnSave.requestFocus();
        } else if (event.code == KeyCode.VK_ENTER) {
            btnSave.requestFocus();
        }
    }

    function txtChequeNumOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function chkViewStatusOnKeyPressedAtView(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_DOWN) {
            chkViewStatus.show();
        }
        shortcut(event);
    }

    function txtViewToOnKeyPressedAtView(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function txtViewFromOnKeyPressedAtView(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function btnSearchOnKeyPressedAtView(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            btnSearchActionAtView();
        }
        shortcut(event);
    }

    function btnSearchActionAtView(): Void {
        var sdf = new SimpleDateFormat("dd-MM-yyyy");
        try {
            var txtFromDate1 = txtViewFrom.rawText; if (txtFromDate1 != null and txtFromDate1 != "") { txtFromDate1 = DateUtils.changeFormatDate(sdf.parse(txtFromDate1.trim())); } else { txtFromDate1 = null; }
            var txtToDate1 = txtViewTo.rawText; if (txtToDate1 != null and txtToDate1 != "") { txtToDate1 = DateUtils.changeFormatDate(sdf.parse(txtToDate1.trim())); } else { txtToDate1 = null; }
            var chkViewStatus1 = chkViewStatus.selectedItem.toString();
            recordVal="No Records Found";
            recordVal=chequeTxnTable.searchChequeTransactionValues(chkViewStatus1, txtFromDate1, txtToDate1);
        } catch (e: Exception) {
            var msg: String = "Class : chequeTxn  Method : btnSearchActionAtView()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    def kr = KeyRegistry {};
    var key = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 5 and CommonDeclare.form[4] == 9) {
            shortcut(key);
        }
    }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == kr.save and btnSaveName == "Save [F3]") {
            saveClick();
        }
        if (event.code == kr.update and btnSaveName == "Update [F7]") {
            saveClick();
        }
        if (event.code == kr.edit and btEditName == "Edit [F6]") {
            edit();
        }
        if (event.code == kr.reset and btnReset.text == "Reset [F4]") {
            btnResetAction();
        }
        if (event.code == kr.del and btEditName == "Edit [F6]") {
        //-   deleteClick();
        }
        if (event.code == KeyCode.VK_F4) {
            edit();
        }
        if (event.controlDown == true and event.code == kr.back) {
            if (btEditName == "Back [Ctrl+Left]") { back(); }
        }
        if (event.code == kr.cancel) {
            if (btnCancel.text == "Cancel [F8]") { panel.visible = false; }
        }
    }

    function imgViewToOnKeyPressedAtView(event: javafx.scene.input.KeyEvent): Void {
        ToDateClick();
        shortcut(event);
    }

    function imgViewToOnMouseClickedAtView(event: javafx.scene.input.MouseEvent): Void {
        ToDateClick();
    }

    function imgViewFromOnKeyPressedAtView(event: javafx.scene.input.KeyEvent): Void {
        fromDateClick();
    }

    function fromDateClick(): Void {
        try {
            panelDate.visible = true;
            if (not curDateFlag) {
                panelCalenderLX = txtViewFrom.layoutX;
                panelCalenderLY = txtViewFrom.layoutY + txtViewFrom.height + 2.0;
                if (txtViewFrom.rawText.trim() != null) {
                    var dat = txtViewFrom.rawText.trim().split("-");
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
                curDateFlag3 = true;
            } else {
                fxCalendar.visible = false;
            }

        } catch (e: Exception) {
            var msg: String = "Class : chequeTxn  Method : fromDateClick()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function ToDateClick(): Void {
        try {
            panelDate.visible = true;
            if (not curDateFlag) {
                panelCalenderLX = txtViewTo.layoutX;
                panelCalenderLY = txtViewTo.layoutY + txtViewTo.height + 2.0;
                if (txtViewTo.rawText.trim() != null) {
                    var dat = txtViewTo.rawText.trim().split("-");
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
                curDateFlag4 = true;
            } else {
                fxCalendar.visible = false;
            }

        } catch (e: Exception) {
            var msg: String = "Class : chequeTxn  Method : ToDateClick()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function imgViewFromOnMouseClickedAtView(event: javafx.scene.input.MouseEvent): Void {
        fromDateClick();
    }

    function btnCancelAction(): Void {
        panel.visible = false;
    }

    function btnResetAction(): Void {
        if (btEditName == "Back [Ctrl+Left]") {
            viewClear();
        } else {
            clearAll();
        }
    }

    public function back(): Void {
        EditW = bottonW + 10;
        imgEdit.image = imageEdit;
        imgCancel.image = imageCancel;
        currentState.actual = currentState.findIndex("Shown");
        panelTableLY = 230.0;
        clearAll();
        setTableLay();
    }

    public function view(): Void {
        currentState.actual = currentState.findIndex("View");
        viewTableLayout();
        recordVal=chequeTxnTable.loadChequeTransactionValues(15);
        viewClear();
        btEditName = "Back [Ctrl+Left]";
        imgEdit.image = imageBack;
    }

    function label6OnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        view();
    }

    function cboStatusOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        cboStatus.show();
    }

    public function setTableLay(): Void {
        chequeTable.layoutX = 0.0;
        chequeTable.layoutY = 0.0;
        panelTable.content = [chequeTable,];
        TableH = 230.0;
        chequeTxnTable.addBasicRows();
        recordVal=chequeTxnTable.loadChequeTransactionValues(10);
        cboTxnType.requestFocus();
    }

    function saveClick(): Void {
        try {

            var sql: String = "";

            var chqTxnModel = validation();
           
            var validChq: Integer = 0; validChq = chqTxnConttroller.getValidChequeNo(cboAcNo.selectedItem.toString(), txtChequeNum.rawText.trim());  // Controller Call
            if (chqTxnConttroller.chequeNoAlreadyExists(txtChequeNum.rawText.trim(), cheque_id) == 1) {   // Controller Call
                FXinfo("Cheque No already Exists");
            } else if (cboTxnType.selectedItem.equals("Payable") and validChq == 0) {
                FXinfo("Invalid Cheque No");
            } else if (chqTxnModel.isReturnFlag()) {
                var sdf = new SimpleDateFormat("dd-MM-yyyy");
                if (chqTxnModel.getBankName() != null and chqTxnModel.getBankName() != "") { chqTxnModel.setBankName(txtBankName.rawText.trim().replaceAll("'", "")); }
                var txtFavour1 = txtFavour.rawText; if (chqTxnModel.getIssuedTo() != null and chqTxnModel.getIssuedTo() != "") { chqTxnModel.setIssuedTo(txtFavour.rawText.trim().replaceAll("'", "")); }
                if (chqTxnModel.getIssuedDate() != null and chqTxnModel.getIssuedDate() != "") { chqTxnModel.setIssuedDate(DateUtils.changeFormatDate(sdf.parse(txtIssuedDate.rawText.trim()))); } else { chqTxnModel.setIssuedDate(null); }
                if (chqTxnModel.getDepositDate() != null and chqTxnModel.getDepositDate() != "") { chqTxnModel.setDepositDate(DateUtils.changeFormatDate(sdf.parse(txtDepositedDate.rawText.trim()))); } else { chqTxnModel.setDepositDate(null); }
                if (chqTxnModel.getClearedDate() != null and chqTxnModel.getClearedDate() != "") { chqTxnModel.setClearedDate(DateUtils.changeFormatDate(sdf.parse(txtClearedDate.rawText.trim()))); } else { chqTxnModel.setClearedDate(null); }
                var flagValue = 0;
                var paid_flag: Integer = 0;

                if (cboStatus.selectedItem.equals("Cleared")) {
                    paid_flag = 0; flagValue = 0; chqTxnConttroller.chequeTransactionClosingBalanceCalculation(chqTxnModel); // Controller Call
                } else if (cboStatus.selectedItem.equals("Returned")) {
                    flagValue = 1;
                } else if (cboStatus.selectedItem.equals("Cancelled")) {
                    flagValue = 2;
                } else if (cboStatus.selectedItem.equals("Stop Payment")) {
                    flagValue = 3;
                } else if (cboStatus.selectedItem.equals("Misused")) {
                    flagValue = 4;
                } else if (cboStatus.selectedItem.equals("Lost")) {
                    flagValue = 5;
                } else if (cboStatus.selectedItem.equals("In Progress")) {
                    flagValue = 6;
                }
                chqTxnModel.setFlagValue(flagValue);
                chqTxnModel.setPaidFlag(paid_flag);
                if (btnSaveName == "Save [F3]") {
                    var returnObject = new Object();
                    chqTxnModel.setSaveType("save");
                    returnObject = chqTxnConttroller.createRecord(chqTxnModel); // controller call
                    var msgReturnModel: MsgReturnModel = new MsgReturnModel();
                    msgReturnModel = returnObject as MsgReturnModel;
                    if (msgReturnModel.getReturnMessage() == "0") {
                        FXalert(0);
                        clearAll();
                        TableH = 230.0;

                    } else {
                        FXinfo(msgReturnModel.getReturnMessage());
                    }

                } else {
                       var cn:ConfirmDialogBox=new ConfirmDialogBox(0,"Cheque Transaction");
                            var a =bind cn.staus;
                                    if (a) {

                                        var returnObject = new Object();
                                        chqTxnModel.setSaveType("update");
                                        chqTxnModel.setChequeID(cheque_id);
                                        returnObject = chqTxnConttroller.createRecord(chqTxnModel); // controller call
                                        var msgReturnModel: MsgReturnModel = new MsgReturnModel();
                                        msgReturnModel = returnObject as MsgReturnModel;
                                        if (msgReturnModel.getReturnMessage() == "0") {
                                            FXalert(4);
                                            clearAll();
                                            TableH = 230.0;

                                        } else {
                                            FXinfo(msgReturnModel.getReturnMessage());
                                        }
                                    }

                }
            }
        } catch (e: Exception) {
            var msg: String = "Class : chequeTxn  Method : saveClick()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function validation(): ChequeTransactionModel {
        var n: Integer = 0;
        var chqTxnModel = new ChequeTransactionModel();
        try {

            var paidAmount = 0.0;
            if (txtAmount.rawText != null and txtAmount.rawText != "") {
                paidAmount = Double.parseDouble(txtAmount.rawText);
            }
            chqTxnModel.setReturnFlag(false);
            chqTxnModel.setAmount(paidAmount);
            chqTxnModel.setTransactionType(cboTxnType.selectedItem.toString());
            chqTxnModel.setChequeNumber(txtChequeNum.rawText);
            chqTxnModel.setIssuedDate(txtIssuedDate.rawText);
            chqTxnModel.setParticulars(cboParticulars.selectedItem.toString());
            chqTxnModel.setIssuedTo(txtFavour.rawText);
            chqTxnModel.setBankName(txtBankName.rawText);
            chqTxnModel.setDepositDate(txtDepositedDate.rawText);
            chqTxnModel.setClearedDate(txtClearedDate.rawText);
            chqTxnModel.setChequeStatus(cboStatus.selectedItem.toString());
            chqTxnModel.setAccountNumber(cboAcNo.selectedItem.toString());
            // chqTxnModel.s
            if (cboTxnType.selectedItem == null or cboTxnType.selectedItem == "-- Select --") {
                FXinfo("Please Select Cheque Type");
                cboTxnType.requestFocus();
            } else if (cboAcNo.selectedItem == null or cboAcNo.selectedItem == "-- Select --") {
                FXinfo("Please Select Account No");
                cboAcNo.requestFocus();
            } else if (txtChequeNum.rawText == null or txtChequeNum.rawText == "" or txtChequeNum.rawText.length() == 0) {
                FXinfo("Please Enter Valid Cheque no", txtChequeNum);
            } else if (cboStatus.selectedItem == null or cboStatus.selectedItem == "-- Select --") {
                FXinfo("Please Select Transaction Status");
                cboStatus.requestFocus();
            } else if (txtIssuedDate.rawText == null or txtIssuedDate.rawText == "" or txtIssuedDate.rawText.length() == 0) {
                FXinfo("Please Enter Issued Date");
                imgIssuedDate.requestFocus();
            } else if (cboParticulars.selectedItem == null or cboParticulars.selectedItem == "-- Select --") {
                FXinfo("Please Select Particulars");
                cboParticulars.requestFocus();
            } else if (txtFavour.rawText == null or txtFavour.rawText == "" or txtFavour.rawText.length() == 0) {
                FXinfo("Please Enter Payee", txtFavour);
            } else if (txtAmount.rawText == null or txtAmount.rawText == "" or txtAmount.rawText.length() == 0 or paidAmount <= 0) {
                FXinfo("Please Enter Amount", txtAmount);
            } else {
                chqTxnModel.setReturnFlag(true);

            }

        } catch (e: Exception) {
            var msg: String = "Class : chequeTxn  Method : validation()   = {e.getMessage()}";
            log.debug(msg);
        }
        return chqTxnModel;
    }

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("ChequeTxn", type);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("ChequeTxn", msg);
        showAlertbox();
    }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("ChequeTxn", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = error;
    }

    function btnSaveAction(): Void {
        try {
            saveClick();
        } catch (e: Exception) {
            var msg: String = "Class : chequeTxn  Method : imgClearedDateOnMouseClicked()   = {e.getMessage()}";
            log.debug(msg);
        } }

    function cboAcNoOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_DOWN) {
            cboAcNo.show();
        }
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            cboTxnType.requestFocus();
        }
        shortcut(event);
    }

    function cboAcNoOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        cboAcNo.show();
    }

    function imgClearedDateOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        clearDateClick(); shortcut(event);
    }

    function imgDepositedDateOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        depositClick(); shortcut(event);
    }

    function imgIssuedDateOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        if (event.code == KeyCode.VK_ENTER) {
            issuedDateclick();
        } shortcut(event);
    }

    function btnCancelOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        if (event.code == KeyCode.VK_TAB) {

            txtChequeNum.requestFocus();
        } else if (event.code == KeyCode.VK_ENTER) {
            btnCancelAction();
        } shortcut(event);
    }

    function btnResetOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        if (event.code == KeyCode.VK_TAB) {

            btnCancel.requestFocus();
        } else if (event.code == KeyCode.VK_ENTER) {
            clearAll();
        } shortcut(event);
    }

    function btnEditOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        if (event.code == KeyCode.VK_TAB) {

            btnReset.requestFocus();
        } else if (event.code == KeyCode.VK_ENTER) {

        } shortcut(event);
    }

    function btnSaveOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        if (event.code == KeyCode.VK_TAB) {

            btnEdit.requestFocus();
        } else if (event.code == KeyCode.VK_ENTER) {
            saveClick();
        } shortcut(event);
    }

    function txtFavourOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        txtFavour.style = mandatory;
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {

            txtAmount.requestFocus();
        }
        shortcut(event);

    }

    function txtClearedDateOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {

            txtFavour.requestFocus();
        }
        shortcut(event);
    }

    function txtDepositedDateOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtClearedDate.requestFocus();
        }
        shortcut(event);
    }

    function cboStatusOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_DOWN) {
            cboStatus.show();
        }
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            cboParticulars.requestFocus();
        } shortcut(event);
    }

    function txtIssuedDateOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        txtIssuedDate.style = mandatory;
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            cboStatus.requestFocus();
        } shortcut(event);
    }

    function txtBankNameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            imgIssuedDate.requestFocus();
        } shortcut(event);
    }

    function cboTxnTypeOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_DOWN) {
            cboTxnType.show();
        }
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            cboAcNo.requestFocus();
        } shortcut(event);
    }

    function cboTxnTypeOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        cboTxnType.show();
    }

    function txtChequeNumOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        txtChequeNum.style = mandatory;
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {

            cboStatus.requestFocus();
        } shortcut(event);

    }

    function clearDateClick(): Void {
        try {
            panelDate.visible = true;
            if (not curDateFlag) {
                panelCalenderLX = txtClearedDate.layoutX;
                panelCalenderLY = txtClearedDate.layoutY + txtClearedDate.height + 2.0;

                if (txtClearedDate.rawText.trim() != null) {
                    var dat = txtClearedDate.rawText.trim().split("-");
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
                curDateFlag2 = true;
            } else {
                fxCalendar.visible = false;
            }

        } catch (e: Exception) {
            var msg: String = "Class : chequeTxn  Method : imgClearedDateOnMouseClicked()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function imgClearedDateOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        clearDateClick();
    }

    function depositClick(): Void {
        try {
            panelDate.visible = true;
            if (not curDateFlag) {
                panelCalenderLX = txtDepositedDate.layoutX;
                panelCalenderLY = txtDepositedDate.layoutY + txtDepositedDate.height + 2.0;
                if (txtDepositedDate.rawText.trim() != null) {
                    var dat = txtDepositedDate.rawText.trim().split("-");
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
                curDateFlag1 = true;
            } else {
                fxCalendar.visible = false;
            }
        } catch (e: Exception) {
            var msg: String = "Class : chequeTxn  Method : imgDepositedDateOnMouseClicked()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function imgDepositedDateOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        depositClick();
    }

    function issuedDateclick(): Void {
        try {
            panelDate.visible = true;
            if (not curDateFlag) {
                panelCalenderLX = txtIssuedDate.layoutX;
                panelCalenderLY = txtIssuedDate.layoutY + txtIssuedDate.height + 2.0;
                if (txtIssuedDate.rawText.trim() != null) {
                    var dat = txtIssuedDate.rawText.trim().split("-");
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
                curDateFlag = true;
            } else {
                fxCalendar.visible = false;
            }

        } catch (e: Exception) {
            var msg: String = "Class : chequeTxn  Method : imgIssuedDateOnMouseClicked()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function displayChequeTransactionDetails(ss_no: String): Void {
        try {
            cboTxnType.disable = true;
            cboAcNo.disable = true;
            btnEdit.disable = true;
            var parti: String = "";
            
             var chqTxnModel = new ChequeTransactionModel();
             chqTxnModel=chqTxnConttroller.displayChequeTransactionDetails(ss_no);
                cheque_id = chqTxnModel.getChequeID();
                txtIssuedDate.text =chqTxnModel.getIssuedDate();

                txtDepositedDate.text = chqTxnModel.getDepositDate();
                TxnType[0] =chqTxnModel.getTransactionType();
                Status[0] =chqTxnModel.getChequeStatus();
                AccountNo[0] =chqTxnModel.getAccountNumber();
                bankName =chqTxnModel.getBankName();
                parti =chqTxnModel.getParticulars();

                txtClearedDate.text = chqTxnModel.getClearedDate();
                txtFavour.text = chqTxnModel.getIssuedTo();
                txtAmount.text =chqTxnModel.getAmount().toString();
                txtChequeNum.text = chqTxnModel.getChequeNumber();

            if (parti.equals("Receipt")) {
                particulars = ["Receipt"];
            } else {
                particulars = ["Payment", "Shop Maintenance"];
            }
            cboTxnType.select(0);
            cboAcNo.select(0);
            cboStatus.select(0);
            cboParticulars.select(0);
        } catch (e: Exception) {
            var msg: String = "Class :ChequeTxn  Method  : displayChequeTransactionDetails()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function edit(): Void {
        try {
            if (btEditName == "Edit [F6]") {
                if (chequeTxnTable.rowselt != "-1") {
                    setTableLay();
                    mandatory_textboxes();
                    btnSaveName = "Update [F7]";
                    btEditName = "Edit [F6]";
                    displayChequeTransactionDetails(chequeTxnTable.rowselt);
                } else {
                    FXinfo("Please Select  Editing Row");
                }
            } else {
            }
        } catch (e: Exception) {
            var msg: String = "Class :ChequeTxn  Method  : edit()   = {e.getMessage()}";
            log.debug(msg);
        }

    }

    function imgIssuedDateOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        issuedDateclick();
    }

    function deleteClick(): Void {
        try {
         var cn:ConfirmDialogBox=new ConfirmDialogBox(1,"Cheque Transaction");
                            var a =bind cn.staus;
                            if (a) {
                               
                                 var returnObject: Boolean = false;
                                returnObject = chqTxnConttroller.deleteRecord(cheque_id); // controller call
                                 FXalert(5);
                                clearAll();
                            }


        } catch (e: Exception) {
            var msg: String = "Class :ChequeTransaction  Method  : Edit [F6] Click   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function btnEditActionAtShown(): Void {
        if (btEditName == "Edit [F6]") {
            edit();
        } else {
            deleteClick()
        }
    }

    function btnEditActionAtView(): Void {
        back();
    //   currentState.actual = currentState.findIndex("Shown");
    }

    function getChqNo(): Void {
        if (btnSaveName != "Update [F7]") {
            if (chequeType.equals("Payable")) {
                     txtChequeNum.text="";
                if (accountVaue != "-- Select --") {
                //-  txtChequeNum.text=GetInformation.getChqueNo(accountVaue);
                }
                particulars = ["-- Select --", "Payment", "Shop Maintenance"];
            } else if (chequeType.equals("-- Select --")) {
                //-  txtChequeNum.text="";

                particulars = ["-- Select --", "Payment", "Receipt", "Shop Maintenance"];
            } else {
                //- txtChequeNum.text="";
                txtChequeNum.editable = true;
                particulars = ["Receipt"];
            }
            cboParticulars.select(0);
        }
    }

    var bankName = "";
    var accountVaue = bind cboAcNo.selectedItem.toString() on replace {

        bankName = comObj.getAccountNoBankName(accountVaue); // Controller Call
        getChqNo();

    }
    var chequeType = bind cboTxnType.selectedItem.toString() on replace {
        getChqNo();
    }
    var visit = bind fxCalendar.visible on replace {
        if (curDateFlag and not visit) {
            getDate(0);
        } else if (curDateFlag1 and not visit) {
            getDate(1);
        } else if (curDateFlag2 and not visit) {
            getDate(2);
        } else if (curDateFlag3 and not visit) {
            getDate(3);
        } else if (curDateFlag4 and not visit) {
            getDate(4);
        }
    };

    function getDate(i: Integer) {
        if (i == 0) {
            txtIssuedDate.text = fxCalendar.getSelectedDate();
            curDateFlag = false;
            curDateFlag1 = false;
            curDateFlag2 = false;
            curDateFlag3 = false;
            curDateFlag4 = false;
            imgDepositedDate.requestFocus();
        } else if (i == 1) {
            txtDepositedDate.text = fxCalendar.getSelectedDate();
            curDateFlag = false;
            curDateFlag1 = false;
            curDateFlag2 = false;
            curDateFlag3 = false;
            curDateFlag4 = false;
            imgClearedDate.requestFocus();
        } else if (i == 2) {
            txtClearedDate.text = fxCalendar.getSelectedDate();
            curDateFlag = false;
            curDateFlag1 = false;
            curDateFlag2 = false;
            curDateFlag3 = false;
            curDateFlag4 = false;
            txtFavour.requestFocus();
        } else if (i == 3) {
            txtViewFrom.text = fxCalendar.getSelectedDate();
            curDateFlag = false;
            curDateFlag1 = false;
            curDateFlag2 = false;
            curDateFlag3 = false;
            curDateFlag4 = false;
        } else if (i == 4) {
            txtViewTo.text = fxCalendar.getSelectedDate();
            curDateFlag = false;
            curDateFlag1 = false;
            curDateFlag2 = false;
            curDateFlag3 = false;
            curDateFlag4 = false;
            btnSearch.requestFocus();
        }

    }

    public function viewClear(): Void {
        Status[0] = "";
        txtViewFrom.text = "";
        txtViewTo.text = "";
       recordVal=chequeTxnTable.loadChequeTransactionValues(15);
    }

    public function clearAll(): Void {
        txtChequeNum.text = "";
        cboTxnType.select(0);
        cboAcNo.select(0);
        cboStatus.select(0);
        cboParticulars.select(0);
        Status = ["-- Select --", "Cleared", "Returned", "Cancelled", "Stopped Payment", "Misused", "Lost", "In Progress"];
        TxnType = ["-- Select --", "Payable", "Receivable"];

        AccountNo = comObj.getAccountNumbers().toArray(); // Controller Call
        bankName = "";
        txtIssuedDate.text = "";
        txtDepositedDate.text = "";
        txtClearedDate.text = "";
        txtFavour.text = "";
        txtAmount.text = "";
        bankName = "";
        mandatory_textboxes();
        cboTxnType.requestFocus();
        btnSaveName = "Save [F3]";
        btEditName = "Edit [F6]";
        recordVal=chequeTxnTable.loadChequeTransactionValues(10);
        cheque_id = 0;
        chequeTxnTable.rowselt = "-1";
        txtChequeNum.text = "";
        cboTxnType.disable = false;
        cboAcNo.disable = false;
        particulars = ["-- Select --", "Payment", "Receipt", "Shop Maintenance"];
        btnEdit.disable = false;
    }

    function viewTableLayout(): Void {
        clearAll();
        chequeTable.layoutX = 0;
        chequeTable.layoutY = 0;
        panelTableLY = 130.0;
        TableH = 350.0;
        chkViewStatus.select(0);
        EditW = bottonW + 50;
    }

    function mandatory_textboxes(): Void {
        txtChequeNum.style = mandatory;
        txtIssuedDate.style = mandatory;
        txtFavour.style = mandatory;
        txtAmount.style = mandatory;
    }

    public function updateValues(): Void {
        try {
            if (btEditName == "Back [Ctrl+Left]") {
                currentState.actual = currentState.findIndex("Shown");
                btnSaveName = "Update [F7]";
                btEditName = "Edit [F6]";
                EditW = bottonW + 10;
                imgEdit.image = imageEdit;
                imgCancel.image = imageCancel;
                setTableLay();
                panelTableLY = 230.0;
                TableH = 230.0;
            }
            if (btnSaveName == "Update [F7]") {
                if (chequeTxnTable.rowselt != "-1") {
                    displayChequeTransactionDetails(chequeTxnTable.rowselt);
                    chequeTxnTable.rowselt = "-1";
                }
            }
        } catch (e: Exception) {
            var msg: String = "Class :Cheque Transaction  Method  : updateValues()  = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function getPrivileges(u: String): Void {
        var uname = u;

        var utype = comObj.getUserType(uname); // Controller Call

        if (utype.equals("User")) {
            var priv = comObj.getPrivileges("financial", uname);  // Controller Call
            var ss = priv.split(",");
            var val = Integer.parseInt(ss[8]);
            if (val == 1) {
                btnSave.disable = true;
                if (btnEdit.text != "Edit [F6]") {
                    btnEdit.disable = true;
                } else {
                    btnEdit.disable = false;
                }
            } else if (val == 2) {
                if (btnEdit.text != "Edit [F6]") {
                    btnEdit.disable = true;
                } else {
                    btnEdit.disable = false;
                }
                btnSave.disable = false;
            //This code for  READ and WRITE Access
            } else if (val == 3) {
                btnSave.disable = false;
                btnEdit.disable = false;
            //This code for FULL Access
            }
        } else {
            btnSave.disable = false;
            btnEdit.disable = false;
        }
    }

    var logUser: String = bind CommonDeclare.user on replace {
        getPrivileges(logUser);
    }
    var changPiv = bind btnSave.text on replace {
        getPrivileges(logUser);
    }
    var changPiv1 = bind btnEdit.text on replace {
        getPrivileges(logUser);
    }

    public function StartUp(): Void {
        currentState.actual = currentState.findIndex("Shown");
        panel.visible = true;
        (chequeViewtable as javax.swing.JTable).addMouseListener(MouseAdapter {
            override public function mouseClicked(e: java.awt.event.MouseEvent): Void {
                chequeTxnTable.viewChequeCalculations();
                updateValues();
            }
        });
        fxCalendar.visible = false;
        panelDate.content = [fxCalendar,];
        clearAll();
        setTableLay();
        back();
        TableH = 231;
        cboTxnType.requestFocus();
    }

}
