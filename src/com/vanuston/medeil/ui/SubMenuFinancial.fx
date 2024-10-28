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

public class SubMenuFinancial {
//

    def Payment = Payment {};
    def ChequeTxn = ChequeTxn {};
    def ChequeBook = ChequeBook {};
    def BankBook = BankBook {};
    def BankDetails = BankDetails {};
    def Receipt = Receipt {};
    def DailyCashBook = DailyCashBook {};
    def CreditNote = CreditNote {};
    def DebitNote = DebitNote {};
    def VATReport = VATReport {};
    var user = bind CommonDeclare.user on replace {
        setPrivillages(user);

    }
    def rectMenuWidth = 219.5;
    public var FinanceModule: Integer = 0 on replace {
        CommonDeclare.form[4] = FinanceModule;
    }
    var Finform = bind CommonDeclare.form[4] on replace {
        if (Finform == 0) {
            imgClose.visible = false;
            delete  panelFinancialForm.content;
        }
        }
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def rectMenu1: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 0.0
        layoutY: 36.0
        styleClass: "LeftmenuHighlight"
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
        styleClass: "LeftmenuHighlight"
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
    
    def __layoutInfo_rectMenu3: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def rectMenu3: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 11.0
        layoutY: 164.0
        layoutInfo: __layoutInfo_rectMenu3
        styleClass: "LeftmenuHighlight"
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
        styleClass: "LeftmenuHighlight"
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
        styleClass: "LeftmenuHighlight"
        width: bind rectMenuWidth
        height: 50.0
    }
    
    def __layoutInfo_lblMenu5: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblMenu5: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutInfo: __layoutInfo_lblMenu5
        text: "Label"
    }
    
    public-read def rectMenu6: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
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
    
    public-read def imgMenu6: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
    }
    
    public-read def group6: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableFinancial[5]!=true
        disable: bind DisableFin[5]
        layoutY: bind group5.layoutY+rectMenuY[5]
        onMouseClicked: groupMenu6OnMouseClicked
        content: [ rectMenu6, lblMenu6, imgMenu6, ]
    }
    
    public-read def rectMenu7: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
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
    
    public-read def imgMenu7: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
    }
    
    public-read def group7: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableFinancial[6]!=true
        disable: bind DisableFin[6]
        layoutY: bind group6.layoutY+rectMenuY[6]
        content: [ rectMenu7, lblMenu7, imgMenu7, ]
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
    
    public-read def rectMenu9: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        width: bind rectMenuWidth
        height: 50.0
    }
    
    def __layoutInfo_lblMenu9: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblMenu9: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutInfo: __layoutInfo_lblMenu9
        text: "Label"
    }
    
    public-read def imgMenu9: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
    }
    
    public-read def group9: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableFinancial[8]!=true
        disable: bind DisableFin[8]
        layoutY: bind group8.layoutY+rectMenuY[8]
        content: [ rectMenu9, lblMenu9, imgMenu9, ]
    }
    
    public-read def rectMenu10: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        width: bind rectMenuWidth
        height: 50.0
    }
    
    def __layoutInfo_lblMenu10: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblMenu10: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutInfo: __layoutInfo_lblMenu10
        text: "Label"
    }
    
    public-read def imgMenu10: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
    }
    
    public-read def group10: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableFinancial[9]!=true
        disable: bind DisableFin[9]
        layoutY: bind group9.layoutY+rectMenuY[9]
        onMouseClicked: groupMenu10OnMouseClicked
        content: [ rectMenu10, lblMenu10, imgMenu10, ]
    }
    
    public-read def panelFinancialForm: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: 226.0
        layoutY: 0.0
    }
    
    public-read def imgClose: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        opacity: bind opacClose
        layoutX: bind imgCancelLX
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
        url: "{__DIR__}images/Payment.png"
    }
    
    public-read def imgMenu1: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 60.0
        image: image1
    }
    
    public-read def group1: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableFinancial[0]!=true
        disable: bind DisableFin[0]
        layoutY: bind rectMenuY[0]
        content: [ rectMenu1, lblMenu1, imgMenu1, ]
    }
    
    public-read def image2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Receipt.png"
    }
    
    public-read def imgMenu2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 109.0
        image: image2
    }
    
    public-read def group2: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableFinancial[1]!=true
        disable: bind DisableFin[1]
        layoutY: bind group1.layoutY+rectMenuY[1]
        content: [ rectMenu2, lblMenu2, imgMenu2, ]
    }
    
    public-read def image3: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/CrediteNote.png"
    }
    
    public-read def imgMenu3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 157.0
        image: image3
    }
    
    public-read def group3: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableFinancial[2]!=true
        disable: bind DisableFin[2]
        layoutY: bind group2.layoutY+rectMenuY[2]
        content: [ rectMenu3, lblMenu3, imgMenu3, ]
    }
    
    public-read def image4: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/DebitNote.png"
    }
    
    public-read def imgMenu4: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 207.0
        image: image4
    }
    
    public-read def group4: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableFinancial[3]!=true
        disable: bind DisableFin[3]
        layoutY: bind group3.layoutY+rectMenuY[3]
        content: [ rectMenu4, lblMenu4, imgMenu4, ]
    }
    
    public-read def image5: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/DailyCashBook.png"
    }
    
    public-read def imgMenu5: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 16.0
        image: image5
    }
    
    public-read def group5: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableFinancial[4]!=true
        disable: bind DisableFin[4]
        layoutY: bind group4.layoutY+rectMenuY[4]
        onMouseClicked: groupMenu5OnMouseClicked
        content: [ rectMenu5, lblMenu5, imgMenu5, ]
    }
    
    public-read def image6: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Bank Details.png"
    }
    
    public-read def image7: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Bank Book.png"
    }
    
    public-read def image8: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Cheque.png"
    }
    
    public-read def imgMenu8: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        image: image8
    }
    
    public-read def group8: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableFinancial[7]!=true
        disable: bind DisableFin[7]
        layoutY: bind group7.layoutY+rectMenuY[7]
        content: [ rectMenu8, lblMenu8, imgMenu8, ]
    }
    
    public-read def panelFinancialSubMenu: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        disable: bind CloseForm
        layoutX: 0.0
        layoutY: 0.0
        content: [ group1, group2, group3, group4, group5, group6, group7, group8, group9, group10, panelFinancialForm, imgClose, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ panelFinancialSubMenu, panelMsgBox, ]
    }
    
    public-read def image9: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Cheque-Transaction.png"
    }
    
    public-read def image10: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/VAT-Register.png"
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Close.png"
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
                            lblMenu1.text = "             Payment";
                            lblMenu1.font = Left_Menu;
                            lblMenu1.textFill = DarkGray;
                            imgMenu1.visible = true;
                            imgMenu1.layoutX = 12.0;
                            imgMenu1.layoutY = 3.5;
                            group1.layoutX = 8.0;
                            rectMenu2.visible = true;
                            rectMenu2.opacity = 1.0;
                            rectMenu2.layoutX = 0.0;
                            rectMenu2.layoutY = 0.0;
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
                            lblMenu2.text = "             Receipt";
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
                            __layoutInfo_rectMenu3.width = 0.0;
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
                            lblMenu3.text = "             Credit Notes";
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
                            lblMenu4.text = "             Debit Notes";
                            lblMenu4.font = Left_Menu;
                            lblMenu4.textFill = DarkGray;
                            imgMenu4.visible = true;
                            imgMenu4.layoutX = 12.0;
                            imgMenu4.layoutY = 3.5;
                            group4.layoutX = 8.0;
                            rectMenu5.visible = true;
                            rectMenu5.stroke = DarkGray;
                            rectMenu5.strokeWidth = 2.0;
                            rectMenu5.height = 45.0;
                            rectMenu5.arcWidth = 10.0;
                            rectMenu5.arcHeight = 10.0;
                            lblMenu5.visible = true;
                            __layoutInfo_lblMenu5.width = 220.0;
                            __layoutInfo_lblMenu5.height = 45.0;
                            lblMenu5.text = "            Day Book";
                            lblMenu5.font = Left_Menu;
                            lblMenu5.textFill = DarkGray;
                            imgMenu5.visible = true;
                            imgMenu5.layoutX = 12.0;
                            imgMenu5.layoutY = 3.5;
                            group5.layoutX = 8.0;
                            rectMenu6.visible = true;
                            rectMenu6.styleClass = "LeftmenuHighlight";
                            rectMenu6.strokeWidth = 2.0;
                            rectMenu6.height = 45.0;
                            rectMenu6.arcWidth = 10.0;
                            rectMenu6.arcHeight = 10.0;
                            lblMenu6.visible = true;
                            lblMenu6.layoutY = 0.0;
                            __layoutInfo_lblMenu6.width = 220.0;
                            __layoutInfo_lblMenu6.height = 45.0;
                            lblMenu6.text = "            Bank Accounts";
                            lblMenu6.font = Left_Menu;
                            lblMenu6.textFill = DarkGray;
                            imgMenu6.visible = true;
                            imgMenu6.layoutX = 12.0;
                            imgMenu6.layoutY = 3.5;
                            imgMenu6.image = image6;
                            group6.layoutX = 8.0;
                            rectMenu7.visible = true;
                            rectMenu7.styleClass = "LeftmenuHighlight";
                            rectMenu7.height = 45.0;
                            rectMenu7.arcWidth = 10.0;
                            rectMenu7.arcHeight = 10.0;
                            lblMenu7.visible = true;
                            __layoutInfo_lblMenu7.width = 220.0;
                            __layoutInfo_lblMenu7.height = 45.0;
                            lblMenu7.text = "            Bank Book";
                            lblMenu7.font = Left_Menu;
                            lblMenu7.textFill = DarkGray;
                            imgMenu7.visible = true;
                            imgMenu7.layoutX = 12.0;
                            imgMenu7.layoutY = 3.5;
                            imgMenu7.image = image7;
                            group7.layoutX = 8.0;
                            group7.onMouseClicked = groupMenu7OnMouseClicked;
                            rectMenu8.visible = true;
                            rectMenu8.styleClass = "LeftmenuHighlight";
                            rectMenu8.height = 45.0;
                            rectMenu8.arcWidth = 10.0;
                            rectMenu8.arcHeight = 10.0;
                            lblMenu8.visible = true;
                            __layoutInfo_lblMenu8.width = 220.0;
                            __layoutInfo_lblMenu8.height = 45.0;
                            lblMenu8.text = "            Cheque Book";
                            lblMenu8.font = Left_Menu;
                            lblMenu8.textFill = DarkGray;
                            imgMenu8.visible = true;
                            imgMenu8.layoutX = 12.0;
                            imgMenu8.layoutY = 3.5;
                            group8.layoutX = 8.0;
                            group8.onMouseClicked = groupMenu8OnMouseClicked;
                            rectMenu9.visible = true;
                            rectMenu9.styleClass = "LeftmenuHighlight";
                            rectMenu9.height = 45.0;
                            rectMenu9.arcWidth = 10.0;
                            rectMenu9.arcHeight = 10.0;
                            lblMenu9.visible = true;
                            __layoutInfo_lblMenu9.width = 220.0;
                            __layoutInfo_lblMenu9.height = 45.0;
                            lblMenu9.text = "            Cheque Txns";
                            lblMenu9.font = Left_Menu;
                            lblMenu9.textFill = DarkGray;
                            imgMenu9.visible = true;
                            imgMenu9.layoutX = 12.0;
                            imgMenu9.layoutY = 3.5;
                            imgMenu9.image = image9;
                            group9.layoutX = 8.0;
                            group9.onMouseClicked = groupMenu9OnMouseClicked;
                            rectMenu10.visible = true;
                            rectMenu10.styleClass = "LeftmenuHighlight";
                            rectMenu10.stroke = DarkGray;
                            rectMenu10.strokeWidth = 2.0;
                            rectMenu10.height = 45.0;
                            rectMenu10.arcWidth = 10.0;
                            rectMenu10.arcHeight = 10.0;
                            lblMenu10.visible = true;
                            __layoutInfo_lblMenu10.width = 220.0;
                            __layoutInfo_lblMenu10.height = 45.0;
                            lblMenu10.text = "            VAT Register";
                            lblMenu10.font = Left_Menu;
                            lblMenu10.textFill = DarkGray;
                            imgMenu10.visible = true;
                            imgMenu10.layoutX = 12.0;
                            imgMenu10.layoutY = 3.5;
                            imgMenu10.image = image10;
                            group10.layoutX = 8.0;
                            panelFinancialForm.visible = true;
                            panelFinancialForm.layoutX = 232.0;
                            panelFinancialForm.layoutY = -2.0;
                            panelFinancialForm.blocksMouse = true;
                            imgClose.visible = false;
                            imgClose.onMouseClicked = imgCloseOnMouseClicked;
                            imgClose.onMouseEntered = imgCloseOnMouseEntered;
                            imgClose.onMouseExited = imgCloseOnMouseExited;
                            imgClose.image = image;
                            panelFinancialSubMenu.visible = true;
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
    var DisableFinancial: Boolean[];
      var DisableFin: Boolean[];
    var imgCancelLX = bind CommonDeclare.panelFormW + 207;
    var panelMsgBoxLX = bind ((CommonDeclare.panelFormW - 500) / 2) + 207;
    var panelMsgBoxLY = bind ((CommonDeclare.panelFormH - 150) / 2) - 100;
    def MessageBox = MessageBox {};
    var CloseForm: Boolean;
    var commonController : CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
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

    function imgCloseOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        FinanceModule = 15;
        CloseForm = true;
        MessageBox.MsgBox("Medeil", "Confirm", CommonDeclare.exitForm_msg);
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
        if (msgOutput == 1 and CloseForm == true and CommonDeclare.currModule == 5) {
            delete  panelFinancialForm.content;
            imgClose.visible = false;
            CommonDeclare.form[4] = 0;
        }
        CloseForm = false;
    }

    public function loadVatRegister(): Void {
        if (commonController.getProductType().equals("Free")) {
            editionAlert();
        } else if(DisableFinancial[9]){
            Msgbox();
        } else {
            if (FinanceModule != 10) {
                FinanceModule = 10;
                deleteForm();
                insert VATReport.getDesignRootNodes() into panelFinancialForm.content;
                VATReport.Startup();
            }
        }
    }
    function groupMenu10OnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        loadVatRegister();
    }
    public function loadChequeTxn(): Void {
        if (commonController.getProductType().equals("Free")) {
            editionAlert();
        } else if(DisableFinancial[8]){
            Msgbox();
        } else {
            if (FinanceModule != 9) {
                FinanceModule = 9;
                deleteForm();
                insert ChequeTxn.getDesignRootNodes() into panelFinancialForm.content;
                ChequeTxn.StartUp();
            }
        }
    }
    function groupMenu9OnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
       loadChequeTxn();
    }
    public function loadChequeBook(): Void {
        if (commonController.getProductType().equals("Free")) {
            editionAlert();
        } else if(DisableFinancial[7]){
            Msgbox();
        } else {
            if (FinanceModule != 8) {
                FinanceModule = 8;
                deleteForm();
                insert ChequeBook.getDesignRootNodes() into panelFinancialForm.content;
                ChequeBook.StartUp();
            }
        }
    }
    function groupMenu8OnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        loadChequeBook();
    }

    public function loadBankBook(): Void {
        if (commonController.getProductType().equals("Free")) {
            editionAlert();
        } else if(DisableFinancial[6]){
            Msgbox();
        } else {
            if (FinanceModule != 7) {
                FinanceModule = 7;
                deleteForm();
                insert BankBook.getDesignRootNodes() into panelFinancialForm.content;
                BankBook.StartUp();
            }
        }
    }
	
    function groupMenu7OnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
       loadBankBook();
    }
public function loadBankDetails(): Void {
    if (commonController.getProductType().equals("Free")) {
        editionAlert();
    } else if(DisableFinancial[5]){
            Msgbox();
    } else {
        if (FinanceModule != 6) {
            FinanceModule = 6;
            deleteForm();
            insert BankDetails.getDesignRootNodes() into panelFinancialForm.content;
            BankDetails.StartUp();
        }
    }
}
    function groupMenu6OnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        loadBankDetails();
    }
    public function loadDailyCashBook(): Void {
            if(commonController.getProductType().equals("Free")) {
                editionAlert();
            } else if(DisableFinancial[4]){
                Msgbox();
            }else{
                FinanceModule = 5;
                deleteForm();
                insert DailyCashBook.getDesignRootNodes() into panelFinancialForm.content;
                DailyCashBook.StartUp();
            }
    }
    function groupMenu5OnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
       loadDailyCashBook();
    }

    public function loadDebitNote(): Void {
	if(commonController.getProductType().equals("Free")) {
            editionAlert();
        } else if(DisableFinancial[3]){
            Msgbox();
        }else{
            if (FinanceModule != 4) {
            FinanceModule = 4;
            deleteForm();
            insert DebitNote.getDesignRootNodes() into panelFinancialForm.content;
            DebitNote.StartUp();
            }
	}
    }
    function rectMenu4OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
       loadDebitNote();
    }

    public function loadCredit(): Void {
        if(commonController.getProductType().equals("Free")) {
            editionAlert();
        } else if(DisableFinancial[2]){
            Msgbox();
        }else{
            if (FinanceModule != 3) {
                FinanceModule = 3;
            insert CreditNote.getDesignRootNodes() into panelFinancialForm.content;
            CreditNote.Startup();
            }
        }
    }

    function rectMenu3OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {

        loadCredit();
        }
  
    public function loadReceipt(): Void {
        if(DisableFinancial[1]){
            Msgbox();
        }else{
            FinanceModule = 2;
            deleteForm();
            insert Receipt.getDesignRootNodes() into panelFinancialForm.content;
            Receipt.StartUp();
        }
    }
    function rectMenu2OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
       loadReceipt();
    }

   public function loadPayment(): Void {
        if(DisableFinancial[0]){
            Msgbox();
        }else if (FinanceModule != 1) {
            FinanceModule = 1;
            deleteForm();
            insert Payment.getDesignRootNodes() into panelFinancialForm.content;
            Payment.StartUp();
        }
    }

    function rectMenu1OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
        loadPayment();
    }

    //Remove contents from Form Panel
    public function deleteForm(): Void {
        delete  panelFinancialForm.content;
        delete  panelMsgBox.content;
        imgClose.visible = true;
    }

    // Saravanan.P Oct 12 Modified ******* Start ***********
    function setPrivillages(u: String): Void {
        var uname = u;
        var userType =  GetUserInfo.getUserType(uname);
        if (userType.equals("User") or userType.equals("Admin")  or userType.equals("SuperAdmin")) {
            var access = getPrivillages(uname);
            for (i in [0..<access.size()]) {
            if(commonController.getProductType().equals("Free")) {
                if(i==0 or i==1){
                        DisableFin[i]=false;
                }else{
                     DisableFin[i]=true;
                }
            if (Integer.parseInt(access[i]) == 0) {
                    DisableFinancial[i] = true;
                    rectMenuY[i] = 0.0;
                } else {
                    DisableFinancial[i] = false;

                    rectMenuY[i] = 48.0;
                }


            }else{
                if (Integer.parseInt(access[i]) == 0) {
                    DisableFinancial[i] = true;
                    DisableFin[i]=true;
                    rectMenuY[i] = 0.0;
                } else {
                    DisableFinancial[i] = false;
                     DisableFin[i]=false;
                    rectMenuY[i] = 48.0;
                }
            }
            }
        } else {
            for (i in [0..<9]) {
                rectMenuY[i] = 48.0;
                DisableFinancial[i] = false;
                DisableFin[i]=false;
            }
        }
    }

    function getPrivillages(uname: String): String[] {
        var priv: String[];
        var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
        if (not GetUserInfo.checkName(uname)) {
            var access: String = commonController.getPrivileges("financial", uname);
            priv = access.split(",");
        }
        return priv;
    }

    var logUser = bind user on replace {
        setPrivillages(logUser);
    }
}
