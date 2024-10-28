
package com.vanuston.medeil.ui;

import javafx.scene.image.Image;
import javafx.scene.layout.LayoutInfo;
import com.vanuston.medeil.util.CommonDeclare;
import javafx.scene.layout.Panel;
import com.vanuston.medeil.util.Logger;
import javafx.scene.control.ToggleButton;
import javafx.scene.control.Tooltip;
import javafx.scene.input.MouseEvent;
import javafx.animation.Interpolator;
import javafx.animation.Timeline;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import javafx.scene.input.KeyCode;
import javafx.scene.input.KeyEvent;
public class SalesCash {
public var salesCashModule:Integer = 0;
var panelW = bind CommonDeclare.panelFormW;
var panelH = bind CommonDeclare.panelFormH;

var form:SalesCash1[];
public var count=0;

var currForm=0;

var temp=bind currForm on replace{
    if(temp==form.size()){
        imgCloseVisible=true;
    }else{
        imgCloseVisible=false;
    }
}
var imgCloseVisible:Boolean=false;
var commonController : CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;

var SalesFormTitle:String="Sales Bill-1 - ctrl+S";
var log: Logger = Logger.getLogger(SalesCash.class,"SalesCash");
var imgCancelLX=bind panelW-32;
var CloseForm:Boolean;
def MessageBox=MessageBox{};
    var panelMsgBoxLX= bind ((CommonDeclare.panelFormW-500)/2);
    var panelMsgBoxLY= bind ((CommonDeclare.panelFormH-150)/2);
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        disable: true
        focusTraversable: false
    }
    
    def __layoutInfo_btnAdd: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnAdd: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutInfo: __layoutInfo_btnAdd
        focusTraversable: true
        text: "Button"
    }
    
    public-read def hbox: javafx.scene.layout.HBox = javafx.scene.layout.HBox {
        visible: false
        content: [ btnAdd, ]
        spacing: 6.0
    }
    
    public-read def panelMsgBox: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelMsgBoxLX
        layoutY: bind panelMsgBoxLY
    }
    
    public-read def Violet: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.011764706
        green: 0.5019608
        blue: 0.7607843
    }
    
    public-read def linearGradient: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#ffffff") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#f5f0e9") }, ]
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
        name: "Arial "
        size: 25.0
    }
    
    def __layoutInfo_label: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW-50
    }
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 1.0
        layoutInfo: __layoutInfo_label
        styleClass: "labelFormHeading"
        text: bind SalesFormTitle
        font: Arial_25
    }
    
    public-read def DarkGray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.2
        blue: 0.2
    }
    
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 1.0
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "form-background"
        fill: linearGradient
        stroke: DarkGray
        width: bind panelW
        height: bind panelH
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def reflectionEffect2: javafx.scene.effect.Reflection = javafx.scene.effect.Reflection {
    }
    
    public-read def linearGradient2: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
    }
    
    public-read def linearGradientHeader: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
    }
    
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 0.25
        layoutY: 0.0
        styleClass: "rectFormHeader"
        fill: linearGradientHeader
        width: bind panelW
        height: 32.0
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Close.png"
    }
    
    public-read def imgClose: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: bind imgCloseVisible
        opacity: bind opacClose
        layoutX: bind imgCancelLX
        layoutY: 100.0
        image: image
    }
    
    public-read def panelTab: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        content: [ hbox, imgClose, ]
    }
    
    public-read def panelMain: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ rectangle, rectHeader, label, panel, panelTab, ]
    }
    
    public-read def panelBg: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ panelMain, panelMsgBox, ]
    }
    
    public-read def Arial_Bold_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
    }
    
    public-read def dropShadowEffect: javafx.scene.effect.DropShadow = javafx.scene.effect.DropShadow {
    }
    
    public-read def imageLogo: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/LogoMedil.png"
    }
    
    public-read def Arial_18: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 18.0
    }
    
    public-read def imageClose: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Close.png"
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
                            rectangle.strokeWidth = 1.0;
                            rectangle.arcWidth = 5.0;
                            rectangle.arcHeight = 5.0;
                            rectHeader.visible = true;
                            rectHeader.layoutX = 0.0;
                            rectHeader.fill = linearGradient2;
                            rectHeader.height = 32.0;
                            rectHeader.arcWidth = 5.0;
                            rectHeader.arcHeight = 5.0;
                            label.visible = true;
                            label.layoutX = 0.0;
                            label.effect = null;
                            label.font = Arial_25;
                            label.textAlignment = javafx.scene.text.TextAlignment.RIGHT;
                            label.hpos = javafx.geometry.HPos.RIGHT;
                            label.textFill = javafx.scene.paint.Color.BLACK;
                            panel.visible = true;
                            panel.disable = false;
                            panel.focusTraversable = false;
                            btnAdd.visible = true;
                            __layoutInfo_btnAdd.height = 30.0;
                            btnAdd.focusTraversable = true;
                            btnAdd.text = "+";
                            btnAdd.font = Arial_Bold_20;
                            btnAdd.action = btnAddActionAtShown;
                            hbox.visible = true;
                            hbox.layoutY = 0.0;
                            hbox.spacing = 0.0;
                            imgClose.layoutY = 2.0;
                            imgClose.onMouseClicked = imgCloseOnMouseClickedAtShown;
                            imgClose.onMouseEntered = imgCloseOnMouseEntered;
                            imgClose.onMouseExited = imgCloseOnMouseExited;
                            panelTab.visible = true;
                            panelTab.layoutX = 6.0;
                            panelTab.layoutY = 0.0;
                            panelMain.visible = true;
                            panelMain.focusTraversable = false;
                            panelMsgBox.visible = true;
                            panelMsgBox.disable = false;
                            panelBg.visible = true;
                            panelBg.focusTraversable = false;
                            reflectionEffect2.topOpacity = 0.17;
                            reflectionEffect2.bottomOpacity = 0.0;
                            reflectionEffect2.fraction = 0.72;
                        }
                    }
                ]
            }
        ]
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panelBg, ]
    }
    // </editor-fold>//GEN-END:main

    

    function imgCloseOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        imgCloseAction();
    }

    function imgCloseAction(): Void {
        CloseForm=true;
        MessageBox.MsgBox("Medeil","Confirm",CommonDeclare.exitForm_msg);
        delete panelMsgBox.content;
        insert MessageBox.getDesignRootNodes() into panelMsgBox.content;

         }
//         var hotKeyAdd = bind frm.hotKeyAddBill on replace {
//            if(hotKeyAdd){
//                btnAddActionAtShown();
//            }
//         }
//         var hotKeyClose = bind frm.hotKeyCloseBill on replace {
//            if(hotKeyClose){
//                imgCloseAction();
//            }
//         }

//    public function shortcut(event: javafx.scene.input.KeyEvent): Void {
//        if (event.code == KeyCode.VK_N ) {
//            if(event.altDown){
////                hotKeyAdd = true;
//                btnAddActionAtShown();
//            }
//        }
//        if(event.code == KeyCode.VK_F4 ) {
//            if(event.controlDown){
//                imgCloseAction();
//            }
//        }
//    }

     var frm : SalesCash1;
    function btnAddActionAtShown(): Void {        
    var productType = commonController.getProductType();
           if(count<20 and (productType.equals("Professional") or productType.equals("Standard")or productType.equals("Trial")) ){
            panel.disable = false;
            delete panel.content;
            form[count]=SalesCash1{};
            frm=form[count];
            insert frm.getDesignRootNodes() into panel.content;
            frm.StartUp();
            delete btnAdd from hbox.content;
            hbox.content=[hbox.content,create(),btnAdd];            
         } else if (count<5 and productType.equals("Express")) {
            delete panel.content;
            form[count]=SalesCash1{};
            frm=form[count];
            insert frm.getDesignRootNodes() into panel.content;
            frm.StartUp();
            delete btnAdd from hbox.content;
            hbox.content=[hbox.content,create(),btnAdd];
         } else if (count<1 and productType.equals("Free")) {
            delete panel.content;
            form[count]=SalesCash1{};
            frm=form[count];
            insert frm.getDesignRootNodes() into panel.content;
            frm.StartUp();
            delete btnAdd from hbox.content;
            hbox.content=[hbox.content,create(),btnAdd];
         }
         panel.disable = false;         
         }
    function create(): ToggleButton {        
        count++;
        if (count < 1) {
            count = 1;
        }
        var tip = Tooltip {
                    text: "Bill {count}  "
                    font: Arial_Bold_12
        }
        var tgl: ToggleButton = ToggleButton {
                    text: "{count}"
                    font: Arial_Bold_20
                    toggleGroup: toggleGroup
                    tooltip: tip
                    onMouseClicked: function(e: MouseEvent): Void {

                        Load(Integer.parseInt(tgl.text) - 1);
                        tgl.selected = true;
                        currForm = Integer.parseInt(tgl.text);
                    }
//                    onKeyPressed: function (e: KeyEvent) : Void {

//                        if(hotKeyAdd){
//                            hotKeyAdd = false;
//                                Load(Integer.parseInt(tgl.text) - 1);
//                                tgl.selected = true;
//                                currForm = Integer.parseInt(tgl.text);
//                        }
//                    }
        }
        return tgl;
    }
    function Load(index:Integer): Void { //On the second form onwards        
        try {
            delete  panel.content;
            var n = index;
            if(index<0) {
                n = 0;
            }
            SalesFormTitle = "Sales Bill-{n + 1} - ctrl+S";
            insert form[index].getDesignRootNodes() into panel.content;
            form[index].StartUp();
         } catch (e) {
             log.debug(" Class : SalesCash   Method: Load()   Exception : {e.getMessage()}");
         }
    }
 var opacClose=0.5;
 var fadeClose = Timeline {
     keyFrames: [
         at(0s) { opacClose => 0.5 tween Interpolator.LINEAR },
         at(0.1s) { opacClose => 1.0 tween Interpolator.LINEAR },
         ]
  };
    
    var panelAlertLX = bind ((panelW - 500) / 2)+ 75   ;
    var panelAlertLY = bind ( (panelH - 150) / 2) + 100 ;
    var freeEdtCheck = bind frm.getAutoVal on replace {        
        freeRestrict();
    }

    var freeBillCount = commonController.freeBillCount();//Free Edition alert
    
    function imgCloseOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        fadeClose.rate = -1.0;
        fadeClose.play();
         }
    function imgCloseOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        fadeClose.rate = 1.0;
        fadeClose.play();
         }
    var msgOutput: Integer = bind MessageBox.msgboxOutput on replace {
        if (msgOutput == 1 and CloseForm == true and CommonDeclare.currModule == 2) {
            cancelForm();
        }
        CloseForm = false;
    }
    function cancelForm(): Void {
        try {
            if (count > 0) {
                count--;
                delete  form[count];
                Load(count - 1);
                delete  hbox.content[count];
            }
            if (count == 0) {
                panelBg.visible = false;
                CommonDeclare.form[1] = 0;
            }
        } catch (e) {
            log.debug(" Class : SalesCash   Method: cancelForm()   Exception : {e.getMessage()}");
        }
    }
     public function freeRestrict() : Boolean {
        var isReach : Boolean = false;
        commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
        freeBillCount = commonController.freeBillCount();
        panelMain.disable = false;
        if (freeBillCount >= CommonDeclare.freeLimit) {
            var msg = "You have reached a maximum limit of {CommonDeclare.freeLimit} invoices in MEDEIL - FREE Edition. To continue billing, please purchase/upgrade to the latest edition";
            MessageBox.MsgBox("Medeil - Sales","Warning",msg);
            delete panelMsgBox.content;
            insert MessageBox.getDesignRootNodes() into panelMsgBox.content;
            panel.disable = true;
            panelMain.disable = true;
        } else if ( freeBillCount > 0 and freeBillCount - ((freeBillCount/50) * 50) == 0) { //every 50th bill reminder
            var msg = "You have reached {freeBillCount} out of {CommonDeclare.freeLimit} invoices. For unlimited invoices, please purchase/upgrade to the latest edition";
            MessageBox.MsgBox("Medeil - Sales","Information",msg);
            delete panelMsgBox.content;
            insert MessageBox.getDesignRootNodes() into panelMsgBox.content;
        } else if ( freeBillCount >= ((CommonDeclare.freeLimit * 90) / 100) and (((freeBillCount / CommonDeclare.freeLimit) * 100) mod 2 == 0)) {
            var msg = "You have reached {freeBillCount} out of {CommonDeclare.freeLimit} invoices. For unlimited invoices, please purchase/upgrade to the latest edition";
            MessageBox.MsgBox("Medeil - Sales","Information",msg);
            delete panelMsgBox.content;
            insert MessageBox.getDesignRootNodes() into panelMsgBox.content;
        } else {
            isReach = true;
        }
        return isReach;
    }
    public function startUp(): Void {
        freeRestrict();
        btnAdd.requestFocus();        
        if(count == 0) {
            panelBg.visible=true;
            delete panel.content;
            btnAddActionAtShown();
        }
        frm.initFocus = true;
    }

}

