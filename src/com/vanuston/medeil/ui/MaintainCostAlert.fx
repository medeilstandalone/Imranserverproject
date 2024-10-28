package com.vanuston.medeil.ui;

import java.sql.*;
import java.lang.*;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;
import javafx.scene.control.Label;
import javafx.animation.Timeline;
import javafx.animation.Interpolator;
import javafx.scene.shape.Rectangle;
import javafx.scene.Group;

public class MaintainCostAlert {

    var log: Logger = Logger.getLogger(MaintainCostAlert.class, "Setting");
    var curDate: String[] = DateUtils.now("dd-MM-yyyy").split("-");
    var part: String[];
    var due: String[];
    var cnt;
    var labelF;
    var ScrollViewH = bind rectBgHeight + 2;
    var y = 0 on replace {
        if (y <= 22) {
            rectBgHeight = y * 20;
        }
    }
    var rectBgHeight = y * 20;
    var panelStartLX: Number;
    var panelStartLY: Number;
    var panelLX: Number on replace {
        if (panelLX < 0.0) {
            panelLX = 0.0
        }
    }
    var panelLY: Number on replace {
        if (panelLY < 0.0) {
            panelLY = 0.0
        }
    }
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def panelData: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
    }
    
    def __layoutInfo_scrollView: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 248.0
        height: bind ScrollViewH
    }
    public-read def scrollView: javafx.scene.control.ScrollView = javafx.scene.control.ScrollView {
        opacity: 1.0
        layoutX: 1.0
        layoutY: 30.0
        layoutInfo: __layoutInfo_scrollView
        node: panelData
        hbarPolicy: javafx.scene.control.ScrollBarPolicy.NEVER
    }
    
    public-read def Arial: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
        size: 14.0
    }
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 12.0
        oblique: false
        embolden: false
    }
    
    public-read def Arial_Bold_14: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 14.0
    }
    
    public-read def tooltip: javafx.scene.control.Tooltip = javafx.scene.control.Tooltip {
        text: "  Click here to hide Payment Notifications "
        font: Arial_Bold_14
    }
    
    def __layoutInfo_textbox: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 28.0
        height: 27.0
    }
    public-read def textbox: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        opacity: 0.0
        layoutX: 1.0
        layoutY: 1.0
        layoutInfo: __layoutInfo_textbox
        blocksMouse: false
        tooltip: tooltip
    }
    
    public-read def tooltip2: javafx.scene.control.Tooltip = javafx.scene.control.Tooltip {
        text: "  Reload Notifications   "
        font: Arial_Bold_14
    }
    
    def __layoutInfo_textbox2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 27.0
        height: 27.0
    }
    public-read def textbox2: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        opacity: 0.0
        layoutX: 220.0
        layoutY: 1.0
        layoutInfo: __layoutInfo_textbox2
        blocksMouse: false
        tooltip: tooltip2
    }
    
    public-read def Arial_Bold_16: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 16.0
    }
    
    public-read def Arial_20: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 20.0
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
    }
    
    public-read def imgClose: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Close.png"
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.4
        blue: 0.0
    }
    
    public-read def linearGradient: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#ffffff") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#f5f0e9") }, ]
    }
    
    public-read def DarkGray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.2
        blue: 0.2
    }
    
    def __layoutInfo_label: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 192.0
        height: 27.0
    }
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        cursor: javafx.scene.Cursor.MOVE
        managed: true
        layoutX: 28.0
        layoutY: 1.0
        layoutInfo: __layoutInfo_label
        onMouseDragged: rectHeaderOnMouseDragged
        onMousePressed: rectHeaderOnMousePressed
        text: "Payment Notifications"
        font: Arial_Bold_16
        textWrap: false
        hpos: javafx.geometry.HPos.CENTER
        textFill: DarkGray
    }
    
    public-read def rectBg: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        styleClass: "DialogBox"
        fill: linearGradient
        stroke: DarkGray
        strokeWidth: 4.0
        width: 250.0
        height: bind rectBgHeight+35
        arcWidth: 10.0
        arcHeight: 10.0
    }
    
    public-read def linearGradientHeader: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        cycleMethod: javafx.scene.paint.CycleMethod.REFLECT
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#FFFFFF") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#cccccc") }, ]
    }
    
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        opacity: 1.0
        layoutX: 1.0
        layoutY: 1.0
        styleClass: "DialogBox"
        fill: linearGradientHeader
        stroke: DarkGray
        strokeWidth: 2.0
        width: 248.0
        height: 28.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def imageNext: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/NavigationNext.png"
    }
    
    public-read def imageBack: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/NavigationBack.png"
    }
    
    public-read def imgNavigation: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        cursor: null
        layoutX: 8.0
        layoutY: 8.0
        onMouseClicked: imgNavigationOnMouseClicked
        image: imageBack
    }
    
    public-read def linearGradientNavi: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#FFFFFF") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#cccccc") }, ]
    }
    
    public-read def rectNavi: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        layoutX: 1.0
        layoutY: 1.0
        styleClass: "rectbutton"
        onMouseClicked: imgNavigationOnMouseClicked
        onMouseDragged: rectHeaderOnMouseDragged
        onMousePressed: rectHeaderOnMousePressed
        fill: linearGradientNavi
        stroke: DarkGray
        strokeWidth: 2.0
        width: 27.0
        height: 27.0
        arcWidth: 10.0
    }
    
    public-read def rectreload: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        layoutX: 220.0
        layoutY: 1.0
        styleClass: "rectbutton"
        onMouseClicked: rectreloadOnMouseClicked
        fill: linearGradientNavi
        stroke: DarkGray
        strokeWidth: 2.0
        width: 27.0
        height: 27.0
    }
    
    public-read def imagereload: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/reload.png"
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 225.0
        layoutY: 6.0
        image: imagereload
        fitWidth: 20.0
        fitHeight: 20.0
    }
    
    def __layoutInfo_panel1: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 250.0
        height: 300.0
    }
    public-read def panel1: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        opacity: bind PanelOpacity
        layoutX: 0.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_panel1
        content: [ rectBg, rectHeader, rectreload, label, imageView, textbox2, scrollView, ]
    }
    
    public-read def panelMaintainAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutX: bind panelLX
        layoutY: bind panelLY
        content: [ panel1, rectNavi, textbox, imgNavigation, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        content: [ panelMaintainAlert, ]
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel, ]
    }
    
    public function getDesignScene (): javafx.scene.Scene {
        javafx.scene.Scene {
            content: getDesignRootNodes ()
        }
    }
    // </editor-fold>//GEN-END:main

    function rectreloadOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        GetMaintainCostAlert();
    }

    function imgNavigationOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if (imgNavigation.image == imageNext) {
            fadePanel.rate = 1.0;
            fadePanel.play();
            imgNavigation.image = imageBack;
            tooltip.text = "  Click here to hide Payment Notifications ";
        } else if (imgNavigation.image == imageBack) {
            fadePanel.rate = -1.0;
            fadePanel.play();
            imgNavigation.image = imageNext;
            tooltip.text = "  Click here to display Payment Notifications ";
        }
    }

    function getMaintainCostDays(): Integer {
        var days = 0;
        var rs: ResultSet = DBConnection.getStatement().executeQuery("SELECT maintain_cost_days FROM settings_config");
        while (rs.next()) {
            days = rs.getInt("maintain_cost_days");
        }
        return days;
    }

    public function GetMaintainCostAlert(): String {
        var textAlert: String = "";
        try {
            delete  panelData.content;
            var alertdays = getMaintainCostDays();
            var d = 0;
            var date: String[];
            var ddate: String[];
            var rs: ResultSet = DBConnection.getStatement().executeQuery("select * from  maintain_cost where cmonth=(SELECT cmonth FROM maintain_cost order by main_id desc limit 0,1) and cyear = '{curDate[2]}' and mc_flag_id = '0' and due_date between curdate() and DATE_ADD(curdate(),INTERVAL {alertdays} day)");
            rs.last();
            cnt = rs.getRow();
            rs.beforeFirst();
            while (rs.next()) {
                part[d] = rs.getString("particular");
                due[d] = DateUtils.normalFormatDate(rs.getString("due_date"));
                d++;
            }
            y = 0;
            var month;
            
            for (i in [0..<cnt]) {
                date = due[i].split("-");
                ddate[i] = date[0];
                if (Integer.parseInt(date[1]) == Integer.parseInt(curDate[1])) {
                    month = Integer.parseInt(curDate[1]);
                } else {
                    month = Integer.parseInt(date[1]);
                }
                textAlert = "{part[i]} - Due date is {ddate[i]}-{month}-{curDate[2]}";
                labelF = Label {
                            width: 240.0
                            height: 20.0
                            layoutX: 10.0
                            layoutY: (y * 20)
                            text: textAlert
                            font: Arial_12
                            textFill: DarkGray
                            hpos: javafx.geometry.HPos.CENTER
                        }
                insert labelF into panelData.content;
                y++;

            }
        } catch (e: Exception) {
            var msg = "Class : Maintanance Cost Alert Method : GetDefaultValues()= {e.getMessage()}";
            log.debug(msg);
        }
        if (y > 0) {
            fadePanel.rate = 1.0;
            fadePanel.play();
        } else {
            y = y - 5;
            fadePanel.rate = -1.0;
            fadePanel.play(); }
            return textAlert;
    }

    var PanelOpacity = 1.0;
    var fadePanel = Timeline {
                keyFrames: [
                    at (0s) {PanelOpacity => 0.0 tween Interpolator.LINEAR},
                    at (0.25s) {PanelOpacity => 0.75 tween Interpolator.LINEAR},
                    at (0.5s) {PanelOpacity => 1.0 tween Interpolator.LINEAR},
                ]
            };

    function rectHeaderOnMouseDragged(e: javafx.scene.input.MouseEvent): Void {
        panelLX = e.screenX - panelStartLX;
        panelLY = e.screenY - panelStartLY;
    }

    function rectHeaderOnMousePressed(e: javafx.scene.input.MouseEvent): Void {
        panelStartLX = e.screenX - panelLX;
        panelStartLY = e.screenY - panelLY;
    }

    def rectangle = Rectangle {
                styleClass: "form-background"
                width: 246.0
                height: bind y * 20
            }

    init {
        scrollView.node = Group { content: [rectangle, panelData] };
    }

}