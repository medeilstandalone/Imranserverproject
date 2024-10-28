
package com.vanuston.medeil.ui;
import javafx.animation.Interpolator;
import javafx.animation.Timeline;
import java.lang.String;
import  com.vanuston.medeil.util.DBConnection;

import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.util.GetCompanyInfo;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.WebLink;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.util.WinRegistry;
public class About {
    var log: Logger = Logger.getLogger(About.class,"Settings");
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def vbox4: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        layoutX: 165.0
        layoutY: 240.0
        spacing: 4.0
    }
    
    def __layoutInfo_separator: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 452.0
        height: 2.0
    }
    public-read def separator: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: 55.0
        layoutY: 244.0
        layoutInfo: __layoutInfo_separator
    }
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
    }
    
    public-read def Arial_Bold_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 12.0
    }
    
    public-read def mail_link: javafx.scene.control.Hyperlink = javafx.scene.control.Hyperlink {
        text: "contact@medeil.com"
        font: Arial_Bold_12
        action: hyperlink2Action
    }
    
    public-read def web_link: javafx.scene.control.Hyperlink = javafx.scene.control.Hyperlink {
        text: "http://www.medeil.com"
        font: Arial_Bold_12
        action: hyperlinkAction
    }
    
    public-read def Arial_Bold_16: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 16.0
    }
    
    def __layoutInfo_label11: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 300.0
        height: 26.0
    }
    public-read def label11: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 40.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_label11
        text: "About MEDEIL"
        font: Arial_Bold_16
        textFill: javafx.scene.paint.Color.WHITE
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
    
    def __layoutInfo_lbl_rights: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 400.0
        height: 35.0
    }
    public-read def lbl_rights: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 100.0
        layoutY: 312.0
        layoutInfo: __layoutInfo_lbl_rights
        text: "\u00A9 2011 Vanuston Intelligence Private Limited. All rights reserved.      MEDEIL is a registered trademark of Vanuston Intelligence."
        font: Arial_12
        textAlignment: javafx.scene.text.TextAlignment.CENTER
        textWrap: true
        hpos: javafx.geometry.HPos.CENTER
        textFill: DarkGray
    }
    
    public-read def label17: javafx.scene.control.Label = javafx.scene.control.Label {
        text: ":"
        textFill: DarkGray
    }
    
    public-read def label13: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Email ID                "
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def hbox2: javafx.scene.layout.HBox = javafx.scene.layout.HBox {
        layoutX: 60.0
        layoutY: 285.0
        content: [ label13, label17, mail_link, ]
        spacing: 6.0
    }
    
    public-read def label14: javafx.scene.control.Label = javafx.scene.control.Label {
        text: ":"
        textFill: DarkGray
    }
    
    public-read def label12: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Website               "
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def hbox: javafx.scene.layout.HBox = javafx.scene.layout.HBox {
        layoutX: 60.0
        layoutY: 260.0
        content: [ label12, label14, web_link, ]
        spacing: 6.0
    }
    
    public-read def labelDrugUpdated: javafx.scene.control.Label = javafx.scene.control.Label {
        text: bind DrugUpdated
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def labelDrugVersion: javafx.scene.control.Label = javafx.scene.control.Label {
        text: bind DrugVersion
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def vbox5: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        layoutX: 450.0
        layoutY: 65.0
        content: [ labelDrugVersion, labelDrugUpdated, ]
        spacing: 10.0
    }
    
    public-read def label24: javafx.scene.control.Label = javafx.scene.control.Label {
        text: ":"
        textFill: DarkGray
    }
    
    public-read def label23: javafx.scene.control.Label = javafx.scene.control.Label {
        text: ":"
        textFill: DarkGray
    }
    
    public-read def vbox6: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        layoutX: 435.0
        layoutY: 65.0
        content: [ label23, label24, ]
        spacing: 10.0
    }
    
    public-read def label22: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Updated on"
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def label21: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Drug Database Version"
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def vbox7: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        layoutX: 300.0
        layoutY: 65.0
        content: [ label21, label22, ]
        spacing: 10.0
    }
    
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        text: bind Validity
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def label8: javafx.scene.control.Label = javafx.scene.control.Label {
        text: bind LicenceTo
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        text: bind pdtCode
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def labelpdtUpdated: javafx.scene.control.Label = javafx.scene.control.Label {
        text: bind pdtUpdated
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def labelpdtVersion: javafx.scene.control.Label = javafx.scene.control.Label {
        text: bind pdtVersion
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def vbox2: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        layoutX: 175.0
        layoutY: 65.0
        content: [ labelpdtVersion, labelpdtUpdated, label7, label8, label5, ]
        spacing: 10.0
    }
    
    public-read def label18: javafx.scene.control.Label = javafx.scene.control.Label {
        text: ":"
        textFill: DarkGray
    }
    
    public-read def label16: javafx.scene.control.Label = javafx.scene.control.Label {
        text: ":"
        textFill: DarkGray
    }
    
    public-read def label15: javafx.scene.control.Label = javafx.scene.control.Label {
        text: ":"
        textFill: DarkGray
    }
    
    public-read def label19: javafx.scene.control.Label = javafx.scene.control.Label {
        text: ":"
        textFill: DarkGray
    }
    
    public-read def label20: javafx.scene.control.Label = javafx.scene.control.Label {
        text: ":"
        textFill: DarkGray
    }
    
    public-read def vbox1: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        layoutX: 160.0
        layoutY: 65.0
        content: [ label20, label19, label15, label16, label18, ]
        spacing: 8.0
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Valid Till"
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Licenced To "
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Product Key"
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def label10: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Updated on"
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: true
        text: "Product Version"
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def vbox: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        layoutX: 60.0
        layoutY: 65.0
        content: [ label9, label10, label3, label4, label2, ]
        spacing: 10.0
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
    
    public-read def Arial_Bold_30: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 30.0
    }
    
    def __layoutInfo_lblLicenceType: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: 40.0
    }
    public-read def lblLicenceType: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 68.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_lblLicenceType
        text: bind Status
        font: Arial_Bold_30
    }
    
    public-read def imageMedeil: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Medil Logo.png"
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 353.0
        layoutY: 40.0
        effect: null
        image: imageMedeil
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
    
    public-read def imageView3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 213.0
        layoutY: 360.0
        image: imagevanuston
        fitWidth: 174.0
        fitHeight: 24.0
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
    
    public-read def linearGradient2: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        startX: 1.0
        startY: 0.0
        endX: 0.0
        proportional: true
        cycleMethod: javafx.scene.paint.CycleMethod.NO_CYCLE
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#ffffff") }, javafx.scene.paint.Stop { offset: 0.2, color: javafx.scene.paint.Color.web ("#ffffff") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#93c028") }, ]
    }
    
    public-read def rectangle2: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        opacity: 1.0
        layoutX: 54.0
        layoutY: 0.0
        styleClass: ""
        fill: linearGradient2
        width: 350.0
        height: 40.0
        arcWidth: 10.0
        arcHeight: 10.0
    }
    
    public-read def panelLicenceInfo: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutY: 50.0
        content: [ vbox, vbox1, vbox2, rectangle2, lblLicenceType, vbox7, vbox6, vbox5, ]
    }
    
    public-read def panelheader: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ rectangle, RectTitle, panelLicenceInfo, label11, imageView2, imgClose, hbox, hbox2, vbox4, lbl_rights, imageView3, separator, imageView, ]
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
 

    var panelW = bind CommonDeclare.ScreenWidth;
    var panelH = bind CommonDeclare.ScreenHeight;
    var PanelOpacity:Number=0.0;
    var panelStartLX:Number;
    var panelStartLY:Number;
    var panelLX:Number=(panelW-600) / 2;
    var panelLY:Number=(panelH-350) / 2;
    var pdtVersion:String="Nil";
    var pdtUpdated:String="Nil";
    var DrugVersion:String="Nil";
    var DrugUpdated:String="Nil";

    var pdtCode:String="Nil";
    var LicenceTo:String="Nil";
    public var Status:String="Nil";
    var Validity:String="Nil";

    function hyperlink2Action(): Void {
       WebLink.Contact_Email();
         }
    function hyperlinkAction(): Void {
       WebLink.Medeil_Web();
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
        fadePanel.rate = -1.0;
        fadePanel.play();
        panel.visible=false;
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
        LoadInfo();
        panel.visible=true;
        fadePanel.rate = 1.0;
        fadePanel.play();
    }
    public   function LoadInfo():Void{
    var winRegistry=new WinRegistry();
        try {

            var rs = DBConnection.getStatement().executeQuery("select lic_holder_name,pdt_code,act_code,mode from license_details");
             while(rs.next())
            { 
                 var mode=rs.getString("mode").trim();
                 Validity=DateUtils.normalFormatDate(winRegistry.getExpiryDate());
                 if(mode.equals("Standard") or mode.equals("Express") ){
                        pdtCode=rs.getString("pdt_code").trim();
                        var commonController : CommonImplements=RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements ;
                        LicenceTo= commonController.ShopName();
                        Status=mode;
                        vbox.content=[ label9, label10, label3, label4, label2, ];
                        vbox1.content= [ label20, label19, label15, label16, label18, ];
                        vbox2.content= [ labelpdtVersion, labelpdtUpdated, label7, label8, label5, ];
               }
               else{
                        Status=mode;
                        vbox.content=[ label9, label10,  label2, ];
                        vbox1.content= [ label20, label19, label18, ];
                        vbox2.content= [ labelpdtVersion, labelpdtUpdated,  label5, ];
                   }
               }
            } catch (ex) {
             log.debug("Class : About Method : LoadInfo()    Exception :{ex.getMessage()}");
            }
            var rs1 = DBConnection.getStatement().executeQuery("SELECT pdt_version,pdt_updated,drug_version,drug_updated FROM product_info");
             while(rs1.next())
            {
             pdtVersion=rs1.getString("pdt_version");
             pdtUpdated=DateUtils.normalFormatDate( rs1.getDate("pdt_updated"));
             DrugVersion=rs1.getString("drug_version");
             DrugUpdated=DateUtils.normalFormatDate( rs1.getDate("drug_updated"));
            }
            web_link.text=GetCompanyInfo.web;
            mail_link.text=GetCompanyInfo.contact_mail;
    }
    var fadePanel = Timeline {
        keyFrames: [
                at(0s) { PanelOpacity => 0.0 tween Interpolator.LINEAR },
                at(0.1s) { PanelOpacity => 0.75 tween Interpolator.LINEAR },
                at(0.3s) { PanelOpacity => 1.0 tween Interpolator.LINEAR },
                ]
    };

}
