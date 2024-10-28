package com.vanuston.medeil.ui;

import java.lang.*;
import javafx.scene.image.*;
import javafx.scene.input.KeyCode;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import com.vanuston.medeil.ui.calendar.theme.Theme;
import com.vanuston.medeil.util.Value;
import com.vanuston.medeil.util.Validation;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.CommonDeclare;
import javafx.scene.control.TextBox;
import com.vanuston.medeil.util.KeyRegistry;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.uitables.GetDebitDistributor;
import com.vanuston.medeil.model.DebitNoteModel;
import java.sql.Date;
import com.vanuston.medeil.uitables.ConfirmDialogBox;

public class DebitNote {

    var today = DateUtils.now("dd-MM-yyyy");
    var totam: Double;
    var choDebitOpt: String[] = null;
    var listLayoutY: Float;
    var listH = 0.0;
    var listW = 0.0;
    var dateFlag: Boolean = false;
    var fxCalendar = FXCalendar {
                theme: Theme {};
            };
    var log: Logger = Logger.getLogger(DebitNote.class, "Financial");
    //Controller Reference
    var commonController : CommonImplements ;//= RegistryFactory.getClientStub(RegistryConstants.CommonImplements ) as CommonImplements ;
    var debitNoteController : com.vanuston.medeil.implementation.DebitNote ;//= RegistryFactory.getClientStub (RegistryConstants.DebitNote) as com.vanuston.medeil.implementation.DebitNote ;
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 397.5
        layoutY: 0.0
        styleClass: "rectFormHeader"
        width: bind panelW
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_separator: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
    }
    public-read def separator: javafx.scene.control.Separator = javafx.scene.control.Separator {
        visible: false
        layoutInfo: __layoutInfo_separator
    }
    
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def imageDate: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutY: 186.0
    }
    
    def __layoutInfo_choiceOption: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW+30
    }
    public-read def choiceOption: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: 319.0
        layoutY: 76.0
        layoutInfo: __layoutInfo_choiceOption
        items: bind choDebitOpt
    }
    
    def __layoutInfo_listDebitNote: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listDebitNote: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutY: bind listLayoutY
        layoutInfo: __layoutInfo_listDebitNote
        items: null
    }
    
    public-read def imageViewDown: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind Type2TextboxW-2
        layoutY: 67.0
    }
    
    public-read def imagePDown: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind Type2TextboxW-2
        layoutY: 127.0
    }
    
    public-read def panelCalender: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: 178.0
        blocksMouse: true
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
    
    def __layoutInfo_txtDNoteDetails: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind DetailTextW
        height: 113.0
    }
    public-read def txtDNoteDetails: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 298.0
        layoutInfo: __layoutInfo_txtDNoteDetails
        font: Arial_12
    }
    
    def __layoutInfo_txtDNoteAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind AmtTextW
    }
    public-read def txtDNoteAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 270.0
        layoutInfo: __layoutInfo_txtDNoteAmt
        font: Arial_12
    }
    
    def __layoutInfo_txtDNotePName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtDNotePName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        managed: true
        layoutY: 245.0
        layoutInfo: __layoutInfo_txtDNotePName
        font: Arial_12
    }
    
    def __layoutInfo_txtDNoteAgstInv: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtDNoteAgstInv: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 214.0
        layoutInfo: __layoutInfo_txtDNoteAgstInv
        font: Arial_12
    }
    
    def __layoutInfo_txtDNoteDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtDNoteDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 186.0
        layoutInfo: __layoutInfo_txtDNoteDate
        onKeyPressed: txtDNoteDateOnKeyPressed
        editable: false
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
    
    def __layoutInfo_txtDNoteNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtDNoteNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 130.0
        layoutInfo: __layoutInfo_txtDNoteNo
        text: ""
        promptText: ""
        selectOnFocus: false
        editable: false
        font: Arial_Bold_14
    }
    
    public-read def panelC2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind C2LX
        content: [ txtDNoteNo, txtDNoteDate, imageDate, txtDNoteAgstInv, txtDNotePName, txtDNoteAmt, txtDNoteDetails, choiceOption, listDebitNote, imageViewDown, imagePDown, panelCalender, ]
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
    
    def __layoutInfo_btnDNoteCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind CancelW
        height: bind bottonH
    }
    public-read def btnDNoteCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton4LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnDNoteCancel
        effect: reflectionEffect
        graphic: imgCancel
        text: "Cancel [Esc]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnDNoteReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnDNoteReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton3LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnDNoteReset
        effect: reflectionEffect
        graphic: imageView3
        text: "Reset [F5]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnDNoteEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnDNoteEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton2LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnDNoteEdit
        effect: reflectionEffect
        graphic: imgEdit
        text: "Edit  [F4]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnDNoteSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnDNoteSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnDNoteSave
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
        content: [ btnDNoteSave, btnDNoteEdit, btnDNoteReset, btnDNoteCancel, ]
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
    
    public-read def label10: javafx.scene.control.Label = javafx.scene.control.Label {
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
        content: [ label14, label8, label, label4, label10, label11, label12, ]
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.4
    }
    
    public-read def dropShadowEffect: javafx.scene.effect.DropShadow = javafx.scene.effect.DropShadow {
    }
    
    public-read def lightingEffect: javafx.scene.effect.Lighting = javafx.scene.effect.Lighting {
    }
    
    def __layoutInfo_labelHeader: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
    }
    public-read def labelHeader: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 633.0
        layoutY: 34.0
        layoutInfo: __layoutInfo_labelHeader
        effect: lightingEffect
        text: "Credit Note"
        font: Arial_25
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ rectangle, rectHeader, labelHeader, label3, separator, panelC1, panelC2, panelButtons, panelAlert, ]
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
    
    public-read def linearGradient2: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
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
                            rectHeader.managed = true;
                            rectHeader.layoutX = 0.0;
                            rectHeader.fill = linearGradient2;
                            rectHeader.height = 32.0;
                            rectHeader.arcWidth = 5.0;
                            rectHeader.arcHeight = 5.0;
                            labelHeader.layoutX = 0.0;
                            labelHeader.layoutY = 1.0;
                            labelHeader.text = "Debit Note - ctrl+B";
                            labelHeader.hpos = javafx.geometry.HPos.CENTER;
                            label3.visible = true;
                            label3.layoutX = 35.0;
                            label3.layoutY = 80.0;
                            label3.text = "Debit Note Details";
                            label3.font = Arial_18;
                            label3.textFill = Green;
                            separator.visible = true;
                            separator.layoutX = 30.0;
                            separator.layoutY = 105.0;
                            label14.layoutY = 0.0;
                            label14.text = "Debit Note No.";
                            label8.layoutY = 35.0;
                            label.visible = true;
                            label.layoutY = 70.0;
                            label.text = "Return type";
                            label.font = Arial_12;
                            label.textFill = DarkGray;
                            label4.layoutY = 105.0;
                            label4.text = "Invoice No .";
                            label10.layoutY = 137.0;
                            label10.text = "Name ";
                            label11.layoutY = 210.0;
                            label11.font = Arial_Bold_16;
                            label12.layoutY = 300.0;
                            panelC1.visible = true;
                            panelC1.layoutY = 115.0;
                            txtDNoteNo.layoutY = 0.0;
                            txtDNoteNo.onKeyPressed = txtDNoteNoOnKeyPressedAtShown;
                            txtDNoteNo.onKeyReleased = txtDNoteNoOnKeyReleasedAtShown;
                            txtDNoteDate.layoutY = 35.0;
                            __layoutInfo_txtDNoteDate.width = 100.0;
                            txtDNoteDate.onKeyPressed = txtDNoteDateOnKeyPressedAtShown;
                            txtDNoteDate.promptText = "dd-mm-yyyy";
                            txtDNoteDate.editable = false;
                            imageDate.layoutX = 100.0;
                            imageDate.layoutY = 35.0;
                            imageDate.onMouseClicked = imageDateOnMouseClickedAtShown;
                            imageDate.blocksMouse = true;
                            imageDate.image = imageCalender;
                            txtDNoteAgstInv.layoutY = 105.0;
                            txtDNoteAgstInv.onKeyPressed = txtDNoteAgstInvOnKeyPressedAtShown;
                            txtDNoteAgstInv.onKeyReleased = txtDNoteAgstInvOnKeyReleasedAtShown;
                            txtDNotePName.layoutY = 137.0;
                            txtDNotePName.onKeyPressed = txtDNotePNameOnKeyPressedAtShown;
                            txtDNotePName.onKeyReleased = txtDNotePNameOnKeyReleasedAtShown;
                            txtDNotePName.editable = true;
                            txtDNoteAmt.layoutY = 168.0;
                            __layoutInfo_txtDNoteAmt.height = 80.0;
                            txtDNoteAmt.onKeyPressed = txtDNoteAmtOnKeyPressedAtShown;
                            txtDNoteAmt.promptText = "0.00";
                            txtDNoteAmt.font = Arial_Bold_65;
                            txtDNoteDetails.layoutY = 254.0;
                            __layoutInfo_txtDNoteDetails.height = 120.0;
                            txtDNoteDetails.onKeyPressed = txtDNoteDetailsOnKeyPressedAtShown;
                            txtDNoteDetails.multiline = true;
                            choiceOption.visible = true;
                            choiceOption.layoutX = 0.0;
                            choiceOption.layoutY = 70.0;
                            listDebitNote.visible = false;
                            listDebitNote.onKeyPressed = listCreditNoteOnKeyPressedAtShown;
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
                            panelCalender.visible = true;
                            panelCalender.layoutX = 122.0;
                            panelCalender.layoutY = 28.0;
                            panelCalender.blocksMouse = true;
                            panelC2.visible = true;
                            panelC2.layoutY = 115.0;
                            imageView.visible = true;
                            imageView.image = imageSave;
                            btnDNoteSave.layoutY = 0.0;
                            btnDNoteSave.onKeyReleased = btnDNoteSaveOnKeyReleasedAtShown;
                            btnDNoteSave.text = "Save [F3]";
                            btnDNoteSave.action = btnDNoteSaveActionAtShown;
                            imgEdit.visible = true;
                            imgEdit.image = imageEdit;
                            btnDNoteEdit.layoutY = 0.0;
                            btnDNoteEdit.onKeyReleased = btnDNoteEditOnKeyReleasedAtShown;
                            btnDNoteEdit.text = "Edit [F6]";
                            btnDNoteEdit.action = btnDNoteEditActionAtShown;
                            imageView3.visible = true;
                            imageView3.image = imageReset;
                            btnDNoteReset.layoutY = 0.0;
                            btnDNoteReset.onKeyReleased = btnDNoteResetOnKeyReleasedAtShown;
                            btnDNoteReset.text = "Reset [F4]";
                            btnDNoteReset.action = btnDNoteResetActionAtShown;
                            imgCancel.visible = true;
                            imgCancel.image = imageCancel;
                            btnDNoteCancel.layoutY = 0.0;
                            btnDNoteCancel.onKeyReleased = btnDNoteCancelOnKeyReleasedAtShown;
                            btnDNoteCancel.text = "Cancel [F8]";
                            btnDNoteCancel.action = btnDNoteCancelActionAtShown;
                            panelButtons.visible = true;
                            panel.visible = true;
                            panel.onKeyPressed = panelOnKeyPressedAtShown;
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

    function btnDNoteCancelOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            btnDNoteCancelActionAtShown();
        } else { shortcut(event); }
    }

    function btnDNoteResetOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            btnDNoteResetActionAtShown();
        } else { shortcut(event); }
    }

    function btnDNoteEditOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            btnDNoteEditActionAtShown();
        } else { shortcut(event); }
    }

    function btnDNoteSaveOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            btnDNoteSaveActionAtShown();
        } else { shortcut(event); }
    }

    function imagePDownOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
            if (choiceOption.selectedItem == "Others" or choiceOption.selectedItem == "Purchase Expiry Return") {
                getName(0);
            } else if (choiceOption.selectedItem == "Select") {
                FXinfo("Please select Return Type.");
                choiceOption.requestFocus();
            }       
    }

    function imageViewDownOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        if (btnDNoteSave.text == "Update [F7]" and btnDNoteEdit.text == "Delete [F5]") {
            getDNO (0) ;
        }
    }

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
    var DetailsTextboxW = bind (61.62642948 * panelW) / 100;
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    var DetailTextW = bind 56.36721728 * panelW / 100;
    var AmtTextW = bind 43.66073698 * panelW / 100;
    var mandatoryStyle: String = CommonDeclare.textbox_mandatory();
    var errorStyle: String = CommonDeclare.textbox_error();
    def CustomAlert = CustomAlert {};

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Debit Note", type);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Debit Note", msg);
        showAlertbox();
    }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Debit Note", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = errorStyle;
    }

    function txtDNotePNameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        fxCalendar.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            var isSelect : Boolean = false ;
            //Controller Instance
            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements ) as CommonImplements ;            
            isSelect = commonController.selectDistributor (txtDNotePName.rawText) ;
            
            if (isSelect == false) {
                txtDNotePName.requestFocus();
                txtDNotePName.text = "";
            } else {
                listDebitNote.visible = false;
                txtDNoteAmt.requestFocus();
            }
        } shortcut(event);
    }

    function txtDNotePNameOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {        
            if (btnDNoteSave.text == "Save [F3]" and choiceOption.selectedItem == "Others" or choiceOption.selectedItem == "Purchase Expiry Return") {
                getName(1);
            } else if (choiceOption.selectedItem == "Select") {
                FXinfo("Please select the Return Type.");
                choiceOption.requestFocus();
            }        
        if (event.code == KeyCode.VK_DOWN and listDebitNote.items != null) {
            listDebitNote.requestFocus();
            listDebitNote.selectFirstRow();
        }
        if (event.code == KeyCode.VK_ESCAPE) {
            listDebitNote.visible = false;
            txtDNotePName.requestFocus();
        }
    }

    function txtDNoteDateOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ESCAPE) { fxCalendar.visible = false; }
    }

    function panelOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function rectangleOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        listDebitNote.visible = false;
        fxCalendar.visible = false;
    }

    function imageDateOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        if (not dateFlag) {
            panelCalender.layoutY = imageDate.layoutY + txtDNoteDate.height + 5.0;
            if (txtDNoteDate.text != null) {
                var dat = txtDNoteDate.rawText.split("-");
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
            dateFlag = true;
        } else {
            fxCalendar.visible = false;
        }
    }

    var visit = bind fxCalendar.visible on replace {
        if (dateFlag and not visit) {
            getDate(0);
        }
    };

    function getDate(i: Integer) {
        if (i == 0) {
            txtDNoteDate.text = fxCalendar.getSelectedDate();
            choiceOption.requestFocus();
            dateFlag = false;
        }
    }

    def kr = KeyRegistry {};
    var key = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 5 and CommonDeclare.form[4] == 4) {
            shortcut(key);
        }
    }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {
        if (event.controlDown or event.altDown or event.shiftDown) {
            kr.actionKey = event.code;
        }

        if (event.code == kr.save and btnDNoteSave.text == "Save [F3]" and not btnDNoteSave.disable) {
            save();
        }
        if (event.code == kr.edit and btnDNoteEdit.text == "Edit [F6]" and not btnDNoteEdit.disable) {
            edit();
        }
        if (event.code == kr.reset and btnDNoteReset.text == "Reset [F4]") {
            reset();
        }
        if (event.code == kr.update and btnDNoteSave.disable == false) {
            if (btnDNoteSave.text == "Update [F7]") { update(); }
        }
        if (event.code == kr.del and btnDNoteEdit.disable == false) {
            if (btnDNoteEdit.text == "Delete [F5]") { del(); }
        }
        if (event.controlDown and event.code == kr.back) {
            if (btnDNoteCancel.text == "Back [Ctrl+Left]") { back(); }
        }
        if (event.code == kr.cancel) {
            if (btnDNoteCancel.text == "Cancel [F8]") { cancel(); }
        }
    }

    function txtDNoteDetailsOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtDNoteDetails.style = "";
        listDebitNote.visible = false;
        fxCalendar.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { btnDNoteSave.requestFocus(); }
        shortcut(event);
    }

    function txtDNoteAmtOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        listDebitNote.visible = false;
        fxCalendar.visible = false;
        txtDNoteAmt.style = mandatoryStyle;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtDNoteDetails.requestFocus(); }
        shortcut(event);
    }

    public function displayCust(): Void {
        try {
            //Controller Instance
            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements ) as CommonImplements ;
            totam = commonController.CustTotAmt (txtDNoteAgstInv.text, txtDNotePName.text) ;
        } catch (e: Exception) {
            var msg: String = "Class : Debit Note  Method : displayCust()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function displayDist(): Void {
        try {
            //Controller Instance
            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements ) as CommonImplements ;
            totam = commonController.DistTotAmt (txtDNoteAgstInv.text, txtDNotePName.text ) ;
        } catch (e: Exception) {
            var msg: String = "Class : Debit Note  Method : displayDist()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function txtDNoteAgstInvOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtDNoteAgstInv.style = "";
        listDebitNote.visible = false;
        fxCalendar.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtDNotePName.requestFocus();
        }
        shortcut(event);
           if (btnDNoteSave.text == "Save [F3]" and choiceOption.selectedItem == "Purchase Return") {
                txtDNoteAgstInv.style = mandatoryStyle;
                txtDNoteAmt.requestFocus();
                var g: GetDebitDistributor = new GetDebitDistributor("Distributor");
                g.requestFocusInWindow();
                g.setVisible(true);
                g.requestFocus();
                 updateValues();
            } else if (choiceOption.selectedItem == "Select") {
                FXinfo("Please select the Return Type.");
                choiceOption.requestFocus();
            } shortcut(event);
        
    }

    function txtDNoteAgstInvOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {

    }

    public function updateValues(): Void {
        if (btnDNoteSave.text == "Save [F3]" and choiceOption.selectedItem == "Sales Return") {
            txtDNoteAgstInv.text = GetDebitDistributor.bill;
            txtDNotePName.text = GetDebitDistributor.name;
        }
        if (btnDNoteSave.text == "Save [F3]" and choiceOption.selectedItem == "Purchase Return") {
            txtDNoteAgstInv.text = GetDebitDistributor.bill;
            txtDNotePName.text = GetDebitDistributor.name;
        }
    }

    function txtDNoteDateOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtDNoteDate.style = mandatoryStyle;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtDNoteAgstInv.requestFocus(); }
        if (event.code == KeyCode.VK_ESCAPE) { fxCalendar.visible = false; }
        shortcut(event);
    }

    function txtDNoteNoOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        fxCalendar.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            //Controller Instance
            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements ) as CommonImplements ;
            if (commonController.selectDebitNote (txtDNoteNo.rawText) == false ) {
                txtDNoteNo.requestFocus();
                txtDNoteNo.text = "";
            } else {
                listDebitNote.visible = false;
                txtDNoteDate.requestFocus();
            }
        }
        shortcut(event);
    }

    function listCreditNoteOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (listDebitNote.focused) {
            if (event.code == KeyCode.VK_DOWN)
                listDebitNote.selectFirstRow();
        }
    }

    function txtDNoteNoOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (btnDNoteSave.text == "Update [F7]" and btnDNoteEdit.text == "Delete [F5]") {
            getDNO (1) ;
            if (event.code == KeyCode.VK_DOWN and listDebitNote.items != null) {
                listDebitNote.requestFocus();
                listDebitNote.selectFirstRow();
            }
            if (event.code == KeyCode.VK_ESCAPE) {
                listDebitNote.visible = false;
                txtDNoteNo.requestFocus();
            }
        }
    }

    function btnDNoteCancelActionAtShown(): Void {
        cancel();
    }

    function btnDNoteResetActionAtShown(): Void {
        reset();
    }

    function btnDNoteEditActionAtShown(): Void {
        if (btnDNoteEdit.text == "Delete [F5]") {
            del();
        } else {
            edit();
        }
    }

    function btnDNoteSaveActionAtShown(): Void {
        if (btnDNoteSave.text == "Update [F7]") {
            update();
        } else {
            save();
        }
    }

    var ss = bind choiceOption.selectedItem on replace {
        txtDNotePName.text = "" ;
        listDebitNote.visible = false;
        fxCalendar.visible = false;
        txtDNoteAgstInv.disable = false ;
        label4.disable = false ;
        label4.text = "Invoice No.";
        if (ss != null and not ss.equals("Select")) {
            txtDNoteAgstInv.requestFocus();
        }
        if (choiceOption.selectedItem == "Sales Return") {
            label4.text = "Bill No." ;
        }

        if (choiceOption.selectedItem == "Sales Return" or choiceOption.selectedItem == "Purchase Return") {
            txtDNoteAgstInv.style = mandatoryStyle;
        } else {
            txtDNoteAgstInv.style = "";
        }
        if (choiceOption.selectedItem == "Others" or choiceOption.selectedItem == "Purchase Expiry Return") {
            txtDNoteAgstInv.disable = true ;
            label4.disable = true ;
            imagePDown.visible = true;
        } else {
            imagePDown.visible = false;
        }
    }

       
    public function save(): Void {
        try {
            var san: Integer = 0;
            san = clickValid();
            if (san == 10) {
                var against: String = null;
                
                var debitNoteModel : DebitNoteModel = new DebitNoteModel () ;
                debitNoteModel.setDebitNoteNumber (txtDNoteNo.text);
                debitNoteModel.setDebitOption (choiceOption.selectedItem.toString ()) ;
                debitNoteModel.setInvoiceOrBillNumber (txtDNoteAgstInv.rawText) ;
                debitNoteModel.setName (txtDNotePName.rawText) ;
                debitNoteModel.setAmount (Double.parseDouble (Value.Round (txtDNoteAmt.rawText))) ;
                debitNoteModel.setDetails (txtDNoteDetails.rawText) ;
                debitNoteModel.setIssuedAgainst ("Distributor") ;
                debitNoteModel.setDebitDate (Date.valueOf (DateUtils.changeFormatDate (txtDNoteDate.rawText))) ;
                //Controller Instance
                debitNoteController = RegistryFactory.getClientStub (RegistryConstants.DebitNote) as com.vanuston.medeil.implementation.DebitNote ;
                commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements ) as CommonImplements ;
                if (debitNoteController.createRecord (debitNoteModel) as Boolean) {
                    FXalert(0);
                }                
                commonController.updateLog ("Debit Note", btnDNoteSave.text) ;
                choiceOption.requestFocus();
                //Controller Instance
                txtDNoteNo.text = commonController.getCustId("debit_note", "debit_note_no", "DEB");
//                txtDNoteNo.text = commonController.getAutoIncrement(today, "DebitNotes");
                setClear();
            }
        } catch (e: Exception) {
            var msg: String = "Class : Debit Note  Method : Save()   = {e.getMessage()}";
            
            log.debug(msg);
        }
    }

    public function update() {
        try {
            var san: Integer = 0;
            san = clickValid();
            if (san == 10) {
                var against: String = null;
                
                var debitNoteModel : DebitNoteModel = new DebitNoteModel () ;
                debitNoteModel.setDebitNoteNumber (txtDNoteNo.text);
                debitNoteModel.setDebitOption (choiceOption.selectedItem.toString ()) ;
                debitNoteModel.setInvoiceOrBillNumber (txtDNoteAgstInv.rawText) ;
                debitNoteModel.setName (txtDNotePName.rawText) ;
                debitNoteModel.setAmount (Double.parseDouble (Value.Round (txtDNoteAmt.rawText))) ;
                debitNoteModel.setDetails (txtDNoteDetails.rawText) ;
                debitNoteModel.setIssuedAgainst ("Distributor") ;
                debitNoteModel.setDebitDate (Date.valueOf (DateUtils.changeFormatDate (txtDNoteDate.rawText))) ;
                var cn : ConfirmDialogBox = new ConfirmDialogBox(0,"Debit Notes");
                var a =bind cn.staus;
                if (a) {
                    //Controller Instance
                    debitNoteController = RegistryFactory.getClientStub (RegistryConstants.DebitNote) as com.vanuston.medeil.implementation.DebitNote ;
                    commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements ) as CommonImplements ;
                    if (debitNoteController.updateRecord (debitNoteModel) as Boolean) {

                    }
                    //Controller Instance
                    commonController.updateLog ("Debit Note", btnDNoteSave.text) ;
                    FXalert(4);
                    txtDNoteNo.requestFocus();
                    txtDNoteNo.text = "";
                    setClear();
                }
            }
        } catch (e: Exception) {
            var msg: String = "Class : Debit Note  Method : Update()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function del() {
        try {
            if (txtDNoteNo.text != null) {
                var cn : ConfirmDialogBox = new ConfirmDialogBox(1,"Debit Notes");
                var a =bind cn.staus;
                if (a) {
                    var dno = txtDNoteNo.rawText.replaceAll("'", "") ;
                    //Controller Instance
                    debitNoteController = RegistryFactory.getClientStub (RegistryConstants.DebitNote) as com.vanuston.medeil.implementation.DebitNote ;
                    commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements ) as CommonImplements ;
                    debitNoteController.deleteRecord (txtDNoteNo.rawText) ;
                    commonController.updateLog ("Debit Note", btnDNoteReset.text) ;
                    FXalert(5);
                    txtDNoteNo.requestFocus();
                    txtDNoteNo.text = "";
                    setClear();
                }
            } else {
                FXinfo("Please select the DebitNote to be Deleted.", txtDNoteNo);
            }
        } catch (e: Exception) {
            var msg: String = "Class : Debit Note  Method : Delete()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function edit(): Void {
        imagePDown.visible = false;
        imageViewDown.visible = true;
        txtDNoteNo.editable = true;
        txtDNoteNo.requestFocus();
        setClear();
        txtDNoteNo.text = "";
        txtDNoteAgstInv.editable = false;
        txtDNotePName.editable = false;
        btnDNoteEdit.text = "Delete [F5]";
        btnDNoteCancel.text = "Back [Ctrl+Left]";
        CancelW = bottonW + 50;
        imgEdit.image = imageCancel;
        imgCancel.image = imageBack;
        btnDNoteSave.text = "Update [F7]";
    }

    public function reset(): Void {
        txtDNoteDate.requestFocus();
        setClear();
        txtDNoteNo.text = "";
        if (btnDNoteSave.text == "Save [F3]") {
            //Controller Instance
            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements ) as CommonImplements ;
            txtDNoteNo.text = commonController.getCustId("debit_note", "debit_note_no", "DEB") ;
//            txtDNoteNo.text = commonController.getAutoIncrement (today, "DebitNotes") ;
        }
    }

    public function back(): Void {

        listDebitNote.visible = false;
        imageViewDown.visible = false;
        txtDNoteDate.requestFocus();
        btnDNoteEdit.disable = false;
        btnDNoteReset.disable = false;
        btnDNoteEdit.text = "Edit [F6]";
        btnDNoteReset.text = "Reset [F4]";
        txtDNoteNo.editable = false;
        txtDNoteAgstInv.editable = true;
        txtDNotePName.editable = true;
        setClear();
        //Controller Instance
        commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements ) as CommonImplements ;
        txtDNoteNo.text = commonController.getCustId("debit_note", "debit_note_no", "DEB");
//        txtDNoteNo.text = commonController.getAutoIncrement (today, "DebitNotes") ;
        btnDNoteSave.disable = false;
        btnDNoteSave.text = "Save [F3]";
        btnDNoteCancel.text = "Cancel [F8]";
        CancelW = bottonW;
        imgEdit.image = imageEdit;
        imgCancel.image = imageCancel;
    }

    public function cancel(): Void {
        if (btnDNoteCancel.text == "Back [Ctrl+Left]") {
            back();
        } else {
            Empty();
            delete  panel.content;
            panel.visible = false;
            CommonDeclare.form[4] = 0;
        }
    }

    public function getDNO(con: Integer) {
        if(not listDebitNote.visible){
        listDebitNote.visible = false ;
        var listControlObj: ListController = new ListController() ;
        listH = listControlObj.listImageControlView(txtDNoteNo, listDebitNote, "DebitNoteNo", con) ;
        listW = Type2TextboxW;
        listLayoutY = txtDNoteNo.layoutY + 22;        
        var selectString = bind listControlObj.selectedString on replace {
                if (selectString.length() > 0) {
                    listDebitNote.visible = false ;
                    displayDNO (selectString) ;
                    txtDNoteAmt.requestFocus () ;
                }
        }
      }
    else{
          listDebitNote.visible =false;
           txtDNoteNo.requestFocus();
     }
    }

    function getName(con: Integer) {
        if(not listDebitNote.visible){
        listDebitNote.visible = false;
        var listControlObj: ListController = new ListController() ;
       listH = listControlObj.listImageControlView(txtDNotePName, listDebitNote, "Distributor", con) ;
        listW = Type2TextboxW;
        listLayoutY = txtDNotePName.layoutY + 22;        
        var selectString = bind listControlObj.selectedString on replace {
                if (selectString.length() > 0) {
                    listDebitNote.visible = false ;
                    txtDNoteAmt.requestFocus();
                }
        }
      }
       else{
           listDebitNote.visible= false;
           txtDNotePName.requestFocus();
       }
    }

    public function displayDNO(NoteNo : String): Void {
        try {
            //Controller Instance
            debitNoteController = RegistryFactory.getClientStub (RegistryConstants.DebitNote) as com.vanuston.medeil.implementation.DebitNote ;
            var debitNoteModel : DebitNoteModel = debitNoteController.viewRecord (NoteNo) as DebitNoteModel ;
            var against = debitNoteModel.getIssuedAgainst () ;
            choDebitOpt = debitNoteModel.getDebitOption () ;
            choiceOption.select (0) ;
            txtDNoteDate.text =  DateUtils.normalFormatDate (debitNoteModel.getDebitDate ()) ;
            txtDNoteAgstInv.text = debitNoteModel.getInvoiceOrBillNumber () ;
            txtDNotePName.text = debitNoteModel.getName () ;
            txtDNoteAmt.text = Value.Round (debitNoteModel.getAmount ().toString ()) ;
            txtDNoteDetails.text = debitNoteModel.getDetails () ;
            imagePDown.visible = false;
        } catch (e: Exception) {
            var msg: String = "Class : Debit Note  Method : displayDNO()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function clickValid(): Integer {

        var amt = txtDNoteAmt.rawText.replaceAll("'", "");
        var detail = txtDNoteDetails.rawText.trim().replaceAll("'", "");
        var cnt: Integer = 0;
        var val: Validation = new Validation();
        try {
            var am: Integer = 0; am = val.getDecimalValid(amt, 2, 20);
            var de: Integer = 0; de = val.getAlphaNumericValid(detail, 4, 100);
            if (txtDNoteNo.rawText.length() <= 0 or txtDNoteNo.rawText == null) {
                FXinfo("Please Enter Debit No.");
                txtDNoteNo.requestFocus();
            } else if (txtDNoteDate.rawText.length() <= 0) {
                FXinfo("Please enter a valid date.", txtDNoteDate);
            } else if (choiceOption.selectedItem == "Select") {
                FXinfo("Please select a Return Type");
                choiceOption.requestFocus();
            } else if (txtDNoteAgstInv.rawText.length() <= 0 and choiceOption.selectedItem == "Sales Return") {
                FXinfo("Please enter the Invoice Number.", txtDNoteAgstInv);
            } else if (txtDNoteAgstInv.rawText.length() <= 0 and choiceOption.selectedItem == "Purchase Return") {
                FXinfo("Please enter the Invoice Number.", txtDNoteAgstInv);
            } else if (txtDNoteAmt.rawText.length() <= 0) {
                FXinfo("Please enter the Debit amount.", txtDNoteAmt);
            } else if (am == 0) {
                FXinfo("Please enter only Numeral and Decimal values.");
                txtDNoteAmt.requestFocus();
            } else if (checkAmount() == 1) {
                txtDNoteAmt.requestFocus();
            } else {
                cnt = 10;
            }
        } catch (e: Exception) {
            var msg: String = "Class : Debit Note  Method : clickValid()   = {e.getMessage()}";
            log.debug(msg);
        }
        return cnt;
    }

    var dam: Double;

    function checkAmount(): Integer {
        var i = 0;
        if (txtDNoteAmt.rawText != null and choiceOption.selectedItem == "Sales Return" or choiceOption.selectedItem == "Purchase Return") {
            dam = Double.parseDouble(txtDNoteAmt.rawText);           
            displayDist();
            if (dam > totam) {
                    i = 1;
                    FXinfo("DebitNote amount cannot be greater than Invoice Amount Rs. {totam}.", txtDNoteAmt);
             }
       
        }
        return i;
    }

    public function Empty(): Void {
        txtDNoteDate.text = null;
        txtDNoteAgstInv.text = null;
        txtDNotePName.text = null;
        txtDNoteAmt.text = null;
        txtDNoteDetails.text = null;
        GetDebitDistributor.bill = null;
        GetDebitDistributor.name = null;
    }

    public function setClear(): Void {
        listDebitNote.visible = false ;
        txtDNoteDate.text = "";
        txtDNoteAgstInv.text = "";
        txtDNotePName.text = "";
        txtDNoteAmt.text = "";
        txtDNoteDetails.text = "";
        GetDebitDistributor.bill = "";
        GetDebitDistributor.name = "";
        choDebitOpt = ["Select", "Purchase Return", "Purchase Expiry Return", "Others"];
        choiceOption.select(0);
        txtDNoteDate.text = today;
        mandatory();
    }

    var logUser: String = bind CommonDeclare.user on replace {
        getPrivileges(logUser);
    }
    var changPiv = bind btnDNoteSave.text on replace {
        getPrivileges(logUser);
    }
    var changPiv1 = bind btnDNoteEdit.text on replace {
        getPrivileges(logUser);
    }

    function getPrivileges(u: String): Void {
        var uname = u;
        //Controller Instance
        commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements ) as CommonImplements ;
        var utype = commonController.getUserType(uname);

        if (utype.equals("User")) {
            //Controller Instance
            var priv = commonController.getPrivileges("financial", uname);
            var ss = priv.split(",");
            var val = Integer.parseInt(ss[3]);
            if (val == 1) {

                btnDNoteSave.disable = true;
                if (btnDNoteEdit.text != "Edit [F6]") {
                    btnDNoteEdit.disable = true;
                } else {
                    btnDNoteEdit.disable = false;
                }
            } else if (val == 2) {
                if (btnDNoteEdit.text != "Edit [F6]") {
                    btnDNoteEdit.disable = true;
                } else {
                    btnDNoteEdit.disable = false;
                }
                btnDNoteSave.disable = false;
            } else if (val == 3) {
                btnDNoteSave.disable = false;
                btnDNoteEdit.disable = false;
            }
        } else {
            btnDNoteSave.disable = false;
            btnDNoteEdit.disable = false;
        }
    }

    function mandatory(): Void {
        txtDNoteDate.style = mandatoryStyle;
        txtDNoteAmt.style = mandatoryStyle;
    }

    public function StartUp(): Void {
        mandatory();
        panel.visible = true;
        panel.content = [rectangle, rectHeader, labelHeader, panelC1, panelC2, panelButtons, panelAlert,label3,separator,];
        fxCalendar.visible = false;
        choDebitOpt = ["Select", "Purchase Return", "Purchase Expiry Return", "Others"];
        choiceOption.select(0);
        panelCalender.content = [fxCalendar,];
        imageDate.image = Image { url: "{__DIR__}images/Calender.png" };
        txtDNoteDate.text = today;
        txtDNoteNo.editable = false;
        txtDNoteDate.requestFocus();
        //Controller Instance
        commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements ) as CommonImplements ;
        txtDNoteNo.text = commonController.getCustId("debit_note", "debit_note_no", "DEB");
//        txtDNoteNo.text = commonController.getAutoIncrement(today, "DebitNotes");
        getPrivileges(logUser);
    }

}
