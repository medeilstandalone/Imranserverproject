package com.vanuston.medeil.ui;

import java.lang.*;
import javafx.scene.layout.LayoutInfo;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import com.vanuston.medeil.util.DateUtils;
import javafx.animation.Interpolator;
import javafx.animation.Timeline;
import java.util.Random;
import com.vanuston.medeil.util.Logger;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
import com.vanuston.medeil.util.CommonDeclare;

   // def Notepad=Notepad{};
    var images: Image[] = [
            Image { url: "{__DIR__}images/MsgConfirm.png" },
            Image { url: "{__DIR__}images/MsgError.png" },
            Image { url: "{__DIR__}images/MsgInfo.png" },
            Image { url: "{__DIR__}images/MsgWarning.png" }
        ];
    var title: String;
    var info: String;
    var form: String;
    var today = DateUtils.now("yyyy-MM-dd");
public class MessageBox {
    var log: Logger = Logger.getLogger(MessageBox.class, "Utilities");
    public var msgboxOutput:Integer;
    var PanelOpacity=0.0;
    var panelLX:Number=0.0;
    var panelLY:Number=0.0;
    var msgFlag=0;

    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def imageView4: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
    }
    
    public-read def imageView3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
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
    
    def __layoutInfo_lblHeading: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 430.0
    }
    public-read def lblHeading: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 40.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_lblHeading
        text: "Label"
        font: Arial_18
        hpos: javafx.geometry.HPos.LEFT
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
    
    def __layoutInfo_btnYes: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 100.0
        height: 30.0
    }
    public-read def btnYes: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: 179.0
        layoutY: 150.0
        layoutInfo: __layoutInfo_btnYes
        translateX: 0.0
        effect: reflectionEffect
        graphic: imageView3
        text: "Yes"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
        action: btnYesAction
    }
    
    def __layoutInfo_btnNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 100.0
        height: 30.0
    }
    public-read def btnNo: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: 318.0
        layoutY: 150.0
        layoutInfo: __layoutInfo_btnNo
        effect: reflectionEffect
        graphic: imageView4
        text: "No"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
        action: btnNoAction
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
    
    def __layoutInfo_lblMsg: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 534.0
        height: 144.0
    }
    public-read def lblMsg: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 28.0
        layoutY: 74.0
        layoutInfo: __layoutInfo_lblMsg
        text: "Information..."
        font: Arial_Bold_16
        textAlignment: javafx.scene.text.TextAlignment.CENTER
        hpos: javafx.geometry.HPos.CENTER
        textFill: DarkGray
    }
    
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        opacity: 1.0
        cursor: null
        layoutX: 1.0
        layoutY: 1.0
        styleClass: "BottomTaskBar"
        fill: DarkGray
        width: 100.0
        height: 26.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.4
    }
    
    public-read def dropShadowEffect: javafx.scene.effect.DropShadow = javafx.scene.effect.DropShadow {
    }
    
    public-read def rectBg: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 1.0
        layoutX: 28.0
        layoutY: 28.0
        styleClass: "DialogBox"
        blocksMouse: true
        effect: dropShadowEffect
        fill: linearGradient
        stroke: DarkGray
        strokeWidth: 3.0
        width: 500.0
        height: 200.0
        arcWidth: 10.0
        arcHeight: 10.0
    }
    
    public-read def lightingEffect: javafx.scene.effect.Lighting = javafx.scene.effect.Lighting {
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
    }
    
    public-read def color2: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.6
    }
    
    public-read def Violet1: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.047058824
        green: 0.32941177
        blue: 0.4745098
    }
    
    public-read def linearGradient2: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        startX: 0.0
        startY: 0.0
        endX: 0.0
        endY: 1.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/MsgWarning.png"
    }
    
    public-read def image2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/MsgInfo.png"
    }
    
    public-read def imageClose: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Close.png"
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        opacity: bind opacClose
        cursor: javafx.scene.Cursor.DEFAULT
        layoutX: 475.0
        layoutY: 0.0
        onMouseClicked: imageViewOnMouseClicked
        onMouseEntered: imgCloseOnMouseEntered
        onMouseExited: imgCloseOnMouseExited
        blocksMouse: true
        image: imageClose
    }
    
    public-read def imageYes: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Yes.png"
    }
    
    public-read def imageNo: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/No.png"
    }
    
    public-read def imageLogo: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/LogoMedil.png"
    }
    
    public-read def imgMsgBox: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 8.0
        layoutY: 4.0
        image: imageLogo
        fitWidth: 20.0
        fitHeight: 20.0
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutX: bind panelLX
        layoutY: bind panelLY
        content: [ rectBg, rectangle, lblHeading, lblMsg, btnNo, btnYes, imgMsgBox, imageView, ]
    }
    
    public-read def panelDialog: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        opacity: bind PanelOpacity
        content: [ panel, ]
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "Confirm", "Message", ]
        actual: 0
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectBg.visible = true;
                            rectBg.layoutX = 0.0;
                            rectBg.layoutY = 0.0;
                            rectBg.strokeWidth = 3.0;
                            rectBg.width = 500.0;
                            rectBg.arcWidth = 10.0;
                            rectBg.arcHeight = 10.0;
                            rectangle.visible = true;
                            rectangle.width = 498.0;
                            __layoutInfo_lblHeading.height = 26.0;
                            lblMsg.layoutY = 50.0;
                            __layoutInfo_lblMsg.width = 442.0;
                            __layoutInfo_lblMsg.height = 86.0;
                            lblMsg.textAlignment = javafx.scene.text.TextAlignment.CENTER;
                            lblMsg.textWrap = true;
                            lblMsg.hpos = javafx.geometry.HPos.CENTER;
                            lblMsg.graphicHPos = javafx.geometry.HPos.CENTER;
                            imageView4.visible = true;
                            imageView4.image = imageNo;
                            btnNo.layoutX = 262.5;
                            btnNo.layoutY = 150.0;
                            btnNo.styleClass = "button";
                            btnNo.onKeyPressed = btnNoOnKeyPressedAtConfirm;
                            btnNo.effect = reflectionEffect;
                            btnNo.text = "   No";
                            btnNo.action = btnNoActionAtConfirm;
                            imageView3.visible = true;
                            imageView3.image = imageYes;
                            btnYes.visible = true;
                            btnYes.layoutX = 137.5;
                            btnYes.layoutY = 150.0;
                            btnYes.styleClass = "button";
                            btnYes.onKeyPressed = btnYesOnKeyPressedAtConfirm;
                            btnYes.text = "  Yes";
                            imageView.image = imageClose;
                            panel.visible = true;
                        }
                    }
                ]
            }
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectBg.visible = true;
                            rectBg.layoutX = 0.0;
                            rectBg.layoutY = 0.0;
                            rectBg.strokeWidth = 3.0;
                            rectBg.width = 500.0;
                            rectBg.arcWidth = 10.0;
                            rectBg.arcHeight = 10.0;
                            rectangle.visible = true;
                            rectangle.width = 498.0;
                            __layoutInfo_lblHeading.height = 26.0;
                            lblMsg.layoutY = 50.0;
                            __layoutInfo_lblMsg.width = 441.0;
                            __layoutInfo_lblMsg.height = 93.0;
                            lblMsg.textAlignment = javafx.scene.text.TextAlignment.CENTER;
                            lblMsg.textWrap = true;
                            lblMsg.hpos = javafx.geometry.HPos.CENTER;
                            lblMsg.vpos = javafx.geometry.VPos.CENTER;
                            lblMsg.graphicHPos = javafx.geometry.HPos.CENTER;
                            imageView4.visible = true;
                            imageView4.image = imageYes;
                            btnNo.layoutX = 200.0;
                            btnNo.layoutY = 149.0;
                            btnNo.styleClass = "button";
                            btnNo.effect = reflectionEffect;
                            btnNo.text = "  OK";
                            btnNo.action = btnNoActionAtMessage;
                            imageView3.visible = false;
                            imageView3.image = null;
                            btnYes.visible = false;
                            btnYes.layoutX = 179.0;
                            btnYes.layoutY = 150.0;
                            btnYes.styleClass = "button";
                            btnYes.text = "Yes";
                            imageView.image = imageClose;
                            panel.visible = true;
                        }
                    }
                ]
            }
        ]
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panelDialog, ]
    }
    // </editor-fold>//GEN-END:main

    function btnYesOnKeyPressedAtConfirm(event: javafx.scene.input.KeyEvent): Void {
         if (event.code == KeyCode.VK_TAB) {
            btnNo.requestFocus();
         }else{
            shortcut(event);}
         }
    function btnNoOnKeyPressedAtConfirm(event: javafx.scene.input.KeyEvent): Void {
         if (event.code == KeyCode.VK_TAB) {
             btnYes.requestFocus();
         }else{
            shortcut(event);
         }
         }
   var Kye = bind CommonDeclare.currKyEvent on replace {
        shortcut(Kye);
    }
    function shortcut(Ky:KeyEvent):Void{
         if (msgFlag==1) {
           if(Ky.code==KeyCode.VK_ENTER){
               if (btnNo.focused) { btnNoActionAtConfirm(); }
               if (btnYes.focused) { btnYesAction(); }               
           }
           if (Ky.code == KeyCode.VK_Y) btnYesAction(); 
           if (Ky.code == KeyCode.VK_N) btnNoActionAtConfirm();
           if(Ky.code==KeyCode.VK_ESCAPE){
              btnNoActionAtConfirm();
           }
        }
    }

    function btnNoAction(): Void {
   
    }
    function imageViewOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
      closeMsgbox(1234);
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
    function btnNoActionAtMessage(): Void {
        msgOk = true;
        if (form.equals("Login")) {
            javafx.lang.FX.exit();
        } else {
            closeMsgbox(2);
        }
    }
    function btnNoActionAtConfirm(): Void {
        closeMsgbox(1234);
    }
    function btnYesAction(): Void {
        closeMsgbox(1);
    }
var fadePanel = Timeline {
    keyFrames: [
                at(0s) { PanelOpacity => 0.0 tween Interpolator.LINEAR },
                at(0.1s) { PanelOpacity => 0.75 tween Interpolator.LINEAR },
                at(0.3s) { PanelOpacity => 1.0 tween Interpolator.LINEAR },
                ]
};
    public function closeMsgbox(i: Integer): Void {
       msgFlag=0;
       fadePanel.rate = -1.0;
        fadePanel.play();
        panelDialog.visible=false;
        msgboxOutput=i;
        if (form.equals("Notepad")) {
//              Notepad.MsgValue(i);
        }
            var rand = new Random();
          msgboxOutput=rand.nextInt(999)+100;
}
    var msgOk : Boolean = false;
    public function MsgBox(frm: String, type: String, msg: String): Void {
        msgOk = false;
        msgFlag=1;
        btnYes.requestFocus();
         panelDialog.visible=true;
        fadePanel.rate = 1.0;
        fadePanel.play();
        title = type;
        info = msg;
        form = frm;
        btnNo.requestFocus();
        if (title.equals("Error")) {
            currentState.actual = currentState.findIndex("Message");
            lblHeading.text = title;
            imgMsgBox.image = images[1];
            lblMsg.text = info;
            if(form.equals("Login")){
                imageView.visible=false
            }
        }
        if (title.equals("Information")) {
            currentState.actual = currentState.findIndex("Message");
            lblHeading.text = title;
            imgMsgBox.image = images[2];
            lblMsg.text = info;
        }
        if (title.equals("Warning")) {
            currentState.actual = currentState.findIndex("Message");
            lblHeading.text = title;
            imgMsgBox.image = images[3];
            lblMsg.text = info;

        }
        if (title.equals("Confirm")) {
            currentState.actual = currentState.findIndex("Confirm");
            lblHeading.text = "{title}ation";
            imgMsgBox.image = images[0];
            lblMsg.text = info;
            btnYes.requestFocus();
        }
    }
}
