
package com.vanuston.medeil.ui;

import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import com.vanuston.medeil.ui.calendar.theme.Theme;
import com.vanuston.medeil.util.DateUtils;
import javafx.scene.image.Image;

import java.lang.Exception;

import javafx.scene.input.KeyCode;
import java.util.Calendar;
import com.vanuston.medeil.util.Value;
import java.util.regex.Pattern;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.util.Validation;
//import medil.utilities.GetUserInfo;
import com.vanuston.medeil.util.KeyRegistry;
import javafx.scene.control.TextBox;
import com.vanuston.medeil.model.DailyCashBookModel;
import com.vanuston.medeil.implementation.CommonImplements;
import java.text.SimpleDateFormat;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;



public class DailyCashBook {
var log: Logger = Logger.getLogger(DailyCashBook.class, "Financial");
    var p = Pattern.compile("[a-zA-Z]");
    var dateFlag: Boolean = false;
    var val: Validation = new Validation();
    var fxCalendar = FXCalendar {
                theme: Theme {};
            };
            var panelW = bind CommonDeclare.panelFormW;
    var panelH = bind CommonDeclare.panelFormH;
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var botton1LX = bind CommonDeclare.botton31LX;
    var botton2LX = bind CommonDeclare.botton32LX;
    var botton3LX = bind CommonDeclare.botton33LX;
    var bottonW = bind CommonDeclare.bottonW;
    var bottonH = bind CommonDeclare.bottonH;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;
    var amrGroupLX = bind (6.353240152 * panelW) / 100;
    var imgCalenderLX = bind (panelW - 50);
    var txtDateLX = bind imgCalenderLX - 102;
    var lblselDateLX = bind (txtDateLX - 290);
    var AmtTextW = bind 40.66073698 * panelW / 100;
    var CloseBalTxtLX = bind 52.35069886 * panelW / 100;
    var panelCalendarLX = bind (panelW - 250);
    var seperatorW = bind 73.062261756 * panelW / 100;
    var panelC1LX = bind 13.97712834 * panelW / 100;
    var panelC2LX = bind 43.20203304 * panelW / 100;
    var panelC3LX = bind 67.97966963 * panelW / 100;
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    def CustomAlert = CustomAlert {};
     var dailycashbookController: com.vanuston.medeil.implementation.DailyCashBook= RegistryFactory.getClientStub(RegistryConstants.DailyCashBook) as com.vanuston.medeil.implementation.DailyCashBook;;
     var commonController:CommonImplements=RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    def __layoutInfo_separator: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
        height: 17.0
    }
    public-read def separator: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: bind panelC1LX
        layoutY: 106.0
        layoutInfo: __layoutInfo_separator
    }
    
    def __layoutInfo_separator2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
        height: 9.0
    }
    public-read def separator2: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: bind panelC1LX
        layoutY: 387.0
        layoutInfo: __layoutInfo_separator2
    }
    
    public-read def panelCalendar: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelCalendarLX
        layoutY: 20.0
    }
    
    public-read def panelAuthorize: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
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
    
    def __layoutInfo_txtDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 100.0
    }
    public-read def txtDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind txtDateLX
        layoutY: 0.0
        layoutInfo: __layoutInfo_txtDate
        onKeyPressed: txtDateOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_label13: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 294.0
        height: 25.0
    }
    public-read def label13: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind lblselDateLX
        layoutY: 0.0
        layoutInfo: __layoutInfo_label13
        text: "To View Previous Day Cash Book, Select the Date"
        font: Arial_12
        textWrap: true
    }
    
    def __layoutInfo_txtExpenceAmt4: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtExpenceAmt4: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 250.0
        layoutInfo: __layoutInfo_txtExpenceAmt4
        onKeyPressed: txtExpenceAmt4OnKeyPressed
        onKeyReleased: txtExpenceAmt4OnKeyReleased
        onKeyTyped: txtExpenceAmt4OnKeyTyped
        text: "0.00"
        editable: true
        font: Arial_12
    }
    
    def __layoutInfo_txtExpenceAmt3: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtExpenceAmt3: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 225.0
        layoutInfo: __layoutInfo_txtExpenceAmt3
        onKeyPressed: txtExpenceAmt3OnKeyPressed
        onKeyReleased: txtExpenceAmt3OnKeyReleased
        onKeyTyped: txtExpenceAmt3OnKeyTyped
        text: "0.00"
        font: Arial_12
    }
    
    def __layoutInfo_txtExpenceAmt2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtExpenceAmt2: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 200.0
        layoutInfo: __layoutInfo_txtExpenceAmt2
        onKeyPressed: txtExpenceAmt2OnKeyPressed
        onKeyReleased: txtExpenceAmt2OnKeyReleased
        onKeyTyped: txtExpenceAmt2OnKeyTyped
        text: "0.00"
        font: Arial_12
    }
    
    def __layoutInfo_txtExpenceAmt1: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
        hfill: false
    }
    public-read def txtExpenceAmt1: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 150.0
        layoutInfo: __layoutInfo_txtExpenceAmt1
        styleClass: "Borderless-text-box"
        onKeyPressed: txtExpenceAmt1OnKeyPressed
        onKeyReleased: txtExpenceAmt1OnKeyReleased
        onKeyTyped: txtExpenceAmt1OnKeyTyped
        focusTraversable: false
        text: "0.00"
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtMaintainAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtMaintainAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 125.0
        layoutInfo: __layoutInfo_txtMaintainAmt
        styleClass: "Borderless-text-box"
        focusTraversable: false
        text: "0.00"
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtPaymentAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtPaymentAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 100.0
        layoutInfo: __layoutInfo_txtPaymentAmt
        styleClass: "Borderless-text-box"
        focusTraversable: false
        text: "0.00"
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtWithdrawalAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtWithdrawalAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: true
        layoutY: 75.0
        layoutInfo: __layoutInfo_txtWithdrawalAmt
        styleClass: "text-box"
        onKeyPressed: txtWithdrawalAmtOnKeyPressed
        onKeyReleased: txtWithdrawalAmtOnKeyReleased
        onKeyTyped: txtWithdrawalAmtOnKeyTyped
        text: "0.00"
        editable: true
        font: Arial_12
    }
    
    def __layoutInfo_txtCashIntoduced: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtCashIntoduced: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 50.0
        layoutInfo: __layoutInfo_txtCashIntoduced
        onKeyPressed: txtCashIntoducedOnKeyPressed
        onKeyReleased: txtCashIntoducedOnKeyReleased
        onKeyTyped: txtCashIntoducedOnKeyTyped
        text: "0.00"
        font: Arial_12
    }
    
    def __layoutInfo_txtReceiptAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtReceiptAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: true
        layoutY: 25.0
        layoutInfo: __layoutInfo_txtReceiptAmt
        styleClass: "Borderless-text-box"
        text: "0.00"
        editable: false
        columns: 10.0
        font: Arial_12
    }
    
    def __layoutInfo_txtSalesAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtSalesAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutInfo: __layoutInfo_txtSalesAmt
        styleClass: "Borderless-text-box"
        text: "0.00"
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtExpence4: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtExpence4: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 25.0
        layoutY: 250.0
        layoutInfo: __layoutInfo_txtExpence4
        onKeyPressed: txtExpence4OnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtExpence3: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtExpence3: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 25.0
        layoutY: 225.0
        layoutInfo: __layoutInfo_txtExpence3
        onKeyPressed: txtExpence3OnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtExpence2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtExpence2: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 25.0
        layoutY: 200.0
        layoutInfo: __layoutInfo_txtExpence2
        onKeyPressed: txtExpence2OnKeyPressed
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
    
    public-read def lblCashIntroAmt: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind Type3TextboxW+10
        layoutY: 50.0
        text: "Label"
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
    
    public-read def Arial_25: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
        size: 25.0
    }
    
    def __layoutInfo_txtCreditTotAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
        height: 30.0
    }
    public-read def txtCreditTotAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 275.0
        layoutInfo: __layoutInfo_txtCreditTotAmt
        styleClass: "Borderless-text-box"
        text: "0.00"
        promptText: ""
        editable: false
        font: Arial_25
    }
    
    def __layoutInfo_txtDebitTotAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
        height: 30.0
    }
    public-read def txtDebitTotAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 275.0
        layoutInfo: __layoutInfo_txtDebitTotAmt
        styleClass: "Borderless-text-box"
        text: "0.00"
        promptText: ""
        editable: false
        font: Arial_25
    }
    
    public-read def panelC2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelC2LX
        layoutY: 118.0
        content: [ txtSalesAmt, txtReceiptAmt, lblCashIntroAmt, txtCashIntoduced, txtDebitTotAmt, ]
    }
    
    def __layoutInfo_label: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
    }
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_label
        text: "Day Book - ctrl+K"
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
    
    public-read def lblDate: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind amrGroupLX+30
        layoutY: 0.0
        text: ""
        font: Arial_Bold_16
        textFill: DarkGray
    }
    
    public-read def labelDate: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind amrGroupLX
        layoutY: 4.0
        text: "Date"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label8: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Withdrawed:"
        font: Arial_12
        graphicHPos: javafx.geometry.HPos.LEFT
        textFill: DarkGray
    }
    
    def __layoutInfo_lblWithdrawalAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: 20.0
    }
    public-read def lblWithdrawalAmt: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind Type3TextboxW+10
        layoutY: 75.0
        layoutInfo: __layoutInfo_lblWithdrawalAmt
        graphic: label8
        text: "0.00"
        font: Arial_Bold_14
        graphicHPos: javafx.geometry.HPos.LEFT
        textFill: DarkGray
    }
    
    public-read def panelC3: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelC3LX
        layoutY: 118.0
        content: [ txtWithdrawalAmt, lblWithdrawalAmt, txtPaymentAmt, txtMaintainAmt, txtExpenceAmt1, txtExpenceAmt2, txtExpenceAmt3, txtExpenceAmt4, txtCreditTotAmt, ]
    }
    
    def __layoutInfo_label10: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW+25
    }
    public-read def label10: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 280.0
        layoutInfo: __layoutInfo_label10
        text: "Total"
        font: Arial_16
        hpos: javafx.geometry.HPos.RIGHT
        textFill: DarkGray
    }
    
    public-read def lable_Employee_Salary: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 150.0
        text: "Employee Salary"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelMaintenance_Costs_: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 125.0
        text: "Maintenance Costs "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelCash_Payments_: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 100.0
        text: "Cash Payments "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelCash_Withdrawal: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: true
        layoutX: 0.0
        layoutY: 75.0
        text: "Cash Withdrawal"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelCash_Introduced: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 50.0
        text: "Cash Introduced"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelReceipts_: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 25.0
        text: "Receipts "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelSales: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 0.0
        text: "Sales"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind CloseBalTxtLX
        layoutY: 0.0
        text: "Closing Balance"
        font: Arial_18
        textFill: DarkGray
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 0.0
        text: "Opening Balance"
        font: Arial_18
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
    
    public-read def labelOther_expenses_: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 175.0
        text: "Other Expenses "
        font: Arial_12
        textFill: Green
    }
    
    public-read def panelC1: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutX: bind panelC1LX
        layoutY: 118.0
        content: [ labelSales, labelReceipts_, labelCash_Introduced, labelCash_Withdrawal, labelCash_Payments_, labelMaintenance_Costs_, lable_Employee_Salary, labelOther_expenses_, txtExpence2, txtExpence3, txtExpence4, label10, ]
    }
    
    def __layoutInfo_labelCredit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def labelCredit: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind panelC3LX
        layoutY: 90.0
        layoutInfo: __layoutInfo_labelCredit
        text: "Credit (Cr.)"
        font: Arial_20
        textFill: Green
    }
    
    def __layoutInfo_labelDebit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def labelDebit: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind panelC2LX
        layoutY: 90.0
        layoutInfo: __layoutInfo_labelDebit
        text: "Debit (Dr.)"
        font: Arial_20
        hpos: javafx.geometry.HPos.LEFT
        textFill: Green
    }
    
    public-read def Yellow: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.95
        green: 0.94
        blue: 0.86
    }
    
    public-read def imageCalendar: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Calender.png"
    }
    
    public-read def imgCalendar: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind imgCalenderLX
        layoutY: 0.0
        onMouseClicked: imgCalendarOnMouseClicked
        image: imageCalendar
    }
    
    public-read def panelDate: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutY: 35.0
        content: [ labelDate, lblDate, label13, txtDate, imgCalendar, panelCalendar, ]
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
        layoutY: 0.0
        layoutInfo: __layoutInfo_btnSave
        onKeyPressed: btnSaveOnKeyPressed
        onKeyReleased: btnSaveOnKeyReleased
        effect: reflectionEffect
        graphic: imageView2
        text: "Save [F3]"
        font: Arial_Bold_14
        action: btnSaveAction
    }
    
    public-read def imageEdit: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Edit.png"
    }
    
    public-read def imageView3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageEdit
        fitWidth: 36.0
        fitHeight: 36.0
    }
    
    def __layoutInfo_btnEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 140.0
        height: 40.0
    }
    public-read def btnEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 215.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_btnEdit
        effect: reflectionEffect
        graphic: imageView3
        text: "Edit         "
        font: Arial_Bold_14
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
        layoutX: bind botton2LX
        layoutInfo: __layoutInfo_btnReset
        onKeyPressed: btnResetOnKeyPressed
        onKeyReleased: btnResetOnKeyReleased
        effect: reflectionEffect
        graphic: imageView4
        text: "Reset [F4]"
        font: Arial_Bold_14
        action: btnResetAction
    }
    
    public-read def imageCancel: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Cancel.png"
    }
    
    public-read def imageView5: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageCancel
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton3LX
        layoutInfo: __layoutInfo_btnCancel
        onKeyPressed: btnCancelOnKeyPressed
        onKeyReleased: btnCancelOnKeyReleased
        effect: reflectionEffect
        graphic: imageView5
        text: "Cancel [F8]"
        font: Arial_Bold_14
        action: btnCancelAction
    }
    
    public-read def panelButtons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutY: bind panelButtonsLY
        content: [ btnSave, btnEdit, btnReset, btnCancel, ]
    }
    
    public-read def imageBack: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/arrow_Left.png"
    }
    
    public-read def linearGradientHeader: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#FFFFFF") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#000000") }, ]
    }
    
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 0.25
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "rectFormHeader"
        fill: linearGradientHeader
        width: bind panelW
        height: 32.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def panelheader: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        content: [ rectHeader, label, ]
    }
    
    public-read def Arial_Bold_50: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 50.0
    }
    
    def __layoutInfo_txtCloseBal: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind AmtTextW
        height: 60.0
    }
    public-read def txtCloseBal: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind CloseBalTxtLX
        layoutY: 25.0
        layoutInfo: __layoutInfo_txtCloseBal
        styleClass: "Borderless-text-box"
        text: "0.00"
        promptText: ""
        editable: false
        font: Arial_Bold_50
    }
    
    def __layoutInfo_txtOpenBal: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind AmtTextW
        height: 60.0
    }
    public-read def txtOpenBal: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: true
        disable: false
        layoutX: 0.0
        layoutY: 25.0
        layoutInfo: __layoutInfo_txtOpenBal
        styleClass: "Borderless-text-box"
        onKeyPressed: txtOpenBalOnKeyPressed
        onKeyReleased: txtOpenBalOnKeyReleased
        onKeyTyped: txtOpenBalOnKeyTyped
        text: "0.00"
        promptText: ""
        editable: false
        font: Arial_Bold_50
    }
    
    public-read def group: javafx.scene.Group = javafx.scene.Group {
        visible: true
        layoutX: bind amrGroupLX
        layoutY: 0.0
        content: [ label2, txtOpenBal, label3, txtCloseBal, ]
    }
    
    public-read def paneldata: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutX: 0.0
        layoutY: 65.0
        content: [ group, labelDebit, labelCredit, separator, panelC1, panelC2, panelC3, separator2, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ rectangle, panelheader, paneldata, panelDate, panelButtons, panelAuthorize, panelAlert, ]
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.87058824
        green: 0.8392157
        blue: 0.8392157
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel, ]
    }
    // </editor-fold>//GEN-END:main
    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Daily Cash Book", type);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Daily Cash Book", msg);
        showAlertbox();
    }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Daily Cash Book", msg);
        showAlertbox();
        err_txtbox.requestFocus();
    }

    function txtDateOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function txtOpenBalOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function txtExpenceAmt4OnKeyTyped(event: javafx.scene.input.KeyEvent): Void {
        if (txtExpenceAmt4.rawText.trim().length() > 0) {
            var m = p.matcher(txtExpenceAmt4.rawText.trim());
//            if (m.find()) {
            if (not isNumeric(txtExpenceAmt4 )) {
                //FXinfo("Please enter only Numerals.,", txtExpenceAmt4);
                txtExpenceAmt4.text = "0.00";
                txtExpenceAmt4.selectEnd();
            }
        }
    }

    function txtExpenceAmt3OnKeyTyped(event: javafx.scene.input.KeyEvent): Void {
        if (txtExpenceAmt3.rawText.trim().length() > 0) {
            var m = p.matcher(txtExpenceAmt3.rawText.trim());
//            if (m.find()) {
            if (not isNumeric(txtExpenceAmt3)) {
                //FXinfo("Please enter only Numerals.", txtExpenceAmt3);
                txtExpenceAmt3.text = "0.00";
                txtExpenceAmt3.selectEnd();
            }
        }
    }

    function txtExpenceAmt2OnKeyTyped(event: javafx.scene.input.KeyEvent): Void {
        if (txtExpenceAmt2.rawText.trim().length() > 0) {
            var m = p.matcher(txtExpenceAmt2.rawText.trim());
//            if (m.find()) {
            if (not isNumeric(txtExpenceAmt2)) {
                //FXinfo("Please enter only Numerals.", txtExpenceAmt2);
                txtExpenceAmt2.text = "0.00";
                txtExpenceAmt2.selectEnd();
            }
        }
    }

    function txtExpenceAmt1OnKeyTyped(event: javafx.scene.input.KeyEvent): Void {
        if (txtExpenceAmt1.rawText.trim().length() > 0) {
            var m = p.matcher(txtExpenceAmt1.rawText.trim());
//            if (m.find()) {
            if (not isNumeric(txtExpenceAmt1)) {
                //FXinfo("Please enter only Numerals.", txtExpenceAmt1);
                txtExpenceAmt1.text = "0.00";
                txtExpenceAmt1.selectEnd();
            }
        }
    }

    function txtWithdrawalAmtOnKeyTyped(event: javafx.scene.input.KeyEvent): Void {
        if (txtWithdrawalAmt.rawText.trim().length() > 0) {
            var m = p.matcher(txtWithdrawalAmt.rawText.trim());
//            if (m.find()) {
            if (not isNumeric(txtWithdrawalAmt)) {
                //FXinfo("Please enter only Numerals.", txtWithdrawalAmt);
                txtWithdrawalAmt.text = "0.00";
                txtWithdrawalAmt.selectEnd();
            }
        }
    }

    function txtWithdrawalAmtOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            if (txtWithdrawalAmt.text == "" or isAdd(txtWithdrawalAmt)==0) {
                //txtWithdrawalAmt.text = "0.00";
                txtWithdrawalAmt.selectEnd();
                //txtExpence2.requestFocus();
            }
        }
    }

    function txtWithdrawalAmtOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB or event.code ==kr.save) {
            if (txtWithdrawalAmt.text == "" or isAdd(txtWithdrawalAmt)==0) {
                txtWithdrawalAmt.text = "0.00";
                txtExpence2.requestFocus();
            } else {
                txtExpence2.text="";
                txtExpence2.requestFocus();
                daybookCalulcation();
            }
        }
        shortcut(event);
    }

    function txtCashIntoducedOnKeyTyped(event: javafx.scene.input.KeyEvent): Void {
        if (txtCashIntoduced.rawText.trim().length() > 0) {
            var m = p.matcher(txtCashIntoduced.rawText.trim());
//            if (m.find()) {
            if (not isNumeric(txtCashIntoduced)) {
                //FXinfo("Please enter only Numerals.", txtCashIntoduced);
                txtCashIntoduced.text = "0.00";
                txtCashIntoduced.selectEnd();
            }
        }
    }

    function txtCashIntoducedOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            if (txtCashIntoduced.text == "" or isAdd(txtCashIntoduced)==0) {
                txtCashIntoduced.text = "0.00";
                txtWithdrawalAmt.requestFocus();
            }
        }        
    }

    function txtCashIntoducedOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB or event.code ==kr.save ) {
            if (txtCashIntoduced.text == "" or isAdd(txtCashIntoduced)==0) {
                txtCashIntoduced.text = "0.00";
                txtCashIntoduced.requestFocus();
            } else {
                txtWithdrawalAmt.text="";
                txtWithdrawalAmt.requestFocus();
                daybookCalulcation();
            }
        }
        shortcut(event);
    }

    function txtOpenBalOnKeyTyped(event: javafx.scene.input.KeyEvent): Void {
        if (txtExpenceAmt1.rawText.trim().length() > 0) {
            var m = p.matcher(txtOpenBal.rawText.trim());
//            if (m.find()) {
            if (not isNumeric(txtOpenBal)) {
                txtOpenBal.text = "0.00";
                txtWithdrawalAmt.selectEnd();
                //FXinfo("Please enter only Numerals.", txtOpenBal);
            }
        }

    }

    function txtOpenBalOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            if (txtOpenBal.text == "") {
                txtOpenBal.text = "0.00";
                txtOpenBal.requestFocus();
            } else {
                txtWithdrawalAmt.requestFocus();
                daybookCalulcation();
            }
        }
    }

    function btnResetAction(): Void {
        clear();
        setCashValues();
    }

    function txtExpenceAmt4OnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB or event.code ==kr.save) {
            if (txtExpenceAmt4.text == "" or isAdd(txtExpenceAmt4)==0) {
                txtExpenceAmt4.text = "0.00";
                btnSave.requestFocus();
            } else {
                daybookCalulcation();
                btnSave.requestFocus();
            }
        }
        shortcut(event);
    }

    function txtExpenceAmt3OnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB or event.code ==kr.save) {
            if (txtExpenceAmt3.text == "" or isAdd(txtExpenceAmt3)==0) {
                txtExpenceAmt3.text = "0.00";
                txtExpence4.requestFocus();
            } else {
                txtExpence4.text="";
                txtExpence4.requestFocus();
                daybookCalulcation();
            }
        }
        shortcut(event);
    }

    function txtExpenceAmt2OnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB or event.code ==kr.save) {
            if (txtExpenceAmt2.text == "" or isAdd(txtExpenceAmt2)==0) {
                txtExpenceAmt2.text = "0.00";
                txtExpence3.requestFocus();
            } else {
                txtExpence3.text="";
                txtExpence3.requestFocus();
                daybookCalulcation();
            }
        }
        shortcut(event);
    }

    function txtExpenceAmt1OnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB or event.code ==kr.save) {
            if (txtExpenceAmt1.text == "" or isAdd(txtExpenceAmt1)==0) {
                txtExpenceAmt1.text = "0.00";
            } else {
                txtExpence2.requestFocus();
                daybookCalulcation();
            }
        }
        shortcut(event);
    }

    function txtExpence4OnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB or event.code ==kr.save) {
            txtExpenceAmt4.requestFocus();
            daybookCalulcation();
        }
        shortcut(event);
    }

    function txtExpence3OnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB or event.code ==kr.save) {
            txtExpenceAmt3.requestFocus();
            daybookCalulcation();
        }
        shortcut(event);
    }

    function txtExpence2OnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB or event.code ==kr.save) {
            txtExpenceAmt2.requestFocus();
        }
        shortcut(event);
    }

    function txtExpence1OnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB ) {
            txtExpenceAmt1.requestFocus();
            daybookCalulcation();
        }
        shortcut(event);
    }

    function txtExpenceAmt4OnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            daybookCalulcation();
        }
    }

    function txtExpenceAmt3OnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {           
            daybookCalulcation();
            //txtExpence4.requestFocus();
        }
    }

    function txtExpenceAmt2OnKeyReleased(event: javafx.scene.input.KeyEvent): Void {       
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            daybookCalulcation();
            //txtExpence3.requestFocus();
        }
    }

    function txtExpenceAmt1OnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            daybookCalulcation();
        }
    }
    function btnCancelAction(): Void {
        panel.visible = false;
        CommonDeclare.form[4] = 0;
    }
    function btnCancelOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
         if (event.code == KeyCode.VK_ENTER) {
            btnCancelAction();
        } else { shortcut(event); }
         }
    function btnCancelOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
//        if (event.code == KeyCode.VK_ENTER) {
//            btnCancelAction();
//        } else { shortcut(event); }
    }

     function btnResetOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
         if (event.code == KeyCode.VK_ENTER) {
            btnResetAction();
        } else { shortcut(event); }
         }
    function btnResetOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
//        if (event.code == KeyCode.VK_ENTER) {
//            btnResetAction();
//        } else { shortcut(event); }
    }
    function btnSaveAction(): Void {
        saveDaybook();
    }
    function btnSaveOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            btnSaveAction();
        } else { shortcut(event); }
         }

    function btnSaveOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
//        if (event.code == KeyCode.VK_ENTER) {
//            btnSaveAction();
//        } else { shortcut(event); }
    }

    public function imgCalendarOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if (not dateFlag) {
            if (txtDate.text != null) {
                var dat = txtDate.rawText.trim().split("-");
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

    var textchange = bind txtDate.rawText.trim() on replace {
        var dailycashbookBean:DailyCashBookModel=new DailyCashBookModel();
        var cal: Calendar = Calendar.getInstance();
        
        var day: Integer = cal.get(Calendar.DATE);
        var month: Integer = cal.get(Calendar.MONTH)+1;
        var dat = txtDate.rawText.trim().split("-");

        

        if (dat[0] != null) {
            if (textchange.trim().length() > 0) {
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1]);
                
                var datereduce: Integer = day - d;

                if (month==m) {
                if (datereduce > 1 ) {
                    setCashValues();
                    dailycashbookBean.setOpenCashBalance(Double.valueOf(txtOpenBal.rawText));
                    /*paneldata.disable = true;
                    panelButtons.disable = true;*/
                    btnReset.visible=true;
                        btnCancel.visible=true;
                        btnSave.disable=true;
                    //if (GetSelectClass.openCash == 'Effect from Installed Date') {
                        //if (dailycashbookBean.getOpenCashBalance().toString() == 'Effect from Installed Date') {
                        if (dailycashbookBean.getOpenCashBalance() == 333.0) {

                        btnReset.visible=true;
                        btnCancel.visible=true;
                         btnSave.disable=true;
                        setCashValues();
                        lblWithdrawalAmt.text = "";
                        clear();
                        FXinfo("Daily Cash Book is Effective From Installed Date");
                    }
                } else if (datereduce == 0 or datereduce == 1) {
                    setCashValues();                     
                    dailycashbookBean.setOpenCashBalance(Double.valueOf(txtOpenBal.rawText));
                    paneldata.disable = false;
                    panelButtons.disable = false;
//                    if (dailycashbookBean.getOpenCashBalance().toString() == 'Effect from Installed Date') {
                    if (dailycashbookBean.getOpenCashBalance() == 333.0) {
                        {

                            btnReset.visible=true;
                        btnCancel.visible=true;
                         btnSave.disable=true;
                            setCashValues();
                            lblWithdrawalAmt.text = "";
                            clear();
                            FXinfo("Daily Cash Book is Effective From Installed Date");
                        }
                    }
                }else if (datereduce < 0) {
                    setCashValues();                       
                    if (paneldata.disable = true) {
                        /*paneldata.disable = true;
                        panelButtons.disable = true;*/
                        btnReset.visible=true;
                        btnCancel.visible=true;
                         btnSave.disable=true;
                        FXinfo("Daily Cash Book Access Only Current Date");
                    } else {
                        paneldata.disable = false;
                        panelButtons.disable = false;
                        //FXinfo("Daily Cash Book Access Only Current Date");
                    }
                }
            }else
            {
             setCashValues();
                    dailycashbookBean.setOpenCashBalance(Double.valueOf(txtOpenBal.rawText));
                    /*paneldata.disable = true;
                    panelButtons.disable = true;*/
                    btnReset.visible=true;
                        btnCancel.visible=true;
                        btnSave.disable=true;
            }

        }
          }
    }

    var visit = bind fxCalendar.visible on replace {
        if (dateFlag and not visit) {
            if (not fxCalendar.visible and dateFlag) {
                txtDate.text = fxCalendar.getSelectedDate();
                dateFlag = false;
            }
        }
    };

    def kr = KeyRegistry {};
    var key = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 5 and CommonDeclare.form[4] == 5) {
            shortcut(key);
        }
    }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == kr.save and btnSave.text == "Save [F3]" and not btnSave.disable) {
            saveDaybook();
            fxCalendar.requestFocus();
        }
        if (event.code == kr.reset) {
            if (btnReset.text == "Reset [F4]") {
                btnReset.requestFocus();
                clear();
                setCashValues();
                fxCalendar.requestFocus();
            }
        }
        if (event.code == kr.cancel) {
            if (btnCancel.text == "Cancel [F8]") {
                panel.visible = false;
            }
        }
    }

    public function daybookCalulcation(): Void {
        try {
            var openbalance: Double = Double.valueOf(txtOpenBal.rawText.trim());
            var closebalance: Double = Double.valueOf(txtCloseBal.rawText.trim());
            var debitsales: Double = Double.valueOf(txtSalesAmt.rawText.trim());
            var debitreceipts: Double = Double.valueOf(txtReceiptAmt.rawText.trim());
            //labelCash_Introduced
            var cashintroduced: Double = Double.valueOf(txtCashIntoduced.rawText.trim()) + Double.parseDouble(lblCashIntroAmt.text.trim());//modified by kks
            //          var cashwithdrawal: Double = Double.valueOf(txtWithdrawalAmt.rawText.trim());//modified by Prakash. V
            var cashwithdrawal: Double = Double.valueOf(txtWithdrawalAmt.rawText.trim()) + Double.parseDouble(lblWithdrawalAmt.text.trim()); //modified by Prakash. V
            var creditpayments: Double = Double.valueOf(txtPaymentAmt.rawText.trim());
            var creditmaintain: Double = Double.valueOf(txtMaintainAmt.rawText.trim());
            var expenseamt1: Double = Double.parseDouble(txtExpenceAmt1.rawText.trim());
            var expenseamt2: Double = Double.parseDouble(txtExpenceAmt2.rawText.trim());
            var expenseamt3: Double = Double.parseDouble(txtExpenceAmt3.rawText.trim());
            var expenseamt4: Double = Double.parseDouble(txtExpenceAmt4.rawText.trim());
            var debittotamt: Double = (debitsales + debitreceipts + cashintroduced);//modified by kks
            var credittotamt: Double = cashwithdrawal + creditpayments + creditmaintain + expenseamt1 + expenseamt2 + expenseamt3 + expenseamt4;
            txtDebitTotAmt.text = Value.Round(debittotamt.toString());
            txtCreditTotAmt.text = Value.Round(credittotamt.toString());
            closebalance = openbalance + debittotamt - credittotamt;
            txtCloseBal.text = Value.Round(closebalance.toString());
        } catch (e: Exception) {
            var msg: String = "Class : Daily Cash Book method : daybookCalulcation()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function clear(): Void {
        txtCloseBal.text = "0.00";
        txtSalesAmt.text = "0.00";

        txtReceiptAmt.text = "0.00";
        txtWithdrawalAmt.text = "0.00";
        txtPaymentAmt.text = "0.00";
        txtMaintainAmt.text = "0.00";

//        txtExpence1.text = "";
        txtExpence2.text = "";
        txtExpence3.text = "";
        txtExpence4.text = "";

        txtExpenceAmt1.text = "0.00";
        txtExpenceAmt2.text = "0.00";
        txtExpenceAmt3.text = "0.00";
        txtExpenceAmt4.text = "0.00";
        txtReceiptAmt.text = "0.00";
        txtWithdrawalAmt.text = "0.00";
        txtCashIntoduced.text = "0.00";//modified by kks
        txtPaymentAmt.text = "0.00";
        txtMaintainAmt.text = "0.00";

        txtDebitTotAmt.text = "0.00";
        txtCreditTotAmt.text = "0.00";
         btnSave.disable=false;
        txtDate.text=DateUtils.now("dd-MM-yyyy");
    }

    public function saveDaybook(): Void {
        try {
            var dailycashbookBean:DailyCashBookModel=new DailyCashBookModel();
            var san : Integer = 0;
            san = DailyCashBook();
            if (san == 10) {
                dailycashbookBean.setDailyCashBookDate(DateUtils.changeFormatDate(txtDate.rawText.trim()));
                dailycashbookBean.setOpenCashBalance(Double.valueOf(txtOpenBal.rawText.trim()));
                dailycashbookBean.setCloseCashBalance(Double.valueOf(txtCloseBal.rawText.trim()));
                dailycashbookBean.setDebitSales(Double.valueOf(txtSalesAmt.rawText.trim()));
                dailycashbookBean.setDebitReceipts(Double.valueOf(txtReceiptAmt.rawText.trim()));
                dailycashbookBean.setCashWithdrawal(Double.valueOf(txtWithdrawalAmt.rawText.trim()) + Double.valueOf(lblWithdrawalAmt.text.trim()));
                //                var preCashIntroStr = DBData.getQueryValue("SELECT COALESCE(sum(cash_intro),0) FROM `dailycashbook` where dsb_date=CURDATE();");
                var preCashIntroStr = "0";
                var preCashIntro: Double = Double.parseDouble(preCashIntroStr);
                //                var cashintroduced: Double = Double.valueOf(txtCashIntoduced.rawText.trim());//modified by kks
                dailycashbookBean.setCashIntroduced(Double.valueOf(txtCashIntoduced.rawText.trim()) + Double.valueOf(lblCashIntroAmt.text.trim()));//modified by V.Prakash on May 25
                dailycashbookBean.setCreditPayments(Double.valueOf(txtPaymentAmt.rawText.trim()));
                dailycashbookBean.setCreditMaintain(Double.valueOf(txtMaintainAmt.rawText.trim()));

                dailycashbookBean.setExpenses1("Employee Salary");
                dailycashbookBean.setExpenses2(txtExpence2.rawText.trim());
                dailycashbookBean.setExpenses3(txtExpence3.rawText.trim());
                dailycashbookBean.setExpenses4(txtExpence4.rawText.trim());

                dailycashbookBean.setOtherExpenses1(Double.parseDouble(txtExpenceAmt1.text));
                dailycashbookBean.setOtherExpenses2(Double.parseDouble(txtExpenceAmt2.text));
                dailycashbookBean.setOtherExpenses3(Double.parseDouble(txtExpenceAmt3.text));
                dailycashbookBean.setOtherExpenses4(Double.parseDouble(txtExpenceAmt4.text));

                dailycashbookBean.setTotalDebit(Double.parseDouble(txtDebitTotAmt.text));
                dailycashbookBean.setTotalCredit(Double.parseDouble(txtCreditTotAmt.text));

                if(dailycashbookController.createRecord(dailycashbookBean).equals(true))
                {                
                FXinfo("Data Saved Successfully");
                clear();
                UserLog('Daily Cash Book', 'Save');
                setCashValues();
                FXalert(0);
                }

            }
        } catch (e: Exception) {
            var msg: String = "Class : Daily Cash Book method : saveDaybook()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function setCashValues(): Void {
        try {
            if (not txtDate.text.equals("") or txtDate.text!=null)
            {
                var dailycashbookBean:DailyCashBookModel=new DailyCashBookModel();
               // dailycashbookController = RegistryFactory.getClientStub(RegistryConstants.DailyCashBook) as com.vanuston.medeil.implementation.DailyCashBook;
                dailycashbookBean.setDailyCashBookDate(DateUtils.changeFormatDate(txtDate.rawText.trim()));

                //var dcb:com.vanuston.medeil.implementation.DailyCashBook=new DailyCashBookController();
                dailycashbookBean=dailycashbookController.viewRecord(dailycashbookBean) as DailyCashBookModel;
                //if(dc.viewRecord(dailycashbookBean).equals(true))
                {
                txtOpenBal.text = Value.Round(dailycashbookBean.getOpenCashBalance());
                txtCloseBal.text = Value.Round(dailycashbookBean.getCloseCashBalance());
                txtSalesAmt.text = Value.Round(dailycashbookBean.getDebitSales());
                txtReceiptAmt.text = Value.Round(dailycashbookBean.getDebitReceipts());

                txtCashIntoduced.text = "0.00";

                lblCashIntroAmt.text = Value.Round(dailycashbookBean.getCashIntroduced());
                txtWithdrawalAmt.text = "0.00";
                lblWithdrawalAmt.text = Value.Round(dailycashbookBean.getCashWithdrawal());//modified by siva

                txtPaymentAmt.text = Value.Round(dailycashbookBean.getCreditPayments());
                txtMaintainAmt.text = Value.Round(dailycashbookBean.getCreditMaintain());

//                txtExpence1.text = GetSelectClass.expenseW1;
                txtExpence2.text = dailycashbookBean.getExpenses2();
                txtExpence3.text = dailycashbookBean.getExpenses3();
                txtExpence4.text = dailycashbookBean.getExpenses4();

                txtExpenceAmt1.text = Value.Round(dailycashbookBean.getOtherExpenses1());
                txtExpenceAmt2.text = Value.Round(dailycashbookBean.getOtherExpenses2());
                txtExpenceAmt3.text = Value.Round(dailycashbookBean.getOtherExpenses3());
                txtExpenceAmt4.text = Value.Round(dailycashbookBean.getOtherExpenses4());

                txtDebitTotAmt.text = Value.Round(dailycashbookBean.getTotalDebit());
                txtCreditTotAmt.text = Value.Round(dailycashbookBean.getTotalCredit());
                }
            }



            daybookCalulcation();
        } catch (e: Exception) {
            var msg: String = "Class : Daily Cash Book method : setCashValues()   = {e.getMessage()}";
            log.debug(msg);
        }

    }

    function DailyCashBook(): Integer {
        var cnt: Integer = 0;
        val = new Validation();
        var opencash = txtOpenBal.rawText.trim();
        var withdrawal = txtWithdrawalAmt.rawText.trim();
        var introduced = txtCashIntoduced.rawText.trim();
        var examt1 = txtExpenceAmt1.rawText.trim();
        var examt2 = txtExpenceAmt2.rawText.trim();
        var examt3 = txtExpenceAmt3.rawText.trim();
        var examt4 = txtExpenceAmt4.rawText.trim();
        try {
            var si1: Integer = 0; si1 = val.getDecimalValid(opencash, 1, 15);
            var si2: Integer = 0; si2 = val.getDecimalValid(withdrawal, 1, 15);
            var si21: Integer = 0; si2 = val.getDecimalValid(introduced, 1, 15);
            var si3: Integer = 0; si3 = val.getDecimalValid(examt1, 1, 15);
            var si4: Integer = 0; si4 = val.getDecimalValid(examt2, 1, 15);
            var si5: Integer = 0; si5 = val.getDecimalValid(examt3, 1, 15);
            var si6: Integer = 0; si6 = val.getDecimalValid(examt4, 1, 15);
            if(withdrawal=="")
            {
              txtWithdrawalAmt.text="0.00"
            }
            if(introduced=="")
            {
              txtCashIntoduced.text="0.00"
            }
            if(examt2=="")
            {
              txtExpenceAmt2.text="0.00"
            }
            if(examt3=="")
            {
              txtExpenceAmt3.text="0.00"
            }
            if(examt4=="")
            {
              txtExpenceAmt4.text="0.00"
            }
            if (si2 == 0) {
                FXinfo("Alphabets are not allowed.", txtWithdrawalAmt);
            } else if (si2 < 2) {
                FXinfo("Alphabets are not allowed.", txtWithdrawalAmt);
            } else if (si2 > 16) {
                FXinfo("Alphabets are not allowed.", txtWithdrawalAmt);
            } else if (si21 > 16) {
                FXinfo("Alphabets are not allowed.", txtCashIntoduced);
            } else if (si3 == 0) {
                FXinfo("Alphabets are not allowed.", txtExpenceAmt1);
            } else if (si3 < 2) {
                FXinfo("Alphabets are not allowed.", txtExpenceAmt1);
            } else if (si3 > 16) {
                FXinfo("Alphabets are not allowed.", txtExpenceAmt1);
            } else if (si4 == 0) {
                FXinfo("Alphabets are not allowed.", txtExpenceAmt2);
            } else if (si4 < 2) {
                FXinfo("Alphabets are not allowed.", txtExpenceAmt2);
            } else if (si4 > 16) {
                FXinfo("Alphabets are not allowed.", txtExpenceAmt2);
            } else if (si5 == 0) {
                FXinfo("Alphabets are not allowed.", txtExpenceAmt3);
            } else if (si5 < 2) {
                FXinfo("Alphabets are not allowed.", txtExpenceAmt3);
            } else if (si5 > 16) {
                FXinfo("Characters are not allowed", txtExpenceAmt3);
            } else if (si6 == 0) {
                FXinfo("Alphabets are not allowed.", txtExpenceAmt4);
            } else if (si6 < 2) {
                FXinfo("Alphabets are not allowed.", txtExpenceAmt4);
            } else if (si6 > 16) {
                FXinfo("Alphabets are not allowed.", txtExpenceAmt4);
            } else {
                cnt = 10;
            }
        } catch (e: Exception) {
            var msg: String = "Class : DailyCashBook  method :   DailyCashBook()= {e.getMessage()}";
            log.debug(msg);
        }

        return cnt;
    }

    function getPrivileges(u: String): Void {
//        var commonController:CommonImplements=new CommonController();
        var uname = u;
        var utype = commonController.getUserType(uname);
        if (utype.equals("User")) {
            var priv = commonController.getPrivileges("financial", uname);
            var ss = priv.split(",");
            var val = Integer.parseInt(ss[4]);
            if (val == 1) {
                btnSave.disable = true;
            } else if (val == 2) {
                btnSave.disable = false;
            } else if (val == 3) {
                btnSave.disable = false;
            }
        } else {
            btnSave.disable = false;
        }
    }

    var logUser: String = bind CommonDeclare.user on replace {
        getPrivileges(logUser);
    }
    public function UserLog( formName:String,actionName:String):Void
    {
        //var commonController=new CommonController();
        var checkLog=commonController.getUserLog(formName,actionName);
        if(checkLog==false)
        {
        }
    }
    public function isNumeric(t: TextBox): Boolean {
        try {
            Double.parseDouble(t.rawText);
            return true;
        } catch (Exception) {
            t.text='';
            t.deletePreviousChar();
            return false;
        }
    }
    public function isAdd(t: TextBox): Double {
        var a: Double = 0.00;
        a = a + Double.parseDouble(t.rawText);
        return a;
    }
    public function StartUp(): Void {
        panel.visible = true;
        getPrivileges(logUser);
        fxCalendar.visible = false;
        txtDate.editable = false;
        panelCalendar.content = [fxCalendar,];
        txtDate.text = DateUtils.now("dd-MM-yyyy");
        lblDate.text = DateUtils.now("dd-MM-yyyy");
        setCashValues();
        txtExpence2.requestFocus();
    }
}