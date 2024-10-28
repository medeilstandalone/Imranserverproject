package com.vanuston.medeil.ui;

import java.lang.* ;
import javafx.ext.swing.SwingComponent ;
import com.vanuston.medeil.uitables.GenericSearchTable ;
import java.awt.Dimension ;
import com.vanuston.medeil.util.CommonDeclare;
import javafx.scene.control.TextBox;
import com.vanuston.medeil.util.Logger;
import javafx.scene.input.KeyCode;
import com.vanuston.medeil.model.DrugModel;
import javafx.scene.control.Hyperlink;

public class GenericSearch {
    //Controller Reference
    var drugModel: DrugModel = new DrugModel() ;
    var genericSearch : GenericSearchTable =new GenericSearchTable () ;
    var rowNo = 1;
    var colNames: Object[] = ["Item Code", "Item Name", "Dosage", "Formulation", "Therapeutic", "SubTherapeutic", "Indication", "MFR Name", "MRP"];
    var colType: Class[] = [java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.Integer.class, java.lang.String.class, java.lang.String.class];
    var colEditable: Boolean[] = [false, false, false, false, false, false, false, false, false];
    var colWidth: Integer[] = [25, 30, 50, 50, 50, 50, 30, 30, 30] ;
    var table = genericSearch.createViewTable(rowNo, colNames, colType, colEditable, colWidth) ;
    var BankDetails = SwingComponent.wrap(genericSearch.getScrollTable(table)) ;
    var log: Logger = Logger.getLogger(GenericSearch.class, "Generic Search");
    
    var listH : Float= 0.0;
    var listW : Float= 0.0;
    var panelW = bind CommonDeclare.panelFormW;
    var panelH = bind CommonDeclare.panelFormH;
    var C1LX = bind CommonDeclare.Column1LX+160;
    var C2LX = bind CommonDeclare.Column2LX+160;
    var C3LX = bind CommonDeclare.Column3LX;
    var C4LX = bind CommonDeclare.Column4LX;
    var seperatorW = bind CommonDeclare.seperatorW;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;
    var Type4TextboxW = bind CommonDeclare.Type4TextboxW;
    var panelButtonsLY = bind CommonDeclare.panelButtonsLY;
    var botton1LX = bind CommonDeclare.botton1LX;
    var botton2LX = bind CommonDeclare.botton2LX;
    var botton3LX = bind CommonDeclare.botton3LX;
    var botton4LX = bind CommonDeclare.botton4LX;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    var bottonW = bind CommonDeclare.bottonW;
    var bottonH = bind CommonDeclare.bottonH;

    var TableW = bind (95.29860229 * panelW) / 100 on replace { changeTableSize(TableW, TableH); };
    var TableH = 285.0 on replace { changeTableSize(TableW, TableH); };
    var panelTableLX = bind (panelW - TableW) / 2;

    var radioGeneric : Boolean = true ;
    var alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",];

    function changeTableSize(i: Integer, j: Integer): Void {
        BankDetails.getJComponent().setPreferredSize(new Dimension(i, j));
    }

    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    def __layoutInfo_separator: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
        height: 5.0
    }
    public-read def separator: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: 37.0
        layoutY: 81.0
        layoutInfo: __layoutInfo_separator
    }
    
    public-read def panelTable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelTableLX
        layoutY: 170.0
    }
    
    public-read def rectTableBorder: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        layoutX: bind panelTableLX
        layoutY: 170.0
        styleClass: "rectTableBorder"
        width: bind TableW
        height: bind TableH
    }
    
    public-read def panelAtoZ: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: 160.0
        layoutY: 0.0
    }
    
    def __layoutInfo_listGeneric: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW+20.0
        height: bind listH
    }
    public-read def listGeneric: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C2LX
        layoutY: 27.0
        layoutInfo: __layoutInfo_listGeneric
        blocksMouse: true
        items: null
        vertical: true
        pannable: true
        cellFactory: null
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
    }
    
    public-read def Violet: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.011764706
        green: 0.5019608
        blue: 0.7607843
    }
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
    }
    
    def __layoutInfo_txtProductName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtProductName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        disable: bind rdoGeneric.selected
        layoutX: bind C2LX
        layoutY: 90.0
        layoutInfo: __layoutInfo_txtProductName
        styleClass: "text-box"
        onKeyReleased: txtProductNameOnKeyReleased
        text: ""
        editable: true
        font: Arial_12
    }
    
    def __layoutInfo_txtGenericName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtGenericName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        disable: bind rdoProduct.selected
        layoutX: bind C2LX
        layoutY: 57.0
        layoutInfo: __layoutInfo_txtGenericName
        styleClass: "text-box"
        onKeyReleased: txtGenericNameOnKeyReleased
        text: ""
        editable: true
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
    
    public-read def toggleGroup: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def rdoProduct: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: bind C2LX+160
        layoutY: 0.0
        onKeyPressed: rdoProductOnKeyPressed
        onMouseClicked: rdoProductOnMouseClicked
        text: "Productwise Search"
        font: Arial_12
        toggleGroup: toggleGroup
        selected: bind not radioGeneric
    }
    
    def __layoutInfo_rdoGeneric: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 140.0
    }
    public-read def rdoGeneric: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: bind C2LX
        layoutY: 0.0
        layoutInfo: __layoutInfo_rdoGeneric
        onKeyPressed: rdoGenericOnKeyPressed
        onMouseClicked: rdoGenericOnMouseClicked
        text: "Genericwise Search"
        font: Arial_12
        toggleGroup: toggleGroup
        selected: bind radioGeneric
    }
    
    public-read def Arial_25: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
        size: 25.0
    }
    
    def __layoutInfo_label: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind panelW
    }
    public-read def label: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 0.0
        layoutY: 0.0
        layoutInfo: __layoutInfo_label
        text: "Generic Search - alt+G"
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
    
    public-read def labelSearchRecrord: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C2LX+Type1TextboxW+260
        layoutY: 57.0
        text: bind searchCount
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelProductName: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 90.0
        text: "Product Name"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelGenericName: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 57.0
        text: "GenericName"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelSearchType: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 0.0
        text: "Search Type"
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
    
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
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
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 37.0
        layoutY: 51.0
        text: "Generic and Productwise Search"
        font: Arial_18
        textFill: Green
    }
    
    public-read def panelheader: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ rectangle, rectHeader, label, label3, separator, ]
    }
    
    public-read def Yellow: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.95
        green: 0.94
        blue: 0.86
    }
    
    public-read def imageCalendar: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Calender.png"
    }
    
    public-read def imageSave: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Save1.png"
    }
    
    public-read def imageView2: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageSave
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnSearch: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnSearch: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: true
        layoutX: bind C2LX+Type1TextboxW+80
        layoutY: 90.0
        layoutInfo: __layoutInfo_btnSearch
        onKeyPressed: btnSearchOnKeyPressed
        graphic: imageView2
        text: "Search"
        font: Arial_Bold_14
        action: btnSearchAction
    }
    
    public-read def imageEdit: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Edit.png"
    }
    
    public-read def imageReset: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Reset.png"
    }
    
    public-read def imageView: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        image: imageReset
    }
    
    def __layoutInfo_btnReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind C2LX+Type1TextboxW+260
        layoutY: 90.0
        layoutInfo: __layoutInfo_btnReset
        onKeyPressed: btnResetOnKeyPressed
        blocksMouse: true
        graphic: imageView
        text: "Reset"
        font: Arial_Bold_14
        action: btnResetAction
    }
    
    public-read def imageCancel: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Cancel.png"
    }
    
    public-read def imageBack: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/arrow_Left.png"
    }
    
    public-read def linearGradientHeader: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#FFFFFF") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#000000") }, ]
    }
    
    public-read def Arial_Bold_50: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial Bold"
        size: 50.0
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.87058824
        green: 0.8392157
        blue: 0.8392157
    }
    
    public-read def imageclickdown: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Clickdown.png"
    }
    
    def __layoutInfo_imageDownProduct: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 25.0
        height: bind txtProductName.height
    }
    public-read def imageDownProduct: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: true
        disable: bind rdoGeneric.selected
        layoutX: bind C2LX+Type1TextboxW-1
        layoutY: 90.0
        layoutInfo: __layoutInfo_imageDownProduct
        onMouseClicked: imageDownProductOnMouseClicked
        image: imageclickdown
    }
    
    def __layoutInfo_imageDownGeneric: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 25.0
        height: bind txtGenericName.height
    }
    public-read def imageDownGeneric: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        disable: bind rdoProduct.selected
        layoutX: bind C2LX+Type1TextboxW-1
        layoutY: 57.0
        layoutInfo: __layoutInfo_imageDownGeneric
        onMouseClicked: imageDownGenericOnMouseClicked
        image: imageclickdown
    }
    
    public-read def imageSearch: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Search.png"
    }
    
    public-read def toggleGroup2: javafx.scene.control.ToggleGroup = javafx.scene.control.ToggleGroup {
    }
    
    public-read def rdoDrug: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: bind C2LX+Type1TextboxW+150
        layoutY: 57.0
        text: "DrugList"
        font: Arial_12
        toggleGroup: toggleGroup2
    }
    
    public-read def rdoStock: javafx.scene.control.RadioButton = javafx.scene.control.RadioButton {
        layoutX: bind C2LX+Type1TextboxW+80
        layoutY: 57.0
        text: "Stock"
        font: Arial_12
        toggleGroup: toggleGroup2
    }
    
    def __layoutInfo_panelpage: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 787.0
        height: 100.0
    }
    public-read def panelpage: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutY: 90.0
        layoutInfo: __layoutInfo_panelpage
        content: [ panelTable, rectTableBorder, labelSearchType, labelGenericName, labelProductName, btnSearch, panelAtoZ, txtGenericName, rdoGeneric, rdoProduct, txtProductName, btnReset, imageDownGeneric, imageDownProduct, labelSearchRecrord, listGeneric, rdoStock, rdoDrug, ]
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        content: [ panelheader, panelpage, panelAlert, ]
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
    }
    
    public function getDesignRootNodes (): javafx.scene.Node[] {
        [ panel, ]
    }
    // </editor-fold>//GEN-END:main
    function btnSearchOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if(event.code == KeyCode.VK_ENTER) {
            btnSearchAction();
        } else if (event.code == KeyCode.VK_TAB) {
            btnReset.requestFocus();
        }
    }
    function btnResetOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if(event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_TAB) {
            rdoGeneric.requestFocus();
        }
     }
    function rdoProductOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        radioGeneric = false ;
    }
    function rdoProductOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if(event.code == KeyCode.VK_ENTER) {
            radioGeneric = false ;
        } else if (event.code == KeyCode.VK_TAB) {
            tabFlag = false ;
            if(radioGeneric) {
                txtGenericName.requestFocus();
            } else {
                txtProductName.requestFocus();
            }
        } else if (event.code == KeyCode.VK_SPACE) {
            radioGeneric = not radioGeneric ;
        }
    }
    function rdoGenericOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        radioGeneric = true ;
    }
    function rdoGenericOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if(event.code == KeyCode.VK_ENTER) {
            radioGeneric = true ;
        } else if (event.code == KeyCode.VK_TAB) {
            rdoProduct.requestFocus();
        } else if (event.code == KeyCode.VK_SPACE) {
            radioGeneric = not radioGeneric ;
       }
    }
    function imageDownProductOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {        
        getProducts(0);
    }
    function imageDownGenericOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {   
        getGenerics(0);
    }
    function btnResetAction(): Void {
        drugModel.setDrug_name("");
        drugModel.setGeneric_name("");
        txtGenericName.text = "";
        txtProductName.text = "";
        radioGeneric= true ;
        rdoStock.selected = true ;
        rdoDrug.selected = false ;
        AlphaHLink();
        genericSearch.clearData();
        rdoGeneric.requestFocus();
        listGeneric.visible = false;
        searchCount = "";
        genericSearch.drugsCount = 0;
    }
    var tabFlag : Boolean = false ;
    function txtGenericNameOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        getGenerics(1);
//        if(event.code==KeyCode.VK_ENTER){
//            btnSearch.requestFocus();
        if(event.code == KeyCode.VK_TAB){
            if(tabFlag) {
                listGeneric.visible = false;
                btnSearch.requestFocus();
                tabFlag = false ;
            } else {
                tabFlag = true ;
            }            
        } else if (event.code == KeyCode.VK_DOWN){
            listGeneric.requestFocus();
            listGeneric.selectFirstRow();
        } else if (event.code == KeyCode.VK_ESCAPE){
            listGeneric.visible = false;
            txtGenericName.requestFocus();
        }
    }

    function txtProductNameOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        getProducts(1);
        if(event.code == KeyCode.VK_TAB){
            if(tabFlag) {
                listGeneric.visible = false;
                btnSearch.requestFocus();
                tabFlag = false ;
            } else {
                tabFlag = true ;
            }
        } else if (event.code == KeyCode.VK_DOWN){
            listGeneric.requestFocus();
            listGeneric.selectFirstRow();
        } else if (event.code == KeyCode.VK_ESCAPE){
            listGeneric.visible = false;
            txtProductName.requestFocus();
        }
    }
    var listControlGen: GenericSearchListControl = new GenericSearchListControl();
    var selectDrug : String = "";
    var listType : String = "stock";
    var searchMode : Boolean = bind rdoStock.selected on replace {
        listGeneric.visible = false ;
        txtGenericName.text = "";
        txtProductName.text = "";
        if(searchMode){
            listType = "stock";
        } else {
            listType = "drug";
        }
    }
    var rdoGen : Boolean = bind radioGeneric on replace {
        listGeneric.visible = false ;
        txtGenericName.text = "";
        txtProductName.text = "";
        if(rdoGen) {
            AlphaHLink();
            if(listType.equals("stock")) {
                drugModel.setPassVale(110);
            } else {
                drugModel.setPassVale(100);
            }
            genericSearch.clearData();
            searchCount = "";            
        } else {
            AlphaNumeriHLink();
            if(listType.equals("stock")) {
                drugModel.setPassVale(111);
            } else {
                drugModel.setPassVale(101);
            }
            genericSearch.clearData();
            searchCount = "";
        }
    }

    function getGenerics(type:Integer): Void {
        if(not listGeneric.visible){
        listGeneric.layoutY = txtGenericName.layoutY + txtGenericName.height;
        listH = listControlGen.listImageControlView(txtGenericName, listGeneric, "DrugGeneric", type, listType);
        var selectItem: String = bind listControlGen.selectedString on replace {
            selectDrug = selectItem ;
            if (selectItem.length() > 0 ) {
                drugModel.setGeneric_name(selectItem);
            }
          }
        }
       else{
           listGeneric.visible = false;
           txtGenericName.requestFocus();
       }
    }
    var listControlPro: GenericSearchListControl = new GenericSearchListControl();
    function getProducts(type:Integer): Void {
        if(not listGeneric.visible){
        listGeneric.layoutY = txtProductName.layoutY + txtProductName.height;
        listH = listControlPro.listImageControlView(txtProductName, listGeneric, "DrugProduct", type, listType);
        var selectedItem: String = bind listControlPro.selectedString on replace {            
            if (selectedItem.length() > 0) {                
                drugModel.setDrug_name(selectedItem);
            }
          }
        }
      else{
            listGeneric.visible = false;
            txtProductName.requestFocus();
      }
    }
    
    var searchCount:String ="" ;
    var prevTextBox : String = "" ;
    function btnSearchAction(): Void {
        loadResult();
    }
    function loadResult():Void {
       if (radioGeneric) {
           if(prevTextBox != txtGenericName.text) {
               listControlGen.selectedString = txtGenericName.text ;
           }
           drugModel.setGeneric_name(listControlGen.selectedString);
           if(listType.equals("stock")) {
               drugModel.setPassVale(110);
           } else {
               drugModel.setPassVale(100);
           }
            prevTextBox = txtGenericName.text ;
       } else {
           if(prevTextBox != txtProductName.text) {
               listControlPro.selectedString = txtProductName.text ;
           }
           drugModel.setDrug_name(listControlPro.selectedString);
           if(listType.equals("stock")) {
                drugModel.setPassVale(111);
           } else {
               drugModel.setPassVale(101);
           }
            prevTextBox = txtProductName.text ;
       }
       searchCount = "{genericSearch.LoadGenericSearchResult(drugModel)} Records Found";
       if (genericSearch.drugsCount <=0 ) {
           FXinfo("No Records found!");
       }
       if(radioGeneric) {
           txtGenericName.requestFocus();
       } else {
           txtProductName.requestFocus();
       }
    }
    var mandatoryStyle: String = CommonDeclare.textbox_mandatory();
    var errorStyle: String = CommonDeclare.textbox_error();
    def CustomAlert = CustomAlert {};
    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Generic Search", type);
        showAlertbox();
    }
    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }
    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Generic Search", msg);
        showAlertbox();
    }

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Generic Search", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = errorStyle;
    }


    function AlphaNumeriHLink() : Void {
        def Zeroto9 = for (i in [0..8])
                    Hyperlink {
                        visible: true
                        cursor: javafx.scene.Cursor.HAND
                        layoutX: bind (i * (2.287166455 * panelW / 100)) + (59.46632783 * panelW / 100)
                        layoutY: 25
                        text: "{i + 1}"
                        font: Arial_Bold_12
                        hpos: javafx.geometry.HPos.CENTER
                        width: 20.0
                        height: 20.0
                        onMouseClicked: function(event: javafx.scene.input.MouseEvent): Void {
                            genericSearch.clearData();
                            listGeneric.visible = false ;
                            searchCount = "";
                            genericSearch.drugsCount = 0;
                            if(radioGeneric) {
                                txtGenericName.text = String.valueOf(i+1) ;
                                txtGenericName.requestFocus();
                                getGenerics(1);
                            } else {
                                txtProductName.text = String.valueOf(i+1) ;
                                txtProductName.requestFocus();
                                getProducts(1);
                            }
                        }
                    }
        def AtoZ = for (j in [0..25])
                    Hyperlink {
                        visible: true
                        cursor: javafx.scene.Cursor.HAND
                        layoutX: bind j * (2.287166455 * panelW / 100)
                        layoutY: 25
                        text: alphabet[j]
                        font: Arial_Bold_14
                        hpos: javafx.geometry.HPos.CENTER
                        width: 20.0
                        height: 20.0
                        onMouseClicked: function(event: javafx.scene.input.MouseEvent): Void {
                            genericSearch.clearData();
                            listGeneric.visible = false ;
                            searchCount = "";
                            genericSearch.drugsCount = 0;
                            if(radioGeneric) {
                                txtGenericName.text = String.valueOf(alphabet[j]) ;
                                txtGenericName.requestFocus();
                                getGenerics(1);
                            } else {
                                txtProductName.text = String.valueOf(alphabet[j]) ;
                                txtProductName.requestFocus();
                                getProducts(1);
                            }
                        }
                    }
        panelAtoZ.content = [ AtoZ, Zeroto9,];
    }
    function AlphaHLink() : Void {
        def AtoZ = for (j in [0..25])
                    Hyperlink {
                        visible: true
                        cursor: javafx.scene.Cursor.HAND
                        layoutX: bind j * (2.287166455 * panelW / 100)
                        layoutY: 25
                        text: alphabet[j]
                        font: Arial_Bold_14
                        hpos: javafx.geometry.HPos.CENTER
                        width: 20.0
                        height: 20.0
                        onMouseReleased: function(event: javafx.scene.input.MouseEvent): Void {
                            genericSearch.clearData();
                            listGeneric.visible = false ;
                            searchCount = "";
                            genericSearch.drugsCount = 0;
                            if(radioGeneric) {
                                txtGenericName.text = String.valueOf(alphabet[j]) ;
                                txtGenericName.requestFocus();
                                getGenerics(1);
                            } else {
                                txtProductName.text = String.valueOf(alphabet[j]) ;
                                txtProductName.requestFocus();
                                getProducts(1);
                            }
                        }
                    }
        panelAtoZ.content = [ AtoZ, ];
    }

    public function StartUp(): Void {
        panel.visible = true;
        AlphaHLink();
        panel.content = [panelheader, panelpage, panelAlert,];
        panelTable.content = [BankDetails];
        BankDetails.layoutX = 0;
        BankDetails.layoutY = 0;
        btnResetAction();
    }

}
