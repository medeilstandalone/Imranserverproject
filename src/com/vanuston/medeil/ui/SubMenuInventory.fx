package com.vanuston.medeil.ui;

import javafx.scene.image.ImageView;
import javafx.scene.image.Image;
import com.vanuston.medeil.util.CommonDeclare;
import javafx.animation.Interpolator;
import javafx.animation.Timeline;
import com.vanuston.medeil.util.GetUserInfo;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.util.RegistryConstants;

public class SubMenuInventory {

    var invModule: Integer = 0 on replace {
        CommonDeclare.form[2] = invModule;
    }
    var commonController : CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    var Purchase = Purchase {};
    def PurchaseOrder = PurchaseOrder {};
    def PurchaseReturn = PurchaseReturn {};
    def DamageStock = DamageStock {};
    def ExpiryReturn = ExpiryReturn {};
    def SendPurchaseOrder = SendPurchaseOrder {};
    def Stock = Stock {};
    var user = bind CommonDeclare.user on replace {
        setPrivillages(user);
    }
    def rectMenuWidth = 219.5;
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
        layoutX: 63.0
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
        styleClass: "LeftmenuHighlight"
        width: bind rectMenuWidth
        height: 50.0
    }
    
    def __layoutInfo_lblMenu6: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblMenu6: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutInfo: __layoutInfo_lblMenu6
        text: "Label"
    }
    
    public-read def rectMenu7: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        styleClass: "LeftmenuHighlight"
        width: bind rectMenuWidth
        height: 50.0
    }
    
    def __layoutInfo_lblMenu7: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblMenu7: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutInfo: __layoutInfo_lblMenu7
        text: "Label"
    }
    
    public-read def panelInvForm: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: 226.0
        layoutY: 0.0
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
    
    public-read def image1: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Purchase Order.png"
    }
    
    public-read def imgMenu1: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 60.0
        image: image1
    }
    
    public-read def group1: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableInv[0]!=true
        disable: bind DisableInventory[0]
        layoutY: bind rectMenuY[0]
        content: [ rectMenu1, lblMenu1, imgMenu1, ]
    }
    
    public-read def image2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Purchase1.png"
    }
    
    public-read def imgMenu2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 109.0
        image: image2
    }
    
    public-read def group2: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableInv[1]!=true
        disable: bind DisableInventory[1]
        layoutY: bind group1.layoutY+rectMenuY[1]
        content: [ rectMenu2, lblMenu2, imgMenu2, ]
    }
    
    public-read def image3: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/PurchaseReturn.png"
    }
    
    public-read def imgMenu3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 157.0
        image: image3
    }
    
    public-read def group3: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableInv[2]!=true
        disable: bind DisableInventory[2]
        layoutY: bind group2.layoutY+rectMenuY[2]
        content: [ rectMenu3, lblMenu3, imgMenu3, ]
    }
    
    public-read def image4: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Stock.png"
    }
    
    public-read def imgMenu4: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 207.0
        image: image4
    }
    
    public-read def group4: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableInv[3]!=true
        disable: bind DisableInventory[3]
        layoutY: bind group3.layoutY+rectMenuY[3]
        content: [ rectMenu4, lblMenu4, imgMenu4, ]
    }
    
    public-read def image5: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/DamageStock.png"
    }
    
    public-read def imgMenu5: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 252.0
        image: image5
    }
    
    public-read def group5: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableInv[4]!=true
        disable: bind DisableInventory[4]
        layoutY: bind group4.layoutY+rectMenuY[4]
        content: [ rectMenu5, lblMenu5, imgMenu5, ]
    }
    
    public-read def image6: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Expiry Return.png"
    }
    
    public-read def imgMenu6: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        image: image6
    }
    
    public-read def group6: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableInv[5]!=true
        disable: bind DisableInventory[5]
        layoutY: bind group5.layoutY+rectMenuY[5]
        onMouseClicked: groupMenu6OnMouseClicked
        content: [ rectMenu6, lblMenu6, imgMenu6, ]
    }
    
    public-read def image7: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Send Purchase Order.png"
    }
    
    public-read def imgMenu7: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        image: image7
    }
    
    public-read def group7: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableInv[6]!=true
        disable: bind DisableInventory[6]
        layoutY: bind group6.layoutY+rectMenuY[6]
        onMouseClicked: groupMenu7OnMouseClicked
        content: [ rectMenu7, lblMenu7, imgMenu7, ]
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
    
    public-read def panelInventorySubMenu: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        disable: bind CloseForm
        layoutX: 0.0
        layoutY: 0.0
        content: [ group1, group2, group3, group4, group5, group6, group7, panelInvForm, imgClose, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ panelInventorySubMenu, panelMsgBox, ]
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "SubMenu", ]
        actual: 0
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectMenu1.visible = true;
                            rectMenu1.opacity = 1.0;
                            rectMenu1.layoutX = 0.0;
                            rectMenu1.layoutY = 0.0;
                            rectMenu1.styleClass = "LeftmenuHighlight";
                            rectMenu1.onMouseClicked = rectMenu1OnMouseClickedAtSubMenu;
                            rectMenu1.fill = Sandal;
                            rectMenu1.stroke = DarkGray;
                            rectMenu1.strokeWidth = 2.0;
                            rectMenu1.height = 45.0;
                            rectMenu1.arcWidth = 10.0;
                            rectMenu1.arcHeight = 10.0;
                            lblMenu1.visible = true;
                            lblMenu1.layoutX = 0.0;
                            lblMenu1.layoutY = 0.0;
                            __layoutInfo_lblMenu1.width = 220.0;
                            __layoutInfo_lblMenu1.height = 45.0;
                            lblMenu1.text = "             Purchase Order";
                            lblMenu1.font = Left_Menu;
                            lblMenu1.textFill = DarkGray;
                            imgMenu1.visible = true;
                            imgMenu1.layoutX = 12.0;
                            imgMenu1.layoutY = 3.5;
                            imgMenu1.image = Image {url: "{__DIR__}images/Purchase Order.png"};
                            group1.layoutX = 8.0;
                            rectMenu2.visible = true;
                            rectMenu2.opacity = 1.0;
                            rectMenu2.layoutX = 0.0;
                            rectMenu2.layoutY = 0.0;
                            rectMenu2.styleClass = "LeftmenuHighlight";
                            rectMenu2.onMouseClicked = rectMenu2OnMouseClickedAtSubMenu;
                            rectMenu2.fill = Sandal;
                            rectMenu2.stroke = DarkGray;
                            rectMenu2.strokeWidth = 2.0;
                            rectMenu2.height = 45.0;
                            rectMenu2.arcWidth = 10.0;
                            rectMenu2.arcHeight = 10.0;
                            lblMenu2.visible = true;
                            lblMenu2.layoutX = 0.0;
                            lblMenu2.layoutY = 0.0;
                            __layoutInfo_lblMenu2.width = 220.0;
                            __layoutInfo_lblMenu2.height = 45.0;
                            lblMenu2.text = "             Purchase Invoice";
                            lblMenu2.font = Left_Menu;
                            lblMenu2.textFill = DarkGray;
                            imgMenu2.visible = true;
                            imgMenu2.layoutX = 12.0;
                            imgMenu2.layoutY = 3.5;
                            group2.layoutX = 8.0;
                            rectMenu3.visible = true;
                            rectMenu3.opacity = 1.0;
                            rectMenu3.layoutX = 0.0;
                            rectMenu3.layoutY = 0.0;
                            rectMenu3.styleClass = "LeftmenuHighlight";
                            rectMenu3.onMouseClicked = rectMenu3OnMouseClickedAtSubMenu;
                            rectMenu3.fill = Sandal;
                            rectMenu3.stroke = DarkGray;
                            rectMenu3.strokeWidth = 2.0;
                            rectMenu3.height = 45.0;
                            rectMenu3.arcWidth = 10.0;
                            rectMenu3.arcHeight = 10.0;
                            lblMenu3.visible = true;
                            lblMenu3.layoutX = 0.0;
                            lblMenu3.layoutY = 0.0;
                            __layoutInfo_lblMenu3.width = 220.0;
                            __layoutInfo_lblMenu3.height = 45.0;
                            lblMenu3.text = "             Purchase Return";
                            lblMenu3.font = Left_Menu;
                            lblMenu3.textFill = DarkGray;
                            imgMenu3.visible = true;
                            imgMenu3.layoutX = 12.0;
                            imgMenu3.layoutY = 3.5;
                            group3.layoutX = 8.0;
                            rectMenu4.visible = true;
                            rectMenu4.opacity = 1.0;
                            rectMenu4.layoutX = 0.0;
                            rectMenu4.layoutY = 0.0;
                            rectMenu4.styleClass = "LeftmenuHighlight";
                            rectMenu4.onMouseClicked = rectMenu4OnMouseClickedAtSubMenu;
                            rectMenu4.fill = Sandal;
                            rectMenu4.stroke = DarkGray;
                            rectMenu4.strokeWidth = 2.0;
                            rectMenu4.height = 45.0;
                            rectMenu4.arcWidth = 10.0;
                            rectMenu4.arcHeight = 10.0;
                            lblMenu4.visible = true;
                            lblMenu4.layoutX = 0.0;
                            lblMenu4.layoutY = 0.0;
                            __layoutInfo_lblMenu4.width = 220.0;
                            __layoutInfo_lblMenu4.height = 45.0;
                            lblMenu4.text = "             Stock";
                            lblMenu4.font = Left_Menu;
                            lblMenu4.textFill = DarkGray;
                            imgMenu4.visible = true;
                            imgMenu4.layoutX = 12.0;
                            imgMenu4.layoutY = 3.5;
                            group4.layoutX = 8.0;
                            rectMenu5.visible = true;
                            rectMenu5.opacity = 1.0;
                            rectMenu5.layoutX = 0.0;
                            rectMenu5.layoutY = 0.0;
                            rectMenu5.styleClass = "LeftmenuHighlight";
                            rectMenu5.onMouseClicked = rectMenu5OnMouseClickedAtSubMenu;
                            rectMenu5.fill = Sandal;
                            rectMenu5.stroke = DarkGray;
                            rectMenu5.strokeWidth = 2.0;
                            rectMenu5.height = 45.0;
                            rectMenu5.arcWidth = 10.0;
                            rectMenu5.arcHeight = 10.0;
                            lblMenu5.visible = true;
                            lblMenu5.layoutX = 0.0;
                            lblMenu5.layoutY = 0.0;
                            __layoutInfo_lblMenu5.width = 220.0;
                            __layoutInfo_lblMenu5.height = 45.0;
                            lblMenu5.text = "             Damaged Stock";
                            lblMenu5.font = Left_Menu;
                            lblMenu5.textFill = DarkGray;
                            imgMenu5.visible = true;
                            imgMenu5.layoutX = 12.0;
                            imgMenu5.layoutY = 3.5;
                            group5.layoutX = 8.0;
                            rectMenu6.visible = true;
                            rectMenu6.fill = Sandal;
                            rectMenu6.stroke = DarkGray;
                            rectMenu6.strokeWidth = 2.0;
                            rectMenu6.height = 45.0;
                            rectMenu6.arcWidth = 10.0;
                            rectMenu6.arcHeight = 10.0;
                            lblMenu6.visible = true;
                            __layoutInfo_lblMenu6.width = 220.0;
                            __layoutInfo_lblMenu6.height = 45.0;
                            lblMenu6.text = "             Expiry Return";
                            lblMenu6.font = Left_Menu;
                            lblMenu6.textFill = DarkGray;
                            imgMenu6.visible = true;
                            imgMenu6.layoutX = 12.0;
                            imgMenu6.layoutY = 3.5;
                            group6.layoutX = 8.0;
                            rectMenu7.visible = true;
                            rectMenu7.stroke = DarkGray;
                            rectMenu7.strokeWidth = 2.0;
                            rectMenu7.height = 45.0;
                            rectMenu7.arcWidth = 10.0;
                            rectMenu7.arcHeight = 10.0;
                            lblMenu7.visible = true;
                            __layoutInfo_lblMenu7.width = 220.0;
                            __layoutInfo_lblMenu7.height = 45.0;
                            lblMenu7.text = "             Send Pur.Order";
                            lblMenu7.font = Left_Menu;
                            lblMenu7.textFill = DarkGray;
                            imgMenu7.visible = true;
                            imgMenu7.layoutX = 12.0;
                            imgMenu7.layoutY = 3.5;
                            group7.layoutX = 8.0;
                            panelInvForm.visible = true;
                            panelInvForm.layoutX = 232.0;
                            panelInvForm.layoutY = -2.0;
                            imgClose.visible = false;
                            imgClose.onMouseClicked = imgCloseOnMouseClicked;
                            imgClose.onMouseEntered = imgCloseOnMouseEntered;
                            imgClose.onMouseExited = imgCloseOnMouseExited;
                            panelInventorySubMenu.visible = true;
                            panelMsgBox.visible = true;
                            panel.visible = true;
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

    var rectMenuY: Number[];
    var DisableInv: Boolean[];
     var DisableInventory: Boolean[];

    var imgCancelLX = bind CommonDeclare.panelFormW + 207;
    var panelMsgBoxLX = bind ((CommonDeclare.panelFormW - 500) / 2) + 207;
    var panelMsgBoxLY = bind ((CommonDeclare.panelFormH - 150) / 2) - 100;
    def MessageBox = MessageBox {};
    var CloseForm: Boolean;
    var Invform = bind CommonDeclare.form[2] on replace {
        closeVisible(Invform);
    }
    var Invform1= bind Purchase.panelAdjDiff.visible on replace {
        imgClose.visible=not Invform1;
    }
    public function Msgbox(): Void {
        MessageBox.MsgBox("Medeil", "Information", CommonDeclare.access_deny_msg);
        delete  panelMsgBox.content;
        insert MessageBox.getDesignRootNodes() into panelMsgBox.content;
    }
    public function editionAlert(): Void {
            MessageBox.MsgBox("Medeil","Information",CommonDeclare.edition_msg);
            delete panelMsgBox.content;
            insert MessageBox.getDesignRootNodes() into panelMsgBox.content;
        }
    function closeVisible(i: Integer): Void {

        if (i == 0) {
            imgClose.visible = false;
            delete  panelInvForm.content;
        } else {
            imgClose.visible = true;
        }
    }

    function imgCloseOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {

        CloseForm = true;
        MessageBox.MsgBox("Medeil", "Confirm", "Are you sure you want to close current form?");
        delete  panelMsgBox.content;
        insert MessageBox.getDesignRootNodes() into panelMsgBox.content;
    }

    function imgCloseOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        fadeClose.rate = -1.0;
        fadeClose.play();
    }

    function imgCloseOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        fadeClose.rate = 1.0;
        fadeClose.play();
    }

    var opacClose = 0.5;
    var fadeClose = Timeline {
                keyFrames: [
                    at (0s) {opacClose => 0.5 tween Interpolator.LINEAR},
                    at (0.1s) {opacClose => 1.0 tween Interpolator.LINEAR},
                ]
            };
    var msgOutput: Integer = bind MessageBox.msgboxOutput on replace {
        if (msgOutput == 1 and CloseForm == true and CommonDeclare.currModule == 3) {
            delete  panelInvForm.content;
            imgClose.visible = false;
            CommonDeclare.form[2] = 0;
        }
        CloseForm = false;
    }

    function groupMenu7OnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        sendPurchaseOrderReturnLoad();
    }
    function groupMenu6OnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        expiryReturnLoad();
    }
    function rectMenu5OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
        damageStockLoad();
    }
    function rectMenu4OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
        stockLoad();
    }
    function rectMenu3OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
     purchaseReturnLoad();
    }
    function rectMenu2OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
        purchaseLoad();
    }
    function rectMenu1OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
      purchaseOrderLoad();
    }

    public function sendPurchaseOrderReturnLoad(): Void {
        if (commonController.getProductType().equals("Free")) {
            editionAlert();
        } else if(DisableInv[6]){
            Msgbox();
        } else {
            deleteForm(7);
            insert SendPurchaseOrder.getDesignRootNodes() into panelInvForm.content;
            SendPurchaseOrder.startUp();
        }
    }
    public function expiryReturnLoad(): Void {
        if (commonController.getProductType().equals("Free")) {
            editionAlert();
        } else if(DisableInv[5]){
            Msgbox();
        } else {
            deleteForm(6);
            insert ExpiryReturn.getDesignRootNodes() into panelInvForm.content;
            ExpiryReturn.StartUp();
        }
    }
    public function damageStockLoad(): Void {
        if (commonController.getProductType().equals("Free")) {
            editionAlert();
        } else if(DisableInv[4]){
            Msgbox();
        } else {
            deleteForm(5);
            insert DamageStock.getDesignRootNodes() into panelInvForm.content;
            DamageStock.Startup();
        }
    }
    public function stockLoad(): Void {
        if(DisableInv[3]){
            Msgbox();
        }else{
            deleteForm(4);
            insert Stock.getDesignRootNodes() into panelInvForm.content;
            Stock.StartUp();
        }
    }
    public function purchaseReturnLoad(): Void {
        if(DisableInv[2]){
            Msgbox();
        }else{
            deleteForm(3);
            insert PurchaseReturn.getDesignRootNodes() into panelInvForm.content;
            PurchaseReturn.startUp();
        }
    }
    public function purchaseLoad(): Void {
        if(DisableInv[1]){
            Msgbox();
        }else{
            deleteForm(2);
            insert Purchase.getDesignRootNodes() into panelInvForm.content;
            Purchase.startUp();
        }
    }

    public function purchaseOrderLoad(): Void {
        if(DisableInv[0]){
            Msgbox();
        }else{
            deleteForm(1);
            insert PurchaseOrder.getDesignRootNodes() into panelInvForm.content;
            PurchaseOrder.startUp();
        }
    }	

    public function deleteForm(i: Integer): Void {
        invModule = i;
        delete  panelInvForm.content;
        delete  panelMsgBox.content;
        imgClose.visible = true;
    }
    function setPrivillages(u: String): Void {
        var uname = u;
        var userType = GetUserInfo.getUserType(uname);
        if (userType.equals("User") or userType.equals("Admin") or userType.equals("SuperAdmin")) {
            if (commonController.getProductType().equals("Free")) {
                var access = getPrivillages(uname);
                for (i in [0..<access.size()]) {
                    if (i == 4 or i == 5 or i == 6) {
                        DisableInventory[i] = true;
                    } else {
                        DisableInventory[i] = false;
                    }
                    if (Integer.parseInt(access[i]) == 0) {
                        DisableInv[i] = true;
                        rectMenuY[i] = 0.0;
                    } else {
                        DisableInv[i] = false;
                        rectMenuY[i] = 48.0;
                    }
                }
            } else {
                var access = getPrivillages(uname);
                for (i in [0..<access.size()]) {
                    if (Integer.parseInt(access[i]) == 0) {
                        DisableInv[i] = true;
                        rectMenuY[i] = 0.0;
                        DisableInventory[i] = true;
                    } else {
                        DisableInv[i] = false;
                        rectMenuY[i] = 48.0;
                        DisableInventory[i] = false;
                    }
                }
            }
        } else {
            for (i in [0..<7]) {
                rectMenuY[i] = 48.0;
                DisableInv[i] = false;
            }
        }
    }

    function getPrivillages(uname: String): String[] {
        var priv: String[];
        var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
        if (not GetUserInfo.checkName(uname)) {
            var access: String = commonController.getPrivileges("inventory", uname);
            priv = access.split(",");
        }
        return priv;
    }

    var logUser = bind user on replace {
        setPrivillages(logUser);
    }
}
