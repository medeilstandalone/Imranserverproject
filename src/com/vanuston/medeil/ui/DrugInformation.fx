package com.vanuston.medeil.ui;

import java.lang.*;
import java.sql.*;
import javafx.scene.input.*;
import com.vanuston.medeil.util.Validation;
import javafx.scene.control.Hyperlink;
import javafx.ext.swing.SwingComponent;
import com.vanuston.medeil.uitables.DrugViewTable;
import java.awt.Dimension;
import java.io.File;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.uitables.GetDrugTable;
import javafx.scene.control.TextBox;
import com.vanuston.medeil.util.KeyRegistry;
import java.awt.event.MouseAdapter;
import com.vanuston.medeil.model.DrugModel;
import java.util.List;
import java.util.ArrayList;
import com.vanuston.medeil.implementation.Drug;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.uitables.ConfirmDialogBox;
import com.vanuston.medeil.uitables.ConfirmDialogBox1;

public class DrugInformation {

    var dir1 = new File(".");
    var path: String = dir1.getCanonicalFile().toString();
    var reportSource: String;
    var srCode: String = "";

    var drugViewTable = new DrugViewTable();
// Table Creation Column Names List here
    var rowNo = 8;
    var colNames: Object[] = ["Product Code", "Product Name", "Mfr Name", "VAT", "Formulation", "MRP"];
// column Type
    var colType: Class[] = [java.lang.String.class, java.lang.String.class, java.lang.String.class,
                java.lang.String.class, java.lang.String.class, java.lang.String.class];
// column Editable
    var colEditable: Boolean[] = [false, false, false, false, false, false, false, false, false, false, false, false];
    var colWidth: Integer[] = [80, 180, 200, 70, 100, 70];
//////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////Table Creation/////////////////////////////////////
//////////////////////////////////////////////////////////////////////////////////////
    var drugVTable = drugViewTable.createTable(rowNo, colNames, colType, colEditable, colWidth);
    var drugTable = SwingComponent.wrap(drugViewTable.getScrollTable(drugVTable));
    var log: Logger = Logger.getLogger(DrugInformation.class, "Masters");
    var user = bind CommonDeclare.user;
    var s: String;
    var panelW = bind CommonDeclare.panelFormW on replace {
        ChoiceSearchW = 12.7064803 * panelW / 100; }
    var C1LX = bind CommonDeclare.Column1LX - 10;
    var C2LX = bind CommonDeclare.Column2LX + 60;//(6.988564168*panelW/100);//55
    var C3LX = bind CommonDeclare.Column3LX + 35;//(4.447268107*panelW/100);//35
    var C4LX = bind CommonDeclare.Column4LX + 50;//(6.353240152*panelW/100);//50
    var panelH = bind CommonDeclare.panelFormH;
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var botton1LX = bind CommonDeclare.botton1LX;
    var botton2LX = bind CommonDeclare.botton2LX;
    var botton3LX = bind CommonDeclare.botton3LX;
    var botton4LX = bind CommonDeclare.botton4LX;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    var bottonW = bind CommonDeclare.bottonW;
    var bottonH = bind CommonDeclare.bottonH;
    var CancelW = bottonW;
    var rectbutton1LX = bind CommonDeclare.rectbutton1LX;
    var rectbutton2LX = bind CommonDeclare.rectbutton2LX;
    var rectbuttonLY = bind CommonDeclare.rectbuttonLY;
    var seperatorW = bind CommonDeclare.seperatorW;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;//100
    var Type4TextboxW = bind CommonDeclare.Type4TextboxW;
    var Type5TextboxW = bind CommonDeclare.Type4TextboxW + 15;
    var ImageCalenderLX = bind C2LX + Type3TextboxW + 2;
    var TableH = 192.0 on replace {
        changeTableSize(TableW, TableH);
    };
    var panelCalenderLX = bind C2LX + Type3TextboxW + 22;
    var TableW = bind ((95.29860229 * panelW) / 100) on replace {
        changeTableSize(TableW, TableH);
    };
    var panelTableLX = bind (panelW - TableW) / 2;
    var rectRemoveRowLX = bind ((panelW + TableW) / 2) - 100;

    function changeTableSize(i: Integer, j: Integer): Void {
        drugTable.getJComponent().setPreferredSize(new Dimension(i, j));
    }

    var SearchTextboxLX = bind (15.37484117 * panelW / 100);
    var labelSearchLX = bind (41.93138501 * panelW / 100);
    var ChoiceSearchLX = bind (50.44472681 * panelW / 100);
    var ChoiceSearchW = (12.7064803 * panelW / 100);
    var buttonSearchLX = bind (69.63151207 * panelW / 100);
    var buttonReportLX = bind (85.51461245 * panelW / 100);
    var panelQuickNavigationLX = bind (8.132147395 * panelW / 100);
    var ProductCountLY = bind (95.16513761 * panelH / 100);
    var panelAlertLX = 0;//bind (panelW - 500) / 2;
    var panelAlertLY = 0;//bind (panelH - 150) / 2;
       var panelAlertLX1 =bind (panelW - 500) / 2;
    var panelAlertLY1 = bind (panelH - 150) / 2;
    var listH = 0.0;
    var listW = Type2TextboxW;
    def CustomAlert = CustomAlert {};
    var vatflag=0;
    var drugController: Drug = RegistryFactory.getClientStub(RegistryConstants.Drug) as Drug;
    var commonController: CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    var VAT = commonController.getListItems("", "", "VAT").toArray();
    var barCodeList:List = new ArrayList();

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Drug Information", type);
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

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Drug Information", msg);
        showAlertbox();
    }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Drug Information", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        if (not err_txtbox.equals(txtDrugItmCode)) {
            err_txtbox.style = error; }
    }

    def AddUnits = AddVAT {};
    def AddFormulation = AddFormulation {};
    def AddTher = AddTher {};
    def AddManufacturer = AddManufacturer {};
    var ret1 = bind AddUnits.panel.visible on replace {
        panel.disable = ret1;
        panelPopUp.visible = ret1;
         VAT = commonController.getListItems("", "", "VAT").toArray();
        ChoiceVAT.select(0);
    }
    var ret2 = bind AddFormulation.panel.visible on replace {
        panel.disable = ret2;
        panelFormulation.visible = ret2;
        AddFormulation.txtFormulation.requestFocus();
        txtDrugFormulation.text = AddFormulation.formulation;
        AddFormulation.formulation = "";
    }
    var ret3 = bind AddTher.panel.visible on replace {
        panel.disable = ret3;
        panelFormulation.visible = ret3;
        AddTher.txtTherpateic.requestFocus();
        txtDrugTherap.text = AddTher.therapetic;
        AddTher.therapetic = "";
    }

    var ret4 = bind AddManufacturer.panel.visible on replace {
        panel.disable = ret4;
        panelManufacturer.visible = ret4;
        AddManufacturer.txtManufacturer.requestFocus();
        txtDrugCname.text = AddManufacturer.manufacturer;
        AddManufacturer.manufacturer = "";
    }
    
    var listBarcodeHeight=0;
    
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    public-read def panelTable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelTableLX
        onKeyPressed: panelTableOnKeyPressed
        blocksMouse: true
    }
    
    public-read def rectTableBorder: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        layoutX: bind panelTableLX
        styleClass: "rectTableBorder"
        width: bind TableW
        height: bind TableH
    }
    
    public-read def labelVAT: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C3LX-20
        layoutY: 140.0
        text: "Label"
    }
    
    def __layoutInfo_txtSchedule: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type5TextboxW
    }
    public-read def txtSchedule: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX+Type5TextboxW+80
        layoutY: 84.0
        layoutInfo: __layoutInfo_txtSchedule
        onKeyPressed: txtScheduleOnKeyPressed
        promptText: "H,G,C..."
    }
    
    def __layoutInfo_txtDrugCname: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtDrugCname: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_txtDrugCname
    }
    
    def __layoutInfo_ChoiceVAT: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def ChoiceVAT: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: bind C4LX
        layoutY: 140.0
        layoutInfo: __layoutInfo_ChoiceVAT
        items: bind VAT
    }
    
    def __layoutInfo_btnAddVAT: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnAddVAT: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind C4LX+120
        layoutY: 15.0
        layoutInfo: __layoutInfo_btnAddVAT
        text: "Button"
    }
    
    def __layoutInfo_btnAddBarcode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnAddBarcode: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind C3LX-70
        layoutInfo: __layoutInfo_btnAddBarcode
        text: "Button"
    }
    
    def __layoutInfo_btnDeleteBarcode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnDeleteBarcode: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind C3LX+30
        layoutInfo: __layoutInfo_btnDeleteBarcode
        text: "Button"
    }
    
    public-read def lblBarcode: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX-30
        text: "Label"
    }
    
    def __layoutInfo_txtBarcode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtBarcode: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX
        layoutInfo: __layoutInfo_txtBarcode
    }
    
    def __layoutInfo_listBarcode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind txtBarcode.width
        height: bind listBarcodeHeight
    }
    public-read def listBarcode: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C2LX
        layoutInfo: __layoutInfo_listBarcode
        items: null
    }
    
    def __layoutInfo_listDrug: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listDrug: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutY: 448.0
        layoutInfo: __layoutInfo_listDrug
        items: null
    }
    
    public-read def mfrImage: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C4LX+Type1TextboxW-4
    }
    
    public-read def imageView6: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind C2LX+Type1TextboxW
        layoutY: 56.0
        image: null
    }
    
    public-read def label11: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX
        text: "Label"
    }
    
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 40.0
        layoutY: 60.0
        text: "Label"
    }
    
    def __layoutInfo_separator: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
    }
    public-read def separator: javafx.scene.control.Separator = javafx.scene.control.Separator {
        visible: false
        layoutX: 37.0
        layoutY: 86.0
        layoutInfo: __layoutInfo_separator
    }
    
    public-read def label15: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def panelAtoZ: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelQuickNavigationLX
        layoutY: 20.0
        content: [ label15, ]
    }
    
    def __layoutInfo_txtStkSearch: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtStkSearch: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind SearchTextboxLX
        layoutY: 0.0
        layoutInfo: __layoutInfo_txtStkSearch
    }
    
    public-read def label13: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind labelSearchLX
        layoutY: -1.0
        text: "Label"
    }
    
    def __layoutInfo_cmbSearchBox: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind ChoiceSearchW
    }
    public-read def cmbSearchBox: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: bind ChoiceSearchLX
        layoutY: 13.0
        layoutInfo: __layoutInfo_cmbSearchBox
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    def __layoutInfo_btnDrugSearch: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnDrugSearch: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind buttonSearchLX
        layoutY: 5.0
        layoutInfo: __layoutInfo_btnDrugSearch
        text: "Button"
    }
    
    def __layoutInfo_btnReport: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def btnReport: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind buttonReportLX
        layoutY: 593.0
        layoutInfo: __layoutInfo_btnReport
        text: "Button"
    }
    
    public-read def panelsearch: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutX: 63.0
        layoutY: 100.0
        content: [ txtStkSearch, label13, cmbSearchBox, btnDrugSearch, btnReport, ]
    }
    
    public-read def productCount: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 54.0
        layoutY: bind ProductCountLY
        text: "Label"
    }
    
    def __layoutInfo_lblEditDrug: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def lblEditDrug: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind rectbutton2LX
        layoutY: bind rectbuttonLY+30
        layoutInfo: __layoutInfo_lblEditDrug
        text: "Label"
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelAlertLX1
        layoutY: bind panelAlertLY1
    }
    
    def __layoutInfo_panelPopUp: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
        height: bind panelH
    }
    public-read def panelPopUp: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutX: bind panelAlertLX+150
        layoutY: bind panelAlertLY+70
        layoutInfo: __layoutInfo_panelPopUp
    }
    
    def __layoutInfo_panelFormulation: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
        height: bind panelH
    }
    public-read def panelFormulation: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelAlertLX+150
        layoutY: bind panelAlertLY+70
        layoutInfo: __layoutInfo_panelFormulation
    }
    
    def __layoutInfo_panelTher: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
        height: bind panelH
    }
    public-read def panelTher: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY+30
        layoutInfo: __layoutInfo_panelTher
    }
    
    def __layoutInfo_panelManufacturer: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
        height: bind panelW
    }
    public-read def panelManufacturer: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelAlertLX+150
        layoutY: bind panelAlertLY+30
        layoutInfo: __layoutInfo_panelManufacturer
    }
    
    public-read def panel2: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ panelPopUp, panelFormulation, panelTher, panelManufacturer, ]
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
    
    def __layoutInfo_txtDrugMRP: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtDrugMRP: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 112.0
        layoutInfo: __layoutInfo_txtDrugMRP
        font: Arial_12
    }
    
    def __layoutInfo_txtDrugPackType: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type5TextboxW
    }
    public-read def txtDrugPackType: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 84.0
        layoutInfo: __layoutInfo_txtDrugPackType
        promptText: "ex.10,20.50,..."
        font: Arial_12
    }
    
    def __layoutInfo_txtDrugDosage: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtDrugDosage: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 56.0
        layoutInfo: __layoutInfo_txtDrugDosage
        promptText: "ex. 10mg ,50ml,200g"
        font: Arial_12
    }
    
    def __layoutInfo_txtDrugFormulation: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtDrugFormulation: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 28.0
        layoutInfo: __layoutInfo_txtDrugFormulation
        onKeyReleased: txtDrugFormulationOnKeyReleased
        font: Arial_12
    }
    
    def __layoutInfo_txtDrugIndication: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtDrugIndication: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        managed: true
        layoutX: bind C2LX
        layoutY: 140.0
        layoutInfo: __layoutInfo_txtDrugIndication
        font: Arial_12
    }
    
    def __layoutInfo_txtDrugSubTherap: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtDrugSubTherap: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 112.0
        layoutInfo: __layoutInfo_txtDrugSubTherap
        onKeyReleased: txtDrugSubTherapOnKeyReleasedAtShown
        font: Arial_12
    }
    
    def __layoutInfo_txtDrugTherap: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtDrugTherap: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 84.0
        layoutInfo: __layoutInfo_txtDrugTherap
        onKeyPressed: txtDrugTherapOnKeyPressedAtShown
        onKeyReleased: txtDrugTherapOnKeyReleasedAtShown
        font: Arial_12
    }
    
    def __layoutInfo_txtDrugGeneric: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtDrugGeneric: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 56.0
        layoutInfo: __layoutInfo_txtDrugGeneric
        font: Arial_12
    }
    
    def __layoutInfo_txtDrugItmName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
        hfill: false
    }
    public-read def txtDrugItmName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 28.0
        layoutInfo: __layoutInfo_txtDrugItmName
        style: ""
        styleClass: "text-box"
        effect: null
        text: ""
        font: Arial_12
    }
    
    public-read def Arial_Bold_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
    }
    
    def __layoutInfo_lblViewDrug: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 120.0
        height: 20.0
    }
    public-read def lblViewDrug: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind rectbutton2LX
        layoutY: bind rectbuttonLY+30
        layoutInfo: __layoutInfo_lblViewDrug
        onMouseClicked: lblViewDrugOnMouseClickedAtEdit
        text: "View Drugs"
        font: Arial_Bold_12
        hpos: javafx.geometry.HPos.CENTER
    }
    
    def __layoutInfo_lblAddNewDrug: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 120.0
        height: 20.0
    }
    public-read def lblAddNewDrug: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind rectbutton1LX
        layoutY: bind rectbuttonLY+30
        layoutInfo: __layoutInfo_lblAddNewDrug
        onMouseClicked: lblAddNewDrugOnMouseClickedAtView
        text: "Add New Drug"
        font: Arial_Bold_12
        hpos: javafx.geometry.HPos.CENTER
    }
    
    public-read def Arial_14: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial "
        size: 14.0
    }
    
    public-read def Arial_Bold_14: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 14.0
    }
    
    def __layoutInfo_txtDrugItmCode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type2TextboxW
    }
    public-read def txtDrugItmCode: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 158.0
        layoutInfo: __layoutInfo_txtDrugItmCode
        styleClass: "Borderless-text-box"
        text: ""
        promptText: "Drug Code..."
        selectOnFocus: false
        editable: false
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
    
    public-read def rdovatpur: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: true
        layoutX: bind C4LX-30
        layoutY: 207.0
        text: "VAT on Purchase Price"
        font: Arial_12
        toggleGroup: toggleGroup
        selected: true
    }
    
    public-read def rdoVATmrp: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        visible: true
        layoutX: bind C4LX+170
        layoutY: 186.0
        text: "VAT on MRP"
        font: Arial_12
        toggleGroup: toggleGroup
        selected: false
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
    
    public-read def rectView: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind rectbutton2LX
        layoutY: bind rectbuttonLY+30
        styleClass: "rectbutton"
        onKeyPressed: rectViewOnKeyPressedAtView
        focusTraversable: true
        fill: linearGradient
        stroke: DarkGray
        strokeWidth: 2.0
        width: 120.0
        height: 20.0
    }
    
    public-read def rectangle3: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind rectbutton1LX-5
        layoutY: bind rectbuttonLY+30
        styleClass: "rectbutton"
        onKeyPressed: rectangle3OnKeyPressedAtView
        focusTraversable: true
        fill: linearGradient
        stroke: DarkGray
        strokeWidth: 2.0
        width: 120.0
        height: 20.0
    }
    
    def __layoutInfo_label2: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 80.0
    }
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C4LX+Type5TextboxW+15
        layoutY: 84.0
        layoutInfo: __layoutInfo_label2
        text: "Schedule"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelMRP: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX-20
        layoutY: 112.0
        text: "MRP"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelPackage: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX-20
        layoutY: 84.0
        text: "Package Type"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelCompany_Name: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX-20
        layoutY: 0.0
        text: "Manufacturer Name"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelDosage: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX-20
        layoutY: 56.0
        text: "Dosage"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelFormulation: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX-20
        layoutY: 28.0
        text: "Formulation"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelIndication: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX-30
        layoutY: 140.0
        text: "Indication"
        font: Arial_12
        textFill: DarkGray
    }
    
    def __layoutInfo_labelSub_Therapeutic: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 110.0
    }
    public-read def labelSub_Therapeutic: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX-30
        layoutY: 110.0
        layoutInfo: __layoutInfo_labelSub_Therapeutic
        text: "Sub-Therapeutic / Sub - Classification"
        font: Arial_12
        textWrap: true
        textFill: DarkGray
    }
    
    def __layoutInfo_labelTherapeutic: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 150.0
    }
    public-read def labelTherapeutic: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX-30
        layoutY: 84.0
        layoutInfo: __layoutInfo_labelTherapeutic
        text: "Therapeutic / Classification"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelGeneric_Name: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX-30
        layoutY: 56.0
        text: "Generic Name"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelDrug_Name: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX-30
        layoutY: 28.0
        styleClass: "label"
        text: "Drug Name"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelDrug_Code: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX-30
        layoutY: 158.0
        text: "Drug Code"
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
    
    public-read def dropShadowEffect: javafx.scene.effect.DropShadow = javafx.scene.effect.DropShadow {
    }
    
    public-read def lightingEffect: javafx.scene.effect.Lighting = javafx.scene.effect.Lighting {
    }
    
    def __layoutInfo_lblTitle: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
    }
    public-read def lblTitle: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 575.0
        layoutY: 1.0
        layoutInfo: __layoutInfo_lblTitle
        effect: lightingEffect
        text: "Drug Details - alt+D"
        font: Arial_25
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
    }
    
    public-read def imageSave: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Save1.png"
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: true
        image: imageSave
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnDrugSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnDrugSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX-80
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnDrugSave
        onKeyPressed: btnDrugSaveOnKeyPressedAtShown
        translateX: 0.0
        effect: reflectionEffect
        graphic: imageView
        text: "btnDrugSave"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    public-read def imageEdit: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Edit.png"
    }
    
    public-read def imgEdit: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: true
        image: imageEdit
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnDrugEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnDrugEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton2LX-120
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnDrugEdit
        effect: reflectionEffect
        graphic: imgEdit
        text: "Edit  [F4]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    public-read def imageReset: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Reset.png"
    }
    
    public-read def imageView3: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: true
        image: imageReset
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnDrugReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnDrugReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton3LX-150
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnDrugReset
        effect: reflectionEffect
        graphic: imageView3
        text: "Reset [F5]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    public-read def imageCancel: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Cancel.png"
    }
    
    public-read def imgCancel: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: true
        image: imageCancel
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnDrugCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind CancelW
        height: bind bottonH
    }
    public-read def btnDrugCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton4LX-185
        layoutY: 525.0
        layoutInfo: __layoutInfo_btnDrugCancel
        effect: reflectionEffect
        graphic: imgCancel
        text: "Cancel [Esc]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    public-read def panelButtons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: bind panelButtonsLY
        content: [ btnDrugSave, btnDrugEdit, btnDrugReset, btnDrugCancel, ]
    }
    
    public-read def imageBack: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/arrow_Left.png"
    }
    
    public-read def linearGradientHeader: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
    }
    
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 0.25
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "rectFormHeader"
        fill: linearGradientHeader
        width: bind panelW
        height: 32.0
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imageView2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: true
        layoutX: bind C2LX+Type1TextboxW
        layoutY: 84.0
        onMouseClicked: imageView2OnMouseClicked
        blocksMouse: true
        image: image
    }
    
    public-read def image2: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imageView4: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind C2LX+Type1TextboxW
        layoutY: 112.0
        onMouseClicked: imageView4OnMouseClicked
        blocksMouse: true
        image: image2
    }
    
    public-read def image3: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    public-read def imageView5: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        layoutX: bind C4LX+Type1TextboxW
        layoutY: 28.0
        onMouseClicked: imageView5OnMouseClicked
        blocksMouse: true
        image: image3
    }
    
    public-read def panelControls: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        layoutX: 0.0
        layoutY: 122.0
        content: [ labelDrug_Code, labelDrug_Name, labelGeneric_Name, labelTherapeutic, labelSub_Therapeutic, labelIndication, txtDrugItmCode, txtDrugItmName, txtDrugGeneric, txtDrugTherap, txtDrugSubTherap, txtDrugIndication, labelFormulation, labelDosage, labelCompany_Name, labelPackage, labelMRP, labelVAT, label2, txtSchedule, txtDrugCname, txtDrugFormulation, txtDrugDosage, txtDrugPackType, txtDrugMRP, rdoVATmrp, rdovatpur, ChoiceVAT, btnAddVAT, btnAddBarcode, btnDeleteBarcode, lblBarcode, txtBarcode, listBarcode, listDrug, imageView2, imageView4, imageView5, mfrImage, imageView6, label11, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        content: [ rectangle, rectHeader, lblTitle, panelTable, rectTableBorder, panelControls, panelButtons, label, separator, panelAtoZ, panelsearch, productCount, rectangle3, rectView, lblAddNewDrug, lblEditDrug, lblViewDrug, panelAlert, ]
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "Shown", "Edit", "View", ]
        actual: 0
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectangle.visible = true;
                            rectHeader.visible = true;
                            rectHeader.layoutX = 0.0;
                            rectHeader.height = 32.0;
                            lblTitle.layoutX = 0.0;
                            lblTitle.layoutY = 1.0;
                            lblTitle.text = "Drug Details - alt+D";
                            lblTitle.hpos = javafx.geometry.HPos.CENTER;
                            panelTable.visible = true;
                            panelTable.layoutY = 290.0;
                            panelTable.onMouseClicked = panelTableOnMouseClicked;
                            rectTableBorder.visible = true;
                            rectTableBorder.layoutY = 290.0;
                            labelDrug_Code.layoutY = 0.0;
                            labelDrug_Code.font = Arial_16;
                            labelDrug_Name.layoutY = 22.0;
                            labelDrug_Name.font = Arial_16;
                            labelGeneric_Name.layoutY = 50.0;
                            labelGeneric_Name.font = Arial_16;
                            labelTherapeutic.layoutY = 78.0;
                            __layoutInfo_labelTherapeutic.width = 200.0;
                            labelTherapeutic.font = Arial_16;
                            labelTherapeutic.textWrap = false;
                            labelSub_Therapeutic.layoutY = 104.0;
                            __layoutInfo_labelSub_Therapeutic.width = 220.0;
                            labelSub_Therapeutic.text = "Sub -Therapeutic / Sub - Classification";
                            labelSub_Therapeutic.font = Arial_16;
                            labelIndication.layoutY = 145.0;
                            labelIndication.font = Arial_16;
                            txtDrugItmCode.disable = false;
                            txtDrugItmCode.layoutY = 0.0;
                            txtDrugItmCode.onKeyPressed = txtDrugItmCodeOnKeyPressedAtShown;
                            txtDrugItmCode.editable = false;
                            txtDrugItmName.layoutY = 22.0;
                            txtDrugItmName.onKeyPressed = txtDrugItmNameOnKeyPressedAtShown;
                            txtDrugItmName.onKeyReleased = txtDrugItmNameOnKeyReleasedAtShown;
                            txtDrugItmName.font = Arial_16;
                            txtDrugGeneric.layoutY = 50.0;
                            txtDrugGeneric.onKeyPressed = txtDrugGenericOnKeyPressedAtShown;
                            txtDrugGeneric.onKeyReleased = txtDrugGenericOnKeyReleasedAtShown;
                            txtDrugGeneric.font = Arial_16;
                            txtDrugTherap.layoutY = 78.0;
                            txtDrugTherap.onKeyPressed = txtDrugTherapOnKeyPressedAtShown;
                            txtDrugTherap.font = Arial_16;
                            txtDrugSubTherap.layoutY = 110.0;
                            txtDrugSubTherap.onKeyPressed = txtDrugSubTherapOnKeyPressedAtShown;
                            txtDrugSubTherap.font = Arial_16;
                            txtDrugIndication.layoutY = 145.0;
                            txtDrugIndication.onKeyPressed = txtDrugIndicationOnKeyPressedAtShown;
                            txtDrugIndication.font = Arial_16;
                            labelFormulation.text = "Formulation";
                            labelFormulation.font = Arial_16;
                            labelDosage.font = Arial_16;
                            labelCompany_Name.font = Arial_16;
                            labelPackage.text = "Package";
                            labelPackage.font = Arial_16;
                            labelMRP.font = Arial_16;
                            labelVAT.visible = true;
                            labelVAT.text = "VAT";
                            labelVAT.font = Arial_16;
                            label2.visible = true;
                            label2.text = "Schedule";
                            label2.font = Arial_16;
                            txtSchedule.font = Arial_16;
                            txtDrugCname.onKeyPressed = txtDrugCnameOnKeyPressedAtShown;
                            txtDrugCname.onKeyReleased = txtDrugCnameOnKeyReleasedAtShown;
                            txtDrugCname.font = Arial_16;
                            txtDrugFormulation.onKeyPressed = txtDrugFormulationOnKeyPressedAtShown;
                            txtDrugFormulation.font = Arial_16;
                            txtDrugDosage.onKeyPressed = txtDrugDosageOnKeyPressedAtShown;
                            txtDrugDosage.font = Arial_16;
                            txtDrugPackType.onKeyPressed = txtDrugPackTypeOnKeyPressedAtShown;
                            txtDrugPackType.font = Arial_16;
                            txtDrugMRP.onKeyPressed = txtDrugMRPOnKeyPressedAtShown;
                            txtDrugMRP.onKeyTyped = txtDrugMRPOnKeyTypedAtShown;
                            txtDrugMRP.font = Arial_16;
                            rdoVATmrp.visible = true;
                            rdoVATmrp.layoutY = 175.0;
                            rdoVATmrp.text = "VAT on MRP";
                            rdoVATmrp.font = Arial_16;
                            rdoVATmrp.toggleGroup = toggleGroup;
                            rdovatpur.visible = true;
                            rdovatpur.layoutY = 175.0;
                            rdovatpur.text = "VAT on Purchase Price";
                            rdovatpur.font = Arial_16;
                            rdovatpur.toggleGroup = toggleGroup;
                            ChoiceVAT.visible = true;
                            __layoutInfo_ChoiceVAT.width = 100.0;
                            ChoiceVAT.onKeyPressed = ChoiceVATOnKeyPressedAtShown;
                            ChoiceVAT.onMouseClicked = ChoiceVATOnMouseClickedAtShown;
                            btnAddVAT.visible = true;
                            btnAddVAT.layoutY = 140.0;
                            __layoutInfo_btnAddVAT.height = 25.0;
                            btnAddVAT.text = "Add New VAT";
                            btnAddVAT.action = btnAddVATActionAtShown;
                            btnAddBarcode.visible = true;
                            btnAddBarcode.layoutY = 175.0;
                            __layoutInfo_btnAddBarcode.width = 85.0;
                            __layoutInfo_btnAddBarcode.height = 25.0;
                            btnAddBarcode.onKeyPressed = btnAddBarcodeOnKeyPressed;
                            btnAddBarcode.onMouseClicked = btnAddBarcodeOnMouseClicked;
                            btnAddBarcode.text = "Add Barcode";
                            btnAddBarcode.font = null;
                            btnDeleteBarcode.visible = false;
                            btnDeleteBarcode.layoutY = 0.0;
                            btnDeleteBarcode.text = "Button";
                            lblBarcode.visible = true;
                            lblBarcode.opacity = 1.0;
                            lblBarcode.layoutY = 175.0;
                            lblBarcode.text = "Barcode";
                            lblBarcode.font = Arial_16;
                            lblBarcode.textFill = DarkGray;
                            txtBarcode.visible = true;
                            txtBarcode.layoutY = 175.0;
                            txtBarcode.onKeyPressed = txtBarcodeOnKeyPressed;
                            txtBarcode.font = Arial_16;
                            listBarcode.visible = false;
                            listBarcode.disable = false;
                            listBarcode.layoutY = 188.0;
                            listBarcode.onKeyPressed = listBarcodeOnKeyPressed;
                            listBarcode.onMouseClicked = listBarcodeOnMouseClicked;
                            listBarcode.items = null;
                            listDrug.visible = false;
                            listDrug.layoutY = 0.0;
                            listDrug.onKeyPressed = listDrugOnKeyPressedAtShown;
                            imageView2.visible = true;
                            imageView2.layoutY = 78.0;
                            imageView2.blocksMouse = true;
                            imageView2.fitHeight = 25.0;
                            imageView4.disable = false;
                            imageView4.layoutY = 110.0;
                            imageView4.blocksMouse = true;
                            imageView4.fitHeight = 25.0;
                            imageView5.fitHeight = 25.0;
                            mfrImage.visible = true;
                            mfrImage.onMouseClicked = mfrImageOnMouseClickedAtShown;
                            mfrImage.blocksMouse = true;
                            mfrImage.image = image;
                            mfrImage.fitHeight = 25.0;
                            imageView6.visible = true;
                            imageView6.layoutY = 50.0;
                            imageView6.onMouseClicked = imageView6OnMouseClickedAtShown;
                            imageView6.blocksMouse = true;
                            imageView6.image = image;
                            imageView6.fitHeight = 25.0;
                            label11.visible = false;
                            label11.layoutY = 0.0;
                            label11.text = "Label";
                            panelControls.visible = true;
                            panelControls.layoutY = 80.0;
                            imageView.visible = true;
                            btnDrugSave.layoutY = 0.0;
                            btnDrugSave.text = "Save [F3]";
                            btnDrugSave.font = Arial_Bold_16;
                            btnDrugSave.action = btnDrugSaveActionAtShown;
                            imgEdit.visible = true;
                            imgEdit.image = imageEdit;
                            btnDrugEdit.layoutY = 0.0;
                            btnDrugEdit.onKeyPressed = btnDrugEditOnKeyPressedAtShown;
                            btnDrugEdit.text = "Edit [F6]";
                            btnDrugEdit.font = Arial_Bold_16;
                            btnDrugEdit.action = btnDrugEditActionAtShown;
                            imageView3.visible = true;
                            btnDrugReset.layoutY = 0.0;
                            btnDrugReset.onKeyPressed = btnDrugResetOnKeyPressedAtShown;
                            btnDrugReset.text = "Reset [F4]";
                            btnDrugReset.font = Arial_Bold_16;
                            btnDrugReset.action = btnDrugResetActionAtShown;
                            imgCancel.visible = true;
                            imgCancel.image = imageCancel;
                            btnDrugCancel.layoutY = 0.0;
                            btnDrugCancel.onKeyPressed = btnDrugCancelOnKeyPressedAtShown;
                            btnDrugCancel.text = "Cancel [F8]";
                            btnDrugCancel.font = Arial_Bold_16;
                            btnDrugCancel.action = btnDrugCancelActionAtShown;
                            panelButtons.visible = true;
                            label.visible = true;
                            label.layoutX = 40.0;
                            label.layoutY = 40.0;
                            label.text = "Add New Drug Details";
                            label.font = Arial_18;
                            label.textFill = Green;
                            separator.visible = true;
                            separator.layoutX = 30.0;
                            separator.layoutY = 65.0;
                            label15.visible = false;
                            label15.text = "Label";
                            label15.textFill = javafx.scene.paint.Color.BLACK;
                            panelAtoZ.visible = false;
                            panelAtoZ.layoutY = 20.0;
                            txtStkSearch.visible = false;
                            label13.visible = false;
                            label13.layoutY = -1.0;
                            label13.text = "Label";
                            cmbSearchBox.visible = false;
                            cmbSearchBox.layoutY = 13.0;
                            cmbSearchBox.items = [ "Item 1", "Item 2", "Item 3", ];
                            btnDrugSearch.visible = false;
                            btnDrugSearch.layoutY = 5.0;
                            btnDrugSearch.text = "Button";
                            btnReport.visible = false;
                            btnReport.layoutY = 593.0;
                            btnReport.text = "Button";
                            panelsearch.visible = true;
                            panelsearch.layoutX = 1063.0;
                            panelsearch.layoutY = 100.0;
                            productCount.visible = false;
                            productCount.text = "Label";
                            rectangle3.visible = false;
                            rectangle3.arcWidth = 0.0;
                            rectangle3.arcHeight = 0.0;
                            rectView.visible = true;
                            rectView.onKeyPressed = rectViewOnKeyPressedAtShown;
                            rectView.strokeWidth = 2.0;
                            rectView.width = 120.0;
                            rectView.height = 20.0;
                            rectView.arcWidth = 5.0;
                            rectView.arcHeight = 5.0;
                            lblAddNewDrug.visible = false;
                            __layoutInfo_lblAddNewDrug.width = 120.0;
                            lblAddNewDrug.text = "Add New Drug";
                            lblAddNewDrug.font = Arial_Bold_12;
                            lblEditDrug.visible = false;
                            lblEditDrug.text = "Label";
                            lblEditDrug.hpos = javafx.geometry.HPos.LEFT;
                            lblViewDrug.visible = true;
                            __layoutInfo_lblViewDrug.width = 100.0;
                            lblViewDrug.font = Arial_Bold_14;
                            panelAlert.visible = true;
                            panel.visible = true;
                            panelPopUp.visible = false;
                            panelFormulation.visible = true;
                            panelTher.visible = true;
                            panelManufacturer.visible = true;
                            panel2.visible = true;
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
                            rectHeader.visible = true;
                            rectHeader.layoutX = 0.0;
                            rectHeader.height = 32.0;
                            lblTitle.layoutX = 0.0;
                            lblTitle.layoutY = 1.0;
                            lblTitle.text = "Drug Details - alt+D";
                            lblTitle.hpos = javafx.geometry.HPos.CENTER;
                            panelTable.visible = true;
                            panelTable.layoutY = 310.0;
                            rectTableBorder.visible = true;
                            rectTableBorder.layoutY = 310.0;
                            labelDrug_Code.layoutY = 0.0;
                            labelDrug_Code.font = Arial_16;
                            labelDrug_Name.layoutY = 22.0;
                            labelDrug_Name.font = Arial_16;
                            labelGeneric_Name.layoutY = 50.0;
                            labelGeneric_Name.font = Arial_16;
                            labelTherapeutic.layoutY = 78.0;
                            __layoutInfo_labelTherapeutic.width = 200.0;
                            labelTherapeutic.font = Arial_16;
                            labelTherapeutic.textWrap = false;
                            labelSub_Therapeutic.layoutY = 104.0;
                            __layoutInfo_labelSub_Therapeutic.width = 220.0;
                            labelSub_Therapeutic.text = "Sub -Therapeutic / Sub - Classification";
                            labelSub_Therapeutic.font = Arial_16;
                            labelIndication.layoutY = 145.0;
                            labelIndication.font = Arial_16;
                            txtDrugItmCode.disable = false;
                            txtDrugItmCode.layoutY = 0.0;
                            txtDrugItmCode.onKeyPressed = txtDrugItmCodeOnKeyPressedAtShown;
                            txtDrugItmCode.editable = false;
                            txtDrugItmName.layoutY = 22.0;
                            txtDrugItmName.onKeyPressed = txtDrugItmNameOnKeyPressedAtShown;
                            txtDrugItmName.onKeyReleased = txtDrugItmNameOnKeyReleasedAtShown;
                            txtDrugItmName.font = Arial_16;
                            txtDrugGeneric.layoutY = 50.0;
                            txtDrugGeneric.onKeyPressed = txtDrugGenericOnKeyPressedAtShown;
                            txtDrugGeneric.font = Arial_16;
                            txtDrugTherap.layoutY = 78.0;
                            txtDrugTherap.onKeyPressed = txtDrugTherapOnKeyPressedAtShown;
                            txtDrugTherap.font = Arial_16;
                            txtDrugSubTherap.layoutY = 110.0;
                            txtDrugSubTherap.onKeyPressed = txtDrugSubTherapOnKeyPressedAtShown;
                            txtDrugSubTherap.font = Arial_16;
                            txtDrugIndication.layoutY = 145.0;
                            txtDrugIndication.onKeyPressed = txtDrugIndicationOnKeyPressedAtShown;
                            txtDrugIndication.font = Arial_16;
                            labelFormulation.text = "Formulation";
                            labelFormulation.font = Arial_16;
                            labelDosage.font = Arial_16;
                            labelCompany_Name.font = Arial_16;
                            labelPackage.text = "Package Type";
                            labelPackage.font = Arial_16;
                            labelMRP.font = Arial_16;
                            labelVAT.visible = true;
                            labelVAT.text = "VAT";
                            labelVAT.font = Arial_16;
                            label2.visible = true;
                            label2.text = "Schedule";
                            label2.font = Arial_16;
                            txtSchedule.font = Arial_16;
                            txtDrugCname.onKeyPressed = txtDrugCnameOnKeyPressedAtShown;
                            txtDrugCname.font = Arial_16;
                            txtDrugFormulation.onKeyPressed = txtDrugFormulationOnKeyPressedAtShown;
                            txtDrugFormulation.font = Arial_16;
                            txtDrugDosage.onKeyPressed = txtDrugDosageOnKeyPressedAtShown;
                            txtDrugDosage.font = Arial_16;
                            txtDrugPackType.onKeyPressed = txtDrugPackTypeOnKeyPressedAtShown;
                            txtDrugPackType.font = Arial_16;
                            txtDrugMRP.onKeyPressed = txtDrugMRPOnKeyPressedAtShown;
                            txtDrugMRP.font = Arial_16;
                            rdoVATmrp.visible = true;
                            rdoVATmrp.layoutY = 180.0;
                            rdoVATmrp.text = "VAT on MRP";
                            rdoVATmrp.font = Arial_16;
                            rdoVATmrp.toggleGroup = toggleGroup;
                            rdovatpur.visible = true;
                            rdovatpur.layoutY = 180.0;
                            rdovatpur.text = "VAT on Purchase Price";
                            rdovatpur.font = Arial_16;
                            rdovatpur.toggleGroup = toggleGroup;
                            ChoiceVAT.visible = true;
                            ChoiceVAT.onKeyPressed = ChoiceVATOnKeyPressedAtShown;
                            ChoiceVAT.onMouseClicked = ChoiceVATOnMouseClickedAtShown;
                            btnAddVAT.visible = true;
                            btnAddVAT.layoutY = 140.0;
                            __layoutInfo_btnAddVAT.height = 25.0;
                            btnAddVAT.text = "Add New VAT";
                            btnAddBarcode.visible = true;
                            btnAddBarcode.layoutY = 162.0;
                            __layoutInfo_btnAddBarcode.width = 90.0;
                            __layoutInfo_btnAddBarcode.height = 25.0;
                            btnAddBarcode.onKeyPressed = btnAddBarcodeOnKeyPressed;
                            btnAddBarcode.onMouseClicked = btnAddBarcodeOnMouseClicked;
                            btnAddBarcode.effect = null;
                            btnAddBarcode.text = "Add Barcode";
                            btnAddBarcode.font = javafx.scene.text.Font.DEFAULT;
                            btnDeleteBarcode.visible = true;
                            btnDeleteBarcode.layoutY = 162.0;
                            __layoutInfo_btnDeleteBarcode.width = 100.0;
                            __layoutInfo_btnDeleteBarcode.height = 25.0;
                            btnDeleteBarcode.onKeyPressed = btnDeleteBarcodeOnKeyPressedAtEdit;
                            btnDeleteBarcode.onMouseClicked = btnDeleteBarcodeOnMouseClickedAtEdit;
                            btnDeleteBarcode.text = "Delete Barcode";
                            btnDeleteBarcode.font = javafx.scene.text.Font.DEFAULT;
                            lblBarcode.visible = true;
                            lblBarcode.opacity = 1.0;
                            lblBarcode.layoutY = 175.0;
                            lblBarcode.text = "Barcode";
                            lblBarcode.font = Arial_16;
                            lblBarcode.textFill = DarkGray;
                            txtBarcode.visible = true;
                            txtBarcode.layoutY = 175.0;
                            txtBarcode.onKeyPressed = txtBarcodeOnKeyPressed;
                            txtBarcode.font = Arial_16;
                            listBarcode.visible = false;
                            listBarcode.disable = false;
                            listBarcode.layoutY = 188.0;
                            listBarcode.onKeyPressed = listBarcodeOnKeyPressed;
                            listBarcode.onMouseClicked = listBarcodeOnMouseClicked;
                            listBarcode.items = null;
                            listDrug.visible = false;
                            listDrug.layoutY = 0.0;
                            listDrug.onKeyPressed = listDrugOnKeyPressedAtShown;
                            imageView2.visible = true;
                            imageView2.layoutY = 78.0;
                            imageView2.blocksMouse = true;
                            imageView2.fitHeight = 25.0;
                            imageView4.disable = false;
                            imageView4.layoutY = 110.0;
                            imageView4.blocksMouse = true;
                            imageView4.fitHeight = 25.0;
                            imageView5.fitHeight = 25.0;
                            mfrImage.visible = true;
                            mfrImage.blocksMouse = false;
                            mfrImage.image = image;
                            mfrImage.fitHeight = 25.0;
                            imageView6.visible = true;
                            imageView6.layoutY = 50.0;
                            imageView6.onMouseClicked = imageView6OnMouseClickedAtEdit;
                            imageView6.blocksMouse = true;
                            imageView6.image = image;
                            imageView6.fitHeight = 25.0;
                            label11.visible = false;
                            label11.layoutY = 0.0;
                            label11.text = "Label";
                            panelControls.visible = true;
                            panelControls.layoutY = 80.0;
                            imageView.visible = true;
                            btnDrugSave.layoutY = 0.0;
                            btnDrugSave.text = "Update [F7]";
                            btnDrugSave.font = Arial_Bold_16;
                            btnDrugSave.action = btnDrugSaveActionAtShown;
                            imgEdit.visible = true;
                            imgEdit.image = imageCancel;
                            btnDrugEdit.layoutY = 0.0;
                            btnDrugEdit.text = "Delete [F5]";
                            btnDrugEdit.font = Arial_Bold_16;
                            btnDrugEdit.action = btnDrugEditActionAtShown;
                            imageView3.visible = true;
                            btnDrugReset.layoutY = 0.0;
                            btnDrugReset.text = "Reset [F4]";
                            btnDrugReset.font = Arial_Bold_16;
                            btnDrugReset.action = btnDrugResetActionAtShown;
                            imgCancel.visible = true;
                            imgCancel.image = imageBack;
                            btnDrugCancel.layoutY = 0.0;
                            btnDrugCancel.text = "Back [Ctrl+Left]";
                            btnDrugCancel.font = Arial_Bold_16;
                            btnDrugCancel.action = btnDrugCancelActionAtShown;
                            panelButtons.visible = true;
                            label.visible = true;
                            label.layoutX = 40.0;
                            label.layoutY = 40.0;
                            label.text = "Edit Drug Details";
                            label.font = Arial_18;
                            label.textFill = Green;
                            separator.visible = true;
                            separator.layoutX = 30.0;
                            separator.layoutY = 65.0;
                            label15.visible = false;
                            label15.text = "Label";
                            label15.textFill = javafx.scene.paint.Color.BLACK;
                            panelAtoZ.visible = false;
                            panelAtoZ.layoutY = 20.0;
                            txtStkSearch.visible = false;
                            label13.visible = false;
                            label13.layoutY = -1.0;
                            label13.text = "Label";
                            cmbSearchBox.visible = false;
                            cmbSearchBox.layoutY = 13.0;
                            cmbSearchBox.items = [ "Item 1", "Item 2", "Item 3", ];
                            btnDrugSearch.visible = false;
                            btnDrugSearch.layoutY = 5.0;
                            btnDrugSearch.text = "Button";
                            btnReport.visible = false;
                            btnReport.layoutY = 593.0;
                            btnReport.text = "Button";
                            panelsearch.visible = true;
                            panelsearch.layoutX = 63.0;
                            panelsearch.layoutY = 100.0;
                            productCount.visible = false;
                            productCount.text = "Label";
                            rectangle3.visible = true;
                            rectangle3.arcWidth = 5.0;
                            rectangle3.arcHeight = 5.0;
                            rectView.visible = true;
                            rectView.onKeyPressed = rectViewOnKeyPressedAtView;
                            rectView.strokeWidth = 2.0;
                            rectView.width = 120.0;
                            rectView.height = 20.0;
                            rectView.arcWidth = 5.0;
                            rectView.arcHeight = 5.0;
                            lblAddNewDrug.visible = true;
                            lblAddNewDrug.cursor = javafx.scene.Cursor.HAND;
                            __layoutInfo_lblAddNewDrug.width = 100.0;
                            lblAddNewDrug.text = "Add New Drug";
                            lblAddNewDrug.font = Arial_Bold_14;
                            lblEditDrug.visible = false;
                            lblEditDrug.text = "Label";
                            lblEditDrug.hpos = javafx.geometry.HPos.LEFT;
                            lblViewDrug.visible = true;
                            lblViewDrug.cursor = javafx.scene.Cursor.HAND;
                            __layoutInfo_lblViewDrug.width = 120.0;
                            lblViewDrug.font = Arial_Bold_14;
                            panelAlert.visible = false;
                            panel.visible = true;
                            panelPopUp.visible = false;
                            panelFormulation.visible = true;
                            panelTher.visible = true;
                            panelManufacturer.visible = false;
                            panel2.visible = true;
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
                            rectHeader.visible = true;
                            rectHeader.layoutX = 0.0;
                            rectHeader.height = 32.0;
                            lblTitle.layoutX = 0.0;
                            lblTitle.layoutY = 1.0;
                            lblTitle.text = "Drug Details - alt+D";
                            lblTitle.hpos = javafx.geometry.HPos.CENTER;
                            panelTable.visible = true;
                            panelTable.layoutY = 180.0;
                            rectTableBorder.visible = true;
                            rectTableBorder.layoutY = 180.0;
                            labelDrug_Code.layoutY = 0.0;
                            labelDrug_Code.font = Arial_12;
                            labelDrug_Name.layoutY = 28.0;
                            labelDrug_Name.font = Arial_12;
                            labelGeneric_Name.layoutY = 56.0;
                            labelGeneric_Name.font = Arial_12;
                            labelTherapeutic.layoutY = 84.0;
                            __layoutInfo_labelTherapeutic.width = 150.0;
                            labelTherapeutic.font = Arial_12;
                            labelTherapeutic.textWrap = false;
                            labelSub_Therapeutic.layoutY = 110.0;
                            __layoutInfo_labelSub_Therapeutic.width = 110.0;
                            labelSub_Therapeutic.text = "Sub-Therapeutic / Sub - Classification";
                            labelSub_Therapeutic.font = Arial_12;
                            labelIndication.layoutY = 140.0;
                            labelIndication.font = Arial_12;
                            txtDrugItmCode.disable = false;
                            txtDrugItmCode.layoutY = 0.0;
                            txtDrugItmCode.onKeyPressed = txtDrugItmCodeOnKeyPressedAtShown;
                            txtDrugItmCode.editable = false;
                            txtDrugItmName.layoutY = 28.0;
                            txtDrugItmName.onKeyPressed = txtDrugItmNameOnKeyPressedAtShown;
                            txtDrugItmName.onKeyReleased = txtDrugItmNameOnKeyReleasedAtShown;
                            txtDrugItmName.font = Arial_12;
                            txtDrugGeneric.layoutY = 56.0;
                            txtDrugGeneric.onKeyPressed = txtDrugGenericOnKeyPressedAtShown;
                            txtDrugGeneric.font = Arial_12;
                            txtDrugTherap.layoutY = 84.0;
                            txtDrugTherap.onKeyPressed = txtDrugTherapOnKeyPressedAtShown;
                            txtDrugTherap.font = Arial_12;
                            txtDrugSubTherap.layoutY = 112.0;
                            txtDrugSubTherap.onKeyPressed = txtDrugSubTherapOnKeyPressedAtShown;
                            txtDrugSubTherap.font = Arial_12;
                            txtDrugIndication.layoutY = 140.0;
                            txtDrugIndication.onKeyPressed = txtDrugIndicationOnKeyPressedAtShown;
                            txtDrugIndication.font = Arial_12;
                            labelFormulation.text = "Formulation";
                            labelFormulation.font = Arial_12;
                            labelDosage.font = Arial_12;
                            labelCompany_Name.font = Arial_12;
                            labelPackage.text = "Package Type";
                            labelPackage.font = Arial_12;
                            labelMRP.font = Arial_12;
                            labelVAT.visible = true;
                            labelVAT.text = "VAT";
                            labelVAT.font = Arial_12;
                            label2.visible = false;
                            label2.text = "Schedule";
                            label2.font = Arial_12;
                            txtDrugCname.onKeyPressed = txtDrugCnameOnKeyPressedAtShown;
                            txtDrugFormulation.onKeyPressed = txtDrugFormulationOnKeyPressedAtShown;
                            txtDrugFormulation.font = Arial_12;
                            txtDrugDosage.onKeyPressed = txtDrugDosageOnKeyPressedAtShown;
                            txtDrugDosage.font = Arial_12;
                            txtDrugPackType.onKeyPressed = txtDrugPackTypeOnKeyPressedAtShown;
                            txtDrugPackType.font = Arial_12;
                            txtDrugMRP.onKeyPressed = txtDrugMRPOnKeyPressedAtShown;
                            txtDrugMRP.font = Arial_12;
                            rdoVATmrp.visible = true;
                            rdoVATmrp.layoutY = 186.0;
                            rdoVATmrp.text = "VAT on MRP";
                            rdoVATmrp.font = Arial_12;
                            rdoVATmrp.toggleGroup = toggleGroup;
                            rdovatpur.visible = true;
                            rdovatpur.layoutY = 207.0;
                            rdovatpur.text = "VAT on Purchase Price";
                            rdovatpur.font = Arial_12;
                            rdovatpur.toggleGroup = toggleGroup;
                            ChoiceVAT.visible = true;
                            ChoiceVAT.onKeyPressed = ChoiceVATOnKeyPressedAtShown;
                            ChoiceVAT.onMouseClicked = ChoiceVATOnMouseClickedAtShown;
                            btnAddVAT.visible = false;
                            btnAddVAT.layoutY = 15.0;
                            btnAddVAT.text = "Button";
                            btnAddBarcode.visible = false;
                            btnAddBarcode.layoutY = 0.0;
                            btnAddBarcode.text = "Button";
                            btnDeleteBarcode.visible = false;
                            btnDeleteBarcode.layoutY = 0.0;
                            btnDeleteBarcode.text = "Button";
                            lblBarcode.visible = false;
                            lblBarcode.opacity = 1.0;
                            lblBarcode.layoutY = 0.0;
                            lblBarcode.text = "Label";
                            lblBarcode.textFill = javafx.scene.paint.Color.BLACK;
                            txtBarcode.visible = false;
                            txtBarcode.layoutY = 0.0;
                            listBarcode.visible = false;
                            listBarcode.disable = false;
                            listBarcode.layoutY = 188.0;
                            listBarcode.onMouseClicked = listBarcodeOnMouseClicked;
                            listBarcode.items = null;
                            listDrug.visible = false;
                            listDrug.layoutY = 0.0;
                            listDrug.onKeyPressed = listDrugOnKeyPressedAtShown;
                            imageView2.visible = true;
                            imageView2.layoutY = 84.0;
                            imageView2.blocksMouse = true;
                            imageView2.fitHeight = 0.0;
                            imageView4.disable = false;
                            imageView4.layoutY = 112.0;
                            imageView4.blocksMouse = true;
                            imageView4.fitHeight = 0.0;
                            imageView5.fitHeight = 0.0;
                            mfrImage.visible = false;
                            mfrImage.blocksMouse = false;
                            mfrImage.image = null;
                            mfrImage.fitHeight = 0.0;
                            imageView6.visible = false;
                            imageView6.layoutY = 56.0;
                            imageView6.blocksMouse = false;
                            imageView6.image = null;
                            imageView6.fitHeight = 0.0;
                            label11.visible = true;
                            label11.layoutY = 5.0;
                            label11.text = "Keyword";
                            label11.font = Arial_12;
                            panelControls.visible = false;
                            panelControls.layoutY = 100.0;
                            imageView.visible = true;
                            btnDrugSave.layoutY = 0.0;
                            btnDrugSave.text = "Update [F2]";
                            btnDrugSave.font = Arial_Bold_14;
                            btnDrugSave.action = btnDrugSaveActionAtShown;
                            imgEdit.visible = true;
                            imgEdit.image = imageEdit;
                            btnDrugEdit.layoutY = 0.0;
                            btnDrugEdit.text = "Edit [F4]";
                            btnDrugEdit.font = Arial_Bold_14;
                            btnDrugEdit.action = btnDrugEditActionAtShown;
                            imageView3.visible = true;
                            btnDrugReset.layoutY = 0.0;
                            btnDrugReset.text = "Reset [F5]";
                            btnDrugReset.font = Arial_Bold_14;
                            btnDrugReset.action = btnDrugResetActionAtShown;
                            imgCancel.visible = true;
                            imgCancel.image = imageCancel;
                            btnDrugCancel.layoutY = 0.0;
                            btnDrugCancel.text = "Cancel [Alt+X]";
                            btnDrugCancel.font = Arial_Bold_14;
                            btnDrugCancel.action = btnDrugCancelActionAtShown;
                            panelButtons.visible = false;
                            label.visible = true;
                            label.layoutX = 40.0;
                            label.layoutY = 60.0;
                            label.text = "Edit Drug Details";
                            label.font = Arial_18;
                            label.textFill = Green;
                            separator.visible = true;
                            separator.layoutX = 30.0;
                            separator.layoutY = 85.0;
                            label15.visible = true;
                            label15.text = "Quick Navigation";
                            label15.font = Arial_14;
                            label15.textFill = Green;
                            panelAtoZ.visible = true;
                            panelAtoZ.layoutY = 123.0;
                            txtStkSearch.visible = true;
                            __layoutInfo_txtStkSearch.height = 25.0;
                            txtStkSearch.onKeyPressed = txtStkSearchOnKeyPressedAtView;
                            txtStkSearch.font = Arial_12;
                            label13.visible = true;
                            label13.layoutY = 5.0;
                            label13.text = "Search By";
                            label13.font = Arial_12;
                            cmbSearchBox.visible = true;
                            cmbSearchBox.layoutY = 0.0;
                            __layoutInfo_cmbSearchBox.height = 25.0;
                            cmbSearchBox.onKeyPressed = cmbSearchBoxOnKeyPressedAtView;
                            cmbSearchBox.items = [ "Drug Name", "Formulation", "Generic Name", "Therapeutic Name", "Indication", ];
                            btnDrugSearch.visible = true;
                            btnDrugSearch.layoutY = 0.0;
                            __layoutInfo_btnDrugSearch.width = 100.0;
                            __layoutInfo_btnDrugSearch.height = 28.0;
                            btnDrugSearch.onKeyPressed = btnDrugSearchOnKeyPressedAtView;
                            btnDrugSearch.onMouseClicked = btnDrugSearchOnMouseClickedAtView;
                            btnDrugSearch.effect = reflectionEffect;
                            btnDrugSearch.text = "Search";
                            btnDrugSearch.font = Arial_Bold_14;
                            btnReport.visible = false;
                            btnReport.layoutY = 0.0;
                            __layoutInfo_btnReport.width = 92.0;
                            __layoutInfo_btnReport.height = 28.0;
                            btnReport.effect = reflectionEffect;
                            btnReport.text = "Report";
                            btnReport.font = Arial_Bold_14;
                            btnReport.action = btnReportActionAtView;
                            panelsearch.visible = true;
                            panelsearch.layoutX = 0.0;
                            panelsearch.layoutY = 100.0;
                            productCount.visible = true;
                            productCount.text = "";
                            productCount.font = Arial_14;
                            rectangle3.visible = true;
                            rectangle3.arcWidth = 5.0;
                            rectangle3.arcHeight = 5.0;
                            rectView.visible = true;
                            rectView.onKeyPressed = rectViewOnKeyPressedAtView;
                            rectView.strokeWidth = 2.0;
                            rectView.width = 120.0;
                            rectView.height = 20.0;
                            rectView.arcWidth = 5.0;
                            rectView.arcHeight = 5.0;
                            lblAddNewDrug.visible = true;
                            __layoutInfo_lblAddNewDrug.width = 120.0;
                            lblAddNewDrug.text = "Add New Drug";
                            lblAddNewDrug.font = Arial_Bold_12;
                            lblEditDrug.visible = true;
                            __layoutInfo_lblEditDrug.width = 120.0;
                            __layoutInfo_lblEditDrug.height = 20.0;
                            lblEditDrug.onMouseClicked = lblEditDrugOnMouseClickedAtView;
                            lblEditDrug.text = "Edit Drug";
                            lblEditDrug.font = Arial_Bold_12;
                            lblEditDrug.hpos = javafx.geometry.HPos.CENTER;
                            lblViewDrug.visible = false;
                            __layoutInfo_lblViewDrug.width = 120.0;
                            lblViewDrug.font = Arial_Bold_12;
                            panelAlert.visible = false;
                            panel.visible = true;
                            panelPopUp.visible = true;
                            panelFormulation.visible = false;
                            panelTher.visible = false;
                            panelManufacturer.visible = false;
                            panel2.visible = false;
                        }
                    }
                ]
            }
        ]
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel, panel2, ]
    }
    // </editor-fold>//GEN-END:main
    function btnDeleteBarcodeOnKeyPressedAtEdit(event: javafx.scene.input.KeyEvent): Void {
        deleteBarcode();
     }

    function btnDeleteBarcodeOnMouseClickedAtEdit(event: javafx.scene.input.MouseEvent): Void {
        deleteBarcode();
     }
     
     function deleteBarcode():Void {
        if(txtBarcode.rawText.trim().equals("")) {
            FXinfo("please select the barcode to remove");
            txtBarcode.requestFocus();
        }
        else if(not listBarcode.selectedItem.toString().equals(txtBarcode.rawText.trim())) {
            FXinfo("please select barcode from the list");
            txtBarcode.requestFocus();
        }
        else {
            barCodeList.remove(listBarcode.selectedItem);
            txtBarcode.text = "";
            listBarcode.items = barCodeList.toArray();
            listBarcodeHeight =25*listBarcode.items.size();
            listBarcode.visible=true;
        }
    }

    function listBarcodeOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        txtBarcode.text=listBarcode.selectedItem.toString();
        listBarcode.visible = false;
        btnAddBarcode.requestFocus();
     }

    function listBarcodeOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            txtBarcode.text=listBarcode.selectedItem.toString();
            listBarcode.visible = false;
            btnAddBarcode.requestFocus();
        }
     }

    function txtBarcodeOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {        
        if(event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ESCAPE) {
            listBarcode.visible=false;
            txtDrugCname.requestFocus();
        }
        else if(listBarcode.items!=null and event.code == KeyCode.VK_DOWN){
            listBarcode.visible=true;
            listBarcode.requestFocus();
            listBarcode.selectFirstRow();
        }
        else if(btnDrugSave.text=="Update [F7]") {
            listBarcode.items = barCodeList.toArray();
            var size = listBarcode.items.size();
            println("List Size {size}");
            listBarcodeHeight =25*size;
            if(size > 0) {
                listBarcode.visible = true;
                listBarcode.selectFirstRow();
            }
            else {
                listBarcode.visible = false;
            }
            if (event.code == KeyCode.VK_ENTER) {
                var itemCode:String = commonController.getQueryValue("select item_id from barcode_mapping where barcode='{txtBarcode.rawText.trim()}' and delete_flag=0");
                if(not itemCode.equals("")) {
                    displayItem(itemCode);
                    txtDrugCname.requestFocus();
                }
                else {
                    btnAddBarcode.requestFocus();
                }
            }
        }
        else {
            if (event.code == KeyCode.VK_ENTER) {
                listBarcode.visible=false;
                btnAddBarcode.requestFocus();
            }
        }
        shortcut(event);
     }

    function btnAddBarcodeOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            saveBarcode();
            txtBarcode.requestFocus();
        }
        else if(event.code == KeyCode.VK_TAB){
            if(btnDrugSave.text.equals("Update [F7]") ) {
                btnDeleteBarcode.requestFocus();
            }
            else {
                txtDrugCname.requestFocus();
            }
        }     
    }

    function btnAddBarcodeOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
            saveBarcode();
    }

    function saveBarcode():Void {
        var barcodeExists = Integer.parseInt(commonController.getQueryValue("select count(barcode) from barcode_mapping where barcode='{txtBarcode.rawText.trim()}' and delete_flag=0"));
        if(txtBarcode.rawText.trim().equals("")) {
            FXinfo("Please enter the barcode");
            txtBarcode.requestFocus();
        }
        else if(barCodeList.contains(txtBarcode.rawText.trim())){
            FXinfo("The entered barcode is already added");
            txtBarcode.requestFocus();
            listBarcode.visible = true;
        }
        else if(barcodeExists > 0) {
            FXinfo("The entered barcode is already mapped for another product");
            txtBarcode.requestFocus();
        }
        else {
            barCodeList.add(txtBarcode.rawText.trim());
            txtBarcode.text = "";
            listBarcode.items = barCodeList.toArray();
            var size = listBarcode.items.size();
            listBarcodeHeight =25*size;
            listBarcode.visible = true;
        }
    }

    function imageView6OnMouseClickedAtEdit(event: javafx.scene.input.MouseEvent): Void {
        getGenericName(0);
     }

    function imageView6OnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        if(not listDrug.visible){
        getGenericName(0);
        }
        else{
           listDrug.visible = false;
           txtDrugGeneric.requestFocus();
       }
     }

    function txtDrugGenericOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {               
          getGenericName(1);
          if (event.code == KeyCode.VK_DOWN and listDrug.items != null) {
            listDrug.requestFocus();
            listDrug.selectFirstRow();
          }
        if (event.code == KeyCode.VK_ESCAPE) {
            listDrug.visible = false;
            listDrug.requestFocus();
        }
        }

    //var gi: GetInformation;
    function txtDrugCnameOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        getMfrName(event);
        if (event.code == KeyCode.VK_DOWN)
            listDrug.requestFocus();
    }

    function mfrImageOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        try {
            getMName();
        } catch (e: Exception) {
            var msg: String = "Class : DoctorInformation method : getSpecialist()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function getMfrName(event: javafx.scene.input.KeyEvent) {
        try {
            getMName();
            if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB) {
                listDrug.visible = false;
                txtDrugCname.requestFocus();
            }
        } catch (e: Exception) {
            var msg: String = "Class : DoctorInformation method : getSpecialist()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function getMName(): Void {
        if(not listDrug.visible){
        var drugBean = new DrugModel();
        var mfrName: List = new ArrayList();
        listH = 0.0;
        listDrug.visible = true;
        listDrug.layoutX = txtDrugCname.layoutX;
        listDrug.layoutY = txtDrugCname.layoutY + 25;
        listW = txtDrugCname.width;
        var size = listDrug.items.size();
        if (not listDrug.items.isEmpty()) {
            for (i in [0..<size])
                listDrug.items[i] = null;
        }
        drugBean.setMfr_name(txtDrugCname.rawText.trim());
        mfrName = commonController.getListItems(drugBean.getMfr_name(), "", "MFR");        
        listDrug.clearSelection();
        listDrug.items = mfrName.toArray();
        listDrug.onKeyPressed = function(e) {
                    if (e.code == KeyCode.VK_ENTER) {
                        txtDrugCname.text = "{listDrug.selectedItem}";
                        listDrug.visible = false;
                        if (txtDrugCname.rawText == "Others") {
                            popManufacturer();
                        }
                        txtDrugFormulation.requestFocus();
                    } else if (e.code == KeyCode.VK_DOWN) {
                        if (listDrug.selectedIndex == 0) {
                            listDrug.selectFirstRow();
                        }
                    } else if (e.code == KeyCode.VK_ESCAPE) {
                        listDrug.visible = false;
                        txtDrugMRP.requestFocus();
                    }
                };
        listDrug.onMouseClicked = function(e) {
                    txtDrugCname.text = "{listDrug.selectedItem}";                    
                    listDrug.visible = false;
                    if (txtDrugCname.rawText == "Others") {
                            popManufacturer();
                        }
                    txtDrugFormulation.requestFocus();
                }
        var height: Integer = 0;
        if (listDrug.items.size() < 10) {
            height = listDrug.items.size();
        } else {
            height = 10;
        }
        for (i in [1..height]) {
            listH += 25.0;
        }
       }
       else{
             listDrug.visible=false;

        }
    }

    var iC: Integer = 0;

    function txtScheduleOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        //TODO
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtDrugMRP.requestFocus(); }
        shortcut(event);
    }

    function popFormulation(): Void {
        panelFormulation.visible = true;
        AddFormulation.Show();
    }


    function popManufacturer(): Void {
        panelManufacturer.visible = true;
        AddManufacturer.Show();
    }

    function popTherapetic(): Void {
        panelTher.visible = true;
        AddTher.Show();
    }

    function btnAddVATActionAtShown(): Void {
        panelPopUp.visible = true;
        AddUnits.Show();
    }

    function btnDrugSaveOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB) {
            btnDrugEdit.requestFocus();
        } else if (event.code == KeyCode.VK_ENTER) {
            btnDrugSaveActionAtShown();
        } else {
            shortcut(event);
        }
    }

    function rectViewOnKeyPressedAtView(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB) {
            txtStkSearch.requestFocus();
        } else if (event.code == KeyCode.VK_ENTER) {
            edit();
        } else {
            shortcut(event);
        }
    }

    function btnDrugSearchOnKeyPressedAtView(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            viewCl();
        } else {
            shortcut(event);
        }
    }

    function rectangle3OnKeyPressedAtView(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB) {
            rectView.requestFocus();
        } else if (event.code == KeyCode.VK_ENTER) {
            AddNew();
        } else {
            shortcut(event);
        }
    }

    function cmbSearchBoxOnKeyPressedAtView(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB) {
            btnDrugSearch.requestFocus();
        }
    }

    function rectViewOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB) {
            txtDrugItmName.requestFocus();
        } else if (event.code == KeyCode.VK_ENTER) {
            View();
        } else {
            shortcut(event);
        }
    }

    function btnDrugCancelOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB) {
            rectView.requestFocus();
        } else if (event.code == KeyCode.VK_ENTER) {
            btnDrugCancelActionAtShown();
        } else {
            shortcut(event);
        }
    }

    function btnDrugResetOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB) {
            btnDrugCancel.requestFocus();
        } else if (event.code == KeyCode.VK_ENTER) {
            btnDrugResetActionAtShown();
        } else {
            shortcut(event);
        }
    }

    function btnDrugEditOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB) {
            btnDrugReset.requestFocus();
        } else if (event.code == KeyCode.VK_ENTER) {
            btnDrugEditActionAtShown();
        } else {
            shortcut(event);
        }
    }

    function rectangleOnMouseClicked(event: javafx.scene.input.KeyEvent): Void {
        listDrug.visible = false;
    }

    function txtStkSearchOnKeyPressedAtView(event: javafx.scene.input.KeyEvent): Void {
        txtStkSearch.style = mandatory;
        if (event.code == KeyCode.VK_TAB) {
            cmbSearchBox.requestFocus();
        } }

    var sar: Integer = 0;
    var sar1: Integer = 0;
    var sar2: Integer = 0;

    function btnDrugSaveOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB) {
            btnDrugEdit.requestFocus();
        } else if (event.code == KeyCode.VK_ENTER) {
            btnDrugSaveActionAtShown();
        } else {
            shortcut(event);
        }
    }

    function imageView5OnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if(not listDrug.visible){
        listDrug.layoutX = txtDrugFormulation.layoutX;
        listDrug.layoutY = txtDrugFormulation.layoutY + 25;
        listH = 0.0;
        listW = txtDrugFormulation.width;
        var formulation: List = new ArrayList();
        listDrug.visible = true;
        var size = listDrug.items.size();
        if (not listDrug.items.isEmpty()) {
            for (i in [0..<size])
                listDrug.items[i] = null;
                txtDrugFormulation.requestFocus();
        }
        formulation = commonController.getListItems("", "", "FOR");        
        listDrug.clearSelection();
        listDrug.items = formulation.toArray();
        listDrug.onKeyPressed = function(e) {
                    if (e.code == KeyCode.VK_ENTER) {
                        txtDrugFormulation.text = "{listDrug.selectedItem}";

                        listDrug.visible = false;
                        if (txtDrugFormulation.rawText == "Others") {
                            popFormulation();
                        }
                        txtDrugDosage.requestFocus();
                    } else if (e.code == KeyCode.VK_DOWN) {
                        if (listDrug.selectedIndex == 0) {
                            listDrug.selectFirstRow();
                        }
                    } else if (e.code == KeyCode.VK_ESCAPE) {
                        listDrug.visible = false;
                        txtDrugFormulation.requestFocus();
                    }
                };
        listDrug.onMouseClicked = function(e) {
                    txtDrugFormulation.text = "{listDrug.selectedItem}";
                    listDrug.visible = false;
                    if (txtDrugFormulation.rawText == "Others") {
                        popFormulation();
                    }
                    txtDrugDosage.requestFocus();
                }

        var height: Integer = 0;
        if (listDrug.items.size() < 10) {
            height = listDrug.items.size();
        } else {
            height = 10;
        }
        for (i in [1..height]) {
            listH += 25.0;
        }

        txtDrugFormulation.requestFocus();
        }
        else{
            listDrug.visible=false;
            txtDrugFormulation.requestFocus();
        }
    }

    function imageView4OnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if(not listDrug.visible){
        var drugBean = new DrugModel();
        listDrug.layoutX = txtDrugSubTherap.layoutX;
        listDrug.layoutY = txtDrugSubTherap.layoutY + 25;
        listH = 0.0;
        listW = txtDrugSubTherap.width;
        var subtherapeutic: List = new ArrayList();;
        listDrug.visible = true;
        var size = listDrug.items.size();
        if (not listDrug.items.isEmpty()) {
            for (i in [0..<size])
                listDrug.items[i] = null;
            txtDrugSubTherap.requestFocus();
        }
        drugBean.setClassification(txtDrugTherap.rawText.trim());
        drugBean.setSub_classification(txtDrugSubTherap.rawText.trim());
        subtherapeutic = commonController.getListItems("", drugBean.getClassification(), "STH");               
        listDrug.clearSelection();
        listDrug.items = subtherapeutic.toArray();
        listDrug.onKeyPressed = function(e) {
                    if (e.code == KeyCode.VK_ENTER) {
                        txtDrugSubTherap.text = "{listDrug.selectedItem}";
                        listDrug.visible = false;
                        txtDrugIndication.requestFocus();
                    } else if (e.code == KeyCode.VK_DOWN) {
                        if (listDrug.selectedIndex == 0) {
                            listDrug.selectFirstRow();
                        }
                    } else if (e.code == KeyCode.VK_ESCAPE) {
                        listDrug.visible = false;
                        txtDrugSubTherap.requestFocus();
                    }
                };
        listDrug.onMouseClicked = function(e) {
                    txtDrugSubTherap.text = "{listDrug.selectedItem}";
                    listDrug.visible = false;
                    txtDrugIndication.requestFocus();
                }

        var height: Integer = 0;
        if (listDrug.items.size() < 10) {
            height = listDrug.items.size();
        } else {
            height = 10;
        }
        for (i in [1..height]) {
            listH += 25.0;
        }
        txtDrugSubTherap.requestFocus();
      }
       else{
           listDrug.visible = false;
           txtDrugSubTherap.requestFocus();
       }
    }

    function imageView2OnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
//        var commonController: CommonController = new CommonController();
        if(not listDrug.visible){
        listDrug.layoutX = txtDrugTherap.layoutX;
        listDrug.layoutY = txtDrugTherap.layoutY + 25;
        listH = 0.0;
        listW = txtDrugTherap.width;
        var therapeutic: List = new ArrayList();;
        listDrug.visible = true;
        var size = listDrug.items.size();
        if (not listDrug.items.isEmpty()) {
            for (i in [0..<size])
                listDrug.items[i] = null;
            txtDrugTherap.requestFocus();
        }
        therapeutic = commonController.getListItems("", "", "THE");        
        listDrug.clearSelection();
        listDrug.items = therapeutic.toArray();
        listDrug.onKeyPressed = function(e) {
                    if (e.code == KeyCode.VK_ENTER) {
                        txtDrugTherap.text = "{listDrug.selectedItem}";
                        if (txtDrugTherap.rawText == "Others") {
                            popTherapetic();
                        }
                        listDrug.visible = false;
                        txtDrugSubTherap.requestFocus();
                    } else if (e.code == KeyCode.VK_DOWN) {
                        if (listDrug.selectedIndex == 0) {
                            listDrug.selectFirstRow();
                        }
                    } else if (e.code == KeyCode.VK_ESCAPE) {
                        listDrug.visible = false;
                        txtDrugTherap.requestFocus();
                    }
                };
        listDrug.onMouseClicked = function(e) {
                    txtDrugTherap.text = "{listDrug.selectedItem}";
                    if (txtDrugTherap.rawText == "Others") {
                        popTherapetic();
                    }
                    listDrug.visible = false;
                    txtDrugSubTherap.requestFocus();
                }

        var height: Integer = 0;
        if (listDrug.items.size() < 10) {
            height = listDrug.items.size();
        } else {
            height = 10;
        }
        for (i in [1..height]) {
            listH += 25.0;
        }

        txtDrugTherap.requestFocus();
      }
       else{
           listDrug.visible = false;
           txtDrugTherap.requestFocus();
       }
    }

    function btnDrugSearchOnMouseClickedAtView(event: javafx.scene.input.MouseEvent): Void {
        viewCl();
    }

    function btnDrugSearchAction(): Void {

        viewCl();
    }

    function panelTableOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
    }

    function panelTableOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
    }

    function txtDrugFormulationOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        listDrug.layoutX = txtDrugFormulation.layoutX;
        listDrug.layoutY = txtDrugFormulation.layoutY + 25;
        var n: Integer = 0;
        n = getFormulation(event);
        sar2 = n;
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            if (n == 0 or txtDrugFormulation.rawText.trim() == null or txtDrugFormulation.rawText.trim() == "null") {
                txtDrugFormulation.text = " ";
            }
        } else if (event.code == KeyCode.VK_DOWN) {
            listDrug.requestFocus();
        }
        if (event.code == KeyCode.VK_DOWN) {
            listDrug.requestFocus();
            listDrug.selectFirstRow();
        }
    }

    function txtDrugSubTherapOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        listDrug.layoutX = txtDrugSubTherap.layoutX;
        listDrug.layoutY = txtDrugSubTherap.layoutY + 25;
        getSubTherapeutic(event);
        var n: Integer = 0;
        n = getSubTherapeutic(event);
        sar1 = n;
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            if (n == 0 or txtDrugSubTherap.rawText.trim() == null or txtDrugSubTherap.rawText.trim() == "null") {
                txtDrugSubTherap.text = " ";
            }
        } else if (event.code == KeyCode.VK_DOWN) {
            listDrug.requestFocus();
        }
    }

    function txtDrugTherapOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        listDrug.layoutX = txtDrugTherap.layoutX;
        listDrug.layoutY = txtDrugTherap.layoutY + 25;
        var n: Integer = 0;
        n = getTherapeutic(event);
        sar = n;
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            if (n == 0 or txtDrugTherap.rawText.trim() == null or txtDrugTherap.rawText.trim() == "null") {
                txtDrugTherap.text = " ";
            }
        } else if (event.code == KeyCode.VK_DOWN) {
            listDrug.requestFocus();
            listDrug.selectFirstRow();
        }
    }

    function rectangleOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        listDrug.visible = false;
    }

    function btnReportActionAtView(): Void {

        try {/*
        var con = DBConnection.getStatement().getConnection();
        var reportSource1:String = "{path}""/reportfiles/drug_search.jrxml";
        var params1  = new HashMap();
        s=txtStkSearch.text;
        if (cmbSearchBox.selectedItem=="Drug Name")
        {
        params1.put("type1",'product_name');
        params1.put("stktext",s);
        }
        else if(cmbSearchBox.selectedItem=="Formulation")
        {
        params1.put("type1",'formulation');
        params1.put("stktext",s);
        }
        var jasperReport =JasperCompileManager.compileReport(reportSource1);
        var jasperPrint =JasperFillManager.fillReport(jasperReport, params1, con);
        JasperViewer.viewReport(jasperPrint,false);
         */
        } catch (e: Exception) {
            log.debug(e);
        }
    }

    function viewCl(): Void {
        try {
           
            var k: Integer = 0;
            var itemName: String = txtStkSearch.rawText.trim();
            var producttype: Integer = cmbSearchBox.selectedIndex;

            if (itemName == null or itemName.trim().length() < 0) {
                FXinfo("Please enter a valid search value ", txtStkSearch);
            } else if (producttype < 0) {
                FXinfo("Please enter a valid search value ", txtDrugItmCode);
            } else {
                drugViewTable.clearData();
                currentState.actual = currentState.findIndex("View");
                var sa: String = "No Products Found.";
                productCount.text = "";
                k = drugViewTable.clearDatas();
                if (k == 1) {
                    sa = drugViewTable.searchDrugInformationValues(itemName, producttype);
                    productCount.text = sa;
                }
            }
        } catch (e: Exception) {
            var msg: String = "Class : DrugInformation  Method : btnDrugSearchActionAtView()  = {e.getMessage()}";
            log.debug(msg);
        }

    }

    function viewTableLayout(): Void {
        drugTable.layoutX = 0;
        drugTable.layoutY = 0;
        //        drugTable.getJComponent().setPreferredSize(new Dimension(712, 260));
        TableH = 280.0;
        txtStkSearch.requestFocus();
        cmbSearchBox.select(0);
    }

    function lblViewDrugOnMouseClickedAtEdit(event: javafx.scene.input.MouseEvent): Void {
        View();
    }

    function View(): Void {        
        viewTableLayout();
        drugViewTable.loaddDrugInformationValues();
        currentState.actual = currentState.findIndex("View");
        txtStkSearch.text = "";
        productCount.text = "";
        drugViewTable.drugSetId = "-1";
    }

    function lblEditDrugOnMouseClickedAtView(event: javafx.scene.input.MouseEvent): Void {
        edit();      
    }

    function lblAddNewDrugOnMouseClickedAtView(event: javafx.scene.input.MouseEvent): Void {
        AddNew();
    }

    function AddNew(): Void {
        currentState.actual = currentState.findIndex("Shown");
        setTableLay();
        clear();
    }

    public function setTableLay(): Void {        
        drugTable.layoutX = 0;
        drugTable.layoutY = 0;
        //        drugTable.getJComponent().setPreferredSize(new Dimension(712, 192));
        TableH = 192;
        drugViewTable.addBasicRows();
        drugViewTable.loaddDrugInformationValues();
        txtDrugGeneric.requestFocus();
//        if(drugViewTable.drugSetId=="-1") {
//            barCodeList.clear();
//            listBarcode.items=null;
//            listBarcode.visible=false;
//        }

    /*        if(setting==1){
    if(btnDrugEdit.text=="Delete [F5]") {
    btnDrugEdit.disable=false;
    }else{
    btnDrugEdit.disable=true;
    }
    }
     */
    }

    def kr = KeyRegistry {};
    var ss = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 4 and CommonDeclare.form[3] == 1) {
            shortcut(ss);
        }
    }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {

        if (event.controlDown or event.altDown or event.shiftDown) {
            kr.actionKey = event.code;
        }

        if (event.code == kr.save and btnDrugSave.text == "Save [F3]" and not btnDrugSave.disable) {
            save();
        }
        if (event.code == kr.edit and btnDrugEdit.text == "Edit [F6]" and not btnDrugEdit.disable) {
            edit();
        }
        if (event.code == kr.reset and btnDrugReset.text == "Reset [F4]") {
            reset();
        }
        if (event.code == kr.update) {
            if (btnDrugSave.text == "Update [F7]" and not btnDrugSave.disable) { update(); }
        }
        if (event.code == kr.del) {
            if (btnDrugEdit.text == "Delete [F5]" and not btnDrugEdit.disable) { del(); }
        }
        if (event.controlDown and event.code == kr.back) {
            if (btnDrugCancel.text == "Back [Ctrl+Left]") { back(); }
        }
        if (event.code == kr.cancel) {
            if (btnDrugCancel.text == "Cancel [F8]") { panel.visible = false; CancelForm(); }
        }
    }

    function ChoiceVATOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
//        var commonController = new CommonController();
        VAT = commonController.getListItems("", "", "VAT").toArray();
        ChoiceVAT.select(0);
    }

    function ChoiceVATOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            btnDrugSave.requestFocus();
        }
        shortcut(event);
    }

    function txtDrugMRPOnKeyTypedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (txtDrugMRP.rawText.trim().length() > 0) {
            if (not isNumeric(txtDrugMRP)) {
                //FXinfo("Please enter only Numerals.", txtCashIntoduced);
                //txtDrugMRP.text = "0.00";
                txtDrugMRP.selectEnd();
            }
        }
    }

    function txtDrugMRPOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtDrugMRP.style = mandatory;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            ChoiceVAT.requestFocus();
            if (not isNumeric(txtDrugMRP)) {
                ChoiceVAT.requestFocus();                
                VAT = commonController.getListItems("", "", "VAT").toArray();
                ChoiceVAT.select(0);
            }
        }
        shortcut(event);
    }

    function txtDrugPackTypeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {

        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
        txtSchedule.requestFocus(); }
        shortcut(event);
    }

    function txtDrugDosageOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {

        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtDrugPackType.requestFocus(); }
        shortcut(event);
    }

    function txtDrugCnameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtDrugCname.style = mandatory;
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtDrugFormulation.requestFocus(); }
        shortcut(event);
    }

    function txtDrugFormulationOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtDrugFormulation.style = mandatory;
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {

            if (sar2 == 0 or txtDrugFormulation.rawText.trim() == null or txtDrugFormulation.rawText.trim().trim().length() == 0 or txtDrugFormulation.rawText.trim() == "null") {
                txtDrugFormulation.text = " ";
            }

            txtDrugDosage.requestFocus();

        } else {

            shortcut(event);
        }

    }

    function txtDrugIndicationOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtDrugCname.requestFocus(); } else { shortcut(event); }
    }

    function txtDrugSubTherapOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {

        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            if (sar1 == 0 or txtDrugSubTherap.rawText.trim() == null or txtDrugSubTherap.rawText.trim().trim().length() == 0 or txtDrugSubTherap.rawText.trim() == "null") {
                txtDrugSubTherap.text = " ";
            }
            txtDrugIndication.requestFocus();

        } else {

            shortcut(event);
        }

    }

    function txtDrugTherapOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            if (sar == 0 or txtDrugTherap.rawText.trim() == null or txtDrugTherap.rawText.trim().trim().length() == 0 or txtDrugTherap.rawText.trim() == "null") {
                txtDrugTherap.text = " ";
            }
            txtDrugSubTherap.requestFocus();
        } else {
            shortcut(event);
        }
    }

    function txtDrugGenericOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtDrugTherap.requestFocus();
            }
        shortcut(event);
    }

    function txtDrugItmNameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtDrugItmName.style = mandatory;
        if(event.code == kr.update and txtDrugItmName.text.equals("")){
          FXinfo("Please enter Item Name.", txtDrugItmName);
        }else{shortcut(event);
        if (btnDrugSave.text == "Update [F7]") {

            var g: GetDrugTable = new GetDrugTable();            
            g.setMyTransferHandlers(txtDrugItmName.rawText.trim(), 1);
            g.jTextField1.setText(txtDrugItmName.rawText.trim());
            g.requestFocusInWindow();
            g.setVisible(true);
            g.requestFocus();
            updateValues();           
        } else if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            txtDrugGeneric.requestFocus();
        }
        }
    }

    function txtDrugItmCodeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) { txtDrugItmName.requestFocus(); }
        shortcut(event);
    }

    function btnDrugSaveActionAtShown(): Void {
        if (btnDrugSave.text == "Save [F3]") {
            save();
        } else {
            update();
        }
    }

    function btnDrugCancelActionAtShown(): Void {
        cancel();
    }

    function btnDrugResetActionAtShown(): Void {
        reset();
        //back();
    }

    function btnDrugEditActionAtShown(): Void {
        if (btnDrugEdit.text == "Delete [F5]") {
            del();
        } else {
            edit();
        }
    }

    public function reset(): Void {
        txtDrugItmCode.requestFocus();
        txtDrugItmName.requestFocus();
        clear();
        txtDrugItmCode.text = "";
        srCode = itemCode();
        if (srCode == "") {
            srCode = "IC0000001";
        }
        txtDrugItmCode.text = srCode;
    }

    public function edit(): Void {
        try {            
            CancelW = bottonW + 50;
            if (drugViewTable.drugSetId != "-1") {
                currentState.actual = currentState.findIndex("Edit");
                setTableLay();
                displayItem(drugViewTable.drugSetId);
            } else {
                currentState.actual = currentState.findIndex("Edit");
                setTableLay();
                clear();
            }
        } catch (e: Exception) {
            var msg: String = "Class :Drug  Method  : edit() = {e.getMessage()}";
            log.debug(msg);
        
        }
    }

    public function save(): Void {
        try {
            var drugBean: DrugModel = new DrugModel();            
            var san: Integer = 0;
            san = clickValid();
            if (san == 10) {
                srCode = itemCode();
                    if (srCode == "") {
                        srCode = "IC0000001";
                    }
                txtDrugItmCode.text = srCode;
                drugBean.setDrug_code(txtDrugItmCode.rawText.trim().replace("'", ""));
                drugBean.setDrug_name(txtDrugItmName.rawText.trim().replaceAll("['\\\\]"," "));
                drugBean.setGeneric_name(txtDrugGeneric.rawText.trim().replace("'", ""));
                drugBean.setClassification(txtDrugTherap.rawText.trim().replace("'", ""));
                drugBean.setSub_classification(txtDrugSubTherap.rawText.trim().replace("'", ""));
                drugBean.setIndication(txtDrugIndication.rawText.trim().replace("'", ""));
                drugBean.setMfr_name(txtDrugCname.rawText.trim().replace("'", ""));
                drugBean.setFormulation(txtDrugFormulation.rawText.trim().replace("'", ""));
                drugBean.setDosage(txtDrugDosage.rawText.trim().replace("'", ""));
                drugBean.setPack(txtDrugPackType.rawText.trim().replace("'", ""));
                drugBean.setMrp(Double.valueOf(txtDrugMRP.rawText.trim()));
                drugBean.setSchedule(txtSchedule.rawText.trim().replace("'", ""));
                drugBean.setVAT_percentage(Double.valueOf(ChoiceVAT.selectedItem.toString()));
                drugBean.setMfr_name_short(txtDrugCname.rawText.trim().replace("'", "").replace(". ", "").substring(0, 3).toUpperCase());
                drugBean.setFormulation_short(txtDrugFormulation.rawText.trim().replace("'", "").replace("- ", "").substring(0, 3).toUpperCase());
                drugBean.setGenericname_short(txtDrugGeneric.rawText.trim().replace("'", "").concat("-").concat(txtDrugDosage.rawText.trim().replace("'", "")));
                if(rdovatpur.selected == true){
                drugBean.setVat_calc_flag(0);//0 when VAT calculated based on purchase price
                }
                else {
                drugBean.setVat_calc_flag(1);//1 when VAT calculated based on MRP
                }
                drugBean.setBarcode(barCodeList);
                drugBean.setUserName(CommonDeclare.user);
                if (drugController.createRecord(drugBean).equals(true)) {
                    FXinfo("Data Saved Successfully");                    
                    UserLog('DrugInformation', 'Save');
                    FXalert(0);
                    txtDrugItmCode.requestFocus();
                    srCode = itemCode();
                    if (srCode == "") {
                        srCode = "IC0000001";
                    }
                    txtDrugItmCode.text = srCode;
                    clear();
                }
            }
        } catch (e: SQLException) {
            var msg: String = "Class : DrugInformation  Method : save()  = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function update(): Void {
        try {
            var drugBean: DrugModel = new DrugModel();            
            var san: Integer = 0;
            san = clickValid();
            if (san == 10) {
                
                drugBean.setDrug_code(txtDrugItmCode.rawText.trim().replace("'", ""));
                drugBean.setDrug_name(txtDrugItmName.rawText.trim().replace("'", ""));
                drugBean.setGeneric_name(txtDrugGeneric.rawText.trim().replace("'", ""));
                drugBean.setClassification(txtDrugTherap.rawText.trim().replace("'", ""));
                drugBean.setSub_classification(txtDrugSubTherap.rawText.trim().replace("'", ""));
                drugBean.setIndication(txtDrugIndication.rawText.trim().replace("'", ""));
                drugBean.setMfr_name(txtDrugCname.rawText.trim().replace("'", ""));
                drugBean.setFormulation(txtDrugFormulation.rawText.trim().replace("'", ""));
                drugBean.setDosage(txtDrugDosage.rawText.trim().replace("'", ""));
                drugBean.setPack(txtDrugPackType.rawText.trim().replace("'", ""));
                drugBean.setMrp(Double.parseDouble(txtDrugMRP.rawText.trim()));
                drugBean.setVAT_percentage(Double.parseDouble(ChoiceVAT.selectedItem.toString()));
                drugBean.setSchedule(txtSchedule.rawText.trim().replace("'", ""));
                drugBean.setMfr_name_short(txtDrugCname.rawText.trim().replace("'", "").replace(". ", "").substring(0, 3).toUpperCase());
                drugBean.setFormulation_short(txtDrugFormulation.rawText.trim().replace("'", "").replace("- ", "").substring(0, 3).toUpperCase());
                drugBean.setGenericname_short(txtDrugGeneric.rawText.trim().replace("'", "").concat("-").concat(txtDrugDosage.rawText.trim().replace("'", "")));
                if(rdovatpur.selected == true){
                drugBean.setVat_calc_flag(0);//0 when VAT calculated based on purchase price
                }
                else {
                drugBean.setVat_calc_flag(1);//1 when VAT calculated based on MRP
                }
                drugBean.setBarcode(barCodeList);
                drugBean.setUserName(CommonDeclare.user);
                                var cn:ConfirmDialogBox=new ConfirmDialogBox(0,"Drug Information");
                                var a =bind cn.staus;
                                if (a) {                                                       
                                    if (drugController.updateRecord(drugBean).equals(true)) {
                                        txtDrugItmCode.requestFocus();
                                        txtDrugItmCode.text = "";
                                        clear();
                                        UserLog('Drug Information', 'Update');
                                        FXalert(4);
                                        currentState.actual = currentState.findIndex("Shown");
                                        setTableLay();
                                    }
                                }
            }
        } catch (e: SQLException) {
            var msg: String = "Class : DrugInformation  Method : update()  = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function del(): Void {        
        try {
            if (txtDrugItmName.text != null) {
                var drugBean = new DrugModel();
                drugBean.setPassVale(5);
                drugBean.setDrug_code(txtDrugItmCode.rawText.trim().replace("'", ""));
                var cnt: Integer = drugController.viewRecord(drugBean) as Integer;
                if (cnt == 0) {
                     var cn:ConfirmDialogBox=new ConfirmDialogBox(1,"Drug Information");
                                    var a =bind cn.staus;

                                    if (a) {
                                        if (drugController.deleteRecord(drugBean)) {                                            
                                            UserLog('Drug Information', 'delete');
                                             FXalert(5);
                                            txtDrugItmCode.requestFocus();
                                            txtDrugItmCode.text = "";
                                            clear();
                                            currentState.actual = currentState.findIndex("Shown");
                                            setTableLay();

                                        }
                                    }

                } else {
                    var cn:ConfirmDialogBox1=new ConfirmDialogBox1(0,"Drug Information","<html>The Deleted Product, are available in the stock, <br> Do you want to remove the same product from the stock?</html>");
                                    var a =bind cn.staus;
                                    if (a) {
                                        drugBean.setPassVale(15);
                                         if (drugController.deleteRecord(drugBean)) {
                                        UserLog('Drug Information', 'Deleted');
                                        txtDrugItmCode.requestFocus();
                                        txtDrugItmCode.text = "";
                                        clear();
                                        currentState.actual = currentState.findIndex("Shown");
                                        setTableLay();
                                         FXalert(5);
                                        }
                                    }
                }
            } else {
                FXinfo("Please Select the Name...", txtDrugItmName);
            }
        } catch (e: Exception) {
            var msg: String = "Class : DrugInformation  Method : del()  = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function back(): Void {
        CancelW = bottonW;
        currentState.actual = currentState.findIndex("Shown");
        clear();
        setTableLay();
        srCode = itemCode();
        if (srCode == "") {
            srCode = "IC0000001";
        }
        txtDrugItmCode.text = srCode;
    }

    public function cancel(): Void {
        if (btnDrugCancel.text == "Back [Ctrl+Left]") {
            back();
        } else {
            panel.visible = false;
            CancelForm();
        }
    }

    function listDrugOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {

        if (listDrug.focused) {
            if (event.code == KeyCode.VK_DOWN)
                listDrug.selectFirstRow();
        }
    }

    function txtDrugItmNameOnKeyReleasedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (btnDrugSave.text == "Update [F7]") {
            
            var g: GetDrugTable = new GetDrugTable();
            g.jTextField1.setText(txtDrugItmName.rawText.trim());
            txtDrugItmName.text = "";
        }
    }

    function getDrug(event: javafx.scene.input.KeyEvent): Void {
        var drugBean: DrugModel = new DrugModel();
        listH = 0.0;
        listW = txtDrugItmName.width;
        var drugname: List = new ArrayList();;
        listDrug.visible = true;
        var size = listDrug.items.size();
        if (not listDrug.items.isEmpty()) {
            for (i in [0..<size])
                listDrug.items[i] = null;
            txtDrugItmName.requestFocus();
        }
        drugBean.setDrug_name(txtDrugItmName.rawText.trim());
        drugname = commonController.getListItems(drugBean.getDrug_name(), "", "DRU");

        listDrug.clearSelection();
        listDrug.items = drugname.toArray();
        listDrug.onKeyPressed = function(e) {
                    if (e.code == KeyCode.VK_ENTER) {
                        txtDrugItmName.text = "{listDrug.selectedItem}";
                        var sam: String = txtDrugItmName.text;
                        displayItem(sam);
                        listDrug.visible = false;
                        txtDrugGeneric.requestFocus();
                    } else if (e.code == KeyCode.VK_DOWN) {
                        if (listDrug.selectedIndex == 0) {
                            listDrug.selectFirstRow();
                        }
                    } else if (e.code == KeyCode.VK_ESCAPE) {
                        listDrug.visible = false;
                        txtDrugItmName.requestFocus();
                    }
                };
        listDrug.onMouseClicked = function(e) {
                    txtDrugItmName.text = "{listDrug.selectedItem}";
                    var sam: String = txtDrugItmName.text;
                    displayItem(sam);
                    listDrug.visible = false;
                    txtDrugGeneric.requestFocus();
                }

        var height: Integer = 0;
        if (listDrug.items.size() < 10) {
            height = listDrug.items.size();
        } else {
            height = 10;
        }
        for (i in [1..height]) {
            listH += 25.0;
        }
        if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB)
            listDrug.visible = false;
        txtDrugItmName.requestFocus();
    }
    function getGenericName(type:Integer): Void {
        try {
        listH = 0.0;
        listW = txtDrugGeneric.width;
        listDrug.layoutX = txtDrugGeneric.layoutX;
        listDrug.layoutY = txtDrugGeneric.layoutY + 25;
        var genericName: List = new ArrayList();
        listDrug.visible = true;
        var size = listDrug.items.size();
        if (not listDrug.items.isEmpty()) {
            for (i in [0..<size])
                listDrug.items[i] = null;
                txtDrugGeneric.requestFocus();
        }
        var typedText = txtDrugGeneric.rawText.trim();
        if(type==0) {
         typedText = "";
        }
        genericName = commonController.getDrugGenerics(typedText, "drug");
            listDrug.clearSelection();
            listDrug.items = genericName.toArray();
            var selectedString: String = "";
            listDrug.onKeyPressed = function(e) {
                        if (e.code == KeyCode.VK_ENTER) {
                            selectedString  = "{listDrug.selectedItem}";
                            if (selectedString == null or selectedString.trim().length() == 0) {
                                selectedString = "";
                            }
                            txtDrugGeneric.text=selectedString;
                            listDrug.visible = false;
                            txtDrugTherap.requestFocus();
                        } else if (e.code == KeyCode.VK_DOWN) {
                            if (listDrug.selectedIndex == 0) {
                                listDrug.selectFirstRow();
                            }
                        } else if (e.code == KeyCode.VK_ESCAPE) {
                            listDrug.visible = false;
                            txtDrugGeneric.requestFocus();
                        }
                    };
            listDrug.onMouseClicked = function(e) {
                            selectedString  = "{listDrug.selectedItem}";
                            if (selectedString == null or selectedString.trim().length() == 0) {
                                selectedString = "";
                            }
                            txtDrugGeneric.text=selectedString;
                            listDrug.visible = false;
                            txtDrugGeneric.requestFocus();
                    }

            var height: Integer = 0;
            if (listDrug.items.size() < 8) {
                height = listDrug.items.size();
            } else {
                height = 7;
            }
            for (i in [1..height]) {
                listH += 25.0;
            }
            var selectString = bind selectedString on replace {
            if (selectString.length() > 0) {
                txtDrugTherap.requestFocus();
            }           
        }
        }
        catch(e:Exception) {
            var msg: String = "Class : DrugInformation  Method : getGenericName()  = {e.getMessage()}";
            log.debug(msg);
        }
    }
    function getTherapeutic(event: javafx.scene.input.KeyEvent): Integer {

        var drugBean = new DrugModel();
        listH = 0.0;

        listW = txtDrugTherap.width;
        var m: Integer = 0;

        var therapeuticName: List = new ArrayList();;
        listDrug.visible = true;
        var size = listDrug.items.size();
        if (not listDrug.items.isEmpty()) {
            for (i in [0..<size])
                listDrug.items[i] = null;
            txtDrugTherap.requestFocus();
        }
        drugBean.setClassification(txtDrugTherap.rawText.trim());
//        var commonController: CommonImplements = new CommonController();
        therapeuticName = commonController.getListItems(drugBean.getClassification(), "", "THE");

        if (therapeuticName.size() > 0) {

            m = 5;
            listDrug.clearSelection();
            listDrug.items = therapeuticName.toArray();
            listDrug.onKeyPressed = function(e) {
                        if (e.code == KeyCode.VK_ENTER) {
                            txtDrugTherap.text = "{listDrug.selectedItem}";
                            if (m == 0 or txtDrugTherap.rawText.trim() == null or txtDrugTherap.rawText.trim() == "null") { m = 0; txtDrugTherap.text = ""; }

                            if (txtDrugTherap.rawText == "Others") {
                                popTherapetic();
                            }

                            listDrug.visible = false;
                            txtDrugSubTherap.requestFocus();
                        } else if (e.code == KeyCode.VK_DOWN) {
                            if (listDrug.selectedIndex == 0) {
                                listDrug.selectFirstRow();
                            }
                        } else if (e.code == KeyCode.VK_ESCAPE) {
                            listDrug.visible = false;
                            txtDrugTherap.requestFocus();
                        }
                    };
            listDrug.onMouseClicked = function(e) {
                        txtDrugTherap.text = "{listDrug.selectedItem}";
                        if (m == 0 or txtDrugTherap.rawText.trim() == null or txtDrugTherap.rawText.trim() == "null") { m = 0; txtDrugTherap.text = ""; }
                        if (txtDrugTherap.rawText == "Others") {
                            popTherapetic();
                        }
                        listDrug.visible = false;
                        txtDrugSubTherap.requestFocus();
                    }

            var height: Integer = 0;
            if (listDrug.items.size() < 10) {
                height = listDrug.items.size();
            } else {
                height = 10;
            }
            for (i in [1..height]) {
                listH += 25.0;
            }
            if (event.code == KeyCode.VK_ESCAPE or event.code == KeyCode.VK_TAB)
                txtDrugTherap.requestFocus();
        } else {

            m = 0; listDrug.visible = false;
        }
        if (event.code == KeyCode.VK_ESCAPE) {
            listDrug.visible = false;
            if (m == 0 or txtDrugTherap.rawText.trim() == null or txtDrugTherap.rawText.trim() == "null") {
                m = 0; txtDrugTherap.text = "";
            }
        }
        return m;
    }


    function getFormulation(event: javafx.scene.input.KeyEvent): Integer {
        var drugBean = new DrugModel();
        listH = 0.0;

        listW = txtDrugFormulation.width;
        var m: Integer = 0;

        var formulationName: List = new ArrayList();
        listDrug.visible = true;
        var size = listDrug.items.size();
        if (not listDrug.items.isEmpty()) {
            for (i in [0..<size])
                listDrug.items[i] = null;
            txtDrugFormulation.requestFocus();
        }
        drugBean.setFormulation(txtDrugFormulation.rawText.trim());
//        var commonController: CommonImplements = new CommonController();
        formulationName = commonController.getListItems(drugBean.getFormulation(), "", "FOR");

        if (formulationName.size() > 0) {

            m = 5;

            listDrug.clearSelection();
            listDrug.items = formulationName.toArray();
            listDrug.onKeyPressed = function(e) {
                        if (e.code == KeyCode.VK_ENTER) {
                            txtDrugFormulation.text = "{listDrug.selectedItem}";
                            if (m == 0 or txtDrugFormulation.rawText.trim() == null or txtDrugFormulation.rawText.trim() == "null") { m = 0; txtDrugFormulation.text = ""; }
                            listDrug.visible = false;
                            if (txtDrugFormulation.rawText == "Others") {
                                popFormulation();
                            }

                            txtDrugDosage.requestFocus();

                        } else if (e.code == KeyCode.VK_DOWN) {
                            if (listDrug.selectedIndex == 0) {
                                listDrug.selectFirstRow();
                            }
                        } else if (e.code == KeyCode.VK_ESCAPE) {
                            listDrug.visible = false;
                            txtDrugFormulation.requestFocus();
                        }
                    };
            listDrug.onMouseClicked = function(e) {
                        txtDrugFormulation.text = "{listDrug.selectedItem}";
                        if (m == 0 or txtDrugFormulation.rawText.trim() == null or txtDrugFormulation.rawText.trim() == "null") { m = 0; txtDrugFormulation.text = ""; }
                        listDrug.visible = false;
                        if (txtDrugFormulation.rawText == "Others") {
                            popFormulation();
                        }
                        txtDrugDosage.requestFocus();
                    }
            var height: Integer = 0;
            if (listDrug.items.size() < 10) {
                height = listDrug.items.size();
            } else {
                height = 10;
            }
            for (i in [1..height]) {
                listH += 25.0;
            }

        } else {
            m = 0; listDrug.visible = false;

        }
        if (event.code == KeyCode.VK_ESCAPE) {
            listDrug.visible = false;
            if (m == 0 or txtDrugFormulation.rawText.trim() == null or txtDrugFormulation.rawText.trim() == "null") { m = 0; txtDrugFormulation.text = ""; }
        }

        txtDrugFormulation.requestFocus();
        return m;
    }

    function getSubTherapeutic(event: javafx.scene.input.KeyEvent): Integer {
        var drugBean = new DrugModel();
        listH = 0.0;
        listW = txtDrugSubTherap.width;
        var subTherapeutic: List = new ArrayList();
        listDrug.visible = true;
        var size = listDrug.items.size();
        if (not listDrug.items.isEmpty()) {
            for (i in [0..<size])
                listDrug.items[i] = null;
            txtDrugSubTherap.requestFocus();
        }
        var m: Integer = 0;
        drugBean.setClassification(txtDrugTherap.rawText.trim());
        drugBean.setSub_classification(txtDrugSubTherap.rawText.trim());
//        var commonController: CommonImplements = new CommonController();
        subTherapeutic = commonController.getListItems(drugBean.getSub_classification(), drugBean.getClassification(), "STH");
        if (subTherapeutic.size() > 0) {
            m = 5;
            listDrug.clearSelection();
            listDrug.items = subTherapeutic.toArray();
            listDrug.onKeyPressed = function(e) {
                        if (e.code == KeyCode.VK_ENTER) {
                            txtDrugSubTherap.text = "{listDrug.selectedItem}";
                            if (m == 0 or txtDrugSubTherap.rawText.trim() == null or txtDrugSubTherap.rawText.trim() == "null") { m = 0; txtDrugSubTherap.text = ""; }
                            listDrug.visible = false;
                            txtDrugIndication.requestFocus();
                        } else if (e.code == KeyCode.VK_DOWN) {
                            if (listDrug.selectedIndex == 0) {
                                listDrug.selectFirstRow();
                            }
                        } else if (e.code == KeyCode.VK_ESCAPE) {
                            listDrug.visible = false;
                            txtDrugSubTherap.requestFocus();
                        }
                    };
            listDrug.onMouseClicked = function(e) {
                        txtDrugSubTherap.text = "{listDrug.selectedItem}";
                        if (m == 0 or txtDrugSubTherap.rawText.trim() == null or txtDrugSubTherap.rawText.trim() == "null") { m = 0; txtDrugSubTherap.text = ""; }
                        listDrug.visible = false;
                        txtDrugIndication.requestFocus();
                    }

            var height: Integer = 0;
            if (listDrug.items.size() < 10) {
                height = listDrug.items.size();
            } else {
                height = 10;
            }
            for (i in [1..height]) {
                listH += 25.0;
            }

        } else {
            m = 0; listDrug.visible = false;
        }

        if (event.code == KeyCode.VK_ESCAPE) {
            listDrug.visible = false;
            if (m == 0 or txtDrugSubTherap.rawText.trim() == null or txtDrugSubTherap.rawText.trim() == "null") { m = 0; txtDrugSubTherap.text = ""; }
        }
        txtDrugSubTherap.requestFocus();
        return m;
    }

    public function clear(): Void {
        txtBarcode.text = "";
        barCodeList.clear();
        listBarcode.items=null;
        listBarcodeHeight=0;
        listBarcode.visible=false;
        txtSchedule.text = "";
        txtDrugItmName.text = "";
        txtDrugGeneric.text = "";
        txtDrugTherap.text = "";
        txtDrugSubTherap.text = "";
        txtDrugIndication.text = "";
        txtDrugCname.text = "";
        txtDrugFormulation.text = "";
        txtDrugDosage.text = "";
        txtDrugPackType.text = "";
        txtDrugMRP.text = "";
//        var commonController: CommonImplements = new CommonController();
        VAT = commonController.getListItems("", "", "VAT").toArray();
        ChoiceVAT.select(0);
        txtDrugItmName.requestFocus();
        txtStkSearch.text = "";
        productCount.text = "";
        drugViewTable.drugSetId = "-1";
        if(not txtDrugItmName.equals(""))
        {
        drugViewTable.loaddDrugInformationValues();
        }

        srCode = itemCode();
        if (srCode == "") {
            srCode = "IC0000001";
        }
        txtDrugItmCode.text = srCode;
        iC = 0;
        rdovatpur.selected = true;
    }

    public function itemCode(): String {
        var code: String = "";
        var finalCode: String = "";
        var vanCode: String = "IC";
        try {
            var rs: ResultSet = null;
//            var commonController: CommonImplements = new CommonController();
            code = commonController.getMasterAutoIncrement("drugInfo");
        
        //            rs = DBConnection.getStatement().executeQuery("SELECT MAX(item_id) as item_id from drugtable");
        //            while (rs.next()) {
        //                code = rs.getString("item_id");
        //            }
        } catch (e: SQLException) {
            var msg: String = "Class : DrugInformation  Method : itemCode()  = {e.getMessage()}";
            log.debug(msg);
        }
        if (code == "") {
            finalCode = "";
        } else {
            try {
                var len: Integer = code.trim().length();
                var subSt: String = code.substring(2, len);
                var subStr: Integer = Integer.parseInt(subSt);
                subStr = subStr + 1;
                var hCode: String = String.valueOf(subStr);
                var lent: Integer = hCode.trim().length();
                if (lent == 1) {
                    vanCode = vanCode.concat("000000");
                } else if (lent == 2) {
                    vanCode = vanCode.concat("00000");
                } else if (lent == 3) {
                    vanCode = vanCode.concat("0000");
                } else if (lent == 4) {
                    vanCode = vanCode.concat("000");
                } else if (lent == 5) {
                    vanCode = vanCode.concat("00");
                } else if (lent == 6) {
                    vanCode = vanCode.concat("0");
                }
                finalCode = vanCode.concat(hCode);
            } catch (e) {
                var msg: String = "Class : DrugInformation  Method : itemCode() Error in auto increment creation = {e.getMessage()}";
                log.debug(msg);
            }
            return finalCode;
        }
    }

    

    public function displayItem(name: String): Void {
        try {            
            var drugBean = new DrugModel();
            drugBean.setPassVale(1);
            //drugBean.setDrug_name(name);
            drugBean.setDrug_code(name);
            //var dc: Drug = new DrugController();
            drugBean = drugController.viewRecord(drugBean) as DrugModel;            
            txtDrugItmCode.text = drugBean.getDrug_code();
            txtDrugItmName.text = drugBean.getDrug_name();
            txtDrugGeneric.text = drugBean.getGeneric_name();
            txtDrugTherap.text = drugBean.getClassification();
            txtDrugSubTherap.text = drugBean.getSub_classification();
            txtDrugIndication.text = drugBean.getIndication();
            txtDrugCname.text = drugBean.getMfr_name();
            txtDrugFormulation.text = drugBean.getFormulation();
            txtDrugDosage.text = drugBean.getDosage();
            txtDrugPackType.text = drugBean.getPack();
            txtDrugMRP.text = drugBean.getMrp().toString();
            VAT[0] = drugBean.getVAT_percentage().toString();
            vatflag=drugBean.getVat_calc_flag();
            if(vatflag==0) {
                rdovatpur.selected=true;
            }
            else {
                rdoVATmrp.selected=true;
            }            
            txtSchedule.text = drugBean.getSchedule();
            iC = drugBean.getDrug_id();
            ChoiceVAT.select(0);
            barCodeList=drugBean.getBarcode();
            if(barCodeList.size() > 0) {
                txtBarcode.text = barCodeList.get(0).toString();
            }
            else {
                txtBarcode.text = "";
            }
            listBarcode.visible = false;
        } catch (e: Exception) {
            var msg: String = "Class : DrugInformation  Method : displayItem()  = {e.getMessage()}";
            log.debug(msg);
        }
        txtDrugCname.requestFocus();
    }

     function chkExistBarcodes(): String {
        var barcodeExists:String="";
        try{
            for (i in [0..barCodeList.size()-1]) {
                var qry = "select barcode from barcode_mapping where barcode ='{barCodeList.get(i)}' and delete_flag=0";
                if(btnDrugSave.text=="Update [F7]"){
                    qry = "select barcode from barcode_mapping where barcode ='{barCodeList.get(i)}' and item_id!='{txtDrugItmCode.text}' and delete_flag=0";
                }
                barcodeExists=commonController.getQueryValue(qry);
                if(not barcodeExists.equals("")) {
                    break;
                }
            }
        }catch(e:Exception){
            e.printStackTrace();
        }
        return barcodeExists;
    }


    public function clickValid(): Integer {
        var icode = txtDrugItmCode.rawText.trim().replace("'", "");
        var iname = txtDrugItmName.rawText.trim().replace("'", "");
        var ther = txtDrugTherap.rawText.trim().replace("'", "");
        var sther = txtDrugSubTherap.rawText.trim().replace("'", "");
        var indic = txtDrugIndication.rawText.trim().replace("'", "");
        var cname = txtDrugCname.rawText.trim().replace("'", "");
        var formul = txtDrugFormulation.rawText.trim().replace("'", "");
        var pack = txtDrugPackType.rawText.trim().replace("'", "");
        var mp = txtDrugMRP.rawText.trim().replace("'", "");
        var sch = txtSchedule.rawText.trim().replace("'", "");
        var cnt: Integer = 0;
        var val: Validation = new Validation();
        var itemExists: String = commonController.getQueryValue("SELECT itemcode FROM drugtable d where dru_flag_id!=3 and itemname='{txtDrugItmName.rawText.trim()}' and dosage='{txtDrugDosage.rawText.trim()}' and formulation_length='{txtDrugFormulation.rawText.trim()}'");
        var itemExistsUpdate: String = commonController.getQueryValue("SELECT itemcode FROM drugtable d where dru_flag_id!=3 and itemname='{txtDrugItmName.rawText.trim()}' and dosage='{txtDrugDosage.rawText.trim()}' and formulation_length='{txtDrugFormulation.rawText.trim()}' and item_id !='{txtDrugItmCode.rawText.trim()}'");
        try {
            var pk: Integer = 0; pk = val.getAlphaNumericValid(pack, 4, 30);
            var m: Integer = 0; m = val.getDecimalValid(mp, 1, 10);
            if (iname.trim().length() <= 0) {
                FXinfo("Please enter Item Name.", txtDrugItmName);
            } else if (cname.trim().length() <= 3) {
                FXinfo("Please enter a minimum of 4 Characters.", txtDrugCname);
            } else if (formul.trim().length() <= 0) {
                FXinfo("Please enter formulation type.", txtDrugFormulation);
            } else if (formul.trim().length() < 3) {
                FXinfo("Formulation length should not be less than 3 characters", txtDrugFormulation);
            }     
            else if (mp.trim().length() <= 0) {
                FXinfo("Please enter a value for MRP.", txtDrugMRP);
            } else if (m != 10) {
                FXinfo("MRP accepts decimal values.", txtDrugMRP);
            } else if (ChoiceVAT.selectedItem == "---Select---" or ChoiceVAT.selectedItem == null) {
                FXinfo("Please select a valid VAT for given Item.", txtDrugItmCode);
                VAT = commonController.getListItems("", "", "VAT").toArray();
                ChoiceVAT.select(0);
            } else if (sch.length()>3) {                
                FXinfo("Schedule Contains Maximum Two Characters", txtSchedule);
            } else if(btnDrugSave.text == "Save [F3]" and itemExists!="") {
                FXinfo("The same item already exists in Drug masters. please check.");
            } else if(btnDrugSave.text == "Update [F7]" and itemExistsUpdate!="") {
                FXinfo("The same item already exists in Drug masters. please check.");
            } else if (not chkExistBarcodes().equals("")) {
                FXinfo("The entered barcode {chkExistBarcodes()}  is already mapped.");
                txtBarcode.requestFocus();
            }
            else {
                cnt = 10;
            }
        } catch (e: Exception) {
            var msg: String = "Class : DrugInformation  Method : clickValid()  = {e.getMessage()}";
            log.debug(msg);
        }
        return cnt;
    }

    public function getPrivileges(u: String): Void {
        var uname = u;
        var utype = commonController.getUserType(uname);
        if (utype.equals("User")) {
            var priv = commonController.getPrivileges("masters", uname);
            var ss = priv.split(",");
            var val = Integer.parseInt(ss[0]);
            if (val == 1) {
                btnDrugSave.disable = true;
                if (btnDrugEdit.text != "Edit [F6]") {
                    btnDrugEdit.disable = true;
                } else {
                    btnDrugEdit.disable = false;
                }
            } else if (val == 2) {
                if (btnDrugEdit.text != "Edit [F6]") {
                    btnDrugEdit.disable = true;
                } else {
                    btnDrugEdit.disable = false;
                }
                btnDrugSave.disable = false;
            //This code for  READ and WRITE Access
            } else if (val == 3) {
                btnDrugSave.disable = false;
                btnDrugEdit.disable = false;
            //This code for FULL Access
            }
        } else {
            btnDrugSave.disable = false;
            btnDrugEdit.disable = false;
        }
    }

    var logUser: String = bind CommonDeclare.user on replace {
        getPrivileges(logUser);
    }
    var changPiv = bind btnDrugSave.text on replace {
        getPrivileges(logUser);
    }
    var changPiv1 = bind btnDrugEdit.text on replace {
        getPrivileges(logUser);
    }



    public function updateValues(): Void {
        try {                                   
            if (btnDrugSave.text == "Update [F7]" ) {                
                if (drugViewTable.drugSetId != "-1") {
                    displayItem(drugViewTable.drugSetId);
                    drugViewTable.drugSetId = "-1";
                }
            }
            if (GetDrugTable.cnt == 1) {
                txtDrugItmCode.text = GetDrugTable.itemCode;                
               if (txtDrugItmCode.text != null and txtDrugItmCode.text.trim().length() > 1)
                {
                    displayItem(txtDrugItmCode.text);
                    txtDrugMRP.requestFocus();
                }
                GetDrugTable.cnt = 0;
            }
            delete  panelPopUp.content;
            AddUnits.panel.visible = false;
            insert AddUnits.panel into panelPopUp.content;
            delete  panelFormulation.content;
            AddFormulation.panel.visible = false;            
            insert AddFormulation.panel into panelFormulation.content;
            delete  panelTher.content;
            AddTher.panel.visible = false;
            insert AddTher.panel into panelTher.content;
            delete  panelManufacturer.content;
            AddManufacturer.panel.visible = false;
            insert AddManufacturer.panel into panelManufacturer.content;
        } catch (e: Exception) {
            var msg: String = "Class : Drug Information  method : updateValues()  = {e.getMessage()}";           
            log.debug(msg);
        }
    }

    public function CancelForm(): Void {
        CommonDeclare.form[3] = 0;
    }

    public function isNumeric(t: TextBox): Boolean {
        try {
            Double.parseDouble(t.rawText);
            return true;
        } catch (Exception) {
            t.text = '';
            t.deletePreviousChar();
            return false;
        }
    }

    public function isAdd(t: TextBox): Double {
        var a: Double = 0.00;
        a = a + Double.parseDouble(t.rawText);
        return a;
    }

    public function UserLog(formName: String, actionName: String): Void {
//        var commonController: CommonImplements = new CommonController();
        var checkLog = commonController.getUserLog(formName, actionName);
        if (checkLog == false) {
        }
    }
    public function StartUp(): Void {
        clear();
        (drugVTable as javax.swing.JTable).addMouseListener(MouseAdapter {
            override public function mouseClicked(e: java.awt.event.MouseEvent): Void {
                drugViewTable.viewDrugCalculations();
                updateValues();
            }
        });
        (drugVTable as javax.swing.JTable).addMouseListener(MouseAdapter {
            override public function mouseReleased(e: java.awt.event.MouseEvent): Void {
                drugViewTable.viewDrugCalculations();
                updateValues();
            }
        });
        txtDrugCname.style = mandatory;
        txtDrugMRP.style = mandatory;
        txtDrugItmName.style = mandatory;
        txtDrugFormulation.style = mandatory;
        panel.visible = true;
        drugViewTable.drugSetId = "-1";
        cmbSearchBox.select(0);
        txtStkSearch.text = "";
        var alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",];
        def Zeroto9 = for (i in [0..8])
                    Hyperlink {
                        visible: true
                        cursor: javafx.scene.Cursor.HAND
                        layoutX: bind (i * (2.287166455 * panelW / 100)) + (59.46632783 * panelW / 100)
                        layoutY: 25
                        text: "{i + 1}"
                        font: Arial_Bold_14
                        hpos: javafx.geometry.HPos.CENTER
                        width: 20.0
                        height: 20.0
                        onMouseClicked: function(event: javafx.scene.input.MouseEvent): Void {
                            txtStkSearch.text = String.valueOf(i + 1);
                            cmbSearchBox.select(0);
                            drugViewTable.clearData();
                            var lblVal: String = drugViewTable.searchDrugInformationValues(String.valueOf(i + 1), 0);
                            productCount.text = lblVal;
                        }
                    }
        def AtoZ = for (j in [0..25])
                    Hyperlink {
                        visible: true
                        cursor: javafx.scene.Cursor.HAND
                        layoutX: bind j * (2.287166455 * panelW / 100)
                        layoutY: 25
                        text: alphabet[j]
                        font: Arial_Bold_12
                        hpos: javafx.geometry.HPos.CENTER
                        width: 20.0
                        height: 20.0
                        focusTraversable: true
                        onMouseClicked: function(event: javafx.scene.input.MouseEvent): Void {
                            txtStkSearch.text = String.valueOf(alphabet[j]);
                            cmbSearchBox.select(0);
                            drugViewTable.clearData();
                            var lblVal: String = drugViewTable.searchDrugInformationValues(String.valueOf(alphabet[j]), 0);
                            productCount.text = lblVal;
                        }
                    }
        panelAtoZ.content = [label15, AtoZ, Zeroto9,];
        panelTable.content = [drugTable,];
        clear();
        srCode = itemCode();
        if (srCode == "") {
            srCode = "IC0000001";
        }
        txtDrugItmCode.text = srCode;
        setTableLay();
        getPrivileges(logUser);
        updateValues();
        txtDrugItmName.requestFocus();
    // DateTime();
    }
}

