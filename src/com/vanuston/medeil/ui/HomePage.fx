package com.vanuston.medeil.ui;

import java.lang.*;
import java.sql.*;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.DateUtils;
import javafx.animation.Timeline;
import javafx.animation.KeyFrame;


public class HomePage {

    var panelW = bind (CommonDeclare.ScreenWidth - CommonDeclare.DockW);
    var panelH = bind CommonDeclare.panelFormH;
    var LogoLX = bind (panelW - 250);
    var panelImgLX = bind panelW * 18.92121982 / 100;
    var vboxLX = bind vbox1LX - 50;
    var vbox1LX = bind panelW - 450;
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def panelMaintainCostAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: 17.0
        layoutY: 5.0
    }
    
    public-read def separator: javafx.scene.control.Separator = javafx.scene.control.Separator {
        effect: null
    }
    
    public-read def separator2: javafx.scene.control.Separator = javafx.scene.control.Separator {
    }
    
    public-read def Violet: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.011764706
        green: 0.5019608
        blue: 0.7607843
    }
    
    public-read def linearGradient: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        startY: 1.0
        endX: 0.0
        endY: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#76a340") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#99cc33") }, ]
    }
    
    public-read def Arial_Bold_18: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 18.0
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
    
    public-read def backKey: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Ctrl + <--  Back"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def cancelKey: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "F8  Cancel"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def removeRowkey: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "F12  Remove Row"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def substitudeKey: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "F11  Substitute"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def insertKey: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "F9  Insert"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def reportKey: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "F10  Report"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def hbox3: javafx.scene.layout.HBox = javafx.scene.layout.HBox {
        content: [ reportKey, insertKey, substitudeKey, removeRowkey, cancelKey, backKey, ]
        spacing: 25.0
    }
    
    public-read def updateKey: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "F7  Update"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def editKey: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "F6  Edit"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def deleteKey: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "F5  Delete"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def resetKey: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "F4  Reset"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def saveKey: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "F3  Save"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def printKey: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "F2  Print"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def helpKey: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "F1  Help"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def reportsKey: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Alt + 7  Reports"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def hbox2: javafx.scene.layout.HBox = javafx.scene.layout.HBox {
        content: [ reportsKey, helpKey, printKey, saveKey, resetKey, deleteKey, editKey, updateKey, ]
        spacing: 25.0
    }
    
    public-read def crmKeys: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Alt + 6  CRM"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def financeKeys: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Alt + 5  Finance"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def mastersKey: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Alt + 4  Masters"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def inventoryKeys: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Alt + 3  Inventory"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def salesKey: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Alt + 2  Sales"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def homeKey: javafx.scene.control.Label = javafx.scene.control.Label {
        styleClass: "shortCutkey-Seperator"
        text: "Alt + 1  Home"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def hbox: javafx.scene.layout.HBox = javafx.scene.layout.HBox {
        layoutX: 0.0
        layoutY: 30.0
        content: [ homeKey, salesKey, inventoryKeys, mastersKey, financeKeys, crmKeys, ]
        spacing: 25.0
    }
    
    public-read def vbox3: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        layoutX: 25.0
        layoutY: 45.0
        content: [ hbox, separator, hbox2, separator2, hbox3, ]
        spacing: 10.0
    }
    
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        opacity: 1.0
        layoutX: 0.0
        layoutY: 0.0
        fill: linearGradient
        stroke: DarkGray
        width: bind panelW
        height: bind panelH
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.4
        green: 0.6
    }
    
    public-read def lblEdition: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: true
        layoutX: bind LogoLX+75.0
        layoutY: 80.0
        text: ""
        font: Arial_Bold_14
        textFill: Green
    }
    
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Follow us on :"
        font: Arial_Bold_12
        textFill: Green
    }
    
    public-read def hbox5: javafx.scene.layout.HBox = javafx.scene.layout.HBox {
        content: [ label, ]
        spacing: 6.0
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: true
        text: "Integrated Accounting and Reporting"
        font: Arial_Bold_18
        textFill: Green
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: true
        effect: null
        text: "Live Drug Index Update"
        font: Arial_Bold_18
        textFill: Green
    }
    
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: true
        text: "Alert Management"
        font: Arial_Bold_18
        textFill: Green
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: true
        text: "Built-in Customer Relationship Management (CRM)"
        font: Arial_Bold_18
        textFill: Green
    }
    
    public-read def label16: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 35.0
        layoutY: 234.0
        text: "Multi-level Inventory Control "
        font: Arial_Bold_18
        textFill: Green
    }
    
    public-read def vbox: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        visible: true
        layoutX: bind vbox1LX
        layoutY: 121.0
        content: [ label16, label2, label5, label4, label3, ]
        spacing: 16.0
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
    }
    
    public-read def shortCutkeys: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 25.0
        layoutY: 10.0
        effect: null
        text: "Shortcut Keys:-"
        font: Arial_Bold_16
        textFill: color
    }
    
    public-read def Arial_Bold_60: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 60.0
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Tablets.png"
    }
    
    public-read def image2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Natural Medicine.png"
    }
    
    public-read def Bullet_arrow_png: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Bullet arrow.png"
    }
    
    public-read def image3: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Bullet arrow.png"
    }
    
    public-read def imageView4: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: image3
    }
    
    public-read def imageView3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: true
        image: image3
    }
    
    public-read def image4: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Bullet arrow.png"
    }
    
    public-read def imageView5: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: image4
    }
    
    public-read def image5: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Bullet arrow.png"
    }
    
    public-read def imageView6: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: image5
    }
    
    public-read def image6: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Bullet arrow.png"
    }
    
    public-read def image7: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Bullet arrow.png"
    }
    
    public-read def imageView7: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: image7
    }
    
    public-read def linearGradient2: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        startX: 100.0
        startY: 100.0
        endX: 0.0
        endY: 0.0
        proportional: true
        cycleMethod: javafx.scene.paint.CycleMethod.NO_CYCLE
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#ffffff") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#f5f0e9") }, ]
    }
    
    public-read def image8: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Medil Logo.png"
    }
    
    public-read def imageView9: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind LogoLX
        layoutY: 35.0
        focusTraversable: false
        image: image8
    }
    
    public-read def bloomEffect: javafx.scene.effect.Bloom = javafx.scene.effect.Bloom {
        threshold: 0.68
    }
    
    public-read def arrowback: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/arrow-left.png"
        backgroundLoading: false
        smooth: true
        width: 16.0
        height: 16.0
    }
    
    public-read def lineSpliter: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/line.png"
    }
    
    public-read def imageView19: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        managed: true
        layoutX: 599.0
        layoutY: 127.0
        image: lineSpliter
    }
    
    public-read def imageView20: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 499.0
        layoutY: 127.0
        image: lineSpliter
    }
    
    public-read def imageView21: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 346.0
        layoutY: 127.0
        image: lineSpliter
    }
    
    public-read def imageView23: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 211.0
        layoutY: 127.0
        image: lineSpliter
    }
    
    public-read def imageView22: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 118.0
        layoutY: 127.0
        image: lineSpliter
    }
    
    public-read def row3: javafx.scene.Group = javafx.scene.Group {
        content: [ imageView22, imageView23, imageView21, imageView20, imageView19, ]
    }
    
    public-read def imageView18: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 590.0
        layoutY: 86.0
        image: lineSpliter
    }
    
    public-read def imageView17: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 493.0
        layoutY: 86.0
        image: lineSpliter
    }
    
    public-read def imageView16: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 400.0
        layoutY: 86.0
        image: lineSpliter
    }
    
    public-read def imageView15: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 313.0
        layoutY: 86.0
        image: lineSpliter
    }
    
    public-read def imageView14: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 226.0
        layoutY: 86.0
        image: lineSpliter
    }
    
    public-read def imageView13: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 143.0
        layoutY: 86.0
        image: lineSpliter
    }
    
    public-read def row2: javafx.scene.Group = javafx.scene.Group {
        content: [ imageView13, imageView14, imageView15, imageView16, imageView17, imageView18, ]
    }
    
    public-read def imageView12: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 670.0
        layoutY: 86.0
        image: lineSpliter
    }
    
    public-read def imageView11: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 653.0
        layoutY: 43.0
        image: lineSpliter
    }
    
    public-read def imageView10: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 519.0
        layoutY: 43.0
        image: lineSpliter
    }
    
    public-read def imageView8: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 387.0
        layoutY: 43.0
        image: lineSpliter
    }
    
    public-read def imageView2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 241.0
        layoutY: 43.0
        effect: null
        image: lineSpliter
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 125.0
        layoutY: 43.0
        image: lineSpliter
    }
    
    public-read def row1: javafx.scene.Group = javafx.scene.Group {
        content: [ imageView, imageView2, imageView8, imageView10, imageView11, imageView12, ]
    }
    
    public-read def lineGroup: javafx.scene.Group = javafx.scene.Group {
        content: [ row1, row2, row3, ]
    }
    
    public-read def shortCutKeysgroup: javafx.scene.Group = javafx.scene.Group {
        layoutX: 0.0
        layoutY: 400.0
        content: [ shortCutkeys, vbox3, lineGroup, ]
    }
    
    public-read def image9: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/googleplus.png"
    }
    
    public-read def imgGP: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: image9
        fitWidth: 20.0
        fitHeight: 20.0
    }
    
    public-read def hyperlinkGP: javafx.scene.control.Hyperlink = javafx.scene.control.Hyperlink {
        graphic: imgGP
        text: "Google+"
        font: Arial_12
        action: hyplnkGpAction
    }
    
    public-read def image10: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/facebook.png"
    }
    
    public-read def imgFB: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: image10
        fitWidth: 20.0
        fitHeight: 20.0
    }
    
    public-read def hyperlinkFB: javafx.scene.control.Hyperlink = javafx.scene.control.Hyperlink {
        graphic: imgFB
        text: "Facebook"
        font: Arial_12
        action: hyplnkFbAction
    }
    
    public-read def image11: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/youtube.png"
    }
    
    public-read def imgYT: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: image11
        fitWidth: 20.0
        fitHeight: 20.0
    }
    
    public-read def hyperlinkYT: javafx.scene.control.Hyperlink = javafx.scene.control.Hyperlink {
        graphic: imgYT
        text: "Youtube`"
        font: Arial_12
        action: hyperlinkYTAction
    }
    
    public-read def image12: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/pinterest.png"
    }
    
    public-read def imageView24: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: image12
        fitWidth: 20.0
        fitHeight: 20.0
    }
    
    public-read def hyperlinkPR: javafx.scene.control.Hyperlink = javafx.scene.control.Hyperlink {
        opacity: 1.0
        graphic: imageView24
        text: "PrintRest"
        font: Arial_12
        action: hyperlinkPRAction
    }
    
    public-read def image13: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/linkedin.png"
    }
    
    public-read def imageView25: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: image13
        fitWidth: 20.0
        fitHeight: 20.0
    }
    
    public-read def hyperlinkLI: javafx.scene.control.Hyperlink = javafx.scene.control.Hyperlink {
        graphic: imageView25
        text: "Linkedin"
        font: Arial_12
        action: hyperlinkLIAction
    }
    
    public-read def image14: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/twitter.png"
    }
    
    public-read def imgTwitter: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: image14
        fitWidth: 20.0
        fitHeight: 20.0
    }
    
    public-read def hyperlinkTwitter: javafx.scene.control.Hyperlink = javafx.scene.control.Hyperlink {
        graphic: imgTwitter
        text: "Twitter"
        font: Arial_12
        action: hyperlinkTwitterAction
    }
    
    public-read def hbox4: javafx.scene.layout.HBox = javafx.scene.layout.HBox {
        focusTraversable: false
        content: [ hyperlinkFB, hyperlinkGP, hyperlinkYT, hyperlinkTwitter, hyperlinkPR, hyperlinkLI, ]
        spacing: 6.0
    }
    
    public-read def vbox2: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        visible: true
        layoutX: bind vboxLX
        layoutY: 121.0
        focusTraversable: false
        content: [ imageView3, imageView4, imageView5, imageView6, imageView7, hbox5, hbox4, ]
        spacing: 10.0
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutX: 4.0
        layoutY: 0.0
        focusTraversable: false
        content: [ rectangle, vbox, vbox2, imageView9, lblEdition, panelMaintainCostAlert, shortCutKeysgroup, ]
    }
    
    public-read def scene: javafx.scene.Scene = javafx.scene.Scene {
        content: getDesignRootNodes ()
        camera: null
        cursor: null
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel, ]
    }
    // </editor-fold>//GEN-END:main

    function hyperlinkLIAction(): Void {
        browseUrl("http://www.linkedin.com/company/vanuston-intelligence-private-limited/medeil-39417/product?trk=biz_product");
    }
    function hyperlinkPRAction(): Void {
        browseUrl("http://www.pinterest.com/vanuston/medeil-chemist-druggist-pharmacy-software/");
    }
    function hyperlinkTwitterAction(): Void {
        browseUrl("https://twitter.com/Medeilsoftware");
    }
    function hyperlinkYTAction(): Void {
        browseUrl("http://www.youtube.com/channel/UCuHHhBRMAfVn4rtyE9wI1sQ");
    }
    function hyplnkGpAction(): Void {
        browseUrl("https://plus.google.com/+Medeil/about");
    }
    function hyplnkFbAction(): Void {
        browseUrl("https://www.facebook.com/medeilPMS");
    }

    function browseUrl(url:String) : Void {
         try {
            java.awt.Desktop.getDesktop().browse(java.net.URI.create(url));
       } catch(e:Exception){
            e.printStackTrace();
       }
    }







    public function Show():  Void {
        var rs: ResultSet = DBConnection.getStatement().executeQuery("SELECT maintain_cost_alert,maintain_cost_days FROM settings_config");
        var alert; var alertdays;
        while (rs.next()) {
            alert = rs.getInt("maintain_cost_alert");
            alertdays = rs.getInt("maintain_cost_days");
        }

        var curDate: String[] = DateUtils.now("dd-MM-yyyy").split("-");
        var data = 0;
        var rs1: ResultSet = DBConnection.getStatement().executeQuery("select * from  maintain_cost where cmonth=(SELECT cmonth FROM maintain_cost order by main_id desc limit 0,1) and cyear = '{curDate[2]}' and mc_flag_id = '0' and due_date between curdate() and DATE_ADD(curdate(),INTERVAL {alertdays} day)");
        while (rs1.next()) {
            data = 1;
        }


        if (data == 1 and alert == 1) {

            panelMaintainCostAlert.visible = true;
            delete  panelMaintainCostAlert.content;
            def MCostAlert = MaintainCostAlert {};
            insert MCostAlert.getDesignRootNodes() into panelMaintainCostAlert.content;
            MCostAlert.GetMaintainCostAlert();

//            def MCostAlert = MaintainCostAlert {};
//            marqAlert = MCostAlert.GetMaintainCostAlert();
//            CommonDeclare.marqContent = MCostAlert.GetMaintainCostAlert();
//            CommonDeclare.marqRun = true;
        }
    }  

}

