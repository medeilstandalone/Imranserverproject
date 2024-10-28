package com.vanuston.medeil.uitables;

import com.vanuston.medeil.model.PurchaseModel;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.DecimalFormatRenderer;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.PercentageFormatRenderer;
import com.vanuston.medeil.util.Value;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Vector;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import javafx.stage.Alert;

public class PurcRetTable {

    static Logger log = Logger.getLogger(PurcRetTable.class, "Utilities");
    DateUtils dutil = new DateUtils();
    
    public static JTable purcRTable;
    public static String thisForm = null;
    public static int initR;
    public JScrollPane scrollPane = new JScrollPane();
    public JComboBox jcoB = new JComboBox();
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
    public static int nullVal = 0;
    public static KeyStroke focusOut = KeyStroke.getKeyStroke(KeyEvent.VK_SPACE, KeyEvent.CTRL_MASK);
    public static KeyStroke focusOut1 = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, KeyEvent.CTRL_MASK);
    public static KeyStroke shrctF2 = KeyStroke.getKeyStroke(KeyEvent.VK_F2, 0);
    public static KeyStroke shrctF3 = KeyStroke.getKeyStroke(KeyEvent.VK_F3, 0);
    public static KeyStroke shrctF4 = KeyStroke.getKeyStroke(KeyEvent.VK_F4, 0);
    public static KeyStroke shrctF5 = KeyStroke.getKeyStroke(KeyEvent.VK_F5, 0);
    public static KeyStroke shrctF6 = KeyStroke.getKeyStroke(KeyEvent.VK_F6, 0);
    public static KeyStroke shrctF7 = KeyStroke.getKeyStroke(KeyEvent.VK_F7, 0);
    public static KeyStroke shrctF8 = KeyStroke.getKeyStroke(KeyEvent.VK_F8, 0);
    public static KeyStroke shrctF12 = KeyStroke.getKeyStroke(KeyEvent.VK_F12, 0);
    public static KeyStroke shrctCtrlC = KeyStroke.getKeyStroke(KeyEvent.VK_ESCAPE, KeyEvent.CTRL_MASK);
    public static KeyStroke shrctCtrlAr = KeyStroke.getKeyStroke(KeyEvent.VK_LEFT, KeyEvent.CTRL_MASK);
    public static KeyStroke shrctShDl = KeyStroke.getKeyStroke(KeyEvent.VK_DELETE, KeyEvent.SHIFT_MASK);
    public static KeyStroke callTable = KeyStroke.getKeyStroke(KeyEvent.VK_T, KeyEvent.CTRL_MASK);
    public static double amt = 0.00;
    public static int is = 0;
    public static int js = 0;

    public static JComponent createViewTable() {
        final int initRow = 8;
        Object[] colName = {"S.No.", "Product Name", "Formulation", "Mfr.", "Qty.", "Free", "Batch No.", "Expiry Date", "Packing No.'s", "Purchase Price", "MRP", "Disc %", "VAT %", "Total", "Item Code", "vat_calc_flag"};
        Class[] type = {java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.String.class,
            java.lang.Integer.class, java.lang.Integer.class, java.lang.String.class, java.lang.Object.class, java.lang.Integer.class,
            java.lang.Double.class, java.lang.Double.class, java.lang.Double.class, java.lang.Double.class, java.lang.Double.class, java.lang.String.class,java.lang.Integer.class};
        boolean[] canEdit = {false, false, false, false, true, true, false, false, false, true, true, true, true, false, false,false};
        int[] width = {30, 90, 48, 40, 40, 40, 70, 70, 50, 40, 40, 35, 35, 90, 0, 0};

        initR = initRow;
        final Class[] types = type;
        final boolean[] canEditCols = canEdit;
        final int[] colWidth = width;
        purcRTable = new JTable();
        Vector cols = new Vector();
        Vector data = new Vector();
        int len = colName.length;
        SimpleDateFormat sdf = new SimpleDateFormat("MM-yyyy");
        for (int i = 0; i < initRow; i++) {
            Vector c = new Vector();
            for (int j = 0; j < len; j++) {
                if (j == 13) {
                    c.addElement("");
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
            purcRTable.setModel(new javax.swing.table.DefaultTableModel(data, cols) {

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
            String ss = "    Method: Create Table    Exception : " + ex.getMessage();
            log.debug(ss);
        }
        for (int i = 0; i < len; i++) {
            purcRTable.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }
        purcRTable.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        purcRTable.setSelectionMode(0);
        purcRTable.getTableHeader().setBackground(new Color(226, 238, 244));
        purcRTable.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
        purcRTable.setShowGrid(true);
        purcRTable.getTableHeader().setReorderingAllowed(false);
        purcRTable.getColumnModel().getColumn(13).setCellRenderer(new DecimalFormatRenderer());
        purcRTable.getColumnModel().getColumn(12).setCellRenderer(new PercentageFormatRenderer());
        purcRTable.getColumnModel().getColumn(11).setCellRenderer(new PercentageFormatRenderer());
        purcRTable.removeColumn(purcRTable.getColumnModel().getColumn(15));
        purcRTable.removeColumn(purcRTable.getColumnModel().getColumn(14));
        purcRTable.putClientProperty("terminateEditOnFocusLost", Boolean.TRUE);
        purcRTable.getInputMap().put(focusOut, "focusOut");
        purcRTable.getInputMap().put(focusOut1, "focusOut");
        purcRTable.getInputMap().put(shrctF2, "focusOut");
        purcRTable.getInputMap().put(shrctF3, "focusOut");
        purcRTable.getInputMap().put(shrctF4, "focusOut");
        purcRTable.getInputMap().put(shrctF5, "focusOut");
        purcRTable.getInputMap().put(shrctF6, "focusOut");
        purcRTable.getInputMap().put(shrctF7, "focusOut");
        purcRTable.getInputMap().put(shrctF8, "focusOut");
        purcRTable.getInputMap().put(shrctCtrlC, "focusOut");
        purcRTable.getInputMap().put(shrctCtrlAr, "focusOut");
        purcRTable.getInputMap().put(shrctShDl, "focusOut");
        purcRTable.getInputMap().put(shrctF12, "removeRow");

        purcRTable.getActionMap().put("removeRow", new AbstractAction("removeRow") {

            @Override
            public void actionPerformed(ActionEvent evt) {
                removeRow();
            }
        });
        purcRTable.getActionMap().put("focusOut", new AbstractAction("focusOut") {

            @Override
            public void actionPerformed(ActionEvent evt) {
                purcRTable.clearSelection();
                purcRTable.transferFocus();
            }
        });
        purcRTable.setGridColor(new java.awt.Color(204, 204, 255));
        purcRTable.setCellSelectionEnabled(true);
        purcRTable.setRowHeight(25);
        purcRTable.setSelectionBackground(Color.LIGHT_GRAY);
        purcRTable.setSelectionForeground(Color.RED);
        purcRTable.revalidate();
        purcRTable.addMouseListener(new MouseAdapter() {

            @Override
            public void mouseClicked(MouseEvent e) {
                final int i = purcRTable.getSelectedRow();
                final int j = purcRTable.getSelectedColumn();
                purchaseCalculations();
                try {
                    for (int val = 0; val < purcRTable.getRowCount(); val++) {
                        if (purcRTable.getModel().getValueAt(val, 4) == null);
                        /*else {
                            if (purcRTable.getModel().getValueAt(val, 4).equals("")) {
                                purcRTable.changeSelection(val, 4, false, false);
                            }
                        }*/
                    }
                } catch (Exception ex) {
                    String ss = "    Method: tableMouseClicked    Exception : " + ex.getMessage();
                    log.debug(ss);
                }
            }
        });
        purcRTable.addKeyListener(new KeyListener() {

            @Override
            public void keyReleased(KeyEvent e) {
                try {
                    final int i = purcRTable.getSelectedRow();
                    final int j = purcRTable.getSelectedColumn();
                    purchaseCalculations();
                    if (e.getKeyCode() == 10) {
                        InputMap im = purcRTable.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                        KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                        KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                        im.put(enter, im.get(tab));
                    }
                    if (j == 5) {
                        if (purcRTable.getModel().getValueAt(i, 4) == null || purcRTable.getModel().getValueAt(i, 4).toString().trim().length() <= 0) {
                            purcRTable.changeSelection(i, 4, false, false);
                        }
                    }
                    if (j == 6) {
                        if (purcRTable.getModel().getValueAt(i, 5) == null) {
                            purcRTable.changeSelection(i, 5, false, false);
                        }
                    }
                    if (j == 7) {
                        if (purcRTable.getModel().getValueAt(i, 6) == null) {
                            purcRTable.changeSelection(i, 6, false, false);
                        }
                    }
                    if (j == 8) {
                        if (purcRTable.getModel().getValueAt(i, 7) == null) {
                            purcRTable.changeSelection(i, 7, false, false);
                        }
                    }
                    if (j == 9) {
                        if (purcRTable.getModel().getValueAt(i, 8) == null) {
                            purcRTable.changeSelection(i, 8, false, false);
                        }
                    }
                    if (j == 10) {
                        if (purcRTable.getModel().getValueAt(i, 9) == null) {
                            purcRTable.changeSelection(i, 9, false, false);
                        }
                    }
                    if (j == 11) {
                        if (purcRTable.getModel().getValueAt(i, 10) == null) {
                            purcRTable.changeSelection(i, 10, false, false);
                        }
                    }
                    if (j == purcRTable.getColumnModel().getColumnCount() - 1) {
                        double dis = 0;
                        double vat = 0;
                        if (vat == 0 || vat == 4 || vat == 12.5) {
                            purcRTable.changeSelection(i + 1, 0, false, false);
                            purcRTable.getModel().setValueAt(i + 2, i + 1, 0);
                        } else {
                            purcRTable.changeSelection(i, purcRTable.getColumnModel().getColumnCount() - 3, false, false);
                            Alert.inform("Purchase Invoice", "Vat % is only 4 or 12.5 only allowed ");
                        }
                    }
                } catch (Exception ex) {
                    String ss = "    Method: tablekeyReleased    Exception : " + ex.getMessage();
                    log.debug(ss);
                }
            }

            @Override
            public void keyPressed(KeyEvent e) {
                final int i = purcRTable.getSelectedRow();
                final int j = purcRTable.getSelectedColumn();
                try {
                    InputMap im = purcRTable.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                    if (e.getKeyCode() == 10) {
                        KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                        KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                        im.put(enter, im.get(tab));
                    }
                    if (e.isActionKey()) {
                        for (int val = 0; val < purcRTable.getRowCount(); val++) {
                            if (purcRTable.getModel().getValueAt(val, 4) == null); else {
                                if (Integer.parseInt(purcRTable.getModel().getValueAt(val, 4).toString()) == 0) {
                                    purcRTable.changeSelection(val, 4, false, false);
                                    break;
                                }
                            }
                        }
                    }
                    if (e.getKeyCode() == KeyEvent.VK_DELETE || e.getKeyCode() == KeyEvent.VK_BACK_SPACE) {
                        if (purcRTable.getModel().isCellEditable(i, j)) {
                            purcRTable.getModel().setValueAt("", i, j);
                        }
                    }
                } catch (Exception ex) {
                    String ss = "    Method: tablekeyPressed    Exception : " + ex.getMessage();
                    log.debug(ss);
                }
            }

            @Override
            public void keyTyped(KeyEvent e) {
            }
        });
        return purcRTable;
    }

    public JComponent getScrollTable(JComponent jt) {
        purcRTable = (JTable) jt;
        scrollPane.add(purcRTable);
        scrollPane.setViewportView(purcRTable);
        return scrollPane;
    }

    public static void addRow() {
        try {
            DefaultTableModel model = (DefaultTableModel) purcRTable.getModel();
            int row = purcRTable.getRowCount();
            Vector datas = new Vector();
            for (int i = 0; i < purcRTable.getModel().getColumnCount(); i++) {
                if (row == 0 && i == 0) {
                    datas.addElement(i + 1);
                } else {
                    datas.addElement(null);
                }
            }
            model.insertRow(purcRTable.getRowCount(), datas);
            purchaseCalculations();
        } catch (Exception ex) {
            String ss = "    Method: removeRow    Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

    public static void removeRow() {
        int i = purcRTable.getSelectedRow();
        int j = purcRTable.getSelectedColumn();
        int rows = purcRTable.getRowCount();
        try {
            if (i != -1) {
                DefaultTableModel model = (DefaultTableModel) purcRTable.getModel();
                if (rows == 1) {
                    if (i == 0) {
                        model.removeRow(i);
                        resetValues();
                        for (int n = 0; n < initR; n++) {
                            addRow();
                        }
                        purcRTable.changeSelection(0, 0, false, false);
                    }
                } else {
                    model.removeRow(i);
                    int rows1 = purcRTable.getRowCount();
                    if (i + 1 != rows) {
                        for (int n = 0; n < rows1; n++) {
                            if (purcRTable.getModel().getValueAt(n, 0) == null); else {
                                purcRTable.getModel().setValueAt(n + 1, n, 0);
                            }
                        }
                        purcRTable.changeSelection(i, j, false, false);
                    } else {
                        purcRTable.changeSelection(i - 1, j, false, false);
                    }
                }
                purchaseCalculations();
            } else {
                Alert.inform("Purchase Invoice", "Please select row to remove ...");
            }
        } catch (Exception ex) {
            String ss = "    Method: removeRow    Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

    public void removeRows(int i) {
        int RCount = purcRTable.getRowCount();
        try {
            if (i >= 0 || i < RCount) {
                ((DefaultTableModel) purcRTable.getModel()).removeRow(i);
            }
            purchaseCalculations();
        } catch (Exception ex) {
            String ss = "    Method: removeRows with argument    Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

    public void clearData() {
        DefaultTableModel model = (DefaultTableModel) purcRTable.getModel();
        model.getDataVector().removeAllElements();
        try {
            for (int n = 0; n < initR; n++) {
                addRow();
            }
            purchaseCalculations();
        } catch (Exception ex) {
            String ss = "    Method: clearData    Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

    public void insertPurchaseData(String invNO) throws RemoteException, NotBoundException {
        clearData();
        new GetPurcReturnDatas(purcRTable, "Purchase", invNO).setVisible(true);
        purchaseCalculations();
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

    public List<PurchaseModel> getPurchaseReturnBill() {
        List<PurchaseModel> purcRBillItems = new ArrayList<PurchaseModel>();
        int rowCount = purcRTable.getRowCount();
        PurchaseModel model;
        try {
            for (int index = 0; index < rowCount; index++) {
                if (!(purcRTable.getModel().getValueAt(index, 1) == null)) {
                    model = new PurchaseModel();
                    model.setItemName("" + purcRTable.getModel().getValueAt(index, 1));
                    model.setMfrName("" + purcRTable.getModel().getValueAt(index, 3));
                    model.setQuantity(returnInt("" + purcRTable.getModel().getValueAt(index, 4)));
                    model.setFree(returnInt("" + purcRTable.getModel().getValueAt(index, 5)));
                    model.setBatch("" + purcRTable.getModel().getValueAt(index, 6));
                    String edate = dutil.now("yy-MM");
                    if (purcRTable.getModel().getValueAt(index, 7) != null || purcRTable.getModel().getValueAt(index, 7) != "") {
                        Date ss = dutil.normalExpDateStringToDate(purcRTable.getModel().getValueAt(index, 7).toString());
                        edate = new SimpleDateFormat("yyyy-MM-dd").format(ss);
                    }
                    model.setExpdate(edate);
                    model.setPacking("" + purcRTable.getModel().getValueAt(index, 8));
                    model.setUnitprice(returnDouble("" + purcRTable.getModel().getValueAt(index, 9)));
                    model.setMrp(returnDouble("" + purcRTable.getModel().getValueAt(index, 10)));
                    model.setUnitDis(returnDouble("" + purcRTable.getModel().getValueAt(index, 11)));
                    model.setUnitVat(returnDouble("" + purcRTable.getModel().getValueAt(index, 12)));
                    model.setTotVal(returnDouble("" + purcRTable.getModel().getValueAt(index, 13)));
                    model.setItemCode("" + purcRTable.getModel().getValueAt(index, 14));
                    purcRBillItems.add(model);
                }
            }
        } catch (Exception e) {
            String ss = "Class: PurchaseReturnTable      Method: getPurchaseReturnBill2    Exception : " + e.getMessage();
            log.debug(ss);
        }
        return purcRBillItems;
    }

    public void LoadPurchaseReturnTable(PurchaseModel tableVal) {
        PurchaseModel purcModel = tableVal;
        PurchaseModel pModel;
        List<PurchaseModel> purcRBill = new ArrayList<PurchaseModel>();
        purcRBill = purcModel.getListofitems();
        int cnt = purcRBill.size();
        if (cnt > 8) {
            DefaultTableModel model = (DefaultTableModel) purcRTable.getModel();
            model.getDataVector().removeAllElements();
            purcRTable.revalidate();
            for (int j = 0; j < cnt; j++) {
                addRow();
            }
        }
        int index = 0;
        try {
            for (index = 0; index < purcRBill.size(); index++) {
                pModel = purcRBill.get(index);
                purcRTable.getModel().setValueAt(index + 1, index, 0);
                purcRTable.getModel().setValueAt(pModel.getItemName(), index, 1);
                purcRTable.getModel().setValueAt(pModel.getFormulation(), index, 2);
                purcRTable.getModel().setValueAt(pModel.getMfrName(), index, 3);
                purcRTable.getModel().setValueAt(pModel.getQuantity(), index, 4);
                purcRTable.getModel().setValueAt(pModel.getFree(), index, 5);
                purcRTable.getModel().setValueAt(pModel.getBatch(), index, 6);
                purcRTable.getModel().setValueAt(dutil.normalFormatExpDate(pModel.getExpdate()), index, 7);
                purcRTable.getModel().setValueAt(pModel.getPacking(), index, 8);
                purcRTable.getModel().setValueAt(pModel.getUnitprice(), index, 9);
                purcRTable.getModel().setValueAt(pModel.getMrp(), index, 10);
                purcRTable.getModel().setValueAt(pModel.getUnitDis(), index, 11);
                purcRTable.getModel().setValueAt(pModel.getUnitVat(), index, 12);
                purcRTable.getModel().setValueAt(pModel.getTotVal(), index, 13);
                purcRTable.getModel().setValueAt(pModel.getItemCode(), index, 14);
                purcRTable.getModel().setValueAt(pModel.getPurc_adj_flagid(), index, 15);
            }
        } catch (Exception e) {
            String ss = "Class: PurchaseRetTable      Method: LoadPurchaseReturnTable    Exception : " + e.getMessage();
            log.debug(ss);
        }
    }

    void emptyTableValues() {
        int rowCount = purcRTable.getModel().getRowCount();
        int colCount = purcRTable.getModel().getColumnCount();
        try {
            for (int i = 0; i < rowCount; i++) {
                for (int j = 0; j < colCount; j++) {
                    if (purcRTable.getModel().getValueAt(i, 1) == null); else {
                        purcRTable.getModel().setValueAt(null, i, j);
                    }
                }
            }
            purchaseCalculations();
        } catch (Exception ex) {
            String ss = "    Method: getTableValues    Exception : " + ex.getMessage();
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
//-        totPurcVAT12Amt = 0.0;
        amt = 0.00;
    }

    public void focusSet() {
        purcRTable.requestFocus();
        purcRTable.changeSelection(0, 0, false, false);
        purcRTable.changeSelection(0, 1, false, false);
        purcRTable.getModel().setValueAt("1", 0, 0);
        purcRTable.setCellSelectionEnabled(true);
    }

    public void focusSet(int row, int col) {
        if (col >= 0 && col <= 13) {
            purcRTable.requestFocus();

            if (col != 0) {
                purcRTable.changeSelection(row, (col - 1), false, false);
            } else {
                purcRTable.changeSelection(row, (col + 1), false, false);
            }

            purcRTable.changeSelection(row, col, false, false);
            purcRTable.setCellSelectionEnabled(true);
        } else {
        }
    }

    public int total(int colNum) {
        int tot = 0;
        int colNo = colNum;
        for (int i = 0; i < purcRTable.getModel().getRowCount(); i++) {
            if (purcRTable.getModel().getValueAt(i, colNo) == null || purcRTable.getModel().getValueAt(i, colNo).equals("")) {
                tot += 0;
            } else {
                tot += Double.parseDouble("" + purcRTable.getModel().getValueAt(i, colNo));
            }
        }
        return tot;
    }

    public int totalItems() {
        int tot = 0;
        for (int i = 0; i < purcRTable.getModel().getRowCount(); i++) {
            if (purcRTable.getModel().getValueAt(i, 2) == null || purcRTable.getModel().getValueAt(i, 2) != ""); else {
                tot++;
            }
        }
        return tot;
    }

    public int getDuplicates(int col) {
        int R = purcRTable.getModel().getRowCount();
        int val = 0;
        try {

            for (int i = 0; i < R - 1; i++) {
                if (purcRTable.getModel().getValueAt(i, col) == null || purcRTable.getModel().getValueAt(i, col).equals("")); else {
                    String va = purcRTable.getModel().getValueAt(i, col).toString();
                    for (int j = i + 1; j < R; j++) {
                        if (purcRTable.getModel().getValueAt(j, col) == null || purcRTable.getModel().getValueAt(j, col).equals("")); else {
                            String comp = purcRTable.getModel().getValueAt(j, col).toString();
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
            String msg = "Class : PurcRetTable Method  : getDuplicates  Exception:" + ex.getMessage();
            log.debug(msg);
        }
        return val;
    }

    public static void purchaseCalculations() {
        Value value = new Value();
        int rowCount = purcRTable.getRowCount();
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
        totPurcVAT4Amt = 0.0;
        try {
            for (int i = 0; i < rowCount; i++) {
                if ((purcRTable.getModel().getValueAt(i, 1) == null || purcRTable.getModel().getValueAt(i, 1).equals("")) && (purcRTable.getModel().getValueAt(i, 2) == null || purcRTable.getModel().getValueAt(i, 2).equals("")) || (purcRTable.getModel().getValueAt(i, 4) == null || purcRTable.getModel().getValueAt(i, 4).equals(""))) {
                    if (i == 0) {
                        nullVal = 0;
                    }
                } else {
                    nullVal = 1;
                    totPurcItems++;
                    if (!purcRTable.getModel().getValueAt(i, 4).equals("")) {
                        if (purcRTable.getModel().getValueAt(i, 4) == null || purcRTable.getModel().getValueAt(i, 4).equals("")) {
                            purcQty[i] = 0;
                        } else {
                            purcQty[i] = Integer.parseInt(purcRTable.getModel().getValueAt(i, 4).toString());
                        }
                        if (purcRTable.getModel().getValueAt(i, 5) == null || purcRTable.getModel().getValueAt(i, 5).equals("")) {
                            purcFreeQty[i] = 0;
                        } else {
                            purcFreeQty[i] = Integer.parseInt(purcRTable.getModel().getValueAt(i, 5).toString());
                        }
                        totPurcQty += purcQty[i];
                        totPurcFreeQty += purcFreeQty[i];
                        if (purcRTable.getModel().getValueAt(i, 9) == null || purcRTable.getModel().getValueAt(i, 9).equals("")) {
                            purcPrice[i] = 0.0;
                        } else {
                            purcPrice[i] = Double.parseDouble("" + purcRTable.getModel().getValueAt(i, 9));
                        }
                        Double purcMrp = 0.0;
                        purcMrp = ((purcRTable.getModel().getValueAt(i, 10) == null || purcRTable.getModel().getValueAt(i, 10).equals("")) ? 0.0 : Double.parseDouble("" + purcRTable.getModel().getValueAt(i, 10)));
                        purcSubTot[i] = value.Round(purcQty[i] * purcPrice[i], 2);
                        double ss = value.Round(purcSubTot[i], 2);
                        purcRTable.getModel().setValueAt(value.Round(purcSubTot[i]), i, 13);
                        totPurcAmt += ss;
                        if (purcRTable.getModel().getValueAt(i, 11) == null || purcRTable.getModel().getValueAt(i, 11).equals("")) {
                            purcDist[i] = 0;
                        } else {
                            purcDist[i] = value.Round(purcSubTot[i] * (Double.parseDouble("" + purcRTable.getModel().getValueAt(i, 11)) / 100), 2);
                        }
                        totPurcDistAmt += value.Round(purcDist[i], 2);
                        Double purchVat = 0.00;
                        if (purcRTable.getModel().getValueAt(i, 12) == null) {
                            purcVAT4[i] = 0;
                            purcVAT12[i] = 0;
                        } else {
                            if (purcRTable.getModel().getValueAt(i, 12).equals(0)) {
                                purcVAT4[i] = 0;
                                purcVAT12[i] = 0;
                            } else {
                                purchVat = Double.parseDouble("" + purcRTable.getModel().getValueAt(i, 12));
                                int vat_calc_flag = Integer.parseInt(purcRTable.getModel().getValueAt(i, 15).toString());
                                if(vat_calc_flag == 0) {
                                purcVAT4[i] = value.Round((purcSubTot[i] - purcDist[i]) * (purchVat / 100), 2);
                                }
                                else {
                                purcVAT4[i] = value.Round((purcQty[i]+purcFreeQty[i])*(purcMrp-(purcMrp/(1+purchVat/100))),2);
                                }
                            }
                        }
                        totPurcVAT4Amt += value.Round(purcVAT4[i], 2);
                    } else {
                        purcRTable.changeSelection(i, 4, false, false);
                        break;
                    }
                }
            }
        } catch (Exception ex) {
            String ss = "    Method: purchaseCalculations    Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }
}
