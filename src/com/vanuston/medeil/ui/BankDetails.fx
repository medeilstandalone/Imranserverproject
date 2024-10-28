package com.vanuston.medeil.ui;

import javafx.scene.input.KeyCode ;
import java.lang.* ;
import javafx.ext.swing.SwingComponent ;
import com.vanuston.medeil.uitables.BankAccount ;
import java.awt.Dimension;
import com.vanuston.medeil.util.CommonDeclare;
import javafx.scene.control.TextBox;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.Validation;
import com.vanuston.medeil.util.KeyRegistry ;
import java.awt.event.KeyAdapter ;
import java.awt.event.MouseAdapter ;
import com.vanuston.medeil.ui.calendar.theme.Theme;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.model.BankAccountModel;
import java.sql.Date;
import com.vanuston.medeil.model.BankBookModel;
import com.vanuston.medeil.uitables.ConfirmDialogBox;
import com.vanuston.medeil.implementation.BankBook ;
import com.vanuston.medeil.util.RegistryConstants ;

public class BankDetails {
    //Controller Reference
    var bankAccountController : com.vanuston.medeil.implementation.BankAccount ;
    var commonController : CommonImplements ;
    var bankAccount : BankAccount =new BankAccount () ;
    var rowNo = 1;
    var colNames: Object[] = ["SNo", "Ac/No", "Name ", "Ac/Type", "Bank Name and Branch", "Address"];
    var colType: Class[] = [java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class];
    var colEditable: Boolean[] = [false, false, false, false, false, false];
    var colWidth: Integer[] = [45, 80, 110, 110, 220, 150] ;
    var table = bankAccount.createViewTable(rowNo, colNames, colType, colEditable, colWidth) ;
    var BankDetails = SwingComponent.wrap(bankAccount.getScrollTable(table)) ;
    var log: Logger = Logger.getLogger(BankDetails.class, "Bank Details");
    

    var panelW = bind CommonDeclare.panelFormW;
    var panelH = bind CommonDeclare.panelFormH;
    var C1LX = bind CommonDeclare.Column1LX;
    var C2LX = bind CommonDeclare.Column2LX;
    var C3LX = bind CommonDeclare.Column3LX;
    var C4LX = bind CommonDeclare.Column4LX;
    var seperatorW = bind CommonDeclare.seperatorW;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;
    var Type4TextboxW = bind CommonDeclare.Type4TextboxW;
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var botton1LX = bind CommonDeclare.botton1LX;
    var botton2LX = bind CommonDeclare.botton2LX;
    var botton3LX = bind CommonDeclare.botton3LX;
    var botton4LX = bind CommonDeclare.botton4LX;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    var bottonW = bind CommonDeclare.bottonW;
    var bottonH = bind CommonDeclare.bottonH;
    var CancelW = bottonW;
    var TableW = bind (95.29860229 * panelW) / 100 on replace { changeTableSize(TableW, TableH); };
    var TableH = 225.0 on replace { changeTableSize(TableW, TableH); };
    var panelTableLX = bind (panelW - TableW) / 2;
    var dateFlag: Boolean = false;
    var fxCalendar = FXCalendar {
                theme: Theme {};
            };
    var Bank: String[] = "" ;
    var Account_Type: String[] = ["--Choose Type--", "SB A/c -Savings Bank Account", "CC A/c - Cash Credit Account", "CA A/c - Current Account", "Salary Account", "OD A/c - Overdue Account", "Propreitorship account", "Partnership account", "Firm account", "Company account"];
    var Status: String[] = ["--Choose Type--", "Active", "Inactive", "Closed"];

    function changeTableSize(i: Integer, j: Integer): Void {
        BankDetails.getJComponent().setPreferredSize(new Dimension(i, j));
    }

    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    def __layoutInfo_separator: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
        height: 5.0
    }
    public-read def separator: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: 37.0
        layoutY: 81.0
        layoutInfo: __layoutInfo_separator
    }
    
    public-read def panelTable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelTableLX
        layoutY: 162.0
    }
    
    public-read def rectTableBorder: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        layoutX: bind panelTableLX
        layoutY: 162.0
        styleClass: "rectTableBorder"
        width: bind TableW
        height: bind TableH
    }
    
    def __layoutInfo_cboAcType: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def cboAcType: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: bind C2LX
        layoutY: 54.0
        layoutInfo: __layoutInfo_cboAcType
        onKeyPressed: cboAcTypeOnKeyPressed
        onMouseClicked: cboAcTypeOnMouseClicked
        items: bind Account_Type
    }
    
    public-read def cboStatus: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: bind C2LX
        layoutY: 135.0
        onKeyPressed: cboStatusOnKeyPressed
        onMouseClicked: cboStatusOnMouseClicked
        items: bind Status
    }
    
    def __layoutInfo_cboBank: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
        height: 20.0
    }
    public-read def cboBank: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: bind C4LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_cboBank
        onMouseClicked: cboBankOnMouseClicked
        focusTraversable: false
        items: bind Bank
    }
    
    public-read def panelCalender: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: 188.0
        layoutY: 54.0
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
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
    }
    
    def __layoutInfo_txtAddress: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
        height: 73.0
    }
    public-read def txtAddress: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 54.0
        layoutInfo: __layoutInfo_txtAddress
        onKeyPressed: txtAddressOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtBranch: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtBranch: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 27.0
        layoutInfo: __layoutInfo_txtBranch
        styleClass: "text-box"
        onKeyPressed: txtBranchOnKeyPressed
        text: ""
        editable: true
        font: Arial_12
    }
    
    def __layoutInfo_txtbank: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW-18
    }
    public-read def txtbank: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_txtbank
        onKeyPressed: txtbankOnKeyPressed
        promptText: "Choose the Bank"
        editable: true
        font: Arial_12
    }
    
    def __layoutInfo_txtDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 81.0
        layoutInfo: __layoutInfo_txtDate
        onKeyPressed: txtDateOnKeyPressed
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtAcHolder: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtAcHolder: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 27.0
        layoutInfo: __layoutInfo_txtAcHolder
        styleClass: "text-box"
        onKeyPressed: txtAcHolderOnKeyPressed
        text: ""
        editable: true
        font: Arial_12
    }
    
    def __layoutInfo_txtAcNum: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtAcNum: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_txtAcNum
        styleClass: "text-box"
        onKeyPressed: txtAcNumOnKeyPressed
        onKeyReleased: txtAcNumOnKeyReleased
        text: ""
        editable: true
        columns: 10.0
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
    
    def __layoutInfo_txtOpenBal: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtOpenBal: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 108.0
        layoutInfo: __layoutInfo_txtOpenBal
        onKeyPressed: txtOpenBalOnKeyPressed
        text: ""
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
    
    public-read def rdoDebit: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: bind C2LX+Type2TextboxW+70
        layoutY: 110.0
        onKeyPressed: rdoDebitOnKeyPressed
        onMouseClicked: rdoDebitOnMouseClicked
        text: "Debit"
        font: Arial_12
        toggleGroup: toggleGroup
    }
    
    public-read def rdoCredit: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: bind C2LX+Type2TextboxW+10
        layoutY: 110.0
        onKeyPressed: rdoCreditOnKeyPressed
        onMouseClicked: rdoCreditOnMouseClicked
        text: "Credit"
        font: Arial_12
        toggleGroup: toggleGroup
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
        text: "Bank Accounts - ctrl+A"
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
    
    public-read def labelAddress: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 54.0
        text: "Address"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelBranch: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 27.0
        text: "Branch"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelBank_Name: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 0.0
        text: "Bank Name"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelStatus: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 135.0
        text: "Status"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelOpening_Balance: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 108.0
        text: "Opening Balance"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelDate_Opened: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 81.0
        text: "Date Opened"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelAccount_type: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 54.0
        text: "Account Type"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelAccount_Holder: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 27.0
        text: "Account Holder"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelAccountNumber: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 0.0
        text: "Account Number"
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
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 37.0
        layoutY: 51.0
        text: "Bank Account Details"
        font: Arial_18
        textFill: Green
    }
    
    public-read def panelheader: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ rectangle, rectHeader, label, label3, separator, ]
    }
    
    public-read def Yellow: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.95
        green: 0.94
        blue: 0.86
    }
    
    public-read def imageCalendar: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Calender.png"
    }
    
    public-read def imgDate: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind C2LX+Type3TextboxW
        layoutY: 81.0
        onMouseClicked: imgDateOnMouseClicked
        image: imageCalendar
    }
    
    def __layoutInfo_panelpage: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 787.0
        height: 100.0
    }
    public-read def panelpage: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutY: 90.0
        layoutInfo: __layoutInfo_panelpage
        content: [ panelTable, rectTableBorder, txtAcNum, labelAccountNumber, labelAccount_Holder, labelAccount_type, labelDate_Opened, labelOpening_Balance, labelStatus, txtAcHolder, cboAcType, txtDate, imgDate, txtOpenBal, rdoCredit, rdoDebit, cboStatus, labelBank_Name, labelBranch, labelAddress, cboBank, txtbank, txtBranch, txtAddress, panelCalender, ]
    }
    
    public-read def imageSave: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Save1.png"
    }
    
    public-read def imageView2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageSave
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX
        layoutInfo: __layoutInfo_btnSave
        onKeyPressed: btnSaveOnKeyPressed
        graphic: imageView2
        text: "Save [F3]"
        font: Arial_Bold_14
        action: btnSaveAction
    }
    
    public-read def imageEdit: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Edit.png"
    }
    
    public-read def imgEdit: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageEdit
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: true
        layoutX: bind botton2LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_btnEdit
        onKeyPressed: btnEditOnKeyPressed
        effect: reflectionEffect
        graphic: imgEdit
        text: "Edit [F6]"
        font: Arial_Bold_14
        action: btnEditAction
    }
    
    public-read def imageReset: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Reset.png"
    }
    
    public-read def imageView4: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageReset
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton3LX
        layoutInfo: __layoutInfo_btnReset
        onKeyPressed: btnResetOnKeyPressed
        effect: reflectionEffect
        graphic: imageView4
        text: "Reset [F4]"
        font: Arial_Bold_14
        action: btnResetAction
    }
    
    public-read def imageCancel: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Cancel.png"
    }
    
    public-read def imgCancel: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageCancel
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind CancelW
        height: bind bottonH
    }
    public-read def btnCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton4LX
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
        content: [ btnSave, btnEdit, btnReset, btnCancel, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ panelheader, panelpage, panelButtons, panelAlert, ]
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
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel, ]
    }
    // </editor-fold>//GEN-END:main


    function imgDateOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        txtDate.style = mandatoryStyle;
        if (not dateFlag) {
            panelCalender.layoutY = imgDate.layoutY + txtDate.height + 5.0;
            if (txtDate.rawText != null) {
                var dat = txtDate.rawText.split("-");
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
            dateFlag = true;
        } else {
            fxCalendar.visible = false;
        }
    }

    var visit = bind fxCalendar.visible on replace {
        if (dateFlag and not visit) {
            getDate(0);
        }
    };

    function getDate(i: Integer) {
        if (i == 0) {
            txtDate.text = fxCalendar.getSelectedDate();
            dateFlag = false;
            txtOpenBal.requestFocus();
        }
    }

    function txtAcNumOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    def kr = KeyRegistry {};
    var key = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 5 and CommonDeclare.form[4] == 6) {
            shortcut(key);
        }
    }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {

        if (event.controlDown or event.altDown or event.shiftDown) {
            kr.actionKey = event.code;
        }
        if (event.code == kr.save and btnSave.text == "Save [F3]") {
            save();
        }
        if (event.code == kr.edit and btnEdit.text == "Edit [F6]") {
            edit();
        }
        if (event.code == kr.reset and btnReset.text == "Reset [F4]") {
            reset();
        }
        if (event.code == kr.update and btnSave.disable == false) {
            if (btnSave.text == "Update [F7]") { save(); }
        }
        if (event.code == kr.del and btnEdit.disable == false) {
            if (btnEdit.text == "Delete [F5]") { del(); }
        }
        if (event.controlDown and event.code == kr.back) {
            if (btnCancel.text == "Back [Ctrl+Left]") { back(); }
        }
        if (event.code == kr.cancel) {
            if (btnCancel.text == "Cancel [F8]") {
                delete  panel.content;
                panel.visible = false;
                CommonDeclare.form[4] = 0;
            }
        }
    }

    function rdoDebitOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        Status = ["--Choose Type--", "Active", "Inactive", "Closed"];
        cboStatus.requestFocus();
    }

    function rdoCreditOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        Status = ["--Choose Type--", "Active", "Inactive", "Closed"];
        cboStatus.requestFocus();
    }

    function cboStatusOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        Status = ["--Choose Type--", "Active", "Inactive", "Closed"];
    }

    function cboBankOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        getBankName();
    }

    function cboAcTypeOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        Account_Type = ["--Choose Type--", "SB A/c -Savings Bank Account", "CC A/c - Cash Credit Account", "CA A/c - Current Account", "Salary Account", "OD A/c - Overdue Account", "Propreitorship account", "Partnership account", "Firm account", "Company account"];
    }

    var mandatoryStyle: String = CommonDeclare.textbox_mandatory();
    var errorStyle: String = CommonDeclare.textbox_error();
    def CustomAlert = CustomAlert {};

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Bank Details", type);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Bank Details", msg);
        showAlertbox();
    }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Bank Details", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = errorStyle;
    }

    function btnCancelOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            if (btnCancel.text == "Back [Ctrl+Left]") {
                back();
            } else {
                delete  panel.content;
                panel.visible = false;
                CommonDeclare.form[4] = 0;
            }
        }
    }

    function btnCancelAction(): Void {
        if (btnCancel.text == "Back [Ctrl+Left]") {
            back();
        } else {
            delete  panel.content;
            panel.visible = false;
            CommonDeclare.form[4] = 0;
        }
    }

    function btnResetOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            reset();
        }
    }

    function btnResetAction(): Void {
        reset();
    }

    function btnEditOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            if (btnEdit.text == "Delete [F5]") {
                del();
            } else {
                edit();
            }
        }
    }

    function btnEditAction(): Void {
        if (btnEdit.text == "Delete [F5]") {
            del();
        } else {
            edit();
        }
    }

    function btnSaveOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            save();
        }
    }

    function btnSaveAction(): Void {
        save();
    }

    function txtAddressOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        fxCalendar.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            btnSave.requestFocus();
        } shortcut(event);
    }

    function txtBranchOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        fxCalendar.visible = false;
        txtBranch.style = mandatoryStyle;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtAddress.requestFocus();
        } shortcut(event);
    }
    var bn = bind cboBank.selectedItem on replace {
        txtbank.style = mandatoryStyle;
        txtbank.text = cboBank.selectedItem.toString();
        txtBranch.requestFocus();
    }    
    function txtbankOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        fxCalendar.visible = false ;
        txtbank.style = mandatoryStyle ;
        if (event.code == KeyCode.VK_DOWN) {
            getBankName () ;
            cboBank.show () ;          
        }
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtBranch.requestFocus();
        }
          
        shortcut(event);
    }

    var currentStatus = bind cboStatus.selectedItem on replace {
        txtbank.style = mandatoryStyle;
        txtbank.requestFocus();
    }

    function cboStatusOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        Status = ["--Choose Type--", "Active", "Inactive", "Closed"];
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            getBankName();
            txtbank.requestFocus();
        } shortcut(event);
    }

    function rdoDebitOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            rdoDebit.selected = true;
            Status = ["--Choose Type--", "Active", "Inactive", "Closed"];
            cboStatus.requestFocus();
            cboStatus.select(0);
        }
        shortcut(event);
    }

    function rdoCreditOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            rdoCredit.selected = true;
            Status = ["--Choose Type--", "Active", "Inactive", "Closed"];
            cboStatus.requestFocus();
            cboStatus.select(0);
        }
        shortcut(event);
    }

    function txtOpenBalOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        txtOpenBal.style = mandatoryStyle;
        fxCalendar.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            rdoCredit.requestFocus();
        } shortcut(event);
    }

    function txtDateOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        fxCalendar.visible = false ;
        if (event.code == KeyCode.VK_ESCAPE) {
            fxCalendar.visible = false;
        }
        shortcut(event);
    }

    var bb = bind cboAcType.selectedItem on replace {
        txtDate.requestFocus();
    }


    function cboAcTypeOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtDate.requestFocus();
        } shortcut(event);
    }

    function txtAcHolderOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        txtAcHolder.style = mandatoryStyle;
        fxCalendar.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            Account_Type = ["--Choose Type--", "SB A/c -Savings Bank Account", "CC A/c - Cash Credit Account", "CA A/c - Current Account", "Salary Account", "OD A/c - Overdue Account", "Propreitorship account", "Partnership account", "Firm account", "Company account"];
            cboAcType.requestFocus();
            cboAcType.select(0);
        } shortcut(event);
    }

    function txtAcNumOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        txtAcNum.style = mandatoryStyle;
        fxCalendar.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtAcHolder.requestFocus();
        } shortcut(event);
    }

    function save(): Void {
        try {
            //Controller Instance
            bankAccountController = RegistryFactory.getClientStub (RegistryConstants.BankAccount) as com.vanuston.medeil.implementation.BankAccount ;
         
            var san: Integer = 0;
            san = clickValid();
            if (san == 10) {
                var bankAccountModel : BankAccountModel = new BankAccountModel () ;
                var bankBookModel : BankBookModel = new BankBookModel () ;
                bankAccountModel.setOpenDate (Date.valueOf (DateUtils.changeFormatDate (txtDate.rawText))) ;
                bankAccountModel.setAccountNumber (txtAcNum.rawText) ;
                bankAccountModel.setAccountHolder (txtAcHolder.rawText) ;
                bankAccountModel.setAccountType (cboAcType.selectedItem.toString()) ;
                var open_bal: String; var type: String;
                var bal: String; var cr_amt: String; var db_amt: String;
                var closing_bal: String;
                if (rdoCredit.selected == true) {
                    type = rdoCredit.text;
                    open_bal = "{Double.parseDouble(txtOpenBal.rawText)}";
                    bal = "0.00";
                    cr_amt = open_bal;
                    db_amt = "0.00";
                    closing_bal = "{Double.parseDouble(bal) + Double.parseDouble(cr_amt)}";
                } else if (rdoDebit.selected == true) {
                    type = rdoDebit.text;
                    open_bal = "{Double.parseDouble(txtOpenBal.rawText)}";
                    bal = "0.00";
                    db_amt = open_bal;
                    cr_amt = "0.00";
                    closing_bal = "{Double.parseDouble(bal) - Double.parseDouble(db_amt)}";
                }
                bankAccountModel.setBalanceType (type) ;
                bankAccountModel.setOpeningBalance (Double.parseDouble (open_bal)) ;
                bankAccountModel.setAccountStatus (cboStatus.selectedItem.toString()) ;
                bankAccountModel.setBankName (txtbank.rawText) ;
                bankAccountModel.setBranch (txtBranch.rawText) ;
                bankAccountModel.setAddress (txtAddress.rawText) ;
                //BankBookModel
                bankBookModel.setAccountNumber (txtAcNum.rawText) ;
                bankBookModel.setOpeningBalance (Double.parseDouble (open_bal)) ;
                bankBookModel.setBankBranchName (txtbank.rawText.concat(",").concat(txtBranch.rawText)) ;
                bankBookModel.setDebitAmount (Double.parseDouble (db_amt)) ;
                bankBookModel.setCreditAmount (Double.parseDouble (cr_amt)) ;
                bankBookModel.setClosingBalance(Double.parseDouble (closing_bal));
                bankBookModel.setTransactionDetails("Opening Balance") ;
                bankBookModel.setTransactionType ("") ;
                bankBookModel.setExpenseTowards ("") ;
                if (btnSave.text == "Save [F3]") {
                    //Controller Instance
                    commonController = RegistryFactory.getClientStub (RegistryConstants.CommonImplements) as CommonImplements ;
                    if (commonController.checkExistance ("bank_details", txtAcNum.rawText) == false) {
                        //Controller Instance

                        if (bankAccountController.createRecord (bankAccountModel) as Boolean) {

                            bankBookModel.setSaveType ("save") ;
                            if (bankAccountController.createRecord (bankBookModel) as Boolean) {
                                FXalert(0);
                            } else {
                                FXinfo("BankBook was not created");                                
                            }                                

                        }
                        back();
                        bankAccount.LoadBankDetails();
                    } else {
                        FXinfo("Account Number is Already Exists.", txtAcNum);
                    }
                } else {
                    var cn : ConfirmDialogBox = new ConfirmDialogBox(0,"Bank Details");
                    var a =bind cn.staus;
                    if (a) {

                        bankAccountController.updateRecord (bankAccountModel) ;
                         FXalert(4);
                        reset();
                        bankAccount.LoadBankDetails () ;
                    }
                }
            }
        } catch (e: Exception) {
            var msg: String = "Class : Bank Details  Method : Save()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function del(): Void {
        try {
             var san: Integer = 0;
            san = clickValid();
            if (san == 10) {

                var cn : ConfirmDialogBox = new ConfirmDialogBox(1,"Bank Details");
                var a =bind cn.staus;
                if (a) {
                    bankAccountController = RegistryFactory.getClientStub (RegistryConstants.BankAccount) as com.vanuston.medeil.implementation.BankAccount ;
                    bankAccountController.deleteRecord (txtAcNum.rawText) ;
                        FXalert(5);
                    back();
                    bankAccount.LoadBankDetails();
                }
            }
        } catch (e: Exception) {
            var msg: String = "Class : Bank Details  Method : Del()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function clickValid(): Integer {
        var cnt: Integer = 0;
        var acno = txtAcNum.rawText;
        var acholder = txtAcHolder.rawText;
        var date = txtDate.rawText;
        var acc = txtOpenBal.rawText;
        var bank = txtbank.rawText;
        var branch = txtBranch.rawText;

        var val: Validation = new Validation();
        try {
            var ac: Integer; ac = val.getAlphaNumericValid(acno, 2, 15);
            var ach: Integer; ach = val.getAlphaNumericValid(acholder, 2, 45);
            var da: Integer; da = val.getDecimalValid(acc, 2, 15);
            var bk: Integer; bk = val.getAlphaNumericValid(bank, 2, 45);
            var brh: Integer; brh = val.getAlphaNumericValid(branch, 2, 45);


            if (acno.length() <= 0) {
                FXinfo("Please Enter Account Number.", txtAcNum);
            } else if (ac == 0) {
                FXinfo("Allowed only Characters and Number Values.", txtAcNum);
            } else if (acholder.length() <= 0) {
                FXinfo("Please Enter Account Holder Name.", txtAcHolder);
            } else if (ach == 0) {
                FXinfo("Allowed only Characters and Number Values.", txtAcHolder);
            } else if (cboAcType.selectedItem.equals("--Choose Type--")) {
                FXinfo("Please Select the Account Type.");
                cboAcType.requestFocus();
            } else if (date.length() <= 0) {
                FXinfo("Please Select the Date.", txtDate);
            } else if (acc.length() <= 0) {
                FXinfo("Please Enter Opening Balance Amount.", txtOpenBal);
            } else if (da == 0) {
                FXinfo("Allowed only Decimal Values."); txtOpenBal.requestFocus();
            } else if (cboStatus.selectedItem.equals("--Choose Type--")) {
                FXinfo("Please Select the Account Type.");
                cboStatus.requestFocus();
            } else if (bank.equals("--Choose Bank--") or bank.equals("")) {
                FXinfo("Please Select the Bank Name.", txtbank);
            } else if (bk == 0) {
                FXinfo("Allowed only Characters and Number Values.", txtbank);
            } else if (branch.length() <= 0) {
                FXinfo("Please Enter the Branch Name.", txtBranch);
            }    else {
                cnt = 10;
            }
        } catch (e: Exception) {
            var msg: String = "Class : Bank Details  Method : Clickvalid ()   = {e.getMessage()}";
            log.debug(msg);
        }
        return cnt;
    }

    function edit(): Void {
        btnSave.text = "Update [F7]";
        btnEdit.text = "Delete [F5]";
        imgEdit.image = imageCancel;
        btnCancel.text = "Back [Ctrl+Left]";
        imgCancel.image = imageBack;
        CancelW = bottonW + 30;
        txtAcNum.editable = false;
        getDetails();
    }

    function getDetails(): Void {
        try {
            if(bankAccount.acc_no!=""){
            txtOpenBal.editable = false;

            bankAccountController = RegistryFactory.getClientStub (RegistryConstants.BankAccount) as com.vanuston.medeil.implementation.BankAccount ;
            var bankAccountModel : BankAccountModel = bankAccountController.viewRecord (bankAccount.acc_no) as BankAccountModel ;
            txtAcNum.text = bankAccountModel.getAccountNumber () ;
            txtAcHolder.text = bankAccountModel.getAccountHolder () ;
            Account_Type =  bankAccountModel.getAccountType () ;
            cboAcType.select(0);
            txtDate.text = DateUtils.normalFormatDate(bankAccountModel.getOpenDate () ) ;
            txtOpenBal.text = bankAccountModel.getOpeningBalance ().toString () ;
            var type =  bankAccountModel.getBalanceType () ;
            if (type.equals("Credit")) {
                rdoCredit.selected = true;
                rdoCredit.disable = false;
                rdoDebit.disable = true;
            } else if (type.equals("Debit")) {
                rdoDebit.selected = true;
                rdoDebit.disable = false;
                rdoCredit.disable = true;
            }
            Status =  bankAccountModel.getAccountStatus () ;            
            cboStatus.select(0);
            txtbank.text = bankAccountModel.getBankName () ;
            txtBranch.text = bankAccountModel.getBranch () ;
            txtAddress.text = bankAccountModel.getAddress () ;
            }else{
                reset();
            }

        } catch (e: Exception) {
            var msg: String = "Class : Bank Details  Method : Edit()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function updateValues(): Void {
        if (btnSave.text == "Update [F7]" and btnEdit.text == "Delete [F5]") {
            getDetails();
        }
    }

    function reset(): Void {
        mandatory();
        txtAcNum.requestFocus();
        txtAcHolder.text = "";
        txtAcNum.text = "";
        txtOpenBal.text = "0.00";
        txtDate.text = "";
        txtAddress.text = "";
        txtBranch.text = "";
        txtbank.text = "";
        Account_Type = ["--Choose Type--", "SB A/c -Savings Bank Account", "CC A/c - Cash Credit Account", "CA A/c - Current Account", "Salary Account", "OD A/c - Overdue Account", "Propreitorship account", "Partnership account", "Firm account", "Company account"];
        Status = ["--Choose Type--", "Active", "Inactive", "Closed"];
        cboAcType.select(0);
        cboStatus.select(0);
        rdoCredit.selected = true;
        rdoDebit.selected = false;
        rdoCredit.disable = false;
        rdoDebit.disable = false;
        bankAccount.acc_no = "";
         bankAccount.LoadBankDetails();
    }

    function back(): Void {
        txtOpenBal.editable = true;
        btnSave.text = "Save [F3]";
        btnEdit.text = "Edit [F6]";
        imgEdit.image = imageEdit;
        btnCancel.text = "Cancel [F8]";
        CancelW = bottonW;
        imgCancel.image = imageCancel;
        txtAcNum.editable = true;
        btnSave.disable = false;
        btnEdit.disable = false;
        reset();
    }

    function mandatory() {
        txtAcNum.style = mandatoryStyle;
        txtAcHolder.style = mandatoryStyle;
        txtOpenBal.style = mandatoryStyle;
        txtbank.style = mandatoryStyle;
        txtBranch.style = mandatoryStyle;
        txtDate.style = mandatoryStyle;
    }

    function getBankName(): Void {
        try {
            commonController = RegistryFactory.getClientStub (RegistryConstants.CommonImplements) as CommonImplements ;
            Bank = commonController.getBankNameList().toArray() as String[] ;            
        } catch (e: Exception) {
            var msg : String = "Class : BankDetails  Method : getBankName()   = ".concat(e.getMessage());
            log.debug (msg) ;
        }
    }
    public function StartUp(): Void {     
        panel.visible = true;
        panel.content = [panelheader, panelpage, panelButtons, panelAlert,];
        panelCalender.content = [fxCalendar,]; fxCalendar.visible = false;
        panelTable.content = [BankDetails];
        BankDetails.layoutX = 0;
        BankDetails.layoutY = 0;
        reset();
        bankAccount.LoadBankDetails();

        (table as javax.swing.JTable).addKeyListener(KeyAdapter {
            override public function keyReleased(e: java.awt.event.KeyEvent): Void {
                updateValues();
            }
            override public function keyTyped(e: java.awt.event.KeyEvent): Void {
                updateValues();
            }
        });
        (table as javax.swing.JTable).addMouseListener(MouseAdapter {
            override public function mouseClicked(e: java.awt.event.MouseEvent): Void {
                updateValues();
            }
        });
        txtAcNum.requestFocus();
    }

}
