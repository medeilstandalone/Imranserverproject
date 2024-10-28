package com.vanuston.medeil.ui;

import javafx.scene.input.*;
import java.lang.*;
import javafx.scene.image.*;
import javafx.ext.swing.SwingComponent;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.uitables.StockStatementTable;
import java.awt.Dimension;
import java.text.SimpleDateFormat;
import com.vanuston.medeil.util.Value;
import com.vanuston.medeil.util.Validation;
import com.vanuston.medeil.ui.calendar.theme.GrayTheme;
import com.vanuston.medeil.ui.calendar.view.FXCalendar;
import javafx.scene.control.Hyperlink;
import java.io.File;
import java.util.HashMap;
import com.vanuston.medeil.util.CommonDeclare;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.uitables.GetStockDrugTable;
import javafx.scene.control.TextBox;
import com.vanuston.medeil.util.KeyRegistry;
import java.awt.event.MouseAdapter;
import com.vanuston.medeil.model.StockModel;
import com.vanuston.medeil.implementation.Drug;
import com.vanuston.medeil.model.DrugModel;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.uitables.ConfirmDialogBox;
import com.vanuston.medeil.implementation.Purchase;
import com.vanuston.medeil.uitables.StockAdjustment;

public class Stock {

    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:main
    def __layoutInfo_separator: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind seperatorW
        height: 5.0
    }
    public-read def separator: javafx.scene.control.Separator = javafx.scene.control.Separator {
        layoutX: 30.0
        layoutY: 85.0
        layoutInfo: __layoutInfo_separator
    }
    
    public-read def lblBarcode: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX
        text: "Label"
    }
    
    def __layoutInfo_txtstkpackage: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW-30
    }
    public-read def txtstkpackage: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: true
        disable: false
        layoutX: bind C2LX+Type3TextboxW+30
        layoutY: 215.0
        layoutInfo: __layoutInfo_txtstkpackage
        onKeyPressed: txtstkpackageOnKeyPressed
    }
    
    public-read def panelTable: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelTableLX
        layoutY: bind panelTableLY
        blocksMouse: true
    }
    
    public-read def rectTableBorder: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        layoutX: bind panelTableLX
        layoutY: bind panelTableLY
        styleClass: "rectTableBorder"
        width: bind TableW
        height: bind TableH
    }
    
    public-read def btnDeleteZero: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind SearchTextboxLX-150
        layoutY: bind rectbuttonLY+20
        text: "Button"
    }
    
    public-read def btnDeleteExpiry: javafx.scene.control.Button = javafx.scene.control.Button {
        visible: false
        layoutX: bind SearchTextboxLX
        layoutY: bind rectbuttonLY+20
        text: "Button"
    }
    
    def __layoutInfo_txtStkBarcode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtStkBarcode: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: bind C2LX
        layoutInfo: __layoutInfo_txtStkBarcode
    }
    
    def __layoutInfo_cboVAT: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def cboVAT: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        layoutX: bind C4LX+Type4TextboxW+70
        layoutY: 236.0
        layoutInfo: __layoutInfo_cboVAT
        onKeyPressed: cboVATOnKeyPressed
        onMouseClicked: cboVATOnMouseClicked
        onMouseExited: cboVATOnMouseExited
        items: bind vatValues
    }
    
    def __layoutInfo_listView: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 712.0
        height: 192.0
    }
    public-read def listView: javafx.scene.control.ListView = javafx.scene.control.ListView {
        layoutX: 39.0
        layoutY: 315.0
        layoutInfo: __layoutInfo_listView
        items: null
    }
    
    def __layoutInfo_cmbSearchBox: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind ChoiceSearchW
    }
    public-read def cmbSearchBox: javafx.scene.control.ChoiceBox = javafx.scene.control.ChoiceBox {
        visible: false
        layoutX: bind ChoiceSearchLX
        layoutInfo: __layoutInfo_cmbSearchBox
        items: [ "Product  Name", "Product Code", "Batch", "Qty", ]
    }
    
    public-read def rectAddnew: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind rectbutton2LX-200
        layoutY: bind rectbuttonLY
        styleClass: "rectbutton"
        width: 100.0
        height: 50.0
    }
    
    public-read def rectEdit: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: false
        layoutX: bind rectbutton2LX
        layoutY: bind rectbuttonLY
        styleClass: "rectbutton"
        width: 100.0
        height: 50.0
    }
    
    def __layoutInfo_labelAddNew: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def labelAddNew: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind rectbutton2LX-200
        layoutY: bind rectbuttonLY
        layoutInfo: __layoutInfo_labelAddNew
        text: "Label"
    }
    
    def __layoutInfo_labelViewStock: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def labelViewStock: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind rectbutton2LX
        layoutY: bind rectbuttonLY
        layoutInfo: __layoutInfo_labelViewStock
        text: "Label"
    }
    
    def __layoutInfo_txtHidden: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def txtHidden: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        visible: false
        layoutX: 665.0
        layoutY: 231.0
        layoutInfo: __layoutInfo_txtHidden
    }
    
    public-read def label18: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        text: "Label"
    }
    
    public-read def panelAtoZ: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelQuickNavigationLX
        layoutY: 138.0
        blocksMouse: true
        content: [ label18, ]
    }
    
    def __layoutInfo_productCount: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
    }
    public-read def productCount: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: 39.0
        layoutY: bind rectbuttonLY
        layoutInfo: __layoutInfo_productCount
        text: "Label"
    }
    
    def __layoutInfo_txtMargin: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtMargin: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 261.0
        layoutInfo: __layoutInfo_txtMargin
    }
    
    def __layoutInfo_listStock: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 186.0
    }
    public-read def listStock: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: 295.0
        layoutY: 550.0
        layoutInfo: __layoutInfo_listStock
        items: null
    }
    
    def __layoutInfo_listProductName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind listW
        height: bind listH
    }
    public-read def listProductName: javafx.scene.control.ListView = javafx.scene.control.ListView {
        visible: false
        layoutX: bind C2LX
        layoutY: 145.0
        layoutInfo: __layoutInfo_listProductName
        items: [ "Item 1", "Item 2", "Item 3", ]
    }
    
    public-read def panelAlert: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        layoutX: bind panelAlertLX
        layoutY: bind panelAlertLY
    }
    
    public-read def panelStockReport: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
    }
    
    public-read def stkPanel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutX: bind panelCalenderLX
        layoutY: 254.0
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
    
    public-read def rectangle: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
        visible: true
        opacity: 1.0
        layoutX: 0.0
        layoutY: 0.0
        styleClass: "form-background"
        onMouseClicked: rectangleOnMouseClicked
        fill: linearGradient
        stroke: Violet
        width: bind panelW
        height: bind panelH
        arcWidth: 5.0
        arcHeight: 5.0
    }
    
    public-read def Arial_12: javafx.scene.text.Font = javafx.scene.text.Font {
        name: "Arial"
    }
    
    def __layoutInfo_txtStkExpiry: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW-30
    }
    public-read def txtStkExpiry: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 238.0
        layoutInfo: __layoutInfo_txtStkExpiry
        onKeyPressed: txtStkExpiryOnKeyPressed
        editable: false
        font: Arial_12
    }
    
    def __layoutInfo_txtStkPCode: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtStkPCode: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 100.0
        layoutInfo: __layoutInfo_txtStkPCode
        editable: false
        font: Arial_12
        multiline: false
    }
    
    def __layoutInfo_txtMinQty: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type4TextboxW
    }
    public-read def txtMinQty: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 237.0
        layoutInfo: __layoutInfo_txtMinQty
        onKeyPressed: txtMinQtyOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtStkSearch: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 186.0
    }
    public-read def txtStkSearch: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind SearchTextboxLX
        layoutY: 528.0
        layoutInfo: __layoutInfo_txtStkSearch
        font: Arial_12
    }
    
    def __layoutInfo_txtStkSellPrice: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtStkSellPrice: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 146.0
        layoutInfo: __layoutInfo_txtStkSellPrice
        onKeyReleased: txtStkSellPriceOnKeyReleased
        font: Arial_12
    }
    
    public-read def vat: javafx.scene.control.Label = javafx.scene.control.Label {
        opacity: 0.9
        layoutX: bind C4LX+Type4TextboxW+20
        layoutY: 238.0
        text: "VAT %"
        font: Arial_12
    }
    
    def __layoutInfo_txtStkQty: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW-30
    }
    public-read def txtStkQty: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 215.0
        layoutInfo: __layoutInfo_txtStkQty
        onKeyPressed: txtStkQtyOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtStkFormulation: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
        hfill: false
    }
    public-read def txtStkFormulation: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 146.0
        layoutInfo: __layoutInfo_txtStkFormulation
        style: ""
        styleClass: "text-box"
        onKeyPressed: txtStkFormulationOnKeyPressed
        effect: null
        text: ""
        font: Arial_12
    }
    
    def __layoutInfo_txtStkStorage: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtStkStorage: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        managed: true
        layoutX: bind C4LX
        layoutY: 215.0
        layoutInfo: __layoutInfo_txtStkStorage
        onKeyPressed: txtStkStorageOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtStkRack: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtStkRack: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 192.0
        layoutInfo: __layoutInfo_txtStkRack
        onKeyPressed: txtStkRackOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtStkShelf: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtStkShelf: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 169.0
        layoutInfo: __layoutInfo_txtStkShelf
        onKeyPressed: txtStkShelfOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtStkPurPrice: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtStkPurPrice: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 123.0
        layoutInfo: __layoutInfo_txtStkPurPrice
        onKeyReleased: txtStkPurPriceOnKeyReleased
        font: Arial_12
    }
    
    def __layoutInfo_txtStkPName: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtStkPName: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 123.0
        layoutInfo: __layoutInfo_txtStkPName
        onKeyPressed: txtStkPNameOnKeyPressed
        onKeyReleased: txtStkPNameOnKeyReleased
        font: Arial_12
    }
    
    def __layoutInfo_txtStkBatch: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtStkBatch: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 192.0
        layoutInfo: __layoutInfo_txtStkBatch
        onKeyPressed: txtStkBatchOnKeyPressed
        font: Arial_12
    }
    
    def __layoutInfo_txtStkMRP: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type3TextboxW
    }
    public-read def txtStkMRP: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C4LX
        layoutY: 100.0
        layoutInfo: __layoutInfo_txtStkMRP
        font: Arial_12
    }
    
    def __layoutInfo_txtStkDosage: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind Type1TextboxW
    }
    public-read def txtStkDosage: javafx.scene.control.TextBox = javafx.scene.control.TextBox {
        layoutX: bind C2LX
        layoutY: 169.0
        layoutInfo: __layoutInfo_txtStkDosage
        onKeyPressed: txtStkDosageOnKeyPressed
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
    
    def __layoutInfo_btnCustCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 100.0
        height: 25.0
    }
    public-read def btnCustCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind buttonSearchLX
        layoutY: 0.0
        layoutInfo: __layoutInfo_btnCustCancel
        effect: reflectionEffect
        text: "Search"
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
    
    public-read def lblMargin: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 261.0
        text: "Margin %"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label5: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 207.0
        layoutY: 528.0
        text: "Product Name"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label1: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 169.0
        text: "Shelf No."
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label14: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 100.0
        text: "Product Code"
        font: Arial_12
        textFill: DarkGray
    }
    
    def __layoutInfo_labelMinQty: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: 80.0
    }
    public-read def labelMinQty: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 237.0
        layoutInfo: __layoutInfo_labelMinQty
        text: "Min Qty"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelPackage: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C2LX+Type3TextboxW-20
        layoutY: 215.0
        text: "Package"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label13: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 192.0
        text: "Rack No."
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label12: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 238.0
        text: "Expiry "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label11: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind labelSearchLX
        layoutY: 215.0
        text: "Quantity"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def labelQuantity: javafx.scene.control.Label = javafx.scene.control.Label {
        visible: false
        layoutX: bind C1LX
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label10: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 192.0
        text: "Batch No."
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label9: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 100.0
        text: "MRP"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label8: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 146.0
        text: "Formulation "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label7: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 215.0
        text: "Storage"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label6: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 146.0
        text: "Selling Price"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label4: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 169.0
        text: "Dosage "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label3: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C3LX
        layoutY: 123.0
        text: "Purchase Price"
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def label2: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: bind C1LX
        layoutY: 123.0
        styleClass: "label"
        text: "Product Name "
        font: Arial_12
        textFill: DarkGray
    }
    
    public-read def Green: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.2
        green: 0.4
    }
    
    public-read def labelTitle: javafx.scene.control.Label = javafx.scene.control.Label {
        layoutX: 39.0
        layoutY: 61.0
        text: "Product Details"
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
        layoutY: 1.0
        layoutInfo: __layoutInfo_label
        styleClass: "label"
        effect: lightingEffect
        text: "Stock - ctrl+t"
        font: Arial_25
        hpos: javafx.geometry.HPos.CENTER
        textFill: DarkGray
    }
    
    public-read def color: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 1.0
        green: 0.4
    }
    
    public-read def Gray: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.4
        green: 0.4
        blue: 0.4
    }
    
    public-read def reflectionEffect2: javafx.scene.effect.Reflection = javafx.scene.effect.Reflection {
    }
    
    public-read def Yellow: javafx.scene.paint.Color = javafx.scene.paint.Color {
        red: 0.95
        green: 0.94
        blue: 0.86
    }
    
    public-read def linearGradientHeader: javafx.scene.paint.LinearGradient = javafx.scene.paint.LinearGradient {
        endX: 0.0
        stops: [ javafx.scene.paint.Stop { offset: 0.0, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.4, color: javafx.scene.paint.Color.web ("#999999") }, javafx.scene.paint.Stop { offset: 0.6, color: javafx.scene.paint.Color.web ("#666666") }, javafx.scene.paint.Stop { offset: 1.0, color: javafx.scene.paint.Color.web ("#666666") }, ]
    }
    
    public-read def rectHeader: javafx.scene.shape.Rectangle = javafx.scene.shape.Rectangle {
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
    
    public-read def imageSave: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Save1.png"
    }
    
    public-read def imgSave: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: true
        image: imageSave
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnStkSave: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnStkSave: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton1LX
        layoutY: bind buttonLY
        layoutInfo: __layoutInfo_btnStkSave
        onKeyPressed: btnStkSaveOnKeyPressed
        onMouseClicked: btnStkSaveOnMouseClicked
        translateX: 0.0
        effect: reflectionEffect
        graphic: imgSave
        text: "Save [F3]"
        font: Arial_Bold_14
        textAlignment: javafx.scene.text.TextAlignment.CENTER
    }
    
    public-read def imageReset: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Reset.png"
    }
    
    public-read def imgReset: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: true
        image: imageReset
        fitWidth: bind bottonImageW
        fitHeight: bind bottonImageH
    }
    
    def __layoutInfo_btnStkReset: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnStkReset: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton3LX
        layoutY: bind buttonLY
        layoutInfo: __layoutInfo_btnStkReset
        onKeyPressed: btnStkResetOnKeyPressed
        onMouseClicked: btnStkResetOnMouseClicked
        effect: reflectionEffect
        graphic: imgReset
        text: "Reset [F4]"
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
    
    def __layoutInfo_btnStkEdit: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind bottonW
        height: bind bottonH
    }
    public-read def btnStkEdit: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton2LX
        layoutY: bind buttonLY
        layoutInfo: __layoutInfo_btnStkEdit
        onKeyPressed: btnStkEditOnKeyPressed
        onMouseClicked: btnStkEditOnMouseClicked
        effect: reflectionEffect
        graphic: imgEdit
        text: "Edit [F6]"
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
    
    def __layoutInfo_btnStkCancel: javafx.scene.layout.LayoutInfo = javafx.scene.layout.LayoutInfo {
        width: bind CancelW
        height: bind bottonH
    }
    public-read def btnStkCancel: javafx.scene.control.Button = javafx.scene.control.Button {
        layoutX: bind botton4LX
        layoutY: bind buttonLY
        layoutInfo: __layoutInfo_btnStkCancel
        onKeyPressed: btnStkCancelOnKeyPressed
        onMouseClicked: btnStkCancelOnMouseClicked
        effect: reflectionEffect2
        graphic: imgCancel
        text: "Cancel [F8]"
        font: Arial_Bold_14
    }
    
    public-read def panelbuttons: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: false
        layoutY: bind panelButtonsLY
        content: [ btnStkSave, btnStkEdit, btnStkReset, btnStkCancel, ]
    }
    
    public-read def imageBack: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/arrow_Left.png"
    }
    
    public-read def image: javafx.scene.image.Image = javafx.scene.image.Image {
        url: "{__DIR__}images/Close.png"
    }
    
    public-read def imageClose: javafx.scene.image.ImageView = javafx.scene.image.ImageView {
        visible: false
        layoutX: bind panelW-22
        image: image
    }
    
    public-read def panel: javafx.scene.layout.Panel = javafx.scene.layout.Panel {
        visible: true
        content: [ rectangle, rectHeader, label, separator, label2, label3, label4, label6, label7, label8, label9, label10, labelQuantity, lblBarcode, label11, label12, label13, labelPackage, labelMinQty, txtstkpackage, btnCustCancel, panelTable, rectTableBorder, btnDeleteZero, btnDeleteExpiry, panelbuttons, label14, txtStkBarcode, txtStkDosage, txtStkMRP, txtStkBatch, txtStkPName, txtStkPurPrice, txtStkShelf, txtStkRack, txtStkStorage, txtStkFormulation, txtStkQty, labelTitle, label1, vat, cboVAT, txtStkSellPrice, listView, txtStkSearch, label5, cmbSearchBox, rectAddnew, rectEdit, labelAddNew, labelViewStock, txtHidden, txtMinQty, panelAtoZ, productCount, txtStkPCode, txtStkExpiry, txtMargin, lblMargin, listStock, listProductName, panelAlert, panelStockReport, imageClose, stkPanel, ]
    }
    
    public-read def currentState: org.netbeans.javafx.design.DesignState = org.netbeans.javafx.design.DesignState {
        names: [ "Shown", "View", "Edit", ]
        actual: 0
        timelines: [
            javafx.animation.Timeline {
                keyFrames: [
                    javafx.animation.KeyFrame {
                        time: 0ms
                        action: function() {
                            rectangle.stroke = DarkGray;
                            rectangle.arcWidth = 5.0;
                            label.layoutY = 1.0;
                            label.style = "";
                            label.styleClass = "label";
                            label.text = "Stock - ctrl+T";
                            label.hpos = javafx.geometry.HPos.CENTER;
                            label.graphicHPos = javafx.geometry.HPos.LEFT;
                            label.textFill = DarkGray;
                            separator.layoutY = 74.0;
                            label2.layoutY = 112.0;
                            label2.text = "Product Name ";
                            label3.visible = true;
                            label3.layoutY = 112.0;
                            label4.visible = true;
                            label4.layoutY = 158.0;
                            label6.visible = true;
                            label6.layoutY = 135.0;
                            label7.visible = true;
                            label7.layoutY = 204.0;
                            label8.visible = true;
                            label8.layoutY = 135.0;
                            label9.visible = true;
                            label9.layoutY = 89.0;
                            label10.visible = true;
                            label10.layoutY = 181.0;
                            labelQuantity.visible = true;
                            labelQuantity.layoutY = 204.0;
                            labelQuantity.text = "Quantity (Total Tablet(s))";
                            labelQuantity.font = Arial_12;
                            labelQuantity.textFill = DarkGray;
                            lblBarcode.visible = true;
                            lblBarcode.layoutY = 250.0;
                            lblBarcode.text = "Barcode";
                            lblBarcode.font = Arial_12;
                            lblBarcode.textFill = DarkGray;
                            label11.visible = false;
                            label11.layoutY = 204.0;
                            label11.text = "Quantity(Total Tablets)";
                            label12.visible = true;
                            label12.layoutY = 227.0;
                            label13.visible = true;
                            label13.layoutY = 181.0;
                            labelPackage.visible = true;
                            labelPackage.layoutY = 204.0;
                            labelMinQty.visible = true;
                            labelMinQty.layoutY = 226.0;
                            labelMinQty.text = "Minimum Qty";
                            txtstkpackage.visible = true;
                            txtstkpackage.disable = false;
                            txtstkpackage.layoutY = 204.0;
                            txtstkpackage.promptText = "Tablet(s) per Strip";
                            txtstkpackage.editable = true;
                            btnCustCancel.visible = false;
                            btnCustCancel.layoutY = 0.0;
                            btnCustCancel.effect = reflectionEffect;
                            btnCustCancel.font = Arial_Bold_14;
                            btnCustCancel.strong = false;
                            panelTable.visible = true;
                            btnDeleteZero.visible = false;
                            btnDeleteZero.text = "Button";
                            btnDeleteExpiry.visible = false;
                            btnDeleteExpiry.text = "Button";
                            imgSave.visible = true;
                            btnStkSave.visible = true;
                            btnStkSave.text = "Save [F3]";
                            imgEdit.visible = true;
                            btnStkEdit.visible = true;
                            btnStkEdit.text = "Edit [F6]";
                            imgReset.visible = true;
                            btnStkReset.visible = true;
                            btnStkReset.text = "Reset [F4]";
                            imgCancel.visible = true;
                            btnStkCancel.visible = true;
                            btnStkCancel.text = "Cancel [F8]";
                            panelbuttons.visible = true;
                            label14.visible = true;
                            label14.layoutY = 89.0;
                            label14.text = "Product Code";
                            txtStkBarcode.visible = true;
                            txtStkBarcode.layoutY = 250.0;
                            txtStkBarcode.onKeyPressed = txtStkBarcodeOnKeyPressed;
                            txtStkBarcode.font = Arial_12;
                            txtStkDosage.visible = true;
                            txtStkDosage.layoutY = 158.0;
                            txtStkDosage.editable = false;
                            txtStkMRP.visible = true;
                            txtStkMRP.layoutY = 89.0;
                            txtStkMRP.onKeyPressed = txtStkMRPOnKeyPressedAtShown;
                            txtStkMRP.promptText = "";
                            txtStkBatch.visible = true;
                            txtStkBatch.layoutY = 181.0;
                            txtStkBatch.onKeyPressed = txtStkBatchOnKeyPressed;
                            txtStkPName.visible = true;
                            txtStkPName.layoutY = 112.0;
                            txtStkPurPrice.visible = true;
                            txtStkPurPrice.layoutY = 112.0;
                            txtStkPurPrice.onKeyPressed = txtStkPurPriceOnKeyPressedAtShown;
                            txtStkPurPrice.promptText = "";
                            txtStkShelf.visible = true;
                            txtStkShelf.layoutY = 158.0;
                            txtStkShelf.onKeyPressed = txtStkShelfOnKeyPressed;
                            txtStkRack.visible = true;
                            txtStkRack.layoutY = 181.0;
                            txtStkRack.onKeyPressed = txtStkRackOnKeyPressed;
                            txtStkStorage.visible = true;
                            txtStkStorage.layoutY = 204.0;
                            txtStkStorage.onKeyPressed = txtStkStorageOnKeyPressed;
                            txtStkFormulation.visible = true;
                            txtStkFormulation.layoutY = 135.0;
                            txtStkFormulation.editable = false;
                            txtStkQty.visible = true;
                            txtStkQty.layoutY = 204.0;
                            txtStkQty.promptText = "Qty * Packing";
                            labelTitle.layoutY = 50.0;
                            labelTitle.text = "Add Stock Details";
                            label1.visible = true;
                            label1.layoutY = 158.0;
                            vat.visible = true;
                            vat.layoutY = 227.0;
                            cboVAT.visible = true;
                            cboVAT.layoutY = 225.0;
                            txtStkSellPrice.visible = true;
                            txtStkSellPrice.layoutY = 135.0;
                            txtStkSellPrice.onKeyPressed = txtStkSellPriceOnKeyPressedAtShown;
                            listView.visible = false;
                            listView.layoutX = 39.0;
                            listView.layoutY = 315.0;
                            __layoutInfo_listView.height = 198.0;
                            listView.items = null;
                            txtStkSearch.visible = false;
                            txtStkSearch.layoutY = 528.0;
                            txtStkSearch.selectOnFocus = true;
                            txtStkSearch.editable = true;
                            label5.visible = false;
                            cmbSearchBox.visible = false;
                            cmbSearchBox.layoutY = 0.0;
                            rectAddnew.visible = true;
                            rectAddnew.styleClass = "rectbutton";
                            rectAddnew.onKeyPressed = rectAddnewOnKeyPressedAtShown;
                            rectAddnew.onMouseClicked = rectAddnewOnMouseClickedAtShown;
                            rectAddnew.fill = Yellow;
                            rectAddnew.stroke = DarkGray;
                            rectAddnew.strokeWidth = 2.0;
                            rectAddnew.width = 140.0;
                            rectAddnew.height = 20.0;
                            rectAddnew.arcWidth = 10.0;
                            rectAddnew.arcHeight = 10.0;
                            rectEdit.visible = true;
                            rectEdit.styleClass = "rectbutton";
                            rectEdit.onKeyPressed = rectEditOnKeyPressedAtShown;
                            rectEdit.onMouseClicked = rectEditOnMouseClickedAtShown;
                            rectEdit.fill = Yellow;
                            rectEdit.stroke = DarkGray;
                            rectEdit.strokeWidth = 2.0;
                            rectEdit.width = 120.0;
                            rectEdit.height = 20.0;
                            rectEdit.arcWidth = 10.0;
                            rectEdit.arcHeight = 10.0;
                            labelAddNew.visible = true;
                            __layoutInfo_labelAddNew.width = 140.0;
                            __layoutInfo_labelAddNew.height = 20.0;
                            labelAddNew.text = " Stock Adjustment [F9]";
                            labelAddNew.font = Arial_Bold_12;
                            labelAddNew.hpos = javafx.geometry.HPos.CENTER;
                            labelAddNew.textFill = DarkGray;
                            labelViewStock.visible = true;
                            __layoutInfo_labelViewStock.width = 120.0;
                            __layoutInfo_labelViewStock.height = 20.0;
                            labelViewStock.text = "View Stock";
                            labelViewStock.font = Arial_Bold_12;
                            labelViewStock.hpos = javafx.geometry.HPos.CENTER;
                            labelViewStock.textFill = DarkGray;
                            txtHidden.visible = false;
                            txtHidden.layoutX = 665.0;
                            txtHidden.layoutY = 100.0;
                            __layoutInfo_txtHidden.width = 86.0;
                            txtMinQty.visible = true;
                            txtMinQty.layoutY = 227.0;
                            label18.visible = false;
                            label18.layoutX = 0.0;
                            label18.layoutY = 0.0;
                            label18.text = "Label";
                            label18.textFill = javafx.scene.paint.Color.BLACK;
                            panelAtoZ.visible = false;
                            panelAtoZ.layoutY = 138.0;
                            panelAtoZ.blocksMouse = true;
                            productCount.visible = false;
                            productCount.text = "Label";
                            productCount.font = null;
                            txtStkPCode.visible = true;
                            txtStkPCode.layoutY = 89.0;
                            txtStkPCode.onKeyPressed = txtStkPCodeOnKeyPressedAtShown;
                            txtStkExpiry.visible = true;
                            txtStkExpiry.layoutY = 227.0;
                            txtStkExpiry.promptText = "mm/yy";
                            txtStkExpiry.editable = true;
                            txtStkExpiry.font = Arial_12;
                            txtMargin.visible = true;
                            txtMargin.layoutY = 250.0;
                            txtMargin.editable = false;
                            lblMargin.visible = true;
                            lblMargin.layoutY = 250.0;
                            lblMargin.font = Arial_12;
                            lblMargin.textFill = DarkGray;
                            listProductName.visible = false;
                            listProductName.onKeyPressed = listProductNameOnKeyPressedAtShown;
                            panelStockReport.visible = false;
                            imageClose.visible = false;
                            imageClose.layoutY = 0.0;
                            imageClose.blocksMouse = false;
                            stkPanel.visible = true;
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
                            rectangle.stroke = DarkGray;
                            rectangle.arcWidth = 5.0;
                            label.layoutY = 1.0;
                            label.style = "";
                            label.styleClass = "label";
                            label.text = "Stock - ctrl+t";
                            label.hpos = javafx.geometry.HPos.CENTER;
                            label.graphicHPos = javafx.geometry.HPos.RIGHT;
                            label.textFill = DarkGray;
                            separator.layoutY = 85.0;
                            label2.layoutY = 100.0;
                            label2.text = "Keyword";
                            label3.visible = false;
                            label3.layoutY = 123.0;
                            label4.visible = false;
                            label4.layoutY = 169.0;
                            label6.visible = false;
                            label6.layoutY = 146.0;
                            label7.visible = false;
                            label7.layoutY = 215.0;
                            label8.visible = false;
                            label8.layoutY = 146.0;
                            label9.visible = false;
                            label9.layoutY = 100.0;
                            label10.visible = false;
                            label10.layoutY = 192.0;
                            labelQuantity.visible = false;
                            labelQuantity.layoutY = 0.0;
                            labelQuantity.text = "Quantity";
                            labelQuantity.font = Arial_12;
                            labelQuantity.textFill = DarkGray;
                            lblBarcode.visible = false;
                            lblBarcode.layoutY = 0.0;
                            lblBarcode.text = "Label";
                            lblBarcode.textFill = javafx.scene.paint.Color.BLACK;
                            label11.visible = true;
                            label11.layoutY = 100.0;
                            label11.text = "Search By";
                            label12.visible = false;
                            label12.layoutY = 238.0;
                            label13.visible = false;
                            label13.layoutY = 192.0;
                            labelPackage.visible = false;
                            labelPackage.layoutY = 215.0;
                            labelMinQty.visible = false;
                            labelMinQty.layoutY = 237.0;
                            labelMinQty.text = "Min Qty";
                            txtstkpackage.visible = false;
                            txtstkpackage.disable = false;
                            txtstkpackage.layoutY = 215.0;
                            txtstkpackage.promptText = null;
                            txtstkpackage.editable = true;
                            btnCustCancel.visible = true;
                            btnCustCancel.layoutY = 100.0;
                            btnCustCancel.onKeyPressed = btnCustCancelOnKeyPressedAtView;
                            btnCustCancel.onMouseClicked = btnCustCancelOnMouseClickedAtView;
                            btnCustCancel.effect = reflectionEffect;
                            btnCustCancel.font = Arial_Bold_14;
                            btnCustCancel.strong = false;
                            panelTable.visible = true;
                            btnDeleteZero.visible = true;
                            btnDeleteZero.onMouseClicked = btnDeleteZeroOnMouseClickedAtView;
                            btnDeleteZero.text = "Delete Zero Stock";
                            btnDeleteZero.font = Arial_12;
                            btnDeleteExpiry.visible = true;
                            btnDeleteExpiry.onMouseClicked = btnDeleteExpiryOnMouseClickedAtView;
                            btnDeleteExpiry.text = "Delete Expiry Stock";
                            btnDeleteExpiry.font = Arial_12;
                            imgSave.visible = true;
                            btnStkSave.visible = false;
                            btnStkSave.text = "Save [F3]";
                            imgEdit.visible = true;
                            btnStkEdit.visible = false;
                            btnStkEdit.text = "Edit [F6]";
                            imgReset.visible = true;
                            btnStkReset.visible = false;
                            btnStkReset.text = "Reset [F4]";
                            imgCancel.visible = true;
                            btnStkCancel.visible = false;
                            btnStkCancel.text = "Cancel [F8]";
                            panelbuttons.visible = false;
                            label14.visible = false;
                            label14.layoutY = 100.0;
                            label14.text = "Keyword";
                            txtStkBarcode.visible = false;
                            txtStkBarcode.layoutY = 0.0;
                            txtStkDosage.visible = false;
                            txtStkDosage.layoutY = 169.0;
                            txtStkDosage.editable = true;
                            txtStkMRP.visible = false;
                            txtStkMRP.layoutY = 100.0;
                            txtStkMRP.promptText = null;
                            txtStkBatch.visible = false;
                            txtStkBatch.layoutY = 192.0;
                            txtStkBatch.onKeyPressed = txtStkBatchOnKeyPressed;
                            txtStkPName.visible = false;
                            txtStkPName.layoutY = 123.0;
                            txtStkPurPrice.visible = false;
                            txtStkPurPrice.layoutY = 123.0;
                            txtStkPurPrice.promptText = null;
                            txtStkShelf.visible = false;
                            txtStkShelf.layoutY = 169.0;
                            txtStkShelf.onKeyPressed = txtStkShelfOnKeyPressed;
                            txtStkRack.visible = false;
                            txtStkRack.layoutY = 192.0;
                            txtStkRack.onKeyPressed = txtStkRackOnKeyPressed;
                            txtStkStorage.visible = false;
                            txtStkStorage.layoutY = 215.0;
                            txtStkStorage.onKeyPressed = txtStkStorageOnKeyPressed;
                            txtStkFormulation.visible = false;
                            txtStkFormulation.layoutY = 146.0;
                            txtStkFormulation.editable = true;
                            txtStkQty.visible = false;
                            txtStkQty.layoutY = 215.0;
                            txtStkQty.promptText = null;
                            labelTitle.layoutY = 61.0;
                            labelTitle.text = "Stock Search";
                            label1.visible = false;
                            label1.layoutY = 169.0;
                            vat.visible = false;
                            vat.layoutY = 238.0;
                            cboVAT.visible = false;
                            cboVAT.layoutY = 236.0;
                            txtStkSellPrice.visible = false;
                            txtStkSellPrice.layoutY = 146.0;
                            listView.visible = false;
                            listView.layoutX = 30.0;
                            listView.layoutY = 180.0;
                            __layoutInfo_listView.height = 351.0;
                            listView.items = null;
                            txtStkSearch.visible = true;
                            txtStkSearch.layoutY = 100.0;
                            txtStkSearch.onKeyPressed = txtStkSearchOnKeyPressedAtView;
                            txtStkSearch.selectOnFocus = true;
                            txtStkSearch.editable = true;
                            label5.visible = false;
                            cmbSearchBox.visible = true;
                            cmbSearchBox.layoutY = 100.0;
                            cmbSearchBox.onKeyPressed = cmbSearchBoxOnKeyPressedAtView;
                            cmbSearchBox.effect = null;
                            rectAddnew.visible = true;
                            rectAddnew.styleClass = "rectbutton";
                            rectAddnew.onMouseClicked = rectAddnewOnMouseClickedAtView;
                            rectAddnew.fill = Yellow;
                            rectAddnew.stroke = DarkGray;
                            rectAddnew.strokeWidth = 2.0;
                            rectAddnew.width = 120.0;
                            rectAddnew.height = 20.0;
                            rectAddnew.arcWidth = 10.0;
                            rectAddnew.arcHeight = 10.0;
                            rectEdit.visible = true;
                            rectEdit.styleClass = "rectbutton";
                            rectEdit.onMouseClicked = rectEditOnMouseClickedAtView;
                            rectEdit.fill = Yellow;
                            rectEdit.stroke = DarkGray;
                            rectEdit.strokeWidth = 2.0;
                            rectEdit.width = 120.0;
                            rectEdit.height = 20.0;
                            rectEdit.arcWidth = 10.0;
                            rectEdit.arcHeight = 10.0;
                            labelAddNew.visible = true;
                            __layoutInfo_labelAddNew.width = 140.0;
                            __layoutInfo_labelAddNew.height = 20.0;
                            labelAddNew.onMouseClicked = label21OnMouseClickedAtView;
                            labelAddNew.text = "Add New Stock";
                            labelAddNew.font = Arial_Bold_12;
                            labelAddNew.hpos = javafx.geometry.HPos.CENTER;
                            labelAddNew.textFill = DarkGray;
                            labelViewStock.visible = true;
                            __layoutInfo_labelViewStock.width = 120.0;
                            __layoutInfo_labelViewStock.height = 20.0;
                            labelViewStock.text = "Edit Stock";
                            labelViewStock.font = Arial_Bold_12;
                            labelViewStock.hpos = javafx.geometry.HPos.CENTER;
                            labelViewStock.textFill = DarkGray;
                            txtHidden.visible = false;
                            txtHidden.layoutX = 665.0;
                            txtHidden.layoutY = 231.0;
                            txtMinQty.visible = false;
                            txtMinQty.layoutY = 237.0;
                            label18.visible = true;
                            label18.layoutX = 0.0;
                            label18.layoutY = 6.0;
                            label18.text = "Quick navigation";
                            label18.font = Arial_14;
                            label18.textFill = Green;
                            panelAtoZ.visible = true;
                            panelAtoZ.layoutY = 120.0;
                            panelAtoZ.blocksMouse = true;
                            productCount.visible = true;
                            __layoutInfo_productCount.width = 217.0;
                            productCount.text = "";
                            productCount.font = Arial_Bold_14;
                            txtStkPCode.visible = false;
                            txtStkPCode.layoutY = 100.0;
                            txtStkExpiry.visible = false;
                            txtStkExpiry.layoutY = 238.0;
                            txtStkExpiry.promptText = null;
                            txtStkExpiry.editable = false;
                            txtStkExpiry.font = Arial_12;
                            txtMargin.visible = false;
                            txtMargin.layoutY = 261.0;
                            txtMargin.editable = true;
                            lblMargin.visible = false;
                            lblMargin.layoutY = 261.0;
                            lblMargin.font = Arial_12;
                            lblMargin.textFill = DarkGray;
                            listProductName.visible = false;
                            panelStockReport.visible = true;
                            imageClose.visible = false;
                            imageClose.layoutY = 0.0;
                            imageClose.onMouseClicked = imageCloseOnMouseClickedAtView;
                            imageClose.blocksMouse = true;
                            stkPanel.visible = false;
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
                            rectangle.stroke = DarkGray;
                            rectangle.arcWidth = 5.0;
                            label.layoutY = 1.0;
                            label.style = "";
                            label.styleClass = "label";
                            label.text = "Stock - ctrl+t";
                            label.hpos = javafx.geometry.HPos.CENTER;
                            label.graphicHPos = javafx.geometry.HPos.LEFT;
                            label.textFill = DarkGray;
                            separator.layoutY = 74.0;
                            label2.layoutY = 112.0;
                            label2.text = "Product Name ";
                            label3.visible = true;
                            label3.layoutY = 112.0;
                            label4.visible = true;
                            label4.layoutY = 158.0;
                            label6.visible = true;
                            label6.layoutY = 135.0;
                            label7.visible = true;
                            label7.layoutY = 204.0;
                            label8.visible = true;
                            label8.layoutY = 135.0;
                            label9.visible = true;
                            label9.layoutY = 89.0;
                            label10.visible = true;
                            label10.layoutY = 181.0;
                            labelQuantity.visible = true;
                            labelQuantity.layoutY = 204.0;
                            labelQuantity.text = "Quantity";
                            labelQuantity.font = Arial_12;
                            labelQuantity.textFill = DarkGray;
                            lblBarcode.visible = true;
                            lblBarcode.layoutY = 250.0;
                            lblBarcode.text = "Barcode";
                            lblBarcode.font = Arial_12;
                            lblBarcode.textFill = DarkGray;
                            label11.visible = false;
                            label11.layoutY = 204.0;
                            label11.text = "Quantity";
                            label12.visible = true;
                            label12.layoutY = 227.0;
                            label13.visible = true;
                            label13.layoutY = 181.0;
                            labelPackage.visible = true;
                            labelPackage.layoutY = 204.0;
                            labelMinQty.visible = true;
                            labelMinQty.layoutY = 226.0;
                            labelMinQty.text = "Minimum Qty";
                            txtstkpackage.visible = true;
                            txtstkpackage.disable = false;
                            txtstkpackage.layoutY = 204.0;
                            txtstkpackage.promptText = null;
                            txtstkpackage.editable = true;
                            btnCustCancel.visible = false;
                            btnCustCancel.layoutY = 0.0;
                            btnCustCancel.effect = reflectionEffect;
                            btnCustCancel.font = Arial_Bold_14;
                            btnCustCancel.strong = false;
                            panelTable.visible = true;
                            btnDeleteZero.visible = false;
                            btnDeleteZero.text = "Button";
                            btnDeleteExpiry.visible = false;
                            btnDeleteExpiry.text = "Button";
                            imgSave.visible = true;
                            btnStkSave.visible = true;
                            btnStkSave.text = "Update [F7]";
                            imgEdit.visible = true;
                            btnStkEdit.visible = true;
                            btnStkEdit.text = "Delete [F5]";
                            imgReset.visible = true;
                            btnStkReset.visible = true;
                            btnStkReset.text = "Reset [F4]";
                            imgCancel.visible = true;
                            btnStkCancel.visible = true;
                            btnStkCancel.text = "Back [Ctrl+Left]";
                            panelbuttons.visible = true;
                            label14.visible = true;
                            label14.layoutY = 89.0;
                            label14.text = "Product Code";
                            txtStkBarcode.visible = true;
                            txtStkBarcode.layoutY = 250.0;
                            txtStkBarcode.onKeyPressed = txtStkBarcodeOnKeyPressed;
                            txtStkBarcode.font = Arial_12;
                            txtStkDosage.visible = true;
                            txtStkDosage.layoutY = 158.0;
                            txtStkDosage.editable = false;
                            txtStkMRP.visible = true;
                            txtStkMRP.layoutY = 89.0;
                            txtStkMRP.onKeyPressed = txtStkMRPOnKeyPressedAtShown;
                            txtStkMRP.promptText = null;
                            txtStkBatch.visible = true;
                            txtStkBatch.layoutY = 181.0;
                            txtStkBatch.onKeyPressed = txtStkBatchOnKeyPressed;
                            txtStkPName.visible = true;
                            txtStkPName.layoutY = 112.0;
                            txtStkPurPrice.visible = true;
                            txtStkPurPrice.layoutY = 112.0;
                            txtStkPurPrice.onKeyPressed = txtStkPurPriceOnKeyPressedAtShown;
                            txtStkPurPrice.promptText = null;
                            txtStkShelf.visible = true;
                            txtStkShelf.layoutY = 158.0;
                            txtStkShelf.onKeyPressed = txtStkShelfOnKeyPressed;
                            txtStkRack.visible = true;
                            txtStkRack.layoutY = 181.0;
                            txtStkRack.onKeyPressed = txtStkRackOnKeyPressed;
                            txtStkStorage.visible = true;
                            txtStkStorage.layoutY = 204.0;
                            txtStkStorage.onKeyPressed = txtStkStorageOnKeyPressed;
                            txtStkFormulation.visible = true;
                            txtStkFormulation.layoutY = 135.0;
                            txtStkFormulation.editable = false;
                            txtStkQty.visible = true;
                            txtStkQty.layoutY = 204.0;
                            txtStkQty.promptText = null;
                            labelTitle.layoutY = 50.0;
                            labelTitle.text = "Edit Stock Details";
                            label1.visible = true;
                            label1.layoutY = 158.0;
                            vat.visible = true;
                            vat.layoutY = 227.0;
                            cboVAT.visible = true;
                            cboVAT.layoutY = 225.0;
                            txtStkSellPrice.visible = true;
                            txtStkSellPrice.layoutY = 135.0;
                            txtStkSellPrice.onKeyPressed = txtStkSellPriceOnKeyPressedAtShown;
                            listView.visible = false;
                            listView.layoutX = 39.0;
                            listView.layoutY = 315.0;
                            __layoutInfo_listView.height = 192.0;
                            listView.items = null;
                            txtStkSearch.visible = false;
                            txtStkSearch.layoutY = 528.0;
                            txtStkSearch.selectOnFocus = true;
                            txtStkSearch.editable = true;
                            label5.visible = false;
                            cmbSearchBox.visible = false;
                            cmbSearchBox.layoutY = 0.0;
                            rectAddnew.visible = true;
                            rectAddnew.styleClass = "rectbutton";
                            rectAddnew.onKeyPressed = rectAddnewOnKeyPressedAtEdit;
                            rectAddnew.onMouseClicked = rectAddnewOnMouseClickedAtEdit;
                            rectAddnew.fill = Yellow;
                            rectAddnew.stroke = DarkGray;
                            rectAddnew.strokeWidth = 2.0;
                            rectAddnew.width = 140.0;
                            rectAddnew.height = 20.0;
                            rectAddnew.arcWidth = 10.0;
                            rectAddnew.arcHeight = 10.0;
                            rectEdit.visible = true;
                            rectEdit.styleClass = "rectbutton";
                            rectEdit.onKeyPressed = rectEditOnKeyPressedAtEdit;
                            rectEdit.onMouseClicked = rectEditOnMouseClickedAtEdit;
                            rectEdit.fill = Yellow;
                            rectEdit.stroke = DarkGray;
                            rectEdit.strokeWidth = 2.0;
                            rectEdit.width = 120.0;
                            rectEdit.height = 20.0;
                            rectEdit.arcWidth = 10.0;
                            rectEdit.arcHeight = 10.0;
                            labelAddNew.visible = true;
                            __layoutInfo_labelAddNew.width = 140.0;
                            __layoutInfo_labelAddNew.height = 20.0;
                            labelAddNew.text = "Add new stock";
                            labelAddNew.font = Arial_Bold_12;
                            labelAddNew.hpos = javafx.geometry.HPos.CENTER;
                            labelAddNew.textFill = DarkGray;
                            labelViewStock.visible = true;
                            __layoutInfo_labelViewStock.width = 120.0;
                            __layoutInfo_labelViewStock.height = 20.0;
                            labelViewStock.text = "View Stock";
                            labelViewStock.font = Arial_Bold_12;
                            labelViewStock.hpos = javafx.geometry.HPos.CENTER;
                            labelViewStock.textFill = DarkGray;
                            txtHidden.visible = false;
                            txtHidden.layoutX = 665.0;
                            txtHidden.layoutY = 231.0;
                            txtHidden.font = Arial_12;
                            txtMinQty.visible = true;
                            txtMinQty.layoutY = 227.0;
                            label18.visible = false;
                            label18.layoutX = 0.0;
                            label18.layoutY = 0.0;
                            label18.text = "Label";
                            label18.textFill = javafx.scene.paint.Color.BLACK;
                            panelAtoZ.visible = false;
                            panelAtoZ.layoutY = 138.0;
                            panelAtoZ.blocksMouse = true;
                            productCount.visible = false;
                            productCount.text = "Label";
                            txtStkPCode.visible = true;
                            txtStkPCode.layoutY = 89.0;
                            txtStkPCode.onKeyPressed = txtStkPCodeOnKeyPressedAtShown;
                            txtStkExpiry.visible = true;
                            txtStkExpiry.layoutY = 227.0;
                            txtStkExpiry.promptText = null;
                            txtStkExpiry.editable = true;
                            txtStkExpiry.font = Arial_12;
                            txtMargin.visible = true;
                            txtMargin.layoutY = 250.0;
                            txtMargin.editable = false;
                            lblMargin.visible = true;
                            lblMargin.layoutY = 250.0;
                            lblMargin.font = Arial_12;
                            lblMargin.textFill = DarkGray;
                            listProductName.visible = false;
                            panelStockReport.visible = false;
                            imageClose.visible = false;
                            imageClose.layoutY = 0.0;
                            imageClose.blocksMouse = false;
                            stkPanel.visible = true;
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
    var barcodeFocus=false;
    function txtStkBarcodeOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if(event.code == KeyCode.VK_ENTER) {            
            var stockExists:Integer = 0;
            var itemCode:String = commonController.getQueryValue("SELECT item_code FROM barcode_mapping where delete_flag=0 and item_id='{txtStkBarcode.rawText.trim()}' or barcode='{txtStkBarcode.rawText.trim()}'");
            if(itemCode=="") {
                itemCode= commonController.getQueryValue("SELECT itemcode FROM drugtable where substring(item_id,3,9)='{txtStkBarcode.rawText.trim()}' and dru_flag_id!=3");
            }            
            if(btnStkSave.text=="Update [F7]") {
                stockExists = Integer.parseInt(commonController.getQueryValue("select count(ss_no) from stock_statement where item_code='{itemCode}' and ss_flag_id=0"));
                if(itemCode=="") {
                    FXinfo("Select valid barcode");
                    txtStkBarcode.requestFocus();
                }
                else if(stockExists==0) {
                    FXinfo("The selected Item/barcode does not exist in Stock");
                    txtStkBarcode.requestFocus();
                }
                else if(stockExists==1) {
                    var ssno = commonController.getQueryValue("select ss_no from stock_statement where item_code='{itemCode}' and ss_flag_id=0");
                    displayStkDetails(ssno);
                    barcodeFocus=true;
                }
                else if(stockExists > 1) {
                    var itemName = commonController.getQueryValue("select item_name from stock_statement where item_code='{itemCode}' and ss_flag_id=0");
                    var g: GetStockDrugTable = new GetStockDrugTable("edit");
                    g.loadStockTable(itemName);
                    g.jTextField1.setText(itemName);
                    g.requestFocusInWindow();
                    g.setVisible(true);
                    g.requestFocus();
                    updateValues();
                    barcodeFocus=true;
                }
            }
            else {
                if(itemCode=="") {
                    FXinfo("Select valid barcode");
                    txtStkBarcode.requestFocus();
                }
                else {
                    displayDrugeDetails(itemCode);
                    txtStkBatch.requestFocus();
                    barcodeFocus=true;
                }
            }            
       }
       else if(event.code==KeyCode.VK_TAB) {
           txtStkMRP.requestFocus();
           if(event.shiftDown){
           txtStkExpiry.requestFocus();
           }
       }
       calculateMargin();
       shortcut(event);
      }

    function rectEditOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        loadStockView();
    }

    function rectEditOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if(event.code == KeyCode.VK_TAB ) {
            btnStkSave.requestFocus();
            if(event.shiftDown){
                rectAddnew.requestFocus();
            }
        }else if(event.code == KeyCode.VK_ENTER){
            loadStockView();
        }
        shortcut(event);
    }

    function rectAddnewOnMouseClickedAtShown(event: javafx.scene.input.MouseEvent): Void {
        stkAdjust = new StockAdjustment();
        stkAdjust.setVisible(true);
    }

    function rectAddnewOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if(event.code == KeyCode.VK_TAB) {
            rectEdit.requestFocus();
            if(event.shiftDown){
                cboVAT.requestFocus();
            }
        }else if(event.code == KeyCode.VK_ENTER){
            stkAdjust = new StockAdjustment();
            stkAdjust.setVisible(true);
        }
        shortcut(event);
    }

    function rectEditOnKeyPressedAtEdit(event: javafx.scene.input.KeyEvent): Void {
        if(event.code == KeyCode.VK_TAB ) {
            btnStkSave.requestFocus();
            if(event.shiftDown){
                rectAddnew.requestFocus();
            }
        }else if(event.code == KeyCode.VK_ENTER){
            rectEditActionAtEdit();
        }
        shortcut(event);
    }

    function rectAddnewOnKeyPressedAtEdit(event: javafx.scene.input.KeyEvent): Void {
        if(event.code == KeyCode.VK_TAB ) {
            rectEdit.requestFocus();
            if(event.shiftDown){
                cboVAT.requestFocus();
            }
        }else if(event.code == KeyCode.VK_ENTER){
            rectAddnewActionAtEdit();
        }
        shortcut(event);
    }
    var stkAdjust:StockAdjustment;
    

    function btnDeleteExpiryOnMouseClickedAtView(event: javafx.scene.input.MouseEvent): Void {       
        try {
        var cn:ConfirmDialogBox=new ConfirmDialogBox(1,"Stock");
        var a =bind cn.staus;
        if (a) {
            var sql:String = "update stock_statement set ss_flag_id=1 where now() > DATE_ADD(expiry_date,INTERVAL 1 month) and qty>0";
            commonController.queryExecution(sql);
            FXinfo("Expiry stock deleted successfully");
        }
        }
        catch(e:Exception) {
          var msg: String = "Class :Stock  Method  : btnDeleteExpiryOnMouseClickedAtView = {e.getMessage()}";
          log.debug(msg);
        }
        }

    function btnDeleteZeroOnMouseClickedAtView(event: javafx.scene.input.MouseEvent): Void {        
        try {
        var cn:ConfirmDialogBox=new ConfirmDialogBox(1,"Stock");
        var a =bind cn.staus;
        if (a) {
            var sql:String = "update stock_statement set ss_flag_id=1 where qty<=0";
            commonController.queryExecution(sql);
            FXinfo("Stock with zero Qty deleted successfully");
        }
        }
        catch(e:Exception) {
          var msg: String = "Class :Stock  Method  : btnDeleteZeroOnMouseClickedAtView = {e.getMessage()}";
          log.debug(msg);
        }
        }

    function cboVATOnMouseExited(event: javafx.scene.input.MouseEvent): Void {
        if(not cboVAT.selectedItem.toString().equals(""))
        calculateMargin();
        }

    function txtStkSellPriceOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        calculateMargin();
         }

    function txtStkPurPriceOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        calculateMargin();
         }
   
   var stockController: com.vanuston.medeil.implementation.Stock=RegistryFactory.getClientStub(RegistryConstants.Stock) as com.vanuston.medeil.implementation.Stock;;
   var drugController:Drug=RegistryFactory.getClientStub(RegistryConstants.Drug) as com.vanuston.medeil.implementation.Drug;
   var commonController:CommonImplements= RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements ;
   var vatValues:String[];

    function cboVATOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
       vatValues = commonController.getVatValues().toArray() as String[];
       if(not cboVAT.selectedItem.toString().equals(""))
        calculateMargin();
    }

    function cboVATOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
       vatValues = commonController.getVatValues().toArray() as String[];
       if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
           rectAddnew.requestFocus();
           if(event.shiftDown){
            txtMinQty.requestFocus();
           }
        }
       shortcut(event);
       calculateMargin();
    }
         
    function imageCloseOnMouseClickedAtView(event: javafx.scene.input.MouseEvent): Void {
        delete  panelStockReport.content;
        imageClose.visible = false;
        CommonDeclare.form[2] = 4;
    }
    def kr = KeyRegistry {};

    var key = bind CommonDeclare.currKyEvent on replace {
        if (CommonDeclare.currModule == 3 and CommonDeclare.form[2] == 4) {
              shortcut(key);
        }
    }

    function txtstkpackageOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtStkExpiry.requestFocus();
            if(event.shiftDown){
                txtStkQty.requestFocus();
            }
        }
        shortcut(event);
    }
    function txtStkPNameOnKeyReleased(event: javafx.scene.input.KeyEvent): Void {
        txtStkPName.style = mandatoryStyle;
        GetStockDrugTable.jTextField1.setText(txtStkPName.rawText.trim());
        txtStkPName.text = "";
        barcodeFocus=false;
    }
    function rectangleOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        listProductName.visible = false;
        listStock.visible = false;
        listView.visible = false;
        stkPanel.visible = false;
    }

    var dir1 = new File(".");
    var path: String = dir1.getCanonicalFile().toString();
    var curDateFlag: Boolean = false;
    var fxCalendar = FXCalendar {
                theme: GrayTheme {};
            };
    var user = bind CommonDeclare.user;
    var today = DateUtils.now("dd-MM-yyyy");
    var rowNo = 8;
    var colNames: Object[] = ["S.No", "Item Name", "Formulation", "Dosage", "Rack No.", "Shelf No.", "Batch No.", "Qty.", "Expiry", "MRP", "Purchase Price", "Selling Price"];
    var colType: Class[] = [java.lang.String.class, java.lang.String.class, java.lang.String.class,
                java.lang.String.class, java.lang.String.class, java.lang.String.class,
                java.lang.String.class, java.lang.String.class, java.lang.String.class,
                java.lang.String.class, java.lang.String.class, java.lang.String.class];
    var colEditable: Boolean[] = [false, false, false, false, false, false, false, false, false, false, false, false];
    var colWidth: Integer[] = [40, 130, 55, 50, 50, 50, 55, 50, 50, 50, 50, 75];
    var StockStatementTable=new StockStatementTable();
    var stockViewTable = StockStatementTable.createTable(rowNo, colNames, colType, colEditable, colWidth);
    var stockTable = SwingComponent.wrap(StockStatementTable.getScrollTable(stockViewTable));
    var log: Logger = Logger.getLogger(Stock.class, "Inventory");
    var s: String;
    var panelW = bind CommonDeclare.panelFormW;
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
    var buttonLY = 0.0;
    var bottonImageW = bind CommonDeclare.bottonImageW;
    var bottonImageH = bind CommonDeclare.bottonImageH;
    var bottonW = bind CommonDeclare.bottonW;
    var bottonH = bind CommonDeclare.bottonH;
    var CancelW = bottonW + 10;
    var rectbutton1LX = bind CommonDeclare.rectbutton1LX;
    var rectbutton2LX = bind CommonDeclare.rectbutton2LX;
    var rectbuttonLY = bind CommonDeclare.rectbuttonLY;
    var seperatorW = bind CommonDeclare.seperatorW;
    var Type1TextboxW = bind CommonDeclare.Type1TextboxW;
    var Type2TextboxW = bind CommonDeclare.Type2TextboxW;
    var Type3TextboxW = bind CommonDeclare.Type3TextboxW;//100
    var Type4TextboxW = bind CommonDeclare.Type4TextboxW;
    var ImageCalenderLX = bind C2LX + Type3TextboxW - 28;
    var panelCalenderLX = bind C2LX + Type3TextboxW + 22;
    var SearchTextboxLX = bind (15.37484117 * panelW / 100);
    var labelSearchLX = bind (41.93138501 * panelW / 100);
    var ChoiceSearchLX = bind (50.44472681 * panelW / 100);
    var ChoiceSearchW = bind (12.7064803 * panelW / 100);
    var buttonSearchLX = bind (69.63151207 * panelW / 100);
    var buttonReportLX = bind (85.51461245 * panelW / 100);
    var panelQuickNavigationLX = bind (8.132147395 * panelW / 100);
    var TableW = bind (95.29860229 * panelW) / 100 on replace { changeTableSize(TableW, TableH); };
    var TableH = 190.0 on replace { changeTableSize(TableW, TableH); };
    var panelTableLX = bind (panelW - TableW) / 2;
    var panelTableLY = 280.0;
    var rectRemoveRowLX = bind ((panelW + TableW) / 2) - 100;

    function changeTableSize(i: Integer, j: Integer): Void {
        stockTable.getJComponent().setPreferredSize(new Dimension(i, j));
    }

    var panelAlertLX = bind (panelW - 500) / 2;
    var panelAlertLY = bind (panelH - 150) / 2;
    var mandatoryStyle: String = CommonDeclare.textbox_mandatory();
    def CustomAlert = CustomAlert {};
    var errorStyle: String = CommonDeclare.textbox_error();
    var listH = 0.0;
    var listW = Type2TextboxW;

    function FXinfo(msg: String, err_txtbox: TextBox): Void {
        CustomAlert.ShowInfo("Stock", msg);
        showAlertbox();
        err_txtbox.requestFocus();
        err_txtbox.style = errorStyle;
    }

    function FXalert(type: Integer): Void {
        CustomAlert.ShowAlert("Stock", type);
        showAlertbox();
    }

    function showAlertbox(): Void {
        panelAlert.visible = true;
        delete  panelAlert.content;
        insert CustomAlert.getDesignRootNodes() into panelAlert.content;
        CustomAlert.show();
    }

    function FXinfo(msg: String): Void {
        CustomAlert.ShowInfo("Stock", msg);
        showAlertbox();
    }



    

    function txtMinQtyOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        txtMinQty.style = mandatoryStyle;
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            cboVAT.requestFocus();
            if(event.shiftDown){
                txtStkStorage.requestFocus();
            }
        }
        shortcut(event);
    }

    function btnStkCancelOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if (btnStkCancel.text == "Back [Ctrl+Left]") {
            back();
        } else {
            panel.visible = false;
            CancelForm();
        }
    }
    function btnStkCancelOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            if (btnStkCancel.text == "Back [Ctrl+Left]") {
                back();
            } else {
                panel.visible = false;
                CancelForm();
            }
        } else if (event.code == KeyCode.VK_TAB) {
            txtStkPCode.requestFocus();
            if(event.shiftDown){
                btnStkReset.requestFocus();
            }
        } else {
            shortcut(event);
        }
    }

    function deleteClick(): Void {
        try {                                 
            var txtStkPName1 = txtStkPName.text.concat("_");
            txtStkPName1 = txtStkPName1.concat(txtStkDosage.text);
            if (txtStkPCode.text == null or txtStkPCode.text.trim().length() <= 0) {
                FXinfo("Please Enter Product Name ", txtStkPName);
            } else if (txtStkPName.text == null or txtStkPName.text.trim().length() <= 0) {
                FXinfo("Please Enter Product Name ", txtStkPName);
            } else if (txtStkBatch.text == null or txtStkBatch.text.trim().length() <= 0) {
                FXinfo("Please Enter Batch No ", txtStkBatch);
            } else {
                var stockBean : StockModel = new StockModel();
            stockBean.setStock_itemCode(Integer.valueOf(txtStkPCode.text));
            stockBean.setStock_itemName(txtStkPName.text.concat("_").concat(txtStkDosage.text));
            stockBean.setStock_batchNo(txtStkBatch.text);
                 var cn:ConfirmDialogBox=new ConfirmDialogBox(1,"Stock");
                                    var a =bind cn.staus;
                                if (a) {

                                        var stockDelete: Boolean = stockController.deleteRecord(stockBean) as Boolean;
                                        if(stockDelete.equals(true))
                                        {
                                        FXalert(5);
                                        }
                                    clearAll();
                                    StockStatementTable.loadStockStatementValues();
                                }
            }
        } catch (e: Exception) {
            var msg: String = "Class :Stock  Method  : Delete [F5] Click   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function btnStkResetOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        clearAll();

    }

    function btnStkResetOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            clearAll();
        } else if (event.code == KeyCode.VK_TAB) {
            btnStkCancel.requestFocus();
            if(event.shiftDown){
                btnStkEdit.requestFocus();
            }
        } else {
            shortcut(event);
        }
    }

    function btnStkEditOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        if (btnStkEdit.text == "Edit [F6]") {
            edit();
        } else {
            deleteClick();
        }
    }

    function btnStkEditOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER ) {
            if (btnStkEdit.text == "Edit [F6]") {
                edit();
            } else {
                deleteClick()
            }
        } else if (event.code == KeyCode.VK_TAB) {
            btnStkReset.requestFocus();
            if(event.shiftDown){
                rectEdit.requestFocus();
//                btnStkSave.requestFocus();
            }
        } else {
            shortcut(event);
        }
    }

    function btnStkSaveOnMouseClicked(event: javafx.scene.input.MouseEvent): Void {
        saveClick();
    }

    function btnStkSaveOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER) {
            saveClick();
        } else if(event.code == KeyCode.VK_TAB){
                btnStkEdit.requestFocus();
            if(event.shiftDown){                
                btnStkEdit.requestFocus();
            }                
        }
    }

    public function shortcut(event: javafx.scene.input.KeyEvent): Void {
//        if (event.controlDown or event.altDown or event.shiftDown) {
//            kr.actionKey = event.code;
//        }
        if (event.code == kr.save and btnStkSave.text == "Save [F3]" and not btnStkSave.disable) {
            saveClick();
        }
        if (event.code == kr.update and btnStkSave.text == "Update [F7]" and not btnStkSave.disable) {
            saveClick();
        }
        if (event.code == kr.edit and btnStkEdit.text == "Edit [F6]" and not btnStkEdit.disable) {
            edit();
        }
        if (event.code == kr.reset and btnStkReset.text == "Reset [F4]") {
            clearAll();
        }
        if (event.code == kr.del and not btnStkEdit.disable) {
            deleteClick();
        }        
        if (event.controlDown == true and event.code == kr.back) {
            if (btnStkCancel.text == "Back [Ctrl+Left]") { back(); }
        }
        if (event.code == kr.cancel) {
            if (btnStkCancel.text == "Cancel [F8]") { panel.visible = false; CancelForm(); }
        }
        if(event.code == KeyCode.VK_F9) {
            stkAdjust = new StockAdjustment();
            stkAdjust.setVisible(true);
        }
    }

    function txtStkStorageOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtMinQty.requestFocus();
            if(event.shiftDown){
                txtStkRack.requestFocus();
            }
        }
        shortcut(event);
    }

    function txtStkRackOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtStkStorage.requestFocus();
            if(event.shiftDown){
                txtStkShelf.requestFocus();
            }
        }
        shortcut(event);
    }

    function txtStkShelfOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtStkRack.requestFocus();
            if(event.shiftDown){
                txtStkSellPrice.requestFocus();
            }
        }
        shortcut(event);
    }
    
    function txtStkMRPOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtStkPurPrice.requestFocus();
        }
        shortcut(event);
    }

    function txtStkExpiryOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            if(txtStkBarcode.rawText.trim().equals("")) {
                txtStkBarcode.requestFocus();
            }
            else {
                txtStkMRP.requestFocus();   
            }
            if(event.shiftDown){
                txtstkpackage.requestFocus();
            }
        } shortcut(event);
    }

    function txtStkQtyOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        txtStkQty.style = mandatoryStyle;
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtstkpackage.requestFocus();
            if(event.shiftDown){
                txtStkBatch.requestFocus();
            }
        }
        shortcut(event);
    }

    function txtStkBatchOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        txtStkBatch.style = mandatoryStyle;
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtStkQty.requestFocus();
            if(event.shiftDown){
                txtStkDosage.requestFocus();
            }
        }
        shortcut(event);
    }

    function txtStkDosageOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if(event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtStkBatch.requestFocus();
            if(event.shiftDown){
                txtStkFormulation.requestFocus();
            }
        }
        shortcut(event);
    }

    function txtStkFormulationOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        if(event.code == KeyCode.VK_TAB ) {
            txtStkDosage.requestFocus();
            if(event.shiftDown){
                txtStkPName.requestFocus();
            }
        }
        shortcut(event);
    }

    function txtStkPNameOnKeyPressed(event: javafx.scene.input.KeyEvent): Void {
        txtStkPName.style = mandatoryStyle;
        shortcut(event);
        if (event.code == KeyCode.VK_F3 or
            event.code == KeyCode.VK_F4 or
            event.code == KeyCode.VK_F5 or
            event.code == KeyCode.VK_F6 or
            event.code == KeyCode.VK_F7 or
            event.code == KeyCode.VK_F8 or
            event.code == KeyCode.VK_TAB or
            event.code == KeyCode.VK_CONTROL or
            event.code == KeyCode.VK_SHIFT ) {
        } else if(not event.shiftDown and not event.controlDown and not event.altDown){
            if (btnStkSave.text == "Save [F3]") {
                var g: GetStockDrugTable = new GetStockDrugTable("save");
                g.jTextField1.setText(txtStkPName.rawText.trim());
                g.requestFocusInWindow();
                g.setVisible(true);
                g.requestFocus();
                updateValues();
            } else {
                var g: GetStockDrugTable = new GetStockDrugTable("edit");
                g.jTextField1.setText(txtStkPName.rawText.trim());
                g.requestFocusInWindow();
                g.setVisible(true);
                g.requestFocus();
                updateValues();
            }
            updateValues();
        }
        if(event.code == KeyCode.VK_TAB) {
            txtStkFormulation.requestFocus();
            if(event.shiftDown){
                txtStkPCode.requestFocus();
            }
        }
        if(event.code == KeyCode.VK_ENTER) {
            barcodeFocus = false;
        }
    }    

   function btnCustCancelOnMouseClickedAtView(event: javafx.scene.input.MouseEvent): Void {
        viewClick();
    }

// This function is used to Search Product
    function viewClick(): Void {
        var itemName: String = txtStkSearch.text;
        var producttype: Integer = cmbSearchBox.selectedIndex;

        if (itemName == null or itemName.trim().length() < 0) {
            FXinfo("Please Enter Search Value");
            txtStkSearch.requestFocus();
        } else if (producttype < 0) {
            FXinfo("Please Select Search Type ");
            cmbSearchBox.requestFocus();
        } else {
            productCount.text = StockStatementTable.searchStockStatementValues(itemName, producttype);
        }
    }

    function btnCustCancelOnKeyPressedAtView(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_ENTER or event.code == KeyCode.VK_SPACE) {
            viewClick();
        } else {
            shortcut(event);
        }
    }

    function cmbSearchBoxOnKeyPressedAtView(event: javafx.scene.input.KeyEvent): Void {

        if (event.code == KeyCode.VK_TAB) {
            btnCustCancel.requestFocus();
        } shortcut(event);
    }

    function txtStkSearchOnKeyPressedAtView(event: javafx.scene.input.KeyEvent): Void {

        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            cmbSearchBox.select(0);
            cmbSearchBox.requestFocus();
        } shortcut(event);
    }

    function label21OnMouseClickedAtView(event: javafx.scene.input.MouseEvent): Void {
        setTableLay();
    }

// This function is used to save the Stock Details
    function clearAll(): Void {
        oldBatchNo="";
        productCount.text = "";
        txtStkPCode.text = "";
        txtStkPName.text = "";
        txtStkFormulation.text = "";
        txtStkDosage.text = "";
        txtStkBatch.text = "";
        txtStkQty.text = "";
        txtStkMRP.text = "";
        txtStkPurPrice.text = "";
        txtStkSellPrice.text = "";
        txtStkShelf.text = "";
        txtStkRack.text = "";
        txtStkStorage.text = "";
        if(barcodeFocus==true) {
            txtStkBarcode.requestFocus();
        }
        else {
            txtStkPName.requestFocus();
        }
        barcodeFocus==false;
        StockStatementTable.loadStockStatementValues();
        txtHidden.text = "";
        txtMargin.text = "";
        StockStatementTable.rowselt = "-1";
        txtMinQty.text = "";
        txtstkpackage.text = "1";
        txtStkExpiry.text = DateUtils.now("MM/yy");
        vatValues = commonController.getVatValues().toArray() as String[];
        cboVAT.select(0);
        txtStkBarcode.text="";
    }


    function saveClick(): Void {
       var batchExists = commonController.getQueryValue("SELECT count(*) FROM (select item_code,batch_no from sales_Cash_bill where batch_no='{oldBatchNo}' and item_code='{txtStkPCode.rawText.trim()}' "
       "union select item_code,batch_no from sales_Credit_bill where batch_no='{oldBatchNo}' and item_code='{txtStkPCode.rawText.trim()}' "
       "union select item_code,batch_no from sales_Cards_bill where batch_no='{oldBatchNo}' and item_code='{txtStkPCode.rawText.trim()}' "
       "union select item_code,batch_no from sales_accounts where batch_no='{oldBatchNo}' and item_code='{txtStkPCode.rawText.trim()}') s");
        var sdf = new SimpleDateFormat("dd-MM-yyyy");
        var val: Validation = null;
        val = new Validation();
        try {
            var si2: Integer = 0; si2 = val.getNumberValid(txtStkQty.rawText, 1, 11);
            var si3: Integer = 0; si3 = val.getDecimalValid(txtStkMRP.rawText, 1, 14);
            var si4: Integer = 0; si4 = val.getDecimalValid(txtStkPurPrice.rawText, 1, 14);
            var si5: Integer = 0; si5 = val.getDecimalValid(txtStkSellPrice.rawText, 1, 14);
            var si6: Integer = 0; si6 = val.getNumberValid(txtMinQty.rawText, 1, 5);
            var si7: Integer = 0; si7 = val.getNumberValid(txtstkpackage.rawText, 1, 5);

            if ( txtStkPCode.rawText.trim() == null or  txtStkPCode.rawText.trim().length() <= 0) {
                FXinfo("Please Enter Product Name ", txtStkPName);
            } else if (txtStkPName.rawText == null or txtStkPName.rawText.trim().length() <= 0) {
                FXinfo("Please Enter Product Name ", txtStkPName);
            } else if (txtStkBatch.rawText == null or txtStkBatch.rawText.trim().length() <= 0) {
                FXinfo("Please Enter Batch No ", txtStkBatch);
            } else if (txtStkBatch.rawText.trim().length() > 50) {
                FXinfo("Batch No cannot exceed more than  50 Characters ", txtStkBatch);
//            } else if ( btnStkSave.text == "Update [F7]" and oldBatchNo != txtStkBatch.rawText.trim() ) {
//                FXinfo("Batch No cannot exceed more than  30 Characters ", txtStkBatch);
            } else if (txtStkQty.rawText == null or txtStkQty.rawText.trim().length() <= 0) {
                FXinfo("Please Enter Quantity ", txtStkQty);
            } else if (si2 != 10) {
                FXinfo("Only numbers allowed in quantity", txtStkQty);
            } else if (txtStkQty.rawText.trim().length() > 10) {
                FXinfo("Quantity cannot exceed more than 10 digits", txtStkQty);
            } else if (not validateExpiryDate(txtStkExpiry.rawText.trim())) {
                FXinfo("Expiry date format or the date and year entered is incorrect.Please check.");
                txtStkExpiry.requestFocus();
            }
            else if (txtStkMRP.rawText == null or txtStkMRP.rawText.trim().length() <= 0) {
                FXinfo("Please Enter MRP ", txtStkMRP);
            } else if (si3 != 10) {
                FXinfo("Only numbers allowed in MRP) ", txtStkMRP);
            } else if (txtStkMRP.rawText.trim().length() > 14) {
                FXinfo("MRP cannot exceed more than 14 digits", txtStkMRP);
            } else if (txtStkPurPrice.rawText == null or txtStkPurPrice.rawText.trim().length() <= 0) {
                FXinfo("Please Enter Purchase Price", txtStkPurPrice);
            } else if (si4 != 10) {
                FXinfo("Only numbers allowed in Purchase Price) ", txtStkPurPrice);
            } else if (txtStkPurPrice.rawText.trim().length() > 14) {
                FXinfo("Purchase Price cannot exceed more than 14 digits ", txtStkPurPrice);
            } else if (txtStkSellPrice.rawText == null or txtStkSellPrice.rawText.trim().length() <= 0) {
                FXinfo("Please Enter Selling Price ", txtStkSellPrice);
            } else if (si5 != 10) {
                FXinfo("Only numbers allowed in Selling Price ", txtStkSellPrice);
            } else if (txtStkSellPrice.rawText.trim().length() > 14) {
                FXinfo("Selling Price cannot exceed more than 14 digits ", txtStkSellPrice);
            } else if (txtStkSellPrice.rawText.trim().length() > 14) {
                FXinfo(" Shelf number cannot exceed more than 14 Characters");
                txtStkShelf.requestFocus();
            } else if (txtStkRack.rawText.trim().length() > 14) {
                FXinfo("Rack Number cannot exceed more than 14 Characters");
                txtStkRack.requestFocus();
            } else if (txtStkStorage.rawText.trim().length() > 29) {
                FXinfo("Cold Storage cannot exceed more than 30 Characters");
                txtStkStorage.requestFocus();
            } else if (txtMinQty.rawText == null or txtMinQty.rawText.trim().length() == 0) {
                FXinfo("Please Enter Minimum Qty ", txtMinQty);
            } else if (si6 != 10) {
                FXinfo("Only numbers allowed in Minimum Qty", txtMinQty);
            } else if (txtstkpackage.rawText == null or txtstkpackage.rawText.trim().length() == 0) {
                FXinfo("Please Enter Package");
                txtstkpackage.requestFocus();
            } else if (si7 != 10) {
                FXinfo("Only numbers allowed in Package");
                txtstkpackage.requestFocus();
            } else if(cboVAT.selectedItem.equals("---Select---") or cboVAT.selectedItem.toString().equals("")) {
                FXinfo("Please select the VAT");
            } else if(btnStkSave.text.equals("Update [F7]") and Integer.parseInt(batchExists) > 0 and (not oldBatchNo.equals(txtStkBatch.rawText.trim()))) {
                FXinfo("Batch number cannot be modified for this item since sales bill already entered.");
            }
            else {
                var stockBean:StockModel=new StockModel();
                var drugBean:DrugModel=new DrugModel();
                stockBean.setStock_itemCode(Integer.valueOf(txtStkPCode.rawText));



        stockBean.setStock_rackNo(txtStkRack.rawText.trim().replaceAll("'", ""));
        stockBean.setStock_shelfNo(txtStkShelf.rawText.trim().replaceAll("'", ""));
        stockBean.setStock_coldStorage(txtStkStorage.rawText.trim().replaceAll("'", ""));
        stockBean.setStock_batchNo(txtStkBatch.rawText.trim().replaceAll("'", ""));
        stockBean.setStock_qty(Integer.valueOf(txtStkQty.rawText));
        stockBean.setStock_packing(Integer.valueOf(txtstkpackage.rawText));
        stockBean.setStock_expiryDate(new SimpleDateFormat("yyyy-MM-dd").format(new SimpleDateFormat("MM/yy").parse(txtStkExpiry.rawText.trim())));
        stockBean.setStock_mrp(Double.valueOf(txtStkMRP.rawText));
        stockBean.setStock_purchasePrice(Double.valueOf(txtStkPurPrice.rawText));
        stockBean.setStock_sellingPrice(Double.valueOf(txtStkSellPrice.rawText));
        stockBean.setStock_formulation(txtStkFormulation.rawText.trim().replaceAll("'", ""));
        stockBean.setStock_date(DateUtils.changeFormatDate(sdf.parse(today)));
        stockBean.setStock_minQty(Integer.valueOf(txtMinQty.rawText.trim()));
        stockBean.setVat(Double.parseDouble(cboVAT.selectedItem.toString()));
                var mrp: Double = 0.00;
                

                if (txtstkpackage.text != null and txtstkpackage.text.trim().length() > 0) {
                    Integer.parseInt(txtstkpackage.text );
                }
                   if (txtStkMRP.text != null and txtStkMRP.text.trim().length() > 0) {
                    mrp = stockBean.getStock_mrp();
                    drugBean.setPassVale(10);
                    drugBean.setDrug_code(stockBean.getStock_itemCode().toString());
                    drugBean.setMrp(mrp);
                    
                    drugBean.setVAT_percentage(stockBean.getVat());
                   }

                if (txtStkSellPrice.text != null and txtStkSellPrice.text.trim().length() > 0) {
                    Double.parseDouble(txtStkSellPrice.rawText);
                }
                if (txtStkPurPrice.text != null and txtStkPurPrice.text.trim().length() > 0) {
                   Double.parseDouble(txtStkPurPrice.rawText);
                }

                if (txtStkQty.rawText!= null and txtStkQty.rawText.trim().length() > 0) {
                    Integer.parseInt(txtStkQty.rawText);
                }

                
                if (txtStkPurPrice.rawText != null and txtStkSellPrice.text .trim().length() > 0) {
                    Double.valueOf(txtStkSellPrice.text );
                }

                if (txtStkPurPrice.rawText  != null and txtStkPurPrice.rawText .trim().length() > 0) {
                    Double.valueOf(txtStkPurPrice.rawText );
                }



                        stockBean.setStock_itemName('checkitembatch');
                        var curStkQty: Integer = stockController.viewRecord(stockBean) as Integer;


                        stockBean.setStock_batchNo(txtStkBatch.rawText.trim().replaceAll("'", ""));
                        stockBean.setStock_itemName('returnStockNo');
                        var sssNo: Integer =stockController.viewRecord(stockBean) as Integer;

                if (btnStkSave.text == "Save [F3]") {

                    if(txtStkDosage.rawText.trim().replaceAll("'","")=='')   {
                    stockBean.setStock_itemName(txtStkPName.rawText.trim().concat("_"));
                    }else{
                    stockBean.setStock_itemName(txtStkPName.rawText.trim().concat("_").concat(txtStkDosage.rawText.trim()));
                    }
                    var stockSave=stockController.createRecord(stockBean) as Boolean;
                    if(stockSave.equals(true)){
                     if(drugController.updateRecord(drugBean).equals(true)){
                                       }
                    }
                    FXalert(0);
                    clearAll();
                    StockStatementTable.loadStockStatementValues();
                } else {
                     var cn:ConfirmDialogBox=new ConfirmDialogBox(0,"Stock");
                     var a =bind cn.staus;
                     if (a) {
                         var ssno: String = txtHidden.rawText.trim();
                         var stNo:Integer=Integer.parseInt(ssno);
                             if(prevssNo==stNo or sssNo==0) {
                             stockBean.setStock_ssNo(Integer.valueOf(ssno));
                             stockBean.setPrev_Stock_ssnNO(Integer.valueOf(prevssNo));
                             stockBean.setStock_itemName(txtStkPName.rawText.trim().concat("_").concat(txtStkDosage.rawText.trim()).replaceAll("'",""));
                             var stockUpdate=stockController.updateRecord(stockBean) as Boolean;
                             if(stockUpdate.equals(true)) {
                                 if(drugController.updateRecord(drugBean).equals(true)){
                                 }
                             }
                         } else {
                             ssno = txtHidden.rawText.trim();
                             stNo=Integer.parseInt(ssno);
                             stockBean.setStock_ssNo(Integer.valueOf(sssNo));
                             stockBean.setPrev_Stock_ssnNO(Integer.valueOf(prevssNo));
                             stockBean.setStock_qty(curStkQty);
                             stockBean.setStock_itemName(txtStkPName.rawText.trim().concat("_").concat(txtStkDosage.rawText.trim()).replaceAll("'",""));
                             var stockUpdate=stockController.updateRecord(stockBean) as Boolean;
                             if(stockUpdate.equals(true)) {
                                 if(drugController.updateRecord(drugBean).equals(true)){
                                 }
                             }
                         }
                         FXalert(4);
                         clearAll();
                         StockStatementTable.loadStockStatementValues();
                     }
                }

            }
        } catch (e: Exception) {
            var msg: String = "Class :Stock  Method  : saveClick()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    

    
    function txtStkSellPriceOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtStkSellPrice.style = mandatoryStyle;
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtStkShelf.requestFocus();
            if(event.shiftDown){
                txtStkPurPrice.requestFocus();
            }
        } shortcut(event);
    }

    function txtStkPurPriceOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        txtStkPurPrice.style = mandatoryStyle;
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtStkSellPrice.requestFocus();
            if(event.shiftDown){
                txtStkMRP.requestFocus();
            }
        } shortcut(event);
    }
    function txtStkPCodeOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtStkPName.requestFocus();
            if(event.shiftDown){
                btnStkCancel.requestFocus();
            }
        }
        shortcut(event);
    }
    function txtStkMRPOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtStkPurPrice.requestFocus();
            if(event.shiftDown){
                txtStkExpiry.requestFocus();
            }
        } shortcut(event);
    }

    function txtStkExpiryOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtStkMRP.requestFocus();
        } shortcut(event);
    }

    function txtStkQtyOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {

        txtStkQty.style = mandatoryStyle;
        if (event.code == KeyCode.VK_TAB or event.code == KeyCode.VK_ENTER) {
            txtStkExpiry.requestFocus();
        } shortcut(event);
    }

    

    function listProductNameOnKeyPressedAtShown(event: javafx.scene.input.KeyEvent): Void {
        if (listProductName.focused) {
            if (event.code == KeyCode.VK_DOWN)
                listProductName.selectFirstRow();
        } shortcut(event);
    }

    public function back(): Void {
        CancelW = bottonW + 10;
        imgEdit.image = imageEdit;
        imgCancel.image = imageCancel;
        currentState.actual = currentState.findIndex("Shown");
        panelTableLY = 280.0;
        btnStkReset.text = "Reset [F4]";
        clearAll();
    }

    function rectEditActionAtEdit(): Void {
        currentState.actual = currentState.findIndex("View");
        panelTableLY = 170.0;
        viewTableLayout();
        StockStatementTable.loadStockStatementValues();
        txtStkSearch.text = "";
        productCount.text = "";
    }

    function rectEditOnMouseClickedAtEdit(event: javafx.scene.input.MouseEvent): Void {
        rectEditActionAtEdit();
    }

    function rectAddnewOnMouseClickedAtEdit(event: javafx.scene.input.MouseEvent): Void {
        rectAddnewActionAtEdit();
    }

    function rectAddnewActionAtEdit(): Void {
        CancelW = bottonW + 10;
        imgEdit.image = imageEdit;
        imgCancel.image = imageCancel;
        currentState.actual = currentState.findIndex("Shown");
        panelTableLY = 280.0;
        setTableLay();
        productCount.text = "";
        clearAll();
    }

    function rectAddnewOnMouseClickedAtView(event: javafx.scene.input.MouseEvent): Void {
        CancelW = bottonW + 10;
        imgEdit.image = imageEdit;
        imgCancel.image = imageCancel;
        currentState.actual = currentState.findIndex("Shown");
        panelTableLY = 280.0;
        setTableLay();
        productCount.text = "";
    }

    function rectEditOnMouseClickedAtView(event: javafx.scene.input.MouseEvent): Void {
        edit();
    }

    public function edit(): Void {
        CancelW = bottonW + 50;
        imgEdit.image = imageCancel;
        imgCancel.image = imageBack;
        try {
            if (StockStatementTable.rowselt != "-1") {
                currentState.actual = currentState.findIndex("Edit");
                panelTableLY = 280.0;
                setTableLay();
                displayStkDetails(StockStatementTable.rowselt);
                btnStkEdit.text = "Delete [F5]";                
            } else {
                currentState.actual = currentState.findIndex("Edit");
                panelTableLY = 280.0;
                setTableLay();
                btnStkEdit.text = "Delete [F5]";                
                clearAll();
            }
        } catch (e: Exception) {
            var msg: String = "Class :Stock  Method  : edit()   = {e.getMessage()}";
            log.debug(msg);
        }

    }

    
    function loadStockView(): Void {
        viewTableLayout();
        StockStatementTable.loadStockStatementValues();
        currentState.actual = currentState.findIndex("View");        
        panelTableLY = 170.0;
        txtStkSearch.text = "";
        productCount.text = "";
        cmbSearchBox.select(0);
    }
// this functionis used to get View Layout
    function viewTableLayout(): Void {
        clearAll();
        stockTable.layoutX = 0;
        stockTable.layoutY = 0;
        TableH = 290.0;
        txtStkSearch.requestFocus();
//        cmbSearchBox.select(0);
    }


    function displayDrugeDetails(itemCode: String): Void {
        try {
            var purchaseCont:Purchase =  RegistryFactory.getClientStub(RegistryConstants.Purchase) as Purchase;
            var drugBean = new DrugModel();
                drugBean.setPassVale(6);
                drugBean.setDrug_id(Integer.valueOf(itemCode));
               drugBean=drugController.viewRecord(drugBean) as  DrugModel;              
               txtStkPCode.text =drugBean.getDrug_id().toString();
               this.itemCode = drugBean.getDrug_id().toString();
               txtStkPName.text =drugBean.getDrug_name();
                txtStkFormulation.text=drugBean.getFormulation_short();
                txtStkDosage.text=drugBean.getDosage();    
                txtStkMRP.text=Value.Round(drugBean.getMrp().toString());
                txtStkSellPrice.text=Value.Round(drugBean.getMrp().toString());
                txtStkPurPrice.text=purchaseCont.getLastPurDetails(itemCode).get(0).toString();
                vatValues[0]  = Value.Round(drugBean.getVAT_percentage().toString());
                cboVAT.select(0);

        } catch (e: Exception) {
            var msg: String = "Class :Stock  Method  : displayDrugeDetails   = {e.getMessage()}";
            log.debug(msg);
        }


    }

public function validateExpiryDate(expDate:String): Boolean {
        var retFlag:Boolean = true;
        try {
        var valid = new Validation();
        if(expDate.length() == 5) {
            var expMonth:String = expDate.substring(0,2);
            
            if(valid.getNumberValid(expMonth, 0, 2) != 10) {
                 retFlag = false;
            }
            else {
                if(Integer.parseInt(expMonth) > 12 or Integer.parseInt(expMonth) == 0 ) {
                 retFlag = false;
                }
            }
            var expYear:String =  expDate.substring(3,5);
            
            if(valid.getNumberValid(expYear, 0, 2) != 10) {
                   retFlag = false;
            }
             else {
                if(Integer.parseInt(expYear) == 0) {
                 retFlag = false;
                }
            }

            if(not expDate.substring(2,3).equals("/")) {
                     retFlag = false;
                     
            }
        }
         else {
           retFlag = false;
         }
        }
        catch(e:Exception) {
            var msg: String = "Class :Stock  Method  : validateExpirydate()   = {e.getMessage()}";
            log.debug(msg);
        }
        return retFlag;
    }

        var prevssNo=0;
        var itemCode="";
        var oldBatchNo = "";
    function displayStkDetails(ss_no:String): Void {        
        oldBatchNo="";
        try {
            var stockBean = new StockModel();
            stockBean.setPassValue(7);
            stockBean.setStock_ssNo(Integer.valueOf(ss_no));
                stockBean=stockController.viewRecord(stockBean) as StockModel;                
                prevssNo=stockBean.getStock_ssNo();
                txtHidden.text = stockBean.getStock_ssNo().toString();
                txtStkPCode.text =stockBean.getStock_itemCode().toString();
                txtStkPName.text=stockBean.getStock_itemName();
                txtStkFormulation.text=stockBean.getStock_formulation();
                txtStkDosage.text=stockBean.getDosage();
                txtStkRack.text=stockBean.getStock_rackNo();
                txtStkShelf.text=stockBean.getStock_shelfNo();
                txtStkStorage.text=stockBean.getStock_coldStorage();
                oldBatchNo = stockBean.getStock_batchNo();                
                txtStkBatch.text=stockBean.getStock_batchNo();                
                txtStkExpiry.text=stockBean.getStock_expiryDate();
                txtMinQty.text=stockBean.getStock_minQty().toString();
                txtstkpackage.text=stockBean.getStock_packing().toString();
                txtStkMRP.text=Value.Round(stockBean.getStock_mrp() * stockBean.getStock_packing()).toString();
                txtStkPurPrice.text= Value.Round(stockBean.getStock_purchasePrice() * stockBean.getStock_packing()).toString();
                txtStkSellPrice.text=Value.Round(stockBean.getStock_sellingPrice() * stockBean.getStock_packing()).toString();
                txtStkQty.text=stockBean.getStock_qty().toString();
                var drugBean = new DrugModel();
                drugBean.setPassVale(6);
                drugBean.setDrug_id(Integer.valueOf(stockBean.getStock_itemCode().toString()));
                itemCode=stockBean.getStock_itemCode().toString();
                drugBean=drugController.viewRecord(drugBean) as  DrugModel;
                vatValues[0]  = Value.Round(drugBean.getVAT_percentage().toString());
                cboVAT.select(0);
                calculateMargin();
        } catch (e: Exception) {
            var msg: String = "Class :Stock  Method  : displayStkDetails()   = {e.getMessage()}";
            log.debug(msg);
        }
    }

    public function setTableLay(): Void {

        stockTable.layoutX = 0.0;
        stockTable.layoutY = 0.0;
        panelTable.content = [stockTable,];
        TableH = 190.0;
        StockStatementTable.addBasicRows();
        StockStatementTable.loadStockStatementValues();
        txtStkQty.requestFocus();
    }

    function getPrivileges(u: String): Void {
        var uname = u;
        var utype = commonController.getUserType(uname);
        if (utype.equals("User")) {
            var priv = commonController.getPrivileges("inventory", uname);
            var ss = priv.split(",");
            var val = Integer.parseInt(ss[3]);
            if (val == 1) {
                btnStkSave.disable = true;
                if (btnStkEdit.text != "Edit [F6]") {
                    btnStkEdit.disable = true;
                } else {
                    btnStkEdit.disable = false;
                }
            } else if (val == 2) {
                if (btnStkEdit.text != "Edit [F6]") {
                    btnStkEdit.disable = true;
                } else {
                    btnStkEdit.disable = false;
                }
                btnStkSave.disable = false;
            //This code for  READ and WRITE Access
            } else if (val == 3) {
                btnStkSave.disable = false;
                btnStkEdit.disable = false;
            //This code for FULL Access
            }
        } else {
            btnStkSave.disable = false;
            btnStkEdit.disable = false;
        }
    }

    var logUser: String = bind CommonDeclare.user on replace {
        getPrivileges(logUser);
    }
    var changPiv = bind btnStkSave.text on replace {
        getPrivileges(logUser);
    }
    var changPiv1 = bind btnStkEdit.text on replace {
        getPrivileges(logUser);
    }
   

    function mandatory(): Void {
        txtStkPName.style = mandatoryStyle;
        txtStkBatch.style = mandatoryStyle;
        txtStkQty.style = mandatoryStyle;
        txtStkPurPrice.style = mandatoryStyle;
        txtMinQty.style = mandatoryStyle;
    }



    public function updateValues(): Void {
        try {            
            if (btnStkSave.text == "Update [F7]") {
                if (StockStatementTable.rowselt != "-1") {
                    displayStkDetails(StockStatementTable.rowselt);                    
                    StockStatementTable.rowselt = "-1";
                }
            }
            if (GetStockDrugTable.cnt == 1) {             
               if (GetStockDrugTable.itemname != null and GetStockDrugTable.itemname.length() > 1) {
                    if (btnStkSave.text == "Save [F3]") {                        
                        displayDrugeDetails(GetStockDrugTable.itemcode);
                    } else {                        
                         var ssno=GetStockDrugTable.ssno;
                         displayStkDetails(ssno);
                    }
                    txtStkBatch.requestFocus();
                }
                GetStockDrugTable.cnt = 0;
                calculateMargin();
            }            
        } catch (e: Exception) {
            var msg: String = "Class :Stock  Method  : updateValues()  = {e.getMessage()}";
            log.debug(msg);
        }
    }

    function calculateMargin():Void {
        var valid:Validation=new Validation();
        var purPrice:String=txtStkPurPrice.rawText.trim();
        var sellingPrice:String=txtStkSellPrice.rawText.trim();
        if(purPrice!="" and sellingPrice!="" and (not (cboVAT.selectedItem.toString().equals("---Select---")))) {
            if(valid.getDecimalValid(purPrice, 1, 10)==10 and valid.getDecimalValid(sellingPrice, 1, 10)==10){
                  var purPriceVal:Double=Double.parseDouble(purPrice);
                  var sellingPriceVal:Double=Double.parseDouble(sellingPrice);
                  var unitVatVal:Double=0.00;
                  var vatCalcFlag=0.00;                  
                  if(cboVAT.selectedItem.toString().equals("")) {
                      unitVatVal=0.00;
                  }
                  else {
                  unitVatVal=Double.parseDouble(cboVAT.selectedItem.toString());
                  }                  
                  if (btnStkSave.text == "Save [F3]" ) {
                     if(GetStockDrugTable.itemcode!="") {
                     vatCalcFlag=Double.parseDouble(commonController.getQueryValue("select vat_calc_flag from drugtable where itemcode='{GetStockDrugTable.itemcode}'"));
                     }
                     else {
                     vatCalcFlag=Double.parseDouble(commonController.getQueryValue("select vat_calc_flag from drugtable where itemcode='{itemCode}'"));
                     }
                  }
                  else {
                     if(itemCode!="")
                     vatCalcFlag=Double.parseDouble(commonController.getQueryValue("select vat_calc_flag from drugtable where itemcode='{itemCode}'"));
                  }
                  var VATAmt:Double=0;
                  var margin:Double=0;
                  var percMargin:Double=0;
                  var salesVat = Value.Round((sellingPriceVal*unitVatVal)/(100+unitVatVal),2);
                  if(vatCalcFlag == 0) {
                    VATAmt = purPriceVal*unitVatVal/100;
                    margin = Double.parseDouble(Value.Round(sellingPriceVal-salesVat-purPriceVal));
                  }
                  else {
                    VATAmt = (sellingPriceVal-(sellingPriceVal/(1+unitVatVal/100)));
                    margin = Double.parseDouble(Value.Round(sellingPriceVal-purPriceVal));
                  }                 
                  percMargin = Value.Round(((margin/sellingPriceVal)*100),2);
                  txtMargin.text=percMargin.toString();
                }
        }
    }


    public function CancelForm(): Void {
        CommonDeclare.form[2] = 0;
     
    }
    public function StartUp(): Void {
        txtStkPCode.editable = false;
        (stockViewTable as javax.swing.JTable).addMouseListener(MouseAdapter {
            override public function mouseClicked(e: java.awt.event.MouseEvent): Void {
                StockStatementTable.viewStockCalculations();
                updateValues();
            }
        });

        panel.visible = true;
        cmbSearchBox.select(0);
        var alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z",];
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
                            cmbSearchBox.select(0);
                            txtStkSearch.text = String.valueOf(i + 1);
                            var lblVal: String = StockStatementTable.searchStockStatementValues(String.valueOf(i + 1),6);
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
                        font: Arial_Bold_14
                        hpos: javafx.geometry.HPos.CENTER
                        width: 20.0
                        height: 20.0
                        onMouseClicked: function(event: javafx.scene.input.MouseEvent): Void {
                            cmbSearchBox.select(0);
                            var lblVal: String = StockStatementTable.searchStockStatementValues(String.valueOf(alphabet[j]),6);
                            productCount.text = lblVal;
                            txtStkSearch.text = String.valueOf(alphabet[j]);
                        }
                    }
        panelAtoZ.content = [label18, AtoZ, Zeroto9,];
        clearAll();
        setTableLay();
        fxCalendar.visible = false;
        stkPanel.content = [fxCalendar,];
        txtStkExpiry.text = DateUtils.now("MM/yy");
        getPrivileges(logUser);
        txtstkpackage.editable = true;
        txtstkpackage.text = "1";
        GetStockDrugTable.cnt = 0;
        mandatory();
        updateValues();
        txtStkPName.requestFocus();
    }
}


