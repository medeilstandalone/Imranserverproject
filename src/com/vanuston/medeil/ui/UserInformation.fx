package com.vanuston.medeil.ui;

import javafx.scene.layout.LayoutInfo;
import javafx.scene.image.Image;
import javafx.scene.input.KeyCode;
import javafx.animation.KeyFrame;
import javafx.animation.Timeline;
import javafx.scene.control.Tooltip;
import java.lang.Exception;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.model.UserInformationModel;
import com.vanuston.medeil.model.MsgReturnModel;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.uitables.ConfirmDialogBox;

var userExist = false;
var userInfoTimer: Timeline;
var listH: Float = 0.0;
var listW: Float = 0.0;
var listLX: Number = 0.0;
var ListHeight = 0.0;
var privillages = ["No Access", "Read Only", "Read & Write Access", "Full Access"];
var editUserName;
var editPwd;
var home = 0;
var h1 = 0;
var h2 = 0;
var h3 = 0;
var h4 = 0;
var h5 = 3;
var sales = 0;
var s1 = 0;
var s2 = 0;
var s3 = 0;
var s4 = 0;
var s5 = 0;
var inventory = 0;
var inv1 = 0;
var inv2 = 0;
var inv3 = 0;
var inv4 = 0;
var inv5 = 0;
var inv6 = 0;
var inv7 = 0;
var masters = 0;
var m1 = 0;
var m2 = 0;
var m3 = 0;
var m4 = 0;
var m5 = 0;
var m6 = 0;
var financial = 0;
var f1 = 0;
var f2 = 0;
var f3 = 0;
var f4 = 0;
var f5 = 0;
var f6 = 0;
var f7 = 0;
var f8 = 0;
var f9 = 0;
var f10 = 0;
var crm = 0;
var crm1 = 0;
var crm2 = 0;
var crm3 = 0;
var reports = 0;
var r1 = 0;
var r2 = 0;
var r3 = 0;
var r4 = 0;
var r5 = 0;
var r6 = 0;
var r7 = 0;
var r8 = 0;

public class UserInformation {

    var log: Logger = Logger.getLogger(UserInformation.class, "Settings");
    var comObj : CommonImplements;	
    var userController: com.vanuston.medeil.implementation.UserInformation;
	  
	  
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 397.5
        layoutY: 0.0
        styleClass: "rectFormHeader"
        width: bind panelW
        height: 575.0
    }
    
    def __layoutInfo_label: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
    }
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutInfo: __layoutInfo_label
        text: "Label"
    }
    
    def __layoutInfo_separator: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
        height: 0.0
    }
    public-read def separator: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: 30.0
        layoutY: 115.0
        layoutInfo: __layoutInfo_separator
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imageView2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_separator2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
        height: 3.0
    }
    public-read def separator2: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: 30.0
        layoutY: 244.0
        layoutInfo: __layoutInfo_separator2
    }
    
    def __layoutInfo_pwdEmpPass: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def pwdEmpPass: javafx.scene.control.PasswordBox = javafx.scene.control.PasswordBox {
        layoutX: bind C4LX
        layoutY: 158.0
        layoutInfo: __layoutInfo_pwdEmpPass
    }
    
    def __layoutInfo_pwdEmpConfirm: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def pwdEmpConfirm: javafx.scene.control.PasswordBox = javafx.scene.control.PasswordBox {
        layoutX: bind C4LX
        layoutY: 186.0
        layoutInfo: __layoutInfo_pwdEmpConfirm
    }
    
    def __layoutInfo_listView: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind privilageBGW
        height: bind ListHeight
    }
    public-read def listView: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: true
        managed: true
        layoutX: bind PrivilageC1LX-5
        layoutY: 304.0
        layoutInfo: __layoutInfo_listView
        items: null
        vertical: true
        pannable: false
        cellFactory: listCellFactory2
    }
    
    def __layoutInfo_choicebox11: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind PrivilageW
    }
    public-read def choicebox11: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: bind PrivilageC2LX
        layoutInfo: __layoutInfo_choicebox11
        items: bind privillages
    }
    
    def __layoutInfo_choicebox12: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind PrivilageW
    }
    public-read def choicebox12: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: bind PrivilageC4LX
        layoutInfo: __layoutInfo_choicebox12
        items: bind privillages
    }
    
    def __layoutInfo_choicebox22: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind PrivilageW
    }
    public-read def choicebox22: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: bind PrivilageC4LX
        layoutInfo: __layoutInfo_choicebox22
        items: bind privillages
    }
    
    def __layoutInfo_choicebox21: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind PrivilageW
    }
    public-read def choicebox21: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: bind PrivilageC2LX
        layoutInfo: __layoutInfo_choicebox21
        items: bind privillages
    }
    
    def __layoutInfo_choicebox32: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind PrivilageW
    }
    public-read def choicebox32: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: bind PrivilageC4LX
        layoutInfo: __layoutInfo_choicebox32
        items: bind privillages
    }
    
    def __layoutInfo_choicebox31: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind PrivilageW
    }
    public-read def choicebox31: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: bind PrivilageC2LX
        layoutInfo: __layoutInfo_choicebox31
        items: bind privillages
    }
    
    def __layoutInfo_choicebox42: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind PrivilageW
    }
    public-read def choicebox42: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: bind PrivilageC4LX
        layoutInfo: __layoutInfo_choicebox42
        items: bind privillages
    }
    
    def __layoutInfo_choicebox41: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind PrivilageW
    }
    public-read def choicebox41: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: bind PrivilageC2LX
        layoutInfo: __layoutInfo_choicebox41
        items: bind privillages
    }
    
    def __layoutInfo_choicebox52: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind PrivilageW
    }
    public-read def choicebox52: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: bind PrivilageC4LX
        layoutInfo: __layoutInfo_choicebox52
        items: bind privillages
    }
    
    def __layoutInfo_choicebox51: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind PrivilageW
    }
    public-read def choicebox51: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: bind PrivilageC2LX
        layoutInfo: __layoutInfo_choicebox51
        items: bind privillages
    }
    
    public-read def choicebox62: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    public-read def choicebox61: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    public-read def choicebox72: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    public-read def choicebox71: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: 249.0
        layoutY: 173.0
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    public-read def imageClose: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind imageCloseLX
        layoutY: 6.0
        onMouseClicked: imageCloseOnMouseClicked
    }
    
    def __layoutInfo_label5: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX
        layoutY: 211.0
        layoutInfo: __layoutInfo_label5
        text: "Label"
    }
    
    def __layoutInfo_radUser: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def radUser: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: bind C2LX
        layoutY: 201.0
        layoutInfo: __layoutInfo_radUser
        onKeyPressed: radUserOnKeyPressed
        onMouseClicked: radUserOnMouseClicked
        text: "Radio Button"
    }
    
    public-read def radUserAdmin: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: bind C2LX+50
        layoutY: 201.0
        onKeyPressed: radUserAdminOnKeyPressed
        onMouseClicked: radUserAdminOnMouseClicked
        text: "Radio Button"
    }
    
    def __layoutInfo_lblCurrPass: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblCurrPass: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX
        layoutY: 207.0
        layoutInfo: __layoutInfo_lblCurrPass
        text: "Label"
    }
    
    def __layoutInfo_pwdCurrPass: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def pwdCurrPass: javafx.scene.control.PasswordBox = javafx.scene.control.PasswordBox {
        visible: false
        layoutX: bind C4LX
        layoutY: 211.0
        layoutInfo: __layoutInfo_pwdCurrPass
        onKeyPressed: pwdCurrPassOnKeyPressed
    }
    
    def __layoutInfo_btnChangePass: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnChangePass: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind C4LX+Type3TextboxW+10
        layoutY: 151.0
        layoutInfo: __layoutInfo_btnChangePass
        text: "Button"
        action: btnChangePassAction
    }
    
    def __layoutInfo_listUserEmp: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listUserEmp: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind listLX
        layoutInfo: __layoutInfo_listUserEmp
        items: null
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
    }
    
    public-read def panelHomePage: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
    }
    
    public-read def Violet: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.011764706
        green: 0.5019608
        blue: 0.7607843
    }
    
    public-read def linearGradient: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#ffffff") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#f5f0e9") }, ]
    }
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
    }
    
    def __layoutInfo_label12: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def label12: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutInfo: __layoutInfo_label12
        text: "privileges"
        font: Arial_12
        textFill: javafx.scene.paint.Color.WHITE
    }
    
    def __layoutInfo_listCell6: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind PrivilageW
    }
    public-read def listCell6: javafx.scene.control.ListCell = javafx.scene.control.ListCell {
        layoutX: bind PrivilageC4LX
        layoutY: 283.0
        layoutInfo: __layoutInfo_listCell6
        node: label12
    }
    
    public-read def label11: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 50.0
        text: "Module"
        font: Arial_12
        textFill: javafx.scene.paint.Color.WHITE
    }
    
    def __layoutInfo_listCell5: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind PrivilageW
    }
    public-read def listCell5: javafx.scene.control.ListCell = javafx.scene.control.ListCell {
        layoutX: bind PrivilageC3LX-5
        layoutY: 283.0
        layoutInfo: __layoutInfo_listCell5
        node: label11
    }
    
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Use"
        font: Arial_12
        textFill: javafx.scene.paint.Color.WHITE
    }
    
    def __layoutInfo_listCell2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind PrivilageW
    }
    public-read def listCell2: javafx.scene.control.ListCell = javafx.scene.control.ListCell {
        layoutX: bind PrivilageC2LX
        layoutY: 283.0
        layoutInfo: __layoutInfo_listCell2
        node: label7
    }
    
    def __layoutInfo_label4: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 30.0
    }
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 50.0
        layoutInfo: __layoutInfo_label4
        text: "Module"
        font: Arial_12
        textFill: javafx.scene.paint.Color.WHITE
    }
    
    def __layoutInfo_listCell: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind PrivilageW
    }
    public-read def listCell: javafx.scene.control.ListCell = javafx.scene.control.ListCell {
        opacity: 1.0
        layoutX: bind PrivilageC1LX-5
        layoutY: 283.0
        layoutInfo: __layoutInfo_listCell
        node: label4
    }
    
    public-read def panelTableBg: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: 50.0
        layoutY: 283.0
        content: [ listView, listCell, listCell2, listCell5, listCell6, ]
    }
    
    def __layoutInfo_txtEmpName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
        hfill: false
    }
    public-read def txtEmpName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 158.0
        layoutInfo: __layoutInfo_txtEmpName
        style: ""
        styleClass: "text-box"
        effect: null
        text: ""
        font: Arial_12
    }
    
    def __layoutInfo_txtEmpUName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtEmpUName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 130.0
        layoutInfo: __layoutInfo_txtEmpUName
        onKeyPressed: txtEmpUNameOnKeyPressed
        onKeyReleased: txtEmpUNameOnKeyReleased
        font: Arial_12
    }
    
    def __layoutInfo_txtEmpCode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtEmpCode: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 130.0
        layoutInfo: __layoutInfo_txtEmpCode
        text: "Customer Code..."
        selectOnFocus: false
        editable: false
        font: Arial_12
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
    
    public-read def label20: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "|"
        font: Arial_Bold_14
    }
    
    public-read def label21: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "|"
        font: Arial_Bold_14
    }
    
    public-read def label22: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "|"
        font: Arial_Bold_14
    }
    
    public-read def label19: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "|"
        font: Arial_Bold_14
    }
    
    public-read def label23: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "|"
        font: Arial_Bold_14
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
    
    def __layoutInfo_btnEmp2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnEmp2: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton2LX
        layoutY: bind panelButtonsLY
        layoutInfo: __layoutInfo_btnEmp2
        effect: reflectionEffect
        graphic: imageView2
        text: "Reset [F4]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnEmp1: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnEmp1: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX
        layoutY: bind panelButtonsLY
        layoutInfo: __layoutInfo_btnEmp1
        onKeyPressed: btnEmp1OnKeyPressed
        effect: reflectionEffect
        graphic: imageView
        text: "Save [F2]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
        action: btnEmp1Action
    }
    
    public-read def toggleGroup: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def rdoUserRemove: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: bind optRemoveUser
        layoutY: 94.0
        text: "Remove User"
        font: Arial_Bold_12
        toggleGroup: toggleGroup
    }
    
    public-read def rdoUserEdit: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: bind optEditUser
        layoutY: 94.0
        onKeyReleased: rdoUserEditOnKeyReleased
        onMouseClicked: rdoUserEditOnMouseClicked
        text: "Edit User"
        font: Arial_Bold_12
        toggleGroup: toggleGroup
    }
    
    public-read def rdoUserAdd: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: bind optAddUser
        layoutY: 94.0
        onMouseClicked: rdoUserAddOnMouseClicked
        text: "Add User"
        font: Arial_Bold_12
        toggleGroup: toggleGroup
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
    
    public-read def lblModule13: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 100.0
        layoutY: 450.0
        text: "Label"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def lblModule14: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 410.0
        layoutY: 452.0
        text: "Label"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def panelModule7: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: 80.0
        layoutY: 448.0
        content: [ lblModule14, lblModule13, choicebox72, choicebox71, ]
    }
    
    public-read def lblModule12: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 410.0
        layoutY: 430.0
        text: "Label"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def lblModule11: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 100.0
        layoutY: 430.0
        text: "Label"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def panelModule6: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: 80.0
        layoutY: 424.0
        content: [ lblModule11, lblModule12, choicebox62, choicebox61, ]
    }
    
    def __layoutInfo_lblModule10: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind PrivilageW
    }
    public-read def lblModule10: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind PrivilageC3LX
        layoutY: 405.0
        layoutInfo: __layoutInfo_lblModule10
        text: "Label"
        font: Arial_12
        textFill: DarkGray
    }
    
    def __layoutInfo_lblModule9: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind PrivilageW
    }
    public-read def lblModule9: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind PrivilageC1LX
        layoutY: 402.0
        layoutInfo: __layoutInfo_lblModule9
        text: "Label"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def panelModule5: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: 74.0
        layoutY: 402.0
        content: [ lblModule9, lblModule10, choicebox52, choicebox51, ]
    }
    
    def __layoutInfo_lblModule8: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind PrivilageW
    }
    public-read def lblModule8: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind PrivilageC3LX
        layoutY: 381.0
        layoutInfo: __layoutInfo_lblModule8
        text: "Label"
        font: Arial_12
        textFill: DarkGray
    }
    
    def __layoutInfo_lblModule7: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind PrivilageW
    }
    public-read def lblModule7: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind PrivilageC1LX
        layoutY: 381.0
        layoutInfo: __layoutInfo_lblModule7
        text: "Label"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def panelModule4: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: 74.0
        layoutY: 373.0
        content: [ lblModule7, lblModule8, choicebox42, choicebox41, ]
    }
    
    def __layoutInfo_lblModule6: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind PrivilageW
    }
    public-read def lblModule6: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind PrivilageC3LX
        layoutY: 358.0
        layoutInfo: __layoutInfo_lblModule6
        text: "Label"
        font: Arial_12
        textFill: DarkGray
    }
    
    def __layoutInfo_lblModule5: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind PrivilageW
    }
    public-read def lblModule5: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind PrivilageC1LX
        layoutY: 358.0
        layoutInfo: __layoutInfo_lblModule5
        text: "Label"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def panelModule3: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: 80.0
        layoutY: 354.0
        content: [ lblModule5, lblModule6, choicebox32, choicebox31, ]
    }
    
    def __layoutInfo_lblModule4: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind PrivilageW
    }
    public-read def lblModule4: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind PrivilageC3LX
        layoutY: 333.0
        layoutInfo: __layoutInfo_lblModule4
        text: "Label"
        font: Arial_12
        textFill: DarkGray
    }
    
    def __layoutInfo_lblModule3: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind PrivilageW
    }
    public-read def lblModule3: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind PrivilageC1LX
        layoutY: 333.0
        layoutInfo: __layoutInfo_lblModule3
        text: "Label"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def panelModule2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: 74.0
        layoutY: 331.0
        content: [ lblModule3, lblModule4, choicebox22, choicebox21, ]
    }
    
    def __layoutInfo_lblModule2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind PrivilageW
    }
    public-read def lblModule2: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind PrivilageC3LX
        layoutY: 310.0
        layoutInfo: __layoutInfo_lblModule2
        text: "Label"
        font: Arial_12
        textFill: DarkGray
    }
    
    def __layoutInfo_lblModule1: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind PrivilageW
    }
    public-read def lblModule1: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind PrivilageC1LX
        layoutY: 310.0
        layoutInfo: __layoutInfo_lblModule1
        text: "New"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def panelModule1: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: 58.0
        layoutY: 283.0
        content: [ lblModule1, choicebox11, lblModule2, choicebox12, ]
    }
    
    public-read def panelPrivilage: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ panelTableBg, panelModule1, panelModule2, panelModule3, panelModule4, panelModule5, panelModule6, panelModule7, ]
    }
    
    public-read def lblReports: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 500.0
        layoutY: 252.0
        onMouseClicked: lblReportsOnMouseClicked
        text: "Reports"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def lblCRM: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 425.0
        layoutY: 252.0
        onMouseClicked: lblCRMOnMouseClicked
        text: "CRM"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def lblFinancial: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 325.0
        layoutY: 258.0
        onMouseClicked: lblFinancialOnMouseClicked
        text: "Financial"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def lblMasters: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 250.0
        layoutY: 258.0
        onMouseClicked: lblMastersOnMouseClicked
        text: "Masters"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def lblInventory: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 150.0
        layoutY: 258.0
        onMouseClicked: lblInventoryOnMouseClicked
        text: "Inventory"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def lblSales: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 80.0
        layoutY: 258.0
        onMouseClicked: lblSalesOnMouseClicked
        text: "Sales    "
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def hboxTab: javafx.scene.layout.HBox = javafx.scene.layout.HBox {
        layoutX: bind hboxLX
        layoutY: 260.0
        content: [ lblSales, label23, lblInventory, label19, lblMasters, label22, lblFinancial, label21, lblCRM, label20, lblReports, ]
        spacing: 15.0
    }
    
    public-read def label14: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 130.0
        text: "Employee Code"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def lblpwdPass: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 158.0
        text: "Password"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label8: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 130.0
        text: "Username"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def lblCnfPass: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 186.0
        text: "Confirm Password"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 158.0
        styleClass: "label"
        text: "Employee Name"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        opacity: 1.0
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "form-background"
        onMouseClicked: rectangleOnMouseClicked
        fill: linearGradient
        stroke: DarkGray
        width: bind panelW
        height: bind panelH
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.4
    }
    
    public-read def label16: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 30.0
        layoutY: 217.0
        text: "Privileges Details"
        font: Arial_18
        textFill: Green
    }
    
    public-read def label15: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 35.0
        layoutY: 91.0
        text: "User Details"
        font: Arial_18
        textFill: Green
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ rectangle, rectHeader, label, separator, label2, lblCnfPass, label8, lblpwdPass, btnEmp1, btnEmp2, txtEmpCode, label14, txtEmpUName, rdoUserAdd, rdoUserEdit, rdoUserRemove, txtEmpName, separator2, label15, label16, pwdEmpPass, pwdEmpConfirm, hboxTab, panelPrivilage, imageClose, label5, radUser, radUserAdmin, lblCurrPass, pwdCurrPass, btnChangePass, listUserEmp, panelAlert, ]
    }
    
    public-read def dropShadowEffect: javafx.scene.effect.DropShadow = javafx.scene.effect.DropShadow {
    }
    
    public-read def lightingEffect: javafx.scene.effect.Lighting = javafx.scene.effect.Lighting {
    }
    
    public-read def Orange: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
    }
    
    public-read def Sandal: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.8
        blue: 0.4
    }
    
    public-read def toggleGroup2: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def imageSave: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Save1.png"
    }
    
    public-read def imageReset: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Reset.png"
    }
    
    public-read def linearGradient2: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#FFFFFF") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#000000") }, ]
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
                            rectangle.visible = true;
                            rectangle.layoutX = 1.0;
                            rectangle.arcWidth = 5.0;
                            rectangle.arcHeight = 5.0;
                            rectHeader.visible = true;
                            rectHeader.opacity = 0.25;
                            rectHeader.layoutX = 0.0;
                            rectHeader.fill = linearGradient2;
                            rectHeader.height = 32.0;
                            rectHeader.arcWidth = 5.0;
                            rectHeader.arcHeight = 5.0;
                            label.visible = true;
                            label.text = "User Information";
                            label.font = Arial_25;
                            label.hpos = javafx.geometry.HPos.CENTER;
                            label.graphicHPos = javafx.geometry.HPos.CENTER;
                            __layoutInfo_separator.height = 5.0;
                            imageView.visible = true;
                            imageView.image = imageSave;
                            btnEmp1.text = "Save [F3]";
                            imageView2.visible = true;
                            imageView2.image = imageReset;
                            btnEmp2.text = "Reset [F4]";
                            btnEmp2.action = btnEmp2ActionAtShown;
                            txtEmpCode.onKeyPressed = txtEmpCodeOnKeyPressedAtShown;
                            txtEmpCode.onKeyReleased = txtEmpCodeOnKeyReleasedAtShown;
                            txtEmpCode.text = "";
                            txtEmpCode.editable = true;
                            rdoUserAdd.layoutY = 94.0;
                            rdoUserAdd.selected = true;
                            rdoUserEdit.layoutY = 94.0;
                            rdoUserRemove.layoutY = 94.0;
                            rdoUserRemove.onKeyPressed = rdoUserRemoveOnKeyPressedAtShown;
                            rdoUserRemove.onMouseClicked = rdoUserRemoveOnMouseClickedAtShown;
                            txtEmpName.onKeyPressed = txtEmpNameOnKeyPressedAtShown;
                            txtEmpName.onKeyReleased = txtEmpNameOnKeyReleasedAtShown;
                            __layoutInfo_separator2.height = 5.0;
                            label16.layoutX = 35.0;
                            label16.text = "User Privileges";
                            pwdEmpPass.onKeyPressed = pwdEmpPassOnKeyPressedAtShown;
                            pwdEmpPass.promptText = " * * * * * * * * ";
                            pwdEmpConfirm.promptText = " * * * * * * * * ";
                            lblSales.cursor = javafx.scene.Cursor.HAND;
                            lblSales.textFill = DarkGray;
                            lblInventory.cursor = javafx.scene.Cursor.HAND;
                            lblMasters.cursor = javafx.scene.Cursor.HAND;
                            lblFinancial.cursor = javafx.scene.Cursor.HAND;
                            lblCRM.cursor = javafx.scene.Cursor.HAND;
                            lblReports.cursor = javafx.scene.Cursor.HAND;
                            lblReports.textFill = DarkGray;
                            hboxTab.fillHeight = true;
                            listView.visible = true;
                            listView.layoutY = 0.0;
                            label4.text = "Sub-Modules";
                            label4.hpos = javafx.geometry.HPos.CENTER;
                            listCell.disable = false;
                            listCell.layoutY = 0.0;
                            listCell.styleClass = "list-cell";
                            label7.text = "Privileges";
                            label7.hpos = javafx.geometry.HPos.CENTER;
                            listCell2.layoutY = 0.0;
                            label11.text = "Sub-Modules";
                            label11.hpos = javafx.geometry.HPos.CENTER;
                            listCell5.layoutY = 0.0;
                            __layoutInfo_label12.width = 150.0;
                            label12.text = "Privileges";
                            label12.hpos = javafx.geometry.HPos.CENTER;
                            listCell6.layoutY = 0.0;
                            panelTableBg.visible = true;
                            panelTableBg.layoutX = 0.0;
                            panelTableBg.layoutY = 0.0;
                            lblModule1.layoutY = 0.0;
                            lblModule1.text = "Label";
                            choicebox11.visible = true;
                            choicebox11.layoutY = 0.0;
                            lblModule2.layoutY = 0.0;
                            lblModule2.text = "Label";
                            choicebox12.visible = true;
                            panelModule1.visible = false;
                            panelModule1.layoutX = 0.0;
                            panelModule1.layoutY = 27.0;
                            lblModule3.layoutY = 0.0;
                            lblModule3.text = "Label";
                            lblModule4.layoutY = 0.0;
                            lblModule4.text = "Label";
                            choicebox22.visible = true;
                            choicebox21.visible = true;
                            panelModule2.visible = false;
                            panelModule2.layoutX = 0.0;
                            panelModule2.layoutY = 50.0;
                            lblModule5.layoutY = 0.0;
                            lblModule5.text = "Label";
                            lblModule6.layoutY = 0.0;
                            lblModule6.text = "Label";
                            choicebox32.visible = true;
                            choicebox31.visible = true;
                            panelModule3.visible = false;
                            panelModule3.layoutX = 0.0;
                            panelModule3.layoutY = 75.0;
                            lblModule7.layoutY = 0.0;
                            lblModule8.layoutY = 0.0;
                            choicebox42.visible = true;
                            choicebox41.visible = true;
                            panelModule4.visible = false;
                            panelModule4.layoutX = 0.0;
                            panelModule4.layoutY = 98.0;
                            lblModule9.layoutY = 0.0;
                            lblModule10.layoutY = 0.0;
                            choicebox52.visible = true;
                            choicebox51.visible = true;
                            panelModule5.visible = false;
                            panelModule5.layoutX = 0.0;
                            panelModule5.layoutY = 122.0;
                            lblModule11.layoutY = 0.0;
                            lblModule12.layoutY = 0.0;
                            choicebox62.visible = true;
                            choicebox62.layoutX = 550.0;
                            choicebox61.visible = true;
                            choicebox61.layoutX = 250.0;
                            panelModule6.visible = false;
                            panelModule6.layoutX = 0.0;
                            panelModule6.layoutY = 147.0;
                            lblModule14.layoutY = 0.0;
                            lblModule13.layoutY = 0.0;
                            choicebox72.visible = true;
                            choicebox72.layoutX = 550.0;
                            choicebox71.visible = true;
                            choicebox71.layoutX = 250.0;
                            choicebox71.layoutY = 0.0;
                            panelModule7.visible = false;
                            panelModule7.layoutX = 0.0;
                            panelModule7.layoutY = 169.0;
                            panelPrivilage.visible = true;
                            panelPrivilage.layoutY = 283.0;
                            imageClose.visible = false;
                            imageClose.layoutY = 1.0;
                            label5.visible = true;
                            label5.layoutY = 200.0;
                            __layoutInfo_label5.width = 60.0;
                            __layoutInfo_label5.height = 15.0;
                            label5.text = "Type";
                            label5.font = Arial_12;
                            label5.textFill = DarkGray;
                            radUser.visible = true;
                            radUser.layoutY = 200.0;
                            __layoutInfo_radUser.height = 15.0;
                            radUser.text = "User";
                            radUser.font = Arial_12;
                            radUser.toggleGroup = toggleGroup2;
                            radUser.selected = true;
                            radUser.value = "User";
                            radUserAdmin.visible = true;
                            radUserAdmin.layoutY = 200.0;
                            radUserAdmin.text = "Administrator";
                            radUserAdmin.font = Arial_12;
                            radUserAdmin.toggleGroup = toggleGroup2;
                            radUserAdmin.value = "Admin";
                            lblCurrPass.visible = false;
                            lblCurrPass.layoutY = 214.0;
                            __layoutInfo_lblCurrPass.width = 117.0;
                            lblCurrPass.text = "Current Password";
                            lblCurrPass.font = Arial_12;
                            pwdCurrPass.visible = false;
                            pwdCurrPass.managed = true;
                            pwdCurrPass.layoutY = 214.0;
                            pwdCurrPass.promptText = " * * * * * * * * ";
                            btnChangePass.visible = false;
                            btnChangePass.layoutY = 130.0;
                            __layoutInfo_btnChangePass.width = 150.0;
                            __layoutInfo_btnChangePass.height = 25.0;
                            btnChangePass.text = "Change Password";
                            btnChangePass.font = Arial_Bold_14;
                            listUserEmp.visible = false;
                            panel.visible = true;
                            panelHomePage.visible = true;
                        }
                    }
                ]
            }
        ]
    }
    
    function listCellFactory(): javafx.scene.control.ListCell {
        var listCell9: javafx.scene.control.ListCell;
        
        def label24: javafx.scene.control.Label = javafx.scene.control.Label {
            visible: bind not listCell9.empty
            text: bind "{listCell9.item}"
        }
        
        listCell9 = javafx.scene.control.ListCell {
            node: label24
        }
        
        return listCell9
    }
    
    function listCellFactory2(): javafx.scene.control.ListCell {
        var listCell10: javafx.scene.control.ListCell;
        
        def label25: javafx.scene.control.Label = javafx.scene.control.Label {
            visible: bind not listCell10.empty
            text: bind "{listCell10.item}"
        }
        
        listCell10 = javafx.scene.control.ListCell {
            node: label25
        }
        
        return listCell10
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel, panelHomePage, ]
    }
    // </editor-fold>//GEN-END:main

    function pwdEmpPassOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        //TODO
         if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB){
             pwdEmpConfirm.requestFocus();
         }

        }

    function rectangleOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        listUserEmp.visible = false;
        listView.visible = false;
    }

    var panelW = bind CommonDeclare.ScreenWidth - 4 on replace {
        optEditUser = (panelW - 100) / 2;
        optAddUser = optEditUser - 100;
        optRemoveUser = optEditUser + 100;
        panelPrivilageLX = panelW * 9.765625 / 100;
        privilageBGW = panelW * 58.6914062 / 100;
        hboxLX = (panelW - 600) / 2;
        PrivilageC1LX = (panelW * 20.703125 / 100) + 5;
        PrivilageC2LX = panelW * 35.3515625 / 100;
        PrivilageC3LX = (panelW * 50 / 100) + 5;
        PrivilageC4LX = panelW * 64.6484375 / 100;
        PrivilageW = panelW * 14.6484375 / 100;
        listUserEmp.visible = false;
    }
    var panelH = bind CommonDeclare.panelFormH;
    var C1LX = bind CommonDeclare.Column11LX;
    var C2LX = bind CommonDeclare.Column12LX;
    var C3LX = bind CommonDeclare.Column13LX;
    var C4LX = bind CommonDeclare.Column14LX;
    var botton1LX = bind CommonDeclare.botton22LX;
    var botton2LX = bind CommonDeclare.botton23LX;
    var bottonW = bind CommonDeclare.bottonW;
    var bottonH = bind CommonDeclare.bottonH;
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var seperatorW = bind CommonDeclare.seperatorFullScreenW;
    var imageCloseLX = bind panelW - 16;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;
    var optEditUser = (panelW - 100) / 2;
    var optAddUser = optEditUser - 100;
    var optRemoveUser = optEditUser + 100;
    var panelPrivilageLX = panelW * 9.765625 / 100;
    var privilageBGW = panelW * 58.6914062 / 100;
    var hboxLX = (panelW - 600) / 2;
    var PrivilageC1LX = (panelW * 20.703125 / 100) + 5;
    var PrivilageC2LX = panelW * 35.3515625 / 100;
    var PrivilageC3LX = (panelW * 50 / 100) + 5;
    var PrivilageC4LX = panelW * 64.6484375 / 100;
    var PrivilageW = panelW * 14.6484375 / 100;
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    def CustomAlert = CustomAlert {};

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("User Information", type);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("User Information", msg);
        showAlertbox();
    }

    function rdoUserRemoveOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER)
            removeUser();
    }

    function rdoUserRemoveOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        removeUser();
    }

    function rdoUserEditOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER)
            editUser();
    }

    function pwdCurrPassOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {

//             if(event.code==KeyCode.VK_ENTER)
//             {
//                 if(checkPassword(pwdCurrPass.rawText.trim(), editPwd))
//                 {
//                    pwdEmpPass.requestFocus();
//                 }
//                 else
//                    pwdCurrPass.requestFocus();
//             }
    }

    function btnChangePassAction(): Void {

        if (btnChangePass.text.equals("Change Password")) {
            lblCnfPass.visible = true;
            lblpwdPass.visible = true;
            pwdEmpPass.visible = true;
            pwdEmpConfirm.visible = true;
            lblCurrPass.visible = false;
            pwdCurrPass.visible = false;
            pwdCurrPass.editable = false;
            pwdCurrPass.text = null;
            btnChangePass.text = "Hide Details"
        } else {
            lblCnfPass.visible = false;
            lblpwdPass.visible = false;
            pwdEmpPass.visible = false;
            pwdEmpConfirm.visible = false;
            lblCurrPass.visible = false;
            pwdCurrPass.visible = false;
            pwdCurrPass.editable = false;
            pwdCurrPass.text = editPwd;
            btnChangePass.text = "Change Password";
        }
    }

    function txtEmpUNameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (btnEmp1.text.equals("Save [F3]")) {
            if (event.code == KeyCode.VK_ENTER) {
                var boo = checkAvailability();
                if (boo) {
                    pwdEmpPass.requestFocus();
                    userExist = false;
                } else {
                    txtEmpUName.requestFocus();
                    userExist = true;
                    txtEmpUName.tooltip = Tooltip {
                                text: " User Name Already Taken try different";
                                height: 25.0
                                width: 200.0
                                visible: true
                            }
                    txtEmpUName.style = "-fx-border-color: red";
                    txtEmpUName.style = "-fx-border-color: red";
                }
            }
        } else {
            getUserNames();
            if (event.code == KeyCode.VK_DOWN) {
                listUserEmp.visible = true;
                listUserEmp.requestFocus();
                listUserEmp.selectFirstRow();
            }
        }
    }

    function txtEmpUNameOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
    }

    function btnEmp1OnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            if (btnEmp1.text.equals("Save [F3]")) {
                saveUserInfo();
            } else if (btnEmp1.text.equals("Update [F7]")) {
                updateUserInfo();

            } else if (btnEmp1.text.equals("Delete [F6]") ) {
                removeUserInfo();
            }

        }
    }

    function radUserOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        onSelUser();
    }

    function radUserOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_SPACE) {
            radUser.selected = true;
            onSelUser();
        }
    }

    function radUserAdminOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            radUserAdmin.selected = true;
            onSelAdmin();
        }
    }

    function radUserAdminOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        onSelAdmin();
    }

    function btnEmp2ActionAtShown(): Void {
        resetValues();
    }

    function onSelUser(): Void {        
            hboxTab.disable = false;
            panelTableBg.disable = false;
            panelModule1.disable = false;
            panelModule2.disable = false;
            panelModule3.disable = false;
            SalesShow();        
    }

    function onSelAdmin(): Void {
        hboxTab.disable = true;
        panelTableBg.disable = true;
        panelModule1.disable = true;
        panelModule2.disable = true;
        panelModule3.disable = true;
        HideAllChkBox();

    }

    function btnEmp1Action(): Void {

        if (btnEmp1.text.equals("Save [F3]")) {
            saveUserInfo();
        } else if (btnEmp1.text.equals("Update [F7]")) {
            updateUserInfo();
        } else if (btnEmp1.text.equals("Delete [F6]")) {
            removeUserInfo();
        }
    }

    function txtEmpNameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        getEmpName();
        if (event.code == KeyCode.VK_DOWN) {
            listUserEmp.visible = true;
            listUserEmp.requestFocus();
            listUserEmp.selectFirstRow();
        } else if (event.code == KeyCode.VK_ENTER)
            txtEmpUName.requestFocus();

    }

    function txtEmpCodeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        getEmpCode();
        if (event.code == KeyCode.VK_DOWN) {
            listUserEmp.visible = true;
            listUserEmp.requestFocus();
            listUserEmp.selectFirstRow();
        } else if (event.code == KeyCode.VK_ENTER)
            txtEmpName.requestFocus();
    }

    function txtEmpNameOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        getEmpName();

        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_ESCAPE)
            listUserEmp.visible = false;
    }

    function txtEmpCodeOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        getEmpCode();

        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_ESCAPE)
            listUserEmp.visible = false;
    }

    function imageCloseOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        panel.visible = false;
        panelHomePage.visible = true;
        delete  panelHomePage.content;
    }

    public function FScreen() {
        panel.visible = true;
        panelHomePage.visible = false;
        currentState.actual = currentState.findIndex("Shown");
    }

    function lblReportsOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        ReportShow();
    }

    function lblCRMOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        CRMShow();
    }

    function lblFinancialOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        FinancialShow();
    }

    function lblMastersOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        MasterShow();
    }

    function lblInventoryOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        InvShow();
    }

    function lblSalesOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        SalesShow();
    }

    function rdoUserEditOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        editUser();
    }

    function rdoUserAddOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        addUser();
    }

    public function resetLblColor(): Void {
        lblSales.textFill = DarkGray;
        lblInventory.textFill = DarkGray;
        lblMasters.textFill = DarkGray;
        lblFinancial.textFill = DarkGray;
        lblCRM.textFill = DarkGray;
        lblReports.textFill = DarkGray;

        resetPanelVisble();
        resetLabelVisble();
        resetComboVisble();
    }

    function resetPanelVisble(): Void {
        panelModule1.visible = false;
        panelModule2.visible = false;
        panelModule3.visible = false;
        panelModule4.visible = false;
        panelModule5.visible = false;
    }

    function resetLabelVisble(): Void {
        lblModule1.visible = true;
        lblModule3.visible = true;
        lblModule5.visible = true;
        lblModule7.visible = true;
        lblModule9.visible = true;
        lblModule2.visible = true;
        lblModule4.visible = true;
        lblModule6.visible = true;
        lblModule8.visible = true;
        lblModule10.visible = true;
    }

    function resetComboVisble(): Void {
        choicebox11.visible = true;
        choicebox21.visible = true;
        choicebox31.visible = true;
        choicebox41.visible = true;
        choicebox51.visible = true;
        choicebox12.visible = true;
        choicebox22.visible = true;
        choicebox32.visible = true;
        choicebox42.visible = true;
        choicebox52.visible = true;
    }

    function isEditionCheck(): Void {
        //    var edition = GetProductInfo.getStatus();
      userController = RegistryFactory.getClientStub(RegistryConstants.UserInformation) as com.vanuston.medeil.implementation.UserInformation;
        if (setEditionPrivlgs()) {
            if (sales == 1) {
                //            var ret = GetUserInfo.getSalesBoolean();

                choicebox11.disable = userController.getFormStatus(0, "sales"); // Cash Bill       // Controller Call
                choicebox21.disable = userController.getFormStatus(1, "sales"); // Counter Bill  // Controller Call
                //-sar        choicebox31.disable = GetUserInfo.getSalesBoolean(2);  // Credit Bill  // Controller Call
                //-sar        choicebox41.disable = GetUserInfo.getSalesBoolean(3);  // Credit/Debit Card  // Controller Call
                //-sar     choicebox12.disable = GetUserInfo.getSalesBoolean(4); // Partial Payment   // Controller Call

                choicebox31.disable = userController.getFormStatus(2, "sales"); // Dummy Bill   // Controller Call
                choicebox12.disable = userController.getFormStatus(3, "sales"); // Sales Return   // Controller Call
                choicebox22.disable = userController.getFormStatus(4, "sales"); // Sales Maintenance  // Controller Call
            } else if (inventory == 1) {
                disCombo();
                choicebox11.disable = userController.getFormStatus(0, "inventory"); // Purchase Order  // Controller Call
                choicebox21.disable = userController.getFormStatus(1, "inventory"); // Purchase Invoice  // Controller Call
                choicebox31.disable = userController.getFormStatus(2, "inventory"); // Purchase Return  // Controller Call
                choicebox41.disable = userController.getFormStatus(3, "inventory"); // Stock   // Controller Call
                choicebox12.disable = userController.getFormStatus(4, "inventory"); // Damage Stock  // Controller Call
                choicebox22.disable = userController.getFormStatus(5, "inventory"); // Expiry Return  // Controller Call
                choicebox32.disable = userController.getFormStatus(6, "inventory"); // Send Purchase order  // Controller Call
            } else if (masters == 1) {
                disCombo();
                choicebox11.disable = userController.getFormStatus(0, "masters");      // Controller Call
                choicebox21.disable = userController.getFormStatus(1, "masters");  // Controller Call
                choicebox31.disable = userController.getFormStatus(2, "masters");  // Controller Call
                choicebox12.disable = userController.getFormStatus(3, "masters");  // Controller Call
                choicebox22.disable = userController.getFormStatus(4, "masters");  // Controller Call
                choicebox32.disable = userController.getFormStatus(5, "masters");  // Controller Call
            } else if (financial == 1) {
                disCombo();
                choicebox11.disable = userController.getFormStatus(0, "finance"); // "Payment"   // Controller Call
                choicebox21.disable = userController.getFormStatus(1, "finance"); //  "Receipt"  // Controller Call
                choicebox31.disable = userController.getFormStatus(2, "finance"); //  "Credit_Notes"  // Controller Call
                choicebox41.disable = userController.getFormStatus(3, "finance"); //  "Debit_Notes",  // Controller Call
                choicebox51.disable = userController.getFormStatus(4, "finance"); //  "DailyCash_Book"  // Controller Call
                choicebox12.disable = userController.getFormStatus(5, "finance"); //  "Bank_Details"  // Controller Call
                choicebox22.disable = userController.getFormStatus(6, "finance"); //  "Bank_Book"  // Controller Call
                choicebox32.disable = userController.getFormStatus(7, "finance"); //  "Cheque_Book" // Controller Call
                choicebox42.disable = userController.getFormStatus(8, "finance"); //  "Cheque_Txn" // Controller Call
                choicebox52.disable = userController.getFormStatus(9, "finance"); // "VAT_Summary" // Controller Call
            } else if (crm == 1) {
                //            var ret = GetUserInfo.getCRMBoolean();
                disCombo();
                choicebox11.disable = userController.getFormStatus(0, "crm"); //  Customer Details // Controller Call
                choicebox21.disable = userController.getFormStatus(1, "crm"); //  Customer Alerts // Controller Call
                choicebox12.disable = userController.getFormStatus(2, "crm"); //  Complaint Register  // Controller Call

            } else if (reports == 1) {
                //            var ret = GetUserInfo.getReportsBoolean();
                disCombo();
                choicebox11.disable = userController.getFormStatus(0, "reports");  // Controller Call
                choicebox21.disable = userController.getFormStatus(1, "reports"); // Controller Call
                choicebox31.disable = userController.getFormStatus(2, "reports"); // Controller Call
                choicebox41.disable = userController.getFormStatus(3, "reports");// Controller Call
                choicebox12.disable = userController.getFormStatus(4, "reports"); // Controller Call
                choicebox22.disable = userController.getFormStatus(5, "reports"); // Controller Call
                choicebox32.disable = userController.getFormStatus(6, "reports"); // Controller Call
                choicebox42.disable = userController.getFormStatus(7, "reports"); // Controller Call

            }
        } else {
            disCombo();
        }

    }

    public function disCombo(): Void {
        choicebox11.disable = false;
        choicebox21.disable = false;
        choicebox31.disable = false;
        choicebox41.disable = false;
        choicebox51.disable = false;
        choicebox12.disable = false;
        choicebox22.disable = false;
        choicebox32.disable = false;
        choicebox42.disable = false;
        choicebox52.disable = false;
    }

    public function SalesShow(): Void {
        home = 0; sales = 1; masters = 0; inventory = 0; financial = 0; crm = 0; reports = 0;
        isEditionCheck();
        resetLblColor();
        lblSales.textFill = Orange;
        ListHeight = 100;
        panelModule1.visible = true;
        panelModule2.visible = true;
        panelModule3.visible = true;

        lblModule1.text = "Cash Bill";
        lblModule3.text = "Counter Bill";
        lblModule5.text = "Dummy Bill";
        lblModule2.text = "Sales Return";
        lblModule4.text = "Sales Maintenance";

        choicebox11.select(s1);
        choicebox21.select(s2);
        choicebox31.select(s3);
        choicebox12.select(s4);
        choicebox22.select(s5);

        lblModule6.visible = false;
        choicebox32.visible = false;
    }

    public function InvShow(): Void {

        home = 0; sales = 0; masters = 0; inventory = 1; financial = 0; crm = 0; reports = 0;

        resetLblColor();
        isEditionCheck();
        lblInventory.textFill = Orange;
        ListHeight = 100;
        panelModule1.visible = true;
        panelModule2.visible = true;
        panelModule3.visible = true;
        panelModule4.visible = true;

        lblModule1.text = "Purchase Order";
        lblModule3.text = "Purchase Invoice";
        lblModule5.text = "Purchase Return";
        lblModule7.text = "Stock";
        lblModule2.text = "Damaged Stock";
        lblModule4.text = "Expiry Return";
        lblModule6.text = "Send Purchase order";

        choicebox11.select(inv1);
        choicebox21.select(inv2);
        choicebox31.select(inv3);
        choicebox41.select(inv4);
        choicebox12.select(inv5);
        choicebox22.select(inv6);
        choicebox32.select(inv7);

        lblModule8.visible = false;
        choicebox42.visible = false;

    }

    public function MasterShow(): Void {

        home = 0; sales = 0; masters = 1; inventory = 0; financial = 0; crm = 0; reports = 0;

        resetLblColor();
        isEditionCheck();
        ListHeight = 100;
        lblMasters.textFill = Orange;
        panelModule1.visible = true;
        panelModule2.visible = true;
        panelModule3.visible = true;

        lblModule1.text = "Drug Information";
        lblModule3.text = "Hospital Information";
        lblModule5.text = "Doctor Information";
        lblModule2.text = "Distributor Information";
        lblModule4.text = "Employee Information";
        lblModule6.text = "Employee Salary";

        choicebox11.select(m1);
        choicebox21.select(m2);
        choicebox31.select(m3);
        choicebox12.select(m4);
        choicebox22.select(m5);
        choicebox32.select(m6);

    }

    public function FinancialShow(): Void {

        home = 0; sales = 0; masters = 0; inventory = 0; financial = 1; crm = 0; reports = 0;

        resetLblColor();
        isEditionCheck();
        ListHeight = 75;
        lblFinancial.textFill = Orange;

        panelModule1.visible = true;
        panelModule2.visible = true;
        panelModule3.visible = true;
        panelModule4.visible = true;
        panelModule5.visible = true;

        lblModule1.text = "Payment";
        lblModule3.text = "Receipt";
        lblModule5.text = "Credit Note";
        lblModule7.text = "Debit Note";
        lblModule9.text = "Daily Cash Book";
        lblModule2.text = "Bank Details";
        lblModule4.text = "Bank Book";
        lblModule6.text = "Cheque Book";
        lblModule8.text = "Cheque Transaction";
        lblModule10.text = "VAT Summary";

        choicebox11.select(f1);
        choicebox21.select(f2);
        choicebox31.select(f3);
        choicebox41.select(f4);
        choicebox51.select(f5);
        choicebox12.select(f6);
        choicebox22.select(f7);
        choicebox32.select(f8);
        choicebox42.select(f9);
        choicebox52.select(f10);

    }

    public function CRMShow(): Void {

        home = 0; sales = 0; masters = 0; inventory = 0; financial = 0; crm = 1; reports = 0;

        resetLblColor();
        isEditionCheck();
        ListHeight = 75;
        lblCRM.textFill = Orange;
        panelModule1.visible = true;
        panelModule2.visible = true;

        lblModule1.text = "Customer Details";
        lblModule3.text = "Customer Alerts";
        lblModule2.text = "Complaint Register ";

        choicebox11.select(crm1);
        choicebox21.select(crm2);
        choicebox12.select(crm3);

        lblModule4.visible = false;
        choicebox22.visible = false;

    }

    public function ReportShow(): Void {

        home = 0; sales = 0; masters = 0; inventory = 0; financial = 0; crm = 0; reports = 1;

        resetLblColor();
        isEditionCheck();
        ListHeight = 100;
        lblReports.textFill = Orange;
        panelModule1.visible = true;
        panelModule2.visible = true;
        panelModule3.visible = true;
        panelModule4.visible = true;

        lblModule1.text = "Sales";
        lblModule3.text = "Purchase";
        lblModule5.text = "Product";
        lblModule7.text = "Stock";
        lblModule2.text = "Stock Analysis";
        lblModule4.text = "Master";
        lblModule6.text = "Finance";
        lblModule8.text = "CRM";

        choicebox11.select(r1);
        choicebox21.select(r2);
        choicebox31.select(r3);
        choicebox41.select(r4);
        choicebox12.select(r5);
        choicebox22.select(r6);
        choicebox32.select(r7);
        choicebox42.select(r8);
    }

    public function HideAllChkBox(): Void {
        resetLblColor();
        ListHeight = 100;
        panelModule1.visible = false;
        panelModule2.visible = false;
        panelModule3.visible = false;
        panelModule4.visible = false;
        panelModule5.visible = false;
        panelModule6.visible = false;
        panelModule7.visible = false;
        lblModule4.visible = true;
        choicebox22.visible = true;
        lblModule6.visible = true;
        choicebox32.visible = true;
    }

    function addUser() {

        resetValues();
        txtEmpCode.requestFocus();
        btnChangePass.visible = false;
        txtEmpCode.disable = false;
        txtEmpName.disable = false;
        txtEmpUName.editable = true;

        lblCurrPass.visible = false;
        pwdCurrPass.visible = false;
        pwdCurrPass.editable = false;

        pwdCurrPass.layoutY = 214.0; lblCurrPass.layoutY = 214.0;
        pwdEmpPass.layoutY = 158.0; lblpwdPass.layoutY = 158.0;
        pwdEmpConfirm.layoutY = 186.0; lblCnfPass.layoutY = 186.0;

        lblCnfPass.visible = true;
        lblpwdPass.visible = true;
        pwdEmpPass.visible = true;
        pwdEmpConfirm.visible = true;

        btnEmp1.text = "Save [F3]";
        HideAllChkBox();
    }

    function editUser() {

        resetValues();
        txtEmpUName.requestFocus();
        btnChangePass.visible = true;

        txtEmpCode.blocksMouse = true;
        txtEmpName.blocksMouse = true;
        txtEmpName.disable = true;
        txtEmpCode.disable = true;
        txtEmpUName.editable = false;
        lblCurrPass.visible = false;
        pwdCurrPass.visible = false;
        pwdCurrPass.editable = false;

//        pwdCurrPass.layoutY   = 158.0;
//        lblCurrPass.layoutY   = 158.0;
        pwdEmpPass.layoutY = 158.0;
        lblpwdPass.layoutY = 158.0;
        pwdEmpConfirm.layoutY = 186.0;
        lblCnfPass.layoutY = 186.0;

        lblCnfPass.visible = false;
        lblpwdPass.visible = false;
        pwdEmpPass.visible = false;
        pwdEmpConfirm.visible = false;

        btnEmp1.text = "Update [F7]";
        btnChangePass.text = "Change Password";

        txtEmpUName.requestFocus();
    }

    function removeUser() {

        resetValues();
        txtEmpUName.requestFocus();
        btnChangePass.visible = false;
        lblCurrPass.visible = false;
        pwdCurrPass.visible = false;
        pwdCurrPass.editable = false;

//        pwdCurrPass.layoutY   = 158.0;lblCurrPass.layoutY=158.0;
        pwdEmpPass.layoutY = 158.0; lblpwdPass.layoutY = 158.0;
        pwdEmpConfirm.layoutY = 186.0; lblCnfPass.layoutY = 186.0;

        lblCnfPass.visible = false;
        lblpwdPass.visible = false;
        pwdEmpPass.visible = false;
        pwdEmpConfirm.visible = false;

        btnEmp1.text = "Delete [F6]";
        resetValues();
    }

    function getUserNames() {
        listH = 0.0;
        listUserEmp.visible = true;
        listLX = txtEmpUName.layoutX;
        listUserEmp.layoutY = txtEmpUName.layoutY + txtEmpUName.height;
        var listControlObj: ListController = new ListController();
        listW = txtEmpUName.width;
        listH = listControlObj.listImageControlView(txtEmpUName, listUserEmp, "UserInformation", 0);
        var selS: String = bind listControlObj.selectedString on replace {

            if (not selS.equals("") and not selS.equals("null")) {
                fetchUserDet(selS);
            }
        }
    }
    var userType : String;
    function fetchUserDet(getName: String): Void {
        try {

            userController = RegistryFactory.getClientStub(RegistryConstants.UserInformation) as com.vanuston.medeil.implementation.UserInformation;
            var userInformationModel = userController.getUserDetails(getName); // Controller Call

            var uname = getName;
            editUserName = "{uname}";
            txtEmpUName.text = editUserName;
            txtEmpName.text = userInformationModel.getEmployeeName();
            txtEmpCode.text = userInformationModel.getEmployeeCode();
            editPwd = userInformationModel.getPassWord();
            pwdCurrPass.text = editPwd;
            //                    pwdEmpPass.text=editPwd;
            //                    pwdEmpConfirm.text=editPwd;
            radUser.disable = false;
            radUserAdmin.disable = false;
            rdoUserRemove.disable = false;
            btnEmp1.disable = false ;
            userType = userInformationModel.getUserType();
            if (userInformationModel.getUserType().equals("User")) {
                radUser.selected = true;
            } else if (userInformationModel.getUserType().equals("Admin")) {
                radUserAdmin.selected = true;
            } else if(userInformationModel.getUserType().equals("SuperAdmin")){
                onSelAdmin();
                if(btnEmp1.text.equals("Delete [F6]")) {
                    btnEmp1.disable = true ;
                } else {
                    btnEmp1.disable = false ;
                }
                radUser.selected = false;
                radUserAdmin.selected = false;
                radUserAdmin.selected = true;
                radUser.disable = true;
                radUserAdmin.disable = true;
                rdoUserRemove.disable = true;
            }

            var h = userInformationModel.getHome().split(",");
            var s = userInformationModel.getSales().split(",");
            var inv = userInformationModel.getInventory().split(",");
            var m = userInformationModel.getMasters().split(",");
            var f = userInformationModel.getFinance().split(",");
            var crm = userInformationModel.getCRM().split(",");
            var r = userInformationModel.getReports().split(",");

            s1 = Integer.parseInt(s[0]); s2 = Integer.parseInt(s[1]);
            s3 = Integer.parseInt(s[2]); s4 = Integer.parseInt(s[3]);
            s5 = Integer.parseInt(s[4]);

            inv1 = Integer.parseInt(inv[0]); inv2 = Integer.parseInt(inv[1]);
            inv3 = Integer.parseInt(inv[2]); inv4 = Integer.parseInt(inv[3]);
            inv5 = Integer.parseInt(inv[4]); inv6 = Integer.parseInt(inv[5]);
            inv7 = Integer.parseInt(inv[6]);

            m1 = Integer.parseInt(m[0]); m2 = Integer.parseInt(m[1]);
            m3 = Integer.parseInt(m[2]); m4 = Integer.parseInt(m[3]);
            m5 = Integer.parseInt(m[4]); m6 = Integer.parseInt(m[5]);

            f1 = Integer.parseInt(f[0]); f2 = Integer.parseInt(f[1]);
            f3 = Integer.parseInt(f[2]); f4 = Integer.parseInt(f[3]);
            f5 = Integer.parseInt(f[4]); f6 = Integer.parseInt(f[5]);
            f7 = Integer.parseInt(f[6]); f8 = Integer.parseInt(f[7]);
            f9 = Integer.parseInt(f[8]); f10 = Integer.parseInt(f[9]);

            crm1 = Integer.parseInt(crm[0]); crm2 = Integer.parseInt(crm[1]);
            crm3 = Integer.parseInt(crm[2]);

            r1 = Integer.parseInt(r[0]); r2 = Integer.parseInt(r[1]);
            r3 = Integer.parseInt(r[2]); r4 = Integer.parseInt(r[3]);
            r5 = Integer.parseInt(r[4]); r6 = Integer.parseInt(r[5]);
            r7 = Integer.parseInt(r[6]); r8 = Integer.parseInt(r[7]);

            listUserEmp.visible = false;
            txtEmpUName.requestFocus;
            setEditionPrivlgs();
        } catch (e: Exception) {
            e.printStackTrace();
        }

    }

    function setEditionPrivlgs(): Boolean {

        var retVal = false;
        comObj = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
        if (comObj.getProductType().equals("Express")) {
            s2= 0; s3 = 0;// s4 =0; s6 = 0;
            f6 = 0; f7 = 0; f8 = 0; f9 = 0; f10 = 0;
            inv6 = 0; inv7 = 0;
            crm2 = 0;
            retVal = true;
        } 

        return retVal;
    }

    function getEmpCode(): Void {
userController = RegistryFactory.getClientStub(RegistryConstants.UserInformation) as com.vanuston.medeil.implementation.UserInformation;
        listH = 0.0;
        listW = txtEmpCode.width;
        listUserEmp.visible = true;
        listLX = txtEmpCode.layoutX;
        listUserEmp.layoutY = txtEmpCode.layoutY + txtEmpCode.height;

        var listControlObj: ListController = new ListController();
        listW = txtEmpCode.width;
        listH = listControlObj.listImageControlView(txtEmpCode, listUserEmp, "employeecode", 0);
        var selS: String = bind listControlObj.selectedString on replace {

            if (not selS.equals("") and not selS.equals("null")) {

                var userInformationModel = userController.getEmployeeDetails(selS, "code");  // Controller Call
                txtEmpName.text = userInformationModel.getEmployeeName();
                if (not userInformationModel.isUserValid()) {
                    FXinfo("User Name already created for this Employee.\n please use Edit to modify");

                    txtEmpCode.requestFocus();
                } else {
                    txtEmpUName.requestFocus();
                }

            }
        }

    }

    function getEmpName(): Void {
    userController = RegistryFactory.getClientStub(RegistryConstants.UserInformation) as com.vanuston.medeil.implementation.UserInformation;
        listUserEmp.visible = true;

        listH = 0.0;
        listW = txtEmpName.width;

        listLX = txtEmpName.layoutX;
        listUserEmp.layoutY = txtEmpName.layoutY + txtEmpName.height;

        var listControlObj: ListController = new ListController();
        listW = txtEmpName.width;
        listH = listControlObj.listImageControlView(txtEmpName, listUserEmp, "employeename", 0);
        var selS: String = bind listControlObj.selectedString on replace {

            if (not selS.equals("") and not selS.equals("null")) {

                var userInformationModel = userController.getEmployeeDetails(selS, "name"); // Controller Call
                txtEmpCode.text = userInformationModel.getEmployeeCode();
                if (not userInformationModel.isUserValid()) {
                    FXinfo("User Name already created for this Employee.\n please use Edit to modify");

                    txtEmpName.requestFocus();
                } else {
                    txtEmpUName.requestFocus();
                }

            }
        }
    }

    function checkAvailability(): Boolean {
	comObj = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
        var check = comObj.checkUserNameExists(txtEmpUName.rawText.trim());
        return check;
    }

    function checkPassword(pwd: String, cpwd: String): Boolean {
        var check = false;
        if ((pwd == null or cpwd == null) or (pwd == "" or cpwd == "")) {
            check = false;
        } else {
            if (pwd.equals(cpwd)) {
                check = true;
            }
        }
        return check;
    }

    function isAdminCheck(): Void {
        try {
            if (radUserAdmin.selected) {
                s1 = 3; s2 = 3; s3 = 3; s4 = 3; s5 = 3;
                inv1 = 3; inv2 = 3; inv3 = 3; inv4 = 3; inv5 = 3; inv6 = 3; inv7 = 3;
                m1 = 3; m2 = 3; m3 = 3; m4 = 3; m5 = 3; m6 = 3;
                crm1 = 3; crm2 = 3; crm3 = 3;
                r1 = 3; r2 = 3; r3 = 3; r4 = 3; r5 = 3; r6 = 3; r7 = 3; r8 = 3;
                f1 = 3; f2 = 3; f3 = 3; f4 = 3; f5 = 3; f6 = 3; f7 = 3; f8 = 3; f9 = 3; f10 = 3;
                
                if (comObj.getProductType().equals("Express")) {
                    s2 = 0; s3 = 0;// s4 =0; s6 = 0;
                    f6 = 0; f7 = 0; f8 = 0; f9 = 0; f10 = 0;
                    inv6 = 0; inv7 = 0;
                    crm2 = 0;
                }
           }
        } catch (e: Exception) {
            log.debug("Method:isAdminCheck msg = {e.getMessage()}");
        }
    }

    function saveUserInfo() {

        try {
		userController = RegistryFactory.getClientStub(RegistryConstants.UserInformation) as com.vanuston.medeil.implementation.UserInformation;
                  var userInformationModel = userController.getEmployeeDetails(txtEmpCode.rawText, "code");
            if (not userInformationModel.isUserValid() and txtEmpCode.rawText!=null and txtEmpCode.rawText!="" and txtEmpName.rawText!=null and txtEmpName.rawText!="") {
                    FXinfo("User Name already created for this Employee.\n please use Edit to modify");
                    txtEmpName.requestFocus();
             } else if (not userExist) {
                var userInfoModel: UserInformationModel = new UserInformationModel();
                userInfoModel.setUserName(txtEmpUName.rawText);
                userInfoModel.setPassWord(pwdEmpPass.rawText);
                userInfoModel.setConfirmPassword(pwdEmpConfirm.rawText);
                var utype;
                if (radUser.selected) {
                    utype = radUser.value;
                } else if (radUserAdmin.selected) {
                    utype = radUserAdmin.value;
                    isAdminCheck();
                }
                userInfoModel.setUserType(utype.toString());
                userInfoModel.setEmployeeName(txtEmpName.rawText);
                userInfoModel.setEmployeeCode(txtEmpCode.rawText);
                
                if (txtEmpUName.rawText != null and pwdEmpPass.rawText != null and pwdEmpConfirm.rawText != null) {
                    if (checkAvailability()) {
                        if (checkPassword(pwdEmpPass.rawText, pwdEmpConfirm.rawText)) {
                            if (utype != null) {
                                userInfoModel.setHome("{h1},{h2},{h3},{h4},{h5}");
                                userInfoModel.setInventory("{inv1},{inv2},{inv3},{inv4},{inv5},{inv6},{inv7}");
                                userInfoModel.setSales("{s1},{s2},{s3},{s4},{s5}");
                                userInfoModel.setFinance("{f1},{f2},{f3},{f4},{f5},{f6},{f7},{f8},{f9},{f10}");
                                userInfoModel.setReports("{r1},{r2},{r3},{r4},{r5},{r6},{r7},{r8}");
                                userInfoModel.setCRM("{crm1},{crm2},{crm3}");
                                userInfoModel.setMasters("{m1},{m2},{m3},{m4},{m5},{m6}");

                                var returnObject = new Object();
                                userInfoModel.setSaveType("save");
                                returnObject = userController.createRecord(userInfoModel); // controller call
                                var msgReturnModel: MsgReturnModel = new MsgReturnModel();
                                msgReturnModel = returnObject as MsgReturnModel;
                                if (msgReturnModel.getReturnMessage() == "0") {
                                    FXalert(0);
                                    resetValues();
                                } else {
                                    FXinfo(msgReturnModel.getReturnMessage());
                                }
                            } else
                                FXinfo("Select User Type");
                        } else
                            FXinfo("Password and Confirm Password does not match. Type correctly!");

                    } else
                        FXinfo("User name already exists.Please provide different name");
                } else
                    FXinfo("Enter User name and Password");
            } else {
                FXinfo("User name already exists or User Name already created for this Employee");
                txtEmpUName.requestFocus();
            }
        } catch (e: Exception) {
            var ss = " Class : UserInformation  Method: saveUserInfo      Exception: {e}";
            log.debug(ss);
        }
    }

    function updateUserInfo() {
        try {
		userController = RegistryFactory.getClientStub(RegistryConstants.UserInformation) as com.vanuston.medeil.implementation.UserInformation;

            var utype;
            if (radUser.selected) {
                utype = radUser.value;
            } else if (radUserAdmin.selected) {
                utype = radUserAdmin.value;
                isAdminCheck();
            }
            if(userType.equals("SuperAdmin")) {
                utype = userType;
            }
            if (txtEmpUName.rawText != null) {

                if (checkPassword(pwdEmpPass.rawText, pwdEmpConfirm.rawText) or (pwdEmpPass.rawText == null and pwdEmpConfirm.rawText == null)) {
                    if (utype != null) {
                        if (not btnChangePass.text.equals("Hide Details"))
                            if ((pwdEmpPass.rawText == null and pwdEmpConfirm.rawText == null) or (not btnChangePass.text.equals("Hide Details"))) {
                                pwdEmpPass.text = editPwd;
                            }
                         var cn:ConfirmDialogBox=new ConfirmDialogBox(0,"User Information");
                            var a =bind cn.staus;

                                        if (a) {
                                            var query = "";
                                            var userInfoModel: UserInformationModel = new UserInformationModel();
                                            userInfoModel.setUserName(txtEmpUName.rawText);
                                            userInfoModel.setPassWord(pwdEmpPass.rawText);
                                            userInfoModel.setConfirmPassword(pwdEmpConfirm.rawText);
                                            userInfoModel.setUserType(utype.toString());
                                            userInfoModel.setEmployeeName(txtEmpName.rawText);
                                            userInfoModel.setEmployeeCode(txtEmpCode.rawText);
                                            userInfoModel.setHome("{h1},{h2},{h3},{h4},{h5}");
                                            userInfoModel.setInventory("{inv1},{inv2},{inv3},{inv4},{inv5},{inv6},{inv7}");
                                            userInfoModel.setSales("{s1},{s2},{s3},{s4},{s5}");
                                            userInfoModel.setFinance("{f1},{f2},{f3},{f4},{f5},{f6},{f7},{f8},{f9},{f10}");
                                            userInfoModel.setReports("{r1},{r2},{r3},{r4},{r5},{r6},{r7},{r8}");
                                            userInfoModel.setCRM("{crm1},{crm2},{crm3}");
                                            userInfoModel.setMasters("{m1},{m2},{m3},{m4},{m5},{m6}");
                                            var returnObject = new Object();
                                            userInfoModel.setSaveType("update");
                                            returnObject = userController.createRecord(userInfoModel); // controller call
                                            var msgReturnModel: MsgReturnModel = new MsgReturnModel();
                                            msgReturnModel = returnObject as MsgReturnModel;
                                            if (msgReturnModel.getReturnMessage() == "0") {
                                                FXalert(4);
                                                resetValues();
                                            } else {
                                                FXinfo(msgReturnModel.getReturnMessage());
                                            }
                                        }

                                    
                        setEditionPrivlgs();

                    } else
                        FXinfo("Select User Type");
                } else
                    FXinfo("Password and Confirm Password does not match. Type correctly!");
            } //       else
            //            FXinfo("Current Password and Confirm Password does not match. Type correctly!");
            //}
            else
                FXinfo("Enter User name to update");
        } catch (e: Exception) {
            var ss = " Class : UserInformation       Method: updateUserInfo       Exception: {e}";
            log.debug(ss);
        }
    }

    function removeUserInfo() {
        try {            
            if (not CommonDeclare.user.equals(txtEmpUName.rawText.trim())) {
                userController = RegistryFactory.getClientStub(RegistryConstants.UserInformation) as com.vanuston.medeil.implementation.UserInformation;
                comObj = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
                if (editUserName != null) {
                    if (editUserName.equals(txtEmpUName.rawText.trim()) or not comObj.checkUserNameExists(txtEmpUName.rawText.trim())) {
                        var cn: ConfirmDialogBox = new ConfirmDialogBox(1, "User Information");
                        var a = bind cn.staus;
                        if (a) {
                            var emp = txtEmpName.text;
                            if (emp == null or emp == "") {
                                emp = "Employee";
                            }
                            var userInfoModel: UserInformationModel = new UserInformationModel();
                            userInfoModel.setUserName(editUserName);
                            userInfoModel.setEmployeeName(emp);
                            var status = userController.deleteRecord(userInfoModel);
                            if (status) {
                                FXalert(5);
                                removeUser();
                            }
                        }
                    } else {
                        FXinfo("please Enter correct User Name"); }
                } else {
                    FXinfo("please select user name which u want to remove"); }
            } else {
                FXinfo("Current User Doesn't have the Privilege to Remove");
            }
        } catch (e: Exception) {
            var ss = " Class : UserInformation       Method: removeUserInfo       Exception: {e}";
            log.debug(ss);
        }
    }

    function resetValues(): Void {
        userType = "";
        txtEmpCode.text = "";
        txtEmpName.text = "";
        txtEmpUName.text = "";
        pwdEmpPass.text = "";
        pwdEmpConfirm.text = "";
        pwdCurrPass.text = "";
        HideAllChkBox();
        resetCombo();
        editPwd = null;
        editUserName = null;

        if (btnEmp1.text.equals("Save [F3]")) {
            txtEmpCode.requestFocus();
        }
        listUserEmp.visible = false;
        
        radUser.disable = false;
        radUserAdmin.disable = false;
        rdoUserRemove.disable = false;
        btnEmp1.disable = false ;
    }

    function resetCombo(): Void {
        home = 0; h1 = 0; h2 = 0; h3 = 0; h4 = 0; h5 = 3;
        sales = 0; s1 = 0; s2 = 0; s3 = 0; s4 = 0; s5 = 0;// s6=0;s7=0;s8=0;
        inventory = 0; inv1 = 0; inv2 = 0; inv3 = 0; inv4 = 0; inv5 = 0; inv6 = 0; inv7 = 0;
        masters = 0; m1 = 0; m2 = 0; m3 = 0; m4 = 0; m5 = 0; m6 = 0;
        financial = 0; f1 = 0; f2 = 0; f3 = 0; f4 = 0; f5 = 0; f6 = 0; f7 = 0; f8 = 0; f9 = 0; f10 = 0;
        crm = 0; crm1 = 0; crm2 = 0; crm3 = 0;
        reports = 0; r1 = 0; r2 = 0; r3 = 0; r4 = 0; r5 = 0; r6 = 0; r7 = 0; r8 = 0;
    }

    public function DateTime() {
        userInfoTimer = Timeline {
                    repeatCount: Timeline.INDEFINITE
                    keyFrames: KeyFrame {
                        time: 1s
                        action: function() {
                            setGetPrivillages();
                        }
                    }
                }
        userInfoTimer.play();
    }

    function setGetPrivillages() {

        if (home == 1) {
            h1 = choicebox11.selectedIndex;
            h2 = choicebox21.selectedIndex;
            h3 = choicebox31.selectedIndex;
            h4 = choicebox12.selectedIndex;
            h5 = choicebox22.selectedIndex;
        }
        if (sales == 1) {
            s1 = choicebox11.selectedIndex;
            s2 = choicebox21.selectedIndex;
            s3 = choicebox31.selectedIndex;
            s4 = choicebox12.selectedIndex;
            s5 = choicebox22.selectedIndex;
        //            s6 = choicebox22.selectedIndex;
        //            s7 = choicebox32.selectedIndex;
        //            s8 = choicebox42.selectedIndex;
        }
        if (inventory == 1) {
            inv1 = choicebox11.selectedIndex;
            inv2 = choicebox21.selectedIndex;
            inv3 = choicebox31.selectedIndex;
            inv4 = choicebox41.selectedIndex;
            inv5 = choicebox12.selectedIndex;
            inv6 = choicebox22.selectedIndex;
            inv7 = choicebox32.selectedIndex;
        }
        if (masters == 1) {
            m1 = choicebox11.selectedIndex;
            m2 = choicebox21.selectedIndex;
            m3 = choicebox31.selectedIndex;
            m4 = choicebox12.selectedIndex;
            m5 = choicebox22.selectedIndex;
            m6 = choicebox32.selectedIndex;

        }
        if (financial == 1) {
            f1 = choicebox11.selectedIndex;
            f2 = choicebox21.selectedIndex;
            f3 = choicebox31.selectedIndex;
            f4 = choicebox41.selectedIndex;
            f5 = choicebox51.selectedIndex;
            f6 = choicebox12.selectedIndex;
            f7 = choicebox22.selectedIndex;
            f8 = choicebox32.selectedIndex;
            f9 = choicebox42.selectedIndex;
            f10 = choicebox52.selectedIndex;
        }
        if (crm == 1) {
            crm1 = choicebox11.selectedIndex;
            crm2 = choicebox21.selectedIndex;
            crm3 = choicebox12.selectedIndex;
        }
        if (reports == 1) {
            r1 = choicebox11.selectedIndex;
            r2 = choicebox21.selectedIndex;
            r3 = choicebox31.selectedIndex;
            r4 = choicebox41.selectedIndex;
            r5 = choicebox12.selectedIndex;
            r6 = choicebox22.selectedIndex;
            r7 = choicebox32.selectedIndex;
            r8 = choicebox42.selectedIndex;
        }
    }

    var uAdminSelect: Boolean = radUserAdmin.selected on replace {
        if (uAdminSelect) {
            hboxTab.disable = true;
            panelTableBg.disable = true;
            panelModule1.disable = true;
            panelModule2.disable = true;
            panelModule3.disable = true;
            HideAllChkBox();
        } else {
            hboxTab.disable = false;
            panelTableBg.disable = false;
            panelModule1.disable = false;
            panelModule2.disable = false;
            panelModule3.disable = false;
        }
    }

    init {
        HideAllChkBox();
        FScreen();
        DateTime();
        rdoUserAdd.selected = true;
        txtEmpCode.requestFocus();
        imageClose.image = Image { url: "{__DIR__}images/FrmClose.png" };
    }

}