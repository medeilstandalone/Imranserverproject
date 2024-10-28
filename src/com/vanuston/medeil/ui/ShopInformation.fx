package com.vanuston.medeil.ui;

import java.lang.*;
 import javafx.scene.input.*;
import com.vanuston.medeil.util.Validation;
import com.vanuston.medeil.util.CommonDeclare;

import javafx.scene.image.Image;
import com.vanuston.medeil.util.Value;
import com.vanuston.medeil.util.Logger;
import javafx.scene.control.TextBox;
import com.vanuston.medeil.util.KeyRegistry;
import com.vanuston.medeil.model.MsgReturnModel;
import com.vanuston.medeil.model.StoreInformationModel;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;

public class ShopInformation {

    var log: Logger = Logger.getLogger(ShopInformation.class, "Settings");
    var sar: Integer = 0;
    var sar1: Integer = 0;
    var sar2: Integer = 0;
    var sar3: Integer = 0;
    public   var shopName: String = "";
    var listY = 0.0;
    var TotalAmt;
  
    var storeInfoController: com.vanuston.medeil.implementation.StoreInformation;
	
	
    var panelW = bind CommonDeclare.ScreenWidth - 4;
    var panelH = bind CommonDeclare.panelFormH;
    var C1LX = bind CommonDeclare.Column11LX;
    var C2LX = bind CommonDeclare.Column12LX;
    var C3LX = bind CommonDeclare.Column13LX;
    var C4LX = bind CommonDeclare.Column14LX;
    var botton1LX = bind CommonDeclare.botton11LX;
    var botton2LX = bind CommonDeclare.botton12LX;
    var botton3LX = bind CommonDeclare.botton13LX;
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
    var SetupcostLX = bind panelW * 82.421875 / 100;
    var SetupcostLY = bind panelH * 92.66055046 / 100;
    var lblTotalLX = bind panelW * 24.12109375 / 100;
    var TextboxTotalLX = bind lblTotalLX + 180;
    var AmtTextW = bind panelW - TextboxTotalLX;
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    var mandatoryStyle: String = CommonDeclare.textbox_mandatory();
    var errorStyle: String = CommonDeclare.textbox_error();
    def CustomAlert = CustomAlert {};
    var listH = 0.0;
    var listW = Type2TextboxW;
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    def __layoutInfo_separator: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
        height: 10.0
    }
    public-read def separator: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: 30.0
        layoutY: 339.0
        layoutInfo: __layoutInfo_separator
    }
    
    public-read def lblHeadingShop: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_separator3: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
    }
    public-read def separator3: javafx.scene.control.Separator = javafx.scene.control.Separator {
        visible: false
        layoutInfo: __layoutInfo_separator3
    }
    
    public-read def label16: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX
        text: "Label"
    }
    
    def __layoutInfo_txtShopCommodityCode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtShopCommodityCode: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C4LX
        layoutInfo: __layoutInfo_txtShopCommodityCode
    }
    
    public-read def lblHeading2: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_separator2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
        height: 3.0
    }
    public-read def separator2: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: 30.0
        layoutY: 188.0
        layoutInfo: __layoutInfo_separator2
    }
    
    def __layoutInfo_txtShopCountry: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtShopCountry: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX
        layoutY: 276.0
        layoutInfo: __layoutInfo_txtShopCountry
    }
    
    def __layoutInfo_txtShopState: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtShopState: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX
        layoutY: 298.0
        layoutInfo: __layoutInfo_txtShopState
    }
    
    def __layoutInfo_txtShopAdd3: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtShopAdd3: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX
        layoutY: 132.0
        layoutInfo: __layoutInfo_txtShopAdd3
    }
    
    def __layoutInfo_passwordEmail: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def passwordEmail: javafx.scene.control.PasswordBox = javafx.scene.control.PasswordBox {
        visible: false
        layoutX: bind C4LX
        layoutY: 447.0
        layoutInfo: __layoutInfo_passwordEmail
    }
    
    def __layoutInfo_label42: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def label42: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX
        layoutY: 447.0
        layoutInfo: __layoutInfo_label42
        text: "Email Password"
    }
    
    def __layoutInfo_separator5: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
    }
    public-read def separator5: javafx.scene.control.Separator = javafx.scene.control.Separator {
        visible: false
        layoutInfo: __layoutInfo_separator5
    }
    
    public-read def lblHeadingPharmacist: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtShopPhState: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtShopPhState: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C4LX
        layoutY: 339.0
        layoutInfo: __layoutInfo_txtShopPhState
    }
    
    def __layoutInfo_txtShopPhCountry: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtShopPhCountry: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX
        layoutY: 427.0
        layoutInfo: __layoutInfo_txtShopPhCountry
    }
    
    public-read def btnPhaNext: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        text: "Button"
        action: btnPhaBackAction
    }
    
    public-read def btnPhaBack: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 603.0
        layoutY: 233.0
        text: "Button"
    }
    
    public-read def listCustomer: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: 150.0
        layoutY: 100.0
        items: null
    }
    
    def __layoutInfo_separator4: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def separator4: javafx.scene.control.Separator = javafx.scene.control.Separator {
        visible: false
        layoutInfo: __layoutInfo_separator4
    }
    
    public-read def label39: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtShopAdminpwd: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 100.0
    }
    public-read def txtShopAdminpwd: javafx.scene.control.PasswordBox = javafx.scene.control.PasswordBox {
        layoutX: 364.0
        layoutY: 483.0
        layoutInfo: __layoutInfo_txtShopAdminpwd
        promptText: "* * * * * * * * "
    }
    
    def __layoutInfo_txtShopAdminConfmpwd: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 100.0
    }
    public-read def txtShopAdminConfmpwd: javafx.scene.control.PasswordBox = javafx.scene.control.PasswordBox {
        layoutX: bind C4LX
        layoutY: 483.0
        layoutInfo: __layoutInfo_txtShopAdminConfmpwd
        promptText: "* * * * * * * * "
    }
    
    public-read def rectShopCost: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 844.0
        layoutY: 525.0
        styleClass: "rectbutton"
        onMouseClicked: rectShopCostOnMouseClicked
        width: 100.0
        height: 50.0
    }
    
    def __layoutInfo_label36: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def label36: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 856.0
        layoutY: 525.0
        layoutInfo: __layoutInfo_label36
        text: "Label"
    }
    
    public-read def group: javafx.scene.Group = javafx.scene.Group {
        visible: false
        layoutX: bind SetupcostLX
        layoutY: bind SetupcostLY
        content: [ rectShopCost, label36, ]
    }
    
    public-read def imageClose: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind imageCloseLX
        layoutY: -6.0
        onMouseClicked: imageCloseOnMouseClicked
    }
    
    public-read def label15: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def label46: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def label38: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def label40: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def labelShop_Registration_Cost: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def labelElectrical_work_cost: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def labelCarpentry_work_cost_: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def panelLabelLeft: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind C1LX
        content: [ label46, label38, label40, labelShop_Registration_Cost, labelElectrical_work_cost, labelCarpentry_work_cost_, ]
    }
    
    def __layoutInfo_txtShopInvCost: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtShopInvCost: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 358.0
        layoutY: 67.0
        layoutInfo: __layoutInfo_txtShopInvCost
        onKeyReleased: txtShopInvCostOnKeyReleased
    }
    
    def __layoutInfo_txtShopBuildCost: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtShopBuildCost: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 358.0
        layoutY: 88.0
        layoutInfo: __layoutInfo_txtShopBuildCost
        onKeyReleased: txtShopBuildCostOnKeyReleased
    }
    
    def __layoutInfo_txtShopAdvCost: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtShopAdvCost: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 358.0
        layoutY: 109.0
        layoutInfo: __layoutInfo_txtShopAdvCost
        onKeyReleased: txtShopAdvCostOnKeyReleased
    }
    
    def __layoutInfo_txtShopRegCost: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtShopRegCost: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 364.0
        layoutY: 137.0
        layoutInfo: __layoutInfo_txtShopRegCost
        onKeyReleased: txtShopRegCostOnKeyReleased
    }
    
    def __layoutInfo_txtShopElecCost: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtShopElecCost: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 364.0
        layoutY: 159.0
        layoutInfo: __layoutInfo_txtShopElecCost
        onKeyReleased: txtShopElecCostOnKeyReleased
    }
    
    def __layoutInfo_txtShopCarpCost: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtShopCarpCost: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 351.0
        layoutY: 193.0
        layoutInfo: __layoutInfo_txtShopCarpCost
        onKeyReleased: txtShopCarpCostOnKeyReleased
    }
    
    public-read def panelTextLeft: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind C2LX+50
        content: [ txtShopInvCost, txtShopBuildCost, txtShopAdvCost, txtShopRegCost, txtShopElecCost, txtShopCarpCost, ]
    }
    
    public-read def labeCarpentry_work_cost_: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def labelAir_Conditioner_Cost_: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def labelDisplay_Boards_Cost_: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def labelComputers_and_peripherals_Cost_: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def labelOthers_: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def panelLabelRight: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind C3LX
        content: [ labeCarpentry_work_cost_, labelAir_Conditioner_Cost_, labelDisplay_Boards_Cost_, labelComputers_and_peripherals_Cost_, labelOthers_, ]
    }
    
    def __layoutInfo_txtShopRefCost: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtShopRefCost: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 380.0
        layoutY: 228.0
        layoutInfo: __layoutInfo_txtShopRefCost
        onKeyReleased: txtShopRefCostOnKeyReleased
    }
    
    def __layoutInfo_txtShopAcCost: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtShopAcCost: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 386.0
        layoutY: 261.0
        layoutInfo: __layoutInfo_txtShopAcCost
        onKeyReleased: txtShopAcCostOnKeyReleased
    }
    
    def __layoutInfo_txtShopDispCost: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtShopDispCost: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 397.0
        layoutY: 297.0
        layoutInfo: __layoutInfo_txtShopDispCost
        onKeyReleased: txtShopDispCostOnKeyReleased
    }
    
    def __layoutInfo_txtShopPeriCost: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtShopPeriCost: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 397.0
        layoutY: 321.0
        layoutInfo: __layoutInfo_txtShopPeriCost
        onKeyReleased: txtShopPeriCostOnKeyReleased
    }
    
    def __layoutInfo_txtShopOthersCost: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtShopOthersCost: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 386.0
        layoutY: 354.0
        layoutInfo: __layoutInfo_txtShopOthersCost
        onKeyReleased: txtShopOthersCostOnKeyReleased
    }
    
    public-read def panelTextRight: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind C4LX+50
        content: [ txtShopRefCost, txtShopAcCost, txtShopDispCost, txtShopPeriCost, txtShopOthersCost, ]
    }
    
    def __layoutInfo_txtTotalCost: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind AmtTextW
        height: 70.0
    }
    public-read def txtTotalCost: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind TextboxTotalLX
        layoutY: 350.0
        layoutInfo: __layoutInfo_txtTotalCost
        styleClass: "Borderless-text-box"
        text: bind TotalAmt
    }
    
    def __layoutInfo_label: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind lblTotalLX
        layoutInfo: __layoutInfo_label
        text: "Label"
    }
    
    public-read def btnCostNext: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        text: "Button"
        action: btnCostNextAction
    }
    
    public-read def btnCostBack: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 564.0
        layoutY: 303.0
        text: "Button"
    }
    
    public-read def panelCost: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ label15, panelLabelLeft, panelTextLeft, panelLabelRight, panelTextRight, txtTotalCost, label, btnCostNext, btnCostBack, ]
    }
    
    def __layoutInfo_listState: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listState: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C2LX
        layoutY: bind listY
        layoutInfo: __layoutInfo_listState
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    def __layoutInfo_listCount: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listCount: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C2LX
        layoutY: bind listY
        layoutInfo: __layoutInfo_listCount
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    def __layoutInfo_listCountry: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listCountry: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C2LX
        layoutY: bind listY
        layoutInfo: __layoutInfo_listCountry
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    def __layoutInfo_listStat: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listStat: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C4LX
        layoutY: bind listY
        layoutInfo: __layoutInfo_listStat
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    public-read def btnContacBack: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 354.0
        layoutY: 533.0
        text: "Button"
        action: btnContacBackAction
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
    }
    
    public-read def panelHomePage: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
    }
    
    public-read def panelMsgbox: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
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
    
    public-read def linearGradient2: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
    }
    
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 0.25
        styleClass: "rectFormHeader"
        fill: linearGradient2
        width: bind panelW
        height: 35.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
    }
    
    def __layoutInfo_txtShopAdminUName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtShopAdminUName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 150.0
        layoutY: 483.0
        layoutInfo: __layoutInfo_txtShopAdminUName
        font: Arial_12
    }
    
    def __layoutInfo_txtShopPEmail: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtShopPEmail: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 426.0
        layoutInfo: __layoutInfo_txtShopPEmail
        promptText: "xyz@domain.com"
        font: Arial_12
    }
    
    def __layoutInfo_txtShopPCNo2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtShopPCNo2: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 405.0
        layoutInfo: __layoutInfo_txtShopPCNo2
        promptText: ""
        font: Arial_12
    }
    
    def __layoutInfo_txtShopPCity: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtShopPCity: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 405.0
        layoutInfo: __layoutInfo_txtShopPCity
        font: Arial_12
    }
    
    def __layoutInfo_txtShopPAdd2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtShopPAdd2: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 384.0
        layoutInfo: __layoutInfo_txtShopPAdd2
        font: Arial_12
    }
    
    def __layoutInfo_txtShopPCNo1: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtShopPCNo1: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 384.0
        layoutInfo: __layoutInfo_txtShopPCNo1
        font: Arial_12
    }
    
    def __layoutInfo_txtShopPhPIN: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtShopPhPIN: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 360.0
        layoutInfo: __layoutInfo_txtShopPhPIN
        font: Arial_12
    }
    
    def __layoutInfo_txtShopPAdd1: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtShopPAdd1: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 363.0
        layoutInfo: __layoutInfo_txtShopPAdd1
        promptText: ""
        font: Arial_12
    }
    
    def __layoutInfo_txtShopPhName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtShopPhName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 342.0
        layoutInfo: __layoutInfo_txtShopPhName
        font: Arial_12
    }
    
    def __layoutInfo_txtShopEmail: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtShopEmail: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 276.0
        layoutInfo: __layoutInfo_txtShopEmail
        promptText: "xyz@domain.com"
        font: Arial_12
    }
    
    def __layoutInfo_txtShopFax: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtShopFax: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 297.0
        layoutInfo: __layoutInfo_txtShopFax
        font: Arial_12
    }
    
    def __layoutInfo_txtShopMob: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtShopMob: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 255.0
        layoutInfo: __layoutInfo_txtShopMob
        promptText: ""
        font: Arial_12
    }
    
    def __layoutInfo_txtShopCNo1: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtShopCNo1: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 213.0
        layoutInfo: __layoutInfo_txtShopCNo1
        promptText: ""
        font: Arial_12
    }
    
    def __layoutInfo_txtShopCNo2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtShopCNo2: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 234.0
        layoutInfo: __layoutInfo_txtShopCNo2
        font: Arial_12
    }
    
    def __layoutInfo_txtShopPinCode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtShopPinCode: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 192.0
        layoutInfo: __layoutInfo_txtShopPinCode
        font: Arial_12
    }
    
    def __layoutInfo_txtShopAdd2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtShopAdd2: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 180.0
        layoutInfo: __layoutInfo_txtShopAdd2
        font: Arial_12
    }
    
    def __layoutInfo_txtShopAdd1: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtShopAdd1: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        managed: true
        layoutX: bind C2LX
        layoutY: 192.0
        layoutInfo: __layoutInfo_txtShopAdd1
        font: Arial_12
    }
    
    def __layoutInfo_txtShopPANNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtShopPANNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 130.0
        layoutInfo: __layoutInfo_txtShopPANNo
        promptText: "Permanent Account Number..."
        font: Arial_12
    }
    
    def __layoutInfo_txtShopCSTNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtShopCSTNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 109.0
        layoutInfo: __layoutInfo_txtShopCSTNo
        promptText: "Central Sales Tax Number..."
        font: Arial_12
    }
    
    def __layoutInfo_txtShopTINNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtShopTINNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 88.0
        layoutInfo: __layoutInfo_txtShopTINNo
        promptText: "Tax Identification  Number..."
        font: Arial_12
    }
    
    def __layoutInfo_txtShopDLNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtShopDLNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 67.0
        layoutInfo: __layoutInfo_txtShopDLNo
        promptText: "Drug License Number..."
        font: Arial_12
    }
    
    def __layoutInfo_txtShopSName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtShopSName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 67.0
        layoutInfo: __layoutInfo_txtShopSName
        text: ""
        selectOnFocus: false
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtShopValidity: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtShopValidity: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 151.0
        layoutInfo: __layoutInfo_txtShopValidity
        font: Arial_12
    }
    
    def __layoutInfo_txtShopRegNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtShopRegNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 130.0
        layoutInfo: __layoutInfo_txtShopRegNo
        font: Arial_12
    }
    
    def __layoutInfo_txtShopLicHolder: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtShopLicHolder: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 109.0
        layoutInfo: __layoutInfo_txtShopLicHolder
        font: Arial_12
    }
    
    def __layoutInfo_txtShopOName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
        hfill: false
    }
    public-read def txtShopOName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 88.0
        layoutInfo: __layoutInfo_txtShopOName
        style: ""
        styleClass: "text-box"
        effect: null
        text: ""
        font: Arial_12
    }
    
    public-read def Arial_Bold_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
    }
    
    public-read def Arial_14: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 14.0
    }
    
    def __layoutInfo_txtShopCity: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtShopCity: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 255.0
        layoutInfo: __layoutInfo_txtShopCity
        font: Arial_14
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
        name: "Arial"
        size: 25.0
    }
    
    public-read def DarkGray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.2
        blue: 0.2
    }
    
    public-read def label24: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 480.0
        layoutY: 483.0
        text: "Confirm password"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label26: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 483.0
        text: "User name"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label31: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 426.0
        text: "Country"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label35: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 426.0
        text: "Email Id "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label28: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 405.0
        text: "Mobile No"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label30: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 405.0
        text: "City"
        font: Arial_12
        textFill: DarkGray
    }
    
    def __layoutInfo_label34: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 80.0
    }
    public-read def label34: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 384.0
        layoutInfo: __layoutInfo_label34
        text: "Phone No "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label33: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 363.0
        text: "Pin Code "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label32: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 342.0
        text: "State"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label29: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 363.0
        text: "Address"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label27: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 342.0
        text: " Name"
        font: Arial_12
        textFill: DarkGray
    }
    
    def __layoutInfo_label23: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def label23: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 297.0
        layoutInfo: __layoutInfo_label23
        text: "Fax"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 276.0
        text: "Email Id "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label13: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 255.0
        text: "Mobile No"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label22: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 297.0
        text: "State"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label21: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 276.0
        text: "Country"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label20: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 255.0
        text: "City"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label1: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 234.0
        text: "Contact No 2"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label6: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 213.0
        text: "Contact No 1"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 192.0
        text: "Pincode "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label17: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 192.0
        text: "Address"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label11: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 130.0
        text: "PAN No"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label10: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 109.0
        text: "CST No"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 88.0
        text: "TIN No"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label8: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 67.0
        text: "D. L No "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 151.0
        text: "Validity"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label12: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 130.0
        text: "Registration No"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 109.0
        styleClass: "label"
        text: "License Holder "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 88.0
        text: "Owner "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label14: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 67.0
        text: "Shop Name"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def panelGeneral: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: 0.0
        layoutY: -123.0
        content: [ lblHeadingShop, separator3, label14, txtShopOName, txtShopLicHolder, txtShopRegNo, txtShopValidity, txtShopSName, label9, label2, label12, label3, label8, label4, label10, label11, label16, txtShopDLNo, txtShopTINNo, txtShopCSTNo, txtShopPANNo, txtShopCommodityCode, ]
    }
    
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        opacity: 1.0
        layoutX: 1.0
        layoutY: 0.0
        styleClass: "form-background"
        onMouseClicked: rectangleOnMouseClicked
        blocksMouse: true
        fill: linearGradient
        stroke: DarkGray
        strokeWidth: 2.0
        width: bind panelW
        height: bind panelH
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.4
    }
    
    public-read def label18: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 27.0
        layoutY: 446.0
        text: "Administrator Details"
        font: Arial_18
        textFill: Green
    }
    
    public-read def panelAdmin: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: 289.0
        layoutY: 381.0
        content: [ separator4, label18, label39, label26, label24, txtShopAdminUName, txtShopAdminpwd, txtShopAdminConfmpwd, ]
    }
    
    public-read def dropShadowEffect: javafx.scene.effect.DropShadow = javafx.scene.effect.DropShadow {
    }
    
    public-read def lightingEffect: javafx.scene.effect.Lighting = javafx.scene.effect.Lighting {
    }
    
    public-read def Yellow: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.95
        green: 0.94
        blue: 0.86
    }
    
    public-read def font: javafx.scene.text.Font = javafx.scene.text.Font {
    }
    
    public-read def Color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.6
    }
    
    public-read def Arial_Bold_25: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 25.0
    }
    
    def __layoutInfo_lblHeading: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
    }
    public-read def lblHeading: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 575.0
        layoutY: 2.0
        layoutInfo: __layoutInfo_lblHeading
        styleClass: "labelFormHeading"
        effect: lightingEffect
        text: "Store Information"
        font: Arial_Bold_25
        textFill: DarkGray
    }
    
    public-read def imgSave: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Save1.png"
    }
    
    public-read def imageSave: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        image: imgSave
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnShopSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnShopSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnShopSave
        translateX: 0.0
        effect: reflectionEffect
        graphic: imageSave
        text: "Save"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    public-read def imgReset: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Reset.png"
    }
    
    public-read def imageReset: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        image: imgReset
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnShopReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnShopReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton2LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnShopReset
        effect: reflectionEffect
        graphic: imageReset
        text: "Reset"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    public-read def imgCancel: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Cancel.png"
    }
    
    public-read def imageCancel: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        image: imgCancel
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnShopCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnShopCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton3LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnShopCancel
        effect: reflectionEffect
        graphic: imageCancel
        text: "Cancel"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    public-read def panelButtons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: bind panelButtonsLY
        content: [ btnShopSave, btnShopReset, btnShopCancel, ]
    }
    
    public-read def Arial_Bold_65: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 60.0
    }
    
    public-read def imageBack: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/arrow_Left.png"
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C2LX+Type2TextboxW
        layoutY: 90.0
        onMouseClicked: imageViewOnMouseClicked
        image: image
    }
    
    public-read def image2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imageView2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind Type2TextboxW+C2LX
        layoutY: 63.0
        image: image2
    }
    
    public-read def panelContact: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: 54.0
        layoutY: 88.0
        content: [ lblHeading2, label17, separator2, txtShopAdd1, txtShopAdd2, imageView, label5, label6, label1, label20, txtShopCity, txtShopCountry, label21, label22, txtShopState, label13, label7, label23, txtShopPinCode, txtShopCNo2, txtShopCNo1, txtShopMob, txtShopFax, txtShopEmail, txtShopAdd3, passwordEmail, label42, imageView2, ]
    }
    
    public-read def image3: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imageView3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind Type2TextboxW+C2LX
        layoutY: 36.0
        image: image3
    }
    
    public-read def image4: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imageView4: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind Type1TextboxW+C4LX
        layoutY: 111.0
        image: image4
    }
    
    public-read def panelPharmacist: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: 56.0
        layoutY: 249.0
        content: [ separator5, lblHeadingPharmacist, label27, txtShopPhName, label29, txtShopPAdd1, label32, txtShopPhState, imageView4, txtShopPhPIN, label33, label34, txtShopPhCountry, imageView3, txtShopPCNo1, txtShopPAdd2, label30, txtShopPCity, txtShopPCNo2, label28, label35, txtShopPEmail, label31, btnPhaNext, btnPhaBack, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        content: [ rectangle, rectHeader, lblHeading, separator, panelGeneral, panelContact, panelPharmacist, listCustomer, panelAdmin, group, imageClose, panelCost, panelButtons, listState, listCount, listCountry, listStat, btnContacBack, panelAlert, ]
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "FScreen", "ShopSetupCost", ]
        actual: 0
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectangle.visible = true;
                            rectHeader.visible = true;
                            lblHeading.layoutX = 0.0;
                            lblHeading.layoutY = 2.0;
                            lblHeading.styleClass = "labelFormHeading";
                            lblHeading.hpos = javafx.geometry.HPos.CENTER;
                            separator.visible = false;
                            separator.layoutY = 22.0;
                            lblHeadingShop.visible = true;
                            lblHeadingShop.layoutX = 35.0;
                            lblHeadingShop.text = "Store Details";
                            lblHeadingShop.font = Arial_18;
                            lblHeadingShop.textFill = Green;
                            separator3.visible = true;
                            separator3.layoutX = 30.0;
                            separator3.layoutY = 22.0;
                            label14.visible = true;
                            label14.layoutY = 27.0;
                            label14.text = "Store Name";
                            label14.font = Arial_12;
                            txtShopOName.visible = true;
                            txtShopOName.layoutY = 48.0;
                            txtShopOName.styleClass = "text-box";
                            txtShopOName.onKeyPressed = txtShopONameOnKeyPressedAtShown;
                            txtShopLicHolder.visible = true;
                            txtShopLicHolder.layoutY = 69.0;
                            txtShopLicHolder.onKeyPressed = txtShopLicHolderOnKeyPressedAtShown;
                            txtShopRegNo.visible = true;
                            txtShopRegNo.layoutY = 90.0;
                            txtShopRegNo.onKeyPressed = txtShopRegNoOnKeyPressedAtShown;
                            txtShopValidity.visible = false;
                            txtShopValidity.layoutY = 111.0;
                            txtShopValidity.onKeyPressed = txtShopValidityOnKeyPressedAtShown;
                            txtShopSName.visible = true;
                            txtShopSName.layoutY = 27.0;
                            __layoutInfo_txtShopSName.vfill = false;
                            __layoutInfo_txtShopSName.hpos = javafx.geometry.HPos.LEFT;
                            __layoutInfo_txtShopSName.vpos = javafx.geometry.VPos.CENTER;
                            txtShopSName.styleClass = "text-box";
                            txtShopSName.onKeyPressed = txtShopSNameOnKeyPressedAtShown;
                            txtShopSName.editable = true;
                            txtShopSName.font = Arial_12;
                            label9.visible = true;
                            label9.layoutY = 48.0;
                            label9.text = "Owner ";
                            label2.visible = true;
                            label2.layoutY = 69.0;
                            label2.text = "License Holder ";
                            label12.visible = true;
                            label12.layoutY = 90.0;
                            label12.text = "Registration Number";
                            label3.visible = false;
                            label3.layoutY = 111.0;
                            label3.text = "Validity";
                            label8.visible = true;
                            label8.layoutY = 27.0;
                            label8.text = "D.L. Number ";
                            label4.visible = true;
                            label4.layoutY = 48.0;
                            label4.text = "TIN. Number";
                            label10.visible = true;
                            label10.layoutY = 69.0;
                            label10.text = "CST. Number";
                            label11.visible = true;
                            label11.layoutY = 90.0;
                            label11.text = "PAN. Number";
                            label16.visible = false;
                            label16.layoutY = 111.0;
                            label16.text = "Commodity Code";
                            label16.font = Arial_12;
                            label16.textFill = DarkGray;
                            txtShopDLNo.visible = true;
                            txtShopDLNo.layoutY = 27.0;
                            txtShopDLNo.onKeyPressed = txtShopDLNoOnKeyPressedAtShown;
                            txtShopTINNo.visible = true;
                            txtShopTINNo.layoutY = 48.0;
                            txtShopTINNo.onKeyPressed = txtShopTINNoOnKeyPressedAtShown;
                            txtShopCSTNo.visible = true;
                            txtShopCSTNo.layoutY = 69.0;
                            txtShopCSTNo.onKeyPressed = txtShopCSTNoOnKeyPressedAtShown;
                            txtShopPANNo.visible = true;
                            txtShopPANNo.layoutY = 90.0;
                            txtShopPANNo.onKeyPressed = txtShopPANNoOnKeyPressedAtShown;
                            txtShopCommodityCode.visible = false;
                            txtShopCommodityCode.layoutY = 111.0;
                            txtShopCommodityCode.onKeyPressed = txtShopCommodityCodeOnKeyPressedAtFScreen;
                            txtShopCommodityCode.promptText = "Commodity Code...";
                            txtShopCommodityCode.font = Arial_12;
                            panelGeneral.visible = true;
                            panelGeneral.layoutX = 0.0;
                            panelGeneral.layoutY = 40.0;
                            lblHeading2.visible = true;
                            lblHeading2.layoutX = 35.0;
                            lblHeading2.text = "Contact Details";
                            lblHeading2.font = Arial_18;
                            lblHeading2.textFill = Green;
                            label17.layoutY = 27.0;
                            label17.text = "Address";
                            separator2.visible = true;
                            separator2.layoutY = 22.0;
                            txtShopAdd1.visible = true;
                            txtShopAdd1.layoutY = 27.0;
                            txtShopAdd1.onKeyPressed = txtShopAdd1OnKeyPressedAtShown;
                            txtShopAdd2.visible = true;
                            txtShopAdd2.layoutY = 48.0;
                            txtShopAdd2.onKeyPressed = txtShopAdd2OnKeyPressedAtShown;
                            imageView.visible = true;
                            imageView.layoutY = 133.0;
                            imageView.blocksMouse = true;
                            label5.visible = true;
                            label5.layoutY = 27.0;
                            label6.visible = true;
                            label6.layoutY = 48.0;
                            label6.text = "Phone No. 1";
                            label1.visible = true;
                            label1.layoutY = 69.0;
                            label1.text = "Phone No. 2";
                            label20.layoutY = 90.0;
                            label20.text = "City";
                            txtShopCity.visible = true;
                            txtShopCity.layoutY = 90.0;
                            __layoutInfo_txtShopCity.height = 21.0;
                            txtShopCity.onKeyPressed = txtShopCityOnKeyPressedAtShown;
                            txtShopCity.font = Arial_12;
                            txtShopCountry.visible = true;
                            txtShopCountry.layoutY = 111.0;
                            txtShopCountry.onKeyPressed = txtShopCountryOnKeyPressedAtFScreen;
                            txtShopCountry.onKeyReleased = txtShopCountryOnKeyReleasedAtFScreen;
                            txtShopCountry.font = Arial_12;
                            label21.layoutY = 111.0;
                            label21.text = "Country";
                            label22.layoutY = 132.0;
                            label22.text = "State";
                            txtShopState.visible = true;
                            txtShopState.layoutY = 133.0;
                            txtShopState.onKeyPressed = txtShopStateOnKeyPressedAtFScreen;
                            txtShopState.onKeyReleased = txtShopStateOnKeyReleasedAtFScreen;
                            txtShopState.font = Arial_12;
                            label13.visible = true;
                            label13.layoutY = 90.0;
                            label13.text = "Mobile No.";
                            label7.visible = true;
                            label7.layoutY = 111.0;
                            label7.text = "Email ID";
                            label23.visible = true;
                            label23.layoutY = 152.0;
                            __layoutInfo_label23.width = 132.0;
                            label23.text = "Fax No.";
                            txtShopPinCode.visible = true;
                            txtShopPinCode.layoutY = 27.0;
                            txtShopPinCode.onKeyPressed = txtShopPinCodeOnKeyPressedAtShown;
                            txtShopCNo2.visible = true;
                            txtShopCNo2.layoutY = 69.0;
                            txtShopCNo2.onKeyPressed = txtShopCNo2OnKeyPressedAtShown;
                            txtShopCNo1.visible = true;
                            txtShopCNo1.layoutY = 48.0;
                            txtShopCNo1.onKeyPressed = txtShopCNo1OnKeyPressedAtShown;
                            txtShopMob.visible = true;
                            txtShopMob.layoutY = 90.0;
                            txtShopMob.onKeyPressed = txtShopMobOnKeyPressedAtShown;
                            txtShopFax.visible = true;
                            txtShopFax.layoutY = 152.0;
                            txtShopFax.onKeyPressed = txtShopFaxOnKeyPressedAtShown;
                            txtShopEmail.visible = true;
                            txtShopEmail.layoutY = 111.0;
                            txtShopEmail.onKeyPressed = txtShopEmailOnKeyPressedAtShown;
                            txtShopAdd3.visible = true;
                            txtShopAdd3.layoutY = 69.0;
                            txtShopAdd3.onKeyPressed = txtShopAdd3OnKeyPressedAtFScreen;
                            txtShopAdd3.font = Arial_12;
                            passwordEmail.visible = true;
                            passwordEmail.layoutY = 132.0;
                            passwordEmail.onKeyPressed = passwordEmailOnKeyPressedAtFScreen;
                            label42.visible = true;
                            label42.layoutY = 132.0;
                            __layoutInfo_label42.width = 100.0;
                            label42.font = Arial_12;
                            label42.textFill = DarkGray;
                            imageView2.visible = true;
                            imageView2.layoutY = 111.0;
                            imageView2.onMouseClicked = imageView2OnMouseClickedAtFScreen;
                            imageView2.blocksMouse = true;
                            panelContact.visible = true;
                            panelContact.layoutX = 0.0;
                            panelContact.layoutY = 173.0;
                            separator5.visible = true;
                            separator5.layoutX = 30.0;
                            separator5.layoutY = 22.0;
                            lblHeadingPharmacist.visible = true;
                            lblHeadingPharmacist.layoutX = 35.0;
                            lblHeadingPharmacist.text = "Pharmacist Details";
                            lblHeadingPharmacist.font = Arial_18;
                            lblHeadingPharmacist.textFill = Green;
                            label27.visible = true;
                            label27.layoutY = 27.0;
                            label27.text = "Name";
                            txtShopPhName.visible = true;
                            txtShopPhName.layoutY = 27.0;
                            txtShopPhName.onKeyPressed = txtShopPhNameOnKeyPressedAtShown;
                            label29.visible = true;
                            label29.layoutY = 48.0;
                            label29.text = "Address";
                            txtShopPAdd1.visible = true;
                            txtShopPAdd1.layoutY = 48.0;
                            txtShopPAdd1.onKeyPressed = txtShopPAdd1OnKeyPressedAtShown;
                            label32.visible = true;
                            label32.layoutY = 27.0;
                            txtShopPhState.visible = true;
                            txtShopPhState.layoutY = 27.0;
                            txtShopPhState.onKeyPressed = txtShopPhStateOnKeyPressedAtFScreen;
                            txtShopPhState.onKeyReleased = txtShopPhStateOnKeyReleasedAtFScreen;
                            txtShopPhState.font = Arial_12;
                            imageView4.visible = true;
                            imageView4.layoutY = 27.0;
                            imageView4.onMouseClicked = imageView4OnMouseClickedAtFScreen;
                            imageView4.blocksMouse = true;
                            txtShopPhPIN.visible = true;
                            txtShopPhPIN.layoutY = 48.0;
                            txtShopPhPIN.onKeyPressed = txtShopPhPINOnKeyPressedAtShown;
                            label33.visible = true;
                            label33.layoutY = 48.0;
                            label33.text = "Pincode ";
                            label34.visible = true;
                            label34.layoutY = 69.0;
                            label34.text = "Phone No.";
                            txtShopPhCountry.visible = true;
                            txtShopPhCountry.layoutY = 111.0;
                            txtShopPhCountry.onKeyPressed = txtShopPhCountryOnKeyPressedAtFScreen;
                            txtShopPhCountry.onKeyReleased = txtShopPhCountryOnKeyReleasedAtFScreen;
                            txtShopPhCountry.font = Arial_12;
                            imageView3.visible = true;
                            imageView3.layoutY = 111.0;
                            imageView3.onMouseClicked = imageView3OnMouseClickedAtFScreen;
                            imageView3.blocksMouse = true;
                            txtShopPCNo1.visible = true;
                            txtShopPCNo1.layoutY = 69.0;
                            txtShopPCNo1.onKeyPressed = txtShopPCNo1OnKeyPressedAtShown;
                            txtShopPAdd2.visible = true;
                            txtShopPAdd2.layoutY = 69.0;
                            txtShopPAdd2.onKeyPressed = txtShopPAdd2OnKeyPressedAtShown;
                            label30.visible = true;
                            label30.layoutY = 90.0;
                            label30.text = "City";
                            txtShopPCity.visible = true;
                            txtShopPCity.layoutY = 90.0;
                            txtShopPCity.onKeyPressed = txtShopPCityOnKeyPressedAtShown;
                            txtShopPCNo2.visible = true;
                            txtShopPCNo2.layoutY = 90.0;
                            txtShopPCNo2.onKeyPressed = txtShopPCNo2OnKeyPressedAtShown;
                            label28.visible = true;
                            label28.layoutY = 90.0;
                            label28.text = "Mobile No.";
                            label35.visible = true;
                            label35.layoutY = 111.0;
                            label35.text = "Email ID";
                            txtShopPEmail.visible = true;
                            txtShopPEmail.layoutY = 111.0;
                            txtShopPEmail.onKeyPressed = txtShopPEmailOnKeyPressedAtShown;
                            label31.visible = true;
                            label31.layoutY = 111.0;
                            panelPharmacist.visible = true;
                            panelPharmacist.layoutX = 0.0;
                            panelPharmacist.layoutY = 325.0;
                            separator4.visible = true;
                            separator4.layoutX = 30.0;
                            separator4.layoutY = 22.0;
                            __layoutInfo_separator4.width = 963.0;
                            label18.visible = true;
                            label18.layoutX = 35.0;
                            label18.layoutY = 0.0;
                            label26.visible = true;
                            label26.layoutY = 27.0;
                            label24.visible = true;
                            label24.layoutX = 630.0;
                            label24.layoutY = 27.0;
                            txtShopAdminUName.visible = true;
                            txtShopAdminUName.layoutX = 300.0;
                            txtShopAdminUName.layoutY = 27.0;
                            txtShopAdminUName.onKeyPressed = txtShopAdminUNameOnKeyPressedAtShown;
                            txtShopAdminpwd.visible = true;
                            txtShopAdminpwd.layoutX = 514.0;
                            txtShopAdminpwd.layoutY = 27.0;
                            txtShopAdminpwd.onKeyPressed = txtShopAdminpwdOnKeyPressedAtShown;
                            txtShopAdminConfmpwd.visible = true;
                            txtShopAdminConfmpwd.layoutY = 27.0;
                            txtShopAdminConfmpwd.onKeyPressed = txtShopAdminConfmpwdOnKeyPressedAtShown;
                            panelAdmin.visible = false;
                            panelAdmin.layoutX = 0.0;
                            panelAdmin.layoutY = 461.0;
                            rectShopCost.visible = true;
                            rectShopCost.cursor = javafx.scene.Cursor.HAND;
                            rectShopCost.layoutX = 0.0;
                            rectShopCost.layoutY = 0.0;
                            rectShopCost.styleClass = "rectbutton";
                            rectShopCost.onKeyPressed = rectShopCostOnKeyPressedAtFScreen;
                            rectShopCost.onMouseClicked = rectShopCostOnMouseClickedAtFScreen;
                            rectShopCost.focusTraversable = true;
                            rectShopCost.fill = Yellow;
                            rectShopCost.stroke = DarkGray;
                            rectShopCost.strokeWidth = 2.0;
                            rectShopCost.width = 120.0;
                            rectShopCost.height = 20.0;
                            rectShopCost.arcWidth = 10.0;
                            rectShopCost.arcHeight = 10.0;
                            label36.visible = true;
                            label36.layoutX = 0.0;
                            label36.layoutY = 0.0;
                            __layoutInfo_label36.width = 120.0;
                            __layoutInfo_label36.height = 20.0;
                            label36.text = "Store Setup Cost";
                            label36.font = Arial_Bold_12;
                            label36.hpos = javafx.geometry.HPos.CENTER;
                            label36.textFill = DarkGray;
                            group.visible = true;
                            imageClose.layoutY = 1.0;
                            label15.visible = false;
                            label15.layoutX = 0.0;
                            label15.text = "Label";
                            label15.textFill = javafx.scene.paint.Color.BLACK;
                            label46.visible = false;
                            label46.layoutX = 0.0;
                            label46.layoutY = 0.0;
                            label46.text = "Label";
                            label46.textFill = javafx.scene.paint.Color.BLACK;
                            label38.visible = false;
                            label38.layoutY = 0.0;
                            label38.text = "Label";
                            label38.textFill = javafx.scene.paint.Color.BLACK;
                            label40.visible = false;
                            label40.layoutY = 0.0;
                            label40.text = "Label";
                            label40.textFill = javafx.scene.paint.Color.BLACK;
                            labelShop_Registration_Cost.visible = false;
                            labelShop_Registration_Cost.layoutY = 0.0;
                            labelShop_Registration_Cost.text = "Label";
                            labelShop_Registration_Cost.textFill = javafx.scene.paint.Color.BLACK;
                            labelElectrical_work_cost.visible = false;
                            labelElectrical_work_cost.layoutY = 0.0;
                            labelElectrical_work_cost.text = "Label";
                            labelElectrical_work_cost.textFill = javafx.scene.paint.Color.BLACK;
                            labelCarpentry_work_cost_.visible = false;
                            labelCarpentry_work_cost_.layoutY = 0.0;
                            labelCarpentry_work_cost_.text = "Label";
                            labelCarpentry_work_cost_.textFill = javafx.scene.paint.Color.BLACK;
                            panelLabelLeft.visible = false;
                            panelLabelLeft.layoutY = 0.0;
                            txtShopInvCost.visible = false;
                            txtShopInvCost.layoutX = 358.0;
                            txtShopInvCost.layoutY = 67.0;
                            txtShopInvCost.promptText = null;
                            txtShopBuildCost.visible = false;
                            txtShopBuildCost.layoutX = 358.0;
                            txtShopBuildCost.layoutY = 88.0;
                            txtShopBuildCost.promptText = null;
                            txtShopAdvCost.visible = false;
                            txtShopAdvCost.layoutX = 358.0;
                            txtShopAdvCost.layoutY = 109.0;
                            txtShopAdvCost.promptText = null;
                            txtShopRegCost.visible = false;
                            txtShopRegCost.layoutX = 364.0;
                            txtShopRegCost.layoutY = 137.0;
                            txtShopRegCost.promptText = null;
                            txtShopElecCost.visible = false;
                            txtShopElecCost.layoutX = 364.0;
                            txtShopElecCost.layoutY = 159.0;
                            txtShopElecCost.promptText = null;
                            txtShopCarpCost.visible = false;
                            txtShopCarpCost.layoutX = 351.0;
                            txtShopCarpCost.layoutY = 193.0;
                            txtShopCarpCost.promptText = null;
                            panelTextLeft.visible = false;
                            panelTextLeft.layoutY = 0.0;
                            labeCarpentry_work_cost_.visible = false;
                            labeCarpentry_work_cost_.layoutY = 0.0;
                            labeCarpentry_work_cost_.text = "Label";
                            labeCarpentry_work_cost_.textFill = javafx.scene.paint.Color.BLACK;
                            labelAir_Conditioner_Cost_.visible = false;
                            labelAir_Conditioner_Cost_.layoutY = 0.0;
                            labelAir_Conditioner_Cost_.text = "Label";
                            labelAir_Conditioner_Cost_.textFill = javafx.scene.paint.Color.BLACK;
                            labelDisplay_Boards_Cost_.visible = false;
                            labelDisplay_Boards_Cost_.layoutY = 0.0;
                            labelDisplay_Boards_Cost_.text = "Label";
                            labelDisplay_Boards_Cost_.textFill = javafx.scene.paint.Color.BLACK;
                            labelComputers_and_peripherals_Cost_.visible = false;
                            labelComputers_and_peripherals_Cost_.layoutY = 0.0;
                            labelComputers_and_peripherals_Cost_.text = "Label";
                            labelComputers_and_peripherals_Cost_.textFill = javafx.scene.paint.Color.BLACK;
                            labelOthers_.visible = false;
                            labelOthers_.layoutY = 0.0;
                            labelOthers_.text = "Label";
                            labelOthers_.textFill = javafx.scene.paint.Color.BLACK;
                            panelLabelRight.visible = false;
                            panelLabelRight.layoutY = 0.0;
                            txtShopRefCost.visible = false;
                            txtShopRefCost.layoutX = 380.0;
                            txtShopRefCost.layoutY = 228.0;
                            txtShopRefCost.promptText = null;
                            txtShopAcCost.visible = false;
                            txtShopAcCost.layoutX = 386.0;
                            txtShopAcCost.layoutY = 261.0;
                            txtShopAcCost.promptText = null;
                            txtShopDispCost.visible = false;
                            txtShopDispCost.layoutX = 397.0;
                            txtShopDispCost.layoutY = 297.0;
                            txtShopDispCost.promptText = null;
                            txtShopPeriCost.visible = false;
                            txtShopPeriCost.layoutX = 397.0;
                            txtShopPeriCost.layoutY = 321.0;
                            txtShopPeriCost.promptText = null;
                            txtShopOthersCost.visible = false;
                            txtShopOthersCost.layoutX = 386.0;
                            txtShopOthersCost.layoutY = 354.0;
                            txtShopOthersCost.promptText = null;
                            panelTextRight.visible = false;
                            panelTextRight.layoutY = 0.0;
                            txtTotalCost.visible = false;
                            txtTotalCost.focusTraversable = true;
                            label.visible = false;
                            label.opacity = 1.0;
                            label.layoutY = 0.0;
                            label.text = "Label";
                            label.textFill = javafx.scene.paint.Color.BLACK;
                            panelCost.visible = false;
                            panelCost.layoutY = 0.0;
                            imageSave.visible = true;
                            btnShopSave.visible = true;
                            btnShopSave.layoutY = 0.0;
                            btnShopSave.onKeyPressed = btnShopSaveOnKeyPressedAtShown;
                            btnShopSave.onMouseClicked = btnShopSaveOnMouseClickedAtShown;
                            imageReset.visible = true;
                            btnShopReset.visible = true;
                            btnShopReset.layoutY = 0.0;
                            btnShopReset.onKeyPressed = btnShopResetOnKeyPressedAtShown;
                            btnShopReset.onMouseClicked = btnShopResetOnMouseClickedAtShown;
                            imageCancel.visible = true;
                            imageCancel.image = imgCancel;
                            btnShopCancel.visible = true;
                            btnShopCancel.layoutY = 0.0;
                            btnShopCancel.onKeyPressed = btnShopCancelOnKeyPressedAtFScreen;
                            btnShopCancel.text = "Cancel";
                            btnShopCancel.action = btnShopCancelActionAtShown;
                            panelButtons.visible = true;
                            listState.visible = false;
                            listState.onKeyPressed = listStateOnKeyPressedAtFScreen;
                            listCount.visible = false;
                            listCount.onKeyPressed = listCountOnKeyPressedAtFScreen;
                            listCountry.visible = false;
                            listCountry.onKeyPressed = listCountryOnKeyPressedAtFScreen;
                            listStat.visible = false;
                            panel.visible = true;
                            panelHomePage.visible = true;
                            panelMsgbox.visible = false;
                        }
                    }
                ]
            }
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectangle.visible = true;
                            rectHeader.visible = true;
                            lblHeading.layoutX = 0.0;
                            lblHeading.layoutY = 2.0;
                            lblHeading.styleClass = "labelFormHeading";
                            lblHeading.hpos = javafx.geometry.HPos.CENTER;
                            separator.visible = true;
                            separator.layoutY = 62.0;
                            lblHeadingShop.visible = false;
                            lblHeadingShop.layoutX = 0.0;
                            lblHeadingShop.text = "Label";
                            lblHeadingShop.textFill = javafx.scene.paint.Color.BLACK;
                            separator3.visible = false;
                            separator3.layoutX = 0.0;
                            separator3.layoutY = 0.0;
                            label14.visible = false;
                            label14.layoutY = 75.0;
                            label14.text = "Initial Investment for";
                            label14.font = Arial_12;
                            txtShopOName.visible = false;
                            txtShopOName.layoutY = 88.0;
                            txtShopOName.styleClass = "text-box";
                            txtShopLicHolder.visible = false;
                            txtShopLicHolder.layoutY = 109.0;
                            txtShopRegNo.visible = false;
                            txtShopRegNo.layoutY = 130.0;
                            txtShopValidity.visible = false;
                            txtShopValidity.layoutY = 151.0;
                            txtShopSName.visible = false;
                            txtShopSName.layoutY = 67.0;
                            txtShopSName.styleClass = "text-box";
                            txtShopSName.editable = false;
                            txtShopSName.font = Arial_12;
                            label9.visible = false;
                            label9.layoutY = 88.0;
                            label9.text = "Drugs purchase";
                            label2.visible = false;
                            label2.layoutY = 116.0;
                            label2.text = "Building Costs";
                            label12.visible = false;
                            label12.layoutY = 144.0;
                            label12.text = "Advance or Lease Cost";
                            label3.visible = false;
                            label3.layoutY = 172.0;
                            label3.text = "Shop Registration Cost";
                            label8.visible = false;
                            label8.layoutY = 67.0;
                            label8.text = "D. L No ";
                            label4.visible = false;
                            label4.layoutY = 88.0;
                            label4.text = "TIN No";
                            label10.visible = false;
                            label10.layoutY = 109.0;
                            label10.text = "CST No";
                            label11.visible = false;
                            label11.layoutY = 130.0;
                            label11.text = "PAN No";
                            label16.visible = false;
                            label16.layoutY = 0.0;
                            label16.text = "Label";
                            label16.textFill = javafx.scene.paint.Color.BLACK;
                            txtShopDLNo.visible = false;
                            txtShopDLNo.layoutY = 67.0;
                            txtShopTINNo.visible = false;
                            txtShopTINNo.layoutY = 88.0;
                            txtShopCSTNo.visible = false;
                            txtShopCSTNo.layoutY = 109.0;
                            txtShopPANNo.visible = false;
                            txtShopPANNo.layoutY = 130.0;
                            txtShopCommodityCode.visible = false;
                            txtShopCommodityCode.layoutY = 0.0;
                            txtShopCommodityCode.promptText = null;
                            panelGeneral.visible = false;
                            panelGeneral.layoutX = 0.0;
                            panelGeneral.layoutY = 40.0;
                            lblHeading2.visible = false;
                            lblHeading2.layoutX = 0.0;
                            lblHeading2.text = "Label";
                            lblHeading2.textFill = javafx.scene.paint.Color.BLACK;
                            label17.layoutY = 200.0;
                            label17.text = "Electrical work Cost";
                            separator2.visible = false;
                            separator2.layoutY = 188.0;
                            txtShopAdd1.visible = false;
                            txtShopAdd1.layoutY = 192.0;
                            txtShopAdd2.visible = false;
                            txtShopAdd2.layoutY = 180.0;
                            imageView.visible = false;
                            imageView.layoutY = 90.0;
                            imageView.blocksMouse = false;
                            label5.visible = false;
                            label5.layoutY = 192.0;
                            label6.visible = false;
                            label6.layoutY = 213.0;
                            label6.text = "Contact No 1";
                            label1.visible = false;
                            label1.layoutY = 234.0;
                            label1.text = "Contact No 2";
                            label20.layoutY = 228.0;
                            label20.text = "Carpentry work cost";
                            txtShopCity.visible = false;
                            txtShopCity.layoutY = 255.0;
                            txtShopCity.font = Arial_14;
                            txtShopCountry.visible = false;
                            txtShopCountry.layoutY = 276.0;
                            label21.layoutY = 256.0;
                            label21.text = "Refrigerator Cost";
                            label22.layoutY = 284.0;
                            label22.text = "Air Conditioner Cost";
                            txtShopState.visible = false;
                            txtShopState.layoutY = 298.0;
                            label13.visible = false;
                            label13.layoutY = 255.0;
                            label13.text = "Mobile No";
                            label7.visible = false;
                            label7.layoutY = 276.0;
                            label7.text = "Email Id ";
                            label23.visible = false;
                            label23.layoutY = 297.0;
                            label23.text = "Fax";
                            txtShopPinCode.visible = false;
                            txtShopPinCode.layoutY = 192.0;
                            txtShopCNo2.visible = false;
                            txtShopCNo2.layoutY = 234.0;
                            txtShopCNo1.visible = false;
                            txtShopCNo1.layoutY = 213.0;
                            txtShopMob.visible = false;
                            txtShopMob.layoutY = 255.0;
                            txtShopFax.visible = false;
                            txtShopFax.layoutY = 297.0;
                            txtShopEmail.visible = false;
                            txtShopEmail.layoutY = 276.0;
                            txtShopAdd3.visible = false;
                            txtShopAdd3.layoutY = 132.0;
                            passwordEmail.visible = false;
                            passwordEmail.layoutY = 447.0;
                            label42.visible = false;
                            label42.layoutY = 447.0;
                            label42.textFill = javafx.scene.paint.Color.BLACK;
                            imageView2.visible = false;
                            imageView2.layoutY = 63.0;
                            imageView2.blocksMouse = false;
                            panelContact.visible = false;
                            panelContact.layoutX = 54.0;
                            panelContact.layoutY = 88.0;
                            separator5.visible = false;
                            separator5.layoutX = 0.0;
                            separator5.layoutY = 0.0;
                            lblHeadingPharmacist.visible = false;
                            lblHeadingPharmacist.layoutX = 0.0;
                            lblHeadingPharmacist.text = "Label";
                            lblHeadingPharmacist.textFill = javafx.scene.paint.Color.BLACK;
                            label27.visible = false;
                            label27.layoutY = 312.0;
                            label27.text = "Display Boards Cost";
                            txtShopPhName.visible = false;
                            txtShopPhName.layoutY = 342.0;
                            label29.visible = false;
                            label29.layoutY = 340.0;
                            label29.text = "Computers and peripherals Cost";
                            txtShopPAdd1.visible = false;
                            txtShopPAdd1.layoutY = 363.0;
                            label32.visible = false;
                            label32.layoutY = 342.0;
                            txtShopPhState.visible = false;
                            txtShopPhState.layoutY = 339.0;
                            imageView4.visible = false;
                            imageView4.layoutY = 111.0;
                            imageView4.blocksMouse = false;
                            txtShopPhPIN.visible = false;
                            txtShopPhPIN.layoutY = 360.0;
                            label33.visible = false;
                            label33.layoutY = 363.0;
                            label33.text = "Pin Code ";
                            label34.visible = false;
                            label34.layoutY = 384.0;
                            label34.text = "Phone No ";
                            txtShopPhCountry.visible = false;
                            txtShopPhCountry.layoutY = 427.0;
                            imageView3.visible = false;
                            imageView3.layoutY = 36.0;
                            imageView3.blocksMouse = false;
                            txtShopPCNo1.visible = false;
                            txtShopPCNo1.layoutY = 384.0;
                            txtShopPAdd2.visible = false;
                            txtShopPAdd2.layoutY = 384.0;
                            label30.visible = false;
                            label30.layoutY = 368.0;
                            label30.text = "Others";
                            txtShopPCity.visible = false;
                            txtShopPCity.layoutY = 405.0;
                            txtShopPCNo2.visible = false;
                            txtShopPCNo2.layoutY = 405.0;
                            label28.visible = false;
                            label28.layoutY = 405.0;
                            label28.text = "Mobile No";
                            label35.visible = false;
                            label35.layoutY = 426.0;
                            label35.text = "Email Id ";
                            txtShopPEmail.visible = false;
                            txtShopPEmail.layoutY = 426.0;
                            label31.visible = false;
                            label31.layoutY = 426.0;
                            panelPharmacist.visible = false;
                            panelPharmacist.layoutX = 56.0;
                            panelPharmacist.layoutY = 249.0;
                            separator4.visible = false;
                            separator4.layoutX = 0.0;
                            separator4.layoutY = 0.0;
                            label18.visible = false;
                            label18.layoutX = 27.0;
                            label18.layoutY = 446.0;
                            label26.visible = false;
                            label26.layoutY = 483.0;
                            label24.visible = false;
                            label24.layoutX = 480.0;
                            label24.layoutY = 483.0;
                            txtShopAdminUName.visible = false;
                            txtShopAdminUName.layoutX = 150.0;
                            txtShopAdminUName.layoutY = 483.0;
                            txtShopAdminpwd.visible = false;
                            txtShopAdminpwd.layoutX = 364.0;
                            txtShopAdminpwd.layoutY = 483.0;
                            txtShopAdminConfmpwd.visible = false;
                            txtShopAdminConfmpwd.layoutY = 483.0;
                            panelAdmin.visible = false;
                            panelAdmin.layoutX = 289.0;
                            panelAdmin.layoutY = 381.0;
                            rectShopCost.visible = true;
                            rectShopCost.layoutX = 844.0;
                            rectShopCost.layoutY = 525.0;
                            rectShopCost.styleClass = "rectbutton";
                            rectShopCost.onMouseClicked = rectShopCostOnMouseClicked;
                            rectShopCost.focusTraversable = false;
                            rectShopCost.fill = Yellow;
                            rectShopCost.stroke = DarkGray;
                            rectShopCost.strokeWidth = 1.0;
                            rectShopCost.width = 120.0;
                            rectShopCost.height = 20.0;
                            rectShopCost.arcWidth = 10.0;
                            rectShopCost.arcHeight = 10.0;
                            label36.visible = true;
                            label36.layoutX = 844.0;
                            label36.layoutY = 526.0;
                            __layoutInfo_label36.width = 120.0;
                            label36.text = "Back";
                            label36.font = Arial_Bold_12;
                            label36.hpos = javafx.geometry.HPos.CENTER;
                            label36.textFill = DarkGray;
                            group.visible = false;
                            imageClose.layoutY = 1.0;
                            label15.visible = true;
                            label15.layoutX = 30.0;
                            label15.text = "Store Setup Cost";
                            label15.font = Arial_18;
                            label15.textFill = Green;
                            label46.visible = true;
                            label46.layoutX = 0.0;
                            label46.layoutY = 0.0;
                            label46.text = "Opening Cash Balance";
                            label46.font = Arial_12;
                            label46.textFill = DarkGray;
                            label38.visible = true;
                            label38.layoutY = 28.0;
                            label38.text = "Building ";
                            label38.font = Arial_12;
                            label38.textFill = DarkGray;
                            label40.visible = true;
                            label40.layoutY = 56.0;
                            label40.text = "Advance/Lease Deposit";
                            label40.font = Arial_12;
                            label40.textFill = DarkGray;
                            labelShop_Registration_Cost.visible = true;
                            labelShop_Registration_Cost.layoutY = 84.0;
                            labelShop_Registration_Cost.text = "Registration Fee";
                            labelShop_Registration_Cost.font = Arial_12;
                            labelShop_Registration_Cost.textFill = DarkGray;
                            labelElectrical_work_cost.visible = true;
                            labelElectrical_work_cost.layoutY = 112.0;
                            labelElectrical_work_cost.text = "Electrical Lighting";
                            labelElectrical_work_cost.font = Arial_12;
                            labelElectrical_work_cost.textFill = DarkGray;
                            labelCarpentry_work_cost_.visible = true;
                            labelCarpentry_work_cost_.layoutY = 140.0;
                            labelCarpentry_work_cost_.text = "Furnishings & Carpentry";
                            labelCarpentry_work_cost_.font = Arial_12;
                            labelCarpentry_work_cost_.textFill = DarkGray;
                            panelLabelLeft.visible = true;
                            panelLabelLeft.layoutY = 150.0;
                            txtShopInvCost.visible = true;
                            txtShopInvCost.layoutX = 0.0;
                            txtShopInvCost.layoutY = 0.0;
                            __layoutInfo_txtShopInvCost.width = 100.0;
                            txtShopInvCost.onKeyPressed = txtShopInvCostOnKeyPressedAtShopSetupCost;
                            txtShopInvCost.promptText = "0.00";
                            txtShopInvCost.font = Arial_12;
                            txtShopBuildCost.visible = true;
                            txtShopBuildCost.layoutX = 0.0;
                            txtShopBuildCost.layoutY = 28.0;
                            __layoutInfo_txtShopBuildCost.width = 100.0;
                            txtShopBuildCost.onKeyPressed = txtShopBuildCostOnKeyPressedAtShopSetupCost;
                            txtShopBuildCost.promptText = "0.00";
                            txtShopBuildCost.font = Arial_12;
                            txtShopAdvCost.visible = true;
                            txtShopAdvCost.layoutX = 0.0;
                            txtShopAdvCost.layoutY = 56.0;
                            __layoutInfo_txtShopAdvCost.width = 100.0;
                            txtShopAdvCost.onKeyPressed = txtShopAdvCostOnKeyPressedAtShopSetupCost;
                            txtShopAdvCost.promptText = "0.00";
                            txtShopAdvCost.font = Arial_12;
                            txtShopRegCost.visible = true;
                            txtShopRegCost.layoutX = 0.0;
                            txtShopRegCost.layoutY = 84.0;
                            __layoutInfo_txtShopRegCost.width = 100.0;
                            txtShopRegCost.onKeyPressed = txtShopRegCostOnKeyPressedAtShopSetupCost;
                            txtShopRegCost.promptText = "0.00";
                            txtShopRegCost.font = Arial_12;
                            txtShopElecCost.visible = true;
                            txtShopElecCost.layoutX = 0.0;
                            txtShopElecCost.layoutY = 112.0;
                            __layoutInfo_txtShopElecCost.width = 100.0;
                            txtShopElecCost.onKeyPressed = txtShopElecCostOnKeyPressedAtShopSetupCost;
                            txtShopElecCost.promptText = "0.00";
                            txtShopElecCost.font = Arial_12;
                            txtShopCarpCost.visible = true;
                            txtShopCarpCost.layoutX = 0.0;
                            txtShopCarpCost.layoutY = 140.0;
                            __layoutInfo_txtShopCarpCost.width = 100.0;
                            txtShopCarpCost.onKeyPressed = txtShopCarpCostOnKeyPressedAtShopSetupCost;
                            txtShopCarpCost.promptText = "0.00";
                            txtShopCarpCost.font = Arial_12;
                            panelTextLeft.visible = true;
                            panelTextLeft.layoutY = 150.0;
                            labeCarpentry_work_cost_.visible = true;
                            labeCarpentry_work_cost_.layoutY = 0.0;
                            labeCarpentry_work_cost_.text = "Refrigeration ";
                            labeCarpentry_work_cost_.font = Arial_12;
                            labeCarpentry_work_cost_.textFill = DarkGray;
                            labelAir_Conditioner_Cost_.visible = true;
                            labelAir_Conditioner_Cost_.layoutY = 28.0;
                            labelAir_Conditioner_Cost_.text = "Air-Conditioning";
                            labelAir_Conditioner_Cost_.font = Arial_12;
                            labelAir_Conditioner_Cost_.textFill = DarkGray;
                            labelDisplay_Boards_Cost_.visible = true;
                            labelDisplay_Boards_Cost_.layoutY = 56.0;
                            labelDisplay_Boards_Cost_.text = "Display Boards ";
                            labelDisplay_Boards_Cost_.font = Arial_12;
                            labelDisplay_Boards_Cost_.textFill = DarkGray;
                            labelComputers_and_peripherals_Cost_.visible = true;
                            labelComputers_and_peripherals_Cost_.layoutY = 84.0;
                            labelComputers_and_peripherals_Cost_.text = "Computers &  Peripherals ";
                            labelComputers_and_peripherals_Cost_.font = Arial_12;
                            labelComputers_and_peripherals_Cost_.textFill = DarkGray;
                            labelOthers_.visible = true;
                            labelOthers_.layoutY = 112.0;
                            labelOthers_.text = "Others ";
                            labelOthers_.font = Arial_12;
                            labelOthers_.textFill = DarkGray;
                            panelLabelRight.visible = true;
                            panelLabelRight.layoutY = 150.0;
                            txtShopRefCost.visible = true;
                            txtShopRefCost.layoutX = 0.0;
                            txtShopRefCost.layoutY = 0.0;
                            __layoutInfo_txtShopRefCost.width = 100.0;
                            txtShopRefCost.onKeyPressed = txtShopRefCostOnKeyPressedAtShopSetupCost;
                            txtShopRefCost.promptText = "0.00";
                            txtShopRefCost.font = Arial_12;
                            txtShopAcCost.visible = true;
                            txtShopAcCost.layoutX = 0.0;
                            txtShopAcCost.layoutY = 28.0;
                            __layoutInfo_txtShopAcCost.width = 100.0;
                            txtShopAcCost.onKeyPressed = txtShopAcCostOnKeyPressedAtShopSetupCost;
                            txtShopAcCost.promptText = "0.00";
                            txtShopAcCost.font = Arial_12;
                            txtShopDispCost.visible = true;
                            txtShopDispCost.layoutX = 0.0;
                            txtShopDispCost.layoutY = 56.0;
                            __layoutInfo_txtShopDispCost.width = 100.0;
                            txtShopDispCost.onKeyPressed = txtShopDispCostOnKeyPressedAtShopSetupCost;
                            txtShopDispCost.promptText = "0.00";
                            txtShopDispCost.font = Arial_12;
                            txtShopPeriCost.visible = true;
                            txtShopPeriCost.layoutX = 0.0;
                            txtShopPeriCost.layoutY = 84.0;
                            __layoutInfo_txtShopPeriCost.width = 100.0;
                            txtShopPeriCost.onKeyPressed = txtShopPeriCostOnKeyPressedAtShopSetupCost;
                            txtShopPeriCost.promptText = "0.00";
                            txtShopPeriCost.font = Arial_12;
                            txtShopOthersCost.visible = true;
                            txtShopOthersCost.layoutX = 0.0;
                            txtShopOthersCost.layoutY = 112.0;
                            __layoutInfo_txtShopOthersCost.width = 100.0;
                            txtShopOthersCost.onKeyPressed = txtShopOthersCostOnKeyPressedAtShopSetupCost;
                            txtShopOthersCost.promptText = "0.00";
                            txtShopOthersCost.font = Arial_12;
                            panelTextRight.visible = true;
                            panelTextRight.layoutY = 150.0;
                            txtTotalCost.visible = true;
                            txtTotalCost.focusTraversable = false;
                            txtTotalCost.font = Arial_Bold_65;
                            label.visible = true;
                            label.opacity = 0.7;
                            label.layoutY = 375.0;
                            __layoutInfo_label.width = 165.0;
                            label.text = "Total Amount";
                            label.font = Arial_Bold_25;
                            label.textFill = DarkGray;
                            panelCost.visible = true;
                            panelCost.layoutY = 40.0;
                            imageSave.visible = true;
                            btnShopSave.visible = true;
                            btnShopSave.layoutY = 0.0;
                            btnShopSave.onKeyPressed = btnShopSaveOnKeyPressedAtShopSetupCost;
                            btnShopSave.onMouseClicked = btnShopSaveOnMouseClickedAtShopSetupCost;
                            imageReset.visible = true;
                            btnShopReset.visible = true;
                            btnShopReset.layoutY = 0.0;
                            btnShopReset.onKeyPressed = btnShopResetOnKeyPressedAtShopSetupCost;
                            btnShopReset.onMouseClicked = btnShopResetOnMouseClickedAtShopSetupCost;
                            imageCancel.visible = true;
                            imageCancel.image = imageBack;
                            btnShopCancel.visible = true;
                            btnShopCancel.layoutY = 0.0;
                            btnShopCancel.onKeyPressed = btnShopCancelOnKeyPressedAtShopSetupCost;
                            btnShopCancel.text = "Back";
                            btnShopCancel.action = btnShopCancelActionAtShopSetupCost;
                            panelButtons.visible = true;
                            listState.visible = false;
                            listCount.visible = false;
                            listCountry.visible = false;
                            listStat.visible = false;
                            panel.visible = true;
                            panelHomePage.visible = false;
                            panelMsgbox.visible = false;
                        }
                    }
                ]
            }
        ]
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel, panelHomePage, panelMsgbox, ]
    }
    // </editor-fold>//GEN-END:main

    function txtShopCommodityCodeOnKeyPressedAtFScreen(event: javafx.scene.input.KeyEvent): Void {
         if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopAdd1.requestFocus();
        } shortcut(event);
         }

    function listStateChanges(type: Integer, str: String): Void {
        if(not listState.visible){
        try {
            listY = txtShopState.layoutY + panelContact.layoutY + 25;
            listState.visible = true;
            var listControlObj: ListController = new ListController();
            listW = txtShopState.width;
            listH = listControlObj.listStateControlView(txtShopState, str, listState, "State", type);
            var selS: String = bind listControlObj.selectedString on replace {
                if (selS.length() > 0) {
                    txtShopPinCode.requestFocus();

                } } } catch (e: Exception) {
            log.debug("Method:listStateChanges Exception = {e.getMessage()}");
           }
        }
    else{
           listState.visible =false;
           txtShopState.requestFocus();
       }
   }

    function listCountryChanges(type: Integer): Void {
        if(not listCountry.visible){
        try {
            var listControlObj: ListController = new ListController();
            listW = txtShopCountry.width;
            listH = listControlObj.listImageControlView(txtShopCountry, listCountry, "Country", type);
            var selS: String = bind listControlObj.selectedString on replace {
                if (selS.length() > 0) {
                    txtShopState.text = "";
                    txtShopState.requestFocus();
                    listStateChanges(0, selS);
                } } } catch (e: Exception) {
            log.debug("Method:listCountryChanges Error in List Getting = {e.getMessage()}");
        }
       }
       else{
           listCountry.visible = false;
           txtShopCountry.requestFocus();
       }
    }

    function listStateChanges1(type: Integer, str: String): Void {
    if(not listStat.visible){
    try {
            listY = txtShopPhState.layoutY + panelPharmacist.layoutY + 25;
            listStat.visible = true;
            var listControlObj: ListController = new ListController();
            listW = txtShopPhState.width;
            listH = listControlObj.listStateControlView(txtShopPhState, str, listStat, "State", type);
            var selS: String = bind listControlObj.selectedString on replace {
                if (selS.length() > 0) {
                    txtShopPhPIN.requestFocus();
                } } } catch (e: Exception) {
            log.debug("Method:listStateChanges1 Exception = {e.getMessage()}");
        }
         }
       else{
           listStat.visible =false;
           txtShopPhState.requestFocus();
       }
    }

    function listCountryChanges1(type: Integer): Void {
    if(not listCount.visible){
        try {
            listY = txtShopPhCountry.layoutY + panelPharmacist.layoutY + 25;
            var listControlObj: ListController = new ListController();

            listW = txtShopPhCountry.width;
            listH = listControlObj.listImageControlView(txtShopPhCountry, listCount, "Country", type);
            var selS: String = bind listControlObj.selectedString on replace {
                if (selS.length() > 0) {
                    txtShopPhState.text = "";
                    txtShopPhState.requestFocus();
                    listStateChanges1(0, selS);
                } } } catch (e: Exception) {
            log.debug("Method:listCountryChanges1 Exception= {e.getMessage()}");
        }
       }
       else{
           listCount.visible = false;
           txtShopPhCountry.requestFocus();
       } 
    }

    function btnShopCancelOnKeyPressedAtShopSetupCost(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            btnShopCancelActionAtShopSetupCost();
        } else if (event.code == KeyCode.VK_TAB) {
            txtShopInvCost.requestFocus();
        }
    }

    function rectShopCostOnKeyPressedAtFScreen(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            LoadSetupCost();
        } else if (event.code == KeyCode.VK_TAB) {
            txtShopSName.requestFocus();
        }

    }

    function btnShopCancelOnKeyPressedAtFScreen(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            btnShopCancelActionAtShown();
        } else if (event.code == KeyCode.VK_TAB) {
            rectShopCost.requestFocus();
        }
    }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Shop Information", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = errorStyle;
    }

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Shop Information", type);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Shop Information", msg);
        showAlertbox();
    }

    function txtShopPhStateOnKeyPressedAtFScreen(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtShopPhPIN.requestFocus();
            if (sar3 == 0 or txtShopPhState.rawText.trim() == null or txtShopPhState.rawText.trim().length() == 0 or txtShopPhState.rawText.trim() == "null") {
                txtShopPhState.text = " ";
            }
        }
    }

    function txtShopPhCountryOnKeyPressedAtFScreen(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtShopPhState.requestFocus();
            if (sar2 == 0 or txtShopPhCountry.rawText.trim() == null or txtShopPhCountry.rawText.trim().length() == 0 or txtShopPhCountry.rawText.trim() == "null") {
                txtShopPhCountry.text = " ";
            }
        }
    }

    function txtShopStateOnKeyPressedAtFScreen(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtShopPinCode.requestFocus();
            if (sar1 == 0 or txtShopState.rawText.trim() == null or txtShopState.rawText.trim().length() == 0 or txtShopState.rawText.trim() == "null") {
                txtShopState.text = " ";
            }
        }
    }

    function txtShopCountryOnKeyPressedAtFScreen(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtShopState.requestFocus();
            if (sar == 0 or txtShopCountry.rawText.trim() == null or txtShopCountry.rawText.trim().length() == 0 or txtShopCountry.rawText.trim() == "null") {
                txtShopCountry.text = " ";
            }
        }
    }

    def kr = KeyRegistry {};
//    var key = bind CommonDeclare.currKyEvent on replace {
//            shortcut(key);
//    }
    public var tinNum: String = bind txtShopTINNo.rawText.trim() on replace {
        CommonDeclare.tin = tinNum;
    }

    function imageView4OnMouseClickedAtFScreen(event: javafx.scene.input.MouseEvent): Void {
        listStateChanges1(0, txtShopPhCountry.rawText);
    }

    function imageView3OnMouseClickedAtFScreen(event: javafx.scene.input.MouseEvent): Void {
        listCountryChanges1(0);
    }

    function imageView2OnMouseClickedAtFScreen(event: javafx.scene.input.MouseEvent): Void {
        listY = txtShopCountry.layoutY + panelContact.layoutY + 25;
        listCountryChanges(0);
    }

    function imageViewOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {

        listStateChanges(0, txtShopCountry.rawText);
    }

    function rectangleOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        HideList();
    }

    function HideList(): Void {
        listState.visible = false;
        listCount.visible = false;
        listCountry.visible = false;
        listStat.visible = false;
    }

    function btnShopCancelActionAtShopSetupCost(): Void {
        currentState.actual = currentState.findIndex("FScreen");
        txtShopSName.requestFocus();
    }

    function btnShopCancelActionAtShown(): Void {
        panel.visible = false;
        CancelForm();
    }

    function passwordEmailOnKeyPressedAtFScreen(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopFax.requestFocus();
        }
        shortcut(event);
    }

    function txtShopAdd3OnKeyPressedAtFScreen(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopCity.requestFocus();
        } shortcut(event);
    }

    function txtShopOthersCostOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        TotalCost();
    }

    function txtShopPeriCostOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        TotalCost();
    }

    function txtShopDispCostOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        TotalCost();
    }

    function txtShopAcCostOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        TotalCost();
    }

    function txtShopRefCostOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        TotalCost();
    }

    function txtShopCarpCostOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        TotalCost();
    }

    function txtShopElecCostOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        TotalCost();
    }

    function txtShopRegCostOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        TotalCost();
    }

    function txtShopAdvCostOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        TotalCost();
    }

    function txtShopBuildCostOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        TotalCost();
    }

    function txtShopInvCostOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        TotalCost();
    }

    function btnCostNextAction(): Void {
        var inm: Integer = 0;
        inm = shopCostSaveClick();
        if (inm == 0) {
            currentState.actual = currentState.findIndex("Admin");
        }
    }

    function btnPhaBackAction(): Void {
        currentState.actual = currentState.findIndex("Contact");
    }

    function btnContacBackAction(): Void {
        currentState.actual = currentState.findIndex("General");
        loadDe();
    }

    function txtShopPhStateOnKeyReleasedAtFScreen(event: javafx.scene.input.KeyEvent): Void {
        listStateChanges1(1, txtShopPhCountry.rawText);
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            if (txtShopPhState.rawText.trim() == null or txtShopPhState.rawText.trim() == "null") {
                txtShopPhState.text = " ";
            }
        }
        if (event.code == KeyCode.VK_ESCAPE) {
            listStat.visible = false;

        }
        if (event.code == KeyCode.VK_DOWN) {
            listStat.requestFocus();
            listStat.selectFirstRow();
        }
        shortcut(event);

    }

    function txtShopPhCountryOnKeyReleasedAtFScreen(event: javafx.scene.input.KeyEvent): Void {
        listCountryChanges1(1);
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            if (txtShopPhCountry.rawText.trim() == null or txtShopPhCountry.rawText.trim() == "null") {
                txtShopPhCountry.text = " ";
            }
        }
        if (event.code == KeyCode.VK_ESCAPE) {
            listCount.visible = false;
        }
        if (event.code == KeyCode.VK_DOWN) {
            listCount.requestFocus();
            listCount.selectFirstRow();
        }
        shortcut(event);

    }

    function listCountOnKeyPressedAtFScreen(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
        if (listCount.focused) {
            if (event.code == KeyCode.VK_DOWN)
                listCount.selectFirstRow();
        } shortcut(event);
    }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == kr.save and btnShopSave.text == "Save") {
            SaveClick();
        }
        if (event.code == kr.update and btnShopSave.text == "Update") {
            SaveClick();
        }
        if (event.code == kr.reset and btnShopReset.text == "Reset") {
            ResetClear();
            setUpCostClear();
        }
        if (event.controlDown == true and event.code == kr.back) {
            currentState.actual = currentState.findIndex("FScreen");
        }
        if (event.code == kr.cancel) {
            panel.visible = false;
            CancelForm();
        }
    }

    function txtShopStateOnKeyReleasedAtFScreen(event: javafx.scene.input.KeyEvent): Void {
        listStateChanges(1, txtShopCountry.rawText);
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {

            if (txtShopState.rawText.trim() == null or txtShopState.rawText.trim() == "null") {
                txtShopState.text = "";
            }
        }
        if (event.code == KeyCode.VK_ESCAPE) {
            listState.requestFocus();
            listState.selectFirstRow();
        }
        if (event.code == KeyCode.VK_DOWN) {
            listState.requestFocus();
            listState.selectFirstRow();
        }
    }

    function roundValues(str: String): Double {
        var returnAmount: Double = 0.00;
        try {
            if (str != null and str.trim().length() > 0) {
                returnAmount = Double.parseDouble(str);
                returnAmount = Value.Round(returnAmount, 2);
            }
        } catch (ex) {
            log.debug("roundValues Error :{ex.getMessage()}");
        }
        return returnAmount;

    }

    function TotalCost(): String {
        try {
            TotalAmt = Value.Round(roundValues(txtShopInvCost.rawText) + roundValues(txtShopBuildCost.rawText) + roundValues(txtShopAdvCost.rawText) + roundValues(txtShopRegCost.rawText) + roundValues(txtShopElecCost.rawText) + roundValues(txtShopCarpCost.rawText) + roundValues(txtShopRefCost.rawText) + roundValues(txtShopAcCost.rawText) + roundValues(txtShopDispCost.rawText) + roundValues(txtShopPeriCost.rawText) + roundValues(txtShopOthersCost.rawText));

        } catch (ex) {
            log.debug("Total cost Calculation Error :{ex.getMessage()}");
        }
        return TotalAmt;
    }

    function txtShopCountryOnKeyReleasedAtFScreen(event: javafx.scene.input.KeyEvent): Void {
        listY = txtShopCountry.layoutY + panelContact.layoutY + 25;
        listCountryChanges(1);
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            if (txtShopCountry.rawText.trim() == null or txtShopCountry.rawText.trim() == "null") {
                txtShopCountry.text = " ";
            }
        }

        if (event.code == KeyCode.VK_DOWN) {
            listCountry.requestFocus();
            listCountry.selectFirstRow();
        }
        if (event.code == KeyCode.VK_ESCAPE) {
            HideList();
        }

    }

    function listStateOnKeyPressedAtFScreen(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function listCountryOnKeyPressedAtFScreen(event: javafx.scene.input.KeyEvent): Void {
        if (listCountry.focused) {
            if (event.code == KeyCode.VK_DOWN)
                listCountry.selectFirstRow();
        }
    }

    function txtShopOthersCostOnKeyPressedAtShopSetupCost(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            btnShopSave.requestFocus();
        } shortcut(event);
    }

    function txtShopPeriCostOnKeyPressedAtShopSetupCost(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopOthersCost.requestFocus();
        } shortcut(event);
    }

    function txtShopDispCostOnKeyPressedAtShopSetupCost(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopPeriCost.requestFocus();
        } shortcut(event);
    }

    function txtShopAcCostOnKeyPressedAtShopSetupCost(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopDispCost.requestFocus();
        } shortcut(event);
    }

    function txtShopRefCostOnKeyPressedAtShopSetupCost(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopAcCost.requestFocus();
        } shortcut(event);
    }

    function txtShopCarpCostOnKeyPressedAtShopSetupCost(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopRefCost.requestFocus();
        } shortcut(event);
    }

    function txtShopElecCostOnKeyPressedAtShopSetupCost(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopCarpCost.requestFocus();
        } shortcut(event);
    }

    function txtShopRegCostOnKeyPressedAtShopSetupCost(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopElecCost.requestFocus();
        } shortcut(event);
    }

    function txtShopAdvCostOnKeyPressedAtShopSetupCost(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopRegCost.requestFocus();
        } shortcut(event);
    }

    function txtShopBuildCostOnKeyPressedAtShopSetupCost(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopAdvCost.requestFocus();
        } shortcut(event);
    }

    function txtShopInvCostOnKeyPressedAtShopSetupCost(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopBuildCost.requestFocus();
        } shortcut(event);
    }

    function btnShopResetOnMouseClickedAtShopSetupCost(event: javafx.scene.input.MouseEvent): Void {
        setUpCostClear();
    }

    function setUpCostClear(): Void {
        txtShopInvCost.text = "";
        txtShopBuildCost.text = "";
        txtShopAdvCost.text = "";
        txtShopRegCost.text = "";
        txtShopElecCost.text = "";
        txtShopCarpCost.text = "";
        txtShopRefCost.text = "";
        txtShopAcCost.text = "";
        txtShopDispCost.text = "";
        txtShopPeriCost.text = "";
        txtShopOthersCost.text = "";
    }

    function btnShopResetOnKeyPressedAtShopSetupCost(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            setUpCostClear();
        } else if (event.code == KeyCode.VK_TAB) {
            btnShopCancel.requestFocus();
        }
    }

    function rectShopCostOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        currentState.actual = currentState.findIndex("FScreen");
    }

    function btnShopSaveOnKeyPressedAtShopSetupCost(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            shopCostSaveClick();
        } else if (event.code == KeyCode.VK_TAB) {
            btnShopReset.requestFocus();
        }

    }

    function shopCostSaveClick(): Integer {
        var inm: Integer = 1;
        try {
		storeInfoController =RegistryFactory.getClientStub(RegistryConstants.StoreInformation) as com.vanuston.medeil.implementation.StoreInformation;
            var val = new Validation();
            var storeInfoModel: StoreInformationModel = new StoreInformationModel();
            storeInfoModel = Shop();

            if (txtShopInvCost.rawText.trim() != null and txtShopInvCost.rawText.trim().length() > 0 and val.getDecimalValid(txtShopInvCost.rawText.trim(), 1, 15) != 10) {
                FXinfo("Only numbers allowed in Opening Balance");
                txtShopInvCost.requestFocus();
            } else if (txtShopInvCost.rawText.trim().trim().length() > 12) {
                FXinfo("Opening Balance cannot exceed more than 10 digits");
                txtShopInvCost.requestFocus();
            } else if (txtShopBuildCost.rawText.trim() != null and txtShopBuildCost.rawText.trim().length() > 0 and val.getDecimalValid(txtShopBuildCost.rawText.trim(), 1, 15) != 10) {
                FXinfo("Only numbers allowed in Building Cost");
                txtShopInvCost.requestFocus();

            } else if (txtShopBuildCost.rawText.trim().trim().length() > 12) {
                FXinfo("Building Cost cannot exceed more than 10 digits");
                txtShopBuildCost.requestFocus();
            } else if (txtShopAdvCost.rawText != null and txtShopAdvCost.rawText.trim().length() > 0 and val.getDecimalValid(txtShopAdvCost.rawText, 1, 15) != 10) {
                FXinfo("Only numbers allowed in Advance or Lease Cost");
                txtShopAdvCost.requestFocus();

            } else if (txtShopAdvCost.rawText.trim().length() > 12) {
                FXinfo("Advance or Lease Cost cannot exceed more than 10 digits");
                txtShopAdvCost.requestFocus();
            } else if (txtShopRegCost.rawText != null and txtShopRegCost.rawText.trim().length() > 0 and val.getDecimalValid(txtShopRegCost.rawText, 1, 15) != 10) {
                FXinfo("Only numbers allowed in Registration Cost");
                txtShopRegCost.requestFocus();

            } else if (txtShopRegCost.rawText.trim().length() > 12) {
                FXinfo("Registration Cost cannot exceed more than 10 digits");
                txtShopRegCost.requestFocus();
            } else if (txtShopElecCost.rawText != null and txtShopElecCost.rawText.trim().length() > 0 and val.getDecimalValid(txtShopElecCost.rawText, 1, 15) != 10) {
                FXinfo("Only numbers allowed in Electricity Cost");
                txtShopElecCost.requestFocus();

            } else if (txtShopElecCost.rawText.trim().length() > 12) {
                FXinfo("Electricity Cost cannot exceed more than 10 digits");
                txtShopElecCost.requestFocus();
            } else if (txtShopCarpCost.rawText != null and txtShopCarpCost.rawText.trim().length() > 0 and val.getDecimalValid(txtShopCarpCost.rawText, 1, 15) != 10) {
                FXinfo("Only numbers allowed in Carpentry Cost");
                txtShopCarpCost.requestFocus();

            } else if (txtShopCarpCost.rawText.trim().length() > 12) {
                FXinfo("Carpentry Cost cannot exceed more than 10 digits");
                txtShopCarpCost.requestFocus();
            } else if (txtShopRefCost.rawText != null and txtShopRefCost.rawText.trim().length() > 0 and val.getDecimalValid(txtShopRefCost.rawText, 1, 15) != 10) {
                FXinfo("Only numbers allowed in Refrigerator Cost");
                txtShopRefCost.requestFocus();

            } else if (txtShopRefCost.rawText.trim().length() > 12) {
                FXinfo("Refrigerator Cost cannot exceed more than 10 digits");
                txtShopRefCost.requestFocus();
            } else if (txtShopAcCost.rawText != null and txtShopAcCost.rawText.trim().length() > 0 and val.getDecimalValid(txtShopAcCost.rawText, 1, 15) != 10) {
                FXinfo("Only numbers allowed in Air Conditioning Cost");
                txtShopAcCost.requestFocus();

            } else if (txtShopAcCost.rawText.trim().length() > 12) {
                FXinfo("Air Conditioning Cost cannot exceed more than 10 digits");
                txtShopAcCost.requestFocus();
            } else if (txtShopDispCost.rawText != null and txtShopDispCost.rawText.trim().length() > 0 and val.getDecimalValid(txtShopDispCost.rawText, 1, 15) != 10) {
                FXinfo("Only numbers allowed in Display Board Cost");
                txtShopDispCost.requestFocus();

            } else if (txtShopDispCost.rawText.trim().length() > 12) {
                FXinfo("Display Board Cost cannot exceed more than 10 digits");
                txtShopDispCost.requestFocus();
            } else if (txtShopPeriCost.rawText != null and txtShopPeriCost.rawText.trim().length() > 0 and val.getDecimalValid(txtShopPeriCost.rawText, 1, 15) != 10) {
                FXinfo("Only numbers allowed in Computer Peripherals Cost");
                txtShopPeriCost.requestFocus();

            } else if (txtShopPeriCost.rawText.trim().length() > 12) {
                FXinfo("Computer Peripherals Cost cannot exceed more than 10 digits");
                txtShopPeriCost.requestFocus();
            } else if (txtShopOthersCost.rawText != null and txtShopOthersCost.rawText.trim().length() > 0 and val.getDecimalValid(txtShopOthersCost.rawText, 1, 15) != 10) {
                FXinfo("Only numbers allowed in Other Expenses");
                txtShopOthersCost.requestFocus();

            } else if (txtShopOthersCost.rawText.trim().length() > 12) {
                FXinfo("Other Expenses cannot exceed more than 10 digits ");
                txtShopOthersCost.requestFocus();
            } else {
                inm = 0;

                storeInfoModel.setOpenCashBalanceCost(roundValues(txtShopInvCost.rawText));
                storeInfoModel.setBulidingCost(roundValues(txtShopBuildCost.rawText));
                storeInfoModel.setLeaseAdvanceDepositCost(roundValues(txtShopAdvCost.rawText));
                storeInfoModel.setRegisterationFeeCost(roundValues(txtShopRegCost.rawText));
                storeInfoModel.setElectricalLightingCost(roundValues(txtShopElecCost.rawText));
                storeInfoModel.setCarpentaryCost(roundValues(txtShopCarpCost.rawText));
                storeInfoModel.setAirConditionCost(roundValues(txtShopAcCost.rawText));
                storeInfoModel.setRefrigerationCost(roundValues(txtShopRefCost.rawText));
                storeInfoModel.setDisplayBoardCost(roundValues(txtShopDispCost.rawText));
                storeInfoModel.setComputerPeripheralsCost(roundValues(txtShopPeriCost.rawText));
                storeInfoModel.setOthersCost(roundValues(txtShopOthersCost.rawText));
                storeInfoModel.setTotalCost(roundValues(TotalCost()));
                storeInfoModel.setSaveType(1);
                if (storeInfoModel.isReturnflag()) {
                    shopName =" {storeInfoModel.getStoreName()}";

                    var returnObject = new Object();

                    returnObject = storeInfoController.createRecord(storeInfoModel); // controller call
                    var msgReturnModel: MsgReturnModel = new MsgReturnModel();
                    msgReturnModel = returnObject as MsgReturnModel;
                    if (msgReturnModel.getReturnMessage() == "0") {
                        FXalert(0);
                    } else {
                        FXinfo(msgReturnModel.getReturnMessage());
                    }

                }
            }
        } catch (e: Exception) {
            inm = 1;
            var msg: String = "Class :  Shop Information    Method : SetupCostClick()    = {e.getMessage()}";
            log.debug(msg);
        }
        return inm;
    }

    function btnShopSaveOnMouseClickedAtShopSetupCost(event: javafx.scene.input.MouseEvent): Void {
        shopCostSaveClick();
    }

    function getSetupCostClick(): Void {
        try {
          storeInfoController =RegistryFactory.getClientStub(RegistryConstants.StoreInformation) as com.vanuston.medeil.implementation.StoreInformation;
            var listModel: StoreInformationModel = storeInfoController.tableValues();  // Controller Call
            TotalAmt = listModel.getTotalCost().toString();
            txtShopInvCost.text = listModel.getOpenCashBalanceCost().toString();
            txtShopBuildCost.text = listModel.getBulidingCost().toString();
            txtShopAdvCost.text = listModel.getLeaseAdvanceDepositCost().toString();
            txtShopRegCost.text = listModel.getRegisterationFeeCost().toString();
            txtShopElecCost.text = listModel.getElectricalLightingCost().toString();
            txtShopCarpCost.text = listModel.getCarpentaryCost().toString();
            txtShopRefCost.text = listModel.getRefrigerationCost().toString();
            txtShopAcCost.text = listModel.getAirConditionCost().toString();
            txtShopDispCost.text = listModel.getDisplayBoardCost().toString();
            txtShopPeriCost.text = listModel.getComputerPeripheralsCost().toString();
            txtShopOthersCost.text = listModel.getOthersCost().toString();
            txtShopInvCost.requestFocus();
        } catch (e: Exception) {
            var msg: String = "Class :  Shop Information    Method : getSetupCostClick()    = {e.getMessage()}";
            log.debug(msg);
        }

    }

    function rectShopCostOnMouseClickedAtFScreen(event: javafx.scene.input.MouseEvent): Void {
        LoadSetupCost();
    }

    function LoadSetupCost(): Void {
        currentState.actual = currentState.findIndex("ShopSetupCost");
        getSetupCostClick();

    }

    function imageCloseOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        panel.visible = false;
        panelHomePage.visible = true;
        delete  panelHomePage.content;
    }

    public function FScreen() {
        panel.visible = true;
        panelHomePage.visible = false;
        currentState.actual = currentState.findIndex("FScreen");
    }

    function btnShopResetOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        ResetClear();
    }

    function btnShopResetOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            ResetClear();
        } else if (event.code == KeyCode.VK_TAB) {
            btnShopCancel.requestFocus();
        }

    }

    function btnShopSaveOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        SaveClick();
    }

    function btnShopSaveOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            SaveClick();
        } else if (event.code == KeyCode.VK_TAB) {
            btnShopReset.requestFocus();
        }

    }

    function txtShopAdminConfmpwdOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            btnShopSave.requestFocus();
        } shortcut(event);
    }

    function txtShopAdminpwdOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopAdminConfmpwd.requestFocus();
        } shortcut(event);
    }

    function txtShopAdminUNameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopAdminpwd.requestFocus();
        } shortcut(event);

    }

    function txtShopPEmailOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopAdminUName.requestFocus();
        } shortcut(event);

    }

    function txtShopPCNo2OnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopPEmail.requestFocus();
        } shortcut(event);
    }

    function txtShopPCNo1OnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopPCNo2.requestFocus();
        } shortcut(event);
    }

    function txtShopPhPINOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopPCNo1.requestFocus();
        } shortcut(event);
    }

    function txtShopPCityOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopPhCountry.requestFocus();
        } shortcut(event);
    }

    function txtShopPAdd2OnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopPCity.requestFocus();
        } shortcut(event);
    }

    function txtShopPAdd1OnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopPAdd2.requestFocus();
        } shortcut(event);
    }

    function txtShopPhNameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopPAdd1.requestFocus();
        } shortcut(event);

    }

    function txtShopFaxOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopPhName.requestFocus();
        } shortcut(event);
    }

    function txtShopEmailOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            btnShopSave.requestFocus();
        } shortcut(event);
    }

    function txtShopMobOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopEmail.requestFocus();
        } shortcut(event);
    }

    function txtShopCNo2OnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopMob.requestFocus();
        } shortcut(event);
    }

    function txtShopCNo1OnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopCNo2.requestFocus();
        } shortcut(event);
    }

    function txtShopPinCodeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopCNo1.requestFocus();
        } shortcut(event);

    }

    function txtShopStateOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopPinCode.requestFocus();
        } shortcut(event);
    }

    function txtShopCountryOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopState.requestFocus();
        } shortcut(event);
    }

    function txtShopCityOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopCountry.requestFocus();
        } shortcut(event);
    }

    function txtShopAdd2OnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopAdd3.requestFocus();
        } shortcut(event);
    }

    function txtShopAdd1OnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopAdd2.requestFocus();
        } shortcut(event);
    }

    function txtShopPANNoOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopCommodityCode.requestFocus();
        } shortcut(event);
    }

    function txtShopCSTNoOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopPANNo.requestFocus();
        } shortcut(event);
    }

    function txtShopTINNoOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopCSTNo.requestFocus();
        } shortcut(event);
    }

    function txtShopDLNoOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopTINNo.requestFocus();
        } shortcut(event);
    }

    function txtShopValidityOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopDLNo.requestFocus();
        } shortcut(event);
    }

    function txtShopRegNoOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopDLNo.requestFocus();
        } shortcut(event);
    }

    function txtShopLicHolderOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopRegNo.requestFocus();
        } shortcut(event);
    }

    function txtShopONameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopLicHolder.requestFocus();
        } shortcut(event);
    }

    function txtShopSNameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtShopSName.style = mandatoryStyle;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtShopOName.requestFocus();
        } shortcut(event);
    }

    function ResetClear(): Void {
        txtShopSName.text = ""; txtShopOName.text = "";
        txtShopAdd1.text = ""; txtShopAdd2.text = "";
        txtShopAdd3.text = ""; txtShopCity.text = ""; txtShopPinCode.text = "";
        txtShopCNo1.text = ""; txtShopCNo2.text = ""; txtShopMob.text = "";
        txtShopEmail.text = ""; txtShopFax.text = ""; txtShopLicHolder.text = "";
        txtShopPhName.text = ""; txtShopPAdd1.text = ""; txtShopPAdd2.text = "";
        txtShopPCity.text = ""; txtShopCountry.text = ""; txtShopState.text = "";
        txtShopPCNo1.text = ""; txtShopPCNo2.text = ""; txtShopPEmail.text = "";
        txtShopDLNo.text = ""; txtShopTINNo.text = ""; txtShopCSTNo.text = "";
        txtShopPANNo.text = ""; txtShopRegNo.text = ""; txtShopValidity.text = "";
        txtShopAdminUName.text = ""; txtShopAdminpwd.text = ""; txtShopAdminConfmpwd.text = "";
        txtShopCountry.text == ""; txtShopState.text == ""; txtShopPhPIN.text = "";
        txtShopPhCountry.text = ""; txtShopPhState.text = ""; passwordEmail.text = "";
        txtShopCommodityCode.text="";
        HideList();
    }

    function loadDe(): Void {
        try {
            ResetClear();
            storeInfoController =RegistryFactory.getClientStub(RegistryConstants.StoreInformation) as com.vanuston.medeil.implementation.StoreInformation;
            var listModel: StoreInformationModel = storeInfoController.tableValues(); // Controller Call
            shopName = " {listModel.getStoreName()}";

            txtShopSName.text = listModel.getStoreName();
            txtShopOName.text = listModel.getOwnerName();
            txtShopAdd1.text = listModel.getStoreAddress1();
            txtShopAdd2.text = listModel.getStoreAddress2();
            txtShopAdd3.text = listModel.getStoreAddress3();
            txtShopCity.text = listModel.getStoreCity();
            txtShopCountry.text = listModel.getStoreCountry();
            txtShopState.text = listModel.getStoreState();
            txtShopPinCode.text = listModel.getStorePinCode();
            txtShopCNo1.text = listModel.getStoreContactNo1();
            txtShopCNo2.text = listModel.getStoreContactNo2();
            txtShopMob.text = listModel.getStoreMobileNo();
            txtShopEmail.text = listModel.getStoreEmailId();
            txtShopFax.text = listModel.getStoreFaxNo();
            txtShopLicHolder.text = listModel.getLicenseHolder();
            txtShopPhName.text = listModel.getPharmacistName();
            txtShopPAdd1.text = listModel.getPharmacistAddress1();
            txtShopPAdd2.text = listModel.getPharmacistAddress2();
            txtShopPCity.text = listModel.getPharmacistCity();
            txtShopPhCountry.text = listModel.getPharmacistCountry();
            txtShopPhState.text = listModel.getPharmacistState();
            txtShopPCNo1.text = listModel.getPharmacistContactNo1();
            txtShopPCNo2.text = listModel.getPharmacistMobileNo();
            txtShopPEmail.text = listModel.getPharmacistEmailId();
            txtShopDLNo.text = listModel.getDLNo();
            txtShopTINNo.text = listModel.getTinNo();
            txtShopCSTNo.text = listModel.getCSTNo();
            txtShopPANNo.text = listModel.getPANNo();
            txtShopRegNo.text = listModel.getRegisterationNo();
            txtShopValidity.text = listModel.getValidity();
            txtShopAdminUName.text = listModel.getUserName();
            txtShopAdminpwd.text = listModel.getPassword();
            txtShopAdminConfmpwd.text = listModel.getPassword();
            txtShopPhPIN.text = listModel.getPharmacistPinCode();
            passwordEmail.text = listModel.getStoreRmailPassword();

        } catch (e: Exception) {
            var msg: String = "Class :  Shop Information    Method : SetupCostClick()    = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function ClearAllValues(): Void {
        ResetClear();
        loadDe();
        getSetupCostClick();
    }

    function Shop(): StoreInformationModel {

        var storeInfoModel: StoreInformationModel = new StoreInformationModel();
        storeInfoModel.setReturnflag(false);
        storeInfoModel.setOwnerName(txtShopOName.rawText.trim());
        storeInfoModel.setStoreAddress1(txtShopAdd1.rawText.trim());
        storeInfoModel.setStoreAddress2(txtShopAdd2.rawText.trim());
        storeInfoModel.setStoreAddress3(txtShopAdd3.rawText.trim());
        storeInfoModel.setStoreCity(txtShopCity.rawText.trim());
        storeInfoModel.setStoreCountry(txtShopCountry.rawText.trim());
        storeInfoModel.setStoreState(txtShopState.rawText.trim());
        storeInfoModel.setStorePinCode(txtShopPinCode.rawText.trim());
        storeInfoModel.setStoreContactNo1(txtShopCNo1.rawText.trim());
        storeInfoModel.setStoreContactNo2(txtShopCNo2.rawText.trim());
        storeInfoModel.setStoreMobileNo(txtShopMob.rawText.trim());
        storeInfoModel.setStoreEmailId(txtShopEmail.rawText.trim());
        storeInfoModel.setStoreFaxNo(txtShopFax.rawText.trim());
        storeInfoModel.setLicenseHolder(txtShopLicHolder.rawText.trim());
        storeInfoModel.setPharmacistName(txtShopPhName.rawText.trim());
        storeInfoModel.setPharmacistAddress1(txtShopPAdd1.rawText.trim());
        storeInfoModel.setPharmacistAddress2(txtShopPAdd2.rawText.trim());
        storeInfoModel.setPharmacistCity(txtShopPCity.rawText.trim());
        storeInfoModel.setPharmacistCountry(txtShopPhCountry.rawText.trim());
        storeInfoModel.setPharmacistState(txtShopPhState.rawText.trim());
        storeInfoModel.setPharmacistContactNo1(txtShopPCNo1.rawText.trim());
        storeInfoModel.setPharmacistMobileNo(txtShopPCNo2.rawText.trim());
        storeInfoModel.setPharmacistEmailId(txtShopPEmail.rawText.trim());
        storeInfoModel.setDLNo(txtShopDLNo.rawText.trim());
        storeInfoModel.setTinNo(txtShopTINNo.rawText.trim());
        storeInfoModel.setCSTNo(txtShopCSTNo.rawText.trim());
        storeInfoModel.setPANNo(txtShopPANNo.rawText.trim());
       // storeInfoModel.setCommodityCode(txtShopCommodityCode.rawText.trim());
        storeInfoModel.setRegisterationNo(txtShopRegNo.rawText.trim());
        storeInfoModel.setValidity(txtShopValidity.rawText.trim());
        storeInfoModel.setUserName(txtShopAdminUName.rawText.trim());
        storeInfoModel.setPassword(txtShopAdminpwd.rawText.trim());
        storeInfoModel.setConfirmPassword(txtShopAdminConfmpwd.rawText.trim());
        storeInfoModel.setPharmacistPinCode(txtShopPhPIN.rawText.trim());
        storeInfoModel.setStoreRmailPassword(passwordEmail.rawText.trim());

        try {
            if (txtShopSName.rawText.trim().length() <= 0) {
                FXinfo("Please Enter Shop Name", txtShopSName);
            } else {
                storeInfoModel.setStoreName(txtShopSName.rawText.trim());
                storeInfoModel.setReturnflag(true);
            }
        } catch (e: Exception) {
            var msg: String = "Class :  Shop Information    Method : Shop()    = {e.getMessage()}";
            log.debug(msg);
        }
        return storeInfoModel;
    }

    function SaveClick(): Void {
        try {
            storeInfoController =RegistryFactory.getClientStub(RegistryConstants.StoreInformation) as com.vanuston.medeil.implementation.StoreInformation;
            var storeInfoModel: StoreInformationModel = new StoreInformationModel();
            storeInfoModel = Shop();
            storeInfoModel.setSaveType(0);
            if (storeInfoModel.isReturnflag()) {
                shopName =" {storeInfoModel.getStoreName()}";

                var returnObject = new Object();

                returnObject = storeInfoController.createRecord(storeInfoModel); // controller call
                var msgReturnModel: MsgReturnModel = new MsgReturnModel();
                msgReturnModel = returnObject as MsgReturnModel;
                if (msgReturnModel.getReturnMessage() == "0") {
                    FXalert(0);
                } else {
                    FXinfo(msgReturnModel.getReturnMessage());
                }
            }
        } catch (e: Exception) {
            var msg: String = "Class :  Shop Information    Method : SetupCostClick()    = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function setup(): Void {
        panel.visible = true;
        panelHomePage.visible = false;
        currentState.actual = currentState.findIndex("General");
    }

    public function LinktoCostState(): Void {
        panel.visible = true;
        panelHomePage.visible = false;
        currentState.actual = currentState.findIndex("Cost");
    }

    function mandatory(): Void {
        txtShopSName.style = mandatoryStyle;

    }

    public function StartUp(): Void {
        CommonDeclare.MainPageForm = "Shop Information";
        loadDe();
        getSetupCostClick();
        imageClose.image = Image { url: "{__DIR__}images/FrmClose.png" };
        FScreen();
        panel.visible = true;
        panelHomePage.visible = false;
        delete  panelMsgbox.content;
        panelMsgbox.visible = false;
        mandatory();
    }

    public function CancelForm(): Void {
        CommonDeclare.MainPageForm = "";
    }

}
    


