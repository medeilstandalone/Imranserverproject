package com.vanuston.medeil.ui;

import java.lang.*;
import javafx.scene.image.*;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Validation;
import com.vanuston.medeil.util.Value;
import com.vanuston.medeil.ui.calendar.theme.GrayTheme;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.util.Logger;
import javafx.scene.input.KeyCode ;
import javafx.scene.control.TextBox ;
import com.vanuston.medeil.util.KeyRegistry ;
import com.vanuston.medeil.implementation.CommonImplements ;
import com.vanuston.medeil.client.RegistryFactory ;
import com.vanuston.medeil.util.RegistryConstants ;
import com.vanuston.medeil.uitables.CreditNoteTable ;
import com.vanuston.medeil.model.CreditNoteModel ;
import java.sql.Date ;
import com.vanuston.medeil.uitables.ConfirmDialogBox ;


public class CreditNote {

    var commonController : CommonImplements ;//= RegistryFactory.getClientStub(RegistryConstants.CommonImplements ) as CommonImplements ;
    var creditNoteController : com.vanuston.medeil.implementation.CreditNote ; //= RegistryFactory.getClientStub (RegistryConstants.CreditNote) as com.vanuston.medeil.implementation.CreditNote ;
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 397.5
        layoutY: 0.0
        styleClass: "rectFormHeader"
        width: bind panelW
    }
    
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 258.0
        layoutY: 69.0
        text: "Label"
    }
    
    def __layoutInfo_separator: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
    }
    public-read def separator: javafx.scene.control.Separator = javafx.scene.control.Separator {
        visible: false
        layoutX: 279.0
        layoutY: 100.0
        layoutInfo: __layoutInfo_separator
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtCNoteNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtCNoteNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtCNoteNo
    }
    
    public-read def imageDate: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutY: 186.0
    }
    
    def __layoutInfo_choiceOption: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW+30
    }
    public-read def choiceOption: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: 274.0
        layoutY: 111.0
        layoutInfo: __layoutInfo_choiceOption
        onKeyPressed: choiceOptionOnKeyPressed
        items: bind choCreditOpt
    }
    
    def __layoutInfo_listCreditNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
        height: bind listH
    }
    public-read def listCreditNo: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutY: 152.0
        layoutInfo: __layoutInfo_listCreditNo
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    def __layoutInfo_listInvoiceNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def listInvoiceNo: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutY: 230.0
        layoutInfo: __layoutInfo_listInvoiceNo
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    public-read def imageViewDown: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind Type2TextboxW-2
        layoutY: 90.0
    }
    
    public-read def imagePDown: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind Type2TextboxW-2
        layoutY: 43.0
    }
    
    public-read def creDatePanel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: 202.0
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
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
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
        visible: false
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
    
    def __layoutInfo_txtCNoteDetails: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind DetailTextW
        height: 113.0
    }
    public-read def txtCNoteDetails: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 298.0
        layoutInfo: __layoutInfo_txtCNoteDetails
        font: Arial_12
    }
    
    def __layoutInfo_txtCNoteAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind AmtTextW
    }
    public-read def txtCNoteAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 270.0
        layoutInfo: __layoutInfo_txtCNoteAmt
        font: Arial_12
        multiline: false
        lines: 1.0
    }
    
    def __layoutInfo_txtCNotePName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtCNotePName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        managed: true
        layoutY: 245.0
        layoutInfo: __layoutInfo_txtCNotePName
        font: Arial_12
    }
    
    def __layoutInfo_txtCNoteAgstInv: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtCNoteAgstInv: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 214.0
        layoutInfo: __layoutInfo_txtCNoteAgstInv
        font: Arial_12
    }
    
    def __layoutInfo_txtCNoteDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtCNoteDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 186.0
        layoutInfo: __layoutInfo_txtCNoteDate
        font: Arial_12
    }
    
    public-read def panelC2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind C2LX
        content: [ txtCNoteNo, txtCNoteDate, imageDate, txtCNoteAgstInv, txtCNotePName, txtCNoteAmt, txtCNoteDetails, choiceOption, listCreditNo, listInvoiceNo, imageViewDown, imagePDown, creDatePanel, ]
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
    
    def __layoutInfo_btnCNoteCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind CancelW
        height: bind bottonH
    }
    public-read def btnCNoteCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton4LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnCNoteCancel
        effect: reflectionEffect
        graphic: imgCancel
        text: "Cancel [Esc]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnCNoteReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnCNoteReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton3LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnCNoteReset
        effect: reflectionEffect
        graphic: imageView3
        text: "Reset [F5]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnCNoteEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnCNoteEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton2LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnCNoteEdit
        effect: reflectionEffect
        graphic: imgEdit
        text: "Edit  [F4]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnCNoteSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnCNoteSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnCNoteSave
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
        content: [ btnCNoteSave, btnCNoteEdit, btnCNoteReset, btnCNoteCancel, ]
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
    
    public-read def label12: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 298.0
        text: "Details "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label11: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 270.0
        text: "Amount "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelParty: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 242.0
        text: "Party Name "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 214.0
        text: "Agst Invoice No "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label8: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 186.0
        text: "Date "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label14: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 130.0
        text: "Credit Note No"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def panelC1: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind C1LX
        content: [ label14, label8, label3, label4, labelParty, label11, label12, ]
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
        layoutX: 633.0
        layoutY: 34.0
        layoutInfo: __layoutInfo_label
        effect: lightingEffect
        text: "Credit Note - ctrl+N"
        font: Arial_25
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ rectangle, rectHeader, label, label5, separator, panelC1, panelC2, panelButtons, panelAlert, ]
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
    }
    
    public-read def Gray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.4
        green: 0.4
        blue: 0.4
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
    
    public-read def Arial_Bold_65: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 65.0
    }
    
    public-read def linearGradient2: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
    }
    
    public-read def imageCalender: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Calender.png"
    }
    
    public-read def imageBack: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/arrow_Left.png"
    }
    
    public-read def imageDown: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
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
                            rectangle.blocksMouse = true;
                            rectangle.stroke = DarkGray;
                            rectangle.arcWidth = 5.0;
                            rectangle.arcHeight = 5.0;
                            rectHeader.visible = true;
                            rectHeader.opacity = 0.25;
                            rectHeader.layoutX = 0.0;
                            rectHeader.fill = linearGradient2;
                            rectHeader.height = 32.0;
                            rectHeader.arcWidth = 5.0;
                            rectHeader.arcHeight = 5.0;
                            label.layoutX = 0.0;
                            label.layoutY = 1.0;
                            label.styleClass = "labelFormHeading";
                            label.effect = null;
                            label.font = Arial_25;
                            label.hpos = javafx.geometry.HPos.CENTER;
                            label5.visible = true;
                            label5.layoutX = 35.0;
                            label5.layoutY = 81.0;
                            label5.styleClass = "";
                            label5.text = "Credit Note Details";
                            label5.font = Arial_18;
                            label5.textFill = Green;
                            separator.visible = true;
                            separator.layoutX = 30.0;
                            separator.layoutY = 105.0;
                            label14.layoutY = 0.0;
                            label14.text = "Credit Note No.";
                            label8.layoutY = 35.0;
                            label3.visible = true;
                            label3.layoutY = 70.0;
                            label3.text = "Return Type";
                            label3.font = Arial_12;
                            label3.textFill = DarkGray;
                            label4.layoutY = 105.0;
                            label4.text = "Invoice No.";
                            labelParty.layoutY = 137.0;
                            labelParty.text = "Name ";
                            label11.layoutY = 210.0;
                            label11.font = Arial_Bold_16;
                            label12.layoutY = 300.0;
                            panelC1.visible = true;
                            panelC1.layoutY = 115.0;
                            txtCNoteNo.visible = true;
                            txtCNoteNo.onKeyPressed = txtCNoteNoOnKeyPressedAtShown;
                            txtCNoteNo.onKeyReleased = txtCNoteNoOnKeyReleasedAtShown;
                            txtCNoteNo.font = Arial_Bold_14;
                            txtCNoteDate.layoutY = 35.0;
                            __layoutInfo_txtCNoteDate.width = 100.0;
                            txtCNoteDate.onKeyPressed = txtCNoteDateOnKeyPressedAtShown;
                            txtCNoteDate.promptText = "dd - mm-yyyy";
                            txtCNoteDate.editable = false;
                            imageDate.layoutX = 100.0;
                            imageDate.layoutY = 35.0;
                            imageDate.onMouseClicked = imageDateOnMouseClickedAtShown;
                            imageDate.blocksMouse = true;
                            imageDate.image = imageCalender;
                            txtCNoteAgstInv.layoutY = 105.0;
                            txtCNoteAgstInv.onKeyPressed = txtCNoteAgstInvOnKeyPressedAtShown;
                            txtCNoteAgstInv.onKeyReleased = txtCNoteAgstInvOnKeyReleasedAtShown;
                            txtCNotePName.layoutY = 137.0;
                            txtCNotePName.onKeyPressed = txtCNotePNameOnKeyPressedAtShown;
                            txtCNotePName.onKeyReleased = txtCNotePNameOnKeyReleasedAtShown;
                            txtCNoteAmt.visible = true;
                            txtCNoteAmt.layoutY = 168.0;
                            __layoutInfo_txtCNoteAmt.height = 80.0;
                            txtCNoteAmt.onKeyPressed = txtCNoteAmtOnKeyPressedAtShown;
                            txtCNoteAmt.blocksMouse = true;
                            txtCNoteAmt.cacheHint = javafx.scene.CacheHint.DEFAULT;
                            txtCNoteAmt.promptText = "0.00";
                            txtCNoteAmt.selectOnFocus = false;
                            txtCNoteAmt.font = Arial_Bold_65;
                            txtCNoteDetails.layoutY = 254.0;
                            __layoutInfo_txtCNoteDetails.height = 120.0;
                            txtCNoteDetails.onKeyPressed = txtCNoteDetailsOnKeyPressedAtShown;
                            txtCNoteDetails.multiline = true;
                            choiceOption.visible = true;
                            choiceOption.layoutX = 0.0;
                            choiceOption.layoutY = 70.0;
                            listCreditNo.visible = false;
                            listCreditNo.layoutY = 21.0;
                            listInvoiceNo.visible = false;
                            listInvoiceNo.layoutY = 133.0;
                            imageViewDown.visible = false;
                            imageViewDown.layoutY = 0.0;
                            imageViewDown.onMouseClicked = imageViewDownOnMouseClickedAtShown;
                            imageViewDown.blocksMouse = true;
                            imageViewDown.image = imageDown;
                            imagePDown.visible = false;
                            imagePDown.layoutY = 137.0;
                            imagePDown.onMouseClicked = imagePDownOnMouseClickedAtShown;
                            imagePDown.blocksMouse = true;
                            imagePDown.image = imageDown;
                            creDatePanel.visible = true;
                            creDatePanel.layoutX = 122.0;
                            creDatePanel.layoutY = 30.0;
                            creDatePanel.blocksMouse = true;
                            panelC2.visible = true;
                            panelC2.layoutY = 115.0;
                            imageView.visible = true;
                            imageView.image = imageSave;
                            btnCNoteSave.layoutY = 0.0;
                            btnCNoteSave.onKeyPressed = btnCNoteSaveOnKeyPressedAtShown;
                            btnCNoteSave.onMouseClicked = btnCNoteSaveOnMouseClickedAtShown;
                            btnCNoteSave.text = "Save [F3]";
                            imgEdit.visible = true;
                            imgEdit.image = imageEdit;
                            btnCNoteEdit.layoutY = 0.0;
                            btnCNoteEdit.onKeyPressed = btnCNoteEditOnKeyPressedAtShown;
                            btnCNoteEdit.onMouseClicked = btnCNoteEditOnMouseClickedAtShown;
                            btnCNoteEdit.text = "Edit [F6]";
                            imageView3.visible = true;
                            imageView3.image = imageReset;
                            btnCNoteReset.layoutY = 0.0;
                            btnCNoteReset.onKeyPressed = btnCNoteResetOnKeyPressedAtShown;
                            btnCNoteReset.onMouseClicked = btnCNoteResetOnMouseClickedAtShown;
                            btnCNoteReset.text = "Reset [F4]";
                            imgCancel.visible = true;
                            imgCancel.image = imageCancel;
                            btnCNoteCancel.layoutY = 0.0;
                            btnCNoteCancel.onKeyPressed = btnCNoteCancelOnKeyPressedAtShown;
                            btnCNoteCancel.onMouseClicked = btnCNoteCancelOnMouseClickedAtShown;
                            btnCNoteCancel.text = "Cancel [F8]";
                            panelButtons.visible = true;
                            panelAlert.visible = true;
                            panel.visible = true;
                        }
                    }
                ]
            }
        ]
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel, ]
    }
    // </editor-fold>//GEN-END:main

    var curDateFlag: Boolean = false;
    var today = DateUtils.now("dd-MM-yyyy");
    var fxCalendar = FXCalendar {
                theme: GrayTheme {};
            };
    var log: Logger = Logger.getLogger(CreditNote.class, "Financial");
    var user = bind CommonDeclare.user;
    var panelW = bind CommonDeclare.panelFormW;
    var panelH = bind CommonDeclare.panelFormH;
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var C1LX = bind CommonDeclare.Column21LX;
    var C2LX = bind CommonDeclare.Column22LX;
    var botton1LX = bind CommonDeclare.botton1LX;
    var botton2LX = bind CommonDeclare.botton2LX;
    var botton3LX = bind CommonDeclare.botton3LX;
    var botton4LX = bind CommonDeclare.botton4LX;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    var bottonW = bind CommonDeclare.bottonW;
    var CancelW = bottonW;
    var bottonH = bind CommonDeclare.bottonH;
    var seperatorW = bind CommonDeclare.seperatorW;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;//200
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;//150
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;//100
    var Type4TextboxW = bind CommonDeclare.Type4TextboxW;//50
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    var DetailTextW = bind 56.36721728 * panelW / 100;
    var AmtTextW = bind 43.66073698 * panelW / 100;
    var totam: Double;
    def CustomAlert = CustomAlert {};
    var mandatoryStyle: String = CommonDeclare.textbox_mandatory();
    var errorStyle: String = CommonDeclare.textbox_error();

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Credit Note", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = errorStyle;
    }

    function imagePDownOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
            if (btnCNoteSave.text == "Save [F3]" and choiceOption.selectedItem == "Others" or choiceOption.selectedItem == "Purchase Expiry Return") {
                getName(0);
            } else if (choiceOption.selectedItem == "Select") {
                FXinfo("Please Select the Return Type.");
                choiceOption.requestFocus();
            }
        
    }
    function choiceOptionOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtCNoteAgstInv.requestFocus();
        } else {
            shortcut (event) ;
        }
    }

    function imageViewDownOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        if (btnCNoteSave.text != "Save [F3]")
            getCreditNoteNo(0);
    }

    function txtCNotePNameOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
            if (btnCNoteSave.text == "Save [F3]" and choiceOption.selectedItem == "Others" or choiceOption.selectedItem == "Purchase Expiry Return") {
                getName(1);
            } else if (choiceOption.selectedItem == "Select") {
                FXinfo("Please Select the Return Type.");
                choiceOption.requestFocus();
            }
        
        if (event.code == KeyCode.VK_DOWN and listCreditNo.items != null) {
            listCreditNo.requestFocus();
            listCreditNo.selectFirstRow();
        }
        if (event.code == KeyCode.VK_ESCAPE) {
            listCreditNo.visible = false;
            txtCNotePName.requestFocus();
        }
    }

    var listH = 0.0;
    var choCreditOpt: String[];
    var ss = bind choiceOption.selectedItem on replace {
        txtCNotePName.text = "" ;
        listCreditNo.visible = false;
        fxCalendar.visible = false;
        txtCNoteAgstInv.disable = false ;
        label4.disable = false;
        label4.text = "Invoice No.";
        if (choiceOption.selectedItem  == "Others" or choiceOption.selectedItem  == "Purchase Expiry Return") {
            txtCNoteAgstInv.disable = true ;
            label4.disable = true ;
        }else if (choiceOption.selectedItem == "Sales Return") {
            label4.text = "Bill No.";
        } else {
            txtCNoteAgstInv.disable = false ;
            label4.disable = false;
        }



        if (ss != null and not ss.equals("Select")) {
            txtCNoteAgstInv.requestFocus();
        }
        if (choiceOption.selectedItem == "Sales Return" or choiceOption.selectedItem == "Purchase Return") {
            txtCNoteAgstInv.style = mandatoryStyle;
        } else {
            txtCNoteAgstInv.style = "";
        }
        if (choiceOption.selectedItem == "Others" or choiceOption.selectedItem == "Purchase Expiry Return") {
            imagePDown.visible = true;
        } else {
            imagePDown.visible = false;
        }
    }

    
    function rectangleOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        listCreditNo.visible = false;
        fxCalendar.visible = false;
    }

    var dam: Double;

    function checkAmount(): Integer {
        var i = 0;
        if (txtCNoteAmt.rawText != null and choiceOption.selectedItem == "Sales Return" or choiceOption.selectedItem == "Purchase Return") {
            dam = Double.parseDouble(txtCNoteAmt.rawText);
            displayCust();
            if (dam > totam) {
                    i = 1;
                    FXinfo("CreditNote amount cannot be greater than Invoice Amount Rs.{totam}.", txtCNoteAmt);
             }
            
        }
        return i;
    }

    public function displayCust(): Void {

        try {
            //Controller Instance
            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements ) as CommonImplements ;
            totam = commonController.CustTotAmt(txtCNoteAgstInv.text, txtCNotePName.text) ;
        } catch (e: Exception) {
            var msg: String = "Class : Credit  Note  Method : displayCust()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function displayDist(): Void {
        try {
            //Controller Instance
            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements ) as CommonImplements ;
            totam = commonController.DistTotAmt (txtCNoteAgstInv.text, txtCNotePName.text ) ;
        } catch (e: Exception) {
            var msg: String = "Class :Credit Note  Method : displayDist()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Credit Note", type);
        showAlertbox();
    }
    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Credit Note", msg);
        showAlertbox();

    }

    def kr = KeyRegistry {};
    var key = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 5 and CommonDeclare.form[4] == 3) {
            shortcut(key);
        }
    }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {
         if (event.controlDown or event.altDown or event.shiftDown) {
            kr.actionKey = event.code;
        }
        if (event.code == kr.save and btnCNoteSave.text == "Save [F3]" and not btnCNoteSave.disable) {
            saveClick();
        }
        if (event.code == kr.update and btnCNoteSave.text == "Update [F7]" and not btnCNoteSave.disable) {
            saveClick();
        }
        if (event.code == kr.edit and btnCNoteEdit.text == "Edit [F6]" and not btnCNoteEdit.disable) {
            editClick();
        }
        if (event.code == kr.reset and btnCNoteReset.text == "Reset [F4]") {
            clearAll();
        }
        if (event.code == kr.del and not btnCNoteEdit.disable) {
            DeleteClick();
        }
        if (event.controlDown and event.code == kr.back) {
            if (btnCNoteCancel.text == "Back [Ctrl+Left]") {
                imgCancel.image = imageCancel;
                cancelAll(); }
        }
        if (event.code == kr.cancel) {
            if (btnCNoteCancel.text == "Cancel [F8]") { panel.visible = false; }
        }
    }

    function txtCNoteDateOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtCNoteDate.style = mandatoryStyle;
        listCreditNo.visible = false;
        shortcut(event);
    }

    var visit = bind fxCalendar.visible on replace {
        if (curDateFlag and not visit) {
            getDate(0);
        }
    };

    function getDate(i: Integer) {
        if (i == 0) {
            txtCNoteDate.text = fxCalendar.getSelectedDate();
            choiceOption.requestFocus();
            curDateFlag = false;
        }
    }

    function imageDateOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        txtCNoteDate.style = mandatoryStyle;
        if (not curDateFlag) {
            creDatePanel.layoutY = imageDate.layoutY + txtCNoteDate.height + 5.0;
            if (txtCNoteDate.text != null) {
                var dat = txtCNoteDate.rawText.split("-");
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
    }

    function txtCNoteDetailsOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        fxCalendar.visible = false;
        listCreditNo.visible = false;
        if (event.code == KeyCode.VK_TAB) { btnCNoteSave.requestFocus(); }
        shortcut(event);
    }

    function txtCNoteNoOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (btnCNoteSave.text == "Update [F7]" and btnCNoteEdit.text == "Delete [F5]") {
            getCreditNoteNo(1);
            if (event.code == KeyCode.VK_DOWN and listCreditNo.items != null) {
                listCreditNo.requestFocus();
                listCreditNo.selectFirstRow();
            }
            if (event.code == KeyCode.VK_ESCAPE) {
                listCreditNo.visible = false;
                txtCNoteNo.requestFocus();
            }
        }
    }

    function txtCNoteNoOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtCNoteNo.style = mandatoryStyle;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            //Controller Instance
            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements ) as CommonImplements ;
            if (commonController.selectCreditNote(txtCNoteNo.rawText) == false) {
                txtCNoteNo.requestFocus();
                txtCNoteNo.text = "";
            } else {
                txtCNoteAgstInv.requestFocus();
                listCreditNo.visible = false;
                listInvoiceNo.visible = false;
            }
        }
        shortcut(event);
    }

    function btnCNoteCancelOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        cancelAll();
    }

    function btnCNoteCancelOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
      if(event.code==KeyCode.VK_ENTER or event.code==KeyCode.VK_SPACE or event.code==KeyCode.VK_TAB){
        cancelAll();
        }
        else { txtCNoteNo.requestFocus(); }
        shortcut(event);
    }

    function btnCNoteResetOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {

        clearAll();
    }

    function btnCNoteResetOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
    if(event.code==KeyCode.VK_ENTER or event.code==KeyCode.VK_SPACE){
        clearAll();
        }
        else{shortcut(event);}

    }

    function btnCNoteEditOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        if (btnCNoteEdit.text == "Edit [F6]") {
            editClick();
        } else {
            DeleteClick();
        }
    }

    function btnCNoteEditOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
    if(event.code==KeyCode.VK_ENTER or event.code==KeyCode.VK_SPACE){
         if (btnCNoteEdit.text == "Edit [F6]") {
            editClick();
        } else {
            DeleteClick();
        }
        }
        else{shortcut(event);}

    }

    function btnCNoteSaveOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        saveClick();
    }

    function btnCNoteSaveOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
    if(event.code==KeyCode.VK_ENTER or event.code==KeyCode.VK_SPACE){
        saveClick();
        }
        else{shortcut(event);}
    }

    function txtCNoteAmtOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtCNoteAmt.style = mandatoryStyle;        
        if (txtCNoteAmt.rawText.length() > 13) {txtCNoteAmt.selectEnd(); }
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtCNoteDetails.requestFocus();
        } else {
            shortcut(event);
//            txtCNoteAmt.text = "";
        }
    }

    function txtCNotePNameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            var isSelect: Boolean = false;
            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements ) as CommonImplements ;           
               //Controller Instance
           isSelect = commonController.selectCustomer (txtCNotePName.rawText) ;            
            if (isSelect == false) {
                txtCNotePName.requestFocus();
                txtCNotePName.text = "";
            } else {
                listCreditNo.visible = false;
                txtCNoteAmt.requestFocus();
            }
        } shortcut(event);
    }

    function txtCNoteAgstInvOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtCNoteAgstInv.style = "";
        listCreditNo.visible = false;
        fxCalendar.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtCNotePName.requestFocus();
        }
        shortcut(event);
            if (btnCNoteSave.text == "Save [F3]" and  choiceOption.selectedItem == "Sales Return") {
                txtCNoteAgstInv.style = mandatoryStyle;
                txtCNoteAmt.requestFocus();
                var g: CreditNoteTable = new CreditNoteTable("Customer");
                g.requestFocusInWindow();
                g.setVisible(true);
                g.requestFocus();
                updateValues();
            } else if (choiceOption.selectedItem == "Select") {
                FXinfo("Please Select the Return Type.");
                choiceOption.requestFocus();
            } shortcut(event);
        
    }

    function txtCNoteAgstInvOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {

    }

    function cancelAll(): Void {

        if (btnCNoteCancel.text == "Back [Ctrl+Left]") {
            clearAll();
            imageViewDown.visible = false;
            CancelW = bottonW;            
            buttonNames();
            //Controller Instance
            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements ) as CommonImplements ;
            txtCNoteNo.text = commonController.getCustId("credit_note", "credit_note_no", "CRE");
//            txtCNoteNo.text = commonController.getAutoIncrement(today,"CreditNotes");
        } else {
            Empty();
            delete  panel.content;
            panel.visible = false;
            CommonDeclare.form[4] = 0;
        }
    }

    function buttonNames(): Void {
        imgEdit.image = imageEdit;
        imgCancel.image = imageCancel;
        btnCNoteSave.text = "Save [F3]";
        btnCNoteEdit.text = "Edit [F6]";
        btnCNoteReset.text = "Reset [F4]";
        btnCNoteCancel.text = "Cancel [F8]";
        txtCNoteNo.disable = true;
        listCreditNo.visible = false;
        listInvoiceNo.visible = false;
    }

    function Empty(): Void {
        txtCNoteAgstInv.text = null;
        txtCNotePName.text = null;
        txtCNoteAmt.text = null;
        txtCNoteDetails.text = null;
        txtCNoteDate.text = null;
        CreditNoteTable.bill = null;
        CreditNoteTable.name = null;
    }

    function clearAll() {
        listCreditNo.visible = false ;        
        txtCNoteNo.text = "" ;
        txtCNoteAgstInv.text = "" ;
        txtCNotePName.text = "" ;
        txtCNoteAmt.text = "";
        txtCNoteDetails.text = "";
        txtCNoteDate.text = "";
        choCreditOpt = ["Select", "Sales Return", "Others"];
        choiceOption.select(0);
        if(btnCNoteSave.text == "Save [F3]"){
            //Controller Instance            
            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements ) as CommonImplements ;
            txtCNoteNo.text = commonController.getCustId("credit_note", "credit_note_no", "CRE");
//            txtCNoteNo.text = commonController.getAutoIncrement(today,"CreditNotes");
        }
        txtCNoteDate.text = DateUtils.now("dd-MM-yyyy");
        CreditNoteTable.bill = "";
        CreditNoteTable.name = "";
        mandatory();
        choiceOption.requestFocus();
    }

    function DeleteClick(): Void {
        try {
            if (txtCNoteNo.text != null) {
                var txtCNoteNo1: String = txtCNoteNo.text;
                var cn : ConfirmDialogBox = new ConfirmDialogBox(1,"Credit Notes") ;
                var a =bind cn.staus ;
                if (a) {
                    creditNoteController = RegistryFactory.getClientStub (RegistryConstants.CreditNote) as com.vanuston.medeil.implementation.CreditNote ;
                    if ( creditNoteController.deleteRecord (txtCNoteNo1) ) {

                    }
                    FXalert(5);
                    buttonNames();
                    clearAll();                                                        
               }
            } else {
                FXinfo("Please enter the Invoice Number to be Deleted.", txtCNoteAgstInv);
            }
        } catch (e: Exception) {
            var msg: String = "Class : Credit Note  method : DeleteClick()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function displayCreditNoteDetails(name: String): Void {
        var issueAganist: String = "Customer" ;
        try {
            creditNoteController = RegistryFactory.getClientStub (RegistryConstants.CreditNote) as com.vanuston.medeil.implementation.CreditNote ;
            var creditNoteModel : CreditNoteModel = creditNoteController.viewRecord (name) as CreditNoteModel  ;
            issueAganist = creditNoteModel.getIssuedAgainst() ;
            choCreditOpt = creditNoteModel.getCreditOption () ;
            choiceOption.select(0) ;
            txtCNoteAgstInv.text = creditNoteModel.getInvoiceOrBillNumber () ;
            txtCNotePName.text = creditNoteModel.getName () ;
            txtCNoteAmt.text = Value.Round (creditNoteModel.getAmount ().toString()) ;
            txtCNoteDetails.text = creditNoteModel.getDetails() ;
            txtCNoteDate.text = DateUtils.normalFormatDate (creditNoteModel.getCreditDate()) ;
        } catch (e: Exception) {
            var msg: String = "Class : Credit Note  method : displayCreditNoteDetails   = {e.getMessage()}";
            log.debug(msg);
        }
        imagePDown.visible = false;
    }

    function getCreditNoteNo(con: Integer) {
        if(not listCreditNo.visible){
        listCreditNo.visible = false ;
        var listControlObj: ListController = new ListController() ;
        listH = listControlObj.listImageControlView(txtCNoteNo, listCreditNo, "CreditNoteNo", con) ;
        listCreditNo.layoutY = txtCNoteNo.layoutY + 22;
        var selectString = bind listControlObj.selectedString on replace {
                if (selectString.length() > 0) {
                    listCreditNo.visible = false ;
                    displayCreditNoteDetails (selectString) ;
                    txtCNoteAmt.requestFocus () ;
                }
        }
      }
   else{
         listCreditNo.visible= false;
         txtCNoteNo.requestFocus();
     }
   }

    function editClick(): Void {
        imagePDown.visible = false;
        imageViewDown.visible = true;
        btnCNoteSave.text = "Update [F7]";
        btnCNoteEdit.text = "Delete [F5]";
        txtCNoteNo.disable = false;
        btnCNoteCancel.text = "Back [Ctrl+Left]";
        CancelW = bottonW + 50;
        imgEdit.image = imageCancel;
        imgCancel.image = imageBack;
        clearAll();
        txtCNoteNo.text = "";
        txtCNoteNo.requestFocus();
    }

    function getName(con: Integer) {
        listCreditNo.visible = false ;
        var listControlObj: ListController = new ListController() ;        
        listH = listControlObj.listImageControlView(txtCNotePName, listCreditNo, "Customer", con) ;        
        listCreditNo.layoutY = txtCNotePName.layoutY + 22;
        var selectString = bind listControlObj.selectedString on replace {
                if (selectString.length() > 0) {
                    listCreditNo.visible = false ;
                    txtCNoteAmt.requestFocus();
                }
        }
    }    

    function valClick(): Integer {

        var cnt: Integer = 0;
        var val: Validation = null;
        val = new Validation();
        try {
            var txtCNoteAgstInv1 = txtCNoteAgstInv.rawText;
            var txtCNotePName1 = txtCNotePName.rawText;
            var txtCNoteAmt1 = txtCNoteAmt.rawText;
            var txtCNoteDetails1 = txtCNoteDetails.rawText;
            var txtCNoteDate1 = txtCNoteDate.rawText;
            var txtCNoteNo1 = txtCNoteNo.rawText;

            var si1: Integer = 0; si1 = txtCNoteDate1.length();
            var si2: Integer = 0; si2 = txtCNoteNo1.length();
            var si3: Integer = 0; si3 = txtCNoteAgstInv1.length();
            var si4: Integer = 0; si4 = txtCNotePName1.length();
            var si5: Integer = 0; si5 = val.getDecimalValid(txtCNoteAmt1, 1, 12);
            var si6: Integer = 0; si6 = val.getAddressValid(txtCNoteDetails1, 1, 300);

            if (si1 != 10) {
                FXinfo("Please Enter Correct Date", txtCNoteDate);
            } else if (txtCNoteNo1 == null or si2 == 0) {
                FXinfo("Please Enter Credit No.");
                txtCNoteNo.requestFocus();
            } else if (choiceOption.selectedItem == "Select") {
                FXinfo("Please Select Return Type");
                choiceOption.requestFocus();
            } else if (txtCNoteAgstInv.rawText.length() <= 0 and choiceOption.selectedItem == "Sales Return") {
                FXinfo("Please Enter the Invoice Number.", txtCNoteAgstInv);
            } else if (txtCNoteAgstInv.rawText.length() <= 0 and choiceOption.selectedItem == "Purchase Return") {
                FXinfo("Please Enter the Invoice Number.", txtCNoteAgstInv);
            } else if (txtCNoteAmt.rawText.length() <= 0) {
                FXinfo("Please enter the Credit amount.", txtCNoteAmt);
            } else if (si5 == 1) {
                FXinfo("Only 12 digits can be entered for Credit Note amount.");
                txtCNoteAmt.requestFocus();
            } else if (si5 == 0) {
                FXinfo("Please enter only numbers for Credit Note amount");
                txtCNoteAmt.requestFocus();
            } else if (checkAmount() == 1) {                
                txtCNoteAmt.requestFocus();
            } else {
                cnt = 10;
            }
        } catch (e: Exception) {

            var msg: String = "Class : Credit Note  method : valClick()  = {e.getMessage()}";
            log.debug(msg);
        }
        return cnt;
    }

    function saveClick(): Void {
        try {
            var creditNoteModel : CreditNoteModel = new CreditNoteModel () ;
            if (valClick() == 10) {
                var issueAganist: String = "Customer";                
                creditNoteModel.setIssuedAgainst (issueAganist) ;
                creditNoteModel.setCreditDate (Date.valueOf (DateUtils.changeFormatDate (txtCNoteDate.rawText))) ;
                creditNoteModel.setCreditNoteNumber(txtCNoteNo.rawText);
                creditNoteModel.setInvoiceOrBillNumber (txtCNoteAgstInv.rawText) ;
                creditNoteModel.setCreditOption(choiceOption.selectedItem.toString());
                creditNoteModel.setName(txtCNotePName.rawText);
                creditNoteModel.setAmount(Double.parseDouble (Value.Round (txtCNoteAmt.rawText)));
                creditNoteModel.setDetails(txtCNoteDetails.rawText);
                if (btnCNoteSave.text == "Save [F3]") {
                    //Controller Instance
                    creditNoteController = RegistryFactory.getClientStub (RegistryConstants.CreditNote) as com.vanuston.medeil.implementation.CreditNote ;
                    if (creditNoteController.createRecord (creditNoteModel) as Boolean) {
                        FXalert (0) ;
                    }
                    buttonNames() ;
                    clearAll() ;                    

                } else {
                    var cn : ConfirmDialogBox = new ConfirmDialogBox(0, "Credit Notes") ;
                    var a =bind cn.staus;
                    if (a) {
                        creditNoteController = RegistryFactory.getClientStub (RegistryConstants.CreditNote) as com.vanuston.medeil.implementation.CreditNote ;
                        if (creditNoteController.updateRecord (creditNoteModel) as Boolean) {

                        }

                        buttonNames();
                          FXalert(4);
                        clearAll();                                                
                    }                    
                }
            }
        } catch (e: Exception) {
            var msg: String = "Class : Credit Note  method : saveClick()  = {e.getMessage()}";
            log.debug(msg);
        }
    }

      function getPrivileges(u : String ):Void{
        var uname = u;
        //Controller Instance
        commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements ) as CommonImplements ;
        var utype = commonController.getUserType(uname);

        if (utype.equals("User")) {
            var priv = commonController.getPrivileges("financial", uname);
            var ss = priv.split(",");

            var val = Integer.parseInt(ss[2]);

            if (val == 1) {
               	btnCNoteSave.disable=true;
				if(btnCNoteEdit.text!="Edit [F6]")
				{
					btnCNoteEdit.disable=true;
				}
				else{
					btnCNoteEdit.disable=false;
				}      
				
            } else if (val == 2) {
               if(btnCNoteEdit.text!="Edit [F6]")
				{
					btnCNoteEdit.disable=true;
				}
				else{
					btnCNoteEdit.disable=false;
				}
				btnCNoteSave.disable=false;	
				
            //This code for  READ and WRITE Access
            } else if (val == 3) {
				btnCNoteSave.disable=false;
				btnCNoteEdit.disable=false;
            }
        }else{
				btnCNoteSave.disable=false;
				btnCNoteEdit.disable=false;		
		}
    }
	
var logUser: String =  bind CommonDeclare.user on replace{
            getPrivileges(logUser);
        }

var changPiv =  bind btnCNoteSave.text on replace{
            getPrivileges(logUser);
        }

var changPiv1 =  bind btnCNoteEdit.text on replace{
            getPrivileges(logUser);
        }		
		
		
    function mandatory(): Void {
        txtCNoteAmt.style = mandatoryStyle;
        txtCNoteNo.style = mandatoryStyle;
    }

    public function updateValues(): Void {
        if (btnCNoteSave.text == "Save [F3]" and choiceOption.selectedItem == "Sales Return") {
            txtCNoteAgstInv.text = CreditNoteTable.bill;
            txtCNotePName.text = CreditNoteTable.name;
        }
        if (btnCNoteSave.text == "Save [F3]" and choiceOption.selectedItem == "Purchase Return") {
            txtCNoteAgstInv.text = CreditNoteTable.bill;
            txtCNotePName.text = CreditNoteTable.name;
        }
    }

    public function Startup(): Void {
        panel.visible = true ;
        panel.content = [rectangle, rectHeader, label, label5, separator, panelC1, panelC2, panelButtons, panelAlert,];
        fxCalendar.visible = false;
        txtCNoteDate.text = DateUtils.now("dd-MM-yyyy");
        choCreditOpt = ["Select", "Sales Return", "Others"];
        choiceOption.select(0);
        creDatePanel.content = [fxCalendar,];
        txtCNoteNo.disable = true;
        choiceOption.requestFocus () ;
       getPrivileges (logUser) ;
       //Controller Instance
       commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements ) as CommonImplements ;
        txtCNoteNo.text = commonController.getCustId("credit_note", "credit_note_no", "CRE");
//        txtCNoteNo.text = commonController.getAutoIncrement(today,"CreditNotes");
        mandatory () ;
    }

}
