package com.vanuston.medeil.ui;
import java.util.Calendar;
import org.netbeans.javafx.design.DesignState;
import javafx.scene.layout.LayoutInfo;
import javafx.scene.layout.HBox;
import javafx.scene.layout.Panel;
import javafx.scene.control.Label;
import javafx.scene.Node;
import javafx.scene.text.Font;
import javafx.scene.paint.Color;
import javafx.animation.Interpolator;
import javafx.animation.Timeline;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.lang.Thread;

public class Date{
var strDays = ["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"];
var strMonths=["Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"];

    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def imageView2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        y: 0.0
        fitWidth: 5.0
        fitHeight: 5.0
    }
    
    public-read def panelCalender: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: -125.0
        layoutY: 40.0
    }
    
    public-read def DarkGray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.2
        blue: 0.2
    }
    
    public-read def Arial_Bold_25: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold "
        size: 20.0
    }
    
    public-read def lblYear: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 6.0
        layoutY: 59.0
        text: bind year
        font: Arial_Bold_25
        textFill: DarkGray
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "-"
        font: Arial_Bold_25
        textFill: DarkGray
    }
    
    public-read def lblMonth: javafx.scene.control.Label = javafx.scene.control.Label {
        text: bind month
        font: Arial_Bold_25
    }
    
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        text: "-"
        font: Arial_Bold_25
        textFill: DarkGray
    }
    
    public-read def lblDate: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 54.0
        layoutY: 72.0
        text: bind date
        font: Arial_Bold_25
        textFill: DarkGray
    }
    
    public-read def hbox: javafx.scene.layout.HBox = javafx.scene.layout.HBox {
        visible: true
        layoutX: 2.0
        content: [ lblDate, label, lblMonth, label2, lblYear, ]
        spacing: 0.0
    }
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 12.0
    }
    
    def __layoutInfo_lblDay: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 150.0
    }
    public-read def lblDay: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 22.0
        layoutInfo: __layoutInfo_lblDay
        text: bind day
        font: Arial_12
        hpos: javafx.geometry.HPos.CENTER
        textFill: DarkGray
    }
    
    public-read def imageplus: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/plus.png"
    }
    
    public-read def imagesubtract: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/subtract.png"
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: true
        opacity: bind Opac
        layoutX: 0.0
        layoutY: 150.0
        onMouseClicked: imageViewOnMouseClicked
        onMouseEntered: imageViewOnMouseEntered
        onMouseExited: imageViewOnMouseExited
        image: imagesubtract
        fitWidth: 12.0
        fitHeight: 12.0
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/reload.png"
    }
    
    public-read def imageCalender: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Calender.png"
    }
    
    public-read def imgCalender: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        opacity: bind OpacCalender
        layoutX: 326.0
        layoutY: 32.0
        onMouseClicked: imgCalenderOnMouseClicked
        onMouseEntered: imgCalenderOnMouseEntered
        onMouseExited: imgCalenderOnMouseExited
        image: imageCalender
        fitWidth: 12.0
        fitHeight: 12.0
    }
    
    public-read def vbox: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        layoutX: 0.0
        layoutY: 10.0
        content: [ imageView2, imageView, imgCalender, ]
        spacing: 1.0
    }
    
    public-read def hbox2: javafx.scene.layout.HBox = javafx.scene.layout.HBox {
        content: [ hbox, vbox, ]
        spacing: 0.0
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        focusTraversable: false
        content: [ lblDay, hbox2, panelCalender, ]
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel, ]
    }
    // </editor-fold>//GEN-END:main

var day:String;
var date:String;
var month:String;
var year:String;
var Opac=0.2;
var OpacCalender=0.2;
    function imageViewOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        fadeImage.rate = -1.0;
        fadeImage.play();
         }
    function imageViewOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        fadeImage.rate = 1.0;
        fadeImage.play();
         }
    function imageViewOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
       if(hbox.visible==true){
           imageView.image=imageplus;
           lblDay.visible=false;
           hbox.visible=false;
       }else{
           imageView.image=imagesubtract;
           lblDay.visible=true;
           hbox.visible=true;
         }}
    function imgCalenderOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        fadeCalender.rate = -1.0;
        fadeCalender.play();
         }
    function imgCalenderOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        fadeCalender.rate = 1.0;
        fadeCalender.play();
         }
    function imgCalenderOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        def CalendarFx=CalendarFx{};
        CalendarFx.Show();
        delete panelCalender.content;
        insert CalendarFx.getDesignRootNodes() into panelCalender.content;

    }
    var fadeImage = Timeline {
                keyFrames: [
                    at (0s) {Opac => 0.2 tween Interpolator.LINEAR},
                    at (0.1s) {Opac => 1.0 tween Interpolator.LINEAR},
                ]
            };
    var fadeCalender = Timeline {
                keyFrames: [
                    at (0s) {OpacCalender => 0.2 tween Interpolator.LINEAR},
                    at (0.1s) {OpacCalender => 1.0 tween Interpolator.LINEAR},
                ]
            };

var dateFormat: DateFormat  ;


public function Startup():Void {
        def calendar = Calendar.getInstance();
        day="{strDays[calendar.get(Calendar.DAY_OF_WEEK)-1]}";
        month="{strMonths[calendar.get(Calendar.MONTH)]}";
        date="{calendar.get(Calendar.DATE)}";
        year="{calendar.get(calendar.YEAR)}";
//        var now : java.util.Calendar = java.util.Calendar.getInstance();
//        var dateFormat = new SimpleDateFormat("HH:mm:ss");
//        var Arial_Bold_12: javafx.scene.text.Font = javafx.scene.text.Font {
//            name: "Arial Bold"
//            size: 12.0
//            oblique: false
//            embolden: false
//            autoKern: false
//            ligatures: false
//            position: javafx.scene.text.FontPosition.REGULAR
//        }
//        var lblTime = Label {
//                            layoutY: 22.0
//                            layoutX: 60.0
//                            width: 25.0
//                            height: 25.0
//                            text: bind dateFormat.format(now.getTime())
//                            textFill: DarkGray
//                            font : Arial_Bold_12
//                            hpos: javafx.geometry.HPos.CENTER
//                            vpos: javafx.geometry.VPos.CENTER
//                            visible: true;
//                        }
////        var tijd: javafx.scene.control.Label = new javafx.scene.control.Label(dateFormat.format(now.getTime()));
//
//        panel.content = [lblDay, hbox2, panelCalender,lblTime];

      

}

}
