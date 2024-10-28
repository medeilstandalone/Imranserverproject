package com.vanuston.medeil.ui;

import java.lang.Class;
import com.vanuston.medeil.uitables.VATTableHelper;
//import medil.utilities.GetSelectClass;
import javafx.ext.swing.SwingComponent;
import java.awt.Dimension;
import javax.swing.JTable;
import java.awt.event.MouseEvent;
import java.awt.event.MouseAdapter;
import com.vanuston.medeil.util.Value;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import com.vanuston.medeil.ui.calendar.theme.Theme;
import com.vanuston.medeil.util.DateUtils;
import java.io.File;
import java.util.HashMap;
import java.lang.Exception;
import com.vanuston.medeil.util.ReportPanel;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.uitables.VATTableHelperPur;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.model.VatRegisterModel;
import com.vanuston.medeil.implementation.VatRegister; 
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import java.util.ArrayList;
import java.util.List;

public class VATReport {

    var log: Logger = Logger.getLogger(VATReport.class, "Reports");


    var frmFlag: Boolean = false;
    var toFlag: Boolean = false;
    var fxCalendar = FXCalendar {
                theme: Theme {};
            };
    var vat = new VATTableHelper();
    var vatpur = new VATTableHelperPur();
    var repV = new ReportPanel();
//    var supp = new GetSelectClass();
    var table; //=  vat.createTable(rowNo, colNames, colType, colEditable, colWidth);
    var tableComp: SwingComponent;  //= SwingComponent.wrap(table);
    var tableComp1: SwingComponent;
    var tabSel: Integer;
    var get3;
    public var chkList: Boolean;
    public var headVal: Boolean;
    public var selRep: Integer;
    var dir1 = new File(".");
    var path: String = dir1.getCanonicalFile().toString();
    def CustomAlert = CustomAlert {};
    var panelW = bind CommonDeclare.panelFormW;
    var panelH = bind CommonDeclare.panelFormH;
    var bottonW = bind CommonDeclare.bottonW;
    var bottonH = bind CommonDeclare.bottonH;
    var panelTableLY = 135.0;
    var panelCalenderLX: Number;
    var panelCalenderLY: Number;

    function changeTableSize(i: Integer, j: Integer): Void {
        tableComp.getJComponent().setPreferredSize(new Dimension(i, j));
        tableComp1.getJComponent().setPreferredSize(new Dimension(i, j));
    }

    var TableW = bind (95.29860229 * panelW) / 100 on replace { changeTableSize(TableW, TableH); };
    var TableH = 305.0 on replace { changeTableSize(TableW, TableH); };
    var panelTableLX = bind (panelW - TableW) / 2 on replace {
    }
    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    var salesWiseVatLX = bind (7.242693774 * panelW / 100);
    var productWiseVatLX = bind (23.50698856 * panelW / 100);
    var percentageWiseVatLX = bind (43.55527319 * panelW / 100);
    var fromLX = bind (64.9682338 * panelW / 100);
    var toLX = bind (64.9682338 * panelW / 100);
    var fromDateLX = bind (71.95679797 * panelW / 100);
    var toDateLX = bind (71.95679797 * panelW / 100);
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;
    var imageCalenderLX = bind fromDateLX + Type3TextboxW + 10;
    var groupPerLX = bind (41.93138501 * panelW / 100);
    var netTotalLX = bind (50.82592122 * panelW / 100);
    var buttonLx = bind (80.68614994 * panelW / 100);

    var  vatregisterController: VatRegister = RegistryFactory.getClientStub(RegistryConstants.VatRegister) as com.vanuston.medeil.implementation.VatRegister;
    var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    //vatregisterController = RegistryFactory.getClientStub(RegistryConstants.VatRegister) as com.vanuston.medeil.implementation.VatRegister;
    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("VAT Report", msg);
        showAlertbox();
    }

    def RepViewer = ReportViewer {
                heading: bind label.text;
            };
    var selItem = bind cboAcType.selectedItem on replace {
        if ((not txtTo.text.equals('')) and (not txtFrom.text.equals('')))
            cboSelectWText();
    };
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    def __layoutInfo_listView: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind TableW
        height: bind TableH
    }
    public-read def listView: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: 0.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_listView
        items: null
        cellFactory: null
    }
    
    def __layoutInfo_panelTable: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
    }
    public-read def panelTable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelTableLX
        layoutY: bind panelTableLY
        layoutInfo: __layoutInfo_panelTable
        content: [ listView, ]
    }
    
    public-read def rectTableBorder: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        layoutX: bind panelTableLX
        layoutY: bind panelTableLY
        styleClass: "rectTableBorder"
        width: bind TableW
        height: bind TableH
    }
    
    public-read def panelCalendar: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelCalenderLX
        layoutY: bind panelCalenderLY
    }
    
    def __layoutInfo_cboAcType: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 75.0
    }
    public-read def cboAcType: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: 70.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_cboAcType
        items: bind VATPercent
    }
    
    public-read def vbox: javafx.scene.layout.VBox = javafx.scene.layout.VBox {
        spacing: 6.0
    }
    
    public-read def panelButtons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutY: 490.0
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
    }
    
    public-read def Violet: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.011764706
        green: 0.5019608
        blue: 0.7607843
    }
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
    }
    
    def __layoutInfo_txtTo: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtTo: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        disable: false
        layoutX: bind toDateLX
        layoutY: 27.0
        layoutInfo: __layoutInfo_txtTo
        styleClass: "text-box"
        text: ""
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtFrom: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtFrom: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        disable: false
        layoutX: bind fromDateLX
        layoutY: 0.0
        layoutInfo: __layoutInfo_txtFrom
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
    
    def __layoutInfo_txtVATAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 100.0
    }
    public-read def txtVATAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 220.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_txtVATAmt
        text: "0.00"
        font: Arial_Bold_14
    }
    
    def __layoutInfo_txtSalesAmt: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 100.0
    }
    public-read def txtSalesAmt: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: 80.0
        layoutInfo: __layoutInfo_txtSalesAmt
        text: "0.00"
        font: Arial_Bold_14
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
    
    public-read def rdoPercentagewise: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: bind percentageWiseVatLX
        layoutY: 0.0
        onMouseClicked: rdoPercentagewiseOnMouseClicked
        text: "Percentagewise VAT"
        font: Arial_12
        toggleGroup: toggleGroup
        selected: false
    }
    
    public-read def rdoProductwise: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: bind productWiseVatLX
        layoutY: 0.0
        onMouseClicked: rdoProductwiseOnMouseClicked
        text: "Productwise  VAT"
        font: Arial_12
        toggleGroup: toggleGroup
    }
    
    public-read def rdoSaleswise: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: bind salesWiseVatLX
        layoutY: 0.0
        onMouseClicked: rdoSaleswiseOnMouseClicked
        text: "Saleswise VAT"
        font: Arial_12
        toggleGroup: toggleGroup
    }
    
    public-read def Arial_25: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
        size: 25.0
    }
    
    def __layoutInfo_label: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
    }
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutInfo: __layoutInfo_label
        text: "VAT Report - ctrl+V"
        font: Arial_25
        hpos: javafx.geometry.HPos.CENTER
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
    
    public-read def label6: javafx.scene.control.Label = javafx.scene.control.Label {
        opacity: 0.7
        layoutY: 15.0
        text: "VAT 12.5%"
        font: Arial_Bold_16
        textFill: DarkGray
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        opacity: 0.7
        layoutY: 15.0
        text: "TOTAL VAT"
        font: Arial_Bold_16
        textFill: DarkGray
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 10.0
        layoutY: 3.0
        text: "Net Total"
        font: Arial_Bold_14
        textFill: DarkGray
    }
    
    public-read def panelNetTotal: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind netTotalLX
        layoutY: 442.0
        content: [ label2, txtSalesAmt, txtVATAmt, ]
    }
    
    public-read def labelPercentage: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 0.0
        text: "Percentage"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def groupPercent: javafx.scene.Group = javafx.scene.Group {
        visible: false
        layoutX: 330.0
        layoutY: 27.0
        content: [ labelPercentage, cboAcType, ]
    }
    
    public-read def labelAddress: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind fromLX
        layoutY: -2.0
        text: "From"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelBranch: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind toLX
        layoutY: 27.0
        text: "To"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 0.25
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "rectFormHeader"
        fill: DarkGray
        stroke: null
        width: bind panelW
        height: 32.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def panelheader: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ rectHeader, label, ]
    }
    
    public-read def rectBg: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 1.0
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "form-background"
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
    
    public-read def Yellow: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.95
        green: 0.94
        blue: 0.86
    }
    
    public-read def imageCalendar: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Calender.png"
    }
    
    public-read def imgTo: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind imageCalenderLX
        layoutY: 27.0
        onMouseClicked: imgToOnMouseClicked
        image: imageCalendar
    }
    
    public-read def imgFrom: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: true
        disable: false
        layoutX: bind imageCalenderLX
        layoutY: 1.0
        onMouseClicked: imgFromOnMouseClicked
        image: imageCalendar
        x: 0.0
    }
    
    def __layoutInfo_panelpage: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
        height: 80.0
    }
    public-read def panelpage: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutY: 80.0
        layoutInfo: __layoutInfo_panelpage
        content: [ labelBranch, labelAddress, txtFrom, txtTo, rdoSaleswise, rdoProductwise, rdoPercentagewise, imgFrom, imgTo, panelCalendar, groupPercent, ]
    }
    
    public-read def Arial_Bold_40: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 40.0
    }
    
    def __layoutInfo_label12PercentTotal: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 385.0
    }
    public-read def label12PercentTotal: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 380.0
        layoutInfo: __layoutInfo_label12PercentTotal
        graphic: label6
        text: "0.00"
        font: Arial_Bold_40
        hpos: javafx.geometry.HPos.LEFT
    }
    
    public-read def label4PercentTotal: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 30.0
        layoutY: 0.0
        graphic: label4
        text: "0.00"
        font: Arial_Bold_40
    }
    
    public-read def hbox: javafx.scene.layout.HBox = javafx.scene.layout.HBox {
        layoutX: 30.0
        content: [ label4PercentTotal, label12PercentTotal, ]
        spacing: 30.0
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.87058824
        green: 0.8392157
        blue: 0.8392157
    }
    
    public-read def toggleGroup2: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def rdoPurchaseVAT: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: bind productWiseVatLX
        layoutY: 45.0
        onMouseClicked: rdoPurchaseVATOnMouseClicked
        text: "Purchase VAT"
        toggleGroup: toggleGroup2
    }
    
    public-read def rdoSalesVAT: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: bind salesWiseVatLX
        layoutY: 45.0
        onMouseClicked: rdoSalesVATOnMouseClicked
        text: "Sales VAT"
        toggleGroup: toggleGroup2
    }
    
    public-read def imageReprt: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Report1.png"
    }
    
    public-read def imageView5: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageReprt
        fitWidth: 36.0
        fitHeight: 36.0
    }
    
    def __layoutInfo_btnCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind buttonLx
        layoutY: 0.0
        layoutInfo: __layoutInfo_btnCancel
        onMouseClicked: btnCancelOnMouseClicked
        effect: reflectionEffect
        graphic: imageView5
        text: "Report"
        font: Arial_Bold_14
    }
    
    public-read def panelAmount: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutY: 470.0
        content: [ vbox, hbox, btnCancel, ]
    }
    
    def __layoutInfo_panelMain: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
        height: bind panelH
    }
    public-read def panelMain: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutInfo: __layoutInfo_panelMain
        content: [ rectBg, panelheader, panelTable, rectTableBorder, rdoSalesVAT, rdoPurchaseVAT, panelpage, panelNetTotal, panelAmount, panelButtons, panelAlert, ]
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panelMain, panel, ]
    }
    // </editor-fold>//GEN-END:main

    function rdoPurchaseVATOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        rdoSaleswise.text = "Distributorwise VAT";
        txtSalesAmt.visible = false;
        label2.layoutX = txtSalesAmt.layoutX;
        showhideCheks();
    }

    function rdoSalesVATOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        rdoSaleswise.text = "Customerwise VAT";
        txtSalesAmt.visible = true;
        label2.layoutX = 10;
        label2.layoutY = 3;
        showhideCheks();
    }

    //var commonController: CommonImplements = new CommonController();
    var VATPercent = commonController.getListItems("", "", "VAT").toArray();
    //var VATPercent: String[] = getIn.getVatDetails();
    var rdoPercent = bind rdoPercentagewise.selected on replace {
        groupPercent.visible = rdoPercent;
    }
    var get1;
    var get2;
    var isCustomer = true;
    var sd: String;
    var ed: String;

//var vatval=Double.parseDouble(selItem.toString());
    public function valueCheck(): Integer {
        var vatregisterBean: VatRegisterModel = new VatRegisterModel();
        //vatregisterController = RegistryFactory.getClientStub(RegistryConstants.VatRegister) as com.vanuston.medeil.implementation.VatRegister;
        var reVal: Integer = 0;
        if (rdoSalesVAT.selected) {            
            if(txtFrom.text==null or txtFrom.text=="" or txtTo.text==null or txtTo.text=="" )
            {                
            vatregisterBean.setInvoicefromdate('0000-00-00');
            vatregisterBean.setInvoicetodate('0000-00-00');
            }
            else if(txtFrom.text!=null or txtFrom.text!="" or txtTo.text!=null or txtTo.text!="" )
            {
            vatregisterBean.setInvoicefromdate(DateUtils.changeFormatDate(txtFrom.rawText));
            vatregisterBean.setInvoicetodate(DateUtils.changeFormatDate(txtTo.rawText));
            }
            if(rdoSaleswise.selected){
            vatregisterBean.setVattype('sales');
            }else if(rdoProductwise.selected){
            vatregisterBean.setVattype('product');
            }else if(rdoPercentagewise.selected){
            vatregisterBean.setVattype('percent');
            if(not cboAcType.selectedItem.toString().equals("---Select---")) {
            vatregisterBean.setVatpercent(Double.valueOf(cboAcType.selectedItem.toString()));
            }
            }
           
            vatregisterBean.setVatmode('SalesVAT');
            //var vatregisterController: VatRegister = new VatRegisterController();
            var getchk = vatregisterController.viewRecord(vatregisterBean);
            
            if (getchk.equals(true)) {
                reVal = 1;
            } else {
                reVal = 0;
            }
            
        } else if (rdoPurchaseVAT.selected) {
           if(txtFrom.text==null or txtFrom.text=="" or txtTo.text==null or txtTo.text=="" )
            {
            vatregisterBean.setInvoicefromdate('0000-00-00');
            vatregisterBean.setInvoicetodate('0000-00-00');
            }
            else if(txtFrom.text!=null or txtFrom.text!="" or txtTo.text!=null or txtTo.text!="" )
            {
            vatregisterBean.setInvoicefromdate(DateUtils.changeFormatDate(txtFrom.rawText.trim()));
            vatregisterBean.setInvoicetodate(DateUtils.changeFormatDate(txtTo.rawText.trim()));
            }
            if(rdoSaleswise.selected){
            vatregisterBean.setVattype('distributor');
            }else if(rdoProductwise.selected){
            vatregisterBean.setVattype('product');
            }else if(rdoPercentagewise.selected){
             vatregisterBean.setVattype('percent');
            if(not cboAcType.selectedItem.toString().equals("---Select---")) {
            vatregisterBean.setVatpercent(Double.valueOf(cboAcType.selectedItem.toString()));
            }
            }
            vatregisterBean.setVatmode('PurchaseVAT');
            //var vatregisterController: VatRegister = new VatRegisterController();
            var getchk = vatregisterController.viewRecord(vatregisterBean);
            
            if (getchk.equals(true)) {
                reVal = 1;
            } else {
                reVal = 0;
            }
            }
         return reVal;
        }
   
 public function hideBtn(val:Boolean):Void
 {
     if(val==true){
         btnCancel.disable=true;
     }
     else{
         btnCancel.disable=false;
     }
 }

    public function onLoad(s: String, e: String): Void {
        var vatregisterBean: VatRegisterModel = new VatRegisterModel();
        //vatregisterController = RegistryFactory.getClientStub(RegistryConstants.VatRegister) as com.vanuston.medeil.implementation.VatRegister;
        if (valueCheck() == 0) {
            listView.visible=true;
            hideBtn(true);
            //chkList = true;
            FXinfo("No Data in Specific Date(s)");
        } else if (not selItem.equals("") and not selItem.equals("---Select---") and selItem != null and rdoSalesVAT.selected) {
            hideBtn(false);
            vatregisterBean.setInvoicefromdate(s);
            vatregisterBean.setInvoicetodate(e);
            vatregisterBean.setVattype('percent');
            vatregisterBean.setVatpercent(Double.parseDouble(selItem.toString()));
            vatregisterBean.setVatmode('SalesVAT');
            //var vatregisterController: VatRegister = new VatRegisterController();
            get3 = vatregisterController.viewAllRecord(vatregisterBean) as VatRegisterModel;
            //get3 = supp.getVATALL(s, e, 'percent', Double.parseDouble(selItem.toString()), 'SalesVAT');
            chkList = false;
            if (valueCheck() == 1) {
                //chkList = false;
            //FXinfo("No Data in Specific Date(s)");
            }
        } else if (not selItem.equals("") and not selItem.equals("---Select---") and selItem != null and rdoPurchaseVAT.selected) {
            hideBtn(false);
            vatregisterBean.setInvoicefromdate(s);
            vatregisterBean.setInvoicetodate(e);
            vatregisterBean.setVattype('percent');
            vatregisterBean.setVatpercent(Double.parseDouble(selItem.toString()));
            vatregisterBean.setVatmode('PurchaseVAT');
            //var vatregisterController: VatRegister = new VatRegisterController();
            get3 = vatregisterController.viewAllRecord(vatregisterBean);            
            chkList = false;
            if (valueCheck() == 1) {
                //chkList = false;
            //FXinfo("No Data in Specific Date(s)");
            }
        } else if (rdoSaleswise.selected and rdoSalesVAT.selected) {
            hideBtn(false);
            {
                vatregisterBean.setInvoicefromdate(s);
                vatregisterBean.setInvoicetodate(e);
                vatregisterBean.setVattype('sales');
                vatregisterBean.setVatpercent(0.0);
                vatregisterBean.setVatmode('SalesVAT');
                //var vatregisterController: VatRegister = new VatRegisterController();
                get1 = vatregisterController.viewAllRecord(vatregisterBean);
            }

        } else if (rdoSaleswise.selected and rdoPurchaseVAT.selected) {
            hideBtn(false);
            vatregisterBean.setInvoicefromdate(s);
            vatregisterBean.setInvoicetodate(e);
            vatregisterBean.setVattype('distributor');
            vatregisterBean.setVatpercent(0.0);
            vatregisterBean.setVatmode('PurchaseVAT');
            //var vatregisterController: VatRegister = new VatRegisterController();
            get1 = vatregisterController.viewAllRecord(vatregisterBean);            
            if (valueCheck() == 1) {
            
            }
            } else if (rdoProductwise.selected and rdoSalesVAT.selected) {
                hideBtn(false);
            vatregisterBean.setInvoicefromdate(s);
            vatregisterBean.setInvoicetodate(e);
            vatregisterBean.setVattype('product');
            vatregisterBean.setVatpercent(0.0);
            vatregisterBean.setVatmode('SalesVAT');
            //var vatregisterController: VatRegister = new VatRegisterController();
            get2 = vatregisterController.viewAllRecord(vatregisterBean);
            //            if (get2.getCustomerName() == null) {
            if (valueCheck() == 1) {
            //                listView.visible = true;
            //                FXinfo("No Data in Specific Date(s)");
            }
        } else if (rdoProductwise.selected and rdoPurchaseVAT.selected) {
            hideBtn(false);
            vatregisterBean.setInvoicefromdate(s);
            vatregisterBean.setInvoicetodate(e);
            vatregisterBean.setVattype('product');
            vatregisterBean.setVatpercent(0.0);
            vatregisterBean.setVatmode('PurchaseVAT');
            //var vatregisterController: VatRegister = new VatRegisterController();
            get2 = vatregisterController.viewAllRecord(vatregisterBean);
            //get2 = supp.getVATALL(s, e, 'product', 0.0, 'PurchaseVAT');
            if (valueCheck() == 1) {
            //            if (get2.getDistname() == null) {
//                            FXinfo("No Data in Specific Date(s)");
            }
        }
    }

    var textchange1 = bind txtFrom.rawText.trim() on replace {
        {
            if (txtTo.rawText == "" or txtTo.rawText == null) {
            } else {
                if (textchange1 == null) {
                    listView.visible = true;
                    hideBtn(true);
                } else {
                    onLoad(DateUtils.changeFormatDate(txtFrom.rawText.trim()), DateUtils.changeFormatDate(txtTo.rawText.trim()));
                    tableSelection(tabSel);
                    listView.visible = false;
                    hideBtn(false);
                }
                if (rdoSaleswise.selected and rdoSalesVAT.selected) {
                    {                        
                        if (valueCheck() == 0) {
                            listView.visible = true;
                            hideBtn(true);
                        } else {

                            vat.setValues(get1, 0);
                            vat.removeCustomerCol();
                            if (not isCustomer) {
                                vat.removeCustomerCol();
                                isCustomer = true;
                            }
                            hideBtn(false);
                        }
                    }
                } else if (rdoProductwise.selected and rdoSalesVAT.selected) {
                    if (valueCheck() == 0) {
                        listView.visible = true;
                        hideBtn(true);
                    } else {
                        vat.setValues(get2, 0);
                        vat.addCustomerCol();
                        isCustomer = false;
                        hideBtn(false);
                    }
                } else if (rdoPercentagewise.selected and rdoSalesVAT.selected) {
//                    if(cboAcType.selectedIndex!=0 or cboAcType.selectedIndex!=1)
                    {
                    if (valueCheck() == 0) {
                        listView.visible = true;
                        hideBtn(true);
                    } else {
                        vat.setValues(get3, 0);
                        vat.removeCustomerCol();
                        isCustomer = false;
                        hideBtn(false);
                    }
                }
//                else{
//                    FXinfo("Must You Select VAT Percent");
//                }
                }
                //Purchase
                if (rdoSaleswise.selected and rdoPurchaseVAT.selected) {
                    if (valueCheck() == 0) {
                        listView.visible = true;
                        hideBtn(true);
                    } else {
                        vatpur.setPurValues(get1, 0);
                        //vatpur.removePurprodqty();
                        if (not isCustomer) {
                            //vat.addCustomerCol();
                            vatpur.removePurprodqty();
                            isCustomer = true;
                            hideBtn(false);
                        }
                    }
                } else if (rdoProductwise.selected and rdoPurchaseVAT.selected) {
                    if (valueCheck() == 0) {
                        listView.visible = true;
                        hideBtn(true);
                    } else {
                        vatpur.setPurValues(get2, 0);
                        vatpur.addPurprodqtyCol() ;
                        //vat.removeCustomerCol();
                        //vatpur.removePurprodqty();
                        //vatpur.addPurprodqtyCol();
                        isCustomer = false;
                        hideBtn(false);
                    }
                } else if (rdoPercentagewise.selected and rdoPurchaseVAT.selected) {
//                    if(cboAcType.selectedIndex!=0 or cboAcType.selectedIndex!=1)
                    {
                    if (valueCheck()== 0) {
                        listView.visible = true;
                        hideBtn(true);
                    } else {
                        vatpur.setPurValues(get3, 0);
                        vatpur.removePurprodqty();
                        //vat.removeCustomerCol();
                        isCustomer = false;
                        hideBtn(false);
                    }
                }
                }
//                else
//                {
//                 FXinfo("Must You Select VAT Percent");
//                }

            }
        }
    }
    var textchange = bind txtTo.rawText.trim() on replace {
        {
            if (textchange == null) {
                listView.visible = true;
                hideBtn(true);
            } else {
                onLoad(DateUtils.changeFormatDate(txtFrom.rawText.trim()), DateUtils.changeFormatDate(txtTo.rawText.trim()));
                tableSelection(tabSel);
                listView.visible = false;
                hideBtn(false);
            }
            if (rdoSaleswise.selected and rdoSalesVAT.selected) {
                {
                    if (valueCheck() == 0) {
                            listView.visible = true;
                            hideBtn(true);
                        }  else {
                        vat.setValues(get1, 0);
                        vat.removeCustomerCol();
                        if (not isCustomer) {                           
                            isCustomer = true;
                            hideBtn(false);
                        }
                    }
                }
            } else if (rdoProductwise.selected and rdoSalesVAT.selected) {
                if (valueCheck() == 0) {
                    listView.visible = true;
                    hideBtn(true);
                } else {
                    vat.setValues(get2, 0);                   
                    vat.addCustomerCol();
                    isCustomer = false;
                    hideBtn(false);
                }

            } else if (rdoPercentagewise.selected and rdoSalesVAT.selected) {               
                if (valueCheck() == 0) {
                    listView.visible = true;
                    hideBtn(true);
                } else {
                    vat.setValues(get3, 0);
                    vat.removeCustomerCol();                    
                    isCustomer = false;
                }
            }            
            //Purchase
            if (rdoSaleswise.selected and rdoPurchaseVAT.selected) {
                if (valueCheck() == 0) {
                    listView.visible = true;
                    hideBtn(true);
                } else {
                    vatpur.setPurValues(get1, 0);
                    vatpur.removePurprodqty();
                    if (not isCustomer) {
                        //vat.addCustomerCol();
                        //vatpur.removePurprodqty();
                        isCustomer = true;
                    }
                }
            } else if (rdoProductwise.selected and rdoPurchaseVAT.selected) {
                if (valueCheck() == 0) {
                    //                if (get2.getDistname() == null) {
                    listView.visible = true;
                    hideBtn(true);
                } else {
                    vatpur.setPurValues(get2, 0);
                    //vat.removeCustomerCol();
                    vatpur.addPurprodqtyCol();
                    isCustomer = false;
                    hideBtn(false);
                }

            } else if (rdoPercentagewise.selected and rdoPurchaseVAT.selected) {
                if (valueCheck() == 0) {
                    listView.visible = true;
                    hideBtn(true);
                } else {
                    vatpur.setPurValues(get3, 0);
                    vatpur.removePurprodqty();                    
                    isCustomer = false;
                    hideBtn(false);
                }
            }            
        }
    }

    function rdoSaleswiseOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        try {
            selRep = 1;
            reset();
            groupPercent.visible=false;
            //cboAcType.disable=true;
            //cboAcType.visible = false;
            
//            labelPercentage.visible = false;
        } catch (ex: Exception) {
            var msg: String = "Class : Saleswise   : rdoSaleswiseOnMouseClicked   = {ex.getMessage()}";
            log.debug(msg);
        }
    }

    function rdoProductwiseOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        try {            
            reset();
            selRep = 2;
            groupPercent.visible=false;
            //cboAcType.disable=true;
            //cboAcType.visible = false;
            
//            labelPercentage.visible = false;
        } catch (ex: Exception) {
            var msg: String = "Class : Productwise   : rdoProductwiseOnMouseClicked   = {ex.getMessage()}";
            log.debug(msg);
        }
    }

    function rdoPercentagewiseOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        try {
            selRep = 3;
            reset();
            groupPercent.visible=true;
            //cboAcType.disable=false;
            cboAcType.select(0);
            //cboAcType.visible = true;
            labelPercentage.visible = true;
        } catch (ex: Exception) {
            var msg: String = "Class : Percentagewise   : rdoPercentagewiseOnMouseClicked   = {ex.getMessage()}";
            log.debug(msg);
        }
    }

    function cboSelectWText(): Void {
        try {                        
            onLoad(DateUtils.changeFormatDate(txtFrom.rawText.trim()), DateUtils.changeFormatDate(txtTo.rawText.trim()));
            tableSelection(tabSel);
            if (chkList or selItem.equals("") or selItem.equals("---Select---") or selItem == null and (not txtTo.text.equals('')) and (not txtFrom.text.equals(''))) {
                
                FXinfo("Plz Select the Any one VAT Percentage");
                listView.visible = true;
                hideBtn(true);
            } else if (chkList == false and valueCheck()==1) {
                
                if (rdoSalesVAT.selected) {
                    {                       
                        vat.setValues(get3, 0);
                        listView.visible=false;
                        vat.getvat = Double.parseDouble(selItem.toString());
                        hideBtn(false);                        
                    }
                } else if (rdoPurchaseVAT.selected) {
                    {
                        vatpur.setPurValues(get3, 0);
                        listView.visible = false;
                        vatpur.getvat = Double.parseDouble(selItem.toString());
                        hideBtn(false);
                    }
                }
            
            }else{
                listView.visible = true;
                hideBtn(true);
            }

        } catch (ex: Exception) {
            var msg: String = "Class : Select Percentage   : cboSelectWText   = {ex.getMessage()}";
            log.debug(msg);
        }

    }

    function imgFromOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        try {
            if(rdoPercentagewise.selected and cboAcType.selectedIndex==0)
            {
                FXinfo("Plz Select the Any one VAT Percentage");
                listView.visible=true;
                hideBtn(true);
            }
            else if (rdoSaleswise.selected or rdoPercentagewise.selected or rdoProductwise.selected and (rdoSalesVAT.selected or rdoPurchaseVAT.selected)) {
                panelCalendar.visible = true;
                toFlag = false;
                if (not frmFlag) {
                    panelCalenderLX = imgTo.layoutX - 218.0;
                    panelCalenderLY = imgTo.layoutY + 2;

                    if (txtFrom.rawText.trim() != null) {
                        var dat = txtFrom.rawText.trim().split("-");
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
                    frmFlag = true;
                } else {
                    fxCalendar.visible = false;
                }
//                listView.visible=false;
//                hideBtn(false);
            } else {
                FXinfo("Select the anyone option sales or product or percentage or Date(s) isn't blank");
            }
        } catch (ex: Exception) {
            var msg: String = "Class : From Date   : imgFromOnMouseClicked   = {ex.getMessage()}";
            log.debug(msg);
        }

    }

    function imgToOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        try {
            if(rdoPercentagewise.selected and cboAcType.selectedIndex==0)
            {
                FXinfo("Plz Select the Any one VAT Percentage");
                listView.visible=true;
                hideBtn(true);
            }
            else
            if (textchange1 == null or textchange1.length() == 0) {
                FXinfo("You must enter the from date or isn't blank");
            } else if (rdoSaleswise.selected or rdoPercentagewise.selected or rdoProductwise.selected and (rdoSalesVAT.selected or rdoPurchaseVAT.selected)) {
                panelCalendar.visible = true;
                frmFlag = false;
                if (not toFlag) {
                    panelCalenderLX = imgTo.layoutX - 218.0;
                    panelCalenderLY = imgTo.layoutY + 2;
                    if (txtTo.rawText.trim() != null) {
                        var dat = txtTo.rawText.trim().split("-");
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
                    toFlag = true;                   
                } else {
                    fxCalendar.visible = false;
                }
//                 listView.visible=false;
//                hideBtn(false);
            } else {
                FXinfo("Select the anyone option sales or product or percentage or Date(s) isn't blank");
            }
        } catch (ex: Exception) {
            var msg: String = "Class : To Date   : imgToOnMouseClicked   = {ex.getMessage()}";
            log.debug(msg);
        }
    }

    var visit = bind fxCalendar.visible on replace {
        if (frmFlag and not visit) {
            getDate(0);
        } else if (toFlag and not visit) {
            getDate(1);
        }
    };

    function getDate(i: Integer) {
        if (i == 0) {
            txtFrom.text = fxCalendar.getSelectedDate();
            frmFlag = false;
            toFlag = false;
            txtTo.requestFocus();
        } else if (i == 1) {
            txtTo.text = fxCalendar.getSelectedDate();
            toFlag = false;
            frmFlag = false;
        //txtTo.requestFocus();
        }
    }

    function insRep(): Void {
        delete  panel.content;
        insert RepViewer.getDesignRootNodes() into panel.content;
    }

    function salesvatInsert(): Void {
        var sales:List=new ArrayList();
        if (rdoSalesVAT.selected) {
            if (vat.tot == 0) {
//                FXinfo("Select any one value in the table or Date(s) isn't blank");
                FXinfo("Plz Click the Check Box to select the values");
            } else {
                try {
                    var image: String = '{path}/reportfiles/Medil Logo.png';
                    var params1 = new HashMap();
                    if (vat.isValidDateStr(txtFrom.rawText) or vat.isValidDateStr(txtTo.rawText)) {
                        if (selRep == 1) {
                            sales=vat.insertData();
                            vatregisterController.insertSalesVat(sales);
                       
                            insRep();
                            panel.visible = true;
                            params1.put("REPORTS_DIR", image);
                            RepViewer.showReport("/reportfiles/salewise_VAT.jasper", params1);
                            vat.truncateData(false);
                        } else {

                            sales=vat.insertData();
                            vatregisterController.insertSalesVat(sales);
                            insRep();
                            panel.visible = true;
                            RepViewer.showReport("/reportfiles/productwise_VAT.jasper", params1);
                            vat.truncateData(false);
                        }
                    }
                } catch (ex: Exception) {
                    var msg: String = "Class : Execute Report   : btnCancelOnMouseClicked   = {ex.getMessage()}";
                    log.debug(msg);
                }
                vat.tot=0;
            }
        } }

    function purchasevatInsert(): Void {
        var purchases:List=new ArrayList();
        if (rdoPurchaseVAT.selected) {
            if (vatpur.tot == 0) {
                FXinfo('Select any one value in the table or Date(s) isn''t blank');
            } else {
                try {
                    var image: String = '{path}/reportfiles/Medil Logo.png';
                    var params1 = new HashMap();
                    if (vatpur.isValidDateStr(txtFrom.rawText) or vatpur.isValidDateStr(txtTo.rawText)) {
                        if (selRep == 1) {
                            //vatpur.insertData();
                            purchases=vatpur.insertData();
                            vatregisterController.insertSalesVat(purchases);
                            insRep();
                            panel.visible = true;
                            params1.put("REPORTS_DIR", image);
                            RepViewer.showReport("/reportfiles/salewise_purchaseVAT.jasper", params1);
                            vatpur.truncateData(false);
                        } else {
                            //vatpur.insertData();
                            purchases=vatpur.insertData();
                            vatregisterController.insertSalesVat(purchases);
                            insRep();
                            panel.visible = true;
                            RepViewer.showReport("/reportfiles/productwise_purchaseVAT.jasper", params1);
                            vatpur.truncateData(false);

                        }
                    } else if (txtTo.text == null or txtTo.text.length() == 0
                            or txtFrom.text == null or txtFrom.text.length() == 0) {
                        FXinfo("Must you entered the Date Values");
                    } else {
                        FXinfo("Enter Valid Date eg:31-12-201102(eg:dd-mm-yyyy");
                    }
                } catch (ex: Exception) {
                    var msg: String = "Class : Execute Report   : btnCancelOnMouseClicked   = {ex.getMessage()}";
                    log.debug(msg);
                }
                vatpur.tot=0;
            }
        }
    }

    function btnCancelOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if (rdoSalesVAT.selected) {
            
            salesvatInsert();
        } else {
            purchasevatInsert();
        }

    }

    function salesVATTable(): Void {
        tableComp = SwingComponent.wrap(vat.getScrollable(table));

        // panelTable.content = [tableComp, listView];
        //tableComp.getJComponent().setPreferredSize(new Dimension(740, 345.0));
        tableComp = SwingComponent.wrap(vat.getScrollable(table));
        panelTable.content = [tableComp, listView];
        tableComp.getJComponent().setPreferredSize(new Dimension(TableW, TableH));
//        tableComp.layoutX = listView.layoutX;
//        tableComp.layoutY = listView.layoutY;
        var tab = (table as javax.swing.JTable);
        var tah = (table as javax.swing.JTable).getTableHeader();
        tab.addMouseListener(MouseAdapter {
            override public function mouseClicked(arg0: java.awt.event.MouseEvent): Void {
                try {
                    if (headVal) {
                        updateValues('sales');
                    } else {
                        updateValues('sales');
                    }
                } catch (ex: Exception) {
                    var msg: String = "Class : Table checkbox Mouse Click   : mouseClicked   = {ex.getMessage()}";
                    log.debug(msg);
                }
            }
        });

        tah.addMouseListener(MouseAdapter {
            override public function mouseClicked(arg0: java.awt.event.MouseEvent): Void {
                try {
                    headVal = Boolean.parseBoolean(tah.getTable().getValueAt(0, 7).toString());
                    
                    updateValues('sales');
                } catch (ex: Exception) {
                    var msg: String = "Class : Table Header Mouse Click   : mouseClicked   = {ex.getMessage()}";
                    log.debug(msg);
                }
            }
        });
    }

    function purchaseVATTable() {
        tableComp1 = SwingComponent.wrap(vatpur.getScrollable(table));
//        tableComp1 = SwingComponent.wrap(vat.getScrollable(table));
        panelTable.content = [tableComp1, listView];
        tableComp1.getJComponent().setPreferredSize(new Dimension(TableW, TableH));
        //tableComp1.getJComponent().setPreferredSize(new Dimension(740, 345.0));
//        tableComp1.getJComponent().setPreferredSize(new Dimension(785, 345.0));
//        tableComp1.layoutX = listView.layoutX;
//        tableComp1.layoutY = listView.layoutY;
        var tab = (table as javax.swing.JTable);
        var tah = (table as javax.swing.JTable).getTableHeader();

        tab.addMouseListener(MouseAdapter {
            override public function mouseClicked(arg0: java.awt.event.MouseEvent): Void {
                try {
                    if (headVal) {
                        updateValues('purchase');
                    } else {
                        updateValues('purchase');
                    }
                } catch (ex: Exception) {
                    var msg: String = "Class : Table checkbox Mouse Click   : mouseClicked   = {ex.getMessage()}";
                    log.debug(msg);
                }
            }
        });

        tah.addMouseListener(MouseAdapter {
            override public function mouseClicked(arg0: java.awt.event.MouseEvent): Void {
                try {
                    headVal = Boolean.parseBoolean(tah.getTable().getValueAt(0, 10).toString());
                    
                    updateValues('purchase');
                } catch (ex: Exception) {
                    var msg: String = "Class : Table Header Mouse Click   : mouseClicked   = {ex.getMessage()}";
                    log.debug(msg);
                }
            }
        });
    }

    function tableSelection(selTab: Integer) {
        try {
            if (rdoSalesVAT.selected) {
//                table = vat.createTable(rowNo, colNames, colType, colEditable, colWidth, selTab);
                table = vat.createTable(selTab);
                salesVATTable();
            } else {
//                table = vatpur.createTable1(rowNo, colNames1, colType1, colEditable1, colWidth1, selTab);
                table = vatpur.createTable1(selTab);
                purchaseVATTable();
            }
        } catch (ex: Exception) {
            var msg: String = "Class : Table Header Mouse Click   : mouseClicked   = {ex.getMessage()}";
            log.debug(msg);
        }
    }

    function updateValues(valu: String): Void {
        if (valu.equals('sales') or valu == 'sales') {
            
            txtVATAmt.text = Value.Round("{vat.vamt}");
            txtSalesAmt.text = Value.Round("{vat.samt}");
            label4PercentTotal.text = Value.Round("{vat.vamt}");
            if (txtVATAmt.text == "-0.00" or label4PercentTotal.text == "-0.00") {
                txtVATAmt.text = "0.00";
                txtSalesAmt.text = "0.00";
                label4PercentTotal.text = "0.00";
                label12PercentTotal.text = "0.00";
            }
        } else if (valu.equals('purchase') or valu == 'purchase') {
            
            txtVATAmt.text = Value.Round("{vatpur.vamt}");
            //txtSalesAmt.text = Value.Round("{vat.samt}");
            label4PercentTotal.text = Value.Round("{vatpur.vamt}");
            if (txtVATAmt.text == "-0.00" or label4PercentTotal.text == "-0.00") {
                txtVATAmt.text = "0.00";
                txtSalesAmt.text = "0.00";
                label4PercentTotal.text = "0.00";
                label12PercentTotal.text = "0.00";
            }
        }
    }

    public function Startup(): Void {
        fxCalendar.visible = false;
        panelCalendar.content = [fxCalendar,];
        tableSelection(0);
        listView.visible = true;
        reset();
        showhideCheks();
        rdoSaleswise.disable = true;
        rdoProductwise.disable = true;
        rdoPercentagewise.disable = true;

        rdoSaleswise.selected = true;
        rdoProductwise.selected = true;
        rdoPercentagewise.selected = true;
        rdoSalesVAT.requestFocus();
    }

    function showhideCheks(): Void {
        if (rdoSalesVAT.selected) {
            if (not rdoSaleswise.selected or not rdoProductwise.selected or not rdoPercentagewise.selected) {
                rdoSaleswise.disable = false;
                rdoProductwise.disable = false;
                rdoPercentagewise.disable = false;

                rdoSaleswise.selected = false;
                rdoProductwise.selected = false;
                rdoPercentagewise.selected = false;
                reset();
            } else if (rdoSaleswise.selected or rdoProductwise.selected or rdoPercentagewise.selected) {
                rdoSaleswise.disable = true;
                rdoProductwise.disable = true;
                rdoPercentagewise.disable = true;

                rdoSaleswise.selected = true;
                rdoProductwise.selected = true;
                rdoPercentagewise.selected = true;
                reset();
            }
        }
        if (rdoPurchaseVAT.selected) {

            if (not rdoSaleswise.selected or not rdoProductwise.selected or not rdoPercentagewise.selected) {
                rdoSaleswise.disable = false;
                rdoProductwise.disable = false;
                rdoPercentagewise.disable = false;

                rdoSaleswise.selected = false;
                rdoProductwise.selected = false;
                rdoPercentagewise.selected = false;
                reset();
            } else if (rdoSaleswise.selected or rdoProductwise.selected or rdoPercentagewise.selected) {
                rdoSaleswise.disable = true;
                rdoProductwise.disable = true;
                rdoPercentagewise.disable = true;

                rdoSaleswise.selected = true;
                rdoProductwise.selected = true;
                rdoPercentagewise.selected = true;
                reset();
            }
        }

    }

    function reset(): Void {
        vat.vamt = 0; vat.samt = 0;
        vat.vat4 = 0; vat.vat125 = 0;
        vatpur.vamt = 0; vatpur.samt = 0;
        vatpur.vat4 = 0; vatpur.vat125 = 0;

        txtVATAmt.text = Value.Round("{0.00}");
        txtSalesAmt.text = Value.Round("{0.00}");
        label4PercentTotal.text = Value.Round("{0.00}");
        label12PercentTotal.text = Value.Round("{0.00}");
        txtFrom.text = "";
        txtTo.text = "";
//        cboAcType.visible = false;

        cboAcType.select(0);
//        labelPercentage.visible = false;
        //cboAcType.clearSelection();
        fxCalendar.visible = false;
        listView.visible = true;
    }

    function jasCloReset(): Void {
        if (vat.truncateFlag) {
            reset();
        }
    }

}
//    function run(): Void {
//        var design = VATReport {};
//        design.Startup();
//        javafx.stage.Stage {
//            scene: javafx.scene.Scene {
//                //stylesheets:"{__DIR__}MedilStyle.css";
//                content: design.getDesignRootNodes()
//            }
//        }
//    }
