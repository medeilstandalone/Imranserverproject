package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.PurchaseOrder;
import com.vanuston.medeil.model.PurchaseOrderModel;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import java.rmi.NotBoundException;
import javax.swing.table.DefaultTableModel;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.*;
import java.rmi.RemoteException;
import java.util.*;
import javax.swing.*;
import javafx.stage.Alert;

public class PurcOrderTable {

    public JTable PurcOrdTab;
    public String thisForm = null;
    public int initR;
    public JScrollPane scrollPane = new JScrollPane();
    public JComboBox jcoB = new JComboBox();
    public KeyStroke focusOut = KeyStroke.getKeyStroke(KeyEvent.VK_SPACE, KeyEvent.CTRL_MASK);
    public KeyStroke callTable = KeyStroke.getKeyStroke(KeyEvent.VK_T, KeyEvent.CTRL_MASK);
    public GetPurcDrugData g;
    public KeyStroke save = KeyStroke.getKeyStroke(KeyEvent.VK_F3, 0);
    public KeyStroke reset = KeyStroke.getKeyStroke(KeyEvent.VK_F4, 0);
    public KeyStroke del = KeyStroke.getKeyStroke(KeyEvent.VK_F5, 0);
    public KeyStroke update = KeyStroke.getKeyStroke(KeyEvent.VK_F7, 0);
    public KeyStroke edit = KeyStroke.getKeyStroke(KeyEvent.VK_F6, 0);
    public KeyStroke rR = KeyStroke.getKeyStroke(KeyEvent.VK_F12, 0);
    public KeyStroke can = KeyStroke.getKeyStroke(KeyEvent.VK_F8, 0);
    public KeyStroke back = KeyStroke.getKeyStroke(KeyEvent.VK_LEFT, KeyEvent.CTRL_MASK);
    Logger log = Logger.getLogger(PurcOrderTable.class, "Utilities");

    public JComponent createTable() throws RemoteException {
        final int initRow = 14;
        Object[] colName = {"S.No", "Item Code", "Item Name", "Dosage", "Qty.", "Packing No.'s"};
        final Class[] types = {java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.Integer.class, java.lang.Integer.class};
        final boolean[] canEditCols = {false, false, false, false, true, true};
        final int[] colWidth = {40, 150, 298, 110, 45, 85};
        initR = initRow;
        PurcOrdTab = new JTable();
        g = new GetPurcDrugData(PurcOrdTab, "PurcOrder");
        Vector cols = new Vector();
        Vector data = new Vector();
        int len = colName.length;
        for (int i = 0; i < initRow; i++) {
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
            PurcOrdTab.setModel(new javax.swing.table.DefaultTableModel(data, cols) {

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
        } catch (Exception e) {
            String ss = "Class: PurchaseOrderTable      Method: createTable    Exception : " + e.getMessage();
            log.debug(ss);
        }

        PurcOrdTab.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        PurcOrdTab.setSelectionMode(0);
        PurcOrdTab.getTableHeader().setBackground(new Color(226, 238, 244));
        PurcOrdTab.getTableHeader().setFont(new Font("Arial", Font.BOLD, 16));
        PurcOrdTab.setShowGrid(true);
        PurcOrdTab.getInputMap().put(focusOut, "focusOut");
        PurcOrdTab.getInputMap().put(callTable, "callTable");
        PurcOrdTab.getInputMap().put(save, "focusOut");
        PurcOrdTab.getInputMap().put(edit, "focusOut");
        PurcOrdTab.getInputMap().put(reset, "focusOut");
        PurcOrdTab.getInputMap().put(can, "focusOut");
        PurcOrdTab.getInputMap().put(update, "focusOut");
        PurcOrdTab.getInputMap().put(del, "focusOut");
        PurcOrdTab.getInputMap().put(back, "focusOut");
        PurcOrdTab.getInputMap().put(rR, "removeRow");

        PurcOrdTab.getActionMap().put("focusOut", new AbstractAction("focusOut") {

            @Override
            public void actionPerformed(ActionEvent evt) {
                PurcOrdTab.transferFocus();
            }
        });

        PurcOrdTab.getActionMap().put("removeRow", new AbstractAction("removeRow") {

            @Override
            public void actionPerformed(ActionEvent evt) {
                removeRow();
            }
        });

        PurcOrdTab.getActionMap().put("callTable", new AbstractAction("callTable") {

            @Override
            public void actionPerformed(ActionEvent evt) {
                g.refreshDrugTab();
            }
        });
        for (int i = 0; i < len; i++) {
            PurcOrdTab.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }
        PurcOrdTab.setGridColor(new java.awt.Color(204, 204, 255));
        PurcOrdTab.setCellSelectionEnabled(true);
        PurcOrdTab.setRowHeight(20);
        PurcOrdTab.setSelectionBackground(Color.LIGHT_GRAY);
        PurcOrdTab.setSelectionForeground(Color.RED);
        PurcOrdTab.revalidate();
        PurcOrdTab.addMouseListener(new MouseAdapter() {

            @Override
            public void mouseClicked(MouseEvent e) {
                final int i = PurcOrdTab.getSelectedRow();
                final int j = PurcOrdTab.getSelectedColumn();
                for (int val = 0; val < PurcOrdTab.getRowCount(); val++) {
                    if (val == 0) {
                        PurcOrdTab.getModel().setValueAt(val + 1, val, 0);
                    }
                    if (PurcOrdTab.getModel().getValueAt(val, 4) == null) {
                    } else {
                        if (PurcOrdTab.getModel().getValueAt(val, 4).equals(0) || PurcOrdTab.getModel().getValueAt(val, 4).equals("")) {
                            PurcOrdTab.changeSelection(val, 4, false, false);
                        } else if (PurcOrdTab.getModel().getValueAt(val, 5).equals(0) || PurcOrdTab.getModel().getValueAt(val, 5).equals("")) {
                            PurcOrdTab.changeSelection(val, 5, false, false);
                        }
                    }

                }
            }
        });
        PurcOrdTab.addKeyListener(new KeyAdapter() {

            @Override
            public void keyReleased(KeyEvent e) {
                final int i = PurcOrdTab.getSelectedRow();
                final int j = PurcOrdTab.getSelectedColumn();
                if (e.getKeyCode() == 10) {
                    InputMap im = PurcOrdTab.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                    KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                    KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                    im.put(enter, im.get(tab));
                }
                if ((j == 1 || j == 2) && e.getKeyCode() != 27) {
                    if (PurcOrdTab.getModel().getValueAt(i, 1) == null || PurcOrdTab.getModel().getValueAt(i, 2) == null) {
                        g.refreshDrugTab();
                    }
                }
            }

            @Override
            public void keyPressed(KeyEvent e) {
                final int i = PurcOrdTab.getSelectedRow();
                final int j = PurcOrdTab.getSelectedColumn();
                InputMap im = PurcOrdTab.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                if (e.getKeyCode() == 10) {
                    KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                    KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                    im.put(enter, im.get(tab));
                }
                if (e.getKeyCode() == 10 && j == 5) {
                    if (!PurcOrdTab.getModel().getValueAt(i, 1).equals("") && !PurcOrdTab.getModel().getValueAt(i, 2).equals("")) {
                        if (i == PurcOrdTab.getModel().getRowCount() - 1) {
                            addRow();
                        }
                        PurcOrdTab.changeSelection(i + 1, 0, false, false);
                        PurcOrdTab.getModel().setValueAt(i + 2, i + 1, 0);
                    } else {
                        PurcOrdTab.changeSelection(i, 4, false, false);
                    }
                }
                if (e.isActionKey()) {
                    for (int val = 0; val < PurcOrdTab.getRowCount(); val++) {
                        PurcOrdTab.getModel().setValueAt(val + 1, val, 0);
                        if (PurcOrdTab.getModel().getValueAt(val, 4) == null); else {
                            if (Integer.parseInt(PurcOrdTab.getModel().getValueAt(val, 4).toString()) == 0) {
                                PurcOrdTab.changeSelection(val, 4, false, false);
                                break;
                            }
                        }
                    }
                }
                if (e.getKeyCode() == KeyEvent.VK_DELETE || e.getKeyCode() == KeyEvent.VK_BACK_SPACE) {
                    if (PurcOrdTab.getModel().isCellEditable(i, j)) {
                        PurcOrdTab.getModel().setValueAt("", i, j);
                    }
                }
            }
        });
        return PurcOrdTab;
    }

    public JComponent getScrollTable(JComponent jt) {
        PurcOrdTab = (JTable) jt;
        scrollPane.add(PurcOrdTab);
        scrollPane.setViewportView(PurcOrdTab);
        return scrollPane;
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

    public List getPurchaseOrderBill() {
        List<PurchaseOrderModel> purcOrderBillItems = new ArrayList<PurchaseOrderModel>();
        int rowCount = PurcOrdTab.getRowCount();
        PurchaseOrderModel model;
        try {
            for (int index = 0; index < rowCount; index++) {
                if (!(PurcOrdTab.getModel().getValueAt(index, 1) == null)) {
                    model = new PurchaseOrderModel();
                    model.setPurcOrderIC("" + PurcOrdTab.getModel().getValueAt(index, 1));
                    model.setPurcOrderIN("" + PurcOrdTab.getModel().getValueAt(index, 2));
                    model.setPurcOrderDos("" + PurcOrdTab.getModel().getValueAt(index, 3));
                    model.setPurcOrderQty(returnInt("" + PurcOrdTab.getModel().getValueAt(index, 4)));
                    model.setPurcOrderPack(String.valueOf(returnInt("" + PurcOrdTab.getModel().getValueAt(index, 5))));
                    purcOrderBillItems.add(model);
                }
            }
        } catch (Exception e) {
            String ss = "Class: PurchaseOrderTable      Method: getPurchaseOrderBill    Exception : " + e.getMessage();
            log.debug(ss);
        }
        return purcOrderBillItems;
    }

    public void LoadPurchaseOrderTable(PurchaseOrderModel pobj) throws RemoteException, NotBoundException {
        PurchaseOrder purchaseOrderController = (PurchaseOrder) RegistryFactory.getClientStub(RegistryConstants.PurchaseOrder);
        clearData();
        PurchaseOrderModel purcModel = pobj;
        PurchaseOrderModel pModel;
        List<PurchaseOrderModel> purcOrderBill = new ArrayList<PurchaseOrderModel>();
        purcOrderBill = purcModel.getListofitems();
        int cnt = purcOrderBill.size();
        if (cnt > 14) {
            DefaultTableModel model = (DefaultTableModel) PurcOrdTab.getModel();
            model.getDataVector().removeAllElements();
            PurcOrdTab.revalidate();
            for (int j = 0; j < cnt; j++) {
                addRow();
            }
        }
        int index = 0;
        try {
            for (index = 0; index < purcOrderBill.size(); index++) {
                pModel = purcOrderBill.get(index);
                PurcOrdTab.getModel().setValueAt(index + 1, index, 0);
                PurcOrdTab.getModel().setValueAt(pModel.getPurcOrderIC(), index, 1);
                String item_code = pModel.getPurcOrderIC().toString();
                List itemDetails = new ArrayList();
                itemDetails = purchaseOrderController.getItemDetails(item_code);
                PurcOrdTab.getModel().setValueAt(itemDetails.get(0).toString(), index, 2);
                PurcOrdTab.getModel().setValueAt(itemDetails.get(1).toString(), index, 3);
                PurcOrdTab.getModel().setValueAt(pModel.getPurcOrderQty(), index, 4);
                PurcOrdTab.getModel().setValueAt(pModel.getPurcOrderPack(), index, 5);
            }
        } catch (Exception e) {
            String ss = "Class: PurchaseOrderTable      Method: LoadPurchaseOrderTable    Exception : " + e.getMessage();
            log.debug(ss);
        }
    }

    public void addRow() {
        DefaultTableModel model = (DefaultTableModel) PurcOrdTab.getModel();
        int row = PurcOrdTab.getRowCount();
        Vector datas = new Vector();
        for (int i = 0; i < PurcOrdTab.getModel().getColumnCount(); i++) {
            if (row == 0 && i == 0) {
                datas.addElement(i + 1);
            } else {
                datas.addElement(null);
            }
        }
        model.insertRow(PurcOrdTab.getRowCount(), datas);
    }

    public void removeRow() {
        int i = PurcOrdTab.getSelectedRow();
        int n = PurcOrdTab.getSelectedColumn();
        int rows = PurcOrdTab.getRowCount();
        if (PurcOrdTab.getModel().getValueAt(i, 1) != null) {
            if (i != -1) {
                DefaultTableModel model = (DefaultTableModel) PurcOrdTab.getModel();
                if (rows == 1) {
                    if (i == 0) {
                        model.removeRow(i);
                        for (int s = 0; n < initR; n++) {
                            addRow();
                        }
                        PurcOrdTab.changeSelection(0, 0, false, false);
                    }
                } else {
                    model.removeRow(i);
                    int rows1 = PurcOrdTab.getRowCount();
                    if (i + 1 != rows) {
                        for (int j = 0; j < rows1; j++) {
                            if (PurcOrdTab.getModel().getValueAt(j, 0) == null || PurcOrdTab.getModel().getValueAt(j, 0) == ""); else {
                                PurcOrdTab.getModel().setValueAt(j + 1, j, 0);
                            }
                        }
                        PurcOrdTab.changeSelection(i, n, false, false);
                    } else {
                        PurcOrdTab.changeSelection(i - 1, n, false, false);
                    }
                }
            } else {
                Alert.inform("Please Select Row to Remove ...");
            }
        } else {
            Alert.inform("Please Select Valid Row to Remove ...");
        }
    }

    public void clearData() {
        DefaultTableModel model = (DefaultTableModel) PurcOrdTab.getModel();
        model.getDataVector().removeAllElements();
        for (int i = 0; i < initR; i++) {
            addRow();
        }
        PurcOrdTab.revalidate();
    }

    public String[][] getTableValues() {
        int rowCount = PurcOrdTab.getModel().getRowCount();
        int colCount = PurcOrdTab.getModel().getColumnCount();
        String[][] values = new String[rowCount][colCount];
        for (int i = 0; i < rowCount; i++) {
            for (int j = 0; j < colCount; j++) {
                values[i][j] = "" + PurcOrdTab.getModel().getValueAt(i, j);
            }
        }
        return values;
    }

    public void focusSet() {
        PurcOrdTab.requestFocus();
        PurcOrdTab.changeSelection(0, 1, false, false);
        PurcOrdTab.getModel().setValueAt("1", 0, 0);
        PurcOrdTab.setCellSelectionEnabled(true);
    }

    public void focusSet(int row, int col) {
        PurcOrdTab.requestFocus();
        PurcOrdTab.changeSelection(row, col, false, false);
        PurcOrdTab.setCellSelectionEnabled(true);
    }

    public int total(int colNum) {
        int tot = 0;
        int colNo = colNum;
        for (int i = 0; i < PurcOrdTab.getModel().getRowCount(); i++) {
            if (PurcOrdTab.getModel().getValueAt(i, colNo) == null || PurcOrdTab.getModel().getValueAt(i, colNo).equals("")) {
                tot += 0;
            } else {
                tot += Integer.parseInt("" + PurcOrdTab.getModel().getValueAt(i, colNo));
            }
        }
        return tot;
    }

    public int totalItems() {
        int tot = 0;
        for (int i = 0; i < PurcOrdTab.getModel().getRowCount(); i++) {
            if (PurcOrdTab.getModel().getValueAt(i, 2) == null || PurcOrdTab.getModel().getValueAt(i, 2) == ""); else {
                tot++;
            }
        }
        return tot;
    }
}
