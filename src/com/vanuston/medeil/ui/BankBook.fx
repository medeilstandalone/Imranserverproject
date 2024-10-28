package com.vanuston.medeil.ui;

import com.vanuston.medeil.ui.calendar.theme.Theme;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.DateUtils;
import java.lang.Exception;
import javafx.scene.input.KeyCode;
import com.vanuston.medeil.util.NumberUtils;
import com.vanuston.medeil.util.Value;
import javafx.scene.control.TextBox;
import javafx.ext.swing.SwingComponent;
import com.vanuston.medeil.uitables.BankBookTable;
import java.awt.Dimension;
import java.text.SimpleDateFormat;
import java.awt.event.MouseAdapter;
import java.lang.Void;
import com.vanuston.medeil.util.KeyRegistry;
import com.vanuston.medeil.model.BankBookModel;
import com.vanuston.medeil.model.MsgReturnModel;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.uitables.ConfirmDialogBox;

public class BankBook {

    var today = DateUtils.now("dd-MM-yyyy");
    var curDateFlag: Boolean = false;
    var curDateFlag1: Boolean = false;
    var fxCalendar = FXCalendar {
                theme: Theme {};
            };
    var panelCalenderLX = 0.0;
    var panelW = bind CommonDeclare.panelFormW on replace {
        panelDate.visible = false;
    }
    var panelH = bind CommonDeclare.panelFormH;
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    def CustomAlert = CustomAlert {};
    var log: Logger = Logger.getLogger(BankBook.class, "financial");
    var mandatory = CommonDeclare.textbox_mandatory();
    var error = CommonDeclare.textbox_error();
    var bank_id: Integer = 0;
    var editAmount: Double = 0.00;
    var editTxnType: String = "";
    var comObj: CommonImplements=RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    var bankBookController: com.vanuston.medeil.implementation.BankBook=RegistryFactory.getClientStub(RegistryConstants.BankBook) as com.vanuston.medeil.implementation.BankBook;
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var C1LX = bind CommonDeclare.Column1LX;
    var C2LX = bind CommonDeclare.Column2LX;
    var C3LX = bind CommonDeclare.Column3LX - 20;
    var C4LX = bind CommonDeclare.Column4LX + 30;
    var botton1LX = bind CommonDeclare.botton1LX;
    var botton2LX = bind CommonDeclare.botton2LX;
    var botton3LX = bind CommonDeclare.botton3LX;
    var botton4LX = bind CommonDeclare.botton4LX;
    var buttonLY = 0.0;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    var bottonW = bind CommonDeclare.bottonW;
    var bottonH = bind CommonDeclare.bottonH;
    var CancelW = bottonW + 10;
    var rectbutton1LX = bind CommonDeclare.rectbutton1LX;
    var rectbutton2LX = bind CommonDeclare.rectbutton2LX;
    var rectbuttonLY = bind CommonDeclare.rectbuttonLY;
    var seperatorW = bind CommonDeclare.seperatorW;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;//100
    var Type4TextboxW = bind CommonDeclare.Type4TextboxW;
    var bankBookTable = new BankBookTable();
    var BankBookviewtable = bankBookTable.createTable();
    var bankTable = SwingComponent.wrap(bankBookTable.getScrollTable(BankBookviewtable));
    var accountNo=comObj.getAccountNumbers().toArray();
    var panelTableLY = 220.0;

    function changeTableSize(i: Integer, j: Integer): Void {
        bankTable.getJComponent().setPreferredSize(new Dimension(i, j));
    }

    var TableW = bind (95.29860229 * panelW) / 100 on replace { var n: Integer = currentState.actual;
        if (n == 0) {
            changeTableSize(TableW, 230);
        } else {
            changeTableSize(TableW, 350);
        } };
    var TableH = 210.0 on replace { var n: Integer = currentState.actual;
        if (n == 0) {
            changeTableSize(TableW, 230);
        } else {
            changeTableSize(TableW, 350);
        } };
    var panelTableLX = bind (panelW - TableW) / 2;
    var closeBalance: String = "0.00";
    var openBalance: String = "0.00";
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def panelheader: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelW
    }
    
    def __layoutInfo_panelTable: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: bind TableH
    }
    public-read def panelTable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelTableLX
        layoutY: bind panelTableLY
        layoutInfo: __layoutInfo_panelTable
    }
    
    public-read def rectangle3: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        layoutX: bind panelTableLX
        layoutY: bind panelTableLY
        styleClass: "rectTableBorder"
        width: bind TableW
        height: bind TableH
    }
    
    public-read def label6: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 16.0
        layoutY: 78.0
        text: "Label"
    }
    
    def __layoutInfo_label5: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 22.0
        layoutY: 38.0
        layoutInfo: __layoutInfo_label5
        text: "Label"
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 420.0
        layoutY: 38.0
        text: "Label"
    }
    
    def __layoutInfo_cboAcNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def cboAcNo: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: bind C2LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_cboAcNo
        onKeyPressed: cboAcNoOnKeyPressedAtView
        items: bind accountNo
    }
    
    def __layoutInfo_txtAmount: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtAmount: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX
        layoutY: 73.0
        layoutInfo: __layoutInfo_txtAmount
        onKeyPressed: txtAmountOnKeyPressed
        onKeyReleased: txtAmountOnKeyReleased
    }
    
    def __layoutInfo_cboExpense: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def cboExpense: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: bind C2LX
        layoutY: 46.0
        layoutInfo: __layoutInfo_cboExpense
        items: bind expense
    }
    
    def __layoutInfo_cboTxnType: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def cboTxnType: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: bind C2LX
        layoutY: 93.0
        layoutInfo: __layoutInfo_cboTxnType
        items: bind TxnType
    }
    
    def __layoutInfo_txtFromDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtFromDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 510.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_txtFromDate
    }
    
    def __layoutInfo_txtToDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtToDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 647.0
        layoutY: -2.0
        layoutInfo: __layoutInfo_txtToDate
    }
    
    public-read def imgFrom: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 581.0
        layoutY: 21.0
    }
    
    public-read def imgTo: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 719.0
        layoutY: 21.0
    }
    
    def __layoutInfo_btnSearch: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnSearch: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 346.0
        layoutY: 44.0
        layoutInfo: __layoutInfo_btnSearch
        text: "Button"
    }
    
    def __layoutInfo_label2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX
        layoutY: 102.0
        layoutInfo: __layoutInfo_label2
        text: "Label"
    }
    
    def __layoutInfo_txtDesc: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtDesc: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX
        layoutY: 111.0
        layoutInfo: __layoutInfo_txtDesc
    }
    
    def __layoutInfo_dateLabel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def dateLabel: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX
        layoutY: 21.0
        layoutInfo: __layoutInfo_dateLabel
        text: "Label"
    }
    
    def __layoutInfo_lblDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblDate: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C4LX
        layoutY: 21.0
        layoutInfo: __layoutInfo_lblDate
        text: bind today
    }
    
    def __layoutInfo_cmboTransType: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def cmboTransType: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: 178.0
        layoutY: 53.0
        layoutInfo: __layoutInfo_cmboTransType
        items: bind viewTxnType
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 624.0
        layoutY: 38.0
        text: "Label"
    }
    
    public-read def cboviewAccountNo: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: 144.0
        layoutY: 32.0
        items: bind accountNo
    }
    
    public-read def imageView4: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
    }
    
    def __layoutInfo_btnBack: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW+50
        height: bind bottonH
    }
    public-read def btnBack: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton2LX-40
        layoutY: bind buttonLY
        layoutInfo: __layoutInfo_btnBack
        onKeyPressed: btnBackOnKeyPressedAtShown
        graphic: imageView4
        text: "Button"
    }
    
    public-read def imageView6: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
    }
    
    def __layoutInfo_btViewCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btViewCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton3LX
        layoutY: bind buttonLY
        layoutInfo: __layoutInfo_btViewCancel
        onKeyPressed: btViewCancelOnKeyPressedAtShown
        graphic: imageView6
        text: "Button"
    }
    
    def __layoutInfo_listView: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 716.0
        height: 300.0
    }
    public-read def listView: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: true
        layoutX: 43.0
        layoutY: 170.0
        layoutInfo: __layoutInfo_listView
        items: null
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
    }
    
    public-read def panelDate: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelCalenderLX
        layoutY: 15.0
    }
    
    public-read def rectangle2: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        styleClass: "rectbutton"
        width: 100.0
        height: 50.0
    }
    
    def __layoutInfo_lblView: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblView: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutInfo: __layoutInfo_lblView
        text: "Label"
    }
    
    public-read def group: javafx.scene.Group = javafx.scene.Group {
        visible: false
        layoutX: bind rectbutton2LX
        layoutY: bind rectbuttonLY-30
        content: [ rectangle2, lblView, ]
    }
    
    public-read def Violet: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.011764706
        green: 0.5019608
        blue: 0.7607843
    }
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
    }
    
    def __layoutInfo_txtBank_Branch: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtBank_Branch: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 23.0
        layoutInfo: __layoutInfo_txtBank_Branch
        styleClass: "text-box"
        text: bind bankName
        editable: false
        font: Arial_12
    }
    
    public-read def Arial_Bold_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
    }
    
    public-read def label16: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C4LX
        layoutY: 46.0
        text: "Closing Balance"
        font: Arial_Bold_12
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
        text: "Bank Book - ctrl+J"
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
    
    public-read def label13: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 93.0
        text: "Transaction Type"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label12: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 69.0
        text: "Amount"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label11: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 46.0
        text: "Expense towards"
        font: Arial_12
        textFill: DarkGray
    }
    
    def __layoutInfo_labelName_of_Bank: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def labelName_of_Bank: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 46.0
        layoutInfo: __layoutInfo_labelName_of_Bank
        text: "Opening Balance"
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    def __layoutInfo_labelAccount_Holder: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def labelAccount_Holder: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 23.0
        layoutInfo: __layoutInfo_labelAccount_Holder
        text: "Bank / Branch Name"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelAccountNumber: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 0.0
        text: "Account No."
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
    
    public-read def lblCloseBal: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C4LX
        layoutY: 67.0
        text: bind closeBalance
        font: Arial_Bold_18
        textFill: Green
    }
    
    def __layoutInfo_lblOpenBal: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def lblOpenBal: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 67.0
        layoutInfo: __layoutInfo_lblOpenBal
        text: bind openBalance
        font: Arial_Bold_18
        textFill: Green
    }
    
    def __layoutInfo_panelpage: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 787.0
        height: 100.0
    }
    public-read def panelpage: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutY: 40.0
        layoutInfo: __layoutInfo_panelpage
        content: [ label6, label5, label3, labelAccountNumber, labelAccount_Holder, txtBank_Branch, cboAcNo, txtAmount, labelName_of_Bank, label11, label12, label13, cboExpense, cboTxnType, lblOpenBal, lblCloseBal, label16, txtFromDate, txtToDate, imgFrom, imgTo, btnSearch, label2, txtDesc, dateLabel, lblDate, cmboTransType, label4, cboviewAccountNo, ]
    }
    
    public-read def Yellow: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.95
        green: 0.94
        blue: 0.86
    }
    
    public-read def imageCalendar: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Calender.png"
    }
    
    public-read def imageSave: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Save1.png"
    }
    
    public-read def imageView2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
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
        effect: reflectionEffect
        graphic: imageView2
        text: bind btnSaveName
        font: Arial_Bold_14
    }
    
    public-read def imageEdit: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Edit.png"
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageEdit
    }
    
    def __layoutInfo_btnView: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnView: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton2LX
        layoutY: bind buttonLY
        layoutInfo: __layoutInfo_btnView
        effect: reflectionEffect
        graphic: imageView
        text: "View"
        font: Arial_Bold_14
    }
    
    public-read def imageReset: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Reset.png"
    }
    
    public-read def imageView3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageReset
    }
    
    def __layoutInfo_btnReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton3LX
        layoutY: bind buttonLY
        layoutInfo: __layoutInfo_btnReset
        effect: reflectionEffect
        graphic: imageView3
        text: "Reset"
        font: Arial_Bold_14
    }
    
    public-read def imageCancel: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Cancel.png"
    }
    
    public-read def imageView5: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
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
        effect: reflectionEffect
        graphic: imageView5
        text: "Cancel        "
        font: Arial_Bold_14
        action: btnCancelAction
    }
    
    public-read def panelButtons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutY: 490.0
        content: [ btnSave, btnView, btnReset, btnCancel, btnBack, btViewCancel, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ rectangle, rectHeader, label, panelheader, panelTable, rectangle3, panelpage, panelButtons, listView, panelAlert, panelDate, group, ]
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
        size: 50.0
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
                            panelTable.visible = true;
                            label6.visible = false;
                            label6.layoutX = 16.0;
                            label6.layoutY = 78.0;
                            label6.text = "Label";
                            label5.visible = false;
                            label5.layoutY = 38.0;
                            label5.text = "Label";
                            label3.visible = false;
                            label3.layoutY = 38.0;
                            label3.text = "Label";
                            labelAccountNumber.visible = true;
                            labelAccount_Holder.visible = true;
                            labelAccount_Holder.layoutY = -2.0;
                            txtBank_Branch.visible = true;
                            txtBank_Branch.cursor = null;
                            txtBank_Branch.layoutY = -2.0;
                            txtBank_Branch.onKeyPressed = txtBank_BranchOnKeyPressedAtShown;
                            txtBank_Branch.onKeyReleased = txtBank_BranchOnKeyReleasedAtShown;
                            txtBank_Branch.effect = null;
                            cboAcNo.visible = true;
                            cboAcNo.onKeyReleased = cboAcNoOnKeyReleasedAtShown;
                            txtAmount.visible = true;
                            txtAmount.layoutY = 78.0;
                            txtAmount.onKeyTyped = txtAmountOnKeyTypedAtShown;
                            txtAmount.font = null;
                            labelName_of_Bank.visible = true;
                            labelName_of_Bank.layoutY = 46.0;
                            labelName_of_Bank.text = "Opening Balance";
                            label11.visible = true;
                            label11.layoutY = 27.0;
                            label11.text = "Expense towards";
                            label12.visible = true;
                            label12.layoutY = 54.0;
                            label12.text = "Transaction Type";
                            label13.visible = true;
                            label13.layoutY = 81.0;
                            label13.text = "Amount";
                            cboExpense.visible = true;
                            cboExpense.layoutY = 27.0;
                            cboExpense.onKeyPressed = cboExpenseOnKeyPressedAtShown;
                            cboTxnType.visible = true;
                            cboTxnType.layoutY = 53.0;
                            cboTxnType.onKeyPressed = cboTxnTypeOnKeyPressedAtShown;
                            lblOpenBal.visible = true;
                            lblOpenBal.layoutY = 67.0;
                            lblCloseBal.visible = true;
                            label16.visible = true;
                            txtFromDate.visible = false;
                            txtFromDate.layoutX = 510.0;
                            txtFromDate.editable = true;
                            txtToDate.visible = false;
                            txtToDate.layoutX = 647.0;
                            txtToDate.layoutY = -2.0;
                            txtToDate.editable = true;
                            imgFrom.visible = false;
                            imgFrom.layoutX = 581.0;
                            imgFrom.layoutY = 21.0;
                            imgFrom.image = null;
                            imgTo.visible = false;
                            imgTo.layoutX = 719.0;
                            imgTo.layoutY = 21.0;
                            imgTo.image = null;
                            btnSearch.visible = false;
                            btnSearch.layoutX = 346.0;
                            btnSearch.layoutY = 44.0;
                            btnSearch.text = "Button";
                            label2.visible = true;
                            label2.layoutY = 108.0;
                            __layoutInfo_label2.height = 45.0;
                            label2.text = "Transaction Details";
                            label2.font = Arial_12;
                            label2.textFill = DarkGray;
                            txtDesc.visible = true;
                            txtDesc.layoutY = 108.0;
                            __layoutInfo_txtDesc.height = 45.0;
                            txtDesc.onKeyPressed = txtDescOnKeyPressedAtShown;
                            txtDesc.multiline = true;
                            dateLabel.visible = true;
                            __layoutInfo_dateLabel.width = 82.0;
                            dateLabel.text = "Date";
                            dateLabel.font = Arial_12;
                            lblDate.visible = true;
                            __layoutInfo_lblDate.width = 191.0;
                            lblDate.font = Arial_12;
                            cmboTransType.visible = false;
                            cmboTransType.layoutX = 178.0;
                            cmboTransType.layoutY = 53.0;
                            label4.visible = false;
                            label4.layoutX = 624.0;
                            label4.layoutY = 38.0;
                            label4.text = "Label";
                            cboviewAccountNo.visible = false;
                            cboviewAccountNo.layoutX = 144.0;
                            cboviewAccountNo.layoutY = 32.0;
                            __layoutInfo_panelpage.height = 150.0;
                            btnSave.visible = true;
                            btnSave.onKeyPressed = btnSaveOnKeyPressedAtShown;
                            btnSave.action = btnSaveActionAtShown;
                            imageView.image = imageEdit;
                            btnView.visible = true;
                            btnView.onKeyPressed = btnViewOnKeyPressedAtShown;
                            btnView.text = "Edit [F6]";
                            btnView.action = btnViewActionAtShown;
                            btnReset.visible = true;
                            btnReset.onKeyPressed = btnResetOnKeyPressedAtShown;
                            btnReset.text = "Reset [F4]";
                            btnReset.action = btnResetActionAtShown;
                            btnCancel.visible = true;
                            btnCancel.managed = true;
                            btnCancel.onKeyPressed = btnCancelOnKeyPressedAtShown;
                            btnCancel.text = "Cancel [F8]";
                            imageView4.visible = false;
                            imageView4.image = imageBack;
                            btnBack.visible = false;
                            btnBack.text = "Button";
                            imageView6.visible = false;
                            imageView6.image = null;
                            btViewCancel.visible = false;
                            btViewCancel.text = "Button";
                            listView.visible = false;
                            listView.layoutY = 220.0;
                            __layoutInfo_listView.width = 716.0;
                            __layoutInfo_listView.height = 230.0;
                            panelDate.visible = false;
                            rectangle2.visible = true;
                            rectangle2.fill = linearGradient;
                            rectangle2.stroke = DarkGray;
                            rectangle2.width = 100.0;
                            rectangle2.height = 20.0;
                            rectangle2.arcWidth = 10.0;
                            rectangle2.arcHeight = 10.0;
                            lblView.visible = true;
                            __layoutInfo_lblView.width = 100.0;
                            __layoutInfo_lblView.height = 20.0;
                            lblView.onMouseClicked = lblViewOnMouseClickedAtShown;
                            lblView.text = "View";
                            lblView.font = Arial_Bold_14;
                            lblView.hpos = javafx.geometry.HPos.CENTER;
                            group.visible = true;
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
                            panelTable.visible = true;
                            __layoutInfo_panelTable.width = 716.0;
                            label6.visible = true;
                            label6.layoutX = 22.0;
                            label6.layoutY = 35.0;
                            label6.text = "Transaction Type";
                            label6.font = Arial_12;
                            label5.visible = true;
                            label5.layoutY = 0.0;
                            __layoutInfo_label5.width = 80.0;
                            label5.text = "Account No";
                            label5.font = Arial_12;
                            label3.visible = true;
                            label3.layoutY = 0.0;
                            label3.text = "From";
                            label3.font = Arial_12;
                            labelAccountNumber.visible = false;
                            labelAccount_Holder.visible = false;
                            labelAccount_Holder.layoutY = 23.0;
                            txtBank_Branch.visible = false;
                            txtBank_Branch.layoutY = 23.0;
                            txtBank_Branch.onKeyPressed = txtBank_BranchOnKeyPressedAtView;
                            cboAcNo.visible = false;
                            txtAmount.visible = false;
                            txtAmount.layoutY = 73.0;
                            labelName_of_Bank.visible = false;
                            labelName_of_Bank.layoutY = 38.0;
                            labelName_of_Bank.text = "Current Opening Balance";
                            label11.visible = false;
                            label11.layoutY = 0.0;
                            label11.text = "To";
                            label12.visible = false;
                            label12.layoutY = 0.0;
                            label12.text = "From";
                            label13.visible = false;
                            label13.layoutY = 46.0;
                            label13.text = "Transaction Type";
                            cboExpense.visible = false;
                            cboExpense.layoutY = 46.0;
                            cboTxnType.visible = false;
                            cboTxnType.layoutY = 46.0;
                            lblOpenBal.visible = false;
                            lblOpenBal.layoutY = 57.0;
                            lblCloseBal.visible = false;
                            label16.visible = false;
                            txtFromDate.visible = true;
                            txtFromDate.layoutX = 500.0;
                            __layoutInfo_txtFromDate.width = 100.0;
                            txtFromDate.onKeyPressed = txtFromDateOnKeyPressedAtView;
                            txtFromDate.onKeyReleased = txtFromDateOnKeyReleasedAtView;
                            txtFromDate.editable = false;
                            txtToDate.visible = true;
                            txtToDate.layoutX = 660.0;
                            txtToDate.layoutY = 0.0;
                            __layoutInfo_txtToDate.width = 100.0;
                            txtToDate.onKeyPressed = txtToDateOnKeyPressedAtView;
                            txtToDate.editable = false;
                            imgFrom.visible = true;
                            imgFrom.layoutX = 600.0;
                            imgFrom.layoutY = 0.0;
                            imgFrom.onKeyPressed = imgFromOnKeyPressedAtView;
                            imgFrom.onMouseClicked = imgFromOnMouseClickedAtView;
                            imgFrom.image = imageCalendar;
                            imgTo.visible = true;
                            imgTo.layoutX = 760.0;
                            imgTo.layoutY = 0.0;
                            imgTo.onKeyPressed = imgToOnKeyPressedAtView;
                            imgTo.onMouseClicked = imgToOnMouseClickedAtView;
                            imgTo.image = imageCalendar;
                            btnSearch.visible = true;
                            btnSearch.layoutX = 386.0;
                            btnSearch.layoutY = 35.0;
                            __layoutInfo_btnSearch.width = 100.0;
                            __layoutInfo_btnSearch.height = 25.0;
                            btnSearch.onKeyPressed = btnSearchOnKeyPressedAtView;
                            btnSearch.text = "Search";
                            btnSearch.font = Arial_Bold_14;
                            btnSearch.action = btnSearchActionAtView;
                            label2.visible = false;
                            label2.layoutY = 102.0;
                            label2.text = "Label";
                            label2.textFill = javafx.scene.paint.Color.BLACK;
                            txtDesc.visible = false;
                            txtDesc.layoutY = 111.0;
                            txtDesc.multiline = false;
                            dateLabel.visible = false;
                            dateLabel.text = "Label";
                            lblDate.visible = false;
                            cmboTransType.visible = true;
                            cmboTransType.layoutX = 160.0;
                            cmboTransType.layoutY = 35.0;
                            __layoutInfo_cmboTransType.width = 180.0;
                            cmboTransType.onKeyPressed = cmboTransTypeOnKeyPressedAtView;
                            label4.visible = true;
                            label4.layoutX = 630.0;
                            label4.layoutY = 0.0;
                            label4.text = "To";
                            label4.font = Arial_12;
                            cboviewAccountNo.visible = true;
                            cboviewAccountNo.layoutX = 160.0;
                            cboviewAccountNo.layoutY = 0.0;
                            cboviewAccountNo.onKeyPressed = cboviewAccountNoOnKeyPressedAtView;
                            cboviewAccountNo.onKeyReleased = cboviewAccountNoOnKeyReleasedAtView;
                            __layoutInfo_panelpage.height = 100.0;
                            btnSave.visible = false;
                            imageView.image = imageBack;
                            btnView.visible = false;
                            btnView.text = "Back [Ctrl+Left]";
                            btnView.action = btnViewActionAtView;
                            btnReset.visible = false;
                            btnReset.text = "Reset";
                            btnCancel.visible = false;
                            btnCancel.managed = true;
                            btnCancel.text = "Cancel [F8]";
                            imageView4.visible = true;
                            imageView4.image = imageBack;
                            btnBack.visible = true;
                            btnBack.text = "Back [Ctrl+Left]";
                            btnBack.font = Arial_Bold_14;
                            btnBack.action = btnBackActionAtView;
                            imageView6.visible = true;
                            imageView6.image = imageCancel;
                            btViewCancel.visible = true;
                            btViewCancel.text = "Cancel [F8]";
                            btViewCancel.font = Arial_Bold_14;
                            btViewCancel.action = btViewCancelActionAtView;
                            listView.visible = false;
                            listView.layoutY = 130.0;
                            __layoutInfo_listView.width = 716.0;
                            __layoutInfo_listView.height = 350.0;
                            panelDate.visible = true;
                            rectangle2.visible = false;
                            rectangle2.fill = javafx.scene.paint.Color.BLACK;
                            rectangle2.stroke = null;
                            rectangle2.width = 100.0;
                            rectangle2.height = 50.0;
                            rectangle2.arcWidth = 0.0;
                            rectangle2.arcHeight = 0.0;
                            lblView.visible = false;
                            lblView.text = "Label";
                            lblView.hpos = javafx.geometry.HPos.LEFT;
                            group.visible = false;
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

    function txtFromDateOnKeyReleasedAtView(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        shortcut(event);
    }

    function txtBank_BranchOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        shortcut(event);
    }

    function btnViewOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
         if (event.code == KeyCode.VK_TAB) {
            btnReset.requestFocus();
        }

        shortcut(event);
    }

    function btnResetOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
     if (event.code == KeyCode.VK_TAB) {
            btnCancel.requestFocus();
        }
        shortcut(event);
    }

    function btnCancelOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
     if (event.code == KeyCode.VK_TAB) {
            btnSave.requestFocus();
        }
        shortcut(event);
    }

    function btViewCancelOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        shortcut(event);
    }

    function btnBackOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        shortcut(event);
    }

    function btViewCancelActionAtView(): Void {
        //TODO
        panel.visible = false;
    }

    function cboviewAccountNoOnKeyReleasedAtView(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        shortcut(event);
    }

    function cboviewAccountNoOnKeyPressedAtView(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        if (event.code == KeyCode.VK_DOWN) {
            cboviewAccountNo.show();
        }
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {

            txtFromDate.requestFocus();
        }
        shortcut(event);
    }

    function btnBackActionAtView(): Void {
        //TODO
        back();
    }

    function txtAmountOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
    //TODO
    //-   shortcut(event);
    }

    function txtAmountOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {

            txtDesc.requestFocus();
        }
        shortcut(event);
    }

    function cboAcNoOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
    //TODO
    //  shortcut(event);
    }

    function btnSearchOnKeyPressedAtView(event: javafx.scene.input.KeyEvent): Void {
        //TODO

        if (event.code == KeyCode.VK_ENTER) {

            btnSearchActionAtView();
        }
        shortcut(event);
    }

    function txtBank_BranchOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        shortcut(event);
    }

    function txtBank_BranchOnKeyPressedAtView(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        shortcut(event);
    }

    def kr = KeyRegistry {};
    var key = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 5 and CommonDeclare.form[4] == 7) {
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
        if (event.code == kr.edit and btnView.text == "Edit [F6]") {
            btnViewActionAtShown();
        }
        if (event.code == kr.reset and btnReset.text == "Reset [F4]") {
            clearAll();
        }
        if (event.code == kr.del and btnView.text == "Delete [F5]") {
            deleteClick();
        }

        if (event.controlDown == true and event.code == kr.back) {
            if (btnView.text == "Back [Ctrl+Left]") { btnViewActionAtView(); }
        }
        if (event.code == kr.cancel) {
            if (btnCancel.text == "Cancel [F8]") { panel.visible = false; }
        }

    }

    function btnCancelAction(): Void {
        //TODO

        panel.visible = false;
    }

    function imgToOnKeyPressedAtView(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        ToDateClick();
    }

    function imgFromOnKeyPressedAtView(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        fromDateClick();
    }

    function btnSearchActionAtView(): Void {
        //TODO
        try {
            var sdf = new SimpleDateFormat("dd-MM-yyyy");
            var cboAcNo1 = cboviewAccountNo.selectedItem.toString();
            var txtFromDate1 = txtFromDate.rawText; if (txtFromDate1 != null and txtFromDate1 != "") { txtFromDate1 = DateUtils.changeFormatDate(sdf.parse(txtFromDate1.trim())); } else { txtFromDate1 = null; }
            var txtToDate1 = txtToDate.rawText; if (txtToDate1 != null and txtToDate1!= "") { txtToDate1 = DateUtils.changeFormatDate(sdf.parse(txtToDate1.trim())); } else { txtToDate1 = null; } var cmboTransType1: String = cmboTransType.selectedItem.toString();

            if (cboAcNo1==null or cboAcNo1 == "") {
                FXinfo("Please Select Account No");
                cboAcNo.requestFocus();
            } else if (txtFromDate1 == null or txtFromDate1 == "") {
                FXinfo("Please Enter From Date");
                imgFrom.requestFocus();
            } else if (txtToDate1 == null or txtToDate1 == "") {
                FXinfo("Please Enter To Date");
                imgTo.requestFocus();
            } else {
                bankBookTable.searchBankBookValues(cboAcNo1, cmboTransType1, txtFromDate1, txtToDate1);
            }

        } catch (e: Exception) {
            var msg: String = "Class : BankBook  Method : btnSearchActionAtView()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function back(): Void {
        currentState.actual = currentState.findIndex("Shown");
        panelTableLY = 220.0;
        TableH = 230.0;
        clearAll();
        setTableLay();
    }

    public function setTableLay(): Void {
        bankTable.layoutX = 0.0;
        bankTable.layoutY = 0.0;
        panelTable.content = [bankTable,];
        TableH = 230.0;

        bankBookTable.addBasicRows();
        bankBookTable.loadBankBookValues(0);
        cboAcNo.requestFocus();
    }

    function viewTableLayout(): Void {
        clearAll();
        bankBookTable.loadBankBookValues(1);
        bankTable.layoutX = 0;
        bankTable.layoutY = 0;
        panelTableLY = 130.0;
        TableH = 350.0;
        cmboTransType.select(0);
    }

    function txtAmountOnKeyTypedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB) {
            txtDesc.requestFocus();
        } else if (event.code
                == KeyCode.VK_ENTER) {
            txtDesc.requestFocus();
        }

        if (NumberUtils.isNumeric(txtAmount)) {
            txtAmount.style = mandatory;
            closingBalanceCalculation();
        }
        shortcut(event);
    }

    function btnResetActionAtShown(): Void {
        //TODO
        clearAll();
    }

    function btnSaveOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        if (event.code == KeyCode.VK_ENTER) {
            saveClick();
        }
         if (event.code == KeyCode.VK_TAB) {
            btnView.requestFocus();
        }
        shortcut(event);
    }

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("BankBook", type);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("BankBook", msg);
        showAlertbox();

    }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("BankBook", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = error;
    }

    var btnSaveName = "Save [F3]";

    function saveClick(): Void {
        try {
            var bankBookModel = new BankBookModel();
            bankBookModel = validation();
            if (bankBookModel.isReturnFlag() == true) {
                closingBalanceCalculation();
                var crAm: Double = Double.parseDouble(creditAmount);
                var deAm: Double = Double.parseDouble(depitAmount);
                var finalAm: Double = 0.00;
                if (crAm > 0) { finalAm = crAm; } else { finalAm = deAm; }
                bankBookModel.setAmount(finalAm);
                bankBookModel.setCreditAmount(crAm);
                bankBookModel.setDebitAmount(deAm);
                if (btnSaveName == "Save [F3]") {

                    var returnObject = new Object();
                    bankBookModel.setClosingBalance(Double.parseDouble(closeBalance));
                    bankBookModel.setOpeningBalance(Double.parseDouble(openBalance));
                    
                    returnObject = bankBookController.createRecord(bankBookModel); // controller call
                    var msgReturnModel: MsgReturnModel = new MsgReturnModel();
                    msgReturnModel = returnObject as MsgReturnModel;
                    if (msgReturnModel.getReturnMessage() == "0") {
                        FXalert(0);
                        clearAll();
                        cboAcNo.requestFocus();
                    } else {
                        FXinfo(msgReturnModel.getReturnMessage());
                    }

                } else {
                    var cn: ConfirmDialogBox = new ConfirmDialogBox(0, "Bank Book");
                    var a = bind cn.staus;
                    bankBookModel.setEditAmount(finalAm - editAmount);
                    bankBookModel.setBankId(bank_id);
                    if (a) {

                        var returnObject = new Object();
                        bankBookModel.setClosingBalance(Double.parseDouble(closeBalance));
                        bankBookModel.setOpeningBalance(Double.parseDouble(openBalance));
                       
                        returnObject = bankBookController.updateRecord(bankBookModel); // controller call
                        var msgReturnModel: MsgReturnModel = new MsgReturnModel();
                        msgReturnModel = returnObject as MsgReturnModel;
                        if (msgReturnModel.getReturnMessage() == "0") { FXalert(0);
                            clearAll();
                            cboAcNo.requestFocus();
                             FXalert(4);
                        } else {
                            FXinfo(msgReturnModel.getReturnMessage());
                        }
                    }

                }
            }

        } catch (e: Exception) {
            var msg: String = "Class : BankBook  Method : saveClick()   = {e.getMessage()}";
            log.debug(msg);


        }
    }

    function validation(): BankBookModel {
        var bankbookModel = new BankBookModel();
        bankbookModel.setReturnFlag(false);
        try {

            var paAmount: Double = 0.00;
            bankbookModel.setTransactionDetails(txtDesc.rawText.replaceAll("'", ""));
            bankbookModel.setBankBranchName(txtBank_Branch.rawText);
            if (txtAmount.rawText != null and txtAmount.rawText != "") {
                txtAmount.text = txtAmount.rawText.trim();
                paAmount = Double.parseDouble(txtAmount.rawText);
            }
            bankbookModel.setAmount(paAmount);
            bankbookModel.setAccountNumber(cboAcNo.selectedItem.toString());
            bankbookModel.setTransactionType(cboTxnType.selectedItem.toString());
            bankbookModel.setExpenseTowards(cboExpense.selectedItem.toString());
            var cloBal: Double = 0.00;
            cloBal = Double.parseDouble(closeBalance);
            if (cboAcNo.selectedItem.toString() == null or cboAcNo.selectedItem.toString() == "") {
                FXinfo("Please Select Account No");
                cboAcNo.requestFocus();
            } else if (cboTxnType.selectedItem.toString() == null or cboTxnType.selectedItem.toString() == "<--Select-->") {
                FXinfo("Please Select Transaction Type");
                cboTxnType.requestFocus();
            } else if (cboExpense.selectedItem.toString() == null or cboExpense.selectedItem.toString() == "<--Select-->") {
                FXinfo("Please Select Expense To");
                cboExpense.requestFocus();
            } else if (txtAmount.rawText == null or txtAmount.rawText == "" or paAmount <= 0) {
                FXinfo("Please Enter Amount", txtAmount);
            } else if (cloBal < 0) {
                FXinfo("Balance is low.please enter correct withdraw amount");
            } else {
                bankbookModel.setReturnFlag(true);
            }
        } catch (e: Exception) {
            var msg: String = "Class : BankBook  Method : validation()   = {e.getMessage()}";
            log.debug(msg);
        }

        return bankbookModel;
    }

    function btnSaveActionAtShown(): Void {
        //TODO
        saveClick();
    }

    function cmboTransTypeOnKeyPressedAtView(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        if (event.code == KeyCode.VK_DOWN) {
            cmboTransType.show();
        }
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {

            btnSearch.requestFocus();
        }
        shortcut(event);

    }

    function txtDescOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {

            btnSave.requestFocus();
        } shortcut(event);
    }

    function cboTxnTypeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        if (event.code == KeyCode.VK_DOWN) {
            cboTxnType.show();
        }
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtAmount.requestFocus();
        }
        shortcut(event);
    }

    function cboExpenseOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        if (event.code == KeyCode.VK_DOWN) {
            cboExpense.show();
        }
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {

            txtAmount.requestFocus();
        }
        shortcut(event);

    }

    function cboAcNoOnKeyPressedAtView(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        if (event.code == KeyCode.VK_DOWN) {
            cboAcNo.show();
        }
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            cboExpense.requestFocus();
        }
        shortcut(event);
    }

    function txtToDateOnKeyPressedAtView(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        ToDateClick(); shortcut(event);
    }

    function txtFromDateOnKeyPressedAtView(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        fromDateClick(); shortcut(event);
    }

    function imgToOnMouseClickedAtView(event: javafx.scene.input.MouseEvent): Void {
        //TODO
        ToDateClick();
    }

    function imgFromOnMouseClickedAtView(event: javafx.scene.input.MouseEvent): Void {
        //TODO
        fromDateClick();
    }

    function fromDateClick(): Void {
        try {

            panelDate.visible = true;
            if (not curDateFlag) {
                panelCalenderLX = txtFromDate.layoutX;
                panelDate.layoutY = txtFromDate.layoutY + txtFromDate.height + 2.0;

                if (txtFromDate.rawText.trim() != null) {
                    var dat = txtFromDate.rawText.trim().split("-");
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
            var msg: String = "Class : BankBook  Method : fromDateClick()   = {e.getMessage()}";
            log.debug(msg);

        }
    }

    function ToDateClick(): Void {
        try {

            panelDate.visible = true;
            if (not curDateFlag) {
                panelCalenderLX = txtToDate.layoutX;
                panelDate.layoutY = txtToDate.layoutY + txtToDate.height + 2.0;

                if (txtToDate.rawText.trim() != null) {
                    var dat = txtToDate.rawText.trim().split("-");
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
            var msg: String = "Class : BankBook  Method : ToDateClick()   = {e.getMessage()}";
            log.debug(msg);

        }
    }

    function lblViewOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        //TODO
        currentState.actual = currentState.findIndex("View");
        viewTableLayout();
    }

    function btnViewActionAtView(): Void {
        back();
    }

    function deleteClick(): Void {

        try {
            var bankBookModel = new BankBookModel();
            bankBookModel = validation();
            if (bankBookModel.isReturnFlag() == true) {

                bankBookModel.setEditAmount(-editAmount);
                bankBookModel.setBankId(bank_id);
                var cn: ConfirmDialogBox = new ConfirmDialogBox(1, "Bank Book");
                var a = bind cn.staus;
                if (a) {
                    var returnObject: Boolean = false;
                    bankBookModel.setClosingBalance(Double.parseDouble(closeBalance));
                    bankBookModel.setOpeningBalance(Double.parseDouble(openBalance));
                   
                    returnObject = bankBookController.deleteRecord(bankBookModel); // controller call

                    if (returnObject == true) {
                        clearAll();
                         FXalert(5);
                        cboAcNo.requestFocus();
                    }

                }

            }

        } catch (e: Exception) {
            var msg: String = "Class :Bank Book  Method  : Delete [F5] Click   = {e.getMessage()}";
            log.debug(msg);
        }

    }

    function btnViewActionAtShown(): Void {

        if (btnView.text == "Edit [F6]") {
            if (bankBookTable.rowselt != "-1") {

                btnSaveName = "Update [F7]";
                btnView.text = "Delete [F5]";
                updateValues();
            } else {
                FXinfo("Please Select  Editing Row");
            }
        } else {

            deleteClick();
        }
    }

    public function closingBalanceCalculation(): Void {
        try {
            var paidAmount: String = ""; paidAmount = txtAmount.rawText;
            if (paidAmount != null and paidAmount != "") {
                var cboTxnType1 = cboTxnType.selectedItem.toString();
                var cboStatus1 = cboExpense.selectedItem.toString();
                if (cboTxnType1 != null and cboTxnType1 != "<--Select-->") {
                    if (cboTxnType1.equals("Deposit")) {
                        depitAmount = "0.00";
                        creditAmount = paidAmount;
                        closeBalance = Value.Round(Double.parseDouble(openBalance) + Double.parseDouble(paidAmount));
                    } else if (cboTxnType1.equals("Withdrawal") or cboStatus1.equals("Others")) {
                        depitAmount = paidAmount;
                        creditAmount = "0.00";
                        closeBalance = Value.Round(Double.parseDouble(openBalance) - Double.parseDouble(paidAmount));
                    }

                } else {
                    closeBalance = openBalance;
                }
            } else {
                closeBalance = openBalance;
            }
        } catch (e: Exception) {
            var msg: String = "Class : BankBook  Method : closingBalanceCalculation()   = {e.getMessage()}";
            log.debug(msg);

        }
    }

    var bankName = "";
    var accountValue = bind cboAcNo.selectedItem.toString() on replace {
        if (btnSaveName != "Update [F7]") {

            bankName = comObj.getAccountNoBankName(accountValue); // Controller Call
            openBalance = comObj.getAccountBalance(accountValue); // Controller Call
            closingBalanceCalculation();
        }
    }
    var cboExpenseVal = bind cboExpense.selectedItem.toString() on replace {

        if (cboExpenseVal.equals("Others")) {
            TxnType = ["Withdrawal"];
        } else {
            TxnType = ["<--Select-->", "Deposit", "Withdrawal"];
        }
        cboTxnType.select(0);

    }
    var txnValue = bind cboTxnType.selectedItem.toString() on replace {

        closingBalanceCalculation();

    }
    var expense: String[] = ["<--Select-->", "Shop", "Personal", "Others"];
    var TxnType: String[] = ["<--Select-->", "Deposit", "Withdrawal"];
    var viewTxnType: String[] = ["ALL", "Deposit", "Withdrawal"];
    var depitAmount: String = "0.00";
    var creditAmount: String = "0.00";

    public function clearAll(): Void {
        
        cboAcNo.requestFocus();
        mandatory_textboxes();
        openBalance = "0.00";
        closeBalance = "0.00";
        expense = ["<--Select-->", "Shop", "Personal", "Others"];
        TxnType = ["<--Select-->", "Deposit", "Withdrawal"];
        accountNo = comObj.getAccountNumbers().toArray();
        bankName = "";
        txtDesc.text = "";
        txtFromDate.text = "";
        txtToDate.text = "";
        closingBalanceCalculation();
        //-  setTableLay();
        txtAmount.text = "";
        btnSaveName = "Save [F3]";
        btnView.text = "Edit [F6]";
        bankBookTable.addBasicRows();

        bankBookTable.loadBankBookValues(0);
        bank_id = 0;
        bankBookTable.rowselt = "-1";
        cboTxnType.select(0);
        cboAcNo.select(0);
        cboExpense.select(0);
        cmboTransType.select(0);
        cboAcNo.disable = false;
        cboExpense.disable = false;
        cboTxnType.disable = false;
        editAmount = 0.00;
        editTxnType = "";

    }

    public function StartUp(): Void {

        currentState.actual = currentState.findIndex("Shown");
        panel.visible = true;
        fxCalendar.visible = false;
        panelDate.content = [fxCalendar,];
        bankTable.getJComponent().setPreferredSize(new Dimension(TableW, 230.0));
        (BankBookviewtable as javax.swing.JTable).addMouseListener(MouseAdapter {
            override public function mouseClicked(e: java.awt.event.MouseEvent): Void {
                bankBookTable.viewBankBookCalculations();
                updateValues();

            }
        });

        setTableLay();

        back();
        TableH = 231;
        cboAcNo.requestFocus();
    }

    function mandatory_textboxes(): Void {
        txtAmount.style = mandatory;

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
            txtFromDate.text = fxCalendar.getSelectedDate();
            curDateFlag = false;
            curDateFlag1 = false;
            txtToDate.requestFocus();
        } else if (i == 1) {
            txtToDate.text = fxCalendar.getSelectedDate();
            curDateFlag = false;
            curDateFlag1 = false;
            cmboTransType.requestFocus();
        }

    }

    function getPrivileges(u: String): Void {
        var uname = u;

        var utype = comObj.getUserType(uname); // Controller Call

        if (utype.equals("User")) {
            var priv = comObj.getPrivileges("financial", uname); // Controller Call
            var ss = priv.split(",");
            var val = Integer.parseInt(ss[8]);
            if (val == 1) {
                btnSave.disable = true;
                if (btnView.text != "Edit [F6]") {
                    btnView.disable = true;
                } else {
                    btnView.disable = false;
                }
            } else if (val == 2) {
                if (btnView.text != "Edit [F6]") {
                    btnView.disable = true;
                } else {
                    btnView.disable = false;
                }
                btnSave.disable = false;
            //This code for  READ and WRITE Access
            } else if (val == 3) {
                btnSave.disable = false;
                btnView.disable = false;
            //This code for FULL Access
            }
        } else {
            btnSave.disable = false;
            btnView.disable = false;
        }
    }

    var logUser: String = bind CommonDeclare.user on replace {
        getPrivileges(logUser);
    }
    var changPiv = bind btnSave.text on replace {
        getPrivileges(logUser);
    }
    var changPiv1 = bind btnView.text on replace {
        getPrivileges(logUser);
    }

    function displayBankBookDetails(ban_id: String): Void {
        try {
            cboAcNo.disable = true;
            cboExpense.disable = true;
            cboTxnType.disable = true;
            var bankBookModel = new BankBookModel();
            var bankMod = new Object();
           
            bankMod = bankBookController.displayBankBookDetails(ban_id);
            bankBookModel = bankMod as BankBookModel;
            bank_id = bankBookModel.getBankId();
            accountNo[0] = bankBookModel.getAccountNumber();
            cboAcNo.select(0);
            bankName = bankBookModel.getBankBranchName();
            expense[0] = bankBookModel.getExpenseTowards();
            cboExpense.select(0);
            TxnType[0] = bankBookModel.getTransactionType();
            cboTxnType.select(0);
            var creAmount: Double = bankBookModel.getCreditAmount();
            if (creAmount > 0) {
                txtAmount.text = String.valueOf(bankBookModel.getCreditAmount());
                editAmount = bankBookModel.getCreditAmount();
            } else {
                txtAmount.text = String.valueOf(bankBookModel.getDebitAmount());
                editAmount = bankBookModel.getDebitAmount();
            }
            txtDesc.text = bankBookModel.getTransactionDetails();
            openBalance = String.valueOf(bankBookModel.getOpeningBalance());
            closeBalance = String.valueOf(bankBookModel.getClosingBalance());
            editTxnType = bankBookModel.getEditTransactionType();

        } catch (e: Exception) {
            var msg: String = "Class :ChequeTxn  Method  : displayBankBookDetails()   = {e.getMessage()}";
            log.debug(msg);

        }
    }

    public function updateValues(): Void {

        try {

            if (btnView.text != "Back [Ctrl+Left]") {

                if (btnSaveName == "Update [F7]") {

                    if (bankBookTable.rowselt != "-1") {
                        displayBankBookDetails(bankBookTable.rowselt);
                        bankBookTable.rowselt = "-1";
                    }
                }
            }
        } catch (e: Exception) {

            var msg: String = "Class :Cheque Transaction  Method  : updateValues()  = {e.getMessage()}";
            log.debug(msg);
        }
    }

}


