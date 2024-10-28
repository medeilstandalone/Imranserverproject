package com.vanuston.medeil.ui;



import javafx.ext.swing.SwingComponent;
import java.awt.Dimension;
import javafx.scene.input.KeyCode;
import com.vanuston.medeil.util.Value;
import com.vanuston.medeil.util.Validation;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.CommonDeclare;
import javafx.scene.control.TextBox;
import com.vanuston.medeil.util.KeyRegistry;
import java.util.Calendar;
import com.vanuston.medeil.uitables.MaintanenceTable;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.implementation.MaintenanceCost ;
import com.vanuston.medeil.model.MaintenanceCostModel;
import java.sql.Date;
import com.vanuston.medeil.uitables.ConfirmDialogBox;
import com.vanuston.medeil.ui.calendar.theme.Theme;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import java.lang.Exception;
import java.lang.Class;
import javafx.scene.image.Image;
import com.vanuston.medeil.util.GetProductInfo;

public class MaintananceCost {

    var len: Integer = 0;
    var rowNo = 11;
    var colNames: Object[] = ["S.No", "Particulars", "Due Date", "Payment Status", "Payment Type", "Cheque/Ref.No", "Amount"];
    var colType: Class[] = [java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.Double.class];
    var colEditable: Boolean[] = [false, true, false, true, true, true, true];
    var colWidth: Integer[] = [30, 120, 100, 100, 80, 100, 78];
//    def MaintanenceTable = MaintanenceTable {} ;
    var maintanenceTable : MaintanenceTable = new MaintanenceTable () ;
    var table = maintanenceTable.createViewTable(rowNo, colNames, colType, colEditable, colWidth);
    var tableComp = SwingComponent.wrap(maintanenceTable.getScrollTable(table));
    var monthItem: String[] = ["Select Month", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
    var dateFlag: Boolean = false;
    var fxCalendar = FXCalendar {
                theme: Theme {};
            };
    var log: Logger = Logger.getLogger(MaintananceCost.class, "Setting");
    //Controller Instance
    var commonController : CommonImplements ;//= RegistryFactory.getClientStub(RegistryConstants.CommonImplements ) as CommonImplements ;
    var maintenanceCostController : MaintenanceCost ;//= RegistryFactory.getClientStub(RegistryConstants.MaintenanceCost ) as MaintenanceCost ;
    var LayoutY: Float;
    var listH = 0.0;
    var panelW = bind CommonDeclare.ScreenWidth - 4;
    var panelH = bind CommonDeclare.panelFormH;
    var C1LX = bind C2LX - 50;
    var C2LX = bind CommonDeclare.Column12LX;
    var C3LX = bind C4LX - 50;
    var C4LX = bind CommonDeclare.Column14LX;
    var botton1LX = bind CommonDeclare.botton21LX;
    var botton2LX = bind CommonDeclare.botton22LX;
    var botton3LX = bind CommonDeclare.botton23LX;
    var botton4LX = bind CommonDeclare.botton24LX;
    var bottonW = bind CommonDeclare.bottonW;
    var bottonH = bind CommonDeclare.bottonH;
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var seperatorW = bind CommonDeclare.seperatorFullScreenW;
    var imageCloseLX = bind panelW - 16;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;
    var Type4TextboxW = bind CommonDeclare.Type4TextboxW + 25;
    var AmtPanelLX = bind 48.28462516 * panelW / 100;
    var AmtTextW = bind 40.66073698 * panelW / 100;
    var ImageCalenderLX = bind C4LX + Type4TextboxW + 2;
    var panelCalenderLX = bind C4LX + Type4TextboxW - 20;
    var ListW: Number = 0;
    var TableH = 237.0;
    var TableW = bind (95.29860229 * panelW) / 100 on replace {
                changeTableSize(TableW);
            };    
    var rectbutton2LX = bind ((panelW + TableW) / 2) - 100;
    var rectbutton1LX = bind ((panelW + TableW) / 2) - 240;

    function changeTableSize(i: Integer): Void {
        tableComp.getJComponent().setPreferredSize(new Dimension(i, TableH));
    }

    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 397.5
        layoutY: 0.0
        styleClass: "rectFormHeader"
        width: bind panelW
        height: 575.0
    }
    
    def __layoutInfo_txtMaintaYear: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtMaintaYear: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX
        layoutY: 128.0
        layoutInfo: __layoutInfo_txtMaintaYear
    }
    
    def __layoutInfo_cboMaintaMonth: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def cboMaintaMonth: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: bind C2LX
        layoutY: 100.0
        layoutInfo: __layoutInfo_cboMaintaMonth
        items: bind monthItem
    }
    
    public-read def panelTable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelTableLX
        layoutY: bind panelTableLY
        blocksMouse: true
    }
    
    public-read def rectTableBorder: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind panelTableLX
        layoutY: bind panelTableLY
        styleClass: "rectTableBorder"
        width: bind TableW
        height: bind TableH
    }
    
    public-read def imageView3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
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
    
    public-read def imgCancel: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX
        layoutY: 91.0
        text: "Label"
    }
    
    def __layoutInfo_txtMaintaDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtMaintaDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C4LX
        layoutY: 85.0
        layoutInfo: __layoutInfo_txtMaintaDate
    }
    
    public-read def imageDate: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind ImageCalenderLX
        layoutY: 141.0
    }
    
    public-read def panelCalender: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind ImageCalenderLX
        layoutY: 120.0
    }
    
    def __layoutInfo_listMaintain: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind ListW
        height: bind listH
    }
    public-read def listMaintain: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C2LX
        layoutInfo: __layoutInfo_listMaintain
    }
    
    public-read def rectAddRow: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        width: 100.0
        height: 50.0
    }
    
    def __layoutInfo_label6: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def label6: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutY: 423.0
        layoutInfo: __layoutInfo_label6
        text: "Label"
    }
    
    public-read def groupAddRow: javafx.scene.Group = javafx.scene.Group {
        visible: false
        layoutX: bind rectbutton1LX
        content: [ rectAddRow, label6, ]
    }
    
    public-read def rectRemoveRow: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        width: 100.0
        height: 50.0
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
    }
    
    public-read def Violet: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.011764706
        green: 0.5019608
        blue: 0.7607843
    }
    
    public-read def linearGradient: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#ffffff") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#f5f0e9") }, ]
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
    
    def __layoutInfo_btnMaintaCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW+30
        height: bind bottonH
    }
    public-read def btnMaintaCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton4LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnMaintaCancel
        effect: reflectionEffect
        graphic: imgCancel
        text: "Cancel [Esc]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnMaintaSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnMaintaSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnMaintaSave
        translateX: 0.0
        effect: reflectionEffect
        graphic: imageView
        text: "Save  [F2]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnMaintaEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnMaintaEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton2LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnMaintaEdit
        effect: reflectionEffect
        graphic: imgEdit
        text: "Edit  [F4]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnMaintaReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnMaintaReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton3LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnMaintaReset
        effect: reflectionEffect
        graphic: imageView3
        text: "Reset [F5]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    public-read def panelButtons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: 244.0
        layoutY: bind panelButtonsLY
        content: [ btnMaintaReset, btnMaintaEdit, btnMaintaSave, btnMaintaCancel, ]
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
    
    def __layoutInfo_label3: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 424.0
        layoutInfo: __layoutInfo_label3
        text: "RemoveRow"
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def groupRemoveRow: javafx.scene.Group = javafx.scene.Group {
        visible: false
        layoutX: bind rectbutton2LX
        content: [ rectRemoveRow, label3, ]
    }
    
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 461.0
        text: "Net Amount"
        font: Arial_16
        textFill: DarkGray
    }
    
    public-read def label14: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 100.0
        text: "Month"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 128.0
        styleClass: "label"
        text: "Year"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.4
    }
    
    public-read def dropShadowEffect: javafx.scene.effect.DropShadow = javafx.scene.effect.DropShadow {
    }
    
    public-read def lightingEffect: javafx.scene.effect.Lighting = javafx.scene.effect.Lighting {
    }
    
    def __layoutInfo_label: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
    }
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 553.0
        layoutY: 34.0
        layoutInfo: __layoutInfo_label
        effect: lightingEffect
        text: "Maintanance Cost"
        font: Arial_25
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
    }
    
    public-read def Arial_30: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
        size: 30.0
    }
    
    def __layoutInfo_txtMaintaNetAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind AmtTextW
        height: 38.0
    }
    public-read def txtMaintaNetAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 448.0
        layoutInfo: __layoutInfo_txtMaintaNetAmt
        promptText: "0.00"
        font: Arial_30
    }
    
    public-read def panelAmt: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind AmtPanelLX
        content: [ txtMaintaNetAmt, label5, ]
    }
    
    public-read def Yellow: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 1.0
        blue: 0.8
    }
    
    public-read def linearGradient2: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
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
    
    public-read def Arial_Bold_65: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 65.0
    }
    
    public-read def imageBack: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/arrow_Left.png"
    }
    
    public-read def imageDown: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imageViewDown: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C2LX+Type4TextboxW-2
        layoutY: 116.0
        image: imageDown
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ rectangle, rectHeader, label, label2, txtMaintaYear, label14, cboMaintaMonth, panelTable, rectTableBorder, panelButtons, panelAmt, label4, txtMaintaDate, imageDate, panelCalender, listMaintain, groupAddRow, groupRemoveRow, panelAlert, imageViewDown, ]
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
                            rectangle.onMouseClicked = rectangleOnMouseClickedAtShown;
                            rectangle.blocksMouse = true;
                            rectangle.stroke = DarkGray;
                            rectangle.arcWidth = 5.0;
                            rectangle.arcHeight = 5.0;
                            rectHeader.visible = true;
                            rectHeader.opacity = 0.25;
                            rectHeader.layoutX = 0.0;
                            rectHeader.fill = linearGradient2;
                            rectHeader.height = 32.0;
                            rectHeader.arcWidth = 5.0;
                            rectHeader.arcHeight = 5.0;
                            label.layoutX = 0.0;
                            label.layoutY = 1.0;
                            label.text = "Maintenance Cost";
                            label.hpos = javafx.geometry.HPos.CENTER;
                            label2.layoutY = 95.0;
                            txtMaintaYear.visible = true;
                            txtMaintaYear.layoutY = 93.0;
                            txtMaintaYear.onKeyPressed = txtMaintaYearOnKeyPressedAtShown;
                            txtMaintaYear.onKeyReleased = txtMaintaYearOnKeyReleasedAtShown;
                            txtMaintaYear.font = Arial_12;
                            label14.layoutY = 126.0;
                            cboMaintaMonth.layoutY = 125.0;
                            __layoutInfo_cboMaintaMonth.width = 127.0;
                            cboMaintaMonth.onKeyPressed = cboMaintaMonthOnKeyPressedAtShown;
                            panelTable.visible = true;
                            rectTableBorder.visible = true;
                            imageView3.visible = true;
                            imageView3.image = imageReset;
                            btnMaintaReset.layoutY = 0.0;
                            btnMaintaReset.onKeyReleased = btnMaintaResetOnKeyReleasedAtShown;
                            btnMaintaReset.text = "Reset [F4]";
                            btnMaintaReset.action = btnMaintaResetActionAtShown;
                            imgEdit.visible = true;
                            imgEdit.image = imageEdit;
                            btnMaintaEdit.layoutY = 0.0;
                            btnMaintaEdit.text = "Edit [F6]";
                            btnMaintaEdit.action = btnMaintaEditActionAtShown;
                            imageView.visible = true;
                            imageView.image = imageSave;
                            btnMaintaSave.layoutY = 0.0;
                            btnMaintaSave.text = "Save [F3]";
                            btnMaintaSave.action = btnMaintaSaveActionAtShown;
                            imgCancel.visible = true;
                            imgCancel.image = imageCancel;
                            btnMaintaCancel.layoutY = 0.0;
                            btnMaintaCancel.text = "Cancel [F8]";
                            btnMaintaCancel.action = btnMaintaCancelActionAtShown;
                            panelButtons.visible = true;
                            panelButtons.layoutX = 0.0;
                            txtMaintaNetAmt.layoutX = 55.0;
                            txtMaintaNetAmt.layoutY = 6.0;
                            __layoutInfo_txtMaintaNetAmt.height = 70.0;
                            txtMaintaNetAmt.styleClass = "Borderless-text-box";
                            txtMaintaNetAmt.focusTraversable = false;
                            txtMaintaNetAmt.editable = false;
                            txtMaintaNetAmt.font = Arial_Bold_65;
                            label5.disable = true;
                            label5.opacity = 0.6;
                            label5.layoutY = 28.0;
                            label5.text = "Total";
                            label5.font = Arial_20;
                            panelAmt.visible = true;
                            panelAmt.layoutY = 410.0;
                            label4.visible = true;
                            label4.layoutY = 95.0;
                            label4.text = "Date";
                            label4.font = Arial_12;
                            txtMaintaDate.visible = true;
                            txtMaintaDate.layoutY = 93.0;
                            txtMaintaDate.onKeyPressed = txtMaintaDateOnKeyPressedAtShown;
                            txtMaintaDate.onKeyReleased = txtMaintaDateOnKeyReleasedAtShown;
                            txtMaintaDate.editable = false;
                            txtMaintaDate.font = Arial_12;
                            imageDate.visible = true;
                            imageDate.layoutY = 93.0;
                            imageDate.onMouseClicked = imageDateOnMouseClickedAtShown;
                            imageDate.blocksMouse = true;
                            panelCalender.visible = true;
                            panelCalender.layoutY = 110.0;
                            panelCalender.blocksMouse = true;
                            listMaintain.visible = false;
                            listMaintain.layoutY = 114.0;
                            listMaintain.onKeyPressed = listMaintainOnKeyPressedAtShown;
                            listMaintain.effect = null;
                            listMaintain.pannable = true;
                            rectAddRow.visible = true;
                            rectAddRow.layoutY = 0.0;
                            rectAddRow.styleClass = "rectbutton";
                            rectAddRow.height = 20.0;
                            rectAddRow.arcWidth = 10.0;
                            rectAddRow.arcHeight = 10.0;
                            label6.visible = true;
                            label6.layoutY = 0.0;
                            __layoutInfo_label6.width = 100.0;
                            __layoutInfo_label6.height = 20.0;
                            label6.onMouseClicked = label6OnMouseClickedAtShown;
                            label6.text = "Add Row";
                            label6.font = Arial_Bold_12;
                            label6.hpos = javafx.geometry.HPos.CENTER;
                            label6.vpos = javafx.geometry.VPos.CENTER;
                            label6.textFill = DarkGray;
                            groupAddRow.visible = true;
                            groupAddRow.layoutY = 400.0;
                            rectRemoveRow.visible = true;
                            rectRemoveRow.layoutY = 0.0;
                            rectRemoveRow.styleClass = "rectbutton";
                            rectRemoveRow.height = 20.0;
                            rectRemoveRow.arcWidth = 10.0;
                            rectRemoveRow.arcHeight = 10.0;
                            label3.layoutY = 0.0;
                            __layoutInfo_label3.width = 100.0;
                            __layoutInfo_label3.height = 20.0;
                            label3.onMouseClicked = label3OnMouseClickedAtShown;
                            label3.hpos = javafx.geometry.HPos.CENTER;
                            label3.vpos = javafx.geometry.VPos.CENTER;
                            groupRemoveRow.visible = true;
                            groupRemoveRow.layoutY = 400.0;
                            panelAlert.visible = true;
                            imageViewDown.visible = true;
                            imageViewDown.disable = false;
                            imageViewDown.layoutY = 93.0;
                            imageViewDown.onMouseClicked = imageViewDownOnMouseClickedAtShown;
                            imageViewDown.blocksMouse = true;
                            imageViewDown.fitWidth = 20.0;
                            imageViewDown.fitHeight = 21.0;
                            imageViewDown.preserveRatio = false;
                            panel.visible = true;
                            panel.onKeyPressed = panelOnKeyPressedAtShown;
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

    function imageViewDownOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        txtMaintaYear.style = mandatory;
        if (btnMaintaSave.text == "Update [F7]") {
            YearValue(1);
        } else if (btnMaintaSave.text == "Save [F3]") {
            YearEntryValue();
        }
    }

    function rectangleOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        fxCalendar.visible = false;
        listMaintain.visible = false;
    }

    function panelOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    var panelTableLX = bind (panelW - TableW) / 2;
    var panelTableLY = 152.0;
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    var mandatory: String = CommonDeclare.textbox_mandatory();
    var error: String = CommonDeclare.textbox_error();
    def CustomAlert = CustomAlert {};

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Maintanance Cost", type);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Maintenance Cost", msg);
        showAlertbox();
    }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Maintenance Cost", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = error;
    }

    function btnMaintaResetOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function label6OnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        fxCalendar.visible = false;
        maintanenceTable.addRow();
    }

    function label3OnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        fxCalendar.visible = false;
        maintanenceTable.removeRow();
    }

    function txtMaintaDateOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        fxCalendar.visible = false;
        shortcut(event);
    }

    function txtMaintaDateOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtMaintaDate.style = mandatory;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtMaintaYear.requestFocus();
        }
        if (event.code == KeyCode.VK_ESCAPE) {
            fxCalendar.visible = false;
        }
        shortcut(event);
    }

    def kr = KeyRegistry {};
    var key = bind CommonDeclare.currKyEvent on replace {
                shortcut(key);
            }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == kr.save and btnMaintaSave.text == "Save [F3]") {
            save();
        }
        if (event.code == kr.edit and btnMaintaEdit.text == "Edit [F6]") {
            edit();
        }
        if (event.code == kr.reset and btnMaintaReset.text == "Reset [F4]") {
            reset();
        }
        if (event.code == kr.update) {
            if (btnMaintaSave.text == "Update [F7]") { update(); }
        }
        if (event.code == kr.del) {
            if (btnMaintaEdit.text == "Delete [F5]") { del(); }
        }
        if (event.controlDown and event.code == kr.back) {
            if (btnMaintaCancel.text == "Back [Ctrl+Left]") { back(); }
        }
        if (event.code == kr.cancel) {
            if (btnMaintaCancel.text == "Cancel [F8]") { cancel(); }
        }
        if (event.code == kr.rRow) {
            maintanenceTable.removeRow();
        }
    }

    var ss = bind cboMaintaMonth.selectedItem on replace {
                if (ss != null and not ss.equals("Select Month")) {
                    fxCalendar.visible = false;
                    if (txtMaintaYear.text != null or txtMaintaYear.text.length() > 0) {
                     showTabValues();
                    } else {
                        FXinfo("Please select Year", txtMaintaYear);
                    }

                }
            }

    function showTabValues(): Void {
        if (btnMaintaSave.text == "Update [F7]" and btnMaintaEdit.text == "Delete [F5]") {
            var year: String = txtMaintaYear.text;
            var month: String = cboMaintaMonth.selectedItem.toString();
            displayValues(year, month);
        } else if (btnMaintaSave.text == "Save [F3]") {
            //Controller Instance
            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements ) as CommonImplements ;
            var j = commonController.countMaintCost(txtMaintaYear.rawText, cboMaintaMonth.selectedItem.toString ()) ;
            if (j == 0) {
//                maintanenceTable.clearData();
//                maintanenceTable.setParticularValue();
                maintanenceTable.focusSet();
                maintanenceTable.GetDefaultValues(txtMaintaYear.rawText);
                updateValues();
            } else {
                cboMaintaMonth.select(0);
                FXinfo("Maintenance Cost for the Month {cboMaintaMonth.selectedItem.toString()}-{txtMaintaYear.text} has already been set. If you want to change any values, Please change them in edit mode.");
                cboMaintaMonth.requestFocus();
//                edit () ;
            }
        }
    }

    function cboMaintaMonthOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB and btnMaintaSave.text == "Update [F7]" and btnMaintaEdit.text == "Delete [F5]") {
            var year: String = txtMaintaYear.rawText;
            var month: String = cboMaintaMonth.selectedItem.toString();
            if (cboMaintaMonth.selectedItem != "Select Month") {
                displayValues(year, month);
            } else {
                FXinfo("Please enter a valid Year and Month.");
                cboMaintaMonth.requestFocus();
            }
        } else if (event.code == KeyCode.VK_TAB and btnMaintaSave.text == "Save [F3]") {
            if (txtMaintaYear.text != null or cboMaintaMonth.selectedItem != "Select Month") {
                //Controller Instance
                commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements ) as CommonImplements ;
                var j = commonController.countMaintCost(txtMaintaYear.rawText, cboMaintaMonth.selectedItem.toString ()) ;
                if (event.code == KeyCode.VK_TAB and j == 0) {
                    if (txtMaintaYear.text != null or cboMaintaMonth.selectedItem != "Select Month") {                        
                        maintanenceTable.setParticularValue();
                        maintanenceTable.focusSet();
                        maintanenceTable.GetDefaultValues(txtMaintaYear.rawText);
                    } else {                        
                        FXinfo("Please enter a valid Year and Month");
                        txtMaintaYear.requestFocus();
                        maintanenceTable.clearData();
                    }
                } else {
                    cboMaintaMonth.select(0);
                    FXinfo("Maintenance Cost for the Month {cboMaintaMonth.selectedItem.toString()}-{txtMaintaYear.text} has already been set. If you want to change any values, Please change them in edit mode.");
                    cboMaintaMonth.requestFocus();
                    
                }
            }
        }
        shortcut(event);
    }

    function txtMaintaYearOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            fxCalendar.visible = false;
            listMaintain.visible = false;
            cboMaintaMonth.select(0);
            monthItem = ["Select Month", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];            
            cboMaintaMonth.requestFocus();
        }
    }

    function txtMaintaYearOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        fxCalendar.visible = false;
        if (btnMaintaSave.text == "Update [F7]" and btnMaintaEdit.text == "Delete [F5]") {
            YearValue(0);
            if (event.code == KeyCode.VK_DOWN and listMaintain.items != null) {
                listMaintain.requestFocus();
                listMaintain.selectFirstRow();
            }
            if (event.code == KeyCode.VK_ESCAPE) {
                listMaintain.visible = false;
                txtMaintaYear.requestFocus();
            }
        } else if (btnMaintaSave.text == "Save [F3]" and btnMaintaSave.disable == false) {
            YearEntryValue();
            if (event.code == KeyCode.VK_DOWN and listMaintain.items != null) {
                listMaintain.requestFocus();
                listMaintain.select(2); }
            if (event.code == KeyCode.VK_ESCAPE) {
                listMaintain.visible = false;
                txtMaintaYear.requestFocus();
            }
            if(cboMaintaMonth.selectedItem != null or cboMaintaMonth.selectedItem != "Select Month") {
                //Controller Instance
                commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements ) as CommonImplements ;
                if(commonController.countMaintCost(txtMaintaYear.rawText, cboMaintaMonth.selectedItem.toString ()) ==1) {
                    FXinfo("Maintenance Cost for the Month {cboMaintaMonth.selectedItem.toString()}-{txtMaintaYear.text} has already been set. If you want to change any values, Please change them in edit mode.");
                }

            }

        } shortcut(event);

    }

    function listMaintainOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (listMaintain.focused) {
            if (event.code == KeyCode.VK_DOWN)
                listMaintain.selectFirstRow();
        }
    }

    public function YearValue(con: Integer) {
        if(not listMaintain.visible){
        listMaintain.visible = true;
        listH = 0.0;
        ListW = txtMaintaYear.width + 18;
        var size = listMaintain.items.size();
        if (not listMaintain.items.isEmpty()) {
            for (i in [0..<size])
                listMaintain.items[i] = null;
            txtMaintaYear.requestFocus();
        }
        //Controller Instance
        commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements ) as CommonImplements ;
        if (con == 0) {
            //commonController Instance
            listMaintain.items = commonController.getYear(txtMaintaYear.rawText.trim()).toArray() as String [] ;
        } else {
            listMaintain.items = commonController.getYear("").toArray() as String [] ;
        }
        listMaintain.clearSelection();
        listMaintain.onKeyPressed = function(e) {
                    if (e.code == KeyCode.VK_ENTER) {
                        txtMaintaYear.text = "{listMaintain.selectedItem}";
                        listMaintain.visible = false;
                        loadMonth();
                        cboMaintaMonth.requestFocus();
                    } else if (e.code == KeyCode.VK_DOWN) {
                        if (listMaintain.selectedIndex == 0) {
                            listMaintain.selectFirstRow();
                        }
                    } else if (e.code == KeyCode.VK_ESCAPE) {
                        listMaintain.visible = false;
                        txtMaintaYear.requestFocus();
                    }
                };
        listMaintain.onMouseClicked = function(e) {
                    txtMaintaYear.text = "{listMaintain.selectedItem}";
                    listMaintain.visible = false;
                    loadMonth();
                    cboMaintaMonth.requestFocus();
                }
        var height: Integer = 0;
        if (listMaintain.items.size() < 9) {
            height = listMaintain.items.size();
        } else {
            height = 8;
        }
        for (i in [1..height]) {
            listH += 25.0;
        }
       }
       else{
           listMaintain.visible = false;
       }
    }

    public function YearEntryValue() {
        if(not listMaintain.visible){
        listMaintain.visible = true;
        listH = 0.0;
        ListW = txtMaintaYear.width + 18;
        var size = listMaintain.items.size();
        if (not listMaintain.items.isEmpty()) {
            for (i in [0..<size])
                listMaintain.items[i] = null;
            txtMaintaYear.requestFocus();
        }
        var x = Calendar.getInstance().get(Calendar.YEAR);
        listMaintain.items = ["{x - 2}", "{x - 1}", "{x}", "{x + 1}", "{x + 2}", "{x + 3}", "{x + 4}", "{x + 5}"];
        listMaintain.select(2);
        listMaintain.onKeyPressed = function(e) {
                    if (e.code == KeyCode.VK_ENTER) {
                        txtMaintaYear.text = "{listMaintain.selectedItem}";
                        listMaintain.visible = false;
                        cboMaintaMonth.requestFocus();
                    } else if (e.code == KeyCode.VK_DOWN) {
                        if (listMaintain.selectedIndex == 0) {
                            listMaintain.selectFirstRow();
                        }
                    } else if (e.code == KeyCode.VK_ESCAPE) {
                        listMaintain.visible = false;
                        txtMaintaYear.requestFocus();
                    }
                };
        listMaintain.onMouseClicked = function(e) {
                    txtMaintaYear.text = "{listMaintain.selectedItem}";
                    listMaintain.visible = false;
                    cboMaintaMonth.requestFocus();
                }
        var height: Integer = 0;
        if (listMaintain.items.size() < 9) {
            height = listMaintain.items.size();
        } else {
            height = 8;
        }
        for (i in [1..height]) {
            listH += 25.0;
        }
       }
       else{
           listMaintain.visible=false;
       }
     }

    public function loadMonth(): Void {
        var year = txtMaintaYear.text;
        try {
            //Controller Instance
            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements ) as CommonImplements ;
            monthItem = commonController.getMonthList(year).toArray() as String [] ;
            cboMaintaMonth.select(0);
        } catch (e: Exception) {
            var msg: String = "Class : Maintanance Cost  Method : loadMonth()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function btnMaintaCancelActionAtShown(): Void {
        cancel();
    }

    function btnMaintaResetActionAtShown(): Void {
        reset();
    }

    function btnMaintaEditActionAtShown(): Void {
        if (btnMaintaEdit.text == "Delete [F5]") {
            del();
        } else {
            edit();
        }
    }

    function btnMaintaSaveActionAtShown(): Void {
        if (btnMaintaSave.text == "Update [F7]") {
            update();
        } else {
            save();
        }
    }

    public function edit(): Void {
        clear();
        listMaintain.visible = false;
        monthItem = ["Select Month"];
        btnMaintaEdit.text = "Delete [F5]";
        btnMaintaCancel.text = "Back [Ctrl+Left]";
        imgCancel.image = imageBack;
        imgEdit.image = imageCancel;
        btnMaintaSave.text = "Update [F7]";
        cboMaintaMonth.select(0);
        txtMaintaYear.requestFocus();
    }

    public function reset(): Void {
        if (btnMaintaSave.text == "Update [F7]") {
            chkFlag1();
            clear();
            monthItem = ["Select Month"];
            cboMaintaMonth.select(0);
        } else {
            clear();
            maintanenceTable.setParticularValue();
            cboMaintaMonth.select(0);
        }
        txtMaintaYear.requestFocus();
    }

    public function cancel(): Void {
        if (btnMaintaCancel.text == "Back [Ctrl+Left]") {
            back();
        } else {
            clear();
            tableComp = null;
            delete  panelCalender.content;
            delete  panelTable.content;
            delete  panel.content;
            panel.visible = false;
            CommonDeclare.MainPageForm = "";
        }
    }

    function chkFlag0(): Void {
        try {
        var tableValues = maintanenceTable.getTableValues();
        for (i in [0..<maintanenceTable.rowCount]) {
            var chq_no = tableValues[i][5];
            var amount = tableValues[i][6];
            if (amount != "0") {
                //Controller Instance
                commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements ) as CommonImplements ;
                commonController.setChequeFlag(chq_no, 0);
            }
        }
        } catch (e : Exception){
            log.debug("Error in chkFlag0() in MaintanaceCost :{e.getMessage()}");
        }
    }

    function chkFlag1(): Void {
        try {
        var tableValues = maintanenceTable.getTableValues();        
        for (i in [0..<maintanenceTable.rowCount]) {
            var chq_no = tableValues[i][5];
            var amount = tableValues[i][6];
            if (amount != "0") {
                //Controller Instance
                commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements ) as CommonImplements ;
                commonController.setChequeFlag(chq_no, 1) ;
            }
        }
        } catch (e : Exception){
            log.debug("Error in chkFlag1() in MaintanaceCost :{e.getMessage()}");            
        }

//        maintanenceTable.rowCount = 0 ;
    }

    public function back(): Void {
        chkFlag1();
        listMaintain.visible = false;
        monthItem = ["Select Month", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
        cboMaintaMonth.select(0);
        btnMaintaEdit.disable = false;
        btnMaintaEdit.text = "Edit [F6]";
        btnMaintaReset.disable = false;
        btnMaintaReset.text = "Reset [F4]";
        clear();
        maintanenceTable.setParticularValue();
        btnMaintaSave.text = "Save [F3]";
        btnMaintaSave.disable = false;
        btnMaintaCancel.text = "Cancel [F8]";
        imgCancel.image = imageCancel;
        imgEdit.image = imageEdit;
        txtMaintaYear.requestFocus();
    }

    public function del(): Void {
        try {
            var month = cboMaintaMonth.selectedItem.toString();
            var year = txtMaintaYear.text;
            if (year.length() == 0) {
                FXinfo("Please select a valid Year and Month.", txtMaintaYear);
            } else {
                var cn : ConfirmDialogBox = new ConfirmDialogBox(1,"Maintanace Cost");
                var a =bind cn.staus;
                                if (a) {
                                    chkFlag0();
                                    var maintenanceCostModel : MaintenanceCostModel = new MaintenanceCostModel () ;
                                    maintenanceCostModel.setMonth (cboMaintaMonth.selectedItem.toString ()) ;
                                    maintenanceCostModel.setYear (Integer.parseInt (txtMaintaYear.text)) ;
                                    //Controller Instance
                                    maintenanceCostController = RegistryFactory.getClientStub(RegistryConstants.MaintenanceCost ) as MaintenanceCost ;
                                    if (maintenanceCostController.deleteRecord (maintenanceCostModel)) {
                                        FXalert(5);
                                    }
                                    clear();
                                    monthItem = ["Select"];
                                }
            }
        } catch (e: Exception) {
            var msg: String = "Class : Maintanance Cost  Method : Delete()   = {e.getMessage()}";
            log.debug(msg);
        }
        txtMaintaYear.requestFocus();
    }

    public function clear(): Void {
        txtMaintaDate.requestFocus();
        txtMaintaDate.text = DateUtils.now("dd-MM-yyyy");
        cboMaintaMonth.select(0);
        txtMaintaYear.text = null;
        maintanenceTable.clearData();
        txtMaintaNetAmt.text = null;
    }

    public function save(): Void {
        var tableValues = maintanenceTable.getTableValues();
        len = maintanenceTable.totItems;        
        try {
             //Controller Instance
            commonController = RegistryFactory.getClientStub(RegistryConstants.CommonImplements ) as CommonImplements ;
            var j = commonController.countMaintCost(txtMaintaYear.rawText, cboMaintaMonth.selectedItem.toString ()) ;
            var chk = checkValid();
            if (j==0) {
            if (chk == 10) {
                var countCreate : Integer = 0 ;
                var maintenanceCostModel : MaintenanceCostModel = new MaintenanceCostModel () ;
                maintenanceCostModel.setDate (Date.valueOf (DateUtils.changeFormatDate (txtMaintaDate.text))) ;
                maintenanceCostModel.setMonth (cboMaintaMonth.selectedItem.toString ()) ;
                maintenanceCostModel.setYear (Integer.parseInt (txtMaintaYear.text)) ;
                var netamt = Double.valueOf(txtMaintaNetAmt.text);
                netamt = Value.Round(netamt, 2);
                maintenanceCostModel.setNetTotal (netamt) ;

                var cdate = DateUtils.changeFormatDate(txtMaintaDate.text);
                var month = cboMaintaMonth.selectedItem.toString();
                var year = txtMaintaYear.text;                
                for (i in [0..<len]) {
                    if (tableValues[i][2] != null and tableValues[i][3] != null and tableValues[i][6] != null) {
                        var sn = tableValues[i][0];
                        var part = tableValues[i][1];
                        var date1: String = "";

                        if (tableValues[i][2] == null or tableValues[i][2].length() == 0 or tableValues[i][2].equals("null")) {
                        } else {
                            date1 = tableValues[i][2].trim();
                            date1 = date1.replaceAll("'", "");
                        }
                        var pay_status = tableValues[i][3].trim();
                        //                        pay_status = pay_status.trim();
                        if (pay_status == null or pay_status.equals("null") or pay_status.length() == 0) {
                            pay_status = "";
                        } else {
                            pay_status = pay_status.replaceAll("'", "") ;
                        }
                        var pay_type = tableValues[i][4] ;
                        var chq_no = tableValues[i][5] ;
                        var amount = tableValues[i][6] ;
                        if (amount != "0") {
                            maintenanceCostModel.setSerialNo (Integer.parseInt (sn)) ;
                            maintenanceCostModel.setParticular (part) ;
                            maintenanceCostModel.setDueDate (DateUtils.changeFormatDate(date1)) ;
                            maintenanceCostModel.setPaymentStatus (pay_status) ;
                            maintenanceCostModel.setPaymentType (pay_type) ;
                            maintenanceCostModel.setChequeNo (chq_no) ;
                            maintenanceCostModel.setAmount (Double.parseDouble (amount)) ;
                            maintenanceCostModel.setNetTotal (netamt) ;
                            //Controller Call
                            maintenanceCostController = RegistryFactory.getClientStub(RegistryConstants.MaintenanceCost ) as MaintenanceCost ;
                            if ( maintenanceCostController.createRecord(maintenanceCostModel) as Boolean ) {
                                chkFlag1();
                                countCreate += 1 ;
                            }                            
                        }
                    }

                }
                if (countCreate > 0)
                    FXalert(0);
                clear();
                maintanenceTable.setParticularValue() ;
            }
            }else {
                FXinfo("Entered Year and Month is Already Exist", txtMaintaYear);
            }

        } catch (e: Exception) {            
            var msg: String = "Class : Maintanance Cost  Method : Save()   = {e.getMessage()}";
            log.debug(msg);
        }
        txtMaintaYear.requestFocus();
    }

    public function update(): Void {

        len = maintanenceTable.totItems;
        var tableValues = maintanenceTable.getTableValues();
        try {
            var chk = checkValid();
            if (chk == 10) {
                var maintenanceCostModel : MaintenanceCostModel = new MaintenanceCostModel () ;
                maintenanceCostModel.setDate (Date.valueOf (DateUtils.changeFormatDate (txtMaintaDate.text))) ;
                maintenanceCostModel.setMonth (cboMaintaMonth.selectedItem.toString ()) ;
                maintenanceCostModel.setYear (Integer.parseInt (txtMaintaYear.text)) ;

                var cdate = DateUtils.changeFormatDate(txtMaintaDate.rawText);
                var month = cboMaintaMonth.selectedItem.toString();
                var year = txtMaintaYear.rawText;
                var netamt = Double.parseDouble(txtMaintaNetAmt.rawText);
                netamt = Value.Round(netamt, 2);
                var cn : ConfirmDialogBox = new ConfirmDialogBox(0,"Maintanace Cost");
                var a =bind cn.staus;
                                if (a) {
                                      var countUpdate = 0 ;
                                      //Controller Instance
                                      maintenanceCostController = RegistryFactory.getClientStub(RegistryConstants.MaintenanceCost ) as MaintenanceCost ;
                                      maintenanceCostController.deleteMaintenanceCost(maintenanceCostModel);
                                    for (i in [0..<len]) {

                                        var sn = tableValues[i][0];
                                        var part = tableValues[i][1];
                                        var date1: String = "";
                                        date1 = tableValues[i][2];
                                        date1 = date1.trim();
                                        if (date1 == null or date1.length() == 0 or date1.equals("null")) {
                                            date1 = "";
                                        } else {
                                            date1 = date1.replaceAll("'", "");
                                        }
                                        var pay_status: String = "";
                                        pay_status = tableValues[i][3];
                                        pay_status = pay_status.trim();
                                        if (pay_status == null or pay_status.equals("null") or pay_status.length() == 0) {
                                            pay_status = "";
                                        } else {
                                            pay_status = pay_status.replaceAll("'", "");
                                        }
                                        var pay_type = tableValues[i][4];
                                        var chq_no = tableValues[i][5];
                                        var amount = tableValues[i][6];
                                        if (amount != "0") {
                                            maintenanceCostModel.setSerialNo (Integer.parseInt (sn)) ;
                                            maintenanceCostModel.setParticular (part) ;
                                            maintenanceCostModel.setDueDate (DateUtils.changeFormatDate(date1)) ;
                                            maintenanceCostModel.setPaymentStatus (pay_status) ;
                                            maintenanceCostModel.setPaymentType (pay_type) ;
                                            maintenanceCostModel.setChequeNo (chq_no) ;
                                            maintenanceCostModel.setAmount (Double.parseDouble (amount)) ;
                                            maintenanceCostModel.setNetTotal (netamt) ;
                                            //Controller Instance
                                            maintenanceCostController = RegistryFactory.getClientStub(RegistryConstants.MaintenanceCost ) as MaintenanceCost ;
                                            if (maintenanceCostController.createRecord(maintenanceCostModel) as Boolean) {
                                                chkFlag1();
                                                countUpdate += 1 ;
                                            }
                                        }
                                        if (countUpdate > 0)
                                            FXalert(4);                                            
                                    }
                                    clear();
                                    monthItem = ["Select"];
                                }
            }
        } catch (e: Exception) {
            var msg: String = "Class : Maintanance Cost  Method : Update()   = {e.getMessage()}";
            log.debug(msg);
        }
        txtMaintaYear.requestFocus();
    }

    public function displayValues(year: String, month: String): Void {
        if (txtMaintaYear.rawText == null or txtMaintaYear.rawText.length() <= 0) {
            FXinfo("Please select a valid Year from the dropdown.", txtMaintaYear);
        } else {

            maintanenceTable.MaintainDetails(year, month);
            txtMaintaDate.text = maintanenceTable.date ;
            txtMaintaNetAmt.text = maintanenceTable.ntamt;
            maintanenceTable.focusSet();
        }
    }

    public function checkValid(): Integer {
        var cnt: Integer = 0;
        var month = cboMaintaMonth.selectedItem.toString();
        var year = txtMaintaYear.rawText;
        var net = txtMaintaNetAmt.rawText;
        var val = new Validation();
        try {
            var y ;
            if (txtMaintaYear.rawText.length() != 0) {
                y = val.getNumberValid(year, 2, 4);
            }
            
            if (txtMaintaYear.rawText.length() <= 0) {
                FXinfo("Please enter a valid Year.", txtMaintaYear);                
            } else if (month.equals("Select Month")) {
                FXinfo ("Please select a valid Month.");                
                cboMaintaMonth.requestFocus();
            } else if (y == 0) {
                FXinfo("Only numerals (numbers) are accepted in the Year textbox.", txtMaintaYear);
            } else if (y == 1) {
                FXinfo("Maximum length allowed for the Year textfield is 4 (Four) digits.", txtMaintaYear);
            } else if (net.length() <= 0) {
                FXinfo("Please enter Net Amount is empty", txtMaintaNetAmt);
            } else if (Double.parseDouble(net) == 0 or net.equals("0.00")) {
                FXinfo("Please enter some values Net Amount is zero", txtMaintaNetAmt);
            } else {
                cnt = 10;
            }
             var tableValues = maintanenceTable.getTableValues();
             len = maintanenceTable.totItems;
              for (i in [0..<len]) {
                  if (tableValues[i][4] == "Cheque"){
                      if (tableValues[i][5] != null) {
                          cnt = 10;
                      } else {
                          cnt =0;
                          FXinfo("Please select a Cheque number.");
                          maintanenceTable.focusSet(maintanenceTable.intNull, 5);
                          
                      }
                  }
              }
            maintanenceTable.intNull = 0;
        } catch (e: Exception) {            
            var msg: String = "Class : Maintanance Cost  Method : checkValid()   = {e}";
            log.debug(msg);
        }

        return cnt;
    }

    function imageDateOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        fxCalendar.visible = true;
        if (not dateFlag) {
            panelCalender.layoutY = txtMaintaDate.layoutY + txtMaintaDate.height + 5.0;
            if (txtMaintaDate.text != null) {
                var dat = txtMaintaDate.rawText.split("-");
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
            fxCalendar.visible = true;
            dateFlag = true;
        } else {
            fxCalendar.visible = false;
        }
    }

    var visit = bind fxCalendar.visible on replace {
                if (dateFlag and not visit) {
                    getDate(0);
                }
            };

    function getDate(i: Integer) {
        if (i == 0) {
            txtMaintaDate.text = fxCalendar.getSelectedDate();
            dateFlag = false;
            txtMaintaYear.requestFocus();
        }
    }

    public function updateValues(): Void {
//        for (i in [0..<5]) {
            updateSetValues();
//        }
    }

    public function updateSetValues(): Void {
        txtMaintaNetAmt.text = Value.Round("{maintanenceTable.total(6)}");
    }

    init {
        (table as javax.swing.JTable).addKeyListener(java.awt.event.KeyAdapter {
            override public function keyReleased(e: java.awt.event.KeyEvent): Void {
                updateValues();
            }
            override public function keyTyped(e: java.awt.event.KeyEvent): Void {
                updateValues();
            }
        });
        (table as javax.swing.JTable).addMouseListener(java.awt.event.MouseAdapter {

            override public function mouseClicked(e: java.awt.event.MouseEvent): Void {
                updateValues();
            }
        });
        (table as javax.swing.JTable).getSelectionModel().addListSelectionListener(javax.swing.event.ListSelectionListener {
            override public function valueChanged(e: javax.swing.event.ListSelectionEvent): Void {
                updateValues();
            }
        });
    }


    public function StartUp(): Void {
        CommonDeclare.MainPageForm = "Maintainance Cost";
        var productStatus = new GetProductInfo().getStatus();
        if(productStatus == "Free"){
            btnMaintaEdit.disable= true;
            btnMaintaCancel.disable= true;
        } else {
            btnMaintaEdit.disable= false;
            btnMaintaCancel.disable= false;
        }
        panel.visible = true;
        panel.content = [rectangle, rectHeader, label, label2, txtMaintaYear, label14, cboMaintaMonth, panelTable, rectTableBorder, panelButtons, panelAmt, label4, txtMaintaDate, imageDate, panelCalender, listMaintain, groupAddRow, groupRemoveRow, panelAlert, imageViewDown,];
        txtMaintaDate.text = DateUtils.now("dd-MM-yyyy");
        fxCalendar.visible = false;
        txtMaintaYear.style = mandatory;
        panelCalender.content = [fxCalendar,];
        tableComp = SwingComponent.wrap(maintanenceTable.getScrollTable(table));
        panelTable.content = tableComp;
        imageDate.image = Image { url: "{__DIR__}images/Calender.png" };
        cboMaintaMonth.select(0);
        tableComp.layoutX = 0;
        tableComp.layoutY = 0;
        maintanenceTable.setParticularValue();
        updateValues();
    }

}