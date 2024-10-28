package com.vanuston.medeil.ui;

import java.lang.*;
import javafx.scene.image.*;
import javafx.scene.control.TextBox;
import javafx.scene.input.*;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import com.vanuston.medeil.ui.calendar.theme.Theme;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.KeyRegistry;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.model.ComplaintModel;
import java.sql.Date;
import com.vanuston.medeil.uitables.ConfirmDialogBox;

public class ComplaintRegister {
    //Controller Instance
    var commonController : CommonImplements ;//= RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements ;
    var complaintRegisterController : com.vanuston.medeil.implementation.ComplaintRegister ;//= RegistryFactory.getClientStub(RegistryConstants.ComplaintRegister ) as com.vanuston.medeil.implementation.ComplaintRegister ;
    var type: String = null;
    var dobFlag: Boolean = false;
    var listH = 0.00;
    var fxCalendar = FXCalendar {
                theme: Theme {};
            };
    var log: Logger = Logger.getLogger(ComplaintRegister.class, "CRM");
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 397.5
        layoutY: 0.0
        styleClass: "rectFormHeader"
        width: bind panelW
        height: 575.0
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
    
    public-read def imgEdit: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imageView3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imgCancel: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
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
        layoutY: 237.0
        layoutInfo: __layoutInfo_separator2
    }
    
    def __layoutInfo_listProduct: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
        height: bind listH
    }
    public-read def listProduct: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C2LX
        layoutY: 21.0
        layoutInfo: __layoutInfo_listProduct
        items: null
    }
    
    public-read def imageViewProduct: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C2LX+Type1TextboxW-2
        layoutY: 151.0
    }
    
    def __layoutInfo_listEmp: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
        height: bind listH
    }
    public-read def listEmp: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C2LX
        layoutY: 21.0
        layoutInfo: __layoutInfo_listEmp
        items: null
    }
    
    public-read def imageDownEmp: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C2LX+Type1TextboxW-2
        layoutY: 280.0
    }
    
    public-read def imgDate: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind imgCalenderLx
        layoutY: 130.0
    }
    
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX
        layoutY: 124.0
        text: "Label"
    }
    
    def __layoutInfo_txtCompBilldate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtCompBilldate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C4LX
        layoutY: 130.0
        layoutInfo: __layoutInfo_txtCompBilldate
    }
    
    def __layoutInfo_listCustomer: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
        height: bind listH
    }
    public-read def listCustomer: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C2LX
        layoutInfo: __layoutInfo_listCustomer
        items: null
    }
    
    public-read def CompCalendarPanel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelCalenderLx
        layoutY: 207.0
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
    }
    
    public-read def imageViewDown: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C2LX+Type2TextboxW-2
        layoutY: 173.0
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
    
    def __layoutInfo_txtCompEmp: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtCompEmp: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_txtCompEmp
        font: Arial_12
    }
    
    def __layoutInfo_txtCompBatch: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtCompBatch: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 56.0
        layoutInfo: __layoutInfo_txtCompBatch
        font: Arial_12
    }
    
    def __layoutInfo_txtCompMfg: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtCompMfg: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 28.0
        layoutInfo: __layoutInfo_txtCompMfg
        font: Arial_12
    }
    
    def __layoutInfo_txtCompPdt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtCompPdt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_txtCompPdt
        font: Arial_12
    }
    
    def __layoutInfo_txtCompCName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
        hfill: false
    }
    public-read def txtCompCName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 158.0
        layoutInfo: __layoutInfo_txtCompCName
        style: ""
        styleClass: "text-box"
        effect: null
        text: ""
        font: Arial_12
    }
    
    def __layoutInfo_txtCompReg: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind ComplainTextW
        height: 96.0
    }
    public-read def txtCompReg: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 265.0
        layoutInfo: __layoutInfo_txtCompReg
        font: Arial_12
        multiline: true
    }
    
    def __layoutInfo_txtCompDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtCompDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 130.0
        layoutInfo: __layoutInfo_txtCompDate
        font: Arial_12
    }
    
    def __layoutInfo_txtCompDName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtCompDName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 186.0
        layoutInfo: __layoutInfo_txtCompDName
        font: Arial_12
    }
    
    def __layoutInfo_txtCompBillNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtCompBillNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 130.0
        layoutInfo: __layoutInfo_txtCompBillNo
        text: ""
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
    
    def __layoutInfo_btnCompCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind CancelW
        height: bind bottonH
    }
    public-read def btnCompCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton4LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnCompCancel
        onKeyReleased: btnCancelOnKeyReleased
        effect: reflectionEffect
        graphic: imgCancel
        text: "Cancel [F8]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnCompReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnCompReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton3LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnCompReset
        onKeyReleased: btnResetOnKeyReleased
        effect: reflectionEffect
        graphic: imageView3
        text: "Reset [F4]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnCompSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnCompSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnCompSave
        onKeyReleased: btnSaveOnKeyReleased
        translateX: 0.0
        effect: reflectionEffect
        graphic: imageView
        text: "Save  [F3]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnCompEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnCompEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton2LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnCompEdit
        onKeyReleased: btnEditOnKeyReleased
        effect: reflectionEffect
        graphic: imgEdit
        text: "Edit  [F6]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    public-read def panelButtons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: bind panelButtonsLY
        content: [ btnCompEdit, btnCompSave, btnCompReset, btnCompCancel, ]
    }
    
    public-read def toggleGroup: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def rdoCompOther: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: bind C2LX+300
        layoutY: 244.0
        onKeyPressed: rdoCompOtherOnKeyPressed
        onMouseClicked: rdoCompOtherOnMouseClicked
        text: "Others"
        font: Arial_12
        toggleGroup: toggleGroup
    }
    
    public-read def rdoCompServ: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: bind C2LX+200
        layoutY: 244.0
        onKeyPressed: rdoCompServOnKeyPressed
        onMouseClicked: rdoCompServOnMouseClicked
        text: "Service"
        font: Arial_12
        toggleGroup: toggleGroup
    }
    
    public-read def rdoCompPdt: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: bind C2LX+100
        layoutY: 244.0
        onKeyPressed: rdoCompPdtOnKeyPressed
        onMouseClicked: rdoCompPdtOnMouseClicked
        text: "Product"
        font: Arial_12
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
    
    public-read def label6: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 0.0
        text: "Employee Name"
        font: Arial_12
        textFill: DarkGray
    }
    
    def __layoutInfo_panelService: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def panelService: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: 50.0
        layoutY: 470.0
        layoutInfo: __layoutInfo_panelService
        content: [ label6, txtCompEmp, listEmp, imageDownEmp, ]
    }
    
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 56.0
        text: "Batch"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 28.0
        text: "Manufacturer"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        text: "Product Name"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def panelProduct: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: 50.0
        layoutY: 370.0
        content: [ label3, txtCompPdt, label4, txtCompMfg, txtCompBatch, label5, listProduct, imageViewProduct, ]
    }
    
    public-read def label14: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 130.0
        text: "Bill No"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label11: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 280.0
        text: "Suggestion"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label10: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 265.0
        text: "Complaint /"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 130.0
        text: "Date"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label8: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 186.0
        text: "Doctor Name"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 158.0
        styleClass: "label"
        text: "Customer Name"
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
        layoutX: 32.0
        layoutY: 210.0
        text: "Complaint Details"
        font: Arial_18
        textFill: Green
    }
    
    public-read def label15: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 35.0
        layoutY: 91.0
        text: "Customer Details"
        font: Arial_18
        textFill: Green
    }
    
    public-read def dropShadowEffect: javafx.scene.effect.DropShadow = javafx.scene.effect.DropShadow {
    }
    
    public-read def lightingEffect: javafx.scene.effect.Lighting = javafx.scene.effect.Lighting {
    }
    
    def __layoutInfo_label: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
    }
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 506.0
        layoutY: 34.0
        layoutInfo: __layoutInfo_label
        effect: lightingEffect
        text: "Complaint Registrer"
        font: Arial_25
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ rectangle, rectHeader, label, separator, label2, label8, label9, label10, label11, panelButtons, txtCompBillNo, label14, txtCompDName, rdoCompPdt, rdoCompServ, txtCompDate, txtCompReg, txtCompCName, separator2, label15, label16, rdoCompOther, panelProduct, panelService, imgDate, label7, txtCompBilldate, listCustomer, CompCalendarPanel, panelAlert, imageViewDown, ]
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
    }
    
    public-read def font: javafx.scene.text.Font = javafx.scene.text.Font {
    }
    
    public-read def linearGradientheader: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
    }
    
    public-read def imageSave: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Save1.png"
    }
    
    public-read def imageEdit: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Edit.png"
    }
    
    public-read def imageReset: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Reset.png"
    }
    
    public-read def imageCancel: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Cancel.png"
    }
    
    public-read def imageDown: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
    }
    
    public-read def imageBack: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/arrow_Left.png"
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
                            rectangle.blocksMouse = true;
                            rectangle.arcWidth = 5.0;
                            rectangle.arcHeight = 5.0;
                            rectHeader.visible = true;
                            rectHeader.opacity = 0.25;
                            rectHeader.managed = true;
                            rectHeader.layoutX = 0.0;
                            rectHeader.fill = linearGradientheader;
                            rectHeader.height = 32.0;
                            rectHeader.arcWidth = 5.0;
                            rectHeader.arcHeight = 5.0;
                            label.layoutX = 0.0;
                            label.layoutY = 1.0;
                            label.text = "Complaint Register - alt+L";
                            label.hpos = javafx.geometry.HPos.CENTER;
                            __layoutInfo_separator.height = 5.0;
                            label8.layoutY = 158.0;
                            label9.layoutY = 186.0;
                            label10.text = "Complaints /";
                            label11.text = "Suggestions";
                            imgEdit.visible = true;
                            imgEdit.image = imageEdit;
                            btnCompEdit.layoutY = 0.0;
                            btnCompEdit.text = "Edit [F6]";
                            btnCompEdit.action = btnCompEditActionAtShown;
                            imageView.visible = true;
                            imageView.image = imageSave;
                            btnCompSave.layoutY = 0.0;
                            btnCompSave.text = "Save [F3]";
                            btnCompSave.action = btnCompSaveActionAtShown;
                            imageView3.visible = true;
                            imageView3.image = imageReset;
                            btnCompReset.layoutY = 0.0;
                            btnCompReset.action = btnCompResetActionAtShown;
                            imgCancel.visible = true;
                            imgCancel.image = imageCancel;
                            btnCompCancel.layoutY = 0.0;
                            btnCompCancel.text = "Cancel [F8]";
                            btnCompCancel.action = btnCompCancelActionAtShown;
                            panelButtons.visible = true;
                            txtCompBillNo.onKeyPressed = txtCompBillNoOnKeyPressedAtShown;
                            txtCompBillNo.onKeyReleased = txtCompBillNoOnKeyReleasedAtShown;
                            txtCompBillNo.editable = true;
                            label14.text = "Bill No.";
                            txtCompDName.layoutY = 158.0;
                            txtCompDName.editable = false;
                            txtCompDate.layoutY = 186.0;
                            txtCompDate.onKeyPressed = txtCompDateOnKeyPressedAtShown;
                            txtCompDate.editable = false;
                            txtCompReg.onKeyPressed = txtCompRegOnKeyPressedAtShown;
                            txtCompCName.editable = false;
                            rdoCompOther.layoutY = 244.0;
                            rdoCompOther.toggleGroup = toggleGroup;
                            txtCompPdt.onKeyPressed = txtCompPdtOnKeyPressedAtShown;
                            txtCompPdt.onKeyReleased = txtCompPdtOnKeyReleasedAtShown;
                            label4.text = "Mfr.";
                            txtCompMfg.onKeyPressed = txtCompMfgOnKeyPressedAtShown;
                            txtCompMfg.editable = false;
                            txtCompBatch.onKeyPressed = txtCompBatchOnKeyPressedAtShown;
                            txtCompBatch.editable = false;
                            label5.text = "Batch No.";
                            listProduct.visible = false;
                            listProduct.items = null;
                            imageViewProduct.visible = true;
                            imageViewProduct.layoutY = 0.0;
                            imageViewProduct.onMouseClicked = imageViewProductOnMouseClickedAtShown;
                            imageViewProduct.blocksMouse = true;
                            imageViewProduct.image = imageDown;
                            panelProduct.layoutX = 0.0;
                            txtCompEmp.onKeyPressed = txtCompEmpOnKeyPressedAtShown;
                            txtCompEmp.onKeyReleased = txtCompEmpOnKeyReleasedAtShown;
                            listEmp.visible = false;
                            listEmp.items = null;
                            imageDownEmp.visible = true;
                            imageDownEmp.managed = true;
                            imageDownEmp.layoutY = 0.0;
                            imageDownEmp.onMouseClicked = imageDownEmpOnMouseClickedAtShown;
                            imageDownEmp.blocksMouse = true;
                            imageDownEmp.image = imageDown;
                            panelService.layoutX = 0.0;
                            panelService.layoutY = 455.0;
                            __layoutInfo_panelService.height = 100.0;
                            imgDate.layoutY = 186.0;
                            imgDate.onMouseClicked = imgDateOnMouseClickedAtShown;
                            imgDate.blocksMouse = true;
                            label7.visible = true;
                            label7.layoutY = 136.0;
                            label7.text = "Bill Date";
                            label7.font = Arial_12;
                            txtCompBilldate.visible = true;
                            txtCompBilldate.editable = false;
                            listCustomer.visible = false;
                            listCustomer.layoutY = 151.0;
                            listCustomer.onKeyPressed = listCustomerOnKeyPressedAtShown;
                            CompCalendarPanel.visible = true;
                            CompCalendarPanel.blocksMouse = true;
                            panelAlert.visible = true;
                            imageViewDown.visible = true;
                            imageViewDown.layoutY = 130.0;
                            imageViewDown.onMouseClicked = imageViewDownOnMouseClickedAtShown;
                            imageViewDown.blocksMouse = true;
                            imageViewDown.image = imageDown;
                            panel.visible = true;
                            image.placeholder = imageDown;
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

    function btnCancelOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            if (btnCompCancel.text == "Cancel [F8]") { cancel () ; }
            else { back () ; }
        }
    }

    function btnResetOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER)
            reset () ;
    }
    function btnSaveOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            if (btnCompSave.text == "Save [F3]") { save () ; }
            else { del () ; }
        }
    }

    function btnEditOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            if (btnCompEdit.text == "Edit [F6]") { edit () ; }
            else { update () ; }
        }
    }

    function rdoCompOtherOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            rdoCompOther.selected = true;
            ClearPanel();
            txtCompReg.requestFocus();
        }
    }

    function rdoCompServOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            rdoCompServ.selected = true;
            ClearPanel();
            panelService.visible = true;
            panelService.layoutY = 370.0;
            txtCompEmp.style = mandatoryStyle;
            txtCompReg.requestFocus();
        }
    }

    function rdoCompPdtOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            rdoCompPdt.selected = true;
            ClearPanel();
            panelProduct.visible = true;
            panelProduct.layoutY = 370.0;
            txtCompPdt.style = mandatoryStyle;
            txtCompReg.requestFocus();
        }
    }

    function imageViewProductOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        getProduct(1);
    }

    function imageDownEmpOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        getEmp(1);
    }

    function imageViewDownOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        if (btnCompSave.text == "Update [F7]") {
            getComplaintNo(1);
        } else {
            getSalesBillNo(1);
        }
    }

    function rectangleOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        fxCalendar.visible = false;
        listCustomer.visible = false;
        listEmp.visible = false;
        listProduct.visible = false;
    }

    var panelW = bind CommonDeclare.panelFormW on replace {
        Type5TextboxW = (3.811944091 * panelW / 100);
        ComplainTextW = (73.95171537 * panelW / 100);
    }
    var Type5TextboxW = (3.811944091 * panelW / 100);
    var ComplainTextW = (73.95171537 * panelW / 100);
    var panelH = bind CommonDeclare.panelFormH;
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var C1LX = bind CommonDeclare.Column1LX;
    var C2LX = bind CommonDeclare.Column2LX;
    var C3LX = bind CommonDeclare.Column3LX;
    var C4LX = bind CommonDeclare.Column4LX;
    var botton1LX = bind CommonDeclare.botton1LX;
    var botton2LX = bind CommonDeclare.botton2LX;
    var botton3LX = bind CommonDeclare.botton3LX;
    var botton4LX = bind CommonDeclare.botton4LX;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    var bottonW = bind CommonDeclare.bottonW;
    var CancelW = bottonW;
    var bottonH = bind CommonDeclare.bottonH;
    var seperatorW = bind CommonDeclare.seperatorW;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;
    var Type4TextboxW = bind CommonDeclare.Type4TextboxW;
    var imgCalenderLx = bind C2LX + Type3TextboxW + 2;
    var panelCalenderLx = bind imgCalenderLx + 20;
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    var mandatoryStyle: String = CommonDeclare.textbox_mandatory();
    var errorStyle: String = CommonDeclare.textbox_error();
    def CustomAlert = CustomAlert {};

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Complaint Register", type);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Complaint Register", msg);
        showAlertbox();
    }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Complaint Register", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = errorStyle;
    }

    def kr = KeyRegistry {};
    var ss = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 6 and CommonDeclare.form[5] == 3) {
            shortcut(ss);
        }
    }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {

         if (event.controlDown or event.altDown or event.shiftDown) {
            kr.actionKey = event.code;
        }
        if (event.code == kr.save and btnCompSave.text == "Save [F3]" and not btnCompSave.disable) {
            save();
        }
        if (event.code == kr.edit and btnCompEdit.text == "Edit [F6]" and btnCompEdit.disable == false) {
            edit();
        }
        if (event.code == kr.reset and btnCompReset.text == "Reset [F4]") {
            reset();
        }
        if (event.code == kr.update and btnCompSave.disable == false) {
            if (btnCompSave.text == "Update [F7]") { update(); }
        }
        if (event.code == kr.del and btnCompEdit.disable == false) {
            if (btnCompEdit.text == "Delete [F5]") { del(); }
        }
        if (event.controlDown and event.code == kr.back) {
            if (btnCompCancel.text == "Back [Ctrl+Left]") { back(); }
        }
        if (event.code == kr.cancel and btnCompCancel.text == "Cancel [F8]") {
            cancel();
        }
    }

    function txtCompEmpOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        
        txtCompEmp.style = mandatoryStyle;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
         
                listCustomer.visible = false;
                btnCompSave.requestFocus();
         
        }
        shortcut(event);
    }

    function txtCompBatchOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        listCustomer.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            if (rdoCompPdt.selected == true) { btnCompSave.requestFocus(); }
        } shortcut(event);
    }

    function txtCompMfgOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        listCustomer.visible = false;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtCompBatch.requestFocus(); }
        shortcut(event);
    }

    function txtCompPdtOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        listCustomer.visible = false;
        txtCompPdt.style = mandatoryStyle;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtCompMfg.requestFocus();
        }
        shortcut(event);
    }

    function txtCompRegOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        listCustomer.visible = false;
        txtCompReg.style = mandatoryStyle;
        if (event.code == KeyCode.VK_TAB) {
            if (rdoCompPdt.selected == true) { txtCompPdt.requestFocus(); } else if (rdoCompServ.selected == true) { txtCompEmp.requestFocus(); } else if (rdoCompOther.selected == true) { btnCompSave.requestFocus(); }
        } shortcut(event);
    }

    function txtCompDateOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        listCustomer.visible = false;
        txtCompDate.style = mandatoryStyle;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { rdoCompPdt.requestFocus(); }
        if (event.code == KeyCode.VK_ESCAPE) { fxCalendar.visible = false; }
        shortcut(event);
    }

    function txtCompBillNoOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtCompBillNo.style = mandatoryStyle;
        shortcut(event);
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            //Controller Instance
            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements ;
            var i: Integer = 0;
            if (btnCompSave.text == "Save [F3]") {
                //Controller Instance
                i = commonController.selectCount("sales_maintain_bill", "bill_no","txtCompBillNo.rawText");
            } else {
                //Controller Instance
                i = commonController.selectCount("compliants_register", "bill_no","txtCompBillNo.rawText");
            }
            if (i == 0) {
                txtCompBillNo.requestFocus();
                txtCompBillNo.text = "";
            } else {
                listCustomer.visible = false;
                txtCompDate.requestFocus();
            }
        }
    }
    function btnCompCancelActionAtShown(): Void {
        cancel();
    }

    function btnCompResetActionAtShown(): Void {
        reset();
    }

    function btnCompEditActionAtShown(): Void {

        if (btnCompEdit.text == "Delete [F5]") {
            del();
        } else {
            edit();
        }
    }

    function btnCompSaveActionAtShown(): Void {

        if (btnCompSave.text == "Update [F7]") {
            update();
        } else {
            save();
        }
    }

    public function save(): Void {
        try {
            var san: Integer = 0;
            san = clickValid();
            if (san == 10) {                
                var about: String = null;
                if (rdoCompPdt.selected == true) {
                    about = "Product";
                } else if (rdoCompServ.selected == true) {
                    about = "Service";
                } else if (rdoCompOther.selected == true) {
                    about = "Others";
                }
                var complaintModel : ComplaintModel =new ComplaintModel() ;
                complaintModel.setCompliantType(about);
                complaintModel.setBillNumber(txtCompBillNo.rawText) ;
                complaintModel.setCustomerName( txtCompCName.rawText ) ;
                complaintModel.setDoctorName(txtCompDName.rawText);
                complaintModel.setBillDate(Date.valueOf(DateUtils.changeFormatDate(txtCompBilldate.rawText)) );
                complaintModel.setCompliantDate(Date.valueOf(DateUtils.changeFormatDate(txtCompDate.rawText)) );
                complaintModel.setComplaints(txtCompReg.rawText);
                complaintModel.setItemName(txtCompPdt.rawText);
                complaintModel.setBatchNumber(txtCompBatch.rawText);
                complaintModel.setManufacturerName(txtCompMfg.rawText);
                complaintModel.setEmployeeName(txtCompEmp.rawText);
                //Controller Instance
                complaintRegisterController = RegistryFactory.getClientStub(RegistryConstants.ComplaintRegister ) as com.vanuston.medeil.implementation.ComplaintRegister ;
                if(complaintRegisterController.createRecord(complaintModel).equals(true)) {
                    FXalert(0);
                    commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements ;
                    commonController.updateLog("Complaint Register", btnCompSave.text);
                }
                txtCompBillNo.requestFocus();
                clear();
            }
        } catch (e: Exception) {
            var msg: String = "Class : Complaint Register  Method : Save()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function update(): Void {
        try {
            var san: Integer = 0;
            san = clickValid();
            if (san == 10) {                
                var about: String = null;
                if (rdoCompPdt.selected == true) {
                    about = "Product";
                } else if (rdoCompServ.selected == true) {
                    about = "Service";
                } else if (rdoCompOther.selected == true) {
                    about = "Others";
                }
                var complaintModel : ComplaintModel =new ComplaintModel() ;
                complaintModel.setCompliantType(about);
                complaintModel.setBillNumber(txtCompBillNo.rawText) ;
                complaintModel.setCustomerName( txtCompCName.rawText ) ;
                complaintModel.setDoctorName(txtCompDName.rawText);
                complaintModel.setBillDate(Date.valueOf(DateUtils.changeFormatDate(txtCompBilldate.rawText)) );
                complaintModel.setCompliantDate(Date.valueOf(DateUtils.changeFormatDate(txtCompDate.rawText)) );
                complaintModel.setComplaints(txtCompReg.rawText);
                complaintModel.setItemName(txtCompPdt.rawText);
                complaintModel.setBatchNumber(txtCompBatch.rawText);
                complaintModel.setManufacturerName(txtCompMfg.rawText);
                complaintModel.setEmployeeName(txtCompEmp.rawText);
                //Controller Instance
                                 var cn : ConfirmDialogBox = new ConfirmDialogBox(0,"Complaint Register");
                                 var a =bind cn.staus ;
                                 if (a) {
                                     //Controller Instance
                                     complaintRegisterController = RegistryFactory.getClientStub(RegistryConstants.ComplaintRegister ) as com.vanuston.medeil.implementation.ComplaintRegister ;
                                     if(complaintRegisterController.updateRecord(complaintModel).equals(true)) {

                                         //Controller Instance
                                         commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements ;
                                        commonController.updateLog ("Complaint Register", btnCompEdit.text);
                                      }
                                    txtCompBillNo.requestFocus();
                                      FXalert(4);
                                    clear();
                                }
            }
        } catch (e: Exception) {
            var msg: String = "Class : Complaint Register  Method : Update()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function del(): Void {
        try {
            if (txtCompBillNo.text != null) {
                var cn : ConfirmDialogBox = new ConfirmDialogBox(1,"Complaint Register");
                var a =bind cn.staus;
                                if (a) {
                                    //Controller Instance
                                    complaintRegisterController = RegistryFactory.getClientStub(RegistryConstants.ComplaintRegister ) as com.vanuston.medeil.implementation.ComplaintRegister ;
                                    if(complaintRegisterController.deleteRecord(txtCompBillNo.rawText)) {

                                    }
                                    //Controller Instance
                                    commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements ;
                                    commonController.updateLog("Complaint Register", btnCompCancel.text ) ;
                                    txtCompBillNo.requestFocus();
                                    clear();
                                      FXalert(5);
                                }
            } else {
                FXinfo("Please Select the Bill Number to be deleted...");
            }
        } catch (e: Exception) {
            var msg: String = "Class : Complaint Register  Method : Delete()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function edit() {
        CancelW = bottonW + 50;
        imgEdit.image = imageCancel;
        imgCancel.image = imageBack;
        getPrivileges(logUser);
        txtCompBillNo.requestFocus();
        clear();
        btnCompSave.text = "Update [F7]";
        btnCompEdit.text = "Delete [F5]";
        btnCompCancel.text = "Back [Ctrl+Left]";
    }

    public function reset() {
        clear();
        txtCompBillNo.requestFocus();
        rdoCompPdt.disable = false;
        rdoCompServ.disable = false;
        rdoCompOther.disable = false;
        listCustomer.visible =false;
        listEmp.visible = false;
        listProduct.visible = false;
    }

    public function cancel() {
        if (btnCompCancel.text == "Back [Ctrl+Left]") {
            back();
        } else {
            clear();
            delete  panel.content;
            panel.visible = false;
            CommonDeclare.form[5] = 0;            
        }
    }

    public function back():Void {
	    btnCompSave.disable = false;		
        btnCompEdit.disable = false;		
        btnCompReset.disable = false;	
        CancelW = bottonW;
        imgEdit.image = imageEdit;
        imgCancel.image = imageCancel;
        btnCompSave.text = "Save [F3]";
        btnCompEdit.text = "Edit [F6]";
        btnCompReset.text = "Reset [F4]";
        btnCompCancel.text = "Cancel [F8]";
        clear();		
        rdoCompPdt.disable = false;
        rdoCompServ.disable = false;
        rdoCompOther.disable = false;
        txtCompBillNo.requestFocus();
        listCustomer.visible = false;
		getPrivileges(logUser);
    }

    function listCustomerOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (listCustomer.focused) {
            if (event.code == KeyCode.VK_DOWN)
                listCustomer.selectFirstRow();
        }
    }

    function txtCompBillNoOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {

        if (btnCompSave.text == "Update [F7]" and btnCompEdit.text == "Delete [F5]") {
            getComplaintNo(0);
            if (event.code == KeyCode.VK_DOWN and listCustomer.items != null) {
                listCustomer.requestFocus();
                listCustomer.selectFirstRow();
            }
        } else {
            getSalesBillNo(0);
            if (event.code == KeyCode.VK_DOWN and listCustomer.items != null) {
                listCustomer.requestFocus();
                listCustomer.selectFirstRow();
            }
        }
        if (event.code == KeyCode.VK_ESCAPE) {
            listCustomer.visible = false;
            txtCompBillNo.requestFocus();
        }
    }

    function txtCompEmpOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {

        if (txtCompBillNo.text != null and rdoCompServ.selected == true) {
            getEmp(0);
            if (event.code == KeyCode.VK_DOWN and listEmp.items != null) {
                listEmp.requestFocus();
                listEmp.selectFirstRow();
            }
            if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB) {
                listEmp.visible = false;
                txtCompEmp.requestFocus();
            }
        }
    }

    function txtCompPdtOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {

        if (txtCompBillNo.text != null and rdoCompPdt.selected == true) {
            getProduct(0);
            if (event.code == KeyCode.VK_DOWN and listProduct != null) {
                listProduct.requestFocus();
                listProduct.selectFirstRow();
            }
        }
        if (event.code == KeyCode.VK_ESCAPE) {
            listProduct.visible = false;
            txtCompPdt.requestFocus();
        }
    }

    public function getProduct(con: Integer) {
        if (txtCompBillNo.text != null) {
            var empName: String[] = [];
            listProduct.visible = true;
            listH = 0.0;
            var size = listProduct.items.size();
            if (not listProduct.items.isEmpty()) {
                for (i in [0..<size])
                    listProduct.items[i] = null;
                txtCompPdt.requestFocus();
            }
            //Controller Instance
            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements ;
            if (con == 0) {
                empName = commonController.GetProductDetails(txtCompBillNo.rawText, type).toArray() as String[] ;
            } else {
                empName = commonController.GetProductDetails(txtCompBillNo.rawText, type).toArray() as String[] ;
            }
            listProduct.clearSelection();
            listProduct.items = empName;
            listProduct.onKeyPressed = function(e) {
                        if (e.code == KeyCode.VK_ENTER) {
                            txtCompPdt.text = "{listProduct.selectedItem}";
                            displayPro(txtCompBillNo.text, txtCompPdt.text, type);
                            listProduct.visible = false;
                            btnCompSave.requestFocus();
                        } else if (e.code == KeyCode.VK_DOWN) {
                            if (listProduct.selectedIndex == 0) {
                                listProduct.selectFirstRow();
                            }
                        } else if (e.code == KeyCode.VK_ESCAPE) {
                            listProduct.visible = false;
                            txtCompPdt.requestFocus();
                        }
                    };
            listProduct.onMouseClicked = function(e) {
                        txtCompPdt.text = "{listProduct.selectedItem}";
                        displayPro(txtCompBillNo.text, txtCompPdt.text, type);
                        listProduct.visible = false;
                        btnCompSave.requestFocus();
                    }
            var height: Integer = 0;
            if (listProduct.items.size() < 6) {
                height = listProduct.items.size();
            } else {
                height = 5;
            }
            for (i in [1..height]) {
                listH += 25.0;
            }
        }
    }

    public function getEmp(con: Integer) {
        var empName: String[] = [];
        listEmp.visible = true;
        listH = 0.0;
        var size = listEmp.items.size();
        if (not listEmp.items.isEmpty()) {
            for (i in [0..<size])
                listEmp.items[i] = null;
            txtCompEmp.requestFocus();
        }
        //Controller instance
        commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements ;
        if (con == 0) {
            empName = commonController.getEmployers(txtCompEmp.rawText.trim()).toArray() as String[] ;
        } else {
            empName = commonController.getEmployers("").toArray() as String[] ;
        }
        listEmp.clearSelection();
        listEmp.items = empName;
        listEmp.onKeyPressed = function(e) {
                    if (e.code == KeyCode.VK_ENTER) {
                        txtCompEmp.text = "{listEmp.selectedItem}";
                        listEmp.visible = false;
                        btnCompSave.requestFocus();
                    } else if (e.code == KeyCode.VK_DOWN) {
                        if (listEmp.selectedIndex == 0) {
                            listEmp.selectFirstRow();
                        }
                    } else if (e.code == KeyCode.VK_ESCAPE) {
                        listEmp.visible = false;
                        txtCompEmp.requestFocus();
                    }
                };
        listEmp.onMouseClicked = function(e) {
                    txtCompEmp.text = "{listEmp.selectedItem}";
                    listEmp.visible = false;
                    btnCompSave.requestFocus();
                }
        var height: Integer = 0;
        if (listEmp.items.size() < 6) {
            height = listEmp.items.size();
        } else {
            height = 5;
        }
        for (i in [1..height]) {
            listH += 25.0;
        }
    }

    public function getComplaintNo(con: Integer) {
    if(not listCustomer.visible){
        var custName: String[] = [];
        listCustomer.visible = true;
        listH = 0.0;
        var size = listCustomer.items.size();
        if (not listCustomer.items.isEmpty()) {
            for (i in [0..<size])
                listCustomer.items[i] = null;
            txtCompBillNo.requestFocus();
        }
        //Controller Instance
        commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements ;
        if (con == 0) {
            custName = commonController.CompliantNumber(txtCompBillNo.rawText.trim()).toArray() as String[] ;
        } else {
            custName = commonController.CompliantNumber("").toArray() as String[] ;
        }
        listCustomer.clearSelection();
        listCustomer.items = custName;
        listCustomer.onKeyPressed = function(e) {
                    if (e.code == KeyCode.VK_ENTER) {
                        txtCompBillNo.text = "{listCustomer.selectedItem}";
                        var sam: String = txtCompBillNo.text;
                        diaplayComplaint(sam);
                        listCustomer.visible = false;
                        txtCompDate.requestFocus();
                    } else if (e.code == KeyCode.VK_DOWN) {
                        if (listCustomer.selectedIndex == 0) {
                            listCustomer.selectFirstRow();
                        }
                    } else if (e.code == KeyCode.VK_ESCAPE) {
                        listCustomer.visible = false;
                        txtCompBillNo.requestFocus();
                    }
                };
        listCustomer.onMouseClicked = function(e) {
                    txtCompBillNo.text = "{listCustomer.selectedItem}";
                    var sam: String = txtCompBillNo.text;
                    diaplayComplaint(sam);
                    listCustomer.visible = false;
                    txtCompDate.requestFocus();
                }
        var height: Integer = 0;
        if (listCustomer.items.size() < 9) {
            height = listCustomer.items.size();
        } else {
            height = 8;
        }
        for (i in [1..height]) {
            listH += 25.0;
        }
       }
       else{
           listCustomer.visible =false;
          }
   }

    public function getSalesBillNo(con: Integer) {
        if(not listCustomer.visible){
        var custName: String[] = [];
        listCustomer.visible = true;
        listH = 0.0;
        var size = listCustomer.items.size();
        if (not listCustomer.items.isEmpty()) {
            for (i in [0..<size])
                listCustomer.items[i] = null;
            txtCompBillNo.requestFocus();
        }
        //Controller Instance
        commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements ;
        if (con == 0) {
            custName = commonController.ComplaintRegisterBillNo(txtCompBillNo.rawText.trim()).toArray() as String[] ;
        } else {
            custName = commonController.ComplaintRegisterBillNo("").toArray() as String[] ;
        }
        listCustomer.clearSelection();
        listCustomer.items = custName;
        listCustomer.onKeyPressed = function(e) {
                    if (e.code == KeyCode.VK_ENTER) {
                        txtCompBillNo.text = "{listCustomer.selectedItem}";
                        var sam: String = txtCompBillNo.text;
                        displayCust(sam);
                        listCustomer.visible = false;
                        txtCompDate.requestFocus();
                    } else if (e.code == KeyCode.VK_DOWN) {
                        if (listCustomer.selectedIndex == 0) {
                            listCustomer.selectFirstRow();
                        }
                    } else if (e.code == KeyCode.VK_ESCAPE) {
                        listCustomer.visible = false;
                        txtCompBillNo.requestFocus();
                    }
                };
        listCustomer.onMouseClicked = function(e) {
                    txtCompBillNo.text = "{listCustomer.selectedItem}";
                    var sam: String = txtCompBillNo.text;
                    displayCust(sam);
                    listCustomer.visible = false;
                    txtCompDate.requestFocus();
                }
        var height: Integer = 0;
        if (listCustomer.items.size() < 9) {
            height = listCustomer.items.size();
        } else {
            height = 8;
        }
        for (i in [1..height]) {
            listH += 25.0;
        }
      }
       else{
           listCustomer.visible =false;

       }
    }

    public function diaplayComplaint(name: String): Void {

        try {
            //Controller Instance
            complaintRegisterController = RegistryFactory.getClientStub(RegistryConstants.ComplaintRegister ) as com.vanuston.medeil.implementation.ComplaintRegister ;
            var complaintModel : ComplaintModel = complaintRegisterController.viewRecord(name) as ComplaintModel;
            var about: String ;
            txtCompCName.text = complaintModel.getCustomerName() ;
            txtCompDName.text = complaintModel.getDoctorName() ;
            txtCompBilldate.text = DateUtils.normalFormatDate( complaintModel.getBillDate() );
            txtCompDate.text = DateUtils.normalFormatDate( complaintModel.getCompliantDate() );
            about = complaintModel.getCompliantType() ;
            txtCompReg.text = complaintModel.getComplaints() ;
            txtCompPdt.text = complaintModel.getItemName() ;
            txtCompMfg.text = complaintModel.getManufacturerName() ;
            txtCompBatch.text = complaintModel.getBatchNumber() ;
            txtCompEmp.text = complaintModel.getEmployeeName() ;
            if (about.equals("Product")) {
                rdoCompPdt.selected = true;
                rdoCompServ.disable = true;
                rdoCompOther.disable = true;
                rdoCompPdt.disable = false;
                ClearPanel();
                panelProduct.visible = true;
                panelProduct.layoutY = 370.0;
            } else if (about.equals("Service")) {
                rdoCompPdt.disable = true;
                rdoCompServ.selected = true;
                rdoCompOther.disable = true;
                rdoCompServ.disable = false;
                ClearPanel();
                panelService.visible = true;
                panelService.layoutY = 370.0;
            } else if (about.equals("Others")) {
                rdoCompPdt.disable = true;
                rdoCompServ.disable = true;
                rdoCompOther.selected = true;
                rdoCompOther.disable = false;
                ClearPanel();
            }
        } catch (e: Exception) {
            var msg: String = "Class : Complaint Register  Method : DisplayComplaint()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function displayCust(name: String): Void {
        try {
            //Controller Instance
            complaintRegisterController = RegistryFactory.getClientStub(RegistryConstants.ComplaintRegister ) as com.vanuston.medeil.implementation.ComplaintRegister ;
            var complaintModel : ComplaintModel = complaintRegisterController.viewRecord(name,"sales_maintain_bill") as ComplaintModel ;
                type = complaintModel.getCompliantType() ;
                txtCompBilldate.text = DateUtils.normalFormatDate(complaintModel.getBillDate());
                txtCompCName.text = complaintModel.getCustomerName();
                txtCompDName.text = complaintModel.getDoctorName();
        } catch (e: Exception) {
            var msg: String = "Class : Complaint Register  Method : DisplayCustomer()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function displayPro(bno: String, pname: String, btype: String): Void {
        var tname: String = null;

        if (btype.equals("Cash_Bill")) {
            tname = "sales_cash_bill";
        } else if (btype.equals("Account")) {
            tname = "sales_accounts";
        } else if (btype.equals("Partial_Paid")) {
            tname = "sales_partitions_bill";
        } else if (btype.equals("Credit_Bill")) {
            tname = "sales_credit_bill";
        } else if (btype.equals("CD_Card_Bill")) {
            tname = "sales_cards_bill";
        }
        try {
            //Controller Instance
            complaintRegisterController = RegistryFactory.getClientStub(RegistryConstants.ComplaintRegister ) as com.vanuston.medeil.implementation.ComplaintRegister ;
            var complaintModel : ComplaintModel = complaintRegisterController.viewRecord(bno,tname) as ComplaintModel ;
                txtCompMfg.text = complaintModel.getManufacturerName();
                txtCompBatch.text = complaintModel.getBatchNumber();
        } catch (e: Exception) {
            var msg: String = "Class : Complaint Register  Method : DisplayProduct()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function imgDateOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {

        if (not dobFlag) {
            CompCalendarPanel.layoutY = imgDate.layoutY + txtCompDate.height + 5.0;
            if (txtCompDate.text != null) {
                var dat = txtCompDate.rawText.split("-");
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1]) - 1;
                var y = Integer.parseInt(dat[2]);
                fxCalendar.set(y, m, d);
            } else {
                var dat = DateUtils.now("dd-MM-yyyy").split("-");
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1]) - 1;
                var y = Integer.parseInt(dat[2]);
                fxCalendar.set(y, m, d);
            }
            fxCalendar.visible = not fxCalendar.visible;
            dobFlag = true;
        } else {
            fxCalendar.visible = false;
        }
    }

    var visit = bind fxCalendar.visible on replace {
        if (dobFlag and not visit) {
            getDate(0);
        }
    };

    function getDate(i: Integer) {
        if (i == 0) {
            txtCompDate.text = fxCalendar.getSelectedDate();
            dobFlag = false;
            rdoCompPdt.requestFocus();
        }
    }

    public function clear(): Void {
        txtCompBillNo.text = "";
        txtCompCName.text = "";
        txtCompDName.text = "";
        txtCompBilldate.text = "";
        txtCompDate.text = "";
        txtCompReg.text = "";
        txtCompPdt.text = "";
        txtCompMfg.text = "";
        txtCompBatch.text = "";
        txtCompEmp.text = "";
        ClearPanel();
        rdoCompOther.selected = false;
        rdoCompPdt.selected = false;
        rdoCompServ.selected = false;
        txtCompDate.text = DateUtils.now("dd-MM-yyyy");
    }

    public function clickValid(): Integer {
        var cnt: Integer = 0;
        try {
            if (txtCompBillNo.rawText.length() <= 0) {
                FXinfo("Please Enter Bill Number.", txtCompBillNo);
            } else if (txtCompDate.rawText.length() <= 0) {
                FXinfo("Please Enter Date.", txtCompDate);
            } else if (txtCompReg.rawText.length() <= 0) {
                FXinfo("Please Enter Complaint/Suggestion Details.", txtCompReg);
            } else if (rdoCompPdt.selected == true and txtCompPdt.rawText.length() <= 0) {
                FXinfo("Please Enter Product Name.", txtCompPdt);
            } else if (rdoCompServ.selected == true and txtCompEmp.rawText.length() <= 0) {
                FXinfo("Please Enter Employee Name.", txtCompEmp);
            } else if (rdoCompOther.selected == false and rdoCompPdt.selected == false and rdoCompServ.selected == false) {
                FXinfo("Please Select a Category.");
                rdoCompPdt.requestFocus();
            } else {
                cnt = 10;
            }
        } catch (e: Exception) {
            var msg: String = "Class : Complaint Register  Method : clickValid()   = {e.getMessage()}";
            log.debug(msg);
        }
        return cnt;
    }

    function mandatory(): Void {
        txtCompBillNo.style = mandatoryStyle;
        txtCompDate.style = mandatoryStyle;
        txtCompReg.style = mandatoryStyle;
    }


	function getPrivileges(u : String ):Void{
        var uname = u;
        //Controller instance
        commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements ;
        var utype = commonController.getUserType(uname);

        if(utype.equals("User"))
        {
            //Controller Instance
            var priv= commonController.getPrivileges("crm",uname);
            var ss = priv.split(",");
            var val = Integer.parseInt(ss[2]);
            if(val == 1)
            {
				btnCompSave.disable = true;
				if(btnCompEdit.text!="Edit [F6]")
				{
					btnCompEdit.disable=true;
				}
				else{
					btnCompEdit.disable=false;
				}      
            }
            else if(val == 2)
            {				
				if(btnCompEdit.text!="Edit [F6]")
				{
					btnCompEdit.disable=true;
				}
				else{
					btnCompEdit.disable=false;
				}
				btnCompSave.disable=false;				
                //This code for  READ and WRITE Access
            }
            else if(val == 3)
            {
				btnCompSave.disable=false;
				btnCompEdit.disable=false;
                //This code for FULL Access
            }
        }else {
				btnCompSave.disable=false;
				btnCompEdit.disable=false;		
		}
    }
var logUser: String =  bind CommonDeclare.user on replace{
            getPrivileges(logUser);
        }

var changPiv =  bind btnCompSave.text on replace{
            getPrivileges(logUser);
        }

var changPiv1 =  bind btnCompEdit.text on replace{
            getPrivileges(logUser);
        }	

    function rdoCompOtherOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        ClearPanel();
        txtCompReg.requestFocus();
    }

    function rdoCompServOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        ClearPanel();
        panelService.visible = true;
        panelService.layoutY = 370.0;
        txtCompEmp.style = mandatoryStyle;
        txtCompReg.requestFocus();
    }
 
    function rdoCompPdtOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        ClearPanel();
        panelProduct.visible = true;
        panelProduct.layoutY = 370.0;
        txtCompPdt.style = mandatoryStyle;
        txtCompReg.requestFocus();
    }

    public function ClearPanel() {
        panelProduct.visible = false;
        panelService.visible = false;
        
    }

    public function StartUp(): Void {
        panel.visible = true;        
        panel.content = [rectangle, rectHeader, label, separator, label2, label8, label9, label10, label11, panelButtons, txtCompBillNo, label14, txtCompDName, rdoCompPdt, rdoCompServ, txtCompDate, txtCompReg, txtCompCName, separator2, label15, label16, rdoCompOther, panelProduct, panelService, imgDate, label7, txtCompBilldate, listCustomer, CompCalendarPanel, panelAlert, imageViewDown,];
        fxCalendar.visible = false;
        CompCalendarPanel.content = [fxCalendar,];
        imgDate.image = Image { url: "{__DIR__}images/Calender.png" };
        txtCompDate.text = DateUtils.now("dd-MM-yyyy");
        ClearPanel();
        mandatory();
        txtCompBillNo.requestFocus();
        rdoCompOther.selected = false;
        rdoCompPdt.selected = false;
        rdoCompServ.selected = false;
        txtCompBillNo.requestFocus();
    }

}

