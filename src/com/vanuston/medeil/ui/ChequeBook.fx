package com.vanuston.medeil.ui;
import com.vanuston.medeil.util.DateUtils;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.scene.control.TextBox;
import javafx.scene.control.ChoiceBox;
import javafx.scene.control.Control;
import com.vanuston.medeil.util.StringUtils;
import javafx.ext.swing.SwingComponent;
import java.awt.Dimension;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.util.Validation;
import com.vanuston.medeil.model.ChequeBookModel;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.ui.calendar.theme.Theme;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import java.text.SimpleDateFormat;

import java.awt.event.MouseAdapter;
import com.vanuston.medeil.util.KeyRegistry;
import com.vanuston.medeil.model.MsgReturnModel;
import java.lang.Exception;
import com.vanuston.medeil.uitables.ChequeTable;
import com.vanuston.medeil.uitables.ChequeViewTable;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.uitables.ConfirmDialogBox;

public class ChequeBook {

    /************************* Variables *************************/
    var log: Logger = Logger.getLogger(ChequeBook.class, "Finanical");
    var chequeController: com.vanuston.medeil.implementation.ChequeBook=RegistryFactory.getClientStub(RegistryConstants.ChequeBook) as com.vanuston.medeil.implementation.ChequeBook;

    def CustomAlert = CustomAlert {};
    var chequeTable = new ChequeTable();
    var chequeViewTable = new ChequeViewTable();
    var dateFormat: SimpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
    var val: Validation = new Validation();
    var mode: Integer = 0; //0-Save 1-Edit 2-View
    var comObj : CommonImplements=RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    var Status: String[] = ["-- Select --", "Cleared", "Returned", "Cancelled ", "Stop Payment", "Show All"];
    var BookID=chequeController.getChequeBookIDList("").toArray();
    var  accountNo=comObj.getAccountNumbers().toArray();
    //Create Table
    var Table = chequeTable.createTable();
    var ChqTable = SwingComponent.wrap(chequeTable.getScrollTable(Table));
// View Table
    var ViewTable = chequeViewTable.createTable();
    var ViewChqTable = SwingComponent.wrap(chequeViewTable.getScrollTable(ViewTable));
    var mandatory: String = CommonDeclare.textbox_mandatory();
    var error: String = CommonDeclare.textbox_error();
    var curDateFlag: Boolean = false;
    var fxCalendar = FXCalendar { theme: Theme {}; };
    var panelW = bind CommonDeclare.panelFormW;
    var Type5TextboxW = panelW * 3.811944091 / 100;
    var panelH = bind CommonDeclare.panelFormH;
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var C1LX = bind CommonDeclare.Column1LX;
    var C2LX = bind CommonDeclare.Column2LX;
    var C3LX = bind CommonDeclare.Column3LX;
    var C4LX = bind CommonDeclare.Column4LX;
    var button1LX = bind CommonDeclare.botton1LX;
    var button2LX = bind CommonDeclare.botton2LX;
    var button3LX = bind CommonDeclare.botton3LX;
    var button4LX = bind CommonDeclare.botton4LX;
    var buttonImageW = bind CommonDeclare.bottonImageW;
    var buttonImageH = bind CommonDeclare.bottonImageH;
    var buttonW = bind CommonDeclare.bottonW;
    var buttonH = bind CommonDeclare.bottonH;
    var ResetbuttonW = buttonW;
    var CancelbuttonW = buttonW;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;
    var Type4TextboxW = bind CommonDeclare.Type4TextboxW;
    var TableW = bind (95.29860229 * panelW) / 100 on replace {
        changeTableSize(TableW, TableH);
         };
    var TableH = 215.0;

    function changeTableSize(i: Integer, j: Integer): Void {
        ChqTable.getJComponent().setPreferredSize(new Dimension(i, j));
        ViewChqTable.getJComponent().setPreferredSize(new Dimension(i, j));
         }

    var panelTableLX = bind (panelW - TableW) / 2;
    var panelTableLY = 245.0;
    var rectRemoveRowLX = bind ((panelW + TableW) / 2) - 120;
    var rectRemoveRowLY = bind panelTableLY + TableH;
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    /************************* Variables *************************/
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def panelTable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelTableLX
        layoutY: bind panelTableLY
    }
    
    public-read def textbox: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        onKeyPressed: StatisticsKeyPressed
        onKeyReleased: StatisticsKeyPressed
    }
    
    def __layoutInfo_cboAcNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def cboAcNo: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: bind C2LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_cboAcNo
        onKeyPressed: cboAcNoOnKeyPressed
        onKeyReleased: cboAcNoOnKeyPressed
        items: bind accountNo
    }
    
    def __layoutInfo_cboBookID: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW+18
    }
    public-read def cboBookID: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: true
        layoutX: bind C2LX
        layoutY: 27.0
        layoutInfo: __layoutInfo_cboBookID
        items: bind BookID
    }
    
    public-read def panelDate: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind C2LX
        blocksMouse: true
    }
    
    def __layoutInfo_cboViewAcNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def cboViewAcNo: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: true
        layoutX: 143.0
        layoutY: 1.0
        layoutInfo: __layoutInfo_cboViewAcNo
        onKeyPressed: cboViewAcNoOnKeyPressed
        items: bind accountNo
    }
    
    def __layoutInfo_cboViewBookID: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def cboViewBookID: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: 143.0
        layoutY: 31.0
        layoutInfo: __layoutInfo_cboViewBookID
        onKeyPressed: cboViewBookIDOnKeyPressed
        items: bind BookID
    }
    
    def __layoutInfo_cboViewStatus: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW+25
    }
    public-read def cboViewStatus: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: 143.0
        layoutY: 62.0
        layoutInfo: __layoutInfo_cboViewStatus
        onKeyPressed: cboViewStatusOnKeyPressed
        onKeyReleased: cboViewStatusOnKeyPressed
        items: bind Status
    }
    
    def __layoutInfo_separator: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 382.0
        height: 6.0
    }
    public-read def separator: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: 10.0
        layoutY: 28.0
        layoutInfo: __layoutInfo_separator
    }
    
    def __layoutInfo_separator2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 382.0
        height: 7.0
    }
    public-read def separator2: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: 10.0
        layoutY: 83.0
        layoutInfo: __layoutInfo_separator2
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
    
    public-read def txtMisused: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 300.0
        layoutY: 136.0
        onKeyPressed: StatisticsKeyPressed
        focusTraversable: false
        editable: false
        font: Arial_12
    }
    
    public-read def txtCancelled: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 300.0
        layoutY: 113.0
        onKeyPressed: StatisticsKeyPressed
        focusTraversable: false
        editable: false
        font: Arial_12
    }
    
    public-read def txtProgress: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 300.0
        layoutY: 90.0
        onKeyPressed: StatisticsKeyPressed
        focusTraversable: false
        editable: false
        font: Arial_12
    }
    
    public-read def txtReturned: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 138.0
        layoutY: 113.0
        onKeyPressed: StatisticsKeyPressed
        focusTraversable: false
        editable: false
        font: Arial_12
    }
    
    public-read def txtLost: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 138.0
        layoutY: 159.0
        onKeyPressed: StatisticsKeyPressed
        focusTraversable: false
        editable: false
        font: Arial_12
    }
    
    public-read def txtStopped: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: true
        layoutX: 138.0
        layoutY: 136.0
        onKeyPressed: StatisticsKeyPressed
        focusTraversable: false
        editable: false
        font: Arial_12
    }
    
    public-read def txtUsed: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 138.0
        layoutY: 58.0
        onKeyPressed: StatisticsKeyPressed
        focusTraversable: false
        editable: false
        font: Arial_12
    }
    
    public-read def txtRemaining: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 300.0
        layoutY: 58.0
        onKeyPressed: StatisticsKeyPressed
        focusTraversable: false
        editable: false
        font: Arial_12
    }
    
    public-read def txtCleared: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 138.0
        layoutY: 90.0
        onKeyPressed: StatisticsKeyPressed
        focusTraversable: false
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtRemarks: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW+25
        height: 64.0
    }
    public-read def txtRemarks: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 54.0
        layoutInfo: __layoutInfo_txtRemarks
        onKeyPressed: txtRemarksOnKeyPressed
        text: ""
        font: Arial_12
        multiline: true
    }
    
    def __layoutInfo_txtBranch: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtBranch: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        disable: false
        layoutX: bind C4LX
        layoutY: 27.0
        layoutInfo: __layoutInfo_txtBranch
        onKeyPressed: txtBranchOnKeyPressed
        focusTraversable: false
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtBank: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtBank: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        disable: false
        layoutX: bind C4LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_txtBank
        onKeyPressed: txtBankOnKeyPressed
        focusTraversable: false
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtIssuedDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtIssuedDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 135.0
        layoutInfo: __layoutInfo_txtIssuedDate
        onKeyPressed: txtIssuedDateOnKeyPressed
        focusTraversable: false
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtCount: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtCount: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 108.0
        layoutInfo: __layoutInfo_txtCount
        styleClass: "text-box"
        onKeyPressed: txtCountOnKeyPressed
        onKeyTyped: txtCountOnKeyTyped
        focusTraversable: false
        text: ""
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtLastNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtLastNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 81.0
        layoutInfo: __layoutInfo_txtLastNo
        onKeyPressed: txtLastNoOnKeyPressed
        onKeyTyped: txtLastNoOnKeyTyped
        font: Arial_12
    }
    
    def __layoutInfo_txtFirstNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtFirstNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 54.0
        layoutInfo: __layoutInfo_txtFirstNo
        onKeyPressed: txtFirstNoOnKeyPressed
        onKeyTyped: txtFirstNoOnKeyTyped
        editable: true
        font: Arial_12
    }
    
    def __layoutInfo_txtBookID: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtBookID: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: true
        disable: false
        layoutX: bind C2LX
        layoutY: 27.0
        layoutInfo: __layoutInfo_txtBookID
        styleClass: "text-box"
        onKeyPressed: txtBookIDOnKeyPressed
        onKeyTyped: txtBookIDOnKeyTyped
        onMouseClicked: txtBookIDOnMouseClicked
        blocksMouse: false
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
    
    def __layoutInfo_label6: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 120.0
        height: 20.0
    }
    public-read def label6: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: true
        layoutX: 0.0
        layoutInfo: __layoutInfo_label6
        text: "View Statistics"
        font: Arial_Bold_14
        hpos: javafx.geometry.HPos.CENTER
    }
    
    public-read def Arial_16: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 16.0
    }
    
    public-read def Arial_Bold_16: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 16.0
    }
    
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 15.0
        layoutY: 8.0
        text: "Summary"
        font: Arial_Bold_16
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
        text: "Cheque book - ctrl+Q"
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
    
    public-read def label22: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 32.0
        layoutY: 159.0
        text: "Lost"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label21: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 234.0
        layoutY: 136.0
        text: "Misused"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label20: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 234.0
        layoutY: 113.0
        text: "Cancelled"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label19: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 234.0
        layoutY: 90.0
        text: "In progress"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label18: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 32.0
        layoutY: 136.0
        text: "Stopped Payment"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label17: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 32.0
        layoutY: 113.0
        text: "Returned"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label16: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 32.0
        layoutY: 90.0
        text: "Cleared"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label10: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 234.0
        layoutY: 58.0
        text: "Remaining"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label8: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 32.0
        layoutY: 58.0
        text: "Used"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def lblViewEnd: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "---"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def label13: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 32.0
        layoutY: 117.0
        text: "to"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def lblViewStart: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 32.0
        layoutY: 96.0
        text: "---"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def label11: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 32.0
        layoutY: 82.0
        text: "Cheque No."
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def hbox: javafx.scene.layout.HBox = javafx.scene.layout.HBox {
        layoutX: 70.0
        layoutY: 35.0
        content: [ label11, lblViewStart, label13, lblViewEnd, ]
        spacing: 6.0
    }
    
    public-read def rectangle4: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        opacity: 0.7
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "DialogBox"
        fill: linearGradient
        stroke: DarkGray
        strokeWidth: 4.0
        width: 400.0
        height: 190.0
        arcWidth: 10.0
        arcHeight: 10.0
    }
    
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: true
        layoutX: 57.0
        layoutY: 61.0
        text: "Status"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: true
        layoutX: 57.0
        layoutY: 29.0
        text: "Book ID"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: true
        layoutX: 57.0
        text: "Account No. "
        font: Arial_12
        textFill: DarkGray
    }
    
    def __layoutInfo_labelRemarks: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: 64.0
    }
    public-read def labelRemarks: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 54.0
        layoutInfo: __layoutInfo_labelRemarks
        text: "Remarks "
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
    
    public-read def labelbank: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 0.0
        text: "Bank Name"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelIssued_Date: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 135.0
        text: "Issued Date"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelNo__of_Cheques: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 108.0
        text: "No. of Cheques"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelLast_No: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 81.0
        text: "Last No."
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelFirst_No: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 54.0
        text: "First No."
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelCheque_Book_ID: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 27.0
        text: "Cheque Book ID"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelAc_No: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 0.0
        text: "Account No. "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def rectTableBorder: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        layoutX: bind panelTableLX
        layoutY: bind panelTableLY
        styleClass: "rectTableBorder"
        onKeyPressed: rectTableBorderOnKeyPressed
        onKeyReleased: rectTableBorderOnKeyPressed
        focusTraversable: false
        fill: linearGradient
        stroke: DarkGray
        strokeWidth: 2.0
        width: bind TableW
        height: bind TableH
        arcWidth: 10.0
        arcHeight: 10.0
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
        content: [ rectHeader, label, ]
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
    
    public-read def lblViewTotal: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "100"
        font: Arial_Bold_20
        graphicHPos: javafx.geometry.HPos.LEFT
        textFill: Green
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 298.0
        layoutY: 5.0
        graphic: lblViewTotal
        text: "Total :"
        font: Arial_Bold_14
        graphicHPos: javafx.geometry.HPos.RIGHT
    }
    
    public-read def panel2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind Type1TextboxW+200
        layoutY: 0.0
        content: [ rectangle4, label7, hbox, label8, txtCleared, label9, txtRemaining, label10, txtUsed, txtStopped, txtLost, txtReturned, separator, separator2, label16, label17, label18, label19, label20, label21, label22, txtProgress, txtCancelled, txtMisused, ]
    }
    
    public-read def panelView: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: 50.0
        content: [ label3, label4, label5, cboViewAcNo, cboViewBookID, cboViewStatus, panel2, ]
    }
    
    public-read def Yellow: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.95
        green: 0.94
        blue: 0.86
    }
    
    public-read def rectangle2: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        styleClass: "rectbutton"
        fill: Yellow
        stroke: DarkGray
        strokeWidth: 2.0
        width: 120.0
        height: 20.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def groupView: javafx.scene.Group = javafx.scene.Group {
        visible: true
        cursor: null
        layoutX: bind rectRemoveRowLX
        layoutY: bind rectRemoveRowLY
        onKeyPressed: groupViewOnKeyPressed
        onMouseClicked: groupViewOnMouseClicked
        cache: false
        effect: null
        focusTraversable: true
        content: [ rectangle2, label6, ]
    }
    
    public-read def imageCalendar: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Calender.png"
    }
    
    public-read def imgIssuedDate: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind Type3TextboxW+C2LX
        layoutY: 135.0
        onKeyPressed: imgIssuedDateOnKeyPressed
        onMouseClicked: imgIssuedDateOnMouseClicked
        focusTraversable: true
        image: imageCalendar
    }
    
    def __layoutInfo_panelpage: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 787.0
        height: 100.0
    }
    public-read def panelpage: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutY: 50.0
        layoutInfo: __layoutInfo_panelpage
        content: [ labelAc_No, labelCheque_Book_ID, labelFirst_No, labelLast_No, labelNo__of_Cheques, labelIssued_Date, cboAcNo, cboBookID, txtBookID, txtFirstNo, txtLastNo, txtCount, txtIssuedDate, imgIssuedDate, labelbank, labelBranch, labelRemarks, txtBank, txtBranch, txtRemarks, panelDate, ]
    }
    
    public-read def imageSave: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Save1.png"
    }
    
    public-read def imgSave: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageSave
        fitWidth: bind buttonImageW
        fitHeight: bind buttonImageH
    }
    
    def __layoutInfo_btnSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind buttonW
        height: bind buttonH
    }
    public-read def btnSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind button1LX
        layoutInfo: __layoutInfo_btnSave
        onKeyPressed: btnSaveOnKeyPressed
        effect: reflectionEffect
        graphic: imgSave
        text: "Save"
        font: Arial_Bold_14
        action: btnSaveAction
    }
    
    public-read def imageEdit: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Edit.png"
    }
    
    public-read def imgEdit: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageEdit
        fitWidth: bind buttonImageW
        fitHeight: bind buttonImageH
    }
    
    def __layoutInfo_btnEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind buttonW
        height: bind buttonH
    }
    public-read def btnEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: true
        layoutX: bind button2LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_btnEdit
        onKeyPressed: btnEditOnKeyPressed
        effect: reflectionEffect
        graphic: imgEdit
        text: "Edit"
        font: Arial_Bold_14
        action: btnEditAction
    }
    
    public-read def imageReset: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Reset.png"
    }
    
    public-read def imgReset: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageReset
        fitWidth: bind buttonImageW
        fitHeight: bind buttonImageH
    }
    
    def __layoutInfo_btnReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind ResetbuttonW
        height: bind buttonH
    }
    public-read def btnReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind button3LX
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
        fitWidth: bind buttonImageW
        fitHeight: bind buttonImageH
    }
    
    def __layoutInfo_btnCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind CancelbuttonW
        height: bind buttonH
    }
    public-read def btnCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind button4LX
        layoutInfo: __layoutInfo_btnCancel
        onKeyPressed: btnCancelOnKeyPressed
        effect: reflectionEffect
        graphic: imgCancel
        text: "Cancel [F8]"
        font: Arial_Bold_14
        action: btnCancelAction
    }
    
    public-read def panelButtons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutY: 490.0
        content: [ btnSave, btnEdit, btnReset, btnCancel, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ rectangle, panelheader, panelTable, rectTableBorder, textbox, panelpage, panelView, panelButtons, panelAlert, groupView, ]
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
    
    public-read def dropShadowEffect: javafx.scene.effect.DropShadow = javafx.scene.effect.DropShadow {
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel, ]
    }
    // </editor-fold>//GEN-END:main

    function rectTableBorderOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (transferFocus(event, btnSave)) { shortcut(event);
             }
         }

    function StatisticsKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
         }

    function txtBookIDOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if (mode == 1) {
            cboBookID.show();
             }
         }

    function imgIssuedDateOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        ShowCalendar();
         }

    function txtBranchOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (transferFocus(event, txtRemarks)) { shortcut(event);
             }
         }

    function txtBankOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (transferFocus(event, txtRemarks)) { shortcut(event);
             }
         }

    function txtIssuedDateOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (transferFocus(event, txtRemarks)) { shortcut(event);
             }
         }

    function txtLastNoOnKeyTyped(event: javafx.scene.input.KeyEvent): Void {
        if (not StringUtils.charLimit(txtLastNo, 15)) {
            FXinfo("Cheque book ending number cannot exceed more than 15 digits");
             } else {
            findChqTotal();
             }

         }

    function txtFirstNoOnKeyTyped(event: javafx.scene.input.KeyEvent): Void {
        if (not StringUtils.charLimit(txtFirstNo, 15)) {
            FXinfo("Cheque book starting number cannot exceed more than 15 digits");
             } else {
            findChqTotal();
             }

         }

    function txtBookIDOnKeyTyped(event: javafx.scene.input.KeyEvent): Void {
        if (not StringUtils.charLimit(txtBookID, 20)) {
            FXinfo("Cheque Book ID cannot exceed more than 20 characters");
             }
         }

    function txtCountOnKeyTyped(event: javafx.scene.input.KeyEvent): Void {
        txtCount.style = mandatory;
    
         }

    function cboViewStatusOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        btnEdit.requestFocus();
        shortcut(event);
         }

    function cboViewBookIDOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (transferFocus(event, cboViewStatus)) {
            shortcut(event);
             }
         }

    function cboViewAcNoOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (transferFocus(event, cboViewBookID)) { shortcut(event);
             }
         }

    function txtRemarksOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
          if (event.code == KeyCode.VK_ENTER) {
               chequeTable.focusSet();
        } shortcut(event);
         }

    function imgIssuedDateOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            ShowCalendar();
             } else if (event.code == KeyCode.VK_TAB) {
            txtRemarks.requestFocus();
             }
        shortcut(event);
         }

    function txtLastNoOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        txtLastNo.style = mandatory;
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            imgIssuedDate.requestFocus();
             } else {
            shortcut(event);
             }
         }

    function txtFirstNoOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        txtFirstNo.style = mandatory;
        if (transferFocus(event, txtLastNo)) { shortcut(event);
             }

         }

    function txtCountOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
         }

    function txtBookIDOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        txtBookID.style = mandatory;
        if (event.code == KeyCode.VK_DOWN and mode == 1) {
            cboBookID.show();
             } else {
            if (transferFocus(event, txtFirstNo)) { shortcut(event);
                 }
             }
         }

    function cboAcNoOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.controlDown == true and event.code == KeyCode.VK_BACK) {
            saveMode();
             }
        shortcut(event);
        if (mode == 0) {
            transferFocus(event, txtBookID);
             } else if (mode == 1) {
            transferFocus(event, cboBookID);
             }

         }

    /************************* Button Functions *************************/
    function btnCancelOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB) {
            groupView.requestFocus();
             } else if (event.code == KeyCode.VK_ENTER) {
            btnCancelAction();
             }
        shortcut(event);
         }

    function btnCancelAction(): Void {
        if (mode == 1) {
            saveMode();
             } else if (mode == 2) {
            viewMode();
             }else{
                 panel.visible=false;
             }

         }

    function btnResetOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB) {
            btnCancel.requestFocus();
             } else if (event.code == KeyCode.VK_ENTER) {
            btnCancelAction();
             }
        shortcut(event);
         }

    function btnResetAction(): Void {
        if (mode == 2) {
            saveMode();
             } else if (mode == 0 or mode == 1) {
            reset();
             } else if (mode == 1) {
        //    resetBookContents();
             }

         }

    function btnEditOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB) {
            btnReset.requestFocus();
             } else if (event.code == KeyCode.VK_ENTER) {
            btnCancelAction();
             }
        shortcut(event);
         }

    function btnEditAction(): Void {
        if (mode == 0) {
            editMode();
             } else if (mode == 1) {
            chqdelete();
             } else if (mode == 2) {
            reset();
             }
         }

    function btnSaveOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB) {
            btnEdit.requestFocus();
             } else if (event.code == KeyCode.VK_ENTER) {
            btnSaveAction();
             }
        shortcut(event);
         }

    function validation(): ChequeBookModel {

        var chequeBookModel = new ChequeBookModel();
        chequeBookModel.setAccountNumber(cboAcNo.selectedItem.toString());
        chequeBookModel.setBookID(txtBookID.rawText);
        chequeBookModel.setLeaves(txtCount.rawText);
        chequeBookModel.setStartNumber(txtFirstNo.rawText);
        chequeBookModel.setEndNumber(txtLastNo.rawText);
        var date = "0000-00-00";
        if (txtIssuedDate.rawText.trim().length() > 0) {
            date = DateUtils.changeFormatDate(dateFormat.parse(txtIssuedDate.rawText));
            chequeBookModel.setIssuedDate(date);
             }
        chequeBookModel.setRemarks(txtRemarks.rawText);
        return chequeBookModel;
         }

    function btnSaveAction(): Void {
        try {
           
            if (salesValidated()) {

                var chequeBookModel = validation();

                chequeBookModel = chequeController.getChqUsed(chequeBookModel); //Controller Call
                if (chequeBookModel.getRecordCount() > 0) {
                    FXinfo("This cheque book already in use.");
                     } else {
                    if (mode == 0) {
                        chequeBookModel.setSaveType("save");
                        var returnObject = new Object();
                        returnObject = chequeController.createRecord(chequeBookModel); // controller call
                        var msgReturnModel: MsgReturnModel = new MsgReturnModel();
                        msgReturnModel = returnObject as MsgReturnModel;
                        if (msgReturnModel.getReturnMessage() == "0") {
                            FXalert(0);
                            reset();
                            cboAcNo.requestFocus();
                             } else {
                            FXinfo(msgReturnModel.getReturnMessage());
                             }

                        chequeTable.loadChequeValues();
                         } else if (mode == 1) {
                        var cn:ConfirmDialogBox=new ConfirmDialogBox(0,"Cheque Book");
                            var a =bind cn.staus;
                                        if (a) {
                                            chequeBookModel.setSaveType("update");
                                            var returnObject = new Object();
                                            returnObject = chequeController.createRecord(chequeBookModel); // controller call
                                            var msgReturnModel: MsgReturnModel = new MsgReturnModel();
                                            msgReturnModel = returnObject as MsgReturnModel;
                                            if (msgReturnModel.getReturnMessage() == "0") {
                                                 FXalert(4);
                                                reset();
                                                chequeTable.loadChequeValues();
                                                cboAcNo.requestFocus();
                                                 } else {
                                                FXinfo(msgReturnModel.getReturnMessage());
                                                 }

                                             }


                         }

                     }
                 }
             } catch (e) {
            log.debug(" Class : ChequeBook   Method: btnSaveAction    Exception : {e.getMessage()}");
             }

         }

    function chqdelete(): Void {
        if (cboAcNo.selectedIndex == 0) {
            FXinfo("Please select an account number");
            cboAcNo.requestFocus();
             } else if (cboBookID.selectedIndex == 0) {
            FXinfo("Please select an Cheque Book ID");
             } else {
            try {
                var chequeBookModel = validation();
                    var cn:ConfirmDialogBox=new ConfirmDialogBox(1,"Cheque Book");
                            var a =bind cn.staus;
                                if (a) {

                                    var returnObject: Boolean = false;
                                    chequeController=RegistryFactory.getClientStub(RegistryConstants.ChequeBook) as com.vanuston.medeil.implementation.ChequeBook;
                                    returnObject = chequeController.deleteRecord(chequeBookModel); // controller call
                                    if (returnObject == true) {
                                          FXalert(5);
                                        reset();
                                        cboAcNo.requestFocus();
                                        chequeTable.loadChequeValues();
                                         }

                                     }


                 } catch (e) {
                var msg: String = "Class :ChequeBook  Method  :chqdelete   Exception= {e.getMessage()}";
                log.debug(msg);
                 }
             }
         }

    /************************* End - Button Functions *************************/
    /************************* groupView actions *************************/
    function groupViewOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        viewMode();
         }

    function groupViewOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB) {
            cboAcNo.requestFocus();
             } else if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_SPACE) {
            viewMode();
             }
        shortcut(event);
         }

    /************************* End - groupView actions *************************/
    var groupFocused = bind groupView.focused on replace {
        if (groupFocused) {
            groupView.effect = dropShadowEffect;
             } else {
            groupView.effect = null;
             }
         }
    var dateFocused = bind imgIssuedDate.focused on replace {
        if (dateFocused) {
            imgIssuedDate.effect = dropShadowEffect;
             } else {
            imgIssuedDate.effect = null;
             }
         }

    /************************* End - Functions *************************/
    function salesValidated(): Boolean {
        var result = false;
        var book = val.getAlphaNumericValid(txtBookID.rawText.replaceAll("'", ""), 4, 20);
        var start = val.getNumberValid(txtFirstNo.rawText.replaceAll("'", ""), 4, 15);
        var end = val.getNumberValid(txtLastNo.rawText.replaceAll("'", ""), 4, 15);
        var startL = txtFirstNo.rawText.trim().length();
        var endL = txtLastNo.rawText.trim().length();
        
        if (cboAcNo.selectedIndex == 0) {
            FXinfo("Please select an account number");
            cboAcNo.requestFocus();
             } else if (txtBookID.rawText.trim().length() == 0) {
            FXinfo("Please enter Cheque Book ID", txtBookID);
             } else if (book == 0) {
            FXinfo("Only Alphabets and Numbers can be entered for Cheque Book ID", txtBookID);
             } else if (book == 11) {
            FXinfo("You need to enter characters 4 digits for Cheque Book ID ", txtBookID);
             } else if (mode == 0 and chequeController.getChequeBookValid(cboAcNo.selectedItem.toString(), txtBookID.rawText.trim())>=1) {
            FXinfo("Cheque Book ID already exists", txtBookID);
             } else if (txtFirstNo.rawText.trim().length() == 0) {
            FXinfo("Please enter Cheque book starting number", txtFirstNo);
             } else if (start == 0) {
            FXinfo("Only  Numbers can be entered for Cheque book starting number", txtFirstNo);
             } else if (start == 11) {
            FXinfo("You need to enter minimum 4 digits for Cheque book starting number", txtFirstNo);
             } else if (txtLastNo.rawText.trim().length() == 0) {
            FXinfo("Please enter Cheque book ending number", txtLastNo);
             } else if (end == 0) {
            FXinfo("Only  Numbers can be entered for Cheque book ending number", txtLastNo);
             } else if (end == 11) {
            FXinfo("You need to enter minimum 4 digits for Cheque book ending number", txtLastNo);
             } else if ((startL - endL) != 0) {
            FXinfo("First No. length and Last No. length are mismatched", txtFirstNo);
             } else if (txtCount.rawText.trim().length() == 0) {
            FXinfo("Invalid First No. or and Last No. ", txtFirstNo);
             } else {
            result = true;
             }
        return result;
         }

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Cheque Book", type);
        showAlertbox();
         }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        CustomAlert.show();
         }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Cheque Book", msg);
        showAlertbox();
         }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Cheque Book", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = error;
         }

    function findChqTotal(): Void {
        var startL = txtFirstNo.rawText.trim().length();
        var endL = txtLastNo.rawText.trim().length();
        var start = val.getNumberValid(txtFirstNo.rawText.replaceAll("'", ""), 4, 15);
        var end = val.getNumberValid(txtLastNo.rawText.replaceAll("'", ""), 4, 15);
        if (start != 0 and start != 11 and end != 0 and end != 11 and (startL - endL) == 0) {
            var tot = Long.parseLong(txtLastNo.rawText) - Long.parseLong(txtFirstNo.rawText) + 1;
            if (tot <= 0) {
                txtCount.text = "";
            } else { 
                 txtCount.text = "{tot}";
                 txtFirstNo.style = mandatory;
             }
             } else {
            txtCount.text = "";
             }

         }

    function viewMode(): Void {
        mode = 2;
        panelpage.visible = groupView.visible = btnSave.visible = btnCancel.visible = false;
        panelView.visible = true;
        btnEdit.text = "Reset [F4]";
        btnReset.text = "Back [Ctrl+Left]";
        imgEdit.image = imageReset;
        imgReset.image = imageBack;
        ResetbuttonW = buttonW + 30;
        cboViewAcNo.requestFocus();
        reset();
        chequeViewTable.addInitialRows();
        panelTable.content = [ViewChqTable];

         }

    function editMode(): Void {
        mode = 1;
        panelpage.visible = groupView.visible = btnSave.visible = btnCancel.visible = cboBookID.visible = true;
        panelView.visible = txtBookID.editable = false;
        btnSave.text = "Update [F7]";
        btnEdit.text = "Delete [F5]";
        btnReset.text = "Reset [F4]";
        btnCancel.text = "Back [Ctrl+Left]";
        imgSave.image = imageSave;
        imgEdit.image = imageCancel;
        imgReset.image = imageReset;
        imgCancel.image = imageBack;
        ResetbuttonW = buttonW;
        CancelbuttonW = buttonW + 30;
        cboViewAcNo.requestFocus();
        if (getValue() == false) {
            reset();
             }
        panelTable.content = [ChqTable];
         }

    function saveMode(): Void {
        mode = 0;
        panelpage.visible = groupView.visible = btnSave.visible = btnCancel.visible = txtBookID.editable = true;
        panelView.visible = cboBookID.visible = false;
        btnSave.text = "Save [F3]";
        btnEdit.text = "Edit [F6]";
        btnReset.text = "Reset [F4]";
        btnCancel.text = "Cancel [F8]";
        imgSave.image = imageSave;
        imgEdit.image = imageEdit;
        imgReset.image = imageReset;
        imgCancel.image = imageCancel;
        ResetbuttonW = buttonW;
        CancelbuttonW = buttonW;
        reset();
        panelTable.content = [ChqTable];
         }

    function resetBookContents(): Void {
        cboBookID.select(0);
        txtBookID.text = "";
        txtCount.text = "";
        txtFirstNo.text = "";
        txtLastNo.text = "";
        txtIssuedDate.text = "";
        txtRemarks.text = "";
         }

    function resetView(): Void {

        chequeViewTable.clearDatas();
        lblViewTotal.text = "0";
        lblViewStart.text = "---";
        lblViewEnd.text = "---";
        txtUsed.text = "";
        txtRemaining.text = "";
        txtCleared.text = "";
        txtReturned.text = "";
        txtStopped.text = "";
        txtLost.text = "";
        txtProgress.text = "";
        txtCancelled.text = "";
        txtMisused.text = "";

         }

    function reset(): Void {
chequeTable.acc_chq_id[0]="";
chequeTable.acc_chq_id[1]="";
chequeTable.acc_chq_id[2]="";

        if (mode == 0 or mode == 1) {
            cboAcNo.select(0);
            txtBank.text = "";
            txtBranch.text = "";
            cboAcNo.requestFocus();
            resetBookContents();
             } else if (mode == 2) {
            cboViewAcNo.select(0);
            cboViewBookID.select(0);
            cboViewStatus.select(0);
            cboViewAcNo.requestFocus();
             }
        chequeTable.loadChequeValues();
        chequeViewTable.addInitialRows();

         }

    function transferFocus(evt: KeyEvent, obj: Control): Boolean {
        var Result: Boolean = true;

        if (evt.code == KeyCode.VK_TAB or evt.code == KeyCode.VK_ENTER) {
            obj.requestFocus();
            Result = false;
             }

        return Result;
         }

    function applyMandatory(): Void {
        txtBookID.style = mandatory;
        txtCount.style = mandatory;
        txtFirstNo.style = mandatory;
        txtLastNo.style = mandatory;
         }

    var acc_no = bind cboAcNo.selectedItem.toString() on replace {
        if (cboAcNo.selectedIndex > 0) {
                
            var bank_branch = comObj.getAccountNoBankName(acc_no.toString());  // Controller Call
            var bank_det = bank_branch.split(",");
            txtBank.text = bank_det[0];
            txtBranch.text = bank_det[1];
            if (mode == 1) {
                resetBookContents();
                
                BookID =chequeController.getChequeBookIDList(acc_no.toString()).toArray();   // Controller Call
                 }
             } else {
            txtBank.text = "";
            txtBranch.text = "";
             }

         }
    var chequebook_id = bind cboBookID.selectedItem.toString() on replace {
        txtBookID.style = mandatory;
        if (cboBookID.selectedIndex > 0 and mode == 1) {
            loadValues(cboAcNo.selectedItem.toString(), chequebook_id);
             } else {
            resetBookContents();
             }

         }
    var ViewAcNo = bind cboViewAcNo.selectedItem.toString() on replace {
        if (cboViewAcNo.selectedIndex > 0 and mode == 2) {
           
            BookID = chequeController.getChequeBookIDList(ViewAcNo.toString()).toArray();
            cboViewBookID.select(0);
             } else {
            resetView();
             }
         }
    var chequeView = bind cboViewBookID.selectedItem.toString() on replace {
        cboViewStatus.select(0);
        if (cboViewBookID.selectedIndex > 0 and mode == 2) {
            loadViewValues();
             } else {
            resetView();
             }
         }
    var ViewStatus = bind cboViewStatus.selectedItem.toString() on replace {
        if (cboViewStatus.selectedIndex > 0 and mode == 2) {
            loadViewValues();
             } else {
            resetView();
             }
         }

    function loadValues(acc_no: String, bid: String): Void {
        try {


            txtBookID.text = bid;
            var book = chequeController.getDetails(acc_no, bid);  // Controller Call
            txtFirstNo.text = book.get("start_no").toString();
            txtLastNo.text = book.get("end_no").toString();
            txtCount.text = book.get("leaves").toString();
            var dt = book.get("issued_date").toString();
            if (dt.trim().length() > 0) {
                if (dt.substring(0, 4).equals("0000")) {
                    txtIssuedDate.text = "";
                     } else {
                    txtIssuedDate.text = DateUtils.normalFormatDate(dt);
                     }
                 } else {
                txtIssuedDate.text = "";
                 }
            txtRemarks.text = book.get("remarks").toString();
             } catch (e: Exception) {
          log.debug(e.getMessage());
             }

         }

    function loadViewValues(): Void {
        if (cboViewAcNo.selectedIndex > 0 and cboViewBookID.selectedIndex > 0) {
            var chqModel=new ChequeBookModel();
            chqModel.setAccountNumber(ViewAcNo);
            chqModel.setBookID(chequeView);
            chqModel.setStatus("");
            if (cboViewStatus.selectedIndex > 0 and cboViewStatus.selectedIndex < 5) {
                chqModel.setStatus(cboViewStatus.selectedItem.toString());
              }
            chequeViewTable.loadChequeLeaves(chqModel);

            var chequeBookModel = new ChequeBookModel();
       
            chequeBookModel.setAccountNumber(ViewAcNo);
            chequeBookModel.setBookID(chequeView);
            chequeBookModel = chequeController.getChqUsed(chequeBookModel);  // Controller Call

            var book = chequeController.getDetails(ViewAcNo, chequeView);  // Controller Call
            lblViewStart.text = book.get("start_no").toString();
            lblViewEnd.text = book.get("end_no").toString();
            lblViewTotal.text = book.get("leaves").toString();
            var status = chequeController.getStatus(ViewAcNo, chequeView);  // Controller Call
            var used: Integer = chequeBookModel.getRecordCount();
            txtUsed.text = "{used}";
            txtRemaining.text = "{Integer.parseInt(lblViewTotal.text) - used}";
            txtCleared.text = status.get("Cleared").toString();
            txtReturned.text = status.get("Returned").toString();
            txtStopped.text = status.get("Stopped Payment").toString();
            txtLost.text = status.get("Lost").toString();
            txtProgress.text = status.get("In progress").toString();
            txtCancelled.text = status.get("Cancelled").toString();
            txtMisused.text = status.get("Misused").toString();

             }
         }

    function ShowCalendar(): Void {
        try {
            panelDate.visible = true;
            if (not curDateFlag) {
                panelDate.layoutY = txtIssuedDate.layoutY + txtIssuedDate.height + 2.0;

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

             } catch (e) {
            log.debug("Class : BankBook  Method : fromDateClick()   = {e.getMessage()}");

             }
         }

    var visit = bind fxCalendar.visible on replace {
        if (curDateFlag and not visit) {
            txtIssuedDate.text = fxCalendar.getSelectedDate();
            curDateFlag = false;
             }
         };

    function getValue(): Boolean {

        var retVal: Boolean = false;
        try{
        var chqbookID = chequeTable.acc_chq_id;
        if (chqbookID[2].equals("Completed") and mode == 1) {
            FXinfo("Unable to modify completed book");
            reset();
             } else {

            if (mode == 1 and chqbookID[0].length() > 0 and chqbookID[1].length() > 0) {


                var chequeBookModel = new ChequeBookModel();
                chequeBookModel.setAccountNumber(chqbookID[0].toString());
                chequeBookModel.setBookID(chqbookID[1].toString());
                
                 BookID=chequeController.getChequeBookIDList("").toArray();

                chequeBookModel = chequeController.getChqUsed(chequeBookModel); //Controller Call

                if (chequeBookModel.getRecordCount() > 0) {
                    FXinfo("This cheque book already in use.");
                     } else {
                    retVal = true;
                       
                        accountNo=comObj.getAccountNumbers().toArray();
                    var si=accountNo.length;

                    if (si > 0) {
                        for (i: Integer in [0..si]) {
                            if (accountNo[i].equals(chqbookID[0].toString())) {
                                cboAcNo.select(i);

                                break;
                                 }
                             }
                         }
                var bi=BookID.length;
                    if (bi > 0) {
                        for (j: Integer in [0..bi]) {
                            if (BookID[j].equals(chqbookID[1].toString())) {
                                cboBookID.select(j);


                                break;
                                 }
                             }
                         }
                     }
                 }
             }
             }catch(e:Exception){
                log.debug(e.getMessage());
             }

        return retVal;
         }

    def kr = KeyRegistry {};
    def key = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 5 and CommonDeclare.form[4] == 8) {
            shortcut(key);
             }
         }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {

        if (event.code == kr.save and mode == 0) {
            btnSaveAction();
             }
        if (event.code == kr.update and mode == 1) {
            btnSaveAction();
             }
        if (event.code == kr.edit and mode == 0) {
            editMode();
             }
        if (event.code == kr.reset) {
            if (mode == 2) {
                resetView();
                 }
            reset();
             }

        if (event.code == kr.del and mode == 1) {
            chqdelete();
             }
        if (event.controlDown == true and event.code == kr.back) {
            if (mode == 1 or mode == 2) { saveMode();
                 }
             }
        if (event.code == kr.cancel) {
            panel.visible = false;

             }

         }

    function getPrivileges(u: String): Void {
        var uname = u;
           
        var utype = comObj.getUserType(uname);  // Controller Call

        if (utype.equals("User")) {
            var priv = comObj.getPrivileges("financial", uname);  // Controller Call
            var ss = priv.split(",");
            var val = Integer.parseInt(ss[7]);
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
        panel.visible = true;
        saveMode();
        applyMandatory();
        accountNo = comObj.getAccountNumbers().toArray();

        BookID = chequeController.getChequeBookIDList("").toArray();
        changeTableSize(TableW, TableH);
        panelTable.content = [ChqTable];

        (Table as javax.swing.JTable).addKeyListener(java.awt.event.KeyAdapter {
            override public function keyReleased(e: java.awt.event.KeyEvent): Void {
                getValue();
            }
            override public function keyTyped(e: java.awt.event.KeyEvent): Void {
                getValue();
            }
        });
        (Table as javax.swing.JTable).addMouseListener(MouseAdapter {
            override public function mouseClicked(e: java.awt.event.MouseEvent): Void {
                getValue();
            }
        });
        (Table as javax.swing.JTable).addMouseListener(MouseAdapter {
            override public function mouseReleased(e: java.awt.event.MouseEvent): Void {
                getValue();
            }
        });
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        panelAlert.visible = false;

        fxCalendar.visible = false;
        panelDate.content = [fxCalendar,];
        cboAcNo.requestFocus();
    }

    /************************* End - Functions *************************/
}


