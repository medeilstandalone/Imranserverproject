package com.vanuston.medeil.ui;

import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.ui.calendar.theme.Theme;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import java.awt.Dimension;
import javafx.scene.control.Label;
import javafx.scene.control.TextBox;
import javafx.scene.text.Font;
import javafx.scene.paint.Color;
import javafx.scene.shape.Rectangle;
import javafx.ext.swing.SwingComponent;
import javafx.scene.input.KeyEvent;
import javafx.scene.input.KeyCode;
import javafx.scene.layout.LayoutInfo;
import javafx.scene.image.Image;
import com.vanuston.medeil.uitables.TableDamageHelper;
import com.vanuston.medeil.util.Value;
import java.lang.Exception;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.KeyRegistry;
import java.awt.event.KeyAdapter;
import com.vanuston.medeil.model.DamageStockModel;
import com.vanuston.medeil.implementation.CommonImplements;
import java.util.ArrayList;
import java.util.List;
import javafx.scene.input.MouseEvent;
import java.awt.event.MouseAdapter;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.uitables.ConfirmDialogBox;

var log: Logger = Logger.getLogger(DamageStock.class, "Inventory");

public class DamageStock {
    var listD = 0.0;
    var dateFlag: Boolean = false;
    var rowNo = 0;
//    var colWidth: Integer[] = [40, 100, 50, 100, 82, 50, 50, 60, 70, 110, 70,50];
//    var colNames: Object[] = ["S.No.", "Product Name", "Batch No.", "Purchased Date", "Purchased Qty.", "Damaged Qty.", "VAT %", "Disc %", "Unit Price", " Total Amount", "Remarks","All"];
//    var colType: Class[] = [java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.String.class,
//                java.lang.Integer.class, java.lang.Integer.class, java.lang.Double.class, java.lang.Double.class, java.lang.Double.class, java.lang.Double.class, java.lang.String.class,java.lang.Boolean.class];
//    var colEditable: Boolean[] = [false, false, false, false, false, true, true, true, false, true, true, true];
    var fxCalendar = FXCalendar {
                theme: Theme {};
            };   
    var panelW = bind CommonDeclare.panelFormW on replace {
        listDamageStk.visible = false;
        lstDamageItems.visible = false;
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
    var buttonLY = 0.0;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    var bottonW = bind CommonDeclare.bottonW + 15;
    var bottonH = bind CommonDeclare.bottonH;
    var CancelW = bottonW + 10;
    var rectbutton1LX = bind CommonDeclare.rectbutton1LX;
    var rectbutton2LX = bind CommonDeclare.rectbutton2LX;
    var rectbuttonLY = bind CommonDeclare.rectbuttonLY;
    var seperatorW = bind CommonDeclare.seperatorW;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;
    var Type4TextboxW = bind CommonDeclare.Type4TextboxW + 30;
    var Type5TextboxW = bind CommonDeclare.Type4TextboxW;
    var ImageCalenderLX = bind C4LX + Type3TextboxW + 2;
    var panelCalenderLX = bind C4LX;
    var imgClickdownLX = bind C2LX + Type2TextboxW;
    var imgClickdown1LX = bind C4LX + Type2TextboxW;
    var rectbuttonLX = bind 85.13341804 * panelW / 100;
    var LabelDateLX = bind 75.23888183 * panelW / 100;
    var AmtPanelLX = bind 48.28462516 * panelW / 100;
    var AmtTextW =200;// bind 40.66073698 * panelW / 100;
    var TableW = bind (95.29860229 * panelW) / 100 on replace {
        changeTableSize(TableW);
    };
    var TableH = 270.0;
    var panelTableLX = bind (panelW - TableW) / 2;
    var panelTableLY = 128.0;
    var rectRemoveRowLX = bind ((panelW + TableW) / 2) - 120;
    var rectRemoveRowLY = bind panelTableLY + TableH;

    var damTable: TableDamageHelper = new TableDamageHelper();
    var table = damTable.createTable();
    var tableComp = SwingComponent.wrap(damTable.getScrollTable(table));
    public var headVal: Boolean;
     var tab=(table as javax.swing.JTable);
    var tah = (table as javax.swing.JTable).getTableHeader();

     var damagestockController: com.vanuston.medeil.implementation.DamageStock=RegistryFactory.getClientStub(RegistryConstants.DamageStock) as com.vanuston.medeil.implementation.DamageStock;
     var commonController:CommonImplements= RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements ;
    function changeTableSize(i: Integer): Void {
        tableComp.getJComponent().setPreferredSize(new Dimension(i, TableH));
    }
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 397.5
        layoutY: 0.0
        styleClass: "rectFormHeader"
        width: bind panelW
        height: 575.0
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imgEdit: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imageView3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imgCancel: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
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
    
    def __layoutInfo_txtDamaStkInvNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtDamaStkInvNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 53.0
        layoutInfo: __layoutInfo_txtDamaStkInvNo
        onKeyPressed: txtDamaStkInvNoOnKeyPressed
        onKeyReleased: txtDamaStkInvNoOnKeyReleased
    }
    
    def __layoutInfo_txtDamageItemname: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtDamageItemname: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 53.0
        layoutInfo: __layoutInfo_txtDamageItemname
        onKeyPressed: txtDamageItemnameOnKeyPressed
        onKeyReleased: txtDamageItemnameOnKeyReleased
    }
    
    public-read def imgDate: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: true
        disable: false
        layoutX: bind LabelDateLX+Type3TextboxW+50
        layoutY: 6.0
    }
    
    def __layoutInfo_listDamageStk: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
        height: bind listD
    }
    public-read def listDamageStk: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C2LX
        layoutY: 75.0
        layoutInfo: __layoutInfo_listDamageStk
        items: null
    }
    
    def __layoutInfo_lstDamageItems: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
        height: bind listD
    }
    public-read def lstDamageItems: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C4LX
        layoutY: 74.0
        layoutInfo: __layoutInfo_lstDamageItems
        items: null
        cellFactory: null
    }
    
    public-read def CalendarPanel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelCalenderLX
        layoutY: 110.0
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
    
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 1.0
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "form-background"
        onMouseClicked: rectangleOnMouseClicked
        fill: linearGradient
        stroke: Violet
        width: bind panelW
        height: bind panelH
    }
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
    }
    
    public-read def instance: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 53.0
        text: "Item_name_Batch"
        font: Arial_12
    }
    
    def __layoutInfo_txtDamaStkCNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
        hfill: false
    }
    public-read def txtDamaStkCNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 95.0
        layoutInfo: __layoutInfo_txtDamaStkCNo
        style: ""
        styleClass: "text-box"
        onKeyPressed: txtDamaStkCNoOnKeyPressed
        effect: null
        text: ""
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtDamaStkVAT: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 100.0
    }
    public-read def txtDamaStkVAT: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C1LX+65
        layoutY: 444.0
        layoutInfo: __layoutInfo_txtDamaStkVAT
        text: "100.00"
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtDamaStkDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtDamaStkDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind LabelDateLX+50
        layoutY: 95.0
        layoutInfo: __layoutInfo_txtDamaStkDate
        onKeyPressed: txtDamaStkDateOnKeyPressed
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtDamaStkDName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtDamaStkDName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 95.0
        layoutInfo: __layoutInfo_txtDamaStkDName
        onKeyPressed: txtDamaStkDNameOnKeyPressed
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
    
    public-read def Arial_Bold_20: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 20.0
    }
    
    public-read def reflectionEffect: javafx.scene.effect.Reflection = javafx.scene.effect.Reflection {
    }
    
    def __layoutInfo_btnDamaStkCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind CancelW
        height: bind bottonH
    }
    public-read def btnDamaStkCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton4LX
        layoutY: bind buttonLY
        layoutInfo: __layoutInfo_btnDamaStkCancel
        onKeyPressed: btnDamaStkCancelOnKeyPressed
        effect: reflectionEffect
        graphic: imgCancel
        text: "Cancel [Esc]"
        font: Arial_Bold_14
    }
    
    def __layoutInfo_btnDamaStkReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnDamaStkReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton3LX
        layoutY: bind buttonLY
        layoutInfo: __layoutInfo_btnDamaStkReset
        onKeyPressed: btnDamaStkResetOnKeyPressed
        effect: reflectionEffect
        graphic: imageView3
        text: "Reset [F5]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnDamaStkEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnDamaStkEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton2LX
        layoutY: bind buttonLY
        layoutInfo: __layoutInfo_btnDamaStkEdit
        onKeyPressed: btnDamaStkEditOnKeyPressed
        effect: reflectionEffect
        graphic: imgEdit
        text: "Edit [F4]"
        font: Arial_Bold_14
        action: btnDamaStkEditAction
    }
    
    def __layoutInfo_btnDamaStkSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnDamaStkSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX
        layoutY: bind buttonLY
        layoutInfo: __layoutInfo_btnDamaStkSave
        translateX: 0.0
        effect: reflectionEffect
        graphic: imageView
        text: "Save  [F2]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    public-read def panelButtons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: bind panelButtonsLY
        content: [ btnDamaStkSave, btnDamaStkEdit, btnDamaStkReset, btnDamaStkCancel, ]
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
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 53.0
        text: "Invoice No"
        font: Arial_12
        textFill: DarkGray
    }
    
    def __layoutInfo_label3: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind rectRemoveRowLX
        layoutY: bind rectRemoveRowLY
        layoutInfo: __layoutInfo_label3
        text: "Remove Row"
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def label14: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 95.0
        text: "Distributor Name"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind LabelDateLX
        layoutY: 95.0
        text: "Date"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelVAT: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 444.0
        text: " Total VAT"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 95.0
        styleClass: "label"
        text: "Contact No"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.4
    }
    
    public-read def dropShadowEffect: javafx.scene.effect.DropShadow = javafx.scene.effect.DropShadow {
    }
    
    public-read def lightingEffect: javafx.scene.effect.Lighting = javafx.scene.effect.Lighting {
    }
    
    def __layoutInfo_label: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
    }
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 20.0
        layoutInfo: __layoutInfo_label
        effect: lightingEffect
        text: "Damage Stock"
        font: Arial_25
        hpos: javafx.geometry.HPos.CENTER
    }
    
    public-read def Orange: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
    }
    
    public-read def Arial_30: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 30.0
    }
    
    def __layoutInfo_txtDamaStkNetAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: 44.0
    }
    public-read def txtDamaStkNetAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        managed: true
        layoutX: 610.0
        layoutY: 459.0
        layoutInfo: __layoutInfo_txtDamaStkNetAmt
        editable: false
        font: Arial_30
    }
    
    public-read def Gray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.4
        green: 0.4
        blue: 0.4
    }
    
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 610.0
        layoutY: 430.0
        text: "Total Amount"
        font: Arial_20
        textFill: Gray
    }
    
    public-read def panelAmt: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind AmtPanelLX
        content: [ label5, txtDamaStkNetAmt, ]
    }
    
    public-read def Yellow: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.8
        blue: 0.4
    }
    
    public-read def rectDelRow: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        layoutX: bind rectRemoveRowLX
        layoutY: bind rectRemoveRowLY
        styleClass: "rectbutton"
        fill: Yellow
        stroke: DarkGray
        strokeWidth: 2.0
        width: 120.0
        height: 20.0
        arcWidth: 10.0
        arcHeight: 10.0
    }
    
    public-read def font: javafx.scene.text.Font = javafx.scene.text.Font {
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def image2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imgInvoiceno: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind imgClickdownLX
        layoutY: 20.0
        image: image2
    }
    
    public-read def image3: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imgItemname: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind imgClickdown1LX
        layoutY: 20.0
        image: image3
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ rectangle, rectHeader, label, label2, panelAmt, labelVAT, label9, panelButtons, label14, txtDamaStkDName, txtDamaStkDate, panelTable, rectTableBorder, txtDamaStkVAT, txtDamaStkCNo, rectDelRow, label3, txtDamaStkInvNo, label4, txtDamageItemname, instance, imgDate, imgInvoiceno, imgItemname, listDamageStk, lstDamageItems, CalendarPanel, panelAlert, ]
    }
    
    public-read def image4: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def image5: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imageSave: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Save1.png"
    }
    
    public-read def imageEdit: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Edit.png"
    }
    
    public-read def imageReset: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Reset.png"
    }
    
    public-read def imageCancel: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Cancel.png"
    }
    
    public-read def linearGradientHeader: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
    }
    
    public-read def Arial_Bold_65: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 65.0
    }
    
    public-read def imageBack: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/arrow_Left.png"
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "Shown", ]
        actual: 0
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectangle.visible = true;
                            rectangle.stroke = DarkGray;
                            rectangle.arcWidth = 5.0;
                            rectangle.arcHeight = 5.0;
                            rectHeader.visible = true;
                            rectHeader.opacity = 0.25;
                            rectHeader.layoutX = 0.0;
                            rectHeader.fill = linearGradientHeader;
                            rectHeader.height = 32.0;
                            rectHeader.arcWidth = 5.0;
                            rectHeader.arcHeight = 5.0;
                            label.layoutY = 1.0;
                            label.text = "Damaged Stock - ctrl+G";
                            label2.layoutY = 96.0;
                            label2.text = "Contact No.";
                            label5.layoutX = 0.0;
                            label5.layoutY = 25.0;
                            label5.text = "Amount";
                            txtDamaStkNetAmt.layoutX = 70.0;
                            txtDamaStkNetAmt.layoutY = 0.0;
                            __layoutInfo_txtDamaStkNetAmt.height = 70.0;
                            txtDamaStkNetAmt.styleClass = "Borderless-text-box";
                            txtDamaStkNetAmt.onKeyReleased = txtDamaStkNetAmtOnKeyReleasedAtShown;
                            txtDamaStkNetAmt.font = Arial_Bold_65;
                            panelAmt.visible = true;
                            panelAmt.layoutY = 410.0;
                            labelVAT.visible = false;
                            labelVAT.layoutY = 456.0;
                            label9.layoutY = 40.0;
                            imageView.visible = true;
                            imageView.image = imageSave;
                            btnDamaStkSave.onKeyPressed = btnDamaStkSaveOnKeyPressedAtShown;
                            btnDamaStkSave.text = "Save [F3]";
                            btnDamaStkSave.action = btnDamaStkSaveActionAtShown;
                            imgEdit.visible = true;
                            imgEdit.image = imageEdit;
                            btnDamaStkEdit.text = "Edit [F6]";
                            imageView3.visible = true;
                            imageView3.image = imageReset;
                            btnDamaStkReset.text = "Reset [F4]";
                            btnDamaStkReset.action = btnDamaStkResetActionAtShown;
                            imgCancel.visible = true;
                            imgCancel.image = imageCancel;
                            btnDamaStkCancel.disable = false;
                            btnDamaStkCancel.text = "Cancel [F8]";
                            btnDamaStkCancel.action = btnDamaStkCancelActionAtShown;
                            panelButtons.visible = true;
                            txtDamaStkDName.layoutY = 96.0;
                            txtDamaStkDName.editable = false;
                            txtDamaStkDate.layoutY = 40.0;
                            panelTable.visible = true;
                            panelTable.blocksMouse = true;
                            rectTableBorder.visible = true;
                            txtDamaStkVAT.visible = false;
                            txtDamaStkVAT.layoutY = 456.0;
                            __layoutInfo_txtDamaStkVAT.height = 150.0;
                            txtDamaStkVAT.onKeyReleased = txtDamaStkVATOnKeyReleasedAtShown;
                            txtDamaStkCNo.layoutY = 96.0;
                            txtDamaStkCNo.onKeyReleased = txtDamaStkCNoOnKeyReleasedAtShown;
                            rectDelRow.visible = true;
                            rectDelRow.disable = false;
                            rectDelRow.onKeyPressed = rectDelRowOnKeyPressedAtShown;
                            rectDelRow.onMouseClicked = rectDelRowOnMouseClickedAtShown;
                            rectDelRow.width = 120.0;
                            label3.visible = true;
                            label3.disable = false;
                            __layoutInfo_label3.width = 120.0;
                            __layoutInfo_label3.height = 20.0;
                            label3.text = "Remove Row [F12]";
                            label3.hpos = javafx.geometry.HPos.CENTER;
                            txtDamaStkInvNo.layoutY = 68.0;
                            __layoutInfo_txtDamaStkInvNo.height = 20.0;
                            txtDamaStkInvNo.styleClass = "text-box";
                            txtDamaStkInvNo.font = Arial_12;
                            label4.layoutY = 68.0;
                            label4.text = "Invoice No.";
                            txtDamageItemname.visible = false;
                            txtDamageItemname.disable = true;
                            txtDamageItemname.layoutY = 68.0;
                            instance.visible = false;
                            instance.layoutY = 68.0;
                            instance.text = "Item Name";
                            imgDate.visible = true;
                            imgDate.disable = false;
                            imgDate.layoutY = 40.0;
                            imgDate.onMouseClicked = imgDateOnMouseClickedAtShown;
                            imgInvoiceno.visible = true;
                            imgInvoiceno.layoutY = 68.0;
                            imgInvoiceno.onMouseClicked = imgInvoicenoOnMouseClickedAtShown;
                            imgInvoiceno.image = image2;
                            imgInvoiceno.fitWidth = 18.0;
                            imgInvoiceno.fitHeight = 18.0;
                            imgItemname.visible = false;
                            imgItemname.layoutY = 68.0;
                            imgItemname.onMouseClicked = imgItemnameOnMouseClickedAtShown;
                            imgItemname.fitWidth = 18.0;
                            imgItemname.fitHeight = 18.0;
                            listDamageStk.visible = false;
                            listDamageStk.disable = false;
                            listDamageStk.layoutY = 89.0;
                            lstDamageItems.visible = false;
                            lstDamageItems.disable = false;
                            lstDamageItems.layoutY = 89.0;
                            lstDamageItems.blocksMouse = true;
                            CalendarPanel.visible = true;
                            CalendarPanel.layoutY = 62.0;
                            CalendarPanel.blocksMouse = true;
                            panel.visible = true;
                        }
                    }
                ]
            }
        ]
    }
    
    function listCellFactory(): javafx.scene.control.ListCell {
        var listCell: javafx.scene.control.ListCell;
        
        def label6: javafx.scene.control.Label = javafx.scene.control.Label {
            visible: bind not listCell.empty
            text: bind "{listCell.item}"
            font: null
            textFill: null
        }
        
        listCell = javafx.scene.control.ListCell {
            node: label6
        }
        
        return listCell
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel, ]
    }
    // </editor-fold>//GEN-END:main

    function txtDamaStkCNoOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
         shortcut(event);
         }

    function btnDamaStkCancelOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_SPACE) {
            btnDamaStkCancelActionAtShown();
        } else {
            shortcut(event);
        }
    }

    function btnDamaStkResetOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_SPACE) {
            btnDamaStkResetActionAtShown();
        } else {

            shortcut(event);
        }
    }

    function btnDamaStkEditOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_SPACE) {
            btnDamaStkEditAction();
        } else {
            shortcut(event);
        }
    }

    function txtDamaStkVATOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function rectangleOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
    }

    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    var mandatory: String = CommonDeclare.textbox_mandatory();
    var error: String = CommonDeclare.textbox_error();
    def CustomAlert = CustomAlert {};

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Damage Stock", type);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Damage Stock", msg);
        showAlertbox();
    }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Damage Stock", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = error;
    }

    function txtDamaStkDateOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ESCAPE) { fxCalendar.visible = false; }
    }

    function imgItemnameOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
         //damagestockController = RegistryFactory.getClientStub(RegistryConstants.DamageStock) as com.vanuston.medeil.implementation.DamageStock;
        if (txtDamaStkInvNo.text == "" and txtDamaStkInvNo.text.trim().length() == 0) {
            FXinfo("Please Enter the Invoice Number first");
            lstDamageItems.visible = false;
        } else {
            listDamageStk.visible = false;
            txtDamaStkInvNo.disable = true;
            imgInvoiceno.disable = true;

//            var itemName: String[] = [];
            var itemName: List = new ArrayList();
            listD = 0.0;
            lstDamageItems.visible = true;
            lstDamageItems.layoutY = txtDamageItemname.layoutY + 21;
            {
                txtDamageItemname.requestFocus();
                var damagestockBean: DamageStockModel = new DamageStockModel();
                damagestockBean.setDamage_invoice_no(txtDamaStkInvNo.rawText.trim());
                //var commonController = new CommonController();
                itemName = commonController.getListItems(damagestockBean.getDamage_invoice_no(), "", "itemandbatch");
                //itemName = GetSelectClass.itemNameBatch('{txtDamaStkInvNo.text}');
                lstDamageItems.items = itemName.toArray();

//                var get: String[] = [];
                var get: List = new ArrayList();
                lstDamageItems.onMouseClicked = function(e) {
                            txtDamageItemname.text = "{lstDamageItems.selectedItem}";
                            lstDamageItems.visible = false;
                            //var damagestockController: com.vanuston.medeil.implementation.DamageStock = new DamageStockController();
                            damagestockBean.setDamage_item_name(txtDamageItemname.rawText.trim());
                            damagestockBean.setDamage_invoice_no(txtDamaStkInvNo.rawText.trim());

                            damagestockBean.setDamage_mfr_name("checkExists");
//                            var check: Boolean = GetSelectClass.checkExists("{txtDamageItemname.rawText.trim()}", txtDamaStkInvNo.rawText.trim());
                            var check: Boolean = damagestockController.viewRecord(damagestockBean) as Boolean;
//                            var check: Boolean = GetSelectClass.checkExists("{txtDamageItemname.rawText.trim()}", txtDamaStkInvNo.rawText.trim());
                            if (check) {
                                damagestockBean.setDamage_item_name(txtDamageItemname.rawText.trim());
                                damagestockBean.setDamage_mfr_name("getItemandBatch");
                                damagestockBean= damagestockController.viewAllRecord(damagestockBean);
                                get = damagestockBean.getDamageStock();
                                tableComp.requestFocus();                                
                                damTable.addText(get);
                                damTable.focusSet(damTable.getRowCount(), 5);

                            } else {
                                FXinfo("This product is already saved. Please use edit option to modify the record.");
                            }
                        }
                var height: Integer = 0;
                if (lstDamageItems.items.size() < 9) {
                    height = lstDamageItems.items.size();
                } else {
                    height = 8;
                }
                for (i in [1..height]) {
                    listD += 25.0;
                }
                listD -= 3;
            }
        }
    }

    function imgInvoicenoOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        if(not listDamageStk.visible){
        var damagestockBean: DamageStockModel = new DamageStockModel();
       // var damagestockController: com.vanuston.medeil.implementation.DamageStock = new DamageStockController();
       //damagestockController = RegistryFactory.getClientStub(RegistryConstants.DamageStock) as com.vanuston.medeil.implementation.DamageStock;
        listDamageStk.layoutY = txtDamaStkInvNo.layoutY + 21;
        if (btnDamaStkEdit.text == "Update [F7]") {
            var invoiceno: List = new ArrayList();
            listD = 0.0;
            listDamageStk.visible = true;
            var size = listDamageStk.items.size();
            //var damagestockBean:DamageStockModel=new DamageStockModel();
            damagestockBean.setDamage_invoice_no(txtDamaStkInvNo.rawText.trim());
           // var commonController: CommonImplements = new CommonController();
            invoiceno = commonController.getListItems(damagestockBean.getDamage_invoice_no(), "", "InvoiceDamage");
            //invoiceno = GetSelectClass.InvoiceDamage(txtDamaStkInvNo.rawText.trim());
            if (invoiceno != "" or txtDamaStkInvNo.text != null or invoiceno != null) {
                listDamageStk.clearSelection();
                listDamageStk.items = invoiceno.toArray();
                listDamageStk.onKeyPressed = function(e) {
                            if (e.code == KeyCode.VK_ENTER) {
                                txtDamaStkInvNo.text = "{listDamageStk.selectedItem}";
                                txtDamaStkInvNo.editable = true;
                                txtDamageItemname.text = "";
                                listDamageStk.visible = false;
                                var get: List = new ArrayList();
                                //var damagestockBean: DamageStockModel = new DamageStockModel();
                                 damagestockBean.setDamage_invoice_no(txtDamaStkInvNo.rawText.trim());
                                damagestockBean.setDamage_mfr_name("getDistNamePhone");
                                //var damagestockController: com.vanuston.medeil.implementation.DamageStock = new DamageStockController();
                            damagestockBean=damagestockController.viewAllRecord(damagestockBean);
                            txtDamaStkDName.text = damagestockBean.getDamage_dist_name();
                            txtDamaStkCNo.text = damagestockBean.getDamage_contact_no();
                                damagestockBean.setDamage_invoice_no(txtDamaStkInvNo.rawText.trim());
                                damagestockBean.setDamage_mfr_name("getDamagedInvoiceNo");
                                damagestockBean.setDamage_invoice_no(txtDamaStkInvNo.text);
                                damagestockBean=damagestockController.viewAllRecord(damagestockBean);
                               get = damagestockBean.getDamageStock();
                                //get = damagestockController.viewAllRecord(damagestockBean);
                                txtDamaStkDName.text = damagestockBean.getDamage_dist_name();
                                txtDamaStkCNo.text = damagestockBean.getDamage_contact_no();
                                /*for (i in [1..get.size()]) {
                                    //damagestockBean=get.get(i) as DamageStockModel;

                                    if (damagestockBean.getDamage_item_name() == null) {
                                        txtDamaStkDName.requestFocus();
                                        txtDamageItemname.requestFocus();
                                    }
                                    if (damagestockBean.getDamage_dist_name() != null or damagestockBean.getDamage_contact_no() != null) {
                                        txtDamaStkDName.text = damagestockBean.getDamage_dist_name();
                                        txtDamaStkCNo.text = damagestockBean.getDamage_contact_no();
                                        txtDamageItemname.requestFocus();
                                    } else {
                                        txtDamaStkDName.text = "";
                                        txtDamaStkCNo.text = "";
                                    }
                                }*/
                                //damagestockBean.setDamage_item_name(txtDamageItemname.rawText.trim());
                                damagestockBean.setDamage_invoice_no(txtDamaStkInvNo.rawText.trim());
                                damagestockBean.setDamage_mfr_name("checkDamgeItemExists");                                
                                var check: Boolean = damagestockController.viewRecord(damagestockBean) as Boolean;                                
                                if (check == false)
                                {                                    
                                    damTable.EditDamage(get);
                                    tableComp.requestFocus();
                                    damTable.focusSet(damTable.getRowCount(), 5);
                                }
                                else
                                {   }
                            } else if (e.code == KeyCode.VK_DOWN) {
                                if (listDamageStk.selectedIndex == 0) {
                                    listDamageStk.selectFirstRow();
                                }
                            } else if (e.code == KeyCode.VK_ESCAPE) {
                                listDamageStk.visible = false;
                            }
                        };
                listDamageStk.onMouseClicked = function(e) {

                            txtDamaStkInvNo.text = "{listDamageStk.selectedItem}";
                            txtDamaStkInvNo.editable = true;
                            txtDamageItemname.text = "";
                            lstDamageItems.visible = false;
                            listDamageStk.visible = false;
                            damagestockBean.setDamage_invoice_no(txtDamaStkInvNo.rawText.trim());
                            damagestockBean.setDamage_mfr_name("getDistNamePhone");
                            //var damagestockController: com.vanuston.medeil.implementation.DamageStock = new DamageStockController();
                            damagestockBean=damagestockController.viewAllRecord(damagestockBean);
                            txtDamaStkDName.text = damagestockBean.getDamage_dist_name();
                            txtDamaStkCNo.text = damagestockBean.getDamage_contact_no();
                            damagestockBean.setDamage_invoice_no(txtDamaStkInvNo.rawText.trim());
                            damagestockBean.setDamage_mfr_name("getDamagedInvoiceNo");
                            damagestockBean=damagestockController.viewAllRecord(damagestockBean);
                            var get = damagestockBean.getDamageStock();
                            
                            damagestockBean.setDamage_invoice_no(txtDamaStkInvNo.rawText.trim());
                            damagestockBean.setDamage_mfr_name("checkDamgeItemExists");
                            var check: Boolean = damagestockController.viewRecord(damagestockBean) as Boolean;
                            if (check == false)
                            {
                                damTable.EditDamage(get);
                                damTable.focusSet(damTable.getRowCount(), 5);
                            } else
                            {
                                FXinfo("This product is already saved. Please use Edit option to modify.");
                            }
                            damTable.DamageStockCalculations();
                            updateValues();
                        };
                var height: Integer = 0;
                if (listDamageStk.items.size() < 9) {
                    height = listDamageStk.items.size();
                } else {
                    height = 8;
                }
                for (i in [1..height]) {
                    listD += 25.0;
                }
                listD -= 3;
            } else {
                if (txtDamaStkInvNo.text == null)
                    txtDamaStkInvNo.text = "";
                FXinfo("Please Enter the Invoice number first");
            }
        } else if (btnDamaStkEdit.text == "Edit [F6]") {
            var invoiceno: List = new ArrayList();
            listD = 0.0;
            listDamageStk.visible = true;
            var size = listDamageStk.items.size();
            if (not listDamageStk.items.isEmpty()) {
                for (i in [0..<size])
                    listDamageStk.items[i] = listDamageStk;
            }
            damagestockBean.setDamage_invoice_no(txtDamaStkInvNo.rawText.trim());
            //var commonController: CommonImplements = new CommonController();
            invoiceno = commonController.getListItems(damagestockBean.getDamage_invoice_no(), "", "purinvoiceno");
            //invoiceno = GetSelectClass.InvoiceNo(txtDamaStkInvNo.rawText.trim());
            listDamageStk.clearSelection();
            listDamageStk.items = invoiceno.toArray();
            listDamageStk.onMouseClicked = function(e) {

                         imgInvoiceno.requestFocus();
                        txtDamaStkInvNo.text = "{listDamageStk.selectedItem}";                        
                        damagestockBean.setDamage_invoice_no(txtDamaStkInvNo.rawText.trim());
                        damagestockBean.setDamage_mfr_name("getDistNamePhone");                       
                        damagestockBean=damagestockController.viewAllRecord(damagestockBean);                            
                            txtDamaStkDName.text = damagestockBean.getDamage_dist_name();
                            txtDamaStkCNo.text = damagestockBean.getDamage_contact_no();
                       damagestockBean.setDamage_mfr_name("getItemandBatch");
                            damagestockBean.setDamage_invoice_no(txtDamaStkInvNo.text);
                            damagestockBean=damagestockController.viewAllRecord(damagestockBean);
                            var get1: List = damagestockBean.getDamageStock();
                            if(get1.size()==0)
                                {
                                  FXinfo("This Invoice No all items already saved,please use Edit option");
                                }
                                damagestockBean.setDamage_mfr_name("checkExists");
                            var check: Boolean = damagestockController.viewRecord(damagestockBean) as Boolean;
                            if (check)
                            {
                                damTable.SaveDamage(get1);
                                damTable.focusSet(damTable.getRowCount(), 5);
                                }
                               else
                                {
//                                     if(get1.size()==0)
//                                {
//                                  FXinfo("This Invoice No all items already saved,please use Edit option");
//                                }
                            }

                        txtDamaStkInvNo.editable = true;
                        txtDamageItemname.text = "";
                        lstDamageItems.visible = false;
                        listDamageStk.visible = false;
                    }

            var height: Integer = 0;
            if (listDamageStk.items.size() < 9) {
                height = listDamageStk.items.size();
            } else {
                height = 8;
            }
            for (i in [1..height]) {
                listD += 25.0;
            }
            listD -= 3;
        }
        damTable.DamageStockCalculations();
        updateValues();
      }
      else{
          listDamageStk.visible=false;
          txtDamaStkInvNo.requestFocus();
      }
    }

    function txtDamageItemnameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtDamageItemname.style = mandatory;
            listDamageStk.visible = false;
            txtDamaStkInvNo.disable = true;
            imgInvoiceno.disable = true;
        }
        shortcut(event);
    }

    function txtDamaStkCNoOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        //shortcut(event);
    }

    function txtDamaStkDNameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function rectDelRowOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        var getVal = damTable.removeRow();
        if (getVal == 100) {
            FXinfo("there is no to remove");
        }else if (getVal == 100) {
            FXinfo("Please, select any one row to remove.");
        }
        damTable.DamageStockCalculations();
        updateValues();
    }

    function btnDamaStkCancelActionAtShown(): Void {
        if (btnDamaStkCancel.text == "Cancel [F8]") {
            panel.visible = false;
            CommonDeclare.form[2] = 0;
        }
        if (btnDamaStkCancel.text == "Back [Ctrl+Left]") {
            DamageStockBack();
        }
    }

    function rectDelRowOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        var getVal = damTable.removeRow();
        if (getVal == 100) {
            FXinfo("there is no to remove");
        } else if (getVal == 100) {
            FXinfo("Please, select any one row to remove.");
        }
        damTable.DamageStockCalculations();
        updateValues();
    }
//function removeRow()

    function txtDamaStkNetAmtOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {        
        shortcut(event);
    }

    function imgDateOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        if (not dateFlag) {
            if (txtDamaStkDate.text != null) {
                var dat = txtDamaStkDate.rawText.trim().split("-");
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1]) - 1;
                var y = Integer.parseInt(dat[2]);
                fxCalendar.set(y, m, d); } else {
                var dat = DateUtils.now("dd-MM-yyyy").split("-");
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1]) - 1;
                var y = Integer.parseInt(dat[2]);
                fxCalendar.set(y, m, d);
            }
            fxCalendar.visible = not fxCalendar.visible;
            dateFlag = true;
        } else {
        }
    }

    public function editAllValues(): Void {
        instance.visible = false;
        txtDamageItemname.visible = false;
        imgItemname.visible = false;
        btnDamaStkSave.disable = true;
        btnDamaStkEdit.text = "Update [F7]";
        listDamageStk.visible = false;
        lstDamageItems.visible = false;
        btnDamaStkCancel.text = "Back [Ctrl+Left]";
        txtDamaStkInvNo.requestFocus();
        damTable.Edit = 1;
        resetDamageValues();
        CancelW = bottonW + 30;
        imgEdit.image = imageSave;
        imgCancel.image = imageBack;
    }

    public function updateAllValues(): Void {
        var retVal = damTable.checkDmgStock();
        if (retVal == 0) {
//            FXalert(1);
//            var delay: Duration = bind CustomAlert.delay;
//            var a = bind CustomAlert.confirm;
//            Timeline { keyFrames: [KeyFrame { time: bind delay
                            var cn:ConfirmDialogBox=new ConfirmDialogBox(0,"Damage Stock");
                                    var a =bind cn.staus;
//                        action: function() {
                            if (a) {                                
                                editDamageStock();                               
                                resetDamageValues();
                                DamageStockBack();
                                txtDamaStkInvNo.requestFocus();
                                instance.visible = false;
                                txtDamageItemname.visible = false;
                                imgItemname.visible = false;
                            }
//                            CustomAlert.confirm = false;
//                        } }] }.play();
        } else if (retVal == 100) {
            FXinfo("Damage quantity is null. Check it.");
        } else if (retVal == 101) {
            FXinfo("Damage quantity is higher than purchased quantity.");
        }
    }

    function btnDamaStkEditAction(): Void {
        var damagestockBean: DamageStockModel = new DamageStockModel();
        //damagestockController = RegistryFactory.getClientStub(RegistryConstants.DamageStock) as com.vanuston.medeil.implementation.DamageStock;
        damagestockBean.setDamage_mfr_name("checkExistsfromstkedit");
        damagestockController.viewRecord(damagestockBean);
        var check = damagestockBean.getDamage_mfr_name();

        // if (check == 1) {
        if (check == '1' or damagestockController.viewRecord(damagestockBean).equals(true)) {
            if (btnDamaStkEdit.text == "Edit [F6]") {
                editAllValues();

            } else if (btnDamaStkEdit.text == "Update [F7]") {
                if (txtDamaStkInvNo.text == "" or txtDamaStkInvNo.text == null) {
                    FXinfo("Please enter the invoice number.", txtDamaStkInvNo);
                } else {
                    updateAllValues();
                }
            }
        } else {
            FXinfo("Damaged Stocks are not available!");
            txtDamaStkInvNo.requestFocus();
        }
    }

    function btnDamaStkResetActionAtShown(): Void {
        resetDamageValues();
    }

    public function DamageStockBack(): Void {
        resetDamageValues();
        btnDamaStkSave.disable = false;
        btnDamaStkSave.text = "Save [F3]";
        btnDamaStkEdit.text = "Edit [F6]";
        btnDamaStkReset.text = "Reset [F4]";
        btnDamaStkCancel.text = "Cancel [F8]";
        instance.visible = false;
        txtDamageItemname.visible = false;
        imgItemname.visible = false;
        damTable.Edit = 0;
        damTable.addInitRow();
        CancelW = bottonW + 10;
        imgEdit.image = imageEdit;
        imgCancel.image = imageCancel;
    }

    var visit = bind fxCalendar.visible on replace {
        if (dateFlag and not visit) {
            getDate(0);
        }
    };

    function getDate(i: Integer) {
        if (i == 0) {
            updateValues();
            if (not fxCalendar.visible and dateFlag) {
                txtDamaStkDate.text = fxCalendar.getSelectedDate();
                dateFlag = false;
                damTable.focusSet(damTable.getRowCount(), 5);
            }
        }
    }

    public function updateValues(): Void {
        damTable.DamageStockCalculations();

        txtDamaStkNetAmt.text = Value.Round("{damTable.totAmt}");
        
//            for (i in [0..<5]) {
//            updateSetValues();
//        }
}

    public function updateSetValues(): Void {
        damTable.DamageStockCalculations();
        txtDamaStkNetAmt.text = {
                    Value.Round("{damTable.totAmt}", 2)
//                    Value.Round("{damTable.damAmt}", 2)
                };
        txtDamaStkVAT.text = {
                    Value.Round("{damTable.totVATAmt}", 2)
                };
    }

    function btnDamaStkSaveOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_SPACE) {
            saveDamageStock();
        } else {

            shortcut(event);
        }        
    }

    function btnDamaStkSaveActionAtShown(): Void {
        if (txtDamaStkInvNo.text != "") {
            saveDamageStock();
        } else {
            FXinfo("Please enter the Invoice number.", txtDamaStkInvNo);
        }
    }

    function txtDamageItemnameOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if (txtDamaStkInvNo.text == "" and txtDamaStkInvNo.text.trim().length() == 0) {
            lstDamageItems.visible = false;
            FXinfo("Please enter the Invoice number");
        } else {
            getInvoiceNotemnoandbatch(event);
        }
        if (event.code == KeyCode.VK_DOWN) {
            lstDamageItems.visible = true;
            lstDamageItems.requestFocus();
            lstDamageItems.selectFirstRow();
        }
        if (event.code == KeyCode.VK_ESCAPE) {
            lstDamageItems.visible = false;
            txtDamaStkInvNo.requestFocus();
        }
    }

    function txtDamaStkInvNoOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        txtDamaStkInvNo.style = mandatory;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtDamageItemname.requestFocus();
        }
        if (event.code == KeyCode.VK_DOWN) {
            listDamageStk.requestFocus();
            listDamageStk.selectFirstRow();
        }
        shortcut(event);
    }

    function txtDamaStkInvNoOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        getInvoiceNo(event);
        if (event.code == KeyCode.VK_DOWN) {
            listDamageStk.requestFocus();
            listDamageStk.selectFirstRow();
        }
        if (btnDamaStkEdit.text.equals("Update [F7]")) {
            getInvoiceNo(event);
            listDamageStk.requestFocus();
        } else {
            getInvoiceNo(event);
        }
        if (event.code == KeyCode.VK_ESCAPE) {
            listDamageStk.visible = false;
            txtDamaStkInvNo.requestFocus();
        }
    }

    function saveDamageStock(): Void {
        if(not txtDamaStkInvNo.text.equals(""))
        {
        try {
            var total="";
            var damagestockAddBean: DamageStockModel;// = new DamageStockModel();
            var damagestockBean: DamageStockModel = new DamageStockModel();
           //damagestockController = RegistryFactory.getClientStub(RegistryConstants.DamageStock) as com.vanuston.medeil.implementation.DamageStock;
            var comList = new ArrayList();
            damagestockBean.setDamage_invoice_no(txtDamaStkInvNo.text.replace("'", "\'"));
            damagestockBean.setDamage_stock_date(DateUtils.changeFormatDate(txtDamaStkDate.text).replace("'", "\'"));
            damagestockBean.setDamage_dist_name(txtDamaStkDName.text.replace("'", "\'"));
            damagestockBean.setDamage_contact_no(txtDamaStkCNo.text.replace("'", "\'"));
           // if (damTable.checkDamageStock())
            {
                var len = damTable.getRowCount();
                if(len!=0)
                {

                var tableValues = damTable.getDamageValues();
                var checking = -1;
                for (i in [0..<len]) {
                    if(Integer.valueOf(tableValues[i][4])<=Integer.valueOf(tableValues[i][5]))
                    {
                      FXinfo("Damage Qty is higher than Purchased Qty");
                     damTable.focusSet(i, 5);
                     break;
                    }
                    else if ((Boolean.parseBoolean(tableValues[i][11])==true and Integer.valueOf(tableValues[i][5]) <= 0)) {
                        checking = -1;
                        break;
                    } else {
                        if(Boolean.parseBoolean(tableValues[i][11])==true)
                        {

                        checking = i;
                        damagestockAddBean = new DamageStockModel();
                        damagestockAddBean.setDamage_item_name(tableValues[i][1]);
                        damagestockAddBean.setDamage_batch_no(tableValues[i][2]);
                        damagestockAddBean.setDamage_invoice_date(DateUtils.changeFormatDate(tableValues[i][3]));
                        damagestockAddBean.setDamage_purchased_qty(Integer.valueOf(tableValues[i][4]));

                        damagestockAddBean.setDamage_damaged_qty(Integer.valueOf(tableValues[i][5]));
                        damagestockAddBean.setDamage_unit_vat(Double.valueOf(tableValues[i][6]));
                        damagestockAddBean.setDamage_unit_discount(Double.valueOf(tableValues[i][7]));
                        damagestockAddBean.setDamage_unit_price(Double.valueOf(tableValues[i][8]));
                        damagestockAddBean.setDamage_sub_total(Double.parseDouble(tableValues[i][9]));
                        damagestockAddBean.setDamage_total_amount(Value.Round(Double.parseDouble(txtDamaStkNetAmt.text), 2));
                        damagestockAddBean.setDamage_remarks(tableValues[i][10].toString());
                        total=Value.Round((Integer.valueOf(tableValues[i][5]) * Double.valueOf(tableValues[i][8])) - Double.valueOf(tableValues[i][7]) +Double.valueOf(tableValues[i][6]));
                        comList.add(damagestockAddBean);
                        }
                    }
                }
                if (checking != -1) {

                    damagestockBean.setDamageStock(comList);
                    txtDamaStkNetAmt.text=total;
                    //var damagestockController: com.vanuston.medeil.implementation.DamageStock = new DamageStockController();
                    var damagestockSave = damagestockController.createRecord(damagestockBean) as Boolean;
                    if (damagestockSave.equals(true)) {

                        UserLog('Damage Stock', 'Save');
                        FXalert(0);
                        resetDamageValues();
                    }
                } else {
                    FXinfo("Please Enter Correct Damage Qty or Click Check Box ");
                    damTable.focusSet(checking, 5);
                }
                }
                else
                {
                  FXinfo("This Invoice No all items already saved,please use Edit option");
                }
            }
        }

         catch (e: Exception) {
            var msg: String = "Class : DamageStock  method : saveDamageStock()   = ".concat(e.getMessage());
            log.debug(msg);
        }

        }else{FXinfo("Please Enter the Invoice Number first");
            lstDamageItems.visible = false;}

    }

    function editDamageStock(): Void {
        try {            
          //  var damTable: damTable = new damTable();
             var damagestockAddBean: DamageStockModel;// = new DamageStockModel();
            var damagestockBean: DamageStockModel = new DamageStockModel();
            //damagestockController = RegistryFactory.getClientStub(RegistryConstants.DamageStock) as com.vanuston.medeil.implementation.DamageStock;
            var comList = new ArrayList();
            damagestockBean.setDamage_invoice_no(txtDamaStkInvNo.text.replace("'", "\'"));
            damagestockBean.setDamage_stock_date(DateUtils.changeFormatDate(txtDamaStkDate.text).replace("'", "\'"));
            damagestockBean.setDamage_contact_no(txtDamaStkCNo.text.replace("'", "\'"));
            //var checking = -1;
            getPrivileges(logUser);
            updateValues();            
            var len = damTable.getRowCount(); // damTable.totItems;

            var tableValues = damTable.getDamageValues();
            for (i in [0..<len]) {
                damagestockAddBean = new DamageStockModel();
                damagestockAddBean.setDamage_item_name(tableValues[i][1]);
                damagestockAddBean.setDamage_batch_no(tableValues[i][2]);
                damagestockAddBean.setDamage_invoice_date(DateUtils.changeFormatDate(tableValues[i][3]));
                damagestockAddBean.setDamage_purchased_qty(Integer.valueOf(tableValues[i][4]));
                damagestockAddBean.setDamage_damaged_qty(Integer.valueOf(tableValues[i][5]));
                damagestockAddBean.setDamage_unit_vat(Double.valueOf(tableValues[i][6]));
                damagestockAddBean.setDamage_unit_discount(Double.valueOf(tableValues[i][7]));
                damagestockAddBean.setDamage_unit_price(Double.valueOf(tableValues[i][8]));
                damagestockAddBean.setDamage_sub_total(Double.parseDouble(tableValues[i][9]));
                damagestockAddBean.setDamage_total_amount(Value.Round(Double.parseDouble(txtDamaStkNetAmt.text), 2));
                damagestockAddBean.setDamage_remarks(tableValues[i][10].toString());
                comList.add(damagestockAddBean);
               }
               if(comList!=null and  comList.size()>0){

                    damagestockBean.setDamageStock(comList);                    
                //var damagestockController: com.vanuston.medeil.implementation.DamageStock = new DamageStockController();
                if (damagestockController.updateRecord(damagestockBean).equals(true)) {
  FXalert(4);
                    }
            }



            resetDamageValues();
        } catch (e: Exception) {
            var msg: String = "Class : DamageStock  method : editDamageStock()   = ".concat(e.getMessage());
            log.debug(msg);
        }
    }

    function resetDamageValues(): Void {
        try {
            mandatory_textboxes();
            damTable.clearData();
            txtDamaStkInvNo.disable = false;
            imgInvoiceno.disable = false;
            imgInvoiceno.visible = true;
            txtDamaStkInvNo.text = "";
            txtDamaStkDate.text = DateUtils.now("dd-MM-yyyy");
            txtDamaStkDName.text = "";
            txtDamageItemname.visible=false;
            instance.visible=false;
            imgItemname.visible=false;            
            txtDamaStkCNo.text = "";
            txtDamageItemname.text = "";
            txtDamaStkNetAmt.text = '0.00';
            txtDamaStkVAT.text = '0.00';
            lstDamageItems.visible = false;
            //if (not btnDamaStkSave.disable) {
            if (btnDamaStkEdit.text != "Update [F7]") {
                damTable.addInitRow();
            }
            damTable.DamageStockCalculations();
            updateValues();
            updateValues();
            updateValues();
        } catch (e: Exception) {
            var msg: String = "Class : DamageStock : resetDamagaValues()   = {e.getMessage()}";
            log.debug(msg);
            updateValues();
        }
    }

    function getInvoiceNotemnoandbatch(event: javafx.scene.input.KeyEvent) {
        listD = 0.0;
        var invoiceitembatch: List = new ArrayList();
        lstDamageItems.visible = true;
        var damagestockBean: DamageStockModel = new DamageStockModel();
        //damagestockController = RegistryFactory.getClientStub(RegistryConstants.DamageStock) as com.vanuston.medeil.implementation.DamageStock;
        damagestockBean.setDamage_invoice_no(txtDamaStkInvNo.rawText.trim());
       // var commonController = new CommonController();
        invoiceitembatch = commonController.getListItems(damagestockBean.getDamage_invoice_no(), "", "itemandbatch");
        lstDamageItems.clearSelection();
        lstDamageItems.items = invoiceitembatch.toArray();
        lstDamageItems.onKeyPressed = function(e) {
                    if (e.code == KeyCode.VK_ENTER) {
                        var get: List = new ArrayList();
                        if (btnDamaStkEdit.text.equals("Edit [F6]")) {
                            txtDamageItemname.text = "{lstDamageItems.selectedItem}";
                            //var damagestockController: com.vanuston.medeil.implementation.DamageStock = new DamageStockController();
                            damagestockBean.setDamage_item_name(txtDamageItemname.rawText.trim());
                            damagestockBean.setDamage_invoice_no(txtDamaStkInvNo.rawText.trim());
                            damagestockBean.setDamage_mfr_name("checkExists");
                            //                            var check: Boolean = GetSelectClass.checkExists("{txtDamageItemname.rawText.trim()}", txtDamaStkInvNo.rawText.trim());
                            var check: Boolean = damagestockController.viewRecord(damagestockBean) as Boolean;
                            if (check) {
                                damagestockBean.setDamage_item_name(txtDamageItemname.rawText.trim());
                                damagestockBean.setDamage_mfr_name("getItemandBatch");
                               damagestockBean=damagestockController.viewAllRecord(damagestockBean);
                               get = damagestockBean.getDamageStock();
                                //damTable.addText(get);
                                damTable.SaveDamage(get);
                                damTable.focusSet(damTable.getRowCount(), 5);
                                tableComp.requestFocus();
                            } else {
                                FXinfo("This product is already saved. Please use edit to modify");
                            }
                        } else if (btnDamaStkEdit.text.equals("Update [F7]")) {
                            txtDamageItemname.text = "{lstDamageItems.selectedItem}";
                            damagestockBean.setDamage_item_name(txtDamageItemname.rawText.trim());
                            damagestockBean.setDamage_mfr_name("getEditItemandBatch");
                            //var damagestockController: com.vanuston.medeil.implementation.DamageStock = new DamageStockController();
                            damagestockBean=damagestockController.viewAllRecord(damagestockBean);
                            damagestockBean=damagestockController.viewAllRecord(damagestockBean);
                            get = damagestockBean.getDamageStock();
                            //get = GetSelectClass.getEditItemandBatch(txtDamageItemname.text, txtDamaStkInvNo.text);
                            if (get == null) {
                                DamageStockBack();
                            } else {
                                damTable.EditDamage(get);
                            }
                            tableComp.requestFocus();
                        }
                        lstDamageItems.visible = false;
                        damTable.focusSet(damTable.getRowCount(), 5);
                    } else if (e.code == KeyCode.VK_DOWN) {
                        if (lstDamageItems.selectedIndex == 0) {
                            lstDamageItems.selectFirstRow();
                        }
                    } else if (e.code == KeyCode.VK_ESCAPE) {
                        lstDamageItems.visible = false;
                    }
                };

        lstDamageItems.onMouseClicked = function(e) {
//                    var get: String[] = [];
                    var get: List = new ArrayList();
                    if (btnDamaStkEdit.text.equals("Edit [F6]")) {
                        txtDamageItemname.text = "{lstDamageItems.selectedItem}";
                        //get = GetSelectClass.getItemandBatch("{txtDamageItemname.rawText.trim()}", txtDamaStkInvNo.rawText.trim());
                        //var damagestockController: com.vanuston.medeil.implementation.DamageStock = new DamageStockController();
                        damagestockBean.setDamage_item_name(txtDamageItemname.rawText.trim());
                        damagestockBean.setDamage_invoice_no(txtDamaStkInvNo.rawText.trim());
                        damagestockBean.setDamage_mfr_name("checkExists");
                        //                            var check: Boolean = GetSelectClass.checkExists("{txtDamageItemname.rawText.trim()}", txtDamaStkInvNo.rawText.trim());
                        var check: Boolean = damagestockController.viewRecord(damagestockBean) as Boolean;
                        //var check: Boolean = GetSelectClass.checkExists("{txtDamageItemname.rawText.trim()}", txtDamaStkInvNo.rawText.trim());
                        if (check) {
                            damagestockBean.setDamage_item_name(txtDamageItemname.rawText.trim());
                            damagestockBean.setDamage_mfr_name("getItemandBatch");
                            damagestockBean=damagestockController.viewAllRecord(damagestockBean);
                            get = damagestockBean.getDamageStock();//.viewAllRecord(damagestockBean);
                            damTable.focusSet(damTable.getRowCount(), 5);
                            tableComp.requestFocus();
                        } else {
                            FXinfo("This product is already saved.Please use edit to modify");
                        }

                    } else if (btnDamaStkEdit.text.equals("Update [F7]")) {
                        txtDamageItemname.text = "{lstDamageItems.selectedItem}";
                        //                        get = GetSelectClass.getEditItemandBatch(txtDamageItemname.rawText.trim(), txtDamaStkInvNo.rawText.trim());
                        damagestockBean.setDamage_item_name(txtDamageItemname.rawText.trim());
                        damagestockBean.setDamage_mfr_name("getEditItemandBatch");
                        //var damagestockController: com.vanuston.medeil.implementation.DamageStock = new DamageStockController();
                        damagestockBean=damagestockController.viewAllRecord(damagestockBean);
                            get = damagestockBean.getDamageStock();
                        //get = damagestockController.viewAllRecord(damagestockBean);
                        if (get == null) {
                            DamageStockBack();
                        } else {
                            damTable.EditDamage(get);
                        }
                        tableComp.requestFocus();
                    }
                }
        var height: Integer = 0;
        if (lstDamageItems.items.size() < 9) {
            height = lstDamageItems.items.size();
        } else {
            height = 8;
        }
        for (i in [1..height]) {
            listD += 25.0;
        }
        listD -= 3;
    }

    function getInvoiceNo(event: javafx.scene.input.KeyEvent) {
        var damagestockBean: DamageStockModel = new DamageStockModel();
        //damagestockController = RegistryFactory.getClientStub(RegistryConstants.DamageStock) as com.vanuston.medeil.implementation.DamageStock;
        if (btnDamaStkEdit.text == "Update [F7]") {
            var invoiceno: List = new ArrayList();
            listDamageStk.visible = true;
            listDamageStk.selectFirstRow();
            //var damagestockBean: DamageStockModel = new DamageStockModel();
            damagestockBean.setDamage_invoice_no(txtDamaStkInvNo.rawText.trim());
            //var commonController: CommonImplements = new CommonController();
            invoiceno = commonController.getListItems(damagestockBean.getDamage_invoice_no(), "", "InvoiceDamage");
            //invoiceno = GetSelectClass.InvoiceDamage(txtDamaStkInvNo.rawText.trim());
            if (invoiceno != "" or invoiceno != null or txtDamaStkInvNo.text != null) {
                listD = 0.0;
                listDamageStk.clearSelection();
                listDamageStk.items = invoiceno.toArray();

                listDamageStk.onKeyPressed = function(e) {
                            if (e.code == KeyCode.VK_ENTER) {
                                txtDamaStkInvNo.text = "{listDamageStk.selectedItem}";
                                txtDamaStkInvNo.editable = true;
                                txtDamageItemname.text = "";
                                listDamageStk.visible = false;
                                var get: List = new ArrayList();                                
                                damagestockBean.setDamage_invoice_no(txtDamaStkInvNo.rawText.trim());
                                damagestockBean.setDamage_mfr_name("getDistNamePhone");
                                damagestockBean=damagestockController.viewAllRecord(damagestockBean);
                                txtDamaStkDName.text = damagestockBean.getDamage_dist_name();
                                txtDamaStkCNo.text = damagestockBean.getDamage_contact_no();
                                damagestockBean.setDamage_mfr_name("getDamagedInvoiceNo");
                                damagestockBean.setDamage_invoice_no(txtDamaStkInvNo.text);
                                damagestockBean=damagestockController.viewAllRecord(damagestockBean);
                                get = damagestockBean.getDamageStock();                                
                                damagestockBean.setDamage_invoice_no(txtDamaStkInvNo.rawText.trim());
                                damagestockBean.setDamage_mfr_name("checkDamgeItemExists");                                
                                var check: Boolean = damagestockController.viewRecord(damagestockBean) as Boolean;                                
                                if (check == false)
                                {                                
                                    damTable.EditDamage(get);
                                    tableComp.requestFocus();
                                    damTable.focusSet(damTable.getRowCount(), 5);
                                } 
                                else
                                {
                                }

                            } else if (e.code == KeyCode.VK_DOWN) {
                                if (listDamageStk.selectedIndex == 0) {
                                    listDamageStk.selectFirstRow();
                                }
                            } else if (e.code == KeyCode.VK_ESCAPE) {
                                listDamageStk.visible = false;
                            }
                            damTable.DamageStockCalculations();
                            updateValues();
                        };
                listDamageStk.onMouseClicked = function(e) {
                            txtDamaStkInvNo.text = "{listDamageStk.selectedItem}";
                            txtDamaStkInvNo.editable = true;
                            txtDamageItemname.text = "";
                            lstDamageItems.visible = false;
                            listDamageStk.visible = false;
                            var get: List = new ArrayList();
                            var damagestockBean: DamageStockModel = new DamageStockModel();
                            damagestockBean.setDamage_mfr_name("getDamagedInvoiceNo");
                            damagestockBean.setDamage_invoice_no(txtDamaStkInvNo.text);                            
                            damagestockBean=damagestockController.viewAllRecord(damagestockBean);
                            get = damagestockBean.getDamageStock();

                            damagestockBean.setDamage_item_name(txtDamageItemname.rawText.trim());
                            damagestockBean.setDamage_invoice_no(txtDamaStkInvNo.rawText.trim());
                            damagestockBean.setDamage_mfr_name("checkDamgeItemExists");
                            var check: Boolean = damagestockController.viewRecord(damagestockBean) as Boolean;
                            //var check: Boolean = GetSelectClass.checkDamgeItemExists("{txtDamaStkInvNo.rawText.trim()}");
                            if (check == false) {
                                //var damTable: damTable = new damTable();
                                damTable.EditDamage(get);
                                tableComp.requestFocus();
                                damTable.focusSet(damTable.getRowCount(), 5);
                            } else {
//                                FXinfo("This Invoice No all items already saved,please use Edit option");
                            }
                            damTable.DamageStockCalculations();
                            updateValues();
                        }
                var height: Integer = 0;
                if (listDamageStk.items.size() < 9) {
                    height = listDamageStk.items.size();
                } else {
                    height = 8;
                }

                for (i in [1..height]) {
                    listD += 25.0;

                }
                listD -= 3;
            } else {
                if (txtDamaStkInvNo.text == null)
                    txtDamaStkInvNo.text = "";
                FXinfo("Damage Stock  is Empty");
            }

        } else if (btnDamaStkEdit.text == "Edit [F6]") {
            //var damagestockBean: DamageStockModel = new DamageStockModel();
            listD = 0.0;
            //            var invoiceno: String[] = [];
            var invoiceno: List = new ArrayList();
            listDamageStk.visible = true;
            var size = listDamageStk.items.size();
            if (not listDamageStk.items.isEmpty()) {
                for (i in [0..<size])
                    listDamageStk.items[i] = listDamageStk;
            }
            damagestockBean.setDamage_invoice_no(txtDamaStkInvNo.rawText.trim());
            //var commonController: CommonImplements = new CommonController();
            invoiceno = commonController.getListItems(damagestockBean.getDamage_invoice_no(), "", "purinvoiceno");            
            listDamageStk.clearSelection();
            listDamageStk.items = invoiceno.toArray();
            listDamageStk.onKeyPressed = function(e) {
                        if (e.code == KeyCode.VK_ENTER) {
                            txtDamaStkInvNo.text = "{listDamageStk.selectedItem}";
                            var InvNo = "{txtDamaStkInvNo.rawText.trim()}";
                            txtDamageItemname.text = "";
                            damTable.InvoiceNo(InvNo);
                            txtDamaStkInvNo.editable = true;
                            listDamageStk.visible = false;
                            damagestockBean.setDamage_invoice_no(txtDamaStkInvNo.rawText.trim());
                            damagestockBean.setDamage_mfr_name("getDistNamePhone");                           
                            damagestockBean=damagestockController.viewAllRecord(damagestockBean);
                             var itemnobatch = damagestockBean.getDamageStock();
                            txtDamaStkDName.text = damagestockBean.getDamage_dist_name();
                            txtDamaStkCNo.text = damagestockBean.getDamage_contact_no();
//                            for (i in [0..itemnobatch.size()]) {
//                                if (damagestockBean.getDamage_dist_name() != null or damagestockBean.getDamage_contact_no() != null) {
//                                    txtDamaStkDName.text = damagestockBean.getDamage_dist_name();
//                                    txtDamaStkCNo.text = damagestockBean.getDamage_contact_no();
//                                    txtDamageItemname.requestFocus();
//                                } else {
//                                    txtDamaStkDName.text = "";
//                                    txtDamaStkCNo.text = "";
//                                }
//                            }
                            //var itemnobatch = GetSelectClass.getDistNamePhone(txtDamaStkInvNo.rawText.trim());
                            //                            var get1 = GetSelectClass.getDamagedInvoiceno(txtDamaStkInvNo.rawText.trim());
//                            damagestockBean.setDamage_mfr_name("getDamagedInvoiceNo");
                            damagestockBean.setDamage_mfr_name("getItemandBatch");
                            damagestockBean.setDamage_invoice_no(txtDamaStkInvNo.text);
                            damagestockBean=damagestockController.viewAllRecord(damagestockBean);
                            var get1: List = damagestockBean.getDamageStock();
                            if(get1.size()==0)
                                {
                                  FXinfo("This Invoice No all items already saved,please use Edit option");
                                }
                                damagestockBean.setDamage_mfr_name("checkExists");

                            var check: Boolean = damagestockController.viewRecord(damagestockBean) as Boolean;
//                          var check: Boolean = GetSelectClass.checkExists("{txtDamageItemname.rawText.trim()}", txtDamaStkInvNo.rawText.trim());
                            if (check)
                            {
                                damTable.SaveDamage(get1);
                                damTable.focusSet(damTable.getRowCount(), 5);
                                }
                               else
                                {
//                                     if(get1.size()==0)
//                                {
//                                  FXinfo("This Invoice No all items already saved,please use Edit option");
//                                }
                            }

                        } else if (e.code == KeyCode.VK_DOWN) {
                            if (listDamageStk.selectedIndex == 0) {
                                listDamageStk.selectFirstRow();
                            }
                        } else if (e.code == KeyCode.VK_ESCAPE) {
                            listDamageStk.visible = false;
                            txtDamageItemname.requestFocus();
                        }
                        damTable.DamageStockCalculations();
                            updateValues();
                    };
            listDamageStk.onMouseClicked = function(e) {
                        txtDamaStkInvNo.text = "{listDamageStk.selectedItem}";
                        var InvNo = "{txtDamaStkInvNo.rawText.trim()}";
                        damTable.InvoiceNo(InvNo);
                        damagestockBean.setDamage_invoice_no(txtDamaStkInvNo.rawText.trim());
                        damagestockBean.setDamage_mfr_name("getDistNamePhone");
                        //var damagestockController: DamageStocks = new DamageStockController();
                        damagestockBean=damagestockController.viewAllRecord(damagestockBean);
                            txtDamaStkDName.text = damagestockBean.getDamage_dist_name();
                            txtDamaStkCNo.text = damagestockBean.getDamage_contact_no();
                            damagestockBean.setDamage_mfr_name("getItemandBatch");
                            damagestockBean.setDamage_invoice_no(txtDamaStkInvNo.text);
                            damagestockBean=damagestockController.viewAllRecord(damagestockBean);
                            var get1: List = damagestockBean.getDamageStock();
                            if(get1.size()==0)
                                {
                                  FXinfo("This Invoice No all items already saved,please use Edit option");
                                }
                                damagestockBean.setDamage_mfr_name("checkExists");
                            var check: Boolean = damagestockController.viewRecord(damagestockBean) as Boolean;
//                          var check: Boolean = GetSelectClass.checkExists("{txtDamageItemname.rawText.trim()}", txtDamaStkInvNo.rawText.trim());
                            if (check)
                            {
                                damTable.SaveDamage(get1);
                                damTable.focusSet(damTable.getRowCount(), 5);
                                }
                               else
                                {
//                                     if(get1.size()==0)
//                                {
//                                  FXinfo("This Invoice No all items already saved,please use Edit option");
//                                }
                            }
//                        var itemnobatch = damagestockController.viewAllRecord(damagestockBean);
                        //var itemnobatch = GetSelectClass.getDistNamePhone(txtDamaStkInvNo.text);
//                        for (i in [0..itemnobatch.size()]) {
//                            if (damagestockBean.getDamage_dist_name() != null or damagestockBean.getDamage_contact_no() != null) {
//                                txtDamaStkDName.text = damagestockBean.getDamage_dist_name();
//                                txtDamaStkCNo.text = damagestockBean.getDamage_contact_no();
//                                txtDamageItemname.requestFocus();
//                            } else {
//                                txtDamaStkDName.text = "";
//                                txtDamaStkCNo.text = "";
//                            }
//                        }
//                        if (itemnobatch != null) {
//                            txtDamaStkDName.text = GetSelectClass.distName;
//                            txtDamaStkCNo.text = GetSelectClass.contactNo;
//                            txtDamageItemname.requestFocus();
//                        } else {
//                            txtDamaStkDName.text = "";
//                            txtDamaStkCNo.text = "";
//                        }
                        txtDamaStkInvNo.editable = true;
                        txtDamageItemname.text = "";
                        lstDamageItems.visible = false;
                        listDamageStk.visible = false;

                        damTable.DamageStockCalculations();
                            updateValues();
                    }
            var height: Integer = 0;
            if (listDamageStk.items.size() < 9) {
                height = listDamageStk.items.size();
            } else {
                height = 8;
            }

            for (i in [1..height]) {
                listD += 25.0;
            }
            listD -= 3;
        }
        damTable.DamageStockCalculations();
        updateValues();
    }

    var mand = bind listDamageStk.visible on replace {
        if (mand) {
            txtDamaStkInvNo.style = mandatory;
        }
    }
    def kr = KeyRegistry {};
    var key = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 3 and CommonDeclare.form[2] == 5) {
            shortcut(key);
        }
    }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == kr.save /*and not btnDamaStkSave.disable*/) {

            saveDamageStock();
            txtDamaStkInvNo.requestFocus();
            btnDamaStkSave.requestFocus();
        } else if (event.code == kr.edit) {
            if (btnDamaStkEdit.text == "Edit [F6]"/* and btnDamaStkEdit.disable == false*/)
            {

                //              editAllValues();
                btnDamaStkEdit.requestFocus();
                txtDamaStkInvNo.requestFocus();
                btnDamaStkEditAction();                                
            }
        } else if (event.code == kr.reset) {
            if (btnDamaStkReset.text == "Reset [F4]")
            {

                btnDamaStkReset.requestFocus();
                resetDamageValues();
                txtDamaStkInvNo.requestFocus();
            }
        } else if (event.code == kr.update and btnDamaStkEdit.text == "Update [F7]" and not btnDamaStkEdit.disable) {
            //          updateAllValues();

            btnDamaStkEditAction();
            txtDamaStkInvNo.requestFocus();
            btnDamaStkEdit.requestFocus();
        } else if (event.controlDown and event.code == kr.back) {
            if (btnDamaStkCancel.text.equals("Back [Ctrl+Left]")) {
                DamageStockBack();
                txtDamaStkInvNo.requestFocus();
            }
        } else if (event.code == kr.cancel) {
            if (btnDamaStkCancel.text == "Cancel [F8]") { btnDamaStkCancelActionAtShown(); }
        }else if (event.code == kr.rRow) {
            rectDelRow.requestFocus();
            //txtDamaStkCNo.requestFocus();
            var getVal = damTable.removeRow();
            if (getVal == 100) {
            FXinfo("There is no to remove");
            } else if (getVal == 100) {
            FXinfo("Please, Select any one row to remove.");
            }
            damTable.DamageStockCalculations();
            updateValues();
        }
    }

    function getPrivileges(u: String): Void {
        //var commonController: CommonImplements = new CommonController();
        var uname = u;
        var utype = commonController.getUserType(uname);
        if (utype.equals("User")) {
            var priv = commonController.getPrivileges("inventory", uname);
            // var priv = commonController.getPrivilleges("inventory", uname);
            var ss = priv.split(",");
            var val = Integer.parseInt(ss[4]);
            if (val == 1) {
                btnDamaStkSave.disable = true;
                if (btnDamaStkEdit.text == "Update [F7]") {
                    btnDamaStkEdit.disable = true;
                } else {
                    btnDamaStkEdit.disable = false;
                }

            } else if (val == 2) {
                if (btnDamaStkEdit.text != "Update [F7]") {
                    btnDamaStkSave.disable = false;
                } else {
                    btnDamaStkSave.disable = true;
                }
                btnDamaStkEdit.disable = false;
            } else if (val == 3) {
                if (btnDamaStkEdit.text != "Update [F7]") {
                    btnDamaStkSave.disable = false;
                } else {
                    btnDamaStkSave.disable = true;
                }
                btnDamaStkEdit.disable = false;
            }
        } else {
            if (btnDamaStkEdit.text != "Update [F7]") {
                btnDamaStkSave.disable = false;
            } else {
                btnDamaStkSave.disable = true;
            }
            btnDamaStkEdit.disable = false;
        }
    }

    var logUser: String = bind CommonDeclare.user on replace {
        getPrivileges(logUser); updateValues();
    }
    var changPiv = bind btnDamaStkEdit.text on replace {
        getPrivileges(logUser); updateValues();
    }

    function mandatory_textboxes(): Void {
        txtDamageItemname.style = mandatory;
        txtDamaStkInvNo.style = mandatory;
    }

    public function UserLog(formName: String, actionName: String): Void {
        //var commonController: CommonImplements = new CommonController();
        var checkLog = commonController.getUserLog(formName, actionName);
        if (checkLog == false) {

        }
    }
    public function Startup(): Void {
        mandatory_textboxes();
      (table as javax.swing.JTable).addMouseListener(MouseAdapter {
              override public function mouseClicked(arg0: java.awt.event.MouseEvent): Void {
                try {                  
                btnDamaStkReset.requestFocus();
                table.requestFocus();
                  if (headVal) {
                damTable.DamageStockCalculations();
                updateValues();
                updateValues();
                    } else {
                damTable.DamageStockCalculations();
                updateValues();
                updateValues();
                    }
                } catch (ex: Exception) {
                    var msg: String = "Class : Table checkbox Mouse Click   : mouseClicked   = {ex.getMessage()}";
                    log.debug(msg);
                }
            }
        });
        
//
         (table as javax.swing.JTable).getTableHeader().addMouseListener(MouseAdapter {
              override public function mouseClicked(arg0: java.awt.event.MouseEvent): Void {
                try {
                    headVal = Boolean.parseBoolean((table as javax.swing.JTable).getTableHeader().getTable().getValueAt(0, 11).toString());

                    damTable.focusSet(0, 0);
                    damTable.DamageStockCalculations();
                    updateValues();
                } catch (ex: Exception) {
                    var msg: String = "Class : Table Header Mouse Click   : mouseClicked   = {ex.getMessage()}";
                    log.debug(msg);
                }
            }
        });
        (table as javax.swing.JTable).addKeyListener(KeyAdapter {
            override public function keyReleased(e: java.awt.event.KeyEvent): Void {
                //damTable.clickCheck                

                damTable.DamageStockCalculations();                
                updateValues();
            }
            override public function keyTyped(e: java.awt.event.KeyEvent): Void {
                damTable.DamageStockCalculations();                
                updateValues();                
            }
        });
        (table as javax.swing.JTable).getSelectionModel().addListSelectionListener(javax.swing.event.ListSelectionListener {
            override public function valueChanged(e: javax.swing.event.ListSelectionEvent): Void {
                 damTable.DamageStockCalculations();
                 damTable.DamageStockCalculations();
                updateValues();
            }
        });
        fxCalendar.visible = false;
        panel.visible = true;
        CalendarPanel.content = [fxCalendar,];
        txtDamaStkDate.text = DateUtils.now("dd-MM-yyyy");
        imgDate.image = Image { url: "{__DIR__}images/Calender.png" };
        tableComp.layoutX = 0;
        tableComp.layoutY = 0;
        panelTable.content = [tableComp,];
        getPrivileges(logUser);
        txtDamaStkNetAmt.text="0.00";
        damTable.DamageStockCalculations();
        updateValues();
        txtDamaStkInvNo.requestFocus();
    }
}
