package com.vanuston.medeil.ui;

import javafx.scene.image.ImageView;
import javafx.scene.image.Image;
import com.vanuston.medeil.util.CommonDeclare;
import javafx.animation.Interpolator;
import javafx.animation.Timeline;
import com.vanuston.medeil.util.GetUserInfo;
import java.lang.Exception;

public class SubMenuHome {

//    def Backup = Backup {};
//    def Restore = Restore {};
//    def Export = Export {};
//    def Import = Import {};
    public var exit:Boolean=false ;
    def rectMenuWidth = 219.5;
    var panelMsgBoxLX= bind ((CommonDeclare.panelFormW-500)/2)+207;
    var panelMsgBoxLY= bind ((CommonDeclare.panelFormH-150)/2)-100;
    public var HomeModule: Integer = 0 on replace {
        CommonDeclare.form[0] = HomeModule;
    }
    var Homeform= bind CommonDeclare.form[0] on replace {
        if(Homeform==0){
        imgClose.visible=false;
        delete panelHomeForm.content;
    }}
    var user = bind CommonDeclare.user;
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def rectMenu1: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 0.0
        layoutY: 36.0
        width: bind rectMenuWidth
        height: 50.0
    }
    
    def __layoutInfo_lblMenu1: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblMenu1: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 56.0
        layoutY: 60.0
        layoutInfo: __layoutInfo_lblMenu1
        text: "Label"
    }
    
    public-read def imgMenu1: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 60.0
    }
    
    public-read def group1: javafx.scene.Group = javafx.scene.Group {
        visible: false
        content: [ rectMenu1, lblMenu1, imgMenu1, ]
    }
    
    public-read def rectMenu2: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 18.0
        layoutY: 99.0
        width: bind rectMenuWidth
        height: 50.0
    }
    
    def __layoutInfo_lblMenu2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblMenu2: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 56.0
        layoutY: 103.0
        layoutInfo: __layoutInfo_lblMenu2
        text: "Label"
    }
    
    public-read def rectMenu3: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 11.0
        layoutY: 164.0
        width: bind rectMenuWidth
        height: 50.0
    }
    
    def __layoutInfo_lblMenu3: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblMenu3: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutY: 157.0
        layoutInfo: __layoutInfo_lblMenu3
        text: "Label"
    }
    
    public-read def rectMenu4: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 17.0
        layoutY: 237.0
        width: bind rectMenuWidth
        height: 50.0
    }
    
    def __layoutInfo_lblMenu4: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblMenu4: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 56.0
        layoutY: 201.0
        layoutInfo: __layoutInfo_lblMenu4
        text: "Label"
    }
    
    public-read def rectMenu5: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 28.0
        layoutY: 308.0
        width: bind rectMenuWidth
        height: 50.0
    }
    
    def __layoutInfo_lblMenu5: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblMenu5: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 56.0
        layoutY: 252.0
        layoutInfo: __layoutInfo_lblMenu5
        text: "Label"
    }
    
    public-read def rectMenu6: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 27.0
        layoutY: 375.0
        width: bind rectMenuWidth
        height: 50.0
    }
    
    def __layoutInfo_lblMenu6: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblMenu6: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 70.0
        layoutY: 300.0
        layoutInfo: __layoutInfo_lblMenu6
        text: "Label"
    }
    
    public-read def rectMenu8: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        width: bind rectMenuWidth
        height: 50.0
    }
    
    def __layoutInfo_lblMenu8: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblMenu8: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutInfo: __layoutInfo_lblMenu8
        text: "Label"
    }
    
    public-read def imgMenu8: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
    }
    
    public-read def group7: javafx.scene.Group = javafx.scene.Group {
        visible: false
        content: [ rectMenu8, lblMenu8, imgMenu8, ]
    }
    
    public-read def rectMenu7: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 6.0
        layoutY: 437.0
        width: bind rectMenuWidth
        height: 50.0
    }
    
    def __layoutInfo_lblMenu7: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblMenu7: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 70.0
        layoutY: 343.0
        layoutInfo: __layoutInfo_lblMenu7
        text: "Label"
    }
    
    public-read def panelHomeForm: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: 403.0
        layoutY: 195.0
    }
    
    public-read def panelMsgBox: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelMsgBoxLX
        layoutY: bind panelMsgBoxLY
    }
    
    public-read def linearGradient: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#ede9d9") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#f4eccc") }, ]
    }
    
    public-read def Violet: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.01
        green: 0.5
        blue: 0.76
    }
    
    public-read def Sandal: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.8
        blue: 0.4
    }
    
    public-read def DarkGray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.2
        blue: 0.2
    }
    
    public-read def Left_Menu: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
        size: 18.0
    }
    
    public-read def imageNew: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/New.png"
    }
    
    public-read def imagePrint: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Print.png"
    }
    
    public-read def imageExport: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Export.png"
    }
    
    public-read def imgMenu5: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 252.0
        image: imageExport
    }
    
    public-read def group5: javafx.scene.Group = javafx.scene.Group {
        visible: false
        content: [ rectMenu5, lblMenu5, imgMenu5, ]
    }
    
    public-read def imageImport: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Import.png"
    }
    
    public-read def imgMenu4: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 207.0
        image: imageImport
    }
    
    public-read def group4: javafx.scene.Group = javafx.scene.Group {
        visible: false
        content: [ rectMenu4, lblMenu4, imgMenu4, ]
    }
    
    public-read def imagePrescrb: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Doctor.png"
    }
    
    public-read def imgMenu3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 157.0
        image: imagePrescrb
    }
    
    public-read def group3: javafx.scene.Group = javafx.scene.Group {
        visible: false
        content: [ rectMenu3, lblMenu3, imgMenu3, ]
    }
    
    public-read def imageBackup: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Backup.png"
    }
    
    public-read def imgMenu2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 109.0
        image: imageBackup
    }
    
    public-read def group2: javafx.scene.Group = javafx.scene.Group {
        visible: false
        content: [ rectMenu2, lblMenu2, imgMenu2, ]
    }
    
    public-read def imageExit: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Exit.png"
    }
    
    public-read def imgMenu7: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 349.0
        image: imageExit
    }
    
    public-read def imgMenu6: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 300.0
        image: imageExit
    }
    
    public-read def group6: javafx.scene.Group = javafx.scene.Group {
        visible: false
        content: [ rectMenu6, lblMenu6, imgMenu6, ]
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Close.png"
    }
    
    public-read def imgClose: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        opacity: bind opacClose
        layoutX: bind imgCancelLX
        image: image
    }
    
    public-read def panelHomeSubMenu: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        disable: bind CloseForm
        layoutX: 0.0
        layoutY: 0.0
        content: [ group1, group2, group3, group4, group5, group6, group7, rectMenu7, imgMenu7, lblMenu7, panelHomeForm, imgClose, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        content: [ panelHomeSubMenu, panelMsgBox, ]
    }
    
    public-read def imageLabelPrinter: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/LabelPrinter.png"
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "SubMenu", ]
        actual: 0
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        values: [
                            rectMenu1.fill => rectMenu1.fill tween javafx.animation.Interpolator.DISCRETE,
                        ]
                        action: function() {
                            rectMenu1.visible = true;
                            rectMenu1.opacity = 1.0;
                            rectMenu1.layoutX = 8.0;
                            rectMenu1.layoutY = 0.0;
                            rectMenu1.styleClass = "LeftmenuHighlight";
                            rectMenu1.stroke = DarkGray;
                            rectMenu1.strokeWidth = 2.0;
                            rectMenu1.height = 45.0;
                            rectMenu1.arcWidth = 10.0;
                            rectMenu1.arcHeight = 10.0;
                            lblMenu1.visible = true;
                            lblMenu1.opacity = 1.0;
                            lblMenu1.layoutX = 4.0;
                            lblMenu1.layoutY = 0.0;
                            __layoutInfo_lblMenu1.width = 220.0;
                            __layoutInfo_lblMenu1.height = 45.0;
                            lblMenu1.text = "             Print Preview";
                            lblMenu1.font = Left_Menu;
                            lblMenu1.textFill = DarkGray;
                            imgMenu1.visible = true;
                            imgMenu1.layoutX = 20.0;
                            imgMenu1.layoutY = 3.5;
                            imgMenu1.image = imagePrint;
                            group1.visible = false;
                            group1.disable = true;
                            group1.layoutY = 47.0;
                            group1.onMouseClicked = rectMenu1OnMouseClickedAtSubMenu;
                            rectMenu2.visible = true;
                            rectMenu2.opacity = 1.0;
                            rectMenu2.layoutX = 8.0;
                            rectMenu2.layoutY = 0.0;
                            rectMenu2.styleClass = "LeftmenuHighlight";
                            rectMenu2.fill = Sandal;
                            rectMenu2.stroke = DarkGray;
                            rectMenu2.strokeWidth = 2.0;
                            rectMenu2.height = 45.0;
                            rectMenu2.arcWidth = 10.0;
                            rectMenu2.arcHeight = 10.0;
                            lblMenu2.visible = true;
                            lblMenu2.layoutX = 4.0;
                            lblMenu2.layoutY = 0.0;
                            __layoutInfo_lblMenu2.width = 220.0;
                            __layoutInfo_lblMenu2.height = 45.0;
                            lblMenu2.text = "             Generic Search";
                            lblMenu2.font = Left_Menu;
                            lblMenu2.textFill = DarkGray;
                            imgMenu2.visible = true;
                            imgMenu2.layoutX = 20.0;
                            imgMenu2.layoutY = 3.5;
                            imgMenu2.image = imageBackup;
                            group2.visible = true;
                            group2.layoutY = 47.0;
                            group2.onMouseClicked = rectMenu2OnMouseClickedAtSubMenu;
                            rectMenu3.visible = true;
                            rectMenu3.opacity = 1.0;
                            rectMenu3.layoutX = 8.0;
                            rectMenu3.layoutY = 0.0;
                            rectMenu3.styleClass = "LeftmenuHighlight";
                            rectMenu3.fill = Sandal;
                            rectMenu3.stroke = DarkGray;
                            rectMenu3.strokeWidth = 2.0;
                            rectMenu3.height = 45.0;
                            rectMenu3.arcWidth = 10.0;
                            rectMenu3.arcHeight = 10.0;
                            lblMenu3.visible = true;
                            lblMenu3.layoutX = 4.0;
                            lblMenu3.layoutY = 0.0;
                            __layoutInfo_lblMenu3.width = 220.0;
                            __layoutInfo_lblMenu3.height = 45.0;
                            lblMenu3.text = "             Practice Mgmt";
                            lblMenu3.font = Left_Menu;
                            lblMenu3.textFill = DarkGray;
                            imgMenu3.visible = true;
                            imgMenu3.layoutX = 20.0;
                            imgMenu3.layoutY = 3.5;
                            imgMenu3.image = imagePrescrb;
                            group3.visible = true;
                            group3.layoutY = 95.0;
                            group3.onMouseClicked = rectMenu3OnMouseClickedAtSubMenu;
                            rectMenu4.visible = true;
                            rectMenu4.opacity = 1.0;
                            rectMenu4.layoutX = 8.0;
                            rectMenu4.layoutY = 0.0;
                            rectMenu4.styleClass = "LeftmenuHighlight";
                            rectMenu4.fill = Sandal;
                            rectMenu4.stroke = DarkGray;
                            rectMenu4.strokeWidth = 2.0;
                            rectMenu4.height = 45.0;
                            rectMenu4.arcWidth = 10.0;
                            rectMenu4.arcHeight = 10.0;
                            lblMenu4.visible = true;
                            lblMenu4.layoutX = 4.0;
                            lblMenu4.layoutY = 0.0;
                            __layoutInfo_lblMenu4.width = 220.0;
                            __layoutInfo_lblMenu4.height = 45.0;
                            lblMenu4.text = "             Import";
                            lblMenu4.font = Left_Menu;
                            lblMenu4.textFill = DarkGray;
                            imgMenu4.visible = true;
                            imgMenu4.layoutX = 20.0;
                            imgMenu4.layoutY = 3.5;
                            group4.visible = false;
                            group4.layoutY = 191.0;
                            group4.onMouseClicked = rectMenu4OnMouseClickedAtSubMenu;
                            rectMenu5.visible = true;
                            rectMenu5.opacity = 1.0;
                            rectMenu5.layoutX = 8.0;
                            rectMenu5.layoutY = 0.0;
                            rectMenu5.styleClass = "LeftmenuHighlight";
                            rectMenu5.fill = Sandal;
                            rectMenu5.stroke = DarkGray;
                            rectMenu5.strokeWidth = 2.0;
                            rectMenu5.height = 45.0;
                            rectMenu5.arcWidth = 10.0;
                            rectMenu5.arcHeight = 10.0;
                            lblMenu5.visible = true;
                            lblMenu5.layoutX = 4.0;
                            lblMenu5.layoutY = 0.0;
                            __layoutInfo_lblMenu5.width = 220.0;
                            __layoutInfo_lblMenu5.height = 45.0;
                            lblMenu5.text = "             Export";
                            lblMenu5.font = Left_Menu;
                            lblMenu5.textFill = DarkGray;
                            imgMenu5.visible = true;
                            imgMenu5.layoutX = 20.0;
                            imgMenu5.layoutY = 3.5;
                            group5.visible = false;
                            group5.layoutY = 239.0;
                            group5.onMouseClicked = rectMenu5OnMouseClickedAtSubMenu;
                            rectMenu6.visible = true;
                            rectMenu6.opacity = 1.0;
                            rectMenu6.layoutX = 8.0;
                            rectMenu6.layoutY = 0.0;
                            rectMenu6.styleClass = "LeftmenuHighlight";
                            rectMenu6.fill = Sandal;
                            rectMenu6.stroke = DarkGray;
                            rectMenu6.strokeWidth = 2.0;
                            rectMenu6.height = 45.0;
                            rectMenu6.arcWidth = 10.0;
                            rectMenu6.arcHeight = 10.0;
                            lblMenu6.visible = true;
                            lblMenu6.layoutX = 4.0;
                            lblMenu6.layoutY = 0.0;
                            __layoutInfo_lblMenu6.width = 220.0;
                            __layoutInfo_lblMenu6.height = 45.0;
                            lblMenu6.text = "             Exit";
                            lblMenu6.font = Left_Menu;
                            lblMenu6.textFill = DarkGray;
                            imgMenu6.visible = true;
                            imgMenu6.layoutX = 20.0;
                            imgMenu6.layoutY = 3.5;
                            group6.visible = true;
                            group6.layoutY = 191.0;
                            group6.onMouseClicked = rectMenu6OnMouseClickedAtSubMenu;
                            rectMenu8.visible = true;
                            rectMenu8.cursor = null;
                            rectMenu8.layoutX = 8.0;
                            rectMenu8.styleClass = "LeftmenuHighlight";
                            rectMenu8.fill = Sandal;
                            rectMenu8.stroke = DarkGray;
                            rectMenu8.strokeWidth = 2.0;
                            rectMenu8.height = 45.0;
                            rectMenu8.arcWidth = 10.0;
                            rectMenu8.arcHeight = 10.0;
                            lblMenu8.visible = true;
                            lblMenu8.layoutX = 4.0;
                            lblMenu8.layoutY = 0.0;
                            __layoutInfo_lblMenu8.width = 220.0;
                            __layoutInfo_lblMenu8.height = 45.0;
                            lblMenu8.text = "             Label Print";
                            lblMenu8.font = Left_Menu;
                            lblMenu8.textFill = DarkGray;
                            imgMenu8.visible = true;
                            imgMenu8.layoutX = 20.0;
                            imgMenu8.layoutY = 3.5;
                            imgMenu8.image = imageLabelPrinter;
                            group7.visible = true;
                            group7.layoutY = 143.0;
                            group7.onMouseClicked = rectMenu8OnMouseClickedAtSubMenu;
                            rectMenu7.visible = false;
                            rectMenu7.opacity = 1.0;
                            rectMenu7.layoutX = 8.0;
                            rectMenu7.layoutY = 335.0;
                            rectMenu7.styleClass = "LeftmenuHighlight";
                            rectMenu7.onMouseClicked = rectMenu7OnMouseClickedAtSubMenu;
                            rectMenu7.fill = Sandal;
                            rectMenu7.stroke = DarkGray;
                            rectMenu7.strokeWidth = 2.0;
                            rectMenu7.height = 45.0;
                            rectMenu7.arcWidth = 10.0;
                            rectMenu7.arcHeight = 10.0;
                            imgMenu7.visible = false;
                            imgMenu7.layoutX = 20.0;
                            imgMenu7.layoutY = 338.5;
                            imgMenu7.image = Image {url: "{__DIR__}images/Exit.png"};
                            lblMenu7.visible = false;
                            lblMenu7.layoutX = 4.0;
                            lblMenu7.layoutY = 335.0;
                            __layoutInfo_lblMenu7.width = 220.0;
                            __layoutInfo_lblMenu7.height = 45.0;
                            lblMenu7.text = "             Exit";
                            lblMenu7.font = Left_Menu;
                            lblMenu7.textFill = DarkGray;
                            panelHomeForm.visible = true;
                            panelHomeForm.layoutX = 232.0;
                            panelHomeForm.layoutY = -2.0;
                            imgClose.visible = false;
                            imgClose.onMouseClicked = imgCloseOnMouseClicked;
                            imgClose.onMouseEntered = imgCloseOnMouseEntered;
                            imgClose.onMouseExited = imgCloseOnMouseExited;
                            panelHomeSubMenu.visible = true;
                            panelMsgBox.visible = true;
                            panel.visible = true;
                        }
                    }
                    javafx.animation.KeyFrame {
                        time: 100ms
                        values: [
                            rectMenu1.fill => Sandal tween javafx.animation.Interpolator.EASEBOTH,
                        ]
                    }
                ]
            }
        ]
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel, ]
    }
    // </editor-fold>//GEN-END:main
        var Error_Msg="Access is denied! :Current user does not have appropriate access permissions.";
        var CloseForm:Boolean;
    def MessageBox=MessageBox{};
    
    var imgCancelLX=bind CommonDeclare.panelFormW+207;
    function imgCloseOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        CloseForm=true;
        Msgbox("Confirm",CommonDeclare.exitForm_msg);
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
 var msgOutput:Integer=bind MessageBox.msgboxOutput  on replace {
       if(msgOutput==1 and CloseForm==true and CommonDeclare.currModule==1){
        delete panelHomeForm.content;
        imgClose.visible=false;
        CommonDeclare.form[0]=0;
     }
     CloseForm=false;     
 }
    function rectMenu7OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
        HomeModule = 7;
//        MessageBox.MsgBox("SubMenuHome", "Confirm", "Do you want to Exit Medeil?");
//        panelMsgBox.visible = true;
    }

    function rectMenu6OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
        deleteForm(6);
        exit=false;
            if(exit==false){
                exit=true;
           }

}

    function rectMenu5OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
        Msgbox("Information", Error_Msg);
    }

    function rectMenu4OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
        Msgbox("Information", Error_Msg);
    }
    
    public function showPrescrption() : Void {
        var PrescriptionFormat : PrescriptionFormat =null ;
        //if(getpracticeAccess() ){
         //   deleteForm(2);
            PrescriptionFormat = new PrescriptionFormat();
            PrescriptionFormat.MainPanel.disable = false;
            insert PrescriptionFormat.getDesignRootNodes() into panelHomeForm.content;
            PrescriptionFormat.StartUp();
       // } else {
           // PrescriptionFormat.MainPanel.disable = true;
       // }
    }
    public function showGSearch() : Void {
        // Msgbox("Information", Error_Msg);
        deleteForm(1);
       def GenericSearch=GenericSearch{};
//       panelHomeForm.disable = false;
        insert GenericSearch.getDesignRootNodes() into panelHomeForm.content;
       GenericSearch.StartUp();
    }

    function rectMenu3OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
        showPrescrption();
    }
    function rectMenu2OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
       showGSearch();
    }
    
    
    function Msgbox(type: String, Message: String): Void {
        panelMsgBox.visible = true;
        MessageBox.MsgBox("Medeil", type, Message);
        delete  panelMsgBox.content;
        insert MessageBox.getDesignRootNodes() into panelMsgBox.content;
    }
    function rectMenu1OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
    }
    public function deleteForm(module:Integer): Void {
        delete  panelHomeForm.content;
        imgClose.visible=true;
        HomeModule=module;
    }



//Added start on 23/12/2014

        public var userType: String = bind CommonDeclare.userType;


    public function labelPrintSettings(): Void {
        if (userType.equals("Admin") or userType.equals("SuperAdmin")) {
            deleteForm(1);
            def LabelPrintSettings = LabelPrintSettings {};
            insert LabelPrintSettings.getDesignRootNodes() into panelHomeForm.content;
            LabelPrintSettings.Startup();
        } else {
            Msgbox("Information", "Access Security: Current user does not have enough privilege to access Bill Print Setup. ");
        }
    }

    function rectMenu8OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
        labelPrintSettings();
    }
 //Added End on 23/12/2014

    function getpracticeAccess() : Boolean {
        var isAccess = false;
        var  getUserInfo = new GetUserInfo();
        var homeAccess = getUserInfo.getPrivileges("home",user);
        
//        var access_warn = "Current user does not have appropriate access permissions.";
        var access_warn = "will you know more about MEDEIL-Plus to visit our website";
        if((homeAccess.split(",")[1] == "4")){
            isAccess = true;
        } else {
            isAccess = false;
            var messageBox1= new MessageBox();
            Msgbox("Information", access_warn);
            panelMsgBox.visible=true;
            messageBox1.MsgBox("Medeil","Confirm",access_warn);
            delete panelMsgBox.content;
            insert messageBox1.getDesignRootNodes() into panelMsgBox.content;
            messageBox1.btnYes.requestFocus();
            var msgOutput1:Integer=bind messageBox1.msgboxOutput  on replace {
               if(msgOutput1==1 and CommonDeclare.currModule==1){
                try {
                    java.awt.Desktop.getDesktop().browse(java.net.URI.create("http://www.vanuston.com"));
               } catch(e:Exception){
                    e.printStackTrace();
               }
             }
             
            }
        }
        return isAccess;

    }
}

