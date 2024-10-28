
package com.vanuston.medeil.ui;
import javafx.animation.Interpolator;
import javafx.animation.Timeline;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.util.GetCompanyInfo;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.WebLink;

public class TechnicalSupport {
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def Violet: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.011764706
        green: 0.5019608
        blue: 0.7607843
    }
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 40.0
        text: "Please click submit ticket and update your request. We will get back to you at the earliest."
        font: Arial_12
    }
    
    public-read def Arial_Bold_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
    }
    
    public-read def support_link: javafx.scene.control.Hyperlink = javafx.scene.control.Hyperlink {
        layoutX: 50.0
        layoutY: 53.0
        text: " support@medeil.com "
        font: Arial_Bold_12
        action: hyperlinkAction
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
        text: "Technical Support"
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
    
    public-read def linearGradient: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#ffffff") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#f5f0e9") }, ]
    }
    
    public-read def DarkGray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.2
        blue: 0.2
    }
    
    def __layoutInfo_label24: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 500.0
    }
    public-read def label24: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 20.0
        layoutInfo: __layoutInfo_label24
        text: "If you have any technical support request, please update your details to                                  ."
        font: Arial_12
        textWrap: false
        textFill: DarkGray
    }
    
    public-read def label25: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 80.0
        text: "Hours of Operation: Mon - Fri: 10:00am - 6:00pm IST and on Sat: 10:00am \u2013 3:00pm"
        font: Arial_12
        textFill: DarkGray
    }
    
    def __layoutInfo_lbl_phone: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 540.0
        height: 19.0
    }
    public-read def lbl_phone: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 60.0
        layoutInfo: __layoutInfo_lbl_phone
        text: "Telephone: +91-44-42119714,  919566124105"
        font: Arial_Bold_12
        textWrap: true
        textFill: DarkGray
    }
    
    def __layoutInfo_label20: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 580.0
        height: 32.0
    }
    public-read def label20: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 20.0
        layoutInfo: __layoutInfo_label20
        text: "Phone support is available to MEDEIL customers based on purchased editions. We offer free, technical support options to resolve our customer queries."
        font: Arial_12
        textWrap: true
        textFill: DarkGray
    }
    
    public-read def label26: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 55.0
        text: "Email id:"
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    def __layoutInfo_label18: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 575.0
        height: 30.0
    }
    public-read def label18: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 20.0
        layoutInfo: __layoutInfo_label18
        text: "Can\'t find your answer online? Then send us your technical support question and we will respond as soon as possible."
        font: Arial_12
        textWrap: true
        textFill: DarkGray
    }
    
    def __layoutInfo_label16: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 580.0
        height: 33.0
    }
    public-read def label16: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 20.0
        layoutInfo: __layoutInfo_label16
        text: "Access answers and articles from our technical support experts in the MEDEIL Desktop PMS Version 1.0 on Knowledge center. Make this the first step on your search for a solution."
        font: Arial_12
        textWrap: true
        graphicTextGap: 4.0
        textFill: DarkGray
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
    
    public-read def label21: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 0.0
        text: "Ticket Support"
        font: Arial_Bold_14
        textFill: Green
    }
    
    public-read def label19: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 0.0
        text: "Phone Support "
        font: Arial_Bold_14
        textFill: Green
    }
    
    public-read def panel4: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: 20.0
        layoutY: 195.0
        content: [ label19, label20, lbl_phone, label25, ]
    }
    
    public-read def label17: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 0.0
        text: "Email Support"
        font: Arial_Bold_14
        textFill: Green
    }
    
    public-read def panel3: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: 20.0
        layoutY: 112.0
        content: [ label17, label18, label26, support_link, ]
    }
    
    public-read def label15: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 0.0
        text: "Knowledge Center"
        font: Arial_Bold_14
        textFill: Green
    }
    
    public-read def panel2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: 20.0
        layoutY: 48.0
        effect: null
        content: [ label15, label16, ]
    }
    
    public-read def Yellow: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.95
        green: 0.94
        blue: 0.86
    }
    
    public-read def linearGradientHeader: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#FFFFFF") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#000000") }, ]
    }
    
    public-read def Arial_Bold_50: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 50.0
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.87058824
        green: 0.8392157
        blue: 0.8392157
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
    
    public-read def blue: javafx.scene.paint.Color = javafx.scene.paint.Color {
        green: 0.2
        blue: 0.8
    }
    
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        cursor: javafx.scene.Cursor.HAND
        layoutX: 390.0
        layoutY: 20.0
        onMouseClicked: labelOnMouseClicked
        text: "Submit Ticket"
        font: Arial_Bold_14
        textFill: blue
    }
    
    public-read def panel5: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: 20.0
        layoutY: 305.0
        content: [ label21, label24, label, label2, ]
    }
    
    public-read def panelheader: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ rectangle, RectTitle, label11, imageView2, imgClose, panel2, panel3, panel4, panel5, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        opacity: bind PanelOpacity
        layoutX: bind panelLX
        layoutY: bind panelLY
        blocksMouse: false
        content: [ panelheader, ]
    }
    
    public-read def panelAbout: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        blocksMouse: false
        content: [ panel, ]
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panelAbout, ]
    }
    // </editor-fold>//GEN-END:main

    function labelOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        WebLink.launch_URI("http://ticket.vanuston.com/ticket/index.php");
         }
var log:Logger=Logger.getLogger(TechnicalSupport.class,"Main");

var panelW = bind CommonDeclare.ScreenWidth;
var panelH = bind CommonDeclare.ScreenHeight;
var PanelOpacity:Number=0.0;
var panelStartLX:Number;
var panelStartLY:Number;
var panelLX:Number=(panelW - 600) / 2;;
var panelLY:Number=(panelH- 350) / 2;;
var close:Boolean;

    function hyperlinkAction(): Void {
        WebLink.Support_Email();
         }

function RectTitleOnMouseDragged(e: javafx.scene.input.MouseEvent): Void {
       panelLX = e.screenX - panelStartLX;
       panelLY = e.screenY - panelStartLY;
         }

    function RectTitleOnMousePressed(e: javafx.scene.input.MouseEvent): Void {
        panelStartLX = e.screenX - panelLX;
        panelStartLY = e.screenY - panelLY;
         }
    function imgCloseOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        close=true;
        fadePanel.rate = -1.0;
        fadePanel.play();
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
public function Show():Void{
    support_link.text="{GetCompanyInfo.support_mail}";
    lbl_phone.text="Telephone: {GetCompanyInfo.ph_no1}";
   // lbl_messenger.text="{GetCompanyInfo.messenger_type} ID: {GetCompanyInfo.messenger_id}";
    close=false;
    panel.visible=true;
    fadePanel.rate = 1.0;
    fadePanel.play()
}
var flag=0 on replace{
    if(flag==1 and close==true){
    panel.visible=false;
    }

}

var fadePanel = Timeline {
    keyFrames: [
                at(0s) { flag => 1 },
                at(0s) { PanelOpacity => 0.0 tween Interpolator.LINEAR },
                at(0.1s) { PanelOpacity => 0.75 tween Interpolator.LINEAR },
                at(0.3s) { PanelOpacity => 1.0 tween Interpolator.LINEAR },
                at(0s) { flag => 0 },
                ]
};

}
