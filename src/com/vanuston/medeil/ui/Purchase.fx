package com.vanuston.medeil.ui;

import java.awt.Dimension;
import javafx.ext.swing.SwingComponent;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import javafx.scene.input.KeyCode;
import javafx.scene.image.Image;
import javafx.scene.control.TextBox;
//import javafx.scene.input.KeyEvent;
import javafx.scene.input.MouseEvent;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import com.vanuston.medeil.ui.calendar.theme.GrayTheme;
import com.vanuston.medeil.util.Value;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.uitables.PurchaseTable;
import com.vanuston.medeil.uitables.PurchaseEditTable;
import com.vanuston.medeil.uitables.PurcRtAdjTable;
import com.vanuston.medeil.util.KeyRegistry;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.model.PurchaseModel;
import com.vanuston.medeil.model.MsgReturnModel;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.uitables.ConfirmDialogBox;
import com.vanuston.medeil.uitables.ConfirmDialogBox1;
import java.lang.Exception;
import java.util.List;
import java.util.ArrayList;
import javafx.stage.Alert;
import java.util.regex.Pattern;
import java.util.regex.Matcher;
import java.awt.event.MouseAdapter;

public class Purchase {

    var log: Logger = Logger.getLogger(Purchase.class, "Inventory");
    var dutils = new DateUtils();
    var value = new Value();
    var PurchaseType: String[] = ["---Select---", "Cash", "Credit"];
    var invExist = false;
    var checkUpdate = 0;
    var DistInfo: DistributorInformation;
    var newDist: Integer = 0;
    var purcBillDate = dutils.now("dd-MM-yyyy");
    var dateFlag: Boolean = false;
    var fxCalendar = FXCalendar {
                theme: GrayTheme {};
            };
    public var rndVal: String = "0.00";
    var netAmt: Double = 0.0 ;
    var tit: String = "";
    var roundVal:Double = 0.0;
    var selStrInv:String="";
    var oldInvoiceNumber:String="";
    def ChangeInvoice=ChangeInvoice{};
    
    var changeInvoiceNumber= bind ChangeInvoice.panel.visible on replace
    {
        panel.disable = changeInvoiceNumber;
        panelChangeInvoice.visible = changeInvoiceNumber;        
    }

    var insertnewInvoice=bind ChangeInvoice.btnClick on replace {
        if(insertnewInvoice.equals("save") and ChangeInvoice.save==true) {
            updateNewInvoiceNumber();
            txtPurcInvoiceNo.text = ChangeInvoice.NewInvoice;
            selStrInv = ChangeInvoice.NewInvoice;            
        }        
    }

    function updateNewInvoiceNumber():Integer {
        oldInvoiceNumber=commonCont.getQueryValue("select invoice_no from purchase_invoice where purchase_bill_no='{txtPurcBillNo.text}'");
        commonCont.queryExecution("update purchase_invoice pi set pi.invoice_no='{ChangeInvoice.NewInvoice}' where pi.invoice_no='{oldInvoiceNumber}'");
        var insertInvoice:Integer=commonCont.queryExecution("update purchase_maintenance pi set pi.invoice_no='{ChangeInvoice.NewInvoice}' where pi.invoice_no='{oldInvoiceNumber}'");
        return insertInvoice;
    }

   
    function getDecimalValid(hName: String, i: Integer, j: Integer): Integer {
        var cnt = 0;
        var p: Pattern = Pattern.compile("^[0-9.+-]+$");
        if (hName != null and hName.trim().length() > 0) {
            var m: Matcher = p.matcher(hName);
            var matchFound: Boolean = m.matches();
            if (matchFound) {
                cnt = 10;
            }
        }        
        return cnt;
    }
    
    function txtPurcRoundAmtOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
       txtPurcRoundAmt.style = "";  
         var rVal = txtPurcRoundAmt.rawText.trim();
         var rd: Integer = 0; rd = getDecimalValid(rVal, 1, 5);
         if (rd == 0) {
             txtPurcRoundAmt.clear(); FXinfo("Please Enter Only Decimal Values.");  txtPurcRoundAmt.requestFocus();
        } else if(event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_ENTER) {
             if(rVal != null and rVal != "") {
                if((rVal.startsWith("-") or rVal.startsWith("+")) and rVal.length()<2) {
                    FXinfo("Please Enter valid Rounded Values."); txtPurcRoundAmt.requestFocus(); txtPurcRoundAmt.text = "";
                } else if((Double.parseDouble(rVal) < -9 or Double.parseDouble(rVal) > 9) ) {
                    FXinfo("Please Enter valid Rounded Values."); txtPurcRoundAmt.requestFocus(); txtPurcRoundAmt.text = "";
                } else if (rd == 10) {
                    if (txtPurcRoundAmt.rawText.trim() != null) {
                        txtPurcRoundAmt.text =  value.Round("{Double.parseDouble(txtPurcRoundAmt.rawText.trim())}");
                            updateIntValues();
                    } else {
                        txtPurcRoundAmt.text="";
                        updateIntValues();
                    }
                }

            }

        }
        shortcut(event);
     }
     
    var cntTempStks: Integer;
    var isTempStk: Boolean;
    var pAdjType = 0;
    var pAdjFlag = 0;
    var commonCont: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    var getAutoVal = commonCont.getAutoIncrement(purcBillDate, "Purchase");
    var tableSave : PurchaseTable = new PurchaseTable();
    var jCompSave  = tableSave.createTable();
    var swingCompSaveTbl = SwingComponent.wrap(tableSave.getScrollTable(jCompSave));
    var tableEdit : PurchaseEditTable =  new PurchaseEditTable();
        

    var jCompEdit = tableEdit.createTable();
    var swingCompEditTbl = SwingComponent.wrap(tableEdit.getScrollTable(jCompEdit));
    var tablePRAdj = PurcRtAdjTable.createTable();
    var PurchaseTablePRAdj = SwingComponent.wrap(PurcRtAdjTable.getScrollTable(tablePRAdj));
    var listW = 0.0;
    var listH = 0.0;
    var listLX = 0.0;
    var listLY = 0.0;
    var listW1 = 0.0;
    var listH1 = 0.0;
    var listLX1 = 0.0;
    var listLY1 = 0.0;
    var panelW = bind CommonDeclare.panelFormW;
    var panelH = bind CommonDeclare.panelFormH;
    var one = bind CommonDeclare.one;
    var two = bind CommonDeclare.two;
    var five = bind CommonDeclare.five;
    var ten = bind CommonDeclare.ten;
    var hundred = bind CommonDeclare.hundred;
    var twoHund = bind CommonDeclare.twoHund;
    var eighty = bind (8 * ten);
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var C1LX = bind CommonDeclare.Column1LX - ten;
    var C2LX = bind CommonDeclare.Column2LX;
    var C3LX = bind CommonDeclare.Column3LX;
    var C4LX = bind CommonDeclare.Column4LX + (five * ten);
    var BotC6LX = bind (70.13977128 * panelW) / 100;
    var BotC5LX = bind (51.46124524 * panelW) / 100;
    var BotC4LX = bind (35.57814485 * panelW) / 100 + ten;
    var BotC3LX = bind (25.41296061 * panelW) / 100 + ten;
    var BotC2LX = bind (16.5184 * panelW) / 100;
    var BotTotW = bind (31.76620076 * panelW) / 100;
    var botton1LX = bind CommonDeclare.botton1LX;
    var botton2LX = bind CommonDeclare.botton2LX;
    var botton3LX = bind CommonDeclare.botton3LX;
    var botton4LX = bind CommonDeclare.botton4LX;
    var panelBottomC1LX = 20.0;
    var panelBottomC2LX = bind panelBottomC1LX + Type4TextboxW + 85;
    var panelBottomC3LX = bind panelBottomC2LX + Type4TextboxW + 85;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    var buttonW = bind CommonDeclare.bottonW;
    var extra = 0.0;
    var buttonH = bind CommonDeclare.bottonH;
    var rectbtnLX = bind (81.1944 * panelW) / 100;
    var rectbtnLblLX = bind CommonDeclare.rectbutton2LX;
    var rectbuttonLY = bind CommonDeclare.rectbuttonLY;
    var seperatorW = bind CommonDeclare.seperatorW;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;
    var Type4TextboxW = bind CommonDeclare.Type4TextboxW + 30;
    var ImageCalenderLX = bind C2LX + Type3TextboxW;
    var panelCalenderLX = bind ImageCalenderLX + 5.0;
    var imgClickDown1LX = bind C4LX + Type2TextboxW - 20.0;
    var imgClickDown2LX = bind (C2LX + txtPurcInvoiceNo.width);
    var TableH = 190.0;
    var TableW = bind (93.39263024 * panelW) / 100 on replace {
        changeTableSize(TableW);
    };
    var RemoveRowLX = bind ((panelW + TableW) / 2) - 120;
    var RemoveRowLY = 370.0;
    var panelPRAdjLX = bind (panelW - 700.0) / 2;
    var panelPRAdjLY = bind (panelH - 350) / 2;
    var AmtPanelLX = bind Type4TextboxW + 85.0 + panelBottomC3LX;
    var AmtTextW = bind 43.66073698 * panelW / 100;
    var PRAmtLX = bind panelTableLX + TableW - AmtTextW;
    var panelTableLX = bind (panelW - TableW) / 2;
    var panelTableLY = 175.0;        
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    var CustomAlert = CustomAlert {};

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Purchase Invoice", type);
        showAlertbox();
    }   

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function showPRAdjAlertbox(): Void {
        delete panelPRAdjAlert.content;
        insert panelAlert.content into panelPRAdjAlert.content;
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Purchase Invoice", msg);
        showAlertbox();
    }

    function FXinfo(msg: String, i: Integer): Void {
        CustomAlert.ShowInfo("Purchase Invoice - Adjustment on Purchase Return", msg);
        showPRAdjAlertbox();
    }

    var mandatory = CommonDeclare.textbox_mandatory();
    var error = CommonDeclare.textbox_error();

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Purchase Invoice", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = error;
    }

    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def rectangle2: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: 397.5
        layoutY: 0.0
        styleClass: "rectFormHeader"
        width: bind panelW
        height: 575.0
    }
    
    public-read def txtPurcTINNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
    }
    
    public-read def imgEdit: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imgSave: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
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
    
    public-read def imgPrePurcImage: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C2LX+Type2TextboxW+12
        layoutY: 234.0
    }
    
    public-read def lblTotMargin: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX+100
        text: "Label"
    }
    
    def __layoutInfo_txtTotMargin: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtTotMargin: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C4LX+5
        layoutInfo: __layoutInfo_txtTotMargin
    }
    
    public-read def lblBarcode: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX
        text: "Label"
    }
    
    def __layoutInfo_txtBarcode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtBarcode: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C4LX
        layoutInfo: __layoutInfo_txtBarcode
    }
    
    def __layoutInfo_cboPurcType: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def cboPurcType: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: bind C2LX
        layoutY: 104.0
        layoutInfo: __layoutInfo_cboPurcType
        items: bind PurchaseType
    }
    
    public-read def imgInvoiceNo: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: true
        layoutX: bind imgClickDown2LX+20
        layoutY: 82.5
    }
    
    def __layoutInfo_txtPurcDLNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtPurcDLNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 104.0
        layoutInfo: __layoutInfo_txtPurcDLNo
    }
    
    def __layoutInfo_listView: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 716.0
        height: 202.0
    }
    public-read def listView: javafx.scene.control.ListView = javafx.scene.control.ListView {
        layoutX: 44.0
        layoutY: 172.0
        layoutInfo: __layoutInfo_listView
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    def __layoutInfo_panelTable: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind TableW
        height: bind TableH+30
    }
    public-read def panelTable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelTableLX
        layoutY: bind panelTableLY+10
        layoutInfo: __layoutInfo_panelTable
    }
    
    def __layoutInfo_rectTableBorder: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: bind TableH+30
    }
    public-read def rectTableBorder: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind panelTableLX
        layoutY: bind panelTableLY+10
        layoutInfo: __layoutInfo_rectTableBorder
        styleClass: "rectTableBorder"
        width: bind TableW
        height: bind TableH
    }
    
    def __layoutInfo_txtPurcBillNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtPurcBillNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: true
        layoutX: bind C2LX+35
        layoutY: 60.0
        layoutInfo: __layoutInfo_txtPurcBillNo
        styleClass: "Borderless-text-box"
        text: bind getAutoVal
        editable: false
    }
    
    public-read def lbl_prepo: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX
        layoutY: 141.0
        text: "Label"
    }
    
    def __layoutInfo_PurcDatePicker: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: bind txtPurcDate.height
    }
    public-read def PurcDatePicker: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind ImageCalenderLX+13
        layoutY: 60.0
        layoutInfo: __layoutInfo_PurcDatePicker
    }
    
    public-read def PurcCalendarPanel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelCalenderLX
        layoutY: 82.0
    }
    
    def __layoutInfo_listPurchase: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listPurchase: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind listLX
        layoutY: bind listLY
        layoutInfo: __layoutInfo_listPurchase
        items: null
    }
    
    public-read def imgSupplierName: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind imgClickDown1LX
        layoutY: 61.0
    }
    
    def __layoutInfo_txtPurcTotItems: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtPurcTotItems: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 398.0
        layoutInfo: __layoutInfo_txtPurcTotItems
        editable: false
    }
    
    def __layoutInfo_txtPurcTotalQty: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtPurcTotalQty: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 421.0
        layoutInfo: __layoutInfo_txtPurcTotalQty
        editable: false
    }
    
    def __layoutInfo_txtPurcFree: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtPurcFree: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 444.0
        layoutInfo: __layoutInfo_txtPurcFree
        editable: false
    }
    
    public-read def labelRound_Off: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 49.0
        layoutY: 460.0
        text: "Label"
    }
    
    def __layoutInfo_txtPurcSubTotal: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtPurcSubTotal: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 398.0
        layoutInfo: __layoutInfo_txtPurcSubTotal
        promptText: "0.00"
        editable: false
    }
    
    def __layoutInfo_txtPurcRoundAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtPurcRoundAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 122.0
        layoutY: 450.0
        layoutInfo: __layoutInfo_txtPurcRoundAmt
    }
    
    public-read def labelPRno: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def labelActual_Invoice_Amt_: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def labelAdjust_Amt: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    def __layoutInfo_txtPurcPRAdjNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW+20
    }
    public-read def txtPurcPRAdjNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtPurcPRAdjNo
    }
    
    def __layoutInfo_txtPurcActualAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW+20
    }
    public-read def txtPurcActualAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtPurcActualAmt
    }
    
    def __layoutInfo_txtPurcPRAdjAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW+20
    }
    public-read def txtPurcPRAdjAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutInfo: __layoutInfo_txtPurcPRAdjAmt
    }
    
    public-read def panelBottomC3: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelBottomC3LX+65
        content: [ labelPRno, labelActual_Invoice_Amt_, labelAdjust_Amt, txtPurcPRAdjNo, txtPurcActualAmt, txtPurcPRAdjAmt, ]
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
    }
    
    def __layoutInfo_listSupplier: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listSupplier: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind listLX
        layoutY: bind listLY
        layoutInfo: __layoutInfo_listSupplier
        items: null
    }
    
    def __layoutInfo_listPrePurchase: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listPrePurchase: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind listLX
        layoutY: bind listLY-5
        layoutInfo: __layoutInfo_listPrePurchase
        items: null
    }
    
    def __layoutInfo_listPrePO: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW1
        height: bind listH1
    }
    public-read def listPrePO: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind listLX1
        layoutY: bind listLY1
        layoutInfo: __layoutInfo_listPrePO
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    def __layoutInfo_btnChangeInvoice: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnChangeInvoice: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind C1LX
        layoutY: 61.0
        layoutInfo: __layoutInfo_btnChangeInvoice
        text: "Button"
    }
    
    public-read def rectangle3: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        width: 100.0
        height: 50.0
    }
    
    public-read def rectangle4: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        width: 700.0
        height: 50.0
    }
    
    public-read def label24: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 6.0
        layoutY: 6.0
        text: "Label"
    }
    
    def __layoutInfo_listPRAdjNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def listPRAdjNo: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutInfo: __layoutInfo_listPRAdjNo
    }
    
    def __layoutInfo_listPRAdjAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def listPRAdjAmt: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: 162.0
        layoutY: 50.0
        layoutInfo: __layoutInfo_listPRAdjAmt
    }
    
    public-read def label25: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 234.0
        layoutY: 15.0
        text: "Label"
    }
    
    public-read def radPRAdjType1: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: 386.0
        layoutY: 50.0
        text: "Radio Button"
    }
    
    public-read def radPRAdjType2: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: 344.0
        layoutY: 147.0
        text: "Radio Button"
    }
    
    public-read def radPRAdjType3: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: false
        layoutX: 362.0
        layoutY: 119.0
        onMouseClicked: radPRAdjType3OnMouseClickedAtShown
        text: "Radio Button"
    }
    
    def __layoutInfo_listCell: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def listCell: javafx.scene.control.ListCell = javafx.scene.control.ListCell {
        visible: false
        layoutX: 6.0
        layoutY: 50.0
        layoutInfo: __layoutInfo_listCell
    }
    
    public-read def label26: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 28.0
        layoutY: 51.0
        text: "Label"
    }
    
    public-read def label27: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 194.0
        layoutY: 51.0
        text: "Label"
    }
    
    def __layoutInfo_label28: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def label28: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 236.0
        layoutY: 6.0
        layoutInfo: __layoutInfo_label28
        text: bind tit
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 260.0
        layoutY: 313.0
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnPRAdjApply: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind buttonW
        height: bind buttonH
    }
    public-read def btnPRAdjApply: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 344.0
        layoutY: 319.0
        layoutInfo: __layoutInfo_btnPRAdjApply
        graphic: imageView
        text: "Button"
        action: btnPRAdjApplyAction
    }
    
    public-read def imageView2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnPRAdjCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind buttonW
        height: bind buttonH
    }
    public-read def btnPRAdjCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: 480.0
        layoutY: 319.0
        layoutInfo: __layoutInfo_btnPRAdjCancel
        graphic: imageView2
        text: "Button"
    }
    
    public-read def panelPRAdjAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
    }
    
    public-read def rectangle5: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        width: bind panelW
        height: bind panelH
    }
    
    public-read def rectangle6: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        opacity: 0.25
        width: bind panelW
        height: 50.0
    }
    
    def __layoutInfo_label31: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
    }
    public-read def label31: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutInfo: __layoutInfo_label31
        text: "Label"
    }
    
    def __layoutInfo_label29: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def label29: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX
        layoutInfo: __layoutInfo_label29
        text: "Label"
    }
    
    def __layoutInfo_txtPRAdjDiffNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtPRAdjDiffNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C1LX+120
        layoutY: 60.0
        layoutInfo: __layoutInfo_txtPRAdjDiffNo
    }
    
    public-read def rectTableBorder2: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind two * ten
        styleClass: "rectTableBorder"
        width: bind TableW
        height: 50.0
    }
    
    def __layoutInfo_label30: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def label30: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX
        layoutInfo: __layoutInfo_label30
        text: "Label"
    }
    
    def __layoutInfo_txtPRAdjDiffAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtPRAdjDiffAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C3LX+180
        layoutY: 60.0
        layoutInfo: __layoutInfo_txtPRAdjDiffAmt
    }
    
    public-read def panelPRATable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind two * ten
    }
    
    public-read def imageInsert: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnPRAInsert: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind buttonW
        height: bind buttonH
    }
    public-read def btnPRAInsert: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton2LX
        layoutY: bind panelButtonsLY
        layoutInfo: __layoutInfo_btnPRAInsert
        graphic: imageInsert
        text: "Button"
    }
    
    public-read def imgClear: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnPRAClear: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind buttonW
        height: bind buttonH
    }
    public-read def btnPRAClear: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton3LX
        layoutY: bind panelButtonsLY
        layoutInfo: __layoutInfo_btnPRAClear
        graphic: imgClear
        text: "Button"
    }
    
    public-read def imgClose: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind panelW -25
    }
    
    def __layoutInfo_txtPRAdjTot: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind AmtTextW
    }
    public-read def txtPRAdjTot: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind PRAmtLX
        layoutInfo: __layoutInfo_txtPRAdjTot
    }
    
    def __layoutInfo_label32: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def label32: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind PRAmtLX-120.0
        layoutInfo: __layoutInfo_label32
        text: "Label"
    }
    
    public-read def panelAdjDiff: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ rectangle5, rectangle6, label31, label29, txtPRAdjDiffNo, rectTableBorder2, label30, txtPRAdjDiffAmt, panelPRATable, btnPRAInsert, btnPRAClear, imgClose, txtPRAdjTot, label32, ]
    }
    
    public-read def rectangle7: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        styleClass: "form-background"
        width: bind panelW
        height: bind panelH
    }
    
    public-read def rectBack: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind C4LX
        layoutY: bind panelButtonsLY
        styleClass: "rectbutton"
        width: 100.0
        height: 25.0
    }
    
    def __layoutInfo_lblBackDist: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        height: 25.0
    }
    public-read def lblBackDist: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C4LX
        layoutY: bind panelButtonsLY
        layoutInfo: __layoutInfo_lblBackDist
        text: "Label"
    }
    
    public-read def imageDistSave: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnSaveDist: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind buttonW
        height: bind buttonH
    }
    public-read def btnSaveDist: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton2LX
        layoutY: bind panelButtonsLY
        layoutInfo: __layoutInfo_btnSaveDist
        graphic: imageDistSave
        text: "Save [F3]"
    }
    
    public-read def imageDistReset: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnResetDist: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind buttonW
        height: bind buttonH
    }
    public-read def btnResetDist: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind botton3LX
        layoutY: bind panelButtonsLY
        layoutInfo: __layoutInfo_btnResetDist
        graphic: imageDistReset
        text: "Reset [F4]"
    }
    
    def __layoutInfo_panelDistinfo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
        height: bind panelH
    }
    public-read def panelDistinfo: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: 0.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_panelDistinfo
        content: [ rectangle7, rectBack, lblBackDist, btnSaveDist, btnResetDist, ]
    }
    
    def __layoutInfo_panelChangeInvoice: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
        height: bind panelH
    }
    public-read def panelChangeInvoice: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
        layoutInfo: __layoutInfo_panelChangeInvoice
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
    
    public-read def Arial_11: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
        size: 11.0
    }
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
        size: 12.0
    }
    
    def __layoutInfo_txtPurcSchDiscount: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtPurcSchDiscount: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 444.0
        layoutInfo: __layoutInfo_txtPurcSchDiscount
        font: Arial_12
    }
    
    def __layoutInfo_txtPurcDiscount: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtPurcDiscount: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        managed: true
        layoutY: 421.0
        layoutInfo: __layoutInfo_txtPurcDiscount
        promptText: "0.00"
        editable: false
        font: Arial_12
    }
    
    public-read def labelDiscount: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 421.0
        text: "Discount  "
        font: Arial_12
    }
    
    public-read def Sch_Discount: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 444.0
        text: "Sch Discount"
        font: Arial_12
    }
    
    public-read def labelSub_Total: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 398.0
        text: "Sub Total "
        font: Arial_12
    }
    
    public-read def panelBottomC2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelBottomC2LX+30
        content: [ labelSub_Total, labelRound_Off, Sch_Discount, labelDiscount, txtPurcSubTotal, txtPurcRoundAmt, txtPurcDiscount, txtPurcSchDiscount, ]
    }
    
    def __layoutInfo_txtMiscCost: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtMiscCost: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 490.0
        layoutInfo: __layoutInfo_txtMiscCost
        promptText: "0.00"
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtPurcVAT4: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtPurcVAT4: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 467.0
        layoutInfo: __layoutInfo_txtPurcVAT4
        promptText: "0.00"
        editable: false
        font: Arial_12
    }
    
    public-read def labelMiscCost: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 490.0
        text: "VAT 12.5%"
        font: Arial_12
    }
    
    public-read def labelVAT_4: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 467.0
        text: "VAT 4%"
        font: Arial_12
    }
    
    def __layoutInfo_txtprepo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW-20.5
    }
    public-read def txtprepo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX+35
        layoutY: 141.0
        layoutInfo: __layoutInfo_txtprepo
        font: Arial_12
    }
    
    def __layoutInfo_txtPurcAddress: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtPurcAddress: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 148.0
        layoutInfo: __layoutInfo_txtPurcAddress
        font: Arial_12
    }
    
    def __layoutInfo_txtPurcInvoiceNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW - extra
        hfill: false
    }
    public-read def txtPurcInvoiceNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX+35
        layoutY: 82.0
        layoutInfo: __layoutInfo_txtPurcInvoiceNo
        style: ""
        styleClass: "text-box"
        effect: null
        text: ""
        font: Arial_12
    }
    
    def __layoutInfo_txtActualAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtActualAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 126.0
        layoutInfo: __layoutInfo_txtActualAmt
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtPurcCode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtPurcCode: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 82.0
        layoutInfo: __layoutInfo_txtPurcCode
        font: Arial_12
    }
    
    def __layoutInfo_txtPrePurcInvoice: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW-20.5
    }
    public-read def txtPrePurcInvoice: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX+35
        layoutY: 148.0
        layoutInfo: __layoutInfo_txtPrePurcInvoice
        font: Arial_12
    }
    
    def __layoutInfo_txtPurcParcelNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtPurcParcelNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX+35
        layoutY: 126.0
        layoutInfo: __layoutInfo_txtPurcParcelNo
        font: Arial_12
    }
    
    def __layoutInfo_txtPurcSupplierName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW - 20.0
    }
    public-read def txtPurcSupplierName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 60.0
        layoutInfo: __layoutInfo_txtPurcSupplierName
        font: Arial_12
    }
    
    def __layoutInfo_txtPurcDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtPurcDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX+35
        layoutY: 60.0
        layoutInfo: __layoutInfo_txtPurcDate
        text: bind purcBillDate
        promptText: "dd - mm - yyyy"
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
    
    def __layoutInfo_txtPurcBalance: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
        height: 28.0
    }
    public-read def txtPurcBalance: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 591.0
        layoutInfo: __layoutInfo_txtPurcBalance
        promptText: "0.00"
        editable: false
        font: Arial_20
    }
    
    def __layoutInfo_txtPurcNetPaid: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
        height: 28.0
    }
    public-read def txtPurcNetPaid: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 596.0
        layoutInfo: __layoutInfo_txtPurcNetPaid
        promptText: "0.00"
        font: Arial_20
    }
    
    public-read def Arial_Bold_20: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 20.0
    }
    
    public-read def reflectionEffect: javafx.scene.effect.Reflection = javafx.scene.effect.Reflection {
    }
    
    def __layoutInfo_btnPurcCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind buttonW+extra
        height: bind buttonH
    }
    public-read def btnPurcCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton4LX+50
        layoutInfo: __layoutInfo_btnPurcCancel
        onKeyPressed: btnPurcCancelOnKeyPressed
        effect: reflectionEffect
        graphic: imgCancel
        text: "Cancel [F8]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnPurcReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind buttonW
        height: bind buttonH
    }
    public-read def btnPurcReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton3LX+100
        layoutInfo: __layoutInfo_btnPurcReset
        onKeyPressed: btnPurcResetOnKeyPressed
        effect: reflectionEffect
        graphic: imgReset
        text: "Reset [F4]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnPurcSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind buttonW
        height: bind buttonH
    }
    public-read def btnPurcSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX+150
        layoutInfo: __layoutInfo_btnPurcSave
        translateX: 0.0
        effect: reflectionEffect
        graphic: imgSave
        text: "Save  [F3]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnPurcEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind buttonW
        height: bind buttonH
    }
    public-read def btnPurcEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton2LX+130
        layoutInfo: __layoutInfo_btnPurcEdit
        effect: reflectionEffect
        graphic: imgEdit
        text: "Edit [F6]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    public-read def panelButtons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: bind panelButtonsLY
        content: [ btnPurcEdit, btnPurcSave, btnPurcReset, btnPurcCancel, ]
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
    
    public-read def labelAmount: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 597.0
        text: "Total "
        font: Arial_16
        textFill: DarkGray
    }
    
    public-read def labelBalance: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 591.0
        text: "Balance "
        font: Arial_16
        textFill: DarkGray
    }
    
    public-read def panelBottomC5: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind AmtPanelLX+Type4TextboxW+140
        content: [ labelBalance, txtPurcBalance, ]
    }
    
    public-read def labelNet_Paid: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 597.0
        text: "Net Paid"
        font: Arial_16
        textFill: DarkGray
    }
    
    public-read def panelBottomC4: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind AmtPanelLX+70
        content: [ labelNet_Paid, txtPurcNetPaid, ]
    }
    
    public-read def labelFree_Qty: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 444.0
        text: "Free Quantity"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelQuantity: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 421.0
        text: "Total Quantity"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelProducts: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 398.0
        text: "Total Products"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def panelBottomC1: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelBottomC1LX
        content: [ labelProducts, labelQuantity, labelFree_Qty, labelVAT_4, labelMiscCost, txtPurcTotItems, txtPurcTotalQty, txtPurcFree, txtPurcVAT4, txtMiscCost, ]
    }
    
    def __layoutInfo_labelRemoveRow: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 120.0
    }
    public-read def labelRemoveRow: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 374.0
        layoutInfo: __layoutInfo_labelRemoveRow
        text: "RemoveRow [F12]"
        font: Arial_Bold_12
        textFill: DarkGray
    }
    
    public-read def labelBillAmt: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 148.0
        text: "Actual Amount"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelDate: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 60.0
        text: "Date"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelAddress: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 148.0
        text: "Address"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def lblprepurcInv: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 148.0
        text: "Parcel Details"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelCode: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 60.0
        text: "Distributor Code"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelGRNNo: javafx.scene.control.Label = javafx.scene.control.Label {
        opacity: 1.0
        layoutX: bind C1LX
        layoutY: 104.0
        text: "PaymentType"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelDLNo: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 104.0
        text: "D.L. No"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelParcelNo: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 126.0
        text: "Parcel No"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelDistributorName: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 82.0
        text: "Distributor Name"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelInvoiceNo: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 82.0
        styleClass: "label"
        text: "Invoice No"
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
    
    def __layoutInfo_labelPurchase: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
    }
    public-read def labelPurchase: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 668.0
        layoutY: 25.0
        layoutInfo: __layoutInfo_labelPurchase
        effect: lightingEffect
        text: "Purchase"
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
    
    def __layoutInfo_txtPurcTotal: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind AmtTextW
        height: 36.0
    }
    public-read def txtPurcTotal: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 344.0
        layoutInfo: __layoutInfo_txtPurcTotal
        styleClass: "Borderless-text-box"
        promptText: "0.00"
        editable: false
        font: Arial_30
    }
    
    public-read def panelAmt: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind AmtPanelLX+200
        content: [ labelAmount, txtPurcTotal, ]
    }
    
    public-read def Yellow: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.95
        green: 0.94
        blue: 0.86
    }
    
    public-read def rectRemoveRow: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        layoutY: 374.0
        fill: Yellow
        stroke: DarkGray
        strokeWidth: 2.0
        width: 120.0
        height: 20.0
        arcWidth: 10.0
        arcHeight: 10.0
    }
    
    public-read def groupRemoveRow: javafx.scene.Group = javafx.scene.Group {
        visible: false
        layoutX: bind RemoveRowLX
        layoutY: bind RemoveRowLY+5
        content: [ rectRemoveRow, labelRemoveRow, ]
    }
    
    public-read def imageEdit: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Edit.png"
    }
    
    public-read def imageSave: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Save1.png"
    }
    
    public-read def imageReset: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Reset.png"
    }
    
    public-read def imageCancel: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Cancel.png"
    }
    
    public-read def Arial_65: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 50.0
    }
    
    public-read def Header: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
    }
    
    public-read def toggleGroup2: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Close.png"
    }
    
    public-read def imageClose: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: 651.0
        layoutY: 0.0
        onMouseClicked: imageCloseOnMouseClicked
        image: image
    }
    
    public-read def panelPRAdjust: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutX: bind panelPRAdjLX
        layoutY: bind panelPRAdjLY
        content: [ rectangle3, rectangle4, label24, listPRAdjNo, listPRAdjAmt, label25, radPRAdjType1, radPRAdjType2, radPRAdjType3, listCell, label26, label27, label28, imageClose, btnPRAdjApply, btnPRAdjCancel, panelPRAdjAlert, ]
    }
    
    public-read def imageApply: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Apply.png"
    }
    
    public-read def imageClickDown: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imageback: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/arrow_Left.png"
    }
    
    public-read def imageClickDown2: javafx.scene.image.Image = javafx.scene.image.Image {
    }
    
    public-read def image2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imgprepo: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C2LX+Type2TextboxW+12
        layoutY: 119.0
        image: image2
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ rectangle, rectangle2, labelPurchase, txtPurcTINNo, labelInvoiceNo, labelDistributorName, labelParcelNo, labelDLNo, labelGRNNo, labelCode, lblprepurcInv, labelAddress, panelButtons, txtPurcDate, labelDate, txtPurcSupplierName, txtPurcParcelNo, txtPrePurcInvoice, imgPrePurcImage, txtPurcCode, labelBillAmt, lblTotMargin, txtActualAmt, txtTotMargin, lblBarcode, txtBarcode, cboPurcType, txtPurcInvoiceNo, imgInvoiceNo, txtPurcAddress, txtPurcDLNo, listView, panelTable, rectTableBorder, txtPurcBillNo, lbl_prepo, txtprepo, imgprepo, groupRemoveRow, PurcDatePicker, PurcCalendarPanel, listPurchase, imgSupplierName, panelBottomC1, panelBottomC2, panelBottomC3, panelBottomC4, panelBottomC5, panelAmt, panelAlert, listSupplier, listPrePurchase, listPrePO, btnChangeInvoice, ]
    }
    
    public-read def mainPanel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ panel, panelPRAdjust, panelAdjDiff, panelDistinfo, panelChangeInvoice, ]
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "Shown", "DistInfo", ]
        actual: 0
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectangle.visible = true;
                            rectangle.stroke = DarkGray;
                            rectangle.arcWidth = 5.0;
                            rectangle.arcHeight = 5.0;
                            rectangle2.visible = true;
                            rectangle2.opacity = 0.25;
                            rectangle2.layoutX = 0.0;
                            rectangle2.fill = Header;
                            rectangle2.stroke = null;
                            rectangle2.height = 32.0;
                            rectangle2.arcWidth = 5.0;
                            rectangle2.arcHeight = 5.0;
                            labelPurchase.layoutX = 0.0;
                            labelPurchase.layoutY = 1.0;
                            labelPurchase.styleClass = "labelFormHeading";
                            labelPurchase.effect = null;
                            labelPurchase.text = "Purchase Invoice - ctrl+I";
                            labelPurchase.hpos = javafx.geometry.HPos.CENTER;
                            txtPurcTINNo.visible = false;
                            labelInvoiceNo.layoutY = 86.0;
                            labelInvoiceNo.text = "Invoice No.";
                            labelInvoiceNo.font = Arial_16;
                            labelDistributorName.layoutY = 40.0;
                            labelDistributorName.text = "Distributor Name";
                            labelDistributorName.font = Arial_16;
                            labelParcelNo.layoutY = 108.0;
                            labelParcelNo.text = "Parcel No.";
                            labelParcelNo.font = Arial_16;
                            labelDLNo.layoutY = 84.0;
                            labelDLNo.text = "D.L. No.";
                            labelDLNo.font = Arial_16;
                            labelGRNNo.visible = true;
                            labelGRNNo.layoutY = 40.0;
                            labelGRNNo.text = "GRN No";
                            labelGRNNo.font = Arial_16;
                            labelCode.layoutY = 62.0;
                            labelCode.text = "Distributor Code";
                            labelCode.font = Arial_16;
                            lblprepurcInv.layoutY = 132.0;
                            lblprepurcInv.text = "Previous Purchase Items";
                            lblprepurcInv.font = Arial_16;
                            labelAddress.layoutY = 106.0;
                            labelAddress.font = Arial_16;
                            imgEdit.visible = true;
                            imgEdit.image = imageEdit;
                            btnPurcEdit.onKeyPressed = btnPurcEditOnKeyPressedAtShown;
                            btnPurcEdit.onKeyReleased = btnPurcEditOnKeyReleasedAtShown;
                            btnPurcEdit.text = "Edit [F6]";
                            btnPurcEdit.font = Arial_Bold_16;
                            btnPurcEdit.action = btnPurcEditActionAtShown;
                            imgSave.visible = true;
                            imgSave.image = imageSave;
                            btnPurcSave.onKeyPressed = btnPurcSaveOnKeyPressedAtShown;
                            btnPurcSave.font = Arial_Bold_16;
                            btnPurcSave.action = btnPurcSaveActionAtShown;
                            imgReset.visible = true;
                            imgReset.image = imageReset;
                            btnPurcReset.text = "Reset [F4]";
                            btnPurcReset.font = Arial_Bold_16;
                            btnPurcReset.action = btnPurcResetActionAtShown;
                            imgCancel.visible = true;
                            imgCancel.image = imageCancel;
                            btnPurcCancel.text = "Cancel [F8]";
                            btnPurcCancel.font = Arial_Bold_16;
                            btnPurcCancel.action = btnPurcCancelActionAtShown;
                            panelButtons.visible = true;
                            txtPurcDate.layoutY = 62.0;
                            txtPurcDate.onKeyPressed = txtPurcDateOnKeyPressedAtShown;
                            txtPurcDate.font = Arial_16;
                            labelDate.layoutY = 62.0;
                            labelDate.font = Arial_16;
                            txtPurcSupplierName.layoutY = 40.0;
                            txtPurcSupplierName.onKeyPressed = txtPurcSupplierNameOnKeyPressedAtShown;
                            txtPurcSupplierName.onKeyReleased = txtPurcSupplierNameOnKeyReleasedAtShown;
                            txtPurcSupplierName.font = Arial_16;
                            txtPurcParcelNo.layoutY = 108.0;
                            txtPurcParcelNo.onKeyPressed = txtPurcParcelNoOnKeyPressedAtShown;
                            txtPurcParcelNo.font = Arial_16;
                            txtPrePurcInvoice.layoutY = 132.0;
                            txtPrePurcInvoice.onKeyPressed = txtPrePurcInvoiceOnKeyPressedAtShown;
                            txtPrePurcInvoice.onKeyReleased = txtPrePurcInvoiceOnKeyReleasedAtShown;
                            txtPrePurcInvoice.font = Arial_16;
                            imgPrePurcImage.visible = true;
                            imgPrePurcImage.layoutY = 132.0;
                            imgPrePurcImage.onMouseClicked = imgPrePurcImageOnMouseClickedAtShown;
                            imgPrePurcImage.blocksMouse = true;
                            imgPrePurcImage.image = imageClickDown;
                            imgPrePurcImage.fitWidth = 20.5;
                            imgPrePurcImage.fitHeight = 23.0;
                            txtPurcCode.visible = true;
                            txtPurcCode.layoutY = 62.0;
                            txtPurcCode.editable = false;
                            txtPurcCode.font = Arial_16;
                            labelBillAmt.layoutY = 128.0;
                            labelBillAmt.text = "Actual Amount";
                            labelBillAmt.font = Arial_16;
                            lblTotMargin.visible = true;
                            lblTotMargin.layoutY = 400.0;
                            lblTotMargin.text = "Total Margin (%)";
                            lblTotMargin.font = Arial_14;
                            lblTotMargin.textFill = DarkGray;
                            txtActualAmt.visible = true;
                            txtActualAmt.layoutY = 128.0;
                            txtActualAmt.styleClass = "text-box";
                            txtActualAmt.onKeyReleased = txtActualAmtOnKeyReleasedAtShown;
                            txtActualAmt.onKeyTyped = txtActualAmtOnKeyTypedAtShown;
                            txtActualAmt.text = "0.00";
                            txtActualAmt.editable = true;
                            txtActualAmt.font = Arial_16;
                            txtTotMargin.visible = true;
                            txtTotMargin.layoutY = 400.0;
                            txtTotMargin.text = "0.00";
                            txtTotMargin.editable = false;
                            txtTotMargin.font = Arial_14;
                            lblBarcode.visible = true;
                            lblBarcode.layoutY = 150.0;
                            lblBarcode.text = "Barcode";
                            lblBarcode.font = Arial_16;
                            lblBarcode.textFill = DarkGray;
                            txtBarcode.visible = true;
                            txtBarcode.layoutY = 150.0;
                            txtBarcode.onKeyPressed = txtBarcodeOnKeyPressedAtShown;
                            txtBarcode.font = Arial_16;
                            cboPurcType.visible = false;
                            cboPurcType.onKeyPressed = cboPurcTypeOnKeyPressedAtShown;
                            txtPurcInvoiceNo.layoutY = 86.0;
                            txtPurcInvoiceNo.onKeyPressed = txtPurcInvoiceNoOnKeyPressedAtShown;
                            txtPurcInvoiceNo.onKeyReleased = txtPurcInvoiceNoOnKeyReleasedAtShown;
                            txtPurcInvoiceNo.font = Arial_16;
                            imgInvoiceNo.visible = false;
                            imgInvoiceNo.disable = false;
                            imgInvoiceNo.layoutY = 86.0;
                            imgInvoiceNo.onMouseClicked = imgInvoiceNoOnMouseClickedAtShown;
                            imgInvoiceNo.blocksMouse = true;
                            imgInvoiceNo.image = imageClickDown;
                            imgInvoiceNo.fitWidth = 20.5;
                            imgInvoiceNo.fitHeight = 25.0;
                            txtPurcAddress.layoutY = 106.0;
                            txtPurcAddress.editable = false;
                            txtPurcAddress.font = Arial_16;
                            txtPurcDLNo.layoutY = 84.0;
                            txtPurcDLNo.editable = false;
                            txtPurcDLNo.font = Arial_16;
                            listView.visible = false;
                            listView.effect = null;
                            panelTable.visible = true;
                            panelTable.blocksMouse = true;
                            rectTableBorder.visible = true;
                            txtPurcBillNo.visible = true;
                            txtPurcBillNo.layoutY = 40.0;
                            __layoutInfo_txtPurcBillNo.width = 140.0;
                            txtPurcBillNo.styleClass = "Borderless-text-box";
                            txtPurcBillNo.onKeyReleased = txtPurcBillNoOnKeyReleasedAtShown;
                            txtPurcBillNo.effect = null;
                            txtPurcBillNo.editable = false;
                            txtPurcBillNo.font = Arial_Bold_16;
                            lbl_prepo.visible = true;
                            lbl_prepo.layoutY = 154.0;
                            lbl_prepo.text = "Previous Purchase Order";
                            lbl_prepo.font = Arial_16;
                            txtprepo.visible = true;
                            txtprepo.layoutY = 154.0;
                            txtprepo.onKeyPressed = txtprepoOnKeyPressedAtShown;
                            txtprepo.onKeyReleased = txtprepoOnKeyReleasedAtShown;
                            txtprepo.font = Arial_16;
                            imgprepo.visible = true;
                            imgprepo.layoutY = 156.0;
                            imgprepo.onMouseClicked = imgprepoOnMouseClickedAtShown;
                            imgprepo.blocksMouse = true;
                            imgprepo.image = image2;
                            imgprepo.fitHeight = 25.0;
                            rectRemoveRow.layoutY = 0.0;
                            rectRemoveRow.styleClass = "rectbutton";
                            rectRemoveRow.onKeyPressed = rectRemoveRowOnKeyPressedAtShown;
                            rectRemoveRow.onMouseClicked = rectRemoveRowOnMouseClickedAtShown;
                            rectRemoveRow.fill = Yellow;
                            rectRemoveRow.stroke = DarkGray;
                            rectRemoveRow.strokeWidth = 1.0;
                            labelRemoveRow.layoutY = 0.0;
                            __layoutInfo_labelRemoveRow.height = 20.0;
                            labelRemoveRow.font = Arial_Bold_12;
                            labelRemoveRow.hpos = javafx.geometry.HPos.CENTER;
                            labelRemoveRow.vpos = javafx.geometry.VPos.CENTER;
                            groupRemoveRow.visible = true;
                            PurcDatePicker.visible = true;
                            PurcDatePicker.layoutY = 62.0;
                            PurcDatePicker.onMouseClicked = PurchaseDateOnMouseClickedAtShown;
                            PurcDatePicker.image = Image {url: "{__DIR__}images/Calender.png"};;
                            PurcDatePicker.fitWidth = 20.0;
                            PurcDatePicker.fitHeight = 24.0;
                            PurcCalendarPanel.visible = true;
                            PurcCalendarPanel.blocksMouse = true;
                            listPurchase.visible = false;
                            imgSupplierName.visible = true;
                            imgSupplierName.layoutY = 42.0;
                            imgSupplierName.onMouseClicked = imgSupplierNameOnMouseClickedAtShown;
                            imgSupplierName.rotate = 0.0;
                            imgSupplierName.scaleX = 1.2;
                            imgSupplierName.scaleY = 1.2;
                            imgSupplierName.scaleZ = 1.0;
                            imgSupplierName.blocksMouse = true;
                            imgSupplierName.effect = null;
                            imgSupplierName.image = imageClickDown;
                            imgSupplierName.fitWidth = 16.0;
                            imgSupplierName.fitHeight = 20.0;
                            labelProducts.layoutY = 0.0;
                            labelProducts.text = "Products";
                            labelProducts.font = Arial_16;
                            labelQuantity.layoutY = 25.0;
                            labelQuantity.text = "Quantity";
                            labelQuantity.font = Arial_16;
                            labelFree_Qty.layoutY = 50.0;
                            labelFree_Qty.font = Arial_16;
                            labelVAT_4.layoutY = 75.0;
                            labelVAT_4.text = "Total VAT";
                            labelVAT_4.font = Arial_16;
                            labelVAT_4.textFill = DarkGray;
                            labelMiscCost.visible = true;
                            labelMiscCost.layoutY = 100.0;
                            labelMiscCost.text = "Misc. Cost";
                            labelMiscCost.font = Arial_16;
                            labelMiscCost.textFill = DarkGray;
                            txtPurcTotItems.layoutX = 100.0;
                            txtPurcTotItems.layoutY = 0.0;
                            txtPurcTotItems.styleClass = "text-box";
                            txtPurcTotItems.onKeyReleased = txtPurcTotItemsOnKeyReleasedAtShown;
                            txtPurcTotItems.promptText = "0";
                            txtPurcTotItems.font = Arial_16;
                            txtPurcTotalQty.layoutX = 100.0;
                            txtPurcTotalQty.layoutY = 25.0;
                            txtPurcTotalQty.styleClass = "text-box";
                            txtPurcTotalQty.promptText = "0";
                            txtPurcTotalQty.font = Arial_16;
                            txtPurcFree.layoutX = 100.0;
                            txtPurcFree.layoutY = 50.0;
                            txtPurcFree.styleClass = "text-box";
                            txtPurcFree.onKeyPressed = txtPurcFreeOnKeyPressedAtShown;
                            txtPurcFree.promptText = "0";
                            txtPurcFree.font = Arial_16;
                            txtPurcVAT4.layoutX = 100.0;
                            txtPurcVAT4.layoutY = 75.0;
                            txtPurcVAT4.styleClass = "text-box";
                            txtPurcVAT4.font = Arial_16;
                            txtMiscCost.visible = true;
                            txtMiscCost.managed = true;
                            txtMiscCost.layoutX = 100.0;
                            txtMiscCost.layoutY = 100.0;
                            txtMiscCost.styleClass = "text-box";
                            txtMiscCost.onKeyPressed = txtMiscCostOnKeyPressedAtShown;
                            txtMiscCost.onKeyReleased = txtMiscCostOnKeyReleasedAtShown;
                            txtMiscCost.text = "0.00";
                            txtMiscCost.editable = true;
                            txtMiscCost.font = Arial_16;
                            panelBottomC1.visible = true;
                            panelBottomC1.layoutY = 400.0;
                            labelSub_Total.layoutY = 0.0;
                            labelSub_Total.text = "Subtotal ";
                            labelSub_Total.font = Arial_16;
                            labelSub_Total.textFill = DarkGray;
                            labelRound_Off.visible = true;
                            labelRound_Off.layoutX = 0.0;
                            labelRound_Off.layoutY = 25.0;
                            labelRound_Off.text = "Rounded Off";
                            labelRound_Off.font = Arial_16;
                            labelRound_Off.textFill = DarkGray;
                            Sch_Discount.layoutY = 75.0;
                            Sch_Discount.text = "Cash DiscAmt";
                            Sch_Discount.font = Arial_16;
                            Sch_Discount.textFill = DarkGray;
                            labelDiscount.layoutY = 50.0;
                            labelDiscount.text = "Disc Amount";
                            labelDiscount.font = Arial_16;
                            labelDiscount.textFill = DarkGray;
                            txtPurcSubTotal.layoutX = 105.0;
                            txtPurcSubTotal.layoutY = 0.0;
                            txtPurcSubTotal.onKeyPressed = txtPurcSubTotalOnKeyPressedAtShown;
                            txtPurcSubTotal.font = Arial_16;
                            txtPurcRoundAmt.visible = true;
                            txtPurcRoundAmt.layoutX = 105.0;
                            txtPurcRoundAmt.layoutY = 25.0;
                            txtPurcRoundAmt.onKeyReleased = txtPurcRoundAmtOnKeyReleasedAtShown;
                            txtPurcRoundAmt.font = Arial_16;
                            txtPurcDiscount.layoutX = 105.0;
                            txtPurcDiscount.layoutY = 50.0;
                            txtPurcDiscount.font = Arial_16;
                            txtPurcSchDiscount.layoutX = 105.0;
                            txtPurcSchDiscount.layoutY = 75.0;
                            txtPurcSchDiscount.onKeyPressed = txtPurcSchDiscountOnKeyPressedAtShown;
                            txtPurcSchDiscount.onKeyReleased = txtPurcSchDiscountOnKeyReleasedAtShown;
                            txtPurcSchDiscount.text = "0";
                            txtPurcSchDiscount.font = Arial_16;
                            panelBottomC2.visible = true;
                            panelBottomC2.layoutY = 400.0;
                            labelPRno.visible = true;
                            labelPRno.text = "PR. Number";
                            labelPRno.font = Arial_16;
                            labelPRno.textFill = DarkGray;
                            labelActual_Invoice_Amt_.visible = true;
                            labelActual_Invoice_Amt_.layoutY = 50.0;
                            labelActual_Invoice_Amt_.text = "Invoice Amt.";
                            labelActual_Invoice_Amt_.font = Arial_16;
                            labelActual_Invoice_Amt_.textFill = DarkGray;
                            labelAdjust_Amt.visible = true;
                            labelAdjust_Amt.layoutY = 75.0;
                            labelAdjust_Amt.text = "Adjusted Amt.";
                            labelAdjust_Amt.font = Arial_16;
                            labelAdjust_Amt.textFill = DarkGray;
                            txtPurcPRAdjNo.visible = true;
                            txtPurcPRAdjNo.layoutX = 100.0;
                            txtPurcPRAdjNo.layoutY = 0.0;
                            __layoutInfo_txtPurcPRAdjNo.height = 48.0;
                            txtPurcPRAdjNo.editable = false;
                            txtPurcPRAdjNo.font = Arial_16;
                            txtPurcPRAdjNo.multiline = true;
                            txtPurcActualAmt.visible = true;
                            txtPurcActualAmt.layoutX = 100.0;
                            txtPurcActualAmt.layoutY = 50.0;
                            txtPurcActualAmt.editable = false;
                            txtPurcActualAmt.font = Arial_16;
                            txtPurcPRAdjAmt.visible = true;
                            txtPurcPRAdjAmt.layoutX = 100.0;
                            txtPurcPRAdjAmt.layoutY = 75.0;
                            txtPurcPRAdjAmt.onKeyPressed = txtPurcPRAdjAmtOnKeyPressedAtShown;
                            txtPurcPRAdjAmt.onKeyReleased = txtPurcPRAdjAmtOnKeyReleasedAtShown;
                            txtPurcPRAdjAmt.text = "0.00";
                            txtPurcPRAdjAmt.editable = false;
                            txtPurcPRAdjAmt.font = Arial_16;
                            panelBottomC3.visible = true;
                            panelBottomC3.layoutY = 400.0;
                            labelNet_Paid.layoutY = 0.0;
                            labelNet_Paid.font = Arial_14;
                            txtPurcNetPaid.layoutX = 60.0;
                            txtPurcNetPaid.layoutY = 0.0;
                            __layoutInfo_txtPurcNetPaid.height = 24.0;
                            txtPurcNetPaid.onKeyPressed = txtPurcNetPaidOnKeyPressedAtShown;
                            txtPurcNetPaid.onKeyReleased = txtPurcNetPaidOnKeyReleasedAtShown;
                            txtPurcNetPaid.text = "0.00";
                            txtPurcNetPaid.font = Arial_Bold_16;
                            panelBottomC4.visible = false;
                            panelBottomC4.layoutY = 370.0;
                            labelBalance.layoutX = 0.0;
                            labelBalance.layoutY = 0.0;
                            labelBalance.font = Arial_14;
                            txtPurcBalance.layoutX = 60.0;
                            txtPurcBalance.layoutY = 0.0;
                            __layoutInfo_txtPurcBalance.height = 24.0;
                            txtPurcBalance.font = Arial_Bold_16;
                            panelBottomC5.visible = false;
                            panelBottomC5.layoutY = 370.0;
                            labelAmount.visible = true;
                            labelAmount.opacity = 0.5;
                            labelAmount.layoutX = 40.0;
                            labelAmount.layoutY = -15.0;
                            labelAmount.text = "Total";
                            labelAmount.font = Arial_Bold_16;
                            txtPurcTotal.layoutX = 40.0;
                            txtPurcTotal.layoutY = 0.0;
                            __layoutInfo_txtPurcTotal.height = 55.0;
                            txtPurcTotal.font = Arial_65;
                            panelAmt.visible = true;
                            panelAmt.layoutY = 450.0;
                            listSupplier.visible = false;
                            listSupplier.effect = null;
                            listPrePurchase.visible = false;
                            listPrePurchase.cursor = null;
                            listPrePurchase.effect = null;
                            listPrePO.visible = false;
                            listPrePO.cursor = null;
                            listPrePO.effect = null;
                            listPrePO.items = null;
                            btnChangeInvoice.visible = false;
                            btnChangeInvoice.layoutY = 135.0;
                            __layoutInfo_btnChangeInvoice.height = 20.0;
                            btnChangeInvoice.text = "Change Invoice No";
                            btnChangeInvoice.action = btnChangeInvoiceActionAtShown;
                            panel.visible = true;
                            panel.disable = false;
                            panel.onMouseClicked = panelOnMouseClickedAtShown;
                            rectangle3.visible = true;
                            rectangle3.styleClass = "form-background";
                            rectangle3.fill = linearGradient;
                            rectangle3.stroke = DarkGray;
                            rectangle3.strokeWidth = 2.0;
                            rectangle3.width = 700.0;
                            rectangle3.height = 350.0;
                            rectangle3.arcWidth = 10.0;
                            rectangle3.arcHeight = 10.0;
                            rectangle4.visible = true;
                            rectangle4.opacity = 0.25;
                            rectangle4.styleClass = "rectFormHeader";
                            rectangle4.fill = Header;
                            rectangle4.height = 32.0;
                            rectangle4.arcWidth = 5.0;
                            rectangle4.arcHeight = 5.0;
                            label24.visible = true;
                            label24.layoutX = 15.0;
                            label24.layoutY = 58.0;
                            label24.text = "Select the appropriate adjustment category?";
                            label24.font = Arial_Bold_14;
                            label24.textFill = DarkGray;
                            listPRAdjNo.visible = true;
                            listPRAdjNo.layoutX = 9.0;
                            listPRAdjNo.layoutY = 126.0;
                            __layoutInfo_listPRAdjNo.height = 160.0;
                            listPRAdjNo.pickOnBounds = false;
                            listPRAdjNo.cache = false;
                            listPRAdjNo.effect = null;
                            listPRAdjNo.focusTraversable = false;
                            listPRAdjNo.items = null;
                            listPRAdjNo.cellFactory = null;
                            listPRAdjAmt.visible = true;
                            listPRAdjAmt.cursor = null;
                            listPRAdjAmt.layoutX = 171.0;
                            listPRAdjAmt.layoutY = 126.0;
                            __layoutInfo_listPRAdjAmt.height = 160.0;
                            listPRAdjAmt.effect = null;
                            listPRAdjAmt.focusTraversable = false;
                            label25.visible = false;
                            label25.layoutX = 350.0;
                            label25.text = "Do u get adjust amount in the invoice or get replacement items ?";
                            label25.font = Arial_14;
                            label25.textFill = DarkGray;
                            radPRAdjType1.visible = true;
                            radPRAdjType1.layoutX = 345.0;
                            radPRAdjType1.layoutY = 140.0;
                            radPRAdjType1.text = "Adjustment based on Amount";
                            radPRAdjType1.font = Arial_Bold_12;
                            radPRAdjType1.toggleGroup = toggleGroup2;
                            radPRAdjType1.selected = true;
                            radPRAdjType2.visible = true;
                            radPRAdjType2.layoutX = 345.0;
                            radPRAdjType2.layoutY = 190.0;
                            radPRAdjType2.onMouseClicked = radPRAdjType2OnMouseClickedAtShown;
                            radPRAdjType2.text = "Adjustment based on Product(s)";
                            radPRAdjType2.font = Arial_Bold_12;
                            radPRAdjType2.toggleGroup = toggleGroup2;
                            radPRAdjType2.selected = false;
                            radPRAdjType3.visible = true;
                            radPRAdjType3.layoutX = 345.0;
                            radPRAdjType3.layoutY = 240.0;
                            radPRAdjType3.text = "Adjustment based on Exchange of  Different Product(s)";
                            radPRAdjType3.font = Arial_Bold_12;
                            radPRAdjType3.toggleGroup = toggleGroup2;
                            radPRAdjType3.selected = false;
                            listCell.visible = true;
                            listCell.layoutX = 9.0;
                            listCell.layoutY = 102.0;
                            __layoutInfo_listCell.width = 324.0;
                            label26.visible = true;
                            label26.layoutX = 40.0;
                            label26.layoutY = 104.0;
                            label26.text = "PR No.";
                            label26.font = Arial_Bold_14;
                            label26.textFill = javafx.scene.paint.Color.WHITE;
                            label27.visible = true;
                            label27.layoutX = 190.0;
                            label27.layoutY = 104.0;
                            label27.text = "PR Amount";
                            label27.font = Arial_Bold_14;
                            label27.textFill = javafx.scene.paint.Color.WHITE;
                            label28.visible = true;
                            label28.layoutX = 0.0;
                            label28.layoutY = 0.0;
                            __layoutInfo_label28.width = 700.0;
                            __layoutInfo_label28.height = 32.0;
                            label28.font = Arial_18;
                            label28.hpos = javafx.geometry.HPos.CENTER;
                            label28.graphicHPos = javafx.geometry.HPos.CENTER;
                            imageClose.visible = true;
                            imageClose.layoutX = 675.0;
                            imageClose.layoutY = 0.0;
                            imageClose.image = image;
                            imageView.visible = true;
                            imageView.layoutX = 0.0;
                            imageView.layoutY = 0.0;
                            imageView.image = imageApply;
                            btnPRAdjApply.visible = true;
                            btnPRAdjApply.layoutX = 220.0;
                            btnPRAdjApply.layoutY = 300.0;
                            btnPRAdjApply.effect = reflectionEffect;
                            btnPRAdjApply.text = "Apply";
                            btnPRAdjApply.font = Arial_Bold_14;
                            imageView2.visible = true;
                            imageView2.image = imageCancel;
                            btnPRAdjCancel.visible = true;
                            btnPRAdjCancel.layoutX = 380.0;
                            btnPRAdjCancel.layoutY = 300.0;
                            btnPRAdjCancel.effect = reflectionEffect;
                            btnPRAdjCancel.text = "Cancel";
                            btnPRAdjCancel.font = Arial_Bold_14;
                            btnPRAdjCancel.action = button2ActionAtShown;
                            panelPRAdjAlert.visible = true;
                            panelPRAdjust.visible = false;
                            panelPRAdjust.blocksMouse = true;
                            rectangle5.visible = true;
                            rectangle5.styleClass = "form-background";
                            rectangle5.blocksMouse = true;
                            rectangle5.fill = linearGradient;
                            rectangle5.stroke = DarkGray;
                            rectangle5.arcWidth = 5.0;
                            rectangle5.arcHeight = 5.0;
                            rectangle6.visible = true;
                            rectangle6.styleClass = "rectFormHeader";
                            rectangle6.fill = Header;
                            rectangle6.height = 32.0;
                            rectangle6.arcWidth = 5.0;
                            rectangle6.arcHeight = 5.0;
                            label31.visible = true;
                            label31.styleClass = "labelFormHeading";
                            label31.text = "Adjustment based on Exchange of  Different Product(s)";
                            label31.font = Arial_18;
                            label31.hpos = javafx.geometry.HPos.CENTER;
                            label31.textFill = javafx.scene.paint.Color.BLACK;
                            label29.visible = true;
                            label29.layoutY = 60.0;
                            __layoutInfo_label29.height = 20.0;
                            label29.text = "Purchase Return No";
                            label29.font = Arial_12;
                            label29.textFill = DarkGray;
                            txtPRAdjDiffNo.visible = true;
                            __layoutInfo_txtPRAdjDiffNo.width = 125.0;
                            txtPRAdjDiffNo.styleClass = "Borderless-text-box";
                            txtPRAdjDiffNo.editable = false;
                            txtPRAdjDiffNo.font = Arial_Bold_16;
                            rectTableBorder2.visible = true;
                            rectTableBorder2.layoutY = 100.0;
                            rectTableBorder2.height = 290.0;
                            label30.visible = true;
                            label30.layoutY = 60.0;
                            __layoutInfo_label30.height = 20.0;
                            label30.text = "Total Purchase Return Amount";
                            label30.font = Arial_12;
                            label30.textFill = DarkGray;
                            txtPRAdjDiffAmt.visible = true;
                            __layoutInfo_txtPRAdjDiffAmt.width = 150.0;
                            txtPRAdjDiffAmt.styleClass = "Borderless-text-box";
                            txtPRAdjDiffAmt.editable = false;
                            txtPRAdjDiffAmt.font = Arial_Bold_16;
                            panelPRATable.visible = true;
                            panelPRATable.layoutY = 100.0;
                            imageInsert.visible = true;
                            imageInsert.image = imageSave;
                            btnPRAInsert.visible = true;
                            btnPRAInsert.effect = reflectionEffect;
                            btnPRAInsert.text = "Insert";
                            btnPRAInsert.font = Arial_Bold_14;
                            btnPRAInsert.action = btnPRAInsertActionAtShown;
                            imgClear.visible = true;
                            imgClear.cursor = null;
                            imgClear.effect = null;
                            imgClear.image = imageReset;
                            btnPRAClear.visible = true;
                            btnPRAClear.effect = reflectionEffect;
                            btnPRAClear.text = "Reset";
                            btnPRAClear.font = Arial_Bold_14;
                            btnPRAClear.action = btnPRAClearActionAtShown;
                            imgClose.visible = true;
                            imgClose.onMouseClicked = imgCloseOnMouseClickedAtShown;
                            imgClose.blocksMouse = true;
                            imgClose.image = image;
                            txtPRAdjTot.visible = true;
                            txtPRAdjTot.layoutY = 400.0;
                            __layoutInfo_txtPRAdjTot.height = 70.0;
                            txtPRAdjTot.styleClass = "Borderless-text-box";
                            txtPRAdjTot.font = Arial_65;
                            label32.visible = true;
                            label32.opacity = 0.65;
                            label32.layoutY = 400.0;
                            __layoutInfo_label32.height = 70.0;
                            label32.text = "Total Amount";
                            label32.font = Arial_20;
                            label32.textFill = DarkGray;
                            panelAdjDiff.visible = false;
                            panelAdjDiff.layoutX = 0.0;
                            panelAdjDiff.layoutY = 0.0;
                            panelAdjDiff.blocksMouse = true;
                            rectangle7.visible = false;
                            rectBack.visible = false;
                            rectBack.fill = javafx.scene.paint.Color.BLACK;
                            rectBack.stroke = null;
                            rectBack.width = 100.0;
                            rectBack.height = 25.0;
                            rectBack.arcWidth = 0.0;
                            rectBack.arcHeight = 0.0;
                            lblBackDist.visible = false;
                            __layoutInfo_lblBackDist.height = 25.0;
                            lblBackDist.text = "Label";
                            lblBackDist.hpos = javafx.geometry.HPos.LEFT;
                            lblBackDist.textFill = javafx.scene.paint.Color.BLACK;
                            imageDistSave.visible = false;
                            imageDistSave.image = null;
                            btnSaveDist.visible = false;
                            imageDistReset.visible = false;
                            imageDistReset.image = null;
                            btnResetDist.visible = false;
                            panelDistinfo.visible = false;
                            panelChangeInvoice.visible = true;
                            mainPanel.visible = true;
                            imageApply.placeholder = null;
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
                            rectangle.stroke = Violet;
                            rectangle.arcWidth = 0.0;
                            rectangle.arcHeight = 0.0;
                            rectangle2.visible = false;
                            rectangle2.opacity = 1.0;
                            rectangle2.layoutX = 397.5;
                            rectangle2.fill = javafx.scene.paint.Color.BLACK;
                            rectangle2.stroke = null;
                            rectangle2.height = 575.0;
                            rectangle2.arcWidth = 0.0;
                            rectangle2.arcHeight = 0.0;
                            labelPurchase.layoutX = 668.0;
                            labelPurchase.layoutY = 25.0;
                            labelPurchase.styleClass = "label";
                            labelPurchase.effect = lightingEffect;
                            labelPurchase.text = "Purchase";
                            labelPurchase.hpos = javafx.geometry.HPos.LEFT;
                            txtPurcTINNo.visible = false;
                            labelInvoiceNo.layoutY = 82.0;
                            labelInvoiceNo.text = "Invoice No";
                            labelInvoiceNo.font = Arial_12;
                            labelDistributorName.layoutY = 82.0;
                            labelDistributorName.text = "Distributor Name";
                            labelDistributorName.font = Arial_12;
                            labelParcelNo.layoutY = 126.0;
                            labelParcelNo.text = "Parcel No";
                            labelParcelNo.font = Arial_12;
                            labelDLNo.layoutY = 104.0;
                            labelDLNo.text = "D.L. No";
                            labelDLNo.font = Arial_12;
                            labelGRNNo.visible = true;
                            labelGRNNo.layoutY = 104.0;
                            labelGRNNo.text = "PaymentType";
                            labelGRNNo.font = Arial_12;
                            labelCode.layoutY = 60.0;
                            labelCode.text = "Distributor Code";
                            labelCode.font = Arial_12;
                            lblprepurcInv.layoutY = 148.0;
                            lblprepurcInv.text = "Parcel Details";
                            lblprepurcInv.font = Arial_12;
                            labelAddress.layoutY = 148.0;
                            labelAddress.font = Arial_12;
                            imgEdit.visible = false;
                            imgEdit.image = null;
                            btnPurcEdit.text = "Edit [F6]";
                            btnPurcEdit.font = Arial_Bold_14;
                            imgSave.visible = false;
                            imgSave.image = null;
                            btnPurcSave.font = Arial_Bold_14;
                            imgReset.visible = false;
                            imgReset.image = null;
                            btnPurcReset.text = "Reset [F4]";
                            btnPurcReset.font = Arial_Bold_14;
                            imgCancel.visible = false;
                            imgCancel.image = null;
                            btnPurcCancel.text = "Cancel [F8]";
                            btnPurcCancel.font = Arial_Bold_14;
                            panelButtons.visible = false;
                            txtPurcDate.layoutY = 60.0;
                            txtPurcDate.font = Arial_12;
                            labelDate.layoutY = 60.0;
                            labelDate.font = Arial_12;
                            txtPurcSupplierName.layoutY = 60.0;
                            txtPurcSupplierName.font = Arial_12;
                            txtPurcParcelNo.layoutY = 126.0;
                            txtPurcParcelNo.font = Arial_12;
                            txtPrePurcInvoice.layoutY = 148.0;
                            txtPrePurcInvoice.font = Arial_12;
                            imgPrePurcImage.visible = false;
                            imgPrePurcImage.layoutY = 234.0;
                            imgPrePurcImage.blocksMouse = false;
                            imgPrePurcImage.image = null;
                            imgPrePurcImage.fitWidth = 0.0;
                            imgPrePurcImage.fitHeight = 0.0;
                            txtPurcCode.visible = true;
                            txtPurcCode.layoutY = 82.0;
                            txtPurcCode.editable = true;
                            txtPurcCode.font = Arial_12;
                            labelBillAmt.layoutY = 148.0;
                            labelBillAmt.text = "Actual Amount";
                            labelBillAmt.font = Arial_12;
                            lblTotMargin.visible = false;
                            lblTotMargin.layoutY = 0.0;
                            lblTotMargin.text = "Label";
                            lblTotMargin.textFill = javafx.scene.paint.Color.BLACK;
                            txtActualAmt.visible = false;
                            txtActualAmt.layoutY = 126.0;
                            txtActualAmt.styleClass = "text-box";
                            txtActualAmt.text = null;
                            txtActualAmt.editable = false;
                            txtActualAmt.font = Arial_12;
                            txtTotMargin.visible = false;
                            txtTotMargin.layoutY = 0.0;
                            txtTotMargin.text = null;
                            txtTotMargin.editable = true;
                            lblBarcode.visible = false;
                            lblBarcode.layoutY = 0.0;
                            lblBarcode.text = "Label";
                            lblBarcode.textFill = javafx.scene.paint.Color.BLACK;
                            txtBarcode.visible = false;
                            txtBarcode.layoutY = 0.0;
                            cboPurcType.visible = true;
                            txtPurcInvoiceNo.layoutY = 82.0;
                            txtPurcInvoiceNo.font = Arial_12;
                            imgInvoiceNo.visible = false;
                            imgInvoiceNo.disable = false;
                            imgInvoiceNo.layoutY = 82.5;
                            imgInvoiceNo.blocksMouse = false;
                            imgInvoiceNo.image = null;
                            imgInvoiceNo.fitWidth = 0.0;
                            imgInvoiceNo.fitHeight = 0.0;
                            txtPurcAddress.layoutY = 148.0;
                            txtPurcAddress.editable = true;
                            txtPurcAddress.font = Arial_12;
                            txtPurcDLNo.layoutY = 104.0;
                            txtPurcDLNo.editable = true;
                            listView.visible = true;
                            panelTable.visible = false;
                            panelTable.blocksMouse = false;
                            rectTableBorder.visible = false;
                            txtPurcBillNo.visible = true;
                            txtPurcBillNo.layoutY = 60.0;
                            txtPurcBillNo.styleClass = "Borderless-text-box";
                            txtPurcBillNo.editable = false;
                            lbl_prepo.visible = false;
                            lbl_prepo.layoutY = 141.0;
                            lbl_prepo.text = "Label";
                            txtprepo.visible = false;
                            txtprepo.layoutY = 141.0;
                            txtprepo.font = Arial_12;
                            imgprepo.visible = false;
                            imgprepo.layoutY = 119.0;
                            imgprepo.blocksMouse = false;
                            imgprepo.image = image2;
                            imgprepo.fitHeight = 0.0;
                            rectRemoveRow.layoutY = 374.0;
                            rectRemoveRow.styleClass = "";
                            rectRemoveRow.fill = Yellow;
                            rectRemoveRow.stroke = DarkGray;
                            rectRemoveRow.strokeWidth = 2.0;
                            labelRemoveRow.layoutY = 374.0;
                            labelRemoveRow.font = Arial_Bold_12;
                            labelRemoveRow.hpos = javafx.geometry.HPos.LEFT;
                            groupRemoveRow.visible = false;
                            PurcDatePicker.visible = false;
                            PurcDatePicker.layoutY = 60.0;
                            PurcDatePicker.image = null;
                            PurcDatePicker.fitWidth = 0.0;
                            PurcDatePicker.fitHeight = 0.0;
                            PurcCalendarPanel.visible = false;
                            PurcCalendarPanel.blocksMouse = false;
                            listPurchase.visible = false;
                            imgSupplierName.visible = false;
                            imgSupplierName.layoutY = 61.0;
                            imgSupplierName.rotate = 0.0;
                            imgSupplierName.scaleX = 1.0;
                            imgSupplierName.scaleY = 1.0;
                            imgSupplierName.scaleZ = 1.0;
                            imgSupplierName.blocksMouse = false;
                            imgSupplierName.image = null;
                            imgSupplierName.fitWidth = 0.0;
                            imgSupplierName.fitHeight = 0.0;
                            labelProducts.layoutY = 398.0;
                            labelProducts.text = "Total Products";
                            labelProducts.font = Arial_12;
                            labelQuantity.layoutY = 421.0;
                            labelQuantity.text = "Total Quantity";
                            labelQuantity.font = Arial_12;
                            labelFree_Qty.layoutY = 444.0;
                            labelFree_Qty.font = Arial_12;
                            labelVAT_4.layoutY = 467.0;
                            labelVAT_4.text = "VAT 4%";
                            labelVAT_4.font = Arial_12;
                            labelVAT_4.textFill = javafx.scene.paint.Color.BLACK;
                            labelMiscCost.visible = true;
                            labelMiscCost.layoutY = 490.0;
                            labelMiscCost.text = "VAT 12.5%";
                            labelMiscCost.font = Arial_12;
                            labelMiscCost.textFill = javafx.scene.paint.Color.BLACK;
                            txtPurcTotItems.layoutX = 0.0;
                            txtPurcTotItems.layoutY = 398.0;
                            txtPurcTotItems.styleClass = "text-box";
                            txtPurcTotItems.promptText = null;
                            txtPurcTotalQty.layoutX = 0.0;
                            txtPurcTotalQty.layoutY = 421.0;
                            txtPurcTotalQty.styleClass = "text-box";
                            txtPurcTotalQty.promptText = null;
                            txtPurcFree.layoutX = 0.0;
                            txtPurcFree.layoutY = 444.0;
                            txtPurcFree.styleClass = "text-box";
                            txtPurcFree.promptText = null;
                            txtPurcVAT4.layoutX = 0.0;
                            txtPurcVAT4.layoutY = 467.0;
                            txtPurcVAT4.styleClass = "text-box";
                            txtPurcVAT4.font = Arial_12;
                            txtMiscCost.visible = true;
                            txtMiscCost.managed = true;
                            txtMiscCost.layoutX = 0.0;
                            txtMiscCost.layoutY = 490.0;
                            txtMiscCost.styleClass = "text-box";
                            txtMiscCost.text = null;
                            txtMiscCost.editable = false;
                            txtMiscCost.font = Arial_12;
                            panelBottomC1.visible = false;
                            panelBottomC1.layoutY = 0.0;
                            labelSub_Total.layoutY = 398.0;
                            labelSub_Total.text = "Sub Total ";
                            labelSub_Total.font = Arial_12;
                            labelSub_Total.textFill = javafx.scene.paint.Color.BLACK;
                            labelRound_Off.visible = false;
                            labelRound_Off.layoutX = 49.0;
                            labelRound_Off.layoutY = 460.0;
                            labelRound_Off.text = "Label";
                            labelRound_Off.textFill = javafx.scene.paint.Color.BLACK;
                            Sch_Discount.layoutY = 444.0;
                            Sch_Discount.text = "Sch Discount";
                            Sch_Discount.font = Arial_12;
                            Sch_Discount.textFill = javafx.scene.paint.Color.BLACK;
                            labelDiscount.layoutY = 421.0;
                            labelDiscount.text = "Discount  ";
                            labelDiscount.font = Arial_12;
                            labelDiscount.textFill = javafx.scene.paint.Color.BLACK;
                            txtPurcSubTotal.layoutX = 0.0;
                            txtPurcSubTotal.layoutY = 398.0;
                            txtPurcRoundAmt.visible = false;
                            txtPurcRoundAmt.layoutX = 122.0;
                            txtPurcRoundAmt.layoutY = 450.0;
                            txtPurcDiscount.layoutX = 0.0;
                            txtPurcDiscount.layoutY = 421.0;
                            txtPurcDiscount.font = Arial_12;
                            txtPurcSchDiscount.layoutX = 0.0;
                            txtPurcSchDiscount.layoutY = 444.0;
                            txtPurcSchDiscount.text = "0";
                            txtPurcSchDiscount.font = Arial_12;
                            panelBottomC2.visible = false;
                            panelBottomC2.layoutY = 0.0;
                            labelPRno.visible = false;
                            labelPRno.text = "Label";
                            labelPRno.textFill = javafx.scene.paint.Color.BLACK;
                            labelActual_Invoice_Amt_.visible = false;
                            labelActual_Invoice_Amt_.layoutY = 0.0;
                            labelActual_Invoice_Amt_.text = "Label";
                            labelActual_Invoice_Amt_.textFill = javafx.scene.paint.Color.BLACK;
                            labelAdjust_Amt.visible = false;
                            labelAdjust_Amt.layoutY = 0.0;
                            labelAdjust_Amt.text = "Label";
                            labelAdjust_Amt.textFill = javafx.scene.paint.Color.BLACK;
                            txtPurcPRAdjNo.visible = false;
                            txtPurcPRAdjNo.layoutX = 0.0;
                            txtPurcPRAdjNo.layoutY = 0.0;
                            txtPurcPRAdjNo.editable = true;
                            txtPurcPRAdjNo.multiline = false;
                            txtPurcActualAmt.visible = false;
                            txtPurcActualAmt.layoutX = 0.0;
                            txtPurcActualAmt.layoutY = 0.0;
                            txtPurcActualAmt.editable = true;
                            txtPurcPRAdjAmt.visible = false;
                            txtPurcPRAdjAmt.layoutX = 0.0;
                            txtPurcPRAdjAmt.layoutY = 0.0;
                            txtPurcPRAdjAmt.text = null;
                            txtPurcPRAdjAmt.editable = true;
                            panelBottomC3.visible = false;
                            panelBottomC3.layoutY = 0.0;
                            labelNet_Paid.layoutY = 597.0;
                            labelNet_Paid.font = Arial_16;
                            txtPurcNetPaid.layoutX = 0.0;
                            txtPurcNetPaid.layoutY = 596.0;
                            __layoutInfo_txtPurcNetPaid.height = 28.0;
                            txtPurcNetPaid.text = null;
                            txtPurcNetPaid.font = Arial_20;
                            panelBottomC4.visible = false;
                            panelBottomC4.layoutY = 0.0;
                            labelBalance.layoutX = 0.0;
                            labelBalance.layoutY = 591.0;
                            labelBalance.font = Arial_16;
                            txtPurcBalance.layoutX = 0.0;
                            txtPurcBalance.layoutY = 591.0;
                            __layoutInfo_txtPurcBalance.height = 28.0;
                            txtPurcBalance.font = Arial_20;
                            panelBottomC5.visible = false;
                            panelBottomC5.layoutY = 0.0;
                            labelAmount.visible = true;
                            labelAmount.opacity = 1.0;
                            labelAmount.layoutX = 0.0;
                            labelAmount.layoutY = 597.0;
                            labelAmount.text = "Total ";
                            labelAmount.font = Arial_16;
                            txtPurcTotal.layoutX = 0.0;
                            txtPurcTotal.layoutY = 344.0;
                            __layoutInfo_txtPurcTotal.height = 36.0;
                            txtPurcTotal.font = Arial_30;
                            panelAmt.visible = false;
                            panelAmt.layoutY = 0.0;
                            listSupplier.visible = false;
                            listPrePurchase.visible = false;
                            listPrePO.visible = false;
                            listPrePO.items = [ "Item 1", "Item 2", "Item 3", ];
                            btnChangeInvoice.visible = false;
                            btnChangeInvoice.layoutY = 61.0;
                            btnChangeInvoice.text = "Button";
                            panel.visible = false;
                            panel.disable = false;
                            rectangle3.visible = false;
                            rectangle3.styleClass = "";
                            rectangle3.fill = javafx.scene.paint.Color.BLACK;
                            rectangle3.stroke = null;
                            rectangle3.strokeWidth = 1.0;
                            rectangle3.width = 100.0;
                            rectangle3.height = 50.0;
                            rectangle3.arcWidth = 0.0;
                            rectangle3.arcHeight = 0.0;
                            rectangle4.visible = false;
                            rectangle4.opacity = 1.0;
                            rectangle4.styleClass = "";
                            rectangle4.fill = javafx.scene.paint.Color.BLACK;
                            rectangle4.height = 50.0;
                            rectangle4.arcWidth = 0.0;
                            rectangle4.arcHeight = 0.0;
                            label24.visible = false;
                            label24.layoutX = 6.0;
                            label24.layoutY = 6.0;
                            label24.text = "Label";
                            label24.textFill = javafx.scene.paint.Color.BLACK;
                            listPRAdjNo.visible = false;
                            listPRAdjNo.layoutX = 0.0;
                            listPRAdjNo.layoutY = 0.0;
                            listPRAdjNo.pickOnBounds = false;
                            listPRAdjNo.cache = false;
                            listPRAdjNo.focusTraversable = true;
                            listPRAdjNo.items = null;
                            listPRAdjNo.cellFactory = null;
                            listPRAdjAmt.visible = false;
                            listPRAdjAmt.layoutX = 162.0;
                            listPRAdjAmt.layoutY = 50.0;
                            listPRAdjAmt.focusTraversable = true;
                            label25.visible = false;
                            label25.layoutX = 234.0;
                            label25.text = "Label";
                            label25.textFill = javafx.scene.paint.Color.BLACK;
                            radPRAdjType1.visible = false;
                            radPRAdjType1.layoutX = 386.0;
                            radPRAdjType1.layoutY = 50.0;
                            radPRAdjType1.text = "Radio Button";
                            radPRAdjType1.toggleGroup = null;
                            radPRAdjType1.selected = false;
                            radPRAdjType2.visible = false;
                            radPRAdjType2.layoutX = 344.0;
                            radPRAdjType2.layoutY = 147.0;
                            radPRAdjType2.text = "Radio Button";
                            radPRAdjType2.toggleGroup = null;
                            radPRAdjType2.selected = false;
                            radPRAdjType3.visible = false;
                            radPRAdjType3.layoutX = 362.0;
                            radPRAdjType3.layoutY = 119.0;
                            radPRAdjType3.text = "Radio Button";
                            radPRAdjType3.toggleGroup = null;
                            radPRAdjType3.selected = false;
                            listCell.visible = false;
                            listCell.layoutX = 6.0;
                            listCell.layoutY = 50.0;
                            label26.visible = false;
                            label26.layoutX = 28.0;
                            label26.layoutY = 51.0;
                            label26.text = "Label";
                            label26.textFill = javafx.scene.paint.Color.BLACK;
                            label27.visible = false;
                            label27.layoutX = 194.0;
                            label27.layoutY = 51.0;
                            label27.text = "Label";
                            label27.textFill = javafx.scene.paint.Color.BLACK;
                            label28.visible = false;
                            label28.layoutX = 236.0;
                            label28.layoutY = 6.0;
                            label28.hpos = javafx.geometry.HPos.LEFT;
                            label28.graphicHPos = javafx.geometry.HPos.LEFT;
                            imageClose.visible = false;
                            imageClose.layoutX = 651.0;
                            imageClose.layoutY = 0.0;
                            imageClose.image = image;
                            imageView.visible = false;
                            imageView.layoutX = 260.0;
                            imageView.layoutY = 313.0;
                            imageView.image = null;
                            btnPRAdjApply.visible = false;
                            btnPRAdjApply.layoutX = 344.0;
                            btnPRAdjApply.layoutY = 319.0;
                            btnPRAdjApply.text = "Button";
                            imageView2.visible = false;
                            imageView2.image = null;
                            btnPRAdjCancel.visible = false;
                            btnPRAdjCancel.layoutX = 480.0;
                            btnPRAdjCancel.layoutY = 319.0;
                            btnPRAdjCancel.text = "Button";
                            panelPRAdjAlert.visible = false;
                            panelPRAdjust.visible = false;
                            panelPRAdjust.blocksMouse = false;
                            rectangle5.visible = false;
                            rectangle5.styleClass = "";
                            rectangle5.blocksMouse = false;
                            rectangle5.fill = javafx.scene.paint.Color.BLACK;
                            rectangle5.stroke = null;
                            rectangle5.arcWidth = 0.0;
                            rectangle5.arcHeight = 0.0;
                            rectangle6.visible = false;
                            rectangle6.styleClass = "";
                            rectangle6.fill = javafx.scene.paint.Color.BLACK;
                            rectangle6.height = 50.0;
                            rectangle6.arcWidth = 0.0;
                            rectangle6.arcHeight = 0.0;
                            label31.visible = false;
                            label31.styleClass = "label";
                            label31.text = "Label";
                            label31.hpos = javafx.geometry.HPos.LEFT;
                            label31.textFill = javafx.scene.paint.Color.BLACK;
                            label29.visible = false;
                            label29.layoutY = 0.0;
                            label29.text = "Label";
                            label29.textFill = javafx.scene.paint.Color.BLACK;
                            txtPRAdjDiffNo.visible = false;
                            txtPRAdjDiffNo.styleClass = "text-box";
                            txtPRAdjDiffNo.editable = true;
                            rectTableBorder2.visible = false;
                            rectTableBorder2.layoutY = 0.0;
                            rectTableBorder2.height = 50.0;
                            label30.visible = false;
                            label30.layoutY = 0.0;
                            label30.text = "Label";
                            label30.textFill = javafx.scene.paint.Color.BLACK;
                            txtPRAdjDiffAmt.visible = false;
                            txtPRAdjDiffAmt.styleClass = "text-box";
                            txtPRAdjDiffAmt.editable = true;
                            panelPRATable.visible = false;
                            panelPRATable.layoutY = 0.0;
                            imageInsert.visible = false;
                            imageInsert.image = null;
                            btnPRAInsert.visible = false;
                            btnPRAInsert.text = "Button";
                            imgClear.visible = false;
                            imgClear.image = null;
                            btnPRAClear.visible = false;
                            btnPRAClear.text = "Button";
                            imgClose.visible = false;
                            imgClose.blocksMouse = false;
                            imgClose.image = null;
                            txtPRAdjTot.visible = false;
                            txtPRAdjTot.layoutY = 0.0;
                            txtPRAdjTot.styleClass = "text-box";
                            label32.visible = false;
                            label32.opacity = 1.0;
                            label32.layoutY = 0.0;
                            label32.text = "Label";
                            label32.textFill = javafx.scene.paint.Color.BLACK;
                            panelAdjDiff.visible = false;
                            panelAdjDiff.layoutX = 0.0;
                            panelAdjDiff.layoutY = 0.0;
                            panelAdjDiff.blocksMouse = false;
                            rectangle7.visible = true;
                            rectBack.visible = true;
                            rectBack.onMouseClicked = rectBackOnMouseClickedAtDistInfo;
                            rectBack.fill = Yellow;
                            rectBack.stroke = DarkGray;
                            rectBack.width = 120.0;
                            rectBack.height = 20.0;
                            rectBack.arcWidth = 10.0;
                            rectBack.arcHeight = 10.0;
                            lblBackDist.visible = true;
                            __layoutInfo_lblBackDist.width = 120.0;
                            __layoutInfo_lblBackDist.height = 20.0;
                            lblBackDist.text = "Back to purchase";
                            lblBackDist.font = Arial_Bold_12;
                            lblBackDist.hpos = javafx.geometry.HPos.CENTER;
                            lblBackDist.textFill = DarkGray;
                            imageDistSave.visible = true;
                            imageDistSave.image = imageSave;
                            btnSaveDist.visible = true;
                            btnSaveDist.effect = reflectionEffect;
                            btnSaveDist.font = Arial_Bold_14;
                            btnSaveDist.action = btnSaveDistActionAtDistInfo;
                            imageDistReset.visible = true;
                            imageDistReset.image = imageReset;
                            btnResetDist.visible = true;
                            btnResetDist.effect = reflectionEffect;
                            btnResetDist.font = Arial_Bold_14;
                            btnResetDist.action = btnResetDistActionAtDistInfo;
                            panelDistinfo.visible = true;
                            panelChangeInvoice.visible = false;
                            mainPanel.visible = true;
                            imageApply.placeholder = null;
                        }
                    }
                ]
            }
        ]
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ mainPanel, ]
    }
    // </editor-fold>//GEN-END:main

    function txtBarcodeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if(event.code == KeyCode.VK_ENTER) {
            var itemCode:String = commonCont.getQueryValue("SELECT item_code FROM barcode_mapping where delete_flag=0 and  item_id='{txtBarcode.rawText.trim()}' or barcode='{txtBarcode.rawText.trim()}'");
            if(itemCode=="") {
                itemCode= commonCont.getQueryValue("SELECT itemcode FROM drugtable where substring(item_id,3,9)='{txtBarcode.rawText.trim()}' and dru_flag_id!=3");
            }
            if(itemCode=="") {
                FXinfo("Select valid barcode");
            }
            else {
                if(btnPurcSave.disabled==false) {
                    tableSave.barcodeSelected = true;
                    tableSave.itemCode = itemCode;
                    tableSave.focusSet(0,1,"barcode");
                }
                else {
                    if(swingCompEditTbl.disabled and btnPurcEdit.text.equals("Update [F7]")) {
                      FXinfo("Please select invoice number or press Back button to switch to Save mode");
                      txtBarcode.requestFocus();
                    }
                    else {
                      tableEdit.barcodeSelected = true;
                      tableEdit.itemCode = itemCode;
                      tableEdit.focusSet(0,1,"barcode");
                    }
                }
            }
       }
       shortcut(event);
         }

    function txtMiscCostOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        updateIntValues();
         }

    function txtMiscCostOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {              
        if (event.code == KeyCode.VK_ENTER) { txtPurcSchDiscount.requestFocus(); } shortcut(event);
         }

    function btnChangeInvoiceActionAtShown(): Void {
        var purchaseCont: com.vanuston.medeil.implementation.Purchase = RegistryFactory.getClientStub(RegistryConstants.Purchase) as com.vanuston.medeil.implementation.Purchase;
        var purReturnInvoice=commonCont.getQueryValue("select invoice_no from purchase_return where invoice_no='{txtPurcInvoiceNo.rawText.trim()}'");
        var purAdjustFlag=commonCont.getQueryValue("select pr_adjust_no from purchase_invoice where invoice_no='{txtPurcInvoiceNo.rawText.trim()}'");
        var paymentFlag=commonCont.getQueryValue("select invoice_no  from payment where invoice_no='{txtPurcInvoiceNo.rawText.trim()}'");
        if(txtPurcInvoiceNo.rawText.trim().equals("")) {
            FXinfo("Please select the Invoice number");
        }
        else if(purchaseCont.checkInvoice(txtPurcInvoiceNo.rawText.trim())==true) {
            FXinfo("The invoice number does not exist");
        }
        else if(tableEdit.nullVal==0) {
            FXinfo("The table values are empty.Please check");
        }
        else if(not txtPurcInvoiceNo.rawText.trim().equals(selStrInv)) {
          FXinfo("The invoice details differs from the selected invoice number. Please check");
        }
        else if(purReturnInvoice.equals(txtPurcInvoiceNo.rawText.trim())){
            FXinfo("The purchase invoice number cannot be changed since items has been already returned");
        }
        else if(not purAdjustFlag.equals("") and purAdjustFlag != null) {
            FXinfo("The purchase invoice number cannot be changed since purchase adjustment done");
        }
        else if(not paymentFlag.equals("")) {
            FXinfo("The purchase invoice number cannot be changed since payment done");
        }
        else {
            panelChangeInvoice.visible = true;
            ChangeInvoice.Show();
        }
        }
     
    function CearListView() : Void {
        if(listView.visible) { listView.visible= false; listView.items = null; }
        if(listPurchase.visible) { listPurchase.visible=false; listPurchase.items = null; }
        if(listSupplier.visible) { listSupplier.visible=false; listSupplier.items = null; }
        if(listPrePurchase.visible) { listPrePurchase.visible=false; listPrePurchase.items = null; }
        if(listPrePO.visible) { listPrePO.visible=false; listPrePO.items = null; }
    }


    function panelOnMouseClickedAtShown(event : javafx.scene.input.MouseEvent): Void {
        if(swingCompEditTbl.disabled and btnPurcEdit.text.equals("Update [F7]")){
           FXinfo("Please select invoice number or press Back button to switch to Save mode");
        }
        CearListView();
    } 

    function txtprepoOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        getPrePoBillInfo(1);
        if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB) {
            listPrePO.visible = false;
        }
        if (event.code == KeyCode.VK_DOWN) {
            listPrePO.requestFocus();
            listPrePO.selectFirstRow();
        }
        }

    function imgprepoOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        if(not listPrePO.visible){
        getPrePoBillInfo(0);
        }
        else{
           listPrePO.visible = false;
           txtprepo.requestFocus();
        }
    }

    function txtprepoOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {       
       if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            listPrePO.visible = false;
            txtPurcSupplierName.requestFocus();
        }
        }
    
    function imgPrePurcImageOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        getPreInvBillInfo(0);
    }

    function txtPrePurcInvoiceOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        getPreInvBillInfo(1);
        if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB) {
            listPrePurchase.visible = false;
            rotateImage1();
        }
        if (event.code == KeyCode.VK_DOWN) {
            listPrePurchase.requestFocus();
            listPrePurchase.selectFirstRow();
        }
    }

    function txtPrePurcInvoiceOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            listPrePurchase.visible = false;
            txtprepo.requestFocus();
        }
    }

    var actAmtStr: String = bind txtActualAmt.rawText.trim();

    function txtActualAmtOnKeyTypedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function txtActualAmtOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
    }

    function btnPurcResetOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_SPACE) {
            btnPurcResetActionAtShown();
        } else {
            shortcut(event);
        }
    }

    function btnPurcCancelOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_SPACE) {
            btnPurcCancelActionAtShown();
        } else {
            shortcut(event);
        }
    }

    function txtPurcPRAdjAmtOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function txtPurcPRAdjAmtOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        updateIntValues();
    }

    function txtPurcTotItemsOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function txtPurcBillNoOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function btnPRAClearActionAtShown(): Void {
        PurcRtAdjTable.clearData();
    }

    function btnPRAInsertActionAtShown(): Void {
        insertDiffItemsIntoPurc();        
    }

    function imgCloseOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        closePRAdjPanel2();
    }

    function radPRAdjType2OnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        selectType2Options();
    }

    function radPRAdjType3OnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        selectType3Options();
    }

    function button2ActionAtShown(): Void {
        closePRAdjPanel();
        updateValues();
    }

    function btnPRAdjApplyAction(): Void {
        applyAdjustment();
        updateValues();
    }

    function insertDiffItemsIntoPurc(): Void {
        var val;
        if(not btnPurcSave.disable){
        val = tableSave.insertTableFrm(PurcRtAdjTable.getTableRemValues());
        }
        else {
        val = tableEdit.insertTableFrm(PurcRtAdjTable.getTableRemValues());
        }
        if (val == 1) {
            panelAdjDiff.visible = false;
            PurcRtAdjTable.setIsInsValues();
        }        
    }

    function checkretno(ret: String): Integer {
        var retval = 0;
        try {
            var retno: String[] = txtPurcPRAdjNo.rawText.split(",");
            for(i in [0..<retno.size()]) {
                if(retno[i].equals(ret)) {
                    retval = 1;
                    break;
                }
            }
        } catch (ex: Exception) {
            var ss = " Class : PurchaseInvoice   Method: applyAdjustment    Exception : {ex.getMessage()}";
            log.debug(ss);
        }
        return retval;
    }


    function applyAdjustment(): Void {
        try {
            if ((selAmt != -1 or selNo != -1) and (selAmt == selNo)) {
                var prNo = bind "{listPRAdjNo.selectedItem}";
                var prAmt = bind "{listPRAdjAmt.selectedItem}";
                var t1 = radPRAdjType1.selected;
                var t2 = radPRAdjType2.selected;
                var t3 = radPRAdjType3.selected;
                if (t1) {
                    if(txtPurcPRAdjNo.rawText.trim().length() <= 0) {
                        txtPurcPRAdjNo.text = prNo;
                        txtPurcPRAdjAmt.text = prAmt;
                    } else {
                        var val = checkretno(prNo);
                        if(val == 0) {
                            txtPurcPRAdjNo.text = "{txtPurcPRAdjNo.rawText.trim()},{prNo}";
                            txtPurcPRAdjAmt.text = "{Double.parseDouble(txtPurcPRAdjAmt.rawText.trim()) +  Double.parseDouble(prAmt)}";
                        } else {
                            FXinfo("The Selected Return Invoice of the Distributor is Already Exists.");
                            closePRAdjPanel();
                        }
                    }                    
                    pAdjType = 1;
                } else if (t2) {
                    if(txtPurcPRAdjNo.rawText.trim().length() <= 0) {
                        txtPurcPRAdjNo.text = prNo;
                        txtPurcPRAdjAmt.text = prAmt;
                    } else {
                        var val = checkretno(prNo);
                        if(val == 0) {
                            txtPurcPRAdjNo.text = "{txtPurcPRAdjNo.rawText.trim()},{prNo}";
                            txtPurcPRAdjAmt.text = "{Double.parseDouble(txtPurcPRAdjAmt.rawText.trim()) +  Double.parseDouble(prAmt)}";
                        } else {
                            FXinfo("The Selected Return Invoice of the Distributor is Already Exists.");
                            closePRAdjPanel();
                        }
                    }
                    pAdjType = 2;
                } else if (t3) {
                    if(txtPurcPRAdjNo.rawText.trim().length() <= 0) {
                        txtPurcPRAdjNo.text = prNo;
                        txtPurcPRAdjAmt.text = prAmt;
                    } else {
                        var val = checkretno(prNo);
                        if(val == 0) {
                            txtPurcPRAdjNo.text = "{txtPurcPRAdjNo.rawText.trim()},{prNo}";
                            txtPurcPRAdjAmt.text = "{Double.parseDouble(txtPurcPRAdjAmt.rawText.trim()) +  Double.parseDouble(prAmt)}";
                        } else {
                            FXinfo("The Selected Return Invoice of the Distributor is Already Exists.");
                            closePRAdjPanel();
                        }
                    }
                    txtPRAdjDiffNo.text = prNo;
                    txtPRAdjDiffAmt.text = prAmt;
                    pAdjType = 3;
                }
                closePRAdjPanel();
                pAdjFlag = 1;
            } else {
                FXinfo("Select the PR No. to proceed with your PR adjustment category   .", 1);
            }
        } catch (ex: Exception) {
            var ss = " Class : PurchaseInvoice   Method: applyAdjustment    Exception : {ex.getMessage()}";
            log.debug(ss);
        }
    }

    function imageCloseOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        closePRAdjPanel();
    }

    function closePRAdjPanel(): Void {
        panelPRAdjust.visible = false;
        panel.disable = false;
    }

    function showPRAdjPanel2(): Void {
        PurcRtAdjTable.clearData();
        panelAdjDiff.visible = true;
        panel.disable = true;
        PurcRtAdjTable.purchaseCalculations();
        updateIntValues();
    }

    function closePRAdjPanel2(): Void {
        panelAdjDiff.visible = false;
        panel.disable = false;
    }

    function imgInvoiceNoOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        if (not listPurchase.visible or isChk == 1) {
            getInvBillInfo(0);
        } else {
            listPurchase.visible = false;
            rotateImage1();
        }
    }

    function imgSupplierNameOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        if (not listSupplier.visible or isChk == 2) {
            getSupplier(0);            
        } else {
            listSupplier.visible = false;
            rotateImage();
        }
    }

    function txtPurcNetPaidOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        updateIntValues();
    }

    function txtPurcSchDiscountOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        updateIntValues();
    }

    function btnResetDistActionAtDistInfo(): Void {
        DistInfo.reset();
    }

    function btnSaveDistActionAtDistInfo(): Void {
        var ret: Integer = bind DistInfo.save(0);
        saveAndBack(ret);
        
    }

    def isSaved = bind DistInfo.isSave on replace {
        saveAndBack(0);
    }

    function saveAndBack(ret: Integer): Void {
        if (ret == 0) {
            txtPurcSupplierName.text = DistInfo.tempDistName;
            txtPurcCode.text = DistInfo.tempDistCode;
            txtPurcDLNo.text = DistInfo.tempDistDLNo;
            txtPurcTINNo.text = DistInfo.tempDistTinNo;
            txtPurcAddress.text = DistInfo.tempDistAdd;
            goToShownState();
        }
        updateValues();
    }

    var ret1 = bind DistInfo.checkVal on replace {
        saveAndBack(ret1);
    }

    function rectBackOnMouseClickedAtDistInfo(event: javafx.scene.input.MouseEvent): Void {
        goToShownState();
    }

    function goToShownState(): Void {
        currentState.actual = currentState.findIndex("Shown");
        txtPurcInvoiceNo.requestFocus();
        rotateImage();
    }

    function btnPurcEditOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    def kr = KeyRegistry {};
    var short = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 3 and CommonDeclare.form[2] == 2) {
            shortcut(short);
        }
    }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {

        if (event.code == kr.save and not btnPurcSave.disable) {
            savePurchase();
        }
        if ((event.code == kr.update or event.code == kr.edit) and not btnPurcEdit.disable) {
            editPurchase();
        }
        if (event.code == kr.reset and btnPurcReset.text == "Reset [F4]") {
            resetPurchaseValues();
        }
        if (event.controlDown and event.code == kr.back) {
            if (btnPurcCancel.text == "Back [Ctrl+Left]") { back(); }
        }
        if (event.code == kr.rRow) {
            if (btnPurcSave.disable) {
                tableEdit.removeRow(); updateValues();
            } else {
                tableSave.removeRow(); updateValues();
            }
        }
        if (event.code == kr.cancel) {
            if (btnPurcCancel.text == "Cancel [F8]") {
                cancelForm();
            }
        }
    }
    public function shortcutOnTable(event: java.awt.event.KeyEvent): Void {
        try {
            if (event.getKeyText(event.getKeyCode()) == "F3" and btnPurcSave.disable == false) {
                savePurchase();
            }
            if (event.getKeyText(event.getKeyCode()) == "F4" and btnPurcReset.text == "Reset [F4]") {
                resetPurchaseValues();
            }
            if ( (event.getKeyText(event.getKeyCode()) == "F6" or event.getKeyText(event.getKeyCode()) == "F7")
                and btnPurcSave.disable == false) {
                editPurchase();
            }
            if (event.getKeyText(event.getKeyCode()) == "F8" and btnPurcCancel.text == "Cancel [F8]") {
                cancelForm();
            }
            if (event.isControlDown() and event.getKeyText(event.getKeyCode()) == "Left") {
                if (btnPurcCancel.text == "Back [Ctrl+Left]") { back(); }
            }
            if (event.getKeyText(event.getKeyCode()) == "F12") {
                if (btnPurcSave.disable) {
                    tableEdit.removeRow(); updateValues();
                } else {
                    tableSave.removeRow(); updateValues();
                }
            }
        } catch (ex: Exception) {
            log.debug("SalesCash1 shortcutOnTable {ex.getMessage()}");
        }
    }

    public function cancelForm(): Void {
        mainPanel.visible = false;
        createNull();
        CommonDeclare.form[2] = 0;
    }

    public function createNull(): Void {
    }

    function btnPurcCancelActionAtShown(): Void {
        if (btnPurcCancel.text == "Back [Ctrl+Left]") {
            back();
        } else {
            cancelForm();
        }
    }

    function back(): Void {
        imgEdit.image = imageEdit;
        imgCancel.image = imageCancel;
        swingCompSaveTbl.visible = true;
        jCompSave .setVisible(true);
        swingCompEditTbl.visible = false;
        jCompEdit.setVisible(false);
        listPurchase.visible = false;
        listPrePurchase.visible = false;
        listPrePO.visible = false;
        listSupplier.visible = false;
        btnPurcSave.text = "Save [F3]";
        btnPurcSave.disable = false;
        btnPurcEdit.text = "Edit [F6]";
        btnPurcReset.text = "Reset [F4]";
        btnPurcCancel.text = "Cancel [F8]";
        txtPurcInvoiceNo.editable = true;
        imgInvoiceNo.visible = false;
        txtPrePurcInvoice.visible = true;
        imgPrePurcImage.visible = true;
        txtprepo.visible = true;
        imgprepo.visible = true;
        lbl_prepo.visible=true;
        lblprepurcInv.visible=true;
        btnChangeInvoice.visible=false;
        resetPurchaseValues();
        rotateImage1();
        rotateImage();
        groupRemoveRow.visible = true;
        updateValues();
    }

    function txtPurcInvoiceNoOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtPurcInvoiceNo.style = mandatory;
        if ((event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) and btnPurcEdit.text.equals("Edit [F6]")) {
            invExist = checkAvailability();
            if (invExist) {
                listPurchase.visible = false;
                txtPurcParcelNo.requestFocus();
                invExist = false;
            } else {
                txtPurcInvoiceNo.requestFocus();
                invExist = true;
                FXinfo("The given invoice number, {txtPurcInvoiceNo.rawText.trim()} is already available in the system. If you want create a new one, please enter a new invoice number or go to edit mode to change values for the chosen invoice number!!!");
            }
        }
        shortcut(event);
    }

    function txtPurcInvoiceNoOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (btnPurcSave.disable) {
            getInvBillInfo(1);
            if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB) {
                listPurchase.visible = false;
                rotateImage1();
            }
            if (event.code == KeyCode.VK_DOWN) {
                listPurchase.requestFocus();
                listPurchase.selectFirstRow();
            }
        } else {            
        }
    }

    function btnPurcEditOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_SPACE) {
            editPurchase();
        } else {
            shortcut(event);
        }
    }

    function btnPurcEditActionAtShown(): Void {
        editPurchase();
    }

    function rectRemoveRowOnMouseClickedAtShown(e: javafx.scene.input.MouseEvent): Void {
        if (btnPurcSave.disable) {
            tableEdit.removeRow(); updateValues();
        } else {
            tableSave.removeRow(); updateValues();
        }
    }

    function PurchaseDateOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        if (not dateFlag) {
            if (txtPurcDate.text != null) {
                var dat = txtPurcDate.rawText.split("-");
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1]) - 1;
                var y = Integer.parseInt(dat[2]);
                fxCalendar.set(y, m, d);
            } else {
                var dat = dutils.now("dd-MM-yyyy").split("-");
                var d = Integer.parseInt(dat[0]);
                var m = Integer.parseInt(dat[1]) - 1;
                var y = Integer.parseInt(dat[2]);
                fxCalendar.set(y, m, d);
            }
            fxCalendar.visible = not fxCalendar.visible;
            dateFlag = true;
        } else {
            fxCalendar.visible = false;
        }
    }

    function btnPurcResetActionAtShown(): Void {
        resetPurchaseValues();
    }

    function btnPurcSaveOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_SPACE) {
            savePurchase(); } else {
            shortcut(event);
        }
    }

    function btnPurcSaveActionAtShown(): Void {
        savePurchase();
    }

    function txtPurcNetPaidOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            txtPurcBalance.text = "{value.Round((Double.parseDouble(txtPurcTotal.text) - Double.parseDouble(txtPurcNetPaid.text)), 2)}";
            if (btnPurcSave.disable) {
                btnPurcEdit.requestFocus();
            } else
                btnPurcSave.requestFocus();
        }
        shortcut(event);
    }

    function txtPurcFreeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) { txtPurcNetPaid.requestFocus(); } shortcut(event);
    }

    function txtPurcSchDiscountOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) { txtPurcFree.requestFocus(); } shortcut(event);
    }

    function txtPurcSubTotalOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
    }

    function rectRemoveRowOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (btnPurcSave.disable) {
            tableEdit.removeRow(); updateValues();
        } else {
            tableSave.removeRow(); updateValues();
        }
    }

    function txtPurcParcelNoOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            /*if (btnPurcSave.disable) {
                editPurchaseTable.focusSet();
                updateValues();
            } else {
                createPurchTable.focusSet();
                updateValues();
            }*/
            txtPrePurcInvoice.requestFocus();
        } shortcut(event);
    }

    function cboPurcTypeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            txtPurcParcelNo.requestFocus();
        } shortcut(event);
    }    

    function txtPurcDateOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            txtPurcSupplierName.requestFocus();
        } shortcut(event);

    }

    function txtPurcSupplierNameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtPurcSupplierName.style = mandatory;
        if (event.code == KeyCode.VK_ENTER) {            
            listSupplier.visible = false;
            rotateImage();
            checkPRAdjust();
            if (btnPurcSave.disable) {
                tableEdit.focusSet();
                updateValues();
            } else {
                tableSave.focusSet();
                updateValues();
            }
        } else if (event.code == KeyCode.VK_DOWN) {
            listSupplier.requestFocus();
            listSupplier.selectFirstRow();
        } shortcut(event);
    }

    function txtPurcSupplierNameOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        getSupplier(1);
        if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB) {
            listSupplier.visible = false;
//            rotateImage();
        }
    }

    function checkPRAdjust(): Void {
        var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
        var name = txtPurcSupplierName.rawText.trim();
        var que = "SELECT DISTINCT count(*) FROM purchase_return AS pr WHERE pr.dist_name = '{name}' AND pr.pr_flag_id = 0";
        var cnt = commonController.selectCountQuryExe(que);
        if (cnt > 0) {
            panelPRAdjust.visible = true;
            panel.disable = true;
            label28.text = "Purchase Return Adjustment - {name}";
        }
    }

    function getPreInvBillInfo(type: Integer) {
        if(not listPrePurchase.visible){
        try {
            CearListView();
            var listControlObj: ListController = new ListController();
            listLX = txtPrePurcInvoice.layoutX;
            listLY = txtPrePurcInvoice.layoutY + txtPrePurcInvoice.height;
            listW = txtPrePurcInvoice.width;
            listH = listControlObj.listPurchaseControlView(txtPrePurcInvoice, listPrePurchase, "InvoiceNumber", type);
            var selStr: String = bind listControlObj.selectedString on replace {
                if (selStr.length() > 0) {
                    txtPrePurcInvoice.text = selStr;
                    tableSave.LoadPrePIValues(selStr);
                    tableSave.focusSet();
                    listPrePurchase.clearSelection();
                    listPrePurchase.items = null;
                }
            }
        } catch (ex: Exception) {
            var ss = " Class : PurchaseInvoice   Method: getPreInvBillInfo    Exception : {ex}";
            log.debug(ss);
        }
        }
         else{
           listPrePurchase.visible = false;
           txtPrePurcInvoice.requestFocus();
          }
        }
    


    function getPrePoBillInfo(type: Integer) {
        try {
            CearListView();
            listPrePurchase.visible = false;
            var listControlObj: ListController = new ListController();
            listLX1 = txtprepo.layoutX;
            listLY1 = txtprepo.layoutY + txtprepo.height;
            listW1 = txtprepo.width;
            listH1 = listControlObj.listPurchaseControlView(txtprepo, listPrePO, "PrePo", type);
            var selStr: String = bind listControlObj.selectedString on replace {
                if (selStr.length() > 0) {
                    txtprepo.text = selStr;
                    var distName:String = tableSave.LoadPrePoValues(selStr);
                    txtPurcSupplierName.text = distName;
                    var purchaseCont: com.vanuston.medeil.implementation.Purchase = RegistryFactory.getClientStub(RegistryConstants.Purchase) as com.vanuston.medeil.implementation.Purchase;
                    var supplierDetails = purchaseCont.getSuplierDetailsForPurchase(distName);
                    txtPurcCode.text = supplierDetails.get(0).toString();
                    txtPurcDLNo.text = supplierDetails.get(1).toString();
                    txtPurcTINNo.text = supplierDetails.get(2).toString();
                    txtPurcAddress.text = supplierDetails.get(3).toString();
                    tableSave.focusSet();
                }
            }
        } catch (ex: Exception) {
            var ss = " Class : PurchaseInvoice   Method: getPreInvBillInfo    Exception : {ex}";
            log.debug(ss);
        }
    }

    function getInvBillInfo(type: Integer): Void {
        try {
            CearListView();
            var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
            var purchaseCont: com.vanuston.medeil.implementation.Purchase = RegistryFactory.getClientStub(RegistryConstants.Purchase) as com.vanuston.medeil.implementation.Purchase;
            txtPurcInvoiceNo.style = mandatory;
            var listControlObj: ListController = new ListController();
            listW = txtPurcInvoiceNo.width;
            listLX = txtPurcInvoiceNo.layoutX;
            listLY = txtPurcInvoiceNo.layoutY + txtPurcInvoiceNo.height;
            listH = listControlObj.listPurchaseControlView(txtPurcInvoiceNo, listPurchase, "InvoiceNumber", type);
              var selStr:String = bind listControlObj.selectedString on replace {
                if (selStr.length() > 0) {
                    swingCompEditTbl.disable = false;
                    txtPurcInvoiceNo.text = selStr;
                    selStrInv = selStr;
                    var purcModel = new PurchaseModel();
                    var purcDetails: Object = purchaseCont.purchaseBillDetails(selStr);
                    purcModel = purcDetails as PurchaseModel;
                    if (purcModel.getDistName() != null) {
                        var supplierDetails = purchaseCont.getSuplierDetailsForPurchase(purcModel.getDistName());
                        if (supplierDetails == null) { } else {
                            txtPurcSupplierName.text = purcModel.getDistName();
                            txtPurcCode.text = supplierDetails.get(0).toString();
                            txtPurcDLNo.text = supplierDetails.get(1).toString();
                            txtPurcTINNo.text = supplierDetails.get(2).toString();
                            txtPurcAddress.text = supplierDetails.get(3).toString();
                        }
                        tableEdit.LoadPurchaseEditTable(purcModel);
                        listPurchase.visible = false;
                        getAutoVal = purcModel.getPurcBillno();
                        txtPurcParcelNo.text = purcModel.getParcelNO();
                        purcBillDate = dutils.normalFormatDate(purcModel.getInvDate());
                        var adjFlag = purcModel.getPurc_adj_flagid();
                        pAdjFlag=adjFlag;
                        if (adjFlag == 1) {
                            pAdjType = purcModel.getPr_adjust_type();
                            txtPurcPRAdjAmt.text = String.valueOf(purcModel.getPurc_adjust_amt());
                            txtPurcPRAdjNo.text = purcModel.getPurc_adjust_no();
                        }
                        else {
                            txtPurcPRAdjAmt.text = "0.00";
                            txtPurcPRAdjNo.text = "";
                        }

                        txtPurcNetPaid.text = String.valueOf(purcModel.getPaidAmount());
                        txtPurcBalance.text = String.valueOf(purcModel.getBalAmount());
                        txtMiscCost.text = String.valueOf(purcModel.getBalAmount());
                        txtPurcSchDiscount.text = String.valueOf(purcModel.getSchDisc());
                        txtPurcTotItems.text = String.valueOf(purcModel.getTotItem());
                        //netAmt = purcModel.getTotAmount();
                        txtPurcTotal.text = "0.000";
                        
                        txtPurcTotalQty.text = String.valueOf(purcModel.getTotQuantity());
                        txtTotMargin.text = "0";
                        tableEdit.totPurcVAT4Amt = purcModel.getTotVat();
                        rotateImage1();
                        checkUpdate = 1;
                        tableEdit.focusSet(1, 3);
                        tableEdit.focusSet(0, 4);
                        updateIntValues();
                        tableEdit.purchaseCalculations();
                        tableEdit.calculateMargin();
                        updateValues();
                        var sQue2 = "UPDATE `purchase_invoice` SET update_flag_id=0 WHERE invoice_no='{txtPurcInvoiceNo.rawText.trim()}'";
                        commonController.queryExecution(sQue2);
                    }
                }
            }
        } catch (ex: Exception) {
            var ss = " Class : PurchaseInvoice   Method: getInvBillInfo    Exception : {ex}";
            log.debug(ss);
        }
    }

    function rotateImage(): Void {
//        var r = imgSupplierName.rotate;
//        if (listSupplier.visible) {
//            imgSupplierName.rotate = 180.0;
//        } else {
//            imgSupplierName.rotate = 0.0;
//        }
    }

    function rotateImage1(): Void {
        var r = imgInvoiceNo.rotate;
        if (listPurchase.visible) {
            imgInvoiceNo.rotate = 180.0;
        } else {
            imgInvoiceNo.rotate = 0.0;
        }
    }

    var isChk = 0;
    var chks = 0 on replace {
        if (isChk == 1 and imgInvoiceNo.rotate == 180.0) {
            imgInvoiceNo.rotate = 0.0;
        }
        if (isChk == 2 and imgSupplierName.rotate == 180.0) {
            imgSupplierName.rotate = 0.0
        }
    };

    function getSupplier(type: Integer): Void {
        try {
            CearListView();
            var purchaseCont: com.vanuston.medeil.implementation.Purchase = RegistryFactory.getClientStub(RegistryConstants.Purchase) as com.vanuston.medeil.implementation.Purchase;
            txtPurcSupplierName.style = mandatory;
            var listControlObj: ListController = new ListController();
            listLX = txtPurcSupplierName.layoutX;
            listLY = txtPurcSupplierName.layoutY + txtPurcSupplierName.height;
            listW = txtPurcSupplierName.width + 20.0;
            listH = listControlObj.listPurchaseControlView(txtPurcSupplierName, listSupplier, "Distributor", type);
            var selStr: String = bind listControlObj.selectedString on replace {
                if (selStr.length() > 0) {
                    if (btnPurcSave.disable) {
                    tableEdit.focusSet();
                    updateValues();
                    } else {
                    tableSave.focusSet();
                    updateValues();
                    }
                    if (selStr != "New Distributor...") {
                        var supplierDetails = purchaseCont.getSuplierDetailsForPurchase(selStr);
                        if (supplierDetails == null) {; } else {
                            var n = getPRCnt(selStr);
                            txtPurcSupplierName.text = selStr;
                            txtPurcCode.text = supplierDetails.get(0).toString();
                            txtPurcDLNo.text = supplierDetails.get(1).toString();
                            txtPurcTINNo.text = supplierDetails.get(2).toString();
                            txtPurcAddress.text = supplierDetails.get(3).toString();
                            listSupplier.visible = false;
                            if (n > 0) {
//                                rotateImage();
                                var cn: ConfirmDialogBox1 = new ConfirmDialogBox1(0, "Purchase Invoice", "<html>Do you wish to Adjust Your Purchase Return with the New <br>  Purchase Invoice for this Distributor?</html>");
                                
                                var a  = bind cn.staus;
//                                    var a =false;
                                if (a) {
                                    panel.disable = true;
                                    tit = "Purchase Return Adjustment - {selStr}";
                                    getPRNo(selStr);
                                    panelPRAdjust.visible = true;
                                }
                            }
                        }
                    } else {
                        callDistInfo();
                        listSupplier.visible = false;
                        rotateImage();
                    }
                }else{
                    txtPurcSupplierName.requestFocus();
                }
            }           
        } catch (ex: Exception) {
            var ss = " Class : PurchaseInvoice   Method: getSupplier    Exception : {ex}";
            log.debug(ss);
        }        
    }

    function callDistInfo(): Void {
        currentState.actual = currentState.findIndex("DistInfo");
        if (newDist == 0) {
            insertDistForm();
        }
        newDist = 1;
    }

    function insertDistForm(): Void {
        DistInfo = DistributorInformation {};
        DistInfo.checkState = 1;
        DistInfo.StartUp();
        insert DistInfo.getDesignRootNodes() into panelDistinfo.content;
        DistInfo.txtMastersdistrDName.requestFocus();
    }

    function checkAvailability(): Boolean {
        var purchaseCont: com.vanuston.medeil.implementation.Purchase = RegistryFactory.getClientStub(RegistryConstants.Purchase) as com.vanuston.medeil.implementation.Purchase;
        var check = purchaseCont.checkInvoice(txtPurcInvoiceNo.rawText.trim());
        return check;
    }

    function savePurchase(): Void {
        var purcModel = new PurchaseModel();
        var returnObject = new Object();
        var msgReturnModel: MsgReturnModel = new MsgReturnModel();
        var purchaseCont: com.vanuston.medeil.implementation.Purchase = RegistryFactory.getClientStub(RegistryConstants.Purchase) as com.vanuston.medeil.implementation.Purchase;
        var check = checkValid();
        if (check == 0) {
            try {
                purcModel.setPurcBillno(txtPurcBillNo.rawText.trim());
                purcModel.setInvoiceNo(txtPurcInvoiceNo.rawText.trim());
                purcModel.setInvDate(dutils.changeFormatDate(txtPurcDate.rawText.trim()));
                purcModel.setDistName(txtPurcSupplierName.rawText.trim());
                purcModel.setDistCode(txtPurcCode.rawText.trim());
                purcModel.setParcelNO(txtPurcParcelNo.rawText.trim());
                purcModel.setParcelDetails("");
                purcModel.setPurcType("Credit");
                purcModel.setSubTotal(Double.parseDouble(txtPurcSubTotal.rawText.trim()));
                purcModel.setSchDisc(Double.parseDouble(txtPurcSchDiscount.rawText.trim()));
                purcModel.setTotAmount(Double.parseDouble(txtPurcTotal.rawText.trim()));
                purcModel.setTotDisc(Double.parseDouble(txtPurcDiscount.rawText.trim()));
                purcModel.setTotVat(Double.parseDouble(txtPurcVAT4.rawText.trim()));
                purcModel.setPaidAmount(Double.parseDouble(txtPurcNetPaid.rawText.trim()));
                purcModel.setBalAmount(Double.parseDouble(txtMiscCost.rawText.trim()));
                purcModel.setTotQuantity(Integer.parseInt(txtPurcTotalQty.rawText.trim()));
                purcModel.setTotItem(Integer.parseInt(txtPurcTotItems.rawText.trim()));
                purcModel.setPurc_adjust_no(txtPurcPRAdjNo.rawText.trim());
                var pr_adj_amt = txtPurcPRAdjAmt.rawText.trim();
                if (pr_adj_amt == null or pr_adj_amt == "null" or pr_adj_amt.trim().length() <= 0 or pr_adj_amt == "") {
                    purcModel.setPurc_adjust_amt(0.00);
                }else{
                    purcModel.setPurc_adjust_amt(Double.parseDouble(pr_adj_amt));
                }
                purcModel.setPurc_adj_flagid(pAdjFlag);
                purcModel.setPr_adjust_type(pAdjType);
                purcModel.setListofitems(tableSave.getPurchaseBill());
                purcModel.setLogText("Save");
                purcModel.setModuleName("PurchaseInvoice");
                purcModel.setActionType("save");
                purcModel.setTotPurcAdjDistAmt(tableSave.totPurcAdjDistAmt);
                purcModel.setTotPurcAdjVAT4Amt(tableSave.totPurcAdjVAT4Amt);
                purcModel.setTotPurcAdjAmt(tableSave.totPurcAdjAmt);
                purcModel.setTotPurcAdjItems(tableSave.totPurcAdjItems);
                purcModel.setTotPurcAdjQty(tableSave.totPurcAdjQty);
                //Controller Call
                purcModel.setCompareText(purchaseCont.chkPrePurcPrice(purcModel));
                var confrm;
                if(purcModel.getCompareText().equals("")){
                    confrm = true;
                } else {
                    var cn: ConfirmDialogBox1 = new ConfirmDialogBox1(0, "Purchase Invoice", purcModel.getCompareText());
                    confrm = cn.staus;
                }
                if(confrm) {
                    var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
                    getAutoVal = commonController.getAutoIncrement(purcBillDate, "Purchase");
                    purcModel.setPurcBillno(txtPurcBillNo.rawText);
                    returnObject = purchaseCont.createRecord(purcModel);
                    msgReturnModel = returnObject as MsgReturnModel;                    
                    if (msgReturnModel.getReturnMessage() == "0") {
                        FXalert(0);
                        purchaseCont.updateLog(purcModel);
                        resetPurchaseValues();
                    } else {
                        FXinfo(msgReturnModel.getReturnMessage());
                        tableSave.focusSet(msgReturnModel.getRowCount(), msgReturnModel.getColumnCount());
                    }
                } else {
                    FXinfo("Please Change the Purchase Price for Corresponding Items.");
                }
            } catch (ex: Exception) {
                var ss = " Class : PurchaseInvoice   Method: savePurchase    Exception : {ex}";
                log.debug(ss);
            }
        }
    }

    function updatePurchase(): Void {
        var purcModel = new PurchaseModel();
        var returnObject = new Object();
        var msgReturnModel: MsgReturnModel = new MsgReturnModel();
        var purchaseCont: com.vanuston.medeil.implementation.Purchase = RegistryFactory.getClientStub(RegistryConstants.Purchase) as com.vanuston.medeil.implementation.Purchase;
        var check = checkValid();
        if (check == 0) {
            try {
                purcModel.setPurcBillno(txtPurcBillNo.rawText.trim());
                purcModel.setInvoiceNo(txtPurcInvoiceNo.rawText.trim());
                purcModel.setInvDate(dutils.changeFormatDate(txtPurcDate.rawText.trim()));
                purcModel.setDistName(txtPurcSupplierName.rawText.trim());
                purcModel.setDistCode(txtPurcCode.rawText.trim());
                purcModel.setParcelNO(txtPurcParcelNo.rawText.trim());
                purcModel.setParcelDetails("");
                purcModel.setPurcType("Credit");
                purcModel.setSubTotal(Double.parseDouble(txtPurcSubTotal.rawText.trim()));
                purcModel.setSchDisc(Double.parseDouble(txtPurcSchDiscount.rawText.trim()));
                purcModel.setTotAmount(Double.parseDouble(txtPurcTotal.rawText.trim()));
                purcModel.setTotDisc(Double.parseDouble(txtPurcDiscount.rawText.trim()));
                purcModel.setTotVat(Double.parseDouble(txtPurcVAT4.rawText.trim()));
                purcModel.setPaidAmount(Double.parseDouble(txtPurcNetPaid.rawText.trim()));
                purcModel.setBalAmount(Double.parseDouble(txtMiscCost.rawText.trim()));
                purcModel.setTotQuantity(Integer.parseInt(txtPurcTotalQty.rawText.trim()));
                purcModel.setTotItem(Integer.parseInt(txtPurcTotItems.rawText.trim()));
                purcModel.setListofitems(tableEdit.getPurchaseBill());
                purcModel.setPurc_adj_flagid(pAdjFlag);
                purcModel.setPr_adjust_type(pAdjType);
                purcModel.setTotPurcAdjDistAmt(tableEdit.totPurcAdjDistAmt);
                purcModel.setTotPurcAdjVAT4Amt(tableEdit.totPurcAdjVAT4Amt);
                purcModel.setTotPurcAdjAmt(tableEdit.totPurcAdjAmt);
                purcModel.setTotPurcAdjItems(tableEdit.totPurcAdjItems);
                purcModel.setTotPurcAdjQty(tableEdit.totPurcAdjQty);
                purcModel.setPurc_adjust_no(txtPurcPRAdjNo.rawText.trim());
                var pr_adj_amt = txtPurcPRAdjAmt.rawText.trim();
                if (pr_adj_amt == null or pr_adj_amt == "null" or pr_adj_amt.trim().length() <= 0 or pr_adj_amt == "") {
                    purcModel.setPurc_adjust_amt(0.00);
                } else {
                    purcModel.setPurc_adjust_amt(Double.parseDouble(pr_adj_amt));
                }
                purcModel.setLogText("Update");
                purcModel.setModuleName("PurchaseInvoice");
                purcModel.setActionType("update");
                //Controller Call                
                returnObject = purchaseCont.updateRecordPurchase(purcModel);
                msgReturnModel = returnObject as MsgReturnModel;                
                if (msgReturnModel.getReturnMessage() == "1") {
                    var cn: ConfirmDialogBox = new ConfirmDialogBox(0, "Purchase Invoice");
                    var a = bind cn.staus;
                    if (a) {
                        returnObject = purchaseCont.updateRecord(purcModel);
                        msgReturnModel = returnObject as MsgReturnModel;
                        if (msgReturnModel.getReturnMessage() == "0") {
                            FXalert(4);
                            purchaseCont.updateLog(purcModel);
                            resetPurchaseValues();
                        }
                    }
                } else {
                    FXinfo(msgReturnModel.getReturnMessage());
                    tableEdit.focusSet(msgReturnModel.getRowCount(), msgReturnModel.getColumnCount());
                }
            } catch (ex: Exception) {
                var ss = " Class : PurchaseInvoice   Method: updatePurchase    Exception : {ex}";
                log.debug(ss);
            }
        }
    }

    function editPurchase(): Void {
        if (btnPurcEdit.text == "Edit [F6]") {
            swingCompSaveTbl.visible = false;
            jCompSave .setVisible(false);
            swingCompEditTbl.visible = true;
            swingCompEditTbl.disable = true;
            jCompEdit.setVisible(true);
            listPurchase.visible = false;
            listPrePurchase.visible = false;
            listPrePO.visible = false;
            listSupplier.visible = false;
            rotateImage();
            getAutoVal = "";
            btnPurcSave.disable = true;
            btnPurcEdit.text = "Update [F7]";
            btnPurcCancel.text = "Back [Ctrl+Left]";
            imgCancel.image = imageback;
            imgEdit.image = imageSave;
            imgInvoiceNo.visible = true;
            txtPurcInvoiceNo.requestFocus();
            txtPrePurcInvoice.visible = false;
            txtprepo.visible = false;
            imgPrePurcImage.visible = false;
            imgprepo.visible = false;
            lblprepurcInv.visible=false;
            lbl_prepo.visible=false;
            btnChangeInvoice.visible=true;
            resetPurchaseValues();
        } else if (btnPurcEdit.text == "Update [F7]") {
            updatePurchase();
        }
    }

    function checkValid(): Integer {
        var retVal = 0;
        var ins: List = new ArrayList();
        try {
            var purchaseCont: com.vanuston.medeil.implementation.Purchase = RegistryFactory.getClientStub(RegistryConstants.Purchase) as com.vanuston.medeil.implementation.Purchase;

            var nn = 0;
            var dup = 0;
            var r = 0;
            var r1 = 0;
            var c = 0;
            var tVal: Integer = 2;
            var txtDate:java.util.Date = DateUtils.normalStringToDate(txtPurcDate.rawText.trim());
            var purcDate:java.util.Date = DateUtils.normalStringToDate(dutils.now("dd-MM-yyyy"));
            if (btnPurcSave.disable) {
                c = 1;
                tVal = tableEdit.nullVal;
                ins = purchaseCont.PurchaseBillNum("");
                nn = 1;
                for (i in [0..<ins.size()]) {
                    if (txtPurcInvoiceNo.rawText.trim().equals(ins.get(i).toString())) {
                        nn = 0;
                    }
                }
                dup = 0;
            } else {
                c = 2;
                tVal = tableSave.nullVal;
                dup = 0;
            }
            if (txtPurcInvoiceNo.rawText.trim().equals("") or txtPurcInvoiceNo.rawText.trim() == null or txtPurcInvoiceNo.rawText.trim().length() < 0) {
                retVal = 1;
                FXinfo("Please enter Invoice Number.", txtPurcInvoiceNo);            
            } else if (txtPurcInvoiceNo.rawText.trim().length() > 15) {
                retVal = 1;
                FXinfo("Invoice number length cannot be more than 15 digits.", txtPurcInvoiceNo);
            }
            else if (txtPurcSupplierName.rawText.trim() == "" or txtPurcSupplierName.rawText.trim() == null or txtPurcSupplierName.rawText.trim().length() < 0 ) {
                retVal = 1;
                FXinfo("Please select a Distributor Name.", txtPurcSupplierName);
            } else if (not purchaseCont.getDistributorsForPurchase(txtPurcSupplierName.rawText.trim()).contains(txtPurcSupplierName.rawText.trim())) {
                retVal = 1;
                FXinfo("Please select a Distributor name from the drop-down list.", txtPurcSupplierName);
            } else if (txtPurcCode.rawText.trim() == null or txtPurcCode.rawText.trim() == "" or txtPurcCode.rawText.trim().length() < 0) {
                retVal = 1;
                FXinfo("Please select a valid Distributor Name from the drop-down list.", txtPurcSupplierName);
            } else if(txtDate.getTime().compareTo(purcDate.getTime())== 1) {
                retVal = 1;
                FXinfo("invoice date is greater than the current date. Please check");
            } else if (tVal == 0) {
                FXinfo("Please Enter Table Values");
                tableSave.focusSet();
                retVal = 1;
            } else if(txtPurcTotal.rawText.equals("0.00")) {
                FXinfo("Invoice amount should be greater than zero");
                retVal = 1;
            }  else if(getDecimalValid(txtPurcSchDiscount.rawText.trim(),1,10)!=10){
                retVal = 1;
                FXinfo("Cash Discount value entered is incorrect. Please check");
                txtPurcSchDiscount.requestFocus();
            }  else if(getDecimalValid(txtMiscCost.rawText.trim(),1,10)!=10) {
                retVal = 1;
                FXinfo("Miscellaneous cost value entered is incorrect. Please check");
                txtMiscCost.requestFocus();
            }
            else if(txtPurcRoundAmt.text.equals("") or ( not txtPurcRoundAmt.text.equals("") and (Double.parseDouble(txtPurcRoundAmt.text) > 9 or Double.parseDouble(txtPurcRoundAmt.text) < -9)) ) {
                retVal = 1;
                FXinfo("Round off value entered is incorrect. Please check",txtPurcRoundAmt);
            } 
            else if(txtPurcPRAdjNo.text.length() > 100) {
                retVal = 1;
                FXinfo("Purchase adjustment cannot be more than 100 characters");
            }
            else if (nn != 0) {
                FXinfo("Please select a valid Invoice Number from the drop-down list.", txtPurcInvoiceNo);
                retVal = 1;
            } else if (dup != 0) {
                retVal = 1;
                if (c == 1) {
                    r = tableEdit.is;
                    r1 = tableEdit.js;

                } else if (c == 2) {
                    r = tableSave.is;
                    r1 = tableSave.js;
                }
            }
            else if (amountCheckup() == 1) {
             //   FXinfo("Invoice Amount and Actual Amount is different. Please Check");
                retVal = 1;
            }
            else if (Double.parseDouble(txtPurcTotal.rawText.trim()) < 0) {
                FXinfo("Total Amount should not be a Negative Value. Please Insert Items to Adjust the Amount.");
                retVal = 1;
            }
            else if (btnPurcEdit.text.equals("Edit [F6]")) {
                invExist = checkAvailability();
                 if (invExist) {
                    listPurchase.visible = false;
                    txtPurcParcelNo.requestFocus();
                    invExist = false;
                } else {
                    retVal = 1;
                    FXinfo("The given invoice number, {txtPurcInvoiceNo.rawText.trim()} is already available in the system. If you want create a new one, please enter a new invoice number or go to edit mode to change values for the chosen invoice number!!!",txtPurcInvoiceNo);
                    invExist = true;
                }
            } else if(btnPurcEdit.text.equals("Update [F7]")) {
                 if(not txtPurcInvoiceNo.rawText.trim().equals(selStrInv)) {
                   FXinfo("The invoice details differs from the selected invoice number. Please check");
                   retVal = 1;
                 }
            }            
            else {
                retVal = 0;
            }
        } catch (ex: Exception) {
            var ss = " Class : PurchaseInvoice   Method: checkValid    Exception : {ex}";
            log.debug(ss);
        }
        return retVal;
    }

    function resetPurchaseValues(): Void {
        var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
        mandatory_textboxes();
        if (btnPurcEdit.text == "Update [F7]") {
            txtPurcInvoiceNo.requestFocus();
            getAutoVal = "";
            tableEdit.clearData();
            tableEdit.purchaseCalculations();
            swingCompEditTbl.disable = true;
        } else {
            getAutoVal = commonController.getAutoIncrement(purcBillDate, "Purchase");
            txtPurcInvoiceNo.requestFocus();
            tableSave.clearData();
            tableSave.purchaseCalculations();
        }
        purcBillDate = dutils.now("dd-MM-yyyy");
        txtBarcode.text = "";
        txtPurcSupplierName.text = "";
        txtPurcInvoiceNo.text = "";
        txtPurcCode.text = "";
        txtPurcDLNo.text = "";
        txtPurcTINNo.text = "";
        txtPurcAddress.text = "";
        txtPurcParcelNo.text = "";
        txtPrePurcInvoice.text = "";
        txtprepo.text = "";
        txtPurcTotItems.text = "0";
        txtPurcTotalQty.text = "0";
        txtPurcVAT4.text = "";
        txtPurcDiscount.text = "";
        txtPurcFree.text = "0";
        txtPurcSchDiscount.text = "0";
        txtPurcTotal.text = "";
        txtPurcSubTotal.text = "0.00";
        txtPurcBalance.text = "";
        txtPurcPRAdjNo.text = "";
        txtPurcPRAdjAmt.text = "0.00";
        txtPurcRoundAmt.style = "";
        txtPurcRoundAmt.text = "0.00";
        txtMiscCost.text = "0.00";
        netAmt = 0;
        listPurchase.visible = false;
        listPrePurchase.visible = false;
        listPrePO.visible=false;
        listSupplier.visible = false;
        txtPurcNetPaid.text = txtPurcSubTotal.text;
        txtActualAmt.text = "0.00";
        txtTotMargin.text = "0.00";
        listPRAdjAmt.clearSelection();
        listPRAdjNo.clearSelection();
        radPRAdjType1.selected = true;
        PurcRtAdjTable.resetValues();
        updateValues();
    }

    var visit = bind fxCalendar.visible on replace {
        if (dateFlag and not visit) {
            purcBillDate = fxCalendar.getSelectedDate();
            dateFlag = false;
            txtPurcSupplierName.requestFocus();
        }
    };

    function updateValues(): Void {
            if (btnPurcSave.disable) {
                tableEdit.purchaseCalculations();
            } else {
                tableSave.purchaseCalculations();
            }
            updateIntValues();        
    }

    function updateIntValues(): Void {
        try {
            roundVal = 0.00;
            if (not panelAdjDiff.visible) {
                var ta: Double;
                var tda: Double;
                var tvat4: Double;
                var schDist: Double = 0;
                var adjAmt: Double = 0.0;
                var miscCost:Double = 0.0;
                var ll = txtPurcSchDiscount.rawText.trim().length();
                if(getDecimalValid(txtPurcSchDiscount.rawText.trim(),1,10)==10 and ll > 0) {
                    schDist = Double.parseDouble(txtPurcSchDiscount.rawText);
                }
                if(getDecimalValid(txtMiscCost.rawText.trim(),1,10)==10) {
                    miscCost = Double.parseDouble(txtMiscCost.rawText.trim());
                }
                if (btnPurcEdit.text == "Edit [F6]") {
                    ta = value.Round(tableSave.totPurcAmt, 2);
                    tda = value.Round(tableSave.totPurcDistAmt, 2);
                    tvat4 = value.Round(tableSave.totPurcVAT4Amt, 2);
                    txtPurcTotalQty.text = "{tableSave.totPurcQty}";
                    txtTotMargin.text = "{value.Round(((tableSave.totMargin / tableSave.totMrp ) * 100), 2)}";
                    txtPurcTotItems.text = "{tableSave.totPurcItems}";
                    txtPurcFree.text = "{tableSave.totPurcFreeQty}";
                    if (pAdjType > 1) {
                        txtPurcPRAdjAmt.text = value.Round(tableSave.totPurcAdjAmt);
                    }
                } else if (btnPurcEdit.text == "Update [F7]") {
                    ta = value.Round(tableEdit.totPurcAmt, 2);
                    tda = value.Round(tableEdit.totPurcDistAmt, 2);
                    tvat4 = value.Round(tableEdit.totPurcVAT4Amt, 2);
                    txtPurcTotalQty.text = "{tableEdit.totPurcQty}";
                    txtTotMargin.text = "{value.Round(((tableEdit.totMargin / tableEdit.totMrp ) * 100), 2)}";
                    txtPurcTotItems.text = "{tableEdit.totPurcItems}";
                    txtPurcFree.text = "{tableEdit.totPurcFreeQty}";
                    if (pAdjType > 1) {
                        txtPurcPRAdjAmt.text = value.Round(tableEdit.totPurcAdjAmt);
                    }
                }
                var actual = ((ta - tda) - schDist) + tvat4 + miscCost;

                txtPurcSubTotal.text = value.Round(ta);
                txtPurcDiscount.text = value.Round(tda);
                txtPurcVAT4.text = value.Round(tvat4);
                txtPurcActualAmt.text = value.Round(actual);
                if (txtPurcPRAdjAmt.rawText.trim() != null and txtPurcPRAdjAmt.rawText.trim() != "") {
                    adjAmt = Double.parseDouble(txtPurcPRAdjAmt.rawText.trim());
                }                
                //Rounded Process
                var enableAutoRound : Integer = 0;
                try {
                var settingsController : com.vanuston.medeil.implementation.Settings =  RegistryFactory.getClientStub(RegistryConstants.Configuration) as com.vanuston.medeil.implementation.Settings;
                enableAutoRound = settingsController.getEnableAutoRoundoff()[1];
                } catch(e:Exception ) {
                    log.debug("SetingController Exceptionb:{e.getMessage()}");
                }

                /*if(txtPurcRoundAmt.text != null and not txtPurcRoundAmt.text.equals("") and netAmt == actual - adjAmt ) {
                        netAmt = actual - adjAmt;
                        roundVal = netAmt + Double.parseDouble(txtPurcRoundAmt.text);                    
                } else if(btnPurcEdit.text == "Update [F7]" and txtPurcTotal.text != null and txtPurcTotal.text.trim().equals("0.000") ) {
                    //roundVal = netAmt;                    
                    netAmt = actual - adjAmt;
                    roundVal = value.roundToWholeVal(netAmt);
                    txtPurcRoundAmt.text = "{ value.Round((roundVal - netAmt), 2) }" ;
                }*/
                if(enableAutoRound==0) {
                    netAmt = actual - adjAmt;
                    roundVal = value.roundToHalfVal(netAmt.toString());
                    txtPurcRoundAmt.text = "{ value.Round((roundVal - netAmt), 2) }" ;
                    txtPurcRoundAmt.editable=false;
                }
                else if(enableAutoRound==1) {
                    netAmt = actual - adjAmt;
                    roundVal = value.roundToWholeVal(netAmt);
                    txtPurcRoundAmt.text = "{ value.Round((roundVal - netAmt), 2) }" ;
                    txtPurcRoundAmt.editable=false;
                }
                else {
                    netAmt = actual - adjAmt;
                    roundVal = netAmt;
                    txtPurcRoundAmt.text = "{ value.Round((roundVal - netAmt), 2) }" ;
                    txtPurcRoundAmt.editable=true;
                }
                txtPurcTotal.text = value.Round(roundVal);                
                txtPurcNetPaid.text = txtPurcTotal.rawText.trim();
                var netPaid: Double = 0;
                if (txtPurcNetPaid.rawText.trim() != null and txtPurcNetPaid.rawText.trim() != "") {
                    netPaid = Double.parseDouble(txtPurcNetPaid.rawText.trim());
                }
                txtPurcBalance.text = value.Round(Double.parseDouble("{roundVal}") - value.Round(netPaid, 2));

            } else if (panelAdjDiff.visible) {
                var ta = value.Round(PurcRtAdjTable.totPurcAmt, 2);
                var tda = value.Round(PurcRtAdjTable.totPurcDistAmt, 2);
                var tvat4 = value.Round(PurcRtAdjTable.totPurcVAT4Amt, 2);
                var netAmt = (ta - tda) + tvat4;
                txtPRAdjTot.text = value.Round(netAmt);
            }
            delete  panelChangeInvoice.content;
            ChangeInvoice.panel.visible = false;
            insert ChangeInvoice.panel into panelChangeInvoice.content;            
        } catch (e: Exception) {
            var ss = " Class : PurchaseInvoice   Method: updateValues    Exception : {e}";
            log.debug(ss);
        }
    }

    var chkIsEdit = bind btnPurcSave.disable on replace {
        if (chkIsEdit) {
            imgInvoiceNo.visible = true;
            extra = 20.0;
        } else {
            imgInvoiceNo.visible = false;
            extra = 0.0;
        }
    }

    public function amountCheckup(): Integer {
        var chk: Integer = 0;
        try {
            var acAmt: Double = 0.0;
            var rndAm: Double = Double.parseDouble(txtPurcTotal.rawText.trim());
            if (actAmtStr != "" and actAmtStr != "null" and actAmtStr != null and actAmtStr != "0.00" and actAmtStr != "0") {
                acAmt = Double.parseDouble(actAmtStr);
            } else {
                acAmt = rndAm;
            }
            if (rndAm != acAmt  ) {
                 var a=Alert.confirm("Purchase Invoice","Invoice Amount and Actual Amount is different. Do you want to save? ");
                 if(not a){
                     chk = 1; 
                 }
            }

        } catch (e: Exception) {
            var ss = " Class : PurchaseInvoice   Method: amountCheckup    Exception : {e}";
            log.debug(ss);
        }
        return chk;
    }

    function getPrivileges(u: String): Void {
        var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
        var uname = u;
        var utype = commonController.getUserType(uname);
        if (utype.equals("User")) {
            var priv = commonController.getPrivileges("inventory", uname);
            var ss = priv.split(",");
            var val = Integer.parseInt(ss[0]);
            if (val == 1) {
                btnPurcSave.disable = true;
                if (btnPurcEdit.text == "Update [F7]") {
                    btnPurcEdit.disable = true;
                } else {
                    btnPurcEdit.disable = false;
                }
            } else if (val == 2) {
                if (btnPurcEdit.text != "Update [F7]") {
                    btnPurcSave.disable = false;
                }
                btnPurcEdit.disable = false;
            } else if (val == 3) {
                if (btnPurcEdit.text != "Update [F7]") {
                    btnPurcSave.disable = false;
                }
                btnPurcEdit.disable = false;
            }
        } else {
            if (btnPurcEdit.text != "Update [F7]") {
                btnPurcSave.disable = false;
            }
            btnPurcEdit.disable = false;
        }
    }

    var logUser = bind CommonDeclare.user on replace {
        getPrivileges(logUser); updateValues();
    }
    var changPiv = bind btnPurcEdit.text on replace {
        getPrivileges(logUser); updateValues();
    }

    function changeTableSize(i: Integer): Void {
        swingCompSaveTbl.getJComponent().setPreferredSize(new Dimension(i, TableH));
        swingCompEditTbl.getJComponent().setPreferredSize(new Dimension(i, TableH));
        PurchaseTablePRAdj.getJComponent().setPreferredSize(new Dimension(i, 290));
    }

    var verfy = bind isTempStk on replace {
        if (verfy) {
            tableSave.callTempStocks();
            updateValues();
        }
    }    

    function callPRAdj(prNum: String): Void {
        if(not btnPurcSave.disable) {
        tableSave.callPRAdjust(prNum);
        }
        else {
        tableEdit.callPRAdjust(prNum);
        }

    }

    function getCountTemp(): Void {
        try {
            var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
            isTempStk = false;
            cntTempStks = commonController.selectCountQuryExe("SELECT count(*) FROM temp_stocks WHERE temp_stocks.temp_flag_id = 0");
            if (cntTempStks > 0) {
                var msg: String;
                if (cntTempStks == 1) {
                    msg = "{cntTempStks} Item in temporary stock, please insert purchase details?";
                } else {
                    msg = "{cntTempStks} Item(s) are in temporary stock, please insert purchase details?";
                }
                var cn: ConfirmDialogBox = new ConfirmDialogBox(0, "Purchase Invoice", msg);
                isTempStk = cn.staus;
            }
        } catch (e: Exception) {
            var ss = " Class : PurchaseInvoice   Method: getCountTemp    Exception : {e}";
            log.debug(ss);
        }
    }

    var callPRAdjust = bind radPRAdjType2.selected on replace {
        if (callPRAdjust) {
            selectType2Options();
        }
    }

    function selectType2Options(): Void {
        if (selNo != -1) {
            pAdjType = 2;
            var item = listPRAdjNo.selectedItem;
            callPRAdj("{item}");
        } else {
            radPRAdjType1.selected = true;
            FXinfo("Please choose any one Purchase Return number!");
        }
    }

    var callPRAdjustOthrItems = bind radPRAdjType3.selected on replace {
        if (callPRAdjustOthrItems) {
            selectType3Options();
        }
    }

    function selectType3Options(): Void {
        if (selNo != -1) {
            pAdjType = 3;
            var no = "{listPRAdjNo.selectedItem}";
            var amt = "{listPRAdjAmt.selectedItem}";
            txtPRAdjDiffNo.text = no;
            txtPRAdjDiffAmt.text = amt;
            showPRAdjPanel2();
        } else {
            radPRAdjType1.selected = true;
            FXinfo("Please choose any one Purchase Return number!");
        }
    }

    var selNo = bind listPRAdjNo.selectedIndex on replace {
        listPRAdjAmt.select(selNo);
    }
    var selAmt = bind listPRAdjAmt.selectedIndex on replace {
        listPRAdjNo.select(selAmt);
    }

    function getPRCnt(dist: String): Integer {
        var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
        var que = "select count(*) from purchase_return where dist_name='{dist}' and pr_flag_id=0";
        var num = commonController.selectCountQuryExe(que);
        return num;
    }

    var sss = bind panelPRAdjust.visible on replace {
        if (sss) {
            if (pAdjType == 1) {
                radPRAdjType1.selected = true;
            } else if (pAdjType == 2) {
                radPRAdjType2.selected = true;
                selectType2Options();
            } else if (pAdjType == 3) {
                radPRAdjType3.selected = true;
                selectType3Options();
            }
        }
    }

    function getPRNo(dist: String): Void {
        try {
            var purchaseCont: com.vanuston.medeil.implementation.Purchase = RegistryFactory.getClientStub(RegistryConstants.Purchase) as com.vanuston.medeil.implementation.Purchase;
            var retDetails = purchaseCont.billNumFromDist(dist);
            var pModel: PurchaseModel;
            var invNo: String[];
            var totAmt: String[];
            for (index in [0..<retDetails.size()]) {
                pModel = new PurchaseModel();
                pModel = retDetails.get(index);
                invNo[index] = pModel.getInvoiceNo();
                totAmt[index] = String.valueOf(pModel.getTotAmount());
            }
            listPRAdjNo.items = invNo;
            listPRAdjAmt.items = totAmt;
        } catch (e: Exception) {
            var ss = " Class : PurchaseInvoice   Method: getPRNo    Exception : {e}";
            log.debug(ss);
        }
    }

    function mandatory_textboxes() {
        txtPurcSupplierName.style = mandatory;
        txtPurcInvoiceNo.style = mandatory;
    }

    public function startUp(): Void {
//        resetPurchaseValues();      
        mainPanel.visible = true;
        getCountTemp();
        swingCompSaveTbl.visible = true;
        txtPurcInvoiceNo.style=mandatory;
        txtPurcSupplierName.style=mandatory;
        jCompSave .setVisible(true);
        swingCompSaveTbl.layoutX = 0;
        swingCompSaveTbl.layoutY = 0;
        swingCompEditTbl.layoutX = 0;
        swingCompEditTbl.layoutY = 0;
        PurchaseTablePRAdj.layoutX = 0;
        PurchaseTablePRAdj.layoutY = 0;
//        txtActualAmt.text = "0.00";
        (jCompSave  as javax.swing.JTable).addMouseListener(MouseAdapter {
            override public function mouseClicked(e: java.awt.event.MouseEvent): Void {
                CearListView();
            }
        } );
        (jCompSave  as javax.swing.JTable).addKeyListener(KeyAdapter {
            override public function keyReleased(e: java.awt.event.KeyEvent): Void {
                CearListView();
                tableSave.purchaseCalculations();
                updateValues();
                shortcutOnTable(e);
                var i:Integer = tableSave.jTable.getSelectedRow();
                if(tableSave.jTable.getSelectedColumn()==14) {
                    if(e.getKeyCode()==KeyEvent.VK_ENTER) {
                        if(tableSave.barcodeFocus==true) {
                             txtBarcode.requestFocus();
                        }
                        else {
                            tableSave.jTable.changeSelection(i + 1, 1, false, false);
                            tableSave.jTable.getModel().setValueAt(i + 2, i + 1, 0);
                            tableSave.g.refreshDrugTab();
                        }
                    }
                }
            }
            override public function keyTyped(e: java.awt.event.KeyEvent): Void {
                CearListView();
                tableSave.purchaseCalculations();
                updateValues();
            }
        });
        (jCompEdit as javax.swing.JTable).addKeyListener(KeyAdapter {
            override public function keyReleased(e: java.awt.event.KeyEvent): Void {
                CearListView();
                tableEdit.purchaseCalculations();
                updateValues();
                shortcutOnTable(e);
                var i:Integer = tableEdit.purcEditTable.getSelectedRow();
                if(tableEdit.purcEditTable.getSelectedColumn()==14) {
                    if(e.getKeyCode()==KeyEvent.VK_ENTER) {
                        if(tableEdit.barcodeFocus==true) {
                             txtBarcode.requestFocus();
                        }
                        else {
                            tableEdit.purcEditTable.changeSelection(i + 1, 1, false, false);
                            tableEdit.purcEditTable.getModel().setValueAt(i + 2, i + 1, 0);
                            tableEdit.g.refreshDrugTab();
                        }
                    }
                }
            }
            override public function keyTyped(e: java.awt.event.KeyEvent): Void {
                CearListView();
                tableEdit.purchaseCalculations();
                updateValues();
            }
        });


       (tablePRAdj as javax.swing.JTable).addKeyListener(KeyAdapter {
            override public function keyReleased(e: java.awt.event.KeyEvent): Void {
                PurcRtAdjTable.purchaseCalculations();
                updateValues();
            }
            override public function keyTyped(e: java.awt.event.KeyEvent): Void {
                PurcRtAdjTable.purchaseCalculations();
                updateValues();
            }
        });

        (jCompSave  as javax.swing.JTable).getSelectionModel().addListSelectionListener(javax.swing.event.ListSelectionListener {
            override public function valueChanged(e: javax.swing.event.ListSelectionEvent): Void {
                updateValues();
            }
        });
        (jCompEdit as javax.swing.JTable).getSelectionModel().addListSelectionListener(javax.swing.event.ListSelectionListener {
            override public function valueChanged(e: javax.swing.event.ListSelectionEvent): Void {
                updateValues();
            }
        });
        (tablePRAdj as javax.swing.JTable).getSelectionModel().addListSelectionListener(javax.swing.event.ListSelectionListener {
            override public function valueChanged(e: javax.swing.event.ListSelectionEvent): Void {
                updateValues();
            }
        });
        if (btnPurcEdit.text == "Edit [F6]") {
            swingCompEditTbl.visible = false;
            jCompEdit.setVisible(false);
        };

        fxCalendar.visible = false;
        PurcCalendarPanel.content = [fxCalendar];
        panelTable.content = [swingCompSaveTbl, swingCompEditTbl,];
        panelPRATable.content = [PurchaseTablePRAdj,];
        txtPurcInvoiceNo.requestFocus();
    }

}

