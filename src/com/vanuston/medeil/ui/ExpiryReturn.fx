package com.vanuston.medeil.ui;

import java.lang.*;
import javafx.scene.input.KeyCode;
import javafx.scene.image.Image;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Value;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import com.vanuston.medeil.ui.calendar.theme.Theme;
import javafx.ext.swing.SwingComponent;
import com.vanuston.medeil.util.Logger;
import javafx.scene.control.TextBox;
import java.awt.Dimension;
import java.text.SimpleDateFormat;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.util.KeyRegistry;
import java.awt.event.KeyAdapter;
import java.awt.event.MouseAdapter;
import com.vanuston.medeil.uitables.ExpiryReturnTable;
import com.vanuston.medeil.uitables.ViewExpiryReturnTable;
import com.vanuston.medeil.model.ExpiryReturnModel;
import com.vanuston.medeil.implementation.DebitNote;
import com.vanuston.medeil.model.DebitNoteModel;
import java.sql.Date;
import com.vanuston.medeil.implementation.CommonImplements;
import java.util.List;
import java.util.ArrayList;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.uitables.ConfirmDialogBox;

public class ExpiryReturn {

    var today = DateUtils.now("yyyy-MM-dd");
    var log: Logger = Logger.getLogger(ExpiryReturn.class, "Inventory");
    var fromDateFlag: Boolean = false;
    var todateFlag1: Boolean = false;
    var fxCalendar = FXCalendar {
                theme: Theme {};
            };
//    var rowNo = 9;
//    var colNames: Object[] = ["S.No.", "Product Name", "Formulation", "Mfr.", "Batch No.", "Qty.", "Free", "Expiry ", "Purchase Price", "MRP", "Total Amt"];
//    var colType: Class[] = [java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class,
//                java.lang.Integer.class, java.lang.Integer.class, java.lang.Object.class, java.lang.String.class, java.lang.String.class, java.lang.String.class];
//    var colEditable: Boolean[] = [false, true, false, false, false, true, false, false, false, false, false];
//    var colWidth: Integer[] = [45, 140, 75, 75, 70, 50, 50, 80, 80, 80, 80];
    var expiryReturnTable: ExpiryReturnTable = new ExpiryReturnTable();
//    var expRetrun = expiryReturnTable.createTable(rowNo, colNames, colType, colEditable, colWidth);
    var expRetrun = expiryReturnTable.createTable();
    var expRetrunAdd = SwingComponent.wrap(expiryReturnTable.getScrollTable(expRetrun));
    public var rndVal: String = "0.00";
    var rowNo1 = 12;
    var colNames1: Object[] = ["S.No", "Date", "Distributor Name", "Product Name", "Batch No.", "Qty.", "Amount"];
    var colType1: Class[] = [java.lang.Integer.class, java.lang.String.class, java.lang.String.class,
                java.lang.String.class, java.lang.String.class, java.lang.String.class,
                java.lang.String.class];
    var colEditable1: Boolean[] = [false, false, false, false, false, false, false];
    var colWidth1: Integer[] = [50, 90, 130, 160, 80, 80, 110];
    var viewExpiryReturnTable: ViewExpiryReturnTable = new ViewExpiryReturnTable();
    var expiryRReturnTableView = viewExpiryReturnTable.createTable(rowNo1, colNames1, colType1, colEditable1, colWidth1);
    var ViewExpiryTab = SwingComponent.wrap(viewExpiryReturnTable.getScrollTable(expiryRReturnTableView));
    var expId: Integer = 0;
    var expRetDate: String = "";
    var sar: Integer = 0;
    var sar1: Integer = 0;
    var listH = 0.0;
    var panelW = bind CommonDeclare.panelFormW;
    var panelH = bind CommonDeclare.panelFormH;
    var button1LX = bind CommonDeclare.botton1LX;
    var button2LX = bind CommonDeclare.botton2LX;
    var button3LX = bind CommonDeclare.botton3LX;
    var button4LX = bind CommonDeclare.botton4LX;
    var buttonImageW = bind CommonDeclare.bottonImageW;
    var buttonImageH = bind CommonDeclare.bottonImageH;
    var buttonW = bind CommonDeclare.bottonW;
    var buttonH = bind CommonDeclare.bottonH;
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;
    var Type4TextboxW = bind CommonDeclare.Type4TextboxW + 30;
    var listW = Type2TextboxW;
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    var seperatorW = bind CommonDeclare.seperatorW;
    var C1LX = bind CommonDeclare.Column1LX;
    var C2LX = bind CommonDeclare.Column2LX;
    var C3LX = bind CommonDeclare.Column3LX;
    var C4LX = bind CommonDeclare.Column4LX;
    var AmtPanelLX = bind 48.28462516 * panelW / 100;
    var AmtTextW = bind 40.66073698 * panelW / 100;
    var ImageCalenderLX = bind C4LX + Type3TextboxW + 2;
    var panelCalenderLX = bind C4LX + Type3TextboxW - 250;
    var rectbutton1LX = bind CommonDeclare.rectbutton1LX;
    var rectbutton2LX = bind CommonDeclare.rectbutton2LX;
    var rectbuttonLY = bind CommonDeclare.rectbuttonLY;
    var panelRadioLX = bind (panelW - 680) / 2;
    var TableW = bind (95.29860229 * panelW) / 100 on replace { changeTableSize(TableW); };
    var panelTableLX = bind (panelW - TableW) / 2;
    var labelSearchLX = bind (23.25285896 * panelW / 100);
    var SearchTextboxLX = bind (labelSearchLX + 100);
    var buttonSearchLX = bind (SearchTextboxLX + Type1TextboxW + 25);
    var expiryreturnController: com.vanuston.medeil.implementation.ExpiryReturn = RegistryFactory.getClientStub(RegistryConstants.ExpiryReturn) as com.vanuston.medeil.implementation.ExpiryReturn;
    var debitNoteController: com.vanuston.medeil.implementation.DebitNote = RegistryFactory.getClientStub(RegistryConstants.DebitNote) as com.vanuston.medeil.implementation.DebitNote;
    var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;

//    expiryreturnController = RegistryFactory.getClientStub(RegistryConstants.ExpiryReturn) as com.vanuston.medeil.implementation.ExpiryReturn;
    function changeTableSize(i: Integer): Void {
        expRetrunAdd.getJComponent().setPreferredSize(new Dimension(i, 225.0));
        ViewExpiryTab.getJComponent().setPreferredSize(new Dimension(i, 330.0));
    }

    var BottomC1LX = bind panelTableLX;
    var BottomC3LX = bind panelTableLX + Type4TextboxW + 100;
    var txtRoundAmtText = "0.00";
    var expr_DBNo = "";
    def ReturnNotes = ReturnNotes { note_title: "Debit"; };
    var ret = bind ReturnNotes.panel.visible on replace {
        panel.disable = ret;
        panelRetrnNotes.visible = ret;

    }
    var panelRetNoteLX =0;// bind (panelW) / 2;
    var panelRetNoteLY =0;// bind (panelH) / 2;
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def label6: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind labelSearchLX
        layoutY: 100.0
        text: "Label"
    }
    
    def __layoutInfo_txtSearchDist: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtSearchDist: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind SearchTextboxLX
        layoutY: 94.0
        layoutInfo: __layoutInfo_txtSearchDist
        onKeyPressed: txtSearchDistOnKeyPressed
        onKeyReleased: txtSearchDistOnKeyReleased
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind buttonSearchLX-24
        layoutY: 94.0
    }
    
    public-read def imageView6: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
    }
    
    def __layoutInfo_searchButton: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def searchButton: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind buttonSearchLX
        layoutY: 94.0
        layoutInfo: __layoutInfo_searchButton
        graphic: imageView6
        text: "Button"
    }
    
    def __layoutInfo_panelTable: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 720.0
        height: 200.0
    }
    public-read def panelTable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelTableLX
        layoutY: 190.0
        layoutInfo: __layoutInfo_panelTable
        blocksMouse: true
    }
    
    def __layoutInfo_panelViewTable: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def panelViewTable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelTableLX
        layoutY: 130.0
        layoutInfo: __layoutInfo_panelViewTable
    }
    
    public-read def rectTableBorder: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        layoutX: bind panelTableLX
        styleClass: "rectTableBorder"
        width: bind TableW
    }
    
    def __layoutInfo_listSearch: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listSearch: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: 312.0
        layoutY: 115.0
        layoutInfo: __layoutInfo_listSearch
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    def __layoutInfo_separator3: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: 28.0
    }
    public-read def separator3: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: 415.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_separator3
        vertical: true
    }
    
    public-read def panelCalendarTo: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelCalenderLX
    }
    
    public-read def panelCalendarFrom: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelCalenderLX
    }
    
    def __layoutInfo_listDist: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listDist: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: 166.0
        layoutY: 121.0
        layoutInfo: __layoutInfo_listDist
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
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
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
    }
    
    def __layoutInfo_txtDiscountAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtDiscountAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind BottomC3LX+80
        layoutY: 0.0
        layoutInfo: __layoutInfo_txtDiscountAmt
        text: "0.00"
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtRoundAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtRoundAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind BottomC1LX+90
        layoutY: 25.0
        layoutInfo: __layoutInfo_txtRoundAmt
        text: bind txtRoundAmtText
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtToDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtToDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 25.0
        layoutInfo: __layoutInfo_txtToDate
        styleClass: "text-box"
        text: ""
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtFromDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtFromDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_txtFromDate
        font: Arial_12
    }
    
    def __layoutInfo_txtDistName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtDistName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_txtDistName
        styleClass: "text-box"
        onKeyPressed: txtDistNameOnKeyPressed
        onKeyReleased: txtDistNameOnKeyReleased
        text: ""
        editable: false
        columns: 10.0
        font: Arial_12
    }
    
    def __layoutInfo_txtDiscount: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtDiscount: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 27.0
        layoutInfo: __layoutInfo_txtDiscount
        onKeyReleased: txtDiscountOnKeyReleased
        text: "0"
        font: Arial_12
    }
    
    public-read def Arial_Bold_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
    }
    
    def __layoutInfo_label4: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 100.0
        height: 20.0
    }
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutInfo: __layoutInfo_label4
        text: "Label"
        font: Arial_Bold_12
        hpos: javafx.geometry.HPos.CENTER
    }
    
    def __layoutInfo_label5: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 100.0
        height: 20.0
    }
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutInfo: __layoutInfo_label5
        effect: null
        text: "Label"
        font: Arial_Bold_12
        hpos: javafx.geometry.HPos.CENTER
    }
    
    def __layoutInfo_txtsubTotAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtsubTotAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind BottomC1LX+90
        layoutY: 0.0
        layoutInfo: __layoutInfo_txtsubTotAmt
        text: "0.00"
        editable: false
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
    
    def __layoutInfo_rdoPurPrice: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: 30.0
    }
    public-read def rdoPurPrice: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: 190.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_rdoPurPrice
        onMouseClicked: rdoPurPriceOnMouseClicked
        onMouseReleased: rdoPurPriceOnMouseReleased
        text: "Return based on Purchase price"
        font: Arial_12
        toggleGroup: toggleGroup
        selected: true
    }
    
    def __layoutInfo_rdoMRP: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: 30.0
    }
    public-read def rdoMRP: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: 30.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_rdoMRP
        onMouseClicked: rdoMRPOnMouseClicked
        onMouseReleased: rdoMRPOnMouseReleased
        text: "Return based on MRP"
        font: Arial_12
        toggleGroup: toggleGroup
        selected: false
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
        text: "Expiry Return - ctrl+X"
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
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 24.0
        text: "Amount"
        font: Arial_18
        textFill: DarkGray
    }
    
    public-read def label12: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind BottomC1LX
        layoutY: 25.0
        text: "Rounded off"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind BottomC3LX
        layoutY: 0.0
        text: "Discount %"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind BottomC1LX
        layoutY: 0.0
        text: "Subtotal"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def panelBottom: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutX: 10.0
        layoutY: 420.0
        content: [ label9, label7, txtRoundAmt, txtsubTotAmt, txtDiscountAmt, label12, ]
    }
    
    public-read def labelTo_Date: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C4LX-50
        layoutY: 27.0
        text: "To"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelFrom_Date: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C4LX-50
        layoutY: 0.0
        text: "From"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelDiscount: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 27.0
        text: "Disc %"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelDate: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 0.0
        text: "Distributor Name"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def rectangle2: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        layoutX: 0.0
        layoutY: 0.0
        fill: linearGradient
        stroke: DarkGray
        width: 680.0
        height: 30.0
        arcWidth: 10.0
        arcHeight: 10.0
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
    
    public-read def rectangle3: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        styleClass: "rectbutton"
        fill: Yellow
        stroke: DarkGray
        strokeWidth: 2.0
        width: 100.0
        height: 20.0
        arcWidth: 10.0
        arcHeight: 10.0
    }
    
    public-read def group2: javafx.scene.Group = javafx.scene.Group {
        cursor: javafx.scene.Cursor.HAND
        layoutX: bind rectbutton2LX
        layoutY: bind rectbuttonLY
        content: [ rectangle3, label4, ]
    }
    
    public-read def rectangle4: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        cursor: javafx.scene.Cursor.HAND
        styleClass: "rectbutton"
        fill: Yellow
        stroke: DarkGray
        strokeWidth: 2.0
        width: 100.0
        height: 20.0
        arcWidth: 10.0
        arcHeight: 10.0
    }
    
    public-read def group: javafx.scene.Group = javafx.scene.Group {
        cursor: javafx.scene.Cursor.HAND
        layoutX: bind rectbutton1LX
        layoutY: bind rectbuttonLY
        content: [ rectangle4, label5, ]
    }
    
    public-read def imageCalendar: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Calender.png"
    }
    
    public-read def imgCalendarTo: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind ImageCalenderLX
        layoutY: 25.0
        onMouseClicked: imgCalendarToOnMouseClicked
        image: imageCalendar
    }
    
    public-read def imgCalendarFrom: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind ImageCalenderLX
        layoutY: 0.0
        onMouseClicked: imgCalendarFromOnMouseClicked
        image: imageCalendar
    }
    
    public-read def imageSave: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Save1.png"
    }
    
    public-read def imageView2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
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
        onKeyReleased: btnSaveOnKeyReleased
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
        effect: reflectionEffect
        graphic: imageView3
        text: "Edit [F6]"
        font: Arial_Bold_14
    }
    
    public-read def imageReset: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Reset.png"
    }
    
    public-read def imageView4: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageReset
        fitWidth: bind buttonImageW
        fitHeight: bind buttonImageH
    }
    
    def __layoutInfo_btnReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind buttonW
        height: bind buttonH
    }
    public-read def btnReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind button3LX
        layoutInfo: __layoutInfo_btnReset
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
        fitWidth: bind buttonImageW
        fitHeight: bind buttonImageH
    }
    
    def __layoutInfo_btnCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind buttonW+30
        height: bind buttonH
    }
    public-read def btnCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind button4LX
        layoutInfo: __layoutInfo_btnCancel
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
        content: [ rectangle, rectHeader, label, label6, txtSearchDist, imageView, searchButton, ]
    }
    
    public-read def Arial_Bold_50: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 50.0
    }
    
    def __layoutInfo_txtTotalAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind AmtTextW
        height: 60.0
    }
    public-read def txtTotalAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        disable: false
        layoutX: 76.0
        layoutY: 5.0
        layoutInfo: __layoutInfo_txtTotalAmt
        styleClass: "Borderless-text-box"
        blocksMouse: false
        focusTraversable: false
        text: "0.00"
        promptText: ""
        editable: false
        font: Arial_Bold_50
    }
    
    public-read def panelAmt: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutX: bind AmtPanelLX
        layoutY: 400.0
        content: [ label2, txtTotalAmt, ]
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.87058824
        green: 0.8392157
        blue: 0.8392157
    }
    
    public-read def imageclickdown: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imgDistName: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind C2LX+Type1TextboxW+1
        layoutY: 2.0
        onMouseClicked: imgDistNameOnMouseClicked
        image: imageclickdown
        fitWidth: 18.0
        fitHeight: 18.0
    }
    
    public-read def imageSearch: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Search.png"
    }
    
    public-read def toggleGroup2: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    def __layoutInfo_rdoExcFree: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: 30.0
    }
    public-read def rdoExcFree: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: 560.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_rdoExcFree
        onMouseClicked: rdoExcFreeOnMouseClicked
        onMouseReleased: rdoExcFreeOnMouseReleased
        text: "Exclude Free"
        font: Arial_12
        toggleGroup: toggleGroup2
        selected: true
    }
    
    def __layoutInfo_rdoIncFree: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: 30.0
    }
    public-read def rdoIncFree: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: 450.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_rdoIncFree
        onKeyReleased: rdoIncFreeOnKeyReleased
        onMouseClicked: rdoIncFreeOnMouseClicked
        onMouseReleased: rdoIncFreeOnMouseReleased
        text: "Include Free"
        font: Arial_12
        toggleGroup: toggleGroup2
        selected: false
    }
    
    public-read def panelradiobuttons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelRadioLX
        layoutY: 50.0
        content: [ rectangle2, rdoIncFree, rdoExcFree, rdoMRP, rdoPurPrice, separator3, ]
    }
    
    public-read def panelpage: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutX: 0.0
        layoutY: 100.0
        content: [ panelradiobuttons, txtDiscount, labelDate, imgDistName, labelDiscount, labelFrom_Date, txtDistName, labelTo_Date, txtFromDate, txtToDate, imgCalendarFrom, imgCalendarTo, panelCalendarTo, panelCalendarFrom, listDist, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ panelheader, panelTable, panelViewTable, rectTableBorder, listSearch, panelpage, panelBottom, panelAmt, panelButtons, group, group2, panelAlert, ]
    }
    
    public-read def panel2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ panel, panelRetrnNotes, ]
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "Shown", "Edit", "View", ]
        actual: 0
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            label6.visible = false;
                            label6.layoutY = 100.0;
                            label6.text = "Label";
                            label6.textFill = javafx.scene.paint.Color.BLACK;
                            txtSearchDist.visible = false;
                            imageView.visible = false;
                            imageView.layoutY = 94.0;
                            imageView.image = null;
                            imageView.fitWidth = 0.0;
                            imageView.fitHeight = 0.0;
                            imageView6.visible = false;
                            imageView6.image = null;
                            searchButton.visible = false;
                            searchButton.layoutY = 94.0;
                            searchButton.text = "Button";
                            panelTable.visible = true;
                            panelTable.layoutY = 185.0;
                            __layoutInfo_panelTable.width = 750.0;
                            __layoutInfo_panelTable.height = 210.0;
                            panelViewTable.visible = false;
                            panelViewTable.layoutY = 180.0;
                            rectTableBorder.layoutY = 185.0;
                            rectTableBorder.height = 225.0;
                            listSearch.visible = false;
                            rdoMRP.selected = false;
                            rdoPurPrice.text = "Return based on Purchase Price";
                            rdoPurPrice.selected = true;
                            txtDiscount.layoutY = 27.0;
                            txtDiscount.onKeyPressed = txtDiscountOnKeyPressedAtShown;
                            imgDistName.image = imageclickdown;
                            txtDistName.editable = true;
                            txtFromDate.visible = true;
                            txtFromDate.editable = false;
                            imgCalendarFrom.disable = false;
                            imgCalendarTo.disable = false;
                            panelCalendarTo.blocksMouse = false;
                            panelCalendarFrom.blocksMouse = false;
                            listDist.visible = false;
                            panelpage.visible = true;
                            txtRoundAmt.visible = true;
                            txtRoundAmt.opacity = 0.9;
                            txtRoundAmt.editable = false;
                            txtDiscountAmt.editable = false;
                            panelBottom.visible = true;
                            panelAmt.visible = true;
                            btnSave.text = "Save [F3]";
                            btnEdit.onKeyReleased = btnEditOnKeyReleasedAtShown;
                            btnEdit.text = "Edit [F6]";
                            btnEdit.action = btnEditActionAtShown;
                            btnReset.text = "Reset [F4]";
                            imageView5.image = imageCancel;
                            btnCancel.onKeyReleased = btnCancelOnKeyReleasedAtShown;
                            btnCancel.text = "Cancel [F8]";
                            btnCancel.action = btnCancelActionAtShown;
                            panelButtons.visible = true;
                            label5.text = "Label";
                            group.visible = false;
                            rectangle3.visible = true;
                            label4.visible = true;
                            label4.text = "View";
                            group2.onMouseClicked = group2OnMouseClickedAtShown;
                        }
                    }
                ]
            }
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            label6.visible = false;
                            label6.layoutY = 100.0;
                            label6.text = "Label";
                            label6.textFill = javafx.scene.paint.Color.BLACK;
                            txtSearchDist.visible = false;
                            imageView.visible = false;
                            imageView.layoutY = 94.0;
                            imageView.image = null;
                            imageView.fitWidth = 0.0;
                            imageView.fitHeight = 0.0;
                            imageView6.visible = false;
                            imageView6.image = null;
                            searchButton.visible = false;
                            searchButton.layoutY = 94.0;
                            searchButton.text = "Button";
                            panelTable.visible = true;
                            panelTable.layoutY = 185.0;
                            __layoutInfo_panelTable.width = 720.0;
                            __layoutInfo_panelTable.height = 200.0;
                            panelViewTable.visible = false;
                            panelViewTable.layoutY = 180.0;
                            __layoutInfo_panelViewTable.width = 720.0;
                            __layoutInfo_panelViewTable.height = 250.0;
                            rectTableBorder.layoutY = 185.0;
                            rectTableBorder.height = 225.0;
                            listSearch.visible = false;
                            rdoMRP.selected = false;
                            rdoPurPrice.text = "Return based on Purchase price";
                            rdoPurPrice.selected = true;
                            txtDiscount.layoutY = 27.0;
                            txtDiscount.onKeyPressed = txtDiscountOnKeyPressedAtEdit;
                            imgDistName.image = imageclickdown;
                            txtDistName.editable = true;
                            txtFromDate.visible = true;
                            txtFromDate.editable = false;
                            imgCalendarFrom.disable = true;
                            imgCalendarTo.disable = true;
                            panelCalendarTo.blocksMouse = true;
                            panelCalendarFrom.blocksMouse = true;
                            listDist.visible = false;
                            panelpage.visible = true;
                            txtRoundAmt.visible = true;
                            txtRoundAmt.opacity = 1.0;
                            txtRoundAmt.editable = false;
                            txtDiscountAmt.editable = false;
                            panelBottom.visible = true;
                            panelAmt.visible = true;
                            btnSave.text = "Update [F7]";
                            btnEdit.onKeyReleased = btnEditOnKeyReleasedAtEdit;
                            btnEdit.text = "Delete [F5]";
                            btnEdit.action = btnEditActionAtEdit;
                            btnReset.text = "Reset [F4]";
                            imageView5.image = imageBack;
                            btnCancel.onKeyReleased = btnCancelOnKeyReleasedAtEdit;
                            btnCancel.text = "Back [Ctrl+Left]";
                            btnCancel.action = btnCancelAction;
                            panelButtons.visible = true;
                            label5.text = "Label";
                            group.visible = false;
                            rectangle3.visible = true;
                            label4.visible = true;
                            label4.text = "View";
                            group2.onMouseClicked = group2OnMouseClickedAtEdit;
                        }
                    }
                ]
            }
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            label6.visible = true;
                            label6.layoutY = 94.0;
                            label6.text = "Distributor Name";
                            label6.font = Arial_12;
                            label6.textFill = DarkGray;
                            txtSearchDist.visible = true;
                            txtSearchDist.font = Arial_12;
                            imageView.visible = true;
                            imageView.layoutY = 96.0;
                            imageView.onMouseClicked = imageViewOnMouseClickedAtView;
                            imageView.image = imageclickdown;
                            imageView.fitWidth = 18.0;
                            imageView.fitHeight = 18.0;
                            imageView6.visible = true;
                            imageView6.image = imageSearch;
                            searchButton.visible = true;
                            searchButton.layoutY = 92.0;
                            __layoutInfo_searchButton.width = 100.0;
                            __layoutInfo_searchButton.height = 25.0;
                            searchButton.text = "Search";
                            searchButton.font = Arial_Bold_14;
                            searchButton.action = searchButtonActionAtView;
                            panelTable.visible = false;
                            panelTable.layoutY = 190.0;
                            __layoutInfo_panelTable.width = 720.0;
                            __layoutInfo_panelTable.height = 200.0;
                            panelViewTable.visible = true;
                            panelViewTable.layoutY = 120.0;
                            __layoutInfo_panelViewTable.width = 720.0;
                            __layoutInfo_panelViewTable.height = 330.0;
                            rectTableBorder.layoutY = 120.0;
                            rectTableBorder.height = 330.0;
                            listSearch.visible = false;
                            rdoMRP.selected = false;
                            rdoPurPrice.text = "Return based on Purchase price";
                            rdoPurPrice.selected = true;
                            txtDiscount.layoutY = 27.0;
                            imgDistName.image = imageclickdown;
                            txtDistName.editable = false;
                            txtFromDate.visible = true;
                            txtFromDate.editable = true;
                            imgCalendarFrom.disable = false;
                            imgCalendarTo.disable = false;
                            panelCalendarTo.blocksMouse = false;
                            panelCalendarFrom.blocksMouse = false;
                            listDist.visible = false;
                            panelpage.visible = false;
                            txtRoundAmt.visible = false;
                            txtRoundAmt.opacity = 1.0;
                            txtRoundAmt.editable = false;
                            txtDiscountAmt.editable = false;
                            panelBottom.visible = false;
                            panelAmt.visible = false;
                            btnSave.text = "Save [F3]";
                            btnEdit.text = "Edit [F6]";
                            btnReset.text = "Reset [F4]";
                            imageView5.image = imageCancel;
                            btnCancel.text = "Cancel [F8]";
                            btnCancel.action = btnCancelAction;
                            panelButtons.visible = false;
                            label5.text = "Back To Save";
                            group.visible = true;
                            group.onMouseClicked = groupOnMouseClickedAtView;
                            rectangle3.visible = true;
                            label4.visible = true;
                            label4.text = "Edit";
                            group2.onMouseClicked = group2OnMouseClickedAtView;
                        }
                    }
                ]
            }
        ]
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel2, ]
    }
    // </editor-fold>//GEN-END:main
function getDistViewList(type: Integer): Void {
    try {
        var listControlObj: ListController = new ListController();
        listSearch.layoutX = txtSearchDist.layoutX;
        listSearch.layoutY = txtSearchDist.layoutY + 20.0;
      //  listSearch.width= txtSearchDist.width;
        listW = Type1TextboxW;
        listH = listControlObj.listImageControlView(txtSearchDist, listSearch, "expirydistributorname", type);
    } catch (e: Exception) {
        log.debug("Method:getDistViewList Exception:{e.getMessage()}");
    }
}
function getDistShownList(type: Integer): Void {
        try {
            var listControlObj: ListController = new ListController();
            listDist.layoutX = txtDistName.layoutX;
            listDist.layoutY = txtDistName.layoutY + 20.0;
            listW = Type1TextboxW;
            listH = listControlObj.listImageControlView(txtDistName, listDist, "expirydistributorname", type);
            }
            catch(e:Exception)
            {
                log.debug("Method:getDistShownList Exception:{e.getMessage()}");
            }
            }

    function rdoExcFreeOnMouseReleased(event: javafx.scene.input.MouseEvent): Void {
        //TODO
        selectMRP();
         }

    function rdoIncFreeOnMouseReleased(event: javafx.scene.input.MouseEvent): Void {
        //TODO
       selectMRP();
        }

    function rdoPurPriceOnMouseReleased(event: javafx.scene.input.MouseEvent): Void {
        //TODO
       selectMRP();
       }

    function rdoMRPOnMouseReleased(event: javafx.scene.input.MouseEvent): Void {
        //TODO
      selectMRP();
        }

    function txtDiscountOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        //TODO
         if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB  ) {
       updateValues();
        }else{ shortcut(event);}
        }

    function txtSearchDistOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
             if(sar==0 or txtSearchDist.rawText.trim()==null or txtSearchDist.rawText.trim().length()==0 or txtSearchDist.rawText.trim()=="null"){
              txtSearchDist.text=" ";
             }
            searchButton.requestFocus();
        } else {
            shortcut(event);
        }
        }

    function btnCancelOnKeyReleasedAtEdit(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
        btnCancelAction();
        }else{ shortcut(event);}
         }
    function btnCancelOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
        btnCancelActionAtShown();
        }else{ shortcut(event);}
         }
    function btnResetOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
        btnResetAction();
        }else{ shortcut(event);}
         }
    function btnEditOnKeyReleasedAtEdit(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
        btnEditActionAtEdit();
        }else{ shortcut(event);}
         }

    function btnEditOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
        btnEditActionAtShown();
        }else{ shortcut(event);}
         }

    function btnSaveOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
}
    function txtDiscountOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }
    function rdoIncFreeOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    var mandatory = CommonDeclare.textbox_mandatory();
    var error = CommonDeclare.textbox_error();
    def CustomAlert = CustomAlert {};

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("ExpiryReturn", type);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("ExpiryReturn", msg);
        showAlertbox();

    }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("ExpiryReturn", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = error;
    }

    function txtDiscountOnKeyPressedAtEdit(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function searchButtonActionAtView(): Void {
        try {
            var serachDistrib: String = "";
            serachDistrib = txtSearchDist.rawText.trim();
             var expiryreturnBean:ExpiryReturnModel=new ExpiryReturnModel();
             expiryreturnBean.setExpiry_dist_name(txtSearchDist.rawText.trim());
//            ViewExpiryReturnTable.loadExpiryReturnTable(serachDistrib);
            viewExpiryReturnTable.loadExpiryReturnTable(expiryreturnBean.getExpiry_dist_name());

        } catch (e: Exception) {
            var msg: String = "Class : Expiry Return method : searchButtonActionAtView()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function btnEditActionAtEdit(): Void {
        deleteClick();
    }

    function getSerachDitributor(event: javafx.scene.input.KeyEvent):Integer {

        listSearch.layoutX = txtSearchDist.layoutX;
        listSearch.layoutY = txtSearchDist.layoutY + 25;

        listH = 0.0;
        listW = txtSearchDist.width;
        var m:Integer=0;
//        var distName: String[] = [];
        var distName: List= new ArrayList();
        listSearch.visible = true;
        var size = listSearch.items.size();
        if (not listSearch.items.isEmpty()) {
            for (i in [0..<size])
                listSearch.items[i] = null;
            txtSearchDist.requestFocus();
        }
        distName = commonController.getListItems(txtSearchDist.rawText.trim(), "", "DISTRI");
        var len: Integer = distName.size();
        listSearch.clearSelection();
        if (len > 0) {
            m=5;
            listSearch.items = distName.toArray();
            listSearch.onKeyPressed = function(e) {
                        if (e.code == KeyCode.VK_ENTER) {
                            txtSearchDist.text = "{listSearch.selectedItem}";
                            if(m==0 or txtSearchDist.rawText.trim()==null or txtSearchDist.rawText.trim()=="null" ){ m=0;txtSearchDist.text=""; }
                            listSearch.visible = false;
                            txtDiscount.requestFocus();
                        } else if (e.code == KeyCode.VK_DOWN) {
                            if (listSearch.selectedIndex == 0) {
                                listSearch.selectFirstRow();
                            }
                        } else if (e.code == KeyCode.VK_ESCAPE) {
                            listSearch.visible = false;
                            txtSearchDist.requestFocus();
                        }
                    };
            listSearch.onMouseClicked = function(e) {
                        txtSearchDist.text = "{listSearch.selectedItem}";
                        if(m==0 or txtSearchDist.rawText.trim()==null or txtSearchDist.rawText.trim()=="null" ){ m=0;txtSearchDist.text=""; }
                        listSearch.visible = false;
                        searchButton.requestFocus();
                    } var height: Integer = 0;
            if (listSearch.items.size() < 8) {
                height = listSearch.items.size();
            } else {
                height = 7;
            }
            for (i in [1..height]) {
                listH += 25.0;
            }

            if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB)
                listSearch.visible = false;
            txtSearchDist.requestFocus();
        } else {
         m=0;
            listSearch.visible = false;

        }

         if (event.code == KeyCode.VK_ESCAPE    ) {
           listSearch.visible = false;
             if(m==0 or  txtSearchDist.rawText.trim()==null or txtSearchDist.rawText.trim()=="null" ) {
                 m=0;txtSearchDist.text="";
                 }
        }
return m;
    }

    function imageViewOnMouseClickedAtView(event: javafx.scene.input.MouseEvent): Void {
     if(not listSearch.visible){
         getDistViewList(0);
     }
     else{
          listSearch.visible = false;
          txtSearchDist.requestFocus();
        }
       }

    function txtSearchDistOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        listSearch.layoutX = txtSearchDist.layoutX;
        listSearch.layoutY = txtSearchDist.layoutY + 25;
        try {
       var n:Integer=0;
       getDistViewList(1);
        sar1=n;
         if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
                if(n==0 or  txtSearchDist.rawText.trim()==null or  txtSearchDist.rawText.trim()=="null" ){
                     txtSearchDist.text=" ";
  }
        }else   if (event.code == KeyCode.VK_DOWN) {
                listSearch.requestFocus();
                listSearch.selectFirstRow();
            }        
        } catch (e: Exception) {
            var msg: String = "Class : Expiry Return method : txtDistNameOnKeyReleased()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    def kr = KeyRegistry {};
    var key = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 3 and CommonDeclare.form[2] == 6) {
            shortcut(key);
        }
    }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {

        if (event.controlDown or event.altDown or event.shiftDown) {
            kr.actionKey = event.code;
        }

        if (event.code == kr.save and not btnSave.disable) {
            saveClick();
        }

        if (event.code == kr.update and not btnSave.disable) {
            saveClick();
        }
        if (event.code == kr.edit and btnEdit.text == "Edit [F6]" and not btnEdit.disable) {
            btnEditActionAtShown();
        }
        if (event.code == kr.reset and btnReset.text == "Reset [F4]") {
            clearAll();
        }

        if (event.code == kr.del) {
            if (btnEdit.text == "Delete [F5]" and not btnEdit.disable) { deleteClick();
            }
        }
        if (event.controlDown == true and event.code == kr.back) {
            if (btnCancel.text == "Back [Ctrl+Left]") { btnCancelAction()
            }
        }
        if (event.code == kr.cancel) {
            if (btnCancel.text == "Cancel [F8]") { btnCancelAction();
            }
        }
    }

    function btnCancelAction(): Void {
        if (btnCancel.text == "Cancel [F8]") {
            panel.visible = false;
           CancelForm() ;

        } else {

            currentState.actual = currentState.findIndex("Shown");
            clearAll();
        }

    }

    function txtDistNameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
 txtDistName.style = mandatory;
 if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
             if(sar==0 or txtDistName.rawText.trim()==null or txtDistName.rawText.trim().trim().length()==0 or txtDistName.rawText.trim()=="null"){
              txtDistName.text=" ";
             }
txtDiscount.requestFocus();
        }
            shortcut(event);
    }

    function clearAll(): Void {
        txtDistName.text = "";
        txtDiscount.text = "0";
        txtFromDate.text = "";
        txtToDate.text = "";
        rdoMRP.selected = false;
        rdoIncFree.selected = false;
        rdoPurPrice.selected = true;
        rdoExcFree.selected = true;
        txtsubTotAmt.text = "0.00";
        txtDiscountAmt.text = "0.00";
        txtTotalAmt.text = "0.00";
        txtRoundAmtText = "0.00";
        expiryReturnTable.clearAllValues();
        viewExpiryReturnTable.loadExpiryReturn();
        expiryReturnTable.expiryReturnAmount = 0.00;
        currentState.actual = currentState.findIndex("Shown");
        expRetDate = "";
        expId = 0;
        expiryReturnTable.eDate="";
        expiryReturnTable.sDate="";
        expiryReturnTable.distributorName="";
    }

    function deleteClick(): Void {
        try {
            var expiryreturnBean:ExpiryReturnModel=new ExpiryReturnModel();
        var rowCnt = expiryReturnTable.totalRow();
         var checkQty = 0;
                var isCorrect: Boolean[] = [];
         var tableContents = expiryReturnTable.getTableContenets();
                for (i in [0..<rowCnt]) {
                    expiryreturnBean.setExpiry_item_name(tableContents[i][1]);
                    expiryreturnBean.setExpiry_batch_no(tableContents[i][4]);

                    if (tableContents[i][5] == null or tableContents[i][5] == "") {
                        var msg: String = "Please enter quantity:";
                        FXinfo(msg);
                        isCorrect[i] = false;
                        checkQty = 1;
                        expiryReturnTable.focusSet(i, 5);
                        break;
                    } else {
                        expiryreturnBean.setExpiry_qty(Integer.parseInt(tableContents[i][5]));
                        expiryreturnBean.setExpiry_free_qty(Integer.parseInt(tableContents[i][6]));
                        var totQt: Integer =expiryreturnBean.getExpiry_qty() +expiryreturnBean.getExpiry_free_qty();

                        expiryreturnBean.setExpiry_checkVal('checkExpiryReturn');
                            var qac=expiryreturnController.viewRecord(expiryreturnBean) as Integer;
                        var wt: Integer = 0;
                        wt = qac -  expiryreturnBean.getExpiry_free_qty();
                         expiryreturnBean.setExpiry_checkVal('checkExpiryReturnStock');
                         var expQc:Integer=expiryreturnController.viewRecord(expiryreturnBean)as Integer;
                         qac=qac+expQc;

                        if (wt < 0) {
                            wt = 0;
                        }

                        if (qac < totQt) {
                            var msg: String = "Please enter valid quantity. Entered quantity is higher than the quantity {wt} available in Stock ";
                            FXinfo(msg);
                            isCorrect[i] = false;
                            checkQty = 1;
                            expiryReturnTable.focusSet(i, 5);
                            break;
                        }
                    }
                }
                   if (isCorrect.isEmpty() and checkQty != 1) {
            if (viewExpiryReturnTable.ditName != null and viewExpiryReturnTable.ditName.trim().length() > 0) {

 var cn:ConfirmDialogBox=new ConfirmDialogBox(1,"Expiry Return");
                                    var a =bind cn.staus;
                                if (a) {
                                 for (i in [0..<rowCnt]) {

                            expiryreturnBean.setExpiry_item_name(tableContents[i][1]);
                            expiryreturnBean.setExpiry_formulation(tableContents[i][2]);                            
                            expiryreturnBean.setExpiry_batch_no(tableContents[i][4]);
                            expiryreturnBean.setExpiry_qty(Integer.valueOf(tableContents[i][5]));
                            expiryreturnBean.setExpiry_free_qty(Integer.valueOf(tableContents[i][6]));
                            expiryreturnBean.setExpiry_dist_name(txtDistName.rawText.trim());
                            expiryreturnBean.setExpiry_date(tableContents[i][7]);
                            var totQt: Integer = expiryreturnBean.getExpiry_qty() +  expiryreturnBean.getExpiry_free_qty();
                             expiryreturnBean.setExpiry_checkVal('checkExpiryReturn');
                            var qac=expiryreturnController.viewRecord(expiryreturnBean) as Integer;
                            var wt: Integer = 0; wt = qac + totQt;
                           
                            expiryreturnBean.setExpiry_qty(wt);
                            expiryreturnBean.setExpiry_checkVal('updateStock');
                             expiryreturnController.updateRecord(expiryreturnBean);
                            expiryreturnController.deleteRecord(expiryreturnBean);
FXalert(5);
                        }
                                   clearAll();
                                }
                                CustomAlert.confirm = false;
            } else {
                FXinfo("Please select the name of the distributor that you want to edit", txtSearchDist);
                currentState.actual = currentState.findIndex("View");
                viewExpiryReturnTable.loadExpiryReturn();
            }
            }

        } catch (e: Exception) {
            var msg: String = "Class :  Expiry Return method : deleteClick()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function saveClick(): Void {
         var expiryreturnBean:ExpiryReturnModel=new ExpiryReturnModel();
         var expiryReturnList:List;        
        var rowCnt = expiryReturnTable.totalRow();
       
        var sdf = new SimpleDateFormat("dd-MM-yyyy");

        if (txtFromDate.rawText != null and txtFromDate.rawText.trim().length() > 5) {
             expiryreturnBean.setExpiry_from_date(DateUtils.changeFormatDate(sdf.parse(txtFromDate.rawText.trim())));
        }
        if (txtToDate.rawText != null and txtToDate.rawText.trim().length() > 5) {
            expiryreturnBean.setExpiry_to_date(DateUtils.changeFormatDate(sdf.parse(txtToDate.rawText.trim())));
        }

        var tableContents = expiryReturnTable.getTableContenets();
        try {
            if (txtDistName.rawText == null or txtDistName.rawText.trim().length() == 0) {
                FXinfo("Please enter a value for Distributor Name.", txtDistName);
            } else if (txtDiscountAmt.rawText == null or txtDiscountAmt.rawText.length() == 0) {
                FXinfo("Please enter a value for Discount.", txtDiscount);
            } else if (txtFromDate.rawText == null or txtFromDate.rawText.trim().length() == 0) {
                FXinfo("Please select a value for From Date.", txtFromDate);
            } else if (txtToDate.rawText == null or txtToDate.rawText.trim().length() == 0) {
                FXinfo("Please select a value for To Date.", txtToDate);
            } else if (rowCnt == 0) {
                FXinfo("Please enter a value for Expiry Returns.", txtDistName);
                expiryReturnTable.focusSet();
            } else {
                var checkQty = 0;
                var isCorrect: Boolean[] = [];
                for (i in [0..<rowCnt]) {
                    expiryreturnBean=new ExpiryReturnModel();
                    expiryReturnList=new ArrayList();
                    expiryreturnBean.setExpiry_item_name(tableContents[i][1]);
                    expiryreturnBean.setExpiry_batch_no(tableContents[i][4]);                   
                    if (tableContents[i][5] == null or tableContents[i][5] == "") {
                        var msg: String = "Please enter quantity ";
                        FXinfo(msg);
                        isCorrect[i] = false;
                        checkQty = 1;
                        expiryReturnTable.focusSet(i, 5);
                        break;
                    } else {

                        expiryreturnBean.setExpiry_qty(Integer.parseInt(tableContents[i][5]));
                        expiryreturnBean.setExpiry_free_qty(Integer.parseInt(tableContents[i][6]));
                        var totQt: Integer = expiryreturnBean.getExpiry_qty() + expiryreturnBean.getExpiry_free_qty();
                        expiryreturnBean.setExpiry_checkVal('checkExpiryReturn');
                        var qac=expiryreturnController.viewRecord(expiryreturnBean) as Integer;
                        var wt: Integer = 0;
                        wt = qac - expiryreturnBean.getExpiry_free_qty();
                         expiryreturnBean.setExpiry_checkVal('checkExpiryReturnStock');
                         var expQc:Integer=expiryreturnController.viewRecord(expiryreturnBean)as Integer;
                         qac=qac+expQc;
                        if (wt < 0) {
                            wt = 0;
                        }
                        if (qac < totQt) {
                            var msg: String = "Please enter correct quantity less than Stock Quantity is  {wt} ";
                            FXinfo(msg);
                            isCorrect[i] = false;
                            checkQty = 1;
                            expiryReturnTable.focusSet(i, 5);
                            break;
                        }
                    }
                }

                if (isCorrect.isEmpty() and checkQty != 1) {
                    if (btnSave.text == "Save [F3]") {
                            FXalert(0);
                            var dbNoteNo =commonController.getAutoIncrement(DateUtils.now("dd-MM-yyyy"), "DebitNotes");
                        for (i in [0..<rowCnt]) {
                            expiryreturnBean=new ExpiryReturnModel();
                            expiryreturnBean.setExpiry_from_date(DateUtils.changeFormatDate(sdf.parse(txtFromDate.rawText.trim())));
                            expiryreturnBean.setExpiry_to_date(DateUtils.changeFormatDate(sdf.parse(txtToDate.rawText.trim())));

                            expiryreturnBean.setExpiry_dist_name(txtDistName.rawText.trim());
                            expiryreturnBean.setExpiry_sub_total(Double.valueOf(txtsubTotAmt.rawText.trim()));
                            expiryreturnBean.setExpiry_dis_amount(Double.valueOf(txtDiscountAmt.rawText.trim()));
                            expiryreturnBean.setExpiry_roundoff_amount(Double.valueOf(txtRoundAmt.rawText.trim()));
                            expiryreturnBean.setExpiry_total_amount(Double.valueOf(txtTotalAmt.rawText.trim()));

                            expiryreturnBean.setExpiry_item_name(tableContents[i][1]);
                            expiryreturnBean.setExpiry_formulation(tableContents[i][2]);
                            expiryreturnBean.setExpiry_mfgname(tableContents[i][3]);
                            expiryreturnBean.setExpiry_batch_no(tableContents[i][4]);
                            expiryreturnBean.setExpiry_qty(Integer.valueOf(tableContents[i][5]));
                            expiryreturnBean.setExpiry_free_qty(Integer.valueOf(tableContents[i][6]));
                            expiryreturnBean.setExpiry_date(tableContents[i][7]);
                            expiryreturnBean.setExpiry_purchase_rate(Double.valueOf(tableContents[i][8]));
                            expiryreturnBean.setExpiry_mrp(Double.valueOf(tableContents[i][9]));
                            expiryreturnBean.setExpiry_item_total_amount(Double.valueOf(tableContents[i][10]));
                            var totQt: Integer = expiryreturnBean.getExpiry_qty() +  expiryreturnBean.getExpiry_free_qty();
                            expiryreturnBean.setExpiry_checkVal('checkExpiryReturn');                       
                            var qac=expiryreturnController.viewRecord(expiryreturnBean) as Integer;
                            var wt: Integer = 0;
                            if(rdoIncFree.selected==true){
                            wt = qac - totQt;
                            }else{
                                  wt = qac - expiryreturnBean.getExpiry_qty();
                                   expiryreturnBean.setExpiry_free_qty(0);
                            }
                            var expDate = DateUtils.changeFormatDate(expiryreturnBean.getExpiry_date());
                            expiryreturnBean.setExpiry_date(DateUtils.changeFormatDate(expiryreturnBean.getExpiry_date()));
                            expiryreturnBean.setExpiry_return_basedon(Integer.valueOf(expiryReturnTable.purSel));
                            expiryreturnBean.setExpiry_include_exclude(Integer.valueOf(expiryReturnTable.excludeFree));
                            expiryreturnBean.setExpiry_debit_note_no(dbNoteNo);
                            expiryReturnList.add(expiryreturnBean);
                             }                              
                              expiryreturnBean.setExpiryreturn(expiryReturnList);
                             expiryreturnController.createRecord(expiryreturnBean);
                        showDebitNote(0,dbNoteNo);
                        clearAll();                     
                        txtDistName.requestFocus();
                    } else {
                                    var cn:ConfirmDialogBox=new ConfirmDialogBox(0,"Expiry Return");
                                    var a =bind cn.staus;
                                        if (a) {
                                            expiryReturnList=new ArrayList();
                                            for (i in [0..<rowCnt]) {
                                                expiryreturnBean=new ExpiryReturnModel();
                                                   expiryreturnBean.setExpiry_from_date(DateUtils.changeFormatDate(sdf.parse(txtFromDate.rawText.trim())));
                            expiryreturnBean.setExpiry_to_date(DateUtils.changeFormatDate(sdf.parse(txtToDate.rawText.trim())));

                            expiryreturnBean.setExpiry_dist_name(txtDistName.rawText.trim());
                            expiryreturnBean.setExpiry_sub_total(Double.valueOf(txtsubTotAmt.rawText.trim()));
                            expiryreturnBean.setExpiry_dis_amount(Double.valueOf(txtDiscountAmt.rawText.trim()));
                            expiryreturnBean.setExpiry_roundoff_amount(Double.valueOf(txtRoundAmt.rawText.trim()));
                            expiryreturnBean.setExpiry_total_amount(Double.valueOf(txtTotalAmt.rawText.trim()));
                            expiryreturnBean.setExpiry_item_name(tableContents[i][1]);
                            expiryreturnBean.setExpiry_formulation(tableContents[i][2]);
                            expiryreturnBean.setExpiry_mfgname(tableContents[i][3]);
                            expiryreturnBean.setExpiry_batch_no(tableContents[i][4]);
                            expiryreturnBean.setExpiry_qty(Integer.valueOf(tableContents[i][5]));
                            expiryreturnBean.setExpiry_free_qty(Integer.valueOf(tableContents[i][6]));
                            expiryreturnBean.setExpiry_date(tableContents[i][7]);
                            expiryreturnBean.setExpiry_purchase_rate(Double.valueOf(tableContents[i][8]));
                            expiryreturnBean.setExpiry_mrp(Double.valueOf(tableContents[i][9]));
                            expiryreturnBean.setExpiry_item_total_amount(Double.valueOf(tableContents[i][10]));
                                                var totQt: Integer = expiryreturnBean.getExpiry_qty()+ expiryreturnBean.getExpiry_free_qty();
                                                var frQ:Integer=expiryreturnBean.getExpiry_free_qty();
                                                expiryreturnBean.setExpiry_checkVal('checkExpiryReturn');
                                                var qac=expiryreturnController.viewRecord(expiryreturnBean) as Integer;
                                                 expiryreturnBean.setExpiry_checkVal('checkExpiryReturnStock');
                                                var expQc:Integer=expiryreturnController.viewRecord(expiryreturnBean)as Integer;
                                                //var expQc:Integer= GetInformation.checkExpiryReturnStock(productName, batchNo);
                                                var wt: Integer = 0;
                                                 if(rdoIncFree.selected==true){
                                                     wt = qac+expQc - totQt;
                                             }else{
                                                wt = qac+expQc - expiryreturnBean.getExpiry_qty();
                                                  frQ=0;                                               
                                                }
                            expiryreturnBean.setExpiry_date(DateUtils.changeFormatDate(expiryreturnBean.getExpiry_date()));
                            expiryreturnBean.setExpiry_return_basedon(Integer.valueOf(expiryReturnTable.purSel));
                            expiryreturnBean.setExpiry_include_exclude(Integer.valueOf(expiryReturnTable.excludeFree));
                            expiryreturnBean.setExpiry_debit_note_no(expiryReturnTable.dbNoteNo);
                            expiryReturnList.add(expiryreturnBean);

                                            
                                            }
                                            expiryreturnBean.setExpiryreturn(expiryReturnList);
                                            expiryreturnController.updateRecord(expiryreturnBean);
                                            FXalert(4);
                                            showDebitNote(1, expr_DBNo);
                                            clearAll();                                            
                                            CustomAlert.confirm = false;
                                            }
                                           txtDistName.requestFocus();
                    }
}
                }

        } catch (e: Exception) {
            var msg: String = "Class :  Expiry Return  method : saveClick()   = {e.getMessage()}";
            log.debug(msg);
        }

    }

    function btnResetAction(): Void {
        clearAll();
    }

    function btnSaveAction(): Void {
        saveClick();

    }

    function rdoPurPriceOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        selectMRP();
    }

    function rdoExcFreeOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        selectMRP();
    }

    function rdoIncFreeOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        selectMRP();
    }

    function selectMRP(): Void {

        try{
        if (rdoMRP.selected) {
            expiryReturnTable.purSel = 1;

        } else {
            expiryReturnTable.purSel = 0;
        }

        if (rdoIncFree.selected) {
            expiryReturnTable.excludeFree = 1;
        } else {

            expiryReturnTable.excludeFree = 0;
        }
           expiryReturnTable.loadExpiryReturnTable();
           expiryReturnTable.expiryReturnCalculations();
           updateValues();
        

}catch(e:Exception){

  var msg: String = "Class : Expiry Return method : selectMRP()   = {e.getMessage()}";
            log.debug(msg);

}

    }

    function rdoMRPOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        selectMRP();
    }

    function imgCalendarToOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        txtToDate.style = mandatory;
        if (not todateFlag1) {
            panelCalendarTo.layoutY = txtToDate.layoutY + txtToDate.height + 2.0;
            if (txtToDate.text != null) {
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
            todateFlag1 = true;
        } else {
            fxCalendar.visible = false;
        }

    }

    function imgCalendarFromOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {

        txtFromDate.style = mandatory;
        if (not fromDateFlag) {
            panelCalendarTo.layoutY = txtFromDate.layoutY + txtFromDate.height + 2;

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
            fromDateFlag = true;
        } else {
            fxCalendar.visible = false;
        }

    }

    function getDate(i: Integer) {
        var expiryReturnBean:ExpiryReturnModel=new ExpiryReturnModel();
        if (i == 0) {

            txtFromDate.text = fxCalendar.getSelectedDate();
            ExpiryReturnTable.sDate = txtFromDate.rawText.trim();
                
            fromDateFlag = false;
            todateFlag1 = false;
            imgCalendarTo.requestFocus();
        } else if (i == 1) {
            txtToDate.text = fxCalendar.getSelectedDate();
            ExpiryReturnTable.eDate = txtToDate.rawText.trim();
             
            fromDateFlag = false;
            todateFlag1 = false;

        }
    }

    var visit = bind fxCalendar.visible on replace {
        if (fromDateFlag and not visit) {
            getDate(0);
        } else if (todateFlag1 and not visit) {
            getDate(1);
        }
    };

   

    function imgDistNameOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
     if(not listDist.visible){
            getDistShownList(0);
     }
     else{
            listDist.visible=false;
            txtDistName.requestFocus();
      }
    }

    function getDitributor(event: javafx.scene.input.KeyEvent):Integer {
        listH = 0.0;     
          var distName: List = new ArrayList();
        listDist.visible = true;
   var m:Integer=0;
        listW = txtDistName.width;
        var size = listDist.items.size();
        if (not listDist.items.isEmpty()) {
            for (i in [0..<size])
                listDist.items[i] = null;
            txtDistName.requestFocus();
        }
        distName = commonController.getListItems(txtDistName.rawText.trim(), "", "DISTRI");
        var len: Integer = distName.size();
        listDist.clearSelection();
        if (len > 0) {
             m=5;
            listDist.items = distName.toArray();
            listDist.onKeyPressed = function(e) {
                        if (e.code == KeyCode.VK_ENTER) {
                            txtDistName.text = "{listDist.selectedItem}";
                            if(m==0 or txtDistName.rawText.trim()==null or txtDistName.rawText.trim()=="null" )
                            {
                            m=0;
                            txtDistName.text="";
                            }
                            listDist.visible = false;
                            txtDiscount.requestFocus();
                            expiryReturnTable.clearAllValues();
                            updateValues();
                        } else if (e.code == KeyCode.VK_DOWN) {
                            if (listDist.selectedIndex == 0) {
                                listDist.selectFirstRow();
                            }
                        } else if (e.code == KeyCode.VK_ESCAPE) {
                            listDist.visible = false;
                            txtDistName.requestFocus();
                        }
                    };
            listDist.onMouseClicked = function(e) {
                        txtDistName.text = "{listDist.selectedItem}";
if(m==0 or txtDistName.rawText.trim()==null or txtDistName.rawText.trim()=="null" ){ m=0;txtDistName.text=""; }
                        listDist.visible = false;
                        txtDiscount.requestFocus();
                        expiryReturnTable.clearAllValues();
                         updateValues();
                    }

            var height: Integer = 0;
            if (listDist.items.size() < 13) {
                height = listDist.items.size();
            } else {
                height = 12;
            }
            for (i in [1..height]) {
                listH += 25.0;
            }

            if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB){
                listDist.visible = false;
            txtDiscount.requestFocus();
            }
        } else {
            listDist.visible = false;

        }
        
          if (event.code == KeyCode.VK_ESCAPE ) {
           listDist.visible = false;
             if(m==0 or  txtDistName.rawText.trim()==null or txtDistName.rawText.trim()=="null" ) {
                 m=0;txtDistName.text="";
                 }
        }
return m;
    }
	function getPrivileges(u : String ):Void{
//             var commonController: CommonImplements = new CommonController();
        var uname = u;
//        var utype = GetUserInfo.getUserType(uname);
          var utype =commonController.getUserType(uname);

        if(utype.equals("User"))
        {
            //var priv= GetUserInfo.getPrivillages("inventory",uname);
             var priv = commonController.getPrivileges("inventory", uname);
            var ss = priv.split(",");
            var val = Integer.parseInt(ss[5]);
            if(val == 1)
            {
				btnSave.disable=true;
				if(btnEdit.text!="Edit [F6]")
				{
					btnEdit.disable=true;
				}
				else{
					btnEdit.disable=false;
				}      
            }
            else if(val == 2)
            {				
				if(btnEdit.text!="Edit [F6]")
				{
					btnEdit.disable=true;
				}
				else{
					btnEdit.disable=false;
				}
				btnSave.disable=false;				
                //This code for  READ and WRITE Access
            }
            else if(val == 3)
            {
				btnSave.disable=false;
				btnEdit.disable=false;
                //This code for FULL Access
            }
        }else{
				btnSave.disable=false;
				btnEdit.disable=false;		
		}
    }
var logUser: String =  bind CommonDeclare.user on replace{
            getPrivileges(logUser);
        }

var changPiv =  bind btnSave.text on replace{
            getPrivileges(logUser);
        }

var changPiv1 =  bind btnEdit.text on replace{
            getPrivileges(logUser);
        }	
    function txtDistNameOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        listDist.layoutX = txtDistName.layoutX;
        listDist.layoutY = txtDistName.layoutY + 25;
        try {
            if (btnSave.text == "Save [F3]") {
                var n:Integer=0;
//                getDistShownList(1);
       n=getDitributor(event);
        sar=n;
         if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
                if(n==0 or txtDistName.rawText.trim()==null or txtDistName.rawText.trim()=="null" ){
                    txtDistName.text="";
  }
        }
        
        if (event.code == KeyCode.VK_DOWN) {
                listDist.requestFocus();
                listDist.selectFirstRow();
            }
                }
        } catch (e: Exception) {
            var msg: String = "Class : Expiry Return method : txtDistNameOnKeyReleased()   = {e.getMessage()}";
            log.debug(msg);
        }

    }

    function btnCancelActionAtShown(): Void {
        panel.visible = false;
        CommonDeclare.form[2] = 0;
    }

    function btnEditActionAtShown(): Void {
        currentState.actual = currentState.findIndex("View");
    }

    function group2OnMouseClickedAtEdit(event: javafx.scene.input.MouseEvent): Void {
        currentState.actual = currentState.findIndex("View");
        viewExpiryReturnTable.loadExpiryReturn();
    }

    function group2OnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        currentState.actual = currentState.findIndex("View");
        viewExpiryReturnTable.loadExpiryReturn();
    }

    function group2OnMouseClickedAtView(event: javafx.scene.input.MouseEvent): Void {        
        currentState.actual = currentState.findIndex("Shown");
        viewExpiryReturnTable.viewPaymentCalculations();
        updateValues();
        //FXinfo("Please select a row to Edit");
    }

    function groupOnMouseClickedAtView(event: javafx.scene.input.MouseEvent): Void {
        currentState.actual = currentState.findIndex("Shown");
        clearAll();
    }
public function showDebitNote(i : Integer,no : String):Void{
    var expiryreturnBean:ExpiryReturnModel=new ExpiryReturnModel();
    var debitnoteBean:DebitNoteModel=new  DebitNoteModel();
    //expiryreturnController = RegistryFactory.getClientStub(RegistryConstants.ExpiryReturn) as com.vanuston.medeil.implementation.ExpiryReturn;
    expiryreturnBean.setExpiry_checkVal("getQueryValue");
    expiryreturnBean.setExpiry_debit_note_no(expr_DBNo);
    
     //var expiryreturnController:  com.vanuston.medeil.implementation.ExpiryReturn = new  ExpiryReturnController();    
    var DBNoteDetails=expiryreturnController.viewRecord(expiryreturnBean) as String;
    if(i==0 or expr_DBNo=="" or expr_DBNo.length()<=0)
    {
    var DBNoteNo1 = no;
    
    debitnoteBean.setDebitNoteNumber(DBNoteNo1);
    debitnoteBean.setName(txtDistName.rawText);
    debitnoteBean.setAmount(Double.valueOf(txtTotalAmt.rawText));
    debitnoteBean.setIssuedAgainst('Distributor');
    debitnoteBean.setDebitOption('Expiry Return');
    debitnoteBean.setDebitDate(Date.valueOf(DateUtils.now("yyyy-MM-dd")));
    debitnoteBean.setInvoiceOrBillNumber('');
    debitnoteBean.setDetails(DBNoteDetails);
    debitNoteController.createRecord(debitnoteBean);
    expr_DBNo = DBNoteNo1;
    }
    else if(i==1)
    {
     
    
    debitnoteBean.setDebitNoteNumber(expr_DBNo);
    debitnoteBean.setName(txtDistName.rawText);
    debitnoteBean.setAmount(Double.valueOf(txtTotalAmt.rawText));
    debitnoteBean.setIssuedAgainst('Distributor');
    debitnoteBean.setDebitOption('Expiry Return');
    debitnoteBean.setDebitDate(Date.valueOf(DateUtils.now("yyyy-MM-dd")));
    debitnoteBean.setInvoiceOrBillNumber('');
    
    debitnoteBean.setDetails(DBNoteDetails);
     //var debitNoteController:DebitNote=new  DebitNoteController();
//    debitNoteController.createRecord(expiryreturnBean);
    debitNoteController.updateRecord(debitnoteBean);
//        var sql = "UPDATE debit_note SET issued_against='Distributor',debit_opt='Expiry Return',debit_date='{DateUtils.now("yyyy-MM-dd")}',invoiceorbill_no='',name='{txtDistName.rawText}',amount='{txtTotalAmt.rawText}',details='{DBNoteDetails}' WHERE debit_note_no='{expr_DBNo}')";

//        DBData.queryExecution(sql);
    }
    
    ReturnNotes.setValues([expr_DBNo,DateUtils.now("dd-MM-yyyy"),"{txtDistName.rawText}","NIL",txtTotalAmt.rawText,DBNoteDetails]);
    panelRetrnNotes.visible = true;
    ReturnNotes.Show();
    expr_DBNo="";
}


    public function updateValues(): Void {

try {
        ExpiryReturnTable.distributorName = txtDistName.rawText.trim();
        ExpiryReturnTable.sDate=txtFromDate.rawText.trim();
        ExpiryReturnTable.eDate =txtToDate.rawText.trim();
        txtsubTotAmt.text = Value.Round(expiryReturnTable.expiryReturnAmount);
        if (txtDiscount.rawText.trim() != null and txtDiscount.rawText.trim().trim().length() > 0) {

            var disAmt: Double = Double.valueOf(txtDiscount.rawText.trim());
            var discountAmt: Double = 0.0;
            if (disAmt > 0 and expiryReturnTable.expiryReturnAmount>0) {
                discountAmt = (disAmt / 100) * expiryReturnTable.expiryReturnAmount;
                discountAmt = Value.Round(discountAmt, 2);
            }

            var totAmount: Double = expiryReturnTable.expiryReturnAmount - discountAmt;
            var totAm: Double = totAmount;
            totAmount = Value.roundToWholeVal(totAmount);

            txtDiscountAmt.text = Value.Round(discountAmt);
            txtTotalAmt.text = Value.Round(totAmount);
            var totAl: Double = Double.valueOf(txtTotalAmt.text);
            var finalA: Double = totAl - totAm;
            if (finalA < 0) {
                finalA = (-1) * finalA;
            }
            txtRoundAmtText = Value.Round(finalA);

        }
        if (viewExpiryReturnTable.expiryRetDate != null and viewExpiryReturnTable.expiryRetDate.trim().length() > 5) {
            currentState.actual = currentState.findIndex("Edit");
            expRetDate = viewExpiryReturnTable.expiryRetDate;

            var exDate: String = ViewExpiryReturnTable.expiryRetDate;
            

            var distName: String = ViewExpiryReturnTable.ditName;

//             var totam: String = expiryReturnTable.totA.toString();
            var totam: String = ViewExpiryReturnTable.totAmount.toString();
            

            viewExpiryReturnTable.expiryRetDate = "";

            expiryReturnTable.loadExpiryReturnDateTable(exDate, distName, totam);
            txtDistName.text = ViewExpiryReturnTable.ditName;
//            txtDistName.text = expiryReturnTable.distributorName;
            txtTotalAmt.text = ViewExpiryReturnTable.totAmount.toString();
            txtDiscount.text = expiryReturnTable.discount;
            expr_DBNo = expiryReturnTable.dbNoteNo;

            txtFromDate.text = ExpiryReturnTable.sDate;
            txtToDate.text = ExpiryReturnTable.eDate;
            txtDiscountAmt.text = expiryReturnTable.disA;
            txtsubTotAmt.text = expiryReturnTable.subT;
            txtRoundAmtText = expiryReturnTable.roundA;
            expId = 1;
            if (expiryReturnTable.purSel == 0) {
                rdoPurPrice.selected = true;
                rdoMRP.selected = false;
            } else {
                rdoPurPrice.selected = false;
                rdoMRP.selected = true;
            }
            if (expiryReturnTable.excludeFree == 0) {
                rdoExcFree.selected = true;
                rdoIncFree.selected = false;
            } else {
                rdoExcFree.selected = false;
                rdoIncFree.selected = true;
            }
        } else {

            if ((expRetDate == "" or expRetDate.trim().length() == 0) and expId == 1) {
                currentState.actual = currentState.findIndex("Shown");
            }
        }
         } catch (e: Exception) {
            var msg: String = "Class : Expiry Retrun  method : updateValues()  = {e.getMessage()}";
            log.debug(msg);
        }
    }
     public function CancelForm(): Void {
         CommonDeclare.form[3] = 0;
     }
    public function StartUp(): Void {
        (expRetrun as javax.swing.JTable).addKeyListener(KeyAdapter {
            override public function keyReleased(e: java.awt.event.KeyEvent): Void {
                updateValues();
                expiryReturnTable.expiryReturnCalculations();
                updateValues();
            }
        });
        (expRetrun as javax.swing.JTable).addMouseListener(MouseAdapter {
            override public function mouseClicked(e: java.awt.event.MouseEvent): Void {
                updateValues();
                expiryReturnTable.expiryReturnCalculations();
                updateValues();
            }
        });
        (expiryRReturnTableView as javax.swing.JTable).addMouseListener(MouseAdapter {
            override public function mouseClicked(e: java.awt.event.MouseEvent): Void {
                currentState.actual = currentState.findIndex("Shown");

                viewExpiryReturnTable.viewPaymentCalculations();
                updateValues();
            }
        });
        txtDistName.style = mandatory;
        txtDiscount.style = mandatory;
        txtFromDate.style = mandatory;
        txtToDate.style = mandatory;
        currentState.actual = 0;
        panel.visible = true;
        fxCalendar.visible = false;
        panelCalendarFrom.content = [fxCalendar,];
        panelCalendarTo.content = [fxCalendar,];
        panelTable.content = [expRetrunAdd,];
        panelViewTable.content = [ViewExpiryTab,];
        clearAll();
        delete  panelRetrnNotes.content;
        ReturnNotes.panel.visible = false;
        insert ReturnNotes.panel into panelRetrnNotes.content;
        txtDistName.requestFocus();
    }
}