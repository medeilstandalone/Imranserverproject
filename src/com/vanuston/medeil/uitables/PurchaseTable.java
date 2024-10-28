package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.implementation.Purchase;
import com.vanuston.medeil.model.PurchaseModel;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.DecimalFormatRenderer;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.PercentageFormatRenderer;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.util.Validation;
import com.vanuston.medeil.util.Value;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import javax.swing.table.DefaultTableModel;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import javax.swing.*;
import javafx.stage.Alert;

public class PurchaseTable {

    Logger log = Logger.getLogger(PurchaseTable.class, "Utilities");
    int ss1 = 0;
    public JTable jTable;
//    public static String thisForm = null;
    public int initR;
    public JScrollPane scrollPane = new JScrollPane();
    public JComboBox jcoB = new JComboBox();
    public int purcQty[];
    public int purcFreeQty[];
    public double purcPrice[];

    public double purcVAT[];
    
    public double purcDisct[];
    
    public double purcAdjVAT4[];
    
    public double purcAdjDist[];
    public double purcSubTot[];
    public int totPurcQty = 0;
    public int totPurcFreeQty = 0;
    public int totPurcItems = 0;
    public double totPurcAmt = 0.00;
    public double totPurcDistAmt = 0.0;

    public double totPurcVAT4Amt = 0.0;

    public int totPurcAdjQty = 0;
    public int totPurcAdjItems = 0;
    public double totPurcAdjAmt = 0.00;
    public double totPurcAdjDistAmt = 0.0;
    public double totPurcAdjVAT4Amt = 0.0;
    public double totMargin = 0.0;
    public double totMrp = 0.0;
    public double totPurPrice = 0.0;
    public int nullVal = 0;
    public KeyStroke focusOut = KeyStroke.getKeyStroke(KeyEvent.VK_SPACE, KeyEvent.CTRL_MASK);
    public KeyStroke focusOut1 = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, KeyEvent.CTRL_MASK);
    public KeyStroke shrctF2 = KeyStroke.getKeyStroke(KeyEvent.VK_F2, 0);
    public KeyStroke shrctF3 = KeyStroke.getKeyStroke(KeyEvent.VK_F3, 0);
    public KeyStroke shrctF4 = KeyStroke.getKeyStroke(KeyEvent.VK_F4, 0);
    public KeyStroke shrctF5 = KeyStroke.getKeyStroke(KeyEvent.VK_F5, 0);
    public KeyStroke shrctF6 = KeyStroke.getKeyStroke(KeyEvent.VK_F6, 0);
    public KeyStroke shrctF7 = KeyStroke.getKeyStroke(KeyEvent.VK_F7, 0);
    public KeyStroke shrctF8 = KeyStroke.getKeyStroke(KeyEvent.VK_F8, 0);
    public KeyStroke shrctF12 = KeyStroke.getKeyStroke(KeyEvent.VK_F12, 0);
    public KeyStroke shrctCtrlAr = KeyStroke.getKeyStroke(KeyEvent.VK_LEFT, KeyEvent.CTRL_MASK);
    public KeyStroke callTable = KeyStroke.getKeyStroke(KeyEvent.VK_T, KeyEvent.CTRL_MASK);
    public KeyStroke ctrlD = KeyStroke.getKeyStroke(KeyEvent.VK_D, KeyEvent.CTRL_MASK);
    public double amt = 0.00;
    public GetPurcDrugData g;
    public int is = 0;
    public int js = 0;
    int s = 1;
    boolean check = false;
    public String itemCode = "";
    public boolean barcodeSelected=false;
    public boolean barcodeFocus = false;
    

    public  JComponent createTable() throws RemoteException {
        final int initRow = 10;
        Object[] colName = {"S.No.", "Product Name", "Formulation", "Mfr.", "Qty.(Strip(s))", "Free", "Batch No.", "Exp(mm/yy)", "Pack(Tablet(s) per Strip)", "Pur. Price", "MRP", "S.Disc %","Margin", "P.Disc %", "VAT %", "Amount", "Item Code", "Is Temp Stocks", "Is PR Adjusted","vat_adj_flag"};
        Class[] type = {java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.String.class,
            java.lang.Integer.class, java.lang.Integer.class, java.lang.String.class, java.lang.Object.class, java.lang.Integer.class,
            java.lang.Double.class, java.lang.Double.class, java.lang.Double.class,java.lang.Double.class,java.lang.Double.class, java.lang.Double.class, java.lang.Double.class,
            java.lang.String.class, java.lang.Boolean.class, java.lang.Boolean.class, java.lang.Integer.class};
        boolean[] canEdit = {false, false, false, false, true, true, true, true, true, true, true, true, false, true, true, false, false, false, false, false};
        int[] width = {25, 90, 58, 25, 30, 25, 70, 60, 25, 45, 40, 40, 35, 40, 30, 75, 0, 0, 0, 0};

        initR = initRow;
        final Class[] types = type;
        final boolean[] canEditCols = canEdit;
        final int[] colWidth = width;
        jTable = new JTable();
        SwingUtilities.updateComponentTreeUI(jTable);
        g = new GetPurcDrugData(jTable, "Purchase");
        Vector cols = new Vector();
        Vector data = new Vector();
        int len = colName.length;
        for (int i = 0; i < initRow; i++) {
            Vector c = new Vector();
            for (int j = 0; j < len; j++) {
                if (j == 16 && j == 17) {
                    c.addElement(Boolean.FALSE);
                } else {
                    c.addElement(null);
                }
            }
            data.addElement(c);
        }
        for (int n = 0; n < len; n++) {
            cols.addElement(colName[n]);
        }
        try {
            jTable.setModel(new javax.swing.table.DefaultTableModel(data, cols) {

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
        for (int i = 0; i < len; i++) {
            jTable.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }
        jTable.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        jTable.setSelectionMode(0);
        jTable.getTableHeader().setBackground(new Color(226, 238, 244));
        jTable.getTableHeader().setFont(new Font("Arial", Font.BOLD, 16));
        jTable.setShowGrid(true);
        jTable.getTableHeader().setReorderingAllowed(false);
        jTable.getColumnModel().getColumn(15).setCellRenderer(new DecimalFormatRenderer());
        jTable.getColumnModel().getColumn(14).setCellRenderer(new PercentageFormatRenderer());
        jTable.getColumnModel().getColumn(13).setCellRenderer(new PercentageFormatRenderer());
        jTable.getColumnModel().getColumn(12).setCellRenderer(new PercentageFormatRenderer());
        jTable.getColumnModel().getColumn(11).setCellRenderer(new PercentageFormatRenderer());
        jTable.removeColumn(jTable.getColumnModel().getColumn(19));
        jTable.removeColumn(jTable.getColumnModel().getColumn(18));
        jTable.removeColumn(jTable.getColumnModel().getColumn(17));
        jTable.removeColumn(jTable.getColumnModel().getColumn(16));
        jTable.putClientProperty("terminateEditOnFocusLost", Boolean.TRUE);
        jTable.getInputMap().put(focusOut, "focusOut");
        jTable.getInputMap().put(focusOut1, "focusOut");
        jTable.getInputMap().put(shrctF2, "focusOut1");
        jTable.getInputMap().put(shrctF3, "focusOut");
        jTable.getInputMap().put(shrctF4, "focusOut");
        jTable.getInputMap().put(shrctF5, "focusOut");
        jTable.getInputMap().put(shrctF6, "focusOut");
        jTable.getInputMap().put(shrctF7, "focusOut");
        jTable.getInputMap().put(shrctF8, "focusOut");
        jTable.getInputMap().put(shrctCtrlAr, "focusOut");
        jTable.getInputMap().put(shrctF12, "removeRow");
        jTable.getInputMap().put(ctrlD, "addRow");
        jTable.getInputMap().put(callTable, "callTable");
        jTable.getActionMap().put("addRow", new AbstractAction("addRow") {

            @Override
            public void actionPerformed(ActionEvent evt) {
                int sel = jTable.getSelectedRow();
                if (sel >= 0) {
                    getAddition(sel);
                }
            }
        });
        jTable.getActionMap().put("removeRow", new AbstractAction("removeRow") {

            @Override
            public void actionPerformed(ActionEvent evt) {
                removeRow();
            }
        });
        jTable.getActionMap().put("focusOut", new AbstractAction("focusOut") {
            @Override
            public void actionPerformed(ActionEvent evt) {

                jTable.clearSelection();
                jTable.transferFocus();
            }
        });
        jTable.getActionMap().put("focusOut1", new AbstractAction("focusOut1") {
            @Override
            public void actionPerformed(ActionEvent evt) {
                final int j = jTable.getSelectedColumn();
                if (j == 7); else {
                    jTable.clearSelection();
                    jTable.transferFocus();
                }
            }
        });
        jTable.getActionMap().put("callTable", new AbstractAction("callTable") {
            @Override
            public void actionPerformed(ActionEvent evt) {
                for (int val = 0; val < jTable.getRowCount(); val++) {
                    if (jTable.getModel().getValueAt(val, 2) == null) {
                        if (jTable.getModel().getValueAt(val, 0) == null) {
                            jTable.getModel().setValueAt(val + 1, val, 0);
                        }
                        jTable.changeSelection(val, 2, false, false);
                        break;
                    }
                }
                if(barcodeSelected==false) {
                    g.refreshDrugTab();
                    barcodeFocus=false;
                }
                else {
                    g.refreshDrugTab(itemCode,"barcode");
                    barcodeSelected = false;
                    barcodeFocus=true;
                }
                check = false;
            }
        });

//        DefaultTableColumnModel dcm = (DefaultTableColumnModel) purcTable.getColumnModel();
//        dcm.getColumn(7).setCellRenderer(new DateCellEditor.DateRenderer());
//        dcm.getColumn(7).setCellEditor(new DateCellEditor());
        jTable.setGridColor(new java.awt.Color(204, 204, 255));
        jTable.setCellSelectionEnabled(true);
        jTable.setRowHeight(25);
        jTable.setSelectionBackground(Color.LIGHT_GRAY);
        jTable.setSelectionForeground(Color.RED);
        jTable.revalidate();
        jTable.addMouseListener(new MouseAdapter() {

            @Override
            public void mouseClicked(MouseEvent e) {
                final int i = jTable.getSelectedRow();
                final int j = jTable.getSelectedColumn();
                try {
                    for (int val = 0; val < jTable.getRowCount(); val++) {
                        if (jTable.getModel().getValueAt(val, 4) == null || jTable.getModel().getValueAt(val, 4).toString().trim().length() <= 0);
                    }
                } catch (Exception ex) {
                    String ss = "Method: tableMouseClicked    Exception : " + ex.getMessage();
                    log.debug(ss);
                }
            }
        });
        jTable.addKeyListener(new KeyListener() {

            @Override
            public void keyReleased(KeyEvent e) {
                try {
                    final int i = jTable.getSelectedRow();
                    final int j = jTable.getSelectedColumn();
                    purchaseCalculations();
                    calculateMargin();
                    if (e.getKeyCode() == 10) {
                        InputMap im = jTable.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                        KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                        KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                        im.put(enter, im.get(tab));
                    }
                    
                    boolean temp = false;
                    boolean adjust = false;
                    if (jTable.getModel().getValueAt(i, 17) != null) {
                        temp = Boolean.valueOf(jTable.getModel().getValueAt(i, 16).toString());
                    }
                    if (jTable.getModel().getValueAt(i, 18) != null) {
                        adjust = Boolean.valueOf(jTable.getModel().getValueAt(i, 17).toString());
                    }
                    if ((j == 1 || j == 2) && !temp && !adjust && e.getKeyCode() != 27 && jTable.getModel().isCellEditable(i, 6)) {
                        if (jTable.getModel().getValueAt(i, 1) == null || jTable.getModel().getValueAt(i, 2) == null) {
                            check = true;
                            if(barcodeSelected==false) {
                                g.refreshDrugTab();
                                barcodeFocus=false;
                            }
                            else {
                                g.refreshDrugTab(itemCode,"barcode");
                                barcodeSelected = false;
                                barcodeFocus=true;
                            }
                            check = false;
                        }
                    }
                    if (j == 5) {
                        if (jTable.getModel().getValueAt(i, 4) == null || jTable.getModel().getValueAt(i, 4).toString().trim().length() <= 0) {
                            jTable.changeSelection(i, 4, false, false);
                        }
                    }
                    if (j == 6) {
                        if (jTable.getModel().getValueAt(i, 5) == null || jTable.getModel().getValueAt(i, 5).toString().trim().length() <= 0) {
                            jTable.changeSelection(i, 5, false, false);
                        } else {                            
                            getAddition(i);
                        }
                    }
                    if (j == 7) {
                        if (jTable.getModel().getValueAt(i, 6) == null || jTable.getModel().getValueAt(i, 6).toString().trim().length() <= 0) {
                            jTable.changeSelection(i, 6, false, false);
                        } else {
                            if(DateUtils.now("MM/yy").equalsIgnoreCase(""+jTable.getModel().getValueAt(i, 7))){
                            jTable.getModel().setValueAt("",i,7);
                            }
                            getAddition(i);
                        }
                    }
                    if (j == 8) {
                        if (jTable.getModel().getValueAt(i, 7) == null || jTable.getModel().getValueAt(i, 7).toString().trim().length() <= 0) {
                            jTable.changeSelection(i, 7, false, false);

                        } else {
                            
                            getAddition(i);
                        }
                    }
                    if (j == 9) {
                        if (jTable.getModel().getValueAt(i, 8) == null || jTable.getModel().getValueAt(i, 8).toString().trim().length() <= 0) {
                            jTable.changeSelection(i, 8, false, false);
                        } else {
                            getAddition(i);
                        }
                    }
                    if (j == 10) {
                        if (jTable.getModel().getValueAt(i, 9) == null || jTable.getModel().getValueAt(i, 9).toString().trim().length() <= 0) {
                            jTable.changeSelection(i, 9, false, false);
                        } else {
                            getAddition(i);                            
                            calculateMargin();
                        }
                    }
                    if (j == 11) {
                        if (jTable.getModel().getValueAt(i, 10) == null || jTable.getModel().getValueAt(i, 10).toString().trim().length() <= 0) {
                            jTable.changeSelection(i, 10, false, false);
                        } else {
                            getAddition(i);                            
                            calculateMargin();
                        }
                    }
                    if(j == 12 || j == 13) {
                        if(jTable.getModel().getValueAt(i, 12) != null && !jTable.getModel().getValueAt(i, 12).equals("")) {
                            calculateMargin();
                        }
                    }
                    if (j == 14) {
                            getAddition(i);
                            calculateMargin();
                    }

                    if (j == jTable.getColumnModel().getColumnCount() - 1) {
                        double vat = 0;
                        if (vat == 0 || vat == 4 || vat == 12.5) {
                            getAddition(i);
                            jTable.changeSelection(i + 1, 0, false, false);
                            if (i <= initR) {
                                jTable.getModel().setValueAt(i + 2, i + 1, 0);
                            }
                        } else {
                            Alert.inform("Purchase Invoice", "Vat % is only 4 or 12.5 only allowed ");
                        }                        
                    }
                } catch (Exception ex) {
                    String ss = " Method: tablekeyReleased    Exception : " + ex.getMessage();
                    log.debug(ss);
                }
                purchaseCalculations();
            }

            @Override
            public void keyPressed(KeyEvent e) {
                final int i = jTable.getSelectedRow();
                final int j = jTable.getSelectedColumn();
                try {                    
                    InputMap im = jTable.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                    if (e.getKeyCode() == 10) {
                        KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                        KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                        KeyStroke f2 = KeyStroke.getKeyStroke(KeyEvent.VK_ESCAPE, 0);
                        if (j == 7 && ss1 == 0 && jTable.getCellEditor() == null) {
                            im.put(enter, im.get(f2));
                            ss1 = 1;
                        } else {
                            im.put(enter, im.get(tab));
                            ss1 = 0;
                        }
                    }
                    if (j == 14) {
                        getAddition(i);
                    }
                    if (e.isActionKey()) {
                        for (int val = 0; val < jTable.getRowCount(); val++) {
                            if (jTable.getModel().getValueAt(val, 4) == null); else {
                                if (Integer.parseInt(jTable.getModel().getValueAt(val, 4).toString()) == 0) {
                                    jTable.changeSelection(val, 4, false, false);
                                    break;
                                }
                            }
                        }
                    }
                    if (e.getKeyCode() == KeyEvent.VK_DELETE || e.getKeyCode() == KeyEvent.VK_BACK_SPACE) {
                        if (jTable.getModel().isCellEditable(i, j)) {
                            jTable.getModel().setValueAt("", i, j);
                        }
                    }
                    else {
                     char c = e.getKeyChar();
                     if(jTable.getModel().isCellEditable(i, j)) {
                            if(j==6 || j==7) {
                                if((c>='0' && c<='9') || (c>='a' && c<='z') || (c>='A' && c<='Z'))
                                jTable.getModel().setValueAt("", i, j);
                            }
                            else {
                            if((c>'0' && c<='9'))
                            jTable.getModel().setValueAt(0, i, j);
                            }                            
                     }
                    }
                } catch (Exception ex) {
                    String ss = "Method: tablekeyPressed    Exception : " + ex.getMessage();
                    log.debug(ss);
                }
            }

            @Override
            public void keyTyped(KeyEvent e) {
                typedData();
            }
        });
        return jTable;
    }

     void getAddition(int i) {
        int aRow = jTable.getModel().getRowCount() - 1;
        if (i == aRow) {
            if (jTable.getModel().getValueAt(i, 1) != null) {
                if (jTable.getModel().getValueAt(i, 1).toString().trim().length() > 0) {
                    if (jTable.getModel().getValueAt(i, 1) != null) {
                        if (jTable.getModel().getValueAt(i, 1).toString().trim().length() > 0) {
                            addRow();
                        }
                    }
                }
            }
        }
    }

    public  void typedData() {
        InputMap im = jTable.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
        KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
        KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
        im.put(enter, im.get(tab));
        ss1 = 0;
    }

    public  JComponent getScrollTable(JComponent jt) {
        jTable = (JTable) jt;
        scrollPane.add(jTable);
        scrollPane.setViewportView(jTable);
        return scrollPane;
    }
    
    
    public  int insertTableFrm(Object[][] tableVal) {
        int val=0;
        try {
            int row = jTable.getModel().getRowCount();
            int jj = 0;
            for (int i = 0; i < row; i++) {
                if (jTable.getModel().getValueAt(i, 1) == null && jTable.getModel().getValueAt(i, 2) == null) {
                    if (jTable.getModel().getValueAt(i, 3) == null && jTable.getModel().getValueAt(i, 4) == null) {
                        jj = i;
                        break;
                    }
                }
            }
            int rLen = tableVal.length;
            int n = jj + rLen;
            if (n > row) {
                for (int j = 0; j < n - row; j++) {
                    addRow();
                }
            }
            for (int r = jj,i=0; i < rLen; r++,i++) {
                for (int c = 0; c < tableVal[i].length; c++) {
                    if (c == 0) {
                        jTable.getModel().setValueAt(r + 1, r, c);
                    } else if (c == 4 || c == 5 || c == 8) {
                        if (tableVal[i][c] != null) {
                            jTable.getModel().setValueAt(Integer.parseInt(tableVal[i][c].toString()), r, c);
                        } else {
                            jTable.getModel().setValueAt(tableVal[i][c], r, c);
                        }
                    } 
                    else if (c >= 9 && c <= 15) {
                        if (tableVal[i][c] != null) {
                            jTable.getModel().setValueAt(Double.parseDouble(tableVal[i][c].toString()), r, c);
                        } else {
                            jTable.getModel().setValueAt(tableVal[i][c], r, c);
                        }
                    } else if (c == 17) {
                        jTable.getModel().setValueAt(Boolean.FALSE, r, c);
                    } else if (c == 18) {
                        jTable.getModel().setValueAt(Boolean.TRUE, r, c);
                    } else {
                        jTable.getModel().setValueAt(tableVal[i][c], r, c);
                        val = 1;
                    }
                    
                }
            }
        } catch (Exception ex) {
            String ss = "Method: insertTableFrm    Exception : " + ex.getMessage();
            log.debug(ss);
            
        }
        return val;
    }

    
    public  void addRow() {
        try {
            DefaultTableModel model = (DefaultTableModel) jTable.getModel();
            int row = jTable.getRowCount();
            Vector datas = new Vector();
            for (int i = 0; i < jTable.getModel().getColumnCount(); i++) {
                if (row == 0 && i == 0) {
                    datas.addElement(i + 1);
                } else if (i == 16 && i == 17) {
                    datas.addElement(Boolean.FALSE);
                } else {
                    datas.addElement(null);
                }
            }
            model.insertRow(jTable.getRowCount(), datas);
            //-     purchaseCalculations();
        } catch (Exception ex) {
            String ss = "Method: removeRow    Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

    public  void removeRow() {
        int i = jTable.getSelectedRow();
        int j = jTable.getSelectedColumn();
        int rows = jTable.getRowCount();
        try {
            if (jTable.getModel().getValueAt(i, 1) != null) {
                if (i != -1) {
                    DefaultTableModel model = (DefaultTableModel) jTable.getModel();
                    if (rows == 1) {
                        if (i == 0) {
                            model.removeRow(i);
                            resetValues();
                            for (int n = 0; n < initR; n++) {
                                addRow();
                            }
                            jTable.changeSelection(0, 0, false, false);
                        }
                    } else {
                        model.removeRow(i);
                        int rows1 = jTable.getRowCount();
                        if (i + 1 != rows) {
                            for (int n = 0; n < rows1; n++) {
                                if (jTable.getModel().getValueAt(n, 0) == null); else {
                                    jTable.getModel().setValueAt(n + 1, n, 0);
                                }
                            }
                            jTable.changeSelection(i, j, false, false);
                        } else {
                            jTable.changeSelection(i - 1, j, false, false);
                        }
                    }
                    purchaseCalculations();
                } else {
                    Alert.inform("Purchase Invoice", "Please select row to remove ...");
                }
            } else {
                Alert.inform("Please Select Valid Row to Remove ...");
            }
        } catch (Exception ex) {
            String ss = "Method: removeRow    Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

    public  void removeRows(int i) {
        int RCount = jTable.getRowCount();
        try {
            if (i >= 0 || i < RCount) {
                ((DefaultTableModel) jTable.getModel()).removeRow(i);
            }
        } catch (Exception ex) {
            String ss = "Method: removeRows with argument    Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

    public  void clearData() {
        DefaultTableModel model = (DefaultTableModel) jTable.getModel();
        model.getDataVector().removeAllElements();
        try {
            for (int n = 0; n < initR; n++) {
                addRow();
            }
        } catch (Exception ex) {
            String ss = "Method: clearData    Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

    public  void callPRAdjust(String PRNo) {
        GetPRAdjust prAdj = new GetPRAdjust(jTable, "Purchase", PRNo);
        prAdj.setVisible(true);
        //   purchaseCalculations();
    }

    public  void callTempStocks() {
        GetTempStockData tempStk = new GetTempStockData(this);
        tempStk.setVisible(true);
        //  purchaseCalculations();
    }

    public double returnDouble(String str) {
        double returnVal = 0.0;
        try {
            if (str != null && !str.equals("null") && str.trim().length() > 0) {
                returnVal = Double.parseDouble(str);
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
            returnVal = 0.0;
        }
        return returnVal;
    }

    public String returnString(String str) {
        try {
            if (str != null && !str.equals("null") && str.trim().length() > 0) {
            } else {
                str = "";
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
            str = "";
        }
        return str;
    }

    public int returnInt(String str) {
        int returnVal = 0;
        try {
            if (str != null && !str.equals("null") && str.trim().length() > 0) {
                returnVal = Integer.parseInt(str);
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
            returnVal = 0;
        }
        return returnVal;
    }

    public  List<PurchaseModel> getPurchaseBill() {
        List<PurchaseModel> purcBillItems = new ArrayList<PurchaseModel>();
        int rowCount = 0;
        boolean flag = true;
        try {
            for (int i = 0; flag; i++) {
                if (!(jTable.getModel().getValueAt(i, 1) == null)) {
                    rowCount++;
                } else {
                    flag = false;
                }
            }
            PurchaseModel model;
            try {
                for (int index = 0; index < rowCount; index++) {
                    if (jTable.getModel().getValueAt(index, 1) != null) {
                        model = new PurchaseModel();
                        model.setItemName(""+jTable.getModel().getValueAt(index, 1));
                        model.setFormulation("" + jTable.getModel().getValueAt(index, 2));
                        model.setMfrName("" + jTable.getModel().getValueAt(index, 3));
                        model.setQuantity(returnInt("" + jTable.getModel().getValueAt(index, 4)));
                        model.setFree(returnInt("" + jTable.getModel().getValueAt(index, 5)));
                        model.setBatch(returnString("" + jTable.getModel().getValueAt(index, 6)));
                        model.setExpdate(""+jTable.getModel().getValueAt(index, 7));
                        model.setPacking(returnString("" + jTable.getModel().getValueAt(index, 8)));
                        model.setUnitprice(returnDouble("" + jTable.getModel().getValueAt(index, 9)));
                        model.setMrp(returnDouble("" + jTable.getModel().getValueAt(index, 10)));
                        model.setSalesDiscount(returnDouble("" + jTable.getModel().getValueAt(index, 11)));
                        model.setUnitDis(returnDouble("" + jTable.getModel().getValueAt(index, 13)));
                        model.setUnitVat(returnDouble("" + jTable.getModel().getValueAt(index, 14)));
                        model.setTotVal(returnDouble("" + jTable.getModel().getValueAt(index, 15)));
                        model.setItemCode(returnString("" + jTable.getModel().getValueAt(index, 16)));
                        model.setPurc_temp_flagid("" + jTable.getModel().getValueAt(index, 17));
                        model.setPurc_is_adj("" + jTable.getModel().getValueAt(index, 18));
                        purcBillItems.add(model);
                    }
                }
            } catch (Exception e) {
                String ss = "Class: PurchaseTable      Method: getPurchaseBill    Exception_1 : " + e.getMessage();
                log.debug(ss);
            }
        } catch (Exception e) {
            String ss = "Class: PurchaseTable      Method: getPurchaseBill    Exception_2 : " + e.getMessage();
            log.debug(ss);

        }
        return purcBillItems;
    }

    public  void LoadPrePIValues(String invNO) throws RemoteException, NotBoundException {
        Purchase purchaseCont = (Purchase) RegistryFactory.getClientStub(RegistryConstants.Purchase);
        PurchaseModel purcModel = new PurchaseModel();
        purcModel = (PurchaseModel) purchaseCont.purchaseBillDetails(invNO);
        List<PurchaseModel> purcOrderBill = purcModel.getListofitems();
        PurchaseModel pModel;
        try {
            int index = 0;
            for (index = 0; index < purcOrderBill.size(); index++) {
                pModel = purcOrderBill.get(index);
                int ss = 0;
                ss = getPIVal(pModel.getItemName());
                if (ss != 1) {
                    addRow();
                    getPIProductDetails(invNO, pModel.getItemName());
                }
            }
        } catch (Exception ex) {
            String ss = " Class : PurchaseTable  Method : LoadPrePIValues    Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

    public  String LoadPrePoValues(String invNO) throws RemoteException, NotBoundException {
        Purchase purchaseCont = (Purchase) RegistryFactory.getClientStub(RegistryConstants.Purchase);        
        PurchaseModel purcModel = new PurchaseModel();
        purcModel = (PurchaseModel) purchaseCont.viewPorecords(invNO);
        List<PurchaseModel> purcOrderBill = purcModel.getListofitems();
        String distname = "";
        PurchaseModel pModel = null;
        try {
            int index = 0;

            for (index = 0; index < purcOrderBill.size(); index++) {
                pModel = purcOrderBill.get(index);
                distname = pModel.getDistName();
                int ss = 0;
                ss = getPIVal(pModel.getItemName());                
                if (ss != 1) {
                    addRow();
                    getPOProductDetails(invNO, pModel.getItemName());
                }
            }
        } catch (Exception ex) {
            String ss = " Class : PurchaseTable  Method : LoadPrePoValues    Exception : " + ex.getMessage();
            log.debug(ss);
        }
        return distname;
    }

    public  int getPIVal(String iname) {
        int flag = 0;
        int rowCount = jTable.getModel().getRowCount();
        int rowVal = 0;
        try {
            for (int i = 0; i < rowCount; i++) {
                if (jTable.getModel().getValueAt(i, 1) != null && jTable.getModel().getValueAt(i, 1) != "" && jTable.getModel().getValueAt(i, 2) != null && jTable.getModel().getValueAt(i, 2) != "") {
                } else {
                    rowVal = i;
                    break;
                }
            }
            for (int val = 0; val < jTable.getRowCount(); val++) {
                if (rowVal != 0) {
                    if (val == rowVal && jTable.getModel().getValueAt(val, 1) == null); else if (jTable.getModel().getValueAt(val, 1) == null); else if (jTable.getModel().getValueAt(val, 1).equals(iname)) {
                        flag = 1;
                    }
                }
            }
        } catch (Exception ex) {
            String ss = " Class : PurchaseTable  Method : getPIVal    Exception : " + ex.getMessage();
            log.debug(ss);
        }
        return flag;
    }

    public  void getPOProductDetails(String invoice, String iname) throws RemoteException, NotBoundException {
        Purchase purchaseCont = (Purchase) RegistryFactory.getClientStub(RegistryConstants.Purchase);
        int rowCount = jTable.getModel().getRowCount();
        int rowVal = 0;
        try {
            for (int i = 0; i < rowCount; i++) {
                if (jTable.getModel().getValueAt(i, 1) != null && jTable.getModel().getValueAt(i, 1) != "" ) {
                } else {
                    rowVal = i;                    
                    break;
                }
            }
            int flag = 0;
            for (int val = 0; val < jTable.getRowCount(); val++) {
                if (rowVal != 0) {
                    if (val == rowVal && jTable.getModel().getValueAt(val, 1) == null); else if (jTable.getModel().getValueAt(val, 1) == null); else if (jTable.getModel().getValueAt(val, 1).equals(iname)) {
                        flag = 1;
                    }
                }
            }
            if (flag != 1) {
                for (int i = 0; i < jTable.getRowCount(); i++) {
                    if (jTable.getModel().getValueAt(i, 1) == null) {
                        nullVal = 1;

                        List purcDetails = purchaseCont.prePurcOrderDetails(invoice, iname);
                        jTable.getModel().setValueAt(rowVal + 1, rowVal, 0);
                        jTable.getModel().setValueAt(purcDetails.get(0).toString(),rowVal, 1);
                        jTable.getModel().setValueAt(purcDetails.get(1).toString(), rowVal, 2);
                        jTable.getModel().setValueAt(purcDetails.get(2).toString(),rowVal, 3);
                        jTable.getModel().setValueAt(purcDetails.get(3).toString(), rowVal, 4);
                        jTable.getModel().setValueAt(0, rowVal, 5);
                        jTable.getModel().setValueAt(purcDetails.get(4).toString(), rowVal, 8);
                        jTable.getModel().setValueAt(0.00, rowVal, 9);
                        jTable.getModel().setValueAt(Double.parseDouble(purcDetails.get(5).toString()), rowVal, 10);
                        jTable.getModel().setValueAt(0.00, rowVal, 13);
                        jTable.getModel().setValueAt(Double.parseDouble(purcDetails.get(6).toString()), rowVal, 14);
                        jTable.getModel().setValueAt(Integer.parseInt(purcDetails.get(7).toString()), rowVal, 16);
                        jTable.getModel().setValueAt(Integer.parseInt(purcDetails.get(8).toString()), rowVal, 19);
                    }
                }
            }
        } catch (Exception ex) {
            String ss = " Class : PurchaseTable  Method : getPOProductDetails    Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

    public  void getPIProductDetails(String invoice, String iname) throws RemoteException, NotBoundException {
        Purchase purchaseCont = (Purchase) RegistryFactory.getClientStub(RegistryConstants.Purchase);
        int rowCount = jTable.getModel().getRowCount();
        int rowVal = 0;
        try {
            for (int i = 0; i < rowCount; i++) {
                if (jTable.getModel().getValueAt(i, 1) != null && jTable.getModel().getValueAt(i, 1) != "" && jTable.getModel().getValueAt(i, 2) != null && jTable.getModel().getValueAt(i, 2) != "") {
                } else {
                    rowVal = i;
                    break;
                }
            }
            int flag = 0;
            for (int val = 0; val < jTable.getRowCount(); val++) {
                if (rowVal != 0) {
                    if (val == rowVal && jTable.getModel().getValueAt(val, 1) == null); else if (jTable.getModel().getValueAt(val, 1) == null); else if (jTable.getModel().getValueAt(val, 1).equals(iname)) {
                        flag = 1;
                    }
                }
            }
            if (flag != 1) {
                CommonImplements commonCont = (CommonImplements)RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
                for (int i = 0; i < jTable.getRowCount(); i++) {
                    if (jTable.getModel().getValueAt(i, 1) == null) {
                        nullVal = 1;                        
                        List purcDetails = purchaseCont.prePurcBillDetails(invoice, iname);
                        String query = "select vat_calc_flag from drugtable where itemcode='"+purcDetails.get(8).toString()+"' limit 1";
                        int vat_calc_flag=Integer.parseInt(commonCont.getQueryValue(query));
                        jTable.getModel().setValueAt(rowVal + 1, rowVal, 0);
                        jTable.getModel().setValueAt(purcDetails.get(0).toString(), rowVal, 1);
                        jTable.getModel().setValueAt(purcDetails.get(1).toString(), rowVal, 2);
                        jTable.getModel().setValueAt(purcDetails.get(2).toString(), rowVal, 3);
                        jTable.getModel().setValueAt(0, rowVal, 4);
                        jTable.getModel().setValueAt(0, rowVal, 5);
                        jTable.getModel().setValueAt(purcDetails.get(3).toString(), rowVal, 8);
                        jTable.getModel().setValueAt(Double.parseDouble(purcDetails.get(4).toString()), rowVal, 9);
                        jTable.getModel().setValueAt(Double.parseDouble(purcDetails.get(5).toString()), rowVal, 10);
                        jTable.getModel().setValueAt(Double.parseDouble(purcDetails.get(6).toString()), rowVal, 13);
                        jTable.getModel().setValueAt(Double.parseDouble(purcDetails.get(7).toString()), rowVal, 14);
                        jTable.getModel().setValueAt(purcDetails.get(8).toString(), rowVal, 16);
                        jTable.getModel().setValueAt(""+vat_calc_flag, rowVal, 19);
                    }
                }
            }
        } catch (Exception ex) {
            String ss = " Class : PurchaseTable  Method : getPIProductDetails    Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

    public  void emptyTableValues() {
        int rowCount = jTable.getModel().getRowCount();
        int colCount = jTable.getModel().getColumnCount();
        try {
            for (int i = 0; i < rowCount; i++) {
                for (int j = 0; j < colCount; j++) {
                    if (jTable.getModel().getValueAt(i, 1) == null); else {
                        jTable.getModel().setValueAt(null, i, j);
                    }
                }
            }
        } catch (Exception ex) {
            String ss = "Method: emptyTableValues    Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

    public  void resetValues() {
        totPurcQty = 0;
        totPurcFreeQty = 0;
        totPurcItems = 0;
        totPurcAmt = 0.00;
        totPurcDistAmt = 0.0;
        totPurcVAT4Amt = 0.0;
        amt = 0.00;
    }

    public  void focusSet() {
        jTable.requestFocus();
        jTable.changeSelection(0, 0, false, false);
        jTable.changeSelection(0, 1, false, false);
        jTable.getModel().setValueAt("1", 0, 0);
        jTable.setCellSelectionEnabled(true);
    }

    public  void focusSet(int row, int col) {
        if (col >= 0 && col <= 16) {
            jTable.requestFocus();
            if (jTable.getModel().getRowCount() > 0) {
                jTable.changeSelection((row + 1), col, false, false);
            } else {
                jTable.changeSelection(row, (col + 1), false, false);
            }
            jTable.changeSelection(row, col, false, false);
            jTable.setCellSelectionEnabled(true);
        }
    }

    public  void focusSet(int row, int col,String barcode) {
        for(int i=0; i < jTable.getRowCount();i++) {
            if(jTable.getModel().getValueAt(i, 1)!=null) {
                row++;
            }
        }
        jTable.requestFocus();
        jTable.changeSelection(row, 1, false, false);
        jTable.setCellSelectionEnabled(true);
        g.refreshDrugTab(itemCode,barcode);
        barcodeSelected = false;
        barcodeFocus=true;
    }

    public  int total(int colNum) {
        int tot = 0;
        int colNo = colNum;
        for (int i = 0; i < jTable.getModel().getRowCount(); i++) {
            if (jTable.getModel().getValueAt(i, colNo) == null || jTable.getModel().getValueAt(i, colNo).equals("")) {
                tot += 0;
            } else {
                tot += Double.parseDouble("" + jTable.getModel().getValueAt(i, colNo));
            }
        }
        return tot;
    }

    public  int totalItems() {
        int tot = 0;
        for (int i = 0; i < jTable.getModel().getRowCount(); i++) {
            if (jTable.getModel().getValueAt(i, 2) == null || jTable.getModel().getValueAt(i, 2) != ""); else {
                tot++;
            }
        }
        return tot;
    }

    public  int getPAdjCount() {
        int cnt = 0;
        for (int i = 0; i < jTable.getRowCount(); i++) {
            Object obj = jTable.getModel().getValueAt(i, 16);
            if (obj != null) {
                if (Boolean.valueOf(obj.toString())) {
                    cnt++;
                }
            }
        }
        return cnt;
    }

    public  void clearSelection() {
        if (!check) {
            jTable.clearSelection();
        }
    }

    public  int getDuplicates(int col) {
        int R = jTable.getModel().getRowCount();
        int val = 0;
        try {
            for (int i = 0; i < R - 1; i++) {
                if (jTable.getModel().getValueAt(i, col) == null || jTable.getModel().getValueAt(i, col).equals("")); else {
                    String va = jTable.getModel().getValueAt(i, col).toString();
                    for (int j = i + 1; j < R; j++) {
                        if (jTable.getModel().getValueAt(j, col) == null || jTable.getModel().getValueAt(j, col).equals("")); else {
                            String comp = jTable.getModel().getValueAt(j, col).toString();
                            if (va.equals(comp)) {
                                val = 1;
                                focusSet(j, col);
                                is = (i + 1);
                                js = (j + 1);
                                break;
                            }
                        }
                    }
                }
            }
        } catch (Exception ex) {
            String msg = "   Method: getDuplicates    Exception : " + ex.getMessage();
            log.debug(msg);
        }
        return val;
    }

    public  void purchaseCalculations() {
        Value value = new Value();
        int rowCount = jTable.getRowCount();
        purcQty = new int[rowCount];
        purcFreeQty = new int[rowCount];
        purcPrice = new double[rowCount];
        
        purcVAT = new double[rowCount];
        
        purcDisct = new double[rowCount];
        
        purcSubTot = new double[rowCount];
        purcAdjVAT4 = new double[rowCount];
        
        purcAdjDist = new double[rowCount];
        totPurcAmt = 0;        
        totPurcDistAmt = 0;
        
        totPurcItems = 0;
        totPurcQty = 0;
        totPurcFreeQty = 0;
        totPurcVAT4Amt = 0.0;
        
        totPurcAdjQty = 0;
        totPurcAdjItems = 0;
        totPurcAdjAmt = 0.00;
        totPurcAdjDistAmt = 0.0;
        totPurcAdjVAT4Amt = 0.0;

        totMrp=0.0;
        totPurPrice = 0.0;
        totMargin = 0.0;
        try {
            for (int i = 0; i < rowCount; i++) {
                if ((jTable.getModel().getValueAt(i, 1) == null || jTable.getModel().getValueAt(i, 1).equals("")) && (jTable.getModel().getValueAt(i, 2) == null || jTable.getModel().getValueAt(i, 2).equals(""))) {
                    if (i == 0) {
                        nullVal = 0;
                    }
                } else {
                    nullVal = 1;
                    totPurcItems++;                
                    

                    if (jTable.getModel().getValueAt(i, 4) == null || jTable.getModel().getValueAt(i, 4).equals("")) {
                        purcQty[i] = 0;
                    } else {
                        purcQty[i] = Integer.parseInt(jTable.getModel().getValueAt(i, 4).toString());
                    }
                    if (jTable.getModel().getValueAt(i, 5) == null || jTable.getModel().getValueAt(i, 5).equals("")) {
                        purcFreeQty[i] = 0;
                    } else {
                        purcFreeQty[i] = Integer.parseInt(jTable.getModel().getValueAt(i, 5).toString());
                    }
                    totPurcQty += purcQty[i];
                    totPurcFreeQty += purcFreeQty[i];
                    if (jTable.getModel().getValueAt(i, 9) == null || jTable.getModel().getValueAt(i, 9).equals("")) {
                        purcPrice[i] = 0.0;
                    } else {
                        purcPrice[i] = Double.parseDouble("" + jTable.getModel().getValueAt(i, 9));
                    }
                    totPurPrice += (purcQty[i]*purcPrice[i]);
                    Double purcMrp = 0.0;
                    purcMrp = ((jTable.getModel().getValueAt(i, 10) == null || jTable.getModel().getValueAt(i, 10).equals("")) ? 0.0 : Double.parseDouble("" + jTable.getModel().getValueAt(i, 10)));
                    //Sum of Mrp
                    totMrp += (purcQty[i] * purcMrp);
                    boolean isPrAdjust = false;
                    if (jTable.getModel().getValueAt(i, 18) != null && jTable.getModel().getValueAt(i, 18) != "") {
                        isPrAdjust = Boolean.valueOf(jTable.getModel().getValueAt(i, 18).toString());
                    }
                    purcSubTot[i] = value.Round(purcQty[i] * purcPrice[i], 2);
                    double sttss = value.Round(purcSubTot[i], 2);
                    jTable.getModel().setValueAt(value.Round(purcSubTot[i]), i, 15);
                    if (!isPrAdjust) {
                        totPurcAmt += sttss;
                        if (jTable.getModel().getValueAt(i, 13) == null || jTable.getModel().getValueAt(i, 13).equals("") || jTable.getModel().getValueAt(i, 13).equals(0)) {
                            purcDisct[i] = 0;
                            
                        } else {
                            purcDisct[i] = value.Round(purcSubTot[i] * (Double.parseDouble(value.Round("" + jTable.getModel().getValueAt(i, 13), 2)) / 100), 2);
                            
                        }
                        totPurcDistAmt += value.Round(purcDisct[i], 2);                        
                        Double purchVat = 0.00;
                        if (jTable.getModel().getValueAt(i, 14) == null || jTable.getModel().getValueAt(i, 14).equals("")) {
                            purcVAT[i] = 0;                            
                        } else {
                            if (jTable.getModel().getValueAt(i, 14).equals(0) || jTable.getModel().getValueAt(i, 14).equals("")) {
                                purcVAT[i] = 0;                 
                               } else {
                                if(jTable.getModel().getValueAt(i, 14)!=null) {
                                purchVat = Double.parseDouble("" + jTable.getModel().getValueAt(i, 14));
                                }
                                int vat_calc_flag = Integer.parseInt(jTable.getModel().getValueAt(i, 19).toString());
                                if(vat_calc_flag == 0) {
                                purcVAT[i] = value.Round((purcSubTot[i] - purcDisct[i]) * (purchVat / 100), 2);                                
                                }
                                else {
                                purcVAT[i] = value.Round((purcQty[i]+purcFreeQty[i])*(purcMrp-(purcMrp/(1+purchVat/100))),2);                                
                                }
                            }
                        }
                        totPurcVAT4Amt += value.Round(purcVAT[i], 2);
                    } else {
                        totPurcAdjQty += purcQty[i];
                        totPurcAdjItems++;
                        if (jTable.getModel().getValueAt(i, 13) == null || jTable.getModel().getValueAt(i, 13).equals("") || jTable.getModel().getValueAt(i, 13).equals(0)) {
                            purcAdjDist[i] = 0;
                        } else {
                            purcAdjDist[i] = value.Round(purcSubTot[i] * (Double.parseDouble(value.Round("" + jTable.getModel().getValueAt(i, 13), 1)) / 100), 2);
                        }
                        totPurcAdjDistAmt += value.Round(purcAdjDist[i], 2);
                        Double purchVat=0.00;
                        if (jTable.getModel().getValueAt(i, 13).equals(0)) {
                            purcAdjVAT4[i] = 0;
                            
                        } else {
                                if(jTable.getModel().getValueAt(i, 14)!=null) {
                                purchVat = Double.parseDouble("" + jTable.getModel().getValueAt(i, 14));
                                }
                                int vat_calc_flag = Integer.parseInt(jTable.getModel().getValueAt(i, 19).toString());
                                if(vat_calc_flag == 0) {
                                purcAdjVAT4[i] = value.Round((purcSubTot[i] - purcDisct[i]) * (purchVat / 100), 2);
                                }
                                else {
                                purcAdjVAT4[i] = value.Round((purcQty[i]+purcFreeQty[i])*(purcMrp-(purcMrp/(1+purchVat/100))),2);
                                }
                        }
                        totPurcAdjVAT4Amt += value.Round(purcAdjVAT4[i], 2);
                        totPurcAdjAmt += ((sttss - purcAdjDist[i]) + purcAdjVAT4[i]);
                    }
                }               
            }
            totMargin = (totMrp - (totPurPrice-totPurcDistAmt+totPurcVAT4Amt));           
        } catch (Exception ex) {
            ex.printStackTrace();
            String ss = "Class: PurchaseTable    Method: purchaseCalculations    Exception : " + ex.getMessage();
            log.debug(ss);            
        }
    }

    public  void calculateMargin() {
        try {
        int rowCount = jTable.getSelectedRow();
        double mrp = 0.00;
        double purPrice = 0.00;
        double unitDisc = 0.00;
        double unitVAT = 0.00;
        double margin = 0.00;
        double discAmt = 0.00;
        double VATAmt = 0.00;
        double percMargin = 0.00;
        if(jTable.getModel().getValueAt(rowCount, 9) != null && jTable.getModel().getValueAt(rowCount, 10) !=null && jTable.getModel().getValueAt(rowCount, 13)!= null && jTable.getModel().getValueAt(rowCount, 14)!= null
                &&!jTable.getModel().getValueAt(rowCount, 9).equals("") && !jTable.getModel().getValueAt(rowCount, 10).equals("") && !jTable.getModel().getValueAt(rowCount, 13).equals("") && !jTable.getModel().getValueAt(rowCount, 14).equals(""))
             {
             purPrice = Double.parseDouble (jTable.getModel().getValueAt(rowCount, 9).toString());
             mrp = Double.parseDouble (jTable.getModel().getValueAt(rowCount, 10).toString());
             unitDisc = Double.parseDouble (jTable.getModel().getValueAt(rowCount, 13).toString());
             unitVAT = Double.parseDouble (jTable.getModel().getValueAt(rowCount, 14).toString());
             discAmt = unitDisc*purPrice/100;
             int vat_calc_flag = Integer.parseInt(jTable.getModel().getValueAt(rowCount, 19).toString());
             double salesVat = Value.Round((mrp*unitVAT)/(100+unitVAT),2);
             if(vat_calc_flag == 0) {
                VATAmt = (purPrice-discAmt)*unitVAT/100;
                margin = Double.parseDouble(Value.Round(mrp-salesVat-(purPrice-discAmt)));
             }
             else {
                VATAmt = (mrp-(mrp/(1+unitVAT/100)));
                margin = Double.parseDouble(Value.Round(mrp-(purPrice-discAmt)));
             }
             percMargin = Value.Round((margin/mrp)*100,2);
             jTable.getModel().setValueAt(percMargin, rowCount, 12);
            }
    }
    catch(Exception ex) {
        ex.printStackTrace();
        String ss = "Class : PurchaseTable  Method : calculateMargin   Exception : " + ex.getMessage();
        log.debug(ss);
    }
    }
}
