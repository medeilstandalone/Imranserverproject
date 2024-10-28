package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;

import com.vanuston.medeil.implementation.ChequeTransaction;
import com.vanuston.medeil.model.ChequeTransactionModel;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.List;
import java.util.Vector;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;

public class ChequeTransactionTable {

    static Logger log = Logger.getLogger(ChequeTransactionTable.class, "Utilities");


    public ChequeTransactionTable() throws RemoteException, NotBoundException {
       // chequeTxnController = (ChequeTransaction) RegistryFactory.getClientStub(RegistryConstants.ChequeTransaction);
    }
    public static JTable chequeTransTable;
    public static JScrollPane chequeTansScrollPane = new JScrollPane();
    public static KeyStroke callchequeTransTable = KeyStroke.getKeyStroke(KeyEvent.VK_T, KeyEvent.CTRL_MASK);
    public static KeyStroke callStockfocusOut = KeyStroke.getKeyStroke(KeyEvent.VK_SPACE, KeyEvent.CTRL_MASK);
    public static String stockId;
    public static String rowselt = "-1";
    public static KeyStroke save = KeyStroke.getKeyStroke(KeyEvent.VK_F3, 0);
    public static KeyStroke reset = KeyStroke.getKeyStroke(KeyEvent.VK_F4, 0);
    public static KeyStroke del = KeyStroke.getKeyStroke(KeyEvent.VK_F5, 0);
    public static KeyStroke update = KeyStroke.getKeyStroke(KeyEvent.VK_F7, 0);
    public static KeyStroke edit = KeyStroke.getKeyStroke(KeyEvent.VK_F6, 0);
    public static KeyStroke rR = KeyStroke.getKeyStroke(KeyEvent.VK_F12, 0);
    public static KeyStroke can = KeyStroke.getKeyStroke(KeyEvent.VK_F8, 0);
    public static KeyStroke back = KeyStroke.getKeyStroke(KeyEvent.VK_LEFT, KeyEvent.CTRL_MASK);

    public JComponent createTable() {
        Object[] colName = {"S.No", "Cheque No.", "Issued Date", "Deposited Date", "Transaction Type", "Payee.", "Amount", "A/c No.", "Bank Name", "Status", "Cleared Date"};
        final Class[] types = {java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class};
        final boolean[] canEditCols = {false, false, false, false, false, false, false, false, false, false, false};
        final int[] colWidth = {40, 120, 60, 60, 60, 110, 60, 70, 70, 60, 60};
        chequeTransTable = new JTable();
        Vector cols = new Vector();
        Vector data = new Vector();
        int len = colName.length;
        for (int i = 0; i < 8; i++) {
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
            chequeTransTable.setModel(new javax.swing.table.DefaultTableModel(data, cols) {

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
            String msg = "Class : chequeTransTable  Method : createTable   Exception:" + ex.getMessage();
            log.debug(msg);
        }
        chequeTransTable.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        chequeTransTable.getTableHeader().setBackground(new Color(226, 238, 244));
        chequeTransTable.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
        chequeTransTable.setShowGrid(true);
        chequeTransTable.getTableHeader().setReorderingAllowed(false);

        //   chequeTransTable.removeColumn(chequeTransTable.getColumnModel().getColumn(0));

        for (int i = 0; i < len; i++) {
            chequeTransTable.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }
        chequeTransTable.removeColumn(chequeTransTable.getColumnModel().getColumn(0));
        chequeTransTable.setGridColor(new java.awt.Color(204, 204, 255));
        chequeTransTable.setCellSelectionEnabled(false);
        chequeTransTable.setRowSelectionAllowed(true);
        chequeTransTable.getInputMap().put(save, "actionF2");
        chequeTransTable.getInputMap().put(edit, "actionF2");
        chequeTransTable.getInputMap().put(reset, "actionF2");
        chequeTransTable.getInputMap().put(can, "actionF2");
        chequeTransTable.getInputMap().put(update, "actionF2");
        chequeTransTable.getInputMap().put(del, "actionF2");
        chequeTransTable.getInputMap().put(back, "actionF2");
        chequeTransTable.getInputMap().put(rR, "actionF2");
        chequeTransTable.getActionMap().put("actionF2", new AbstractAction() {

            @Override
            public void actionPerformed(ActionEvent e) {
                chequeTransTable.transferFocus();
            }
        });
        chequeTransTable.setRowHeight(20);
        chequeTransTable.setSelectionBackground(Color.LIGHT_GRAY);
        chequeTransTable.setSelectionForeground(Color.RED);
        chequeTransTable.revalidate();
        loadChequeTransactionValues(10);
        chequeTransTable.addKeyListener(new KeyListener() {

            @Override
            public void keyReleased(KeyEvent e) {
              viewChequeCalculations();
            }

            @Override
            public void keyTyped(KeyEvent e) {
            }

            @Override
            public void keyPressed(KeyEvent e) {
            }
        });
        chequeTransTable.addMouseListener(new MouseListener() {

            @Override
            public void mouseClicked(MouseEvent e) {
                viewChequeCalculations();


            }

            @Override
            public void mousePressed(MouseEvent e) {
            }

            @Override
            public void mouseReleased(MouseEvent e) {
                viewChequeCalculations();
            }

            @Override
            public void mouseEntered(MouseEvent e) {
            }

            @Override
            public void mouseExited(MouseEvent e) {
            }
        });

        chequeTansScrollPane.add(chequeTransTable);
        chequeTansScrollPane.setViewportView(chequeTransTable);
        return chequeTransTable;
    }

    public JComponent getScrollTable(JComponent jt) {
        chequeTransTable = (JTable) jt;
        chequeTansScrollPane.add(chequeTransTable);
        chequeTansScrollPane.setViewportView(chequeTransTable);
        return chequeTansScrollPane;
    }

    public void viewChequeCalculations() {
        final int i = chequeTransTable.getSelectedRow();
        stockId = (String) chequeTransTable.getModel().getValueAt(i, 0);
        String status = (String) chequeTransTable.getModel().getValueAt(i, 9);
        if (status.equals("Cleared")) {
            stockId = "-1";
        }
        rowselt = stockId;
    }

    public String loadChequeTransactionValues(int n) {
        String recordCountLabel = "";
        try {

            String sql = "SELECT  *  FROM cheque_transaction where chq_flag_id!=0 order by chq_id desc limit 0," + n + ";";
            recordCountLabel = loadTableValues(sql);
        } catch (Exception e) {
            String msg = "Class : chequeTransTable  Method : loadChequeTransactionValues  Exception: " + e.getMessage();
            log.debug(msg);

        }
        return recordCountLabel;
    }

    public String searchChequeTransactionValues(String chequeStatus, String fromDate, String endDate) {
        String recordCountLabel = "";
        try {

            String sql = "";
            if (chequeStatus != null) {
                chequeStatus = chequeStatus.trim();
            }
            if (chequeStatus == null || chequeStatus.length() <= 0) {
                sql = "SELECT  *  FROM cheque_transaction where chq_flag_id!=8   order by chq_id desc  ";
            } else if (fromDate == null && endDate == null && chequeStatus != null) {
                sql = "SELECT  *  FROM cheque_transaction where chq_flag_id!=8 and chq_status='" + chequeStatus + "'    order by chq_id desc  ";
            } else if (fromDate != null && endDate == null) {
                sql = "SELECT  *  FROM cheque_transaction where chq_flag_id!=8 and chq_status='" + chequeStatus + "' and created_on>='" + fromDate + "'     order by chq_id desc  ";
            } else if (fromDate == null && endDate != null) {
                sql = "SELECT  *  FROM cheque_transaction where chq_flag_id!=8 and chq_status='" + chequeStatus + "'   and created_on<='" + endDate + "' order by chq_id desc  ";
            } else if (fromDate != null && endDate != null) {
                sql = "SELECT  *  FROM cheque_transaction where chq_flag_id!=8 and chq_status='" + chequeStatus + "'   and created_on>='" + fromDate + "' and created_on<='" + endDate + "' order by chq_id desc  ";
            }
            recordCountLabel = loadTableValues(sql);

        } catch (Exception e) {
            String msg = "Class : chequeTransTable  Method : searcfChequeTransactionValues  Exception: " + e.getMessage();
            log.debug(msg);

        }
        return recordCountLabel;
    }

    public String loadTableValues(String sql) {
        clearData();
        String recordCountLabel = "No Records Found";
        try {
            int i = 0;
            ChequeTransaction chequeTxnController=(ChequeTransaction) RegistryFactory.getClientStub(RegistryConstants.ChequeTransaction);
            List<ChequeTransactionModel> tableValues = chequeTxnController.displayChequeTransactionTableValues(sql);
            ChequeTransactionModel listModel;
            for (i = 0; i < tableValues.size(); i++) {
                addRow();
                listModel = new ChequeTransactionModel();
                listModel = tableValues.get(i);
                chequeTransTable.getModel().setValueAt(String.valueOf(listModel.getChequeID()), i, 0);
                chequeTransTable.getModel().setValueAt(listModel.getChequeNumber(), i, 1);
                chequeTransTable.getModel().setValueAt(listModel.getIssuedDate(), i, 2);
                chequeTransTable.getModel().setValueAt(listModel.getDepositDate(), i, 3);
                chequeTransTable.getModel().setValueAt(listModel.getTransactionType(), i, 4);
                chequeTransTable.getModel().setValueAt(listModel.getIssuedTo(), i, 5);
                chequeTransTable.getModel().setValueAt(String.valueOf(listModel.getAmount()), i, 6);
                chequeTransTable.getModel().setValueAt(listModel.getAccountNumber(), i, 7);
                chequeTransTable.getModel().setValueAt(listModel.getBankName(), i, 8);
                chequeTransTable.getModel().setValueAt(listModel.getChequeStatus(), i, 9);
                chequeTransTable.getModel().setValueAt(listModel.getClearedDate(), i, 10);
            }

            if (tableValues.size() > 0) {
                recordCountLabel = tableValues.size() + "  Records Found";
            } else {
                recordCountLabel = "No Records Found";
            }
            
            chequeTransTable.clearSelection();
        } catch (Exception e) {
            String msg = "Class : chequeTransTable  Method : loadTableValues  Exception: " + e.getMessage();
            log.debug(msg);
        }
        return recordCountLabel;
    }

    public void addRow() {
        DefaultTableModel model = (DefaultTableModel) chequeTransTable.getModel();
        Vector datas = new Vector();
        for (int i = 0; i < chequeTransTable.getModel().getColumnCount(); i++) {
            datas.addElement(null);
        }
        model.insertRow(chequeTransTable.getRowCount(), datas);
    }

    public void removeRow() {
        int i = chequeTransTable.getSelectedRow();
        if (i != -1) {
            DefaultTableModel model = (DefaultTableModel) chequeTransTable.getModel();
            model.removeRow(i);
            chequeTransTable.getModel().setValueAt(i, i + 1, 0);
            chequeTransTable.changeSelection(i + 1, 0, false, false);
        } else {
            JOptionPane.showMessageDialog(chequeTransTable, "Please select row to remove ...");
        }
    }

    public void clearData() {
        DefaultTableModel model = (DefaultTableModel) chequeTransTable.getModel();
        model.getDataVector().removeAllElements();
        chequeTransTable.revalidate();
    }

    public void addBasicRows() {
        for (int i = 0; i < 8; i++) {
            addRow();
        }
    }
}
