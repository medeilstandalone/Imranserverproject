package com.vanuston.medeil.ui;


import java.util.Date;
import java.awt.Dimension;
import javafx.scene.image.Image;
import javafx.scene.input.KeyCode;
import javafx.scene.control.TextBox;
import javafx.scene.layout.LayoutInfo;
import javafx.ext.swing.SwingComponent;
import java.awt.event.KeyAdapter;
import javax.swing.event.ListSelectionListener;
import com.vanuston.medeil.util.Value;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.KeyRegistry;
import com.vanuston.medeil.uitables.PurcRetTable;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import com.vanuston.medeil.ui.calendar.theme.GrayTheme;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.model.PurchaseModel;
import com.vanuston.medeil.model.MsgReturnModel;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.uitables.ConfirmDialogBox;
import java.lang.Exception;
import java.util.regex.Pattern;
import java.util.regex.Matcher;

public class PurchaseReturn {

    var dutils = new DateUtils();
    var value = new Value();
    var purcRetTab = new PurcRetTable();
    var PaymentType: String[] = ["---Select---", "Cash", "Credit"];
    var purcDate = "";
    var pRetDate = dutils.now("dd-MM-yyyy");
    var dateFlag: Boolean = false;
    var fxCalendar = FXCalendar {
                theme: GrayTheme {};
    };
//    public var rndVal: String = "0.00";
    var netAmt: Double = 0.0; /*on replace {
        rndVal = whole();
    };
    var ss: String = "";
    var roundOff = bind ss on replace {
        rndVal = whole();
    }

    function whole(): String {
        var rVal = value.roundToWholeVal("{netAmt}");
        ss = value.Round(rVal - netAmt);
        return value.Round(rVal);
    }*/

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
    
    function txtPRRoundAmtOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {        
       txtPRRoundAmt.style = "-fx-border-width:2; -fx-border-color:#696969; -fx-background-color:#ffffff;";
         var rVal = txtPRRoundAmt.rawText.trim();
         var rd: Integer = 0; rd = getDecimalValid(rVal, 1, 5);
         if (rd == 0) {
             txtPRRoundAmt.clear();
             FXinfo("Please Enter Only Decimal Values.");  txtPRRoundAmt.requestFocus();
        } else if(event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_ENTER){
             if(rVal != null and rVal != "") {
                if((rVal.startsWith("-") or rVal.startsWith("+")) and rVal.length()<2) {
                    FXinfo("Please Enter valid Rounded Values."); txtPRRoundAmt.requestFocus(); txtPRRoundAmt.text = "";
                } else if((Double.parseDouble(rVal) < -9 or Double.parseDouble(rVal) > 9) ) {
                    FXinfo("Please Enter valid Rounded Values."); txtPRRoundAmt.requestFocus(); txtPRRoundAmt.text = "";
                } else if (rd == 10) {
                    if (txtPRRoundAmt.rawText != null) {
                        txtPRRoundAmt.text =  value.Round("{Double.parseDouble(txtPRRoundAmt.rawText)}");
                            updateIntValues("roundOff");
                    } else {
                        txtPRRoundAmt.text="";
                        updateIntValues("");
                    }
                }
            }
        }
        shortcut(event);
     }

    var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    var purchaseCont: com.vanuston.medeil.implementation.Purchase = RegistryFactory.getClientStub(RegistryConstants.Purchase) as com.vanuston.medeil.implementation.Purchase;
    var getAutoVal = commonController.getAutoIncrement(pRetDate, "PurchaseReturn");
    var purcRetTable = purcRetTab.createViewTable();
    var PurcReturnTable = SwingComponent.wrap(purcRetTab.getScrollTable(purcRetTable));
    var log: Logger = Logger.getLogger(PurchaseReturn.class, "PurchaseReturn");
    var listW = 0.0;
    var listH = 0.0;
    var listLX = 0.0;
    var listLY = 0.0;
    var getList: Integer = 0;
    var panelW = bind CommonDeclare.panelFormW;
    var panelH = bind CommonDeclare.panelFormH;
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var C1LX = bind (panelW * 5.082592122) / 100;
    var C2LX = bind (panelW * 16.5184244) / 100;
    var C3LX = bind (panelW * 44.47268107) / 100;
    var C4LX = bind (panelW * 57.17916137) / 100;
    var BotC6LX = bind (70.13977128 * panelW) / 100;
    var BotC5LX = bind (51.46124524 * panelW) / 100;
    var BotC4LX = bind (35.57814485 * panelW) / 100;
    var BotC3LX = bind (25.41296061 * panelW) / 100;
    var BotC2LX = bind (16.5184 * panelW) / 100;
    var BotTotW = bind (31.76620076 * panelW) / 100;
    var botton1LX = bind CommonDeclare.botton1LX;
    var botton2LX = bind CommonDeclare.botton2LX;
    var botton3LX = bind CommonDeclare.botton3LX;
    var botton4LX = bind CommonDeclare.botton4LX;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    var buttonW = bind CommonDeclare.bottonW;
    var buttonH = bind CommonDeclare.bottonH;
    var extra = 0.0;
    var botm2LX = bind (panelW * 16.5184244) / 100;
    var botm3LX = bind (panelW * 33.03684879) / 100;
    var botm4LX = bind (panelW * 44.47268107) / 100;
    var rectbtnLblLX = bind CommonDeclare.rectbutton2LX;
    var rectbuttonLY = bind CommonDeclare.rectbuttonLY;
    var seperatorW = bind CommonDeclare.seperatorW;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;
    var Type4TextboxW = bind CommonDeclare.Type4TextboxW + 30;
    var AmtPanelLX = bind 48.28462516 * panelW / 100;
    var AmtTextW = bind 43.66073698 * panelW / 100;
    var ImageCalenderLX = bind txtPRRetDate.layoutX + txtPRRetDate.width;
    var panelCalenderLX = bind ImageCalenderLX - CommonDeclare.twoHund - (2 * CommonDeclare.ten);
    var imgClickDownLX = bind C2LX + Type2TextboxW - 20.0;
    var imgClickDown1LX = bind C4LX + Type1TextboxW + Type3TextboxW;
    var imgClickDownLY = 82.0;
    var imgClickDown1LY = 126.0;
    var TableH = 202.0;
    var TableW = bind (95.29860229 * panelW) / 100 on replace {
        changeTableSize(TableW);
        if (getList == 1) {
            listInvProp();
        } else if (getList == 2) {
            listPRBillProp();
        }
    };
    var panelTableLX = bind (panelW - TableW) / 2;
    var panelTableLY = 170.0;
    var rectRemoveRowLX = bind ((panelW + TableW) / 2) - 120;
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    def CustomAlert = CustomAlert {};
    var pr_DBNo = "";
    def ReturnNotes = PurchaseReturnNotes { note_title: "Debit"; };
    var ret = bind ReturnNotes.panel.visible on replace {
        panel.disable = ret;
        panelRetrnNotes.visible = ret;

    }
    var panelRetNoteLX = 0.0;// bind (panelW) / 2;
    var panelRetNoteLY = 0.00;// bind (panelH) / 2;

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Purchase Return", type);
        showAlertbox();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Purchase Return", msg);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    var mandatory = CommonDeclare.textbox_mandatory();
    var error = CommonDeclare.textbox_error();

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Purchase Return", msg);
        showAlertbox();
        if (err_txtbox != null) {
            err_txtbox.requestFocus();
            err_txtbox.style = error;
        }
    }

    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imgPRSave: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imgPREdit: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    public-read def imgCancel: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_cboPRType: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def cboPRType: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: bind C2LX
        layoutY: 104.0
        layoutInfo: __layoutInfo_cboPRType
        items: bind PaymentType
    }
    
    public-read def imgInvNo: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind imgClickDownLX
        layoutY: bind imgClickDownLY
    }
    
    def __layoutInfo_txtPRDLNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtPRDLNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 104.0
        layoutInfo: __layoutInfo_txtPRDLNo
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
        width: bind TableW
        height: bind TableH
    }
    
    def __layoutInfo_txtPRTotItems: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW-30
    }
    public-read def txtPRTotItems: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 398.0
        layoutInfo: __layoutInfo_txtPRTotItems
        editable: false
    }
    
    def __layoutInfo_txtPRTotQty: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW-30
    }
    public-read def txtPRTotQty: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 421.0
        layoutInfo: __layoutInfo_txtPRTotQty
        editable: false
    }
    
    def __layoutInfo_txtPRFree: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW-30
    }
    public-read def txtPRFree: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 444.0
        layoutInfo: __layoutInfo_txtPRFree
        text: "0"
        editable: false
    }
    
    public-read def label25: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 18.0
        layoutY: 511.0
        text: "Rounded Off"
    }
    
    def __layoutInfo_txtPRSubTotal: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtPRSubTotal: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 398.0
        layoutInfo: __layoutInfo_txtPRSubTotal
        promptText: "0.00"
        editable: false
    }
    
    def __layoutInfo_txtPRRoundAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtPRRoundAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 91.0
        layoutY: 511.0
        layoutInfo: __layoutInfo_txtPRRoundAmt
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
    
    public-read def imagePRDate: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind Type1TextboxW + C4LX + Type3TextboxW+ 10.0
        layoutY: 82.0
    }
    
    public-read def label23: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind Type1TextboxW + C4LX + 10.0
        layoutY: 60.0
        text: "Label"
    }
    
    def __layoutInfo_listPurRet: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listPurRet: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind listLX
        layoutY: bind listLY
        layoutInfo: __layoutInfo_listPurRet
        items: null
    }
    
    def __layoutInfo_txtPRRetDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtPRRetDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind Type1TextboxW + C4LX + 10.0
        layoutY: 75.0
        layoutInfo: __layoutInfo_txtPRRetDate
        text: bind pRetDate
    }
    
    public-read def label24: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind Type1TextboxW + C4LX + 10.0
        layoutY: 103.0
        text: "Label"
    }
    
    def __layoutInfo_txtPRNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW - 10.0
    }
    public-read def txtPRNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind Type1TextboxW + C4LX + 10.0
        layoutY: 119.0
        layoutInfo: __layoutInfo_txtPRNo
        text: bind getAutoVal
    }
    
    public-read def imgPRNo: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind imgClickDown1LX
        layoutY: bind imgClickDown1LY
    }
    
    public-read def PurcRetCalPanel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelCalenderLX
        layoutY: 97.0
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
    }
    
    public-read def panelRetrnNotes: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelRetNoteLX
        layoutY: bind panelRetNoteLY
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
    
    def __layoutInfo_txtPRSchDiscount: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtPRSchDiscount: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 444.0
        layoutInfo: __layoutInfo_txtPRSchDiscount
        font: Arial_12
    }
    
    def __layoutInfo_txtPRDiscount: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtPRDiscount: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        managed: true
        layoutY: 421.0
        layoutInfo: __layoutInfo_txtPRDiscount
        promptText: "0.00"
        editable: false
        font: Arial_12
    }
    
    public-read def labelSch_Discount: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 444.0
        text: "Sch Discount"
        font: Arial_12
    }
    
    public-read def labelDiscount: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 421.0
        text: "Discount %"
        font: Arial_12
    }
    
    public-read def labelSub_Total_: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 398.0
        text: "Subtotal "
        font: Arial_12
    }
    
    public-read def panelBottomC2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind Type4TextboxW+125;
        content: [ labelSub_Total_, label25, labelDiscount, labelSch_Discount, txtPRSubTotal, txtPRRoundAmt, txtPRDiscount, txtPRSchDiscount, ]
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
    
    def __layoutInfo_txtPRVAT4: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtPRVAT4: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 467.0
        layoutInfo: __layoutInfo_txtPRVAT4
        promptText: "0.00"
        editable: false
        font: Arial_12
    }
    
    public-read def lblMiscCost: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 490.0
        text: "VAT 12.5%"
        font: Arial_12
    }
    
    public-read def label19: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 467.0
        text: "VAT 4%"
        font: Arial_12
    }
    
    def __layoutInfo_txtPRAddress: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtPRAddress: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 148.0
        layoutInfo: __layoutInfo_txtPRAddress
        font: Arial_12
    }
    
    def __layoutInfo_txtPRInvNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW - 20.0
        hfill: false
    }
    public-read def txtPRInvNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 82.0
        layoutInfo: __layoutInfo_txtPRInvNo
        style: ""
        styleClass: "text-box"
        effect: null
        text: ""
        font: Arial_12
    }
    
    def __layoutInfo_txtPRTINNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtPRTINNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 126.0
        layoutInfo: __layoutInfo_txtPRTINNo
        font: Arial_12
    }
    
    def __layoutInfo_txtPRSuppName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtPRSuppName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 82.0
        layoutInfo: __layoutInfo_txtPRSuppName
        font: Arial_12
    }
    
    def __layoutInfo_txtPRParcelDet: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtPRParcelDet: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 148.0
        layoutInfo: __layoutInfo_txtPRParcelDet
        font: Arial_12
    }
    
    def __layoutInfo_txtPRParcelNo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtPRParcelNo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 126.0
        layoutInfo: __layoutInfo_txtPRParcelNo
        font: Arial_12
    }
    
    def __layoutInfo_txtPRSuppCode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtPRSuppCode: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 60.0
        layoutInfo: __layoutInfo_txtPRSuppCode
        font: Arial_12
    }
    
    public-read def Arial_Bold_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
    }
    
    def __layoutInfo_txtPRInvDate: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtPRInvDate: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 60.0
        layoutInfo: __layoutInfo_txtPRInvDate
        styleClass: "Borderless-text-box"
        text: bind purcDate
        promptText: ""
        selectOnFocus: false
        editable: false
        font: Arial_Bold_12
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
    
    def __layoutInfo_txtPRBalance: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 120.0
        height: 28.0
    }
    public-read def txtPRBalance: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 390.0
        layoutY: 483.0
        layoutInfo: __layoutInfo_txtPRBalance
        promptText: "0.00"
        editable: false
        font: Arial_20
    }
    
    def __layoutInfo_txtPRNetPaid: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 120.0
        height: 28.0
    }
    public-read def txtPRNetPaid: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 220.0
        layoutY: 483.0
        layoutInfo: __layoutInfo_txtPRNetPaid
        promptText: "0.00"
        font: Arial_20
    }
    
    public-read def Arial_Bold_20: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 20.0
    }
    
    public-read def reflectionEffect: javafx.scene.effect.Reflection = javafx.scene.effect.Reflection {
    }
    
    def __layoutInfo_btnPRCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind buttonW+extra
        height: bind buttonH
    }
    public-read def btnPRCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton4LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnPRCancel
        onKeyPressed: btnPRCancelOnKeyPressed
        effect: reflectionEffect
        graphic: imgCancel
        text: "Cancel [F8]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnPREdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind buttonW
        height: bind buttonH
    }
    public-read def btnPREdit: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton2LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnPREdit
        effect: reflectionEffect
        graphic: imgPREdit
        text: "Edit [F6]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnPRSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind buttonW
        height: bind buttonH
    }
    public-read def btnPRSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnPRSave
        translateX: 0.0
        effect: reflectionEffect
        graphic: imgPRSave
        text: "Save [F3]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    def __layoutInfo_btnPRReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind buttonW
        height: bind buttonH
    }
    public-read def btnPRReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton3LX
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnPRReset
        onKeyPressed: btnPRResetOnKeyPressed
        effect: reflectionEffect
        graphic: imageView
        text: "Reset [F4]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    public-read def panelButton: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: bind panelButtonsLY
        content: [ btnPRReset, btnPRSave, btnPREdit, btnPRCancel, ]
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
    
    def __layoutInfo_label18: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 100.0
        height: 20.0
    }
    public-read def label18: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 374.0
        layoutInfo: __layoutInfo_label18
        text: "RemoveRow"
        font: Arial_Bold_12
        hpos: javafx.geometry.HPos.CENTER
        textFill: DarkGray
    }
    
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 395.0
        text: "Total "
        font: Arial_16
        textFill: DarkGray
    }
    
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 444.0
        text: "Free Quantity"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label12: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 421.0
        text: "Total Quantity"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label11: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutY: 398.0
        text: "Total Products"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def panelBottomC1: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ label11, label12, label5, label19, lblMiscCost, txtPRTotItems, txtPRTotQty, txtPRFree, txtPRVAT4, txtMiscCost, ]
    }
    
    public-read def label22: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 220.0
        layoutY: 460.0
        text: "Net Paid"
        font: Arial_16
        textFill: DarkGray
    }
    
    public-read def label21: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 390.0
        layoutY: 460.0
        text: "Balance "
        font: Arial_16
        textFill: DarkGray
    }
    
    public-read def label1: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 126.0
        text: "TIN No."
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label14: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 60.0
        text: "Date"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label13: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 148.0
        text: "Address"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label10: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 148.0
        text: "Parcel Details"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 60.0
        text: "Distributor Code"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label8: javafx.scene.control.Label = javafx.scene.control.Label {
        opacity: 1.0
        layoutX: bind C1LX
        layoutY: 104.0
        text: "Payment Type"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label6: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 104.0
        text: "D.L. No."
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 126.0
        text: "Parcel No."
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 82.0
        text: "Distributor Name"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 82.0
        styleClass: "label"
        text: "Invoice No."
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
        layoutX: 668.0
        layoutY: 25.0
        layoutInfo: __layoutInfo_label
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
    
    def __layoutInfo_txtPRTotal: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind AmtTextW
        height: 36.0
    }
    public-read def txtPRTotal: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutY: 422.0
        layoutInfo: __layoutInfo_txtPRTotal
        promptText: "0.00"
        editable: false
        font: Arial_30
    }
    
    public-read def panelAmt: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind AmtPanelLX
        content: [ label7, txtPRTotal, ]
    }
    
    public-read def Yellow: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.95
        green: 0.94
        blue: 0.847
    }
    
    public-read def rectRemoveRow: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        layoutY: 374.0
        styleClass: "rectbutton"
        fill: Yellow
        stroke: DarkGray
        strokeWidth: 2.0
        width: 100.0
        height: 20.0
        arcWidth: 10.0
        arcHeight: 10.0
    }
    
    public-read def groupRemoveRow: javafx.scene.Group = javafx.scene.Group {
        visible: false
        layoutX: bind rectRemoveRowLX
        content: [ rectRemoveRow, label18, ]
    }
    
    public-read def Arial_Bold_60: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 65.0
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
    
    public-read def linearGradientHeader: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
    }
    
    public-read def linearGradientHeader2: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
    }
    
    public-read def rectangle2: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 0.25
        layoutX: 397.5
        layoutY: 0.0
        styleClass: "rectFormHeader"
        fill: linearGradientHeader2
        stroke: null
        width: bind panelW
        height: 32.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutX: 0.0
        layoutY: 0.0
        content: [ rectangle, rectangle2, label, label2, label3, label4, label6, label8, label9, label10, label13, panelButton, txtPRInvDate, label14, txtPRSuppCode, txtPRParcelNo, txtPRParcelDet, txtPRSuppName, txtPRTINNo, cboPRType, txtPRInvNo, imgInvNo, txtPRAddress, label1, txtPRDLNo, txtPRNetPaid, txtPRBalance, label21, label22, panelTable, rectTableBorder, panelBottomC1, panelBottomC2, panelAmt, listView, groupRemoveRow, imagePRDate, label23, listPurRet, txtPRRetDate, label24, txtPRNo, imgPRNo, PurcRetCalPanel, panelAlert, ]
    }
    
    public-read def panel2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ panel, panelRetrnNotes, ]
    }
    
    public-read def imageBack: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/arrow_Left.png"
    }
    
    public-read def imageClickDown: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
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
                            rectangle.stroke = DarkGray;
                            rectangle.arcWidth = 5.0;
                            rectangle.arcHeight = 5.0;
                            rectangle2.visible = true;
                            rectangle2.layoutX = 0.0;
                            rectangle2.fill = linearGradientHeader;
                            rectangle2.height = 32.0;
                            rectangle2.arcWidth = 5.0;
                            rectangle2.arcHeight = 5.0;
                            label.layoutX = 0.0;
                            label.layoutY = 1.0;
                            label.text = "Purchase Return - ctrl+U";
                            label.hpos = javafx.geometry.HPos.CENTER;
                            label2.layoutY = 65.0;
                            label2.text = "Invoice Date";
                            label3.layoutY = 60.0;
                            label3.text = "Distributor Name";
                            label4.layoutY = 104.0;
                            label8.visible = false;
                            label8.layoutY = 105.0;
                            label8.text = "Payment Type";
                            label9.layoutY = 82.0;
                            label9.text = "Distributor Code";
                            label10.layoutY = 126.0;
                            imageView.visible = true;
                            imageView.image = imageReset;
                            btnPRReset.layoutY = 0.0;
                            btnPRReset.action = btnPRResetActionAtShown;
                            imgPRSave.visible = true;
                            imgPRSave.image = imageSave;
                            btnPRSave.layoutY = 0.0;
                            btnPRSave.onKeyPressed = btnPRSaveOnKeyPressedAtShown;
                            btnPRSave.onKeyReleased = btnPRSaveOnKeyReleasedAtShown;
                            btnPRSave.text = "Save [F3]";
                            btnPRSave.action = btnPRSaveActionAtShown;
                            imgPREdit.visible = true;
                            imgPREdit.image = imageEdit;
                            btnPREdit.layoutY = 0.0;
                            btnPREdit.onKeyPressed = btnPREditOnKeyPressedAtShown;
                            btnPREdit.text = "Edit [F6]";
                            btnPREdit.action = btnPREditActionAtShown;
                            imgCancel.visible = true;
                            imgCancel.image = imageCancel;
                            btnPRCancel.layoutY = 0.0;
                            btnPRCancel.text = "Cancel [F8]";
                            btnPRCancel.action = btnPRCancelActionAtShown;
                            panelButton.visible = true;
                            txtPRInvDate.layoutY = 60.0;
                            txtPRInvDate.styleClass = "Borderless-text-box";
                            txtPRInvDate.onKeyPressed = txtPRRetDateOnKeyPressedAtShown;
                            txtPRInvDate.font = Arial_Bold_12;
                            label14.layoutY = 85.0;
                            label14.text = "Invoice No.";
                            txtPRSuppCode.layoutY = 82.0;
                            txtPRSuppCode.onKeyPressed = txtPRSuppCodeOnKeyPressedAtShown;
                            txtPRSuppCode.editable = false;
                            txtPRParcelNo.layoutY = 104.0;
                            txtPRParcelNo.onKeyPressed = txtPRParcelNoOnKeyPressedAtShown;
                            txtPRParcelNo.editable = false;
                            txtPRParcelDet.layoutY = 126.0;
                            txtPRParcelDet.onKeyPressed = txtPRParcelDetOnKeyPressedAtShown;
                            txtPRParcelDet.editable = false;
                            txtPRSuppName.layoutY = 60.0;
                            txtPRSuppName.onKeyPressed = txtPRSuppNameOnKeyPressedAtShown;
                            txtPRSuppName.onKeyReleased = txtPRSuppNameOnKeyReleasedAtShown;
                            txtPRSuppName.editable = false;
                            txtPRTINNo.onKeyPressed = txtPRTINNoOnKeyPressedAtShown;
                            txtPRTINNo.editable = false;
                            cboPRType.visible = false;
                            cboPRType.onKeyPressed = cboPRTypeOnKeyPressedAtShown;
                            cboPRType.onKeyReleased = cboPRTypeOnKeyReleasedAtShown;
                            txtPRInvNo.layoutY = 82.0;
                            txtPRInvNo.onKeyPressed = txtPRInvNoOnKeyPressedAtShown;
                            txtPRInvNo.onKeyReleased = txtPRInvNoOnKeyReleasedAtShown;
                            imgInvNo.visible = true;
                            imgInvNo.onMouseClicked = imgInvNoOnMouseClickedAtShown;
                            imgInvNo.image = imageClickDown;
                            txtPRAddress.onKeyPressed = txtPRAddressOnKeyPressedAtShown;
                            txtPRAddress.editable = false;
                            txtPRDLNo.onKeyPressed = txtPRDLNoOnKeyPressedAtShown;
                            txtPRDLNo.editable = false;
                            txtPRDLNo.font = Arial_12;
                            txtPRNetPaid.visible = false;
                            txtPRNetPaid.onKeyPressed = txtPRNetPaidOnKeyPressedAtShown;
                            txtPRNetPaid.text = "0.00";
                            txtPRBalance.visible = false;
                            txtPRBalance.text = "0.00";
                            label21.visible = false;
                            label22.visible = false;
                            panelTable.visible = true;
                            rectTableBorder.visible = true;
                            rectTableBorder.styleClass = "rectTableBorder";
                            label11.layoutY = 0.0;
                            label11.text = "Products";
                            label12.layoutY = 25.0;
                            label12.text = "Quantity";
                            label5.layoutY = 50.0;
                            label19.layoutY = 75.0;
                            label19.text = "Total VAT";
                            label19.textFill = DarkGray;
                            lblMiscCost.visible = true;
                            lblMiscCost.layoutY = 100.0;
                            lblMiscCost.text = "Misc. Cost";
                            lblMiscCost.textFill = DarkGray;
                            txtPRTotItems.layoutX = 80.0;
                            txtPRTotItems.layoutY = 0.0;
                            txtPRTotItems.styleClass = "text-box";
                            txtPRTotItems.onKeyReleased = txtPRTotItemsOnKeyReleasedAtShown;
                            txtPRTotItems.text = "";
                            txtPRTotItems.promptText = "0";
                            txtPRTotItems.font = Arial_12;
                            txtPRTotQty.layoutX = 80.0;
                            txtPRTotQty.layoutY = 25.0;
                            txtPRTotQty.styleClass = "text-box";
                            txtPRTotQty.text = "";
                            txtPRTotQty.promptText = "0";
                            txtPRTotQty.font = Arial_12;
                            txtPRFree.managed = true;
                            txtPRFree.layoutX = 80.0;
                            txtPRFree.layoutY = 50.0;
                            txtPRFree.styleClass = "text-box";
                            txtPRFree.text = "";
                            txtPRFree.promptText = "0";
                            txtPRFree.font = Arial_12;
                            txtPRVAT4.layoutX = 80.0;
                            txtPRVAT4.layoutY = 75.0;
                            txtPRVAT4.styleClass = "text-box";
                            txtMiscCost.visible = true;
                            txtMiscCost.layoutX = 80.0;
                            txtMiscCost.layoutY = 100.0;
                            txtMiscCost.styleClass = "text-box";
                            txtMiscCost.text = "0.00";
                            panelBottomC1.visible = true;
                            panelBottomC1.layoutX = 20.0;
                            panelBottomC1.layoutY = 372.0;
                            labelSub_Total_.layoutY = 0.0;
                            labelSub_Total_.textFill = DarkGray;
                            label25.visible = true;
                            label25.disable = false;
                            label25.layoutX = 0.0;
                            label25.layoutY = 25.0;
                            label25.font = Arial_12;
                            label25.textFill = DarkGray;
                            labelDiscount.layoutY = 50.0;
                            labelDiscount.textFill = DarkGray;
                            labelSch_Discount.layoutY = 75.0;
                            labelSch_Discount.textFill = DarkGray;
                            txtPRSubTotal.layoutX = 80.0;
                            txtPRSubTotal.layoutY = 0.0;
                            txtPRSubTotal.styleClass = "text-box";
                            txtPRSubTotal.font = Arial_12;
                            txtPRRoundAmt.visible = true;
                            txtPRRoundAmt.disable = false;
                            txtPRRoundAmt.layoutX = 80.0;
                            txtPRRoundAmt.layoutY = 25.0;
                            txtPRRoundAmt.onKeyReleased = txtPRRoundAmtOnKeyReleasedAtShown;
                            txtPRRoundAmt.font = Arial_12;
                            txtPRDiscount.layoutX = 80.0;
                            txtPRDiscount.layoutY = 50.0;
                            txtPRDiscount.styleClass = "text-box";
                            txtPRSchDiscount.layoutX = 80.0;
                            txtPRSchDiscount.layoutY = 75.0;
                            txtPRSchDiscount.styleClass = "text-box";
                            txtPRSchDiscount.text = "0.00";
                            txtPRSchDiscount.promptText = "0.00";
                            panelBottomC2.visible = true;
                            panelBottomC2.layoutY = 372.0;
                            label7.visible = true;
                            label7.layoutY = 25.0;
                            label7.text = "Amount";
                            label7.font = Arial_Bold_16;
                            txtPRTotal.layoutX = 70.0;
                            txtPRTotal.layoutY = 0.0;
                            __layoutInfo_txtPRTotal.height = 70.0;
                            txtPRTotal.styleClass = "Borderless-text-box";
                            txtPRTotal.font = Arial_Bold_60;
                            panelAmt.visible = true;
                            panelAmt.layoutY = 400.0;
                            listView.visible = false;
                            rectRemoveRow.layoutY = 0.0;
                            rectRemoveRow.onMouseClicked = rectRemoveRowOnMouseClickedAtShown;
                            rectRemoveRow.fill = linearGradient;
                            rectRemoveRow.width = 120.0;
                            label18.layoutY = 0.0;
                            __layoutInfo_label18.width = 120.0;
                            label18.text = "Remove Row [F12]";
                            label18.hpos = javafx.geometry.HPos.CENTER;
                            groupRemoveRow.visible = false;
                            groupRemoveRow.layoutY = 372.0;
                            imagePRDate.visible = true;
                            imagePRDate.layoutY = 80.0;
                            imagePRDate.onMouseClicked = imagePRDateOnMouseClickedAtShown;
                            imagePRDate.image = Image {url: "{__DIR__}images/Calender.png"};
                            label23.visible = true;
                            label23.layoutY = 64.0;
                            label23.text = "Date";
                            label23.font = Arial_12;
                            label23.textFill = DarkGray;
                            listPurRet.visible = false;
                            txtPRRetDate.visible = true;
                            txtPRRetDate.id = "";
                            txtPRRetDate.layoutY = 82.0;
                            txtPRRetDate.editable = false;
                            txtPRRetDate.font = Arial_12;
                            label24.visible = true;
                            label24.layoutY = 108.0;
                            label24.text = "P.R. No.";
                            label24.font = Arial_12;
                            label24.textFill = DarkGray;
                            txtPRNo.visible = true;
                            txtPRNo.layoutY = 126.0;
                            txtPRNo.onKeyPressed = txtPRNoOnKeyPressedAtShown;
                            txtPRNo.onKeyReleased = txtPRNoOnKeyReleasedAtShown;
                            txtPRNo.editable = false;
                            txtPRNo.font = Arial_12;
                            imgPRNo.visible = false;
                            imgPRNo.onMouseClicked = imgPRNoOnMouseClickedAtShown;
                            imgPRNo.image = imageClickDown;
                            PurcRetCalPanel.visible = true;
                            PurcRetCalPanel.layoutY = 102.0;
                            PurcRetCalPanel.blocksMouse = true;
                            panel.visible = true;
                            panel.onMouseClicked = panelOnMouseClickedAtShown;
                            panelRetrnNotes.visible = false;
                            panel2.visible = true;
                        }
                    }
                ]
            }
        ]
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel2, ]
    }
    // </editor-fold>//GEN-END:main

    function btnPRResetOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_SPACE) {
            btnPRResetActionAtShown() } else {
            shortcut(event);
        }
    }

    function btnPRCancelOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_SPACE) {
            btnPRCancelActionAtShown()
        } else {
            shortcut(event);
        }
    }

    function imgInvNoOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        if (btnPREdit.text == "Edit [F6]") {
            if (listPurRet.visible) {
                listPurRet.visible = false;
            } else {
                getBillInfo(0);
            }
        }
    }

    function imgPRNoOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        if (btnPRSave.disable) {
            if (not listPurRet.visible) {
                getPRBillInfo(0);
            } else {
                listPurRet.visible = false;
            }
        }
    }

    function txtPRTotItemsOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function txtPRNoOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtPRNo.style = mandatory;
        shortcut(event);
    }

    function panelOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
    }

    function changeTableSize(i: Integer): Void {
        PurcReturnTable.getJComponent().setPreferredSize(new Dimension(i, TableH));
    }

    function cboPRTypeOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            if (cboPRType.selectedIndex == 0 and btnPRSave.disable == false) {
                cboPRType.select(1);
            }
        }
    }

    function btnPRSaveOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        shortcut(event);
    }

    function checkList(): Void {
        if (listPurRet.visible) {
            listPurRet.items = null;
            listPurRet.visible = false;
        }
    }

    def kr = KeyRegistry {};
    var short = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 3 and CommonDeclare.form[2] == 3) {
            shortcut(short);
        }
    }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {
        checkList();
        if (event.code == kr.save and not btnPRSave.disable) {
            savePurcRet();
        }
        if (event.code == kr.edit and btnPREdit.text == "Edit [F6]" and not btnPREdit.disable) {
            editPurcRet();
        }
        if (event.code == kr.reset and btnPRReset.text == "Reset [F4]") {
            resetPurcRetValues();
        }
        if (event.code == kr.update) {
            if (btnPREdit.text == "Update [F7]" and not btnPREdit.disable) { editPurcRet(); }
        }
        if (event.controlDown and event.code == kr.back) {
            if (btnPRCancel.text == "Back [Ctrl+Left]") { back(); }
        }
        if (event.code == kr.rRow) {
            purcRetTab.removeRow(); updateValues();
        }
        if (event.code == kr.cancel) {
            if (btnPRCancel.text == "Cancel [F8]") {
                cancel();
            }
        }
    }

    function cancel(): Void {
        panel.visible = false;
        CommonDeclare.form[2] = 0;
    }

    function txtPRNetPaidOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            btnPRSave.requestFocus();
        } shortcut(event);
    }

    function txtPRAddressOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtPRInvNo.requestFocus();
        } shortcut(event);
    }

    function txtPRTINNoOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtPRAddress.requestFocus();
        } shortcut(event);
    }

    function txtPRDLNoOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtPRTINNo.requestFocus();
        } shortcut(event);
    }

    function txtPRSuppCodeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtPRDLNo.requestFocus();
        } shortcut(event);
    }

    function txtPRSuppNameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtPRSuppName.style = mandatory;
        if (event.code == KeyCode.VK_ENTER) {
            listPurRet.visible = false;
            txtPRSuppCode.requestFocus();
        } else if (event.code == KeyCode.VK_DOWN) {
            listPurRet.requestFocus();
            listPurRet.selectFirstRow();
        } shortcut(event);
    }

    function txtPRParcelDetOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            purcRetTab.focusSet();
            updateValues();
        } shortcut(event);
    }

    function txtPRParcelNoOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtPRParcelDet.requestFocus();
        } shortcut(event);
    }

    function cboPRTypeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtPRParcelNo.requestFocus();
        } shortcut(event);
    }

    function txtPRRetDateOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtPRSuppName.requestFocus();
        } shortcut(event);
    }

    function btnPRCancelActionAtShown(): Void {
        if (btnPRCancel.text.equals("Back [Ctrl+Left]")) {
            back();
        } else {
            cancel();
        }
    }

    function btnPREditOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_SPACE) {
            editPurcRet()
        } else {
            shortcut(event);
        }
    }

    function btnPRSaveOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_SPACE) {
            savePurcRet()
        } else {
            shortcut(event);
        }
    }

    function txtPRNoOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (btnPRSave.disable) {
            getPRBillInfo(1);
            if (event.code == KeyCode.VK_ENTER) {
                listPurRet.visible = false;
            } else if (event.code == KeyCode.VK_DOWN) {
                listPurRet.requestFocus();
                listPurRet.selectFirstRow();
            }
        }
    }

    var isEdit = bind btnPRSave.disable on replace {
        if (isEdit) {
            imgInvNo.visible = false;
            imgPRNo.visible = true;
        } else {
            imgInvNo.visible = true;
            imgPRNo.visible = false;
        }
    }

    function btnPREditActionAtShown(): Void {
        editPurcRet();
    }

    function btnPRResetActionAtShown(): Void {
        resetPurcRetValues();
    }

    function btnPRSaveActionAtShown(): Void {
        savePurcRet();
    }

    function rectRemoveRowOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        purcRetTab.removeRow(); updateValues();
    }

    function txtPRSuppNameOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
    //  getSupplier(event);
    }

    function txtPRInvNoOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtPRInvNo.style = mandatory;
        if (btnPREdit.text == "Edit [F6]") {
            getBillInfo(1);
        }
        if (event.code == KeyCode.VK_DOWN) {
            if (btnPREdit.text == "Edit [F6]") {
                listPurRet.visible = true;
            }
            listPurRet.requestFocus();
            listPurRet.selectFirstRow();
        }
    }

    function txtPRInvNoOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtPRSuppName.style = mandatory;
        if (event.code == KeyCode.VK_ENTER) {
            listPurRet.visible = false;
            txtPRParcelNo.requestFocus();
        }
        shortcut(event);
    }

    function imagePRDateOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        if (not dateFlag) {
            if (txtPRRetDate.text != null) {
                var dat = txtPRRetDate.rawText.split("-");
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

    function listInvProp(): Void {
        listLX = txtPRInvNo.layoutX;
        listLY = txtPRInvNo.layoutY + txtPRInvNo.height;
        listW = txtPRInvNo.width;
    }

    function listPRBillProp(): Void {
        listLX = txtPRNo.layoutX;
        listLY = txtPRNo.layoutY + txtPRNo.height;
        listW = txtPRNo.width + 20.0;
    }

    public function getPRBillInfo(type: Integer): Void {
        try {
            var listControlObj: ListController = new ListController();
            getList = 2;
            listPRBillProp();
            listH = listControlObj.listPurchaseControlView(txtPRNo, listPurRet, "ReturnBillNumber", type);
            var selStr: String = bind listControlObj.selectedString on replace {
                if (selStr.length() > 0) {
                    var purcRmodel = new PurchaseModel();
                    var purcRDetails: Object = purchaseCont.purcRBillDetails(selStr);
                    purcRmodel = purcRDetails as PurchaseModel;
                    getAutoVal = selStr;
                    txtPRInvNo.text = purcRmodel.getInvoiceNo();
                    var supplierDetails = purchaseCont.getSuplierDetailsForPurchase(purcRmodel.getDistName());
                    if (supplierDetails == null) { } else {
                        txtPRSuppName.text = purcRmodel.getDistName();
                        txtPRSuppCode.text = supplierDetails.get(0).toString();
                        txtPRDLNo.text = supplierDetails.get(1).toString();
                        txtPRTINNo.text = supplierDetails.get(2).toString();
                        txtPRAddress.text = supplierDetails.get(3).toString();
                        listPurRet.visible = false;
                        txtPRNo.requestFocus();
                    }
                    purcRetTab.clearData();//add on 6-sep-2012
                    purcRetTab.LoadPurchaseReturnTable(purcRmodel);
                    purcRetTab.focusSet(0, 4);
//                    updateValues();
                    listPurRet.visible = false;
                    txtPRParcelNo.text = purcRmodel.getParcelNO();
                    txtPRParcelDet.text = purcRmodel.getParcelDetails();
                    purcDate = dutils.normalFormatDate(purcRmodel.getInvDate());
                    pRetDate = dutils.normalFormatDate(purcRmodel.getPurcRBillDate());
                    txtPRSchDiscount.text = String.valueOf(purcRmodel.getSchDisc());
                    txtPRTotItems.text = String.valueOf(purcRmodel.getTotItem());
                    txtPRTotQty.text = String.valueOf(purcRmodel.getTotQuantity());
                    txtPRDiscount.text = String.valueOf(purcRmodel.getTotDisc());
                    txtMiscCost.text = String.valueOf(purcRmodel.getBalAmount());  
                    purcRetTab.purchaseCalculations();
                    netAmt = purcRmodel.getTotAmount();
                    txtPRTotal.text = "0.000";
                    updateValues();
                    pr_DBNo = commonController.getQueryValue("SELECT debit_note_no FROM debit_note where invoiceorbill_no='{purcRmodel.getInvoiceNo()}'");
                }
            }
        } catch (ex: Exception) {
            var ss = " Class : PurchaseReturn   Method: savePurchase    Exception : {ex}";
            
            log.debug(ss);
        }
    }

    public function getBillInfo(type: Integer): Void {
        try {
            var listControlObj: ListController = new ListController();
            getList = 1;
            listInvProp();
            listH = listControlObj.listPurchaseControlView(txtPRInvNo, listPurRet, "InvoiceNumber", type);
            var selStr: String = bind listControlObj.selectedString on replace {
                if (selStr.length() > 0) {
                    purcRetTab.insertPurchaseData(selStr);
                    var tVal = purcRetTab.nullVal;
                    if (tVal > 0) {
                        txtPRInvNo.text = selStr;
                        var billDetails = purchaseCont.purcBillDetailsForPR(selStr);
                        txtPRSuppName.text = billDetails.get(0).toString();
                        var supplierDetails = purchaseCont.getSuplierDetailsForPurchase(billDetails.get(0).toString());
                        if (supplierDetails == null) { } else {
                            txtPRSuppCode.text = supplierDetails.get(0).toString();
                            txtPRDLNo.text = supplierDetails.get(1).toString();
                            txtPRTINNo.text = supplierDetails.get(2).toString();
                            txtPRAddress.text = supplierDetails.get(3).toString();
                        }
                        txtPRParcelNo.text = billDetails.get(1).toString();
                        txtPRParcelDet.text = billDetails.get(2).toString();
                        purcDate = dutils.normalFormatDate(billDetails.get(3).toString());
                        txtPRTotQty.text = billDetails.get(4).toString();
                        txtPRTotItems.text = billDetails.get(5).toString();                        
                        txtPRTotal.text = billDetails.get(6).toString();
                        txtMiscCost.text = billDetails.get(8).toString();
                        txtPRSchDiscount.text = billDetails.get(9).toString();
                        purcRetTab.purchaseCalculations();
                        updateValues();
                    } else {
                        resetPurcRetValues();
                    }
                }
            }
        } catch (ex: Exception) {
            var ss = " Class : PurchaseReturn   Method: savePurchase    Exception : {ex}";
            
            log.debug(ss);
        }
    }

    function back(): Void {
        resetPurcRetValues();
        getAutoVal = commonController.getAutoIncrement(pRetDate, "PurchaseReturn");
        btnPRSave.disable = false;
        btnPRSave.text = "Save [F3]";
        btnPREdit.text = "Edit [F6]";
        btnPRCancel.text = "Cancel [F8]";
        imgCancel.image = imageCancel;
        txtPRNo.editable = false;
        txtPRInvNo.editable = true;
        txtPRInvNo.requestFocus();
    }

    function checkValid(): Integer {
        var retVal = 0;
        var invoiceNo = txtPRInvNo.rawText;
        var retNo = txtPRNo.rawText;
        var suppName = txtPRSuppName.rawText;
        var tVal: Integer = 2;
        tVal = purcRetTab.nullVal;
        var prInDate: Date = dutils.normalStringToDate(txtPRInvDate.rawText);
        var prRtDate: Date = dutils.normalStringToDate(txtPRRetDate.rawText);
        if (retNo.equals("") or retNo == null or retNo.trim().length() < 0) {
            retVal = 1;
            FXinfo("Please select a Purchase Return Number", txtPRNo);
        } else if (invoiceNo.equals("") or invoiceNo == null or invoiceNo.trim().length() < 0) {
            retVal = 1;
            FXinfo("Please enter Invoice Number", txtPRInvNo);
        } else if (suppName == null or suppName == "" or suppName.trim().length() < 0) {
            retVal = 1;
            FXinfo("Please select a Distributor Name", txtPRSuppName);
        } else if (prRtDate.compareTo(prInDate) < 0) {
            retVal = 1;
            FXinfo("Purchase Return Date Must be Enter after Invoice Date. ");
            txtPRRetDate.requestFocus();
        } else if(txtPRRoundAmt.text.equals("") or (not txtPRRoundAmt.text.equals("") and ( Double.parseDouble(txtPRRoundAmt.text) > 9 or Double.parseDouble(txtPRRoundAmt.text) < -9)) ) {
                retVal = 1;
                FXinfo("Round off value entered is incorrect. Please check",txtPRRoundAmt);
        } else if (tVal == 0) {
            FXinfo("Please enter table values");
            purcRetTab.focusSet();
            updateValues();
            retVal = 1;
        } else {
            retVal = 0;
        }
        return retVal;
    }

    function savePurcRet(): Void {
        var pRModel = new PurchaseModel();
        var returnObject = new Object();
        var msgReturnModel: MsgReturnModel = new MsgReturnModel();
        var check = checkValid();
        if (check == 0) {
            try {
                pRModel.setInvoiceNo(txtPRInvNo.rawText);
                pRModel.setPurcRBillno(txtPRNo.rawText);
                pRModel.setInvDate(dutils.changeFormatDate(txtPRInvDate.rawText));
                pRModel.setPurcRBillDate(dutils.changeFormatDate(txtPRRetDate.rawText));
                pRModel.setDistName(txtPRSuppName.rawText);
                pRModel.setDistCode(txtPRSuppCode.rawText);
                pRModel.setParcelNO(txtPRParcelNo.rawText);
                pRModel.setParcelDetails(txtPRParcelDet.rawText);
                pRModel.setPurcType("");
                pRModel.setSubTotal(Double.parseDouble(txtPRSubTotal.rawText));
                pRModel.setSchDisc(Double.parseDouble(txtPRSchDiscount.rawText));
                pRModel.setTotAmount(Double.parseDouble(txtPRTotal.rawText));
                pRModel.setTotDisc(value.Round(Double.parseDouble(txtPRDiscount.rawText), 2));
                pRModel.setTotVat(value.Round(Double.parseDouble(txtPRVAT4.rawText), 2));
                pRModel.setPaidAmount(Double.parseDouble("0"));
                pRModel.setBalAmount(Double.parseDouble(txtMiscCost.rawText.trim()));
                pRModel.setTotQuantity(Integer.parseInt(txtPRTotQty.rawText));
                pRModel.setTotItem(Integer.parseInt(txtPRTotItems.rawText));
                pRModel.setListofitems(purcRetTab.getPurchaseReturnBill());
                pRModel.setLogText("Save");
                pRModel.setModuleName("PurchaseReturn");
                pRModel.setActionType("save");
                //Controller Call
                returnObject = purchaseCont.createRecordPR(pRModel);
                msgReturnModel = returnObject as MsgReturnModel;
                purcRetTab.focusSet(msgReturnModel.getRowCount(), msgReturnModel.getColumnCount());
                if (msgReturnModel.getReturnMessage() == "0") {
                    FXalert(Integer.parseInt(msgReturnModel.getReturnMessage()));
                    purchaseCont.updateLog(pRModel);
                    showDebitNote(0);
                    resetPurcRetValues();
                } else {
                    FXinfo(msgReturnModel.getReturnMessage());
                }
            } catch (ex: Exception) {
                var ss = " Class : PurchaseReturn   Method: savePurchase    Exception : {ex}";                
                log.debug(ss);
            }
        }
    }

    function editPurcRet(): Void {
        if (btnPREdit.text == "Edit [F6]") {
            resetPurcRetValues();
            listPurRet.visible = false;
            getAutoVal = "";
            txtPRInvNo.editable = false;
            btnPRSave.disable = true;
            btnPRCancel.text = "Back [Ctrl+Left]";
            imgCancel.image = imageBack;
            btnPREdit.text = "Update [F7]";
            txtPRNo.editable = true;
            txtPRNo.requestFocus();
        } else if (btnPREdit.text == "Update [F7]") {
            updatePRValues();
        }
    }

    function updatePRValues(): Void {
        var pRModel = new PurchaseModel();
        var returnObject = new Object();
        var msgReturnModel: MsgReturnModel = new MsgReturnModel();
        var check = checkValid();
        if (check == 0) {
            try {
                pRModel.setInvoiceNo(txtPRInvNo.rawText);
                pRModel.setPurcRBillno(txtPRNo.rawText);
                pRModel.setInvDate(dutils.changeFormatDate(txtPRInvDate.rawText));
                pRModel.setPurcRBillDate(dutils.changeFormatDate(txtPRRetDate.rawText));
                pRModel.setDistName(txtPRSuppName.rawText);
                pRModel.setDistCode(txtPRSuppCode.rawText);
                pRModel.setParcelNO(txtPRParcelNo.rawText);
                pRModel.setParcelDetails(txtPRParcelDet.rawText);
                pRModel.setPurcType("");
                pRModel.setSubTotal(Double.parseDouble(txtPRSubTotal.rawText));
                pRModel.setSchDisc(Double.parseDouble(txtPRSchDiscount.rawText));
                pRModel.setTotAmount(Double.parseDouble(txtPRTotal.rawText));
                pRModel.setTotDisc(value.Round(Double.parseDouble(txtPRDiscount.rawText), 2));
                pRModel.setTotVat(value.Round(Double.parseDouble(txtPRVAT4.rawText), 2));
                pRModel.setPaidAmount(Double.parseDouble("0"));
                pRModel.setBalAmount(Double.parseDouble(txtMiscCost.rawText.trim()));
                pRModel.setTotQuantity(Integer.parseInt(txtPRTotQty.rawText));
                pRModel.setTotItem(Integer.parseInt(txtPRTotItems.rawText));
                pRModel.setListofitems(purcRetTab.getPurchaseReturnBill());
                pRModel.setLogText("Update");
                pRModel.setModuleName("PurchaseReturn");
                pRModel.setActionType("update");
                //Controller Call
                returnObject = purchaseCont.updateRecordPR(pRModel);
                msgReturnModel = returnObject as MsgReturnModel;
                purcRetTab.focusSet(msgReturnModel.getRowCount(), msgReturnModel.getColumnCount());
                if (msgReturnModel.getReturnMessage() == "1") {
                    var cn: ConfirmDialogBox = new ConfirmDialogBox(0, "Purchase Return");
                    var a = bind cn.staus;
                    if (a) {
                        returnObject = purchaseCont.createRecordPR(pRModel);
                        msgReturnModel = returnObject as MsgReturnModel;
                        if (msgReturnModel.getReturnMessage() == "0") {
                            purchaseCont.updateLog(pRModel);
                            showDebitNote(1);
                            resetPurcRetValues();
                            FXalert(4);
                            cn.staus = false;
                        }
                    }
                } else {
                    FXinfo(msgReturnModel.getReturnMessage());
                }
            } catch (ex: Exception) {
                var ss = " Class : PurchaseReturn   Method: updatePRValues    Exception : {ex}";
                log.debug(ss);
            }
        }
    }

    function resetPurcRetValues(): Void {
        mandatory_textboxws();        
        purcRetTab.clearData();
        txtPRSuppName.text = "";
        txtPRInvNo.text = "";
        txtPRSuppCode.text = "";
        txtPRDLNo.text = "";
        txtPRTINNo.text = "";
        txtPRAddress.text = "";
        txtPRParcelNo.text = "";
        txtPRParcelDet.text = "";
        txtPRTotItems.text = "0";
        txtPRTotQty.text = "0";
        txtPRVAT4.text = "";
        txtPRDiscount.text = "";
        txtPRRoundAmt.style = "";
        txtPRRoundAmt.text = "";
        netAmt = 0;
        txtPRFree.text = "0";
        txtPRSchDiscount.text = "0";
        txtPRTotal.text = "";
        txtPRSubTotal.text = "0.00";
        txtPRBalance.text = "";
        txtMiscCost.text = "0";
        txtPRNetPaid.text = txtPRSubTotal.rawText;
        getAutoVal = commonController.getAutoIncrement(pRetDate, "PurchaseReturn");
        purcDate = "";
        pRetDate = dutils.now("dd-MM-yyyy");
        if (btnPREdit.text == "Edit [F6]") { txtPRSuppName.requestFocus(); } else { txtPRNo.requestFocus(); getAutoVal = ""; }
        updateValues();
    }

    var chkIsEdit = bind btnPRSave.disable on replace {
        if (chkIsEdit) {
            extra = 20.0;
        } else {
            extra = 0.0;
        }
    }
    var visit = bind fxCalendar.visible on replace {
        if (dateFlag and not visit) {
            pRetDate = fxCalendar.getSelectedDate();
            dateFlag = false;
            txtPRSuppName.requestFocus();
        }
    };

    function updateValues(): Void {
            updateIntValues("");
    }
    var roundVal:Double = 0.0;
    function updateIntValues(type:String): Void {
        try {
            roundVal = 0.00;
            var schDist = 0.00;
            var miscCost = 0.00;
            if(txtPRSchDiscount.rawText.equals("")) {               
            }
            else {
                schDist = Double.parseDouble(txtPRSchDiscount.rawText);
            }          
            if(txtMiscCost.rawText.trim().equals("")) {
            }
            else {
                miscCost = Double.parseDouble(txtMiscCost.rawText.trim());
            }
            var ta: Double = value.Round(purcRetTab.totPurcAmt, 2);
            var tda: Double = value.Round(purcRetTab.totPurcDistAmt, 2);
            var tvat4: Double = value.Round(purcRetTab.totPurcVAT4Amt, 2);
//            netAmt = (ta - tda) + tvat4;
            txtPRSubTotal.text = "{ta}";
            txtPRTotQty.text = "{purcRetTab.totPurcQty}";
            txtPRTotItems.text = "{purcRetTab.totPurcItems}";
            txtPRFree.text = "{purcRetTab.totPurcFreeQty}";
            txtPRDiscount.text = "{value.Round(tda)}";
            txtPRVAT4.text = "{value.Round(tvat4)}";
            //Rounded Process            
                if(type.equals("roundOff") and not txtPRRoundAmt.text.equals("") ) {                    
                    netAmt = ((ta - tda) - schDist) + tvat4 + miscCost;
                    roundVal = netAmt + Double.parseDouble(txtPRRoundAmt.text) ;
                } else if(btnPREdit.text == "Update [F7]" and txtPRTotal.text != null and txtPRTotal.text.trim().equals("0.000") ) {                    
                    roundVal = netAmt;
                    netAmt = ((ta - tda) - schDist) + tvat4 + miscCost;
                    txtPRRoundAmt.text = "{ value.Round((roundVal - netAmt), 2) }" ;
                } else {                    
                    netAmt = ((ta - tda) - schDist) + tvat4 + miscCost;
                    roundVal = value.roundToWholeVal(netAmt);
                    txtPRRoundAmt.text = "{ value.Round((roundVal - netAmt), 2) }" ;
                }                
            txtPRTotal.text = value.Round(roundVal);
//            txtPRTotal.text = Value.Round(netAmt);
        } catch (ex: Exception) {
            log.debug("Class : PurchaseReturn Fx Form  Method: UpdateValues() Exception:{ex}");
        }
    }

    var logUser = bind CommonDeclare.user on replace {
        getPrivileges(logUser); updateValues();
    }
    var changPiv = bind btnPREdit.text on replace {
        getPrivileges(logUser); updateValues();
    }

    function getPrivileges(u: String): Void {
        var uname = u;
        var utype = commonController.getUserType(uname);
        if (utype.equals("User")) {
            var priv = commonController.getPrivileges("inventory", uname);
            var ss = priv.split(",");
            var val = Integer.parseInt(ss[2]);
            if (val == 1) {
                btnPRSave.disable = true;
                if (btnPREdit.text == "Update [F7]") {
                    btnPREdit.disable = true;
                } else {
                    btnPREdit.disable = false;
                }
            } else if (val == 2) {
                if (btnPREdit.text != "Update [F7]") {
                    btnPRSave.disable = false;
                }
                btnPREdit.disable = false;
            } else if (val == 3) {
                if (btnPREdit.text != "Update [F7]") {
                    btnPRSave.disable = false;
                }
                btnPREdit.disable = false;
            }
        } else {
            if (btnPREdit.text != "Update [F7]") {
                btnPRSave.disable = false;
            }
            btnPREdit.disable = false;
        }
    }

    public function showDebitNote(i: Integer): Void {
        var DBNoteDetails = commonController.getQueryValue("SELECT details FROM debit_note WHERE invoiceorbill_no='{txtPRInvNo.rawText}' and debit_note_no='{pr_DBNo}'");
        if (i == 0 or pr_DBNo == "" or pr_DBNo.length() <= 0) {
            pr_DBNo = commonController.getAutoIncrement(pRetDate, "DebitNotes");
            ReturnNotes.setValues([pr_DBNo, dutils.now("dd-MM-yyyy"), "{txtPRSuppName.rawText}", txtPRInvNo.rawText, txtPRTotal.rawText, DBNoteDetails, "{i}"]);
        } else if (i == 1) {
            ReturnNotes.setValues([pr_DBNo, dutils.now("dd-MM-yyyy"), "{txtPRSuppName.rawText}", txtPRInvNo.rawText, txtPRTotal.rawText, DBNoteDetails, "{i}"]);
        }
        panelRetrnNotes.visible = true;
        ReturnNotes.Show();
    }

    function mandatory_textboxws(): Void {
        txtPRSuppName.style = mandatory;
        txtPRInvNo.style = mandatory;
        txtPRNo.style = mandatory;
    }

    public function startUp(): Void {
        mandatory_textboxws();
        panel.visible = true;
        fxCalendar.visible = false;
        getAutoVal = commonController.getAutoIncrement(pRetDate, "PurchaseReturn");

        (purcRetTable as javax.swing.JTable).addKeyListener(KeyAdapter {
            override public function keyTyped(e: java.awt.event.KeyEvent): Void {
                purcRetTab.purchaseCalculations();
                updateValues();
            }
            override public function keyReleased(e: java.awt.event.KeyEvent): Void {
                purcRetTab.purchaseCalculations();
                updateValues();
            }
        });

        (purcRetTable as javax.swing.JTable).getSelectionModel().addListSelectionListener(ListSelectionListener {
            override public function valueChanged(e: javax.swing.event.ListSelectionEvent): Void {
                updateValues();
            }
        });

        PurcRetCalPanel.content = [fxCalendar];
        panelTable.content = [PurcReturnTable];
        getPrivileges(logUser);
        updateValues();
        delete  panelRetrnNotes.content;
        ReturnNotes.panel.visible = false;
        insert ReturnNotes.panel into panelRetrnNotes.content;
        txtPRInvNo.requestFocus();
    }

}