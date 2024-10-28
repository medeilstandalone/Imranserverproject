package com.vanuston.medeil.ui;

import java.lang.*;
import java.io.File;
import java.util.List;
import javafx.scene.control.*;
import javafx.geometry.HPos;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.util.SendSMS;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.PurchaseOrderPDF;
import com.vanuston.medeil.util.SendMail;
import com.vanuston.medeil.util.Validation;
import com.vanuston.medeil.util.KeyRegistry;
import com.vanuston.medeil.model.PurchaseOrderModel;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.uitables.ConfirmDialogBox;
import javafx.scene.input.KeyCode;

public class SendPurchaseOrder {
        
    var dutils = new DateUtils();
    var today = dutils.now("dd-MM-yyyy");
    var LY: Number[] = [25.0,];
    var LYlist: Number[] = [25.0,];
    var Height = 25;
    var RHeight = 0.0;
    var chk_delete: CheckBox[] = CheckBox {};
    var PO_Number: String[] = null;
    var Dist_Name: String[] = null;
    var Dist_Email: String[] = null;
    var dist_mobile: String[] = null;
    var rectbgheight = 0.0;
    var scrolliewHeight = 0.0;
    var lblview: Hyperlink[] = Hyperlink {};
    var lbledit: Hyperlink[] = Hyperlink {};
    var chkbox: CheckBox[] = CheckBox {};
    var chk_email: CheckBox[] = CheckBox {};
    var chk_sms: CheckBox[] = CheckBox {};
    var dist_mob: TextBox[] = TextBox {};
    var dist_email: TextBox[] = TextBox {};
    var lblItemCode: Label[] = Label {};
    var lblItemName: Label[] = Label {};
    var lblItemQty: Label[] = Label {};
    var rectpdtheight = 0.0;
    var rectpdtH = 0.0;
    var scrollpdtHeight = 0.0;
    var PO_needTosend: String[];
    var smsSend = 0;
    var way2SmsUserName = "";
    var way2SmsPwd = "";
    var one160by2UserName = "";
    var one160by2Pwd = "";
    var tot_po: Integer = 0;
    var tot_product: Integer = 0;
    var dir1 = new File(".");
    var path: String = dir1.getCanonicalFile().toString();
    var log: Logger = Logger.getLogger(SendPurchaseOrder.class, "Inventory");
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    def __layoutInfo_separator: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind TableViewW
    }
    public-read def separator: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: bind TableViewLX
        layoutY: 90.0
        layoutInfo: __layoutInfo_separator
    }
    
    public-read def chkDelete: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        layoutX: 5.0
        onMouseClicked: chkDeleteOnMouseClicked
        text: ""
    }
    
    def __layoutInfo_listCell0: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listcell0W
        height: 24.5
    }
    public-read def listCell0: javafx.scene.control.ListCell = javafx.scene.control.ListCell {
        visible: true
        layoutInfo: __layoutInfo_listCell0
        node: chkDelete
    }
    
    public-read def checkall: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        layoutY: 2.0
        onMouseClicked: checkallOnMouseClicked
        text: ""
    }
    
    public-read def checkSMS: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        layoutX: 0.0
        layoutY: 2.0
        onMouseClicked: checkSMSOnMouseClicked
        text: ""
    }
    
    public-read def checkEmail: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        layoutY: 2.0
        onMouseClicked: checkEmailOnMouseClicked
        text: ""
        graphicTextGap: 4.0
    }
    
    def __layoutInfo_scrollView: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind TableViewW
        height: bind scrolliewHeight
    }
    public-read def scrollView: javafx.scene.control.ScrollView = javafx.scene.control.ScrollView {
        layoutX: bind TableViewLX
        layoutY: 124.5
        layoutInfo: __layoutInfo_scrollView
        blocksMouse: true
        focusTraversable: false
        hbarPolicy: javafx.scene.control.ScrollBarPolicy.NEVER
        fitToHeight: false
        pannable: false
    }
    
    def __layoutInfo_scrollViewPdtList: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 500.0
        height: bind scrollpdtHeight
    }
    public-read def scrollViewPdtList: javafx.scene.control.ScrollView = javafx.scene.control.ScrollView {
        layoutY: 24.5
        layoutInfo: __layoutInfo_scrollViewPdtList
        styleClass: "scroll-view"
        hbarPolicy: javafx.scene.control.ScrollBarPolicy.NEVER
    }
    
    def __layoutInfo_btnlistclose: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 17.0
        height: 16.0
    }
    public-read def btnlistclose: javafx.scene.control.Button = javafx.scene.control.Button {
        cursor: javafx.scene.Cursor.DEFAULT
        layoutX: 480.0
        layoutY: 3.0
        layoutInfo: __layoutInfo_btnlistclose
        text: "X"
        action: btnlistcloseAction
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
    
    public-read def rectanglebg: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        layoutX: 0.0
        fill: javafx.scene.paint.Color.WHITE
        stroke: Violet
        strokeWidth: 0.0
        width: bind TableViewW
        height: bind rectbgheight
    }
    
    public-read def panelTableView: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutX: 0.0
        layoutY: 0.0
        content: [ rectanglebg, ]
    }
    
    public-read def linearGradient: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#ffffff") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#f5f0e9") }, ]
    }
    
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        opacity: 0.25
        styleClass: "rectFormHeader"
        fill: linearGradient
        strokeWidth: 2.0
        width: bind panelW
        height: 32.0
    }
    
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 1.0
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "form-background"
        fill: linearGradient
        stroke: Violet
        strokeWidth: 0.0
        width: bind panelW
        height: bind panelH
    }
    
    public-read def Arial_11: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
        size: 11.0
    }
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
    }
    
    public-read def Arial_Bold_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
    }
    
    def __layoutInfo_btnDelete: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 65.0
        height: 20.0
    }
    public-read def btnDelete: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind TableViewLX
        layoutY: bind RHeight+105.0
        layoutInfo: __layoutInfo_btnDelete
        text: "Delete"
        font: Arial_Bold_12
        action: btnDeleteAction
    }
    
    public-read def label12: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Quantity"
        font: Arial_Bold_12
        hpos: javafx.geometry.HPos.LEFT
        textFill: javafx.scene.paint.Color.WHITE
    }
    
    def __layoutInfo_listCellQty: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 100.0
    }
    public-read def listCellQty: javafx.scene.control.ListCell = javafx.scene.control.ListCell {
        layoutX: 400.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_listCellQty
        node: label12
    }
    
    def __layoutInfo_label11: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 0.0
    }
    public-read def label11: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_label11
        text: "Product Name"
        font: Arial_Bold_12
        hpos: javafx.geometry.HPos.LEFT
        textFill: javafx.scene.paint.Color.WHITE
    }
    
    def __layoutInfo_listCellProduct: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 300.0
    }
    public-read def listCellProduct: javafx.scene.control.ListCell = javafx.scene.control.ListCell {
        layoutX: 100.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_listCellProduct
        node: label11
    }
    
    public-read def label13: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Product ID"
        font: Arial_Bold_12
        hpos: javafx.geometry.HPos.LEFT
        textFill: javafx.scene.paint.Color.WHITE
    }
    
    def __layoutInfo_listCellPdtCode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 100.0
    }
    public-read def listCellPdtCode: javafx.scene.control.ListCell = javafx.scene.control.ListCell {
        layoutInfo: __layoutInfo_listCellPdtCode
        node: label13
    }
    
    public-read def panelPdtListHeader: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        cursor: javafx.scene.Cursor.MOVE
        layoutX: 0.0
        layoutY: 0.0
        content: [ listCellPdtCode, listCellProduct, listCellQty, btnlistclose, ]
    }
    
    public-read def labelEmail: javafx.scene.control.Label = javafx.scene.control.Label {
        graphic: checkEmail
        text: "Email"
        font: Arial_Bold_12
        hpos: javafx.geometry.HPos.CENTER
        graphicTextGap: -5.0
        textFill: javafx.scene.paint.Color.WHITE
    }
    
    def __layoutInfo_listCell10: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listcell10W
        height: 24.5
    }
    public-read def listCell10: javafx.scene.control.ListCell = javafx.scene.control.ListCell {
        layoutX: bind listcell10LX
        layoutInfo: __layoutInfo_listCell10
        node: labelEmail
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        graphic: checkSMS
        text: "SMS"
        font: Arial_Bold_12
        hpos: javafx.geometry.HPos.CENTER
        graphicTextGap: -4.0
        textFill: javafx.scene.paint.Color.WHITE
    }
    
    def __layoutInfo_listCell9: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listcell9W
        height: 24.5
    }
    public-read def listCell9: javafx.scene.control.ListCell = javafx.scene.control.ListCell {
        visible: true
        layoutX: bind listcell9LX
        layoutInfo: __layoutInfo_listCell9
        node: label9
    }
    
    public-read def label10: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Email ID"
        font: Arial_Bold_12
        textFill: javafx.scene.paint.Color.WHITE
    }
    
    def __layoutInfo_listCell8: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listcell8W
        height: 24.5
    }
    public-read def listCell8: javafx.scene.control.ListCell = javafx.scene.control.ListCell {
        layoutX: bind listcell8LX
        layoutInfo: __layoutInfo_listCell8
        node: label10
    }
    
    public-read def label15: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Mobile No."
        font: Arial_Bold_12
        textFill: javafx.scene.paint.Color.WHITE
    }
    
    def __layoutInfo_listCell7: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listcell7W
        height: 24.5
    }
    public-read def listCell7: javafx.scene.control.ListCell = javafx.scene.control.ListCell {
        layoutX: bind listcell7LX
        layoutInfo: __layoutInfo_listCell7
        node: label15
    }
    
    public-read def label6: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 20.0
        graphic: checkall
        text: "Order"
        font: Arial_Bold_12
        hpos: javafx.geometry.HPos.CENTER
        graphicHPos: javafx.geometry.HPos.LEFT
        graphicTextGap: -4.0
        textFill: javafx.scene.paint.Color.WHITE
    }
    
    def __layoutInfo_listCell6: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listcell6W
        height: 24.5
    }
    public-read def listCell6: javafx.scene.control.ListCell = javafx.scene.control.ListCell {
        layoutX: bind listcell6LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_listCell6
        node: label6
    }
    
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "View "
        font: Arial_Bold_12
        hpos: javafx.geometry.HPos.CENTER
        graphicHPos: javafx.geometry.HPos.CENTER
        textFill: javafx.scene.paint.Color.WHITE
    }
    
    def __layoutInfo_listCell4: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listcell4W
        height: 24.5
    }
    public-read def listCell4: javafx.scene.control.ListCell = javafx.scene.control.ListCell {
        layoutX: bind listcell4LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_listCell4
        node: label5
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Distributor name"
        font: Arial_Bold_12
        hpos: javafx.geometry.HPos.LEFT
        graphicHPos: javafx.geometry.HPos.CENTER
        textFill: javafx.scene.paint.Color.WHITE
    }
    
    def __layoutInfo_listCell3: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listcell3W
        height: 24.5
    }
    public-read def listCell3: javafx.scene.control.ListCell = javafx.scene.control.ListCell {
        visible: true
        layoutX: bind listcell3LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_listCell3
        node: label4
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "PO No."
        font: Arial_Bold_12
        hpos: javafx.geometry.HPos.CENTER
        textFill: javafx.scene.paint.Color.WHITE
    }
    
    def __layoutInfo_listCell2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listcell2W
        height: 24.5
    }
    public-read def listCell2: javafx.scene.control.ListCell = javafx.scene.control.ListCell {
        layoutX: bind listcell2LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_listCell2
        node: label3
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "S.No."
        font: Arial_Bold_12
        hpos: javafx.geometry.HPos.CENTER
        textFill: javafx.scene.paint.Color.WHITE
    }
    
    def __layoutInfo_listCell1: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listcell1W
        height: 24.5
    }
    public-read def listCell1: javafx.scene.control.ListCell = javafx.scene.control.ListCell {
        visible: true
        opacity: 1.0
        layoutX: bind listcell1LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_listCell1
        node: label2
    }
    
    public-read def panelTableHeader: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind TableViewLX
        layoutY: 100.0
        content: [ listCell0, listCell1, listCell2, listCell3, listCell4, listCell6, listCell7, listCell8, listCell9, listCell10, ]
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
    
    def __layoutInfo_btnCustRefresh: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 100.0
        height: 30.0
    }
    public-read def btnCustRefresh: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 419.0
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnCustRefresh
        onKeyPressed: btnCustRefreshOnKeyPressed
        effect: reflectionEffect
        text: "Reset [F5]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnCustEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 100.0
        height: 30.0
    }
    public-read def btnCustEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 279.0
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnCustEdit
        onKeyPressed: btnCustEditOnKeyPressed
        translateX: 0.0
        translateY: 0.0
        scaleX: 1.0
        scaleZ: 1.0
        effect: reflectionEffect
        text: "Edit  [F4]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
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
        text: "Send purchase orders - ctrl+H"
        font: Arial_25
        hpos: javafx.geometry.HPos.CENTER
    }
    
    public-read def DarkGray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.2
        blue: 0.2
    }
    
    public-read def rectanglepdtlist: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        styleClass: "form-background"
        fill: javafx.scene.paint.Color.WHITE
        stroke: DarkGray
        strokeWidth: 2.0
        width: 500.0
        height: bind rectpdtH
    }
    
    public-read def rectTableView: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        layoutX: bind TableViewLX
        layoutY: 100.0
        styleClass: "form-background"
        fill: javafx.scene.paint.Color.BLACK
        stroke: DarkGray
        strokeWidth: 2.0
        width: bind TableViewW
        height: bind RHeight
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.4
    }
    
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind TableViewLX
        layoutY: 65.0
        text: "PO\'s To Be Sent "
        font: Arial_18
        textFill: Green
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
    }
    
    public-read def Color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.9019608
        green: 0.94509804
        blue: 0.9019608
    }
    
    public-read def rectPdtListBg: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        styleClass: "form-background"
        fill: Color
        stroke: null
        strokeWidth: 0.0
        width: 500.0
        height: bind rectpdtheight
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def panelProductList: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutY: 0.0
        content: [ rectPdtListBg, ]
    }
    
    public-read def panelPdtList: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelLX
        layoutY: bind panelLY
        onMouseDragged: panelPdtListOnMouseDragged
        onMousePressed: panelPdtListOnMousePressed
        content: [ rectanglepdtlist, scrollViewPdtList, panelPdtListHeader, panelProductList, ]
    }
    
    public-read def imageEdit: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Edit.png"
    }
    
    public-read def imageViewAll: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/ViewAll.png"
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/MailSend.png"
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: image
        fitWidth: bind buttonImageW
        fitHeight: bind buttonImageH
    }
    
    def __layoutInfo_btnCustSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind buttonW
        height: bind buttonH
    }
    public-read def btnCustSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind button2LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_btnCustSave
        onKeyPressed: btnCustSaveOnKeyPressed
        translateX: 0.0
        effect: reflectionEffect
        graphic: imageView
        text: "Send"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
        action: btnCustSaveAction
    }
    
    public-read def image2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Cancel.png"
    }
    
    public-read def imageView2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: image2
        fitWidth: bind buttonImageW
        fitHeight: bind buttonImageH
    }
    
    def __layoutInfo_btnCustCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind buttonW
        height: bind buttonH
    }
    public-read def btnCustCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: true
        layoutX: bind button3LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_btnCustCancel
        onKeyPressed: btnCustCancelOnKeyPressed
        effect: reflectionEffect
        graphic: imageView2
        text: "Cancel [F8]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
        action: btnCustCancelAction
    }
    
    public-read def panelButtons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutY: bind panelButtonsLY
        content: [ btnCustEdit, btnCustSave, btnCustRefresh, btnCustCancel, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ rectangle, rectHeader, label, label7, separator, rectTableView, panelTableHeader, scrollView, panelTableView, panelButtons, panelPdtList, btnDelete, panelAlert, ]
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel, ]
    }
    // </editor-fold>//GEN-END:main

    function btnCustEditOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function btnCustRefreshOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function btnCustCancelOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if(event.code == KeyCode.VK_ENTER){
            btnCustCancelAction();
        }
        shortcut(event);
    }

    function btnCustSaveOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if(event.code == KeyCode.VK_ENTER){
            btnCustSaveAction();
        }
        shortcut(event);
    }

    var panelW = bind CommonDeclare.panelFormW;
    var panelH = bind CommonDeclare.panelFormH;
    var button1LX = bind CommonDeclare.botton31LX;
    var button2LX = bind CommonDeclare.botton2LX;
    var button3LX = bind CommonDeclare.botton3LX;
    var buttonImageW = bind CommonDeclare.bottonImageW;
    var buttonImageH = bind CommonDeclare.bottonImageH;
    var buttonW = bind CommonDeclare.bottonW;
    var buttonH = bind CommonDeclare.bottonH;
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var TableViewW = bind listcell10LX + listcell10W;
    var TableViewLX = bind (panelW - TableViewW - 4) / 2;
    var listcell0W = bind (1.905972046 * panelW) / 100;
    var listcell1W = bind (3.811944091 * panelW) / 100;
    var listcell2W = bind (11.43583227 * panelW) / 100;
    var listcell3W = bind ((21.60101652 * panelW) / 100);
    var listcell4W = bind (5.082592122 * panelW) / 100;
    var listcell5W = bind (5.082592122 * panelW) / 100;
    var listcell6W = bind (6.988564168 * panelW) / 100;
    var listcell7W = bind (10.16518424 * panelW) / 100;
    var listcell8W = bind (17.15374841 * panelW) / 100;
    var listcell9W = bind (6.988564168 * panelW) / 100;
    var listcell10W = bind (6.988564168 * panelW) / 100;
    var listcell1LX = bind listcell0W;
    var listcell2LX = bind listcell1LX + listcell1W;
    var listcell3LX = bind listcell2LX + listcell2W;
    var listcell4LX = bind listcell3LX + listcell3W;
    var listcell5LX = bind listcell4LX + listcell4W;
    var listcell6LX = bind listcell4LX + listcell4W;
    var listcell7LX = bind listcell6LX + listcell6W;
    var listcell8LX = bind listcell7LX + listcell7W;
    var listcell9LX = bind listcell8LX + listcell8W;
    var listcell10LX = bind listcell9LX + listcell9W;
    var panelStartLX: Number;
    var panelStartLY: Number;
    var panelLX: Number = 60.0;
    var panelLY: Number = (panelH - rectpdtH) / 2;
    def CustomAlert = CustomAlert {};
    def kr = KeyRegistry {};
    var key = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 3 and CommonDeclare.form[2] == 7) {
            shortcut(key);
        }
    }
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {
        if (event.controlDown or event.altDown or event.shiftDown) {
            kr.actionKey = event.code;
        }
        if (event.code == kr.cancel) {
            panel.visible = false;
            CancelForm();
        }
    }

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Send Purchase Order", type);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Send Purchase Order", msg);
        showAlertbox();
    }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Send Purchase Order", msg);
        showAlertbox();
        err_txtbox.requestFocus();
    }

    function btnCustCancelAction(): Void {
        panel.visible = false;
        CancelForm();
    }

    function btnDeleteAction(): Void {
        try {
            var j = 0;
            var purcOrderCont: com.vanuston.medeil.implementation.PurchaseOrder = RegistryFactory.getClientStub(RegistryConstants.PurchaseOrder) as com.vanuston.medeil.implementation.PurchaseOrder;
            var purcOrMod = new PurchaseOrderModel();
            for (i in [0..tot_po - 1]) {
                if (chk_delete[i].selected == true) {
                    j = 1;
                }
            }
            if (j == 0) {
                FXinfo("Please Select a Purchase Order to Delete");
            } else {
                var cn: ConfirmDialogBox = new ConfirmDialogBox(1, "SendPurchaseOrder");
                var a = bind cn.staus;
                if (a) {
                    for (i in [0..tot_po - 1]) {
                        if (chk_delete[i].selected == true) {
                            purcOrMod.setPurcOrderNo(PO_Number[i]);
                            purcOrderCont.updateSendPurcOrderTable(purcOrMod);
                            cn.staus = false;
                        }
                    }
                    startUp();
                }
            }
        } catch(e: Exception){
            var msg: String = "Class : Send Purchase Order  Method : btnDeleteAction()  = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function checkEmailOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if (checkEmail.selected) {
            for (i in [0..tot_po]) {
                chk_email[i].selected = true;
            }
        } else {
            for (i in [0..tot_po]) {
                chk_email[i].selected = false;
            }
        }
    }

    function checkSMSOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if (checkSMS.selected) {
            for (i in [0..tot_po]) {
                chk_sms[i].selected = true;
            }
        } else {
            for (i in [0..tot_po]) {
                chk_sms[i].selected = false;
            }
        }

    }

    function chkDeleteOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if (chkDelete.selected) {
            for (i in [0..tot_po]) {
                chk_delete[i].selected = true;
            }
        } else {
            for (i in [0..tot_po]) {
                chk_delete[i].selected = false;
            }
        }
    }

    function panelPdtListOnMouseDragged(e: javafx.scene.input.MouseEvent): Void {
        panelLX = e.screenX - panelStartLX;
        panelLY = e.screenY - panelStartLY;
    }

    function panelPdtListOnMousePressed(e: javafx.scene.input.MouseEvent): Void {
        panelStartLX = e.screenX - panelLX;
        panelStartLY = e.screenY - panelLY;
    }

    function btnlistcloseAction(): Void {
        panelPdtList.visible = false;
    }

    function checkallOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if (checkall.selected) {
            for (i in [0..tot_po]) {
                chkbox[i].selected = true;
            }
        } else {
            for (i in [0..tot_po]) {
                chkbox[i].selected = false;
            }
        }
    }

    function btnValid(): Integer {
        var jn: Integer = 2;
        try {
            var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
            var settingCon: List = commonController.getSettingConfig();
            smsSend = Integer.parseInt(settingCon.get(2).toString());
            way2SmsUserName = settingCon.get(3).toString();
            way2SmsPwd = settingCon.get(4).toString();
            one160by2UserName = settingCon.get(5).toString();
            one160by2Pwd = settingCon.get(6).toString();        
            var lenPO: Integer = 0;
            for (i in [0..tot_po - 1]) {
                if (chkbox[i].selected == true) {
                    var porno: String = "";
                    porno = PO_Number[i];
                    if (chk_sms[i].selected == true or chk_email[i].selected == true) {
                        if (chk_sms[i].selected == true) {
                            var mobile: String = "";
                            mobile = dist_mob[i].rawText.trim();
                            mobile = mobile.trim();
                            if (mobile == null or mobile == "" or mobile.trim().length() != 10) {
                                jn = 1;
                                FXinfo("Please Enter correct Mobile No", dist_mob[i]);
                                break;
                            } else if (smsSend != 0 and (one160by2UserName == null or one160by2UserName == "" or one160by2UserName.trim().length() != 10)) {
                                jn = 1;
                                FXinfo("Invalid Vanuston SMS Server 2 User Name");
                                break;
                            } else if (smsSend != 0 and (one160by2Pwd == null or one160by2Pwd == "")) {
                                jn = 1;
                                FXinfo("Invalid Vanuston SMS Server 2  Password");
                                break;
                            } else if (smsSend == 0 and (way2SmsUserName == null or way2SmsUserName == "" or way2SmsUserName.trim().length() != 10)) {
                                jn = 1;
                                FXinfo("Invalid Vanuston SMS Server 1 User Name");
                                break;
                            } else if (smsSend == 0 and (way2SmsPwd == null or way2SmsPwd == "")) {
                                jn = 1;
                                FXinfo("Invalid Vanuston SMS Server 1 Password");
                                break;
                            } else {
                                jn = 0;
                            }
                        }
                        if (chk_email[i].selected == true) {
                            var email_box_id: String = "";
                            email_box_id = dist_email[i].rawText.trim();
                            var val: Validation = new Validation();
                            var em: Integer = 0; em = val.getEmailIdValid(email_box_id, 4, 50);
                            if (email_box_id == null or email_box_id == "") {
                                jn = 1;
                                FXinfo("Please Enter Valid E-Mail Id", dist_email[i]);
                                break;
                            } else if (em != 10) {
                                jn = 1;
                                FXinfo("Please Enter Valid E-Mail Id", dist_email[i]);
                                break;
                            } else {
                                jn = 0;
                            }
                        }
                    } else {
                        jn = 1;
                        FXinfo("Please Select the SMS or EMail to Send the Corresponding Purchase Order.");
                        break;
                    }
                } else {
                }
                insert PO_Number[i] into PO_needTosend;
                lenPO++;
            }
        } catch (e: Exception) {
            var msg: String = "Class : Send Purchase Order  Method : btnValid()   = {e.getMessage()}";
            log.debug(msg);
        }
        return jn;
    }

    function btnCustSaveAction(): Void {
        var sentSms = new SendSMS();
        try {
            var purcOrderCont: com.vanuston.medeil.implementation.PurchaseOrder = RegistryFactory.getClientStub(RegistryConstants.PurchaseOrder) as com.vanuston.medeil.implementation.PurchaseOrder;
            var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
            var enSMS: Integer = 0; enSMS = purcOrderCont.getCheckPurchaseOrderSMS();
            var enEmail: Integer = 0; enEmail = purcOrderCont.getCheckPurchaseOrderEMail();
            if (enSMS == 0) {
                FXinfo("Please Enable Send PurchaseOrder in settings");
            } else {
                if (btnValid() == 0) {
                    PO_needTosend = null;
                    var address1: String = "";
                    var shop_name: String = "";
                    var city: String = "";
                    var state: String = "";
                    var pincode: String = "";
                    var contact_no1: String = "";
                    var fax_no: String = "";
                    var emailId: String = "";
                    var pwd: String = "";
                    try {
                        var shopDetails: List = commonController.getShopName();
                        shop_name = shopDetails.get(0).toString();
                        address1 = shopDetails.get(1).toString();
                        city = shopDetails.get(2).toString();
                        state = shopDetails.get(3).toString();
                        pincode = shopDetails.get(4).toString();
                        contact_no1 = shopDetails.get(5).toString();
                        fax_no = shopDetails.get(6).toString();
                        emailId = shopDetails.get(7).toString();

                        var settingCon: List = commonController.getSettingConfig();
                        emailId = settingCon.get(0).toString();
                        pwd = settingCon.get(1).toString();
                        smsSend = Integer.parseInt(settingCon.get(2).toString());
                        way2SmsUserName = settingCon.get(3).toString();
                        way2SmsPwd = settingCon.get(4).toString();
                        one160by2UserName = settingCon.get(5).toString();
                        one160by2Pwd = settingCon.get(6).toString();
                    } catch (e: Exception) {
                        var msg: String = "Class : Send Purchase Order  Method : btnCustSaveAction()  = {e.getMessage()}";
                        log.debug(msg);
                    }
                    var lenPO: Integer = 0;;
                    var sm: Integer = 0;
                    for (i in [0..tot_po - 1]) {
                        if (chk_sms[i].selected == true and (enSMS == 2 or enSMS == 0)) {
                            FXinfo("Please Enable Send PurchaseOrder by SMS option in settings");
                        } else if (chk_email[i].selected == true and (enEmail == 2 or enEmail == 0)) {
                            FXinfo("Please Enable Send PurchaseOrder by Email option in settings");
                        } else if (chkbox[i].selected == true) {
                            try {
                                var porno: String = "";
                                porno = PO_Number[i];
                                if (chk_sms[i].selected == true) {
                                    var mobile: String = "";
                                    mobile = dist_mob[i].rawText.trim();
                                    mobile = mobile.trim();
                                    var item_name: String = "";
                                    var qty: String = "";
                                    var mfg_name: String = "";
                                    var msg: String = "";
                                    var dist_code: String = "";
                                    var str: String = "";
                                    msg = shop_name.concat("  -  ");
                                    msg = msg.concat(address1).concat(",  ").concat(city).concat("  ");
                                    var purcDetails = purcOrderCont.getSendPurcOrderTablePDF(porno);
                                    var pModel: PurchaseOrderModel;
                                    for (index in [0..<purcDetails.size()]) {
                                        pModel = new PurchaseOrderModel();
                                        pModel = purcDetails.get(index);
                                        dist_code = pModel.getPurcOrderDC();
                                        item_name = pModel.getPurcOrderIN();
                                        qty = String.valueOf(pModel.getPurcOrderQty());
                                        mfg_name = pModel.getPurcOrderDos();
                                        str = String.valueOf(index + 1);
                                        msg = msg.concat(str).concat(" . ").concat(item_name).concat("  -  ").concat(mfg_name).concat("  -  ").concat(qty).concat("  ");
                                    }
                                    msg = msg.replaceAll("#", " ");
                                    if (msg != null and msg.trim().length() > 0) {
                                        msg = msg.trim();
                                        var len = msg.trim().length();
                                        if (len > 135) {
                                            var mesgArr: String[] = sentSms.spiltMsg(msg, 135);
                                            var msgLen: Integer = mesgArr.size();
                                            for (m in [0..<msgLen]) {
                                                var smsm: String = mesgArr[m];
                                                if (smsSend == 0) {

                                                    sentSms.setPage("http://www.pharmastute.com/sms/SendSMS.php?acc=way2sms&uid={way2SmsUserName}&pwd={way2SmsPwd}&mob={mobile}&msg={smsm}");

                                                } else {
                                                    sentSms.setPage("http://www.pharmastute.com/sms/SendSMS.php?acc=160by2&uid={one160by2UserName}&pwd={one160by2Pwd}&mob={mobile}&msg={smsm}");
                                                }
                                            }
                                        } else {
                                            if (smsSend == 0) {
                                                sentSms.setPage("http://www.pharmastute.com/sms/SendSMS.php?acc=way2sms&uid={way2SmsUserName}&pwd={way2SmsPwd}&mob={mobile}&msg={msg}");

                                            } else {
                                                sentSms.setPage("http://www.pharmastute.com/sms/SendSMS.php?acc=160by2&uid={one160by2UserName}&pwd={one160by2Pwd}&mob={mobile}&msg={msg}");
                                            }
                                        }
                                    }
                                    sm = 1;
                                }
                                if (chk_email[i].selected == true) {
                                    var email_box_id: String = "";
                                    email_box_id = dist_email[i].rawText.trim();
                                    var val: Validation = new Validation();
                                    var em: Integer = 0; em = val.getEmailIdValid(email_box_id, 4, 50);
                                    var purcOrMod = new PurchaseOrderModel();
                                    purcOrMod.setPurcOrderNo(porno);
                                    purcOrderCont.updateSendPurcOrderTable(purcOrMod);
                                    if (not new File("pdf/").exists()) {
                                        new File("pdf/").mkdirs();
                                    }
                                    if (not new File("html/").exists()) {
                                        new File("html/").mkdirs();
                                    }
                                    var fileStc: String = "";
                                    var filePdf: String = "";

                                    var pdfFileName: String = "";

                                    var addre: String = address1.concat(", ").concat(city).concat(", ").concat(state).concat("  -   ").concat(pincode);
                                    var con_addres: String = "Tel : ".concat(contact_no1).concat("   Fax : ").concat(fax_no).concat("   Email : ").concat(emailId);
                                    var fileN: String = "";
                                    var pdf: PurchaseOrderPDF = new PurchaseOrderPDF();
                                    var fileName: String = "";

                                    var shpN: String = shop_name.replaceAll(" ", "");
                                    shpN = shpN.trim();

                                    fileName = shpN.concat(porno).concat(today).concat(".pdf");
                                    fileStc = path.concat("\\pdf\\").concat(fileName);
                                    filePdf = path.concat("/pdf/");
                                    pdfFileName = fileName;
                                    fileN = fileName;
                                    pdf.pdfCreator(path, fileName, shop_name, addre, con_addres, porno, "purchase_order_later");

                                    var item_name: String = "";
                                    var qty: String = "";
                                    var mfg_name: String = "";
                                    var msg: String = "";
                                    var dist_code: String = "";
                                    var str: String = "";
                                    msg = shop_name.concat("  -  ");
                                    msg = msg.concat(address1).concat(",  ").concat(city).concat("\n");
                                    var purcDetails = purcOrderCont.getSendPurcOrderTablePDF(porno);
                                    var pModel: PurchaseOrderModel;
                                    for (index in [0..<purcDetails.size()]) {
                                        pModel = new PurchaseOrderModel();
                                        pModel = purcDetails.get(index);
                                        dist_code = pModel.getPurcOrderDC();
                                        item_name = pModel.getPurcOrderIN();
                                        qty = String.valueOf(pModel.getPurcOrderQty());
                                        mfg_name = pModel.getPurcOrderDos();
                                        str = String.valueOf(index + 1);
                                        msg = msg.concat(str).concat(" . ").concat(item_name).concat("  -  ").concat(mfg_name).concat("  -  ").concat(qty).concat("\n");
                                    }
                                    var filePath: String = "";
                                    filePath = filePdf.replaceAll("\\\\", "/");
                                    var distemail: String[] = email_box_id;
                                    var ss: SendMail = new SendMail(emailId, pwd, distemail, "Purchase Order ", msg, filePath, pdfFileName, "pdf");
                                    sm = 1;
                                }
                            } catch (e: Exception) {
                                var msg: String = "Class : Send Purchase Order  Method : btnCustSaveAction()   = {e.getMessage()}";
                                log.debug(msg);
                                break;
                            }
                        } else {
                        }
                        insert PO_Number[i] into PO_needTosend;
                        lenPO++;
                        if (sm == 1) {
                            FXinfo("Message Sent successfully");
                            if (lenPO == tot_po) {
                                startUp();
                            }
                        }
                    }
                } else if (btnValid() == 2) {
                    FXinfo("Please Select the Order Checkbox to Send the Corresponding Purchase Order.");                    
                }
            }
        } catch (e: Exception) {
        }
    }

    public function viewpdtlist(po_Num: String): Void {
        try {
            var purcOrderCont: com.vanuston.medeil.implementation.PurchaseOrder = RegistryFactory.getClientStub(RegistryConstants.PurchaseOrder) as com.vanuston.medeil.implementation.PurchaseOrder;
            var Pdt_Name: String[] = null;
            var Pdt_Code: String[] = null;
            var Pdt_Qty: String[] = null;

            tot_product = 0;
            var purcDetails = purcOrderCont.viewSendPurcOrderTable(po_Num);
            var pModel: PurchaseOrderModel;
            for (index in [0..<purcDetails.size()]) {
                pModel = new PurchaseOrderModel();
                pModel = purcDetails.get(index);

                if (tot_product == 0) { LYlist = [25.0];
                } else {
                    insert (LYlist[tot_product - 1] + 25.0) into LYlist;
                }
                insert pModel.getPurcOrderIN() into Pdt_Name;
                insert pModel.getPurcOrderIC() into Pdt_Code;
                insert String.valueOf(pModel.getPurcOrderQty()) into Pdt_Qty;
                tot_product++;
            }
            lblItemCode = for (i in [0..tot_product - 1])
                        Label {
                            width: 100.0
                            height: Height
                            layoutX: 20.0
                            layoutY: LYlist[i]
                            text: Pdt_Code[i]
                            font: bind Arial_12
                            hpos: javafx.geometry.HPos.LEFT
                        }
            lblItemName = for (i in [0..tot_product - 1])
                        Label {
                            width: 300.0
                            height: Height
                            layoutX: 110.0
                            layoutY: LYlist[i]
                            text: Pdt_Name[i]
                            font: bind Arial_12
                            hpos: javafx.geometry.HPos.LEFT
                        }
            lblItemQty = for (i in [0..tot_product - 1])
                        Label {
                            width: 100.0
                            height: Height
                            layoutX: 400.0
                            layoutY: LYlist[i]
                            text: Pdt_Qty[i]
                            font: bind Arial_12
                            hpos: javafx.geometry.HPos.LEFT
                        }

            rectpdtheight = LYlist[tot_product - 1] + 24.5;
            rectpdtH = rectpdtheight + 24.5;
            scrollpdtHeight = rectpdtheight;
            if (scrollpdtHeight > 375) {
                scrollpdtHeight = 375.0;
                rectpdtH = 400;
            }
            panelProductList.content = [rectPdtListBg, lblItemCode, lblItemName, lblItemQty,];
            scrollViewPdtList.node = panelProductList;

        } catch (e: Exception) {
            var msg: String = "Class : Send Purchase Order  Method : viewPdfList()  = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function getPrivileges(u: String): Void {
        var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
        var uname = u;
        var utype = commonController.getUserType(uname);
        if (utype.equals("User")) {
            var priv = commonController.getPrivileges("inventory", uname);
            var ss = priv.split(",");
            var val = Integer.parseInt(ss[6]);
            if (val == 1) {
                btnCustSave.disable = true;
            } else if (val == 2) {
                btnCustSave.disable = false;
            } else if (val == 3) {
                btnCustSave.disable = false;
            }
        } else {
            btnCustSave.disable = false;
        }
    }

    var logUser: String = bind CommonDeclare.user on replace {
        getPrivileges(logUser);
    }

    public function startUp(): Void {
        today = dutils.now("dd-MM-yyyy");
        LY = [25.0,];
        LYlist = [25.0,];
        Height = 25;
        RHeight = 0.0;
        PO_Number = null;
        Dist_Name = null;
        Dist_Email = null;
        dist_mobile = null;
        rectbgheight = 0.0;
        scrolliewHeight = 0.0;
        lblview = Hyperlink {};
        lbledit = Hyperlink {};
        chkbox = CheckBox {};
        chk_email = CheckBox {};
        chk_sms = CheckBox {};
        dist_mob = TextBox {};
        dist_email = TextBox {};
        lblItemCode = Label {};
        lblItemName = Label {};
        lblItemQty = Label {};
        rectpdtheight = 0.0;
        rectpdtH = 0.0;
        scrollpdtHeight = 0.0;
        smsSend = 0;
        way2SmsUserName = "";
        way2SmsPwd = "";
        one160by2UserName = "";
        one160by2Pwd = "";
        getPrivileges(logUser);
        panel.visible = true;
        tot_po = 0;
        PO_Number = null;
        Dist_Name = null;
        Dist_Email = null;
        dist_mobile = null;
        chkbox = null;

        try {
            var purcOrderCont: com.vanuston.medeil.implementation.PurchaseOrder = RegistryFactory.getClientStub(RegistryConstants.PurchaseOrder) as com.vanuston.medeil.implementation.PurchaseOrder;
            var purcDetails = purcOrderCont.loadSendPurcOrderTable();
            var pModel: PurchaseOrderModel;
            for (index in [0..<purcDetails.size()]) {
                pModel = new PurchaseOrderModel();
                pModel = purcDetails.get(index);
                if (tot_po == 0) {
                    LY = [25.0];
                } else {
                    insert (LY[tot_po - 1] + 25.0) into LY;
                }
                insert pModel.getPurcOrderNo() into PO_Number;
                insert pModel.getPurcOrderDA() into Dist_Name;

                var mob: String = ""; mob = pModel.getPurcOrderIN();
                if (mob != null and mob.trim().length() > 0) {
                    mob = pModel.getPurcOrderIN();
                } else {
                    mob = "";
                }
                var email: String = ""; email = pModel.getPurcOrderDos();
                if (email != null and email.trim().length() > 0) {
                    email = pModel.getPurcOrderDos();
                } else {
                    email = "";
                }

                insert mob into dist_mobile;
                insert email into Dist_Email;
                tot_po++;
            }
            chk_delete = for (i in [0..tot_po - 1])
                        CheckBox {
                            width: 80.0
                            height: 20.0
                            layoutX: 5.0;
                            layoutY: LY[i]
                            text: ""
                            font: null
                            hpos: javafx.geometry.HPos.CENTER
                            onKeyPressed: function(event: javafx.scene.input.KeyEvent): Void {
                            }
                        }
            var sno = for (i in [0..tot_po - 1])
                        Label {
                            layoutX: bind listcell1LX;
                            layoutY: LY[i]
                            width: bind listcell1W;
                            height: Height
                            text: "{i + 1}"
                            font: Arial_11
                            hpos: HPos.CENTER
                            textAlignment: javafx.scene.text.TextAlignment.CENTER
                            onKeyPressed: function(event: javafx.scene.input.KeyEvent): Void {
                                shortcut(event);
                            }
                        }
            var po_no = for (i in [0..tot_po - 1])
                        Label {
                            layoutX: bind listcell2LX;
                            layoutY: LY[i]
                            width: bind listcell2W;
                            height: Height
                            text: "{PO_Number[i]}"
                            font: Arial_11
                            hpos: HPos.CENTER
                            onKeyPressed: function(event: javafx.scene.input.KeyEvent): Void {
                                shortcut(event);
                            }
                        }
            var dist_name = for (i in [0..tot_po - 1])
                        Label {
                            layoutX: bind listcell3LX;
                            layoutY: LY[i]
                            width: bind listcell3W;
                            height: Height
                            text: "{Dist_Name[i]}"
                            font: Arial_11
                            textAlignment: javafx.scene.text.TextAlignment.CENTER
                            hpos: HPos.LEFT
                            onKeyPressed: function(event: javafx.scene.input.KeyEvent): Void {
                                shortcut(event);
                            }
                        }

            lblview = for (i in [0..tot_po - 1])
                        Hyperlink {
                            width: bind listcell4W;
                            height: Height
                            layoutX: bind listcell4LX;
                            layoutY: LY[i]
                            text: "View"
                            font: bind Arial_Bold_12
                            hpos: javafx.geometry.HPos.CENTER
                            onMouseClicked: function(event: javafx.scene.input.MouseEvent): Void {
                                try {
                                    panelPdtList.visible = true;
                                    panelLY = (panelH - rectpdtH) / 2;
                                    viewpdtlist(po_no[i].text);
                                } catch (e) {
                                }
                            }
                            onKeyPressed: function(event: javafx.scene.input.KeyEvent): Void {
                                shortcut(event);
                            }
                        }

            chkbox = for (i in [0..tot_po - 1])
                        CheckBox {
                            width: 80.0
                            height: 20.0
                            layoutX: bind listcell6LX + (2.811944091 * panelW / 100);
                            layoutY: LY[i]
                            text: ""
                            font: null
                            hpos: javafx.geometry.HPos.CENTER
                            onKeyPressed: function(event: javafx.scene.input.KeyEvent): Void {
                                shortcut(event);
                            }
                        }
            dist_mob = for (i in [0..tot_po - 1])
                        TextBox {
                            layoutX: bind listcell7LX;
                            layoutY: LY[i]
                            width: bind listcell7W;
                            text: "{dist_mobile[i]}"
                            font: Arial_11
                            onKeyPressed: function(event: javafx.scene.input.KeyEvent): Void {
                                shortcut(event);
                            }
                        }
            dist_email = for (i in [0..tot_po - 1])
                        TextBox {
                            layoutX: bind listcell8LX;
                            layoutY: LY[i]
                            width: bind listcell8W;
                            text: "{Dist_Email[i]}"
                            font: Arial_11

                            onKeyPressed: function(event: javafx.scene.input.KeyEvent): Void {
                                shortcut(event);
                            }
                        }
            chk_sms = for (i in [0..tot_po - 1])
                        CheckBox {
                            width: 80.0
                            height: 20.0
                            layoutX: bind listcell9LX + (2.811944091 * panelW / 100);
                            layoutY: LY[i]
                            text: ""
                            font: null
                            hpos: javafx.geometry.HPos.CENTER
                            onKeyPressed: function(event: javafx.scene.input.KeyEvent): Void {
                                shortcut(event);
                            }
                        }
            chk_email = for (i in [0..tot_po - 1])
                        CheckBox {
                            width: 80.0
                            height: 20.0
                            layoutX: bind listcell10LX + (2.811944091 * panelW / 100);
                            layoutY: LY[i]
                            text: ""
                            font: null
                            hpos: javafx.geometry.HPos.CENTER
                            onKeyPressed: function(event: javafx.scene.input.KeyEvent): Void {
                                shortcut(event);
                            }
                        }

            rectbgheight = LY[tot_po - 1] + 25;
            RHeight = rectbgheight + 30;
            scrolliewHeight = rectbgheight + 2.5;
            if (scrolliewHeight > 345) {
                scrolliewHeight = 345.0;
                RHeight = 370;
            }
            delete  panelTableView.content;
            panelTableView.content = [rectanglebg, chk_delete, sno, po_no, dist_name, lblview, lbledit, chkbox, dist_mob, dist_email, chk_sms, chk_email,];
            scrollView.node = panelTableView;
            panelPdtList.visible = false;
        } catch (e: Exception) {
            var msg: String = "Class : Send Purchase Order  Method : StartUp()   = {e.getMessage()}";
            log.debug(msg);
            
        }
    }

    public function CancelForm(): Void {
        CommonDeclare.form[2] = 0;
        today = null;
        LY = null;
        LYlist = null;
        PO_Number = null;
        Dist_Name = null;
        Dist_Email = null;
        dist_mobile = null;
        lblview = null;
        lbledit = null;
        chkbox = null;
        chk_email = null;
        chk_sms = null;
        dist_mob = null;
        dist_email = null;
        lblItemCode = null;
        lblItemName = null;
        lblItemQty = null;
        way2SmsUserName = null;
        way2SmsPwd = null;
        one160by2UserName = null;
        one160by2Pwd = null;
    }

}

