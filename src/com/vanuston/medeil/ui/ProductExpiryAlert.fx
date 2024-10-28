package com.vanuston.medeil.ui;
import javafx.animation.Interpolator;
import javafx.animation.Timeline;
import com.vanuston.medeil.util.CommonDeclare;
import javafx.scene.control.Label;
import javafx.scene.layout.Panel;
import javafx.scene.image.Image;
import javafx.scene.shape.Rectangle;
import org.netbeans.javafx.design.DesignState;
import javafx.scene.paint.Color;
import javafx.scene.control.ToggleGroup;
import javafx.scene.layout.LayoutInfo;
import javafx.scene.paint.LinearGradient;
import javafx.scene.input.MouseEvent;
import javafx.scene.text.Font;
import javafx.scene.effect.Reflection;
import javafx.scene.image.ImageView;
import javafx.scene.Node;
import com.vanuston.medeil.util.LogReg;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.GetCompanyInfo;
import com.vanuston.medeil.util.GetProductInfo;
import com.vanuston.medeil.util.Tools;
public class ProductExpiryAlert {
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
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
    
    def __layoutInfo_lblTitle: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 300.0
        height: 26.0
    }
    public-read def lblTitle: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 40.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_lblTitle
        text: "Product Licence Expiry Alert"
        font: Arial_18
        textFill: javafx.scene.paint.Color.WHITE
    }
    
    public-read def Arial_Bold_18: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 18.0
    }
    
    def __layoutInfo_label3: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 43.0
        height: 37.0
    }
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 454.0
        layoutY: 24.0
        layoutInfo: __layoutInfo_label3
        rotate: -30.0
        text: "Buy Now"
        font: Arial_Bold_18
        textWrap: true
        textFill: javafx.scene.paint.Color.BLACK
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
    
    def __layoutInfo_label14: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 540.0
        height: 20.0
    }
    public-read def label14: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 100.0
        layoutInfo: __layoutInfo_label14
        text: "Hours of Operation: Mon - Fri: 10:00am - 6:00pm IST and on Sat: 10:00am \u2013 3:00pm"
        font: Arial_12
        textAlignment: javafx.scene.text.TextAlignment.LEFT
        textWrap: true
        hpos: javafx.geometry.HPos.LEFT
        textFill: DarkGray
    }
    
    public-read def lbl_messenger: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 85.0
        text: "Skype id: medeil-support"
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def label24: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 20.0
        text: "Please contact us for more information"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label25: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 60.0
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
        layoutY: 45.0
        layoutInfo: __layoutInfo_lbl_phone
        text: "Telephone: 91 44 22641950"
        font: Arial_Bold_12
        textWrap: true
        textFill: DarkGray
    }
    
    def __layoutInfo_btnActivate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 160.0
    }
    public-read def btnActivate: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 9.0
        layoutInfo: __layoutInfo_btnActivate
        text: "Renew  Now"
        font: Arial_Bold_18
        hpos: javafx.geometry.HPos.CENTER
        textFill: DarkGray
    }
    
    def __layoutInfo_labelRemain: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: 39.0
    }
    public-read def labelRemain: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutInfo: __layoutInfo_labelRemain
        text: "Days Remaining"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.LEFT
        vpos: javafx.geometry.VPos.CENTER
        graphicHPos: javafx.geometry.HPos.LEFT
        textFill: DarkGray
    }
    
    def __layoutInfo_lblmessage: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 580.0
        height: 44.0
    }
    public-read def lblmessage: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: true
        layoutX: 0.0
        layoutY: 25.0
        layoutInfo: __layoutInfo_lblmessage
        text: "License for the Medeil application installed in your system is to expire in another few days. Please renew the License to continue using Medeil"
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
        text: "Live Support"
        font: Arial_Bold_14
        textFill: Green
    }
    
    public-read def panel5: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: 20.0
        layoutY: 250.0
        content: [ label21, lbl_phone, label25, label24, lbl_messenger, label14, ]
    }
    
    public-read def label15: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 0.0
        text: "Dear Customer,"
        font: Arial_Bold_14
        textFill: Green
    }
    
    public-read def panel2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: 20.0
        layoutY: 70.0
        content: [ label15, lblmessage, ]
    }
    
    public-read def Yellow: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 1.0
        blue: 0.8
    }
    
    public-read def linearGradientActivate: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#FFFFFF") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#d9ebae") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#c3e07c") }, ]
    }
    
    public-read def rectbuttonSkip: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        fill: linearGradientActivate
        stroke: Green
        strokeWidth: 2.0
        width: 120.0
        height: 40.0
        arcWidth: 10.0
        arcHeight: 10.0
    }
    
    public-read def rectbutton: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        opacity: 0.8
        layoutX: 0.0
        layoutY: 0.0
        fill: linearGradientActivate
        stroke: Green
        strokeWidth: 2.0
        width: 160.0
        height: 40.0
        arcWidth: 10.0
        arcHeight: 10.0
    }
    
    public-read def groupRenew: javafx.scene.Group = javafx.scene.Group {
        visible: true
        layoutX: 84.0
        layoutY: 56.0
        onMouseClicked: groupOnMouseClicked
        onMouseEntered: groupOnMouseEntered
        onMouseExited: groupOnMouseExited
        content: [ rectbutton, btnActivate, ]
    }
    
    public-read def Arial_Bold_50: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 45.0
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.2
    }
    
    public-read def lbldays: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: true
        layoutX: 65.0
        layoutY: 0.0
        graphic: labelRemain
        text: bind TrialDays
        font: Arial_Bold_50
        graphicHPos: javafx.geometry.HPos.RIGHT
        textFill: color
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
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Medil Logo.png"
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 380.0
        layoutY: 32.0
        image: image
    }
    
    public-read def image2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Buy Now.png"
    }
    
    public-read def imgBuyNow: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        opacity: 1.0
        cursor: javafx.scene.Cursor.HAND
        layoutX: 435.0
        layoutY: 10.0
        onMouseClicked: imgBuyNowOnMouseClicked
        image: image2
    }
    
    public-read def linearGradientActivate1: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        startX: 0.0
        startY: 1.0
        endX: 0.0
        endY: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#FFFFFF") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#d9ebae") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#c3e07c") }, ]
    }
    
    public-read def glowEffect: javafx.scene.effect.Glow = javafx.scene.effect.Glow {
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
    
    public-read def imageNaviNext: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/NavigationNext.png"
    }
    
    public-read def imageView3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageNaviNext
    }
    
    def __layoutInfo_label2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 120.0
    }
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 9.0
        layoutInfo: __layoutInfo_label2
        graphic: imageView3
        text: "Skip"
        font: Arial_Bold_18
        hpos: javafx.geometry.HPos.CENTER
        graphicHPos: javafx.geometry.HPos.RIGHT
        textFill: DarkGray
    }
    
    public-read def groupSkip: javafx.scene.Group = javafx.scene.Group {
        layoutX: 251.0
        layoutY: 56.0
        onMouseClicked: groupSkipOnMouseClicked
        onMouseEntered: groupSkipOnMouseEntered
        onMouseExited: groupSkipOnMouseExited
        content: [ rectbuttonSkip, label2, ]
    }
    
    def __layoutInfo_panel4: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 580.0
        height: 100.0
    }
    public-read def panel4: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: 14.0
        layoutY: 135.0
        layoutInfo: __layoutInfo_panel4
        content: [ imgBuyNow, label3, lbldays, groupRenew, groupSkip, ]
    }
    
    public-read def panelheader: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        content: [ rectangle, RectTitle, lblTitle, imageView2, imageView, panel2, panel4, panel5, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        opacity: bind PanelOpacity
        layoutX: bind panelLX
        layoutY: bind panelLY
        blocksMouse: false
        content: [ panelheader, imgClose, ]
    }
    
    public-read def paneExpiry: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        blocksMouse: false
        content: [ panel, ]
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ paneExpiry, ]
    }
    // </editor-fold>//GEN-END:main
    var log: Logger = Logger.getLogger(ProductExpiryAlert.class,"Main");
    var logReg=new LogReg();
    function groupOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        Tools.LaunchActivator(1);
         }
    function groupOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        rectbutton.fill=linearGradientActivate;
         } 
    function groupOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        rectbutton.fill=linearGradientActivate1;
         }
    function groupSkipOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        Close();
         }
    function groupSkipOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        rectbuttonSkip.fill=linearGradientActivate;
         }
    function groupSkipOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        rectbuttonSkip.fill=linearGradientActivate1;
         }
    var TrialDays: String =null;

var panelW = bind CommonDeclare.ScreenWidth;
var panelH = bind CommonDeclare.ScreenHeight;
var PanelOpacity:Number=0.0;
var panelStartLX:Number;
var panelStartLY:Number;
var panelLX:Number=(panelW - 600) / 2;
var panelLY:Number=(panelH- 400) / 2;
    function imgBuyNowOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
         try{
//            java.awt.Desktop.getDesktop().browse(java.net.URI.create("http://www.medeil.com/buynow.jsp"));
            java.awt.Desktop.getDesktop().browse(java.net.URI.create("http://product.vanuston.com/buy-now.jsp"));
       }catch(e){
            log.debug("Error Occured while launcing http://product.vanuston.com/buy-now.jsp in ProductExpiryAlert = {e.getMessage()}");
        }
         }
function RectTitleOnMouseDragged(e: javafx.scene.input.MouseEvent): Void {
       var LX=e.screenX - panelStartLX;
       var LY=e.screenY - panelStartLY;
       if(LX>0 and (LX+25)<panelW )
       panelLX = e.screenX - panelStartLX;
       if(LY>0 and (LY+25)<panelH )
       panelLY = e.screenY - panelStartLY;
         }

    function RectTitleOnMousePressed(e: javafx.scene.input.MouseEvent): Void {
        panelStartLX = e.screenX - panelLX;
        panelStartLY = e.screenY - panelLY;
         }
    function imgCloseOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        Close();
    }
    function Close():Void{
       if(logReg.getRemainingDays()<0){
        javafx.lang.FX.exit();
        }
        else{
        fadePanel.rate = -1.0;
        fadePanel.play();
        paneExpiry.visible=false;
        }
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
    var getProductInfo=new GetProductInfo();
    paneExpiry.visible=true;
    labelRemain.visible=true;
    TrialDays="{logReg.getRemainingDays()}";
    lbl_phone.text="Telephone: {GetCompanyInfo.ph_no1}";
    lbl_messenger.text="{GetCompanyInfo.messenger_type} id: {GetCompanyInfo.messenger_id}";
    if(getProductInfo.getStatus().equals("Standard") or getProductInfo.getStatus().equals("Express") or getProductInfo.getStatus().equals("Professional")){
    btnActivate.text="Renew Now";
    groupSkip.visible=true;
    }
    else{
        btnActivate.text="Activate Now";
        groupSkip.visible=false;
    }

    if(Integer.parseInt(TrialDays)<=0){
        TrialDays="Licence Expired";
        labelRemain.visible=false;
        lblTitle.text="Medeil license Expired";
        lblmessage.text="License for the Medeil application installed in your system has expired. Please renew the License to reactivate the system";
        btnActivate.text="Activate Now";
        groupSkip.visible=false;
    }
    panel.visible=true;
    fadePanel.rate = 1.0;
    fadePanel.play()
}

var fadePanel = Timeline {
    keyFrames: [
                at(0s) { PanelOpacity => 0.0 tween Interpolator.LINEAR },
                at(0.1s) { PanelOpacity => 0.75 tween Interpolator.LINEAR },
                at(0.3s) { PanelOpacity => 1.0 tween Interpolator.LINEAR },
                ]
};

}

