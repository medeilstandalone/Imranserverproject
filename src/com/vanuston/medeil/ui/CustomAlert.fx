package com.vanuston.medeil.ui;

import javafx.scene.layout.LayoutInfo;
import javafx.scene.paint.Color;
import javafx.scene.shape.Rectangle;
import javafx.scene.text.Font;
import javafx.scene.paint.LinearGradient;
import javafx.scene.Node;
import org.netbeans.javafx.design.DesignState;
import javafx.scene.control.ToggleGroup;
import javafx.scene.effect.Reflection;
import javafx.scene.control.Label;
import javafx.scene.layout.Panel;
import javafx.animation.Timeline;
import javafx.animation.Interpolator;
import javafx.scene.image.Image;
import javafx.scene.paint.Paint;
import com.vanuston.medeil.util.CommonDeclare;
import javafx.scene.input.KeyCode;
import java.awt.Toolkit;


public class CustomAlert {

    var lblFormNameText: String = "";
    var show_msg: String = "";
    var lblConfirmText: String = "";
    var message: String = "";
    var OtuputMessage: String = "";
    var PanelOpacity = 1.0;
    var msg_type: Integer;
    var lblmsgTextFill: Paint;
    var imageViewImage: Image;
    public var confirm: Boolean;
    public var delay: Duration = 5s;

    var lblTxtColor : Color;
    var msgFlag=0;
    
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 77.0
        layoutY: 57.0
        image: bind imageViewImage
    }
    
    public-read def imageView3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
    }
    
    def __layoutInfo_btnYes: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnYes: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 159.0
        layoutY: 154.0
        layoutInfo: __layoutInfo_btnYes
        onKeyPressed: btnYesOnKeyPressed
        graphic: imageView3
        text: "Button"
        action: btnYesAction
    }
    
    public-read def btnOk: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        text: "Button"
    }
    
    public-read def imageView4: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
    }
    
    def __layoutInfo_btnNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnNo: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 236.0
        layoutY: 154.0
        layoutInfo: __layoutInfo_btnNo
        onKeyPressed: btnNoOnKeyPressed
        graphic: imageView4
        text: "Button"
        action: btnNoAction
    }
    
    def __layoutInfo_labelConfirm: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def labelConfirm: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 113.0
        layoutY: 99.0
        layoutInfo: __layoutInfo_labelConfirm
        text: bind lblConfirmText
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
    
    def __layoutInfo_lblmsg: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblmsg: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 170.0
        layoutY: 75.0
        layoutInfo: __layoutInfo_lblmsg
        text: bind show_msg
        font: Arial_Bold_16
        textFill: bind lblmsgTextFill
    }
    
    public-read def Arial_18: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 18.0
    }
    
    def __layoutInfo_labelmsg: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def labelmsg: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutInfo: __layoutInfo_labelmsg
        text: bind message
        font: Arial_18
    }
    
    def __layoutInfo_lblFormName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 430.0
        height: 26.0
    }
    public-read def lblFormName: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 40.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_lblFormName
        text: bind lblFormNameText
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
    
    public-read def rectangle2: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "BottomTaskBar"
        fill: DarkGray
        width: 500.0
        height: 26.0
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.4
    }
    
    public-read def orange: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
    }
    
    public-read def imagesaved: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Saved.png"
    }
    
    public-read def imageUpdated: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Updated.png"
    }
    
    public-read def imageDeleted: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Deleted.png"
    }
    
    public-read def imageInformation: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Information.png"
    }
    
    public-read def imageInfo: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 43.0
        layoutY: 66.0
        image: imageInformation
    }
    
    public-read def Red: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.0
    }
    
    public-read def imageConfirm: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/MsgConfirm.png"
    }
    
    public-read def imageView2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 36.0
        layoutY: 84.0
        image: imageConfirm
    }
    
    public-read def imageYes: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Yes.png"
    }
    
    public-read def imageNo: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/No.png"
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Close.png"
    }
    
    public-read def imgClose: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        opacity: bind opacClose
        layoutX: 475.0
        layoutY: 0.0
        onMouseClicked: imgCloseOnMouseClicked
        onMouseEntered: imgCloseOnMouseEntered
        onMouseExited: imgCloseOnMouseExited
        blocksMouse: true
        image: image
    }
    
    public-read def imageDone: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/EmailSMSDone.png"
    }
    
    public-read def imageError: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/EmailSMSError.png"
    }
    
    public-read def imagelogo: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/LogoMedil.png"
    }
    
    public-read def imageView5: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: true
        layoutX: 8.0
        layoutY: 4.0
        image: imagelogo
        fitWidth: 20.0
        fitHeight: 20.0
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
        strokeWidth: 2.0
        width: 500.0
        height: 150.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        opacity: bind PanelOpacity
        blocksMouse: false
        content: [ rectangle, rectangle2, imageView, lblFormName, labelmsg, imageInfo, lblmsg, imageView2, btnYes, btnOk, btnNo, labelConfirm, imgClose, imageView5, ]
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "Show_Msg", "Confirm", "AlertInfo", ]
        actual: 0
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectangle.layoutX = 0.0;
                            rectangle.layoutY = 0.0;
                            rectangle.height = 150.0;
                            imageView.visible = true;
                            imageView.layoutX = 20.0;
                            imageView.layoutY = 60.0;
                            imageView.effect = reflectionEffect;
                            imageView.fitWidth = 0.0;
                            imageView.fitHeight = 0.0;
                            lblFormName.textOverrun = javafx.scene.control.OverrunStyle.ELLIPSES;
                            lblFormName.graphicTextGap = 4.0;
                            labelmsg.visible = false;
                            labelmsg.layoutX = 0.0;
                            labelmsg.layoutY = 0.0;
                            labelmsg.textAlignment = javafx.scene.text.TextAlignment.LEFT;
                            labelmsg.textWrap = false;
                            labelmsg.hpos = javafx.geometry.HPos.LEFT;
                            labelmsg.textFill = javafx.scene.paint.Color.BLACK;
                            imageInfo.visible = false;
                            imageInfo.layoutX = 43.0;
                            imageInfo.layoutY = 66.0;
                            lblmsg.visible = true;
                            lblmsg.layoutX = 85.0;
                            lblmsg.layoutY = 50.0;
                            __layoutInfo_lblmsg.width = 390.0;
                            __layoutInfo_lblmsg.height = 82.0;
                            lblmsg.textAlignment = javafx.scene.text.TextAlignment.CENTER;
                            lblmsg.textOverrun = javafx.scene.control.OverrunStyle.ELLIPSES;
                            lblmsg.textWrap = true;
                            lblmsg.hpos = javafx.geometry.HPos.CENTER;
                            lblmsg.vpos = javafx.geometry.VPos.CENTER;
                            imageView2.visible = false;
                            imageView2.layoutY = 84.0;
                            imageView3.visible = false;
                            imageView3.image = null;
                            btnYes.visible = false;
                            btnYes.layoutX = 159.0;
                            btnYes.text = "Button";
                            imageView4.visible = false;
                            imageView4.image = null;
                            btnNo.visible = false;
                            btnNo.layoutX = 236.0;
                            btnNo.text = "Button";
                            labelConfirm.visible = false;
                            labelConfirm.layoutX = 113.0;
                            labelConfirm.layoutY = 99.0;
                            labelConfirm.textWrap = false;
                            labelConfirm.hpos = javafx.geometry.HPos.LEFT;
                            labelConfirm.textFill = javafx.scene.paint.Color.BLACK;
                        }
                    }
                ]
            }
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectangle.layoutX = 0.0;
                            rectangle.layoutY = 0.0;
                            rectangle.height = 200.0;
                            imageView.visible = false;
                            imageView.layoutX = 77.0;
                            imageView.layoutY = 57.0;
                            imageView.fitWidth = 0.0;
                            imageView.fitHeight = 0.0;
                            lblFormName.textOverrun = javafx.scene.control.OverrunStyle.ELLIPSES;
                            lblFormName.graphicTextGap = 4.0;
                            labelmsg.visible = false;
                            labelmsg.layoutX = 0.0;
                            labelmsg.layoutY = 0.0;
                            labelmsg.textAlignment = javafx.scene.text.TextAlignment.LEFT;
                            labelmsg.textWrap = false;
                            labelmsg.hpos = javafx.geometry.HPos.LEFT;
                            labelmsg.textFill = javafx.scene.paint.Color.BLACK;
                            imageInfo.visible = false;
                            imageInfo.layoutX = 43.0;
                            imageInfo.layoutY = 66.0;
                            lblmsg.visible = false;
                            lblmsg.layoutX = 170.0;
                            lblmsg.layoutY = 75.0;
                            lblmsg.textAlignment = javafx.scene.text.TextAlignment.LEFT;
                            lblmsg.textOverrun = javafx.scene.control.OverrunStyle.ELLIPSES;
                            lblmsg.textWrap = false;
                            lblmsg.hpos = javafx.geometry.HPos.LEFT;
                            imageView2.visible = true;
                            imageView2.layoutY = 70.0;
                            imageView3.visible = true;
                            imageView3.image = imageYes;
                            btnYes.visible = true;
                            btnYes.layoutX = 125.0;
                            __layoutInfo_btnYes.width = 100.0;
                            __layoutInfo_btnYes.height = 30.0;
                            btnYes.text = "  Yes";
                            btnYes.font = Arial_Bold_14;
                            imageView4.visible = true;
                            imageView4.image = imageNo;
                            btnNo.visible = true;
                            btnNo.layoutX = 275.0;
                            __layoutInfo_btnNo.width = 100.0;
                            __layoutInfo_btnNo.height = 30.0;
                            btnNo.effect = reflectionEffect;
                            btnNo.text = "   No";
                            btnNo.font = Arial_Bold_14;
                            labelConfirm.visible = true;
                            labelConfirm.layoutX = 107.0;
                            labelConfirm.layoutY = 49.0;
                            __layoutInfo_labelConfirm.width = 378.0;
                            __layoutInfo_labelConfirm.height = 84.0;
                            labelConfirm.font = Arial_18;
                            labelConfirm.textWrap = true;
                            labelConfirm.hpos = javafx.geometry.HPos.CENTER;
                            labelConfirm.textFill = DarkGray;
                        }
                    }
                ]
            }
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectangle.layoutX = 0.0;
                            rectangle.layoutY = 0.0;
                            rectangle.height = 150.0;
                            imageView.visible = false;
                            imageView.layoutX = 77.0;
                            imageView.layoutY = 57.0;
                            imageView.fitWidth = 0.0;
                            imageView.fitHeight = 0.0;
                            lblFormName.textOverrun = javafx.scene.control.OverrunStyle.ELLIPSES;
                            lblFormName.graphicTextGap = 4.0;
                            labelmsg.visible = true;
                            labelmsg.layoutX = 85.0;
                            labelmsg.layoutY = 50.0;
                            __layoutInfo_labelmsg.width = 396.0;
                            __layoutInfo_labelmsg.height = 77.0;
                            labelmsg.textAlignment = javafx.scene.text.TextAlignment.CENTER;
                            labelmsg.textWrap = true;
                            labelmsg.hpos = javafx.geometry.HPos.CENTER;
                            labelmsg.vpos = javafx.geometry.VPos.CENTER;
                            labelmsg.textFill = Red;
                            imageInfo.visible = true;
                            imageInfo.layoutX = 15.0;
                            imageInfo.layoutY = 55.0;
                            imageInfo.effect = reflectionEffect;
                            lblmsg.visible = false;
                            lblmsg.layoutX = 170.0;
                            lblmsg.layoutY = 75.0;
                            lblmsg.textAlignment = javafx.scene.text.TextAlignment.LEFT;
                            lblmsg.textOverrun = javafx.scene.control.OverrunStyle.ELLIPSES;
                            lblmsg.textWrap = false;
                            lblmsg.hpos = javafx.geometry.HPos.LEFT;
                            imageView2.visible = false;
                            imageView2.layoutY = 84.0;
                            imageView3.visible = false;
                            imageView3.image = null;
                            btnYes.visible = false;
                            btnYes.layoutX = 159.0;
                            btnYes.text = "Button";
                            imageView4.visible = false;
                            imageView4.image = null;
                            btnNo.visible = false;
                            btnNo.layoutX = 236.0;
                            btnNo.text = "Button";
                            labelConfirm.visible = false;
                            labelConfirm.layoutX = 113.0;
                            labelConfirm.layoutY = 99.0;
                            labelConfirm.textWrap = false;
                            labelConfirm.hpos = javafx.geometry.HPos.LEFT;
                            labelConfirm.textFill = javafx.scene.paint.Color.BLACK;
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
    var smsSend = 0;
    var way2SmsUserName = "";
    var way2SmsPwd = "";
    var one160by2UserName = "";
    var one160by2Pwd = ""; 


    function btnNoOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
         if (event.code == KeyCode.VK_TAB) {
             btnYes.requestFocus();
             }else{
       btnNoAction();
         }}

    function btnYesOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
         if (event.code == KeyCode.VK_TAB) {
             btnNo.requestFocus();
             }else{
     btnYesAction();
         }}
   var Ky = bind CommonDeclare.currKyEvent on replace {
        if (msgFlag==1) {
           if(Ky.code==KeyCode.VK_ENTER){
               btnYesAction();
           }
           if(Ky.code==KeyCode.VK_ESCAPE){
              btnNoAction();
           }
        }
    }
    function imgCloseOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        hide();
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
    
    
    public function btnYesAction(): Void {
        msgFlag=0;
        confirm = true;
        delay = 1s;
        if (msg_type == 1) {
            OtuputMessage = "Data Updated Successfully";
            showMessage(imageUpdated, OtuputMessage, Violet);
        } else if (msg_type == 2) {
            OtuputMessage = "Data deleted Successfully";
            showMessage(imageDeleted, OtuputMessage, orange);
        } else if (msg_type == 5) {
            hide();
//            showMessage(imageDeleted, OtuputMessage, orange);

        }
    }

    function btnNoAction(): Void {
        msgFlag=0;
        delay = 1s;
        confirm = false;
        hide();
    }

    public function ShowAlert(str: String, type: Integer): Void {
        delay = 5s;
        lblFormNameText = str;
        msg_type = type;
        if (msg_type == 0) {
            OtuputMessage = "Data Saved Successfully";
            showMessage(imagesaved, OtuputMessage, Green);
        } else if (msg_type == 1) {
            msgFlag=1;
            lblConfirmText = "Are you sure you want to Update this data?";
            currentState.actual = currentState.findIndex("Confirm");
        } else if (msg_type == 2) {
            msgFlag=1;
            lblConfirmText = "Are you sure you want to Delete this data?";
            currentState.actual = currentState.findIndex("Confirm");
        }else if (msg_type == 3) {
            msgFlag=1;
            lblConfirmText = "The Deleted Product, are available in the stock, Do you want to remove the same product from the stock?";
            currentState.actual = currentState.findIndex("Confirm");
        }else if (msg_type == 4) {
             OtuputMessage = "Data Updated Successfully";
            showMessage(imagesaved, OtuputMessage, Green);
        }else if (msg_type == 5) {
             OtuputMessage = "Data Deleted Successfully";
            showMessage(imagesaved, OtuputMessage, Green);        
        }else if (msg_type == 6) {
             OtuputMessage = "Resolution 1024*768 is required for Medeil";
            showMessage(imagesaved, OtuputMessage, Green);
        }else if (msg_type == 7) {
             OtuputMessage = "Bill printed successfully";
            showMessage(imagesaved, OtuputMessage, Green);
        }
    }

    public function ShowAlert(str: String, type: Integer, msg: String, output: String): Void {
        delay = 5s;
        lblFormNameText = str;
        msg_type = type;
        OtuputMessage = output;
        if (msg_type == 41) {
            lblConfirmText = msg;
            showMessage(imageDone, OtuputMessage, Green);
        }
        if (msg_type == 42) {
            lblConfirmText = msg;
            showMessage(imageError, OtuputMessage, Red);
        }
        if (msg_type == 5) {
            msgFlag=1;
            lblConfirmText = msg;
            btnYes.requestFocus();
            currentState.actual = currentState.findIndex("Confirm");
        }
    }
 
    function showMessage(img: Image, msg_Data: String, msg_Color: Paint): Void {
        imageViewImage = img;
        show_msg = msg_Data;
        lblmsgTextFill = msg_Color;
        currentState.actual = currentState.findIndex("Show_Msg");
        hide();
    }

    public function ShowInfo(str: String, msg: String): Void {
        msg_type = 3;
        lblFormNameText = str;
        message = msg;
        Toolkit.getDefaultToolkit().beep();
        currentState.actual = currentState.findIndex("AlertInfo");        
        
    }

    public function show(): Void {
        fadePanel.rate = 1.0;
        fadePanel.play();
    }
    

    function hide(): Void {
        fadePanel.rate = -1.0;
        fadePanel.play();
    }

    var flag = 0 on replace {
        if (msg_type == 0 or msg_type == 3) hide();
    }
    var flag1 = 0 on replace {
       if(flag1==1){
       confirm = false;
        hide();
   }}
    var fadePanel = Timeline {
                keyFrames: [
                    at (0s) {flag1 => 0},
                    at (0s) {PanelOpacity => 0.0 tween Interpolator.LINEAR},
                    at (0.075s) {PanelOpacity => 0.75 tween Interpolator.LINEAR},
                    at (0.1s) {PanelOpacity => 1.0 tween Interpolator.LINEAR},
                    at (2s) {flag => 1},
                    at (3s) {flag1 => 1},
                ]
            };


}

