package com.vanuston.medeil.ui;

import java.lang.*;
import javafx.scene.image.*;
import javafx.ext.swing.SwingComponent;
import java.awt.Dimension;
import javafx.scene.input.KeyCode;
import java.text.SimpleDateFormat;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Value;
import com.vanuston.medeil.uitables.PayTable;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.ui.calendar.theme.Theme;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import com.vanuston.medeil.uitables.ViewPaymentTable;
import com.vanuston.medeil.util.CommonDeclare;
import javafx.scene.control.TextBox;
import com.vanuston.medeil.util.KeyRegistry;
import java.awt.event.KeyAdapter;
import java.awt.event.MouseAdapter;
import com.vanuston.medeil.model.PaymentModel;
import com.vanuston.medeil.model.MsgReturnModel;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.uitables.ConfirmDialogBox;

public class Payment {

    var log: Logger = Logger.getLogger(Payment.class, "Finanical");
    var sar: Integer = 0;
    var sar1: Integer = 0;
    var chequeEditNo: String = "";
    var btnPmtSaveText = "Save  [F2]";
    var btnPmtResetText = "Reset [F5]";
    var btnPmtCancelText = "Cancel [F8]";
    var txtTotalBalanceDueText = "0.00";
    var txtPmtBalAmtText = "0.00";
    var txtPmtAmtPaidText = "0.00";
    var txtCreditAmountText = "0.00";
    var txtDebitAmountText = "0.00";
    var user = bind CommonDeclare.user;
    var curDateFlag: Boolean = false;
    var curDateFlag1: Boolean = false;
    var fxCalendar = FXCalendar {
                theme: Theme {};
            };
    var payTable = new PayTable();
    var today = DateUtils.now("dd-MM-yyyy");
    var paymentTable = payTable.createTable();
    var paymentTableComp = SwingComponent.wrap(payTable.getScrollTable(paymentTable));
    var panelW = bind CommonDeclare.panelFormW on replace {
        payPanel.visible = false;
    }
     var comObj : CommonImplements=RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
	 
	 
     var paymentcontroller: com.vanuston.medeil.implementation.Payment=RegistryFactory.getClientStub(RegistryConstants.Payment) as  com.vanuston.medeil.implementation.Payment;
	 
	 
    var viewPaymentTable = new ViewPaymentTable();
    var doctorChargeViewTable = viewPaymentTable.createTable();
    var doctorCharTab = SwingComponent.wrap(viewPaymentTable.getScrollTable(doctorChargeViewTable));
    var charDoctorId: String = "";
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
    var CancelW = bottonW;
    var rectbutton1LX = bind CommonDeclare.rectbutton1LX;
    var rectbutton2LX = bind RemoveRowLX;
    var rectbuttonLY = bind CommonDeclare.rectbuttonLY - 2;
    var seperatorW = bind CommonDeclare.seperatorW;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;//200
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;//150
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;//100
    var Type4TextboxW = bind CommonDeclare.Type4TextboxW;//50
    var ImageCalenderLX = bind C2LX + Type3TextboxW + 2;
    var ImageCalender1LX = bind Type3TextboxW + 2;
    var panelCalenderLX = 0.0;// bind C2LX + Type3TextboxW + 22;
    var panelCalender1LX = bind C4LX + Type3TextboxW + 22;
    var AmtTextW = bind 31.21557814 * panelW / 100;
    var labelSearchLX = bind (30.37484117 * panelW / 100);
    var SearchTextboxLX = bind labelSearchLX + 100;
    var buttonSearchLX = bind SearchTextboxLX + Type1TextboxW + 10;
    var TextboxBalancedue = bind (1.524777637 * panelW / 100);
    var TextboxBalance = bind (34.81575604 * panelW / 100);
    var TextboxPaid = bind (68.10673443 * panelW / 100);
    var TextboxBottomLY = bind (69.72477064 * panelH / 100);
    var panelTableLX = bind (panelW - TableW) / 2;
    var panelTableLY = bind (29.35779817 * panelH / 100);
    var panelTableViewLY = 110.0;
    var TableH = 216.0;
    var TableViewH = 350.0;
    var TableW = bind (95.29860229 * panelW) / 100 on replace {
        changeTableSize(TableW);
    };
    var RemoveRowLX = bind ((panelW + TableW) / 2) - 120;
    var RemoveRowLY = bind panelTableLY + TableH;
    var balDu: Double = 0.0;
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    var mandatory = CommonDeclare.textbox_mandatory();
    var error = CommonDeclare.textbox_error();
    def CustomAlert = CustomAlert {};
    var listH = 0.0;
    var listW = Type2TextboxW;
    def kr = KeyRegistry {};
    var accountNos=comObj.getChequeNumbers("Payment").toArray(); // Controller Call
    var chqDetails;
    var chqAmt: String = "";
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def panelTable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
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
    
    public-read def label17: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind labelSearchLX
        layoutY: 108.0
        text: "Label"
    }
    
    public-read def imageView6: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
    }
    
    def __layoutInfo_btnSearch: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnSearch: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind buttonSearchLX+30
        layoutY: 102.0
        layoutInfo: __layoutInfo_btnSearch
        graphic: imageView6
        text: "Button"
    }
    
    def __layoutInfo_listView2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def listView2: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: 130.0
        layoutY: 205.0
        layoutInfo: __layoutInfo_listView2
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    public-read def panelViewTable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelTableLX
        layoutY: bind panelTableViewLY
        blocksMouse: true
    }
    
    public-read def rectTableBorder1: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind panelTableLX
        layoutY: bind panelTableViewLY
        styleClass: "rectTableBorder"
        width: bind TableW
        height: bind TableViewH
    }
    
    public-read def imageView4: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
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
        graphic: imageView4
        text: "Button"
    }
    
    public-read def imageView5: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
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
        graphic: imageView5
        text: "Button"
    }
    
    def __layoutInfo_listPayymentNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listPayymentNo: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind SearchTextboxLX
        layoutY: 142.0
        layoutInfo: __layoutInfo_listPayymentNo
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    def __layoutInfo_labelMsg: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW-panelTableLX
    }
    public-read def labelMsg: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind panelTableLX
        layoutY: bind panelButtonsLY-25
        layoutInfo: __layoutInfo_labelMsg
        text: "Label"
    }
    
    public-read def imagePayDate: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind ImageCalenderLX
        layoutY: 89.0
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imageView7: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
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
        image: bind imageCanceR
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def payPanel2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: 256.0
        layoutY: 108.0
        blocksMouse: true
    }
    
    def __layoutInfo_cmbPaymentType: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def cmbPaymentType: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: bind C2LX
        layoutY: 135.0
        layoutInfo: __layoutInfo_cmbPaymentType
        onKeyReleased: cmbPaymentTypeOnKeyReleased
        onMouseReleased: cmbPaymentTypeOnMouseReleased
        items: [ "Cash", "Cheque", "DD", "Credit card", "Debit Card", ]
    }
    
    public-read def button: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 179.0
        layoutY: 152.0
        text: "Button"
    }
    
    def __layoutInfo_cmboChequeNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def cmboChequeNo: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: 0.0
        layoutY: 66.0
        layoutInfo: __layoutInfo_cmboChequeNo
        items: bind accountNos
    }
    
    public-read def imageDate: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind ImageCalender1LX
        layoutY: 133.0
        onMouseClicked: imageDateOnMouseClicked
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtCreditAmount: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtCreditAmount: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 125.0
        layoutY: 38.0
        layoutInfo: __layoutInfo_txtCreditAmount
        styleClass: "Bordetless-text-box"
        text: bind txtCreditAmountText
    }
    
    public-read def panelCrNote: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind TextboxBalancedue
        content: [ label3, txtCreditAmount, ]
    }
    
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtDebitAmount: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtDebitAmount: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 120.0
        layoutY: 50.0
        layoutInfo: __layoutInfo_txtDebitAmount
        styleClass: "Bordetless-text-box"
        text: bind txtDebitAmountText
    }
    
    public-read def panelDrNote: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind TextboxBalance
        content: [ label7, txtDebitAmount, ]
    }
    
    def __layoutInfo_txtTotalBalanceDue: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind AmtTextW
        height: 31.0
    }
    public-read def txtTotalBalanceDue: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: true
        layoutX: bind TextboxBalancedue
        layoutY: 147.0
        layoutInfo: __layoutInfo_txtTotalBalanceDue
        styleClass: "Bordetless-text-box"
        text: bind txtTotalBalanceDueText
        promptText: "0.00"
        editable: false
    }
    
    public-read def rectViewAll: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind rectbutton2LX
        layoutY: bind rectbuttonLY
        width: 100.0
        height: 50.0
    }
    
    def __layoutInfo_labelViewPayments: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def labelViewPayments: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind rectbutton2LX
        layoutY: bind rectbuttonLY
        layoutInfo: __layoutInfo_labelViewPayments
        text: "Label"
    }
    
    public-read def payPanel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelCalenderLX
        layoutY: 152.0
    }
    
    def __layoutInfo_listPayment: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listPayment: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: 327.0
        layoutY: 47.0
        layoutInfo: __layoutInfo_listPayment
        items: null
    }
    
    def __layoutInfo_listDistributorName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listDistributorName: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C2LX
        layoutY: 142.0
        layoutInfo: __layoutInfo_listDistributorName
        onKeyPressed: listDistributorNameOnKeyPressed
        items: [ "Item 1", "Item 2", "Item 3", ]
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
    
    def __layoutInfo_txtHolderName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtHolderName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 89.0
        layoutInfo: __layoutInfo_txtHolderName
        onKeyPressed: txtHolderNameOnKeyPressed
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
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtAccCardNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtAccCardNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 66.0
        layoutInfo: __layoutInfo_txtAccCardNo
        onKeyPressed: txtAccCardNoOnKeyPressed
        promptText: ""
        font: Arial_12
    }
    
    public-read def panelColumn4: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind C4LX
        content: [ txtAccCardNo, cmboChequeNo, txtPayTypeDate, txtBankName, imageDate, txtHolderName, ]
    }
    
    def __layoutInfo_txtPmtDName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtPmtDName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 112.0
        layoutInfo: __layoutInfo_txtPmtDName
        onKeyPressed: txtPmtDNameOnKeyPressed
        onKeyReleased: txtPmtDNameOnKeyReleased
        promptText: ""
        font: Arial_12
    }
    
    def __layoutInfo_txtPmtDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
        hfill: false
    }
    public-read def txtPmtDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 89.0
        layoutInfo: __layoutInfo_txtPmtDate
        style: ""
        styleClass: "text-box"
        onKeyPressed: txtPmtDateOnKeyPressed
        effect: null
        text: ""
        promptText: ""
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtPmtPayNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtPmtPayNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 66.0
        layoutInfo: __layoutInfo_txtPmtPayNo
        text: ""
        promptText: "Auto Generted Code..."
        selectOnFocus: false
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtpayHidden: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtpayHidden: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 478.0
        layoutY: 21.0
        layoutInfo: __layoutInfo_txtpayHidden
        font: Arial_12
    }
    
    def __layoutInfo_txtRecNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtRecNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind SearchTextboxLX
        layoutY: 102.0
        layoutInfo: __layoutInfo_txtRecNo
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
    
    def __layoutInfo_btnPmtEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnPmtEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton2LX
        layoutInfo: __layoutInfo_btnPmtEdit
        graphic: imageView7
        text: "Button"
        font: Arial_Bold_14
        action: btnPmtEditAction
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
    
    def __layoutInfo_btnPmtCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind CancelW
        height: bind bottonH
    }
    public-read def btnPmtCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton4LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnPmtCancel
        onKeyPressed: btnPmtCancelOnKeyPressed
        onMouseClicked: btnPmtCancelOnMouseClicked
        effect: reflectionEffect
        graphic: imgCancel
        text: bind btnPmtCancelText
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnPmtReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnPmtReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton3LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnPmtReset
        onKeyPressed: btnPmtResetOnKeyPressed
        onMouseClicked: btnPmtResetOnMouseClicked
        effect: reflectionEffect
        graphic: imageView2
        text: bind btnPmtResetText
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnPmtSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnPmtSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnPmtSave
        onKeyPressed: btnPmtSaveOnKeyPressed
        onMouseClicked: btnPmtSaveOnMouseClicked
        translateX: 0.0
        effect: reflectionEffect
        graphic: imageView
        text: bind btnPmtSaveText
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    public-read def panelButtons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: bind panelButtonsLY
        content: [ btnPmtSave, btnPmtEdit, btnPmtReset, btnPmtCancel, ]
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
        text: "Total Balance Due "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 66.0
        text: "Number"
        font: Arial_12
        textFill: DarkGray
    }
    
    def __layoutInfo_label6: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 155.0
        height: 16.0
    }
    public-read def label6: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 95.0
        layoutInfo: __layoutInfo_label6
        text: "Holder Name"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label15: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 112.0
        text: "Bank Name"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label16: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 135.0
        text: "Expiry Date"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def panelColumn3: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind C3LX-10.0
        content: [ label16, label15, label6, label4, ]
    }
    
    public-read def label13: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 135.0
        text: "Payment Type  "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label11: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 112.0
        text: "Distributor Name "
        font: Arial_12
        textFill: DarkGray
    }
    
    def __layoutInfo_labelRemoveRow: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 120.0
    }
    public-read def labelRemoveRow: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind RemoveRowLX
        layoutY: bind RemoveRowLY
        layoutInfo: __layoutInfo_labelRemoveRow
        onKeyPressed: label3OnKeyPressed
        onMouseClicked: label3OnMouseClicked
        text: "Remove Row"
        font: Arial_Bold_12
        hpos: javafx.geometry.HPos.CENTER
        textFill: DarkGray
    }
    
    public-read def label14: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 66.0
        text: "Payment No "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 89.0
        styleClass: "label"
        text: "Date "
        font: Arial_12
        textFill: DarkGray
    }
    
    def __layoutInfo_label: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
    }
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 1.0
        layoutInfo: __layoutInfo_label
        effect: null
        text: "Payment - ctrl+P"
        font: Arial_25
        hpos: javafx.geometry.HPos.CENTER
        textFill: DarkGray
    }
    
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        opacity: 1.0
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "form-background"
        onMouseClicked: rectangleOnMouseClickedAtShown
        fill: linearGradient
        stroke: DarkGray
        width: bind panelW
        height: bind panelH
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
    
    def __layoutInfo_txtPmtAmtPaid: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind AmtTextW
        height: 44.0
    }
    public-read def txtPmtAmtPaid: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind TextboxPaid
        layoutY: 469.0
        layoutInfo: __layoutInfo_txtPmtAmtPaid
        styleClass: "Bordetless-text-box"
        text: bind txtPmtAmtPaidText
        promptText: "0.00"
        editable: false
        font: Arial_35
    }
    
    def __layoutInfo_txtPmtBalAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind AmtTextW
        height: 44.0
    }
    public-read def txtPmtBalAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind TextboxBalance
        layoutY: 469.0
        layoutInfo: __layoutInfo_txtPmtBalAmt
        styleClass: "Bordetless-text-box"
        text: bind txtPmtBalAmtText
        promptText: "0.00"
        editable: false
        font: Arial_35
    }
    
    public-read def panelAmtTextboxes: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ label1, label12, label5, txtTotalBalanceDue, txtPmtBalAmt, txtPmtAmtPaid, ]
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
        fill: Yellow
        stroke: DarkGray
        strokeWidth: 2.0
        width: 120.0
        height: 20.0
        arcWidth: 10.0
        arcHeight: 10.0
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
    }
    
    public-read def image2: javafx.scene.image.Image = javafx.scene.image.Image {
    }
    
    public-read def Arial_Bold_65: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 50.0
    }
    
    public-read def Arial_Bold__50: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 50.0
    }
    
    public-read def linearGradient2: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
    }
    
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 0.25
        styleClass: "rectFormHeader"
        fill: linearGradient2
        width: bind panelW
        height: 32.0
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
    
    public-read def imageBack: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/arrow_Left.png"
    }
    
    public-read def imageViewAll: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/ViewAll.png"
    }
    
    public-read def imageSearch: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Search.png"
    }
    
    public-read def imageEdit: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Edit.png"
    }
    
    public-read def font_amt: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 50.0
    }
    
    public-read def image3: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imageView8: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind Type1TextboxW+C2LX
        layoutY: 123.0
        image: image3
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutX: 0.0
        layoutY: 0.0
        content: [ label2, imagePayDate, panelButtons, txtPmtPayNo, payPanel2, label14, imageView8, txtPmtDate, cmbPaymentType, rectRemoveRow, labelRemoveRow, button, label11, label13, txtPmtDName, panelColumn3, panelColumn4, panelBottomTextboxes, rectViewAll, labelViewPayments, payPanel, listPayment, listDistributorName, ]
    }
    
    public-read def image4: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imageView9: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind SearchTextboxLX+Type1TextboxW
        layoutY: 38.0
        image: image4
    }
    
    public-read def panelView: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ label17, txtRecNo, btnSearch, listView2, panelViewTable, rectTableBorder1, btnBack, btnViewAll, txtpayHidden, listPayymentNo, labelMsg, imageView9, ]
    }
    
    public-read def panelpayment: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        content: [ rectangle, rectHeader, label, panelTable, rectTableBorder, panelView, panel, panelAlert, ]
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
                            rectangle.arcWidth = 5.0;
                            rectangle.arcHeight = 5.0;
                            rectHeader.visible = true;
                            label.visible = true;
                            rectTableBorder.visible = true;
                            label17.visible = false;
                            label17.layoutY = 108.0;
                            label17.text = "Label";
                            txtRecNo.visible = false;
                            txtRecNo.layoutY = 102.0;
                            txtRecNo.font = Arial_12;
                            imageView6.visible = false;
                            imageView6.image = null;
                            btnSearch.visible = false;
                            btnSearch.layoutY = 102.0;
                            btnSearch.text = "Button";
                            listView2.visible = false;
                            listView2.layoutX = 130.0;
                            listView2.layoutY = 205.0;
                            panelViewTable.visible = false;
                            rectTableBorder1.visible = true;
                            imageView4.visible = false;
                            imageView4.image = null;
                            btnBack.visible = false;
                            btnBack.text = "Button";
                            imageView5.visible = false;
                            imageView5.image = null;
                            btnViewAll.visible = false;
                            btnViewAll.text = "Button";
                            txtpayHidden.visible = true;
                            __layoutInfo_txtpayHidden.width = 92.0;
                            listPayymentNo.visible = false;
                            listPayymentNo.layoutY = 142.0;
                            labelMsg.visible = false;
                            labelMsg.text = "Label";
                            labelMsg.hpos = javafx.geometry.HPos.LEFT;
                            labelMsg.textFill = javafx.scene.paint.Color.BLACK;
                            imageView9.visible = false;
                            imageView9.layoutY = 38.0;
                            imageView9.blocksMouse = false;
                            panelView.visible = false;
                            imagePayDate.visible = true;
                            imagePayDate.onMouseClicked = imagePayDateOnMouseClickedAtShown;
                            imagePayDate.blocksMouse = true;
                            imageView.visible = true;
                            imageView.image = imageSave;
                            btnPmtSave.layoutY = 0.0;
                            btnPmtSave.onKeyReleased = btnPmtSaveOnKeyReleasedAtShown;
                            imageView7.visible = true;
                            imageView7.image = imageEdit;
                            btnPmtEdit.visible = true;
                            btnPmtEdit.effect = reflectionEffect;
                            btnPmtEdit.text = "Edit [F6]";
                            imageView2.visible = true;
                            imageView2.image = imageReset;
                            btnPmtReset.layoutY = 0.0;
                            imgCancel.visible = true;
                            btnPmtCancel.layoutY = 0.0;
                            panelButtons.visible = true;
                            txtPmtPayNo.onKeyPressed = txtPmtPayNoOnKeyPressedAtShown;
                            payPanel2.visible = false;
                            label14.text = "Payment No.";
                            imageView8.visible = true;
                            imageView8.layoutY = 112.0;
                            imageView8.onMouseClicked = imageView8OnMouseClickedAtShown;
                            imageView8.blocksMouse = true;
                            cmbPaymentType.onKeyPressed = cmbPaymentTypeOnKeyPressedAtShown;
                            rectRemoveRow.styleClass = "rectbutton";
                            rectRemoveRow.width = 120.0;
                            __layoutInfo_labelRemoveRow.width = 120.0;
                            __layoutInfo_labelRemoveRow.height = 20.0;
                            labelRemoveRow.text = "Remove Row  [F12]";
                            labelRemoveRow.hpos = javafx.geometry.HPos.CENTER;
                            labelRemoveRow.vpos = javafx.geometry.VPos.CENTER;
                            labelRemoveRow.textFill = javafx.scene.paint.Color.BLACK;
                            txtPmtDName.onKeyPressed = txtPmtDNameOnKeyPressedAtShown;
                            label6.layoutY = 89.0;
                            label6.text = "Holder Name";
                            txtAccCardNo.font = Arial_12;
                            imageDate.layoutY = 135.0;
                            imageDate.blocksMouse = true;
                            label3.visible = true;
                            label3.text = "Credit Note Amount:";
                            label3.font = Arial_Bold_12;
                            label3.textFill = Green;
                            txtCreditAmount.layoutY = 0.0;
                            txtCreditAmount.editable = false;
                            txtCreditAmount.font = Arial_Bold_14;
                            panelCrNote.visible = true;
                            label7.visible = true;
                            label7.text = "Debit Note Amount:";
                            label7.font = Arial_Bold_12;
                            label7.textFill = Green;
                            txtDebitAmount.layoutY = 0.0;
                            txtDebitAmount.editable = false;
                            txtDebitAmount.font = Arial_Bold_14;
                            panelDrNote.visible = true;
                            label1.layoutY = 0.0;
                            label1.font = Arial_14;
                            label12.layoutY = 0.0;
                            label12.font = Arial_14;
                            label5.layoutY = 0.0;
                            label5.font = Arial_14;
                            txtTotalBalanceDue.layoutY = 10.0;
                            __layoutInfo_txtTotalBalanceDue.height = 70.0;
                            txtTotalBalanceDue.onKeyPressed = txtTotalBalanceDueOnKeyPressedAtShown;
                            txtTotalBalanceDue.promptText = "0.00";
                            txtTotalBalanceDue.selectOnFocus = false;
                            txtTotalBalanceDue.font = font_amt;
                            txtPmtBalAmt.layoutY = 12.0;
                            __layoutInfo_txtPmtBalAmt.height = 70.0;
                            txtPmtBalAmt.onKeyPressed = txtPmtBalAmtOnKeyPressedAtShown;
                            txtPmtBalAmt.selectOnFocus = false;
                            txtPmtBalAmt.font = font_amt;
                            txtPmtAmtPaid.layoutY = 10.0;
                            __layoutInfo_txtPmtAmtPaid.height = 70.0;
                            txtPmtAmtPaid.onKeyPressed = txtPmtAmtPaidOnKeyPressedAtShown;
                            txtPmtAmtPaid.selectOnFocus = false;
                            txtPmtAmtPaid.font = font_amt;
                            txtPmtAmtPaid.multiline = false;
                            panelAmtTextboxes.visible = true;
                            panelAmtTextboxes.managed = true;
                            panelAmtTextboxes.layoutX = 0.0;
                            panelAmtTextboxes.layoutY = 17.0;
                            panelBottomTextboxes.visible = true;
                            rectViewAll.visible = true;
                            rectViewAll.cursor = javafx.scene.Cursor.HAND;
                            rectViewAll.styleClass = "rectbutton";
                            rectViewAll.onMouseClicked = rectViewAllOnMouseClickedAtShown;
                            rectViewAll.fill = linearGradient;
                            rectViewAll.stroke = DarkGray;
                            rectViewAll.strokeWidth = 2.0;
                            rectViewAll.height = 20.0;
                            rectViewAll.arcWidth = 10.0;
                            rectViewAll.arcHeight = 10.0;
                            labelViewPayments.visible = true;
                            __layoutInfo_labelViewPayments.width = 100.0;
                            __layoutInfo_labelViewPayments.height = 20.0;
                            labelViewPayments.text = "View Payments";
                            labelViewPayments.font = Arial_Bold_12;
                            labelViewPayments.hpos = javafx.geometry.HPos.CENTER;
                            payPanel.blocksMouse = true;
                            listDistributorName.layoutY = 132.0;
                            panel.visible = true;
                            panelpayment.visible = true;
                            panelpayment.styleClass = "";
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
                            rectangle.blocksMouse = false;
                            rectangle.arcWidth = 0.0;
                            rectangle.arcHeight = 0.0;
                            rectHeader.visible = true;
                            label.visible = true;
                            rectTableBorder.visible = false;
                            label17.visible = true;
                            label17.layoutY = 82.0;
                            label17.text = "Distributor Name";
                            label17.font = Arial_12;
                            txtRecNo.visible = true;
                            txtRecNo.layoutY = 82.0;
                            txtRecNo.onKeyPressed = txtRecNoOnKeyPressedAtView;
                            txtRecNo.onKeyReleased = txtRecNoOnKeyReleasedAtView;
                            txtRecNo.font = Arial_12;
                            imageView6.visible = true;
                            imageView6.image = imageSearch;
                            btnSearch.visible = true;
                            btnSearch.layoutY = 80.0;
                            __layoutInfo_btnSearch.width = 100.0;
                            __layoutInfo_btnSearch.height = 25.0;
                            btnSearch.onKeyPressed = btnSearchOnKeyPressedAtView;
                            btnSearch.onMouseClicked = btnSearchOnMouseClickedAtView;
                            btnSearch.effect = reflectionEffect;
                            btnSearch.text = "Search";
                            btnSearch.font = Arial_Bold_12;
                            listView2.visible = false;
                            listView2.layoutX = 42.0;
                            listView2.layoutY = 218.0;
                            __layoutInfo_listView2.width = 709.0;
                            __layoutInfo_listView2.height = 201.0;
                            panelViewTable.visible = true;
                            rectTableBorder1.visible = true;
                            imageView4.visible = true;
                            imageView4.image = imageBack;
                            btnBack.visible = true;
                            btnBack.effect = reflectionEffect;
                            btnBack.text = "Back [Ctrl+Left]";
                            btnBack.font = Arial_Bold_14;
                            btnBack.action = btnBackActionAtView;
                            imageView5.visible = true;
                            imageView5.image = imageViewAll;
                            btnViewAll.visible = true;
                            btnViewAll.onMouseClicked = btnViewAllOnMouseClickedAtView;
                            btnViewAll.effect = reflectionEffect;
                            btnViewAll.text = "ViewAll";
                            btnViewAll.font = Arial_Bold_14;
                            txtpayHidden.visible = false;
                            listPayymentNo.visible = false;
                            listPayymentNo.layoutY = 104.0;
                            labelMsg.visible = true;
                            __layoutInfo_labelMsg.height = 20.0;
                            labelMsg.text = "Please select the row from table to edit the value";
                            labelMsg.font = Arial_Bold_14;
                            labelMsg.hpos = javafx.geometry.HPos.LEFT;
                            labelMsg.textFill = Green;
                            imageView9.visible = true;
                            imageView9.layoutY = 82.0;
                            imageView9.onMouseClicked = imageView9OnMouseClickedAtView;
                            imageView9.blocksMouse = true;
                            panelView.visible = true;
                            imagePayDate.visible = false;
                            imagePayDate.blocksMouse = false;
                            imageView.visible = false;
                            imageView.image = null;
                            btnPmtSave.layoutY = 525.0;
                            imageView7.visible = false;
                            imageView7.image = null;
                            btnPmtEdit.visible = false;
                            btnPmtEdit.text = "Button";
                            imageView2.visible = false;
                            imageView2.image = null;
                            btnPmtReset.layoutY = 525.0;
                            imgCancel.visible = false;
                            btnPmtCancel.layoutY = 525.0;
                            panelButtons.visible = false;
                            payPanel2.visible = false;
                            label14.text = "Payment No ";
                            imageView8.visible = false;
                            imageView8.layoutY = 123.0;
                            imageView8.blocksMouse = false;
                            cmbPaymentType.onMouseClicked = cmbPaymentTypeOnMouseClickedAtView;
                            rectRemoveRow.styleClass = "";
                            rectRemoveRow.width = 120.0;
                            __layoutInfo_labelRemoveRow.width = 120.0;
                            labelRemoveRow.text = "Remove Row";
                            labelRemoveRow.hpos = javafx.geometry.HPos.CENTER;
                            labelRemoveRow.textFill = DarkGray;
                            txtPmtDName.onKeyPressed = txtPmtDNameOnKeyPressed;
                            label6.layoutY = 95.0;
                            label6.text = "Holder Name";
                            txtAccCardNo.font = Arial_12;
                            imageDate.layoutY = 133.0;
                            imageDate.blocksMouse = false;
                            label3.visible = false;
                            label3.text = "Label";
                            label3.textFill = javafx.scene.paint.Color.BLACK;
                            txtCreditAmount.layoutY = 38.0;
                            txtCreditAmount.editable = true;
                            panelCrNote.visible = false;
                            label7.visible = false;
                            label7.text = "Label";
                            label7.textFill = javafx.scene.paint.Color.BLACK;
                            txtDebitAmount.layoutY = 50.0;
                            txtDebitAmount.editable = true;
                            panelDrNote.visible = false;
                            label1.layoutY = 126.0;
                            label1.font = Arial_12;
                            label12.layoutY = 477.0;
                            label12.font = Arial_16;
                            label5.layoutY = 477.0;
                            label5.font = Arial_16;
                            txtTotalBalanceDue.layoutY = 147.0;
                            __layoutInfo_txtTotalBalanceDue.height = 31.0;
                            txtTotalBalanceDue.promptText = "0.00";
                            txtTotalBalanceDue.selectOnFocus = true;
                            txtPmtBalAmt.layoutY = 469.0;
                            __layoutInfo_txtPmtBalAmt.height = 44.0;
                            txtPmtBalAmt.selectOnFocus = true;
                            txtPmtBalAmt.font = Arial_35;
                            txtPmtAmtPaid.layoutY = 469.0;
                            __layoutInfo_txtPmtAmtPaid.height = 44.0;
                            txtPmtAmtPaid.selectOnFocus = true;
                            txtPmtAmtPaid.font = Arial_35;
                            txtPmtAmtPaid.multiline = false;
                            panelAmtTextboxes.visible = false;
                            panelAmtTextboxes.managed = true;
                            panelAmtTextboxes.layoutX = 0.0;
                            panelAmtTextboxes.layoutY = 0.0;
                            panelBottomTextboxes.visible = false;
                            rectViewAll.visible = false;
                            rectViewAll.styleClass = "";
                            rectViewAll.fill = javafx.scene.paint.Color.BLACK;
                            rectViewAll.stroke = null;
                            rectViewAll.strokeWidth = 1.0;
                            rectViewAll.height = 50.0;
                            rectViewAll.arcWidth = 0.0;
                            rectViewAll.arcHeight = 0.0;
                            labelViewPayments.visible = false;
                            labelViewPayments.text = "Label";
                            labelViewPayments.hpos = javafx.geometry.HPos.LEFT;
                            payPanel.blocksMouse = false;
                            listDistributorName.layoutY = 142.0;
                            panel.visible = false;
                            panelpayment.visible = true;
                            panelpayment.styleClass = "";
                        }
                    }
                ]
            }
        ]
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panelpayment, ]
    }
    // </editor-fold>//GEN-END:main

    function changeTableSize(i: Integer): Void { // This function is used for Changing Table Size(Width,Height)
        paymentTableComp.getJComponent().setPreferredSize(new Dimension(i, TableH));
        doctorCharTab.getJComponent().setPreferredSize(new Dimension(i, TableViewH));
    }

    

    function btnBackOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function cmbPaymentTypeOnMouseClickedAtView(event: javafx.scene.input.MouseEvent): Void {

        payTypeChange();
    }

    function cmbPaymentTypeOnMouseReleased(event: javafx.scene.input.MouseEvent): Void {
        payTypeChange();
        updateValues();
    }

    function listChanges(type: Integer): Void {
        if(not listPayymentNo.visible){
        var listControlObj: ListController = new ListController();
        listW = txtRecNo.width;
        listH = listControlObj.listImageControlView(txtRecNo, listPayymentNo, "Distributor", type);
        }
        else{
            listPayymentNo.visible = false;
            txtRecNo.requestFocus();
        }
    }

    function imageView9OnMouseClickedAtView(event: javafx.scene.input.MouseEvent): Void {
        listChanges(0);
    }

    function imageView8OnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        listDistributorChanges(0);
    }

    function rectangleOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {

        listDistributorName.visible = false;
        listPayment.visible = false;
        payPanel.visible = false;
        listPayymentNo.visible = false;
    }
    function btnPmtEditAction(): Void {
        ViewState();
    }
    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Payment", type);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Payment", msg);
        showAlertbox();

    }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Payment", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = error;
    }

    function imagePayDateOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        payPanel.visible = true;
        if (not curDateFlag1) {
            panelCalenderLX = txtPmtDate.layoutX;
            payPanel.layoutY = txtPmtDate.layoutY + txtPmtDate.height + 2.0;
            if (txtPmtDate.text != null) {
                var dat = txtPmtDate.rawText.trim().split("-");
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
            //fxCalendar.visible = not fxCalendar.visible;
            fxCalendar.visible = true;
            curDateFlag1 = true;
        } else {
            fxCalendar.visible = false;
        }
    }

    function btnPmtSaveOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    var key = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 5 and CommonDeclare.form[4] == 1) {
            shortcut(key);
        }
    }

    public function removeTableRows(): Void {
        payTable.removeRow();
        payTable.paymentCalculations();
        updateValues();
    }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == kr.save and btnPmtSaveText == "Save [F3]" and not btnPmtSave.disable) {
            saveClick();
        }
        if (event.code == kr.update and btnPmtSaveText == "Update [F7]" and not btnPmtSave.disable) {
            saveClick();
        }
        if (event.code == kr.del and btnPmtResetText == "Delete [F5]" and not btnPmtReset.disable) {
            delClick();
        }
        if (event.code == kr.edit) {
            btnPmtEditAction();
        }
        if (event.code == kr.reset and btnPmtResetText == "Reset [F4]") {
            clearAll();
        }
        if (event.code == kr.cancel) {
            if (btnPmtCancelText == "Cancel [F8]") {
                panelpayment.visible = false;
                CancelForm();
            }
        }
        if (event.code == kr.rRow) {
            removeTableRows();
        }
        if (event.controlDown and event.code == kr.back) {
            if (btnPmtCancelText == "Back [Ctrl+Left]") { clearAll(); }
            if (btnBack.text == "Back [Ctrl+Left]") { currentState.actual = currentState.findIndex("Shown"); }
        }
    }

    function txtPmtBalAmtOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function txtPmtAmtPaidOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function txtTotalBalanceDueOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function cmbPaymentTypeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function txtPmtDNameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtPmtDName.style = mandatory;
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            if (sar == 0 or txtPmtDName.rawText.trim() == null or txtPmtDName.rawText.trim().length() == 0 or txtPmtDName.rawText.trim() == "null") {
                txtPmtDName.text = "";
            }
        }
        if (event.code == KeyCode.VK_ESCAPE) {
            listDistributorName.visible = false;
        }

        shortcut(event);
    }

    function txtPmtPayNoOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function btnViewAllOnMouseClickedAtView(event: javafx.scene.input.MouseEvent): Void {
        payTable.clearData();
        viewPaymentTable.LoadPaymentValues("all", "");
    }

    function btnSearchOnMouseClickedAtView(event: javafx.scene.input.MouseEvent): Void {
        listPayymentNo.visible = false;
        searchclick();
    }

    function searchclick(): Void {
        var docName: String = "";
        docName = txtRecNo.text;
        viewPaymentTable.LoadPaymentValues("distnamesearch", docName);
    }

    function btnSearchOnKeyPressedAtView(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            listPayymentNo.visible = false;
            searchclick();
        }
        shortcut(event);
    }

    function txtRecNoOnKeyPressedAtView(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            listPayymentNo.visible = false;
            if (sar1 == 0 or txtRecNo.rawText.trim() == null or txtRecNo.rawText.trim().length() == 0 or txtRecNo.rawText.trim() == "null") {
                txtRecNo.text = " ";
            }
            btnSearch.requestFocus();

        }
        shortcut(event);
    }

    function txtRecNoOnKeyReleasedAtView(event: javafx.scene.input.KeyEvent): Void {
        listChanges(1);
        if (event.code == KeyCode.VK_DOWN) {
            listPayymentNo.requestFocus();
            listPayymentNo.selectFirstRow();
        }
        if (event.code == KeyCode.VK_ESCAPE) {
            listPayymentNo.visible = false;
        }

    }

    function rectViewAllOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        ViewState();
    }

    function ViewState(): Void { // This function is used for showing view state.
        viewPaymentTable.LoadPaymentValues("basicsearch", "");
        currentState.actual = currentState.findIndex("View");
        doctorCharTab.visible = true;
        charDoctorId = "";
    }

    function btnBackActionAtView(): Void {
        currentState.actual = currentState.findIndex("Shown");
        clearAll();
    }

    var visit = bind fxCalendar.visible on replace {
        if (curDateFlag and not visit) {
            getDate(0);
        } else if (curDateFlag1 and not visit) {
            getDate(1);
        }
    };

    function getDate(i: Integer) { // this method is used for showing fx calender.
        if (i == 0) {
            txtPayTypeDate.text = fxCalendar.getSelectedDate();
            curDateFlag = false;
            curDateFlag1 = false;
            cmbPaymentType.requestFocus();
        } else if (i == 1) {
            txtPmtDate.text = fxCalendar.getSelectedDate();
            curDateFlag = false;
            curDateFlag1 = false;

        }
    }

    function imageDateOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        payPanel.visible = true;
        if (not curDateFlag) {
            panelCalenderLX = txtPayTypeDate.layoutX + C4LX;
            payPanel.layoutY = txtPayTypeDate.layoutY + txtPayTypeDate.height + 2.0;

            if (txtPayTypeDate.rawText.trim() != null) {
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

    function label3OnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        removeTableRows();
    }

    function label3OnKeyPressed(event: javafx.scene.input.KeyEvent): Void {

        removeTableRows();
    }

    function btnPmtCancelOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if (btnPmtCancelText == "Cancel [F8]") {
            panelpayment.visible = false;
            paymentTableComp.visible = false;
            CancelForm();
        } else {
            clearAll();
        }

    }

    function btnPmtCancelOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            if (btnPmtCancelText == "Cancel [F8]") {
                panelpayment.visible = false;
                paymentTableComp.visible = false;
                CancelForm();
            } else { clearAll(); }
        }
    }

    function delClick(): Void { // this method is used for delete payment.
        try {


            if (btnPmtResetText == "Reset [F4]") {
                clearAll();
            } else {
  var cn:ConfirmDialogBox=new ConfirmDialogBox(1,"Payment");
                            var a =bind cn.staus;
                                if (a) {
                                    var paymentModel = new PaymentModel();
                                    paymentModel = validationCheck();
                                    paymentModel.setPaymentHiddenNumber(txtpayHidden.rawText);
                                    paymentModel.setCardNumber(chequeEditNo);

                                    var status = false;
                                    status = paymentcontroller.deleteRecord(paymentModel); // controller call
                                    if (status == true) {
                                        FXalert(5);
                                        clearAll();
                                        txtPmtDName.requestFocus();
                                    }
                                }


            }
        } catch (e: Exception) {
            var msg: String = "Class : Payment  Method : DelClick()   = {e.getMessage()}";
            log.debug(msg);            
        }
    }

    function btnPmtResetOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        delClick();
    }

    function btnPmtResetOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            delClick(); }
    }

    function btnPmtSaveOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        saveClick();
    }

    function btnPmtSaveOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            saveClick(); }
    }

    function txtPayTypeDateOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            payTable.focusSet();
        } shortcut(event);
    }

    function txtHolderNameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtBankName.requestFocus();
        } shortcut(event);
    }

    function txtBankNameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtPayTypeDate.requestFocus();
        } shortcut(event);
    }

    function txtAccCardNoOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtHolderName.requestFocus();
        } shortcut(event);
    }

    function txtPmtDateOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtPmtDName.requestFocus();
        } shortcut(event);
    }

    function listDistributorChanges(type: Integer): Void {
        if(not listDistributorName.visible){
        try {
            var listControlObj: ListController = new ListController();
            listW = txtPmtDName.width;
            listH = listControlObj.listImageControlView(txtPmtDName, listDistributorName, "Distributor", type);
            var selS: String = bind listControlObj.selectedString on replace {
             
                if (selS.length() > 0) {
                    var balan: Double = 0.0;
                    balan = displayPaymentDetails(selS);

                    txtTotalBalanceDueText = Value.Round(balan);
                    txtPmtBalAmtText = Value.Round(balan);
                    txtPmtAmtPaidText = "0.00";
                    listDistributorName.visible = false;
                    cmbPaymentType.requestFocus();
                    payTable.clearData();
                    updateValues();
                    cmbPaymentType.requestFocus();
                } } } catch (e: Exception) {
            
        }
      }
        else{
            listDistributorName.visible = false;
            txtPmtDName.requestFocus();
        }
    }

    function txtPmtDNameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            listDistributorName.visible =false;
            if (sar == 0 or txtPmtDName.rawText.trim() == null or txtPmtDName.rawText.trim().length() == 0 or txtPmtDName.rawText.trim() == "null") {
                txtPmtDName.text = "";
            }
        }
        shortcut(event);
    }
    function txtPmtDNameOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        listDistributorChanges(1);
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            if (txtPmtDName.rawText.trim() == null or txtPmtDName.rawText.trim() == "null") {
                txtPmtDName.text = " ";
            }
        }
        if (event.code == KeyCode.VK_DOWN) {
            listDistributorName.requestFocus();
            listDistributorName.selectFirstRow();
        }
        if (event.code == KeyCode.VK_ESCAPE) {
            listDistributorName.visible = false;
        }
    }

    function cmbPaymentTypeOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        payTypeChange();
    }

    function payTypeChange(): Void {
        var payType = cb;
        payTypeChange1(payType);
    }

    function payTypeChange1(sar): Void { // this medthod is payment type based showing textboxes
        var payType = sar;
        leftSideValues(payType);
              if( btnPmtSaveText == "Save [F3]"){

        txtAccCardNo.text = "";
        txtHolderName.text = "";
        txtBankName.text = "";
         cmboChequeNo.select(0);
         }

        if (payType == "Cash") {
               txtAccCardNo.text = "";
        txtHolderName.text = "";
        txtBankName.text = "";
       
            txtAccCardNo.editable = false;          
            txtHolderName.editable = false;          
            txtBankName.editable = false;
        } else if (payType == "Cheque") {
            label4.text = "Cheque No.";
            label6.text = "Issued To  ";
        //   cmboChequeNo.select(0);
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

    function listDistributorNameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (listDistributorName.focused) {
            if (event.code == KeyCode.VK_DOWN)
                listDistributorName.selectFirstRow();
        }
    }

    function clearAll(): Void {

        txtAccCardNo.text = "";
        txtBankName.text = "";
        txtHolderName.text = "";
        txtPayTypeDate.text = "";
        txtPmtAmtPaidText = "0.00";
        txtTotalBalanceDueText = "0.00";
        txtPmtAmtPaidText = "0.00";
        txtPmtBalAmtText = "0.00";
        viewPaymentTable.chargerId = "";
        txtAccCardNo.text = "";
        txtAccCardNo.editable = true;
        txtHolderName.text = "";
        txtHolderName.editable = true;
        txtBankName.text = "";
        txtBankName.editable = true;
        txtPmtDName.text = "";
        txtTotalBalanceDueText = "0.00";
        txtPmtBalAmtText = "0.00";
        btnPmtSaveText = "Save [F3]";
        btnPmtResetText = "Reset [F4]";
        btnPmtCancelText = "Cancel [F8]";
        charDoctorId = "";
        txtPmtDName.requestFocus();
        rectRemoveRow.visible = true;
        labelRemoveRow.visible = true;
        balDu = 0;
        txtPmtPayNo.text = comObj.getAutoIncrement(today, "Payments"); // Controller Call
        txtPmtDate.text = today;
        payTable.clearData();
        payTable.focusSet1();
        txtpayHidden.text = "";
        comboValues();
        payTable.distName = "";
        txtCreditAmountText = "0.00";
        txtDebitAmountText = "0.00";
        payTypeChange1("Cash");
        accountNos = comObj.getChequeNumbers("Payment").toArray();  // Controller Call
        chequeEditNo = "";
        imageCanceR = imageCancel;
        txtPayTypeDate.editable = false;
    }

    function validationCheck(): PaymentModel { // This Method is used for Setting bean Values
        var sdf = new SimpleDateFormat("dd-MM-yyyy");
        var paymentModel = new PaymentModel();
        paymentModel.setPaymentNumber(txtPmtPayNo.rawText.trim());
        paymentModel.setPaymentDate(DateUtils.changeFormatDate(sdf.parse(txtPmtDate.rawText.trim())));
        paymentModel.setDistributorName(txtPmtDName.rawText.trim());
        paymentModel.setPaymentType(cmbPaymentType.selectedItem.toString());
        if(cmbPaymentType.selectedItem.toString().equals("Cheque")){
        paymentModel.setCardNumber(cmboChequeNo.selectedItem.toString());
        }else{
              paymentModel.setCardNumber(txtAccCardNo.rawText.trim());
        }

        paymentModel.setBankName(txtBankName.rawText.trim());
        paymentModel.setHolderName(txtHolderName.rawText.trim());
        paymentModel.setPayTypeDate(txtPayTypeDate.rawText.trim());
        paymentModel.setPaymentHiddenNumber(txtpayHidden.rawText.trim());
        paymentModel.setListofitems(payTable.getPaymentItems());
        paymentModel.setTotalBalanceDue(Double.parseDouble(txtTotalBalanceDue.rawText.trim()));
        paymentModel.setTotalPaidAmount(Double.parseDouble(txtPmtAmtPaid.rawText.trim()));
        paymentModel.setBalanceAmount(Double.parseDouble(txtPmtBalAmt.rawText.trim()));
        var transDetails: String = " Payment:{txtPmtPayNo.rawText}, Dist Name : {txtPmtDName.rawText},  Cheque No: {txtAccCardNo.rawText}  ";
        paymentModel.setTransactionDetails(transDetails);
        return paymentModel;
    }

    function saveClick(): Void { // This method is used for save payment.
        var rowCnt = payTable.totalRow();
        try {
		
            if (txtPmtDName.rawText == null or txtPmtDName.rawText.trim().length() == 0) {
                FXinfo("Please enter a valid Distributor Name.", txtPmtDName);
            } else if (cmbPaymentType.selectedItem.toString().equals("Cheque") and (cmbPaymentType.selectedItem.toString() == null or cmbPaymentType.selectedItem.toString() == "-- Select --")) {
                FXinfo("Please Select Cheque No.");
                cmboChequeNo.requestFocus();
            } else if (rowCnt == 0) {
                FXinfo("Please enter a valid value for Payment.", txtPmtDName);
                txtPmtDName.style = mandatory;
                payTable.focusSet();
            } else {
                var paymentModel = new PaymentModel();
                paymentModel = validationCheck();
                if(paymentModel.getTotalPaidAmount()>0.0) {
                paymentModel.setRowCount(rowCnt);

                if (btnPmtSaveText == "Save [F3]") {
                    
                    var returnObject = new Object();
                    returnObject = paymentcontroller.createRecord(paymentModel); // controller call
                    var msgReturnModel: MsgReturnModel = new MsgReturnModel();
                    msgReturnModel = returnObject as MsgReturnModel;
                    payTable.focusSet(msgReturnModel.getRowCount());
                    if (msgReturnModel.getReturnMessage() == "0") {
                        FXalert(Integer.parseInt(msgReturnModel.getReturnMessage()));
                        clearAll();
                        txtPmtDName.requestFocus();
                    } else {
                        FXinfo(msgReturnModel.getReturnMessage());
                    }
                } else {
                  var cn:ConfirmDialogBox=new ConfirmDialogBox(0,"Payment");
                            var a =bind cn.staus;
                                    if (a) {
                                        var returnObject = new Object();
                                        returnObject = paymentcontroller.updateRecord(paymentModel); // controller call
                                        var msgReturnModel: MsgReturnModel = new MsgReturnModel();
                                        msgReturnModel = returnObject as MsgReturnModel;
                                        payTable.focusSet(msgReturnModel.getRowCount());
                                        if (msgReturnModel.getReturnMessage() == "0") {
                                           
                                            clearAll();
                                            txtPmtDName.requestFocus();
                                             FXalert(4);
                                        } else {
                                            FXinfo(msgReturnModel.getReturnMessage());
                                        }
                                    }


                }

                }else{
                   FXinfo("Please Enter Valid Payment Amount");
                }


                }
        } catch (e: Exception) {
            var msg: String = "Class : Payment  Method : saveClick()   = {e.getMessage()}";
            log.debug(msg);
            
        }
    }

    function displayPaymentDetails(name: String): Double { //This method is used to calculate Credit and Debit Amount.and Distributor Total Balance Due.

        var payModel = new Object;
        var bal: Double = 0.00;
        if (name != "null" and name != null and name.trim().length() > 0) {
            try {
			

                payModel = paymentcontroller.getDistributorBalanceAmount(name); // controller call
                var paymentModel: PaymentModel = new PaymentModel();
                paymentModel = payModel as PaymentModel;
                bal = paymentModel.getTotalBalanceDue();
                txtCreditAmountText = Value.Round(paymentModel.getCreditAmount());
                txtDebitAmountText = Value.Round(paymentModel.getDebitAmount());
            } catch (e: Exception) {
                var msg: String = "Class : Payment  Method : displayPaymentDetails()   = {e.getMessage()}";
                log.debug(msg);
                
            }
            bal = Value.Round(bal, 2);
        }
        return bal;

    }

    function ViewPaymentDetails(id): Void { // This Method is used to View Payment Details TextBox Values.

        var payModel = new Object;

        try {
		
            var paymentModel: PaymentModel = new PaymentModel();
            paymentModel.setPaymentNumber(id.toString());
            payModel = paymentcontroller.viewRecord(paymentModel); // controller call
            paymentModel = payModel as PaymentModel;
            cmbPaymentType.items = [paymentModel.getPaymentType(), "Cash", "Cheque", "DD", "Credit card", "Debit Card"];
            cmbPaymentType.select(0);
            txtPmtPayNo.text = paymentModel.getPaymentNumber();
            txtPmtDName.text = paymentModel.getDistributorName();
            txtPmtDate.text = paymentModel.getPaymentDate();
            txtAccCardNo.text = paymentModel.getCardNumber();
            chequeEditNo = paymentModel.getCardNumber();
            txtBankName.text = paymentModel.getBankName();
            txtHolderName.text = paymentModel.getHolderName();
            txtPayTypeDate.text = paymentModel.getPayTypeDate();
            balDu = paymentModel.getTotalPaidAmount();
            txtPmtAmtPaidText = Value.Round(balDu);
            txtPmtBalAmtText = Value.Round(paymentModel.getBalanceAmount());
            accountNos[0] = chequeEditNo;
            if(paymentModel.getPaymentType().equals("Cheque")){
            cmboChequeNo.select(0);
            }
            txtTotalBalanceDueText = Value.Round(paymentModel.getTotalBalanceDue());
        } catch (e: Exception) {
            var msg: String = "Class : Payment  Method : ViewPaymentDetails()   = {e.getMessage()}";
            log.debug(msg);
            
        }

    }

    public function updateValues(): Void { // This Method is used to Calculate Total amount for every table value changes.
        try {

            var sam: String = txtPmtDName.rawText.trim();
            payTable.distName = sam;
            var balan: Double = 0.0;
            if (sam != null and sam.trim().length() > 0) {
                if (btnPmtSaveText == "Update [F7]") {
                    imageCanceR = imageBack;
                    balan = displayPaymentDetails(sam);
                    balan += balDu;
                    txtTotalBalanceDueText = Value.Round(balan);
                }

            }
            if (viewPaymentTable.chargerId != null and viewPaymentTable.chargerId.trim().length() > 5) {
                currentState.actual = currentState.findIndex("Shown");
                charDoctorId = viewPaymentTable.chargerId;
                txtpayHidden.text = charDoctorId;
                viewPaymentTable.chargerId = "";
                btnPmtSaveText = "Update [F7]";
                btnPmtResetText = "Delete [F5]";
                btnPmtCancelText = "Back [Ctrl+Left]";
                CancelW = bottonW;
                imageCanceR = imageBack;
                payTable.loadDPaymentTable(charDoctorId);
                ViewPaymentDetails(charDoctorId);

                labelRemoveRow.visible = false;
                rectRemoveRow.visible = false;
            } else {
                if (charDoctorId == "" or charDoctorId.trim().length() == 0) {
                    labelRemoveRow.visible = true;
                    rectRemoveRow.visible = true;
                    btnPmtSaveText = "Save [F3]";
                    btnPmtResetText = "Reset [F4]";
                    btnPmtCancelText = "Cancel [F8]";
                    CancelW = bottonW;
                    imageCanceR = imageCancel;
                    rectRemoveRow.visible = true;
                    labelRemoveRow.visible = true;
                } else {
                    btnPmtSaveText = "Update [F7]";
                    btnPmtResetText = "Delete [F5]";
                    btnPmtCancelText = "Back [Ctrl+Left]";
                    CancelW = bottonW + 50;
                    imageCanceR = imageBack;
                    rectRemoveRow.visible = false;
                    labelRemoveRow.visible = false;
                }
            }
            if (txtPmtDName.text != null and txtPmtDName.text.trim().length() > 0) {
                txtPmtAmtPaidText = Value.Round(payTable.totalAmt);
                payTable.distName = txtPmtDName.rawText.trim();
                if (btnPmtSaveText == "Update [F7]") {
                    balan = displayPaymentDetails(sam);
                    balan += balDu;
                    txtTotalBalanceDueText = Value.Round(balan);
                    imageCanceR = imageBack;
                }
                var balD: String = "";
                balD = "{txtTotalBalanceDue.rawText.trim() }";
                var amtPa: String = "";
                amtPa = "{txtPmtAmtPaid.rawText.trim()}";
                var dd: Double = Value.Round(Double.valueOf(balD) - Double.valueOf(amtPa), 2);
                txtPmtBalAmtText = Value.Round(dd);
            }
        } catch (e: Exception) {
            var msg: String = "Class : Payment  Method : UpDateValues   = {e.getMessage()}";
            log.debug(msg);
            
        }
    }

    function getPrivileges(u: String): Void { // This Method is used to GetPriveliges to Current User.
	
        var uname = u;
        var utype = comObj.getUserType(uname);  // Controller Call
        if (utype.equals("User")) {
            var priv = comObj.getPrivileges("financial", uname);  // Controller Call
            var ss = priv.split(",");
            var val = Integer.parseInt(ss[0]);
            if (val == 1) {

                btnPmtSave.disable = true;
                if (btnPmtResetText != "Reset [F4]") {
                    btnPmtReset.disable = true;
                } else {
                    btnPmtReset.disable = false;
                }
            } else if (val == 2) {
                if (btnPmtResetText != "Reset [F4]") {
                    btnPmtReset.disable = true;
                } else {
                    btnPmtReset.disable = false;
                }
                btnPmtSave.disable = false;
            } else if (val == 3) {
                btnPmtSave.disable = false;
                btnPmtReset.disable = false;
            }
        } else {
            btnPmtSave.disable = false;
            btnPmtReset.disable = false;
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
    var imageCancelRep = bind btnPmtSaveText on replace {
        backButtonchanges(imageCancelRep);
    }
    var cb = bind cmbPaymentType.selectedItem on replace {
        payTypeChange();
    }
    var logUser: String = bind CommonDeclare.user on replace {
        getPrivileges(logUser);
    }
    var changPiv = bind btnPmtSaveText on replace {
        getPrivileges(logUser);
    }
    var changPiv1 = bind btnPmtResetText on replace {
        getPrivileges(logUser);
    }

    public function comboValues(): Void {
        cmbPaymentType.items = ["Cash", "Cheque", "DD", "Credit card", "Debit Card"];
        cmbPaymentType.select(0);
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
            txtPayTypeDate.text = "";
            txtPayTypeDate.editable = true;
        } else {
            panelColumn3.visible = true;
            panelColumn4.visible = true;
            label16.visible = true;
            label16.text = "Expiry Date";
            imageDate.visible = true;
            txtPayTypeDate.visible = true;
            txtAccCardNo.visible = true;
            cmboChequeNo.visible = false;
        } }

    var coChequeNo = bind cmboChequeNo.selectedItem.toString() on replace {
	
        chqDetails = comObj.getChequeDetails(coChequeNo);  // Controller Call
        try {
            if (chqDetails != null and chqDetails.size() > 2) {
                txtHolderName.text = chqDetails.get(0).toString();
                txtBankName.text = chqDetails.get(1).toString();
                chqAmt = chqDetails.get(2).toString();
                txtPayTypeDate.text = chqAmt;
            }
        } catch (e: Exception) {
             var msg: String = "Class : Payment  Method : leftSideValues()   = {e.getMessage()}";
            log.debug(msg);
        }

    }

    public function StartUp(): Void {
        comboValues();
        payTypeChange1("Cash");
        leftSideValues("Cash");
        (paymentTable as javax.swing.JTable).addKeyListener(KeyAdapter {
            override public function keyTyped(e: java.awt.event.KeyEvent): Void {

                payTable.paymentCalculations();
                updateValues();
            }
        });
        (paymentTable as javax.swing.JTable).addKeyListener(KeyAdapter {
            override public function keyReleased(e: java.awt.event.KeyEvent): Void {

                payTable.paymentCalculations();
                updateValues();
            }
        });
        (paymentTable as javax.swing.JTable).addMouseListener(MouseAdapter {
            override public function mouseClicked(e: java.awt.event.MouseEvent): Void {

                payTable.paymentCalculations();
                updateValues();
            }
        });

        (doctorChargeViewTable as javax.swing.JTable).addMouseListener(MouseAdapter {
            override public function mouseClicked(e: java.awt.event.MouseEvent): Void {
                currentState.actual = currentState.findIndex("Shown");
                clearAll();
                viewPaymentTable.viewPaymentCalculations();
                updateValues();
                updateValues();
                imageCanceR = imageBack;
            }
        });

        currentState.actual = currentState.findIndex("Shown");
        panelpayment.visible = true;
        // panelTable.visible=true;
        paymentTableComp.visible = true;
        clearAll();
        txtPmtDName.style = mandatory;
        cmbPaymentType.select(0);
        txtPmtDate.text = today;
        imageDate.image = Image { url: "{__DIR__}images/Calender.png" };
        imagePayDate.image = Image { url: "{__DIR__}images/Calender.png" };
//        txtPmtDName.requestFocus();
        txtPmtPayNo.requestFocus();
        fxCalendar.visible = false;
        payPanel.content = [fxCalendar,];
        paymentTableComp.layoutX = 0;
        paymentTableComp.layoutY = 0;
        panelTable.content = [paymentTableComp,];
//        payTable.focusSet1();
        doctorCharTab.layoutX = 0;
        doctorCharTab.layoutY = 0;
        panelViewTable.content = [doctorCharTab,];
        getPrivileges(logUser);
        txtCreditAmountText = "0.00";
        txtDebitAmountText = "0.00";
        txtPayTypeDate.editable = false;
    }

    public function CancelForm(): Void {
        CommonDeclare.form[4] = 0;
    }

}
