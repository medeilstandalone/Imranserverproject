package com.vanuston.medeil.ui;

import java.lang.*;
import javafx.scene.layout.LayoutInfo;
import javafx.animation.Interpolator;
import javafx.animation.Timeline;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.ui.calendar.theme.Theme;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;

var fxCalendar = FXCalendar {
                theme: Theme {};
            };

public class CalendarFx {
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    def __layoutInfo_panelCalc: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 218.0
        height: 245.0
    }
    public-read def panelCalc: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: -2.0
        layoutY: 26.0
        layoutInfo: __layoutInfo_panelCalc
        focusTraversable: true
    }
    
    public-read def Violet: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.011764706
        green: 0.5019608
        blue: 0.7607843
    }
    
    public-read def linearGradient: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#ffffff") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#e4f0f4") }, ]
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
    
    def __layoutInfo_label16: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 217.0
        height: 25.0
    }
    public-read def label16: javafx.scene.control.Label = javafx.scene.control.Label {
        cursor: javafx.scene.Cursor.MOVE
        layoutX: 0.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_label16
        text: "Calendar"
        font: Arial_18
        hpos: javafx.geometry.HPos.CENTER
        textFill: javafx.scene.paint.Color.BLACK
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
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.4
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
        stroke: Violet
        strokeWidth: 4.0
        width: 216.0
        height: 272.0
        arcWidth: 10.0
        arcHeight: 10.0
    }
    
    public-read def lightingEffect: javafx.scene.effect.Lighting = javafx.scene.effect.Lighting {
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
    }
    
    public-read def linearGradient2: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#FFFFFF") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#000000") }, ]
    }
    
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        opacity: 0.25
        layoutX: 1.0
        layoutY: 1.0
        styleClass: "rectFormHeader"
        fill: linearGradient2
        width: 217.0
        height: 25.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def imageClose: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Close.png"
        backgroundLoading: false
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        opacity: bind opacClose
        cursor: javafx.scene.Cursor.DEFAULT
        layoutX: 192.0
        layoutY: 1.5
        onMouseClicked: imageViewOnMouseClicked
        onMouseEntered: imgCloseOnMouseEntered
        onMouseExited: imgCloseOnMouseExited
        blocksMouse: true
        image: imageClose
    }
    
    public-read def group: javafx.scene.Group = javafx.scene.Group {
        onKeyPressed: groupOnKeyPressed
        onMouseDragged: groupOnMouseDragged
        onMousePressed: groupOnMousePressed
        content: [ rectangle, rectHeader, label16, imageView, ]
    }
    
    public-read def panelC: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        opacity: bind PanelOpacity
        layoutX: bind panelLX
        layoutY: bind panelLY
        onMouseClicked: panelCOnMouseClicked
        blocksMouse: true
        pickOnBounds: true
        content: [ group, panelCalc, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ panelC, ]
    }
    
    public-read def linearGradient3: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        startY: 0.0
        endX: 0.0
        endY: 1.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#dee9be") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#606060") }, ]
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel, ]
    }
    // </editor-fold>//GEN-END:main

    public var focused: Boolean;

    function panelCOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        show = 1;
    }
    function groupOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        show = 1;
    }

    var panelW = bind CommonDeclare.ScreenWidth;
    var panelH = bind CommonDeclare.ScreenHeight;
    var PanelOpacity: Number = 0.0;
    var panelStartLX: Number;
    var panelStartLY: Number;
    var panelLX = 0.0;
    var panelLY = 0.0;

    function groupOnMouseDragged(e: javafx.scene.input.MouseEvent): Void {
        panelLX = e.screenX - panelStartLX;
        panelLY = e.screenY - panelStartLY;
    }

    function groupOnMousePressed(e: javafx.scene.input.MouseEvent): Void {
        panelStartLX = e.screenX - panelLX;
        panelStartLY = e.screenY - panelLY;
    }

    function imageViewOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        show = 0;
        fadePanel.rate = -1.0;
        fadePanel.play();
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

    public function Show(): Void {
        panelCalc.content = [fxCalendar,];
        panelC.visible = true;
        fadePanel.rate = 1.0;
        fadePanel.play();
        show = 1;
    }

    var show = 1;
    var flag = 0 on replace {
        if (flag == 1 and show == 0) {
            panel.visible = false;
            CommonDeclare.MainPageForm = "";
        }
    }
    var fadePanel = Timeline {
                keyFrames: [
                    at (0s) {flag => 1},
                    at (0s) {PanelOpacity => 0.0 tween Interpolator.LINEAR},
                    at (0.1s) {PanelOpacity => 0.75 tween Interpolator.LINEAR},
                    at (0.3s) {PanelOpacity => 1.0 tween Interpolator.LINEAR},
                    at (0.3s) {flag => 0},
                ]
            };
}
