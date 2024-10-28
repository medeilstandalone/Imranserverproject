package com.vanuston.medeil.ui;

import javafx.animation.Interpolator;
import javafx.animation.Timeline;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.util.Logger;
import javafx.scene.input.KeyCode;
import java.lang.Exception;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import java.util.List;

public class SalesPurchaseValue {

    var log: Logger = Logger.getLogger(SalesPurchaseValue.class, "Utilities");

    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    def __layoutInfo_separator: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 450.0
        height: 1.0
    }
    public-read def separator: javafx.scene.control.Separator = javafx.scene.control.Separator {
        opacity: 0.3
        layoutX: 10.0
        layoutY: 209.0
        layoutInfo: __layoutInfo_separator
        effect: null
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelLX
        layoutY: bind panelLY
    }
    
    public-read def Violet: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.011764706
        green: 0.5019608
        blue: 0.7607843
    }
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
    }
    
    public-read def Arial_Bold_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 12.0
    }
    
    public-read def Arial_14: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 14.0
    }
    
    def __layoutInfo_txtMonthCreditSales: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        hpos: javafx.geometry.HPos.CENTER
    }
    public-read def txtMonthCreditSales: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 300.0
        layoutY: 115.0
        layoutInfo: __layoutInfo_txtMonthCreditSales
        styleClass: "Borderless-text-box"
        editable: false
        font: Arial_14
    }
    
    def __layoutInfo_txtMonthCardSales: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        hpos: javafx.geometry.HPos.CENTER
    }
    public-read def txtMonthCardSales: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 300.0
        layoutY: 82.0
        layoutInfo: __layoutInfo_txtMonthCardSales
        styleClass: "Borderless-text-box"
        editable: false
        font: Arial_14
    }
    
    def __layoutInfo_txtMonthCashSales: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        hpos: javafx.geometry.HPos.CENTER
    }
    public-read def txtMonthCashSales: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        cursor: null
        layoutX: 300.0
        layoutY: 50.0
        layoutInfo: __layoutInfo_txtMonthCashSales
        styleClass: "Borderless-text-box"
        effect: null
        focusTraversable: true
        editable: false
        font: Arial_14
    }
    
    def __layoutInfo_txtTodayCreditSales: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        hpos: javafx.geometry.HPos.RIGHT
    }
    public-read def txtTodayCreditSales: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 140.0
        layoutY: 115.0
        layoutInfo: __layoutInfo_txtTodayCreditSales
        styleClass: "Borderless-text-box"
        editable: false
        font: Arial_14
    }
    
    def __layoutInfo_txtTodayCardSales: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        hpos: javafx.geometry.HPos.RIGHT
    }
    public-read def txtTodayCardSales: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 140.0
        layoutY: 82.0
        layoutInfo: __layoutInfo_txtTodayCardSales
        styleClass: "Borderless-text-box"
        editable: false
        font: Arial_14
    }
    
    def __layoutInfo_txtTodayCashSales: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        hpos: javafx.geometry.HPos.RIGHT
        vpos: null
    }
    public-read def txtTodayCashSales: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        cursor: null
        layoutX: 140.0
        layoutY: 50.0
        layoutInfo: __layoutInfo_txtTodayCashSales
        styleClass: "Borderless-text-box"
        effect: null
        editable: false
        font: Arial_14
    }
    
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 40.0
        layoutY: 113.0
        text: "Credit"
        font: Arial_14
    }
    
    public-read def lbl_card_sales: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 40.0
        layoutY: 80.0
        text: "Card"
        font: Arial_14
    }
    
    public-read def lbl_cash_sales: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 40.0
        layoutY: 50.0
        text: "Cash "
        font: Arial_14
    }
    
    public-read def Arial_Bold_14: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 14.0
    }
    
    def __layoutInfo_btnOk: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 96.0
    }
    public-read def btnOk: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: 200.0
        layoutY: 334.0
        layoutInfo: __layoutInfo_btnOk
        onKeyPressed: btnOkOnKeyPressed
        onMouseClicked: btnOkOnMouseClicked
        text: "OK"
        font: Arial_Bold_14
        textWrap: false
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
    
    def __layoutInfo_label11: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 200.0
        height: 26.0
    }
    public-read def label11: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 40.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_label11
        text: "Total Sales & Purchase"
        font: Arial_18
        textFill: javafx.scene.paint.Color.WHITE
    }
    
    public-read def Arial_Bold_18: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 18.0
    }
    
    def __layoutInfo_txtMonthPurchase: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 100.0
        hpos: null
    }
    public-read def txtMonthPurchase: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        cursor: null
        layoutX: 292.0
        layoutY: 280.0
        layoutInfo: __layoutInfo_txtMonthPurchase
        styleClass: "Borderless-text-box"
        effect: null
        editable: false
        columns: 10.0
        font: Arial_Bold_18
        multiline: false
    }
    
    def __layoutInfo_txtTodayPurchase: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 100.0
    }
    public-read def txtTodayPurchase: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 135.0
        layoutY: 280.0
        layoutInfo: __layoutInfo_txtTodayPurchase
        styleClass: "Borderless-text-box"
        editable: false
        font: Arial_Bold_18
    }
    
    def __layoutInfo_txtMonthTotalSales: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 100.0
    }
    public-read def txtMonthTotalSales: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 292.0
        layoutY: 164.0
        layoutInfo: __layoutInfo_txtMonthTotalSales
        styleClass: "Borderless-text-box"
        editable: false
        font: Arial_Bold_18
    }
    
    def __layoutInfo_txtTodayTotalSales: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 100.0
    }
    public-read def txtTodayTotalSales: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        cursor: null
        layoutX: 135.0
        layoutY: 164.0
        layoutInfo: __layoutInfo_txtTodayTotalSales
        styleClass: "Borderless-text-box"
        effect: null
        focusTraversable: true
        editable: false
        font: Arial_Bold_18
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
    
    public-read def Arial_25: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
        size: 25.0
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
    
    public-read def RectTitle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        opacity: 1.0
        cursor: javafx.scene.Cursor.MOVE
        layoutX: 0.0
        layoutY: 0.0
        styleClass: ""
        onMouseDragged: RectTitleOnMouseDragged
        onMousePressed: RectTitleOnMousePressed
        fill: DarkGray
        stroke: null
        width: 475.0
        height: 26.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.4
    }
    
    public-read def label6: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 40.0
        layoutY: 282.0
        text: "Total "
        font: Arial_Bold_16
        textFill: Green
    }
    
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 40.0
        layoutY: 164.0
        text: "Total"
        font: Arial_Bold_16
        textAlignment: null
        textFill: Green
    }
    
    def __layoutInfo_label4: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 191.0
    }
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 275.0
        layoutY: 240.0
        layoutInfo: __layoutInfo_label4
        text: "Current Month Purchase"
        font: Arial_Bold_16
        textAlignment: javafx.scene.text.TextAlignment.LEFT
        textWrap: true
        textFill: Green
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 140.0
        layoutY: 240.0
        text: "Today Purchase"
        font: Arial_Bold_16
        textFill: Green
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        managed: true
        layoutX: 275.0
        layoutY: 21.0
        text: "Current Month Sales"
        font: Arial_Bold_16
        textFill: Green
    }
    
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 140.0
        layoutY: 21.0
        text: "Today Sales"
        font: Arial_Bold_16
        textFill: Green
    }
    
    def __layoutInfo_panel2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 475.0
        height: 425.0
    }
    public-read def panel2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutY: 30.0
        layoutInfo: __layoutInfo_panel2
        content: [ txtTodayTotalSales, label, label2, txtMonthTotalSales, txtTodayPurchase, label3, label4, txtMonthPurchase, btnOk, lbl_cash_sales, lbl_card_sales, label7, txtTodayCashSales, txtTodayCardSales, txtTodayCreditSales, txtMonthCashSales, txtMonthCardSales, txtMonthCreditSales, label5, label6, separator, ]
    }
    
    public-read def Arial_Bold_30: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 30.0
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.87058824
        green: 0.8392157
        blue: 0.8392157
    }
    
    public-read def imageMedeil: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Medil Logo.png"
    }
    
    public-read def imageicon: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/MenuAboutMedeil.png"
    }
    
    public-read def imageView2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 8.0
        layoutY: 4.0
        image: imageicon
        fitWidth: 16.0
        fitHeight: 16.0
    }
    
    public-read def imageClose: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Close.png"
    }
    
    public-read def imgClose: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        opacity: bind opacClose
        cursor: javafx.scene.Cursor.DEFAULT
        layoutX: 450.0
        layoutY: 0.0
        onMouseClicked: imgCloseOnMouseClicked
        onMouseEntered: imgCloseOnMouseEntered
        onMouseExited: imgCloseOnMouseExited
        blocksMouse: true
        image: imageClose
    }
    
    public-read def panelheader: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ panel2, RectTitle, label11, imageView2, imgClose, panelAlert, ]
    }
    
    public-read def imagevanuston: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Vanuston Logo.png"
    }
    
    public-read def Arial_Bold_13: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 13.0
    }
    
    public-read def dropShadowEffect: javafx.scene.effect.DropShadow = javafx.scene.effect.DropShadow {
    }
    
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 1.0
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "DialogBox"
        effect: dropShadowEffect
        fill: linearGradient
        stroke: DarkGray
        strokeWidth: 4.0
        width: 475.0
        height: 425.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        opacity: bind PanelOpacity
        layoutX: bind panelLX
        layoutY: bind panelLY
        blocksMouse: false
        content: [ rectangle, panelheader, ]
    }
    
    public-read def panelReturnNotes: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        blocksMouse: false
        content: [ panel, ]
    }
    
    public-read def linearGradient2: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        startX: 1.0
        startY: 0.0
        endX: 0.0
        proportional: true
        cycleMethod: javafx.scene.paint.CycleMethod.NO_CYCLE
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#ffffff") }, javafx.scene.paint.Stop { offset: 0.2, color: javafx.scene.paint.Color.web ("#ffffff") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#93c028") }, ]
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panelReturnNotes, ]
    }
    // </editor-fold>//GEN-END:main

    function btnOkOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        Hide();
    }
    function btnOkOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
         if(event.code == KeyCode.VK_ENTER) {
            Hide();
       }
    }
           
    var panelW = bind CommonDeclare.ScreenWidth;
    var panelH = bind CommonDeclare.ScreenHeight;
    var PanelOpacity: Number = 0.0;
    var panelStartLX: Number;
    var panelStartLY: Number;
    var panelLX: Number =  bind CommonDeclare.Column2LX+40;
    var panelLY: Number = 180.0; //(panelH - 150) / 2;

    function RectTitleOnMouseDragged(e: javafx.scene.input.MouseEvent): Void {
//        var LX = e.screenX - panelStartLX;
//        var LY = e.screenY - panelStartLY;
//        if (LX > 0 and (LX + 25) < panelW)
//            panelLX = e.screenX - panelStartLX;
//        if (LY > 0 and (LY + 25) < panelH)
//            panelLY = e.screenY - panelStartLY;
    }

    function RectTitleOnMousePressed(e: javafx.scene.input.MouseEvent): Void {
        panelStartLX = e.screenX - panelLX;
        panelStartLY = e.screenY - panelLY;
    }

    function imgCloseOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        Hide();
    }

    function imgCloseOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        fadeClose.rate = -1.0;
        fadeClose.play();
    }

    function imgCloseOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        fadeClose.rate = 1.0;
        fadeClose.play();
    }

    var opacClose = 0.5;
    var fadeClose = Timeline {
                keyFrames: [
                    at (0s) {opacClose => 0.2 tween Interpolator.LINEAR},
                    at (0.1s) {opacClose => 0.3 tween Interpolator.LINEAR},
                    at (0.2s) {opacClose => 0.4 tween Interpolator.LINEAR},
                    at (0.5s) {opacClose => 0.8 tween Interpolator.LINEAR},
                    at (0.8s) {opacClose => 1.0 tween Interpolator.LINEAR},
                ]
            };

    public function Hide(): Void {
        fadePanel.rate = -1.0;
        fadePanel.play();
        panel.visible = false;
    }
    public function Show(): Void {
        panel.visible = true;
        fadePanel.rate = 1.0;
        fadePanel.play();
    }

    public function Startup() {
        try {
        var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
        var salespurList:List = commonController.getSalesPurchase();
        txtMonthCashSales.text = "{salespurList.get(0).toString()}0";
        txtMonthCreditSales.text = "{salespurList.get(1).toString()}0";
        txtMonthCardSales.text = "{salespurList.get(2).toString()}0";
        txtMonthTotalSales.text = "{salespurList.get(3).toString()}0";
        txtTodayCashSales.text = "{salespurList.get(4).toString()}0";
        txtTodayCreditSales.text = "{salespurList.get(5).toString()}0";
        txtTodayCardSales.text = "{salespurList.get(6).toString()}0";
        txtTodayTotalSales.text = "{salespurList.get(7).toString()}0";
        txtMonthPurchase.text = "{salespurList.get(8).toString()}0";
        txtTodayPurchase.text = "{salespurList.get(9).toString()}0";                
        btnOk.requestFocus();
        }
        catch(e:Exception) {
            var ss:String = "Class : SalesPurchaseValue  Method  : Startup() Exception:{e.getMessage()}";
            log.debug(ss);
        }
    }

    var fadePanel = Timeline {
                keyFrames: [
                    at (0s) {PanelOpacity => 0.0 tween Interpolator.LINEAR},
                    at (0.1s) {PanelOpacity => 0.75 tween Interpolator.LINEAR},
                    at (0.3s) {PanelOpacity => 1.0 tween Interpolator.LINEAR},
                ]
            };
}
