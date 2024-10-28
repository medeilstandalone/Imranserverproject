package com.vanuston.medeil.ui;

import javafx.animation.Interpolator;
import javafx.animation.Timeline;
import java.lang.String;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.util.Logger;
import javafx.scene.input.KeyCode;
import com.vanuston.medeil.util.DateUtils;
import java.lang.Exception;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;

public class PurchaseReturnNotes {

    var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    var log: Logger = Logger.getLogger(PurchaseReturnNotes.class, "PurchaseReturnNotes");
    var dutils = new DateUtils();
    public var note_title = "";
    var note_no: String = "Nil";
    var note_date: String = "Nil";
    var note_issued: String = "Nil";
    var note_invoice: String = "Nil";
    var note_amt: String = "Nil";
    var option: Integer = 0;
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    def __layoutInfo_txtRetNoteDetails: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 260.0
        height: 80.0
    }
    public-read def txtRetNoteDetails: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutInfo: __layoutInfo_txtRetNoteDetails
        lines: 10.0
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
    
    def __layoutInfo_label: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: 80.0
    }
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutInfo: __layoutInfo_label
        text: "Details   "
        font: Arial_Bold_12
    }
    
    public-read def hbox: javafx.scene.layout.HBox = javafx.scene.layout.HBox {
        layoutX: 60.0
        layoutY: 210.0
        content: [ label, txtRetNoteDetails, ]
        spacing: 6.0
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
    
    def __layoutInfo_label11: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 300.0
        height: 26.0
    }
    public-read def label11: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 40.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_label11
        text: bind "{note_title} Note"
        font: Arial_18
        textFill: javafx.scene.paint.Color.WHITE
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
    
    def __layoutInfo_button2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 80.0
        height: 30.0
    }
    public-read def button2: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: 100.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_button2
        onKeyPressed: button2OnKeyPressed
        effect: reflectionEffect
        text: "Cancel"
        font: Arial_Bold_14
        action: button2Action
    }
    
    def __layoutInfo_button: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 80.0
        height: 30.0
    }
    public-read def button: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutInfo: __layoutInfo_button
        onKeyPressed: buttonOnKeyPressed
        effect: reflectionEffect
        text: "OK"
        font: Arial_Bold_14
        action: buttonAction
    }
    
    public-read def hbox2: javafx.scene.layout.HBox = javafx.scene.layout.HBox {
        layoutX: 100.0
        layoutY: 310.0
        content: [ button, button2, ]
        spacing: 6.0
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
    
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        text: bind note_amt
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def label8: javafx.scene.control.Label = javafx.scene.control.Label {
        text: bind note_invoice
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        text: bind note_issued
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def labelpdtUpdated: javafx.scene.control.Label = javafx.scene.control.Label {
        text: bind note_date
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def labelpdtVersion: javafx.scene.control.Label = javafx.scene.control.Label {
        text: bind note_no
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def vbox2: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        layoutX: 225.0
        layoutY: 40.0
        content: [ labelpdtVersion, labelpdtUpdated, label7, label8, label5, ]
        spacing: 20.0
    }
    
    public-read def label18: javafx.scene.control.Label = javafx.scene.control.Label {
        text: ":"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def label16: javafx.scene.control.Label = javafx.scene.control.Label {
        text: ":"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def label15: javafx.scene.control.Label = javafx.scene.control.Label {
        text: ":"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def label19: javafx.scene.control.Label = javafx.scene.control.Label {
        text: ":"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def label20: javafx.scene.control.Label = javafx.scene.control.Label {
        text: ":"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def vbox1: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        layoutX: 175.0
        layoutY: 40.0
        content: [ label20, label19, label15, label16, label18, ]
        spacing: 18.0
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Amount"
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Invoice No."
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Issued to"
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def label10: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Date"
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: true
        text: bind "{note_title} Note No"
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def vbox: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        layoutX: 60.0
        layoutY: 40.0
        content: [ label9, label10, label3, label4, label2, ]
        spacing: 20.0
    }
    
    public-read def panelLicenceInfo: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: 125.0
        layoutY: 30.0
        content: [ vbox, vbox1, vbox2, hbox, hbox2, ]
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
        width: 600.0
        height: 26.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.4
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
        url: "{__DIR__}images/LogoMedil.png"
    }
    
    public-read def imageView2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 8.0
        layoutY: 4.0
        image: imageicon
        fitWidth: 20.0
        fitHeight: 20.0
    }
    
    public-read def imageClose: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Close.png"
    }
    
    public-read def imgClose: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        opacity: bind opacClose
        cursor: javafx.scene.Cursor.DEFAULT
        layoutX: 575.0
        layoutY: 0.0
        onMouseClicked: imgCloseOnMouseClicked
        onMouseEntered: imgCloseOnMouseEntered
        onMouseExited: imgCloseOnMouseExited
        blocksMouse: true
        image: imageClose
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
        width: 600.0
        height: 400.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def panelheader: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ rectangle, RectTitle, panelLicenceInfo, label11, imageView2, imgClose, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        opacity: bind PanelOpacity
        layoutX: bind panelLX
        layoutY: bind panelLY
        blocksMouse: false
        content: [ panelheader, ]
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

    function button2OnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            button2Action();
        }
    }

    function buttonOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            buttonAction();
        }
    }

    function button2Action(): Void {
        Hide();
    }

    function buttonAction(): Void {
        try {
            if (option == 0) {
                var sql = "INSERT INTO debit_note(debit_note_no,issued_against,debit_opt,debit_date,invoiceorbill_no,name,amount,details) VALUES ('{note_no}','Distributor','Purchase Return','{dutils.changeFormatDate(note_date)}','{note_invoice}','{note_issued}','{note_amt}','{txtRetNoteDetails.rawText}')";
                commonController.queryExecution(sql);
            } else if (option == 1) {
                var sql = "UPDATE debit_note SET issued_against='Distributor',debit_opt='Purchase Return',debit_date='{dutils.changeFormatDate(note_date)}',invoiceorbill_no='{note_invoice}',name='{note_issued}',amount='{note_amt}',details='{txtRetNoteDetails.rawText}' WHERE debit_note_no='{note_no}'";
                commonController.queryExecution(sql);
            }
        } catch (e: Exception) {
            log.debug("Class : PurchaseReturnNotes   Method: buttonAction() Exception:{e.getMessage()}");
        }
        Hide();
    }

    public function setValues(v: String[]): Void {
        note_no = v[0];
        note_date = v[1];
        note_issued = v[2];
        note_invoice = v[3];
        note_amt = v[4];
        txtRetNoteDetails.text = v[5];
        option = Integer.parseInt(v[6]);
    }

    var panelW = bind CommonDeclare.ScreenWidth;
    var panelH = bind CommonDeclare.ScreenHeight;
    var PanelOpacity: Number = 0.0;
    var panelStartLX: Number;
    var panelStartLY: Number;
    var panelLX: Number = (panelW - 600) / 2;
    var panelLY: Number = 100.0;

    function RectTitleOnMouseDragged(e: javafx.scene.input.MouseEvent): Void {
        var LX = e.screenX - panelStartLX;
        var LY = e.screenY - panelStartLY;
        if (LX > 0 and (LX + 25) < panelW)
            panelLX = e.screenX - panelStartLX;
        if (LY > 0 and (LY + 25) < panelH)
            panelLY = e.screenY - panelStartLY;
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
        clearAll();
    }

    public function Show(): Void {
        panel.visible = true;
        fadePanel.rate = 1.0;
        fadePanel.play();
    }

    var fadePanel = Timeline {
                keyFrames: [
                    at (0s) {PanelOpacity => 0.0 tween Interpolator.LINEAR},
                    at (0.1s) {PanelOpacity => 0.75 tween Interpolator.LINEAR},
                    at (0.3s) {PanelOpacity => 1.0 tween Interpolator.LINEAR},
                ]
            };

    function clearAll(): Void {
        note_no = "Nil";
        note_date = "Nil";
        note_issued = "Nil";
        note_invoice = "Nil";
        note_amt = "Nil";
        txtRetNoteDetails.text = "";
        option = 0;
    }

}
