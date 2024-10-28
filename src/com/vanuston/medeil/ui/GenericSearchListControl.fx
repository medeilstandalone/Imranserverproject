/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.ui;

import javafx.scene.control.TextBox;
import java.lang.Exception;

import javafx.scene.input.KeyCode;
import java.lang.String;
import java.util.List;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.implementation.CommonImplements ;
import com.vanuston.medeil.client.RegistryFactory ;
import com.vanuston.medeil.util.RegistryConstants ;
/**
 * @author saran
 */
public class GenericSearchListControl {

    public var selectedString: String = "";
    public var previousString :String ="";
    var empName: List = null ;
    var prevListType : String = "";
    
    var log: Logger = Logger.getLogger(GenericSearchListControl.class, "GenericSearchListControl");
    public var comObj : CommonImplements = RegistryFactory.getClientStub(RegistryConstants.CommonImplements) as CommonImplements;
    public function listImageControlView(txtBox: javafx.scene.control.TextBox, listView: javafx.scene.control.ListView, type: String, viewType: Integer, listType: String): Number {
        var listH = 0.0;         
        listView.visible = true;
        try {
            var size = listView.items.size();
            if (not listView.items.isEmpty()) {
                for (i in [0..<size])
                    listView.items[i] = null;
                txtBox.requestFocus();
            }
            var typedText = "";
            if (viewType == 0) { typedText = ""; }
            typedText=txtBox.rawText.trim();            
            if(empName == null or typedText != previousString or listType != prevListType) { 
              empName = null ;
              if (type.equals("DrugGeneric")) {
                empName = comObj.getDrugGenerics (typedText, listType) ;
            } else if (type.equals("DrugProduct")) {                
                empName = comObj.getDrugProducts (typedText, listType) ;
            }
            }
            prevListType = listType ;
            previousString = typedText ;
            listView.visible = true;
            listView.clearSelection();            
            listView.items = empName.toArray();
            listView.onKeyPressed = function(e) {
                        if (e.code == KeyCode.VK_ENTER) {
                            if(listView.selectedItem != null or "{listView.selectedItem}".trim().length() > 0) {
                                selectedString = "{listView.selectedItem}";
                             } else {
//                            if (selectedString == null or selectedString.trim().length() == 0) {
//                                selectedString = "";
                                selectedString = txtBox.text ;

                            }
                            txtBox.text = selectedString;
                            listView.visible = false; 
                        } else if (e.code == KeyCode.VK_DOWN) {
                            if (listView.selectedIndex == 0) {
                                listView.selectFirstRow();
                            }
                        } else if (e.code == KeyCode.VK_ESCAPE) {
                            listView.visible = false;
                            txtBox.requestFocus();
                        }
                    };
            listView.onMouseReleased = function(e) {
                        if(listView.selectedItem != null or "{listView.selectedItem}".trim().length() > 0) {
                                selectedString = "{listView.selectedItem}";
                        } else {
                            selectedString = txtBox.text ;
//                        if (selectedString == null or selectedString.trim().length() == 0) {
//                            selectedString = "";
                        }
                        txtBox.text = selectedString;
                        listView.visible = false;
                    }
            var height: Integer = 0;
            if (listView.items.size() < 8) {
                height = listView.items.size();
            } else {
                height = 7;
            }
            for (i in [1..height]) {
                listH += 25.0;
            }
            txtBox.requestFocus();         
        } catch (e: Exception) {
            log.debug("Error in GenericSearchListControl = {e.getMessage()}");
        }
        return listH;
    }

}

