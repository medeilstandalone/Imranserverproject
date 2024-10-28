package com.vanuston.medeil.uitables;

import com.vanuston.medeil.util.DateCellEditor;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.DecimalFormatRenderer;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.PercentageFormatRenderer;
import com.vanuston.medeil.util.Value;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.FocusEvent;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.rmi.RemoteException;
import java.util.Vector;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import javafx.stage.Alert;
import javax.swing.table.DefaultTableColumnModel;

public class PurcRtAdjTable {

    static Logger log = Logger.getLogger(PurcRtAdjTable.class, "Utilities");
    static int ss1 = 0;
    public static JTable purcAdTab;
    public static String thisForm = null;
    public static int initR;
    public static JScrollPane scrollPane = new JScrollPane();
    public static JComboBox jcoB = new JComboBox();
    public static int purcQty[];
    public static int purcFreeQty[];
    public static double purcPrice[];
    public static double purcVAT4[];
    public static double purcVAT12[];
    public static double purcDist[];
    public static double purcSubTot[];
    public static int totPurcQty = 0;
    public static int totPurcFreeQty = 0;
    public static int totPurcItems = 0;
    public static double totPurcAmt = 0.00;
    public static double totPurcDistAmt = 0.0;
    public static double totPurcVAT4Amt = 0.0;
    public static double totPurcVAT12Amt = 0.0;
    public static int nullVal = 0;
    public static KeyStroke focusOut = KeyStroke.getKeyStroke(KeyEvent.VK_SPACE, KeyEvent.CTRL_MASK);
    public static KeyStroke focusOut1 = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, KeyEvent.CTRL_MASK);
    public static KeyStroke shrctF2 = KeyStroke.getKeyStroke(KeyEvent.VK_F2, 0);
    public static KeyStroke shrctF3 = KeyStroke.getKeyStroke(KeyEvent.VK_F3, 0);
    public static KeyStroke shrctF4 = KeyStroke.getKeyStroke(KeyEvent.VK_F4, 0);
    public static KeyStroke shrctF5 = KeyStroke.getKeyStroke(KeyEvent.VK_F5, 0);
    public static KeyStroke shrctCtrlC = KeyStroke.getKeyStroke(KeyEvent.VK_ESCAPE, KeyEvent.CTRL_MASK);
    public static KeyStroke shrctCtrlAr = KeyStroke.getKeyStroke(KeyEvent.VK_LEFT, KeyEvent.CTRL_MASK);
    public static KeyStroke shrctShDl = KeyStroke.getKeyStroke(KeyEvent.VK_DELETE, KeyEvent.SHIFT_MASK);
    public static KeyStroke callTable = KeyStroke.getKeyStroke(KeyEvent.VK_T, KeyEvent.CTRL_MASK);
    public static KeyStroke shrctCtrlDl = KeyStroke.getKeyStroke(KeyEvent.VK_DELETE, KeyEvent.CTRL_MASK);
    public static double amt = 0.00;
    public static GetPurcDrugData g = null;
    public static int is = 0;
    public static int js = 0;
    static int s = 1;
    static int vat_calc_flag;

    public static JComponent createTable() throws RemoteException {
        final int initRow = 10;
        Object[] colName = {"S.No.", "Product Name", "Formulation", "Mfr.", "Qty.", "Free", "Batch No.", "Expiry Date(mm/yy)", "Packing No.'s", "Purchase Price", "MRP", "S.Disc %", "Margin", "Disc %", "VAT %", "Amount", "Item Code", "Is Temp Stocks", "Is PR Adjusted", "vat_adj_flag"};
        Class[] type = {java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.String.class,
            java.lang.Integer.class, java.lang.Integer.class, java.lang.String.class, java.lang.Object.class, java.lang.Integer.class,
            java.lang.Double.class, java.lang.Double.class, java.lang.Double.class, java.lang.Double.class,java.lang.Double.class, java.lang.Double.class, java.lang.Double.class,
            java.lang.String.class, java.lang.Boolean.class, java.lang.Boolean.class, java.lang.Integer.class};
        boolean[] canEdit = {false, false, false, false, true, true, true, true, true, true, true,false,true, true, false, false, false, false, false};
        int[] width = {30, 90, 48, 35, 35, 35, 70, 65, 50, 40, 40, 0, 35, 35, 35, 75, 0, 0, 0, 0};

        initR = initRow;
        final Class[] types = type;
        final boolean[] canEditCols = canEdit;
        final int[] colWidth = width;
        purcAdTab = new JTable();
        g = new GetPurcDrugData(purcAdTab, "Purchase");
        Vector cols = new Vector();
        Vector data = new Vector();
        int len = colName.length;
        for (int i = 0; i < initRow; i++) {
            Vector c = new Vector();
            for (int j = 0; j < len; j++) {
                if (j == 17) {
                    c.addElement(Boolean.TRUE);
                } else if (j == 16) {
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
            purcAdTab.setModel(new javax.swing.table.DefaultTableModel(data, cols) {

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
            String ss = "Class : PurcRtAdjTable Method : Create Table    Exception : " + ex.getMessage();
            log.debug(ss);
        }
        for (int i = 0; i < len; i++) {
            purcAdTab.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }
        purcAdTab.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        purcAdTab.setSelectionMode(0);
        purcAdTab.getTableHeader().setBackground(new Color(226, 238, 244));
        purcAdTab.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
        purcAdTab.setShowGrid(true);
        purcAdTab.getTableHeader().setReorderingAllowed(false);
        purcAdTab.getColumnModel().getColumn(15).setCellRenderer(new DecimalFormatRenderer());
        purcAdTab.getColumnModel().getColumn(14).setCellRenderer(new PercentageFormatRenderer());
        purcAdTab.getColumnModel().getColumn(13).setCellRenderer(new PercentageFormatRenderer());
        purcAdTab.removeColumn(purcAdTab.getColumnModel().getColumn(19));
        purcAdTab.removeColumn(purcAdTab.getColumnModel().getColumn(18));
        purcAdTab.removeColumn(purcAdTab.getColumnModel().getColumn(17));
        purcAdTab.removeColumn(purcAdTab.getColumnModel().getColumn(16));
        purcAdTab.removeColumn(purcAdTab.getColumnModel().getColumn(12));
        purcAdTab.removeColumn(purcAdTab.getColumnModel().getColumn(11));
        purcAdTab.putClientProperty("terminateEditOnFocusLost", Boolean.TRUE);
        purcAdTab.getInputMap().put(focusOut, "focusOut");
        purcAdTab.getInputMap().put(focusOut1, "focusOut");
        purcAdTab.getInputMap().put(shrctF2, "focusOut1");
        purcAdTab.getInputMap().put(shrctF3, "focusOut");
        purcAdTab.getInputMap().put(shrctF4, "focusOut");
        purcAdTab.getInputMap().put(shrctF5, "focusOut");
        purcAdTab.getInputMap().put(shrctCtrlC, "focusOut");
        purcAdTab.getInputMap().put(shrctCtrlAr, "focusOut");
        purcAdTab.getInputMap().put(shrctShDl, "focusOut");
        purcAdTab.getInputMap().put(shrctCtrlDl, "removeRow");
        purcAdTab.getInputMap().put(callTable, "callTable");
        purcAdTab.getActionMap().put("removeRow", new AbstractAction("removeRow") {

            @Override
            public void actionPerformed(ActionEvent evt) {
                removeRow();
            }
        });
        purcAdTab.getActionMap().put("focusOut", new AbstractAction("focusOut") {

            @Override
            public void actionPerformed(ActionEvent evt) {

                purcAdTab.clearSelection();
                purcAdTab.transferFocus();
            }
        });
        purcAdTab.getActionMap().put("focusOut1", new AbstractAction("focusOut1") {

            @Override
            public void actionPerformed(ActionEvent evt) {
                final int j = purcAdTab.getSelectedColumn();
                if (j == 7); else {
                    purcAdTab.clearSelection();
                    purcAdTab.transferFocus();
                }
            }
        });
        purcAdTab.getActionMap().put("callTable", new AbstractAction("callTable") {

            @Override
            public void actionPerformed(ActionEvent evt) {
                for (int val = 0; val < purcAdTab.getRowCount(); val++) {
                    if (purcAdTab.getModel().getValueAt(val, 2) == null) {
                        if (purcAdTab.getModel().getValueAt(val, 0) == null) {
                            purcAdTab.getModel().setValueAt(val + 1, val, 0);
                        }
                        purcAdTab.changeSelection(val, 2, false, false);
                        break;
                    }
                }
                g.refreshDrugTab();

            }
        });

//        DefaultTableColumnModel dcm = (DefaultTableColumnModel) purcAdTab.getColumnModel();
//        dcm.getColumn(7).setCellRenderer(new DateCellEditor.DateRenderer());
//        dcm.getColumn(7).setCellEditor(new DateCellEditor());
        purcAdTab.getActionMap().put("callTable", new AbstractAction("callTable") {

            @Override
            public void actionPerformed(ActionEvent evt) {
                for (int val = 0; val < purcAdTab.getRowCount(); val++) {
                    if (purcAdTab.getModel().getValueAt(val, 2) == null) {
                        if (purcAdTab.getModel().getValueAt(val, 0) == null) {
                            purcAdTab.getModel().setValueAt(val + 1, val, 0);
                        }
                        purcAdTab.changeSelection(val, 2, false, false);
                        break;
                    }
                }
                g.refreshDrugTab();
            }
        });
        purcAdTab.setGridColor(new java.awt.Color(204, 204, 255));
        purcAdTab.setCellSelectionEnabled(true);
        purcAdTab.setRowHeight(25);
        purcAdTab.setSelectionBackground(Color.LIGHT_GRAY);
        purcAdTab.setSelectionForeground(Color.RED);
        purcAdTab.revalidate();
        purcAdTab.addMouseListener(new MouseAdapter() {

            @Override
            public void mouseClicked(MouseEvent e) {
                final int i = purcAdTab.getSelectedRow();
                final int j = purcAdTab.getSelectedColumn();
                try {
                    for (int val = 0; val < purcAdTab.getRowCount(); val++) {
                        if (purcAdTab.getModel().getValueAt(val, 4) == null); else {
                            if (purcAdTab.getModel().getValueAt(val, 4).equals(0)) {
                                purcAdTab.changeSelection(val, 4, false, false);
                            }
                        }
                    }
                    purchaseCalculations();
                } catch (Exception ex) {
                    String ss = "  Class : PurcRtAdjTable Method : tableMouseClicked    Exception : " + ex.getMessage();
                    log.debug(ss);
                }
            }
        });
        purcAdTab.addKeyListener(new KeyListener() {

            @Override
            public void keyReleased(KeyEvent e) {
                try {
                    final int i = purcAdTab.getSelectedRow();
                    final int j = purcAdTab.getSelectedColumn();
                    purchaseCalculations();
                    if (e.getKeyCode() == 10) {
                        InputMap im = purcAdTab.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                        KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                        KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                        KeyStroke f2 = KeyStroke.getKeyStroke(KeyEvent.VK_F2, 0);                        
                        im.put(enter, im.get(tab));                        
                    }
                    if ((j == 1 || j == 2) && e.getKeyCode() != 27 && purcAdTab.getModel().isCellEditable(i, 6)) {
                        g.refreshDrugTab();
                    }
                    if (j == 5) {
                        if (purcAdTab.getModel().getValueAt(i, 4) == null); else if (purcAdTab.getModel().getValueAt(i, 4).equals(0)) {
                            purcAdTab.changeSelection(i, 4, false, false);
                        }
                    }
                    if (j == 6) {
                        if (purcAdTab.getModel().getValueAt(i, 5) == null) {
                            purcAdTab.changeSelection(i, 5, false, false);
                        }
                    }
                    if (j == 7) {
                        if (purcAdTab.getModel().getValueAt(i, 6) == null || purcAdTab.getModel().getValueAt(i, 6).toString().trim().length() <= 0) {
                            purcAdTab.changeSelection(i, 6, false, false);
                        } else {
                            if(DateUtils.now("MM/yy").equalsIgnoreCase(""+purcAdTab.getModel().getValueAt(i, 7))){
                            purcAdTab.getModel().setValueAt("",i,7);
                            }
                    }
                    }
                    if (j == 8) {
                        if (purcAdTab.getModel().getValueAt(i, 7) == null) {
                            purcAdTab.changeSelection(i, 7, false, false);
                        }
                    }
                    if (j == 9) {
                        if (purcAdTab.getModel().getValueAt(i, 8) == null) {
                            purcAdTab.changeSelection(i, 8, false, false);
                        }
                    }
                    if (j == 10) {
                        if (purcAdTab.getModel().getValueAt(i, 9) == null) {
                            purcAdTab.changeSelection(i, 9, false, false);
                        }
                    }
                    if (j == 11) {
                        if (purcAdTab.getModel().getValueAt(i, 10) == null) {
                            purcAdTab.changeSelection(i, 10, false, false);
                        }
                    }
                    if (j == purcAdTab.getColumnModel().getColumnCount() - 1) {
                        double dis = 0;
                        double vat = 0;
                        if (vat == 0 || vat == 4 || vat == 12.5) {
                            if (i == purcAdTab.getModel().getRowCount() - 1) {
                                addRow();
                            }
                            purcAdTab.changeSelection(i + 1, 0, false, false);
                            purcAdTab.getModel().setValueAt(i + 2, i + 1, 0);
                        } else {
                            purcAdTab.changeSelection(i, purcAdTab.getColumnModel().getColumnCount() - 3, false, false);
                            Alert.inform("Purchase Invoice", "Vat % is only 4 or 12.5 only allowed ");
                        }
                    }
                } catch (Exception ex) {
                    String ss = "  Class : PurcRtAdjTable Method : tablekeyReleased    Exception : " + ex.getMessage();
                    log.debug(ss);
                }
            }

            @Override
            public void keyPressed(KeyEvent e) {
                final int i = purcAdTab.getSelectedRow();
                final int j = purcAdTab.getSelectedColumn();                
                try {
                    InputMap im = purcAdTab.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                    if (e.getKeyCode() == 10) {
                        ss1 = 0;
                        KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                        KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                        KeyStroke f2 = KeyStroke.getKeyStroke(KeyEvent.VK_ESCAPE, 0);
                        if (j == 13) {
                            getAddition(i);
                        }
                        if (j == 7 && ss1 == 0) {
                            if (purcAdTab.getCellEditor() == null) {
                                im.put(enter, im.get(f2));
                            } else if (purcAdTab.getCellEditor() != null) {
                                im.put(enter, im.get(tab));
                                ss1 = 0;
                            }
                            ss1 = 1;
                        } else {
                            im.put(enter, im.get(tab));
                            ss1 = 0;
                        }
                    }
                    if (e.isActionKey()) {
                        for (int val = 0; val < purcAdTab.getRowCount(); val++) {
                            if (purcAdTab.getModel().getValueAt(val, 4) == null); else {
                                if (Integer.parseInt(purcAdTab.getModel().getValueAt(val, 4).toString()) == 0) {
                                    purcAdTab.changeSelection(val, 4, false, false);
                                    break;
                                }
                            }
                        }
                    }
                    if (e.getKeyCode() == KeyEvent.VK_DELETE || e.getKeyCode() == KeyEvent.VK_BACK_SPACE) {
                        if (purcAdTab.getModel().isCellEditable(i, j)) {
                            purcAdTab.getModel().setValueAt("", i, j);
                        }
                    }
                } catch (Exception ex) {
                    String ss = "  Class : PurcRtAdjTable Method : tablekeyPressed    Exception : " + ex.getMessage();
                    log.debug(ss);
                }
            }

            @Override
            public void keyTyped(KeyEvent e) {
                InputMap im = purcAdTab.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                im.put(enter, im.get(tab));
                ss1 = 0;
            }
        });
        purcAdTab.addFocusListener(new java.awt.event.FocusAdapter() {

            @Override
            public void focusGained(java.awt.event.FocusEvent evt) {
                if (s == 1) {
                    purchaseCalculations();
                }
                s = 0;
            }

            @Override
            public void focusLost(FocusEvent e) {
                super.focusLost(e);
                s = 1;
            }
        });
        return purcAdTab;
    }

    public static JComponent getScrollTable(JComponent jt) {
        purcAdTab = (JTable) jt;
        scrollPane.add(purcAdTab);
        scrollPane.setViewportView(purcAdTab);
        return scrollPane;
    }

    static void getAddition(int i) {
        int aRow = purcAdTab.getModel().getRowCount() - 1;
        if (i == aRow) {
            if (purcAdTab.getModel().getValueAt(i, 1) != null) {
                if (purcAdTab.getModel().getValueAt(i, 1).toString().trim().length() > 0) {
                    addRow();
                }
            }
        }
    }

    public static void addRow() {
        try {
            DefaultTableModel model = (DefaultTableModel) purcAdTab.getModel();
            int row = purcAdTab.getRowCount();
            Vector datas = new Vector();
            for (int i = 0; i < purcAdTab.getModel().getColumnCount(); i++) {
                if (row == 0 && i == 0) {
                    datas.addElement(i + 1);
                } else if (i == 17) {
                    datas.addElement(Boolean.TRUE);
                } else if (i == 16) {
                    datas.addElement(Boolean.FALSE);
                } else {
                    datas.addElement(null);
                }
            }
            model.insertRow(purcAdTab.getRowCount(), datas);
        } catch (Exception ex) {
            String ss = "  Class : PurcRtAdjTable Method : removeRow    Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

    public static void removeRow() {
        int i = purcAdTab.getSelectedRow();
        int j = purcAdTab.getSelectedColumn();
        int rows = purcAdTab.getRowCount();
        try {
            if (i != -1) {
                DefaultTableModel model = (DefaultTableModel) purcAdTab.getModel();

                if (rows == 1) {
                    if (i == 0) {
                        model.removeRow(i);
                        resetValues();
                        for (int n = 0; n < initR; n++) {
                            addRow();
                        }
                        purcAdTab.changeSelection(0, 0, false, false);
                    }

                } else {
                    model.removeRow(i);
                    int rows1 = purcAdTab.getRowCount();

                    if (i + 1 != rows) {
                        for (int n = 0; n < rows1; n++) {
                            if (purcAdTab.getModel().getValueAt(n, 0) == null); else {
                                purcAdTab.getModel().setValueAt(n + 1, n, 0);
                            }
                        }
                        purcAdTab.changeSelection(i, j, false, false);
                    } else {
                        purcAdTab.changeSelection(i - 1, j, false, false);
                    }
                }
                purchaseCalculations();
            } else {
                Alert.inform("Purchase Invoice", "Please select row to remove ...");
            }
        } catch (Exception ex) {
            String ss = "  Class : PurcRtAdjTable Method : removeRow    Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

    public static void removeRows(int i) {
        int RCount = purcAdTab.getRowCount();
        try {
            if (i >= 0 || i < RCount) {
                ((DefaultTableModel) purcAdTab.getModel()).removeRow(i);
            }
        } catch (Exception ex) {
            String ss = "  Method: removeRows with argument    Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

    public static void clearData() {
        DefaultTableModel model = (DefaultTableModel) purcAdTab.getModel();
        model.getDataVector().removeAllElements();
        try {
            for (int n = 0; n < initR; n++) {
                addRow();
            }
            purchaseCalculations();
        } catch (Exception ex) {
            String ss = "  Class : PurcRtAdjTable Method : clearData    Exception : " + ex.getMessage();
            log.debug(ss);
        }
        purcAdTab.requestFocus();
        purcAdTab.changeSelection(0, 0, false, false);
    }

    public static Object[][] getTableRemValues() {
        int rowCount = purcAdTab.getModel().getRowCount();
        int colCount = purcAdTab.getModel().getColumnCount();
        Object[][] values = null;
        int n = 0;
        try {
            values = new Object[rowCount][colCount];
            for (int i = 0; i < rowCount; i++) {
                if (purcAdTab.getModel().getValueAt(i, 1) == null && purcAdTab.getModel().getValueAt(i, 2) == null && purcAdTab.getModel().getValueAt(i, 3) == null && purcAdTab.getModel().getValueAt(i, 4) == null); else if (purcAdTab.getModel().getValueAt(i, 16).equals(Boolean.TRUE)); else {
                    n++;
                }
            }
            values = new Object[n][colCount];
            int st = 0;
            for (int i = 0; i < rowCount; i++) {
                if (purcAdTab.getModel().getValueAt(i, 1) == null && purcAdTab.getModel().getValueAt(i, 2) == null && purcAdTab.getModel().getValueAt(i, 3) == null && purcAdTab.getModel().getValueAt(i, 4) == null); else if (purcAdTab.getModel().getValueAt(i, 16).equals(Boolean.TRUE)); else {
                    for (int j = 0; j < colCount; j++) {
                        values[st][j] = purcAdTab.getModel().getValueAt(i, j);
                    }
                    st++;
                }
            }
        } catch (Exception ex) {
            String ss = "  Class : PurcRtAdjTable Method : getTableValues    Exception : " + ex.getMessage();
            log.debug(ss);
        }
        return values;
    }

    public static void setIsInsValues() {
        int rowCount = purcAdTab.getModel().getRowCount();
        int colCount = purcAdTab.getModel().getColumnCount();
        int n = 0;
        try {
            for (int i = 0; i < rowCount; i++) {
                if (purcAdTab.getModel().getValueAt(i, 1) == null && purcAdTab.getModel().getValueAt(i, 2) == null && purcAdTab.getModel().getValueAt(i, 3) == null && purcAdTab.getModel().getValueAt(i, 4) == null); else {
                    purcAdTab.getModel().setValueAt(Boolean.TRUE, i, 18);
                }
            }

        } catch (Exception ex) {
            String ss = "  Class : PurcRtAdjTable Method : getTableValues    Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

    static void emptyTableValues() {
        int rowCount = purcAdTab.getModel().getRowCount();
        int colCount = purcAdTab.getModel().getColumnCount();
        try {
            for (int i = 0; i < rowCount; i++) {
                for (int j = 0; j < colCount; j++) {
                    if (purcAdTab.getModel().getValueAt(i, 1) == null); else {
                        purcAdTab.getModel().setValueAt(null, i, j);
                    }
                }
            }
        } catch (Exception ex) {
            String ss = "  Class : PurcRtAdjTable Method : getTableValues    Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

    public static void resetValues() {
        totPurcQty = 0;
        totPurcFreeQty = 0;
        totPurcItems = 0;
        totPurcAmt = 0.00;
        totPurcDistAmt = 0.0;
        totPurcVAT4Amt = 0.0;
        totPurcVAT12Amt = 0.0;
        amt = 0.00;
    }

    public static void focusSet() {
        purcAdTab.requestFocus();
        purcAdTab.changeSelection(0, 1, false, false);
        purcAdTab.getModel().setValueAt("1", 0, 0);
        purcAdTab.setCellSelectionEnabled(true);
    }

    public static void focusSet(int row, int col) {
        if (col >= 0 && col <= 14) {
            purcAdTab.requestFocus();
            purcAdTab.changeSelection(row, col, false, false);
            purcAdTab.setCellSelectionEnabled(true);
        } else {
        }
    }

    public static int total(int colNum) {
        int tot = 0;
        int colNo = colNum;
        for (int i = 0; i < purcAdTab.getModel().getRowCount(); i++) {
            if (purcAdTab.getModel().getValueAt(i, colNo) == null || purcAdTab.getModel().getValueAt(i, colNo).equals("")) {
                tot += 0;
            } else {
                tot += Double.parseDouble("" + purcAdTab.getModel().getValueAt(i, colNo));
            }
        }
        return tot;
    }

    public static double totalAmt() {
        purchaseCalculations();
        double tot = 0;
        int colNo = 15;
        for (int i = 0; i < purcAdTab.getModel().getRowCount(); i++) {
            if (purcAdTab.getModel().getValueAt(i, colNo) == null || purcAdTab.getModel().getValueAt(i, colNo).equals("")) {
                tot += 0;
            } else {
                tot += Double.parseDouble(String.valueOf(purcAdTab.getModel().getValueAt(i, colNo)));
            }
        }
        return tot;
    }

    public static int totalItems() {
        int tot = 0;
        for (int i = 0; i < purcAdTab.getModel().getRowCount(); i++) {
            if (purcAdTab.getModel().getValueAt(i, 2) == null || purcAdTab.getModel().getValueAt(i, 2) != ""); else {
                tot++;
            }
        }
        return tot;
    }

    public static int getDuplicates(int col) {
        int R = purcAdTab.getModel().getRowCount();
        int val = 0;
        try {

            for (int i = 0; i < R - 1; i++) {
                if (purcAdTab.getModel().getValueAt(i, col) == null || purcAdTab.getModel().getValueAt(i, col).equals("")); else {
                    String va = purcAdTab.getModel().getValueAt(i, col).toString();
                    for (int j = i + 1; j < R; j++) {
                        if (purcAdTab.getModel().getValueAt(j, col) == null || purcAdTab.getModel().getValueAt(j, col).equals("")); else {
                            String comp = purcAdTab.getModel().getValueAt(j, col).toString();
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
            String msg = "Class : PurcRtAdjTable Method  : getDuplicates  Exception:" + ex.getMessage();
            log.debug(msg);
        }
        return val;
    }

    public static void purchaseCalculations() {
        Value value = new Value();
        int rowCount = purcAdTab.getRowCount();
        purcQty = new int[rowCount];
        purcFreeQty = new int[rowCount];
        purcPrice = new double[rowCount];
        purcVAT4 = new double[rowCount];
        purcVAT12 = new double[rowCount];
        purcDist = new double[rowCount];
        purcSubTot = new double[rowCount];
        totPurcAmt = 0;
        totPurcDistAmt = 0;
        totPurcItems = 0;
        totPurcQty = 0;
        totPurcFreeQty = 0;
        totPurcVAT12Amt = 0.0;
        totPurcVAT4Amt = 0.0;
        try {
            for (int i = 0; i < rowCount; i++) {
                if ((purcAdTab.getModel().getValueAt(i, 1) == null || purcAdTab.getModel().getValueAt(i, 1).equals("")) && (purcAdTab.getModel().getValueAt(i, 2) == null || purcAdTab.getModel().getValueAt(i, 2).equals(""))) {
                    if (i == 0) {
                        nullVal = 0;
                    }
                } else {
                    nullVal = 1;
                    totPurcItems++;
                    if (purcAdTab.getModel().getValueAt(i, 4) == null || purcAdTab.getModel().getValueAt(i, 4).equals("")) {
                        purcQty[i] = 0;
                    } else {
                        purcQty[i] = Integer.parseInt(purcAdTab.getModel().getValueAt(i, 4).toString());
                    }
                    if (purcAdTab.getModel().getValueAt(i, 5) == null || purcAdTab.getModel().getValueAt(i, 5).equals("")) {
                        purcFreeQty[i] = 0;
                    } else {
                        purcFreeQty[i] = Integer.parseInt(purcAdTab.getModel().getValueAt(i, 5).toString());
                    }
                    totPurcQty += purcQty[i];
                    totPurcFreeQty += purcFreeQty[i];
                    if (purcAdTab.getModel().getValueAt(i, 9) == null || purcAdTab.getModel().getValueAt(i, 9).equals("")) {
                        purcPrice[i] = 0.0;
                    } else {
                        purcPrice[i] = Double.parseDouble("" + purcAdTab.getModel().getValueAt(i, 9));
                    }
                    Double purcMrp = 0.0;
                    purcMrp = ((purcAdTab.getModel().getValueAt(i, 10) == null || purcAdTab.getModel().getValueAt(i, 10).equals("")) ? 0.0 : Double.parseDouble("" + purcAdTab.getModel().getValueAt(i, 10)));
                    boolean isPrAdjust = false;
                    if (purcAdTab.getModel().getValueAt(i, 18) != null) {
                        isPrAdjust = Boolean.valueOf(purcAdTab.getModel().getValueAt(i, 18).toString());
                    }
                    purcSubTot[i] = value.Round(purcQty[i] * purcPrice[i], 2);
                    double ss = value.Round(purcSubTot[i], 2);
                    purcAdTab.getModel().setValueAt(value.Round(purcSubTot[i]), i, 15);
                    if (!isPrAdjust) {
                        totPurcAmt += ss;
                        if (purcAdTab.getModel().getValueAt(i, 13) == null || purcAdTab.getModel().getValueAt(i, 13).equals("")) {
                            purcDist[i] = 0;
                        } else {
                            purcDist[i] = value.Round(purcSubTot[i] * (Double.parseDouble("" + purcAdTab.getModel().getValueAt(i, 13)) / 100), 2);
                        }
                        totPurcDistAmt += value.Round(purcDist[i], 2);
                        Double purchVat = 0.00;
                        if (purcAdTab.getModel().getValueAt(i, 14) == null || purcAdTab.getModel().getValueAt(i, 14).equals("")) {
                            purcVAT4[i] = 0;
                            purcVAT12[i] = 0;
                        } else {                            
                            if (purcAdTab.getModel().getValueAt(i, 14).equals(0)) {
                                purcVAT4[i] = 0;                                
                            }  else {
                                if(purcAdTab.getModel().getValueAt(i, 14)!=null) {
                                purchVat = Double.parseDouble("" + purcAdTab.getModel().getValueAt(i, 14));
                                }
                                vat_calc_flag = Integer.parseInt(purcAdTab.getModel().getValueAt(i, 19).toString());
                                if(vat_calc_flag == 0) {
                                purcVAT4[i] = value.Round((purcSubTot[i] - purcDist[i]) * (purchVat / 100), 2);
                                }
                                else {
                                purcVAT4[i] = value.Round((purcQty[i]+purcFreeQty[i])*(purcMrp-(purcMrp/(1+purchVat/100))),2);
                                }
                            }
                        }
                        totPurcVAT4Amt += value.Round(purcVAT4[i], 2);
                    }
                }

            }
        } catch (Exception ex) {
            String ss = "  Class : PurcRtAdjTable Method : purchaseCalculations    Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }
}
