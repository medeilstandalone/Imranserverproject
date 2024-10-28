package com.vanuston.medeil.ui;
import org.netbeans.javafx.design.DesignState;
import javafx.scene.control.RadioButton;
import javafx.scene.text.Font;
import javafx.scene.layout.HBox;
import javafx.scene.shape.Rectangle;
import javafx.scene.control.Label;
import javafx.scene.paint.Color;
import javafx.scene.Scene;
import javafx.scene.Node;
import javafx.scene.layout.LayoutInfo;
import javafx.scene.paint.LinearGradient;
import javafx.scene.layout.Panel;
import com.vanuston.medeil.util.CommonDeclare;
import javafx.scene.input.KeyCode;
import java.lang.System;
public class SalesTypeSelection {
def CardDetails = CardDetails {};
public var selType = "";
var cardVis = false on replace {
    if(not cardVis and cardVisible)
        CardDetails.hideCardPanel();
    };
public var paymentAcc  = bind CardDetails.cboAc_no.selectedItem;
public var cardtype  = bind CardDetails.PaymentModeGroup.selectedToggle.value;
public var cardno    = bind CardDetails.txtSalesCDCardNo.rawText;
public var cardname  = bind CardDetails.txtSalesCDCardHName.rawText;
public var cardbank  = bind CardDetails.txtSalesCDBank.rawText;
public var carddate  = bind CardDetails.txtSalesCDExpDate.rawText;

    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def panelCardDetails: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: bind cardVisible
        layoutX: bind panelCardDetailsLX
    }
    
    public-read def Arial_Bold_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        green: 0.4
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
    
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 0.17
        layoutX: 0.0
        layoutY: 0.0
        fill: linearGradient
        stroke: DarkGray
        strokeWidth: 2.0
        width: 275.0
        height: 28.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def toggleGroup: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def Arial_Bold_14: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial bold"
        size: 14.0
    }
    
    public-read def imageCard: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Card1.png"
    }
    
    public-read def img_Card: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        onMouseClicked: CardOnMouseClickedAtShown
        image: imageCard
    }
    
    public-read def Arial_Bold_16: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial bold"
        size: 16.0
    }
    
    def __layoutInfo_labelCardDetails: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 110.0
        height: 48.0
    }
    public-read def labelCardDetails: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutInfo: __layoutInfo_labelCardDetails
        onMouseClicked: CardOnMouseClickedAtShown
        text: "              Card                    Details"
        font: Arial_Bold_16
        textWrap: true
        textFill: Green
    }
    
    public-read def panelCard: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: bind cardVis
        cursor: javafx.scene.Cursor.HAND
        layoutX: bind panelCardLX
        layoutY: bind panelCardLY
        content: [ img_Card, labelCardDetails, ]
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Card"
        font: Arial_Bold_16
        textFill: DarkGray
    }
    
    public-read def rdoCard: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: 182.0
        layoutY: 6.0
        onKeyPressed: rdoCardOnKeyPressed
        onMouseClicked: rdoCardOnMouseClicked
        graphic: label3
        text: ""
        font: Arial_Bold_14
        graphicTextGap: -10.0
        toggleGroup: toggleGroup
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Credit"
        font: Arial_Bold_16
        textFill: DarkGray
    }
    
    public-read def rdoCredit: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        opacity: 1.0
        layoutX: 87.0
        layoutY: 6.0
        onMouseClicked: rdoCreditOnMouseClicked
        graphic: label2
        text: ""
        font: Arial_Bold_14
        graphicTextGap: -10.0
        toggleGroup: toggleGroup
    }
    
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "Cash "
        font: Arial_Bold_16
        textFill: DarkGray
    }
    
    public-read def rdoCash: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: 17.0
        layoutY: 6.0
        onKeyPressed: rdoCashOnKeyPressed
        onMouseClicked: rdoCashOnMouseClicked
        graphic: label
        text: ""
        font: Arial_Bold_14
        graphicTextGap: -10.0
        toggleGroup: toggleGroup
        selected: true
    }
    
    public-read def hbox: javafx.scene.layout.HBox = javafx.scene.layout.HBox {
        layoutX: 20.0
        layoutY: 4.0
        content: [ rdoCash, rdoCredit, rdoCard, ]
        spacing: 30.0
    }
    
    def __layoutInfo_panel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 310.0
        height: 26.0
    }
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: 0.0
        layoutY: 2.0
        layoutInfo: __layoutInfo_panel
        content: [ rectangle, hbox, panelCard, panelCardDetails, ]
    }
    
    public-read def scene: javafx.scene.Scene = javafx.scene.Scene {
        content: getDesignRootNodes ()
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel, ]
    }
    
    public function getDesignScene (): javafx.scene.Scene {
        scene
    }
    // </editor-fold>//GEN-END:main

    function rdoCashOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        isTabonRdoCash = 0;
        if(event.code == KeyCode.VK_TAB){
            rdoCredit.requestFocus();
            if(event.shiftDown){
                isTabonRdoCash = -1;
            }
        } else if(event.code == KeyCode.VK_TAB ){
            
        } else if(event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_SPACE){
            if(rdoCash.selected){
                rdoCashAction();
                System.out.println("loecs54");
            }
        }

    }
    public var isTabonRdoCard = 0;
    public var isTabonRdoCash = 0;
    function rdoCardOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        isTabonRdoCard = 0;
        if(event.code == KeyCode.VK_TAB ){
            if(rdoCard.selected) {
                 CardDetails.cboAc_no.requestFocus();
            } else {
                isTabonRdoCard = 1;
                if(event.shiftDown){
                    rdoCredit.requestFocus();
                }
            }

        } else if(event.code == KeyCode.VK_SPACE ){
            if(rdoCard.selected){
                rdoCardAction();
            }
        }

    }

public function resetCardDetails():Void{
    CardDetails.txtSalesCDCardNo.text="";
    CardDetails.txtSalesCDCardHName.text="";
    CardDetails.txtSalesCDBank.text="";
    CardDetails.txtSalesCDExpDate.text="";
}

    function rdoCashAction():Void {
        selType = "Cash";
        System.out.println("loecs23");
        cardVis = false;
        img_Card.visible =false;
        labelCardDetails.visible =false;
        System.out.println(cardVis);
    }
    function rdoCreditAction():Void {
        selType = "Credit";
        cardVis = false;
        img_Card.visible =false;
        labelCardDetails.visible =false;
    }

    function rdoCardAction():Void {
        selType = "Cards";
        cardVis = true;
        img_Card.visible =true;
        labelCardDetails.visible =true;
        CardDetails.showCardPanel();
    }

    function rdoCardOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        rdoCardAction();

    }
    function rdoCreditOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        rdoCreditAction()
    }

    function rdoCashOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        rdoCashAction();        
    }

var panelW = bind CommonDeclare.panelFormW ;
var TableW = bind (95.29860229 * panelW) / 100 ;
var button3LX = bind CommonDeclare.botton33LX;
var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
var panelCardLX = bind button3LX + bottonW + 30-panelTableLX;
var panelCardLY = bind panelButtonsLY -350.0;
var bottonW = bind CommonDeclare.bottonW + 15;
var panelTableLX = bind (panelW - TableW) / 2;
var Type2TextboxW = bind CommonDeclare.Type2TextboxW;

var panelCardDetailsW = bind Type2TextboxW + 155;
var panelCardDetailsLX = bind panelCardLX-panelCardDetailsW+115;

function CardOnMouseClickedAtShown (event: javafx.scene.input.MouseEvent): Void {
       CardDetails.showCardPanel();
    }

var cardVisible:Boolean=bind CardDetails.visible on replace{
    if(cardVisible){
       delete panelCardDetails.content;
       insert CardDetails.getDesignRootNodes() into  panelCardDetails.content;
       }
       else{
           delete panelCardDetails.content;
       }

}
}

