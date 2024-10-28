package com.vanuston.medeil.ui;

import javafx.scene.layout.LayoutInfo;
import javafx.scene.image.Image;
import com.vanuston.medeil.util.CommonDeclare;
import javafx.scene.image.ImageView;
import javafx.animation.Interpolator;
import javafx.animation.Timeline;
import javafx.scene.input.KeyCode;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import java.util.List;

public class CardDetails {
var PanelOpacity:Number=0.0;
var panelW=bind CommonDeclare.panelFormW;
var panelH=bind CommonDeclare.panelFormH;

var Type2TextboxW=bind CommonDeclare.Type2TextboxW;//150
var Type3TextboxW=bind CommonDeclare.Type3TextboxW;//100

var panelCardDetailsW=bind Type2TextboxW+150;
var commonController:CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
var accountNo;
//var accountNo:String[] = accountList.toArray() as String[];
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def rectCardDetalsBg: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        styleClass: "DialogBox"
        width: bind panelCardDetailsW-2
        height: 50.0
    }
    
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        styleClass: "rectFormHeader"
        width: bind panelCardDetailsW
        height: 50.0
    }
    
    def __layoutInfo_label: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelCardDetailsW
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
    
    public-read def label12: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 50.0
        layoutY: 422.0
        text: "Label"
    }
    
    public-read def label15: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 50.0
        layoutY: 437.0
        text: "Label"
    }
    
    public-read def label16: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 44.0
        layoutY: 459.0
        text: "Label"
    }
    
    public-read def label17: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 44.0
        layoutY: 482.0
        text: "Label"
    }
    
    public-read def label18: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 44.0
        layoutY: 505.0
        text: "Label"
    }
    
    public-read def panelLblCard: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: 13.0
        content: [ label2, label12, label15, label16, label17, label18, ]
    }
    
    def __layoutInfo_cboAc_no: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def cboAc_no: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutInfo: __layoutInfo_cboAc_no
        items: bind accountNo
    }
    
    public-read def rdoSalesCDCreditCard: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: 174.0
        layoutY: 416.0
        text: "Radio Button"
    }
    
    public-read def rdoSalesCDDebitCard: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: 88.0
        layoutY: 416.0
        text: "Radio Button"
    }
    
    def __layoutInfo_txtSalesCDCardNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtSalesCDCardNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 88.0
        layoutY: 437.0
        layoutInfo: __layoutInfo_txtSalesCDCardNo
    }
    
    def __layoutInfo_txtSalesCDCardHName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtSalesCDCardHName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 78.0
        layoutY: 459.0
        layoutInfo: __layoutInfo_txtSalesCDCardHName
    }
    
    def __layoutInfo_txtSalesCDBank: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtSalesCDBank: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 78.0
        layoutY: 505.0
        layoutInfo: __layoutInfo_txtSalesCDBank
    }
    
    public-read def imageDate: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind Type3TextboxW+2
        layoutY: 490.0
    }
    
    def __layoutInfo_txtSalesCDExpDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW-30
    }
    public-read def txtSalesCDExpDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 158.0
        layoutInfo: __layoutInfo_txtSalesCDExpDate
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
    }
    
    def __layoutInfo_btnSalesCDDone: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnSalesCDDone: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind Type3TextboxW-20
        layoutY: 103.0
        layoutInfo: __layoutInfo_btnSalesCDDone
        graphic: imageView
        text: "Button"
    }
    
    public-read def panelTxtCard: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: 37.0
        content: [ cboAc_no, rdoSalesCDCreditCard, rdoSalesCDDebitCard, txtSalesCDCardNo, txtSalesCDCardHName, txtSalesCDBank, imageDate, txtSalesCDExpDate, btnSalesCDDone, ]
    }
    
    public-read def panelCardDetails: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ panelLblCard, panelTxtCard, ]
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
    
    public-read def PaymentModeGroup: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def Arial_25: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 25.0
    }
    
    public-read def DarkGray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.2
        blue: 0.2
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.4
    }
    
    public-read def Orange: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
        blue: 0.0
    }
    
    public-read def Arial_30: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 30.0
    }
    
    public-read def Gray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.4
        green: 0.4
        blue: 0.4
    }
    
    public-read def imageDone: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Apply.png"
    }
    
    public-read def font: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 65.0
    }
    
    public-read def imageCloseSmall: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Close.png"
    }
    
    public-read def imgCloseCardPopup: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        opacity: bind opacClose
        layoutX: bind panelCardDetailsW-25
        layoutY: -1.0
        onMouseClicked: imgCloseCardPopupOnMouseClicked
        image: imageCloseSmall
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: bind visible
        opacity: bind PanelOpacity
        content: [ rectCardDetalsBg, rectangle, label, imgCloseCardPopup, panelCardDetails, ]
    }
    
    public-read def imageCalendar: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Calender.png"
    }
    
    public-read def dropShadowEffect: javafx.scene.effect.DropShadow = javafx.scene.effect.DropShadow {
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
                            rectCardDetalsBg.visible = true;
                            rectCardDetalsBg.effect = dropShadowEffect;
                            rectCardDetalsBg.fill = linearGradient;
                            rectCardDetalsBg.stroke = DarkGray;
                            rectCardDetalsBg.height = 200.0;
                            rectCardDetalsBg.arcWidth = 10.0;
                            rectCardDetalsBg.arcHeight = 10.0;
                            rectangle.visible = true;
                            rectangle.opacity = 0.25;
                            rectangle.layoutX = 1.0;
                            rectangle.layoutY = 1.0;
                            rectangle.fill = DarkGray;
                            rectangle.height = 20.0;
                            label.visible = true;
                            label.opacity = 1.0;
                            __layoutInfo_label.height = 20.0;
                            label.styleClass = "label";
                            label.text = "Payment Card Details";
                            label.font = Arial_Bold_16;
                            label.hpos = javafx.geometry.HPos.CENTER;
                            label.textFill = DarkGray;
                            imgCloseCardPopup.visible = true;
                            imgCloseCardPopup.cursor = javafx.scene.Cursor.DEFAULT;
                            imgCloseCardPopup.layoutY = 0.0;
                            imgCloseCardPopup.onMouseEntered = imgCloseOnMouseEntered;
                            imgCloseCardPopup.onMouseExited = imgCloseOnMouseExited;
                            label2.visible = true;
                            label2.text = "Account no.";
                            label2.font = Arial_Bold_16;
                            label2.textFill = DarkGray;
                            label12.visible = true;
                            label12.layoutX = 0.0;
                            label12.layoutY = 25.0;
                            label12.text = "Payment Mode";
                            label12.font = Arial_14;
                            label12.textFill = DarkGray;
                            label15.visible = true;
                            label15.layoutX = 0.0;
                            label15.layoutY = 50.0;
                            label15.text = "Card No";
                            label15.font = Arial_14;
                            label15.textFill = DarkGray;
                            label16.visible = true;
                            label16.layoutX = 0.0;
                            label16.layoutY = 75.0;
                            label16.text = "CardHolder name";
                            label16.font = Arial_14;
                            label16.textFill = DarkGray;
                            label17.visible = true;
                            label17.layoutX = 0.0;
                            label17.layoutY = 100.0;
                            label17.text = "Bank Name";
                            label17.font = Arial_14;
                            label17.textFill = DarkGray;
                            label18.visible = true;
                            label18.layoutX = 0.0;
                            label18.layoutY = 125.0;
                            label18.text = "Expiry Date";
                            label18.font = Arial_14;
                            label18.textFill = DarkGray;
                            panelLblCard.visible = true;
                            panelLblCard.layoutX = 10.0;
                            panelLblCard.layoutY = 10.0;
                            cboAc_no.visible = true;
                            cboAc_no.onKeyPressed = cboAc_noOnKeyPressedAtShown;
                            rdoSalesCDCreditCard.visible = true;
                            rdoSalesCDCreditCard.layoutX = 0.0;
                            rdoSalesCDCreditCard.layoutY = 25.0;
                            rdoSalesCDCreditCard.onKeyPressed = rdoSalesCDCreditCardOnKeyPressedAtShown;
                            rdoSalesCDCreditCard.text = "Credit Card";
                            rdoSalesCDCreditCard.font = Arial_14;
                            rdoSalesCDCreditCard.toggleGroup = PaymentModeGroup;
                            rdoSalesCDCreditCard.selected = true;
                            rdoSalesCDCreditCard.value = "creditcard";
                            rdoSalesCDDebitCard.visible = true;
                            rdoSalesCDDebitCard.layoutX = 100.0;
                            rdoSalesCDDebitCard.layoutY = 25.0;
                            rdoSalesCDDebitCard.onKeyPressed = rdoSalesCDDebitCardOnKeyPressedAtShown;
                            rdoSalesCDDebitCard.text = "Debit Card";
                            rdoSalesCDDebitCard.font = Arial_14;
                            rdoSalesCDDebitCard.toggleGroup = PaymentModeGroup;
                            rdoSalesCDDebitCard.selected = false;
                            rdoSalesCDDebitCard.value = "debitcard";
                            txtSalesCDCardNo.visible = true;
                            txtSalesCDCardNo.layoutX = 0.0;
                            txtSalesCDCardNo.layoutY = 50.0;
                            txtSalesCDCardNo.onKeyPressed = txtSalesCDCardNoOnKeyPressedAtShown;
                            txtSalesCDCardNo.font = Arial_12;
                            txtSalesCDCardHName.visible = true;
                            txtSalesCDCardHName.layoutX = 0.0;
                            txtSalesCDCardHName.layoutY = 75.0;
                            txtSalesCDCardHName.onKeyPressed = txtSalesCDCardHNameOnKeyPressedAtShown;
                            txtSalesCDCardHName.font = Arial_12;
                            txtSalesCDBank.visible = true;
                            txtSalesCDBank.layoutX = 0.0;
                            txtSalesCDBank.layoutY = 100.0;
                            txtSalesCDBank.onKeyPressed = txtSalesCDBankOnKeyPressedAtShown;
                            txtSalesCDBank.font = Arial_12;
                            imageDate.visible = false;
                            imageDate.layoutY = 100.0;
                            imageDate.image = imageCalendar;
                            txtSalesCDExpDate.visible = true;
                            txtSalesCDExpDate.layoutX = 0.0;
                            txtSalesCDExpDate.layoutY = 125.0;
                            txtSalesCDExpDate.onKeyPressed = txtSalesCDExpDateOnKeyPressedAtShown;
                            txtSalesCDExpDate.font = Arial_12;
                            imageView.visible = true;
                            imageView.image = imageDone;
                            btnSalesCDDone.visible = true;
                            btnSalesCDDone.layoutY = 123.0;
                            __layoutInfo_btnSalesCDDone.width = 100.0;
                            __layoutInfo_btnSalesCDDone.height = 25.0;
                            btnSalesCDDone.onKeyPressed = btnSalesCDDoneOnKeyPressedAtShown;
                            btnSalesCDDone.text = "Done";
                            btnSalesCDDone.font = Arial_Bold_16;
                            btnSalesCDDone.action = buttonActionAtShown;
                            panelTxtCard.visible = true;
                            panelTxtCard.layoutX = 125.0;
                            panelTxtCard.layoutY = 10.0;
                            panelTxtCard.onKeyPressed = panelTxtCardOnKeyPressedAtShown;
                            panelCardDetails.visible = true;
                            panelCardDetails.layoutY = 25.0;
                            panel.blocksMouse = true;
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

    function panelTxtCardOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if(event.code == KeyCode.VK_TAB){
            if(event.controlDown){
                hideCardPanel();
            }
        }

    }

    function cboAc_noOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if(event.code == KeyCode.VK_TAB){
            rdoSalesCDCreditCard.requestFocus();
            if(event.shiftDown){
                btnSalesCDDone.requestFocus();
            }
        }
    }

    function btnSalesCDDoneOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        hideCardPanel();
    }

    function txtSalesCDExpDateOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
            if(event.code==KeyCode.VK_ENTER or event.code==KeyCode.VK_TAB) {
                btnSalesCDDone.requestFocus();
                if(event.shiftDown){
                    txtSalesCDBank.requestFocus();
                }
            }
    }

    function txtSalesCDBankOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
            if(event.code==KeyCode.VK_ENTER or event.code==KeyCode.VK_TAB) {
                txtSalesCDExpDate.requestFocus();
                if(event.shiftDown){
                    txtSalesCDCardHName.requestFocus();
                }
            }
    }

    function txtSalesCDCardHNameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if(event.code==KeyCode.VK_ENTER or event.code==KeyCode.VK_TAB) {
            txtSalesCDBank.requestFocus();
            if(event.shiftDown){
                txtSalesCDCardNo.requestFocus();
            }
         }
    }

    function txtSalesCDCardNoOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
           if(event.code==KeyCode.VK_ENTER or event.code==KeyCode.VK_TAB) {
               txtSalesCDCardHName.requestFocus();
                if(event.shiftDown){
                    rdoSalesCDDebitCard.requestFocus();
                }
            }
         }

    function rdoSalesCDDebitCardOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if(event.code==KeyCode.VK_C) {
               rdoSalesCDCreditCard.selected=true; //PaymentModeGroup.selectedToggle;
               txtSalesCDCardNo.requestFocus();
        } else if(event.code==KeyCode.VK_ENTER or event.code==KeyCode.VK_TAB) {
                txtSalesCDCardNo.requestFocus();
                if(event.shiftDown){
                    rdoSalesCDCreditCard.requestFocus();
                }
        }
    }

    function rdoSalesCDCreditCardOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
            if(event.code==KeyCode.VK_D) {
             rdoSalesCDDebitCard.selected=true; 
             txtSalesCDCardNo.requestFocus();
             txtSalesCDCardNo.text="";
            }
         }

    function buttonActionAtShown(): Void {
        hideCardPanel();
         }

    function imgCloseCardPopupOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        hideCardPanel();
         }
public function hideCardPanel():Void{
     fadePanel.rate = -1.0;
     fadePanel.play();
}
public var visible:Boolean=true;;
public function showCardPanel():Void{
      fadePanel.rate = 1.0;
      fadePanel.play();
      var accountList:List = commonController.getAccountNumbers();
      accountNo= accountList.toArray() as String[];
}

    function imgCloseOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        fadeClose.rate = -1.0;
        fadeClose.play();
         }
    function imgCloseOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        fadeClose.rate = 1.0;
        fadeClose.play();
         }
var opacClose=0.5;
var fadeClose = Timeline {
    keyFrames: [
                at(0s) { opacClose => 0.5 tween Interpolator.LINEAR },
                at(0.1s) { opacClose => 1.0 tween Interpolator.LINEAR },
                ]
};

var fadePanel = Timeline {
    keyFrames: [
                at(0s) { visible=>false},
                at (0s) {PanelOpacity => 0.0 tween Interpolator.LINEAR},
                at (0.1s) { visible=>true},
                at (0.1s) {PanelOpacity => 1.0 tween Interpolator.LINEAR},
                ]
};

public function reset():Void{
    txtSalesCDCardNo.text="";
    txtSalesCDCardHName.text="";
    txtSalesCDBank.text="";
    txtSalesCDExpDate.text="";
}
public function empty():Void{
    txtSalesCDCardNo.text=null;
    txtSalesCDCardHName.text=null;
    txtSalesCDBank.text=null;
    txtSalesCDExpDate.text=null;
}
}