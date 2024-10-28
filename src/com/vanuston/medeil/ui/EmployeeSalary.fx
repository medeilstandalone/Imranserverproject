package com.vanuston.medeil.ui;


import javafx.scene.input.*;
import javafx.scene.image.Image;
import java.sql.Date;

import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import java.text.SimpleDateFormat;
import com.vanuston.medeil.uitables.EmployeeSalaryTable ;
import javafx.ext.swing.SwingComponent ;
import java.awt.Dimension ;
import javafx.scene.control.TextBox;
import com.vanuston.medeil.model.EmployeeSalaryModel;
import com.vanuston.medeil.model.EmployeeModel;
import com.vanuston.medeil.model.DailyCashBookModel;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.implementation.Employee;
import com.vanuston.medeil.util.Validation;
import com.vanuston.medeil.util.Value;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.KeyRegistry;
import com.vanuston.medeil.uitables.ConfirmDialogBox;
import com.vanuston.medeil.ui.calendar.theme.Theme;
import java.lang.Exception;
import java.lang.Class;

public class EmployeeSalary {

    var employeeSalaryController : com.vanuston.medeil.implementation.EmployeeSalary ;//= RegistryFactory.getClientStub(RegistryConstants.EmployeeSalary) as com.vanuston.medeil.implementation.EmployeeSalary ;
    var commonController : CommonImplements ;//= RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;

    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    def __layoutInfo_separator: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
        height: 0.0
    }
    public-read def separator: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: 30.0
        layoutY: 115.0
        layoutInfo: __layoutInfo_separator
    }
    
    public-read def imageView2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imageView3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imageView4: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imageView5: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
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
        layoutY: 258.0
        layoutInfo: __layoutInfo_separator2
    }
    
    def __layoutInfo_listEmployee2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listEmployee2: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: 150.0
        layoutY: 448.0
        layoutInfo: __layoutInfo_listEmployee2
        items: null
    }
    
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX
        layoutY: 294.0
        text: "Label"
    }
    
    def __layoutInfo_txtEmpGender: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtEmpGender: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 124.0
        layoutInfo: __layoutInfo_txtEmpGender
        editable: false
    }
    
    def __layoutInfo_txtPayDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtPayDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX
        layoutY: 300.0
        layoutInfo: __layoutInfo_txtPayDate
        editable: false
    }
    
    def __layoutInfo_txtYear: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtYear: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX+Type5TextboxW+10
        layoutY: 158.0
        layoutInfo: __layoutInfo_txtYear
    }
    
    def __layoutInfo_txtMonth: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type5TextboxW
    }
    public-read def txtMonth: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX
        layoutY: 158.0
        layoutInfo: __layoutInfo_txtMonth
    }
    
    def __layoutInfo_txtEmpRec: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtEmpRec: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind SearchTextboxLX
        layoutY: 138.0
        layoutInfo: __layoutInfo_txtEmpRec
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind ImageCalenderLX
        layoutY: 309.0
        blocksMouse: true
        focusTraversable: true
    }
    
    def __layoutInfo_listEmployee: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listEmployee: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C2LX
        layoutY: 152.0
        layoutInfo: __layoutInfo_listEmployee
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    def __layoutInfo_label8: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def label8: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX
        layoutY: 164.0
        layoutInfo: __layoutInfo_label8
        text: "Label"
    }
    
    public-read def panelTable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelTableLX
        layoutY: bind panelTableLY
    }
    
    public-read def rectTableBorder: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind panelTableLX
        layoutY: bind panelTableLY
        styleClass: "rectTableBorder"
        width: bind TableW
        height: bind TableH
    }
    
    public-read def imageView7: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnEmpView: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnEmpView: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton23LX+25
        layoutY: bind panelButtonsLY
        layoutInfo: __layoutInfo_btnEmpView
        onKeyReleased: btnEmpViewOnKeyReleased
        graphic: imageView7
        text: "Button"
    }
    
    public-read def imageView9: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_buttonEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def buttonEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton22LX+25
        layoutY: bind panelButtonsLY
        layoutInfo: __layoutInfo_buttonEdit
        graphic: imageView9
        text: "Edit [F6]"
        action: buttonEditActionAtViewAll
    }
    
    public-read def imageView6: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnEmpBack: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW+50
        height: bind bottonH
    }
    public-read def btnEmpBack: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton21LX-25
        layoutY: bind panelButtonsLY
        layoutInfo: __layoutInfo_btnEmpBack
        graphic: imageView6
        text: "Button"
    }
    
    public-read def imageView8: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
    }
    
    def __layoutInfo_btnEmpSearch: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnEmpSearch: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind buttonSearchLX
        layoutY: 247.0
        layoutInfo: __layoutInfo_btnEmpSearch
        graphic: imageView8
        text: "Button"
    }
    
    public-read def label18: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutY: bind panelButtonsLY-25
        text: "Label"
    }
    
    def __layoutInfo_rectViewSal: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def rectViewSal: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind rectbutton2LX
        layoutY: bind rectbuttonLY
        layoutInfo: __layoutInfo_rectViewSal
        width: 100.0
        height: 50.0
    }
    
    def __layoutInfo_label13: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def label13: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind rectbutton2LX
        layoutY: bind rectbuttonLY
        layoutInfo: __layoutInfo_label13
        text: "Label"
    }
    
    public-read def label17: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 110.0
        layoutY: 506.0
        text: "Label"
    }
    
    public-read def label19: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind labelSearchLX
        layoutY: 196.0
        text: "Label"
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
    }
    
    public-read def empPanel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutX: bind panelCalenderLX
        layoutY: 146.0
        blocksMouse: true
        focusTraversable: true
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
    
    def __layoutInfo_txtEmpSalToPay: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtEmpSalToPay: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 329.0
        layoutInfo: __layoutInfo_txtEmpSalToPay
        promptText: "0.00"
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtEmpName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
        hfill: false
    }
    public-read def txtEmpName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 158.0
        layoutInfo: __layoutInfo_txtEmpName
        style: ""
        styleClass: "text-box"
        onKeyPressed: txtEmpNameOnKeyPressedAtShown
        onKeyReleased: txtEmpNameOnKeyReleasedAtShown
        effect: null
        text: ""
        font: Arial_12
    }
    
    def __layoutInfo_txtEmpFixed_Sal: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtEmpFixed_Sal: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 273.0
        layoutInfo: __layoutInfo_txtEmpFixed_Sal
        promptText: "0.00"
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtEmpDetails: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind DetailsTextLW
        height: 73.0
    }
    public-read def txtEmpDetails: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        managed: true
        layoutX: bind C2LX
        layoutY: 357.0
        layoutInfo: __layoutInfo_txtEmpDetails
        font: Arial_12
    }
    
    def __layoutInfo_txtEmpAdvAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtEmpAdvAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 301.0
        layoutInfo: __layoutInfo_txtEmpAdvAmt
        promptText: "0.00"
        font: Arial_12
    }
    
    def __layoutInfo_txtEmpAge: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type5TextboxW
    }
    public-read def txtEmpAge: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 158.0
        layoutInfo: __layoutInfo_txtEmpAge
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtEmpCode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtEmpCode: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 130.0
        layoutInfo: __layoutInfo_txtEmpCode
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
    
    def __layoutInfo_btnEmpCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW+50
        height: bind bottonH
    }
    public-read def btnEmpCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton4LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnEmpCancel
        effect: reflectionEffect
        graphic: imageView5
        text: "Cancel [F8]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnEmpReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnEmpReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton3LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnEmpReset
        effect: reflectionEffect
        graphic: imageView4
        text: "Reset [F4]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnEmpEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnEmpEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: true
        layoutX: bind botton2LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnEmpEdit
        effect: reflectionEffect
        graphic: imageView3
        text: bind btnEmpEditText
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
        action: btnEmpEditActionAtShown
    }
    
    def __layoutInfo_btnEmpSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnEmpSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnEmpSave
        translateX: 0.0
        effect: reflectionEffect
        graphic: imageView2
        text: bind btnEmpSaveText
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    public-read def panelButtons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        managed: false
        layoutY: bind panelButtonsLY
        content: [ btnEmpSave, btnEmpEdit, btnEmpReset, btnEmpCancel, ]
    }
    
    public-read def toggleGroup: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def rdoEmpSalary: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: bind C2LX
        layoutY: 273.0
        text: "Salary"
        font: Arial_12
        toggleGroup: toggleGroup
        selected: true
    }
    
    public-read def rdoEmpadvance: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: true
        layoutX: bind C2LX+80
        layoutY: 273.0
        text: "Advance"
        font: Arial_12
        toggleGroup: toggleGroup
        selected: false
    }
    
    public-read def Arial_25: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
        size: 25.0
    }
    
    def __layoutInfo_txtEmpPayAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind AmountTextboxW
        height: 34.0
    }
    public-read def txtEmpPayAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 454.0
        layoutInfo: __layoutInfo_txtEmpPayAmt
        onKeyPressed: txtEmpPayAmtOnKeyPressedAtShown
        onKeyReleased: txtEmpPayAmtOnKeyReleased
        promptText: "0.00"
        font: Arial_25
    }
    
    def __layoutInfo_label: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
    }
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 20.0
        layoutInfo: __layoutInfo_label
        styleClass: "labelFormHeading"
        effect: null
        text: "Employee Salary - alt+Y"
        font: Arial_25
        hpos: javafx.geometry.HPos.CENTER
    }
    
    public-read def DarkGray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.2
        blue: 0.2
    }
    
    public-read def label14: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 130.0
        text: "Employee Code"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label12: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 357.0
        text: "Details"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label11: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 329.0
        text: "Salary To Pay"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label10: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 301.0
        text: "Advance Amount"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 130.0
        text: "Gender "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 455.0
        text: "Now Pay"
        font: Arial_16
        textFill: DarkGray
    }
    
    public-read def label6: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 273.0
        text: "Fixed Salary"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 273.0
        text: "Salary Type"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 158.0
        text: "Age "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 158.0
        styleClass: "label"
        text: "Employee Name "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 1.0
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "form-background"
        onMouseClicked: rectangleOnMouseClicked
        blocksMouse: true
        fill: linearGradient
        stroke: DarkGray
        width: bind panelW
        height: bind panelH
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.4
    }
    
    public-read def label16: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 35.0
        layoutY: 234.0
        text: "Salary Details"
        font: Arial_18
        textFill: Green
    }
    
    public-read def label15: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 35.0
        layoutY: 91.0
        text: "Employee Details"
        font: Arial_18
        textFill: Green
    }
    
    public-read def dropShadowEffect: javafx.scene.effect.DropShadow = javafx.scene.effect.DropShadow {
    }
    
    public-read def lightingEffect: javafx.scene.effect.Lighting = javafx.scene.effect.Lighting {
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
    }
    
    public-read def Sandal: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.8
        blue: 0.2
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
    
    public-read def Arial_Bold_65: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 65.0
    }
    
    public-read def linearGradientHeader: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
    }
    
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        opacity: 0.25
        styleClass: "rectFormHeader"
        onMouseClicked: rectHeaderOnMouseClicked
        blocksMouse: true
        fill: linearGradientHeader
        width: bind panelW
        height: 32.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def imageBack: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/arrow_Left.png"
    }
    
    public-read def imageViewAll: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/ViewAll.png"
    }
    
    public-read def imageSearch: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Search.png"
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imageView10: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind C2LX+Type1TextboxW
        layoutY: 186.0
        onMouseClicked: imageView10OnMouseClicked
        blocksMouse: true
        image: image
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        content: [ rectangle, rectHeader, label, separator, label2, label3, label4, label6, label7, label9, label10, label11, label12, imageView10, panelButtons, txtEmpCode, label14, rdoEmpadvance, rdoEmpSalary, txtEmpAge, txtEmpAdvAmt, txtEmpDetails, txtEmpFixed_Sal, txtEmpName, txtEmpSalToPay, separator2, label15, label16, listEmployee2, label5, txtEmpGender, txtEmpPayAmt, txtPayDate, txtYear, txtMonth, txtEmpRec, imageView, listEmployee, label8, panelTable, rectTableBorder, btnEmpView, buttonEdit, btnEmpBack, btnEmpSearch, label18, rectViewSal, label13, label17, label19, panelAlert, empPanel, ]
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "Shown", "ViewAll", ]
        actual: 0
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectangle.visible = true;
                            label.layoutX = 0.0;
                            label.layoutY = 1.0;
                            label.textAlignment = javafx.scene.text.TextAlignment.LEFT;
                            label.hpos = javafx.geometry.HPos.CENTER;
                            __layoutInfo_separator.height = 5.0;
                            label2.visible = true;
                            label2.layoutY = 214.0;
                            label2.text = "Employee Code";
                            label3.visible = true;
                            label3.layoutY = 158.0;
                            label4.visible = true;
                            label4.layoutY = 280.0;
                            label6.visible = true;
                            label6.layoutY = 280.0;
                            label7.visible = true;
                            label7.disable = true;
                            label7.layoutY = 335.0;
                            label7.font = Arial_18;
                            label9.visible = true;
                            label9.layoutY = 130.0;
                            label10.visible = true;
                            label10.layoutY = 308.0;
                            label10.text = "Advance Paid";
                            label11.visible = true;
                            label11.layoutY = 336.0;
                            label11.text = "Balance Amount";
                            label12.visible = true;
                            label12.layoutY = 425.0;
                            imageView2.visible = true;
                            imageView2.image = imageSave;
                            btnEmpSave.visible = true;
                            btnEmpSave.layoutY = 0.0;
                            btnEmpSave.onKeyPressed = btnEmpSaveOnKeyPressedAtShown;
                            btnEmpSave.onMouseClicked = btnEmpSaveOnMouseClickedAtShown;
                            imageView3.visible = true;
                            imageView3.image = imageEdit;
                            btnEmpEdit.visible = true;
                            btnEmpEdit.layoutY = 0.0;
                            imageView4.visible = true;
                            imageView4.image = imageReset;
                            btnEmpReset.visible = true;
                            btnEmpReset.layoutY = 0.0;
                            btnEmpReset.onKeyPressed = btnEmpResetOnKeyPressedAtShown;
                            btnEmpReset.onMouseClicked = btnEmpResetOnMouseClickedAtShown;
                            btnEmpReset.text = "Reset [F4]";
                            imageView5.visible = true;
                            imageView5.image = imageCancel;
                            btnEmpCancel.visible = true;
                            btnEmpCancel.layoutY = 0.0;
                            btnEmpCancel.onKeyPressed = btnEmpCancelOnKeyPressedAtShown;
                            btnEmpCancel.onMouseClicked = btnEmpCancelOnMouseClickedAtShown;
                            btnEmpCancel.text = "Cancel [F8]";
                            panelButtons.visible = true;
                            panelButtons.managed = true;
                            txtEmpCode.visible = true;
                            txtEmpCode.layoutY = 214.0;
                            txtEmpCode.onKeyPressed = txtEmpCodeOnKeyPressedAtShown;
                            txtEmpCode.editable = false;
                            label14.visible = true;
                            label14.layoutY = 186.0;
                            label14.text = "Employee Name";
                            rdoEmpadvance.visible = true;
                            rdoEmpadvance.layoutY = 280.0;
                            rdoEmpadvance.selected = false;
                            rdoEmpSalary.visible = true;
                            rdoEmpSalary.layoutY = 280.0;
                            rdoEmpSalary.toggleGroup = toggleGroup;
                            rdoEmpSalary.selected = true;
                            txtEmpAge.visible = true;
                            txtEmpAge.layoutY = 158.0;
                            txtEmpAge.onKeyPressed = txtEmpAgeOnKeyPressedAtShown;
                            txtEmpAdvAmt.visible = true;
                            txtEmpAdvAmt.layoutY = 308.0;
                            txtEmpAdvAmt.onKeyPressed = txtEmpAdvAmtOnKeyPressedAtShown;
                            txtEmpAdvAmt.editable = false;
                            txtEmpDetails.visible = true;
                            txtEmpDetails.layoutY = 380.0;
                            __layoutInfo_txtEmpDetails.height = 85.0;
                            txtEmpDetails.onKeyPressed = txtEmpDetailsOnKeyPressedAtShown;
                            txtEmpDetails.multiline = true;
                            txtEmpFixed_Sal.visible = true;
                            txtEmpFixed_Sal.layoutY = 280.0;
                            txtEmpFixed_Sal.onKeyPressed = txtEmpFixed_SalOnKeyPressedAtShown;
                            txtEmpName.visible = true;
                            txtEmpName.layoutY = 186.0;
                            txtEmpName.onKeyReleased = txtEmpNameOnKeyReleasedAtShown;
                            txtEmpSalToPay.visible = true;
                            txtEmpSalToPay.layoutY = 336.0;
                            txtEmpSalToPay.onKeyPressed = txtEmpSalToPayOnKeyPressedAtShown;
                            separator2.visible = true;
                            separator2.layoutX = 30.0;
                            separator2.layoutY = 265.0;
                            label15.text = "Employee Details";
                            label16.visible = true;
                            label16.layoutX = 35.0;
                            label16.layoutY = 241.0;
                            listEmployee2.visible = false;
                            label5.visible = true;
                            label5.layoutY = 130.0;
                            label5.text = "Date";
                            label5.font = Arial_12;
                            label5.textFill = DarkGray;
                            txtEmpGender.visible = true;
                            txtEmpGender.layoutY = 130.0;
                            txtEmpGender.onKeyPressed = txtEmpGenderOnKeyPressedAtShown;
                            txtEmpPayAmt.visible = true;
                            txtEmpPayAmt.layoutY = 305.0;
                            __layoutInfo_txtEmpPayAmt.height = 70.0;
                            txtEmpPayAmt.styleClass = "text-box";
                            txtEmpPayAmt.onKeyPressed = txtEmpPayAmtOnKeyPressedAtShown;
                            txtEmpPayAmt.font = Arial_Bold_65;
                            txtPayDate.visible = true;
                            txtPayDate.layoutY = 130.0;
                            txtPayDate.onKeyPressed = txtPayDateOnKeyPressedAtShown;
                            txtPayDate.font = Arial_12;
                            txtYear.visible = true;
                            txtYear.onKeyPressed = txtYearOnKeyPressedAtShown;
                            txtYear.promptText = "yyyy";
                            txtYear.font = Arial_12;
                            txtMonth.visible = true;
                            txtMonth.layoutY = 158.0;
                            txtMonth.onKeyPressed = txtMonthOnKeyPressedAtShown;
                            txtMonth.promptText = "mm";
                            txtMonth.font = Arial_12;
                            txtEmpRec.visible = false;
                            txtEmpRec.layoutY = 138.0;
                            txtEmpRec.promptText = null;
                            imageView.visible = true;
                            imageView.layoutY = 130.0;
                            imageView.onKeyPressed = imageViewOnKeyPressedAtShown;
                            imageView.onMouseClicked = imageViewOnMouseClickedAtShown;
                            imageView.blocksMouse = true;
                            listEmployee.visible = false;
                            listEmployee.layoutY = 210.0;
                            listEmployee.onKeyPressed = listEmployeeOnKeyPressedAtShown;
                            label8.visible = true;
                            label8.layoutY = 158.0;
                            __layoutInfo_label8.width = 90.0;
                            label8.text = "Pay to Salary";
                            label8.font = Arial_12;
                            label8.textFill = DarkGray;
                            panelTable.visible = true;
                            rectTableBorder.visible = false;
                            imageView7.visible = false;
                            imageView7.image = null;
                            btnEmpView.visible = false;
                            btnEmpView.text = "Button";
                            btnEmpView.font = null;
                            imageView9.visible = false;
                            imageView9.image = null;
                            buttonEdit.visible = false;
                            buttonEdit.text = "Edit [F6]";
                            imageView6.visible = false;
                            imageView6.image = null;
                            btnEmpBack.visible = false;
                            btnEmpBack.text = "Button";
                            imageView8.visible = false;
                            imageView8.image = null;
                            btnEmpSearch.visible = false;
                            btnEmpSearch.layoutY = 247.0;
                            btnEmpSearch.text = "Button";
                            label18.visible = false;
                            label18.layoutX = 0.0;
                            label18.text = "Label";
                            label18.textFill = javafx.scene.paint.Color.BLACK;
                            rectViewSal.visible = true;
                            __layoutInfo_rectViewSal.width = 100.0;
                            __layoutInfo_rectViewSal.height = 20.0;
                            rectViewSal.styleClass = "rectbutton";
                            rectViewSal.onKeyPressed = rectViewSalOnKeyPressedAtShown;
                            rectViewSal.onMouseClicked = rectViewSalOnMouseClickedAtShown;
                            rectViewSal.fill = Sandal;
                            rectViewSal.stroke = DarkGray;
                            rectViewSal.width = 100.0;
                            rectViewSal.height = 20.0;
                            rectViewSal.arcWidth = 10.0;
                            rectViewSal.arcHeight = 10.0;
                            label13.visible = true;
                            __layoutInfo_label13.width = 100.0;
                            __layoutInfo_label13.height = 20.0;
                            label13.text = "View Salary ";
                            label13.font = Arial_Bold_12;
                            label13.hpos = javafx.geometry.HPos.CENTER;
                            label13.textFill = DarkGray;
                            label17.visible = false;
                            label17.layoutX = 110.0;
                            label17.layoutY = 506.0;
                            label17.text = "Label";
                            label17.textFill = javafx.scene.paint.Color.BLACK;
                            label19.visible = false;
                            label19.layoutY = 196.0;
                            label19.text = "Label";
                            empPanel.visible = true;
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
                            rectangle.visible = true;
                            label.layoutX = 0.0;
                            label.layoutY = 1.0;
                            label.textAlignment = javafx.scene.text.TextAlignment.RIGHT;
                            label.hpos = javafx.geometry.HPos.CENTER;
                            __layoutInfo_separator.height = 0.0;
                            label2.visible = false;
                            label2.layoutY = 232.0;
                            label2.text = "Employee Code";
                            label3.visible = false;
                            label3.layoutY = 238.0;
                            label4.visible = false;
                            label4.layoutY = 324.0;
                            label6.visible = false;
                            label6.layoutY = 324.0;
                            label7.visible = false;
                            label7.disable = false;
                            label7.layoutY = 388.0;
                            label7.font = Arial_16;
                            label9.visible = false;
                            label9.layoutY = 204.0;
                            label10.visible = false;
                            label10.layoutY = 357.0;
                            label10.text = "Advance Paid";
                            label11.visible = false;
                            label11.layoutY = 388.0;
                            label11.text = "Balance Amount";
                            label12.visible = false;
                            label12.layoutY = 479.0;
                            imageView2.visible = false;
                            imageView2.image = null;
                            btnEmpSave.visible = false;
                            btnEmpSave.layoutY = 545.0;
                            btnEmpSave.onKeyPressed = btnEmpSaveOnKeyPressedAtShown;
                            btnEmpSave.onMouseClicked = btnEmpSaveOnMouseClickedAtShown;
                            imageView3.visible = false;
                            imageView3.image = null;
                            btnEmpEdit.visible = false;
                            btnEmpEdit.layoutY = 545.0;
                            imageView4.visible = false;
                            imageView4.image = null;
                            btnEmpReset.visible = false;
                            btnEmpReset.layoutY = 545.0;
                            btnEmpReset.onKeyPressed = btnEmpResetOnKeyPressedAtShown;
                            btnEmpReset.onMouseClicked = btnEmpResetOnMouseClickedAtShown;
                            btnEmpReset.text = "Reset [F4]";
                            imageView5.visible = false;
                            imageView5.image = null;
                            btnEmpCancel.visible = false;
                            btnEmpCancel.layoutY = 545.0;
                            btnEmpCancel.onKeyPressed = btnEmpCancelOnKeyPressedAtShown;
                            btnEmpCancel.onMouseClicked = btnEmpCancelOnMouseClickedAtShown;
                            btnEmpCancel.text = "Cancel [F8]";
                            panelButtons.visible = true;
                            panelButtons.managed = false;
                            txtEmpCode.visible = false;
                            txtEmpCode.layoutY = 232.0;
                            txtEmpCode.editable = false;
                            label14.visible = false;
                            label14.layoutY = 196.0;
                            label14.text = "Employee Name";
                            rdoEmpadvance.visible = false;
                            rdoEmpadvance.layoutY = 324.0;
                            rdoEmpadvance.selected = false;
                            rdoEmpSalary.visible = false;
                            rdoEmpSalary.layoutY = 324.0;
                            rdoEmpSalary.toggleGroup = toggleGroup;
                            rdoEmpSalary.selected = false;
                            txtEmpAge.visible = false;
                            txtEmpAge.layoutY = 232.0;
                            txtEmpAdvAmt.visible = false;
                            txtEmpAdvAmt.layoutY = 351.0;
                            txtEmpAdvAmt.editable = false;
                            txtEmpDetails.visible = false;
                            txtEmpDetails.layoutY = 438.0;
                            __layoutInfo_txtEmpDetails.height = 89.0;
                            txtEmpDetails.onKeyPressed = txtEmpDetailsOnKeyPressedAtShown;
                            txtEmpDetails.multiline = true;
                            txtEmpFixed_Sal.visible = false;
                            txtEmpFixed_Sal.layoutY = 324.0;
                            txtEmpName.visible = false;
                            txtEmpName.layoutY = 198.0;
                            txtEmpName.onKeyReleased = txtEmpNameOnKeyReleasedAtShown;
                            txtEmpSalToPay.visible = false;
                            txtEmpSalToPay.layoutY = 387.0;
                            separator2.visible = false;
                            separator2.layoutX = 24.0;
                            separator2.layoutY = 306.0;
                            label15.text = "Salary History - View and Edit";
                            label16.visible = false;
                            label16.layoutX = 24.0;
                            label16.layoutY = 276.0;
                            listEmployee2.visible = false;
                            label5.visible = false;
                            label5.layoutY = 130.0;
                            label5.text = "Date";
                            label5.font = Arial_12;
                            label5.textFill = DarkGray;
                            txtEmpGender.visible = false;
                            txtEmpGender.layoutY = 199.0;
                            txtEmpPayAmt.visible = false;
                            txtEmpPayAmt.layoutY = 379.0;
                            __layoutInfo_txtEmpPayAmt.height = 34.0;
                            txtEmpPayAmt.styleClass = "text-box";
                            txtEmpPayAmt.onKeyPressed = txtEmpPayAmtOnKeyPressedAtShown;
                            txtEmpPayAmt.font = Arial_25;
                            txtPayDate.visible = false;
                            txtPayDate.layoutY = 124.0;
                            txtYear.visible = false;
                            txtYear.onKeyPressed = txtYearOnKeyPressedAtShown;
                            txtYear.promptText = "YYYY";
                            txtMonth.visible = false;
                            txtMonth.layoutY = 158.0;
                            txtMonth.onKeyPressed = txtMonthOnKeyPressedAtShown;
                            txtMonth.promptText = "MM";
                            txtEmpRec.visible = true;
                            txtEmpRec.layoutY = 136.0;
                            __layoutInfo_txtEmpRec.width = 51.0;
                            txtEmpRec.onKeyPressed = txtEmpRecOnKeyPressedAtViewAll;
                            txtEmpRec.promptText = "0";
                            txtEmpRec.font = Arial_12;
                            imageView.visible = false;
                            imageView.layoutY = 122.0;
                            imageView.onKeyPressed = imageViewOnKeyPressedAtShown;
                            imageView.onMouseClicked = imageViewOnMouseClickedAtShown;
                            imageView.blocksMouse = true;
                            listEmployee.visible = false;
                            listEmployee.layoutY = 180.0;
                            listEmployee.onKeyPressed = listEmployeeOnKeyPressedAtShown;
                            label8.visible = false;
                            label8.layoutY = 164.0;
                            __layoutInfo_label8.width = 90.0;
                            label8.text = "Pay to Salary";
                            label8.textFill = javafx.scene.paint.Color.BLACK;
                            panelTable.visible = true;
                            rectTableBorder.visible = true;
                            imageView7.visible = true;
                            imageView7.image = imageViewAll;
                            btnEmpView.visible = true;
                            btnEmpView.onKeyPressed = btnEmpViewOnKeyPressedAtViewAll;
                            btnEmpView.onMouseClicked = btnEmpViewOnMouseClickedAtViewAll;
                            btnEmpView.effect = reflectionEffect;
                            btnEmpView.text = "View All";
                            btnEmpView.font = Arial_Bold_14;
                            imageView9.visible = true;
                            imageView9.image = imageEdit;
                            buttonEdit.visible = true;
                            buttonEdit.effect = reflectionEffect;
                            buttonEdit.text = "Edit [F6]";
                            buttonEdit.font = Arial_Bold_14;
                            imageView6.visible = true;
                            imageView6.image = imageBack;
                            btnEmpBack.visible = true;
                            btnEmpBack.onKeyReleased = btnEmpBackOnKeyReleasedAtViewAll;
                            btnEmpBack.effect = reflectionEffect;
                            btnEmpBack.text = "Back [Ctrl+Left]";
                            btnEmpBack.font = Arial_Bold_14;
                            btnEmpBack.action = btnEmpBackActionAtViewAll;
                            imageView8.visible = true;
                            imageView8.image = imageSearch;
                            btnEmpSearch.visible = true;
                            btnEmpSearch.layoutY = 136.0;
                            __layoutInfo_btnEmpSearch.width = 100.0;
                            __layoutInfo_btnEmpSearch.height = 20.0;
                            btnEmpSearch.onKeyPressed = btnEmpSearchOnKeyPressedAtViewAll;
                            btnEmpSearch.onMouseClicked = btnEmpSearchOnMouseClickedAtViewAll;
                            btnEmpSearch.effect = reflectionEffect;
                            btnEmpSearch.text = "Search";
                            btnEmpSearch.font = Arial_14;
                            label18.visible = true;
                            label18.layoutX = 35.0;
                            label18.text = "Please select the row to edit the record.";
                            label18.font = Arial_Bold_12;
                            label18.textFill = Green;
                            rectViewSal.visible = false;
                            rectViewSal.styleClass = "";
                            rectViewSal.fill = javafx.scene.paint.Color.BLACK;
                            rectViewSal.stroke = null;
                            rectViewSal.width = 100.0;
                            rectViewSal.height = 50.0;
                            rectViewSal.arcWidth = 0.0;
                            rectViewSal.arcHeight = 0.0;
                            label13.visible = false;
                            label13.text = "Label";
                            label13.hpos = javafx.geometry.HPos.LEFT;
                            label13.textFill = javafx.scene.paint.Color.BLACK;
                            label17.visible = false;
                            label17.layoutX = 110.0;
                            label17.layoutY = 494.0;
                            label17.text = "* Double click to edit the record";
                            label17.font = Arial_12;
                            label17.textFill = Green;
                            label19.visible = true;
                            label19.layoutY = 136.0;
                            label19.text = "Recent Records";
                            label19.font = Arial_12;
                            empPanel.visible = false;
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


      var sar: Integer = 0;
    var oldSal: String;
var btnEmpSaveText="Save [F3]";
var btnEmpEditText="Edit [F6]";
    function btnEmpViewOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {

        shortcut(event);
    }

    function btnEmpBackOnKeyReleasedAtViewAll(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            btnEmpBackActionAtViewAll();
        } else { shortcut(event); }
    }
    function txtEmpPayAmtOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        var paidAmtString: String = txtEmpPayAmt.rawText.trim();
        var paidedAmt: Double = 0.0;
        var val: Validation = null;
        val = new Validation();

        var si4: Integer = 0; si4 = val.getDecimalValid(paidAmtString, 1, 12);
        if (si4 != 10) {

            if (paidAmtString == null or paidAmtString == "" or paidAmtString.length() == 0) {

            } else {

                FXinfo("Please enter only numbers for the Pay textbox: ", txtEmpPayAmt);
            }
        } else {

            if (paidAmtString == ".") {
                FXinfo("Please enter a valid amount in the Pay textbox.", txtEmpPayAmt);
            } else {
                if (paidAmtString != null and paidAmtString.trim().length() > 0) {
                    paidedAmt = Double.valueOf(paidAmtString);
                }

                var fixedSalary: Double = 0.0;
                fixedSalary = Double.valueOf(txtEmpFixed_Sal.rawText.trim());

                var advancePaided: Double = 0.0;
                if ( txtEmpAdvAmt.rawText.trim () . equals ("") ) {
                    advancePaided = Double.valueOf(0.00) }
                else { advancePaided = Double.valueOf (txtEmpAdvAmt.rawText) }
//                    advancePaided = Double.valueOf(if ( txtEmpAdvAmt.rawText.trim () . equals ("") ){ 0.00 } else { txtEmpAdvAmt.rawText } ) ;
                txtEmpSalToPay.text = Value.Round(fixedSalary - (advancePaided + paidedAmt));
            }
        }
    }

    function rectHeaderOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        listEmployee.visible = false;
        listEmployee2.visible = false;
        empPanel.visible = false;
    }

    function imageView10OnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if(not listEmployee.visible){
        var payMon = txtMonth.rawText.trim();
        var payYear = txtYear.rawText.trim();
        if (payMon != null and payMon.trim().length() > 0 and payYear != null and payYear.trim().length() > 0) {
            listH = 0.0;
            var empName: String[] = [];
            listEmployee.visible = true;
            listW = txtEmpName.width;
            var size = listEmployee.items.size();
            if (not listEmployee.items.isEmpty()) {
                for (i in [0..<size])
                    listEmployee.items[i] = null;
                txtEmpName.requestFocus();
            }
            //Controller Instance
            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
            empName = commonController .getEmployers("").toArray() as String[];
            listEmployee.clearSelection();
            listEmployee.items = empName;
            listEmployee.onKeyPressed = function(e) {
                        if (e.code == KeyCode.VK_ENTER) {
                            txtEmpName.text = "{listEmployee.selectedItem}";
                            var sam: String = txtEmpName.text;
                            displayEmp(sam);
                            listEmployee.visible = false;
                            txtEmpPayAmt.requestFocus();
                        } else if (e.code == KeyCode.VK_DOWN) {
                            if (listEmployee.selectedIndex == 0) {
                                listEmployee.selectFirstRow();
                            }
                        } else if (e.code == KeyCode.VK_ESCAPE) {
                            listEmployee.visible = false;
                            txtEmpName.requestFocus();
                        }
                    };
            listEmployee.onMouseClicked = function(e) {
                        txtEmpName.text = "{listEmployee.selectedItem}";
                        var sam: String = txtEmpName.text;
                        displayEmp(sam);
                        listEmployee.visible = false;
                        txtEmpPayAmt.requestFocus();
                    }

            var height: Integer = 0;
            if (listEmployee.items.size() < 7) {
                height = listEmployee.items.size();
            } else {
                height = 6;
            }
            for (i in [1..height]) {
                listH += 25.0;
            }

            txtEmpName.requestFocus();

        } else {
            FXinfo("Please select a valid Month and Year.", txtMonth);

        }
      }
       else{
           listEmployee.visible = false;
           txtEmpName.requestFocus();
       }
    }

    def kr = KeyRegistry {};
    var key = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 4 and CommonDeclare.form[3] == 6) {
            shortcut(key);
        }
    }

    function buttonEditActionAtViewAll(): Void {

        try {
            btnEmpEdit.disable = true;
            if (EmployeeSalaryTable.salesId == "" or EmployeeSalaryTable.salesId == null or EmployeeSalaryTable.salesId.trim().length() == 0) {
                FXinfo("Please select a row to edit:");
            } else {

                if (EmployeeSalaryTable.salesId != null and EmployeeSalaryTable.salesId.trim().length() > 0) {
                    currentState.actual = currentState.findIndex("Shown");
                    btnEmpSaveText = "Update [F7]";
                    btnEmpEditText = "Delete [F5]";
                    employeSalTable.visible = false;
                    txtPayDate.requestFocus();
                    salesEmpId = EmployeeSalaryTable.salesId;
                    getEmployeeSalaryValues(salesEmpId);
                     updateValues();
                    EmployeeSalaryTable.salesId = "";
                    btnEmpEdit.disable = false;
                }
            }
        } catch (e: Exception) {
            var msg: String = "Class : Employee Salary  method : buttonEditActionAtViewAll()()  = {e.getMessage()}";
            log.debug(msg);
        }

    }

    var errorStyle: String = CommonDeclare.textbox_error();

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Employee Salary", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = errorStyle;
    }

    function rectangleOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        listEmployee.visible = false;
        listEmployee2.visible = false;
        empPanel.visible = false;

    }

    var sal_Flag: Boolean = false;
    var fxCalendar = FXCalendar {
                 theme: Theme {};
            };
    var today = DateUtils.now("dd-MM-yyyy");
    var rowNo = 12;
    var colNames: Object[] = ["Salary ID", "Employee ID", "Employee Name", "Date", "Month-Year", "Amount", "Salary Type"]; 
    var colType: Class[] = [java.lang.String.class, java.lang.String.class, java.lang.String.class,
                java.lang.String.class, java.lang.String.class, java.lang.String.class,
                java.lang.String.class];
    var colEditable: Boolean[] = [false, false, false, false, false, false, false];
    var colWidth: Integer[] = [80, 80, 140, 80, 80, 80, 80];
    var employeeViewTable= EmployeeSalaryTable.createTable(rowNo, colNames, colType, colEditable, colWidth);
//    var employeSalTable = SwingComponent.wrap(employeeViewTable);
    var employeSalTable =SwingComponent.wrap(EmployeeSalaryTable.getScrollTable(employeeViewTable));
    var salesEmpId: String = "";
    var log: Logger = Logger.getLogger(EmployeeSalary.class, "Masters");
    var panelW = bind CommonDeclare.panelFormW on replace {
        DetailsTextLW = (84.87928844 * panelW / 100) - CommonDeclare.Column1LX;
        Type5TextboxW = (3.811944091 * panelW / 100);
    }
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
    var botton21LX = bind CommonDeclare.botton31LX;
    var botton22LX = bind CommonDeclare.botton32LX;
    var botton23LX = bind CommonDeclare.botton33LX;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    var bottonW = bind CommonDeclare.bottonW;
    var bottonH = bind CommonDeclare.bottonH;
    var seperatorW = bind CommonDeclare.seperatorW;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;
    var Type4TextboxW = bind CommonDeclare.Type4TextboxW;
    var Type5TextboxW = (3.811944091 * panelW / 100);
    var AmountTextboxW = bind CommonDeclare.AmountTextboxW;
    var DetailsTextLW = (84.87928844 * panelW / 100) - C1LX;
    var ImageCalenderLX = bind C2LX + Type3TextboxW + 2;
    var panelCalenderLX = bind C2LX + Type3TextboxW + 22;
    var labelSearchLX = bind (23.25285896 * panelW / 100);
    var SearchTextboxLX = bind (labelSearchLX + 100);
    var buttonSearchLX = bind (SearchTextboxLX + Type5TextboxW + 25);
    var rectbutton2LX = bind CommonDeclare.rectbutton2LX;
    var rectbuttonLY = bind CommonDeclare.rectbuttonLY;
     var TableH = 278.0;
    var TableW = bind (95.29860229 * panelW) / 100 on replace {
        changeTableSize(TableW);
    };
   

    function changeTableSize(i: Integer): Void {
        employeSalTable.getJComponent().setPreferredSize(new Dimension(i, TableH));
    }

    var panelTableLX = bind (panelW - TableW) / 2;
    var panelTableLY = bind (32.35779817 * panelH / 100);
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    var mandatoryStyle: String = CommonDeclare.textbox_mandatory();
    var listH = 0.0;
    var listW = Type2TextboxW;
    def CustomAlert = CustomAlert {};

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Employee Salary", type);
        showAlertbox();

    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Employee Salary", msg);
        showAlertbox();

    }

    function txtEmpRecOnKeyPressedAtViewAll(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            btnEmpSearch.requestFocus();
        } shortcut(event);
    }

    function txtPayDateOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtPayDate.style = mandatoryStyle;
        shortcut(event);
    }

    function txtEmpSalToPayOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function txtEmpAdvAmtOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function txtEmpFixed_SalOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function txtEmpAgeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function txtEmpGenderOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function txtEmpCodeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function txtEmpNameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            if (sar == 0 or txtEmpName.rawText.trim() == null or txtEmpName.rawText.trim().trim().length() == 0 or txtEmpName.rawText.trim() == "null") {
                txtEmpName.text = " ";
            }
            txtEmpPayAmt.requestFocus();
            txtEmpName.style = mandatoryStyle;
        } else {
            shortcut(event);
        }
    }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {
        if (event.controlDown or event.altDown or event.shiftDown) {
            kr.actionKey = event.code;
        }

        if (event.code == kr.save) {
            saveClick();
        }
        if (event.code == kr.update) {
            saveClick();
        }

        if (event.code == kr.edit and btnEmpEditText == "Edit [F6]" and btnEmpEdit.disable == true) {
            buttonEditActionAtViewAll();
        } else if (event.code == kr.edit and btnEmpEditText == "Edit [F6]" and btnEmpEdit.disable == false) {
            edit();
        }

        if (event.code == kr.reset and btnEmpReset.text == "Reset [F4]") {
            clearAll();
        }

        if (event.code == kr.del) {
            deleteEmpSalary();
        }
        if (event.controlDown == true and event.code == kr.back) {
            if (btnEmpBack.text == "Back [Ctrl+Left]") { back(); }
        }
        if (event.code == kr.cancel) {
            if (btnEmpCancel.text == "Cancel [F8]") { panel.visible = false; CancelForm(); }
             
        }
    }

    function btnEmpSearchOnMouseClickedAtViewAll(event: javafx.scene.input.MouseEvent): Void {
        searchClick();
    }

    function deleteEmpSalary(): Void {
        try {
            var cn : ConfirmDialogBox = new ConfirmDialogBox(1,"Employee Salary");
            var a =bind cn.staus;
            if (a) {
                var payAmt: Double = 0.0;
                payAmt = Double.valueOf(txtEmpPayAmt.rawText.trim());
                payAmt = Value.Round(payAmt, 2);
                var employeeSalaryModel:EmployeeSalaryModel = new EmployeeSalaryModel();
                employeeSalaryModel.setSalaryId(salesEmpId);
                employeeSalaryModel = employeeSalaryController.viewRecord(employeeSalaryModel) as EmployeeSalaryModel;
                oldSal = employeeSalaryModel.getPaidAmount().toString();
                //Controller Instance
                employeeSalaryController = RegistryFactory.getClientStub(RegistryConstants.EmployeeSalary) as com.vanuston.medeil.implementation.EmployeeSalary ;
                employeeSalaryController.deleteRecord (salesEmpId) ;
                insertSalary(payAmt,DateUtils.changeFormatDate(txtPayDate.text),2);
                FXalert(5);
                clearAll();
            }
        } catch (e: Exception) {
            var msg: String = "Class : Employee Salary  method : deleteEmpSalary()  = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function searchClick(): Void {
        var cntRec: String = txtEmpRec.text;
        var cnt: Integer = 0;

        try {
            var val1: Validation = null;
            val1 = new Validation();
            var sa: Integer = 0; sa = val1.getNumberValid(cntRec, 0, 10);

            if (sa == 10) {
                if (cntRec != null and cntRec.trim().length() > 0) {
                    cnt = Integer.parseInt(cntRec);
                }
            }

            if (cntRec == null or cntRec.trim().length() == 0) {
                FXinfo("Enter Search Record  ", txtEmpRec);
            } else if (sa != 10) {
                FXinfo("Enter Search Record (only numbers accepted): ", txtEmpRec);

            } else {

                EmployeeSalaryTable.loadEmployeeSal(cnt);
            }
        } catch (e: Exception) {
            var msg: String = "Class : Employee Salary  method : searchClick()  = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function btnEmpSearchOnKeyPressedAtViewAll(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            searchClick();
        } shortcut(event);
    }

    function btnEmpViewOnKeyPressedAtViewAll(event: javafx.scene.input.KeyEvent): Void {
        viewAllclick();
    }

    function viewAllclick(): Void {
        EmployeeSalaryTable.loadEmpSalAll();
    }

    function btnEmpViewOnMouseClickedAtViewAll(event: javafx.scene.input.MouseEvent): Void {
        viewAllclick();
    }

    function rectViewSalOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        currentState.actual = currentState.findIndex("ViewAll");
        EmployeeSalaryTable.loadEmployeeSalaryTable();
        salesEmpId = "";
        employeSalTable.visible = true;
        btnEmpEdit.disable = true;
    }

    function rectViewSalOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        currentState.actual = currentState.findIndex("ViewAll");
        EmployeeSalaryTable.loadEmployeeSalaryTable();
        employeSalTable.visible = true;
        salesEmpId = "";
        btnEmpEdit.disable = true;
    }

    function edit() {
        currentState.actual = currentState.findIndex("ViewAll");
        EmployeeSalaryTable.loadEmployeeSalaryTable();
        employeSalTable.visible = true;
        salesEmpId = "";
        btnEmpEdit.disable = true;
    }

    function btnEmpEditActionAtShown(): Void {
        if (btnEmpEditText == "Edit [F6]") {
            edit();
        } else {
            deleteEmpSalary();
        }
    }

    function back(): Void {
        currentState.actual = currentState.findIndex("Shown");
        btnEmpEdit.disable = false;
        employeSalTable.visible = false;
        txtPayDate.requestFocus();
        clearAll();
    }

    function btnEmpBackActionAtViewAll(): Void {
        back();
    }

    function btnEmpCancelOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        panel.visible = false;
        CancelForm();
    }

    function btnEmpCancelOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            panel.visible = false;
            CancelForm(); }
    }

    function btnEmpResetOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        clearAll();
    }

    function btnEmpResetOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            clearAll(); }
    }

    function txtYearOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtYear.style = mandatoryStyle;
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtEmpName.requestFocus();
        } shortcut(event);
    }

    function txtMonthOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtMonth.style = mandatoryStyle;
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtYear.requestFocus();
        } shortcut(event);
    }

    function btnEmpSaveOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        saveClick();
    }

    function getEmpSalaryID(): String {
        //Controller Instance
        commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
        return commonController.getCustId("emp_salary_info","sal_id","ESA");
    }

    function clearAll(): Void {
        txtEmpName.text = "";
        txtEmpCode.text = "";
        txtEmpGender.text = "";
        txtEmpAge.text = "";
        rdoEmpSalary.selected = true;
        rdoEmpadvance.selected = false;
        txtEmpDetails.text = "";
        txtMonth.text = "";
        txtYear.text = "";
        txtEmpAdvAmt.text = "";
        txtEmpFixed_Sal.text = "";
        txtEmpSalToPay.text = "";
        EmployeeSalaryTable.salesId = "";
        txtMonth.requestFocus();
        salesEmpId = "";
        btnEmpReset.disable = false;
        btnEmpEdit.disable = false;
        btnEmpSaveText = "Save [F3]";
        btnEmpEditText = "Edit [F6]";
        txtEmpPayAmt.text = "";
        txtPayDate.text = today;
    }

    function getEmployeeSalaryValues(saId): Void {

        try {
            var sdf : SimpleDateFormat=new SimpleDateFormat("dd-MM-yyyy");
            var employeeSalaryModel : EmployeeSalaryModel =new EmployeeSalaryModel();

            var month: String = "";
            var year: String = "";
            var empName: String = "";
            var paid_amt: Double = 0.00;
            var fixed_amount: Double = 0.00;
            var current_amount: Double = 0.00;
            var bal_amount: Double = 0.00;
            var salType: String = "salary";
            var sqL: String = "";
            employeeSalaryModel.setSalaryId(saId.toString());
            //Controller Instance
            employeeSalaryController = RegistryFactory.getClientStub(RegistryConstants.EmployeeSalary) as com.vanuston.medeil.implementation.EmployeeSalary ;
            employeeSalaryModel=employeeSalaryController.viewRecord(employeeSalaryModel) as EmployeeSalaryModel;
                empName = employeeSalaryModel.getEmployeeName();
                txtEmpName.text = employeeSalaryModel.getEmployeeName();
                txtPayDate.text = sdf.format(employeeSalaryModel.getDate());
                txtEmpCode.text = employeeSalaryModel.getEmployeeCode();
                txtEmpGender.text = employeeSalaryModel.getGender();
                txtEmpAge.text = employeeSalaryModel.getAge();
                txtEmpPayAmt.text = employeeSalaryModel.getPaidAmount().toString();
                current_amount = employeeSalaryModel.getPaidAmount();
                fixed_amount = employeeSalaryModel.getFixedSalary();
                txtEmpDetails  .text  = employeeSalaryModel.getPaidDetails();
                month = employeeSalaryModel.getSalaryMonth();
                txtMonth.text  = employeeSalaryModel.getSalaryMonth();
                txtYear.text = employeeSalaryModel.getSalaryYear();
                year = employeeSalaryModel.getSalaryYear();
                txtEmpAdvAmt.text = employeeSalaryModel.getAdvancePaid().toString();
                txtEmpFixed_Sal.text = employeeSalaryModel.getFixedSalary().toString();
                salType = employeeSalaryModel.getSalaryType();

        employeeSalaryModel.setSalaryId("");
        employeeSalaryModel=employeeSalaryController.viewRecord (employeeSalaryModel) as EmployeeSalaryModel ;
        salType = employeeSalaryModel.getSalaryType();
        paid_amt = employeeSalaryModel.getPaidAmount();
        txtEmpAdvAmt.text = Value.Round(paid_amt-current_amount);
        bal_amount = fixed_amount - paid_amt;
        if(bal_amount > 0) {
            txtEmpSalToPay.text = Value.Round(bal_amount);
        }
        else {
          txtEmpSalToPay.text = "0.00";
        }
        if(salType.equals("advance")) {
            rdoEmpSalary.selected = false;
            rdoEmpadvance.selected  = true;
        }       
    } catch(e : Exception){
        var msg : String = "Class : Employee Salary  method : getEmployeeSalaryValues = {e.getMessage()}";
        log.debug(msg);
      }
    txtEmpSalToPay.requestFocus();
  }
function checkValid():Integer{

        var retVal = 0;
        var txtEmpPayAmt1 = txtEmpPayAmt.rawText.trim();
        var txtMonth1 = txtMonth.rawText.trim();
        var txtEmpName1 = txtEmpName.rawText.trim();
        var txtYear1 = txtYear.rawText.trim();
        var txtEmpAdv = txtEmpAdvAmt.rawText.trim();        
        if (txtEmpAdv.length() <= 0) {
            txtEmpAdvAmt.text = "0.00";
        }
            var val = new Validation();
            var si2: Integer = 0; si2 = val.getNumberValid(txtMonth1, 1, 2);
            var si3: Integer = 0; si3 = val.getNumberValid(txtYear1, 1, 4);
            var si4: Integer = 0; si4 = val.getDecimalValid(txtEmpPayAmt1, 1, 12);            
            var mon: Integer = 0;
            if (txtMonth1.trim().length() > 0 and txtMonth1 != null and si2 != 0) {
                mon = Integer.parseInt(txtMonth1);
            }
            if (txtMonth1 == null or txtMonth1.trim().length() > 2) {
                FXinfo("Please enter a valid month.", txtMonth);

            } else if (si2 == 0) {
                FXinfo("Please enter a valid month (only numbers allowed, e.g.: 12 or 02)", txtMonth);

            } else if (mon > 12) {
                FXinfo("Please enter a valid month (only numbers allowed, e.g.: 12 or 02)", txtMonth);

            } else if (txtYear1 == null or txtYear1.trim().length() != 4) {
                FXinfo("Please enter a valid value for Year.", txtYear);

            } else if (si3 == 0) {
                FXinfo("Please enter a valid value for Year (only numbers allowed, e.g.: 2011 or 2012).", txtYear);

            } else if (txtEmpName1 == null or txtEmpName1.trim().length() <= 0) {
                FXinfo("Please enter a value for Employee Name ", txtEmpName);

            } else if (txtEmpPayAmt1 == null or txtEmpPayAmt1.trim().length() <= 0) {
                FXinfo("Please enter a value for Now Pay", txtEmpPayAmt);

            } else if (si4 == 0) {
                FXinfo("Please enter a valid value for Now Pay (Only numbers allowed, e.g.: 2000)", txtEmpPayAmt);                        
            } else {
                retVal = 1;
            }
            return retVal;
}

    function saveClick(): Void {
        
    var employeeSalaryModel : EmployeeSalaryModel=new EmployeeSalaryModel();
    //Controller Instance
        try {
            var rt = checkValid() ;            
            if(rt==1)
            {
                employeeSalaryModel.setEmployeeCode(txtEmpCode.rawText.trim());
                employeeSalaryModel.setEmployeeName(txtEmpName.rawText.trim());
                employeeSalaryModel.setGender(txtEmpGender.rawText.trim());
                employeeSalaryModel.setAge(txtEmpAge.rawText.trim());
                employeeSalaryModel.setSalaryType("salary");
                if (rdoEmpadvance.selected == true) {
                    employeeSalaryModel.setSalaryType("advance");
                }
                var txtPayDate1: String = "";
                txtPayDate1 = txtPayDate.rawText.trim();
                if (txtPayDate1 != null or txtPayDate1.trim().length() >0){
                    txtPayDate1 =DateUtils.changeFormatDate(txtPayDate.text);
                }
                employeeSalaryModel.setDate(Date.valueOf(txtPayDate1));
                var txtEmpPayAmt1 = txtEmpPayAmt.rawText.trim();
                var payAmt: Double = 0.0;
                payAmt = Double.valueOf(txtEmpPayAmt1);
                payAmt = Value.Round(payAmt, 2);
                employeeSalaryModel.setPaidAmount(payAmt);
                employeeSalaryModel.setPaidDetails(txtEmpDetails.rawText.trim());
                employeeSalaryModel.setSalaryMonth(txtMonth.rawText.trim());
                employeeSalaryModel.setSalaryYear(txtYear.rawText.trim());
                employeeSalaryModel.setAdvancePaid(Double.parseDouble(txtEmpAdvAmt.rawText.trim().toString()));
                employeeSalaryModel.setBalanceAmount(Double.parseDouble(txtEmpSalToPay.rawText.trim().toString()));
                employeeSalaryModel.setFixedSalary(Double.parseDouble(txtEmpFixed_Sal.rawText.trim().toString()));
                var chk = false;
                if(Double.valueOf(txtEmpSalToPay.rawText.trim())>=0)  {                    
                if (btnEmpSaveText == "Save [F3]") {
                    var salId: String = "";
                    salId = getEmpSalaryID();
                    employeeSalaryModel.setSalaryId(getEmpSalaryID());
                    //Controller Instance
                    employeeSalaryController = RegistryFactory.getClientStub(RegistryConstants.EmployeeSalary) as com.vanuston.medeil.implementation.EmployeeSalary ;
                    if(employeeSalaryController.createRecord(employeeSalaryModel).equals(true)) {                        
                        if (insertSalary(payAmt,DateUtils.changeFormatDate(txtPayDate.text),1))
                            FXalert(0);
                    chk = true;
                    }                    
                    clearAll();
                } else {
                    var cn : ConfirmDialogBox = new ConfirmDialogBox(0,"Employee Salary");
                    var a =bind cn.staus;
                    if (a) {
                        employeeSalaryModel.setSalaryId(salesEmpId);
                        //Controller Instance
                        employeeSalaryController = RegistryFactory.getClientStub(RegistryConstants.EmployeeSalary) as com.vanuston.medeil.implementation.EmployeeSalary ;
                        employeeSalaryModel=employeeSalaryController.viewRecord(employeeSalaryModel) as EmployeeSalaryModel;
                        oldSal = employeeSalaryModel.getPaidAmount().toString();
                        employeeSalaryModel.setSalaryId(salesEmpId);
                        employeeSalaryModel.setEmployeeCode(txtEmpCode.rawText.trim());
                        employeeSalaryModel.setEmployeeName(txtEmpName.rawText.trim());
                        employeeSalaryModel.setGender(txtEmpGender.rawText.trim());
                        employeeSalaryModel.setAge(txtEmpAge.rawText.trim());
                        if (rdoEmpadvance.selected == true) {employeeSalaryModel.setSalaryType("advance"); }
                        else { employeeSalaryModel.setSalaryType("salary"); }                                            
                        txtPayDate1 = "";
                        txtPayDate1 = txtPayDate.rawText.trim();
                        if (txtPayDate1 != null or txtPayDate1.trim().length() >0){
                        txtPayDate1 =DateUtils.changeFormatDate(txtPayDate.text);
                        }
                        employeeSalaryModel.setDate(Date.valueOf(txtPayDate1));
                        txtEmpPayAmt1 = txtEmpPayAmt.rawText.trim();
                        payAmt = 0.0;
                        payAmt = Double.valueOf(txtEmpPayAmt1);
                        payAmt = Value.Round(payAmt, 2);
                        employeeSalaryModel.setSalaryMonth(txtMonth.rawText.trim());
                        employeeSalaryModel.setSalaryYear(txtYear.rawText.trim());
                        employeeSalaryModel.setPaidAmount(payAmt);
                        employeeSalaryModel.setPaidDetails(txtEmpDetails.rawText.trim());
                        employeeSalaryModel.setAdvancePaid(Double.parseDouble(txtEmpAdvAmt.rawText.trim().toString ()));
                        employeeSalaryModel.setBalanceAmount(Double.parseDouble(txtEmpSalToPay.rawText.trim().toString ()));
                        employeeSalaryModel.setFixedSalary(Double.parseDouble(txtEmpFixed_Sal.rawText.trim().toString ()));
                        employeeSalaryController.updateRecord(employeeSalaryModel);
                        FXalert(4);
                        insertSalary(payAmt,DateUtils.changeFormatDate(txtPayDate.text),0);
                        clearAll();
                        chk = true;
                    }                                    
                }
            }else {
                FXinfo("Entered Salary amount exceeds the Salary fixed for this employee.");
                }
            }
        } catch (e: Exception) {
            var msg: String = "Class : Employee Salary  method : saveclick()  = {e.getMessage()}";
            log.debug(msg);
            
        }
    }
function insertSalary(payAmt : Double, tDate : String , num : Integer): Boolean {
                
                var dailyCashBookModel : DailyCashBookModel=new DailyCashBookModel();                
                dailyCashBookModel.setDate(tDate);
                //Controller Instance
                commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
                dailyCashBookModel= commonController.viewCashBook(dailyCashBookModel) as DailyCashBookModel;
                var expenseamt1 = String.valueOf(dailyCashBookModel.getOtherExpenses1());
                var expenseamt2 = String.valueOf(dailyCashBookModel.getOtherExpenses2());
                var expenseamt3 = String.valueOf(dailyCashBookModel.getOtherExpenses3());
                var expenseamt4 = String.valueOf(dailyCashBookModel.getOtherExpenses4());
                var val = dailyCashBookModel.getOtherExpenses1();
                var val1 = dailyCashBookModel.getOtherExpenses2();
                var val2 = dailyCashBookModel.getOtherExpenses3();
                var val3 = dailyCashBookModel.getOtherExpenses4();
                if(num==1)
                {
                if(expenseamt1.trim().length()>0)
                {
                    if(val <= 0)
                    {
                        expenseamt1 = "{payAmt}";
                    }else{
                    expenseamt1 = "{val + payAmt}";
                }
                }else{
                    expenseamt1 = "{payAmt}";
                }
                }else if(num == 0){
                if(expenseamt1.trim().length()>0)
                {
                        var salry : Double = 0;
                        var sal = oldSal;
                        if(sal.trim().length()>0)
                        {
                            salry = Double.parseDouble(sal);
                        }
                        expenseamt1 = "{(payAmt - salry) + val}";
                }
                }
                 else  {
                if(expenseamt1.trim().length()>0)
                {
                        var salry : Double = 0;
                        var sal = oldSal;
                        if(sal.trim().length()>0)
                        {
                            salry = Double.parseDouble(sal);
                        }
                        expenseamt1 = "{ val - salry }";
                }
                }
                var openbalance = Value.Round(dailyCashBookModel.getOpenCashBalance());
                var paymnt = dailyCashBookModel.getCreditPayments();
                var withdrw = dailyCashBookModel.getCashWithdrawal();
                var maintn = dailyCashBookModel.getCreditMaintain();
                val = Double.parseDouble(expenseamt1);
                val1 = Double.parseDouble(expenseamt2);
                val2 = Double.parseDouble(expenseamt3);
                val3 = Double.parseDouble(expenseamt4);
                var totCredt = (withdrw + paymnt + maintn + val + val1 + val2 + val3);
                var totDebdt = Double.parseDouble(Value.Round(dailyCashBookModel.getTotalDebit()));
                var openbal = Double.parseDouble(openbalance);
                var closeBal = ((openbal + totDebdt) - totCredt);
                dailyCashBookModel.setDate(tDate);                
                dailyCashBookModel.setCloseCashBalance(closeBal);
                dailyCashBookModel.setCashWithdrawal(Double.parseDouble(Value.Round(withdrw)));
                dailyCashBookModel.setCreditPayments(Double.parseDouble(Value.Round(paymnt)));
                dailyCashBookModel.setCreditMaintain(Double.parseDouble(Value.Round(maintn)));
                if(dailyCashBookModel.getExpenses1()!= null ) {

                } else {
                    dailyCashBookModel.setExpenses1("EmployeeSalary");
                }                
                dailyCashBookModel.setOtherExpenses1(val);
                dailyCashBookModel.setTotalCredit(Double.parseDouble(Value.Round(Value.Round(totCredt))));
                var isInsert = false ;
                //CommonController Call
                isInsert = commonController.createRecord(dailyCashBookModel) as Boolean ;                
                oldSal = null;
                return isInsert ;
}

    function btnEmpSaveOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
    if(event.code == KeyCode.VK_ENTER) {
        saveClick(); }
    }

    function txtEmpDetailsOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {

        if (event.code == KeyCode.VK_TAB) {
            btnEmpSave.requestFocus();
        } shortcut(event);
    }

    function txtEmpPayAmtOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtEmpPayAmt.style = mandatoryStyle;
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtEmpDetails.requestFocus();
        } shortcut(event);
    }

    function imageViewOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        datePickclick();
    }

    function imageViewOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        datePickclick();
    }

    function datePickclick(): Void {
     empPanel.visible=true;
        if (not sal_Flag) {
            empPanel.layoutY = imageView.layoutY + txtPayDate.height + 2.0;
            if (txtPayDate.text != null) {
                var dat = txtPayDate.rawText.trim().split("-");
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

            fxCalendar.visible =true;
            sal_Flag = true;
        } else {
            fxCalendar.visible = false;
        }
    }

    var visit = bind fxCalendar.visible on replace {
        if (sal_Flag and not visit) {
            getDate(0);
        }
    };

    function getDate(i: Integer) {
        if (i == 0) {
            txtPayDate.text = fxCalendar.getSelectedDate();
            sal_Flag = false;
            txtMonth.requestFocus();
        }
    }

    function txtEmpNameOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        var payMon = txtMonth.rawText.trim();
        var payYear = txtYear.rawText.trim();
        if (payMon != null and payMon.trim().length() > 0 and payYear != null and payYear.trim().length() > 0) {
            var n:Integer=0;
           n=getEmp(event);
            sar=n;
                 if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {

                if(n==0 or txtEmpName.rawText.trim()==null or txtEmpName.rawText.trim()=="null" ){

                    txtEmpName.text=" ";

                }
        }else  if (event.code == KeyCode.VK_DOWN){
                listEmployee.requestFocus();
}
        } else {
            FXinfo("Please enter a valid month and year.", txtMonth);

        }
    }

    public function getEmp(event: javafx.scene.input.KeyEvent):Integer {        
        listH = 0.0;
        var m:Integer=0;
        var empName: String[] = [];
        listEmployee.visible = true;
        listW = txtEmpName.width;
        var size = listEmployee.items.size();

        if (not listEmployee.items.isEmpty()) {
            for (i in [0..<size])
                listEmployee.items[i] = null;
            txtEmpName.requestFocus();
        }
        //Controller Instance
        commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
        empName = commonController .getEmployers(txtEmpName.rawText.trim()).toArray() as String[];
        if(empName.size()>0 ) {
              listEmployee.clearSelection();
             m=5;
        listEmployee.items = empName;
        listEmployee.onKeyPressed = function(e) {
                    if (e.code == KeyCode.VK_ENTER) {
                        txtEmpName.text = "{listEmployee.selectedItem}";
                        var sam: String = txtEmpName.rawText.trim();
                        displayEmp(sam);
                         if(m==0 or txtEmpName.rawText.trim()==null or txtEmpName.rawText.trim()=="null" ){ m=0;txtEmpName.text=""; }
                        listEmployee.visible = false;
                        txtEmpPayAmt.requestFocus();
                    } else if (e.code == KeyCode.VK_DOWN) {

                        if (listEmployee.selectedIndex == 0) {
                            listEmployee.selectFirstRow();
                        }
                    } else if (e.code == KeyCode.VK_ESCAPE) {
                        listEmployee.visible = false;
                        txtEmpName.requestFocus();
                    }
                };
        listEmployee.onMouseClicked = function(e) {
                    txtEmpName.text = "{listEmployee.selectedItem}";
                    var sam: String = txtEmpName.rawText.trim();
                    displayEmp(sam);
                  if(m==0 or txtEmpName.rawText.trim()==null or txtEmpName.rawText.trim()=="null" ) {m=0;txtEmpName.text=""; }
                    listEmployee.visible = false;
                    txtEmpPayAmt.requestFocus();
                }

        var height: Integer = 0;
        if (listEmployee.items.size() < 7) {
            height = listEmployee.items.size();
        } else {
            height = 6;
        }
        for (i in [1..height]) {
            listH += 25.0;
        }
}else{
    m=0; listEmployee.visible = false;
}


        if (event.code == KeyCode.VK_ESCAPE    ) {
            listEmployee.visible = false;
             if(m==0 or  txtEmpName.rawText.trim()==null or txtEmpName.rawText.trim()=="null" ) {m=0;txtEmpName.text=""; }
        }


        txtEmpName.requestFocus();
        return m;
    }

    public function displayEmp(name: String): Void {        
        //Controller Instance
        var employeeController : Employee = RegistryFactory.getClientStub(RegistryConstants.Employee) as Employee;
        // From Employee Information
        var employeeSalaryModel : EmployeeSalaryModel;
        var employeeModel : EmployeeModel=employeeController.viewRecord(name) as EmployeeModel;
        var fix_sal: Double = 0.0;
        var paid_amt: Double = 0.0;
        var bal_amt: Double = 0.0;

        if(name!=null and name!="" and name!="null"){
        try {
            txtEmpCode.text = employeeModel.getEmployeeCode();
            txtEmpAge.text = employeeModel.getAge();
            txtEmpGender.text = employeeModel.getGender();
            txtEmpFixed_Sal.text = employeeModel.getFixedSalary().toString();

            fix_sal = employeeModel.getFixedSalary();
            employeeSalaryModel=new EmployeeSalaryModel();
            employeeSalaryModel.setSalaryId(null);
            employeeSalaryModel.setEmployeeName(name);
            employeeSalaryModel.setSalaryMonth(txtMonth.text);
            employeeSalaryModel.setSalaryYear(txtYear.text);
            //Controller Instance
            employeeSalaryController = RegistryFactory.getClientStub(RegistryConstants.EmployeeSalary) as com.vanuston.medeil.implementation.EmployeeSalary ;
            employeeSalaryModel=employeeSalaryController.viewRecord(employeeSalaryModel) as EmployeeSalaryModel;
            txtEmpAdvAmt.text = String.valueOf(Value.Round(employeeSalaryModel.getPaidAmount(), 2));
            txtEmpSalToPay.text = String.valueOf(Value.Round(fix_sal-employeeSalaryModel.getPaidAmount(), 2));
            if(employeeSalaryModel.getSalaryType()=="advance") {
                rdoEmpSalary.selected=false;
                rdoEmpadvance.selected=true;
            }
        } catch (e: Exception) {
            var msg: String = "Class : Employee Salary  method : displayEmp()  = {e.getMessage()}";
            log.debug(msg);
            
        }
        }
    }

    function listEmployeeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {

        if (listEmployee.focused) {
            if (event.code == KeyCode.VK_DOWN)
                listEmployee.selectFirstRow();
        }
    }

    function mandatory(): Void {

        txtMonth.style = mandatoryStyle;
        txtYear.style = mandatoryStyle;
        txtEmpPayAmt.style = mandatoryStyle;
        txtEmpName.style = mandatoryStyle;
        txtPayDate.style = mandatoryStyle;

    }

    public function StartUp(): Void {
        clearAll();        
        currentState.actual = currentState.findIndex("Shown");
        panel.visible = true;        
        salesEmpId = "";
        employeSalTable.layoutX = 0;
        employeSalTable.layoutY = 0;
        panelTable.content = [employeSalTable,];
        fxCalendar.visible = false;
        empPanel.content = [fxCalendar,];
        txtPayDate.text = today;
        employeSalTable.visible = false;
        imageView.image = Image { url: "{__DIR__}images/Calender.png" };
        mandatory();
        txtMonth.requestFocus();
    }

    public function updateValues() {
        try {
            if (salesEmpId == "" or salesEmpId.trim().length() == 0) {
                btnEmpSaveText = "Save [F3]";
                btnEmpEditText = "Edit [F6]";
            } else {
                btnEmpSaveText = "Update [F7]";
                btnEmpEditText = "Delete [F5]";
                btnEmpCancel.text="Back [Ctrl+Left]";
            }
        } catch (e: Exception) {
            var msg: String = "Class :Employee Salary method : updateValues()  = {e.getMessage()}";
            log.debug(msg);
        }
    }
      public function CancelForm(): Void {
          CommonDeclare.form[3] = 0;
      }
}


