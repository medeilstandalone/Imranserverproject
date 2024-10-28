package com.vanuston.medeil.ui;

import java.lang.*;
import javafx.scene.image.*;
import javafx.ext.swing.SwingComponent;
import java.awt.Dimension;
import javafx.scene.input.*;
import java.text.SimpleDateFormat;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.Value;
import com.vanuston.medeil.ui.calendar.theme.Theme;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import com.vanuston.medeil.util.CommonDeclare;
import javafx.scene.control.TextBox;
import com.vanuston.medeil.util.KeyRegistry;
import java.awt.event.KeyAdapter;
import java.awt.event.MouseAdapter;
import com.vanuston.medeil.uitables.RecptTable;
import com.vanuston.medeil.uitables.ViewReceiptTable;
import com.vanuston.medeil.model.ReceiptModel;
import com.vanuston.medeil.model.MsgReturnModel;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.uitables.ConfirmDialogBox;

public class Receipt {

    var log: Logger = Logger.getLogger(Receipt.class, "Financial");
    var sar: Integer = 0;
    var sar1: Integer = 0;
    var chequeEditNo: String = "";
    var btnRcptSaveText = "Save [F3]";
    var btnRcptResetText = "Reset [F4]";
    var btnRcptCancelText = "Cancel [F8]";
    var txtCreditAmountText = "0.00";
    var txtDebitAmountText = "0.00";
    var txtTotalBalanceDueText = "0.00";
    var txtRcptBalAmtText = "0.00";
    var txtRcptAmtPaidText = "0.00";
     var comObj : CommonImplements= RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
	
	 
     var receiptController: com.vanuston.medeil.implementation.Receipt=RegistryFactory.getClientStub(RegistryConstants.Receipt) as com.vanuston.medeil.implementation.Receipt;
	   
    var user = bind CommonDeclare.user;
    var curDateFlag: Boolean = false;
    var curDateFlag1: Boolean = false;
    var TableH = 216.0;
    var TableW = bind (95.29860229 * panelW) / 100 on replace { changeTableSize(TableW); };
    var fxCalendar = FXCalendar {
                theme: Theme {};
            };
    var today = DateUtils.now("dd-MM-yyyy");
    var recptTable = new RecptTable();
    var reciptTable = recptTable.createTable();
    var viewReceiptTable = new ViewReceiptTable();
    var receiptTableComp = SwingComponent.wrap(recptTable.getScrollTable(reciptTable));
    var ReceiptChargerViewTable = viewReceiptTable.createTable();
    var ReceiptCharTab = SwingComponent.wrap(viewReceiptTable.getScrollTable(ReceiptChargerViewTable));
    var RecepNoId: String = "";
    var panelW = bind CommonDeclare.panelFormW;
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
    var botton21LX = bind CommonDeclare.botton2LX - 15;
    var botton22LX = bind CommonDeclare.botton3LX + 35;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    var bottonW = bind CommonDeclare.bottonW;//bind (16.5184*panelW)/100;
    var bottonH = bind CommonDeclare.bottonH;
    var rectbuttonLX = bind RemoveRowLX;
    var CancelW = bottonW;
    var rectbuttonLY = bind CommonDeclare.rectbuttonLY;
    var seperatorW = bind CommonDeclare.seperatorW;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;//200
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;//150
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;//100
    var Type4TextboxW = bind CommonDeclare.Type4TextboxW;//50
    var ImageCalenderLX = bind C2LX + Type3TextboxW + 2;
    var ImageCalender1LX = bind Type3TextboxW + 2;
    var panelCalenderLX = bind C2LX + Type3TextboxW + 22;
    var panelCalender1LX = bind C4LX + Type3TextboxW + 22;
    var labelSearchLX = bind (23.25285896 * panelW / 100);
    var SearchTextboxLX = bind (labelSearchLX + 100);
    var buttonSearchLX = bind (SearchTextboxLX + Type1TextboxW + 5);
    var TextboxBalancedue = bind (1.524777637 * panelW / 100);
    var TextboxBalance = bind (34.81575604 * panelW / 100);
    var TextboxPaid = bind (68.10673443 * panelW / 100);
    var TextboxBottomLY = bind (73.39449541 * panelH / 100);
    var panelTableLX = bind (panelW - TableW) / 2;
    var panelTableLY = bind (29.35779817 * panelH / 100);
    var panelTableViewLY = 120.0;
    var RemoveRowLX = bind ((panelW + TableW) / 2) - 120;
    var RemoveRowLY = bind panelTableLY + TableH;
    var TableViewH = 350.0;
    var AmtTextW = bind 40.66073698 * panelW / 100;
    var panelviewTableLY = bind (23.85321101 * panelH / 100);
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    var mandatory = CommonDeclare.textbox_mandatory();
    var error = CommonDeclare.textbox_error();
    var listH = 0.0;
    var listW = Type2TextboxW;
    def CustomAlert = CustomAlert {};
    var accountNos=comObj.getChequeNumbers("Receipt").toArray();
    var chqDetails;

    var chqAmt: String = "";

    function changeTableSize(i: Integer): Void {
        receiptTableComp.getJComponent().setPreferredSize(new Dimension(i, TableH));
        ReceiptCharTab.getJComponent().setPreferredSize(new Dimension(i, TableViewH));
    }
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def label17: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind labelSearchLX
        layoutY: 119.0
        text: "Label"
    }
    
    def __layoutInfo_txtReceiptno: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtReceiptno: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind SearchTextboxLX
        layoutY: 113.0
        layoutInfo: __layoutInfo_txtReceiptno
    }
    
    public-read def imageView7: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnSearch: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnSearch: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind buttonSearchLX+30
        layoutY: 92.0
        layoutInfo: __layoutInfo_btnSearch
        graphic: imageView7
        text: "Button"
    }
    
    public-read def imageView6: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnViewAll: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnViewAll: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton22LX
        layoutY: bind panelButtonsLY
        layoutInfo: __layoutInfo_btnViewAll
        graphic: imageView6
        text: "Button"
    }
    
    public-read def panelTableView: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelTableLX
        layoutY: bind panelTableViewLY
    }
    
    public-read def rectTableBorder1: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind panelTableLX
        layoutY: bind panelTableViewLY
        styleClass: "rectTableBorder"
        width: bind TableW
        height: bind TableViewH
    }
    
    public-read def imageView5: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnBack: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW+50
        height: bind bottonH
    }
    public-read def btnBack: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton21LX
        layoutY: bind panelButtonsLY
        layoutInfo: __layoutInfo_btnBack
        onKeyReleased: btnBackOnKeyReleased
        graphic: imageView5
        text: "Button"
    }
    
    def __layoutInfo_listCustomer: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listCustomer: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind SearchTextboxLX
        layoutY: 126.0
        layoutInfo: __layoutInfo_listCustomer
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    public-read def txtHiddenRec: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 518.0
        layoutY: 13.0
    }
    
    def __layoutInfo_labelMsg: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW-panelTableLX
    }
    public-read def labelMsg: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind panelTableLX
        layoutY: bind panelButtonsLY-18
        layoutInfo: __layoutInfo_labelMsg
        text: "Label"
    }
    
    public-read def panelTable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelTableLX
        layoutY: bind panelTableLY
    }
    
    public-read def rectTableBorder: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind panelTableLX
        layoutY: bind panelTableLY
        styleClass: "rectTableBorder"
        width: bind TableW
        height: bind TableH
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imageView4: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imageView2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imgCancel: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtCreditAmount: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtCreditAmount: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 125.0
        layoutY: 21.0
        layoutInfo: __layoutInfo_txtCreditAmount
        styleClass: "Bordetless-text-box"
        text: bind txtCreditAmountText
    }
    
    public-read def panelCrNote: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind TextboxBalancedue
        content: [ label7, txtCreditAmount, ]
    }
    
    public-read def label8: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtDebitAmount: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtDebitAmount: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 120.0
        layoutY: 6.0
        layoutInfo: __layoutInfo_txtDebitAmount
        styleClass: "Bordetless-text-box"
        text: bind txtDebitAmountText
    }
    
    public-read def panelDrNote: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind TextboxBalance
        content: [ label8, txtDebitAmount, ]
    }
    
    def __layoutInfo_cmbRcptype: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def cmbRcptype: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: bind C2LX
        layoutY: 158.0
        layoutInfo: __layoutInfo_cmbRcptype
        onKeyReleased: cmbRcptypeOnKeyReleased
        onMouseExited: cmbRcptypeOnMouseExited
        items: [ "Cash", "Cheque", "DD", "Credit card", "Debit Card", ]
    }
    
    public-read def imageRecDate: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind ImageCalenderLX
        layoutY: 96.0
        blocksMouse: true
    }
    
    public-read def cmboChequeNo: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: 111.0
        layoutY: 112.0
        items: bind accountNos
    }
    
    def __layoutInfo_txtAccCardNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtAccCardNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 66.0
        layoutInfo: __layoutInfo_txtAccCardNo
        onKeyPressed: txtAccCardNoOnKeyPressed
        promptText: "Debit/ Credit/ DD/Cheque No"
    }
    
    public-read def textbox: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 279.0
        layoutY: 142.0
    }
    
    public-read def button: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 179.0
        layoutY: 152.0
        text: "Button"
    }
    
    def __layoutInfo_txtRcptDName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtRcptDName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 126.0
        layoutInfo: __layoutInfo_txtRcptDName
        onKeyPressed: txtRcptDNameOnKeyPressed
        onKeyReleased: txtRcptDNameOnKeyReleased
        promptText: ""
    }
    
    public-read def rectViewReceipts: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind rectbuttonLX
        layoutY: bind rectbuttonLY
        width: 100.0
        height: 50.0
    }
    
    def __layoutInfo_label9: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind rectbuttonLX
        layoutY: bind rectbuttonLY
        layoutInfo: __layoutInfo_label9
        text: "Label"
    }
    
    def __layoutInfo_listCustName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listCustName: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C2LX
        layoutY: 148.0
        layoutInfo: __layoutInfo_listCustName
        onKeyPressed: listCustNameOnKeyPressed
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    public-read def panelCalender: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        blocksMouse: true
    }
    
    public-read def panelCalender1: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        blocksMouse: true
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
    
    def __layoutInfo_txtRcptDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
        hfill: false
    }
    public-read def txtRcptDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 96.0
        layoutInfo: __layoutInfo_txtRcptDate
        style: ""
        styleClass: "text-box"
        onKeyPressed: txtRcptDateOnKeyPressed
        effect: null
        text: ""
        promptText: ""
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtRcptNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtRcptNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 66.0
        layoutInfo: __layoutInfo_txtRcptNo
        text: ""
        promptText: "Auto Generted Code..."
        selectOnFocus: false
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtBankName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtBankName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 112.0
        layoutInfo: __layoutInfo_txtBankName
        onKeyPressed: txtBankNameOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtPayTypeDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtPayTypeDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 135.0
        layoutInfo: __layoutInfo_txtPayTypeDate
        onKeyPressed: txtPayTypeDateOnKeyPressed
        promptText: ""
        font: Arial_12
    }
    
    def __layoutInfo_txtHolderName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtHolderName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: true
        layoutY: 89.0
        layoutInfo: __layoutInfo_txtHolderName
        onKeyPressed: txtHolderNameOnKeyPressed
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
    
    def __layoutInfo_txtTotalBalanceDue: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind AmtTextW
        height: 31.0
    }
    public-read def txtTotalBalanceDue: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind TextboxBalancedue
        layoutY: 10.0
        layoutInfo: __layoutInfo_txtTotalBalanceDue
        styleClass: "Bordetless-text-box"
        text: bind txtTotalBalanceDueText
        promptText: "0.00"
        editable: false
        font: Arial_20
    }
    
    public-read def Arial_Bold_20: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 20.0
    }
    
    public-read def reflectionEffect: javafx.scene.effect.Reflection = javafx.scene.effect.Reflection {
    }
    
    def __layoutInfo_btnRcptCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind CancelW
        height: bind bottonH
    }
    public-read def btnRcptCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton4LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnRcptCancel
        onKeyPressed: btnRcptCancelOnKeyPressed
        onMouseClicked: btnRcptCancelOnMouseClicked
        effect: reflectionEffect
        graphic: imgCancel
        text: bind btnRcptCancelText
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnRcptReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnRcptReset: javafx.scene.control.Button = javafx.scene.control.Button {
        opacity: 0.9
        layoutX: bind botton3LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnRcptReset
        onKeyPressed: btnRcptResetOnKeyPressed
        onMouseClicked: btnRcptResetOnMouseClicked
        effect: reflectionEffect
        graphic: imageView2
        text: bind btnRcptResetText
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnRcptEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnRcptEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton2LX
        layoutInfo: __layoutInfo_btnRcptEdit
        effect: reflectionEffect
        graphic: imageView4
        text: "Edit [F4]"
        font: Arial_Bold_14
        action: btnRcptEditAction
    }
    
    def __layoutInfo_btnRcptSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnRcptSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnRcptSave
        onKeyPressed: btnRcptSaveOnKeyPressed
        onMouseClicked: btnRcptSaveOnMouseClicked
        translateX: 0.0
        effect: reflectionEffect
        graphic: imageView
        text: bind btnRcptSaveText
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    public-read def panelButtons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: bind panelButtonsLY
        content: [ btnRcptSave, btnRcptEdit, btnRcptReset, btnRcptCancel, ]
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
        layoutInfo: __layoutInfo_label
        text: "Receipt - ctrl+E"
        font: Arial_25
        hpos: javafx.geometry.HPos.CENTER
    }
    
    public-read def DarkGray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.2
        blue: 0.2
    }
    
    public-read def label13: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 158.0
        text: "Payment type  "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label11: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 132.0
        text: "Customer Name "
        font: Arial_12
        textFill: DarkGray
    }
    
    def __layoutInfo_label3: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 100.0
        height: 20.0
    }
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind RemoveRowLX
        layoutY: bind RemoveRowLY
        layoutInfo: __layoutInfo_label3
        text: "Remove Row"
        font: Arial_Bold_12
        hpos: javafx.geometry.HPos.CENTER
        textFill: DarkGray
    }
    
    public-read def label16: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 135.0
        text: "ExpiryDate"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label15: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 112.0
        text: "Bank Name"
        font: Arial_12
        textFill: DarkGray
    }
    
    def __layoutInfo_label6: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 163.0
    }
    public-read def label6: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 88.0
        layoutInfo: __layoutInfo_label6
        text: "Holder Name"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 66.0
        text: "Number"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def panelColumn3: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind C3LX-10.0
        layoutY: 0.0
        content: [ label4, label6, label15, label16, ]
    }
    
    public-read def label14: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 66.0
        text: "Receipt No."
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 102.0
        styleClass: "label"
        text: "Date "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        opacity: 1.0
        layoutX: bind TextboxPaid
        layoutY: 477.0
        text: "Amount Paid"
        font: Arial_16
        textFill: DarkGray
    }
    
    public-read def label12: javafx.scene.control.Label = javafx.scene.control.Label {
        opacity: 0.97
        layoutX: bind TextboxBalance
        layoutY: 477.0
        text: "Balance"
        font: Arial_16
        textFill: DarkGray
    }
    
    public-read def label1: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind TextboxBalancedue
        layoutY: 126.0
        text: "Total Balance due "
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
        blocksMouse: true
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
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
    }
    
    public-read def Arial_35: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
        size: 35.0
    }
    
    def __layoutInfo_txtRcptAmtPaid: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind AmtTextW
        height: 44.0
    }
    public-read def txtRcptAmtPaid: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind TextboxPaid
        layoutY: 10.0
        layoutInfo: __layoutInfo_txtRcptAmtPaid
        styleClass: "Bordetless-text-box"
        text: bind txtRcptAmtPaidText
        promptText: "0.00"
        font: Arial_35
    }
    
    def __layoutInfo_txtRcptBalAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind AmtTextW
        height: 44.0
    }
    public-read def txtRcptBalAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: true
        layoutX: bind TextboxBalance
        layoutY: 10.0
        layoutInfo: __layoutInfo_txtRcptBalAmt
        styleClass: "Bordetless-text-box"
        text: bind txtRcptBalAmtText
        promptText: "0.00"
        editable: false
        font: Arial_35
    }
    
    public-read def panelAmtTextboxes: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ label1, label12, label5, txtTotalBalanceDue, txtRcptBalAmt, txtRcptAmtPaid, ]
    }
    
    public-read def panelBottomTextboxes: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: bind TextboxBottomLY
        content: [ panelCrNote, panelDrNote, panelAmtTextboxes, ]
    }
    
    public-read def Yellow: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.8
        blue: 0.2
    }
    
    public-read def rectRemoveRow: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        layoutX: bind RemoveRowLX
        layoutY: bind RemoveRowLY
        onKeyPressed: rectRemoveRowOnKeyPressed
        onMouseClicked: rectRemoveRowOnMouseClicked
        fill: Yellow
        stroke: DarkGray
        strokeWidth: 2.0
        width: 120.0
        height: 20.0
        arcWidth: 10.0
        arcHeight: 10.0
    }
    
    public-read def linearGradientHeader: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
    }
    
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        opacity: 0.25
        styleClass: "rectFormHeader"
        blocksMouse: true
        fill: linearGradientHeader
        width: bind panelW
        height: 32.0
    }
    
    public-read def Font_amt: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 50.0
    }
    
    public-read def imageSave: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Save1.png"
    }
    
    public-read def imageReset: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Reset.png"
    }
    
    public-read def imageCancel: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Cancel.png"
    }
    
    public-read def imageEdit: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Edit.png"
    }
    
    public-read def imageBack: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/arrow_Left.png"
    }
    
    public-read def imageViewAll: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/ViewAll.png"
    }
    
    public-read def imageSearch: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Search.png"
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imageView8: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind Type1TextboxW+C2LX
        layoutY: 81.0
        blocksMouse: true
        image: image
    }
    
    public-read def image2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imageView9: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind SearchTextboxLX+Type1TextboxW
        layoutY: 104.0
        image: image2
    }
    
    public-read def panelView: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ label17, txtReceiptno, imageView9, btnSearch, btnViewAll, panelTableView, rectTableBorder1, btnBack, listCustomer, txtHiddenRec, labelMsg, ]
    }
    
    public-read def imageCalender: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Calender.png"
    }
    
    public-read def imageDate: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind ImageCalender1LX
        layoutY: 135.0
        onKeyPressed: imageDateOnKeyPressed
        onMouseClicked: imageDateOnMouseClicked
        image: imageCalender
    }
    
    public-read def panelColumn4: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind C4LX
        layoutY: 0.0
        content: [ txtHolderName, cmboChequeNo, txtAccCardNo, txtPayTypeDate, txtBankName, imageDate, ]
    }
    
    public-read def panelShown: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        content: [ panelTable, rectTableBorder, panelButtons, panelBottomTextboxes, cmbRcptype, label2, imageRecDate, label14, panelColumn3, panelColumn4, txtRcptNo, txtRcptDate, rectRemoveRow, label3, textbox, button, label11, label13, txtRcptDName, rectViewReceipts, label9, listCustName, panelCalender, panelCalender1, panelAlert, imageView8, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        content: [ rectangle, rectHeader, label, panelView, panelShown, ]
    }
    
    public-read def scene: javafx.scene.Scene = javafx.scene.Scene {
        content: getDesignRootNodes ()
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
                            rectangle.visible = true;
                            rectangle.blocksMouse = true;
                            rectHeader.blocksMouse = true;
                            label17.visible = false;
                            label17.layoutY = 119.0;
                            label17.text = "Label";
                            txtReceiptno.visible = false;
                            txtReceiptno.layoutY = 113.0;
                            imageView9.visible = true;
                            imageView9.layoutY = 104.0;
                            imageView9.blocksMouse = false;
                            imageView7.visible = false;
                            imageView7.image = null;
                            btnSearch.visible = false;
                            btnSearch.text = "Button";
                            imageView6.visible = false;
                            imageView6.image = null;
                            btnViewAll.visible = false;
                            btnViewAll.text = "Button";
                            panelTableView.visible = false;
                            rectTableBorder1.visible = false;
                            imageView5.visible = false;
                            imageView5.image = null;
                            btnBack.visible = false;
                            btnBack.text = "Button";
                            listCustomer.visible = false;
                            listCustomer.layoutY = 126.0;
                            txtHiddenRec.visible = false;
                            labelMsg.visible = false;
                            labelMsg.text = "Label";
                            labelMsg.textFill = javafx.scene.paint.Color.BLACK;
                            panelView.visible = false;
                            panelTable.visible = true;
                            rectTableBorder.visible = true;
                            imageView.visible = true;
                            imageView.image = imageSave;
                            btnRcptSave.layoutY = 0.0;
                            btnRcptSave.onKeyReleased = btnRcptSaveOnKeyReleasedAtShown;
                            imageView4.visible = true;
                            imageView4.image = imageEdit;
                            btnRcptEdit.visible = true;
                            btnRcptEdit.effect = reflectionEffect;
                            btnRcptEdit.text = "Edit [F6]";
                            imageView2.visible = true;
                            imageView2.image = imageReset;
                            btnRcptReset.layoutY = 0.0;
                            imgCancel.visible = true;
                            imgCancel.image = imageCancel;
                            btnRcptCancel.layoutY = 0.0;
                            panelButtons.visible = true;
                            label7.visible = true;
                            label7.text = "Credit Note Amount :";
                            label7.font = Arial_Bold_12;
                            label7.textFill = Green;
                            txtCreditAmount.visible = true;
                            txtCreditAmount.layoutY = 0.0;
                            txtCreditAmount.editable = false;
                            txtCreditAmount.font = Arial_Bold_14;
                            panelCrNote.visible = true;
                            label8.visible = true;
                            label8.text = "Debit Note Amount :";
                            label8.font = Arial_Bold_12;
                            label8.textFill = Green;
                            txtDebitAmount.visible = true;
                            txtDebitAmount.layoutY = 0.0;
                            txtDebitAmount.editable = false;
                            txtDebitAmount.font = Arial_Bold_14;
                            panelDrNote.visible = true;
                            label1.layoutY = 0.0;
                            label12.layoutY = 0.0;
                            label12.font = Arial_12;
                            label5.layoutY = 0.0;
                            label5.font = Arial_12;
                            __layoutInfo_txtTotalBalanceDue.height = 66.0;
                            txtTotalBalanceDue.font = Font_amt;
                            __layoutInfo_txtRcptBalAmt.height = 66.0;
                            txtRcptBalAmt.font = Font_amt;
                            __layoutInfo_txtRcptAmtPaid.height = 66.0;
                            txtRcptAmtPaid.font = Font_amt;
                            panelAmtTextboxes.visible = true;
                            panelAmtTextboxes.layoutY = 17.0;
                            panelBottomTextboxes.visible = true;
                            cmbRcptype.layoutY = 135.0;
                            label2.layoutY = 89.0;
                            imageRecDate.visible = true;
                            imageRecDate.layoutY = 89.0;
                            imageRecDate.onKeyPressed = imageRecDateOnKeyPressedAtShown;
                            imageRecDate.onMouseClicked = imageRecDateOnMouseClickedAtShown;
                            label6.layoutY = 89.0;
                            label6.text = "Holder Name";
                            cmboChequeNo.visible = true;
                            cmboChequeNo.layoutX = 0.0;
                            cmboChequeNo.layoutY = 66.0;
                            txtAccCardNo.font = Arial_12;
                            imageDate.blocksMouse = true;
                            imageDate.image = imageCalender;
                            txtRcptDate.layoutY = 89.0;
                            rectRemoveRow.styleClass = "rectbutton";
                            rectRemoveRow.stroke = DarkGray;
                            rectRemoveRow.height = 20.0;
                            __layoutInfo_label3.width = 120.0;
                            label3.text = "Remove Row  [F12]";
                            label3.hpos = javafx.geometry.HPos.CENTER;
                            label3.textFill = javafx.scene.paint.Color.BLACK;
                            label11.layoutY = 112.0;
                            label13.layoutY = 135.0;
                            txtRcptDName.layoutY = 112.0;
                            txtRcptDName.font = Arial_12;
                            rectViewReceipts.visible = true;
                            rectViewReceipts.styleClass = "rectbutton";
                            rectViewReceipts.onMouseClicked = rectViewReceiptsOnMouseClickedAtShown;
                            rectViewReceipts.fill = Yellow;
                            rectViewReceipts.stroke = DarkGray;
                            rectViewReceipts.strokeWidth = 2.0;
                            rectViewReceipts.height = 20.0;
                            rectViewReceipts.arcWidth = 10.0;
                            rectViewReceipts.arcHeight = 10.0;
                            label9.visible = true;
                            __layoutInfo_label9.width = 100.0;
                            __layoutInfo_label9.height = 20.0;
                            label9.text = "View Receipts";
                            label9.font = Arial_Bold_12;
                            label9.hpos = javafx.geometry.HPos.CENTER;
                            listCustName.layoutY = 133.0;
                            panelCalender.visible = true;
                            panelCalender.layoutY = 115.0;
                            panelCalender.blocksMouse = true;
                            panelCalender1.visible = true;
                            panelCalender1.layoutY = 158.0;
                            panelCalender1.blocksMouse = true;
                            imageView8.visible = true;
                            imageView8.layoutY = 112.0;
                            imageView8.onMouseClicked = imageView8OnMouseClickedAtShown;
                            imageView8.blocksMouse = true;
                            panelShown.visible = true;
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
                            rectangle.visible = true;
                            rectangle.blocksMouse = true;
                            rectHeader.blocksMouse = true;
                            label17.visible = true;
                            label17.layoutY = 95.0;
                            label17.text = "Customer Name";
                            label17.font = Arial_12;
                            txtReceiptno.visible = true;
                            txtReceiptno.layoutY = 95.0;
                            txtReceiptno.onKeyPressed = txtReceiptnoOnKeyPressedAtView;
                            txtReceiptno.onKeyReleased = txtReceiptnoOnKeyReleasedAtView;
                            txtReceiptno.font = Arial_12;
                            imageView9.visible = true;
                            imageView9.layoutY = 95.0;
                            imageView9.onMouseClicked = imageView9OnMouseClickedAtView;
                            imageView9.blocksMouse = true;
                            imageView7.visible = true;
                            imageView7.image = imageSearch;
                            btnSearch.visible = true;
                            __layoutInfo_btnSearch.height = 25.0;
                            btnSearch.onKeyPressed = btnSearchOnKeyPressedAtView;
                            btnSearch.onMouseClicked = btnSearchOnMouseClickedAtView;
                            btnSearch.text = "Search";
                            btnSearch.font = Arial_Bold_14;
                            imageView6.visible = true;
                            imageView6.image = imageViewAll;
                            btnViewAll.visible = true;
                            btnViewAll.onKeyPressed = btnViewAllOnKeyPressedAtView;
                            btnViewAll.onMouseClicked = btnViewAllOnMouseClickedAtView;
                            btnViewAll.effect = reflectionEffect;
                            btnViewAll.text = "ViewAll";
                            btnViewAll.font = Arial_Bold_14;
                            panelTableView.visible = true;
                            rectTableBorder1.visible = true;
                            imageView5.visible = true;
                            imageView5.image = imageBack;
                            btnBack.visible = true;
                            btnBack.effect = reflectionEffect;
                            btnBack.text = "Back [Ctrl+Left]";
                            btnBack.font = Arial_Bold_14;
                            btnBack.action = btnBackActionAtView;
                            listCustomer.visible = false;
                            listCustomer.layoutY = 117.0;
                            txtHiddenRec.visible = false;
                            labelMsg.visible = true;
                            __layoutInfo_labelMsg.height = 20.0;
                            labelMsg.text = "Please select the row from table to edit the value";
                            labelMsg.font = Arial_Bold_14;
                            labelMsg.textFill = Green;
                            panelView.visible = true;
                            panelTable.visible = false;
                            rectTableBorder.visible = false;
                            imageView.visible = false;
                            imageView.image = null;
                            btnRcptSave.layoutY = 525.0;
                            imageView4.visible = false;
                            imageView4.image = null;
                            btnRcptEdit.visible = false;
                            btnRcptEdit.effect = reflectionEffect;
                            btnRcptEdit.text = "Edit [F4]";
                            imageView2.visible = false;
                            imageView2.image = null;
                            btnRcptReset.layoutY = 525.0;
                            imgCancel.visible = false;
                            imgCancel.image = null;
                            btnRcptCancel.layoutY = 525.0;
                            panelButtons.visible = false;
                            label7.visible = false;
                            label7.text = "Label";
                            label7.textFill = javafx.scene.paint.Color.BLACK;
                            txtCreditAmount.visible = false;
                            txtCreditAmount.layoutY = 21.0;
                            txtCreditAmount.editable = true;
                            panelCrNote.visible = false;
                            label8.visible = false;
                            label8.text = "Label";
                            label8.textFill = javafx.scene.paint.Color.BLACK;
                            txtDebitAmount.visible = false;
                            txtDebitAmount.layoutY = 6.0;
                            txtDebitAmount.editable = true;
                            panelDrNote.visible = false;
                            label1.layoutY = 126.0;
                            label12.layoutY = 477.0;
                            label12.font = Arial_16;
                            label5.layoutY = 477.0;
                            label5.font = Arial_16;
                            __layoutInfo_txtTotalBalanceDue.height = 31.0;
                            txtTotalBalanceDue.font = Arial_20;
                            __layoutInfo_txtRcptBalAmt.height = 44.0;
                            txtRcptBalAmt.font = Arial_35;
                            __layoutInfo_txtRcptAmtPaid.height = 44.0;
                            txtRcptAmtPaid.font = Arial_35;
                            panelAmtTextboxes.visible = false;
                            panelAmtTextboxes.layoutY = 0.0;
                            panelBottomTextboxes.visible = false;
                            cmbRcptype.layoutY = 158.0;
                            label2.layoutY = 102.0;
                            imageRecDate.visible = false;
                            imageRecDate.layoutY = 96.0;
                            label6.layoutY = 88.0;
                            label6.text = "Holder Name";
                            cmboChequeNo.visible = false;
                            cmboChequeNo.layoutX = 111.0;
                            cmboChequeNo.layoutY = 112.0;
                            imageDate.blocksMouse = false;
                            imageDate.image = imageCalender;
                            txtRcptDate.layoutY = 96.0;
                            rectRemoveRow.styleClass = "";
                            rectRemoveRow.stroke = DarkGray;
                            rectRemoveRow.height = 20.0;
                            __layoutInfo_label3.width = 100.0;
                            label3.text = "Remove Row";
                            label3.hpos = javafx.geometry.HPos.CENTER;
                            label3.textFill = DarkGray;
                            label11.layoutY = 132.0;
                            label13.layoutY = 158.0;
                            txtRcptDName.layoutY = 126.0;
                            rectViewReceipts.visible = false;
                            rectViewReceipts.styleClass = "";
                            rectViewReceipts.fill = javafx.scene.paint.Color.BLACK;
                            rectViewReceipts.stroke = null;
                            rectViewReceipts.strokeWidth = 1.0;
                            rectViewReceipts.height = 50.0;
                            rectViewReceipts.arcWidth = 0.0;
                            rectViewReceipts.arcHeight = 0.0;
                            label9.visible = false;
                            label9.text = "Label";
                            label9.hpos = javafx.geometry.HPos.LEFT;
                            listCustName.layoutY = 148.0;
                            panelCalender.visible = false;
                            panelCalender.layoutY = 0.0;
                            panelCalender.blocksMouse = true;
                            panelCalender1.visible = false;
                            panelCalender1.layoutY = 0.0;
                            panelCalender1.blocksMouse = true;
                            imageView8.visible = false;
                            imageView8.layoutY = 81.0;
                            imageView8.blocksMouse = true;
                            panelShown.visible = false;
                            panel.visible = true;
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

    function listCustomerChanges(type: Integer): Void {
        if(not listCustName.visible){
        try {
            var listControlObj: ListController = new ListController();
            listW = txtRcptDName.width;
            listH = listControlObj.listImageControlView(txtRcptDName, listCustName, "Customer", type);
            var selS: String = bind listControlObj.selectedString on replace {
                if (selS.length() > 0) {
                    var balan: Double = 0.0;
                    balan = displayReceiptDetails(selS);
                    txtTotalBalanceDueText = Value.Round(balan);
                    txtRcptBalAmtText = Value.Round(balan);
                    txtRcptAmtPaidText = "0.00";
                    listCustName.visible = false;
                    recptTable.clearData();
                //-    updateValues();

                    cmbRcptype.requestFocus();

                } } } catch (e: Exception) {
            log.debug("Error in List Getting = {e.getMessage()}");
        }
      }
       else{
           listCustName.visible = false;
           txtRcptDName.requestFocus();
       }
    }

    function txtRcptDNameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            if (sar == 0 or txtRcptDName.rawText.trim() == null or txtRcptDName.rawText.trim().length() == 0 or txtRcptDName.rawText.trim() == "null") {
                txtRcptDName.text = "";
            }
        }
        if (event.code == KeyCode.VK_ESCAPE) {
            listCustName.visible = false;
        }

        shortcut(event);
    }

    function btnBackOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function listChanges(type: Integer): Void {
        if(not listCustomer.visible){
        var listControlObj: ListController = new ListController();
        listW = txtReceiptno.width;
        listH = listControlObj.listImageControlView(txtReceiptno, listCustomer, "Customer", type);
        }
        else{
            listCustomer.visible = false;
            txtReceiptno.requestFocus();
        }
    }

    function imageView9OnMouseClickedAtView(event: javafx.scene.input.MouseEvent): Void {
        listChanges(0);
    }

    function imageView8OnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        listCustomerChanges(0);
    }

    function btnRcptEditAction(): Void {
        view();
    }

    function rectangleOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        listCustName.visible = false;
        listCustomer.visible = false;
        panelCalender.visible = false;
        panelCalender1.visible = false;
    }

    function Fxalert(type: Integer): Void {
        CustomAlert.ShowAlert("Receipt", type);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Receipt", msg);
        showAlertbox();
    }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Receipt", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = error;
    }

    function imageRecDateOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        panelCalender.visible = true;
        panelCalender1.visible = true;
        datePickclick1();
    }

    function imageRecDateOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        panelCalender.visible = true;
        panelCalender1.visible = true;
        datePickclick1();
    }

    function btnRcptSaveOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function btnViewAllOnKeyPressedAtView(event: javafx.scene.input.KeyEvent): Void {
        recptTable.clearData();
        viewReceiptTable.LoadReceiptValues("all", "");
    }

    function btnViewAllOnMouseClickedAtView(event: javafx.scene.input.MouseEvent): Void {
        recptTable.clearData();
        viewReceiptTable.LoadReceiptValues("all", "");
    }

    function btnSearchOnMouseClickedAtView(event: javafx.scene.input.MouseEvent): Void {
        listCustomer.visible = false;
        searchclick();
    }

    function btnSearchOnKeyPressedAtView(event: javafx.scene.input.KeyEvent): Void {
        listCustomer.visible = false;
        searchclick();
    }

    def kr = KeyRegistry {};
    var key = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 5 and CommonDeclare.form[4] == 2) {
            shortcut(key);
        }
    }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == kr.save and btnRcptSaveText == "Save [F3]" and not btnRcptSave.disable) {
            saveClick();
        }
        if (event.code == kr.update and btnRcptSaveText == "Update [F7]" and not btnRcptSave.disable) {
            saveClick();
        }
        if (event.code == kr.reset and btnRcptResetText == "Reset [F4]") {
            clearAll();
        }
        if (event.code == kr.cancel) {
            if (btnRcptCancelText == "Cancel [F8]") { panel.visible = false; panelTableView.visible = false;
                CancelForm();
            }
        }
        if (event.code == kr.edit and not btnRcptEdit.disable) {
            view();
        }
        if (event.code == kr.del and not btnRcptEdit.disable) {
            delClick();
        }
        if (event.controlDown and event.code == kr.back) {
            if (btnRcptCancelText == "Back [Ctrl+Left]") { clearAll(); }
            if (btnBack.text == "Back [Ctrl+Left]") { currentState.actual = currentState.findIndex("Shown"); }
        }
        if (event.code == kr.rRow) {
            receiptRemoveRows();
        }
    }

    public function receiptRemoveRows(): Void {
        recptTable.removeRow();
        recptTable.receiptCalculations();
        updateValues();
    }

    function searchclick(): Void {
        var custName: String = "";
        custName = txtReceiptno.rawText.trim();
        viewReceiptTable.LoadReceiptValues("custnamesearch", custName);
    }

    function txtReceiptnoOnKeyReleasedAtView(event: javafx.scene.input.KeyEvent): Void {
        listChanges(1);
        if (event.code == KeyCode.VK_DOWN) {
            listCustomer.requestFocus();
            listCustomer.selectFirstRow();
        }
        if (event.code == KeyCode.VK_ESCAPE) {
            listCustomer.visible = false;
        }
    }

    function txtReceiptnoOnKeyPressedAtView(event: javafx.scene.input.KeyEvent): Void {

        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            if (sar1 == 0 or txtReceiptno.rawText.trim() == null or txtReceiptno.rawText.trim().length() == 0 or txtReceiptno.rawText.trim() == "null") {
                txtReceiptno.text = " ";
            }
            btnSearch.requestFocus();
        }

        if (event.code == KeyCode.VK_ESCAPE) {
            listCustomer.visible = false;
        }
        shortcut(event);
    }

    function rectViewReceiptsOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        view();
    }

    function view(): Void {
        currentState.actual = currentState.findIndex("View");
        RecepNoId = "";
        viewReceiptTable.LoadReceiptValues("basicsearch", "");
        txtReceiptno.text = "";
    }

    function btnBackActionAtView(): Void {
        currentState.actual = currentState.findIndex("Shown");
        RecepNoId = "";
        clearAll();
    }

    function imageDateOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        panelCalender.visible = true;
        panelCalender1.visible = true;
        datePickclick();
    }

    function imageDateOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        panelCalender.visible = true;
        panelCalender1.visible = true;
        datePickclick();
    }

    function datePickclick1(): Void {
        panelCalender.visible = true;
        panelCalender1.visible = true;
        if (not curDateFlag1) {
            panelCalender.layoutX = txtRcptDate.layoutX;
            panelCalender.layoutY = txtRcptDate.layoutY + txtPayTypeDate.height + 5.0;
            panelCalender.content = [fxCalendar,];
            delete  panelCalender1.content;
            if (txtRcptDate.text != null) {
                var dat = txtRcptDate.rawText.trim().split("-");
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
    }

    function datePickclick(): Void {

        panelCalender.visible = true;
        panelCalender1.visible = true;
        if (not curDateFlag) {
            panelCalender1.layoutX = panelColumn4.layoutX+txtPayTypeDate.layoutX;
            panelCalender1.layoutY =  panelColumn4.layoutY+txtPayTypeDate.layoutY + txtPayTypeDate.height + 5.0;
            panelCalender1.content = [fxCalendar,];
            delete  panelCalender.content;
            if (txtPayTypeDate.text != null) {
                var dat = txtPayTypeDate.rawText.trim().split("-");
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
    }

    var visit = bind fxCalendar.visible on replace {
        if (curDateFlag and not visit) {
            getDate(0);
        } else if (curDateFlag1 and not visit) {
            getDate(1);
        }
    };

    function getDate(i: Integer) {
        if (i == 0) {
            txtPayTypeDate.text = fxCalendar.getSelectedDate();
            curDateFlag = false;
            curDateFlag1 = false;
            cmbRcptype.requestFocus();
        } else if (i == 1) {
            txtRcptDate.text = fxCalendar.getSelectedDate();
            curDateFlag = false;
            curDateFlag1 = false;
            cmbRcptype.requestFocus();
        }
    }

    function rectRemoveRowOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        receiptRemoveRows();
    }

    function rectRemoveRowOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        receiptRemoveRows();
    }

    function btnRcptCancelOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if (btnRcptCancelText == "Cancel [F8]") {
            panel.visible = false;
            clearAll();
            CancelForm();
        } else {
            clearAll();
        }
    }

    function btnRcptCancelOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            if (btnRcptCancelText == "Cancel [F8]") {
                panel.visible = false;
                clearAll();
                CancelForm();
            } else {
                clearAll();
            }
        }
    }

    function delClick(): Void {
        if (btnRcptResetText == "Reset [F4]") {
            clearAll();
        } else {

            try {
receiptController  =RegistryFactory.getClientStub(RegistryConstants.Receipt) as com.vanuston.medeil.implementation.Receipt;
                var cn:ConfirmDialogBox=new ConfirmDialogBox(1,"Receipt");
                            var a =bind cn.staus;
                                if (a) {
                                    var receiptModel = new ReceiptModel();
                                    receiptModel = validationCheck();
                                    receiptModel.setReceiptHiddenNumber(txtHiddenRec.rawText);
                                    receiptModel.setCardNumber(chequeEditNo);

                                    var status = false;
                                    status = receiptController.deleteRecord(receiptModel); // controller call
                                    if (status == true) {
                                       Fxalert(5);
                                        clearAll();
                                        txtRcptDName.requestFocus();
                                    } }


            } catch (e: Exception) {

                var msg: String = "Class : Receipt  Method : delClick()   = {e.getMessage()}";
                log.debug(msg);
            }

        }
    }

    function btnRcptResetOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        delClick();
    }

    function btnRcptResetOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            delClick();
        }
    }

    function btnRcptSaveOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        saveClick();
    }

    function btnRcptSaveOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            saveClick();
        }
    }

    function txtPayTypeDateOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            recptTable.focusSet();
        }
        shortcut(event);
    }

    function txtBankNameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtPayTypeDate.requestFocus();
        }
        shortcut(event);
    }

    function txtHolderNameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtBankName.requestFocus();
        }
        shortcut(event);
    }

    function txtAccCardNoOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtHolderName.requestFocus();
        }
        shortcut(event);
    }

    function cmbRcptypeOnMouseExited(event: javafx.scene.input.MouseEvent): Void {

        payTypeChange();
    }

    function cmbRcptypeOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {

        payTypeChange();
    }

    function txtRcptDNameOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        listCustomerChanges(1);
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            if (txtRcptDName.rawText.trim() == null or txtRcptDName.rawText.trim() == "null") {
                txtRcptDName.text = " ";
            }
        }
        if (event.code == KeyCode.VK_DOWN) {
            listCustName.requestFocus();
            listCustName.selectFirstRow();
        }
        if (event.code == KeyCode.VK_ESCAPE) {
            listCustName.visible = false;
        }

        txtRcptDName.style = mandatory;
        shortcut(event);
    }

    function payTypeChange(): Void {
        var payType = cb;
        payTypeChange1(payType);
    }

    function payTypeChange1(sar): Void {
        var payType = sar;
        leftSideValues(payType);
        if( btnRcptSaveText == "Save [F3]"){
        txtAccCardNo.text = "";
        txtHolderName.text = "";
        txtBankName.text = "";
         cmboChequeNo.select(0);
         }
        if (payType == "Cash") {
               txtAccCardNo.text = "";
              txtHolderName.text = "";
                 txtBankName.text = "";
                 cmboChequeNo.select(0);
            txtAccCardNo.editable = false;
            txtHolderName.editable = false;
            txtBankName.editable = false;
        } else if (payType == "Cheque") {
            label4.text = "Cheque No.";
            label6.text = "Issued To  ";
            txtAccCardNo.requestFocus();
            txtAccCardNo.editable = true;
            txtHolderName.editable = false;
            txtBankName.editable = false;
        } else if (payType == "DD") {
            label4.text = "DD No.";
            label6.text = "Issued To ";
            txtAccCardNo.requestFocus();
            txtAccCardNo.editable = true;
            txtHolderName.editable = true;
            txtBankName.editable = true;
        } else if (payType == "Credit card") {
            label4.text = "Card No";
            label6.text = "Card Holder Name";
            txtAccCardNo.requestFocus();
            txtAccCardNo.editable = true;
            txtHolderName.editable = true;
            txtBankName.editable = true;
        } else if (payType == "Debit Card") {
            label4.text = "Card No";
            label6.text = "Card Holder Name";
            txtAccCardNo.requestFocus();
            txtAccCardNo.editable = true;
            txtHolderName.editable = true;
            txtBankName.editable = true;
        }
    }

    function clearAll(): Void {

        RecepNoId = ""; 
        txtHiddenRec.text = "";
        txtRcptDName.text = "";
        txtAccCardNo.text = "";
        txtBankName.text = "";
        txtHolderName.text = "";
        txtPayTypeDate.text = "";
        txtRcptAmtPaidText = "0.00";
        recptTable.focusSet1();
        txtRcptDName.requestFocus();
        txtRcptNo.text = comObj.getAutoIncrement(today, "Receipts");  // Controller Call
        recptTable.clearData();
        recptTable.totalAmt1 = 0;
        recptTable.totalAmounts = 0;
        recptTable.totalDistAmt1 = 0;
        txtTotalBalanceDueText = "0.00";
        txtRcptAmtPaidText = "0.00"; 
        txtRcptBalAmtText = "0.00";
        btnRcptSaveText = "Save [F3]";
        btnRcptResetText = "Reset [F4]";
        btnRcptCancelText = "Cancel [F8]";
        CancelW = bottonW;
        imageCanceR = imageCancel;
        recptTable.distName = "";
        comboValues();
        txtCreditAmountText = "0.00";
        txtDebitAmountText = "0.00";
        balDu = 0.00;
        txtRcptDate.text = today;
        accountNos = comObj.getChequeNumbers("Receipt").toArray();  // Controller Call
        chequeEditNo = "";
        txtPayTypeDate.editable = false;
         payTypeChange1("Cash");
    }

    function validationCheck(): ReceiptModel { // This Method is used for Setting bean Values
        var sdf = new SimpleDateFormat("dd-MM-yyyy");
        var receiptModel = new ReceiptModel();
        receiptModel.setReceiptNumber(txtRcptNo.rawText.trim());
        receiptModel.setReceiptDate(DateUtils.changeFormatDate(sdf.parse(txtRcptDate.rawText.trim())));
        receiptModel.setCustomerName(txtRcptDName.rawText.trim());
        receiptModel.setPaymentType(cmbRcptype.selectedItem.toString());
         if(cmbRcptype.selectedItem.toString().equals("Cheque")){
        receiptModel.setCardNumber(cmboChequeNo.selectedItem.toString());
        }else{
              receiptModel.setCardNumber(txtAccCardNo.rawText.trim());
        }
        

        receiptModel.setBankName(txtBankName.rawText.trim());
        receiptModel.setHolderName(txtHolderName.rawText.trim());
        receiptModel.setPayTypeDate(txtPayTypeDate.rawText.trim());
        receiptModel.setReceiptHiddenNumber(txtHiddenRec.rawText.trim());
        receiptModel.setListofitems(recptTable.getReceiptItems());
        receiptModel.setTotalBalanceDue(Double.parseDouble(txtTotalBalanceDue.rawText.trim()));
        receiptModel.setTotalPaidAmount(Double.parseDouble(txtRcptAmtPaid.rawText.trim()));
        receiptModel.setBalanceAmount(Double.parseDouble(txtRcptBalAmt.rawText.trim()));
        var transDetails: String = " Receipt:{txtRcptNo.rawText}, Customer Name : {txtRcptDName.rawText},  Cheque No: {txtAccCardNo.rawText}  ";
        receiptModel.setTransactionDetails(transDetails);
        return receiptModel;
    }

    function saveClick(): Void {
        var rowCnt = recptTable.totalRow();

        try {

            if (txtRcptDName.rawText == null or txtRcptDName.rawText.trim().length() == 0) {
                FXinfo("Please Enter Customer Name", txtRcptDName);
            } else if (cmbRcptype.selectedItem.toString().equals("Cheque") and (cmbRcptype.selectedItem.toString() == null or cmbRcptype.selectedItem.toString() == "-- Select --")) {
                FXinfo("Please Select Cheque No.");
                cmboChequeNo.requestFocus();
            } else if (rowCnt == 0) {
                FXinfo("Receipt table is empty. Please enter some values.");
                recptTable.focusSet();
            } else {
                var receiptModel = new ReceiptModel();
                receiptModel = validationCheck();
                  if(receiptModel.getTotalPaidAmount()>0.0) {
                receiptModel.setRowCount(rowCnt);
                if (btnRcptSaveText == "Save [F3]") {

                    var returnObject = new Object();
                    returnObject = receiptController.createRecord(receiptModel); // controller call
                    var msgReturnModel: MsgReturnModel = new MsgReturnModel();
                    msgReturnModel = returnObject as MsgReturnModel;
                    recptTable.focusSet(msgReturnModel.getRowCount());
                    if (msgReturnModel.getReturnMessage() == "0") {
                        Fxalert(Integer.parseInt(msgReturnModel.getReturnMessage()));
                        clearAll();
                        txtRcptDName.requestFocus();
                    } else {
                        FXinfo(msgReturnModel.getReturnMessage());
                    }
                } else {
                    var cn:ConfirmDialogBox=new ConfirmDialogBox(0,"Receipt");
                            var a =bind cn.staus;
                                    if (a) {

                                        var returnObject = new Object();
                                        returnObject = receiptController.updateRecord(receiptModel); // controller call
                                        var msgReturnModel: MsgReturnModel = new MsgReturnModel();
                                        msgReturnModel = returnObject as MsgReturnModel;
                                        recptTable.focusSet(msgReturnModel.getRowCount());
                                        if (msgReturnModel.getReturnMessage() == "0") {
                                             Fxalert(4);
                                            clearAll();
                                            txtRcptDName.requestFocus();
                                        } else {
                                            FXinfo(msgReturnModel.getReturnMessage());
                                        }
                                    }

                } 
                } else{

                   FXinfo("Please Enter Valid Receipt Amount");
                }
                }




        } catch (e: Exception) {
            var msg: String = "Class : Receipt  Method : saveClick()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function displayReceiptDetails(name: String): Double {


        var recModel = new Object;
        var bal: Double = 0.00;
        if (name != "null" and name != null and name.trim().length() > 0) {
            try {
			
                recModel = receiptController.getCustomerBalanceAmount(name); // controller call
                var receiptModel: ReceiptModel = new ReceiptModel();
                receiptModel = recModel as ReceiptModel;
                bal = receiptModel.getTotalBalanceDue();
                txtCreditAmountText = Value.Round(receiptModel.getCreditAmount());
                txtDebitAmountText = Value.Round(receiptModel.getDebitAmount());
            } catch (e: Exception) {
                var msg: String = "Class : Payment  Method : displayPaymentDetails()   = {e.getMessage()}";
                log.debug(msg);
            }
            bal = Value.Round(bal, 2);
        }
        return bal;
    }

    function txtRcptDateOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {

        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtRcptDName.requestFocus();
        }
    }

    function listCustNameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (listCustName.focused) {
            if (event.code == KeyCode.VK_DOWN)
                listCustName.selectFirstRow();
        }
    }

    function ViewReceiptDetails(id): Void {

        var payModel = new Object;

        try {
		
            var receiptModel: ReceiptModel = new ReceiptModel();
            receiptModel.setReceiptNumber(id.toString());
            payModel = receiptController.viewRecord(receiptModel); // controller call
            receiptModel = payModel as ReceiptModel;
            cmbRcptype.items = [receiptModel.getPaymentType(), "Cash", "Cheque", "DD", "Credit card", "Debit Card"];
            cmbRcptype.select(0);
            txtRcptNo.text = receiptModel.getReceiptNumber();
            txtRcptDName.text = receiptModel.getCustomerName();
            txtRcptDate.text = receiptModel.getReceiptDate();
            txtAccCardNo.text = receiptModel.getCardNumber();
            chequeEditNo = receiptModel.getCardNumber();
            txtBankName.text = receiptModel.getBankName();
            txtHolderName.text = receiptModel.getHolderName();
            txtPayTypeDate.text = receiptModel.getPayTypeDate();
            balDu = receiptModel.getTotalPaidAmount();
            txtRcptAmtPaidText = Value.Round(balDu);
            txtRcptBalAmtText = Value.Round(receiptModel.getBalanceAmount());
            accountNos[0] = chequeEditNo;
             if(receiptModel.getPaymentType().equals("Cheque")){
            cmboChequeNo.select(0);
            }


            txtTotalBalanceDueText = Value.Round(receiptModel.getTotalBalanceDue());
        } catch (e: Exception) {
            var msg: String = "Class : Payment  Method : ViewPaymentDetails()   = {e.getMessage()}";
            log.debug(msg);
        }

    }

    var balDu: Double = 0.00;

    public function updateValues(): Void {
        try {
            recptTable.distName = txtRcptDName.text;
            var totB: Double = displayReceiptDetails(txtRcptDName.rawText.trim());
            if (btnRcptSaveText == "Update [F7]") {
                txtTotalBalanceDueText = Value.Round(totB + balDu);
            } else {
                txtTotalBalanceDueText = Value.Round(totB);
            }

            if (viewReceiptTable.receipterId != null and viewReceiptTable.receipterId.trim().length() > 3) {
                currentState.actual = currentState.findIndex("Shown");
                RecepNoId = viewReceiptTable.receipterId;
                txtHiddenRec.text = RecepNoId;
                viewReceiptTable.receipterId = "";
                recptTable.loadDReceiptTable(RecepNoId);
                ViewReceiptDetails(RecepNoId);
                btnRcptSaveText = "Update [F7]";
                btnRcptResetText = "Delete [F5]";
                btnRcptCancelText = "Back [Ctrl+Left]";
                CancelW = bottonW + 50;
                imageCanceR = imageBack;
            } else {
                if (RecepNoId == "" or RecepNoId.trim().length() == 0) {
                    btnRcptSaveText = "Save [F3]";
                    btnRcptResetText = "Reset [F4]";
                    btnRcptCancelText = "Cancel [F8]";
                    CancelW = bottonW;
                    imageCanceR = imageCancel;
                    rectRemoveRow.visible = true;
                    label3.visible = true;
                } else {
                    rectRemoveRow.visible = false;
                    label3.visible = false;
                    btnRcptSaveText = "Update [F7]";
                    btnRcptResetText = "Delete [F5]";
                    btnRcptCancelText = "Back [Ctrl+Left]";
                    CancelW = bottonW + 50;
                    imageCanceR = imageBack;
                }
            }
            if (txtRcptDName.text != null and txtRcptDName.text.trim().length() > 0) {
                recptTable.distName = txtRcptDName.text;
                txtRcptAmtPaidText = Value.Round(recptTable.totalAmt1);
                var balD: String = "";
                balD = "{txtTotalBalanceDueText}";
                var amtPa: String = "";
                amtPa = "{txtRcptAmtPaidText}";
                var reBal: Double = 0.00;
                reBal = (Value.Round(Double.valueOf(balD), 2) - Value.Round(Double.valueOf(amtPa), 2));
                if (btnRcptSaveText == "Update [F7]") {
                    reBal = (Value.Round(Double.valueOf(balD), 2) - Value.Round(Double.valueOf(amtPa), 2));
                }
                txtRcptBalAmtText = Value.Round(reBal);
            }

        } catch (e: Exception) {
            var msg: String = "Class : Receipt  Method : UpDateValues   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function backButtonchanges(imagech): Void {

        if (imagech == "Update [F7]") {
            imageCanceR = imageBack;
        } else {
            imageCanceR = imageCancel;
        }
    }

    var imageCanceR: Image;
    var imageCancelRep = bind btnRcptSaveText on replace {
        backButtonchanges(imageCancelRep);
    }
    var cb = bind cmbRcptype.selectedItem on replace {
        payTypeChange();
    }
    var logUser: String = bind CommonDeclare.user on replace {
        getPrivileges(logUser);
    }
    var changPiv = bind btnRcptSaveText on replace {
        getPrivileges(logUser);
    }
    var changPiv1 = bind btnRcptResetText on replace {
        getPrivileges(logUser);
    }

    function getPrivileges(u: String): Void {

        var uname = u;
        var utype = comObj.getUserType(uname);  // Controller Call
        if (utype.equals("User")) {
            var priv = comObj.getPrivileges("financial", uname);  // Controller Call
            var ss = priv.split(",");
            var val = Integer.parseInt(ss[1]);
            if (val == 1) {
                btnRcptSave.disable = true;
                if (btnRcptResetText != "Reset [F4]") {
                    btnRcptReset.disable = true;
                } else {
                    btnRcptReset.disable = false;
                }
            } else if (val == 2) {

                if (btnRcptResetText != "Reset [F4]") {
                    btnRcptReset.disable = true;
                } else {
                    btnRcptReset.disable = false;
                }
                btnRcptSave.disable = false;

            } else if (val == 3) {
                btnRcptSave.disable = false;
                btnRcptReset.disable = false;
            }
        } else {
            btnRcptSave.disable = false;
            btnRcptReset.disable = false;
        }
    }

    public function comboValues(): Void {
        cmbRcptype.items = ["Cash", "Cheque", "DD", "Credit card", "Debit Card"];
        cmbRcptype.select(0);
    }

    public function leftSideValues(valuetype): Void {
        txtPayTypeDate.editable = false;
        if (valuetype.equals("Cash")) {
            panelColumn3.visible = false;
            panelColumn4.visible = false;
        } else if (valuetype.equals("Cheque")) {
            panelColumn3.visible = true;
            panelColumn4.visible = true;
            label16.visible = true;
            label16.text = "Cheque Amount";
            imageDate.visible = false;
            txtPayTypeDate.visible = true;
            txtAccCardNo.visible = false;
            cmboChequeNo.visible = true;
            txtPayTypeDate.editable = true;
            txtPayTypeDate.text = "";
        } else {
            panelColumn3.visible = true;
            panelColumn4.visible = true;
            label16.visible = true;
            label16.text = "Expiry Date";
            imageDate.visible = true;
            txtPayTypeDate.visible = true;
            txtAccCardNo.visible = true;
            cmboChequeNo.visible = false;
        }
    }

    var coChequeNo: String = bind cmboChequeNo.selectedItem.toString() on replace {
        try {
		
            chqDetails = comObj.getChequeDetails(coChequeNo);  // Controller Call
            if (chqDetails != null and chqDetails.size() > 2) {
                txtHolderName.text = chqDetails.get(0).toString();
                txtBankName.text = chqDetails.get(1).toString();
                chqAmt = chqDetails.get(2).toString();
            }
            txtPayTypeDate.text = chqAmt;
        } catch (e: Exception) {
            log.debug("Bind: coChequeNo    Exception : {e.getMessage()}");
        }
    }

    public function StartUp(): Void {
        comboValues();
        payTypeChange1("Cash");
        leftSideValues("Cash");
        (reciptTable as javax.swing.JTable).addKeyListener(KeyAdapter {
            override public function keyTyped(e: java.awt.event.KeyEvent): Void {
                recptTable.receiptCalculations();
                updateValues();
            }
        });
        (reciptTable as javax.swing.JTable).addKeyListener(KeyAdapter {
            override public function keyReleased(e: java.awt.event.KeyEvent): Void {
                recptTable.receiptCalculations();
                updateValues();
            }
        });
        (reciptTable as javax.swing.JTable).addMouseListener(MouseAdapter {
            override public function mouseClicked(e: java.awt.event.MouseEvent): Void {
                recptTable.receiptCalculations();
                updateValues();
                imageCanceR = imageBack;
            }
        });
        (ReceiptChargerViewTable as javax.swing.JTable).addMouseListener(MouseAdapter {
            override public function mouseClicked(e: java.awt.event.MouseEvent): Void {
                currentState.actual = currentState.findIndex("Shown");
                viewReceiptTable.viewReceiptCalculations();
                updateValues();
                updateValues();
            }
        });

        panel.visible = true;
        clearAll();
        txtRcptDName.style = mandatory;
        cmbRcptype.select(0);
        txtRcptDate.text = today;
        imageDate.image = Image { url: "{__DIR__}images/Calender.png" };
        imageRecDate.image = Image { url: "{__DIR__}images/Calender.png" };
        txtRcptDName.requestFocus();
        fxCalendar.visible = false;
        receiptTableComp.layoutX = 0;
        receiptTableComp.layoutY = 0;
        panelTable.content = [receiptTableComp,];
        ReceiptCharTab.layoutX = 0;
        ReceiptCharTab.layoutY = 0;
        panelTableView.content = [ReceiptCharTab,];
        getPrivileges(logUser);
    }

    public function CancelForm(): Void {
        CommonDeclare.form[4] = 0;

    }

}