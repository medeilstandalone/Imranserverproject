package com.vanuston.medeil.ui;

import java.lang.*;
import javafx.scene.layout.LayoutInfo;
import javafx.scene.image.Image;
import javafx.scene.image.ImageView;
import javafx.scene.control.PasswordBox;
import javafx.scene.control.TextBox;
import javafx.scene.input.KeyCode;
import java.io.File;
import java.util.List;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.PurchaseOrderPDF;
import com.vanuston.medeil.util.PurchaseOrderHTML;
import com.vanuston.medeil.util.SendMail;
import com.vanuston.medeil.util.SendSMS;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.Validation;
import com.vanuston.medeil.implementation.PurchaseOrder;
import com.vanuston.medeil.model.PurchaseOrderModel;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;

public class PurchaseOrderNow {
        
    var log: Logger = Logger.getLogger(PurchaseOrderNow.class, "Inventory");
    var dutils = new DateUtils();
    var dir1 = new File(".");
    var path: String = dir1.getCanonicalFile().toString();
    var today = dutils.now("dd-MM-yyyy");
    var fileStc: String = "";
    var fileN: String = "";
    var dist_name: String = "";
    var dist_email = "";
    var fileHt = "";
    var filePdf: String = "";
    var fileHtml: String = "";
    var pdfFileName: String = "";
    var htmlfileName: String = "";
    var smsSend = 0;
    var way2SmsUserName = "";
    var way2SmsPwd = "";
    var one160by2UserName = "";
    var one160by2Pwd = "";
    var ponno = "";
    def CustomAlert = CustomAlert {};
    var mandatoryStyle: String = CommonDeclare.textbox_mandatory();
    var errorStyle: String = CommonDeclare.textbox_error();    

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Purchase Order Now", msg);
        showAlertbox();
    }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Purchase Order Now", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = errorStyle;
    }

    function FXinfo(msg: String, err_txtbox: PasswordBox): Void {
        CustomAlert.ShowInfo("Purchase Order Now", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = errorStyle;
    }
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 79.0
        layoutY: 174.0
        text: "Label"
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 79.0
        layoutY: 209.0
        text: "Label"
    }
    
    def __layoutInfo_txtDistCodeText: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtDistCodeText: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 168.0
        layoutY: 236.0
        layoutInfo: __layoutInfo_txtDistCodeText
    }
    
    public-read def label8: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 0.0
        layoutY: 209.0
        text: "Label"
    }
    
    def __layoutInfo_btnEmailHTML: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnEmailHTML: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutInfo: __layoutInfo_btnEmailHTML
        text: "Button"
        action: btnEmailHTMLAction
    }
    
    def __layoutInfo_btnEmailPDF: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnEmailPDF: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 416.0
        layoutY: 300.0
        layoutInfo: __layoutInfo_btnEmailPDF
        text: "Button"
    }
    
    def __layoutInfo_txtDistNameText: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtDistNameText: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 175.0
        layoutY: 275.0
        layoutInfo: __layoutInfo_txtDistNameText
    }
    
    def __layoutInfo_txtPdfDistCode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtPdfDistCode: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 175.0
        layoutY: 247.0
        layoutInfo: __layoutInfo_txtPdfDistCode
    }
    
    def __layoutInfo_txtPdfDistName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtPdfDistName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 175.0
        layoutY: 275.0
        layoutInfo: __layoutInfo_txtPdfDistName
    }
    
    def __layoutInfo_txtHtmlDistcode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtHtmlDistcode: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 182.0
        layoutY: 247.0
        layoutInfo: __layoutInfo_txtHtmlDistcode
    }
    
    def __layoutInfo_txtHtmlDistName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtHtmlDistName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 315.0
        layoutY: 215.0
        layoutInfo: __layoutInfo_txtHtmlDistName
    }
    
    public-read def label6: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 55.0
        layoutY: 304.0
        text: "Label"
    }
    
    public-read def Password: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 55.0
        layoutY: 302.0
        text: "Label"
    }
    
    def __layoutInfo_txtEmailtxtpwd: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtEmailtxtpwd: javafx.scene.control.PasswordBox = javafx.scene.control.PasswordBox {
        visible: false
        layoutX: 168.0
        layoutY: 310.0
        layoutInfo: __layoutInfo_txtEmailtxtpwd
    }
    
    def __layoutInfo_txtEmailPdfPwd: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtEmailPdfPwd: javafx.scene.control.PasswordBox = javafx.scene.control.PasswordBox {
        visible: false
        layoutX: 168.0
        layoutY: 304.0
        layoutInfo: __layoutInfo_txtEmailPdfPwd
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 83.0
        layoutY: 302.0
        text: "Label"
    }
    
    def __layoutInfo_txtEmailhtmlpwd: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtEmailhtmlpwd: javafx.scene.control.PasswordBox = javafx.scene.control.PasswordBox {
        visible: false
        layoutX: 181.0
        layoutY: 302.0
        layoutInfo: __layoutInfo_txtEmailhtmlpwd
    }
    
    def __layoutInfo_txtEmail: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtEmail: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 173.0
        layoutY: 283.0
        layoutInfo: __layoutInfo_txtEmail
    }
    
    def __layoutInfo_txtPdfEmail: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtPdfEmail: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 175.0
        layoutY: 275.0
        layoutInfo: __layoutInfo_txtPdfEmail
    }
    
    def __layoutInfo_txthtmlemail: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txthtmlemail: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 175.0
        layoutY: 269.0
        layoutInfo: __layoutInfo_txthtmlemail
    }
    
    public-read def panelEmail: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        blocksMouse: true
        content: [ label2, label3, txtDistCodeText, label8, btnEmailHTML, btnEmailPDF, txtDistNameText, txtPdfDistCode, txtPdfDistName, txtHtmlDistcode, txtHtmlDistName, label6, Password, txtEmailtxtpwd, txtEmailPdfPwd, label9, txtEmailhtmlpwd, txtEmail, txtPdfEmail, txthtmlemail, ]
    }
    
    public-read def hyperlink: javafx.scene.control.Hyperlink = javafx.scene.control.Hyperlink {
        visible: false
        text: "http://www.javafx.com"
    }
    
    def __layoutInfo_lblPOPDFpath: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblPOPDFpath: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutInfo: __layoutInfo_lblPOPDFpath
        text: "Label"
    }
    
    public-read def label10: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def panelMsgPdf: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        blocksMouse: true
        content: [ hyperlink, lblPOPDFpath, label10, ]
    }
    
    public-read def lnkViewPOHTML: javafx.scene.control.Hyperlink = javafx.scene.control.Hyperlink {
        visible: false
        text: "http://www.javafx.com"
    }
    
    public-read def label12: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_lblPOHTMLpath: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblPOHTMLpath: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutInfo: __layoutInfo_lblPOHTMLpath
        text: "Label"
    }
    
    public-read def panelMsgHTML: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        blocksMouse: true
        content: [ lnkViewPOHTML, label12, lblPOHTMLpath, ]
    }
    
    def __layoutInfo_txtEmailMsg: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtEmailMsg: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtEmailMsg
    }
    
    def __layoutInfo_btnEmailText: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnEmailText: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 350.0
        layoutY: 201.0
        layoutInfo: __layoutInfo_btnEmailText
        text: "Button"
        action: btnEmailTextAction
    }
    
    public-read def panelPOEmail: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        blocksMouse: true
        content: [ panelEmail, panelMsgPdf, panelMsgHTML, txtEmailMsg, btnEmailText, ]
    }
    
    def __layoutInfo_btnPOLater: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnPOLater: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 123.0
        layoutY: 232.0
        layoutInfo: __layoutInfo_btnPOLater
        text: "Button"
    }
    
    def __layoutInfo_btnPONow: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnPONow: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 341.0
        layoutY: 232.0
        layoutInfo: __layoutInfo_btnPONow
        text: "Button"
    }
    
    def __layoutInfo_btnPOCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnPOCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 447.0
        layoutY: 238.0
        layoutInfo: __layoutInfo_btnPOCancel
        text: "Button"
    }
    
    public-read def rdoPOPerson: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: 435.0
        layoutY: 76.0
        text: "Radio Button"
    }
    
    def __layoutInfo_btnPOMode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnPOMode: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 193.0
        layoutY: 226.0
        layoutInfo: __layoutInfo_btnPOMode
        text: "Button"
        action: btnPOModeAction
    }
    
    def __layoutInfo_txtSMS: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtSMS: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtSMS
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 11.0
        layoutY: 111.0
        text: "Label"
    }
    
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 11.0
        layoutY: 146.0
        text: "Label"
    }
    
    def __layoutInfo_txtPOSMSMob: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtPOSMSMob: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 70.0
        layoutY: 139.0
        layoutInfo: __layoutInfo_txtPOSMSMob
    }
    
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 18.0
        layoutY: 174.0
        text: "Label"
    }
    
    def __layoutInfo_btnSmsSend: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnSmsSend: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 324.0
        layoutY: 174.0
        layoutInfo: __layoutInfo_btnSmsSend
        text: "Button"
        action: btnSmsSendAction
    }
    
    def __layoutInfo_txtDistNameSMS: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtDistNameSMS: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 120.0
        layoutY: 141.0
        layoutInfo: __layoutInfo_txtDistNameSMS
    }
    
    def __layoutInfo_txtDistcodeSMS: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtDistcodeSMS: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 120.0
        layoutY: 110.0
        layoutInfo: __layoutInfo_txtDistcodeSMS
    }
    
    public-read def panelPOSMS: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: 80.0
        layoutY: 89.0
        content: [ txtSMS, label4, label5, txtPOSMSMob, label7, btnSmsSend, txtDistNameSMS, txtDistcodeSMS, ]
    }
    
    public-read def rdoPOEmailText: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: 94.0
        layoutY: 51.0
        onMouseClicked: rdoPOEmailTextOnMouseClicked
        text: "Radio Button"
    }
    
    public-read def rdoPOEmailPDF: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: 206.0
        layoutY: 51.0
        onMouseClicked: rdoPOEmailPDFOnMouseClicked
        text: "Radio Button"
    }
    
    public-read def rdoPOEmailHTML: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: 346.0
        layoutY: 51.0
        onMouseClicked: rdoPOEmailHTMLOnMouseClicked
        text: "Radio Button"
    }
    
    def __layoutInfo_purLabel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def purLabel: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 431.0
        layoutY: 66.0
        layoutInfo: __layoutInfo_purLabel
        text: "Label"
    }
    
    public-read def rdoPOEmail: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: 155.0
        layoutY: 84.0
        text: "Radio Button"
    }
    
    public-read def rdoPOSms: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: 288.0
        layoutY: 76.0
        text: "Radio Button"
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: 150.0
        layoutY: 70.0
        blocksMouse: true
        focusTraversable: true
    }
    
    public-read def Violet: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.011764706
        green: 0.5019608
        blue: 0.7607843
    }
    
    public-read def linearGradient: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#ffffff") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#e2eef4") }, ]
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
    
    def __layoutInfo_btnBack: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 100.0
        height: 30.0
    }
    public-read def btnBack: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: 150.0
        layoutY: 260.0
        layoutInfo: __layoutInfo_btnBack
        text: "Back"
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
    
    def __layoutInfo_label: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 530.0
        height: 26.0
    }
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 40.0
        layoutY: 74.0
        layoutInfo: __layoutInfo_label
        text: "Label"
        font: Arial_18
        textFill: javafx.scene.paint.Color.WHITE
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
    
    def __layoutInfo_lblMsg: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 534.0
        height: 144.0
    }
    public-read def lblMsg: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 28.0
        layoutY: 74.0
        layoutInfo: __layoutInfo_lblMsg
        text: "Information..."
        font: Arial_14
        textFill: DarkGray
    }
    
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        opacity: 1.0
        layoutX: 1.0
        layoutY: 1.0
        styleClass: "BottomTaskBar"
        blocksMouse: true
        fill: DarkGray
        width: 100.0
        height: 26.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def rectBg: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 1.0
        layoutX: 28.0
        layoutY: 28.0
        styleClass: "form-background"
        blocksMouse: true
        fill: linearGradient
        stroke: DarkGray
        strokeWidth: 3.0
        width: 500.0
        height: 200.0
        arcWidth: 10.0
        arcHeight: 10.0
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.4
    }
    
    public-read def dropShadowEffect: javafx.scene.effect.DropShadow = javafx.scene.effect.DropShadow {
    }
    
    public-read def lightingEffect: javafx.scene.effect.Lighting = javafx.scene.effect.Lighting {
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
    }
    
    public-read def color2: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.6
    }
    
    public-read def Violet1: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.047058824
        green: 0.32941177
        blue: 0.4745098
    }
    
    public-read def linearGradient2: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        startX: 0.0
        startY: 0.0
        endX: 0.0
        endY: 1.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#FFFFFF") }, javafx.scene.paint.Stop { offset: 0.5, color: javafx.scene.paint.Color.web ("#000000") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#FFFFFF") }, ]
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/MailSend.png"
    }
    
    public-read def imageView2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: true
        layoutX: 8.0
        layoutY: 4.0
        image: image
        fitWidth: 20.0
        fitHeight: 20.0
    }
    
    public-read def image2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Frmclose.png"
    }
    
    public-read def image3: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Close.png"
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: true
        layoutX: 575.0
        layoutY: 0.0
        onMouseClicked: imageViewOnMouseClicked
        image: image3
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        blocksMouse: true
        content: [ rectBg, rectangle, panelPOEmail, lblMsg, btnPOLater, btnPONow, btnBack, label, btnPOCancel, imageView2, rdoPOPerson, btnPOMode, panelPOSMS, rdoPOEmailText, rdoPOEmailPDF, rdoPOEmailHTML, purLabel, rdoPOEmail, rdoPOSms, panelAlert, imageView, ]
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "PurchaseOrder", "POMode", "POModeSMS", "POModeEmailText", "POModeEmailPDF", "POModeEmailHTML", ]
        actual: 1
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectBg.visible = true;
                            rectBg.layoutX = 0.0;
                            rectBg.layoutY = 0.0;
                            rectBg.blocksMouse = true;
                            rectBg.strokeWidth = 3.0;
                            rectBg.width = 600.0;
                            rectBg.height = 300.0;
                            rectangle.visible = true;
                            rectangle.width = 598.0;
                            label2.visible = false;
                            label2.layoutX = 79.0;
                            label2.layoutY = 174.0;
                            label2.text = "Label";
                            label3.visible = false;
                            label3.layoutX = 79.0;
                            label3.layoutY = 209.0;
                            label3.text = "Label";
                            txtDistCodeText.visible = false;
                            txtDistCodeText.disable = false;
                            txtDistCodeText.layoutX = 168.0;
                            txtDistCodeText.layoutY = 236.0;
                            txtDistCodeText.editable = true;
                            label8.visible = false;
                            label8.layoutY = 209.0;
                            label8.text = "Label";
                            btnEmailHTML.visible = false;
                            btnEmailHTML.layoutX = 0.0;
                            btnEmailHTML.layoutY = 0.0;
                            btnEmailHTML.text = "Button";
                            btnEmailPDF.visible = false;
                            btnEmailPDF.layoutX = 416.0;
                            btnEmailPDF.layoutY = 300.0;
                            btnEmailPDF.text = "Button";
                            txtDistNameText.visible = false;
                            txtDistNameText.layoutX = 175.0;
                            txtDistNameText.layoutY = 275.0;
                            txtDistNameText.editable = true;
                            txtPdfDistCode.visible = false;
                            txtPdfDistCode.layoutX = 175.0;
                            txtPdfDistCode.layoutY = 247.0;
                            txtPdfDistCode.editable = true;
                            txtPdfDistName.visible = false;
                            txtPdfDistName.layoutX = 175.0;
                            txtPdfDistName.layoutY = 275.0;
                            txtPdfDistName.editable = true;
                            txtHtmlDistcode.visible = false;
                            txtHtmlDistcode.layoutX = 182.0;
                            txtHtmlDistcode.layoutY = 247.0;
                            txtHtmlDistcode.editable = true;
                            txtHtmlDistName.visible = false;
                            txtHtmlDistName.layoutX = 315.0;
                            txtHtmlDistName.layoutY = 215.0;
                            txtHtmlDistName.editable = true;
                            label6.visible = false;
                            label6.layoutX = 55.0;
                            label6.layoutY = 304.0;
                            label6.text = "Label";
                            Password.visible = false;
                            Password.layoutX = 55.0;
                            Password.layoutY = 302.0;
                            Password.text = "Label";
                            txtEmailtxtpwd.visible = false;
                            txtEmailtxtpwd.layoutX = 168.0;
                            txtEmailtxtpwd.layoutY = 310.0;
                            txtEmailPdfPwd.visible = false;
                            txtEmailPdfPwd.layoutX = 168.0;
                            txtEmailPdfPwd.layoutY = 304.0;
                            label9.visible = false;
                            label9.layoutX = 83.0;
                            label9.layoutY = 302.0;
                            label9.text = "Label";
                            label9.textFill = javafx.scene.paint.Color.BLACK;
                            txtEmailhtmlpwd.visible = false;
                            txtEmailhtmlpwd.layoutX = 181.0;
                            txtEmailhtmlpwd.layoutY = 302.0;
                            txtEmail.visible = false;
                            txtEmail.layoutX = 173.0;
                            txtEmail.layoutY = 283.0;
                            txtPdfEmail.visible = false;
                            txtPdfEmail.layoutX = 175.0;
                            txtPdfEmail.layoutY = 275.0;
                            txthtmlemail.visible = false;
                            txthtmlemail.layoutX = 175.0;
                            txthtmlemail.layoutY = 269.0;
                            panelEmail.visible = false;
                            hyperlink.visible = false;
                            hyperlink.layoutX = 0.0;
                            hyperlink.layoutY = 0.0;
                            hyperlink.text = "http://www.javafx.com";
                            lblPOPDFpath.visible = false;
                            lblPOPDFpath.layoutX = 0.0;
                            lblPOPDFpath.layoutY = 0.0;
                            lblPOPDFpath.styleClass = "label";
                            label10.visible = false;
                            label10.layoutX = 0.0;
                            label10.layoutY = 0.0;
                            label10.text = "Label";
                            panelMsgPdf.visible = false;
                            lnkViewPOHTML.visible = false;
                            lnkViewPOHTML.layoutX = 0.0;
                            lnkViewPOHTML.layoutY = 0.0;
                            lnkViewPOHTML.text = "http://www.javafx.com";
                            label12.visible = false;
                            label12.layoutX = 0.0;
                            label12.layoutY = 0.0;
                            label12.text = "Label";
                            lblPOHTMLpath.visible = false;
                            lblPOHTMLpath.layoutX = 0.0;
                            lblPOHTMLpath.layoutY = 0.0;
                            panelMsgHTML.visible = false;
                            txtEmailMsg.visible = false;
                            txtEmailMsg.layoutX = 0.0;
                            txtEmailMsg.layoutY = 0.0;
                            btnEmailText.visible = false;
                            btnEmailText.layoutX = 350.0;
                            btnEmailText.layoutY = 201.0;
                            btnEmailText.text = "Button";
                            panelPOEmail.visible = false;
                            panelPOEmail.layoutX = 0.0;
                            panelPOEmail.layoutY = 0.0;
                            lblMsg.visible = true;
                            lblMsg.layoutY = 76.0;
                            btnPOLater.visible = true;
                            btnPOLater.layoutX = 100.0;
                            btnPOLater.layoutY = 244.0;
                            __layoutInfo_btnPOLater.width = 100.0;
                            __layoutInfo_btnPOLater.height = 30.0;
                            btnPOLater.effect = reflectionEffect;
                            btnPOLater.text = "Send Later";
                            btnPOLater.font = Arial_Bold_14;
                            btnPONow.visible = true;
                            btnPONow.layoutX = 225.0;
                            btnPONow.layoutY = 244.0;
                            __layoutInfo_btnPONow.width = 150.0;
                            __layoutInfo_btnPONow.height = 30.0;
                            btnPONow.effect = reflectionEffect;
                            btnPONow.text = "Send Now";
                            btnPONow.font = Arial_Bold_14;
                            btnBack.visible = true;
                            btnBack.layoutY = 260.0;
                            btnBack.font = Arial_Bold_14;
                            label.visible = true;
                            label.layoutY = 10.0;
                            label.text = "PurchaseOrder";
                            btnPOCancel.visible = true;
                            btnPOCancel.layoutX = 400.0;
                            btnPOCancel.layoutY = 244.0;
                            __layoutInfo_btnPOCancel.width = 100.0;
                            __layoutInfo_btnPOCancel.height = 30.0;
                            btnPOCancel.effect = reflectionEffect;
                            btnPOCancel.text = "Cancel";
                            btnPOCancel.font = Arial_Bold_14;
                            imageView2.image = image;
                            rdoPOPerson.visible = false;
                            rdoPOPerson.layoutX = 435.0;
                            rdoPOPerson.layoutY = 76.0;
                            rdoPOPerson.text = "Radio Button";
                            rdoPOPerson.toggleGroup = null;
                            btnPOMode.visible = false;
                            btnPOMode.layoutX = 193.0;
                            btnPOMode.layoutY = 226.0;
                            btnPOMode.text = "Button";
                            txtSMS.visible = false;
                            txtSMS.lines = 5.0;
                            label4.visible = false;
                            label4.layoutX = 11.0;
                            label4.layoutY = 111.0;
                            label4.text = "Label";
                            label5.visible = false;
                            label5.layoutX = 11.0;
                            label5.layoutY = 146.0;
                            label5.text = "Label";
                            txtPOSMSMob.visible = false;
                            txtPOSMSMob.layoutX = 70.0;
                            txtPOSMSMob.layoutY = 139.0;
                            label7.visible = false;
                            label7.layoutX = 18.0;
                            label7.layoutY = 174.0;
                            label7.text = "Label";
                            btnSmsSend.visible = false;
                            btnSmsSend.layoutX = 324.0;
                            btnSmsSend.layoutY = 174.0;
                            btnSmsSend.styleClass = "button";
                            btnSmsSend.text = "Button";
                            txtDistNameSMS.visible = false;
                            txtDistNameSMS.disable = false;
                            txtDistNameSMS.layoutY = 141.0;
                            txtDistNameSMS.editable = true;
                            txtDistcodeSMS.visible = false;
                            txtDistcodeSMS.disable = false;
                            txtDistcodeSMS.editable = true;
                            panelPOSMS.visible = false;
                            panelPOSMS.layoutX = 80.0;
                            panelPOSMS.layoutY = 89.0;
                            panelPOSMS.blocksMouse = false;
                            rdoPOEmailText.visible = false;
                            rdoPOEmailText.layoutY = 51.0;
                            rdoPOEmailText.text = "Radio Button";
                            rdoPOEmailText.toggleGroup = null;
                            rdoPOEmailText.selected = false;
                            rdoPOEmailPDF.visible = false;
                            rdoPOEmailPDF.layoutX = 206.0;
                            rdoPOEmailPDF.layoutY = 51.0;
                            rdoPOEmailPDF.text = "Radio Button";
                            rdoPOEmailPDF.toggleGroup = null;
                            rdoPOEmailPDF.selected = false;
                            rdoPOEmailHTML.visible = false;
                            rdoPOEmailHTML.layoutY = 51.0;
                            rdoPOEmailHTML.text = "Radio Button";
                            rdoPOEmailHTML.toggleGroup = null;
                            rdoPOEmailHTML.selected = false;
                            purLabel.visible = false;
                            rdoPOEmail.visible = false;
                            rdoPOEmail.layoutX = 155.0;
                            rdoPOEmail.layoutY = 84.0;
                            rdoPOEmail.text = "Radio Button";
                            rdoPOEmail.toggleGroup = null;
                            rdoPOSms.visible = false;
                            rdoPOSms.layoutX = 288.0;
                            rdoPOSms.layoutY = 76.0;
                            rdoPOSms.text = "Radio Button";
                            rdoPOSms.toggleGroup = null;
                            panelAlert.blocksMouse = false;
                            imageView.visible = true;
                            panel.visible = false;
                        }
                    }
                ]
            }
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectBg.visible = true;
                            rectBg.layoutX = 0.0;
                            rectBg.layoutY = 0.0;
                            rectBg.blocksMouse = true;
                            rectBg.strokeWidth = 3.0;
                            rectBg.width = 600.0;
                            rectBg.height = 300.0;
                            rectangle.visible = true;
                            rectangle.width = 598.0;
                            label2.visible = true;
                            label2.layoutX = 0.0;
                            label2.layoutY = 152.0;
                            label2.text = "Distributor Name";
                            label2.font = Arial_12;
                            label3.visible = true;
                            label3.layoutX = 0.0;
                            label3.layoutY = 180.0;
                            label3.text = "Email id";
                            label3.font = Arial_12;
                            txtDistCodeText.visible = false;
                            txtDistCodeText.disable = false;
                            txtDistCodeText.layoutX = 168.0;
                            txtDistCodeText.layoutY = 236.0;
                            txtDistCodeText.editable = true;
                            label8.visible = false;
                            label8.layoutY = 209.0;
                            label8.text = "Label";
                            btnEmailHTML.visible = false;
                            btnEmailHTML.layoutX = 0.0;
                            btnEmailHTML.layoutY = 0.0;
                            btnEmailHTML.text = "Button";
                            btnEmailPDF.visible = false;
                            btnEmailPDF.layoutX = 416.0;
                            btnEmailPDF.layoutY = 300.0;
                            btnEmailPDF.text = "Button";
                            txtDistNameText.visible = false;
                            txtDistNameText.layoutX = 175.0;
                            txtDistNameText.layoutY = 275.0;
                            txtDistNameText.editable = true;
                            txtPdfDistCode.visible = false;
                            txtPdfDistCode.layoutX = 175.0;
                            txtPdfDistCode.layoutY = 247.0;
                            txtPdfDistCode.editable = true;
                            txtPdfDistName.visible = false;
                            txtPdfDistName.layoutX = 175.0;
                            txtPdfDistName.layoutY = 275.0;
                            txtPdfDistName.editable = true;
                            txtHtmlDistcode.visible = false;
                            txtHtmlDistcode.layoutX = 182.0;
                            txtHtmlDistcode.layoutY = 247.0;
                            txtHtmlDistcode.editable = true;
                            txtHtmlDistName.visible = false;
                            txtHtmlDistName.layoutX = 315.0;
                            txtHtmlDistName.layoutY = 215.0;
                            txtHtmlDistName.editable = true;
                            label6.visible = false;
                            label6.layoutX = 55.0;
                            label6.layoutY = 304.0;
                            label6.text = "Label";
                            Password.visible = false;
                            Password.layoutX = 55.0;
                            Password.layoutY = 302.0;
                            Password.text = "Label";
                            txtEmailtxtpwd.visible = false;
                            txtEmailtxtpwd.layoutX = 168.0;
                            txtEmailtxtpwd.layoutY = 310.0;
                            txtEmailPdfPwd.visible = false;
                            txtEmailPdfPwd.layoutX = 168.0;
                            txtEmailPdfPwd.layoutY = 304.0;
                            label9.visible = false;
                            label9.layoutX = 83.0;
                            label9.layoutY = 302.0;
                            label9.text = "Label";
                            label9.textFill = javafx.scene.paint.Color.BLACK;
                            txtEmailhtmlpwd.visible = false;
                            txtEmailhtmlpwd.layoutX = 181.0;
                            txtEmailhtmlpwd.layoutY = 302.0;
                            txtEmail.visible = false;
                            txtEmail.layoutX = 173.0;
                            txtEmail.layoutY = 283.0;
                            txtPdfEmail.visible = false;
                            txtPdfEmail.layoutX = 175.0;
                            txtPdfEmail.layoutY = 275.0;
                            txthtmlemail.visible = false;
                            txthtmlemail.layoutX = 175.0;
                            txthtmlemail.layoutY = 269.0;
                            panelEmail.visible = false;
                            hyperlink.visible = false;
                            hyperlink.layoutX = 0.0;
                            hyperlink.layoutY = 0.0;
                            hyperlink.text = "http://www.javafx.com";
                            lblPOPDFpath.visible = false;
                            lblPOPDFpath.layoutX = 0.0;
                            lblPOPDFpath.layoutY = 0.0;
                            lblPOPDFpath.styleClass = "label";
                            label10.visible = false;
                            label10.layoutX = 0.0;
                            label10.layoutY = 0.0;
                            label10.text = "Label";
                            panelMsgPdf.visible = false;
                            lnkViewPOHTML.visible = false;
                            lnkViewPOHTML.layoutX = 0.0;
                            lnkViewPOHTML.layoutY = 0.0;
                            lnkViewPOHTML.text = "http://www.javafx.com";
                            label12.visible = false;
                            label12.layoutX = 0.0;
                            label12.layoutY = 0.0;
                            label12.text = "Label";
                            lblPOHTMLpath.visible = false;
                            lblPOHTMLpath.layoutX = 0.0;
                            lblPOHTMLpath.layoutY = 0.0;
                            panelMsgHTML.visible = false;
                            txtEmailMsg.visible = true;
                            txtEmailMsg.layoutX = 0.0;
                            txtEmailMsg.layoutY = 0.0;
                            __layoutInfo_txtEmailMsg.width = 488.0;
                            __layoutInfo_txtEmailMsg.height = 141.0;
                            btnEmailText.visible = false;
                            btnEmailText.layoutX = 350.0;
                            btnEmailText.layoutY = 201.0;
                            btnEmailText.text = "Button";
                            panelPOEmail.visible = false;
                            panelPOEmail.layoutX = 50.0;
                            panelPOEmail.layoutY = 400.0;
                            lblMsg.visible = false;
                            lblMsg.layoutY = 76.0;
                            btnPOLater.visible = false;
                            btnPOLater.layoutX = 100.0;
                            btnPOLater.layoutY = 244.0;
                            __layoutInfo_btnPOLater.width = 100.0;
                            __layoutInfo_btnPOLater.height = 30.0;
                            btnPOLater.effect = reflectionEffect;
                            btnPOLater.text = "Send Later";
                            btnPOLater.font = Arial_Bold_14;
                            btnPONow.visible = false;
                            btnPONow.layoutX = 225.0;
                            btnPONow.layoutY = 244.0;
                            __layoutInfo_btnPONow.width = 150.0;
                            __layoutInfo_btnPONow.height = 30.0;
                            btnPONow.effect = reflectionEffect;
                            btnPONow.text = "Send Now";
                            btnPONow.font = Arial_Bold_14;
                            btnBack.visible = false;
                            btnBack.layoutY = 260.0;
                            btnBack.font = Arial_Bold_14;
                            label.visible = true;
                            label.layoutY = 0.0;
                            label.text = "Purchase Order Sending... Step 1";
                            btnPOCancel.visible = false;
                            btnPOCancel.layoutX = 400.0;
                            btnPOCancel.layoutY = 244.0;
                            __layoutInfo_btnPOCancel.width = 100.0;
                            __layoutInfo_btnPOCancel.height = 30.0;
                            btnPOCancel.effect = reflectionEffect;
                            btnPOCancel.text = "Cancel";
                            btnPOCancel.font = Arial_Bold_14;
                            imageView2.image = image;
                            rdoPOPerson.visible = false;
                            rdoPOPerson.layoutX = 220.0;
                            rdoPOPerson.layoutY = 192.0;
                            rdoPOPerson.text = "Order Via In Person";
                            rdoPOPerson.font = Arial_14;
                            rdoPOPerson.toggleGroup = toggleGroup;
                            btnPOMode.visible = true;
                            btnPOMode.layoutX = 215.0;
                            btnPOMode.layoutY = 250.0;
                            __layoutInfo_btnPOMode.width = 150.0;
                            __layoutInfo_btnPOMode.height = 30.0;
                            btnPOMode.effect = reflectionEffect;
                            btnPOMode.text = "Proceed >>";
                            btnPOMode.font = Arial_Bold_14;
                            txtSMS.visible = false;
                            txtSMS.lines = 5.0;
                            label4.visible = false;
                            label4.layoutX = 11.0;
                            label4.layoutY = 111.0;
                            label4.text = "Label";
                            label5.visible = false;
                            label5.layoutX = 11.0;
                            label5.layoutY = 146.0;
                            label5.text = "Label";
                            txtPOSMSMob.visible = false;
                            txtPOSMSMob.layoutX = 70.0;
                            txtPOSMSMob.layoutY = 139.0;
                            txtPOSMSMob.font = null;
                            label7.visible = false;
                            label7.layoutX = 18.0;
                            label7.layoutY = 174.0;
                            label7.text = "Label";
                            btnSmsSend.visible = false;
                            btnSmsSend.layoutX = 324.0;
                            btnSmsSend.layoutY = 174.0;
                            btnSmsSend.styleClass = "button";
                            btnSmsSend.text = "Button";
                            txtDistNameSMS.visible = false;
                            txtDistNameSMS.disable = false;
                            txtDistNameSMS.layoutY = 141.0;
                            txtDistNameSMS.editable = true;
                            txtDistcodeSMS.visible = false;
                            txtDistcodeSMS.disable = false;
                            txtDistcodeSMS.editable = true;
                            panelPOSMS.visible = false;
                            panelPOSMS.layoutX = 80.0;
                            panelPOSMS.layoutY = 89.0;
                            panelPOSMS.blocksMouse = false;
                            rdoPOEmailText.visible = false;
                            rdoPOEmailText.layoutY = 51.0;
                            rdoPOEmailText.text = "Radio Button";
                            rdoPOEmailText.toggleGroup = null;
                            rdoPOEmailText.selected = false;
                            rdoPOEmailPDF.visible = false;
                            rdoPOEmailPDF.layoutX = 206.0;
                            rdoPOEmailPDF.layoutY = 51.0;
                            rdoPOEmailPDF.text = "Radio Button";
                            rdoPOEmailPDF.toggleGroup = null;
                            rdoPOEmailPDF.selected = false;
                            rdoPOEmailHTML.visible = false;
                            rdoPOEmailHTML.layoutY = 51.0;
                            rdoPOEmailHTML.text = "Radio Button";
                            rdoPOEmailHTML.toggleGroup = null;
                            rdoPOEmailHTML.selected = false;
                            purLabel.visible = false;
                            __layoutInfo_purLabel.width = 131.0;
                            rdoPOEmail.visible = true;
                            rdoPOEmail.layoutX = 220.0;
                            rdoPOEmail.layoutY = 170.0;
                            rdoPOEmail.text = "Order Via Email";
                            rdoPOEmail.font = Arial_14;
                            rdoPOEmail.toggleGroup = toggleGroup;
                            rdoPOSms.visible = true;
                            rdoPOSms.layoutX = 220.0;
                            rdoPOSms.layoutY = 120.0;
                            rdoPOSms.text = "Order Via  SMS";
                            rdoPOSms.font = Arial_14;
                            rdoPOSms.toggleGroup = toggleGroup;
                            panelAlert.blocksMouse = false;
                            imageView.visible = true;
                            panel.visible = true;
                        }
                    }
                ]
            }
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectBg.visible = true;
                            rectBg.layoutX = 0.0;
                            rectBg.layoutY = 0.0;
                            rectBg.blocksMouse = true;
                            rectBg.strokeWidth = 3.0;
                            rectBg.width = 600.0;
                            rectBg.height = 300.0;
                            rectangle.visible = true;
                            rectangle.width = 598.0;
                            label2.visible = true;
                            label2.layoutX = 0.0;
                            label2.layoutY = 152.0;
                            label2.text = "Distributor Name";
                            label2.font = Arial_12;
                            label3.visible = true;
                            label3.layoutX = 0.0;
                            label3.layoutY = 180.0;
                            label3.text = "Email id";
                            label3.font = Arial_12;
                            txtDistCodeText.visible = false;
                            txtDistCodeText.disable = false;
                            txtDistCodeText.layoutX = 168.0;
                            txtDistCodeText.layoutY = 236.0;
                            txtDistCodeText.editable = true;
                            label8.visible = false;
                            label8.layoutY = 209.0;
                            label8.text = "Label";
                            btnEmailHTML.visible = false;
                            btnEmailHTML.layoutX = 0.0;
                            btnEmailHTML.layoutY = 0.0;
                            btnEmailHTML.text = "Button";
                            btnEmailPDF.visible = false;
                            btnEmailPDF.layoutX = 416.0;
                            btnEmailPDF.layoutY = 300.0;
                            btnEmailPDF.text = "Button";
                            txtDistNameText.visible = false;
                            txtDistNameText.layoutX = 175.0;
                            txtDistNameText.layoutY = 275.0;
                            txtDistNameText.editable = true;
                            txtPdfDistCode.visible = false;
                            txtPdfDistCode.layoutX = 175.0;
                            txtPdfDistCode.layoutY = 247.0;
                            txtPdfDistCode.editable = true;
                            txtPdfDistName.visible = false;
                            txtPdfDistName.layoutX = 175.0;
                            txtPdfDistName.layoutY = 275.0;
                            txtPdfDistName.editable = true;
                            txtHtmlDistcode.visible = false;
                            txtHtmlDistcode.layoutX = 182.0;
                            txtHtmlDistcode.layoutY = 247.0;
                            txtHtmlDistcode.editable = true;
                            txtHtmlDistName.visible = false;
                            txtHtmlDistName.layoutX = 315.0;
                            txtHtmlDistName.layoutY = 215.0;
                            txtHtmlDistName.editable = true;
                            label6.visible = false;
                            label6.layoutX = 55.0;
                            label6.layoutY = 304.0;
                            label6.text = "Label";
                            Password.visible = false;
                            Password.layoutX = 55.0;
                            Password.layoutY = 302.0;
                            Password.text = "Label";
                            txtEmailtxtpwd.visible = false;
                            txtEmailtxtpwd.layoutX = 168.0;
                            txtEmailtxtpwd.layoutY = 310.0;
                            txtEmailtxtpwd.font = null;
                            txtEmailPdfPwd.visible = false;
                            txtEmailPdfPwd.layoutX = 168.0;
                            txtEmailPdfPwd.layoutY = 304.0;
                            label9.visible = false;
                            label9.layoutX = 83.0;
                            label9.layoutY = 302.0;
                            label9.text = "Label";
                            label9.textFill = javafx.scene.paint.Color.BLACK;
                            txtEmailhtmlpwd.visible = false;
                            txtEmailhtmlpwd.layoutX = 181.0;
                            txtEmailhtmlpwd.layoutY = 302.0;
                            txtEmail.visible = false;
                            txtEmail.layoutX = 173.0;
                            txtEmail.layoutY = 283.0;
                            txtPdfEmail.visible = false;
                            txtPdfEmail.layoutX = 175.0;
                            txtPdfEmail.layoutY = 275.0;
                            txthtmlemail.visible = false;
                            txthtmlemail.layoutX = 175.0;
                            txthtmlemail.layoutY = 269.0;
                            panelEmail.visible = false;
                            hyperlink.visible = false;
                            hyperlink.layoutX = 0.0;
                            hyperlink.layoutY = 0.0;
                            hyperlink.text = "http://www.javafx.com";
                            lblPOPDFpath.visible = false;
                            lblPOPDFpath.layoutX = 0.0;
                            lblPOPDFpath.layoutY = 0.0;
                            lblPOPDFpath.styleClass = "label";
                            label10.visible = false;
                            label10.layoutX = 0.0;
                            label10.layoutY = 0.0;
                            label10.text = "Label";
                            panelMsgPdf.visible = false;
                            lnkViewPOHTML.visible = false;
                            lnkViewPOHTML.layoutX = 0.0;
                            lnkViewPOHTML.layoutY = 0.0;
                            lnkViewPOHTML.text = "http://www.javafx.com";
                            label12.visible = false;
                            label12.layoutX = 0.0;
                            label12.layoutY = 0.0;
                            label12.text = "Label";
                            lblPOHTMLpath.visible = false;
                            lblPOHTMLpath.layoutX = 0.0;
                            lblPOHTMLpath.layoutY = 0.0;
                            panelMsgHTML.visible = false;
                            txtEmailMsg.visible = true;
                            txtEmailMsg.layoutX = 0.0;
                            txtEmailMsg.layoutY = 0.0;
                            __layoutInfo_txtEmailMsg.width = 488.0;
                            __layoutInfo_txtEmailMsg.height = 141.0;
                            btnEmailText.visible = false;
                            btnEmailText.layoutX = 350.0;
                            btnEmailText.layoutY = 201.0;
                            btnEmailText.text = "Button";
                            panelPOEmail.visible = false;
                            panelPOEmail.layoutX = 50.0;
                            panelPOEmail.layoutY = 400.0;
                            lblMsg.visible = false;
                            lblMsg.layoutY = 76.0;
                            btnPOLater.visible = false;
                            btnPOLater.layoutX = 100.0;
                            btnPOLater.layoutY = 244.0;
                            __layoutInfo_btnPOLater.width = 100.0;
                            __layoutInfo_btnPOLater.height = 30.0;
                            btnPOLater.effect = reflectionEffect;
                            btnPOLater.text = "Send Later";
                            btnPOLater.font = Arial_Bold_14;
                            btnPONow.visible = false;
                            btnPONow.layoutX = 225.0;
                            btnPONow.layoutY = 244.0;
                            __layoutInfo_btnPONow.width = 150.0;
                            __layoutInfo_btnPONow.height = 30.0;
                            btnPONow.effect = reflectionEffect;
                            btnPONow.text = "Send Now";
                            btnPONow.font = Arial_Bold_14;
                            btnBack.visible = true;
                            btnBack.layoutY = 260.0;
                            btnBack.font = Arial_Bold_14;
                            btnBack.action = btnBackActionAtPOModeSMS;
                            label.visible = true;
                            label.layoutY = 0.0;
                            label.text = "Purchase Order Sending... Step 2 [ SMS ]";
                            btnPOCancel.visible = false;
                            btnPOCancel.layoutX = 400.0;
                            btnPOCancel.layoutY = 244.0;
                            __layoutInfo_btnPOCancel.width = 100.0;
                            __layoutInfo_btnPOCancel.height = 30.0;
                            btnPOCancel.effect = reflectionEffect;
                            btnPOCancel.text = "Cancel";
                            btnPOCancel.font = Arial_Bold_14;
                            imageView2.image = image;
                            rdoPOPerson.visible = false;
                            rdoPOPerson.layoutX = 220.0;
                            rdoPOPerson.layoutY = 192.0;
                            rdoPOPerson.text = "Order Via In Person";
                            rdoPOPerson.font = Arial_14;
                            rdoPOPerson.toggleGroup = null;
                            btnPOMode.visible = false;
                            btnPOMode.layoutX = 225.0;
                            btnPOMode.layoutY = 244.0;
                            __layoutInfo_btnPOMode.width = 150.0;
                            __layoutInfo_btnPOMode.height = 30.0;
                            btnPOMode.effect = reflectionEffect;
                            btnPOMode.text = "Proceed >>";
                            btnPOMode.font = Arial_Bold_14;
                            txtSMS.visible = true;
                            __layoutInfo_txtSMS.width = 452.0;
                            __layoutInfo_txtSMS.height = 94.0;
                            txtSMS.font = Arial_14;
                            txtSMS.lines = 20.0;
                            label4.visible = true;
                            label4.layoutX = 0.0;
                            label4.layoutY = 110.0;
                            label4.text = "Distributor Code";
                            label4.font = Arial_12;
                            label5.visible = true;
                            label5.layoutX = 0.0;
                            label5.layoutY = 138.0;
                            label5.text = "Distributor Name";
                            label5.font = Arial_12;
                            txtPOSMSMob.visible = true;
                            txtPOSMSMob.layoutX = 120.0;
                            txtPOSMSMob.layoutY = 166.0;
                            __layoutInfo_txtPOSMSMob.width = 160.0;
                            txtPOSMSMob.onKeyPressed = txtPOSMSMobOnKeyPressedAtPOModeSMS;
                            txtPOSMSMob.font = Arial_12;
                            label7.visible = true;
                            label7.layoutX = 0.0;
                            label7.layoutY = 166.0;
                            label7.text = "Mobile Number";
                            label7.font = Arial_12;
                            btnSmsSend.visible = true;
                            btnSmsSend.layoutX = 205.0;
                            btnSmsSend.layoutY = 190.0;
                            __layoutInfo_btnSmsSend.width = 150.0;
                            __layoutInfo_btnSmsSend.height = 30.0;
                            btnSmsSend.styleClass = "button";
                            btnSmsSend.effect = reflectionEffect;
                            btnSmsSend.text = "Send  SMS >>";
                            btnSmsSend.font = Arial_Bold_14;
                            txtDistNameSMS.visible = true;
                            txtDistNameSMS.disable = true;
                            txtDistNameSMS.layoutY = 138.0;
                            __layoutInfo_txtDistNameSMS.width = 156.0;
                            txtDistNameSMS.editable = false;
                            txtDistNameSMS.font = Arial_12;
                            txtDistcodeSMS.visible = true;
                            txtDistcodeSMS.disable = true;
                            __layoutInfo_txtDistcodeSMS.width = 156.0;
                            txtDistcodeSMS.editable = false;
                            txtDistcodeSMS.font = Arial_12;
                            panelPOSMS.visible = true;
                            panelPOSMS.layoutX = 70.0;
                            panelPOSMS.layoutY = 70.0;
                            panelPOSMS.blocksMouse = true;
                            rdoPOEmailText.visible = false;
                            rdoPOEmailText.layoutY = 51.0;
                            rdoPOEmailText.text = "Radio Button";
                            rdoPOEmailText.toggleGroup = null;
                            rdoPOEmailText.selected = false;
                            rdoPOEmailPDF.visible = false;
                            rdoPOEmailPDF.layoutX = 206.0;
                            rdoPOEmailPDF.layoutY = 51.0;
                            rdoPOEmailPDF.text = "Radio Button";
                            rdoPOEmailPDF.toggleGroup = null;
                            rdoPOEmailPDF.selected = false;
                            rdoPOEmailHTML.visible = false;
                            rdoPOEmailHTML.layoutY = 51.0;
                            rdoPOEmailHTML.text = "Radio Button";
                            rdoPOEmailHTML.toggleGroup = null;
                            rdoPOEmailHTML.selected = false;
                            purLabel.visible = false;
                            rdoPOEmail.visible = false;
                            rdoPOEmail.layoutX = 220.0;
                            rdoPOEmail.layoutY = 142.0;
                            rdoPOEmail.text = "Order Via Email";
                            rdoPOEmail.font = Arial_14;
                            rdoPOEmail.toggleGroup = null;
                            rdoPOSms.visible = false;
                            rdoPOSms.layoutX = 220.0;
                            rdoPOSms.layoutY = 95.0;
                            rdoPOSms.text = "Order Via  SMS";
                            rdoPOSms.font = Arial_14;
                            rdoPOSms.toggleGroup = null;
                            panelAlert.blocksMouse = false;
                            imageView.visible = true;
                            panel.visible = true;
                        }
                    }
                ]
            }
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectBg.visible = true;
                            rectBg.layoutX = 0.0;
                            rectBg.layoutY = 0.0;
                            rectBg.blocksMouse = true;
                            rectBg.strokeWidth = 3.0;
                            rectBg.width = 600.0;
                            rectBg.height = 380.0;
                            rectangle.visible = true;
                            rectangle.width = 598.0;
                            label2.visible = true;
                            label2.layoutX = 0.0;
                            label2.layoutY = 135.0;
                            label2.text = "Distributor Code";
                            label2.font = Arial_12;
                            label3.visible = true;
                            label3.layoutX = 0.0;
                            label3.layoutY = 160.0;
                            label3.text = "Distributor Name";
                            label3.font = Arial_12;
                            txtDistCodeText.visible = true;
                            txtDistCodeText.disable = false;
                            txtDistCodeText.layoutX = 118.0;
                            txtDistCodeText.layoutY = 135.0;
                            __layoutInfo_txtDistCodeText.width = 195.0;
                            txtDistCodeText.editable = false;
                            txtDistCodeText.font = Arial_12;
                            label8.visible = true;
                            label8.layoutY = 188.0;
                            label8.text = "Email id";
                            label8.font = Arial_12;
                            btnEmailHTML.visible = false;
                            btnEmailHTML.layoutX = 0.0;
                            btnEmailHTML.layoutY = 0.0;
                            btnEmailHTML.text = "Button";
                            btnEmailHTML.font = null;
                            btnEmailPDF.visible = false;
                            btnEmailPDF.layoutX = 416.0;
                            btnEmailPDF.layoutY = 300.0;
                            btnEmailPDF.text = "Button";
                            txtDistNameText.visible = true;
                            txtDistNameText.layoutX = 120.0;
                            txtDistNameText.layoutY = 160.0;
                            __layoutInfo_txtDistNameText.width = 195.0;
                            txtDistNameText.editable = false;
                            txtDistNameText.font = Arial_12;
                            txtPdfDistCode.visible = false;
                            txtPdfDistCode.layoutX = 175.0;
                            txtPdfDistCode.layoutY = 247.0;
                            txtPdfDistCode.editable = true;
                            txtPdfDistName.visible = false;
                            txtPdfDistName.layoutX = 175.0;
                            txtPdfDistName.layoutY = 275.0;
                            txtPdfDistName.editable = true;
                            txtHtmlDistcode.visible = false;
                            txtHtmlDistcode.layoutX = 182.0;
                            txtHtmlDistcode.layoutY = 247.0;
                            txtHtmlDistcode.editable = true;
                            txtHtmlDistName.visible = false;
                            txtHtmlDistName.layoutX = 315.0;
                            txtHtmlDistName.layoutY = 215.0;
                            txtHtmlDistName.editable = true;
                            label6.visible = true;
                            label6.layoutX = 0.0;
                            label6.layoutY = 218.0;
                            label6.text = "Password";
                            label6.font = Arial_12;
                            Password.visible = false;
                            Password.layoutX = 55.0;
                            Password.layoutY = 302.0;
                            Password.text = "Label";
                            txtEmailtxtpwd.visible = true;
                            txtEmailtxtpwd.layoutX = 120.0;
                            txtEmailtxtpwd.layoutY = 215.0;
                            __layoutInfo_txtEmailtxtpwd.width = 195.0;
                            txtEmailtxtpwd.onKeyPressed = txtEmailtxtpwdOnKeyPressedAtPOModeEmailText;
                            txtEmailtxtpwd.font = Arial_12;
                            txtEmailPdfPwd.visible = false;
                            txtEmailPdfPwd.layoutX = 168.0;
                            txtEmailPdfPwd.layoutY = 304.0;
                            label9.visible = false;
                            label9.layoutX = 83.0;
                            label9.layoutY = 302.0;
                            label9.text = "Label";
                            label9.textFill = javafx.scene.paint.Color.BLACK;
                            txtEmailhtmlpwd.visible = false;
                            txtEmailhtmlpwd.layoutX = 181.0;
                            txtEmailhtmlpwd.layoutY = 302.0;
                            txtEmail.visible = true;
                            txtEmail.layoutX = 120.0;
                            txtEmail.layoutY = 188.0;
                            __layoutInfo_txtEmail.width = 195.0;
                            txtEmail.onKeyPressed = txtEmailOnKeyPressedAtPOModeEmailText;
                            txtEmail.font = Arial_12;
                            txtPdfEmail.visible = false;
                            txtPdfEmail.layoutX = 175.0;
                            txtPdfEmail.layoutY = 275.0;
                            txthtmlemail.visible = false;
                            txthtmlemail.layoutX = 175.0;
                            txthtmlemail.layoutY = 269.0;
                            panelEmail.visible = true;
                            hyperlink.visible = false;
                            hyperlink.layoutX = 0.0;
                            hyperlink.layoutY = 0.0;
                            hyperlink.text = "http://www.javafx.com";
                            lblPOPDFpath.visible = true;
                            lblPOPDFpath.layoutX = 80.0;
                            lblPOPDFpath.layoutY = 60.0;
                            __layoutInfo_lblPOPDFpath.width = 400.0;
                            __layoutInfo_lblPOPDFpath.height = 60.0;
                            lblPOPDFpath.styleClass = "path";
                            lblPOPDFpath.font = Arial_12;
                            lblPOPDFpath.vpos = javafx.geometry.VPos.CENTER;
                            label10.visible = true;
                            label10.layoutX = 10.0;
                            label10.layoutY = 80.0;
                            label10.text = "File Path:";
                            label10.font = Arial_12;
                            panelMsgPdf.visible = false;
                            lnkViewPOHTML.visible = false;
                            lnkViewPOHTML.layoutX = 0.0;
                            lnkViewPOHTML.layoutY = 0.0;
                            lnkViewPOHTML.text = "http://www.javafx.com";
                            label12.visible = false;
                            label12.layoutX = 0.0;
                            label12.layoutY = 0.0;
                            label12.text = "Label";
                            lblPOHTMLpath.visible = false;
                            lblPOHTMLpath.layoutX = 0.0;
                            lblPOHTMLpath.layoutY = 0.0;
                            panelMsgHTML.visible = false;
                            txtEmailMsg.visible = true;
                            txtEmailMsg.layoutX = 0.0;
                            txtEmailMsg.layoutY = 0.0;
                            __layoutInfo_txtEmailMsg.width = 488.0;
                            __layoutInfo_txtEmailMsg.height = 121.0;
                            txtEmailMsg.font = Arial_14;
                            btnEmailText.visible = true;
                            btnEmailText.layoutX = 220.0;
                            btnEmailText.layoutY = 245.0;
                            __layoutInfo_btnEmailText.width = 150.0;
                            __layoutInfo_btnEmailText.height = 30.0;
                            btnEmailText.effect = reflectionEffect;
                            btnEmailText.text = "Send Email >>";
                            btnEmailText.font = Arial_Bold_14;
                            panelPOEmail.visible = true;
                            panelPOEmail.layoutX = 55.0;
                            panelPOEmail.layoutY = 95.0;
                            lblMsg.visible = false;
                            lblMsg.layoutY = 76.0;
                            btnPOLater.visible = false;
                            btnPOLater.layoutX = 100.0;
                            btnPOLater.layoutY = 244.0;
                            __layoutInfo_btnPOLater.width = 100.0;
                            __layoutInfo_btnPOLater.height = 30.0;
                            btnPOLater.effect = reflectionEffect;
                            btnPOLater.text = "Send Later";
                            btnPOLater.font = Arial_Bold_14;
                            btnPONow.visible = false;
                            btnPONow.layoutX = 225.0;
                            btnPONow.layoutY = 244.0;
                            __layoutInfo_btnPONow.width = 150.0;
                            __layoutInfo_btnPONow.height = 30.0;
                            btnPONow.effect = reflectionEffect;
                            btnPONow.text = "Send Now";
                            btnPONow.font = Arial_Bold_14;
                            btnBack.visible = true;
                            btnBack.layoutY = 340.0;
                            btnBack.font = Arial_Bold_14;
                            btnBack.action = btnBackActionAtPOModeEmailText;
                            label.visible = true;
                            label.layoutY = 0.0;
                            label.text = "Purchase Order Sending... Step 2 [ Email ]";
                            btnPOCancel.visible = false;
                            btnPOCancel.layoutX = 400.0;
                            btnPOCancel.layoutY = 244.0;
                            __layoutInfo_btnPOCancel.width = 100.0;
                            __layoutInfo_btnPOCancel.height = 30.0;
                            btnPOCancel.effect = reflectionEffect;
                            btnPOCancel.text = "Cancel";
                            btnPOCancel.font = Arial_Bold_14;
                            imageView2.image = image;
                            rdoPOPerson.visible = false;
                            rdoPOPerson.layoutX = 220.0;
                            rdoPOPerson.layoutY = 192.0;
                            rdoPOPerson.text = "Order Via In Person";
                            rdoPOPerson.font = Arial_14;
                            rdoPOPerson.toggleGroup = null;
                            btnPOMode.visible = false;
                            btnPOMode.layoutX = 225.0;
                            btnPOMode.layoutY = 244.0;
                            __layoutInfo_btnPOMode.width = 150.0;
                            __layoutInfo_btnPOMode.height = 30.0;
                            btnPOMode.effect = reflectionEffect;
                            btnPOMode.text = "Proceed >>";
                            btnPOMode.font = Arial_Bold_14;
                            txtSMS.visible = true;
                            __layoutInfo_txtSMS.width = 452.0;
                            __layoutInfo_txtSMS.height = 94.0;
                            txtSMS.lines = 5.0;
                            label4.visible = true;
                            label4.layoutX = 0.0;
                            label4.layoutY = 110.0;
                            label4.text = "Distributor Code";
                            label4.font = Arial_12;
                            label5.visible = true;
                            label5.layoutX = 0.0;
                            label5.layoutY = 138.0;
                            label5.text = "Distributor Name";
                            label5.font = Arial_12;
                            txtPOSMSMob.visible = true;
                            txtPOSMSMob.layoutX = 120.0;
                            txtPOSMSMob.layoutY = 166.0;
                            __layoutInfo_txtPOSMSMob.width = 160.0;
                            label7.visible = true;
                            label7.layoutX = 0.0;
                            label7.layoutY = 166.0;
                            label7.text = "Mobile Number";
                            label7.font = Arial_12;
                            btnSmsSend.visible = true;
                            btnSmsSend.layoutX = 324.0;
                            btnSmsSend.layoutY = 174.0;
                            __layoutInfo_btnSmsSend.width = 150.0;
                            __layoutInfo_btnSmsSend.height = 30.0;
                            btnSmsSend.styleClass = "button";
                            btnSmsSend.effect = reflectionEffect;
                            btnSmsSend.text = "Send  SMS >>";
                            btnSmsSend.font = Arial_Bold_14;
                            txtDistNameSMS.visible = false;
                            txtDistNameSMS.disable = false;
                            txtDistNameSMS.layoutY = 141.0;
                            txtDistNameSMS.editable = true;
                            txtDistcodeSMS.visible = false;
                            txtDistcodeSMS.disable = false;
                            txtDistcodeSMS.editable = true;
                            panelPOSMS.visible = false;
                            panelPOSMS.layoutX = 70.0;
                            panelPOSMS.layoutY = 70.0;
                            panelPOSMS.blocksMouse = false;
                            rdoPOEmailText.visible = true;
                            rdoPOEmailText.layoutY = 70.0;
                            rdoPOEmailText.text = "Text Message";
                            rdoPOEmailText.font = Arial_14;
                            rdoPOEmailText.toggleGroup = toggleGroup;
                            rdoPOEmailText.selected = true;
                            rdoPOEmailPDF.visible = true;
                            rdoPOEmailPDF.layoutX = 250.0;
                            rdoPOEmailPDF.layoutY = 70.0;
                            rdoPOEmailPDF.text = "PDF";
                            rdoPOEmailPDF.font = Arial_14;
                            rdoPOEmailPDF.toggleGroup = toggleGroup;
                            rdoPOEmailPDF.selected = false;
                            rdoPOEmailHTML.visible = true;
                            rdoPOEmailHTML.layoutY = 70.0;
                            rdoPOEmailHTML.text = "HTML";
                            rdoPOEmailHTML.font = Arial_14;
                            rdoPOEmailHTML.toggleGroup = toggleGroup;
                            rdoPOEmailHTML.selected = false;
                            purLabel.visible = false;
                            rdoPOEmail.visible = false;
                            rdoPOEmail.layoutX = 220.0;
                            rdoPOEmail.layoutY = 142.0;
                            rdoPOEmail.text = "Order Via Email";
                            rdoPOEmail.font = Arial_14;
                            rdoPOEmail.toggleGroup = null;
                            rdoPOSms.visible = false;
                            rdoPOSms.layoutX = 220.0;
                            rdoPOSms.layoutY = 95.0;
                            rdoPOSms.text = "Order Via  SMS";
                            rdoPOSms.font = Arial_14;
                            rdoPOSms.toggleGroup = null;
                            panelAlert.blocksMouse = false;
                            imageView.visible = true;
                            panel.visible = true;
                        }
                    }
                ]
            }
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectBg.visible = true;
                            rectBg.layoutX = 0.0;
                            rectBg.layoutY = 0.0;
                            rectBg.blocksMouse = true;
                            rectBg.strokeWidth = 3.0;
                            rectBg.width = 600.0;
                            rectBg.height = 380.0;
                            rectangle.visible = true;
                            rectangle.width = 598.0;
                            label2.visible = true;
                            label2.layoutX = 0.0;
                            label2.layoutY = 120.0;
                            label2.text = "Distributor Code";
                            label2.font = Arial_12;
                            label3.visible = true;
                            label3.layoutX = 0.0;
                            label3.layoutY = 150.0;
                            label3.text = "Distributor Name";
                            label3.font = Arial_12;
                            txtDistCodeText.visible = false;
                            txtDistCodeText.disable = false;
                            txtDistCodeText.layoutX = 168.0;
                            txtDistCodeText.layoutY = 236.0;
                            txtDistCodeText.editable = true;
                            label8.visible = true;
                            label8.layoutY = 180.0;
                            label8.text = "Email id";
                            label8.font = Arial_12;
                            btnEmailHTML.visible = false;
                            btnEmailHTML.layoutX = 0.0;
                            btnEmailHTML.layoutY = 0.0;
                            btnEmailHTML.text = "Button";
                            btnEmailPDF.visible = true;
                            btnEmailPDF.layoutX = 220.0;
                            btnEmailPDF.layoutY = 245.0;
                            __layoutInfo_btnEmailPDF.width = 150.0;
                            __layoutInfo_btnEmailPDF.height = 30.0;
                            btnEmailPDF.onMouseClicked = btnEmailPDFOnMouseClickedAtPOModeEmailPDF;
                            btnEmailPDF.effect = reflectionEffect;
                            btnEmailPDF.text = "Send Email >>";
                            btnEmailPDF.font = Arial_Bold_14;
                            btnEmailPDF.action = btnEmailPDFActionAtPOModeEmailPDF;
                            txtDistNameText.visible = false;
                            txtDistNameText.layoutX = 175.0;
                            txtDistNameText.layoutY = 275.0;
                            txtDistNameText.editable = true;
                            txtPdfDistCode.visible = true;
                            txtPdfDistCode.layoutX = 120.0;
                            txtPdfDistCode.layoutY = 120.0;
                            __layoutInfo_txtPdfDistCode.width = 195.0;
                            txtPdfDistCode.editable = false;
                            txtPdfDistCode.font = Arial_12;
                            txtPdfDistName.visible = true;
                            txtPdfDistName.layoutX = 120.0;
                            txtPdfDistName.layoutY = 150.0;
                            __layoutInfo_txtPdfDistName.width = 195.0;
                            txtPdfDistName.editable = false;
                            txtPdfDistName.font = Arial_12;
                            txtHtmlDistcode.visible = false;
                            txtHtmlDistcode.layoutX = 182.0;
                            txtHtmlDistcode.layoutY = 247.0;
                            txtHtmlDistcode.editable = true;
                            txtHtmlDistName.visible = false;
                            txtHtmlDistName.layoutX = 315.0;
                            txtHtmlDistName.layoutY = 215.0;
                            txtHtmlDistName.editable = true;
                            label6.visible = false;
                            label6.layoutX = 55.0;
                            label6.layoutY = 304.0;
                            label6.text = "Label";
                            Password.visible = true;
                            Password.layoutX = 0.0;
                            Password.layoutY = 210.0;
                            Password.text = "Password";
                            Password.font = Arial_12;
                            txtEmailtxtpwd.visible = false;
                            txtEmailtxtpwd.layoutX = 168.0;
                            txtEmailtxtpwd.layoutY = 310.0;
                            txtEmailPdfPwd.visible = true;
                            txtEmailPdfPwd.layoutX = 120.0;
                            txtEmailPdfPwd.layoutY = 210.0;
                            __layoutInfo_txtEmailPdfPwd.width = 195.0;
                            txtEmailPdfPwd.onKeyPressed = txtEmailPdfPwdOnKeyPressedAtPOModeEmailPDF;
                            txtEmailPdfPwd.font = Arial_12;
                            label9.visible = false;
                            label9.layoutX = 83.0;
                            label9.layoutY = 302.0;
                            label9.text = "Label";
                            label9.textFill = javafx.scene.paint.Color.BLACK;
                            txtEmailhtmlpwd.visible = false;
                            txtEmailhtmlpwd.layoutX = 181.0;
                            txtEmailhtmlpwd.layoutY = 302.0;
                            txtEmailhtmlpwd.font = null;
                            txtEmail.visible = false;
                            txtEmail.layoutX = 173.0;
                            txtEmail.layoutY = 283.0;
                            txtPdfEmail.visible = true;
                            txtPdfEmail.layoutX = 120.0;
                            txtPdfEmail.layoutY = 180.0;
                            __layoutInfo_txtPdfEmail.width = 195.0;
                            txtPdfEmail.onKeyPressed = txtPdfEmailOnKeyPressedAtPOModeEmailPDF;
                            txtPdfEmail.font = Arial_12;
                            txthtmlemail.visible = false;
                            txthtmlemail.layoutX = 175.0;
                            txthtmlemail.layoutY = 269.0;
                            panelEmail.visible = true;
                            hyperlink.visible = true;
                            hyperlink.layoutX = 100.0;
                            hyperlink.layoutY = 20.0;
                            hyperlink.onMouseClicked = lblViewPOPDFOnMouseClickedAtPOModeEmailPDF;
                            hyperlink.text = "View Purchase order PDF file";
                            hyperlink.font = Arial_Bold_14;
                            lblPOPDFpath.visible = true;
                            lblPOPDFpath.layoutX = 80.0;
                            lblPOPDFpath.layoutY = 60.0;
                            __layoutInfo_lblPOPDFpath.width = 400.0;
                            __layoutInfo_lblPOPDFpath.height = 60.0;
                            lblPOPDFpath.styleClass = "path";
                            lblPOPDFpath.onMouseClicked = lblPOPDFpathOnMouseClickedAtPOModeEmailPDF;
                            lblPOPDFpath.font = Arial_Bold_12;
                            lblPOPDFpath.vpos = javafx.geometry.VPos.CENTER;
                            label10.visible = true;
                            label10.layoutX = 10.0;
                            label10.layoutY = 80.0;
                            label10.text = "File Path:";
                            label10.font = Arial_12;
                            panelMsgPdf.visible = true;
                            lnkViewPOHTML.visible = false;
                            lnkViewPOHTML.layoutX = 0.0;
                            lnkViewPOHTML.layoutY = 0.0;
                            lnkViewPOHTML.text = "http://www.javafx.com";
                            label12.visible = false;
                            label12.layoutX = 0.0;
                            label12.layoutY = 0.0;
                            label12.text = "Label";
                            lblPOHTMLpath.visible = false;
                            lblPOHTMLpath.layoutX = 0.0;
                            lblPOHTMLpath.layoutY = 0.0;
                            panelMsgHTML.visible = false;
                            txtEmailMsg.visible = false;
                            txtEmailMsg.layoutX = 0.0;
                            txtEmailMsg.layoutY = 0.0;
                            __layoutInfo_txtEmailMsg.width = 488.0;
                            __layoutInfo_txtEmailMsg.height = 141.0;
                            btnEmailText.visible = false;
                            btnEmailText.layoutX = 350.0;
                            btnEmailText.layoutY = 201.0;
                            __layoutInfo_btnEmailText.width = 150.0;
                            __layoutInfo_btnEmailText.height = 30.0;
                            btnEmailText.effect = null;
                            btnEmailText.text = "Send Email >>";
                            btnEmailText.font = Arial_Bold_14;
                            panelPOEmail.visible = true;
                            panelPOEmail.layoutX = 55.0;
                            panelPOEmail.layoutY = 95.0;
                            lblMsg.visible = false;
                            lblMsg.layoutY = 76.0;
                            btnPOLater.visible = false;
                            btnPOLater.layoutX = 100.0;
                            btnPOLater.layoutY = 244.0;
                            __layoutInfo_btnPOLater.width = 100.0;
                            __layoutInfo_btnPOLater.height = 30.0;
                            btnPOLater.effect = reflectionEffect;
                            btnPOLater.text = "Send Later";
                            btnPOLater.font = Arial_Bold_14;
                            btnPONow.visible = false;
                            btnPONow.layoutX = 225.0;
                            btnPONow.layoutY = 244.0;
                            __layoutInfo_btnPONow.width = 150.0;
                            __layoutInfo_btnPONow.height = 30.0;
                            btnPONow.effect = reflectionEffect;
                            btnPONow.text = "Send Now";
                            btnPONow.font = Arial_Bold_14;
                            btnBack.visible = true;
                            btnBack.layoutY = 340.0;
                            btnBack.font = Arial_Bold_14;
                            btnBack.action = btnBackActionAtPOModeEmailPDF;
                            label.visible = true;
                            label.layoutY = 0.0;
                            label.text = "Purchase Order Sending... Step 2 [ Email ]";
                            btnPOCancel.visible = false;
                            btnPOCancel.layoutX = 400.0;
                            btnPOCancel.layoutY = 244.0;
                            __layoutInfo_btnPOCancel.width = 100.0;
                            __layoutInfo_btnPOCancel.height = 30.0;
                            btnPOCancel.effect = reflectionEffect;
                            btnPOCancel.text = "Cancel";
                            btnPOCancel.font = Arial_Bold_14;
                            imageView2.image = image;
                            rdoPOPerson.visible = false;
                            rdoPOPerson.layoutX = 220.0;
                            rdoPOPerson.layoutY = 192.0;
                            rdoPOPerson.text = "Order Via In Person";
                            rdoPOPerson.font = Arial_14;
                            rdoPOPerson.toggleGroup = null;
                            btnPOMode.visible = false;
                            btnPOMode.layoutX = 225.0;
                            btnPOMode.layoutY = 244.0;
                            __layoutInfo_btnPOMode.width = 150.0;
                            __layoutInfo_btnPOMode.height = 30.0;
                            btnPOMode.effect = reflectionEffect;
                            btnPOMode.text = "Proceed >>";
                            btnPOMode.font = Arial_Bold_14;
                            txtSMS.visible = true;
                            __layoutInfo_txtSMS.width = 452.0;
                            __layoutInfo_txtSMS.height = 94.0;
                            txtSMS.lines = 5.0;
                            label4.visible = true;
                            label4.layoutX = 0.0;
                            label4.layoutY = 110.0;
                            label4.text = "Distributor Code";
                            label4.font = Arial_12;
                            label5.visible = true;
                            label5.layoutX = 0.0;
                            label5.layoutY = 138.0;
                            label5.text = "Distributor Name";
                            label5.font = Arial_12;
                            txtPOSMSMob.visible = true;
                            txtPOSMSMob.layoutX = 120.0;
                            txtPOSMSMob.layoutY = 166.0;
                            __layoutInfo_txtPOSMSMob.width = 160.0;
                            label7.visible = true;
                            label7.layoutX = 0.0;
                            label7.layoutY = 166.0;
                            label7.text = "Mobile Number";
                            label7.font = Arial_12;
                            btnSmsSend.visible = true;
                            btnSmsSend.layoutX = 324.0;
                            btnSmsSend.layoutY = 174.0;
                            __layoutInfo_btnSmsSend.width = 150.0;
                            __layoutInfo_btnSmsSend.height = 30.0;
                            btnSmsSend.styleClass = "button";
                            btnSmsSend.effect = reflectionEffect;
                            btnSmsSend.text = "Send  SMS >>";
                            btnSmsSend.font = Arial_Bold_14;
                            txtDistNameSMS.visible = false;
                            txtDistNameSMS.disable = false;
                            txtDistNameSMS.layoutY = 141.0;
                            txtDistNameSMS.editable = true;
                            txtDistcodeSMS.visible = false;
                            txtDistcodeSMS.disable = false;
                            txtDistcodeSMS.editable = true;
                            panelPOSMS.visible = false;
                            panelPOSMS.layoutX = 70.0;
                            panelPOSMS.layoutY = 70.0;
                            panelPOSMS.blocksMouse = false;
                            rdoPOEmailText.visible = true;
                            rdoPOEmailText.layoutY = 70.0;
                            rdoPOEmailText.text = "Text Message";
                            rdoPOEmailText.font = Arial_14;
                            rdoPOEmailText.toggleGroup = toggleGroup;
                            rdoPOEmailText.selected = false;
                            rdoPOEmailPDF.visible = true;
                            rdoPOEmailPDF.layoutX = 250.0;
                            rdoPOEmailPDF.layoutY = 70.0;
                            rdoPOEmailPDF.text = "PDF";
                            rdoPOEmailPDF.font = Arial_14;
                            rdoPOEmailPDF.toggleGroup = toggleGroup;
                            rdoPOEmailPDF.selected = true;
                            rdoPOEmailHTML.visible = true;
                            rdoPOEmailHTML.layoutY = 70.0;
                            rdoPOEmailHTML.text = "HTML";
                            rdoPOEmailHTML.font = Arial_14;
                            rdoPOEmailHTML.toggleGroup = toggleGroup;
                            rdoPOEmailHTML.selected = false;
                            purLabel.visible = false;
                            rdoPOEmail.visible = false;
                            rdoPOEmail.layoutX = 220.0;
                            rdoPOEmail.layoutY = 142.0;
                            rdoPOEmail.text = "Order Via Email";
                            rdoPOEmail.font = Arial_14;
                            rdoPOEmail.toggleGroup = null;
                            rdoPOSms.visible = false;
                            rdoPOSms.layoutX = 220.0;
                            rdoPOSms.layoutY = 95.0;
                            rdoPOSms.text = "Order Via  SMS";
                            rdoPOSms.font = Arial_14;
                            rdoPOSms.toggleGroup = null;
                            panelAlert.blocksMouse = false;
                            imageView.visible = true;
                            panel.visible = true;
                        }
                    }
                ]
            }
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectBg.visible = true;
                            rectBg.layoutX = 0.0;
                            rectBg.layoutY = 0.0;
                            rectBg.blocksMouse = true;
                            rectBg.strokeWidth = 3.0;
                            rectBg.width = 600.0;
                            rectBg.height = 380.0;
                            rectangle.visible = true;
                            rectangle.width = 598.0;
                            label2.visible = true;
                            label2.layoutX = 0.0;
                            label2.layoutY = 122.0;
                            label2.text = "Distributor Code";
                            label2.font = Arial_12;
                            label3.visible = true;
                            label3.layoutX = 0.0;
                            label3.layoutY = 150.0;
                            label3.text = "Distributor Name";
                            label3.font = Arial_12;
                            txtDistCodeText.visible = false;
                            txtDistCodeText.disable = false;
                            txtDistCodeText.layoutX = 168.0;
                            txtDistCodeText.layoutY = 236.0;
                            txtDistCodeText.editable = true;
                            label8.visible = true;
                            label8.layoutY = 180.0;
                            label8.text = "Email id";
                            label8.font = Arial_12;
                            btnEmailHTML.visible = true;
                            btnEmailHTML.layoutX = 220.0;
                            btnEmailHTML.layoutY = 240.0;
                            __layoutInfo_btnEmailHTML.width = 150.0;
                            __layoutInfo_btnEmailHTML.height = 30.0;
                            btnEmailHTML.effect = reflectionEffect;
                            btnEmailHTML.text = "Send Email >>";
                            btnEmailHTML.font = Arial_Bold_14;
                            btnEmailPDF.visible = false;
                            btnEmailPDF.layoutX = 416.0;
                            btnEmailPDF.layoutY = 300.0;
                            btnEmailPDF.text = "Send Email >>";
                            txtDistNameText.visible = false;
                            txtDistNameText.layoutX = 175.0;
                            txtDistNameText.layoutY = 275.0;
                            txtDistNameText.editable = true;
                            txtPdfDistCode.visible = false;
                            txtPdfDistCode.layoutX = 175.0;
                            txtPdfDistCode.layoutY = 247.0;
                            txtPdfDistCode.editable = true;
                            txtPdfDistName.visible = false;
                            txtPdfDistName.layoutX = 175.0;
                            txtPdfDistName.layoutY = 275.0;
                            txtPdfDistName.editable = true;
                            txtHtmlDistcode.visible = true;
                            txtHtmlDistcode.layoutX = 120.0;
                            txtHtmlDistcode.layoutY = 122.0;
                            __layoutInfo_txtHtmlDistcode.width = 195.0;
                            txtHtmlDistcode.editable = false;
                            txtHtmlDistcode.font = Arial_12;
                            txtHtmlDistName.visible = true;
                            txtHtmlDistName.layoutX = 120.0;
                            txtHtmlDistName.layoutY = 150.0;
                            __layoutInfo_txtHtmlDistName.width = 195.0;
                            txtHtmlDistName.editable = false;
                            txtHtmlDistName.font = Arial_12;
                            label6.visible = false;
                            label6.layoutX = 55.0;
                            label6.layoutY = 304.0;
                            label6.text = "Label";
                            Password.visible = false;
                            Password.layoutX = 55.0;
                            Password.layoutY = 302.0;
                            Password.text = "Label";
                            txtEmailtxtpwd.visible = false;
                            txtEmailtxtpwd.layoutX = 168.0;
                            txtEmailtxtpwd.layoutY = 310.0;
                            txtEmailPdfPwd.visible = false;
                            txtEmailPdfPwd.layoutX = 168.0;
                            txtEmailPdfPwd.layoutY = 304.0;
                            label9.visible = true;
                            label9.layoutX = 0.0;
                            label9.layoutY = 210.0;
                            label9.text = "Password";
                            label9.font = Arial_12;
                            label9.textFill = DarkGray;
                            txtEmailhtmlpwd.visible = true;
                            txtEmailhtmlpwd.layoutX = 120.0;
                            txtEmailhtmlpwd.layoutY = 210.0;
                            __layoutInfo_txtEmailhtmlpwd.width = 195.0;
                            txtEmailhtmlpwd.onKeyPressed = txtEmailhtmlpwdOnKeyPressedAtPOModeEmailHTML;
                            txtEmailhtmlpwd.font = Arial_12;
                            txtEmail.visible = false;
                            txtEmail.layoutX = 173.0;
                            txtEmail.layoutY = 283.0;
                            txtPdfEmail.visible = false;
                            txtPdfEmail.layoutX = 175.0;
                            txtPdfEmail.layoutY = 275.0;
                            txthtmlemail.visible = true;
                            txthtmlemail.layoutX = 120.0;
                            txthtmlemail.layoutY = 180.0;
                            __layoutInfo_txthtmlemail.width = 195.0;
                            txthtmlemail.onKeyPressed = txthtmlemailOnKeyPressedAtPOModeEmailHTML;
                            txthtmlemail.font = Arial_12;
                            panelEmail.visible = true;
                            hyperlink.visible = false;
                            hyperlink.layoutX = 0.0;
                            hyperlink.layoutY = 0.0;
                            hyperlink.text = "http://www.javafx.com";
                            lblPOPDFpath.visible = true;
                            lblPOPDFpath.layoutX = 80.0;
                            lblPOPDFpath.layoutY = 60.0;
                            __layoutInfo_lblPOPDFpath.width = 400.0;
                            __layoutInfo_lblPOPDFpath.height = 60.0;
                            lblPOPDFpath.styleClass = "path";
                            lblPOPDFpath.font = Arial_12;
                            lblPOPDFpath.vpos = javafx.geometry.VPos.CENTER;
                            label10.visible = true;
                            label10.layoutX = 10.0;
                            label10.layoutY = 80.0;
                            label10.text = "File Path:";
                            label10.font = Arial_12;
                            panelMsgPdf.visible = false;
                            lnkViewPOHTML.visible = true;
                            lnkViewPOHTML.layoutX = 100.0;
                            lnkViewPOHTML.layoutY = 20.0;
                            lnkViewPOHTML.onMouseClicked = lblViewPOHTMLOnMouseClicked;
                            lnkViewPOHTML.text = "View Purchase Order in HTML ";
                            lnkViewPOHTML.font = Arial_Bold_14;
                            label12.visible = true;
                            label12.layoutX = 10.0;
                            label12.layoutY = 80.0;
                            label12.text = "File Path";
                            label12.font = Arial_12;
                            lblPOHTMLpath.visible = true;
                            lblPOHTMLpath.layoutX = 80.0;
                            lblPOHTMLpath.layoutY = 60.0;
                            __layoutInfo_lblPOHTMLpath.width = 400.0;
                            __layoutInfo_lblPOHTMLpath.height = 60.0;
                            lblPOHTMLpath.font = Arial_Bold_12;
                            panelMsgHTML.visible = true;
                            txtEmailMsg.visible = false;
                            txtEmailMsg.layoutX = 0.0;
                            txtEmailMsg.layoutY = 0.0;
                            __layoutInfo_txtEmailMsg.width = 488.0;
                            __layoutInfo_txtEmailMsg.height = 141.0;
                            btnEmailText.visible = false;
                            btnEmailText.layoutX = 350.0;
                            btnEmailText.layoutY = 201.0;
                            __layoutInfo_btnEmailText.width = 150.0;
                            __layoutInfo_btnEmailText.height = 30.0;
                            btnEmailText.text = "Send Email >>";
                            btnEmailText.font = Arial_Bold_14;
                            panelPOEmail.visible = true;
                            panelPOEmail.layoutX = 55.0;
                            panelPOEmail.layoutY = 95.0;
                            lblMsg.visible = false;
                            lblMsg.layoutY = 76.0;
                            btnPOLater.visible = false;
                            btnPOLater.layoutX = 100.0;
                            btnPOLater.layoutY = 244.0;
                            __layoutInfo_btnPOLater.width = 100.0;
                            __layoutInfo_btnPOLater.height = 30.0;
                            btnPOLater.effect = reflectionEffect;
                            btnPOLater.text = "Send Later";
                            btnPOLater.font = Arial_Bold_14;
                            btnPONow.visible = false;
                            btnPONow.layoutX = 225.0;
                            btnPONow.layoutY = 244.0;
                            __layoutInfo_btnPONow.width = 150.0;
                            __layoutInfo_btnPONow.height = 30.0;
                            btnPONow.effect = reflectionEffect;
                            btnPONow.text = "Send Now";
                            btnPONow.font = Arial_Bold_14;
                            btnBack.visible = true;
                            btnBack.layoutY = 335.0;
                            btnBack.font = Arial_Bold_14;
                            btnBack.action = btnBackActionAtPOModeEmailHTML;
                            label.visible = true;
                            label.layoutY = 0.0;
                            label.text = "Purchase Order Sending... Step 2 [ Email ]";
                            btnPOCancel.visible = false;
                            btnPOCancel.layoutX = 400.0;
                            btnPOCancel.layoutY = 244.0;
                            __layoutInfo_btnPOCancel.width = 100.0;
                            __layoutInfo_btnPOCancel.height = 30.0;
                            btnPOCancel.effect = reflectionEffect;
                            btnPOCancel.text = "Cancel";
                            btnPOCancel.font = Arial_Bold_14;
                            imageView2.image = image;
                            rdoPOPerson.visible = false;
                            rdoPOPerson.layoutX = 220.0;
                            rdoPOPerson.layoutY = 192.0;
                            rdoPOPerson.text = "Order Via In Person";
                            rdoPOPerson.font = Arial_14;
                            rdoPOPerson.toggleGroup = null;
                            btnPOMode.visible = false;
                            btnPOMode.layoutX = 225.0;
                            btnPOMode.layoutY = 244.0;
                            __layoutInfo_btnPOMode.width = 150.0;
                            __layoutInfo_btnPOMode.height = 30.0;
                            btnPOMode.effect = reflectionEffect;
                            btnPOMode.text = "Proceed >>";
                            btnPOMode.font = Arial_Bold_14;
                            txtSMS.visible = true;
                            __layoutInfo_txtSMS.width = 452.0;
                            __layoutInfo_txtSMS.height = 94.0;
                            txtSMS.lines = 5.0;
                            label4.visible = true;
                            label4.layoutX = 0.0;
                            label4.layoutY = 110.0;
                            label4.text = "Distributor Code";
                            label4.font = Arial_12;
                            label5.visible = true;
                            label5.layoutX = 0.0;
                            label5.layoutY = 138.0;
                            label5.text = "Distributor Name";
                            label5.font = Arial_12;
                            txtPOSMSMob.visible = true;
                            txtPOSMSMob.layoutX = 120.0;
                            txtPOSMSMob.layoutY = 166.0;
                            __layoutInfo_txtPOSMSMob.width = 160.0;
                            label7.visible = true;
                            label7.layoutX = 0.0;
                            label7.layoutY = 166.0;
                            label7.text = "Mobile Number";
                            label7.font = Arial_12;
                            btnSmsSend.visible = true;
                            btnSmsSend.layoutX = 324.0;
                            btnSmsSend.layoutY = 174.0;
                            __layoutInfo_btnSmsSend.width = 150.0;
                            __layoutInfo_btnSmsSend.height = 30.0;
                            btnSmsSend.styleClass = "button";
                            btnSmsSend.effect = reflectionEffect;
                            btnSmsSend.text = "Send  SMS >>";
                            btnSmsSend.font = Arial_Bold_14;
                            txtDistNameSMS.visible = false;
                            txtDistNameSMS.disable = false;
                            txtDistNameSMS.layoutY = 141.0;
                            txtDistNameSMS.editable = true;
                            txtDistcodeSMS.visible = false;
                            txtDistcodeSMS.disable = false;
                            txtDistcodeSMS.editable = true;
                            panelPOSMS.visible = false;
                            panelPOSMS.layoutX = 70.0;
                            panelPOSMS.layoutY = 70.0;
                            panelPOSMS.blocksMouse = false;
                            rdoPOEmailText.visible = true;
                            rdoPOEmailText.layoutY = 70.0;
                            rdoPOEmailText.text = "Text Message";
                            rdoPOEmailText.font = Arial_14;
                            rdoPOEmailText.toggleGroup = toggleGroup;
                            rdoPOEmailText.selected = false;
                            rdoPOEmailPDF.visible = true;
                            rdoPOEmailPDF.layoutX = 250.0;
                            rdoPOEmailPDF.layoutY = 70.0;
                            rdoPOEmailPDF.text = "PDF";
                            rdoPOEmailPDF.font = Arial_14;
                            rdoPOEmailPDF.toggleGroup = toggleGroup;
                            rdoPOEmailPDF.selected = false;
                            rdoPOEmailHTML.visible = true;
                            rdoPOEmailHTML.layoutY = 70.0;
                            rdoPOEmailHTML.text = "HTML";
                            rdoPOEmailHTML.font = Arial_14;
                            rdoPOEmailHTML.toggleGroup = toggleGroup;
                            rdoPOEmailHTML.selected = true;
                            purLabel.visible = false;
                            rdoPOEmail.visible = false;
                            rdoPOEmail.layoutX = 220.0;
                            rdoPOEmail.layoutY = 142.0;
                            rdoPOEmail.text = "Order Via Email";
                            rdoPOEmail.font = Arial_14;
                            rdoPOEmail.toggleGroup = null;
                            rdoPOSms.visible = false;
                            rdoPOSms.layoutX = 220.0;
                            rdoPOSms.layoutY = 95.0;
                            rdoPOSms.text = "Order Via  SMS";
                            rdoPOSms.font = Arial_14;
                            rdoPOSms.toggleGroup = null;
                            panelAlert.blocksMouse = false;
                            imageView.visible = true;
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

    function txtEmailhtmlpwdOnKeyPressedAtPOModeEmailHTML(event: javafx.scene.input.KeyEvent): Void {
        txtEmailhtmlpwd.style = mandatoryStyle;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            btnEmailHTML.requestFocus();
        }
    }

    function txthtmlemailOnKeyPressedAtPOModeEmailHTML(event: javafx.scene.input.KeyEvent): Void {
        txthtmlemail.style = mandatoryStyle;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txthtmlemail.requestFocus();
        }
    }

    function txtEmailPdfPwdOnKeyPressedAtPOModeEmailPDF(event: javafx.scene.input.KeyEvent): Void {
        txtEmailPdfPwd.style = mandatoryStyle;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            btnEmailPDF.requestFocus();
        }
    }

    function txtPdfEmailOnKeyPressedAtPOModeEmailPDF(event: javafx.scene.input.KeyEvent): Void {
        txtPdfEmail.style = mandatoryStyle;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtEmailPdfPwd.requestFocus();
        }
    }

    function txtEmailtxtpwdOnKeyPressedAtPOModeEmailText(event: javafx.scene.input.KeyEvent): Void {
        txtEmailtxtpwd.style = mandatoryStyle;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            btnEmailText.requestFocus();
        }
    }

    function txtEmailOnKeyPressedAtPOModeEmailText(event: javafx.scene.input.KeyEvent): Void {
        txtEmail.style = mandatoryStyle;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtEmailtxtpwd.requestFocus();
        }
    }

    function txtPOSMSMobOnKeyPressedAtPOModeSMS(event: javafx.scene.input.KeyEvent): Void {
        txtPOSMSMob.style = mandatoryStyle;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            btnSmsSend.requestFocus();
        }
    }

    function imageViewOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        panel.visible = false;
    }

    function btnBackActionAtPOModeEmailHTML(): Void {
        currentState.actual = currentState.findIndex("POMode");
    }

    function btnBackActionAtPOModeEmailPDF(): Void {
        currentState.actual = currentState.findIndex("POMode");
    }

    function btnBackActionAtPOModeEmailText(): Void {
        currentState.actual = currentState.findIndex("POMode");
    }

    function btnBackActionAtPOModeSMS(): Void {
        currentState.actual = currentState.findIndex("POMode");
    }

    function pdfEmailAttach(): Void {
        var ms: Integer = 0;
        var purcOrMod = new PurchaseOrderModel();
        var purcOrderCont: com.vanuston.medeil.implementation.PurchaseOrder = RegistryFactory.getClientStub(RegistryConstants.PurchaseOrder) as com.vanuston.medeil.implementation.PurchaseOrder;
        try {
            purcOrMod.setPurcOrderNo(ponno);
            var enEmail: Integer = 0; enEmail = purcOrderCont.getCheckPurchaseOrderEMail();
            if (enEmail == 3) {
                var msg: String = "";
                msg = txtEmailMsg.text;
                var mail_id: String = "";
                mail_id = txtPdfEmail.text;
                var pwd: String = "";
                pwd = txtEmailPdfPwd.text;
                var distemail: String[] = dist_email;
                var filePath: String = "";
                filePath = filePdf.replaceAll("\\\\", "/");
                var val: Validation = new Validation();
                var em: Integer = 0; em = val.getEmailIdValid(mail_id, 4, 50);
                if (mail_id == null or mail_id == "") {
                    FXinfo("Please enter a valid E-Mail ID.", txtPdfEmail);
                } else if (em != 10) {
                    FXinfo("Please enter a valid E-Mail ID.", txtPdfEmail);
                } else if (pwd == null or pwd == "" or pwd.trim().length() == 0) {
                    FXinfo("Please enter a Password.", txtEmailPdfPwd);
                } else {
                    var ss: SendMail = new SendMail(mail_id, pwd, distemail, "Purchase Order ", textMess, filePath, pdfFileName, "pdf");
                    if (ss.m == 0) {
                        purcOrderCont.updateRecord(purcOrMod);
                        FXinfo("E-Mail sent successfully..!");
                        CancelForm();
                    } else {
                        FXinfo("Unable to Send Mail..!");
                        ms = 1;
                        purcOrderCont.updateRecord1(purcOrMod);
                    }
                }
            } else {
                FXinfo("If you want the PO to be mailed in PDF format, please enable the Purchase Order PDF option in settings.");
            }
        } catch (e: Exception) {
            var msg: String = "Class : PurchaseOrderNow  method : pdfEmailAttach()  = {e.getMessage()}";
            if (ms != 1) {
                FXinfo("Please check your Internet Connection..!");
            }
            purcOrderCont.updateRecord1(purcOrMod);
            log.debug(msg);
        }
    }

    function btnEmailPDFActionAtPOModeEmailPDF(): Void {
        pdfEmailAttach();
    }

    function btnEmailHTMLAction(): Void {
        var ms: Integer = 0;
        var purcOrMod = new PurchaseOrderModel();
        var purcOrderCont: com.vanuston.medeil.implementation.PurchaseOrder = RegistryFactory.getClientStub(RegistryConstants.PurchaseOrder) as com.vanuston.medeil.implementation.PurchaseOrder;
        try {
            purcOrMod.setPurcOrderNo(ponno);
            var enEmail: Integer = 0; enEmail = purcOrderCont.getCheckPurchaseOrderEMailHTML();
            if (enEmail == 3) {
                var msg: String = "";
                msg = txtEmailMsg.text;
                var mail_id: String = "";
                mail_id = txthtmlemail.text;
                var pwd: String = "";
                pwd = txtEmailhtmlpwd.text;
                var distemail: String[] = dist_email;
                var filePath: String = "";
                filePath = fileHtml.replaceAll("\\\\", "/");
                var val: Validation = new Validation();
                var em: Integer = 0; em = val.getEmailIdValid(mail_id, 4, 50);
                if (mail_id == null or mail_id == "") {
                    FXinfo("Please enter a valid E-Mail ID.", txthtmlemail);
                } else if (em != 10) {
                    FXinfo("Please enter a valid E-Mail ID.", txthtmlemail);
                } else if (pwd == null or pwd == "" or pwd.trim().length() == 0) {
                    FXinfo("Please Enter Password", txtEmailhtmlpwd);
                } else {
                    var ss: SendMail = new SendMail(mail_id, pwd, distemail, "Purchase Order ", textMess, filePath, htmlfileName, "html");
                    if (ss.m == 0) {
                        purcOrderCont.updateRecord(purcOrMod);
                        FXinfo("E-Mail Sent Successfully..!");
                        CancelForm();
                    } else {
                        FXinfo("Unable to send E-mail. Please check your Internet connection..!");
                        ms = 1;
                        purcOrderCont.updateRecord1(purcOrMod);
                    }
                }
            } else {
                FXinfo("If you want the PO to be mailed in HTML (webpage) format, please enable the Purchase Order HTML option in settings.");
            }
        } catch (e: Exception) {
            var msg: String = "Class : PurchaseOrderNow  method : btnEmailHTMLAction() = {e.getMessage()}";
            log.debug(msg);
            if (ms != 1) {
                FXinfo("Unable to send E-Mail..!");
            }
            purcOrderCont.updateRecord1(purcOrMod);
        }
    }

    function btnEmailPDFOnMouseClickedAtPOModeEmailPDF(event: javafx.scene.input.MouseEvent): Void {
        pdfEmailAttach();
    }

    var textMess: String = "";

    function btnSmsSendAction(): Void {
        var purcOrMod = new PurchaseOrderModel();        
        purcOrMod.setPurcOrderNo(ponno);
        var purcOrderCont: com.vanuston.medeil.implementation.PurchaseOrder = RegistryFactory.getClientStub(RegistryConstants.PurchaseOrder) as com.vanuston.medeil.implementation.PurchaseOrder;
        try {
            var sendSms = new SendSMS();
            var mobileNo: String = "";
            mobileNo = txtPOSMSMob.rawText.trim();
            var txtMessage: String = "";
            txtMessage = txtSMS.text;
            txtMessage = txtMessage.replaceAll("#", " ");
            mobileNo = mobileNo.trim();
            if (mobileNo == null or mobileNo == "" or mobileNo.trim().length() != 10) {
                FXinfo("Please enter a valid Mobile Number.", txtPOSMSMob);
            } else if (smsSend != 0 and (one160by2UserName == null or one160by2UserName == "" or one160by2UserName.trim().length() != 10)) {
                FXinfo("The value provided for Vanuston SMS Server 2 User Name is invalid.");
            } else if (smsSend != 0 and (one160by2Pwd == null or one160by2Pwd == "")) {
                FXinfo("The value provided for Vanuston SMS Server 2 Password is invalid.");
            } else if (smsSend == 0 and (way2SmsUserName == null or way2SmsUserName == "" or way2SmsUserName.trim().length() != 10)) {
                FXinfo("The value provided for Vanuston SMS Server 1 User Name is invalid.");
            } else if (smsSend == 0 and (way2SmsPwd == null or way2SmsPwd == "")) {
                FXinfo("The value provided for Vanuston SMS Server 1 Password is invalid.");
            } else if (txtMessage == null or txtMessage == "" or txtMessage.trim().length() == 0) {
                FXinfo("Please enter the Message to be sent.", txtSMS);
            } else {
                if (txtMessage != null and txtMessage.trim().length() > 0) {
                    var len = txtMessage.trim().length();
                    if (len > 135) {
                        var mesgArr: String[] = sendSms.spiltMsg(txtMessage, 135);
                        var msgLen: Integer = mesgArr.size();
                        for (i in [0..<msgLen]) {
                            var smsm: String = mesgArr[i];
                            if (smsSend == 0) {
                                sendSms.setPage("http://www.pharmastute.com/sms/SendSMS.php?acc=way2sms&uid={way2SmsUserName}&pwd={way2SmsPwd}&mob={mobileNo}&msg={smsm}");
                            } else {
                                sendSms.setPage("http://www.pharmastute.com/sms/SendSMS.php?acc=160by2&uid={one160by2UserName}&pwd={one160by2Pwd}&mob={mobileNo}&msg={smsm}");
                            }
                        }
                    } else {
                        if (smsSend == 0) {
                            sendSms.setPage("http://www.pharmastute.com/sms/SendSMS.php?acc=way2sms&uid={way2SmsUserName}&pwd={way2SmsPwd}&mob={mobileNo}&msg={txtMessage}");
                        } else {
                            sendSms.setPage("http://www.pharmastute.com/sms/SendSMS.php?acc=160by2&uid={one160by2UserName}&pwd={one160by2Pwd}&mob={mobileNo}&msg={txtMessage}");
                        }
                    }
                }
                purcOrderCont.updateRecord(purcOrMod);
                FXinfo("SMS sent Successfully.");
                CancelForm();
            }
        } catch (e: Exception) {
            var msg: String = "Class : PurchaseOrderNow  method : btnSmsSendAction() = {e.getMessage()}";
            log.debug(msg);
            FXinfo("Unable to send SMS. Please check your Internet connection.");
            purcOrderCont.updateRecord1(purcOrMod);
        }
    }

    function btnEmailTextAction(): Void {
        var ms: Integer = 0;
        var purcOrMod = new PurchaseOrderModel();        
        purcOrMod.setPurcOrderNo(ponno);
        var purcOrderCont: com.vanuston.medeil.implementation.PurchaseOrder = RegistryFactory.getClientStub(RegistryConstants.PurchaseOrder) as com.vanuston.medeil.implementation.PurchaseOrder;
        try {
            var msg: String = "";
            msg = txtEmailMsg.text;
            var mail_id: String = "";
            mail_id = txtEmail.text;
            var pwd: String = "";
            pwd = txtEmailtxtpwd.text;
            var distemail: String[] = dist_email;
            var val: Validation = new Validation();
            var em: Integer = 0; em = val.getEmailIdValid(mail_id, 4, 50);
            if (mail_id == null or mail_id == "") {
                FXinfo("Please enter a valid E-Mail ID.", txtEmail);
            } else if (em != 10) {
                FXinfo("Please enter a valid E-Mail ID.", txtEmail);
            } else if (pwd == null or pwd == "" or pwd.trim().length() == 0) {
                FXinfo("Please enter a valid Password.", txtEmailtxtpwd);
            } else {
                var ss: SendMail = new SendMail(mail_id, pwd, distemail, "Purchase Order ", textMess);
                if (ss.m == 0) {
                    purcOrderCont.updateRecord(purcOrMod);
                    FXinfo("E-Mail Sent Successfully.");
                    CancelForm();
                } else {
                    purcOrderCont.updateRecord1(purcOrMod);
                    FXinfo("Unable to send E-Mail.");
                    ms = 1;
                }
            }
        } catch (e: Exception) {
            var msg: String = "Class : PurchaseOrderNow  method : btnEmailTextAction() = {e.getMessage()}";
            log.debug(msg);
            if (ms != 1) {
                FXinfo("Unable to send E-Mail. Please Check your Internet Connection.");
            }
            purcOrderCont.updateRecord1(purcOrMod);
        }
    }

    function lblViewPOHTMLOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        try {
            var url: String = fileHt.replaceAll("\\\\", "/");
        } catch (e: Exception) {
            var msg: String = "Class : PurchaseOrderNow  method : lblViewPOHTMLOnMouseClicked() = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function rdoPOEmailHTMLOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        currentState.actual = currentState.findIndex("POModeEmailHTML");
    }

    function rdoPOEmailPDFOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        currentState.actual = currentState.findIndex("POModeEmailPDF");
    }

    function rdoPOEmailTextOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        currentState.actual = currentState.findIndex("POModeEmailText");
    }

    function lblViewPOPDFOnMouseClickedAtPOModeEmailPDF(event: javafx.scene.input.MouseEvent): Void {
        if (fileStc.trim().length() > 0 and fileStc != null) {
            Runtime.getRuntime().exec("rundll32 url.dll,FileProtocolHandler {fileStc}");
        }
    }

    function lblPOPDFpathOnMouseClickedAtPOModeEmailPDF(event: javafx.scene.input.MouseEvent): Void {
    }

    function btnPOModeAction(): Void {
        try {
            var purcOrderCont: com.vanuston.medeil.implementation.PurchaseOrder = RegistryFactory.getClientStub(RegistryConstants.PurchaseOrder) as com.vanuston.medeil.implementation.PurchaseOrder;
            var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
            if (rdoPOSms.selected == true or rdoPOEmail.selected == true) {
                var enSMS: Integer = 0; enSMS = purcOrderCont.getCheckPurchaseOrderSMS();
                var enEmail: Integer = 0; enEmail = purcOrderCont.getCheckPurchaseOrderEMail();
                if (enSMS == 0) {
                    FXinfo("Both SMS and E-Mail options have NOT been enabled for Purchase Order. Please enable them in the Settings screen.");
                } else if (rdoPOSms.selected == true and (enSMS == 2 or enSMS == 0)) {
                    FXinfo("Please enable Purchase Order SMS option in the Settings screen.");
                } else if (rdoPOEmail.selected == true and (enEmail == 2 or enEmail == 0)) {
                    FXinfo("Please enable Purchase Order E-Mail option in the Settings screen.");
                } else {
                    if (not new File("pdf/").exists()) {
                        new File("pdf/").mkdirs();
                    }
                    if (not new File("html/").exists()) {
                        new File("html/").mkdirs();
                    }
                    var purOrNo = purLabel.text;
                    ponno = purOrNo;
                    var dist_code: String = "";
                    var item_name: String = "";
                    var qty: String = "";
                    var mfg_name: String = "";
                    var msg: String = "";
                    var city: String = "";
                    var address1: String = "";
                    var shop_name: String = "";
                    var state: String = "";
                    var pincode: String = "";
                    var contact_no1: String = "";
                    var fax_no: String = "";
                    var emailId: String = "";
                    var mobile: String = "";
                    var pwd: String = "";

                    var shopDetails: List = commonController.getShopName();
                    shop_name = shopDetails.get(0).toString();
                    address1 = shopDetails.get(1).toString();
                    city = shopDetails.get(2).toString();
                    state = shopDetails.get(3).toString();
                    pincode = shopDetails.get(4).toString();
                    contact_no1 = shopDetails.get(5).toString();
                    fax_no = shopDetails.get(6).toString();
                    emailId = shopDetails.get(7).toString();

                    var settingCon: List = commonController.getSettingConfig();
                    emailId = settingCon.get(0).toString();
                    pwd = settingCon.get(1).toString();
                    smsSend = Integer.parseInt(settingCon.get(2).toString());
                    way2SmsUserName = settingCon.get(3).toString();
                    way2SmsPwd = settingCon.get(4).toString();
                    one160by2UserName = settingCon.get(5).toString();
                    one160by2Pwd = settingCon.get(6).toString();

                    var addre: String = address1.concat(", ").concat(city).concat(", ").concat(state).concat("  -   ").concat(pincode);
                    var con_addres: String = "Tel : ".concat(contact_no1).concat("   Fax : ").concat(fax_no).concat("   Email : ").concat(emailId);
                    var str: String = "";
                    msg = shop_name.concat("  -  ");
                    msg = msg.concat(address1).concat(",  ").concat(city).concat("\n");
                    var txtmsg: String = "";

                    var purcModel = new PurchaseOrderModel();
                    var purcDetails: Object = purcOrderCont.getPurcOrderNowTDetailPDF(purOrNo);
                    purcModel = purcDetails as PurchaseOrderModel;
                    var pModel: PurchaseOrderModel;
                    var purcOrderBill;
                    purcOrderBill = purcModel.getListofitems();
                    for (index in [0..<purcOrderBill.size()]) {
                        pModel = purcOrderBill.get(index);
                        dist_code = pModel.getPurcOrderDC();
                        item_name = pModel.getPurcOrderIN();
                        qty = String.valueOf(pModel.getPurcOrderQty());
                        mfg_name = pModel.getPurcOrderDos();
                        str = String.valueOf(index + 1);
                        msg = msg.concat(str).concat(". ").concat(item_name).concat("  -  ").concat(mfg_name).concat("  -  ").concat(qty).concat("\n");
                        txtmsg = txtmsg.concat(str).concat(". ").concat(item_name).concat("  -  ").concat(mfg_name).concat("  -  ").concat(qty).concat("\n");
                    }
                    var distInfo: List = purcOrderCont.getSuplierDetails(dist_code);
                    mobile = distInfo.get(0).toString();
                    dist_name = distInfo.get(1).toString();
                    dist_email = distInfo.get(2).toString();
                    txtDistcodeSMS.text = distInfo.get(3).toString();
                    txtDistNameSMS.text = dist_name;
                    txtPOSMSMob.text = mobile;
                    txtSMS.text = msg;
                    if (rdoPOSms.selected == true) {
                        currentState.actual = currentState.findIndex("POModeSMS");
                    } else if (rdoPOEmail.selected == true) {
                        var pdf: PurchaseOrderPDF = new PurchaseOrderPDF();
                        var fileName: String = "";
                        var fileNamehtml: String = "";
                        var shpN: String = shop_name.replaceAll(" ", "");
                        shpN = shpN.trim();
                        fileNamehtml = shpN.concat(purOrNo).concat(today).concat(".html");
                        fileName = shpN.concat(purOrNo).concat(today).concat(".pdf");
                        fileStc = path.concat("\\pdf\\").concat(fileName);
                        filePdf = path.concat("/pdf/");
                        fileHtml = path.concat("/html/");
                        pdfFileName = fileName;
                        htmlfileName = fileNamehtml;
                        var htmlStc = path.concat("\\html\\").concat(fileNamehtml);
                        lblPOHTMLpath.text = htmlStc;
                        fileHt = htmlStc;
                        fileN = fileName;
                        var htmlStr: String = "";
                        htmlStr = pdf.pdfCreator(path, fileName, shop_name, addre, con_addres, purOrNo, "purchase_order");
                        var pht: PurchaseOrderHTML = new PurchaseOrderHTML(fileNamehtml, htmlStr);
                        currentState.actual = currentState.findIndex("POModeEmailPDF");
                        lblPOPDFpath.text = fileStc;
                        txtPdfDistCode.text = dist_code;
                        txtDistCodeText.text = dist_code;
                        txtDistNameText.text = dist_name;
                        txtPdfDistName.text = dist_name;
                        txtHtmlDistcode.text = dist_code;
                        txtHtmlDistName.text = dist_name;
                        txtPdfEmail.text = emailId;
                        txthtmlemail.text = emailId;
                        txtEmail.text = emailId;
                        txtEmailPdfPwd.text = pwd;
                        txtEmailtxtpwd.text = pwd;
                        txtEmailhtmlpwd.text = pwd;
                    } else {
                    }
                    textMess = "";
                    textMess = "From : \r\n ".concat(shop_name).concat("\r\n").concat("To : \n\t").concat(dist_name).concat("\n\n").concat(txtmsg).concat("\n To : \n \t");
                    txtEmailMsg.text = textMess;
                }
            } else {
                FXinfo("Please Select Anyone Option to Proceed the Operation.");
            }
        } catch (e: Exception) {
            var msg: String = "Class : PurchaseOrderNow  method : lblViewPOHTMLOnMouseClicked() = {e.getMessage()}";
            log.debug(msg);
        }

    }

    public function visiblePO(): Void {
        panel.visible = true;
        currentState.findIndex("POMode");
        path = dir1.getCanonicalFile().toString();
        today = dutils.now("dd-MM-yyyy");
        fileStc = "";
        fileN = "";
        dist_name = "";
        dist_email = "";
        fileHt = "";
        filePdf = "";
        fileHtml = "";
        pdfFileName = "";
        htmlfileName = "";
        smsSend = 0;
        way2SmsUserName = "";
        way2SmsPwd = "";
        one160by2UserName = "";
        one160by2Pwd = "";
        ponno = "";
        mandatoryStyle = CommonDeclare.textbox_mandatory();
        errorStyle = CommonDeclare.textbox_error();
        txtPOSMSMob.style = mandatoryStyle;
        txtEmail.style = mandatoryStyle;
        txtEmailtxtpwd.style = mandatoryStyle;
        txtPdfEmail.style = mandatoryStyle;
        txtEmailPdfPwd.style = mandatoryStyle;
        txthtmlemail.style = mandatoryStyle;
        txtEmailhtmlpwd.style = mandatoryStyle;
    }

    public function CancelForm(): Void {
        path = null;
        today = null;
        fileStc = null;
        fileN = null;
        dist_name = null;
        dist_email = null;
        fileHt = null;
        filePdf = null;
        fileHtml = null;
        pdfFileName = null;
        htmlfileName = null;
        way2SmsUserName = null;
        way2SmsPwd = null;
        one160by2UserName = null;
        one160by2Pwd = null;
        mandatoryStyle = CommonDeclare.textbox_mandatory();
        errorStyle = CommonDeclare.textbox_error();
        txtSMS.text = null;
        txtDistcodeSMS.text = null;
        txtDistNameSMS.text = null;
        txtPOSMSMob.text = null;
        txtEmailMsg.text = null;
        txtDistCodeText.text = null;
        txtDistNameText.text = null;
        txtEmail.text = null;
        txtEmailtxtpwd.text = null;
        txtPdfDistCode.text = null;
        txtPdfDistName.text = null;
        txtPdfEmail.text = null;
        txtEmailPdfPwd.text = null;
        txtHtmlDistcode.text = null;
        txtHtmlDistName.text = null;
        txthtmlemail.text = null;
        txtEmailhtmlpwd.text = null;
        ponno = null;
        delete  panel.content;
        panel.visible = false;
    }

}
