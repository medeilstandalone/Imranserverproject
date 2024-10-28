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

var MasterModule: Integer = 0 on replace {
    CommonDeclare.form[3] = MasterModule;
}

public class SubMenuMasters {

    def DrugInformation = DrugInformation {};
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
    
    public-read def panelMastersForm: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
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
    
    public-read def imageDrug: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Drug.png"
    }
    
    public-read def imgMenu1: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 60.0
        image: imageDrug
    }
    
    public-read def group1: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableMasters[0]!=true
        disable: bind DisableMast[0]
        layoutY: bind rectMenuY[0]
        content: [ rectMenu1, lblMenu1, imgMenu1, ]
    }
    
    public-read def imageHospital: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Hospital.png"
    }
    
    public-read def imgMenu2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 109.0
        image: imageHospital
    }
    
    public-read def group2: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableMasters[1]!=true
        disable: bind DisableMast[1]
        layoutY: bind group1.layoutY+rectMenuY[1]
        content: [ rectMenu2, lblMenu2, imgMenu2, ]
    }
    
    public-read def imageDoctor: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Doctor.png"
    }
    
    public-read def imgMenu3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 157.0
        image: imageDoctor
    }
    
    public-read def group3: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableMasters[2]!=true
        disable: bind DisableMast[2]
        layoutY: bind group2.layoutY+rectMenuY[2]
        content: [ rectMenu3, lblMenu3, imgMenu3, ]
    }
    
    public-read def imageDistributor: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Distributor.png"
    }
    
    public-read def imgMenu4: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 207.0
        image: imageDistributor
    }
    
    public-read def group4: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableMasters[3]!=true
        disable: bind DisableMast[3]
        layoutY: bind group3.layoutY+rectMenuY[3]
        content: [ rectMenu4, lblMenu4, imgMenu4, ]
    }
    
    public-read def imageEmployee: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Employee.png"
    }
    
    public-read def imgMenu5: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 252.0
        image: imageEmployee
    }
    
    public-read def group5: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableMasters[4]!=true
        disable: bind DisableMast[4]
        layoutY: bind group4.layoutY+rectMenuY[4]
        content: [ rectMenu5, lblMenu5, imgMenu5, ]
    }
    
    public-read def imageEmpSalary: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/EmployeeSalary.png"
    }
    
    public-read def imgMenu6: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 15.0
        layoutY: 300.0
        image: imageEmpSalary
    }
    
    public-read def group6: javafx.scene.Group = javafx.scene.Group {
        visible: bind DisableMasters[5]!=true
        disable: bind DisableMast[5]
        layoutY: bind group5.layoutY+rectMenuY[5]
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
    
    public-read def panelMastersSubMenu: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        disable: bind CloseForm
        layoutX: 0.0
        layoutY: 0.0
        content: [ group1, group2, group3, group4, group5, group6, panelMastersForm, imgClose, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ panelMastersSubMenu, panelMsgBox, ]
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
                            lblMenu1.text = "             Drug Details";
                            lblMenu1.font = Left_Menu;
                            lblMenu1.textFill = DarkGray;
                            imgMenu1.visible = true;
                            imgMenu1.layoutX = 12.0;
                            imgMenu1.layoutY = 3.5;
                            imgMenu1.image = imageDrug;
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
                            lblMenu2.text = "             Hospital Details";
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
                            lblMenu3.text = "             Doctor Details";
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
                            lblMenu4.text = "             Distributor Details";
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
                            lblMenu5.text = "             Employee Details";
                            lblMenu5.font = Left_Menu;
                            lblMenu5.textFill = DarkGray;
                            imgMenu5.visible = true;
                            imgMenu5.layoutX = 12.0;
                            imgMenu5.layoutY = 3.5;
                            group5.layoutX = 8.0;
                            rectMenu6.visible = true;
                            rectMenu6.opacity = 1.0;
                            rectMenu6.layoutX = 0.0;
                            rectMenu6.layoutY = 0.0;
                            rectMenu6.styleClass = "LeftmenuHighlight";
                            rectMenu6.onMouseClicked = rectMenu6OnMouseClickedAtSubMenu;
                            rectMenu6.fill = Sandal;
                            rectMenu6.stroke = DarkGray;
                            rectMenu6.strokeWidth = 2.0;
                            rectMenu6.height = 45.0;
                            rectMenu6.arcWidth = 10.0;
                            rectMenu6.arcHeight = 10.0;
                            lblMenu6.visible = true;
                            lblMenu6.layoutX = 0.0;
                            lblMenu6.layoutY = 0.0;
                            __layoutInfo_lblMenu6.width = 220.0;
                            __layoutInfo_lblMenu6.height = 45.0;
                            lblMenu6.text = "             Employee Salary";
                            lblMenu6.font = Left_Menu;
                            lblMenu6.textFill = DarkGray;
                            imgMenu6.visible = true;
                            imgMenu6.layoutX = 12.0;
                            imgMenu6.layoutY = 3.5;
                            group6.layoutX = 8.0;
                            panelMastersForm.visible = true;
                            panelMastersForm.layoutX = 232.0;
                            panelMastersForm.layoutY = -2.0;
                            imgClose.visible = false;
                            imgClose.onMouseClicked = imgCloseOnMouseClicked;
                            imgClose.onMouseEntered = imgCloseOnMouseEntered;
                            imgClose.onMouseExited = imgCloseOnMouseExited;
                            panelMastersSubMenu.visible = true;
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

    var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    var rectMenuY: Number[];
    var DisableMasters: Boolean[];
    var DisableMast: Boolean[];
    var Mastersform = bind CommonDeclare.form[3] on replace {
        if (Mastersform == 0) {
            imgClose.visible = false;
            delete  panelMastersForm.content;
        } }
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
    function imgCloseOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
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
        if (msgOutput == 1 and CloseForm == true and CommonDeclare.currModule == 4) {
            delete  panelMastersForm.content;
            imgClose.visible = false;
            CommonDeclare.form[3] = 0;
        }
        CloseForm = false;
    }

    function rectMenu6OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
        Load_EmployeeSalaary();
    }

    public function Load_EmployeeSalaary(): Void {
        if (commonController.getProductType().equals("Free")) {
            MessageBox.MsgBox("Medeil", "Information", CommonDeclare.edition_msg);
            delete  panelMsgBox.content;
            insert MessageBox.getDesignRootNodes() into panelMsgBox.content;
        } else if(DisableMasters[5]){
            Msgbox();
        } else {
            def EmployeeSalary = EmployeeSalary {};
            deleteForm(6);
            insert EmployeeSalary.getDesignRootNodes() into panelMastersForm.content;
            EmployeeSalary.StartUp();
        }
    }

    function rectMenu5OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
        Load_EmployeeInformation();
    }

    public function Load_EmployeeInformation(): Void {
        if(DisableMasters[4]){
            Msgbox();
        } else {
            deleteForm(5);
            def EmployeeInformation = EmployeeInformation {};
            insert EmployeeInformation.getDesignRootNodes() into panelMastersForm.content;
            EmployeeInformation.StartUp();
        }
    }

    function rectMenu4OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
        Load_DistributorInformation();
    }

    public function Load_DistributorInformation(): Void {
        if(DisableMasters[3]){
            Msgbox();
        } else {
            deleteForm(4);
            def DistributorInformation = DistributorInformation {};
            insert DistributorInformation.getDesignRootNodes() into panelMastersForm.content;
            DistributorInformation.StartUp();
        }
    }

    function rectMenu3OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
        Load_DoctorInformation();
    }

    public function Load_DoctorInformation(): Void {
        if(DisableMasters[2]){
            Msgbox();
        } else {
            deleteForm(3);
            def DoctorInformation = DoctorInformation {};
            insert DoctorInformation.getDesignRootNodes() into panelMastersForm.content;
            DoctorInformation.Startup();
        }

    }

    function rectMenu2OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
        Load_HospitalInformation();
    }

    public function Load_HospitalInformation(): Void {
        if(DisableMasters[1]){
            Msgbox();
        } else {
            deleteForm(2);
            def HospitalInformation = HospitalInformation {};
            insert HospitalInformation.getDesignRootNodes() into panelMastersForm.content;
            HospitalInformation.Startup();
        }

    }

    function rectMenu1OnMouseClickedAtSubMenu(event: javafx.scene.input.MouseEvent): Void {
        Load_DrugInformation();
    }

    public function Load_DrugInformation(): Void {
        if(DisableMasters[0]){
            Msgbox();
        } else {
            deleteForm(1);
            insert DrugInformation.getDesignRootNodes() into panelMastersForm.content;
            DrugInformation.StartUp();
        }
    }

//Remove contents from Form Panel
    public function deleteForm(i: Integer): Void {
        MasterModule = i;
        delete  panelMastersForm.content;
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
                    if (i == 5) {
                        DisableMast[5] = true;
                    } else {
                        DisableMast[5] = false;
                    }

                    if (Integer.parseInt(access[i]) == 0) {
                        DisableMasters[i] = true;
                        rectMenuY[i] = 0.0;
                    } else {
                        DisableMasters[i] = false;
                        rectMenuY[i] = 48.0;
                    }
                } else {

                    if (Integer.parseInt(access[i]) == 0) {
                        DisableMasters[i] = true;
                        DisableMast[i] = true;
                        rectMenuY[i] = 0.0;
                    } else {
                        DisableMasters[i] = false;
                        rectMenuY[i] = 48.0;
                        DisableMast[i] = false;
                    }
                }

            }
        } else {
            for (i in [0..<6]) {
                rectMenuY[i] = 48.0;
                DisableMasters[i] = false;
            }
        }
    }

    function getPrivillages(uname: String): String[] {
        var priv: String[];
        var comObj: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;

        if (not GetUserInfo.checkName(uname)) {
            var access: String = comObj.getPrivileges("masters", uname);
            priv = access.split(",");
        }
        return priv;
    }

    var logUser = bind user on replace {
        setPrivillages(logUser);
    }
}

