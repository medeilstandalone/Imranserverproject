package com.vanuston.medeil.ui;

import com.vanuston.medeil.util.BillPrint;
import com.vanuston.medeil.util.GetBillPrintSet;
import javafx.scene.image.Image;
import java.lang.Exception;
import com.vanuston.medeil.util.Upload;
import net.sf.jasperreports.engine.JasperCompileManager;
import java.io.File;
import com.vanuston.medeil.util.ModifyXMLContent;
import net.sf.jasperreports.engine.util.JRLoader;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.util.KeyRegistry;
import javafx.scene.input.KeyEvent;
import com.vanuston.medeil.util.Validation;
import javafx.scene.input.KeyCode;

import com.vanuston.medeil.controller.BillPrintController;

/**
 * @author Administrator
 */
public class NewbillFormat {

    var panelW = bind CommonDeclare.panelFormW;
    var panelH = bind CommonDeclare.panelFormH;
    var billtype: String;
    var col: String = "";
    var opt: Boolean;
    var repVal1: String[] = ["", "", "", "", "", ""];
    var repVal2: String[] = ["", "", "", ""];
    var val: Validation = new Validation();
    var selToggle: Integer;
    var show: Integer = 0;
    var bottonW = bind CommonDeclare.bottonW;
    var bottonH = bind CommonDeclare.bottonH;
     var panelButtonsLY = bind CommonDeclare.panelButtonsLY-50;
      var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;

    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    def __layoutInfo_label: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 150.0
    }
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutInfo: __layoutInfo_label
        text: "Label"
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtcustSelect: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 320.0
    }
    public-read def txtcustSelect: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: true
        layoutX: 170.0
        layoutY: 40.0
        layoutInfo: __layoutInfo_txtcustSelect
        editable: true
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtPrePrintselect: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 295.0
    }
    public-read def txtPrePrintselect: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 170.0
        layoutY: 40.0
        layoutInfo: __layoutInfo_txtPrePrintselect
    }
    
    def __layoutInfo_lstCustomView: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 318.0
        height: 275.0
    }
    public-read def lstCustomView: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: 171.0
        layoutY: 60.0
        layoutInfo: __layoutInfo_lstCustomView
        onMouseClicked: lstCustomViewOnMouseClicked
        items: [ "W:21.0 X H:29.7CM(A4) FORMAT", "W:15.4 X H:13.8 CM FORMAT", "W:14.8 X H:20.7CM(A5) FORMAT", "W:9.9 X H:21CM FORMAT With BatchMfrExpiry", "W:9.9 X H:21CM FORMAT With VAT perc and Amt", "W:10.6 X H:21CM FORMAT with BatchMfrExpiry", "W:11.1 X H:9.3CM FORMAT with BatchExpiry", "W:11.1 X H:9.3CM FORMAT with BatchMfrExpiry", "W:12 X H:10.6CM FORMAT with BatchMfrExpiryPrice", "W:12.3 X H:13.8CM FORMAT Small Font", "W:14.8 X H:20.7CM FORMAT with VAT", ]
    }
    
    def __layoutInfo_lstPrePrintView: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 290.0
        height: 50.0
    }
    public-read def lstPrePrintView: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: 171.0
        layoutY: 60.0
        layoutInfo: __layoutInfo_lstPrePrintView
        onMouseClicked: lstPrePrintViewOnMouseClicked
        items: [ "W:20.9 X H:10.1CM  FORMAT", "W:21.0 X H:10.2 CM FORMAT", ]
    }
    
    def __layoutInfo_txtPrintMessage: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 425.0
    }
    public-read def txtPrintMessage: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        managed: true
        layoutX: 180.0
        layoutY: 400.0
        layoutInfo: __layoutInfo_txtPrintMessage
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
    }
    
    public-read def toggleGroup: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    def __layoutInfo_toggleButton5: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 120.0
        height: 30.0
    }
    public-read def toggleButton5: javafx.scene.control.ToggleButton = javafx.scene.control.ToggleButton {
        layoutX: 480.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_toggleButton5
        onMouseClicked: toggleButton5OnMouseClicked
        text: "Pre Print"
        toggleGroup: toggleGroup
    }
    
    def __layoutInfo_toggleButton4: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 120.0
        height: 30.0
    }
    public-read def toggleButton4: javafx.scene.control.ToggleButton = javafx.scene.control.ToggleButton {
        layoutX: 360.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_toggleButton4
        onMouseClicked: toggleButton4OnMouseClicked
        text: "POS"
        toggleGroup: toggleGroup
    }
    
    def __layoutInfo_toggleButton3: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 120.0
        height: 30.0
    }
    public-read def toggleButton3: javafx.scene.control.ToggleButton = javafx.scene.control.ToggleButton {
        layoutX: 240.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_toggleButton3
        onMouseClicked: toggleButton3OnMouseClicked
        text: "Custom"
        toggleGroup: toggleGroup
    }
    
    def __layoutInfo_toggleButton2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 120.0
        height: 30.0
    }
    public-read def toggleButton2: javafx.scene.control.ToggleButton = javafx.scene.control.ToggleButton {
        layoutX: 120.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_toggleButton2
        onMouseClicked: toggleButton2OnMouseClicked
        effect: null
        text: "Basic"
        toggleGroup: toggleGroup
    }
    
    def __layoutInfo_toggleButton: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 120.0
        height: 30.0
    }
    public-read def toggleButton: javafx.scene.control.ToggleButton = javafx.scene.control.ToggleButton {
        layoutX: 0.0
        layoutY: -1.0
        layoutInfo: __layoutInfo_toggleButton
        onMouseClicked: toggleButtonOnMouseClicked
        text: "Advanced"
        toggleGroup: toggleGroup
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.88235295
        green: 0.95686275
        blue: 0.9843137
    }
    
    public-read def rectPreprint: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        opacity: 1.0
        fill: color
        stroke: null
        width: 850.0
        height: 500.0
        arcWidth: 0.0
    }
    
    public-read def rectPos: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        fill: color
        width: 850.0
        height: 500.0
    }
    
    public-read def rectCustom: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        fill: color
        width: 850.0
        height: 500.0
    }
    
    public-read def rectBasic: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        fill: color
        width: 850.0
        height: 500.0
    }
    
    public-read def rectAdvance: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        fill: color
        width: 850.0
        height: 500.0
    }
    
    public-read def font: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "ARIAL"
    }
    
    public-read def ARIAL: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "ARIAL_14"
        size: 14.0
        oblique: false
        embolden: true
    }
    
    public-read def lblPrint: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 90.0
        layoutY: 400.0
        text: "Print Text"
        font: ARIAL
    }
    
    def __layoutInfo_btnCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: 350.0
        layoutY: bind panelButtonsLY
        layoutInfo: __layoutInfo_btnCancel
        text: "Cancel"
        font: ARIAL
        action: btnCancelAction
    }
    
    def __layoutInfo_btnSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: 190.0
        layoutY: bind panelButtonsLY
        layoutInfo: __layoutInfo_btnSave
        text: "Apply"
        font: ARIAL
        action: btnSaveAction
    }
    
    public-read def lblPreprintBill: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 40.0
        layoutY: 40.0
        text: "Pre-Print Formats"
        font: ARIAL
    }
    
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: true
        layoutX: 40.0
        layoutY: 40.0
        text: "Preprint Format"
        font: ARIAL
    }
    
    public-read def radPOSBill: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: true
        managed: true
        layoutX: 50.0
        layoutY: 100.0
        onMouseClicked: radPOSBillOnMouseClicked
        text: "POS Bill Format"
        font: ARIAL
        toggleGroup: toggleGroup
        selected: false
    }
    
    public-read def panelPOS: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        content: [ rectPos, radPOSBill, label4, ]
    }
    
    public-read def lblCustomBill: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 10.0
        layoutY: 15.0
        text: "Custom Formats"
        font: ARIAL
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: true
        layoutX: 40.0
        layoutY: 40.0
        text: "Customs Formats"
        font: ARIAL
    }
    
    public-read def chkBillSet4: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        layoutX: 120.0
        layoutY: 240.0
        onMouseClicked: chkBillSet4OnMouseClicked
        text: "Expiry Date"
        font: ARIAL
    }
    
    public-read def chkBillSet3: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        layoutX: 120.0
        layoutY: 220.0
        onMouseClicked: chkBillSet3OnMouseClicked
        text: "Batch No"
        font: ARIAL
    }
    
    public-read def chkBillSet1: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        layoutX: 120.0
        layoutY: 200.0
        onMouseClicked: chkBillSet1OnMouseClicked
        text: "Mfrs. Name"
        font: ARIAL
    }
    
    public-read def chkBasic3: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        disable: true
        layoutX: 120.0
        layoutY: 180.0
        text: "Amount"
        font: ARIAL
        selected: true
    }
    
    public-read def chkBillSet2: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        disable: true
        layoutX: 120.0
        layoutY: 160.0
        text: "Unit Price"
        font: ARIAL
        selected: true
    }
    
    public-read def chkBasic2: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        disable: true
        layoutX: 120.0
        layoutY: 140.0
        text: "Quantity"
        font: ARIAL
        selected: true
    }
    
    public-read def chkBasic1: javafx.scene.control.CheckBox = javafx.scene.control.CheckBox {
        disable: true
        layoutX: 120.0
        layoutY: 120.0
        text: "Particulars"
        font: ARIAL
        selected: true
    }
    
    public-read def radBasicBill: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: 50.0
        layoutY: 100.0
        onMouseClicked: radBasicBillOnMouseClicked
        text: "Basic Bill Format"
        font: ARIAL
        toggleGroup: toggleGroup
    }
    
    public-read def panelBasic: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        content: [ rectBasic, label2, radBasicBill, chkBasic1, chkBasic2, chkBillSet2, chkBasic3, chkBillSet1, chkBillSet3, chkBillSet4, ]
    }
    
    public-read def radAdvanceBill: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: 50.0
        layoutY: 100.0
        onMouseClicked: radAdvanceBillOnMouseClicked
        text: "Advanced Bill Format"
        font: ARIAL
        toggleGroup: toggleGroup
    }
    
    public-read def panelAdvance: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        content: [ rectAdvance, label, radAdvanceBill, ]
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
    }
    
    public-read def image2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
        placeholder: null
    }
    
    def __layoutInfo_imagePreview: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 0.0
        height: 0.0
    }
    public-read def imagePreview: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 300.0
        layoutY: 80.0
        layoutInfo: __layoutInfo_imagePreview
        image: image2
        fitWidth: 500.0
        fitHeight: 300.0
    }
    
    public-read def imgPrePrintDown: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 460.0
        layoutY: 41.0
        onMouseClicked: imgPrePrintDownOnMouseClicked
        image: image2
        fitHeight: 20.0
    }
    
    public-read def panelPreprint: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        content: [ rectPreprint, label5, txtPrePrintselect, lblPreprintBill, imgPrePrintDown, ]
    }
    
    public-read def imgCustomDown: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 485.0
        layoutY: 41.0
        onMouseClicked: imgCustomDownOnMouseClicked
        image: image2
        fitHeight: 20.0
    }
    
    public-read def panelCustom: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        content: [ rectCustom, label3, txtcustSelect, lblCustomBill, imgCustomDown, ]
    }
    
    def __layoutInfo_panelDisplay: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 750.0
        height: 500.0
    }
    public-read def panelDisplay: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: 0.0
        layoutY: 25.0
        layoutInfo: __layoutInfo_panelDisplay
        content: [ panelAdvance, panelBasic, panelCustom, panelPOS, panelPreprint, imagePreview, lstCustomView, lstPrePrintView, txtPrintMessage, btnSave, panelAlert, btnCancel, lblPrint, ]
    }
    
    public-read def imgBillWithAdvancedPrint: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/BillImages/BillWithAdvancedPrint.PNG"
        width: 500.0
        height: 300.0
        placeholder: null
    }
    
    public-read def imgBillwithBasicPrint: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/BillImages/BillwithBasicPrint.PNG"
        placeholder: null
    }
    
    public-read def imgBillwithBatchExpiry: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/BillImages/BillwithBatchExpiry.PNG"
        placeholder: null
    }
    
    public-read def imgBillwithExpiryOnly: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/BillImages/BillwithExpiryOnly.PNG"
        placeholder: null
    }
    
    public-read def imgBillwithMFRExpiry: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/BillImages/BillwithMFRExpiry.PNG"
        placeholder: null
    }
    
    public-read def imgBillwithBatchonly: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/BillImages/BillwithBatchonly.PNG"
        placeholder: null
    }
    
    public-read def imgBillwithMFRBatch: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/BillImages/BillwithMFRBatch.PNG"
    }
    
    public-read def imgBillwithMfronly: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/BillImages/BillwithMfronly.PNG"
        placeholder: null
    }
    
    public-read def imgBillwithA5: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/BillImages/Billwitha5format.PNG"
        placeholder: null
    }
    
    public-read def W21_0XH29_7: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/BillImages/W21_0XH29_7.png"
        width: 500.0
        height: 300.0
        placeholder: null
    }
    
    public-read def W15_4XH13_8: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/BillImages/W15_4XH13_8.png"
        width: 500.0
        height: 300.0
        placeholder: null
    }
    
    public-read def W14_8XH20_7: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/BillImages/W14_8XH20_7.png"
        width: 500.0
        height: 300.0
        placeholder: null
    }
    
    public-read def imgBillwithPosPrint: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/BillImages/BillwithPosOnly.png"
        smooth: true
        placeholder: null
    }
    
    public-read def imgmalar: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/BillImages/bill-model-1.jpg"
    }
    
    public-read def imgkaru: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/BillImages/bill-model-2.jpg"
    }
    
    public-read def linearGradient: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#FFFFFF") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#000000") }, ]
    }
    
    public-read def darkGray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.2
        blue: 0.2
    }
    
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        styleClass: "form-background"
        fill: linearGradient
        stroke: darkGray
        width: bind panelW
        height: bind panelH
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ rectangle, toggleButton, toggleButton2, toggleButton3, toggleButton4, toggleButton5, panelDisplay, ]
    }
    
    public-read def scene: javafx.scene.Scene = javafx.scene.Scene {
        content: getDesignRootNodes ()
        fill: javafx.scene.paint.Color.WHITE
    }
    
    public-read def W9_9XH21BME: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/BillImages/W9_9XH21BME.png"
    }
    
    public-read def W9_9XH21VA: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/BillImages/W9_9XH21VA.png"
    }
    
    public-read def W10_6XH21BME: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/BillImages/W10_6XH21BME.png"
    }
    
    public-read def W11_1XH9_3BE: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/BillImages/W11_1XH9_3BE.png"
        backgroundLoading: false
    }
    
    public-read def W11_1XH9_3BME: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/BillImages/W11_1XH9_3BME.png"
    }
    
    public-read def W12_3XH13_8SM: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/BillImages/W12_3XH13_8SM.png"
    }
    
    public-read def W12XH10_6BMEP: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/BillImages/W12XH10_6BMEP.png"
    }
    
    public-read def W14_8XH20_7V: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/BillImages/W14_8XH20_7V.png"
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel, ]
    }
    
    public function getDesignScene (): javafx.scene.Scene {
        scene
    }
    // </editor-fold>//GEN-END:main

    function btnCancelAction(): Void {
        panel.visible=false;
         }
 function imgCustomDownOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        //reset();
        lstCustomView.visible = true;
        selToggle=3;
    }
    function imgPrePrintDownOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        //reset();
        lstPrePrintView.visible = true;
        selToggle == 5;
    }

    function lstPrePrintViewOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if(selToggle==0)
        {
        selToggle = 5;
        
        }
        getBillFormatAll();        
    }

    function lstCustomViewOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        selToggle == 3;
        getBillFormatAll();        
    }

    var sel;

    function getBillFormatAll(): Void {

        if (selToggle == 3) {
            lstCustomView.onKeyPressed = function(e) {
                        if (e.code == KeyCode.VK_ENTER) {
                            txtcustSelect.text = "{lstCustomView.selectedItem}";
                            lstCustomView.visible = false;
                            txtcustSelect.requestFocus();
                        } else if (e.code == KeyCode.VK_DOWN) {
                            if (lstCustomView.selectedIndex == 0) {
                                lstCustomView.requestFocus();
                                lstCustomView.selectFirstRow();
                            }
                        } else if (e.code == KeyCode.VK_ESCAPE) {
                            lstCustomView.requestFocus();
                            lstCustomView.visible = false;
                            txtcustSelect.requestFocus();
                        }
                    };
            lstCustomView.onMouseClicked = function(e) {
                        txtcustSelect.text = "{lstCustomView.selectedItem}";
                        sel = lstCustomView.selectedItem;
                        lstCustomView.visible = false;
                        txtcustSelect.requestFocus();
                        
                    }
        //listHeight();
        }else
        if (selToggle == 5) {
            lstPrePrintView.onKeyPressed = function(e) {
                        if (e.code == KeyCode.VK_ENTER) {
                            txtPrePrintselect.text = "{lstPrePrintView.selectedItem}";
                            lstPrePrintView.visible = false;
                            txtPrePrintselect.requestFocus();
                        } else if (e.code == KeyCode.VK_DOWN) {
                            if (lstPrePrintView.selectedIndex == 0) {
                                lstPrePrintView.requestFocus();
                                lstPrePrintView.selectFirstRow();
                            }
                        } else if (e.code == KeyCode.VK_ESCAPE) {
                            lstPrePrintView.requestFocus();
                            lstPrePrintView.visible = false;
                            txtPrePrintselect.requestFocus();
                        }
                    };
            lstPrePrintView.onMouseClicked = function(e) {
                        txtPrePrintselect.text = "{lstPrePrintView.selectedItem}";
                        sel = lstPrePrintView.selectedItem;
                        lstPrePrintView.visible = false;
                        txtPrePrintselect.requestFocus();
                        
                    }
        }
    //listHeight();
    }

    var textchange = bind txtcustSelect.rawText.trim() on replace {
        imagePreview.visible = true;
        Preview();
    }
    var textchange1 = bind txtPrePrintselect.rawText.trim() on replace {
        imagePreview.visible = true;
        Preview();
    }

    function findBillFormat(valSel: String): Void {
         var currentDir = new File(".").getAbsolutePath();
     currentDir=currentDir.replace("\\.", "\\");
     currentDir=currentDir.replace("dist\\", "");
        if (valSel.equals("W:21.0 X H:29.7CM(A4) FORMAT")) {
            try {
                billtype = "W:21.0 X H:29.7CM(A4) FORMAT";
                col = "Custom";
                repVal2 = [txtPrintMessage.rawText];
                var searchVal: String[] = ["Wish You a Speed Recovery!"];
                Upload.copy(new File("{currentDir}printerfiles/W16.5XH10.6.jrxml"), new File("{currentDir}printerfiles/Print.jrxml"));
                new ModifyXMLContent().modify(dest, searchVal, repVal2);
                Compile_Print_Jasper();
            } catch (e: Exception) {
                log.debug(e);
                var msg: String = "Class : BillPrintSetUp  Method : savePrintSettings()   = {e.getMessage()}";
                log.debug(msg);
            }
        } else if (valSel.equals("W:15.4 X H:13.8 CM FORMAT")) {
            try {
                billtype = "W:15.4 X H:13.8 CM FORMAT";
                col = "Custom";
                repVal2 = [txtPrintMessage.rawText];
                var searchVal: String[] = ["Wish You a Speed Recovery!"];
                Upload.copy(new File("{currentDir}printerfiles/W15.4XH13.8.jrxml"), new File("{currentDir}printerfiles/Print.jrxml"));
                new ModifyXMLContent().modify(dest, searchVal, repVal2);
                Compile_Print_Jasper();
            } catch (e: Exception) {
                log.debug(e);
                var msg: String = "Class : BillPrintSetUp  Method : savePrintSettings()   = {e.getMessage()}";
                log.debug(msg);
            }
        } else if (valSel.equals("W:14.8 X H:20.7CM(A5) FORMAT")) {
            try {
                billtype = "W:14.8 X H:20.7CM(A5) FORMAT";
                col = "Custom";
                repVal2 = [txtPrintMessage.rawText];
                var searchVal: String[] = ["Wish You a Speed Recovery!"];
                Upload.copy(new File("{currentDir}printerfiles/A5Bill.jrxml"), new File("{currentDir}printerfiles/Print.jrxml"));
                new ModifyXMLContent().modify(dest, searchVal, repVal2);
                Compile_Print_Jasper();
            } catch (e: Exception) {
                log.debug(e);
                var msg: String = "Class : BillPrintSetUp  Method : savePrintSettings()   = {e.getMessage()}";
                log.debug(msg);
            }
        } else if (valSel.equals("W:9.9 X H:21CM FORMAT With BatchMfrExpiry")) {
            try {
                billtype = "W:9.9 X H:21CM FORMAT With BatchMfrExpiry";
                col = "Custom";
                repVal2 = [txtPrintMessage.rawText];
                var searchVal: String[] = ["Wish You a Speed Recovery!"];
                Upload.copy(new File("{currentDir}printerfiles/W9.9 X H21 CM FORMAT With BatchMfrExpiry.jrxml"), new File("{currentDir}printerfiles/Print.jrxml"));
                new ModifyXMLContent().modify(dest, searchVal, repVal2);
                Compile_Print_Jasper();
            } catch (e: Exception) {
                log.debug(e);
                var msg: String = "Class : BillPrintSetUp  Method : savePrintSettings()   = {e.getMessage()}";
                log.debug(msg);
            }
        }else if (valSel.equals("W:9.9 X H:21CM FORMAT With VAT perc and Amt")) {
            try {
                billtype = "W:9.9 X H:21CM FORMAT With VAT perc and Amt";
                col = "Custom";
                repVal2 = [txtPrintMessage.rawText];
                var searchVal: String[] = ["Wish You a Speed Recovery!"];
                Upload.copy(new File("{currentDir}printerfiles/W9.9 X H21 CM FORMAT With VAT perc and Amt.jrxml"), new File("{currentDir}printerfiles/Print.jrxml"));
                new ModifyXMLContent().modify(dest, searchVal, repVal2);
                Compile_Print_Jasper();
            } catch (e: Exception) {
                log.debug(e);
                var msg: String = "Class : BillPrintSetUp  Method : savePrintSettings()   = {e.getMessage()}";
                log.debug(msg);
            }
        } else if (valSel.equals("W:10.6 X H:21CM FORMAT with BatchMfrExpiry")) {
            try {
                billtype = "W:10.6 X H:21CM FORMAT with BatchMfrExpiry";
                col = "Custom";
                repVal2 = [txtPrintMessage.rawText];
                var searchVal: String[] = ["Wish You a Speed Recovery!"];
                Upload.copy(new File("{currentDir}printerfiles/W10.6 X H21 CM FORMAT with BatchMfrExpiry.jrxml"), new File("{currentDir}printerfiles/Print.jrxml"));
                new ModifyXMLContent().modify(dest, searchVal, repVal2);
                Compile_Print_Jasper();
            } catch (e: Exception) {
                log.debug(e);
                var msg: String = "Class : BillPrintSetUp  Method : savePrintSettings()   = {e.getMessage()}";
                log.debug(msg);
            }
        } else if (valSel.equals("W:11.1 X H:9.3CM FORMAT with BatchExpiry")) {
            try {
                billtype = "W:11.1 X H:9.3CM FORMAT with BatchExpiry";
                col = "Custom";
                repVal2 = [txtPrintMessage.rawText];
                var searchVal: String[] = ["Wish You a Speed Recovery!"];
                Upload.copy(new File("{currentDir}printerfiles/W11.1 X H9.3 CM FORMAT with BatchExpiry.jrxml"), new File("{currentDir}printerfiles/Print.jrxml"));
                new ModifyXMLContent().modify(dest, searchVal, repVal2);
                Compile_Print_Jasper();
            } catch (e: Exception) {
                log.debug(e);
                var msg: String = "Class : BillPrintSetUp  Method : savePrintSettings()   = {e.getMessage()}";
                log.debug(msg);
            }
        } else if (valSel.equals("W:11.1 X H:9.3CM FORMAT with BatchMfrExpiry")) {
            try {
                billtype = "W:11.1 X H:9.3CM FORMAT with BatchMfrExpiry";
                col = "Custom";
                repVal2 = [txtPrintMessage.rawText];
                var searchVal: String[] = ["Wish You a Speed Recovery!"];
                Upload.copy(new File("{currentDir}printerfiles/W11.1 X H9.3 CM FORMAT with BatchMfrExpiry.jrxml"), new File("{currentDir}printerfiles/Print.jrxml"));
                new ModifyXMLContent().modify(dest, searchVal, repVal2);
                Compile_Print_Jasper();
            } catch (e: Exception) {
                log.debug(e);
                var msg: String = "Class : BillPrintSetUp  Method : savePrintSettings()   = {e.getMessage()}";
                log.debug(msg);
            }
        }else if (valSel.equals("W:12 X H:10.6CM FORMAT with BatchMfrExpiryPrice")) {
            try {
                billtype = "W:12 X H:10.6CM FORMAT with BatchMfrExpiryPrice";
                col = "Custom";
                repVal2 = [txtPrintMessage.rawText];
                var searchVal: String[] = ["Wish You a Speed Recovery!"];
                Upload.copy(new File("{currentDir}printerfiles/W12 X H10.6 CM FORMAT with BatchMfrExpiryPrice.jrxml"), new File("{currentDir}printerfiles/Print.jrxml"));
                new ModifyXMLContent().modify(dest, searchVal, repVal2);
                Compile_Print_Jasper();
            } catch (e: Exception) {
                log.debug(e);
                var msg: String = "Class : BillPrintSetUp  Method : savePrintSettings()   = {e.getMessage()}";
                log.debug(msg);
            }
        }else if (valSel.equals("W:12.3 X H:13.8CM FORMAT Small Font")) {
            try {
                billtype = "W:12.3 X H:13.8CM FORMAT Small Font";
                col = "Custom";
                repVal2 = [txtPrintMessage.rawText];
                var searchVal: String[] = ["Wish You a Speed Recovery!"];
                Upload.copy(new File("{currentDir}printerfiles/W12.3 X H13.8 CM FORMAT Small Font.jrxml"), new File("{currentDir}printerfiles/Print.jrxml"));
                new ModifyXMLContent().modify(dest, searchVal, repVal2);
                Compile_Print_Jasper();
            } catch (e: Exception) {
                log.debug(e);
                var msg: String = "Class : BillPrintSetUp  Method : savePrintSettings()   = {e.getMessage()}";
                log.debug(msg);
            }
        }else if (valSel.equals("W:14.8 X H:20.7CM FORMAT with VAT")) {
            try {
                billtype = "W:14.8 X H:20.7CM FORMAT with VAT";
                col = "Custom";
                repVal2 = [txtPrintMessage.rawText];
                var searchVal: String[] = ["Wish You a Speed Recovery!"];
                Upload.copy(new File("{currentDir}printerfiles/W14.8 X H20.7 CM FORMAT with VAT.jrxml"), new File("{currentDir}printerfiles/Print.jrxml"));
                new ModifyXMLContent().modify(dest, searchVal, repVal2);
                Compile_Print_Jasper();
            } catch (e: Exception) {
                log.debug(e);
                var msg: String = "Class : BillPrintSetUp  Method : savePrintSettings()   = {e.getMessage()}";
                log.debug(msg);
            }
        }
            else if (valSel.equals("W:20.9 X H:10.1CM  FORMAT")) {
            try {
                
                billtype = "W:20.9 X H:10.1CM  FORMAT";
                col = "PrePrint";
                repVal2 = [txtPrintMessage.rawText];
                var searchVal: String[] = ["Wish You a Speed Recovery!"];
                Upload.copy(new File("{currentDir}printerfiles/malarbillformat.jrxml"), new File("{currentDir}printerfiles/Print.jrxml"));
                new ModifyXMLContent().modify(dest, searchVal, repVal2);
                Compile_Print_Jasper();
            } catch (e: Exception) {
                log.debug(e);
                var msg: String = "Class : BillPrintSetUp  Method : savePrintSettings()   = {e.getMessage()}";
                log.debug(msg);
            }
        }  else if (valSel.equals("W:21.0 X H:10.2 CM FORMAT")) {
            try {
                
                billtype = "W:21.0 X H:10.2 CM FORMAT";
                col = "PrePrint";
                repVal2 = [txtPrintMessage.rawText];
                var searchVal: String[] = ["Wish You a Speed Recovery!"];
                Upload.copy(new File("{currentDir}printerfiles/karuppiahbillformat.jrxml"), new File("{currentDir}printerfiles/Print.jrxml"));
                new ModifyXMLContent().modify(dest, searchVal, repVal2);
                Compile_Print_Jasper();
            } catch (e: Exception) {
                log.debug(e);
                var msg: String = "Class : BillPrintSetUp  Method : savePrintSettings()   = {e.getMessage()}";
                log.debug(msg);
            }
        }
    }


    var log: Logger = Logger.getLogger(NewbillFormat.class, "Utilities");
    var dest = new File("printerfiles/Print.jrxml");
    def kr = KeyRegistry {};
    def CustomAlert = CustomAlert {};
    var key = bind CommonDeclare.currKyEvent on replace {
        if (show == 1 and CommonDeclare.MainPageForm.equals("BillPrintSetup")) {
            shortcut(key);
        } }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Bill Print Setup", msg);
        showAlertbox();
    }

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Bill Print Setup", type);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function shortcut(evt: KeyEvent): Void {
        if (evt.code == kr.save) {

        }
    }

    function btnSaveAction(): Void {
         try {
            var si4: Integer = 0;
            si4 = val.getAlphaNumericValid(txtPrintMessage.rawText, 0, 75);
            if (si4 > 75 or txtPrintMessage.rawText.length() > 75) {
                FXinfo("Welcome Msg allowed 75 digits only.");
            } else {
                //BillPrint.jasperPrint('SCA1100004', 'Sales_Cash');
//                if (radAdvanceBill.selected or (radBasicBill.selected and col.equals("100")) or (radBasicBill.selected and col.equals("110")) or (radBasicBill.selected and col.equals("101")) or (radBasicBill.selected and col.equals("011")) or (radBasicBill.selected and col.equals("010")) or (radBasicBill.selected and col.equals("001")) or radPOSBill.selected or not txtcustSelect.text.equals("") or not txtPrePrintselect.text.equals("")) {
                if(radBasicBill.selected)
                {
                    savePrintSettings();
                    
                    var printController : BillPrintController  = new BillPrintController();
                    var returnFlag : Boolean = printController.billPrintSetup('{billtype}','{col}','{txtPrintMessage.rawText}','{imagePreview.image.url}');
                    if(returnFlag == true) {
                    FXalert(0);
                    col = "";
                    }
              }
                else if (radAdvanceBill.selected or radBasicBill.selected  or radPOSBill.selected or not txtcustSelect.text.equals("") or not txtPrePrintselect.text.equals("")) {
                    savePrintSettings();
                    
                    var printController : BillPrintController  = new BillPrintController();
                    var returnFlag : Boolean = printController.billPrintSetup('{billtype}','{col}','{txtPrintMessage.rawText}','{imagePreview.image.url}');
                    if(returnFlag == true) {
                FXalert(0);
                col = "";
                }

//                    DBData.queryExecution("truncate print_settings");

//                    var imgval = imagePreview.image.url.substring(imagePreview.image.url.lastIndexOf('/') + 1, imagePreview.image.url.length());

//                    var query = "INSERT INTO print_settings values('{billtype}','{col}','','Logo','{imgval}','{txtPrintMessage.text}')";
//                    //showHidechks();

//                    DBData.queryExecution(query);
//                    FXalert(0);
                } else {
                    FXinfo("Select anyone Bill format");
                }

            }
        } catch (e: Exception) {
            log.debug(e);
            var msg: String = "Class : BillPrintSetUp  Method : savePrintSettings()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function radBasicBillOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        Preview();
    }

    function chkBillSet1OnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        checkCustomize();
        //imagePreview.image = null;
        Preview();
    }

    function chkBillSet3OnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        checkCustomize();
        //imagePreview.image = null;
        Preview();
    }

    function chkBillSet4OnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        checkCustomize();
        //imagePreview.image = null;
        Preview();
    }

    function reset(): Void {
        radAdvanceBill.selected = false;
        radPOSBill.selected = false;
        radBasicBill.selected = false;
        chkBillSet1.selected = false;
        chkBillSet1.disable = false;
        chkBillSet3.selected = false;
        chkBillSet3.disable = false;
        chkBillSet4.selected = false;
        chkBillSet4.disable = false;
        txtcustSelect.text = "";
        txtPrePrintselect.text="";
        lstCustomView.visible=false;
        lblPreprintBill.visible=false;
        imagePreview.visible = false;
        //selToggle=0;
    }

    public function Preview(): Void {        
        if (radAdvanceBill.selected) {
            imagePreview.layoutX=250;
            imagePreview.visible = true;
            imagePreview.image = imgBillWithAdvancedPrint;
        } else if (radPOSBill.selected) {
            imagePreview.layoutX=250;
            imagePreview.visible = true;
            imagePreview.image = imgBillwithPosPrint;//need change to POS Bill Image
        } else if (col.equals("") and radBasicBill.selected) {
            imagePreview.layoutX=250;
            imagePreview.visible = true;
            imagePreview.image = imgBillwithBasicPrint;
            
        } else if (col.equals("100") and radBasicBill.selected) {
            imagePreview.layoutX=250;
            imagePreview.image = imgBillwithMfronly;
            
        } else if (col.equals("001") and radBasicBill.selected) {
            imagePreview.layoutX=250;
            imagePreview.image = imgBillwithExpiryOnly;
            
        } else if (col.equals("010") and radBasicBill.selected) {
            imagePreview.layoutX=250;
            imagePreview.image = imgBillwithBatchonly;
            
        } else if (col.equals("110") and radBasicBill.selected) {
            imagePreview.layoutX=250;
            imagePreview.image = imgBillwithMFRBatch;
            
        } else if (col.equals("011") and radBasicBill.selected) {
            imagePreview.layoutX=250;
            imagePreview.image = imgBillwithBatchExpiry;
            
        } else if (col.equals("101") and radBasicBill.selected) {
            imagePreview.layoutX=250;
            imagePreview.image = imgBillwithMFRExpiry;
            
        } else if (textchange.equals("W:21.0 X H:29.7CM(A4) FORMAT")) {
            imagePreview.layoutX=250;
            imagePreview.image = W21_0XH29_7;
        } else if (textchange.equals("W:15.4 X H:13.8 CM FORMAT")) {
            imagePreview.layoutX=250;
            imagePreview.image = W15_4XH13_8;
        } else if (textchange.equals("W:14.8 X H:20.7CM(A5) FORMAT")) {
            imagePreview.layoutX=250;
            imagePreview.image = W14_8XH20_7;
        } else if (textchange.equals("W:9.9 X H:21CM FORMAT With BatchMfrExpiry")) {
            imagePreview.layoutX=250;
            imagePreview.image = W9_9XH21BME;
        } else if (textchange.equals("W:9.9 X H:21CM FORMAT With VAT perc and Amt")) {
            imagePreview.layoutX=250;
            imagePreview.image = W9_9XH21VA;
        } else if (textchange.equals("W:10.6 X H:21CM FORMAT with BatchMfrExpiry")) {
            imagePreview.layoutX=250;
            imagePreview.image = W10_6XH21BME;
        } else if (textchange.equals("W:11.1 X H:9.3CM FORMAT with BatchExpiry")) {
            imagePreview.layoutX=250;
            imagePreview.image = W11_1XH9_3BE;
        } else if (textchange.equals("W:11.1 X H:9.3CM FORMAT with BatchMfrExpiry")) {
            imagePreview.layoutX=250;
            imagePreview.image = W11_1XH9_3BME;
        } else if (textchange.equals("W:12 X H:10.6CM FORMAT with BatchMfrExpiryPrice")) {
            imagePreview.layoutX=250;
            imagePreview.image = W12XH10_6BMEP;
        } else if (textchange.equals("W:12.3 X H:13.8CM FORMAT Small Font")) {
            imagePreview.layoutX=250;
            imagePreview.image = W12_3XH13_8SM;
        }else if (textchange.equals("W:14.8 X H:20.7CM FORMAT with VAT")) {
            imagePreview.layoutX=250;
            imagePreview.image = W14_8XH20_7V;
        } else if (textchange1.equals("W:20.9 X H:10.1CM  FORMAT")) {
            imagePreview.layoutX=250;
            imagePreview.image=imgkaru;
        } else if (textchange1.equals("W:21.0 X H:10.2 CM FORMAT")) {
            imagePreview.layoutX=250;
            imagePreview.image=imgmalar;
        } 
    }

    public function checkCustomize(): Void {
        var columns = ["0", "0", "0"];
        col = "";
        //if (radCustomeBill.selected) {Change the rdoBasicBill.selected
        if (radBasicBill.selected) {
            if (chkBillSet1.selected) {
                columns[0] = "1";
            }
            if (chkBillSet3.selected) {
                columns[1] = "1";
            }
            if (chkBillSet4.selected) {
                columns[2] = "1";
            }
            col = "{columns[0]}{columns[1]}{columns[2]}";
            if (col.equals("111")) {
                col = "";

                FXinfo("You have Chosen Advanced Bill Option.");
                radAdvanceBill.selected = true;
                advanceBill();
                Preview();
            } else if (col.equals("000")) {
                {
                    col = "";
                    radBasicBill.selected = true;
                }
            }
        }
    }

    function radAdvanceBillOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        Preview();
    }

    function radPOSBillOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        Preview();
    }

    function advanceBill(): Void {

        try {
            billtype = "Advance";
            repVal2 = [txtPrintMessage.rawText];
            var searchVal: String[] = ["Wish You a Speed Recovery!"];
            Upload.copy(new File("printerfiles/AdvancedPrint.jrxml"), new File("printerfiles/Print.jrxml"));
            new ModifyXMLContent().modify(dest, searchVal, repVal2);
            Compile_Print_Jasper();
        } catch (e: Exception) {
            log.debug(e);
            var msg: String = "Class : BillPrintSetUp  Method : savePrintSettings()   = {e.getMessage()}";
            log.debug(msg);
        }

        if (radAdvanceBill.selected) {
            //            imgAdvOpt.visible=true;
            //            txtAdvanOpt.visible=true;
            chkBillSet1.visible = true;
            chkBillSet3.visible = true;
            chkBillSet4.visible = true;
            chkBillSet1.selected = true;
            chkBillSet3.selected = true;
            chkBillSet4.selected = true;
            chkBillSet1.disable = true;
            chkBillSet3.disable = true;
            chkBillSet4.disable = true;
        } else {
            chkBillSet1.visible = false;
            chkBillSet3.visible = false;
            chkBillSet4.visible = false;
            chkBillSet1.selected = false;
            chkBillSet3.selected = false;
            chkBillSet4.selected = false;
            chkBillSet1.disable = false;
            chkBillSet3.disable = false;
            chkBillSet4.disable = false;
        }
    }

    public function savePrintSettings(): Void {
     var currentDir = new File(".").getAbsolutePath();
     currentDir=currentDir.replace("\\.", "\\");
     currentDir=currentDir.replace("dist\\", "");
        checkCustomize();
        if (radPOSBill.selected) {
            try {
                billtype = "Pos";
                repVal2 = [txtPrintMessage.rawText];
                var searchVal: String[] = ["Wish You a Speed Recovery!"];
//                Upload.copy(new File("printerfiles/PosPrint.jrxml"), new File("printerfiles/Print.jrxml"));
                Upload.copy(new File("{currentDir}printerfiles/PosPrint.jrxml"), new File("{currentDir}printerfiles/Print.jrxml"));
                new ModifyXMLContent().modify(dest, searchVal, repVal2);
                Compile_Print_Jasper();
            } catch (e: Exception) {
                var msg: String = "Class : BillPrintSetUp  Method : savePrintSettings()   = {e.getMessage()}";
                log.debug(msg);
            }
        } else if (radBasicBill.selected and col.equals("")) {
            
            try {
                billtype = "Basic";
                repVal2 = [txtPrintMessage.rawText];
                var searchVal: String[] = ["Wish You a Speed Recovery!"];
//                Upload.copy(new File("printerfiles/BasicPrint.jrxml"), new File("printerfiles/Print.jrxml"));
                Upload.copy(new File("{currentDir}printerfiles/BasicPrint.jrxml"), new File("{currentDir}printerfiles/Print.jrxml"));
                new ModifyXMLContent().modify(dest, searchVal, repVal2);
                Compile_Print_Jasper();
            } catch (e: Exception) {
                log.debug(e);
                var msg: String = "Class : BillPrintSetUp  Method : savePrintSettings()   = {e.getMessage()}";
                log.debug(msg);
            }
        } else if (radAdvanceBill.selected) {
            try {
                billtype = "Advance";
                repVal2 = [txtPrintMessage.rawText];
                var searchVal: String[] = ["Wish You a Speed Recovery!"];
//                Upload.copy(new File("printerfiles/AdvancedPrint.jrxml"), new File("printerfiles/Print.jrxml"));
                Upload.copy(new File("{currentDir}printerfiles/AdvancedPrint.jrxml"), new File("{currentDir}printerfiles/Print.jrxml"));
                new ModifyXMLContent().modify(dest, searchVal, repVal2);
                Compile_Print_Jasper();
            } catch (e: Exception) {
                log.debug(e);
                var msg: String = "Class : BillPrintSetUp  Method : savePrintSettings()   = {e.getMessage()}";
                log.debug(msg);
            }
        } else if (radBasicBill.selected and not col.equals("")) {//change basic bill rdoBasicBill.selected
            
            try {
                billtype = "Basic";
                if (col.equals("100") or col.equals("010") or col.equals("001")) {
                    if (chkCheckBox1()) {
                        var searchVal: String[] = ["hxx", "field1", "Wish You a Speed Recovery!"];
//                        Upload.copy(new File("printerfiles/CustomPrint4.jrxml"), dest);
                        Upload.copy(new File("{currentDir}printerfiles/CustomPrint4.jrxml"), new File("{currentDir}printerfiles/Print.jrxml"));
//                        new ModifyXMLContent().modify(dest, searchVal, repVal2);
                        new ModifyXMLContent().modify(new File("{currentDir}printerfiles/Print.jrxml"), searchVal, repVal2);
                        Compile_Print_Jasper();
                    }
                } else if (col.equals("110") or col.equals("011") or col.equals("101")) {
                    if (chkCheckBox2()) {
                        var searchVal: String[] = ["hxx", "hyy", "field1", "field2", "Wish You a Speed Recovery!"];
//                        Upload.copy(new File("printerfiles/CustomPrint5.jrxml"), dest);
                        Upload.copy(new File("{currentDir}printerfiles/CustomPrint5.jrxml"), new File("{currentDir}printerfiles/Print.jrxml"));
//                        new ModifyXMLContent().modify(dest, searchVal, repVal1);
                        new ModifyXMLContent().modify(new File("{currentDir}printerfiles/Print.jrxml"), searchVal, repVal1);
                        Compile_Print_Jasper();
                    }
                }
            } catch (e: Exception) {
                log.debug(e);
                var msg: String = "Class : BillPrintSetUp  Method : savePrintSettings()   = {e.getMessage()}";
                log.debug(msg);
            }
        } else {
            if(not textchange.equals(""))
            {
                
            findBillFormat(textchange);
            }else if(not textchange1.equals(""))
            {
            findBillFormat(textchange1);
            
            }
}
  
    }

    function chkCheckBox1(): Boolean {
        opt = false;
        if (chkBillSet1.selected and not chkBillSet3.selected and not chkBillSet4.selected) {
            opt = true;
            repVal2 = ["MFR", "mfr_name", txtPrintMessage.rawText];
        } else if (not chkBillSet1.selected and chkBillSet3.selected and not chkBillSet4.selected) {
            opt = true;
            repVal2 = ["Batch", "batch_no", txtPrintMessage.rawText];
        } else if (not chkBillSet1.selected and not chkBillSet3.selected and chkBillSet4.selected) {
            opt = true;
            repVal2 = ["Expiry", "expiry_date", txtPrintMessage.rawText];
        }
        return opt;
    }

    function chkCheckBox2(): Boolean {
        opt = false;
        if (chkBillSet1.selected and chkBillSet3.selected and not chkBillSet4.selected) {
            opt = true;
            repVal1 = ["MFR", "Batch", "mfr_name", "batch_no", txtPrintMessage.rawText];
            Preview();

        } else if (not chkBillSet1.selected and chkBillSet3.selected and chkBillSet4.selected) {
            opt = true;
            repVal1 = ["Batch", "Expiry", "batch_no", "expiry_date", txtPrintMessage.rawText];
            Preview();

        } else if (chkBillSet1.selected and not chkBillSet3.selected and chkBillSet4.selected) {
            opt = true;
            repVal1 = ["MFR", "Expiry", "mfr_name", "expiry_date", txtPrintMessage.rawText];
            Preview();

        }
        return opt;
    }

    function Compile_Print_Jasper(): Void {
        JasperCompileManager.compileReportToFile("printerfiles/Print.jrxml", "printerfiles/Print.jasper");
    }

    public function toggleBGButtonStyle(): String {
        "-fx-background-color:rgb(225,244,251);"
    }

    public function toggleDBGButtonStyle(): String {
        "-fx-background-color:red;"
    }

    var rectColor = toggleBGButtonStyle();
    var rectColor1 = toggleDBGButtonStyle();
//    function toggleButton5OnMouseClickedAtmenuState(event: javafx.scene.input.MouseEvent): Void {
//    panelAdvance.visible=false;
//    panelBasic.visible=false;
//    panelCustom.visible=false;
//    panelPOS.visible=false;
//    panelPreprint.visible=true;
//    label5.text="Preprint Format";
//    if(toggleButton5.selected)
//    {

//    toggleButton5.style=rectColor;
//    }
//    else if(toggleButton2.selected or toggleButton3.selected or toggleButton4.selected or toggleButton.selected )
//    {

//    toggleButton5.style=rectColor1;
//    }
//         }

    function toggleButton5OnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        selToggle = 5;
        toggleButton5.selected = true;
        panelAdvance.visible = false;
        panelBasic.visible = false;
        panelCustom.visible = false;
        panelPOS.visible = false;
        panelPreprint.visible = true;
         
        reset();
        label5.text = "Preprint Format";
    }
//    function toggleButton4OnMouseClickedAtmenuState(event: javafx.scene.input.MouseEvent): Void {
//    panelAdvance.visible=false;
//    panelBasic.visible=false;
//    panelCustom.visible=false;
//    panelPOS.visible=true;
//    panelPreprint.visible=false;
//    label4.text="POS Format";
//    if(toggleButton4.selected)
//    {

//    toggleButton4.style=rectColor;
//    }
//    else if(toggleButton2.selected or toggleButton3.selected or toggleButton5.selected or toggleButton.selected)
//    {

//    toggleButton4.style=rectColor1;
//    }
//         }

    function toggleButton3OnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        selToggle = 3;
        lstPrePrintView.visible=false;
        toggleButton3.selected = true;
        panelAdvance.visible = false;
        panelBasic.visible = false;
        panelCustom.visible = true;
        panelPOS.visible = false;
        panelPreprint.visible = false;
        label3.text = "Customs Format";
       
//        deptComboBox.layoutX = 50;
//        deptComboBox.layoutY = 100;
//        deptComboBox.editable = true;
        reset();
       // deptComboBox.items = [];
    //panelCustom.content= [ rectCustom, label3,deptComboBox ];
    //toggleButton3.style=rectColor;
    }

    function toggleButton4OnMouseClicked(event: javafx.scene.input.MouseEvent): Void {

        toggleButton4.selected = true;
        panelAdvance.visible = false;
        panelBasic.visible = false;
        panelCustom.visible = false;
        panelPOS.visible = true;
        panelPreprint.visible = false;
        lstPrePrintView.visible=false;
        //lstCustomView.visible=true;
        reset();
        label2.text = "Basic Format";
    }

    function toggleButton2OnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        toggleButton2.selected = true;
        panelAdvance.visible = false;
        panelBasic.visible = true;
        panelCustom.visible = false;
        panelPOS.visible = false;
        panelPreprint.visible = false;
        reset();
        label2.text = "Basic Format";
    //rectBasic{content:[deptComboBox]}
    //toggleButton2.style=rectColor;
    }

    function toggleButtonOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        toggleButton.selected = true;
        panelAdvance.visible = true;
        panelBasic.visible = false;
        panelCustom.visible = false;
        panelPOS.visible = false;
        panelPreprint.visible = false;
        reset();
        label.text = "Advanced Format";
    //toggleButton.style=rectColor;
    }

    public function Startup(): Void {
        var checkSet = BillPrint.isExists();
        if(checkSet)
        {
        checkSettings();
        }
        else
        {
            Preview();
        imagePreview.visible = false;
                toggleButton.selected = true;
                panelAdvance.visible = true;
                panelBasic.visible = false;
                panelCustom.visible = false;
                panelPOS.visible = false;
                panelPreprint.visible = false;
                label.text = "Advanced Format";
        reset();
            
        }

        
    }
    function findBillImages(img:String):Image
    {

        if(img.equals('W21_0XH29_7.png'))
        {
            imagePreview.image=W21_0XH29_7;
        }else if(img.equals('W14_8XH20_7.png'))
        {
            imagePreview.image=W14_8XH20_7;
        }else if(img.equals('W15_4XH13_8.png'))
        {
            imagePreview.image=W15_4XH13_8;
        }else if(img.equals('W9_9XH21BME.png'))
        {
            imagePreview.image=W9_9XH21BME;
        }else if(img.equals('W9_9XH21VA.png'))
        {
            imagePreview.image=W9_9XH21VA;
        }else if(img.equals('W10_6XH21BME.png'))
        {
            imagePreview.image=W10_6XH21BME;
        }else if(img.equals('W11_1XH9_3BE.png'))
        {
            imagePreview.image=W11_1XH9_3BE;
        }else if(img.equals('W11_1XH9_3BME.png'))
        {
            imagePreview.image=W11_1XH9_3BME;
        }else if(img.equals('W12_3XH13_8SM.png'))
        {
            imagePreview.image=W12_3XH13_8SM;
        }else if(img.equals('W12XH10_6BMEP.png'))
        {
            imagePreview.image=W12XH10_6BMEP;
        }else if(img.equals('W14_8XH20_7V.png'))
        {
            imagePreview.image=W14_8XH20_7V;
        }
        return imagePreview.image;
    }

    function checkSettings(): Void {
       show = 1;
     var currentDir = new File(".").getAbsolutePath();
     currentDir=currentDir.replace("\\.", "\\");
     currentDir=currentDir.replace("dist\\", "");
        var checkSet = BillPrint.isExists();
        var printController : BillPrintController  = new BillPrintController();
       var setVal : String = printController.getQueryValue1("select bill_type from print_settings");
//        var setVal = DBData.getQueryValue("select bill_type from print_settings");
//        txtPrintMessage.text=DBData.getQueryValue("select print_msg from print_settings");
        txtPrintMessage.text=printController.getQueryValue2("select page_type from print_settings");

//        var setImg = DBData.getQueryValue("select img_path from print_settings");
        var setImg = printController.getQueryValue3("select img_path from print_settings");
        var reportSource:File = new File("{currentDir}printerfiles/Print.jasper");
        if (checkSet) {

            
            reportSource=reportSource;
            btnSave.text = "Apply [F3]";
            var bill = GetBillPrintSet.getBType();
            var cols = GetBillPrintSet.cols;
            
            if (bill.equals("Pos")) {
                imagePreview.image = imgBillwithPosPrint;
                toggleButton4.selected = true;
                radPOSBill.selected = true;
                panelAdvance.visible = false;
                panelBasic.visible = false;
                panelPOS.visible = true;
                panelPreprint.visible = false;
                panelCustom.visible = false;
                JRLoader.loadObject(reportSource);
            } else if (bill.equals("Basic")) {
                imagePreview.image = imgBillwithBasicPrint;
                toggleButton2.selected = true;
//                toggleButton2.toggleGroup=null;
                radBasicBill.selected = true;
                panelAdvance.visible = false;
                panelBasic.visible = true;
                panelPOS.visible = false;
                panelPreprint.visible = false;
                panelCustom.visible = false;
                JRLoader.loadObject(reportSource);
                if (radBasicBill.selected and cols == '110') {
                    chkBillSet1.selected = true;
                    chkBillSet3.selected = true;
                    imagePreview.layoutX=250;
                    imagePreview.image = imgBillwithMFRBatch;
                    JRLoader.loadObject(reportSource);
                }else if (radBasicBill.selected and cols == '101') {
                    chkBillSet1.selected = true;
                    chkBillSet4.selected = true;
                    imagePreview.layoutX=250;
                    imagePreview.image = imgBillwithMFRExpiry;
                    JRLoader.loadObject(reportSource);
                } else if (radBasicBill.selected and cols == '011') {
                    chkBillSet3.selected = true;
                    chkBillSet4.selected = true;
                    imagePreview.layoutX=250;
                    imagePreview.image = imgBillwithBatchExpiry;
                    JRLoader.loadObject(reportSource);
                }else if (radBasicBill.selected and cols == '100') {
                    chkBillSet1.selected = true;
                     imagePreview.layoutX=250;
                     imagePreview.image = imgBillwithMfronly;
                    JRLoader.loadObject(reportSource);
                }else if (radBasicBill.selected and cols == '010') {
                    chkBillSet3.selected = true;
                    imagePreview.layoutX=250;
                    imagePreview.image = imgBillwithBatchonly;
                    JRLoader.loadObject(reportSource);
                }else if (radBasicBill.selected and cols == '001') {
                    chkBillSet4.selected = true;
                    imagePreview.layoutX=250;
                    imagePreview.image = imgBillwithExpiryOnly;
                    JRLoader.loadObject(reportSource);
                }
            } else if (cols.equals("Custom")) {
                selToggle=3;
                imagePreview.image=findBillImages(setImg);
                toggleButton3.selected = true;
                panelAdvance.visible = false;
                panelBasic.visible = false;
                panelPOS.visible = false;
                panelPreprint.visible = false;
                panelCustom.visible = true;
                txtcustSelect.text = setVal;

                

            } else if (cols.equals("PrePrint")) {
                selToggle == 5;
                toggleButton5.selected = true;
                panelAdvance.visible = false;
                panelBasic.visible = false;
                panelCustom.visible = false;
                panelPOS.visible = false;
                panelPreprint.visible = true;
                txtPrePrintselect.text = setVal;
            } else if (bill.equals("Advance")) {
                imagePreview.image = imgBillWithAdvancedPrint;
                toggleButton.selected = true;
                radAdvanceBill.selected = true;
                panelAdvance.visible = true;
                panelBasic.visible = false;
                panelCustom.visible = false;
                panelPOS.visible = false;
                panelPreprint.visible = false;
                JRLoader.loadObject(reportSource);
            }
        //            else if (bill.equals("CustomizeA5")) {
        //                //rdoCustomisea5.selected = true;
        //                JRLoader.loadObject(reportSource);
        //            }
        }

    }

}
//function run (): Void {
//    var design = NewbillFormat {};
//    design.Startup();
//    javafx.stage.Stage {
//        title: "NewbillFormat"
//        scene: design.getDesignScene ()
//    }
//}
