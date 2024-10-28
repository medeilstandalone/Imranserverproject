package com.vanuston.medeil.ui;

import javafx.scene.image.ImageView;
import javafx.scene.image.Image;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.util.GetUserInfo;
import javafx.animation.Timeline;
import javafx.animation.Interpolator;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.util.RegistryConstants;

public class SubMenuCRM {

    var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    def rectMenuWidth = 219.5;
    public var CRMModule: Integer = 0 on replace {
        CommonDeclare.form[5] = CRMModule;
    }
    var CRMform = bind CommonDeclare.form[5] on replace {
        if (CRMform == 0) {
            imgClose.visible = false;
            delete  panelCRMForm.content;
        } }
    var user = bind CommonDeclare.user on replace {
        setPrivillages(user);
    }
    
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
    
    public-read def panelCRMForm: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
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
    
    public-read def imageCustomer: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Customer.png"
    }
    
    public-read def imgMenu1: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 60.0
        image: imageCustomer
    }
    
    public-read def group1: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableCRM[0]!=true
        disable: bind DisCRM[0]
        layoutY: bind rectMenuY[0]
        content: [ rectMenu1, lblMenu1, imgMenu1, ]
    }
    
    public-read def imageAlert: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Alert.png"
    }
    
    public-read def imgMenu2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 109.0
        image: imageAlert
    }
    
    public-read def group2: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableCRM[1]!=true
        disable: bind DisCRM[1]
        layoutY: bind group1.layoutY+rectMenuY[1];
        content: [ rectMenu2, lblMenu2, imgMenu2, ]
    }
    
    public-read def imageComplaint: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Complaints.png"
    }
    
    public-read def imgMenu3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 157.0
        image: imageComplaint
    }
    
    public-read def group3: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableCRM[2]!=true
        disable: bind DisCRM[2]
        layoutY: bind group2.layoutY+rectMenuY[2];
        content: [ rectMenu3, lblMenu3, imgMenu3, ]
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Close.png"
    }
    
    public-read def imgClose: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        opacity: bind opacClose
        layoutX: bind imgCancelLX
        onMouseClicked: imgCloseOnMouseClicked
        image: image
    }
    
    public-read def panelCRMSubMenu: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        disable: bind CloseForm
        layoutX: 0.0
        layoutY: 0.0
        content: [ group1, group2, group3, panelCRMForm, imgClose, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ panelCRMSubMenu, panelMsgBox, ]
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
                            lblMenu1.text = "             Customer Details";
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
                            lblMenu2.text = "             Customer Alerts";
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
                            lblMenu3.text = "             Complaints";
                            lblMenu3.font = Left_Menu;
                            lblMenu3.textFill = DarkGray;
                            imgMenu3.visible = true;
                            imgMenu3.layoutX = 12.0;
                            imgMenu3.layoutY = 3.5;
                            group3.layoutX = 8.0;
                            panelCRMForm.visible = true;
                            panelCRMForm.layoutX = 232.0;
                            panelCRMForm.layoutY = -2.0;
                            imgClose.visible = false;
                            imgClose.onMouseEntered = imgCloseOnMouseEntered;
                            imgClose.onMouseExited = imgCloseOnMouseExited;
                            panelCRMSubMenu.visible = true;
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
    var DisableCRM: Boolean[];
    var DisCRM: Boolean[];
    var imgCancelLX = bind CommonDeclare.panelFormW + 207;
    var panelMsgBoxLX = bind ((CommonDeclare.panelFormW - 500) / 2) + 207;
    var panelMsgBoxLY = bind ((CommonDeclare.panelFormH - 150) / 2) - 100;
    def MessageBox = MessageBox {};
    var CloseForm: Boolean;

    
    public function Msgbox(): Void {
        MessageBox.MsgBox("Medeil", "Information", CommonDeclare.access_deny_msg);
        delete  panelMsgBox.content;
        insert MessageBox.getDesignRootNodes() into panelMsgBox.content;
    }

    public function editionAlert(): Void {
        MessageBox.MsgBox("Medeil", "Information", CommonDeclare.edition_msg);
        delete  panelMsgBox.content;
        insert MessageBox.getDesignRootNodes() into panelMsgBox.content;
    }

    function imgCloseOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        Close();
    }

    function Close(): Void {
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
        if (msgOutput == 1 and CloseForm == true and CommonDeclare.currModule == 6) {
            delete  panelCRMForm.content;
            imgClose.visible = false;
            CommonDeclare.form[5] = 0;
        }
        CloseForm = false;
    }

    function rectMenu3OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
        complaintRegister();
    }    
    function rectMenu2OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
        customerAlerts();
    }
    function rectMenu1OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
        customerLoad();
    }
    public function complaintRegister(): Void {
        if (commonController.getProductType().equals("Free")) {
            editionAlert();
        } else if(DisableCRM[2]){
            Msgbox();
        }else{
            deleteForm(3);
            def ComplaintRegister = ComplaintRegister {};
            insert ComplaintRegister.getDesignRootNodes() into panelCRMForm.content;
            ComplaintRegister.StartUp();
        }
    }
    public function customerAlerts(): Void {
        if (commonController.getProductType().equals("Free")) {
            editionAlert();
        } else if(DisableCRM[1]){
            Msgbox();
        }else{
            deleteForm(2);
            def CustomerAlerts = CustomerAlerts {};
            insert CustomerAlerts.getDesignRootNodes() into panelCRMForm.content;
            CustomerAlerts.startUp();
        }
    }

    public function customerLoad(): Void {
        if(DisableCRM[0]){
            Msgbox();
        }else{
            deleteForm(1);
            def CustomerInformation = CustomerInformation {};
            insert CustomerInformation.getDesignRootNodes() into panelCRMForm.content;
            CustomerInformation.StartUp();
        }
    }

    

    //Remove contents from Form Panel
    public function deleteForm(module: Integer): Void {
        CRMModule = module;
        delete  panelCRMForm.content;
        delete  panelMsgBox.content;
        imgClose.visible = true;
    }

    function setPrivillages(u: String): Void {
        var uname = u;
        var userType = GetUserInfo.getUserType(uname);
        if (userType.equals("User") or userType.equals("Admin") or userType.equals("SuperAdmin")) {
            var access = getPrivillages(uname);
            for (i in [0..<access.size()]) {

                if (commonController.getProductType().equals("Free")) {

                    if (i == 0) {
                        DisCRM[i] = false;
                    } else {
                        DisCRM[i] = true;
                    }

                    if (Integer.parseInt(access[i]) == 0) {
                        DisableCRM[i] = true;
                        rectMenuY[i] = 0.0;

                    } else {
                        DisableCRM[i] = false;
                        rectMenuY[i] = 48.0;

                    }

                } else { if (Integer.parseInt(access[i]) == 0) {
                        DisableCRM[i] = true;
                        rectMenuY[i] = 0.0;
                        DisCRM[i] = true;
                    } else {
                        DisableCRM[i] = false;
                        rectMenuY[i] = 48.0;
                        DisCRM[i] = false;
                    }
                }
            }

        } else {
            for (i in [0..<3]) {
                rectMenuY[i] = 48.0;
                DisableCRM[i] = false;
            }
        }
    }

    function getPrivillages(uname: String): String[] {
        var priv: String[];
        var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
        if (not GetUserInfo.checkName(uname)) {
            var access: String = commonController.getPrivileges("crm", uname);
            priv = access.split(",");
        }
        return priv;
    }

    var logUser = bind user on replace {
        setPrivillages(logUser);
    }
}
