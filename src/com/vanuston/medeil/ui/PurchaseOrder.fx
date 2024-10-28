package com.vanuston.medeil.ui;

import java.lang.*;
import java.awt.Dimension;
import javafx.scene.image.Image;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import javafx.ext.swing.SwingComponent;
import java.io.File;
import java.util.List;
import java.util.ArrayList;
import javafx.scene.control.TextBox;
import java.awt.event.KeyAdapter;
import com.vanuston.medeil.util.GetProductInfo;
import com.vanuston.medeil.uitables.PurcOrderTable;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.util.KeyRegistry;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.PurchaseOrderPDF;
import com.vanuston.medeil.model.PurchaseOrderModel;
import com.vanuston.medeil.model.MsgReturnModel;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import com.vanuston.medeil.ui.calendar.theme.GrayTheme;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.uitables.ConfirmDialogBox;

public class PurchaseOrder {

    var purchaseOrder = new PurcOrderTable();
    var productInfo = new GetProductInfo();
    var dutils = new DateUtils();
    var log: Logger = Logger.getLogger(PurchaseOrder.class, "Inventory");
    var DistInfo: DistributorInformation = DistributorInformation {};
    var PaymentType: String[] = ["Cash", "Credit", "Credit/Debit Card", "Partial Payment", "Account Payee"];
    var purcOrdBillDate = dutils.now("dd-MM-yyyy");
    var dateFlag: Boolean = false;
    var fxCalendar = FXCalendar {
                theme: GrayTheme {};
            };
    var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;    
    var getAutoVal = commonController.getAutoIncrement(purcOrdBillDate, "PurchaseOrder");
    var poTable = purchaseOrder.createTable();
    var PurcOrdTable = SwingComponent.wrap(purchaseOrder.getScrollTable(poTable));
    var sar: Integer = 0;
    var listW = 0.0;
    var listH = 0.0;
    var listLX = 0.0;
    var listLY = 0.0;
    var imgRotate = true;
    var panelW = bind CommonDeclare.panelFormW;
    var panelH = bind CommonDeclare.panelFormH;
    var panelPONowLX = bind (panelW - 600) / 2;
    var panelPONowLY = bind (panelH - 380) / 2;
    var one = bind CommonDeclare.one;
    var two = bind CommonDeclare.two;
    var five = bind CommonDeclare.five;
    var ten = bind CommonDeclare.ten;
    var eighty = bind (8 * ten);
    var hundred = bind CommonDeclare.hundred;
    var twoHund = bind CommonDeclare.twoHund;
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var C1LX = bind CommonDeclare.Column1LX;
    var C2LX = bind CommonDeclare.Column2LX;
    var C3LX = bind CommonDeclare.Column3LX;
    var C4LX = bind CommonDeclare.Column4LX + 20;
    var BotC6LX = bind (70.13977128 * panelW) / 100;
    var BotC5LX = bind (51.46124524 * panelW) / 100;
    var BotC4LX = bind (35.57814485 * panelW) / 100;
    var BotC3LX = bind (25.41296061 * panelW) / 100;
    var BotC2LX = bind (16.5184 * panelW) / 100;
    var BotTotW = bind (31.76620076 * panelW) / 100;
    var botton1LX = bind CommonDeclare.botton51LX - 5;
    var botton2LX = bind CommonDeclare.botton52LX - 10;
    var botton3LX = bind CommonDeclare.botton53LX + 3;
    var botton4LX = bind CommonDeclare.botton54LX;
    var botton5LX = bind CommonDeclare.botton55LX - 2;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    var buttonW = bind CommonDeclare.bottonW;
    var buttonH = bind CommonDeclare.bottonH;
    var rectbuttonLY = bind CommonDeclare.rectbuttonLY;
    var seperatorW = bind CommonDeclare.seperatorW;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;
    var Type4TextboxW = bind CommonDeclare.Type4TextboxW;
    var ImageCalenderLX = bind C2LX + Type3TextboxW;
    var panelCalenderLX = bind ImageCalenderLX + 5.0;
    var TableH = 265.0;
    var TableW = bind (95.29860229 * panelW) / 100 on replace {
        changeTableSize(TableW);
    };
    var panelTableLX = bind (panelW - TableW) / 2;
    var panelTableLY = 172.0;
    var rectRemoveRowLX = bind ((panelW + TableW) / 2) - 120;
    var rectRemoveRowLY = panelTableLY + TableH;
    var mandatory = CommonDeclare.textbox_mandatory();
    var error = CommonDeclare.textbox_error();
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def panelPOTable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelTableLX
        layoutY: bind panelTableLY+20
        blocksMouse: true
    }
    
    public-read def rectTableBorder: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        layoutX: bind panelTableLX
        layoutY: bind panelTableLY+20
        styleClass: "rectTableBorder"
        width: bind TableW
        height: bind TableH
    }
    
    def __layoutInfo_cboPODeliver: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def cboPODeliver: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: bind C2LX
        layoutY: 104.0
        layoutInfo: __layoutInfo_cboPODeliver
        onKeyPressed: cboPODeliverOnKeyPressed
        items: [ "Parcel Services", "In person", ]
    }
    
    def __layoutInfo_listView: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 600.0
        height: 265.0
    }
    public-read def listView: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: 100.0
        layoutY: 172.0
        layoutInfo: __layoutInfo_listView
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    def __layoutInfo_cboPOPayment: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def cboPOPayment: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: bind C2LX
        layoutY: 126.0
        layoutInfo: __layoutInfo_cboPOPayment
        onKeyPressed: cboPOPaymentOnKeyPressed
        onKeyReleased: cboPOPaymentOnKeyReleased
        items: bind PaymentType
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: true
        layoutX: bind C2LX + Type3TextboxW-5
        layoutY: 60.0
        onMouseClicked: imageViewOnMouseClicked
        image: Image {url: "{__DIR__}images/Calender.png"};
        fitHeight: 23.0
    }
    
    public-read def panel2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind imageView.layoutX
        layoutY: 82.0
        onKeyPressed: panel2OnKeyPressed
        blocksMouse: true
    }
    
    def __layoutInfo_listPurcOrder: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listPurcOrder: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind listLX
        layoutY: bind listLY
        layoutInfo: __layoutInfo_listPurcOrder
        items: null
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
        blocksMouse: true
    }
    
    public-read def panelPONow: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelPONowLX
        layoutY: bind panelPONowLY
        blocksMouse: true
    }
    
    public-read def paneldist: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
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
    
    public-read def ChkPrintAll: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        visible: false
        layoutX: bind panelW-50.0
        layoutY: 500.0
        text: "Print \\All"
        font: Arial_12
        selected: true
    }
    
    public-read def Arial_Bold_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
    }
    
    public-read def Arial_14: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 14.0
    }
    
    def __layoutInfo_txtPONo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
        height: 25.0
        hfill: false
    }
    public-read def txtPONo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 82.0
        layoutInfo: __layoutInfo_txtPONo
        style: ""
        styleClass: "text-box"
        onKeyPressed: txtPONoOnKeyPressed
        onKeyReleased: txtPONoOnKeyReleased
        effect: null
        focusTraversable: false
        text: bind getAutoVal
        editable: false
        font: Arial_14
    }
    
    public-read def Arial_Bold_14: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 14.0
    }
    
    public-read def chkOrderLater: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        layoutX: bind botton1LX
        layoutY: -20.0
        onKeyPressed: chkOrderLaterOnKeyPressed
        onKeyReleased: chkOrderLaterOnKeyReleased
        onMouseClicked: chkOrderLaterOnMouseClicked
        text: "Send PO Later"
        font: Arial_Bold_14
    }
    
    public-read def chkOpenAsPDF: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        layoutX: bind botton1LX
        layoutY: -40.0
        onKeyPressed: chkOpenAsPDFOnKeyPressed
        onKeyReleased: chkOpenAsPDFOnKeyReleased
        text: "Export to PDF and Open"
        font: Arial_Bold_14
    }
    
    public-read def Arial_16: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 16.0
    }
    
    def __layoutInfo_txtPODLNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtPODLNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 104.0
        layoutInfo: __layoutInfo_txtPODLNo
        onKeyPressed: txtPODLNoOnKeyPressed
        editable: false
        font: Arial_16
    }
    
    def __layoutInfo_txtPOAddress: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtPOAddress: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 148.0
        layoutInfo: __layoutInfo_txtPOAddress
        onKeyPressed: txtPOAddressOnKeyPressed
        editable: false
        font: Arial_16
    }
    
    def __layoutInfo_txtPOTINNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtPOTINNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 126.0
        layoutInfo: __layoutInfo_txtPOTINNo
        onKeyPressed: txtPOTINNoOnKeyPressed
        editable: false
        font: Arial_16
    }
    
    def __layoutInfo_txtPOSuppCode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtPOSuppCode: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 82.0
        layoutInfo: __layoutInfo_txtPOSuppCode
        onKeyPressed: txtPOSuppCodeOnKeyPressed
        editable: false
        font: Arial_16
    }
    
    def __layoutInfo_txtPOSuppName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW - 20.0
        height: 25.0
    }
    public-read def txtPOSuppName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 60.0
        layoutInfo: __layoutInfo_txtPOSuppName
        styleClass: "text-box"
        onKeyPressed: txtPOSuppnameOnKeyPressed
        onKeyReleased: txtPOSuppnameOnKeyReleased
        font: Arial_16
    }
    
    def __layoutInfo_txtPODate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtPODate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 60.0
        layoutInfo: __layoutInfo_txtPODate
        onKeyPressed: txtPODateOnKeyPressed
        text: bind purcOrdBillDate
        promptText: "dd - mm - yyyy"
        selectOnFocus: false
        editable: false
        font: Arial_16
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
    
    def __layoutInfo_txtPOTotQty: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
        height: 28.0
    }
    public-read def txtPOTotQty: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind labelQuantity.layoutX+70.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_txtPOTotQty
        styleClass: "Borderless-text-box"
        onKeyPressed: txtPOTotQtyOnKeyPressed
        promptText: "0"
        editable: false
        font: Arial_20
    }
    
    def __layoutInfo_txtPOTotItm: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
        height: 28.0
    }
    public-read def txtPOTotItm: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: true
        layoutX: bind labelProducts.layoutX+ 80.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_txtPOTotItm
        styleClass: "Borderless-text-box"
        onKeyPressed: txtPOTotItmOnKeyPressed
        promptText: "0"
        font: Arial_20
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
        layoutY: 1.0
        layoutInfo: __layoutInfo_label
        styleClass: "labelFormHeading"
        effect: null
        text: "Purchase Order - ctrl+O"
        font: Arial_25
        hpos: javafx.geometry.HPos.CENTER
    }
    
    public-read def DarkGray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.2
        blue: 0.2
    }
    
    def __layoutInfo_label18: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 120.0
        height: 20.0
    }
    public-read def label18: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind rectRemoveRowLX
        layoutY: bind rectRemoveRowLY+20
        layoutInfo: __layoutInfo_label18
        text: "RemoveRow [F12]"
        font: Arial_Bold_12
        hpos: javafx.geometry.HPos.CENTER
        graphicHPos: javafx.geometry.HPos.CENTER
        textFill: DarkGray
    }
    
    public-read def labelQuantity: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C4LX
        layoutY: 3.0
        text: "Quantity :"
        font: Arial_16
        textFill: DarkGray
    }
    
    public-read def labelProducts: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C4LX-200.0
        layoutY: 3.0
        text: "Products :"
        font: Arial_16
        textFill: DarkGray
    }
    
    public-read def panel3: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutY: 477.0
        content: [ labelProducts, txtPOTotItm, labelQuantity, txtPOTotQty, ]
    }
    
    public-read def label1: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 126.0
        text: "TIN No."
        font: Arial_16
        textFill: DarkGray
    }
    
    public-read def label14: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 60.0
        text: "Date"
        font: Arial_16
        textFill: DarkGray
    }
    
    public-read def label13: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 148.0
        text: "Address"
        font: Arial_16
        textFill: DarkGray
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 82.0
        text: "Distributor Code"
        font: Arial_16
        textFill: DarkGray
    }
    
    public-read def label8: javafx.scene.control.Label = javafx.scene.control.Label {
        opacity: 1.0
        layoutX: bind C1LX
        layoutY: 104.0
        text: "Delivery Type"
        font: Arial_16
        textFill: DarkGray
    }
    
    public-read def label6: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 104.0
        text: "D.L. No."
        font: Arial_16
        textFill: DarkGray
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX
        layoutY: 126.0
        text: "Payment Type"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 60.0
        text: "Distributor Name"
        font: Arial_16
        textFill: DarkGray
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 82.0
        styleClass: "label"
        text: "PO No."
        font: Arial_16
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
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
    }
    
    public-read def Arial_30: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
        size: 30.0
    }
    
    public-read def Yellow: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 1.0
        blue: 0.8
    }
    
    public-read def rectRemoveRow: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        opacity: 0.95
        layoutX: bind rectRemoveRowLX
        layoutY: bind rectRemoveRowLY+20
        styleClass: "rectbutton"
        onMouseClicked: rectRemoveRowOnMouseClicked
        fill: Yellow
        stroke: DarkGray
        strokeWidth: 2.0
        width: 120.0
        height: 20.0
        arcWidth: 10.0
        arcHeight: 10.0
    }
    
    public-read def imageClickDown: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imgSupplierName: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind C4LX + Type1TextboxW - 20.0
        layoutY: 62.0
        onMouseClicked: imgSupplierNameOnMouseClicked
        scaleX: 1.2
        scaleY: 1.2
        image: imageClickDown
        fitWidth: 16.0
        fitHeight: 20.0
    }
    
    public-read def imageSave: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Save1.png"
    }
    
    public-read def imageView3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageSave
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind buttonW
        height: bind buttonH
    }
    public-read def btnSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton3LX
        layoutInfo: __layoutInfo_btnSave
        graphic: imageView3
        text: "Save [F3]"
        font: Arial_Bold_14
        action: btnSaveAction
    }
    
    public-read def imgPOOrdLater: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageSave
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_brnPOOrderLater: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind buttonW
        height: bind buttonH
    }
    public-read def brnPOOrderLater: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX
        layoutInfo: __layoutInfo_brnPOOrderLater
        onKeyPressed: brnPOOrderLaterOnKeyPressed
        onKeyReleased: brnPOOrderLaterOnKeyReleased
        effect: reflectionEffect
        graphic: imgPOOrdLater
        text: "Save [F3]"
        font: Arial_Bold_16
        action: brnPOOrderLaterAction
    }
    
    public-read def imageEdit: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Edit.png"
    }
    
    public-read def imgPOEdit: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageEdit
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_brnPOEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind buttonW
        height: bind buttonH
    }
    public-read def brnPOEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton3LX
        layoutInfo: __layoutInfo_brnPOEdit
        onKeyPressed: brnPOEditOnKeyPressed
        effect: reflectionEffect
        graphic: imgPOEdit
        text: "Edit [F6]"
        font: Arial_Bold_16
        textAlignment: javafx.scene.text.TextAlignment.CENTER
        action: brnPOEditAction
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
        width: bind buttonW
        height: bind buttonH
    }
    public-read def btnReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton4LX
        layoutInfo: __layoutInfo_btnReset
        graphic: imageView4
        text: "Reset [F4]"
        font: Arial_Bold_14
        action: btnResetAction
    }
    
    public-read def imgPOReset: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageReset
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_brnPOReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind buttonW
        height: bind buttonH
    }
    public-read def brnPOReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton4LX
        layoutInfo: __layoutInfo_brnPOReset
        onKeyPressed: brnPOResetOnKeyPressed
        effect: reflectionEffect
        graphic: imgPOReset
        text: "Reset [F4]"
        font: Arial_Bold_16
        textAlignment: javafx.scene.text.TextAlignment.CENTER
        action: brnPOResetAction
    }
    
    public-read def imageCancel: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Cancel.png"
    }
    
    public-read def imgPOCancel: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: -6.0
        image: imageCancel
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_brnPOCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind buttonW+18
        height: bind buttonH
    }
    public-read def brnPOCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton5LX
        layoutInfo: __layoutInfo_brnPOCancel
        onKeyPressed: brnPOCancelOnKeyPressed
        effect: reflectionEffect
        graphic: imgPOCancel
        text: "Cancel [F8]"
        font: Arial_Bold_16
        textAlignment: javafx.scene.text.TextAlignment.CENTER
        graphicTextGap: 0.0
        action: brnPOCancelAction
    }
    
    public-read def Header: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
    }
    
    public-read def rectangle2: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 0.25
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "rectFormHeader"
        fill: Header
        stroke: null
        width: bind panelW
        height: 32.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def imageBack: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/arrow_Left.png"
    }
    
    public-read def imageView2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageBack
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnBack: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind buttonW+30
        height: bind buttonH
    }
    public-read def btnBack: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton2LX
        layoutInfo: __layoutInfo_btnBack
        graphic: imageView2
        text: "Back [Ctrl+Left]"
        font: Arial_Bold_14
        action: btnBackAction
    }
    
    public-read def panelDistButtons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutY: bind panelButtonsLY
        content: [ btnBack, btnSave, btnReset, ]
    }
    
    public-read def panelDistributor: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ paneldist, panelDistButtons, ]
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imageView5: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind Type2TextboxW+C2LX
        layoutY: 82.0
        onMouseClicked: imageView5OnMouseClicked
        image: image
    }
    
    public-read def imageSend: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/MailSend.png"
    }
    
    public-read def imgPOSave: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageSend
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_brnPOSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind buttonW+22
        height: bind buttonH
    }
    public-read def brnPOSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton2LX
        layoutInfo: __layoutInfo_brnPOSave
        onKeyPressed: brnPOSaveOnKeyPressed
        translateX: 0.0
        effect: reflectionEffect
        graphic: imgPOSave
        text: "Order Now"
        font: Arial_Bold_16
        textAlignment: javafx.scene.text.TextAlignment.CENTER
        action: brnPOSaveAction
    }
    
    public-read def panelButton: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutY: bind panelButtonsLY
        content: [ chkOpenAsPDF, chkOrderLater, brnPOOrderLater, brnPOSave, brnPOEdit, brnPOReset, brnPOCancel, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutX: 0.0
        layoutY: 0.0
        content: [ rectangle2, label, label2, label3, label4, label6, label8, label9, label13, panelPOTable, rectTableBorder, panelButton, txtPODate, label14, txtPOSuppName, txtPOSuppCode, txtPOTINNo, cboPODeliver, txtPONo, txtPOAddress, txtPODLNo, label1, panel3, imageView5, listView, rectRemoveRow, label18, cboPOPayment, imageView, panel2, ChkPrintAll, listPurcOrder, imgSupplierName, panelAlert, panelPONow, ]
    }
    
    public-read def panelPurchaseOrder: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ rectangle, panel, panelDistributor, ]
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panelPurchaseOrder, ]
    }
    // </editor-fold>//GEN-END:main

    function brnPOCancelOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            brnPOCancelAction();
        }
    }

    function brnPOResetOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            brnPOResetAction();
        }
    }

    function brnPOEditOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            brnPOEditAction();
        }
    }

    function chkOrderLaterOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if (chkOrderLater.selected == true) {
            brnPOSave.disable = true;
        } else {
            brnPOSave.disable = false;
        }
    }

    function chkOrderLaterOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        shortcut(event);
    }

    function chkOpenAsPDFOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        shortcut(event);
    }

    function chkOrderLaterOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            if (chkOrderLater.selected) {
                chkOrderLater.selected = false;
            } else {
                chkOrderLater.selected = true;
            }
        } else {
            shortcut(event);
        }
    }

    function chkOpenAsPDFOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            if (chkOpenAsPDF.selected) {
                chkOpenAsPDF.selected = false;
            } else {
                chkOpenAsPDF.selected = true;
            }
        } else {
            shortcut(event);
        }
    }

    function brnPOOrderLaterOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function brnPOOrderLaterOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            savePurchaseOrderLater();
        }
        shortcut(event);
    }

    function btnResetAction(): Void {
        DistInfo.reset();
    }

    public function btnSaveAction(): Void {
        var retVal = bind DistInfo.save(1);
        saveAndBack(retVal);
    }

    var ret = bind DistInfo.checkVal on replace {
        saveAndBack(ret);
    }

    public function saveAndBack(retVal: Integer): Void {
        var user = bind DistInfo.tempDistName;
        var code = bind DistInfo.tempDistCode;
        var dl = bind DistInfo.tempDistDLNo;
        var tin = bind DistInfo.tempDistTinNo;
        var add = bind DistInfo.tempDistAdd;
        if (retVal == 1) {
            txtPOSuppName.text = user;
            txtPOSuppCode.text = code;
            txtPODLNo.text = dl;
            txtPOTINNo.text = tin;
            txtPOAddress.text = add;
            btnBackAction();
            txtPONo.requestFocus();
        }
    }

    public function btnBackAction(): Void {
        delete  paneldist.content;
        panelDistributor.visible = false;
        panel.visible = true;
        txtPONo.editable = false;
    }

    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    def CustomAlert = CustomAlert {};

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Purchase Order", type);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Purchase Order", msg);
        showAlertbox();
    }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Purchase Order", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = error;
    }

    function imgSupplierNameOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if (rotateImage) {
            listPurcOrder.visible = false;
        } else {
            getSupplier(0);
        }
    }

    function brnPOOrderLaterAction(): Void {
        savePurchaseOrderLater();
    }

    def kr = KeyRegistry {};
    var key = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 3 and CommonDeclare.form[2] == 1) {
            shortcut(key);
        }
    }

    function cboPOPaymentOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function brnPOCancelAction(): Void {
        imageView5.visible = false;
        if (brnPOCancel.text == "Back [Ctrl+Left]") {
            brnPOSave.disable = false;
            brnPOOrderLater.disable = false;
            brnPOEdit.disable = false;
            back();
        } else {
            panelPurchaseOrder.visible = false;
            CancelForm();
        }
    }

    public function back(): Void {
        brnPOSave.text = "Order Now";
        brnPOOrderLater.text = "Save [F3]";
        brnPOEdit.text = "Edit [F6]";
        brnPOReset.text = "Reset [F4]";
        brnPOCancel.text = "Cancel [F8]";
        resetPurcOrderValues();
        imageView5.visible = false;
        imgPOCancel.image = imageCancel;
        txtPONo.editable = false;
        brnPOOrderLater.disable = false;
    }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {
        if (CommonDeclare.currKyEvent.controlDown or CommonDeclare.currKyEvent.altDown or CommonDeclare.currKyEvent.shiftDown) {
            kr.actionKey = CommonDeclare.currKyEvent.code;
        }
        if (event.code == kr.save and brnPOOrderLater.text == "Save [F3]") {
            brnPOOrderLaterAction();
        }
        if (event.code == kr.edit and brnPOEdit.text == "Edit [F6]" and not brnPOEdit.disable) {
            edit();
        }

        if (event.code == kr.update and brnPOEdit.text == "Update [F7]" and not brnPOEdit.disable) { editPurcOrderValues(0);
        }
        if (event.controlDown == true and event.code == kr.back) {
            if (brnPOCancel.text == "Back [Ctrl+Left]") { back(); }
        }
        if (event.code == kr.reset and brnPOReset.text == "Reset [F4]") { resetPurcOrderValues(); }

        if (event.code == kr.rRow) {
            purchaseOrder.removeRow(); updateValues();
        }

        if (event.code == kr.cancel) {
            if (brnPOCancel.text == "Cancel [F8]") { panel.visible = false; CancelForm(); }
        }
    }

    function txtPOTotQtyOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function txtPOTotItmOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function txtPOAddressOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function txtPOTINNoOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function txtPODLNoOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function txtPOSuppCodeOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function txtPONoOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if (brnPOEdit.text == "Update [F7]") {
            getPONo(1);
            if (event.code == KeyCode.VK_DOWN) {
                listPurcOrder.requestFocus();
                listPurcOrder.selectFirstRow();
            }
            if (event.code == KeyCode.VK_ESCAPE) {
                listPurcOrder.visible = false;
            }
        }
    }

    function brnPOResetAction(): Void {
        resetPurcOrderValues();
    }

    function panel2OnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
    }

    function rectRemoveRowOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {

        purchaseOrder.removeRow(); updateValues();
    }

    function brnPOEditAction(): Void {
        edit();
    }

    public function edit(): Void {
        if (brnPOEdit.text == "Update [F7]") {
            editPurcOrderValues(0);
        } else {
            //getPrivileges();
            imageView5.visible = true;
            brnPOEdit.text = "Update [F7]";
            brnPOCancel.text = "Back [Ctrl+Left]";
            imgPOCancel.image = imageBack;
            resetPurcOrderValues();
            getAutoVal = "";
            txtPONo.editable = true;
            brnPOOrderLater.disable = true;
            txtPONo.requestFocus();
        }
    }

    function brnPOSaveOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER)
            brnPOSaveAction();
    }

    function Msgbox(type: String, Message: String): Void {
        panelAlert.visible = true;
        def MessageBox = MessageBox {};
        MessageBox.MsgBox("Medeil", type, Message);
        delete  panelAlert.content;
        insert MessageBox.getDesignRootNodes() into panelAlert.content;
    }

    function brnPOSaveAction(): Void {
        //        if (productInfo.getStatus().equals("Express")) {
        //            Msgbox("Information", "Please Upgrade to Standard Edition. ");
        //        } else {
        savePurchaseOrder(0);
    //        }
    }

    function imageViewOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if (not dateFlag) {
            if (txtPODate.text != null) {
                var dat = txtPODate.rawText.trim().split("-");
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1]) - 1;
                var y = Integer.parseInt(dat[2]);
                fxCalendar.set(y, m, d);
            } else {
                var dat = dutils.now("dd-MM-yyyy").split("-");
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

    function cboPOPaymentOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) { //purchaseOrder.focusSet();updateValues();

        }
        shortcut(event);
    }

    function cboPODeliverOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) { //cboPOPayment.requestFocus();
            purchaseOrder.focusSet(); updateValues();
        }
        shortcut(event);
    }

    function txtPONoOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        txtPOSuppName.style = mandatory;
        if (event.code == KeyCode.VK_ENTER) {
            listPurcOrder.visible = false;
            cboPODeliver.requestFocus();
        }
        shortcut(event);
    }

    function txtPOSuppnameOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        var n: Integer = 0;
        n = getSupplier(1); (event);
        sar = n;
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            if (n == 0 or txtPOSuppName.rawText.trim() == null or txtPOSuppName.rawText.trim() == "null") {
                txtPOSuppName.text = " ";
            }
        }
        if (event.code == KeyCode.VK_DOWN) {
            listPurcOrder.requestFocus();
            listPurcOrder.selectFirstRow();
        }
        if (event.code == KeyCode.VK_ESCAPE) {
            listPurcOrder.visible = false;
            if (n == 0 or txtPOSuppName.rawText.trim() == null or txtPOSuppName.rawText.trim() == "null") {
                n = 0; txtPOSuppName.text = "";
            }
        }
    }

    function txtPOSuppnameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        txtPOSuppName.style = mandatory;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB) {
            listPurcOrder.visible = false;
            if (sar == 0 or txtPOSuppName.rawText.trim() == null or txtPOSuppName.rawText.trim().length() == 0 or txtPOSuppName.rawText.trim() == "null") {
                txtPOSuppName.text = " ";
            }
            txtPONo.requestFocus();
        } else if (event.code == KeyCode.VK_DOWN) {
            listPurcOrder.requestFocus();
            listPurcOrder.selectFirstRow();
        } shortcut(event);
    }

    function txtPODateOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtPONo.requestFocus(); }
        shortcut(event);
    }

    public function getSupplier(type: Integer): Integer {
        var m: Integer = 0;
        try {
            var purcOrderCont: com.vanuston.medeil.implementation.PurchaseOrder = RegistryFactory.getClientStub(RegistryConstants.PurchaseOrder) as com.vanuston.medeil.implementation.PurchaseOrder;
            var listControlObj: ListController = new ListController();
            listLX = txtPOSuppName.layoutX;
            listLY = txtPOSuppName.layoutY + 20.0;
            listW = txtPOSuppName.width;
            listH = listControlObj.listPurchaseControlView(txtPOSuppName, listPurcOrder, "Distributor", type);
            var selStr: String = bind listControlObj.selectedString on replace {
                if (selStr.length() > 0) {
                    m = 5;
                    if (selStr != "New Distributor...") {
                        var supplierDetails: List = purcOrderCont.getSuplierDetailsForPO(selStr);
                        if (supplierDetails == null) { } else {
                            txtPOSuppName.text = selStr;
                            txtPOSuppCode.text = supplierDetails.get(0).toString();
                            txtPODLNo.text = supplierDetails.get(1).toString();
                            txtPOTINNo.text = supplierDetails.get(2).toString();
                            txtPOAddress.text = supplierDetails.get(3).toString();
                            listPurcOrder.visible = false;
                            txtPONo.requestFocus();
                        }
                    } else {
                        listPurcOrder.visible = false;
                        insertDist();
                    }
                } else {
                    m = 0;
                }
            }
        } catch (ex: Exception) {
            var ss = " Class : PurchaseOrderModule  Method : getSupplier    Exception : {ex.getMessage()}";
            log.debug(ss);
        }
        return m;
    }

    function insertDist(): Void {
        DistInfo.currentState.actual = DistInfo.currentState.findIndex("FromPurchase");
        panel.visible = false;
        panelDistributor.visible = true;
        DistInfo.checkState = 1;
        DistInfo.StartUp();
        delete  paneldist.content;
        insert DistInfo.getDesignRootNodes() into paneldist.content;
    }

    function checkValid(): Integer {
        var retVal = 0;
        if (txtPOSuppName.rawText.trim() == null or txtPOSuppName.rawText.trim() == "") {
            retVal = 1;
            FXinfo("Please Enter the Distributor Name.", txtPOSuppName);
            txtPOSuppName.requestFocus();
        } else if (txtPOTotItm.rawText.trim() == "0") {
            retVal = 1;
            FXinfo("Purchase Order Table is Empty Please Enter Values to Perform this Operation.");
            purchaseOrder.focusSet();
        }
        return retVal;
    }

    function savePurchaseOrder(flag: Integer): Void {
        try {
            var check = checkValid();
            var purcOrder = new PurchaseOrderModel();
            var returnObject = new Object();
            var msgReturnModel: MsgReturnModel = new MsgReturnModel();
            var purcOrderCont: com.vanuston.medeil.implementation.PurchaseOrder = RegistryFactory.getClientStub(RegistryConstants.PurchaseOrder) as com.vanuston.medeil.implementation.PurchaseOrder;
            if (check == 0) {
                var billDate = dutils.changeFormatDate(txtPODate.rawText.trim());
                purcOrder.setPurcOrderNo(txtPONo.rawText.trim());
                purcOrder.setPurcOrderDate(billDate);
                purcOrder.setPurcOrderDN(txtPOSuppName.rawText.trim());
                purcOrder.setPurcOrderDC(txtPOSuppCode.rawText.trim());
                purcOrder.setPurcOrderDA(txtPOAddress.rawText.trim());
                purcOrder.setPurcOrderDTY(cboPODeliver.selectedItem.toString());
                purcOrder.setPurcOrderTP(Integer.parseInt(txtPOTotItm.rawText.trim()));
                purcOrder.setPurcOrderTQ(Integer.parseInt(txtPOTotQty.rawText.trim()));
                purcOrder.setListofitems(purchaseOrder.getPurchaseOrderBill());
                purcOrder.setActionType("OrderNow");
                purcOrder.SetLogText(brnPOSave.text);
                purcOrder.setSearchString(brnPOEdit.text);
                var subSt = txtPONo.rawText.substring(0, 4);
                purcOrder.setSearchSubstr(subSt);
                //ControllerCall
                returnObject = purcOrderCont.createRecord(purcOrder);
                msgReturnModel = returnObject as MsgReturnModel;
                purchaseOrder.focusSet(msgReturnModel.getRowCount(), msgReturnModel.getColumnCount());
                if (msgReturnModel.getReturnMessage() == "0") {
                    FXalert(Integer.parseInt(msgReturnModel.getReturnMessage()));
                    if (flag == 0) {
                        delete  panelPONow.content;
                        def PurchaseOrderNow = PurchaseOrderNow {};
                        PurchaseOrderNow.visiblePO();
                        insert PurchaseOrderNow.getDesignRootNodes() into panelPONow.content;
                        PurchaseOrderNow.purLabel.text = txtPONo.rawText.trim();
                    }
                    if (chkOpenAsPDF.selected) {
                        ExportPO_PDF(purcOrder.getPurcOrderNo(), "purchase_order");
                    }
                    purcOrderCont.updateLog(purcOrder);
                    resetPurcOrderValues();
                } else {
                    FXinfo(msgReturnModel.getReturnMessage());
                }
            }
        } catch (ex: Exception) {
            var ss = " Class : PurchaseOrderModule  Method : savePurchaseOrder    Exception : {ex.getMessage()}";
            log.debug(ss);
        }
    }

    function savePurchaseOrderLater(): Void {
        try {
            var check = checkValid();
            var purcOrder = new PurchaseOrderModel();
            var returnObject = new Object();
            var msgReturnModel: MsgReturnModel = new MsgReturnModel();
            var purcOrderCont: com.vanuston.medeil.implementation.PurchaseOrder = RegistryFactory.getClientStub(RegistryConstants.PurchaseOrder) as com.vanuston.medeil.implementation.PurchaseOrder;
            if (check == 0) {
                if (chkOrderLater.selected == true) {
                    var purchaseOrdNo = commonController.getAutoIncrement(purcOrdBillDate, "PurchaseOrderLater");
                    var billDate = dutils.changeFormatDate(txtPODate.rawText.trim());
                    purcOrder.setPurcOrderNo(purchaseOrdNo);
                    purcOrder.setPurcOrderDate(billDate);
                    purcOrder.setPurcOrderDN(txtPOSuppName.rawText.trim());
                    purcOrder.setPurcOrderDC(txtPOSuppCode.rawText.trim());
                    purcOrder.setPurcOrderDA(txtPOAddress.rawText.trim());
                    purcOrder.setPurcOrderDTY(cboPODeliver.selectedItem.toString());
                    purcOrder.setPurcOrderTP(Integer.parseInt(txtPOTotItm.rawText.trim()));
                    purcOrder.setPurcOrderTQ(Integer.parseInt(txtPOTotQty.rawText.trim()));
                    purcOrder.setListofitems(purchaseOrder.getPurchaseOrderBill());
                    purcOrder.setActionType("Save");
                    purcOrder.SetLogText(brnPOOrderLater.text);
                    //ControllerCall
                    returnObject = purcOrderCont.createRecord(purcOrder);
                    msgReturnModel = returnObject as MsgReturnModel;
                    purchaseOrder.focusSet(msgReturnModel.getRowCount(), msgReturnModel.getColumnCount());
                    if (msgReturnModel.getReturnMessage() == "0") {
                        FXalert(Integer.parseInt(msgReturnModel.getReturnMessage()));
                        purcOrderCont.updateLog(purcOrder);
                        if (chkOpenAsPDF.selected) {
                            ExportPO_PDF(purcOrder.getPurcOrderNo(), "purchase_order_later");
                        }
                        resetPurcOrderValues();
                    } else {
                        FXinfo(msgReturnModel.getReturnMessage());
                    }
                } else {
                    savePurchaseOrder(1);
                }
            }
        } catch (ex: Exception) {
            var ss = " Class : PurchaseOrderModule  Method : savePurchaseOrderLater    Exception : {ex.getMessage()}";
            log.debug(ss);
        }
    }

    function ExportPO_PDF(purchaseOrdNo: String, tablename: String): Void {
        if (not new File("pdf/").exists()) {
            new File("pdf/").mkdirs();
        }
        var city: String = "";
        var address1: String = "";
        var shop_name: String = "";
        var state: String = "";
        var pincode: String = "";
        var contact_no1: String = "";
        var fax_no: String = "";
        var emailId: String = "";
        var shopDetails: List = commonController.getShopName();
        shop_name = shopDetails.get(0).toString();
        address1 = shopDetails.get(1).toString();
        city = shopDetails.get(2).toString();
        state = shopDetails.get(3).toString();
        pincode = shopDetails.get(4).toString();
        contact_no1 = shopDetails.get(5).toString();
        fax_no = shopDetails.get(6).toString();
        emailId = shopDetails.get(7).toString();
        var addre: String = address1.concat(", ").concat(city).concat(", ").concat(state).concat("  -   ").concat(pincode);
        var con_addres: String = "Tel : ".concat(contact_no1).concat("   Fax : ").concat(fax_no).concat("   Email : ").concat(emailId);
        var path: String = new File(".").getCanonicalFile().toString();
        var fileName = "{shop_name}_{purchaseOrdNo}_{dutils.now("dd-MM-yyyy")}.pdf";
        var fileStc: String = path.concat("\\pdf\\").concat(fileName);
        var pdf: PurchaseOrderPDF = new PurchaseOrderPDF();
        pdf.pdfCreator(path, fileName, shop_name, addre, con_addres, purchaseOrdNo, tablename);
        if (fileStc.trim().length() > 0 and fileStc != null) {
            Runtime.getRuntime().exec("rundll32 url.dll,FileProtocolHandler {fileStc}");
        }
    }

    function editPurcOrderValues(val: Integer): Void {
        try {
            var check = checkValid();
            var purcOrder = new PurchaseOrderModel();
            var returnObject = new Object();
            var msgReturnModel: MsgReturnModel = new MsgReturnModel();
            var purcOrderCont: com.vanuston.medeil.implementation.PurchaseOrder = RegistryFactory.getClientStub(RegistryConstants.PurchaseOrder) as com.vanuston.medeil.implementation.PurchaseOrder;
            if (check == 0) {
                var billDate = dutils.changeFormatDate(txtPODate.rawText.trim());
                purcOrder.setPurcOrderNo(txtPONo.rawText.trim());
                purcOrder.setPurcOrderDate(billDate);
                purcOrder.setPurcOrderDN(txtPOSuppName.rawText.trim());
                purcOrder.setPurcOrderDC(txtPOSuppCode.rawText.trim());
                purcOrder.setPurcOrderDA(txtPOAddress.rawText.trim());
                purcOrder.setPurcOrderDTY(cboPODeliver.selectedItem.toString());
                purcOrder.setPurcOrderTP(Integer.parseInt(txtPOTotItm.rawText.trim()));
                purcOrder.setPurcOrderTQ(Integer.parseInt(txtPOTotQty.rawText.trim()));
                purcOrder.setListofitems(purchaseOrder.getPurchaseOrderBill());
                purcOrder.SetLogText(brnPOEdit.text);
                var subSt = txtPONo.rawText.substring(0, 4);
                purcOrder.setSearchSubstr(subSt);
                purcOrder.setActionType("Update");
                
				// Controller Call
                returnObject = purcOrderCont.updateRecordVal(purcOrder);
                msgReturnModel = returnObject as MsgReturnModel;
                purchaseOrder.focusSet(msgReturnModel.getRowCount(), msgReturnModel.getColumnCount());
                if (msgReturnModel.getReturnMessage() == "1") {
                    var cn: ConfirmDialogBox = new ConfirmDialogBox(0, "Purchase Order");
                    var a = bind cn.staus;
                    if (a) {
                        returnObject = purcOrderCont.createRecord(purcOrder);
                        msgReturnModel = returnObject as MsgReturnModel;                        
                        if (msgReturnModel.getReturnMessage() == "0") {
                            if (val == 1) {
                                if (chkOpenAsPDF.selected) {
                                    ExportPO_PDF(purcOrder.getPurcOrderNo(), purcOrder.getTabName());
                                }
                            }
                            purcOrderCont.updateLog(purcOrder);
                            resetPurcOrderValues();
                            FXalert(4);
                            cn.staus = false;
                        }
                    }
                } else {
                    FXinfo(msgReturnModel.getReturnMessage());
                }
            }
        } catch (ex: Exception) {
            var ss = " Class : PurchaseOrderModule  Method : editPurcOrderValues    Exception : {ex.getMessage()}";
            log.debug(ss);
        }
    }

    function imageView5OnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        getPONo(0);
    }

    function getPONo(type: Integer): Void {
        if(not listPurcOrder.visible){
        try {
            var purcOrderCont: com.vanuston.medeil.implementation.PurchaseOrder = RegistryFactory.getClientStub(RegistryConstants.PurchaseOrder) as com.vanuston.medeil.implementation.PurchaseOrder;
            var listControlObj: ListController = new ListController();
            listLX = txtPONo.layoutX;
            listLY = txtPONo.layoutY + 20.0;
            listW = Type2TextboxW;
            listH = listControlObj.listPurchaseControlView(txtPONo, listPurcOrder, "PurchaseOrderBill", type);
            var selStr: String = bind listControlObj.selectedString on replace {
                if (selStr.length() > 0) {
                    var purcOrder1 = new Object();
                    var purcOrder: PurchaseOrderModel = new PurchaseOrderModel();
                    purcOrder.setPurcOrderNo(selStr);
                    purcOrder1 = purcOrderCont.viewRecord(purcOrder);
                    purcOrder = purcOrder1 as PurchaseOrderModel;
                    getAutoVal = selStr;
                    purcOrdBillDate = dutils.normalFormatDate(purcOrder.getPurcOrderDate());
                    var delv = purcOrder.getPurcOrderDTY();
                    if (delv.equalsIgnoreCase("Parcel Services")) {
                        cboPODeliver.select(0);
                    } else if (delv.equalsIgnoreCase("In Person")) {
                        cboPODeliver.select(1);
                    }
                    txtPOSuppName.text = purcOrder.getPurcOrderDN();
                    var supplierDetails: List = purcOrderCont.getSuplierDetailsForPO("{txtPOSuppName.rawText}");
                    txtPOSuppCode.text = supplierDetails.get(0).toString();
                    txtPODLNo.text = supplierDetails.get(1).toString();
                    txtPOTINNo.text = supplierDetails.get(2).toString();
                    txtPOAddress.text = supplierDetails.get(3).toString();
                    txtPOTotItm.text = purcOrder.getPurcOrderTP().toString();
                    txtPOTotQty.text = purcOrder.getPurcOrderTQ().toString();
                    purchaseOrder.LoadPurchaseOrderTable(purcOrder);
                    updateValues();
                }
            }
        } catch (ex: Exception) {
            var ss = " Class : PurchaseOrderModule  Method : getPONo    Exception : {ex.getMessage()}";
            log.debug(ss);
        }
      }
       else{
           listPurcOrder.visible=false;
           txtPONo.requestFocus();
       }
    }

    public function resetPurcOrderValues(): Void {
        listPurcOrder.visible = false;
        if (brnPOEdit.text == "Update [F7]") {
            txtPODate.requestFocus();
            getAutoVal = "";
        } else {
            txtPOSuppName.requestFocus();
            getAutoVal = commonController.getAutoIncrement(purcOrdBillDate, "PurchaseOrder");
        }
        purcOrdBillDate = dutils.now("dd-MM-yyyy");
        purchaseOrder.clearData();
        cboPODeliver.select(0);
        txtPOSuppName.text = "";
        txtPOSuppCode.text = "";
        txtPODLNo.text = "";
        txtPOTINNo.text = "";
        txtPOAddress.text = "";
        txtPOTotQty.text = "0";
        txtPOTotItm.text = "0";
        chkOpenAsPDF.selected = false;
        chkOrderLater.selected = false;
        brnPOSave.disable = false;
        updateValues();
    }

    var visit = bind fxCalendar.visible on replace {
        if (dateFlag and not visit) {
            purcOrdBillDate = fxCalendar.getSelectedDate();
            dateFlag = false;
            txtPOSuppName.requestFocus();
        }
    };

    function updateValues(): Void {
        for (i in [0..<5]) {
            updateIntValues();
        }
    }

    function updateIntValues(): Void {
        try {
            txtPOTotItm.text = "{purchaseOrder.totalItems()}";
            txtPOTotQty.text = "{purchaseOrder.total(4)}";
        } catch (e: Exception) {
            var msg: String = "Class : Purchase Order Method : updateValues()  = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function changeTableSize(i: Integer): Void {
        PurcOrdTable.getJComponent().setPreferredSize(new Dimension(i, TableH));
    }

    var rotateImage = bind listPurcOrder.visible on replace {
        if (not imgRotate) {
            if (rotateImage) {
            } else {
                imgSupplierName.rotate = 0.0;
                imgRotate = true;
            }
        }
    }
    var logUser = bind CommonDeclare.user on replace {
        getPrivileges(logUser); updateValues();
    }
    var changPiv = bind brnPOEdit.text on replace {
        getPrivileges(logUser); updateValues();
    }

    function getPrivileges(u: String): Void {
        var uname = u;
        var utype = commonController.getUserType(uname);

        if (utype.equals("User")) {
            var priv = commonController.getPrivileges("inventory", uname);
            var ss = priv.split(",");
            var val = Integer.parseInt(ss[0]);
            if (val == 1) {
                brnPOSave.disable = true;
                brnPOOrderLater.disable = true;
                if (brnPOEdit.text == "Update [F7]") {
                    brnPOEdit.disable = true;
                } else {
                    brnPOEdit.disable = false;
                }
            } else if (val == 2) {
                brnPOSave.disable = false;
                brnPOOrderLater.disable = false;
                brnPOEdit.disable = false;
            } else if (val == 3) {
                brnPOSave.disable = false;
                brnPOOrderLater.disable = false;
                brnPOEdit.disable = false;
            }
        } else {
            brnPOSave.disable = false;
            brnPOOrderLater.disable = false;
            brnPOEdit.disable = false;
        }
    }

    public function startUp(): Void {

        (poTable as javax.swing.JTable).addKeyListener(KeyAdapter {
            override public function keyReleased(e: java.awt.event.KeyEvent): Void {
                updateValues();
            }
            override public function keyTyped(e: java.awt.event.KeyEvent): Void {
                updateValues();
            }
        });
        (poTable as javax.swing.JTable).getSelectionModel().addListSelectionListener(javax.swing.event.ListSelectionListener {
            override public function valueChanged(e: javax.swing.event.ListSelectionEvent): Void {
                updateValues();
            }
        });
        panel.visible = true;
        panelDistributor.visible = false;
        panelPurchaseOrder.visible = true;
        txtPOSuppName.style = mandatory;
        PurcOrdTable.layoutX = 0;
        PurcOrdTable.layoutY = 0;
        resetPurcOrderValues();
        fxCalendar.visible = false;
        panel2.content = [fxCalendar,];
        panelPOTable.content = [PurcOrdTable,];
        getPrivileges(logUser); updateValues();

        if (productInfo.getStatus().equals("Express")) {
            chkOpenAsPDF.visible = false;
            chkOrderLater.visible = false;
        } else {
            chkOpenAsPDF.visible = true;
            chkOrderLater.visible = true;
        }
        txtPOSuppName.requestFocus();

    }

    public function CancelForm(): Void {
        panel.visible = false;
    }

}
