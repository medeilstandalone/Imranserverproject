package com.vanuston.medeil.ui;

import javafx.scene.image.Image;
import javafx.ext.swing.SwingComponent;
import java.text.SimpleDateFormat;
import java.awt.Dimension;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import com.vanuston.medeil.ui.calendar.theme.Theme;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Value;
import com.vanuston.medeil.util.CommonDeclare;
import javafx.scene.input.KeyCode;
import com.vanuston.medeil.util.Logger;
import javafx.scene.control.TextBox;
import java.awt.event.KeyAdapter;
import com.vanuston.medeil.util.KeyRegistry;
import com.vanuston.medeil.model.SalesModel;
import com.vanuston.medeil.implementation.Sales;
import com.vanuston.medeil.model.MsgReturnModel;
import com.vanuston.medeil.util.NumberUtils;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import java.awt.event.MouseAdapter;
import com.vanuston.medeil.uitables.ConfirmDialogBox;
import java.sql.ResultSet;
import java.lang.Class;
import java.lang.Exception;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperPrintManager;
import java.io.File;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;
import com.vanuston.medeil.util.Validation;
import com.vanuston.medeil.uitables.SalesMaintainEditTable;
import com.vanuston.medeil.uitables.SalesMaintainLoadTable;
import java.util.List;
import javax.swing.JTextField;
import java.lang.System;

public class SalesMaintanance {

    var sdf = new SimpleDateFormat("dd-MM-yyyy");
    var rowNo = 1;
    var colNames: Object[] = ["Bill No", "Bill Date", "Bill Type", "Customer", "Total Items", "Total Quantity", "Bill Amount"];
    var colType: Class[] = [java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.Integer.class, java.lang.Integer.class, java.lang.Double.class];
    var colEditable: Boolean[] = [false, false, false, false, false, false, false];
    var colWidth: Integer[] = [100, 100, 100, 133, 100, 100, 100];
    var SalesMaintainEditTable = new SalesMaintainEditTable();
    var SalesMaintainLoadTable = new SalesMaintainLoadTable();
    var table = SalesMaintainLoadTable.createViewTable(rowNo, colNames, colType, colEditable, colWidth);
    var SalesLoad = SwingComponent.wrap(SalesMaintainLoadTable.getScrollTable(table));
    var rowNo1 = 1;
    //                            0        1        2               3         4           5         6           7         8      9        10   11         12       13          14      15
    var colNames1: Object[] = ["S.No", "Code", "Particulars", "Formulation","P.Qty", "U.Qty", "Batch No.", "Expiry", "U.Price", "MRP", "Disc %", "Margin","VAT %", "F.Price", "Amount", "Adj Id"];
    var colType1: Class[] = [java.lang.Integer.class, java.lang.String.class, java.lang.String.class,
                java.lang.String.class, java.lang.Integer.class,java.lang.Integer.class, java.lang.String.class,
                java.lang.String.class, java.lang.Double.class, java.lang.Double.class,java.lang.Double.class,
                java.lang.Double.class, java.lang.Double.class, java.lang.Double.class, java.lang.Double.class, java.lang.Integer.class];
    var colEditable1: Boolean[] = [false, false, false, false,true, true, false, false, true, false, true, false, false, true, false, false];
    var colWidth1: Integer[] = [35, 50, 120, 75, 40, 40, 60, 62, 50, 50, 40, 40, 40, 50, 61, 0];
    var table1 = SalesMaintainEditTable.createViewTable(rowNo1, colNames1, colType1, colEditable1, colWidth1, "Sales");
    var SalesLoadEdit = SwingComponent.wrap(SalesMaintainEditTable.getScrollTable(table1));
    var rs: ResultSet = null;
    var dateFlag: Boolean = false;
    var dateFlag1: Boolean = false;
    var fxCalendar = FXCalendar {
                theme: Theme {};
            };
    var log: Logger = Logger.getLogger(SalesMaintanance.class, "Sales");
    var listH = 0.0;
    var panelW = bind CommonDeclare.panelFormW;
    var panelH = bind CommonDeclare.panelFormH;
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var one = bind CommonDeclare.one;
    var two = bind CommonDeclare.two;
    var five = bind CommonDeclare.five;
    var ten = bind CommonDeclare.ten;
    var hundred = bind CommonDeclare.hundred;
    var twoHund = bind CommonDeclare.twoHund;
    var eighty = bind (8 * ten);
    var C1LX = bind CommonDeclare.Column1LX;
    var C2LX = bind CommonDeclare.Column2LX;
    var C3LX = bind CommonDeclare.Column3LX;
    var C4LX = bind CommonDeclare.Column4LX;
    var botton1LX = bind CommonDeclare.botton51LX - 8;
    var botton2LX = bind CommonDeclare.botton52LX - 15;
    var botton3LX = bind CommonDeclare.botton53LX - 22;
    var botton4LX = bind CommonDeclare.botton54LX - 1;
    var botton5LX = bind CommonDeclare.botton55LX - 5;
    var botton31LX = bind CommonDeclare.botton31LX;
    var botton32LX = bind CommonDeclare.botton32LX;
    var botton33LX = bind CommonDeclare.botton33LX;
    var bottonLY = 0.0;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    var bottonW = bind CommonDeclare.bottonW;
    var bottonH = bind CommonDeclare.bottonH;
    var rectbutton1LX = bind CommonDeclare.rectbutton1LX;
    var rectbutton2LX = bind CommonDeclare.rectbutton2LX;
    var rectbuttonLY = bind CommonDeclare.rectbuttonLY;
    var seperatorW = bind CommonDeclare.seperatorW;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;
    var Type4TextboxW = bind CommonDeclare.Type4TextboxW + 30;
    var Type5TextboxW = bind CommonDeclare.Type4TextboxW;
    var ImageCalenderLX = bind C2LX + Type3TextboxW + 2;
    var panelCalenderLX = bind C2LX + Type3TextboxW + 22;
    var SearchTextboxLX = bind (15.37484117 * panelW / 100);
    var labelSearchLX = bind (41.93138501 * panelW / 100);
    var ChoiceSearchLX = bind (50.44472681 * panelW / 100);
    var ChoiceSearchW = bind (12.7064803 * panelW / 100);
    var buttonSearchLX = bind (69.63151207 * panelW / 100);
    var buttonReportLX = bind (85.51461245 * panelW / 100);
    var panelQuickNavigationLX = bind (8.132147395 * panelW / 100);
    public var modText: String;
    public var modVal: Integer;
    public var modClick: Boolean = false;
    var panelTableLX = bind (panelW - TableW) / 2;
    var panelTableLY = 175.0;
    var TableW = bind (95.29860229 * panelW) / 100 on replace {
        changeTableSize(TableW, TableH);
    };
    var TableH = 310.0 on replace {
        changeTableSize(TableW, TableH);
    };
    var RemoveRowLX = bind ((panelW + TableW) / 2) - 120;
    var BottomC1LX = bind CommonDeclare.BottomC1LX;
    var BottomC2LX = bind CommonDeclare.BottomC2LX;
    var BottomC3LX = bind CommonDeclare.BottomC3LX;
    var BottomC4LX = bind CommonDeclare.BottomC4LX;
    var AmtPanelLX = bind 48.28462516 * panelW / 100;
    var AmtTextW = bind 40.66073698 * panelW / 100;
    var panelCardLX = bind panelW - 100;
    var panelCardLY = 87.0;
    var panelCardDetailsLX = bind panelCardLX - (Type2TextboxW + 155);
    var panelCardDetailsLY = bind panelCardLY + 7;
    var sales: SalesModel;
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    var mandatoryStyle: String = CommonDeclare.textbox_mandatory();
    var errorStyle: String = CommonDeclare.textbox_error();
    def CustomAlert = CustomAlert {};
    var billType: String;
    var commonController:CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    var salesController : Sales = RegistryFactory.getClientStub (RegistryConstants.Sales) as Sales;
    var netPaid:String;
    var empCode:String[] = commonController.getEmployeeCode("").toArray() as String[];
    var oldBalanceAmt:String;
    var netAmt: Double = 0.0;
    var salesCnt:String;
    var salesTotal:String;
    var valid1:Validation;
    var settingsController : com.vanuston.medeil.implementation.Settings =  RegistryFactory.getClientStub(RegistryConstants.Configuration) as com.vanuston.medeil.implementation.Settings;
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def panelEditTable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutX: bind panelTableLX
    }
    
    public-read def rectTableBorder: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        layoutX: bind panelTableLX
        layoutY: bind panelTableLY+20
        styleClass: "rectTableBorder"
        width: bind TableW
        height: bind TableH
    }
    
    public-read def panelTable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelTableLX
        layoutY: bind panelTableLY+20
        blocksMouse: true
    }
    
    public-read def imgEdit: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnSaleMnEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnSaleMnEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton31LX
        layoutY: bind bottonLY
        layoutInfo: __layoutInfo_btnSaleMnEdit
        graphic: imgEdit
        text: "Edit [F6]"
    }
    
    public-read def imageView5: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnSaleMnReprint: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW+30
        height: bind bottonH
    }
    public-read def btnSaleMnReprint: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton32LX
        layoutInfo: __layoutInfo_btnSaleMnReprint
        graphic: imageView5
        text: "Button"
    }
    
    public-read def imageView4: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnSaleMnCancelForm: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW+30
        height: bind bottonH
    }
    public-read def btnSaleMnCancelForm: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton33LX
        layoutInfo: __layoutInfo_btnSaleMnCancelForm
        graphic: imageView4
        text: "Button"
    }
    
    public-read def imageView3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnSaleMnPrint: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnSaleMnPrint: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton1LX
        layoutInfo: __layoutInfo_btnSaleMnPrint
        onKeyPressed: btnSaleMnPrintOnKeyPressed
        graphic: imageView3
        text: "Button"
    }
    
    public-read def imgUpdate: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imgReset: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imgCancel: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def lblCount: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX+45
        layoutY: bind panelH -50
        text: "Label"
    }
    
    def __layoutInfo_lblSalesCount: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblSalesCount: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C1LX
        layoutY: bind panelH-50
        layoutInfo: __layoutInfo_lblSalesCount
        styleClass: "Borderless-text-box"
        text: bind salesCnt
    }
    
    def __layoutInfo_lblSalesTotal: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def lblSalesTotal: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C4LX+150
        layoutY: bind panelH-50
        layoutInfo: __layoutInfo_lblSalesTotal
        styleClass: "Borderless-text-box"
        text: bind salesTotal
    }
    
    public-read def rdoSearch2: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: bind C1LX-18
        layoutY: 50.0
        text: "Radio Button"
        selected: false
    }
    
    public-read def rdoSearch: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: bind C1LX-18
        layoutY: 50.0
        text: "Radio Button"
    }
    
    def __layoutInfo_separator: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
    }
    public-read def separator: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: bind 2 * ten
        layoutY: 85.0
        layoutInfo: __layoutInfo_separator
    }
    
    def __layoutInfo_optSearch: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def optSearch: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: 0.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_optSearch
        items: [ "Bill Number", "Customer Name", "Customer ID", ]
    }
    
    public-read def imageDate: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind Type2TextboxW+2
        layoutY: 0.0
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_separator3: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: 36.0
    }
    public-read def separator3: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: 613.0
        layoutY: 143.0
        layoutInfo: __layoutInfo_separator3
        vertical: true
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 540.0
        layoutY: 124.0
        text: "Label"
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 649.0
        layoutY: 124.0
        text: "Label"
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX
        layoutY: 100.0
        text: "Label"
    }
    
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX
        layoutY: 120.0
        text: "Label"
    }
    
    public-read def label6: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C4LX+Type3TextboxW+10
        layoutY: 108.0
        text: "Label"
    }
    
    def __layoutInfo_label7: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX
        layoutY: 134.0
        layoutInfo: __layoutInfo_label7
        text: "Label"
    }
    
    public-read def imgSaleMnDateEdit: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C4LX+Type3TextboxW+202
    }
    
    public-read def employee_id: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX
        layoutY: 0.0
        text: "Label"
    }
    
    public-read def cboEmp_code: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: bind C4LX
        layoutY: 0.0
        items: bind empCode
    }
    
    public-read def lblTotalMargin: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C4LX+100
        text: "Label"
    }
    
    public-read def label8: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 69.0
        layoutY: 439.0
        text: "Label"
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 64.0
        layoutY: 468.0
        text: "Label"
    }
    
    public-read def label11: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 225.0
        layoutY: 429.0
        text: "Label"
    }
    
    public-read def label12: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind BottomC1LX+360
        layoutY: 448.0
        text: "Label"
    }
    
    public-read def panelLblColumn1: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind BottomC1LX
        content: [ label8, label9, label11, label12, ]
    }
    
    public-read def label10: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 225.0
        layoutY: 408.0
        text: "Label"
    }
    
    public-read def label13: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 415.0
        layoutY: 415.0
        text: "Amt. Paid"
    }
    
    public-read def label14: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 397.0
        layoutY: 439.0
        text: "Label"
    }
    
    public-read def label19: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind 200
        layoutY: 179.0
        text: "Label"
    }
    
    public-read def panelLblColumn2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind BottomC3LX
        content: [ label10, label13, label14, label19, ]
    }
    
    def __layoutInfo_txtMaintaRoundof: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtMaintaRoundof: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind 200
        layoutY: 187.0
        layoutInfo: __layoutInfo_txtMaintaRoundof
    }
    
    def __layoutInfo_txtSaleMnNetPaid: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSaleMnNetPaid: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtSaleMnNetPaid
    }
    
    public-read def label17: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 633.0
        layoutY: 402.0
        text: "Label"
    }
    
    public-read def imageCustDown: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C2LX+Type1TextboxW
        layoutY: 121.0
    }
    
    public-read def imageDoctorDown: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C4LX+Type1TextboxW
        layoutY: 150.0
    }
    
    public-read def rectangle3: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        styleClass: "rectbutton"
        width: 100.0
        height: 50.0
    }
    
    public-read def panelCalender: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: 161.0
        layoutY: 175.0
    }
    
    def __layoutInfo_listName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
        height: bind listH
    }
    public-read def listName: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutInfo: __layoutInfo_listName
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
    }
    
    public-read def panelCardDetails: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelCardDetailsLX
        layoutY: bind panelCardDetailsLY
        blocksMouse: true
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
    
    def __layoutInfo_txtSaleMnTotAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind AmtTextW
    }
    public-read def txtSaleMnTotAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 589.0
        layoutY: 429.0
        layoutInfo: __layoutInfo_txtSaleMnTotAmt
        styleClass: "Borderless-text-box"
        font: Arial_12
    }
    
    public-read def panelAmt: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind AmtPanelLX+200
        content: [ txtSaleMnTotAmt, label17, ]
    }
    
    def __layoutInfo_txtSaleMnBal: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSaleMnBal: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 460.0
        layoutY: 439.0
        layoutInfo: __layoutInfo_txtSaleMnBal
        font: Arial_12
    }
    
    def __layoutInfo_txtSaleMnSubTot: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSaleMnSubTot: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 279.0
        layoutInfo: __layoutInfo_txtSaleMnSubTot
        font: Arial_12
    }
    
    public-read def panelTxtColumn2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind BottomC4LX
        content: [ txtSaleMnSubTot, txtSaleMnBal, txtMaintaRoundof, txtSaleMnNetPaid, ]
    }
    
    def __layoutInfo_txtSaleMnTotVAT: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSaleMnTotVAT: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 285.0
        layoutY: 454.0
        layoutInfo: __layoutInfo_txtSaleMnTotVAT
        font: Arial_12
    }
    
    def __layoutInfo_txtSaleMnTotDis: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSaleMnTotDis: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 279.0
        layoutY: 429.0
        layoutInfo: __layoutInfo_txtSaleMnTotDis
        font: Arial_12
    }
    
    def __layoutInfo_txtSaleMnTotQty: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type5TextboxW
    }
    public-read def txtSaleMnTotQty: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 115.0
        layoutY: 460.0
        layoutInfo: __layoutInfo_txtSaleMnTotQty
        font: Arial_12
    }
    
    def __layoutInfo_txtSaleMnTotItem: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type5TextboxW
    }
    public-read def txtSaleMnTotItem: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 115.0
        layoutY: 433.0
        layoutInfo: __layoutInfo_txtSaleMnTotItem
        font: Arial_12
    }
    
    public-read def panelTxtColumn1: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind BottomC2LX
        content: [ txtSaleMnTotItem, txtSaleMnTotQty, txtSaleMnTotDis, txtSaleMnTotVAT, ]
    }
    
    def __layoutInfo_txtSaleMnDoctorName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtSaleMnDoctorName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C4LX
        layoutY: 132.0
        layoutInfo: __layoutInfo_txtSaleMnDoctorName
        promptText: "Enter Doctor Name"
        font: Arial_12
    }
    
    def __layoutInfo_txtSaleMnDateEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtSaleMnDateEdit: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C4LX+Type3TextboxW+100
        layoutY: 100.0
        layoutInfo: __layoutInfo_txtSaleMnDateEdit
        font: Arial_12
    }
    
    def __layoutInfo_txtSaleMnCName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtSaleMnCName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX
        layoutY: 126.0
        layoutInfo: __layoutInfo_txtSaleMnCName
        font: Arial_12
    }
    
    def __layoutInfo_txtSaleMnBillNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtSaleMnBillNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX
        layoutY: 100.0
        layoutInfo: __layoutInfo_txtSaleMnBillNo
        font: Arial_12
    }
    
    def __layoutInfo_txtSaleMnDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtSaleMnDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 0.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_txtSaleMnDate
        onKeyPressed: txtSaleMnDateOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtSaleMnKeyword: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtSaleMnKeyword: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind Type3TextboxW+20
        layoutY: 0.0
        layoutInfo: __layoutInfo_txtSaleMnKeyword
        text: ""
        selectOnFocus: false
        editable: false
        font: Arial_12
    }
    
    public-read def panelSearch: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind C2LX
        layoutY: 100.0
        content: [ txtSaleMnKeyword, optSearch, ]
    }
    
    public-read def Arial_Bold_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
    }
    
    def __layoutInfo_removeRow: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def removeRow: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 603.0
        layoutY: 496.0
        layoutInfo: __layoutInfo_removeRow
        text: "Label"
        font: Arial_Bold_12
        hpos: javafx.geometry.HPos.CENTER
    }
    
    public-read def groupRemoveRow: javafx.scene.Group = javafx.scene.Group {
        visible: false
        layoutX: bind RemoveRowLX
        content: [ rectangle3, removeRow, ]
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
    
    def __layoutInfo_btnSaleMnSearch: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
    }
    public-read def btnSaleMnSearch: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind Type2TextboxW +30
        layoutY: 143.0
        layoutInfo: __layoutInfo_btnSaleMnSearch
        onKeyPressed: btnSaleMnSearchOnKeyPressed
        translateX: 0.0
        effect: reflectionEffect
        graphic: imageView
        text: "Search"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_panelDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def panelDate: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind C2LX
        layoutY: 150.0
        layoutInfo: __layoutInfo_panelDate
        content: [ txtSaleMnDate, imageDate, btnSaleMnSearch, ]
    }
    
    def __layoutInfo_btnSaleMnCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW+25
        height: bind bottonH
    }
    public-read def btnSaleMnCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton5LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnSaleMnCancel
        onKeyPressed: btnSaleMnCancelOnKeyPressed
        effect: reflectionEffect
        graphic: imgCancel
        text: "Cancel [Esc]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnSaleMnReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnSaleMnReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton4LX
        layoutInfo: __layoutInfo_btnSaleMnReset
        onKeyPressed: btnSaleMnResetOnKeyPressed
        effect: reflectionEffect
        graphic: imgReset
        text: "Reset [F5]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnSaleMnUpdate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnSaleMnUpdate: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton2LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnSaleMnUpdate
        effect: reflectionEffect
        graphic: imgUpdate
        text: "Edit  [F4]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
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
    
    public-read def lblSaleMnLastMonth: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 640.0
        layoutY: 164.0
        text: "Last Month"
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def labelSearch_By_Date: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX
        layoutY: 150.0
        text: "Search By Date"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelSearch_By: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX
        layoutY: 100.0
        text: "Search By"
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
        layoutX: 540.0
        layoutY: 100.0
        text: "Quick Navigation"
        font: Arial_18
        textFill: Green
    }
    
    public-read def label15: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind 3 * ten
        layoutY: 61.0
        text: "Bill History"
        font: Arial_18
        textFill: Green
    }
    
    public-read def dropShadowEffect: javafx.scene.effect.DropShadow = javafx.scene.effect.DropShadow {
    }
    
    public-read def lightingEffect: javafx.scene.effect.Lighting = javafx.scene.effect.Lighting {
    }
    
    def __layoutInfo_label: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
    }
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 1.0
        layoutInfo: __layoutInfo_label
        effect: lightingEffect
        text: "Sales Maintanance - ctrl+M"
        font: Arial_25
        hpos: javafx.geometry.HPos.CENTER
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
    }
    
    public-read def Yellow: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.95
        green: 0.94
        blue: 0.86
    }
    
    public-read def linearGradient2: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
    }
    
    public-read def rectangle2: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 0.25
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "rectFormHeader"
        fill: linearGradient2
        width: bind panelW
        height: 32.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def imageSearch: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Search.png"
    }
    
    public-read def imageEdit: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Edit.png"
    }
    
    public-read def Arial_Bold_65: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 65.0
    }
    
    public-read def imageBillCancel: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/BillCancel.png"
    }
    
    public-read def imageView2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        image: imageBillCancel
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnSaleMnCancelBill: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW+20
        height: bind bottonH
    }
    public-read def btnSaleMnCancelBill: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton3LX
        layoutY: bind bottonLY
        layoutInfo: __layoutInfo_btnSaleMnCancelBill
        onKeyPressed: btnSaleMnCancelBillOnKeyPressed
        graphic: imageView2
        text: "Cancel Bill"
    }
    
    public-read def panelButton: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: bind panelButtonsLY
        content: [ btnSaleMnEdit, btnSaleMnReprint, btnSaleMnCancelForm, btnSaleMnPrint, btnSaleMnUpdate, btnSaleMnReset, btnSaleMnCancel, btnSaleMnCancelBill, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        content: [ rectangle, rectangle2, label, panelEditTable, rectTableBorder, panelTable, panelButton, lblCount, lblSalesCount, lblSalesTotal, labelSearch_By, labelSearch_By_Date, rdoSearch2, label15, rdoSearch, label16, lblSaleMnLastMonth, separator, panelSearch, panelDate, separator3, label2, label3, label4, label5, txtSaleMnBillNo, txtSaleMnCName, label6, label7, txtSaleMnDateEdit, imgSaleMnDateEdit, txtSaleMnDoctorName, employee_id, cboEmp_code, lblTotalMargin, panelLblColumn1, panelTxtColumn1, panelLblColumn2, panelTxtColumn2, panelAmt, imageCustDown, imageDoctorDown, groupRemoveRow, panelCalender, listName, panelAlert, panelCardDetails, ]
    }
    
    public-read def imageCancel: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Cancel.png"
    }
    
    public-read def imageUpdate: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Save1.png"
    }
    
    public-read def imageReset: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Reset.png"
    }
    
    public-read def imagePrint: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Printer.png"
    }
    
    public-read def imageBack: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/arrow_Left.png"
    }
    
    public-read def imageCard: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Card1.png"
    }
    
    public-read def imageDown: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Calender.png"
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "Shown", "EditSalesCash", ]
        actual: 0
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectangle.layoutX = 0.0;
                            rectangle.layoutY = 0.0;
                            rectangle.blocksMouse = true;
                            rectangle.stroke = DarkGray;
                            rectangle2.layoutX = 0.0;
                            rectangle2.height = 32.0;
                            rectangle2.arcWidth = 5.0;
                            rectangle2.arcHeight = 5.0;
                            label.layoutY = 1.0;
                            label.text = "Sales Maintenance - ctrl+M";
                            panelEditTable.visible = false;
                            panelEditTable.layoutY = 0.0;
                            rectTableBorder.visible = true;
                            rectTableBorder.disable = false;
                            rectTableBorder.fill = null;
                            panelTable.visible = true;
                            panelTable.disable = false;
                            imgEdit.visible = true;
                            imgEdit.image = imageEdit;
                            btnSaleMnEdit.visible = true;
                            btnSaleMnEdit.onKeyReleased = btnSaleMnEditOnKeyReleasedAtShown;
                            btnSaleMnEdit.effect = reflectionEffect;
                            btnSaleMnEdit.text = "Edit [F6]";
                            btnSaleMnEdit.font = Arial_Bold_14;
                            btnSaleMnEdit.action = btnSaleMnEditActionAtShown;
                            imageView5.visible = true;
                            imageView5.image = imagePrint;
                            btnSaleMnReprint.visible = true;
                            btnSaleMnReprint.cursor = null;
                            btnSaleMnReprint.layoutY = 0.0;
                            btnSaleMnReprint.onKeyPressed = btnSaleMnReprintOnKeyPressedAtShown;
                            btnSaleMnReprint.onMouseClicked = btnSaleMnReprintOnMouseClickedAtShown;
                            btnSaleMnReprint.effect = reflectionEffect;
                            btnSaleMnReprint.text = "Print [F2]";
                            btnSaleMnReprint.font = Arial_Bold_14;
                            imageView4.visible = true;
                            imageView4.image = imageCancel;
                            btnSaleMnCancelForm.visible = true;
                            btnSaleMnCancelForm.onKeyPressed = btnSaleMnCancelFormOnKeyPressedAtShown;
                            btnSaleMnCancelForm.effect = reflectionEffect;
                            btnSaleMnCancelForm.text = "Cancel [F8]";
                            btnSaleMnCancelForm.font = Arial_Bold_14;
                            btnSaleMnCancelForm.action = btnSaleMnCancelFormActionAtShown;
                            imageView3.visible = false;
                            imageView3.image = null;
                            btnSaleMnPrint.visible = false;
                            btnSaleMnPrint.cursor = null;
                            btnSaleMnPrint.text = "Button";
                            btnSaleMnPrint.font = null;
                            imgUpdate.visible = false;
                            imgUpdate.image = null;
                            btnSaleMnUpdate.visible = false;
                            btnSaleMnUpdate.layoutY = 525.0;
                            btnSaleMnUpdate.text = "Edit  [F4]";
                            imgReset.visible = false;
                            imgReset.image = null;
                            btnSaleMnReset.visible = false;
                            btnSaleMnReset.layoutY = 0.0;
                            btnSaleMnReset.text = "Edit [F4]";
                            imgCancel.visible = false;
                            imgCancel.layoutX = 0.0;
                            imgCancel.image = null;
                            btnSaleMnCancel.visible = false;
                            btnSaleMnCancel.layoutY = 525.0;
                            btnSaleMnCancel.text = "Cancel [Esc]";
                            btnSaleMnCancel.graphicTextGap = 4.0;
                            imageView2.visible = true;
                            btnSaleMnCancelBill.visible = false;
                            btnSaleMnCancelBill.text = "Cancel Bill";
                            btnSaleMnCancelBill.font = Arial_Bold_14;
                            panelButton.visible = true;
                            lblCount.visible = true;
                            lblCount.text = "Bill(s) Found";
                            lblCount.font = Arial_Bold_16;
                            lblSalesCount.visible = true;
                            __layoutInfo_lblSalesCount.width = 40.0;
                            lblSalesCount.styleClass = "Borderless-text-box";
                            lblSalesCount.editable = false;
                            lblSalesCount.font = Arial_Bold_16;
                            lblSalesTotal.visible = true;
                            lblSalesTotal.styleClass = "Borderless-text-box";
                            lblSalesTotal.editable = false;
                            lblSalesTotal.font = Arial_Bold_18;
                            labelSearch_By.visible = true;
                            labelSearch_By.layoutY = 102.0;
                            labelSearch_By.font = Arial_16;
                            labelSearch_By_Date.visible = true;
                            labelSearch_By_Date.layoutY = 145.0;
                            labelSearch_By_Date.font = Arial_16;
                            rdoSearch2.visible = true;
                            rdoSearch2.layoutY = 143.0;
                            rdoSearch2.onMouseClicked = rdoSearch2OnMouseClickedAtShown;
                            rdoSearch2.text = "";
                            rdoSearch2.font = Arial_16;
                            rdoSearch2.toggleGroup = toggleGroup;
                            label15.text = "Billing History - Press ALT+W to view Total Sales";
                            label15.font = Arial_18;
                            rdoSearch.visible = true;
                            rdoSearch.layoutY = 100.0;
                            rdoSearch.onKeyReleased = rdoSearchOnKeyReleasedAtShown;
                            rdoSearch.onMouseClicked = rdoSearchOnMouseClickedAtShown;
                            rdoSearch.text = "";
                            rdoSearch.font = Arial_16;
                            rdoSearch.toggleGroup = toggleGroup;
                            label16.visible = false;
                            label16.layoutY = 90.0;
                            lblSaleMnLastMonth.visible = false;
                            lblSaleMnLastMonth.layoutY = 160.0;
                            __layoutInfo_txtSaleMnKeyword.height = 25.0;
                            txtSaleMnKeyword.onKeyPressed = txtSaleMnKeywordOnKeyPressedAtShown;
                            txtSaleMnKeyword.onKeyReleased = txtSaleMnKeywordOnKeyReleasedAtShown;
                            txtSaleMnKeyword.editable = true;
                            txtSaleMnKeyword.font = Arial_14;
                            optSearch.onKeyPressed = optSearchOnKeyPressedAtShown;
                            optSearch.onMouseClicked = optSearchOnMouseClickedAtShown;
                            optSearch.items = [ "Bill Number", "Mobile Number", "Customer Name", "Customer ID", ];
                            panelSearch.visible = true;
                            panelSearch.focusTraversable = true;
                            txtSaleMnDate.visible = true;
                            txtSaleMnDate.onKeyPressed = txtSaleMnDateOnKeyPressed;
                            txtSaleMnDate.editable = false;
                            txtSaleMnDate.font = Arial_16;
                            imageDate.visible = true;
                            imageDate.layoutY = 1.0;
                            imageDate.onMouseClicked = imageDateOnMouseClickedAtShown;
                            imageDate.blocksMouse = true;
                            imageDate.fitWidth = 20.0;
                            imageDate.fitHeight = 25.0;
                            imageView.visible = true;
                            imageView.image = imageSearch;
                            btnSaleMnSearch.visible = true;
                            btnSaleMnSearch.layoutY = -2.0;
                            __layoutInfo_btnSaleMnSearch.height = 25.0;
                            btnSaleMnSearch.effect = null;
                            btnSaleMnSearch.action = btnSaleMnSearchActionAtShown;
                            panelDate.visible = true;
                            panelDate.layoutY = 140.0;
                            __layoutInfo_panelDate.width = 200.0;
                            __layoutInfo_panelDate.height = 0.0;
                            panelDate.blocksMouse = false;
                            panelDate.focusTraversable = true;
                            separator3.visible = false;
                            separator3.layoutX = 615.0;
                            separator3.layoutY = 125.0;
                            __layoutInfo_separator3.height = 50.0;
                            label2.visible = false;
                            label2.layoutY = 120.0;
                            label2.text = "Yesterday";
                            label2.font = Arial_Bold_12;
                            label2.textFill = DarkGray;
                            label3.visible = false;
                            label3.layoutX = 640.0;
                            label3.layoutY = 120.0;
                            label3.text = "Today";
                            label3.font = Arial_Bold_12;
                            label3.textFill = DarkGray;
                            label4.visible = false;
                            label4.layoutY = 100.0;
                            label4.text = "Label";
                            label5.visible = false;
                            label5.layoutY = 120.0;
                            label5.text = "Label";
                            txtSaleMnBillNo.visible = false;
                            txtSaleMnBillNo.layoutY = 100.0;
                            txtSaleMnBillNo.editable = true;
                            txtSaleMnBillNo.font = Arial_12;
                            txtSaleMnCName.visible = false;
                            txtSaleMnCName.layoutY = 126.0;
                            txtSaleMnCName.promptText = null;
                            txtSaleMnCName.editable = true;
                            txtSaleMnCName.font = Arial_12;
                            label6.visible = false;
                            label6.layoutY = 108.0;
                            label6.text = "Label";
                            label7.visible = false;
                            label7.layoutY = 134.0;
                            label7.text = "Label";
                            txtSaleMnDateEdit.visible = false;
                            txtSaleMnDateEdit.layoutY = 100.0;
                            txtSaleMnDateEdit.editable = true;
                            txtSaleMnDateEdit.font = Arial_12;
                            imgSaleMnDateEdit.visible = false;
                            imgSaleMnDateEdit.layoutY = 0.0;
                            imgSaleMnDateEdit.blocksMouse = false;
                            imgSaleMnDateEdit.image = null;
                            imgSaleMnDateEdit.fitWidth = 0.0;
                            imgSaleMnDateEdit.fitHeight = 0.0;
                            txtSaleMnDoctorName.visible = false;
                            txtSaleMnDoctorName.layoutY = 132.0;
                            txtSaleMnDoctorName.editable = true;
                            txtSaleMnDoctorName.font = Arial_12;
                            employee_id.visible = false;
                            employee_id.layoutY = 0.0;
                            employee_id.text = "Label";
                            cboEmp_code.visible = false;
                            cboEmp_code.layoutY = 0.0;
                            cboEmp_code.onKeyPressed = cboEmp_codeOnKeyPressedAtShown;
                            cboEmp_code.onMouseClicked = cboEmp_codeOnMouseClickedAtShown;
                            lblTotalMargin.visible = false;
                            lblTotalMargin.layoutY = 0.0;
                            lblTotalMargin.text = "Label";
                            lblTotalMargin.textFill = javafx.scene.paint.Color.BLACK;
                            label8.visible = false;
                            label8.layoutX = 69.0;
                            label8.layoutY = 439.0;
                            label8.text = "Label";
                            label9.visible = false;
                            label9.layoutX = 64.0;
                            label9.layoutY = 468.0;
                            label9.text = "Label";
                            label11.visible = false;
                            label11.layoutX = 225.0;
                            label11.layoutY = 429.0;
                            label11.text = "Label";
                            label12.visible = false;
                            label12.layoutY = 448.0;
                            label12.text = "Label";
                            panelLblColumn1.visible = false;
                            panelLblColumn1.layoutY = 0.0;
                            txtSaleMnTotItem.visible = false;
                            txtSaleMnTotItem.layoutX = 115.0;
                            txtSaleMnTotItem.layoutY = 433.0;
                            txtSaleMnTotItem.selectOnFocus = true;
                            txtSaleMnTotItem.editable = true;
                            txtSaleMnTotItem.font = Arial_12;
                            txtSaleMnTotQty.visible = false;
                            txtSaleMnTotQty.layoutX = 115.0;
                            txtSaleMnTotQty.layoutY = 460.0;
                            txtSaleMnTotQty.selectOnFocus = true;
                            txtSaleMnTotQty.editable = true;
                            txtSaleMnTotQty.font = Arial_12;
                            txtSaleMnTotDis.visible = false;
                            txtSaleMnTotDis.layoutX = 279.0;
                            txtSaleMnTotDis.layoutY = 429.0;
                            txtSaleMnTotDis.selectOnFocus = true;
                            txtSaleMnTotDis.editable = true;
                            txtSaleMnTotDis.font = Arial_12;
                            txtSaleMnTotVAT.visible = false;
                            txtSaleMnTotVAT.layoutX = 285.0;
                            txtSaleMnTotVAT.layoutY = 454.0;
                            txtSaleMnTotVAT.selectOnFocus = true;
                            txtSaleMnTotVAT.editable = true;
                            txtSaleMnTotVAT.font = Arial_12;
                            panelTxtColumn1.visible = false;
                            panelTxtColumn1.layoutY = 0.0;
                            label10.visible = false;
                            label10.layoutX = 225.0;
                            label10.layoutY = 408.0;
                            label10.text = "Label";
                            label13.visible = false;
                            label13.layoutX = 415.0;
                            label13.layoutY = 415.0;
                            label14.visible = false;
                            label14.layoutX = 397.0;
                            label14.layoutY = 439.0;
                            label14.text = "Label";
                            label19.visible = false;
                            label19.layoutY = 179.0;
                            label19.text = "Label";
                            panelLblColumn2.visible = false;
                            panelLblColumn2.layoutY = 0.0;
                            txtSaleMnSubTot.visible = false;
                            txtSaleMnSubTot.layoutX = 279.0;
                            txtSaleMnSubTot.layoutY = 0.0;
                            txtSaleMnSubTot.selectOnFocus = true;
                            txtSaleMnSubTot.editable = true;
                            txtSaleMnSubTot.font = Arial_12;
                            txtSaleMnBal.visible = false;
                            txtSaleMnBal.layoutX = 460.0;
                            txtSaleMnBal.layoutY = 439.0;
                            txtSaleMnBal.selectOnFocus = true;
                            txtSaleMnBal.editable = true;
                            txtSaleMnBal.font = Arial_12;
                            txtMaintaRoundof.visible = false;
                            txtMaintaRoundof.layoutY = 187.0;
                            txtSaleMnNetPaid.visible = false;
                            panelTxtColumn2.visible = false;
                            panelTxtColumn2.layoutY = 0.0;
                            txtSaleMnTotAmt.visible = false;
                            txtSaleMnTotAmt.layoutX = 589.0;
                            txtSaleMnTotAmt.layoutY = 429.0;
                            txtSaleMnTotAmt.promptText = null;
                            txtSaleMnTotAmt.editable = true;
                            txtSaleMnTotAmt.font = Arial_12;
                            label17.visible = false;
                            label17.opacity = 1.0;
                            label17.layoutX = 633.0;
                            label17.layoutY = 402.0;
                            label17.text = "Label";
                            label17.textFill = javafx.scene.paint.Color.BLACK;
                            panelAmt.visible = false;
                            panelAmt.layoutY = 0.0;
                            imageCustDown.visible = false;
                            imageCustDown.layoutY = 121.0;
                            imageCustDown.blocksMouse = false;
                            imageCustDown.image = null;
                            imageCustDown.fitHeight = 0.0;
                            imageDoctorDown.visible = false;
                            imageDoctorDown.layoutY = 150.0;
                            imageDoctorDown.blocksMouse = false;
                            imageDoctorDown.image = null;
                            imageDoctorDown.fitHeight = 0.0;
                            rectangle3.visible = false;
                            rectangle3.fill = javafx.scene.paint.Color.BLACK;
                            rectangle3.width = 100.0;
                            rectangle3.height = 50.0;
                            rectangle3.arcWidth = 0.0;
                            rectangle3.arcHeight = 0.0;
                            removeRow.visible = false;
                            removeRow.layoutX = 603.0;
                            removeRow.layoutY = 496.0;
                            removeRow.text = "Label";
                            removeRow.textFill = javafx.scene.paint.Color.BLACK;
                            groupRemoveRow.visible = false;
                            groupRemoveRow.layoutY = 0.0;
                            panelCalender.visible = true;
                            panelCalender.layoutX = 166.0;
                            panelCalender.layoutY = 180.0;
                            panelCalender.blocksMouse = true;
                            listName.visible = false;
                            listName.onKeyPressed = listNameOnKeyPressedAtShown;
                            listName.items = [ "Item 1", "Item 2", "Item 3", ];
                            panelCardDetails.visible = false;
                            panelCardDetails.blocksMouse = true;
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
                            rectangle.layoutX = 0.0;
                            rectangle.layoutY = 0.0;
                            rectangle.blocksMouse = true;
                            rectangle.stroke = DarkGray;
                            rectangle2.layoutX = 0.0;
                            rectangle2.height = 32.0;
                            rectangle2.arcWidth = 5.0;
                            rectangle2.arcHeight = 5.0;
                            label.layoutY = 1.0;
                            label.text = "Sales Maintenance - ctrl+M";
                            panelEditTable.visible = true;
                            panelEditTable.layoutY = 170.0;
                            rectTableBorder.visible = true;
                            rectTableBorder.disable = false;
                            rectTableBorder.fill = null;
                            panelTable.visible = false;
                            panelTable.disable = true;
                            imgEdit.visible = false;
                            imgEdit.image = null;
                            btnSaleMnEdit.visible = false;
                            btnSaleMnEdit.text = "Edit [F6]";
                            imageView5.visible = false;
                            imageView5.image = null;
                            btnSaleMnReprint.visible = false;
                            btnSaleMnReprint.layoutY = 0.0;
                            btnSaleMnReprint.text = "Button";
                            imageView4.visible = false;
                            imageView4.image = null;
                            btnSaleMnCancelForm.visible = false;
                            btnSaleMnCancelForm.text = "Button";
                            imageView3.visible = true;
                            imageView3.image = imagePrint;
                            btnSaleMnPrint.visible = true;
                            btnSaleMnPrint.onKeyReleased = btnSaleMnPrintOnKeyReleasedAtEditSalesCash;
                            btnSaleMnPrint.text = "Print [F2]";
                            btnSaleMnPrint.font = Arial_Bold_14;
                            btnSaleMnPrint.action = btnSaleMnPrintActionAtEditSalesCash;
                            imgUpdate.visible = true;
                            imgUpdate.image = imageUpdate;
                            btnSaleMnUpdate.visible = true;
                            btnSaleMnUpdate.layoutY = 0.0;
                            btnSaleMnUpdate.onKeyReleased = btnSaleMnUpdateOnKeyReleasedAtEditSalesCash;
                            btnSaleMnUpdate.text = "Update [F7]";
                            btnSaleMnUpdate.action = btnSaleMnUpdateActionAtEditSalesCash;
                            imgReset.visible = true;
                            imgReset.image = imageReset;
                            btnSaleMnReset.visible = true;
                            btnSaleMnReset.layoutY = 0.0;
                            btnSaleMnReset.text = "Reset [F4]";
                            btnSaleMnReset.action = btnSaleMnResetActionAtEditSalesCash;
                            imgCancel.visible = true;
                            imgCancel.layoutX = -5.0;
                            imgCancel.image = imageBack;
                            btnSaleMnCancel.visible = true;
                            btnSaleMnCancel.layoutY = 0.0;
                            btnSaleMnCancel.text = "Back [Ctrl+Left]";
                            btnSaleMnCancel.graphicTextGap = 0.0;
                            btnSaleMnCancel.action = btnSaleMnCancelActionAtEditSalesCash;
                            imageView2.visible = true;
                            btnSaleMnCancelBill.visible = true;
                            btnSaleMnCancelBill.cursor = null;
                            btnSaleMnCancelBill.effect = null;
                            btnSaleMnCancelBill.text = "Cancel Bill [F5]";
                            btnSaleMnCancelBill.font = Arial_Bold_14;
                            btnSaleMnCancelBill.action = btnSaleMnCancelBillActionAtEditSalesCash;
                            panelButton.visible = true;
                            lblCount.visible = false;
                            lblCount.text = "Label";
                            lblSalesCount.visible = false;
                            lblSalesCount.styleClass = "Borderless-text-box";
                            lblSalesCount.editable = true;
                            lblSalesTotal.visible = false;
                            lblSalesTotal.styleClass = "Borderless-text-box";
                            lblSalesTotal.editable = true;
                            labelSearch_By.visible = false;
                            labelSearch_By.layoutY = 100.0;
                            labelSearch_By.font = Arial_12;
                            labelSearch_By_Date.visible = false;
                            labelSearch_By_Date.layoutY = 150.0;
                            labelSearch_By_Date.font = Arial_12;
                            rdoSearch2.visible = false;
                            rdoSearch2.layoutY = 50.0;
                            rdoSearch2.text = "Radio Button";
                            rdoSearch2.toggleGroup = null;
                            label15.text = "Bill Edit";
                            label15.font = Arial_18;
                            rdoSearch.visible = false;
                            rdoSearch.layoutY = 50.0;
                            rdoSearch.text = "Radio Button";
                            rdoSearch.toggleGroup = null;
                            label16.visible = false;
                            label16.layoutY = 90.0;
                            lblSaleMnLastMonth.visible = false;
                            lblSaleMnLastMonth.layoutY = 160.0;
                            txtSaleMnKeyword.editable = false;
                            txtSaleMnKeyword.font = Arial_12;
                            optSearch.items = [ "Bill Number", "Customer Name", "Customer ID", ];
                            panelSearch.visible = false;
                            panelSearch.focusTraversable = false;
                            txtSaleMnDate.visible = false;
                            txtSaleMnDate.onKeyPressed = txtSaleMnDateOnKeyPressed;
                            txtSaleMnDate.editable = true;
                            txtSaleMnDate.font = Arial_12;
                            imageDate.visible = false;
                            imageDate.layoutY = 0.0;
                            imageDate.blocksMouse = false;
                            imageDate.fitWidth = 0.0;
                            imageDate.fitHeight = 0.0;
                            imageView.visible = false;
                            imageView.image = null;
                            btnSaleMnSearch.visible = false;
                            btnSaleMnSearch.layoutY = 143.0;
                            btnSaleMnSearch.effect = reflectionEffect;
                            panelDate.visible = true;
                            panelDate.layoutY = 94.0;
                            panelDate.blocksMouse = false;
                            panelDate.focusTraversable = false;
                            separator3.visible = false;
                            separator3.layoutX = 615.0;
                            separator3.layoutY = 125.0;
                            __layoutInfo_separator3.height = 50.0;
                            label2.visible = false;
                            label2.layoutY = 120.0;
                            label2.text = "Yesterday";
                            label2.font = Arial_Bold_12;
                            label2.textFill = DarkGray;
                            label3.visible = false;
                            label3.layoutX = 640.0;
                            label3.layoutY = 120.0;
                            label3.text = "Today";
                            label3.font = Arial_Bold_12;
                            label3.textFill = DarkGray;
                            label4.visible = true;
                            label4.layoutY = 96.0;
                            label4.text = "Bill No.";
                            label4.font = Arial_16;
                            label5.visible = true;
                            label5.layoutY = 128.0;
                            label5.text = "Customer Name";
                            label5.font = Arial_16;
                            txtSaleMnBillNo.visible = true;
                            txtSaleMnBillNo.layoutY = 94.0;
                            txtSaleMnBillNo.onKeyPressed = txtSaleMnBillNoOnKeyPressedAtEditSalesCash;
                            txtSaleMnBillNo.editable = false;
                            txtSaleMnBillNo.font = Arial_16;
                            txtSaleMnCName.visible = true;
                            txtSaleMnCName.layoutY = 128.0;
                            txtSaleMnCName.onKeyPressed = txtSaleMnCNameOnKeyPressedAtEditSalesCash;
                            txtSaleMnCName.onKeyReleased = txtSaleMnCNameOnKeyReleasedAtEditSalesCash;
                            txtSaleMnCName.promptText = "Enter Customer Name";
                            txtSaleMnCName.editable = true;
                            txtSaleMnCName.font = Arial_16;
                            label6.visible = true;
                            label6.layoutY = 96.0;
                            label6.text = "Billed Date";
                            label6.font = Arial_16;
                            label7.visible = true;
                            label7.layoutY = 128.0;
                            label7.text = "Doctor Name";
                            label7.font = Arial_16;
                            txtSaleMnDateEdit.visible = true;
                            txtSaleMnDateEdit.layoutY = 94.0;
                            txtSaleMnDateEdit.onKeyPressed = txtSaleMnDateEditOnKeyPressedAtEditSalesCash;
                            txtSaleMnDateEdit.editable = false;
                            txtSaleMnDateEdit.font = Arial_16;
                            imgSaleMnDateEdit.visible = true;
                            imgSaleMnDateEdit.layoutY = 94.0;
                            imgSaleMnDateEdit.onMouseClicked = imgSaleMnDateEditOnMouseClickedAtEditSalesCash;
                            imgSaleMnDateEdit.blocksMouse = true;
                            imgSaleMnDateEdit.image = image;
                            imgSaleMnDateEdit.fitWidth = 20.0;
                            imgSaleMnDateEdit.fitHeight = 25.0;
                            txtSaleMnDoctorName.visible = true;
                            txtSaleMnDoctorName.layoutY = 128.0;
                            txtSaleMnDoctorName.onKeyPressed = txtSaleMnDoctorNameOnKeyPressedAtEditSalesCash;
                            txtSaleMnDoctorName.onKeyReleased = txtSaleMnDoctorNameOnKeyReleasedAtEditSalesCash;
                            txtSaleMnDoctorName.editable = true;
                            txtSaleMnDoctorName.font = Arial_16;
                            employee_id.visible = true;
                            employee_id.layoutY = 96.0;
                            employee_id.text = "Employee ID";
                            employee_id.font = Arial_12;
                            cboEmp_code.visible = true;
                            cboEmp_code.layoutY = 96.0;
                            lblTotalMargin.visible = true;
                            lblTotalMargin.layoutY = 450.0;
                            lblTotalMargin.text = "";
                            lblTotalMargin.font = Arial_Bold_16;
                            lblTotalMargin.textFill = javafx.scene.paint.Color.BLACK;
                            label8.visible = true;
                            label8.layoutX = 0.0;
                            label8.layoutY = 0.0;
                            label8.text = "Products";
                            label8.font = Arial_16;
                            label9.visible = true;
                            label9.layoutX = 0.0;
                            label9.layoutY = 25.0;
                            label9.text = "Quantity";
                            label9.font = Arial_16;
                            label11.visible = true;
                            label11.layoutX = 0.0;
                            label11.layoutY = 50.0;
                            label11.text = "Discount";
                            label11.font = Arial_16;
                            label12.visible = true;
                            label12.layoutY = 0.0;
                            label12.text = "VAT";
                            label12.font = Arial_16;
                            panelLblColumn1.visible = true;
                            panelLblColumn1.layoutY = 430.0;
                            txtSaleMnTotItem.visible = true;
                            txtSaleMnTotItem.layoutX = 0.0;
                            txtSaleMnTotItem.layoutY = 0.0;
                            txtSaleMnTotItem.onKeyPressed = txtSaleMnTotItemOnKeyPressedAtEditSalesCash;
                            txtSaleMnTotItem.selectOnFocus = false;
                            txtSaleMnTotItem.editable = false;
                            txtSaleMnTotItem.font = Arial_16;
                            txtSaleMnTotQty.visible = true;
                            txtSaleMnTotQty.layoutX = 0.0;
                            txtSaleMnTotQty.layoutY = 25.0;
                            txtSaleMnTotQty.onKeyPressed = txtSaleMnTotQtyOnKeyPressedAtEditSalesCash;
                            txtSaleMnTotQty.selectOnFocus = false;
                            txtSaleMnTotQty.editable = false;
                            txtSaleMnTotQty.font = Arial_16;
                            txtSaleMnTotDis.visible = true;
                            txtSaleMnTotDis.layoutX = 0.0;
                            txtSaleMnTotDis.layoutY = 50.0;
                            txtSaleMnTotDis.onKeyPressed = txtSaleMnTotDisOnKeyPressedAtEditSalesCash;
                            txtSaleMnTotDis.onKeyTyped = txtSaleMnDiscountOnKeyTypedAtEditSalesCash;
                            txtSaleMnTotDis.selectOnFocus = false;
                            txtSaleMnTotDis.editable = true;
                            txtSaleMnTotDis.font = Arial_16;
                            txtSaleMnTotVAT.visible = true;
                            txtSaleMnTotVAT.layoutX = 400.0;
                            txtSaleMnTotVAT.layoutY = 0.0;
                            txtSaleMnTotVAT.onKeyPressed = txtSaleMnTotVATOnKeyPressedAtEditSalesCash;
                            txtSaleMnTotVAT.selectOnFocus = false;
                            txtSaleMnTotVAT.editable = false;
                            txtSaleMnTotVAT.font = Arial_16;
                            panelTxtColumn1.visible = true;
                            panelTxtColumn1.layoutY = 430.0;
                            label10.visible = true;
                            label10.layoutX = 0.0;
                            label10.layoutY = 25.0;
                            label10.text = "Sub Total";
                            label10.font = Arial_16;
                            label13.visible = true;
                            label13.layoutX = 0.0;
                            label13.layoutY = 0.0;
                            label13.font = Arial_16;
                            label14.visible = true;
                            label14.layoutX = 0.0;
                            label14.layoutY = 50.0;
                            label14.text = "Balance";
                            label14.font = Arial_16;
                            label19.visible = true;
                            label19.layoutY = 30.0;
                            label19.text = "Round Off";
                            label19.font = Arial_16;
                            panelLblColumn2.visible = true;
                            panelLblColumn2.layoutY = 430.0;
                            txtSaleMnSubTot.visible = true;
                            txtSaleMnSubTot.layoutX = 0.0;
                            txtSaleMnSubTot.layoutY = 25.0;
                            txtSaleMnSubTot.onKeyPressed = txtSaleMnSubTotOnKeyPressedAtEditSalesCash;
                            txtSaleMnSubTot.selectOnFocus = false;
                            txtSaleMnSubTot.editable = false;
                            txtSaleMnSubTot.font = Arial_16;
                            txtSaleMnBal.visible = true;
                            txtSaleMnBal.layoutX = 0.0;
                            txtSaleMnBal.layoutY = 50.0;
                            txtSaleMnBal.onKeyPressed = txtSaleMnBalOnKeyPressedAtEditSalesCash;
                            txtSaleMnBal.selectOnFocus = false;
                            txtSaleMnBal.editable = false;
                            txtSaleMnBal.font = Arial_16;
                            txtMaintaRoundof.visible = true;
                            txtMaintaRoundof.layoutY = 30.0;
                            txtMaintaRoundof.onKeyPressed = txtMaintaRoundofOnKeyPressedAtEditSalesCash;
                            txtMaintaRoundof.onKeyTyped = txtMaintaRoundofOnKeyTypedAtEditSalesCash;
                            txtMaintaRoundof.font = Arial_16;
                            txtSaleMnNetPaid.visible = true;
                            txtSaleMnNetPaid.onKeyPressed = txtSaleMnNetPaidOnKeyPressedAtEditSalesCash;
                            txtSaleMnNetPaid.onKeyTyped = txtSaleMnNetPaidOnKeyTypedAtEditSalesCash;
                            txtSaleMnNetPaid.font = Arial_16;
                            panelTxtColumn2.visible = true;
                            panelTxtColumn2.layoutY = 430.0;
                            txtSaleMnTotAmt.visible = true;
                            txtSaleMnTotAmt.layoutX = 55.0;
                            txtSaleMnTotAmt.layoutY = 0.0;
                            __layoutInfo_txtSaleMnTotAmt.height = 70.0;
                            txtSaleMnTotAmt.onKeyPressed = txtSaleMnTotAmtOnKeyPressedAtEditSalesCash;
                            txtSaleMnTotAmt.promptText = "0.00";
                            txtSaleMnTotAmt.editable = false;
                            txtSaleMnTotAmt.font = Arial_Bold_65;
                            label17.visible = true;
                            label17.opacity = 0.56;
                            label17.layoutX = 0.0;
                            label17.layoutY = 25.0;
                            label17.text = "Total";
                            label17.font = Arial_20;
                            label17.textFill = DarkGray;
                            panelAmt.visible = true;
                            panelAmt.layoutY = 440.0;
                            imageCustDown.visible = true;
                            imageCustDown.layoutY = 128.0;
                            imageCustDown.onMouseClicked = imageCustDownOnMouseClickedAtEditSalesCash;
                            imageCustDown.blocksMouse = true;
                            imageCustDown.image = imageDown;
                            imageCustDown.fitHeight = 26.0;
                            imageDoctorDown.visible = true;
                            imageDoctorDown.layoutY = 128.0;
                            imageDoctorDown.onMouseClicked = imageDoctorDownOnMouseClickedAtEditSalesCash;
                            imageDoctorDown.blocksMouse = true;
                            imageDoctorDown.image = imageDown;
                            imageDoctorDown.fitHeight = 26.0;
                            rectangle3.visible = true;
                            rectangle3.fill = null;
                            rectangle3.width = 120.0;
                            rectangle3.height = 20.0;
                            rectangle3.arcWidth = 10.0;
                            rectangle3.arcHeight = 10.0;
                            removeRow.visible = true;
                            removeRow.layoutX = 0.0;
                            removeRow.layoutY = 0.0;
                            __layoutInfo_removeRow.width = 120.0;
                            __layoutInfo_removeRow.height = 20.0;
                            removeRow.onMouseClicked = removeRowOnMouseClickedAtEditSalesCash;
                            removeRow.text = "Remove Row [F12]";
                            removeRow.textFill = javafx.scene.paint.Color.BLACK;
                            groupRemoveRow.visible = true;
                            groupRemoveRow.layoutY = 420.0;
                            panelCalender.visible = true;
                            panelCalender.layoutX = 161.0;
                            panelCalender.layoutY = 125.0;
                            panelCalender.blocksMouse = true;
                            listName.visible = false;
                            listName.items = null;
                            panelCardDetails.visible = true;
                            panelCardDetails.blocksMouse = true;
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

    function imgSaleMnDateEditOnMouseClickedAtEditSalesCash(event: javafx.scene.input.MouseEvent): Void {
        panelCalender.layoutX = C4LX+100;
        fxCalendar.visible = true;        
        if (not dateFlag1) {
            if (txtSaleMnDateEdit.text != null) {
                var dat = txtSaleMnDateEdit.rawText.split("-");
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
            dateFlag1 = true;
        } else {
            fxCalendar.visible = false;
        }
     }

    var visit1 = bind fxCalendar.visible on replace {
        if (dateFlag1 and not visit1) {
            getDate(1);
        }
    };   
     
     var salesDiscSettings = bind CommonDeclare.salesDiscApply on replace {
        SalesMaintainEditTable.dtmodel.setCellEditable(0, 9, salesDiscSettings);
    }

    function txtSaleMnDiscountOnKeyTypedAtEditSalesCash(event: javafx.scene.input.KeyEvent): Void {
        if(not txtSaleMnTotDis.rawText.trim().equals("")) {
            var intValid:Integer;
            valid1 = new Validation();
            intValid = valid1.getDecimalValid(txtSaleMnTotDis.rawText, 1, 6);
            if(intValid ==1){
                FXinfo("Discount amount cannot be more than 6 digits.");
            }
            else if(intValid ==0){
                FXinfo("Please enter only numbers.Characters not allowed");
            }
            else if(Double.parseDouble(txtSaleMnTotDis.rawText) >= SalesMaintainEditTable.totAmt) {
                FXinfo("Discount Amount cannot be greater than total Amount");
            }
            else {
                SalesMaintainEditTable.calcDiscount(txtSaleMnTotDis.rawText.trim());
                calcDiscTotal ("disc","",0.00);
            }
        }
        else {
            SalesMaintainEditTable.calcDiscount("0");
            calcDiscTotal ("disc","",0.00);
        }
        }

    function calcDiscTotal (calcType:String,type1:String,totalAmt:Double): Void {
            var ta: Double = Value.Round(SalesMaintainEditTable.totAmt, 2);
            var tda: Double = Value.Round(SalesMaintainEditTable.totDistAmt, 2);
            var tvat: Double = Value.Round(SalesMaintainEditTable.totVATAmt, 2);
            netAmt = Value.Round((ta - tda), 2);
            var netPaid = txtSaleMnNetPaid.rawText;
            txtSaleMnSubTot.text = "{ta}";
            txtSaleMnTotQty.text = "{SalesMaintainEditTable.totQty}";
            txtSaleMnTotItem.text = "{SalesMaintainEditTable.totItems}";
            lblTotalMargin.text = "TOTAL MARGIN : {Value.Round(SalesMaintainEditTable.totMargin)}";
            if(calcType.equals("total")) {
            txtSaleMnTotDis.text = "{tda}";
            }
            txtSaleMnTotVAT.text = "{tvat}";
            if(type1.equals("init")){
            txtSaleMnTotAmt.text  = "{Value.Round(totalAmt)}";
            txtMaintaRoundof.text = "{Value.Round(totalAmt - netAmt)}";
            } else {
                var autoRoundoff : Integer = 0;
                try {
                    var settingsController : com.vanuston.medeil.implementation.Settings =  RegistryFactory.getClientStub(RegistryConstants.Configuration) as com.vanuston.medeil.implementation.Settings;
                    autoRoundoff = settingsController.getEnableAutoRoundoff()[0];
                }catch(e1:Exception){
                    log.debug("updateIntValues() settingsCtrl Exception:{e1.getMessage()}");
                }
                if(autoRoundoff==0) {
                    txtSaleMnTotAmt.text = "{Value.roundToHalfVal("{netAmt}")}0";
                    txtMaintaRoundof.text = "{Value.Round(Double.parseDouble(txtSaleMnTotAmt.text) - netAmt)}";
                    txtMaintaRoundof.editable=false;
                }
                else if(autoRoundoff==1) {
                    txtSaleMnTotAmt.text = "{Value.roundToWholeVal("{netAmt}")}0";
                    txtMaintaRoundof.text = "{Value.Round(Double.parseDouble(txtSaleMnTotAmt.text) - netAmt)}";
                    txtMaintaRoundof.editable=false;
                }
                else {
                    txtSaleMnTotAmt.text = "{Value.Round("{netAmt}")}";
                    txtMaintaRoundof.text = "{Value.Round(Double.parseDouble(txtSaleMnTotAmt.text) - netAmt)}";
                    txtMaintaRoundof.editable=true;
                }
            }
            var totAmt = txtSaleMnTotAmt.rawText;
            if(not billType.equals("Credit_Bill"))
            {
               txtSaleMnNetPaid.text = "{txtSaleMnTotAmt.rawText}";
               txtSaleMnBal.text = "0.00";
            }
            else {
                txtSaleMnNetPaid.text = netPaid;
                txtSaleMnBal.text = "{Value.Round(Double.parseDouble(totAmt) - Double.parseDouble(netPaid))}";
            }
            if(txtSaleMnNetPaid.text.equals("")) {
                txtSaleMnNetPaid.text = "0.00";
            } else if(txtMaintaRoundof.text.equals("")) {
                txtMaintaRoundof.text = "0.00";
            }
    }

    function btnSaleMnReprintOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if(event.code==KeyCode.VK_F2) {
           rePrint();
        }
        }

    function btnSaleMnReprintOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        rePrint();
         }

     function rePrint():Void {
        var billNumber:String= SalesMaintainLoadTable.invoice;
        var btype:String = SalesMaintainLoadTable.typ;
            if (btype.equals("Cash_Bill")) {
                billType = "cash";
            } else if (btype.equals("Account")) {
                billType = "counter";
            } else if (btype.equals("Credit_Bill")) {
                billType = "credit";
            } else if (btype.equals("CD_Card_Bill")) {
                billType = "cards";
            }        
        if(btype.equals("") or billNumber.equals("")) {
            FXinfo("Please select the appropriate row to print the bill");
        }
        else if(not btype.equals("")) {
        var cn:ConfirmDialogBox=new ConfirmDialogBox(3,"Sales");
        if(cn.staus==true){
        var reportSource: File = new File("printerfiles/Print.jasper");
        var jasperReport:JasperReport =  JRLoader.loadObject(reportSource) as JasperReport;
        var jasperPrint:JasperPrint = salesController.jasperPrint(billNumber, "Sales_{billType}", jasperReport);
        JasperPrintManager.printReport(jasperPrint, false);
        FXalert(7);
        }
        }       
     }


    function txtMaintaRoundofOnKeyPressedAtEditSalesCash(event: javafx.scene.input.KeyEvent): Void {
        if(event.code==KeyCode.VK_TAB) {
         btnSaleMnPrint.requestFocus();
        }
        shortcut(event);
         }

    function txtMaintaRoundofOnKeyTypedAtEditSalesCash(event: javafx.scene.input.KeyEvent): Void {
        if (NumberUtils.isNumeric(txtMaintaRoundof) and not txtMaintaRoundof.rawText.equals("")) {
         txtSaleMnTotAmt.text = "{Value.Round(netAmt+Double.parseDouble(txtMaintaRoundof.text))}";
         if(SalesMaintainLoadTable.typ.equals("Cash_Bill")) {
             txtSaleMnNetPaid.text = txtSaleMnTotAmt.text;
             txtSaleMnBal.text = "0.00";
        } else if (SalesMaintainLoadTable.typ.equals("Credit_Bill") and not txtSaleMnNetPaid.rawText.equals("")) {
                var bal = Double.parseDouble(txtSaleMnTotAmt.text) - Double.parseDouble(txtSaleMnNetPaid.rawText);
                txtSaleMnBal.text = Value.Round("{bal}");
            }
            }
         }

    

    function cboEmp_codeOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        empCode = commonController.getEmployeeCode("").toArray() as String[];
         }

    function cboEmp_codeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        empCode = commonController.getEmployeeCode("").toArray() as String[];
        if(event.code==KeyCode.VK_TAB) {
         txtSaleMnDoctorName.requestFocus();
        }
        shortcut(event);
         }

   function creditLimitAlert(custName:String):Boolean{
        var custos:Double = Double.parseDouble(commonController.getCustomerBalance("{custName}"));
        var balamt:Double;
        if(txtSaleMnBal.text!=""){
        balamt = Double.parseDouble(txtSaleMnBal.text);
        }
        var creditLimit:Double = salesController.getCreditLimit("{custName}");
        var credit:Boolean = false;
        
        if(creditLimit!=0 and creditLimit < (custos+balamt-Double.parseDouble(oldBalanceAmt))){
            credit = true;
        }
        return credit;
    }

    function rdoSearch2OnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        txtSaleMnKeyword.text = "";
        txtSaleMnDate.style = mandatoryStyle;
        txtSaleMnKeyword.style = "";
         }

    function rdoSearchOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        txtSaleMnDate.text = "";
        txtSaleMnKeyword.style = mandatoryStyle;
        txtSaleMnDate.style = "";
         }

    function rdoSearchOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
         }


    function txtSaleMnNetPaidOnKeyTypedAtEditSalesCash(event: javafx.scene.input.KeyEvent): Void {

             if (NumberUtils.isNumeric(txtSaleMnNetPaid)) {
                if (SalesMaintainLoadTable.typ.equals("Credit_Bill") and not txtSaleMnNetPaid.rawText.equals("")) {
                var bal = Double.parseDouble(txtSaleMnTotAmt.text) - Double.parseDouble(txtSaleMnNetPaid.rawText);
                txtSaleMnBal.text = Value.Round("{bal}");
            }
            };
    }

    

    function txtSaleMnDateOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ESCAPE) {
            fxCalendar.visible = false;
        }
    }

    function changeTableSize(i: Integer, j: Integer): Void {
        SalesLoad.getJComponent().setPreferredSize(new Dimension(i, j));
        SalesLoadEdit.getJComponent().setPreferredSize(new Dimension(i, j));
    }

    function btnSaleMnCancelFormOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
       if (event.code == KeyCode.VK_ENTER) {
       cancel();
       }
    }

    function btnSaleMnPrintOnKeyReleasedAtEditSalesCash(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function imageDoctorDownOnMouseClickedAtEditSalesCash(event: javafx.scene.input.MouseEvent): Void {
        listDoctorChanges(0);
    }

    function imageCustDownOnMouseClickedAtEditSalesCash(event: javafx.scene.input.MouseEvent): Void {
         listCustomerChanges(0);
    }

    function cancel(): Void {
        
        Empty();
        delete  panelTable.content;
        delete  panelEditTable.content;
        delete  panel.content;
        panel.visible = false;
        CommonDeclare.form[1] = 0;
    }

    function btnSaleMnCancelFormActionAtShown(): Void {
        cancel();
    }

    function rectangleOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        fxCalendar.visible = false;
        listName.visible = false;
    }

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Sales Maintenance", type);
        showAlertbox();
    }

    function FXalert(type: Integer, msg: String, output: String): Void {
        CustomAlert.ShowAlert("Sales Maintenance", type, msg, output);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Sales Maintenance", msg);
        showAlertbox();
    }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Sales Maintenance", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = errorStyle;
    }

    function listNameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (listName.focused) {
            if (event.code == KeyCode.VK_DOWN)
                listName.selectFirstRow();
        }
    }

    function txtSaleMnDoctorNameOnKeyReleasedAtEditSalesCash(event: javafx.scene.input.KeyEvent): Void {
        //-getDoctor(txtSaleMnDoctorName.rawText);
        listDoctorChanges(1);
    }

    function txtSaleMnCNameOnKeyReleasedAtEditSalesCash(event: javafx.scene.input.KeyEvent): Void {
     //-   getCust(txtSaleMnCName.rawText);
        listCustomerChanges(1);
    }
function listCustomerChanges(type: Integer): Void {
        var listControlObj: ListController = new ListController();
        listName.visible = true;
        listH = 0.0;
        listName.layoutX = txtSaleMnCName.layoutX;
        listName.layoutY = txtSaleMnCName.layoutY + 25;
        listH = listControlObj.listImageControlView(txtSaleMnCName, listName, "customer", type);
         var selS: String = bind listControlObj.selectedString on replace {
                
                if (selS.length() > 0) {                    
                    cboEmp_code.requestFocus();
    }
    }
    }
function listDoctorChanges(type: Integer): Void {
        var listControlObj: ListController = new ListController();
         listName.visible = true;
        listH = 0.0;
        listName.layoutX = txtSaleMnDoctorName.layoutX;
        listName.layoutY = txtSaleMnDoctorName.layoutY + 25;
        listH = listControlObj.listImageControlView(txtSaleMnDoctorName, listName, "doctor", type);
         var selS: String = bind listControlObj.selectedString on replace {
                
                if (selS.length() > 0) {
                    SalesMaintainEditTable.focusSet();
    }
    }
    }

    function optSearchOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        txtSaleMnKeyword.requestFocus();
    }

    function optSearchOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtSaleMnKeyword.requestFocus(); }
    }

    function btnSaleMnCancelBillOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
        Cancel_Bill();
        }else{ shortcut(event);}
    }

    function btnSaleMnCancelOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
        reset();
        }else{ shortcut(event);}
    }

    function btnSaleMnResetOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
        reset();
        }else{ shortcut(event);}
    }

    function btnSaleMnPrintOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
         if (event.code == KeyCode.VK_ENTER) {
        update(0);
        }
    }

    function btnSaleMnUpdateOnKeyReleasedAtEditSalesCash(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
        update(1);
        }
    }

    function txtSaleMnTotAmtOnKeyPressedAtEditSalesCash(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { btnSaleMnUpdate.requestFocus(); }
        shortcut(event);
    }

    function txtSaleMnBalOnKeyPressedAtEditSalesCash(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtSaleMnTotAmt.requestFocus(); }
        shortcut(event);
    }

    function txtSaleMnNetPaidOnKeyPressedAtEditSalesCash(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            //-               txtSaleMnNetPaid.text = Value.Round(txtSaleMnNetPaid.rawText);
            txtSaleMnBal.requestFocus();
        }
        shortcut(event);
    }

    function txtSaleMnTotVATOnKeyPressedAtEditSalesCash(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
        //-txtSaleMnNetPaid.requestFocus();
        }
        shortcut(event);
    }

    function txtSaleMnTotDisOnKeyPressedAtEditSalesCash(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtSaleMnTotVAT.requestFocus(); }
         if(settingsController.getSalesDiscountType()==0){
                txtSaleMnTotDis.editable=false;
            }
            else {
                txtSaleMnTotDis.editable=true;
            }
        shortcut(event);
    }

    function txtSaleMnSubTotOnKeyPressedAtEditSalesCash(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtSaleMnTotDis.requestFocus(); }
        shortcut(event);
    }

    function txtSaleMnTotQtyOnKeyPressedAtEditSalesCash(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtSaleMnSubTot.requestFocus(); }
        shortcut(event);
    }

    function txtSaleMnTotItemOnKeyPressedAtEditSalesCash(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtSaleMnTotQty.requestFocus(); }

        shortcut(event);
    }

    function txtSaleMnDoctorNameOnKeyPressedAtEditSalesCash(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ESCAPE) {
            listName.visible = false;
            SalesMaintainEditTable.focusSet();
            updateValues();
            }
            if (event.code == KeyCode.VK_DOWN) {
               listDoctorChanges(1);
               listName.requestFocus();
               listName.selectFirstRow();
            }
            
     
        shortcut(event);
    }

    function txtSaleMnCNameOnKeyPressedAtEditSalesCash(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ESCAPE) {
            listName.visible = false;
            cboEmp_code.requestFocus();
            updateValues();
            }
            if (event.code == KeyCode.VK_DOWN) {
                listCustomerChanges(1);
               listName.requestFocus();
               listName.selectFirstRow();
            }

      
        shortcut(event);
    }

    function txtSaleMnDateEditOnKeyPressedAtEditSalesCash(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtSaleMnCName.requestFocus(); }
        shortcut(event);
    }

    function txtSaleMnBillNoOnKeyPressedAtEditSalesCash(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtSaleMnCName.requestFocus(); }
        shortcut(event);
    }

    def kr = KeyRegistry {};
    var key = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 2 and CommonDeclare.form[1] == 8) {
            shortcut(key);
        }
    }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == kr.edit and btnSaleMnEdit.text == "Edit [F6]") {
            edit();
        }
        if (event.code == kr.cancel and btnSaleMnCancelForm.text == "Cancel [F8]") {
            cancel();
        }
        if (event.code == kr.print and btnSaleMnPrint.text == "Print [F2]" and not btnSaleMnPrint.disable) {
            update(1);
        }
        if (event.code == kr.print and btnSaleMnReprint.text == "Print [F2]" and not btnSaleMnReprint.disable) {
            rePrint();
        }
        if (event.code == kr.update and btnSaleMnUpdate.text == "Update [F7]" and not btnSaleMnUpdate.disable) {
            update(0);
        }
        if (event.code == kr.del and btnSaleMnCancelBill.text == "Cancel Bill [F5]" and not btnSaleMnCancelBill.disable) {
            Cancel_Bill();
        }
        if (event.code == kr.reset and btnSaleMnReset.text == "Reset [F4]") {
            //-    StockSub();
            reset();
        }
        if (event.controlDown and event.code == kr.back) {
            if (btnSaleMnCancel.text == "Back [Ctrl+Left]") {
                //-    StockSub();
                reset();
            }
        }
        if (event.code == kr.rRow) {
            if (btnSaleMnPrint.text == "Print [F2]" and btnSaleMnUpdate.text == "Update [F7]") {
                SalesMaintainEditTable.removeRow(); updateValues();
            }
        }
    }

    function txtSaleMnKeywordOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {      
        shortcut(event);        
    }

    function btnSaleMnEditOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
        edit();
        } else {
        shortcut(event);
    }
    }

    function removeRowOnMouseClickedAtEditSalesCash(event: javafx.scene.input.MouseEvent): Void {
        SalesMaintainEditTable.removeRow(); updateValues();
    }

    function btnSaleMnPrintActionAtEditSalesCash(): Void {
        update(1);
    }

    function btnSaleMnUpdateActionAtEditSalesCash(): Void {
        update(0);
    }

    public function update(p: Integer):Void {
        var tableName: String;
        
        var btype: String = SalesMaintainLoadTable.typ;
        try {
            if (btype.equals("Cash_Bill")) {
                tableName = "sales_cash_bill";
                billType = "cash";
                saveSales(tableName, billType, p);
            } else if (btype.equals("Account")) {
                tableName = "sales_accounts";
                billType = "counter";
                saveSales(tableName, billType, p);
            } else if (btype.equals("Credit_Bill")) {
                tableName = "sales_credit_bill";
                billType = "credit";
                saveSales(tableName, billType, p);
            }
        } catch (e: Exception) {
            var msg: String = "Class : Sales Maintanance  Method : Update()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function saveSales(tableName: String, billType: String, ss: Integer): Void {
        try {
            var check = checkValid();
            updateValues();
            var sales = new SalesModel();
            if (check == 0) {
                sales.setCustomerName(txtSaleMnCName.rawText);
                sales.setDoctorName(txtSaleMnDoctorName.rawText);
                sales.setBillNumber(txtSaleMnBillNo.rawText);
                var sdf = new SimpleDateFormat("dd-MM-yyyy");
                var billDate = DateUtils.changeFormatDate(sdf.parse(txtSaleMnDateEdit.rawText));
                sales.setBillDate(billDate);
                sales.setBillType(billType);
                System.out.println("UiMAi");
               // sales.setTotalDiscount(Double.parseDouble(txtSaleMnTotDis.rawText));
              //  sales.setTotalAmount(Double.parseDouble(txtSaleMnTotAmt.rawText));
              // Assuming SalesMaintainEditTable.totAmt is of type Double
            // Assuming SalesMaintainEditTable.totAmt is a String
// Assuming SalesMaintainEditTable.totAmt is of type Double
sales.setTotalDiscount(SalesMaintainEditTable.totDistAmt);
sales.setTotalAmount(SalesMaintainEditTable.totAmt);
System.out.println("UiMAint");
System.out.println(SalesMaintainEditTable.totAmt);
System.out.println(SalesMaintainEditTable.totDistAmt);

                sales.setPaidAmount(Double.parseDouble(txtSaleMnNetPaid.rawText));
                sales.setBalanceAmount(Double.parseDouble(txtSaleMnBal.rawText));
                sales.setTotalVAT(Double.parseDouble(txtSaleMnTotVAT.rawText));
                sales.setTotalQuantity(Integer.parseInt(txtSaleMnTotQty.rawText));
                sales.setTotalItems(Integer.parseInt(txtSaleMnTotItem.rawText));
                sales.setListofitems(SalesMaintainEditTable.getSalesBillItems());
                sales.setFormType("maintenance");
                sales.setSalesReturnNumber("");
                sales.setSalesReturnDate("0000-00-00");
                sales.setEmployeeID(cboEmp_code.selectedItem.toString());
                var returnObject = new Object();
                returnObject = salesController.createRecord(sales);
                var msgReturnModel: MsgReturnModel = new MsgReturnModel();
                msgReturnModel = returnObject as MsgReturnModel;
                SalesMaintainEditTable.focusSet(msgReturnModel.getRowCount(), msgReturnModel.getColumnCount());
                var type = "";
                if (msgReturnModel.getReturnMessage() == "1") {
                                    var cn:ConfirmDialogBox=new ConfirmDialogBox(0,"Sales");
                                    var a =bind cn.staus;
                                    if (a) {
                                        var update: Boolean;
                                        update = salesController.updateRecord(sales) as Boolean;
                                        if (update == true) {
                                            type = "update";                                            
                                            reset();
                                        }
                                        if (ss == 1) {                                            
                                            type = "Print";
                                            var reportSource: File = new File("printerfiles/Print.jasper");
                                            var jasperReport:JasperReport =  JRLoader.loadObject(reportSource) as JasperReport;
                                            var jasperPrint:JasperPrint = salesController.jasperPrint(sales.getBillNumber(), "Sales_{billType}", jasperReport);
                                            JasperPrintManager.printReport(jasperPrint, false);                                            
                                            reset();
                                        }
                                        FXalert(4);
                                    }

                } else {
                    FXinfo(msgReturnModel.getReturnMessage());
                }
                commonController.userLog("Sales Maintenance",type);
            }
        } catch (e: Exception) {            
            var msg: String = "Class : Sales Maintanance  Method : Save()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function btnSaleMnCancelActionAtEditSalesCash(): Void {
        //-   StockSub();
        currentState.actual = currentState.findIndex("Shown");
        panelTableLY = 175.0;
        TableH = 310.0;
        SalesLoadEdit.visible = false;
        SalesLoad.visible = true;
        updateValues();
        reset();
    }

    function btnSaleMnResetActionAtEditSalesCash(): Void {
        //-     StockSub();
        reset();
    }

    public function reset(): Void {        
        currentState.actual = currentState.findIndex("Shown");
        panelTableLY = 175.0;
        TableH = 310.0;
        SalesLoadEdit.visible = false;
        SalesLoad.visible = true;
        //- txtSaleMnNetPaid.editable=false;
        //clear();      
        if(txtSaleMnDate.text.equals("")) {
            rdoSearch.selected = true;
        }
        else {
            rdoSearch2.selected = true;
            rdoSearch2.requestFocus();
        }
        updateValues();
    }

    function checkBillYear():Integer {
        var btype: String = SalesMaintainLoadTable.typ;
        var module:String="";
        var billYear:String="";
        var validDate:Integer=0;
        if (btype.equals("Cash_Bill")) {
            module = "CashSales";
            billYear=txtSaleMnBillNo.text.substring(3, 5);
        } else if (btype.equals("Account")) {
            module = "AccountSales";
            billYear=txtSaleMnBillNo.text.substring(4, 6);
        } else if (btype.equals("Credit_Bill")) {
            module = "CreditSales";
            billYear=txtSaleMnBillNo.text.substring(3, 5);
        } else if (btype.equals("CD_Card_Bill")) {
            module = "CardSales";
            billYear=txtSaleMnBillNo.text.substring(4, 6);
        }
       var billDate= DateUtils.changeFormatDate(sdf.parse(txtSaleMnDateEdit.rawText));
       var financeYear= commonController.getQueryValue("SELECT substring(billyear,3)  FROM financecheck where '{billDate}' between startdate and enddate and module='{module}';");       
       if(billYear.equals(financeYear)) {
           validDate=0;
       }
       else {
           validDate=1;
       }
       return validDate;
    }

    function checkValid(): Integer {
        var retVal = 0;        
        if (SalesMaintainEditTable.nullVal == 0) {
            retVal = 1;
            FXinfo("Sales Table is Empty. Please enter some values");
            SalesMaintainEditTable.focusSet();
        } else if(Double.parseDouble(txtSaleMnTotAmt.text) <=0) {
            retVal = 1;
            FXinfo("Total Amount should be non-negative value");
        } else if(billType.equals("credit") and creditLimitAlert(txtSaleMnCName.rawText.trim()).equals(true)) {
            
            retVal = 1;
            var creditLimit:Double = salesController.getCreditLimit("{txtSaleMnCName.rawText.trim()}");
            FXinfo("Customer oustanding exceeds the Credit Limit - {creditLimit}. To Change credit Limit in Customer Information, press ALT+C." );
        }
        else if(SalesMaintainLoadTable.typ.equals("Credit_Bill") and txtSaleMnNetPaid.text.equals("") ) {
            retVal = 1;
            FXinfo("Please enter the paid Amount",txtSaleMnNetPaid);
        }
        else if(txtSaleMnCName.rawText.trim().length() > 40) {
            FXinfo("Customer Name length cannot be more than 40 characters");
            retVal = 1;
        }  else if(txtSaleMnDoctorName.rawText.trim().length() > 100) {
            FXinfo("Doctor Name length cannot be more than 100 characters");
            retVal = 1;
        }
        else if(not txtMaintaRoundof.text.equals("") and (Double.parseDouble(txtMaintaRoundof.text) > 0.99 or Double.parseDouble(txtMaintaRoundof.text)<-0.99) ) {
            retVal = 1;
            FXinfo("Round off value entered is incorrect. Please check",txtMaintaRoundof);
        }
        else if(checkBillYear()==1) {
            retVal = 1;
            FXinfo("Bill date should be within the current Financial year");
        }
        else {
            retVal = 0;
        }
        return retVal;
    }

    function isValidDate(date:String ) : Boolean {        
        var sdff : SimpleDateFormat = new SimpleDateFormat("dd-MM-yyyy");
        var testDate : java.util.Date = null;
        var isValid : Boolean  = false;
        try {
        try
        {
          testDate = sdff.parse(date);
          isValid = true;
        } catch (e1: java.text.ParseException) {
            isValid = false;
        }        
        if (not (sdff.format(testDate) == date) ) {
            isValid = false;
        }
        }catch(e: Exception) {
            log.debug("class:SalesMaintenance isValidDate:{e.getMessage()}");            
        }        
        return isValid;
    }
    
    function btnSaleMnCancelBillActionAtEditSalesCash(): Void {
        Cancel_Bill();
    }

    public function Cancel_Bill() {
        var tableName: String;
        var billType: String;
        var btype: String = SalesMaintainLoadTable.typ;
        try {
            if (btype.equals("Cash_Bill")) {
                tableName = "sales_cash_bill";
                billType = "cash";
            } else if (btype.equals("Account")) {
                tableName = "sales_accounts";
                billType = "counter";
            } else if (btype.equals("Credit_Bill")) {
                tableName = "sales_credit_bill";
                billType = "credit";
            }
            cancelBill(tableName, billType);
        } catch (e: Exception) {
            var msg: String = "Class : Sales Maintanance  Method : Update()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function cancelBill(tableName: String, billType: String): Void {
        try {
            var check = checkValid();
            if (check == 0) {
//                FXalert(5, "Are you sure you want to Cancel the Bill ?", "Bill Cancelled Successfully.");
                var cn:ConfirmDialogBox=new ConfirmDialogBox(2,"Sales");
                var sales = new SalesModel();
                sales.setCustomerName(txtSaleMnCName.rawText);
                sales.setDoctorName(txtSaleMnDoctorName.rawText);
                sales.setBillNumber(txtSaleMnBillNo.rawText);
                var sdf = new SimpleDateFormat("dd-MM-yyyy");
                var billDate = DateUtils.changeFormatDate(sdf.parse(txtSaleMnDateEdit.rawText));
                sales.setBillDate(billDate);
                sales.setBillType(billType);
                sales.setTotalDiscount(Double.parseDouble(txtSaleMnTotDis.rawText));
                sales.setTotalAmount(Double.parseDouble(txtSaleMnTotAmt.rawText));
                sales.setPaidAmount(Double.parseDouble(txtSaleMnNetPaid.rawText));
                sales.setBalanceAmount(Double.parseDouble(txtSaleMnBal.rawText));
                sales.setTotalVAT(Double.parseDouble(txtSaleMnTotVAT.rawText));
                sales.setTotalQuantity(Integer.parseInt(txtSaleMnTotQty.rawText));
                sales.setTotalItems(Integer.parseInt(txtSaleMnTotItem.rawText));
                sales.setListofitems(SalesMaintainEditTable.getSalesBillItems());
                sales.setFormType("cancelbill");
                sales.setSalesReturnNumber("");
                sales.setSalesReturnDate("0000-00-00");
                sales.setEmployeeID(cboEmp_code.selectedItem.toString());
                var a =bind cn.staus;
                                if (a) {
                                    try{
                                    var update: Boolean;
                                    update = salesController.updateRecord(sales) as Boolean;
                                    if (update == true) {
                                        FXinfo("Bill Cancellation done Sucessfully.");
                                        reset();
                                        clear();
                                    } 
                                 } catch(e: Exception){
                                       var msg: String = "Class : Sales Maintanance  Method : cancelBill()   = {e.getMessage()} ";
                                       log.debug(msg);
                                   }
                              }
                        }
                    commonController.userLog("Sales Maintenance","Cancel");
        } catch (e: Exception) {
            var msg: String = "Class : Sales Maintanance  Method : Edit()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function btnSaleMnEditActionAtShown(): Void {
        edit();
    }

    public function edit(): Void {

        var bno: String = SalesMaintainLoadTable.invoice;
        var type: String = SalesMaintainLoadTable.typ;
        var btype:String;
        var salesModel = new SalesModel();

        try {
            if (type.equals("Cash_Bill")) {
                btype = "cash";
            } else if (type.equals("Account")) {
                btype = "counter";
            } else if (type.equals("Credit_Bill")) {
                btype = "credit";
            }
            var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
            var freeBillCount = commonController.freeBillCount();//Free Edition alert
            if (freeBillCount >= CommonDeclare.freeLimit) {
                var msg = "You have reached a maximum limit of {CommonDeclare.freeLimit} invoices in MEDEIL - FREE Edition. To continue billing, please purchase/upgrade to the latest edition";
                def MessageBox=MessageBox{};
                MessageBox.MsgBox("Probilz - Sales", "Warning", msg);
                delete  panelAlert.content;
                insert MessageBox.getDesignRootNodes() into panelAlert.content;
                panelEditTable.disable = true;
            } else if (bno.equals("") or type.equals("")) {
                FXinfo("Please Select the table row you want to Edit.");
            } else {

                currentState.actual = currentState.findIndex("EditSalesCash");
                panelTableLY = 150.0;
                TableH = 245.0;
                SalesLoad.visible = false;
                SalesLoadEdit.visible = true;
               if(not type.equalsIgnoreCase("CD_Card_Bill")) {
                salesModel = SalesMaintainEditTable.salesEditValues(bno,btype);                
              }
             if(maintainData(salesModel)){
             billType=type;
             if (type.equals("Credit_Bill")) {
             txtSaleMnNetPaid.editable=true;
             txtSaleMnNetPaid.text = netPaid;
             }
             else
             {
              txtSaleMnNetPaid.editable=false;
              txtSaleMnNetPaid.text=txtSaleMnTotAmt.text;
             }
             updateValues();
          }
            }

            if (type.equals("CD_Card_Bill")) {
                FXinfo("Sales Card Bill cannot be edited.");
                reset();
            }
            editTableFocusSet();

        } catch (e: Exception) {
            var msg: String = "Class : Sales Maintanance  Method : Edit()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function editTableFocusSet(): Void {
        (table1 as javax.swing.JTable).setCellSelectionEnabled(true);
    }

    function loadTableFocusSet(): Void {
        (table as javax.swing.JTable).requestFocus();
        (table as javax.swing.JTable).changeSelection(0, 0, false, false);
        (table as javax.swing.JTable).changeSelection(1, 5, false, false);
        (table as javax.swing.JTable).changeSelection(0, 5, false, false);
        (table as javax.swing.JTable).setCellSelectionEnabled(true);
    }

    public function maintainData(salesModel: SalesModel): Boolean {
        try {
            sales = salesModel;
            txtSaleMnBillNo.text = sales.getBillNumber();
            lblTotalMargin.text = "TOTAL MARGIN :";
            txtSaleMnDateEdit.text = sales.getBillDate();
            txtSaleMnCName.text = sales.getCustomerName();
            txtSaleMnDoctorName.text = sales.getDoctorName();
            txtSaleMnTotQty.text = sales.getTotalQuantity().toString();
            txtSaleMnTotItem.text = sales.getTotalItems().toString();
            txtSaleMnTotDis.text = sales.getTotalDiscount().toString();
            txtSaleMnTotVAT.text = sales.getTotalVAT().toString();
            txtSaleMnNetPaid.text = "{sales.getPaidAmount()}";
            netPaid = "{sales.getPaidAmount()}";
            
            oldBalanceAmt = sales.getBalanceAmount().toString();
            txtSaleMnBal.text = sales.getBalanceAmount().toString();
            txtSaleMnTotAmt.text = sales.getTotalAmount().toString();
            empCode[0] = salesController.getSalesEmpCode(sales.getBillNumber());
            cboEmp_code.select(0);
            if(sales.getBillType().equals("cash_bill") or sales.getBillType().equals("Account")) {
               txtSaleMnNetPaid.text =  txtSaleMnTotAmt.text;
            }
            //txtMaintaRoundof.text = "{sales.getTotalAmount()-(sales.getSumamt()-sales.getTotalDiscount())}";
            updateIntValues("init",sales.getTotalAmount());
        } catch (e: Exception) {
            log.debug("Method:maintainData Error {e.getMessage()}");
        }

        return true;
    }

    function Empty(): Void {

    }

    public function clear() {
        txtSaleMnBillNo.text = "";
        txtSaleMnDateEdit.text = "";
        txtSaleMnCName.text = "";
        txtSaleMnDoctorName.text = "";
        txtSaleMnTotQty.text = "0";
        txtSaleMnTotItem.text = "0";
        txtSaleMnTotDis.text = "0.00";
        txtSaleMnTotVAT.text = "0.00";
        txtSaleMnNetPaid.text = "0.00";
        txtSaleMnBal.text = "0.00";
        txtSaleMnTotAmt.text = "0.00";
        txtSaleMnKeyword.text = "";
        txtSaleMnNetPaid.style = "";
        txtMaintaRoundof.style = "";
        optSearch.select(0);
        cboEmp_code.select(0);
        txtSaleMnDate.text = "";
        delete  panelCardDetails.content;
        SalesMaintainLoadTable.invoice = "";
        SalesMaintainLoadTable.typ = "";
        var now: String = DateUtils.now("yyyy-MM-dd");
        SalesMaintainLoadTable.LoadSalesMaintain(now);
        salesCnt=SalesMaintainLoadTable.salesCount.toString();
        salesTotal="TOTAL AMOUNT : {SalesMaintainLoadTable.salesAmount.toString()}";
    }

    function updateValues(): Void {
        updateIntValues("load",0.00);
    }

    function updateIntValues(type1:String,totalAmt:Double): Void {
        try {
            SalesMaintainEditTable.salesCalculations();
            calcDiscTotal("total",type1,totalAmt);
            if(txtSaleMnNetPaid.text.equals("")) {
                txtSaleMnNetPaid.text = "0.00";
            } else if(txtMaintaRoundof.text.equals("")) {
                txtMaintaRoundof.text = "0.00";
                }            

        } catch (e: Exception) {
            log.debug("Method:updateIntValues Error {e.getMessage()}");        
        }

    }

    function btnSaleMnSearchActionAtShown(): Void {
        fxCalendar.visible = false;
        rdoSearch2.selected = true;
        if (txtSaleMnDate.text != null) {
            var cdate: String = DateUtils.changeFormatDate(sdf.parse(txtSaleMnDate.text));
            var opt: String = "bill_date";
            SalesMaintainLoadTable.LoadSalesMaintain(cdate);
            salesCnt=SalesMaintainLoadTable.salesCount.toString();
            salesTotal="TOTAL AMOUNT : {SalesMaintainLoadTable.salesAmount.toString()}";
        } else {
            txtSaleMnDate.style = mandatoryStyle;
            FXinfo("Please Enter Date to View the Records.", txtSaleMnDate);
        }
    }

    function btnSaleMnSearchOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            if (txtSaleMnDate.text != null) {
                var cdate: String = DateUtils.changeFormatDate(sdf.parse(txtSaleMnDate.text));
                var opt: String = "bill_date";
                SalesMaintainLoadTable.LoadSalesMaintain(opt, cdate);
                salesCnt=SalesMaintainLoadTable.salesCount.toString();
                salesTotal="TOTAL AMOUNT : {SalesMaintainLoadTable.salesAmount.toString()}";
            } else {
                txtSaleMnDate.style = mandatoryStyle;
                FXinfo("Please Enter Date to View the Records.", txtSaleMnDate);
            }
        }
        shortcut(event);
    }

    function txtSaleMnKeywordOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        fxCalendar.visible = false;
        SalesMaintainLoadTable.invoice = "";
        SalesMaintainLoadTable.typ = "";
        if (txtSaleMnKeyword.rawText.length() > 2) {
            var opt: String;
            var cname: String;
            if (optSearch.selectedIndex == 0) {
                opt = "bill_no";
                cname = txtSaleMnKeyword.rawText;
            } else if (optSearch.selectedIndex == 1 and txtSaleMnKeyword.rawText.length()> 9) {
                opt = "cust_name";
                cname = commonController.getQueryValue("select cust_name,cust_code from cust_information where mobile_no = {txtSaleMnKeyword.rawText.trim()}");
            } else if (optSearch.selectedIndex == 2) {
                opt = "cust_name";
                cname = txtSaleMnKeyword.rawText;
            } else if (optSearch.selectedIndex == 3) {
                opt = "cust_name";
                cname = commonController.getName((txtSaleMnKeyword.rawText));
            }
            SalesMaintainLoadTable.LoadSalesMaintain(opt, cname);
            salesCnt=SalesMaintainLoadTable.salesCount.toString();
            salesTotal="TOTAL AMOUNT : {SalesMaintainLoadTable.salesAmount.toString()}";
        }
    }

//    function getCustcode(ccode: String): String {
//        var option: String;
//        var rs: ResultSet = DBConnection.getStatement().executeQuery("select cust_name from cust_information where cust_code = '{ccode}' and cust_flag_id = '0'");
//        while (rs.next()) {
//            option = rs.getString("cust_name");
//        }
//        return option;
//    }

    public function imageDateOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        fxCalendar.visible = true;
        txtSaleMnDate.style = mandatoryStyle;
        if (not dateFlag) {
            if (txtSaleMnDate.text != null) {
                var dat = txtSaleMnDate.rawText.split("-");
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
            txtSaleMnDate.text = fxCalendar.getSelectedDate();
            dateFlag = false;
            SalesMaintainLoadTable.invoice = "";
            SalesMaintainLoadTable.typ = "";
            btnSaleMnSearch.requestFocus();
        }
        else {
            txtSaleMnDateEdit.text = fxCalendar.getSelectedDate();
            dateFlag1 = false;
        }

    }

    function getPrivileges(u: String): Void {
        var uname = u;
        var utype = commonController.getUserType(uname);

        if (utype.equals("User")) {
            var priv = commonController.getPrivileges("sales", uname);
            var ss = priv.split(",");
            var val = Integer.parseInt(ss[4]);
            if (currentState.actual == 1) {
                if (val == 1) {
                    btnSaleMnUpdate.disable = true;
                    btnSaleMnCancelBill.disable = true;
                    btnSaleMnPrint.disable = true;
                } else if (val == 2) {
                    btnSaleMnUpdate.disable = false;
                    btnSaleMnCancelBill.disable = true;
                    btnSaleMnPrint.disable = false;
                } else if (val == 3) {
                    btnSaleMnUpdate.disable = false;
                    btnSaleMnCancelBill.disable = false;
                    btnSaleMnPrint.disable = false;
                }
            }
        } else {
            if (currentState.actual == 1) {
                btnSaleMnUpdate.disable = false;
                btnSaleMnCancelBill.disable = false;
                btnSaleMnPrint.disable = false;
            }
        }
    }

    var logUser: String = bind CommonDeclare.user on replace {
        getPrivileges(logUser);
    //updateValues();
    }
    var changPiv = bind currentState.actual on replace {
        getPrivileges(logUser);
    //updateValues();
    }
    var rdo: Boolean = bind rdoSearch.selected on replace {
        if (rdo) {
            txtSaleMnDate.disable = true;
            btnSaleMnSearch.disable = true;
            imageDate.disable = true;
            optSearch.disable = false;
            txtSaleMnKeyword.disable = false;
            txtSaleMnKeyword.style = mandatoryStyle;
            txtSaleMnDate.style="";
        } else {            
            txtSaleMnDate.disable = false;
            btnSaleMnSearch.disable = false;
            imageDate.disable = false;
            optSearch.disable = true;
            txtSaleMnKeyword.disable = true;
            txtSaleMnKeyword.style = "";
            txtSaleMnDate.style = mandatoryStyle;
        }
    }

    public function StartUp(): Void {

        (table as javax.swing.JTable).addKeyListener(KeyAdapter {
            override public function keyReleased(e: java.awt.event.KeyEvent): Void {
                updateValues();
            }
            override public function keyTyped(e: java.awt.event.KeyEvent): Void {
                updateValues();
            }
        });

 (table as javax.swing.JTable).addMouseListener(MouseAdapter {
            override public function mouseClicked(e: java.awt.event.MouseEvent): Void {
                updateValues();
            }            
        });
        (table1 as javax.swing.JTable).addKeyListener(KeyAdapter {
            override public function keyReleased(e: java.awt.event.KeyEvent): Void {
                updateValues();
            }
            override public function keyTyped(e: java.awt.event.KeyEvent): Void {
                updateValues();
            }
        });
        if(settingsController.getSalesDiscountType()==0) {
            CommonDeclare.salesDiscApply=true;
         }               
        panel.visible = true;
        panelTableLY = 175.0;
        TableH = 310.0;
        panel.content = [rectangle, rectangle2, label, panelTable, rdoSearch, rdoSearch2, panelEditTable, rectTableBorder, panelButton, labelSearch_By, labelSearch_By_Date, label15, label16, lblSaleMnLastMonth, separator, panelSearch, panelDate, separator3, label2, label3, label4, label5, txtSaleMnBillNo, txtSaleMnCName, label6, label7, txtSaleMnDateEdit, txtSaleMnDoctorName, panelLblColumn1, panelTxtColumn1, panelLblColumn2, panelTxtColumn2, panelAmt, imageCustDown, imageDoctorDown, groupRemoveRow, panelCalender, listName, panelAlert, panelCardDetails,cboEmp_code,employee_id,lblSalesCount,lblCount,lblTotalMargin,lblSalesTotal,imgSaleMnDateEdit];
        currentState.actual = currentState.findIndex("Shown");
        SalesLoad.layoutX = 0;
        SalesLoad.layoutY = 0;
        SalesLoadEdit.layoutX = 0;
        SalesLoadEdit.layoutY = 0;
        SalesLoad.visible = true;
        SalesLoadEdit.visible = false;
        txtSaleMnKeyword.style = mandatoryStyle;
        imageDate.image = Image { url: "{__DIR__}images/Calender.png" };
        fxCalendar.visible = false;
        panelTable.content = [SalesLoad];
        panelEditTable.content = [SalesLoadEdit];
        panelCalender.content = [fxCalendar,];
        rdoSearch.selected=true;
        clear();        
        getPrivileges(logUser);
        updateValues();
        txtSaleMnKeyword.requestFocus();
    }

}
