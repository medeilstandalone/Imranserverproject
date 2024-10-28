/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.Receipt;
import com.vanuston.medeil.model.ReceiptModel;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.Vector;
import javafx.stage.Alert;
import javax.swing.AbstractAction;
import javax.swing.InputMap;
import javax.swing.JComponent;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.KeyStroke;
import javax.swing.table.DefaultTableModel;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.util.Value;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;

public class RecptTable {

    static Logger log = Logger.getLogger(RecptTable.class, "Financial");

    public RecptTable() throws RemoteException, NotBoundException {
        
     //   receiptController = (Receipt) RegistryFactory.getClientStub(RegistryConstants.Receipt);
    }
    public static JTable recvTable;
    public static JScrollPane scrollPane = new JScrollPane();
    public static double totalAmt1 = 0.00;
    public static double totalDistAmt1 = 0.0;
    public static double totalAmounts = 0.0;
    public static String distName = "";
    public static int initR;
    public static KeyStroke save = KeyStroke.getKeyStroke(KeyEvent.VK_F3, 0);
    public static KeyStroke reset = KeyStroke.getKeyStroke(KeyEvent.VK_F4, 0);
    public static KeyStroke del = KeyStroke.getKeyStroke(KeyEvent.VK_F5, 0);
    public static KeyStroke update = KeyStroke.getKeyStroke(KeyEvent.VK_F7, 0);
    public static KeyStroke edit = KeyStroke.getKeyStroke(KeyEvent.VK_F6, 0);
    public static KeyStroke rR = KeyStroke.getKeyStroke(KeyEvent.VK_F12, 0);
    public static KeyStroke can = KeyStroke.getKeyStroke(KeyEvent.VK_F8, 0);
    public static KeyStroke back = KeyStroke.getKeyStroke(KeyEvent.VK_LEFT, KeyEvent.CTRL_MASK);
// Create Dynamic Table

    public JComponent createTable() {
        initR = 9;
        Object[] colName = {"S.No", "Bill No.", "Billed Date", "Billed Amount", "Billed Balance Amount", "Amount Paid"};
        final Class[] types1 = {java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.Double.class};
        final boolean[] canEditCols = {false, false, false, false, false, true};
        final int[] colWidth = {30, 100, 100, 137, 137, 137};
        recvTable = new JTable();
        Vector cols = new Vector();
        Vector data = new Vector();
        int len = colName.length;
        for (int i = 1; i <= 9; i++) {
            Vector c = new Vector();
            for (int j = 0; j < len; j++) {
                c.addElement(null);
//
            }
            data.addElement(c);
        }
        for (int i = 0; i < len; i++) {
            cols.addElement(colName[i]);
        }
        try {
//    recvTable.setModel(new DefaultTableModel(cols,data));
            recvTable.setModel(new javax.swing.table.DefaultTableModel(data, cols) {

                Class[] type = types1;
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
            String msg = "Class : RecptTable  Method : Create Table   = " + ex.getMessage();
            log.debug(msg);
        }

        recvTable.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        recvTable.setSelectionMode(0);
        recvTable.setShowGrid(true);
        recvTable.setDragEnabled(false);

        for (int i = 0; i < len; i++) {
            recvTable.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }

        recvTable.setGridColor(new java.awt.Color(204, 204, 255));
        recvTable.getTableHeader().setBackground(new Color(226, 238, 244));
        recvTable.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
        recvTable.setShowGrid(true);
        recvTable.setCellSelectionEnabled(true);
        recvTable.setColumnSelectionAllowed(false);
        recvTable.setRowHeight(20);
        recvTable.setSelectionBackground(Color.LIGHT_GRAY);
        recvTable.setSelectionForeground(Color.RED);
        recvTable.revalidate();
        recvTable.addMouseListener(new MouseAdapter() {

            @Override
            public void mouseClicked(MouseEvent e) {
                final int i = recvTable.getSelectedRow();
                final int j = recvTable.getSelectedColumn();
                final int rowCnt = recvTable.getRowCount();
                if (i == 0 && j == 0) {
                }

                int k = 0;
                for (k = 0; k < rowCnt; k++) {
                    recvTable.getModel().setValueAt(k + 1, k, 0);
                }
            }
        });
        recvTable.addKeyListener(new KeyListener() {

            @Override
            public void keyReleased(KeyEvent e) {
                final int i = recvTable.getSelectedRow();
                final int j = recvTable.getSelectedColumn();
                receiptCalculations();
                if (e.getKeyCode() == 10) {
                    InputMap im = recvTable.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                    KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                    KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                    im.put(enter, im.get(tab));
                }
                if (i >= 0) {

                    recvTable.getModel().setValueAt(i + 1, i, 0);

                    if (e.getKeyCode() == 10 || e.getKeyCode() == 9) {
                        InputMap im = recvTable.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);

                        KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                        KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                        im.put(enter, im.get(tab));
                        receiptCalculations();
                    }
                    if ((j == 1) && e.getKeyCode() != 27 || (j == 1 && e.getKeyCode() == KeyEvent.VK_TAB && e.getKeyCode() != 27)) {
                        try {
                            GetReceiptData getG = new GetReceiptData(recvTable);
                            getG.requestFocusInWindow();
                            getG.setVisible(true);
                            getG.requestFocus();
                        } catch (Exception exr) {
                            log.debug("Exception in Receipt Table = " + exr.getMessage());
                        }
                    }
                    if (i == recvTable.getModel().getRowCount() - 1) {
                        addRow();
                    }

                }
                receiptCalculations();
            }

            @Override
            public void keyPressed(KeyEvent e) {
                final int i = recvTable.getSelectedRow();
                final int j = recvTable.getSelectedColumn();
                InputMap im = recvTable.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                if (e.getKeyCode() == 10) {
                    KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                    KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                    im.put(enter, im.get(tab));
                }

                if (e.getKeyCode() == KeyEvent.VK_DELETE) {
                    recvTable.getModel().setValueAt("", i, j);
                }
                if (e.getKeyCode() == KeyEvent.VK_ESCAPE) {
                }
            }

            @Override
            public void keyTyped(KeyEvent e) {
            }
        });
        recvTable.getInputMap().put(save, "actionF2");
        recvTable.getInputMap().put(edit, "actionF2");
        recvTable.getInputMap().put(reset, "actionF2");
        recvTable.getInputMap().put(can, "actionF2");
        recvTable.getInputMap().put(update, "actionF2");
        recvTable.getInputMap().put(del, "actionF2");
        recvTable.getInputMap().put(back, "actionF2");
        recvTable.getInputMap().put(rR, "actionF2");
        recvTable.getActionMap().put("actionF2", new AbstractAction() {

            @Override
            public void actionPerformed(ActionEvent e) {
                recvTable.transferFocus();
            }
        });


        return recvTable;
    }

    public JComponent getScrollTable(JComponent jt) {
        recvTable = (JTable) jt;
        scrollPane.add(recvTable);
        scrollPane.setViewportView(recvTable);
        return scrollPane;
    }

    public void addRow() {
        DefaultTableModel model = (DefaultTableModel) recvTable.getModel();

        Vector datas = new Vector();

//    datas.addElement(recvTable.getRowCount()+1);
        for (int i = 0; i < recvTable.getModel().getColumnCount(); i++) {
            datas.addElement(null);
        }
        model.insertRow(recvTable.getRowCount(), datas);
//   model.insertRow(row, rowData);
    }

   public void removeRow() {
        int i = recvTable.getSelectedRow();
        int j = recvTable.getSelectedColumn();
        int rows = recvTable.getRowCount();
        try {
            if (recvTable.getModel().getValueAt(i, 1) != null) {
                if (i != -1) {
                    DefaultTableModel model = (DefaultTableModel) recvTable.getModel();
                    if (rows == 1) {
                        if (i == 0) {
                            model.removeRow(i);

                            for (int n = 0; n < initR; n++) {
                                addRow();
                            }
                            recvTable.changeSelection(0, 0, false, false);
                        }
                    } else {
                        model.removeRow(i);
                        int rows1 = recvTable.getRowCount();
                        if (i + 1 != rows) {
                            for (int n = 0; n < rows1; n++) {
                                if (recvTable.getModel().getValueAt(n, 0) == null); else {
                                    recvTable.getModel().setValueAt(n + 1, n, 0);
                                }
                            }
                            recvTable.changeSelection(i, j, false, false);
                        } else {
                            recvTable.changeSelection(i - 1, j, false, false);
                        }
                    }
                    getCounters();
                } else {
                    Alert.inform("Payment", "Please select row to remove ...");
                }
            } else {
                Alert.inform("Please Select Valid Row to Remove ...");
            }
        } catch (Exception ex) {
            String ss = "Method: removeRow    Exception : " + ex.getMessage();
            log.debug(ss);
        }

    }
    public void receiptCalculations() {
        try {
            final int rowCnt = recvTable.getRowCount();
            totalAmt1 = 0.0;
            totalDistAmt1 = 0.0;
            int k = 0;
            for (k = 0; k < rowCnt; k++) {
                String Balance = (String) recvTable.getModel().getValueAt(k, 3);
                String bill_no = "";
                bill_no = ""+ recvTable.getModel().getValueAt(k, 1);
                if (bill_no != null && bill_no.trim().length() > 0 && !bill_no.trim().equals("") && !bill_no.trim().equalsIgnoreCase("null")) {

                    Double bal = 0.0;
                    if (Balance != null && Balance.trim().length() > 0) {
                        bal = Double.valueOf(Balance);
                    }
                    Double sa = Double.parseDouble("" + recvTable.getModel().getValueAt(k, 5));
                    totalAmt1 += sa;
                    totalDistAmt1 += bal;
                }
            }
            totalDistAmt1 = Value.Round(totalDistAmt1, 2);
            totalAmt1 = Value.Round(totalAmt1, 2);

        } catch (Exception e) {            
            String msg = "Class : RecptTable  Method : receiptCalculations ()   = " + e.getMessage();
            log.debug(msg);
        }


    }

    public void clearData() {
        DefaultTableModel model = (DefaultTableModel) recvTable.getModel();
        model.getDataVector().removeAllElements();
        for (int in = 0; in < 10; in++) {
            addRow();
        }
        recvTable.clearSelection();
        recvTable.revalidate();
    }

    public void focusSet(int row) {
        recvTable.requestFocus();
        recvTable.changeSelection(row, 5, false, false);
        recvTable.setCellSelectionEnabled(true);
    }

    public void focusSet() {
        recvTable.requestFocus();
        recvTable.changeSelection(0, 0, false, false);
        recvTable.getModel().setValueAt("1", 0, 0);
        recvTable.setCellSelectionEnabled(true);
    }

    public void focusSet1() {
        recvTable.requestFocus();
        recvTable.getModel().setValueAt("1", 0, 0);
        recvTable.setCellSelectionEnabled(true);
    }

    public List getReceiptItems() {
        List<ReceiptModel> receiptItems = new ArrayList<ReceiptModel>();
        int rowCount = totalRow();

        
        ReceiptModel model;
        try {
            for (int index = 0; index < rowCount; index++) {

                if (!(recvTable.getModel().getValueAt(index, 1) == null)) {
                    model = new ReceiptModel();
                    model.setBillNumber(recvTable.getModel().getValueAt(index, 1).toString());
                    model.setBillDate(recvTable.getModel().getValueAt(index, 2).toString());
                    model.setBillAmount(Double.parseDouble(recvTable.getModel().getValueAt(index, 3).toString()));
                    model.setBillBalanceAmount(Double.parseDouble(recvTable.getModel().getValueAt(index, 4).toString()));
                    model.setPaidAmount((Double) recvTable.getModel().getValueAt(index, 5));
                    receiptItems.add(model);
                }
            }
        } catch (Exception e) {

            String ss = "Method: getSalesBillItems    Exception : " + e.getMessage();
            log.debug(ss);
        }

        return receiptItems;
    }

    public static int totalRow() {
        int tot = 0;
        for (int i = 0; i < recvTable.getModel().getRowCount(); i++) {
            if (recvTable.getModel().getValueAt(i, 2) != null) {
                tot++;
            }
        }
        return tot;
    }

    public void loadDReceiptTable(String dchid) {
        clearData();
        try {

            ReceiptModel recModel;
            ReceiptModel receiptModel = new ReceiptModel();
            receiptModel.setReceiptNumber(dchid);
            String sql = "SELECT   * FROM receipt where receipt_no='" + dchid + "' ";
            receiptModel.setQueryValue(sql);
             Receipt receiptController=(Receipt) RegistryFactory.getClientStub(RegistryConstants.Receipt);
            receiptModel = (ReceiptModel) receiptController.getReceiptTableValues(receiptModel);
            List<ReceiptModel> receiptList = new ArrayList<ReceiptModel>();
            receiptList = receiptModel.getListofitems();

            int index = 0;
            clearData();
            for (index = 0; index < receiptList.size(); index++) {
                addRow();
                recModel = receiptList.get(index);
                recvTable.getModel().setValueAt(recModel.getBillNumber(), index, 1);
                recvTable.getModel().setValueAt(recModel.getBillDate(), index, 2);
                recvTable.getModel().setValueAt(String.valueOf(recModel.getBillAmount()), index, 3);
                recvTable.getModel().setValueAt(String.valueOf(recModel.getBillBalanceAmount()), index, 4);
                recvTable.getModel().setValueAt(recModel.getPaidAmount(), index, 5);
                recvTable.getModel().setValueAt(index + 1, index, 0);
            }
            totalAmt1 = Value.Round(receiptModel.getTotalPaidAmount(), 2);
            totalDistAmt1 = Value.Round(receiptModel.getBalanceAmount(), 2);
            recvTable.clearSelection();
        } catch (Exception e) {
            String msg = "Class : PayTable  Method  : loadDReceiptTable() Exception: " + e.getMessage();
            log.debug(msg);
        }
    }

    public void getCounters() {

        try {
            final int rowCnt = recvTable.getRowCount();
            totalAmt1 = 0.0;
            int k = 0;
            for (k = 0; k < rowCnt; k++) {
                String Balance = (String) recvTable.getModel().getValueAt(k, 3);
                String bill_no = "";
                bill_no = (String) recvTable.getModel().getValueAt(k, 1);
                if (bill_no != null && bill_no.trim().length() > 0) {

                    Double bal = 0.0;
                    if (Balance != null && Balance.trim().length() > 0) {
                        bal = Double.valueOf(Balance);
                    }
                    Double sa = Double.parseDouble("" + recvTable.getModel().getValueAt(k, 5));
                    totalAmt1 += sa;
                    totalDistAmt1 += bal;
                }
            }
            totalDistAmt1 = Value.Round(totalDistAmt1, 2);
            totalAmt1 = Value.Round(totalAmt1, 2);
        } catch (Exception e) {
            String msg = "Class : RecptTable  Method : getCounters  = " + e.getMessage();
            log.debug(msg);
        }

    }
}
