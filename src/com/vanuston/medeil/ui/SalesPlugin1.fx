
package com.vanuston.medeil.ui;

import javafx.animation.Interpolator;
import javafx.animation.Timeline;
import com.vanuston.medeil.util.Value;
import com.vanuston.medeil.util.NumberUtils;
import javafx.scene.input.KeyCode;


public class SalesPlugin1 {
var Opac=0.2;
public var Amount:Double=0.0 on replace{
    calculations();
}

    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def Arial_18: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
        size: 18.0
    }
    
    def __layoutInfo_txtReceived: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 105.0
        height: 25.0
    }
    public-read def txtReceived: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 10.0
        layoutY: 67.0
        layoutInfo: __layoutInfo_txtReceived
        styleClass: "text-box"
        onKeyPressed: txtReceivedOnKeyPressed
        onKeyTyped: txtReceivedOnKeyTyped
        text: ""
        editable: true
        font: Arial_18
    }
    
    def __layoutInfo_txtBalance: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 105.0
        height: 25.0
    }
    public-read def txtBalance: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 117.0
        layoutY: 67.0
        layoutInfo: __layoutInfo_txtBalance
        styleClass: "text-box"
        onMouseClicked: txtBalanceOnMouseClicked
        focusTraversable: false
        text: "0.00"
        editable: false
        columns: 10.0
        font: Arial_18
    }
    
    public-read def linearGradient: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#d0ea00") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#708e00") }, ]
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
        styleClass: ""
        fill: linearGradient
        stroke: DarkGray
        strokeWidth: 2.0
        y: 40.0
        width: 225.0
        height: 60.0
        arcWidth: 10.0
        arcHeight: 10.0
    }
    
    public-read def Arial_Bold__16: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 16.0
    }
    
    def __layoutInfo_labelAccount_type: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 105.0
    }
    public-read def labelAccount_type: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 117.0
        layoutY: 46.0
        layoutInfo: __layoutInfo_labelAccount_type
        text: "Balance"
        font: Arial_Bold__16
        hpos: javafx.geometry.HPos.CENTER
        textFill: DarkGray
    }
    
    def __layoutInfo_labelAccount_Holder: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 105.0
    }
    public-read def labelAccount_Holder: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 10.0
        layoutY: 46.0
        layoutInfo: __layoutInfo_labelAccount_Holder
        text: "Received"
        font: Arial_Bold__16
        hpos: javafx.geometry.HPos.CENTER
        textFill: DarkGray
    }
    
    def __layoutInfo_panelpage: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 225.0
        height: 100.0
    }
    public-read def panelpage: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutY: 0.0
        layoutInfo: __layoutInfo_panelpage
        content: [ rectangle, labelAccount_Holder, labelAccount_type, txtBalance, txtReceived, ]
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.4
    }
    
    public-read def imagesubtract: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/subtract.png"
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        opacity: bind Opac
        cursor: javafx.scene.Cursor.HAND
        layoutX: 8.0
        layoutY: 42.0
        onMouseClicked: imageViewOnMouseClicked
        onMouseEntered: imageViewOnMouseEntered
        onMouseExited: imageViewOnMouseExited
        image: imagesubtract
        fitWidth: 12.0
        fitHeight: 12.0
    }
    
    def __layoutInfo_panel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 0.0
    }
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutInfo: __layoutInfo_panel
        content: [ panelpage, imageView, ]
    }
    
    public-read def imageplus: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/plus.png"
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel, ]
    }
    // </editor-fold>//GEN-END:main
    
    public var focusNextNode = 0;

    function txtReceivedOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if(event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER){
            focusNextNode =1;
            if(event.shiftDown){
                focusNextNode = -1;
            }
        } else {
            focusNextNode = 0;
        }
    }

    function txtReceivedOnKeyTyped(event: javafx.scene.input.KeyEvent): Void {
           calculations();
         }
    function calculations():Void{
        if(NumberUtils.isNumeric(txtReceived)){
        txtBalance.text=Value.Round("{Amount-Double.parseDouble(txtReceived.rawText)}");
        }else{
            txtBalance.text=Value.Round("{Amount}");
        }

    }
    public function reset():Void {
        txtReceived.text="";
        txtBalance.text="0.00";
    }

    function imageViewOnMouseEntered (event: javafx.scene.input.MouseEvent): Void {
        fadeImage.rate = 1.0;
        fadeImage.play();
    }
    function imageViewOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        fadeImage.rate = -1.0;
        fadeImage.play();
         }

    function imageViewOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
       if(panelpage.visible==true){
           imageView.image=imageplus;
           panelpage.visible=false;
       }else{
           imageView.image=imagesubtract;
           panelpage.visible=true;
         }
    }
    function txtBalanceOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        txtReceived.requestFocus();
    }
    var fadeImage = Timeline {
                keyFrames: [
                    at (0s) {Opac => 0.2 tween Interpolator.LINEAR},
                    at (0.1s) {Opac => 1.0 tween Interpolator.LINEAR},
                ]
    };

}

