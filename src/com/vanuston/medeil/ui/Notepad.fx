package com.vanuston.medeil.ui;

import java.lang.*;
import javafx.scene.layout.LayoutInfo;
import javafx.scene.image.Image;
import javax.swing.JFileChooser;
import  com.vanuston.medeil.util.TextFileFilter;
import  com.vanuston.medeil.util.ReadWriteTextFile;
import java.util.Calendar;
import javafx.scene.image.ImageView;
import com.vanuston.medeil.util.CommonDeclare;
import  com.vanuston.medeil.util.Logger;
import javafx.scene.input.KeyCode;

public class Notepad {

var log: Logger = Logger.getLogger(Notepad.class, "Tools");
var str:String;
var selectFile: String;
var selectFilePath: String;
var FileContent;
var Search;
var index;
var j=0;

 var ampm : Integer;
 var hrs:Integer;
 var min :Integer;
 var sec: Integer;
 var Hrs:String;
 var Min :String;
 var Sec: String;

var AMPM;
var strDays = ["Sunday","Monday","Tuesday","Wednesday","Thusday","Friday","Saturday"];
var strMonths=["January","February","March","April","May","June","July","August","September","October","November","December"];


    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def separator3: javafx.scene.control.Separator = javafx.scene.control.Separator {
    }
    
    public-read def separator4: javafx.scene.control.Separator = javafx.scene.control.Separator {
    }
    
    public-read def separator5: javafx.scene.control.Separator = javafx.scene.control.Separator {
    }
    
    public-read def separator7: javafx.scene.control.Separator = javafx.scene.control.Separator {
    }
    
    public-read def separator8: javafx.scene.control.Separator = javafx.scene.control.Separator {
    }
    
    public-read def separator9: javafx.scene.control.Separator = javafx.scene.control.Separator {
    }
    
    def __layoutInfo_txtsearch: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
        height: 20.0
    }
    public-read def txtsearch: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: true
        layoutX: bind SearchTextboxLX
        layoutY: 24.0
        layoutInfo: __layoutInfo_txtsearch
        onKeyPressed: txtsearchOnKeyPressed
        onKeyReleased: txtsearchOnKeyReleased
    }
    
    public-read def imageclose: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind imageCloseLX
        layoutY: 1.0
        onMouseClicked: imagecloseOnMouseClicked
    }
    
    public-read def panelMsgBox: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: 262.0
        layoutY: 111.92
    }
    
    public-read def rectangle2: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        styleClass: "DialogBox"
        width: 100.0
        height: 50.0
    }
    
    public-read def rectangle3: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 0.0
        layoutY: -1.0
        styleClass: "BottomTaskBar"
        width: 100.0
        height: 50.0
    }
    
    def __layoutInfo_label5: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 190.0
        layoutY: 12.0
        layoutInfo: __layoutInfo_label5
        text: "Label"
    }
    
    def __layoutInfo_button: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: 20.0
    }
    public-read def button: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 377.0
        layoutY: 55.0
        layoutInfo: __layoutInfo_button
        text: "Button"
    }
    
    def __layoutInfo_button2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: 20.0
    }
    public-read def button2: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 377.0
        layoutY: 90.0
        layoutInfo: __layoutInfo_button2
        text: "Button"
        action: button2Action
    }
    
    def __layoutInfo_button4: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: 20.0
    }
    public-read def button4: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 377.0
        layoutY: 157.0
        layoutInfo: __layoutInfo_button4
        text: "Button"
        action: button4Action
    }
    
    public-read def vbox: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        visible: false
        layoutX: 339.0
        layoutY: 49.0
        content: [ button, button2, button4, ]
        spacing: 6.0
    }
    
    def __layoutInfo_txtfind: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtfind: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 62.0
        layoutY: 55.0
        layoutInfo: __layoutInfo_txtfind
    }
    
    public-read def txtrep: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 97.0
        layoutY: 90.0
    }
    
    public-read def vbox2: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        visible: false
        layoutX: 100.0
        layoutY: 55.0
        content: [ txtfind, txtrep, ]
        spacing: 6.0
    }
    
    public-read def label6: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 16.0
        layoutY: 49.0
        text: "Label"
    }
    
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 16.0
        layoutY: 84.0
        text: "Label"
    }
    
    public-read def vbox3: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        visible: false
        layoutX: 95.0
        layoutY: 55.0
        content: [ label6, label7, ]
        spacing: 12.0
    }
    
    public-read def panelHomePage: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
    }
    
    public-read def Violet: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.011764706
        green: 0.5019608
        blue: 0.7607843
    }
    
    public-read def linearGradient: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        startX: 1.0
        startY: 0.0
        endX: 1.0
        endY: 1.0
        cycleMethod: javafx.scene.paint.CycleMethod.REFLECT
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#ffffff") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#e4f0f4") }, ]
    }
    
    public-read def rectTaskbar: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        cursor: null
        layoutX: 0.0
        layoutY: bind panelH-15
        styleClass: "rectFormHeader"
        fill: linearGradient
        width: bind panelW
        height: 15.0
    }
    
    def __layoutInfo_rectMenubar: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 1023.0
        height: 20.0
    }
    public-read def rectMenubar: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        layoutX: 0.0
        layoutY: 24.0
        layoutInfo: __layoutInfo_rectMenubar
        styleClass: "form-background"
        fill: linearGradient
        stroke: null
        width: bind panelW
        height: 20.0
    }
    
    public-read def rectTitleBg: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        opacity: 0.25
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "rectFormHeader"
        fill: linearGradient
        stroke: null
        width: bind panelW
        height: 25.0
        arcWidth: 0.0
        arcHeight: 0.0
    }
    
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 1.0
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "form-background"
        fill: linearGradient
        stroke: Violet
        width: bind panelW
        height: bind panelH
    }
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
    }
    
    def __layoutInfo_txtContent: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
        height: bind panelH-60
    }
    public-read def txtContent: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 1.0
        layoutY: 44.0
        layoutInfo: __layoutInfo_txtContent
        onMouseClicked: txtContentOnMouseClicked
        selectOnFocus: false
        font: Arial_12
        multiline: true
        lines: 50.0
    }
    
    public-read def textColorMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        text: "Text Color"
        font: Arial_12
    }
    
    public-read def fontMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        text: "Font"
        font: Arial_12
    }
    
    public-read def viewMenu: com.javafx.preview.control.Menu = com.javafx.preview.control.Menu {
        visible: false
        text: "View"
        font: Arial_12
        items: [ fontMenuItem, textColorMenuItem, ]
    }
    
    public-read def dateTimeMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        text: "Date /Time"
        font: Arial_12
        action: dateTimeMenuItemAction
    }
    
    public-read def replaceMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        text: "Replace"
        font: Arial_12
        action: replaceMenuItemAction
    }
    
    public-read def findMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        text: "Find"
        font: Arial_12
        action: findMenuItemAction
    }
    
    public-read def deleteMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        text: "Delete"
        font: Arial_12
        action: deleteMenuItemAction
    }
    
    public-read def selectAllMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        text: "Select All"
        font: Arial_12
        action: selectAllMenuItemAction
    }
    
    public-read def pasteMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        text: "Paste"
        font: Arial_12
        action: pasteMenuItemAction
    }
    
    public-read def copyMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        text: "Copy"
        font: Arial_12
        action: copyMenuItemAction
    }
    
    public-read def cutMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        text: "Cut"
        font: Arial_12
        action: cutMenuItemAction
    }
    
    public-read def editMenu: com.javafx.preview.control.Menu = com.javafx.preview.control.Menu {
        text: "Edit"
        font: Arial_12
        items: [ cutMenuItem, copyMenuItem, pasteMenuItem, separator7, selectAllMenuItem, deleteMenuItem, separator8, findMenuItem, replaceMenuItem, separator9, dateTimeMenuItem, ]
    }
    
    public-read def exitMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        text: "Exit"
        font: Arial_12
        action: exitMenuItemAction
    }
    
    public-read def printMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        text: "Print"
        font: Arial_12
    }
    
    public-read def printSetupMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        text: "Print Setup"
        font: Arial_12
    }
    
    public-read def saveAsMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        text: "Save As"
        font: Arial_12
        action: saveAsMenuItemAction
    }
    
    public-read def saveMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        text: "Save"
        font: Arial_12
        action: saveMenuItemAction
    }
    
    public-read def openMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        text: "Open"
        font: Arial_12
        action: openMenuItemAction
    }
    
    public-read def newMenuItem: com.javafx.preview.control.MenuItem = com.javafx.preview.control.MenuItem {
        text: "New"
        font: Arial_12
        action: newMenuItemAction
    }
    
    public-read def fileMenu: com.javafx.preview.control.Menu = com.javafx.preview.control.Menu {
        text: "File"
        font: Arial_12
        items: [ newMenuItem, separator3, openMenuItem, saveMenuItem, saveAsMenuItem, separator4, printSetupMenuItem, printMenuItem, separator5, exitMenuItem, ]
    }
    
    public-read def menuBar: com.javafx.preview.control.MenuBar = com.javafx.preview.control.MenuBar {
        layoutX: 10.0
        layoutY: 5.0
        menus: [ fileMenu, editMenu, viewMenu, ]
    }
    
    public-read def Arial_Bold_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
    }
    
    public-read def tooltip10: javafx.scene.control.Tooltip = javafx.scene.control.Tooltip {
        text: "Date and Time "
        font: Arial_Bold_12
    }
    
    public-read def tooltip9: javafx.scene.control.Tooltip = javafx.scene.control.Tooltip {
        text: "Delete "
        font: Arial_Bold_12
    }
    
    def __layoutInfo_textbox11: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 16.0
        height: 16.0
    }
    public-read def textbox11: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        opacity: 0.0
        layoutX: 172.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_textbox11
        blocksMouse: false
        tooltip: tooltip9
    }
    
    public-read def tooltip8: javafx.scene.control.Tooltip = javafx.scene.control.Tooltip {
        text: "Find"
        font: Arial_Bold_12
    }
    
    def __layoutInfo_textbox10: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 16.0
        height: 16.0
    }
    public-read def textbox10: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        opacity: 0.0
        layoutX: bind SearchTextboxLX+Type1TextboxW+1
        layoutY: 0.0
        layoutInfo: __layoutInfo_textbox10
        blocksMouse: false
        tooltip: tooltip8
    }
    
    public-read def tooltip7: javafx.scene.control.Tooltip = javafx.scene.control.Tooltip {
        text: "Select All "
        font: Arial_Bold_12
    }
    
    def __layoutInfo_textbox9: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 16.0
        height: 16.0
    }
    public-read def textbox9: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        opacity: 0.0
        layoutX: 154.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_textbox9
        blocksMouse: false
        tooltip: tooltip7
    }
    
    public-read def tooltip6: javafx.scene.control.Tooltip = javafx.scene.control.Tooltip {
        text: "Paste"
        font: Arial_Bold_12
    }
    
    def __layoutInfo_textbox8: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 16.0
        height: 16.0
    }
    public-read def textbox8: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        opacity: 0.0
        layoutX: 126.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_textbox8
        blocksMouse: false
        tooltip: tooltip6
    }
    
    public-read def tooltip5: javafx.scene.control.Tooltip = javafx.scene.control.Tooltip {
        text: "Copy "
        font: Arial_Bold_12
    }
    
    def __layoutInfo_textbox7: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 16.0
        height: 16.0
    }
    public-read def textbox7: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        opacity: 0.0
        layoutX: 108.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_textbox7
        blocksMouse: false
        tooltip: tooltip5
    }
    
    public-read def tooltip4: javafx.scene.control.Tooltip = javafx.scene.control.Tooltip {
        text: "Cut "
        font: Arial_Bold_12
    }
    
    def __layoutInfo_textbox6: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 16.0
        height: 16.0
    }
    public-read def textbox6: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        opacity: 0.0
        layoutX: 90.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_textbox6
        blocksMouse: false
        tooltip: tooltip4
    }
    
    public-read def tooltip3: javafx.scene.control.Tooltip = javafx.scene.control.Tooltip {
        text: "Save As "
        font: Arial_Bold_12
    }
    
    def __layoutInfo_textbox5: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 16.0
        height: 16.0
    }
    public-read def textbox5: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        disable: false
        opacity: 0.0
        layoutX: 64.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_textbox5
        blocksMouse: false
        tooltip: tooltip3
    }
    
    public-read def tooltip2: javafx.scene.control.Tooltip = javafx.scene.control.Tooltip {
        text: "Save "
        font: Arial_Bold_12
    }
    
    def __layoutInfo_textbox4: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 16.0
        height: 16.0
    }
    public-read def textbox4: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        opacity: 0.0
        layoutX: 46.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_textbox4
        blocksMouse: false
        tooltip: tooltip2
    }
    
    public-read def tooltip11: javafx.scene.control.Tooltip = javafx.scene.control.Tooltip {
        text: "Open "
        font: Arial_Bold_12
    }
    
    def __layoutInfo_textbox13: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 16.0
        height: 16.0
    }
    public-read def textbox13: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        opacity: 0.0
        layoutX: 28.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_textbox13
        blocksMouse: false
        tooltip: tooltip11
    }
    
    public-read def tooltip: javafx.scene.control.Tooltip = javafx.scene.control.Tooltip {
        text: "New "
        font: Arial_Bold_12
    }
    
    def __layoutInfo_textbox3: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 16.0
        height: 16.0
    }
    public-read def textbox3: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        opacity: 0.0
        layoutX: 10.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_textbox3
        blocksMouse: false
        tooltip: tooltip
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
    
    def __layoutInfo_textbox12: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 16.0
        height: 16.0
    }
    public-read def textbox12: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        opacity: 0.0
        layoutX: 198.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_textbox12
        blocksMouse: false
        effect: dropShadowEffect
        tooltip: tooltip10
    }
    
    public-read def lightingEffect: javafx.scene.effect.Lighting = javafx.scene.effect.Lighting {
    }
    
    def __layoutInfo_labelHeading: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
        height: 25.0
    }
    public-read def labelHeading: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_labelHeading
        effect: lightingEffect
        text: "Notepad  "
        font: Arial_Bold_16
        hpos: javafx.geometry.HPos.CENTER
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
    }
    
    public-read def Arial_11: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 11.0
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 930.0
        layoutY: 559.0
        text: "0"
        font: Arial_11
        textFill: DarkGray
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 890.0
        layoutY: 559.0
        text: "Words"
        font: Arial_11
        textFill: DarkGray
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 830.0
        layoutY: 559.0
        text: "0"
        font: Arial_11
        textFill: DarkGray
    }
    
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 795.0
        layoutY: 559.0
        text: "Lines"
        font: Arial_11
        textFill: DarkGray
    }
    
    public-read def imageClose: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Close.png"
    }
    
    public-read def imageCloseFindBox: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 477.0
        layoutY: -1.0
        onMouseClicked: imageCloseFindBoxOnMouseClicked
        image: imageClose
    }
    
    public-read def panelFindReplace: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: 281.0
        layoutY: 183.0
        content: [ rectangle2, rectangle3, label5, imageCloseFindBox, vbox, vbox2, vbox3, ]
    }
    
    public-read def imageNew2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/NewDoc.png"
    }
    
    public-read def imageNew: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        cursor: null
        layoutX: 10.0
        layoutY: 0.0
        onMouseClicked: imageNewOnMouseClicked
        onMouseEntered: imageNewOnMouseEntered
        onMouseExited: imageNewOnMouseExited
        image: imageNew2
        fitWidth: 0.0
    }
    
    public-read def imgopen: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/FolderOpen.png"
    }
    
    public-read def imageopen: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 28.0
        layoutY: 0.0
        onKeyReleased: imageopenOnKeyReleased
        onMouseClicked: imageopenOnMouseClicked
        onMouseEntered: imageopenOnMouseEntered
        onMouseExited: imageopenOnMouseExited
        image: imgopen
    }
    
    public-read def imgSave: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Save.png"
    }
    
    public-read def imageSave: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 46.0
        layoutY: 0.0
        onMouseClicked: imageSaveOnMouseClicked
        onMouseEntered: imageSaveOnMouseEntered
        onMouseExited: imageSaveOnMouseExited
        image: imgSave
    }
    
    public-read def imgSaveAs: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/SaveAs.png"
    }
    
    public-read def imageSaveAs: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 64.0
        layoutY: 0.0
        onMouseClicked: imageSaveAsOnMouseClicked
        onMouseEntered: imageSaveAsOnMouseEntered
        onMouseExited: imageSaveAsOnMouseExited
        image: imgSaveAs
    }
    
    public-read def imgCut: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Cut.png"
    }
    
    public-read def imageCut: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 90.0
        layoutY: 0.0
        onKeyReleased: imageCutOnKeyReleased
        onMouseClicked: imageCutOnMouseClicked
        onMouseEntered: imageCutOnMouseEntered
        onMouseExited: imageCutOnMouseExited
        image: imgCut
    }
    
    public-read def imgCopy: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Copy.png"
    }
    
    public-read def imageCopy: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 108.0
        layoutY: 0.0
        onKeyReleased: imageCopyOnKeyReleased
        onMouseClicked: imageCopyOnMouseClicked
        onMouseEntered: imageCopyOnMouseEntered
        onMouseExited: imageCopyOnMouseExited
        image: imgCopy
    }
    
    public-read def imgPaste: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Paste.png"
    }
    
    public-read def imagePaste: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 126.0
        layoutY: 0.0
        onKeyReleased: imagePasteOnKeyReleased
        onMouseClicked: imagePasteOnMouseClicked
        onMouseEntered: imagePasteOnMouseEntered
        onMouseExited: imagePasteOnMouseExited
        image: imgPaste
    }
    
    public-read def imgSelectall: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/SelectAll.png"
    }
    
    public-read def imageSelectAll: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 154.0
        layoutY: 0.0
        onKeyReleased: imageSelectAllOnKeyReleased
        onMouseClicked: imageSelectAllOnMouseClicked
        onMouseEntered: imageSelectAllOnMouseEntered
        onMouseExited: imageSelectAllOnMouseExited
        image: imgSelectall
    }
    
    public-read def imgDelete: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Delete.png"
    }
    
    public-read def imageDelete: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 172.0
        layoutY: 0.0
        onMouseEntered: imageDeleteOnMouseEntered
        onMouseExited: imageDeleteOnMouseExited
        image: imgDelete
    }
    
    public-read def imgDate: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/DateTime.png"
    }
    
    public-read def imageDateTime: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: 198.0
        layoutY: 0.0
        onMouseClicked: imageDateTimeOnMouseClicked
        onMouseEntered: imageDateTimeOnMouseEntered
        onMouseExited: imageDateTimeOnMouseExited
        effect: null
        image: imgDate
    }
    
    public-read def imageFindNext: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/FindNext.png"
    }
    
    public-read def imageFind: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind SearchTextboxLX+Type1TextboxW+1
        layoutY: 0.0
        onMouseClicked: imageFindOnMouseClicked
        onMouseEntered: imageFindOnMouseEntered
        onMouseExited: imageFindOnMouseExited
        image: imageFindNext
    }
    
    public-read def panelToolbar: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutY: 27.0
        content: [ imageNew, textbox3, imageopen, textbox13, imageSave, textbox4, imageSaveAs, textbox5, imageCut, textbox6, imageCopy, textbox7, imagePaste, textbox8, imageSelectAll, textbox9, imageFind, textbox10, imageDelete, textbox11, imageDateTime, textbox12, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        content: [ rectangle, rectTitleBg, menuBar, labelHeading, rectMenubar, rectTaskbar, txtContent, txtsearch, panelToolbar, imageclose, label, label2, label3, label4, panelMsgBox, panelFindReplace, ]
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "Shown", "ShownDialog", ]
        actual: 0
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectTaskbar.opacity = 0.25;
                            txtsearch.font = Arial_12;
                            imageDateTime.onMouseEntered = imageDateTimeOnMouseEnteredAtShown;
                            rectangle2.visible = true;
                            rectangle2.fill = linearGradient;
                            rectangle2.stroke = Violet;
                            rectangle2.strokeWidth = 3.0;
                            rectangle2.width = 500.0;
                            rectangle2.height = 200.0;
                            rectangle2.arcWidth = 0.0;
                            rectangle2.arcHeight = 0.0;
                            rectangle3.visible = false;
                            rectangle3.opacity = 1.0;
                            rectangle3.managed = true;
                            rectangle3.layoutX = 0.0;
                            rectangle3.layoutY = -1.0;
                            rectangle3.fill = javafx.scene.paint.Color.BLACK;
                            rectangle3.width = 100.0;
                            rectangle3.height = 50.0;
                            rectangle3.arcWidth = 0.0;
                            rectangle3.arcHeight = 0.0;
                            label5.visible = true;
                            label5.layoutX = 0.0;
                            label5.layoutY = 5.0;
                            __layoutInfo_label5.width = 500.0;
                            label5.text = "Find / Replace";
                            label5.font = Arial_Bold_18;
                            label5.hpos = javafx.geometry.HPos.CENTER;
                            label5.textFill = javafx.scene.paint.Color.BLACK;
                            imageCloseFindBox.visible = true;
                            imageCloseFindBox.layoutX = 484.0;
                            imageCloseFindBox.layoutY = 0.0;
                            button.visible = false;
                            button.text = "Button";
                            button2.visible = false;
                            button2.text = "Button";
                            button4.visible = true;
                            button4.text = "Button";
                            vbox.visible = true;
                            txtfind.visible = false;
                            txtfind.opacity = 1.0;
                            txtfind.layoutX = 62.0;
                            txtfind.layoutY = 55.0;
                            txtrep.visible = false;
                            vbox2.visible = false;
                            label6.visible = false;
                            label6.text = "Label";
                            label6.textFill = javafx.scene.paint.Color.BLACK;
                            label7.visible = false;
                            label7.text = "Label";
                            label7.textFill = javafx.scene.paint.Color.BLACK;
                            vbox3.visible = false;
                            vbox3.layoutX = 95.0;
                            panelFindReplace.visible = false;
                            panelFindReplace.layoutX = 262.0;
                            panelFindReplace.layoutY = 112.0;
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
                            rectTaskbar.opacity = 1.0;
                            imageDateTime.onMouseEntered = imageDateTimeOnMouseEntered;
                            rectangle2.visible = true;
                            rectangle2.fill = linearGradient;
                            rectangle2.stroke = DarkGray;
                            rectangle2.strokeWidth = 3.0;
                            rectangle2.width = 500.0;
                            rectangle2.height = 160.0;
                            rectangle2.arcWidth = 10.0;
                            rectangle2.arcHeight = 10.0;
                            rectangle3.visible = true;
                            rectangle3.opacity = 1.0;
                            rectangle3.managed = true;
                            rectangle3.layoutX = 0.0;
                            rectangle3.layoutY = 0.0;
                            rectangle3.fill = DarkGray;
                            rectangle3.width = 498.0;
                            rectangle3.height = 25.0;
                            rectangle3.arcWidth = 5.0;
                            rectangle3.arcHeight = 5.0;
                            label5.visible = true;
                            label5.layoutX = 0.0;
                            label5.layoutY = 0.0;
                            __layoutInfo_label5.width = 500.0;
                            __layoutInfo_label5.height = 25.0;
                            label5.text = "Find / Replace";
                            label5.font = Arial_Bold_16;
                            label5.hpos = javafx.geometry.HPos.CENTER;
                            label5.textFill = javafx.scene.paint.Color.WHITE;
                            imageCloseFindBox.visible = true;
                            imageCloseFindBox.layoutX = 475.0;
                            imageCloseFindBox.layoutY = 0.0;
                            button.visible = true;
                            __layoutInfo_button.width = 90.0;
                            button.text = "Find Next";
                            button.font = Arial_12;
                            button.action = buttonActionAtShownDialog;
                            button2.visible = true;
                            __layoutInfo_button2.width = 90.0;
                            button2.text = "Replace";
                            button2.font = Arial_12;
                            button4.visible = true;
                            __layoutInfo_button4.width = 90.0;
                            button4.text = "Cancel";
                            button4.font = Arial_12;
                            vbox.visible = true;
                            txtfind.visible = true;
                            txtfind.opacity = 1.0;
                            txtfind.layoutX = 0.0;
                            txtfind.layoutY = 55.0;
                            __layoutInfo_txtfind.width = 195.0;
                            txtfind.font = Arial_12;
                            txtrep.visible = true;
                            txtrep.font = Arial_12;
                            vbox2.visible = true;
                            label6.visible = true;
                            label6.text = "Find what";
                            label6.font = Arial_12;
                            label6.textFill = DarkGray;
                            label7.visible = true;
                            label7.text = "Replace with";
                            label7.font = Arial_12;
                            label7.textFill = DarkGray;
                            vbox3.visible = true;
                            vbox3.layoutX = 20.0;
                            panelFindReplace.visible = true;
                            panelFindReplace.layoutX = 262.0;
                            panelFindReplace.layoutY = 112.0;
                            panel.visible = true;
                        }
                    }
                ]
            }
        ]
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel, panelHomePage, ]
    }
    // </editor-fold>//GEN-END:main

    function button3Action(): Void {
           }

    function button4Action(): Void {
        currentState.actual = currentState.findIndex("Shown");
        txtfind.text="";
        txtrep.text="";
         }

    function button2Action(): Void {
          txtContent.replaceSelection(txtrep.rawText);
         }

    function buttonActionAtShownDialog(): Void {
        txtContent.positionCaret(j);
        TextSearch(j,txtfind.rawText);
         }

var panelW=bind CommonDeclare.ScreenWidth-4;
var panelH=bind CommonDeclare.panelFormH;

var C1LX=bind CommonDeclare.Column11LX;
var C2LX=bind CommonDeclare.Column12LX;
var C3LX=bind CommonDeclare.Column13LX;
var C4LX=bind CommonDeclare.Column14LX;

var botton1LX=bind CommonDeclare.botton22LX;
var botton2LX=bind CommonDeclare.botton23LX;

var bottonW=bind CommonDeclare.bottonW;

var bottonH=bind CommonDeclare.bottonH;
var panelButtonsLY=bind CommonDeclare.panelButtonsLY;

var seperatorW=bind CommonDeclare.seperatorFullScreenW;
var imageCloseLX=bind panelW-16;

var bottonImageW=bind CommonDeclare.bottonImageW;
var bottonImageH=bind CommonDeclare.bottonImageH;

var Type1TextboxW=bind CommonDeclare.Type1TextboxW;
var Type2TextboxW=bind CommonDeclare.Type2TextboxW;
var Type3TextboxW=bind CommonDeclare.Type3TextboxW;

var optEditUser=bind (panelW-100)/2;
var optAddUser=bind optEditUser-100;
var optRemoveUser=bind optEditUser+100;

var panelPrivilageLX=bind panelW*9.765625/100;
var privilageBGW=bind panelW*58.6914062/100;
var hboxLX=bind (panelW-600)/2;

var SearchTextboxLX=bind panelW*70.171875/100;


    function dateTimeMenuItemAction(): Void {
        DTime();
         }

    function txtContentOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
               j=txtContent.dot;
         }

    function txtsearchOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if(event.code==KeyCode.VK_ENTER){
        TextSearch(0,txtsearch.rawText);
         }}

    function txtsearchOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if(event.code==KeyCode.VK_ENTER){
        TextSearch(0,txtsearch.rawText);
        }
         }
                
        public function TextSearch(start:Integer,text:String):Void{
        FileContent=txtContent.text;
        Search=text.trim();
        var Slen=Search.length();
        index=FileContent.indexOf(Search,start);
        if(index>0)txtContent.selectRange(index, index+Slen);
        j=index+1;
        txtContent.requestFocus();

         }
    function imageFindOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        Zoom(imageFind);
         }
    function imageFindOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        Zoom(imageFind);
         }
    function imageFindOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        txtContent.positionCaret(j);
        TextSearch(j,txtsearch.rawText);
         }
    function imageDateTimeOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        Zoom(imageDateTime);
         }

    function imageSelectAllOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        Zoom(imageSelectAll);
         }
    function imageSelectAllOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        Zoom(imageSelectAll);
         }
    function imagePasteOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        Zoom(imagePaste);
         }
    function imagePasteOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        Zoom(imagePaste);
         }
    function imageCopyOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        Zoom(imageCopy);
         }
    function imageCopyOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        Zoom(imageCopy);
         }
    function imageCutOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        Zoom(imageCut);
         }
    function imageCutOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        Zoom(imageCut);
         }
    function imageSaveAsOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        Zoom(imageSaveAs);
         }
    function imageSaveAsOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        Zoom(imageSaveAs);
         }
    function imageSaveOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        Zoom(imageSave);
         }
    function imageSaveOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        Zoom(imageSave);
         }
    function imageopenOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        Zoom(imageopen);
         }
    function imageopenOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        Zoom(imageopen);
         }
    function imageNewOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        Zoom(imageNew);
         }
    function imageNewOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        Zoom(imageNew);
         }
    function imageDeleteOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        Zoom(imageDelete);
         }
    function imageDeleteOnMouseEntered(event: javafx.scene.input.MouseEvent): Void {
        Zoom(imageDelete);
         }
    function imageDateTimeOnMouseEnteredAtShown(event: javafx.scene.input.MouseEvent): Void {
         Zoom(imageDateTime);
         }
    function imageDateTimeOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
         Zoom(imageDateTime);
         }
    function imageDateTimeOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
       DTime();
         }
    function replaceMenuItemAction(): Void {
        currentState.actual = currentState.findIndex("ShownDialog");
         }

    function findMenuItemAction(): Void {
        currentState.actual = currentState.findIndex("ShownDialog");
         }
    function imageCloseFindBoxOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        currentState.actual = currentState.findIndex("Shown");
         }
    function imageSelectAllOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
       SelectAll();
         }
    function imageSelectAllOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        SelectAll();
         }
    function imagePasteOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
       Paste();
         }
    function imagePasteOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
       Paste();
         }
    function pasteMenuItemAction(): Void {
        Paste();
         }
    function copyMenuItemAction(): Void {
        Copy();
         }
    function imageCopyOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
       Copy();
         }
    function imageCopyOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        Copy();
         }
    function imageCutOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
       Cut();
         }
    function imageCutOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        Cut();
         }
    function cutMenuItemAction(): Void {
        Cut();
         }
    function deleteMenuItemAction(): Void {
         }
    function selectAllMenuItemAction(): Void {
        SelectAll();
         }
    function exitMenuItemAction(): Void {
        Exit();
         }
    function saveAsMenuItemAction(): Void {
       SaveAs();
         }
    function imageSaveAsOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
       SaveAs();
         }
    function imageSaveOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        Save();
         }
    function saveMenuItemAction(): Void {
        Save();
         }

    function imageopenOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        Open();
         }
    function imageopenOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        Open();
         }
    function openMenuItemAction(): Void {
       Open();
         }

    function newMenuItemAction(): Void {
      New();
         }
    function imageNewOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
       New();
          }
public function New():Void{
    str="New";
    Msgbox("Confirm","Do you want to save the current document?");
}

public function Open()          {

try {
    var fc = new JFileChooser();
    var Textfilter = new TextFileFilter();

    fc.addChoosableFileFilter(Textfilter);
    fc.setAcceptAllFileFilterUsed(false);
    if (fc.showDialog(null, "Open") == JFileChooser.APPROVE_OPTION) {
        selectFile = fc.getSelectedFile().getName();
        selectFilePath = fc.getSelectedFile().getAbsolutePath();
         }
    labelHeading.text = "Notepad  {selectFile}";
    var Readfile = new ReadWriteTextFile();
    FileContent = Readfile.ReadFile(fc.getSelectedFile());
    txtContent.text = FileContent;
     } catch (e: Exception) {
var msg: String = "Class : Notepad Method : Open()   = {e.getMessage()}";
  log.debug(msg);
     }

}
public function Save():Void{

try {
    var fc = new JFileChooser();
    var Textfilter = new TextFileFilter();

    fc.addChoosableFileFilter(Textfilter);
    fc.setAcceptAllFileFilterUsed(false);
    if (fc.showDialog(null, "Save") == JFileChooser.APPROVE_OPTION) {
        selectFile = fc.getSelectedFile().getName();
        selectFilePath = fc.getSelectedFile().getAbsolutePath();
         }
    labelHeading.text = "Notepad  {selectFile}";
    FileContent = txtContent.text;
    var Write = new ReadWriteTextFile();
    Write.WriteFile(fc.getSelectedFile(), FileContent);
     } catch (e: Exception) {
         var msg: String = "Class : Notepad Method : Save()   = {e.getMessage()}";
  log.debug(msg);
     }

           
}
public function SaveAs(){

try {
    var fc = new JFileChooser();
    var Textfilter = new TextFileFilter();

    fc.addChoosableFileFilter(Textfilter);
    fc.setAcceptAllFileFilterUsed(false);
    if (fc.showDialog(null, "Save As") == JFileChooser.APPROVE_OPTION) {
        selectFile = fc.getSelectedFile().getName();
        selectFilePath = fc.getSelectedFile().getAbsolutePath();
         }
    labelHeading.text = "Notepad  {selectFile}";
    FileContent = txtContent.text;
    var Write = new ReadWriteTextFile();
    Write.WriteFile(fc.getSelectedFile(), FileContent);
     } catch (e: Exception) {
var msg: String = "Class : Notepad Method : SaveAs()   = {e.getMessage()}";
  log.debug(msg);
     }


}

public function Exit(){
      str="Exit";
    Msgbox("Confirm","Do you want to exit Notepad ?");
}
public function Cut(){
txtContent.requestFocus();
txtContent.cut();
}
public function Paste(){
txtContent.requestFocus();
txtContent.paste();
}
public function Copy(){
txtContent.requestFocus();
txtContent.copy();
}
public function SelectAll(){
txtContent.requestFocus();
txtContent.selectAll();
}
public function DTime(){
 def calendar = Calendar.getInstance();
 hrs=calendar.get(Calendar.HOUR);
 min=calendar.get(Calendar.MINUTE);
 sec=calendar.get(Calendar.SECOND);
ampm= calendar.get(Calendar.AM_PM);
Hrs = "{hrs}";
Min = "{min}";
Sec = "{sec}";
if (ampm==0) {
AMPM= "AM";}
else
AMPM = "PM";
if(hrs==0)
Hrs = "12";
if(hrs<10 and hrs!=0)
Hrs = "0{hrs}";
if(min<10)
Min = "0{min}";
if(sec<10)
Sec = "0{sec}";
txtContent.text="{txtContent.rawText.trim()}  {calendar.get(Calendar.DATE)}-{strMonths[calendar.get(Calendar.MONTH)]}-{calendar.get(Calendar.YEAR)} "  "{strDays[calendar.get(Calendar.DAY_OF_WEEK)-1]}"     "{Hrs} :{Min}:{Sec}"  "{AMPM}" ;
txtContent.requestFocus();
}


public function Zoom(img:ImageView):Void{
    if(img.scaleX==1.0 and img.scaleY==1.0){
    img.scaleX=1.1;
    img.scaleY==1.1;
    img.effect=dropShadowEffect;
    }
    else
    {
        img.effect=null;
        img.scaleX=1.0;
        img.scaleY==1.0
    }
}

public function Msgbox(type:String,Message:String){
    panelMsgBox.visible=true;
    def MessageBox=MessageBox{};
    MessageBox.MsgBox("Notepad",type,Message);
    insert MessageBox.getDesignRootNodes() into panelMsgBox.content;

}

var np=0 on replace{
  if(np!=0){
    CloseNotepad();
    delete panel.content;

    }
}
public function MsgValue(val:Integer)
{

  if(val==1 and str.equals("New"))
  {
   Save();
   txtContent.text=FileContent;
  }
  if(val==0 and str.equals("New"))
  {  
    txtContent.text="";
  }
    if(val==1 and str.equals("Exit"))
  {
      np=1;
   
  }
 }

public function CloseNotepad():Void{
    np=0;
    txtContent.text="";
            panel.visible=false;
            panelHomePage.visible=true;
            }

  function imagecloseOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
CloseNotepad();
         }

init{
    panelMsgBox.visible=false;
    panelHomePage.visible=false;
}

}
