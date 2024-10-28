package com.vanuston.medeil.uitables;

import com.vanuston.medeil.util.Logger;
import java.awt.Font;
import java.awt.Color;
import java.awt.Rectangle;
import java.util.Vector;
import javax.swing.*;
import java.awt.event.KeyEvent;
import java.awt.event.KeyAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.ActionEvent;
import javax.swing.AbstractAction;
import java.util.ArrayList;
import java.util.List;
import javax.swing.table.DefaultTableModel;
import javafx.stage.Alert;
import com.vanuston.medeil.model.PrescriptionModel;
import java.awt.Component;
import javax.swing.table.DefaultTableColumnModel;
import javax.swing.table.JTableHeader;
import javax.swing.table.TableCellRenderer;

public class PrescriptionTable extends javax.swing.JDialog {

    Logger log = Logger.getLogger(PrescriptionTable.class, "PrescriptionTable");
    public JTable jcomp;
    public boolean UIFocusFlag = false;
    public String thisForm = null;
    public int initR;
    public JScrollPane scrollPane;
    public double qty[];
    public double uprice[];
    public double vat4[];
    public double dist[];
    public double subTot[];
    public int stockQty;
    public int totQty = 0;
    public int totItems = 0;
    public double totAmt = 0.00;
    public double totDistAmt = 0.0;
    public double totVATAmt4 = 0.0;
    public int nullVal;    
    public KeyStroke shrctF2 = KeyStroke.getKeyStroke(KeyEvent.VK_F2, 0);
    public KeyStroke shrctF3 = KeyStroke.getKeyStroke(KeyEvent.VK_F3, 0);
    public KeyStroke shrctF4 = KeyStroke.getKeyStroke(KeyEvent.VK_F4, 0);
    public KeyStroke shrctF5 = KeyStroke.getKeyStroke(KeyEvent.VK_F5, 0);
    public KeyStroke shrctF6 = KeyStroke.getKeyStroke(KeyEvent.VK_F6, 0);
    public KeyStroke shrctF7 = KeyStroke.getKeyStroke(KeyEvent.VK_F7, 0);
    public KeyStroke shrctF8 = KeyStroke.getKeyStroke(KeyEvent.VK_F8, 0);
    public KeyStroke shrctF12 = KeyStroke.getKeyStroke(KeyEvent.VK_F12, 0);
    public KeyStroke shrctCtrlAr = KeyStroke.getKeyStroke(KeyEvent.VK_LEFT, KeyEvent.CTRL_MASK);
    public double amt = 0.00;
    final int[] colWidth = {40, 120, 60, 60, 60, 60, 60, 60, 60, 60, 50};
    
    public JComponent createTable() {
        //                      0,        1,             2,      3,      4,          5,     6,         7,     8,          9,             10
        Object[] colName = {"S.No.", "Medicine Name", "Morning", "Afternoon", "Evening", "Night", "BF/AF", " Dose/ML", "Medications", "Days"};
        thisForm = "Prescription";
        initR = 5;
       final Class[] types = {java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.Double.class, java.lang.Double.class};
       final boolean[] canEditCols = {false, false, true, true, true, true, true, true, true, true};
        int len = colName.length;
        try {
            jcomp = new JTable();            
            scrollPane = new JScrollPane();
            //SwingUtilities.updateComponentTreeUI(jcomp);
            Vector cols = new Vector();
            Vector data = new Vector();
            for (int i = 0; i < initR; i++) {
                Vector c = new Vector();
                for (int j = 0; j < len; j++) {
                    c.addElement(null);
                }
                data.addElement(c);
            }
            for (int n = 0; n < len; n++) {
                cols.addElement(colName[n]);
            }
            try {
                jcomp.setModel(new javax.swing.table.DefaultTableModel(data, cols) {
                    Class[] type = types;
                    boolean[] canEditCol = canEditCols;
                    @Override
                    public Class getColumnClass(int columnIndex) {
                        return type[columnIndex];
                    }
                    @Override
                    public boolean isCellEditable(int rowIndex, int columnIndex) {
                        return canEditCol[columnIndex];
                    }
                });
            } catch (Exception ex) {
                String ss = "Method: Create Table    Exception : " + ex.getMessage();
                log.debug(ss);
            }
            jcomp.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
            jcomp.setSelectionMode(0);
            jcomp.getTableHeader().setBackground(new Color(226, 238, 244));
            jcomp.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
            jcomp.setShowGrid(true);
            jcomp.getTableHeader().setReorderingAllowed(false);       
            jcomp.putClientProperty("terminateEditOnFocusLost", Boolean.TRUE); // for shorcutevent of javafx scene input
            jcomp.getInputMap().put(shrctF2, "shortcut");
            jcomp.getInputMap().put(shrctF3, "shortcut");
            jcomp.getInputMap().put(shrctF4, "shortcut");
            jcomp.getInputMap().put(shrctF5, "shortcut");
            jcomp.getInputMap().put(shrctF6, "shortcut");
            jcomp.getInputMap().put(shrctF7, "shortcut");
            jcomp.getInputMap().put(shrctF8, "shortcut");
            jcomp.getInputMap().put(shrctCtrlAr, "shortcut");
            jcomp.getInputMap().put(shrctF12, "removeRow");

            jcomp.getActionMap().put("removeRow", new AbstractAction("removeRow") {
                @Override
                public void actionPerformed(ActionEvent evt) {
                    removeRow();
                }
            });
            jcomp.getActionMap().put("shortcut", new AbstractAction("shortcut") {
                @Override
                public void actionPerformed(ActionEvent evt) {
                    try {
                        if(jcomp.getCellEditor() != null) {                            
                            jcomp.getCellEditor().stopCellEditing();
                        }
                    }catch (Exception e){
                       String ss = "Method: actionPerformed    Exception : " + e.getMessage();
                        log.debug(ss);
                    }
                }
            });
            
            if (colWidth.length > 0) {
                for (int i = 0; i < len; i++) {
                    jcomp.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
                }
            }
            jcomp.setGridColor(new java.awt.Color(204, 204, 255));
            jcomp.setCellSelectionEnabled(true);
            jcomp.setRowHeight(25);
            jcomp.setSelectionBackground(Color.LIGHT_GRAY);
            jcomp.setSelectionForeground(Color.RED);
            jcomp.revalidate();            
            jcomp.addMouseListener(new java.awt.event.MouseAdapter() {
                @Override
                public void mouseClicked(MouseEvent e) {
                    final int i = jcomp.getSelectedRow();
                    final int j = jcomp.getSelectedColumn();
                        if(i>=0 && i <= jcomp.getRowCount() && jcomp.getModel().getValueAt(i, 0) == null && jcomp.getModel().getValueAt(i, 1) == null) {
                            UIFocusFlag = true;
                    }
                    for (int val = 0; val < jcomp.getRowCount(); val++) {
                        if (jcomp.getModel().getValueAt(val, 3) == null); else {
                            if (jcomp.getModel().getValueAt(val, 3).equals(0)) {
                                jcomp.changeSelection(val, 3, false, false);
                            }
                        }
                    }
                }
            });
            jcomp.addKeyListener(new KeyAdapter() {
                @Override
                public void keyReleased(KeyEvent e) {
                    final int i = jcomp.getSelectedRow();
                    final int j = jcomp.getSelectedColumn();
                    double mrp = 0.00;
                    try {
                        if (e.getKeyCode() == 10) {
                            InputMap im = jcomp.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                            KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                            KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                            im.put(enter, im.get(tab));
                        }                                                          
                    } catch (Exception ex) {
                        String ss = "Method: tablekeyReleased    Exception : " + ex.getMessage();
                        log.debug(ss);
                    }
                }
                int pi;
                int pj;
                Object pobj;
                @Override
                public void keyPressed(KeyEvent e) {
                    final int i = jcomp.getSelectedRow();
                    final int j = jcomp.getSelectedColumn();
                    try {                        
                        if (e.getKeyCode() == 10) {
                            InputMap im = jcomp.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                            KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                            KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                            im.put(enter, im.get(tab));
                        }
                        if (e.isActionKey()) {
                            for (int val = 0; val < jcomp.getRowCount(); val++) {
                                if (jcomp.getModel().getValueAt(val, 1) != null) {
                                    jcomp.getModel().setValueAt(val + 1, val, 0);
                                }

                            }                            
                        }
                        
                      if (e.getKeyCode() == KeyEvent.VK_DELETE || e.getKeyCode() == KeyEvent.VK_BACK_SPACE) {
                        if (jcomp.getModel().isCellEditable(i, j)) {
                            jcomp.getModel().setValueAt("", i, j);
                        }
                    }
                    else {
                     char c = e.getKeyChar();
                     if(jcomp.getModel().isCellEditable(i, j)) {
                           if(j==6 || j==7) {
                                if((c>'0' && c<='9') || (c>'a' && c<='z') || (c>'A' && c<='Z')) {
                                jcomp.getModel().setValueAt("", i, j);
                                }
                            }
                            else {
                            if((c>'0' && c<='9'))
                            jcomp.getModel().setValueAt(0, i, j);
                            }
                        }
                    }
                        }                        
                    catch (Exception ex) {
                        String ss = "Method: tableKeyPressed    Exception : " + ex.getMessage();
                        log.debug(ss);
                    }
                }

                @Override
                public void keyTyped(KeyEvent e) {
                }
            });
            return jcomp;
        } catch (Exception exp) {
        }
        return jcomp;
    }

    public JComponent getScrollTable(JComponent jt) {
        jcomp  = (JTable) jt;
        scrollPane.add(jcomp);
        scrollPane.setViewportView(jcomp );
        return scrollPane;        
    }

    public void addRow() {
        DefaultTableModel model = (DefaultTableModel) jcomp.getModel();
        int row = jcomp.getRowCount();
        Vector datas = new Vector();
        try {
            for (int i = 0; i < jcomp.getModel().getColumnCount(); i++) {
                if (row == 0 && i == 0) {
                    datas.addElement(i + 1);
                } else {
                    datas.addElement(null);
                }
            }
        } catch (Exception ex) {
            String ss = "Method: addRow    Exception : " + ex.getMessage();
            log.debug(ss);
        }
        model.insertRow(jcomp.getRowCount(), datas);
    }

    public void removeRow() {
        int i = jcomp.getSelectedRow();
        int j = jcomp.getSelectedColumn();
        int rows = jcomp.getRowCount();
        if (i != -1) {
            DefaultTableModel model = (DefaultTableModel) jcomp.getModel();
            if (rows == 1) {
                if (i == 0) {
                    model.removeRow(i);
                    resetValues();
                    for (int n = 0; n < initR; n++) {
                        addRow();
                    }
                    jcomp.changeSelection(0, 0, false, false);
                    jcomp.changeSelection(0, j, false, false);
                }
            } else {
                model.removeRow(i);
                int rows1 = jcomp.getRowCount();
                if (i + 1 != rows) {
                    for (int n = 0; n < rows1; n++) {
                        if (jcomp.getModel().getValueAt(n, 0) == null) {
                            jcomp.getModel().setValueAt(1, 0, 0);
                        } else {
                            jcomp.getModel().setValueAt(n + 1, n, 0);
                        }
                    }
                    jcomp.changeSelection(0, 0, false, false);
                    jcomp.changeSelection(i, j, false, false);
                } else {
                    jcomp.changeSelection(0, 0, false, false);
                    jcomp.changeSelection(i - 1, j, false, false);
                }
            }

        } else {
            Alert.inform("Please select row to remove ...");
        }
    }

    public void clearData() {
        DefaultTableModel model = (DefaultTableModel) jcomp.getModel();
        model.getDataVector().removeAllElements();
        for (int i = 0; i < initR; i++) {
            addRow();
        }
        jcomp.revalidate();
    }

    public List<PrescriptionModel> getTableValues() {
        int rowCount = jcomp.getModel().getRowCount();
        List<PrescriptionModel> values = new ArrayList<PrescriptionModel>();
        PrescriptionModel model;
        try {
            for (int i = 0; i < rowCount; i++) {
                    model = new PrescriptionModel();
                    if (jcomp.getModel().getValueAt(i, 1) == null && jcomp.getModel().getValueAt(i, 2) == null); else {
                        model.setMedicineName(""+jcomp.getModel().getValueAt(i, 1));
                        model.setMorning(""+jcomp.getModel().getValueAt(i, 2));
                        model.setAfternoon(""+jcomp.getModel().getValueAt(i, 3));
                        model.setEvening(""+jcomp.getModel().getValueAt(i, 4));
                        model.setNight(""+jcomp.getModel().getValueAt(i, 5));
                        model.setFood(""+jcomp.getModel().getValueAt(i, 6));
                        model.setDose(""+jcomp.getModel().getValueAt(i, 7));                        
                        model.setTotalMedications(Double.parseDouble(""+jcomp.getModel().getValueAt(i, 8)));
                        model.setDays(Double.parseDouble(""+jcomp.getModel().getValueAt(i, 9)));
                        values.add(model);
                    }
            }
        } catch (Exception ex) {
            String ss = "Method: getTableValues    Exception : " + ex.getMessage();
            log.debug(ss);
        }
        return values;
    }

    public void resetValues() {
        totQty = 0;
        totItems = 0;
        totAmt = 0.00;
        totDistAmt = 0.0;
        totVATAmt4 = 0.0;
        amt = 0.00;
    }

    public void focusSet() {
        jcomp.requestFocus();
        jcomp.changeSelection(0, 1, false, false);
        jcomp.getModel().setValueAt("1", 0, 0);
        jcomp.setCellSelectionEnabled(true);
    }

    public void focusSet(int row, int col) {
        jcomp.requestFocus();
        jcomp.changeSelection(row, col, false, false);
        jcomp.setCellSelectionEnabled(true);
    }    
      

    public boolean setTablevalues(String[] prescriptionItems) {
        boolean setValues=true;
        int rowCount = jcomp.getModel().getRowCount();
        int dataRowCount=0;
        for(int i=0;i<rowCount;i++) {
            if(jcomp.getModel().getValueAt(i, 2)!=null) {
                dataRowCount++;                
                if(jcomp.getModel().getValueAt(i, 1).toString().equals(prescriptionItems[0])) {
                    setValues=false;
                }
            }
            else {
            break;
            }
        }
        if(dataRowCount >= jcomp.getRowCount()) {
            addRow();
        }
        if(setValues==true) {           
        jcomp.getModel().setValueAt(dataRowCount+1, dataRowCount, 0);
        jcomp.getModel().setValueAt(prescriptionItems[0], dataRowCount, 1);
        jcomp.getModel().setValueAt(prescriptionItems[1], dataRowCount, 2);
        jcomp.getModel().setValueAt(prescriptionItems[2], dataRowCount, 3);
        jcomp.getModel().setValueAt(prescriptionItems[3], dataRowCount, 4);
        jcomp.getModel().setValueAt(prescriptionItems[4], dataRowCount, 5);
        jcomp.getModel().setValueAt(prescriptionItems[5], dataRowCount, 6);
        jcomp.getModel().setValueAt(prescriptionItems[6], dataRowCount, 7);
        jcomp.getModel().setValueAt(Double.parseDouble(prescriptionItems[7]), dataRowCount, 8);
        jcomp.getModel().setValueAt(Double.parseDouble(prescriptionItems[8]), dataRowCount, 9);
        nullVal++;
        Rectangle rect=jcomp.getCellRect(dataRowCount, 1, true);
        jcomp.scrollRectToVisible(rect);
        }
        return setValues;
    } 
     

}

