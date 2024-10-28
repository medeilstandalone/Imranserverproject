package com.vanuston.medeil.ui;

import javafx.animation.Interpolator;
import javafx.animation.Timeline;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.util.Logger;
import javafx.scene.input.KeyCode;
import java.lang.Exception;
import javafx.scene.control.TextBox;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import javafx.scene.control.CheckBox;
import javafx.scene.Group;
import com.vanuston.medeil.implementation.Prescription;
import java.util.ArrayList;


public var selSymptoms:ArrayList=ArrayList{};//selSymptoms->Patient Symptoms
public class PatientSymptoms {
    var chkbox: CheckBox[]= CheckBox {};
    var log: Logger = Logger.getLogger(PatientSymptoms.class, "PatientSymptoms");
    var symptoms: String[];
    def CustomAlert = CustomAlert {};
    
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    def __layoutInfo_lblsymptom: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblsymptom: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind label9.layoutX
        layoutY: bind hbox2.layoutY-27
        layoutInfo: __layoutInfo_lblsymptom
        text: "Label"
    }
    
    def __layoutInfo_txtsymptom: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind rectangle.width-130
    }
    public-read def txtsymptom: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind lblsymptom.layoutX+120
        layoutY: bind hbox2.layoutY-27
        layoutInfo: __layoutInfo_txtsymptom
    }
    
    public-read def rectScrollBg: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        x: bind scrollView.layoutX-10
        width: bind scrollView.width+5
        height: bind (symptoms.size()*21)+10
    }
    
    def __layoutInfo_scrollView: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind rectangle.width-10
        height: bind rectangle.height-130
    }
    public-read def scrollView: javafx.scene.control.ScrollView = javafx.scene.control.ScrollView {
        visible: false
        layoutX: bind label9.layoutX
        layoutY: 45.0
        layoutInfo: __layoutInfo_scrollView
        node: rectScrollBg
    }
    
    def __layoutInfo_vbox3: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 540.0
        height: 265.0
    }
    public-read def vbox3: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        layoutX: 5.0
        layoutY: 45.0
        layoutInfo: __layoutInfo_vbox3
        spacing: 6.0
        hpos: javafx.geometry.HPos.LEFT
        vpos: javafx.geometry.VPos.TOP
    }
    
    def __layoutInfo_btnAddNew: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnAddNew: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutInfo: __layoutInfo_btnAddNew
        text: "Button"
    }
    
    public-read def panelPopUp: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelLX
        layoutY: bind panelLY
    }
    
    public-read def Violet: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.011764706
        green: 0.5019608
        blue: 0.7607843
    }
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
    }
    
    public-read def Arial_Bold_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 12.0
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
    
    def __layoutInfo_label11: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 175.0
        height: 26.0
    }
    public-read def label11: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 40.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_label11
        text: "Co-Existing Problems"
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
    
    def __layoutInfo_btnReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 80.0
        height: 30.0
    }
    public-read def btnReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: 100.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_btnReset
        effect: reflectionEffect
        text: "Cancel"
        font: Arial_Bold_14
    }
    
    def __layoutInfo_btnOK: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 80.0
        height: 30.0
    }
    public-read def btnOK: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutInfo: __layoutInfo_btnOK
        onKeyPressed: buttonOnKeyPressed
        effect: reflectionEffect
        text: "OK"
        font: Arial_Bold_14
        action: btnOKActionAtShown
    }
    
    def __layoutInfo_hbox2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def hbox2: javafx.scene.layout.HBox = javafx.scene.layout.HBox {
        layoutX: 197.0
        layoutY: 312.0
        layoutInfo: __layoutInfo_hbox2
        content: [ btnOK, btnReset, btnAddNew, ]
        spacing: 6.0
    }
    
    public-read def Arial_25: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
        size: 25.0
    }
    
    public-read def linearGradient: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#ffffff") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#f5f0e9") }, ]
    }
    
    public-read def DarkGray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.2
        blue: 0.2
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: true
        layoutX: 10.0
        layoutY: 32.0
        text: "Choose your option(s):"
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def RectTitle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        opacity: 1.0
        cursor: javafx.scene.Cursor.MOVE
        layoutX: 0.0
        layoutY: 0.0
        styleClass: ""
        onMouseDragged: RectTitleOnMouseDragged
        onMousePressed: RectTitleOnMousePressed
        fill: DarkGray
        stroke: null
        width: 550.0
        height: 26.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.4
    }
    
    public-read def Arial_Bold_30: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 30.0
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.87058824
        green: 0.8392157
        blue: 0.8392157
    }
    
    public-read def imageMedeil: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Medil Logo.png"
    }
    
    public-read def imageicon: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/MenuAboutMedeil.png"
    }
    
    public-read def imageView2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 8.0
        layoutY: 4.0
        image: imageicon
        fitWidth: 16.0
        fitHeight: 16.0
    }
    
    public-read def imageClose: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Close.png"
    }
    
    def __layoutInfo_imgClose: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 0.0
    }
    public-read def imgClose: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        opacity: bind opacClose
        cursor: javafx.scene.Cursor.DEFAULT
        layoutX: 525.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_imgClose
        onMouseClicked: imgCloseOnMouseClicked
        onMouseEntered: imgCloseOnMouseEntered
        onMouseExited: imgCloseOnMouseExited
        blocksMouse: true
        image: imageClose
    }
    
    public-read def imagevanuston: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Vanuston Logo.png"
    }
    
    public-read def Arial_Bold_13: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 13.0
    }
    
    public-read def dropShadowEffect: javafx.scene.effect.DropShadow = javafx.scene.effect.DropShadow {
    }
    
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 1.0
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "DialogBox"
        effect: dropShadowEffect
        fill: linearGradient
        stroke: DarkGray
        strokeWidth: 4.0
        width: 550.0
        height: 400.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    def __layoutInfo_panelheader: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 600.0
        height: 450.0
    }
    public-read def panelheader: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutInfo: __layoutInfo_panelheader
        content: [ rectangle, RectTitle, label11, imageView2, imgClose, label9, lblsymptom, txtsymptom, scrollView, vbox3, hbox2, panelPopUp, panelAlert, ]
    }
    
    def __layoutInfo_panel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 600.0
        height: 500.0
    }
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        opacity: bind PanelOpacity
        layoutInfo: __layoutInfo_panel
        blocksMouse: false
        content: [ panelheader, ]
    }
    
    public-read def panelReturnNotes: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        blocksMouse: false
        content: [ panel, ]
    }
    
    public-read def linearGradient2: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        startX: 1.0
        startY: 0.0
        endX: 0.0
        proportional: true
        cycleMethod: javafx.scene.paint.CycleMethod.NO_CYCLE
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#ffffff") }, javafx.scene.paint.Stop { offset: 0.2, color: javafx.scene.paint.Color.web ("#ffffff") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#93c028") }, ]
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
                            rectangle.width = 420.0;
                            rectangle.height = 380.0;
                            RectTitle.width = 420.0;
                            imgClose.layoutX = 397.0;
                            label9.layoutX = 5.0;
                            label9.layoutY = 32.0;
                            lblsymptom.visible = true;
                            lblsymptom.managed = true;
                            __layoutInfo_lblsymptom.width = 120.0;
                            lblsymptom.text = "Enter new Symptom :";
                            lblsymptom.font = Arial_Bold_12;
                            lblsymptom.textFill = DarkGray;
                            txtsymptom.visible = true;
                            txtsymptom.onKeyPressed = txtsymptomOnKeyPressedAtShown;
                            txtsymptom.multiline = false;
                            rectScrollBg.visible = true;
                            rectScrollBg.fill = linearGradient;
                            rectScrollBg.y = 0.0;
                            scrollView.visible = true;
                            scrollView.disable = false;
                            scrollView.layoutY = 50.0;
                            scrollView.blocksMouse = false;
                            scrollView.hbarPolicy = javafx.scene.control.ScrollBarPolicy.NEVER;
                            vbox3.managed = true;
                            vbox3.layoutX = 15.0;
                            vbox3.layoutY = 10.0;
                            __layoutInfo_vbox3.width = 300.0;
                            __layoutInfo_vbox3.height = 0.0;
                            __layoutInfo_btnOK.width = 70.0;
                            __layoutInfo_btnOK.height = 30.0;
                            btnOK.action = btnOKActionAtShown;
                            btnReset.layoutX = 85.0;
                            __layoutInfo_btnReset.width = 70.0;
                            btnReset.effect = reflectionEffect;
                            btnReset.text = "Reset";
                            btnReset.action = btnResetActionAtShown;
                            btnAddNew.visible = true;
                            btnAddNew.layoutX = 170.0;
                            __layoutInfo_btnAddNew.width = 70.0;
                            __layoutInfo_btnAddNew.height = 30.0;
                            btnAddNew.effect = reflectionEffect;
                            btnAddNew.text = "Add";
                            btnAddNew.font = Arial_Bold_14;
                            btnAddNew.action = btnAddNewActionAtShown;
                            hbox2.visible = true;
                            hbox2.layoutX = 99.0;
                            hbox2.layoutY = 332.0;
                            __layoutInfo_hbox2.width = 0.0;
                            panelPopUp.visible = false;
                            __layoutInfo_panelheader.width = 0.0;
                            __layoutInfo_panelheader.height = 0.0;
                            panel.visible = true;
                            __layoutInfo_panel.width = 0.0;
                            __layoutInfo_panel.height = 0.0;
                        }
                    }
                ]
            }
        ]
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panelReturnNotes, ]
    }
    // </editor-fold>//GEN-END:main
    function btnOKActionAtShown():Void{
    try{
            selSymptoms.clear();
            for (i in [0..symptoms.size()-1])
            {
                if(chkbox[i].selected==true)
                {
                   selSymptoms.add(chkbox[i].text);
                }
            }
            if(selSymptoms.size()==0)
            {
                FXinfo("Please Select any one Symptom to Insert !");
            }
            else
            {
                def pf = PrescriptionFormat{};
                pf.patientSymptoms(selSymptoms);
                Hide();
            }
            
       }
        catch (e: Exception) {
            var msg: String = "Class : PatientSymptoms  Method : btnOKActionAtShown() = {e.getMessage()}";
            log.debug(msg);
        }
    }
    
    function txtsymptomOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
            if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            btnOK.requestFocus();
            }
     }

    function btnAddNewActionAtShown(): Void {
            var newsymptom:String;
            newsymptom = txtsymptom.rawText.trim();
            if (newsymptom == null or newsymptom == "") {
                FXinfo("Please Enter a Symptom");
                } 
            else {
                var prescriptionController: Prescription = RegistryFactory.getClientStub(RegistryConstants.PrescriptionFormat) as Prescription;
                var a=prescriptionController.addSymptom(newsymptom,CommonDeclare.user);
                if(a==1)
                {
                    FXinfo("Symptom Already Exists !");
                    txtsymptom.requestFocus();
                }
                else
                {
                    Hide();
                }
            }
    }

    public function btnResetActionAtShown(): Void {
       for (i in [0..symptoms.size() - 1])
       {
           chkbox[i].selected=false;
       }
       selSymptoms.clear();
     }

    function buttonOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            btnOKActionAtShown();
        }
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Add Symptom(s)", msg);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    var panelW = bind CommonDeclare.ScreenWidth;
    var panelH = bind CommonDeclare.ScreenHeight;
    var PanelOpacity: Number = 0.0;
    var panelStartLX: Number;
    var panelStartLY: Number;
    var panelLX: Number = 150.0;
    var panelLY: Number = 50.0; //(panelH - 150) / 2;

    function RectTitleOnMouseDragged(e: javafx.scene.input.MouseEvent): Void {
        var LX = e.screenX - panelStartLX;
        var LY = e.screenY - panelStartLY;
        if (LX > 0 and (LX + 25) < panelW)
            panelLX = e.screenX - panelStartLX;
        if (LY > 0 and (LY + 25) < panelH)
            panelLY = e.screenY - panelStartLY;
    }

    function RectTitleOnMousePressed(e: javafx.scene.input.MouseEvent): Void {
        panelStartLX = e.screenX - panelLX;
        panelStartLY = e.screenY - panelLY;
    }

    function imgCloseOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        Hide();
        btnResetActionAtShown();
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
                    at (0s) {opacClose => 0.2 tween Interpolator.LINEAR},
                    at (0.1s) {opacClose => 0.3 tween Interpolator.LINEAR},
                    at (0.2s) {opacClose => 0.4 tween Interpolator.LINEAR},
                    at (0.5s) {opacClose => 0.8 tween Interpolator.LINEAR},
                    at (0.8s) {opacClose => 1.0 tween Interpolator.LINEAR},
                ]
            };

    public function Hide(): Void {
        fadePanel.rate = -1.0;
        fadePanel.play();
        panel.visible = false;
    }

    public function Show(): Void {
        panel.visible = true;
        fadePanel.rate = 1.0;
        fadePanel.play();
    }

    public function initShow(): Void {
        panel.visible = true;
        fadePanel.rate = 1.0;
        fadePanel.play();
        vbox3.content = for (i in [0..symptoms.size() - 1])
        chkbox[i]=CheckBox{
                    visible: true
                    cursor: javafx.scene.Cursor.HAND
                    layoutX: 0.0
                    layoutY: 0.0
                    text: symptoms[i]
                    font: Arial_12
                    hpos: javafx.geometry.HPos.CENTER
                    width: 400.0
                    height: 20.0
                    focusTraversable: true
                    blocksMouse:  false;
                }
        if(selSymptoms.size()>0){
           for(j in [0..selSymptoms.size()-1]){
             for (i in [0..chkbox.size()-1]){
               if(chkbox[i].text==selSymptoms.get(j)){
                   chkbox[i].selected=true;
               }
             }
           }
         }
        panelheader.content = [rectangle, RectTitle, label11, imageView2, imgClose, label9, scrollView, vbox3, hbox2, panelPopUp, panelAlert,lblsymptom,txtsymptom];
        scrollView.node = Group { content: [rectScrollBg,vbox3] };
}

    var fadePanel = Timeline {
                keyFrames: [
                    at (0s) {PanelOpacity => 0.0 tween Interpolator.LINEAR},
                    at (0.1s) {PanelOpacity => 0.75 tween Interpolator.LINEAR},
                    at (0.3s) {PanelOpacity => 1.0 tween Interpolator.LINEAR},
                ]
            };

    

    init  {
            var prescriptionController: Prescription = RegistryFactory.getClientStub(RegistryConstants.PrescriptionFormat) as Prescription;
            symptoms = prescriptionController.getSymptoms().toArray() as String[];
          }

         

}
    


