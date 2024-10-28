package com.vanuston.medeil.uitables;


import com.vanuston.medeil.client.RegistryFactory;

import com.vanuston.medeil.implementation.BankBook;
import com.vanuston.medeil.model.BankBookModel;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.util.Vector;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.RegistryConstants;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;

public class BankBookTable {

    static Logger log = Logger.getLogger(BankBookTable.class, "Utilities");

   

    public BankBookTable() throws RemoteException, NotBoundException {

         
    }

    public static JTable BankBookTable;
    public static JScrollPane chequeTansScrollPane = new JScrollPane();
    public static KeyStroke callBankBookTable = KeyStroke.getKeyStroke(KeyEvent.VK_T, KeyEvent.CTRL_MASK);
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
        final Class[] types = {java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class};
        final boolean[] canEditCols = {false, false, false, false, false, false, false, false};
        final int[] colWidth = {40, 100, 80, 100, 150, 90, 90, 120};
        Object[] colName = {"S.No", "Account No.", "Date", "Transaction Type", "Transaction Details", "Debit", "Credit", "Balance"};
        BankBookTable = new JTable();
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
            BankBookTable.setModel(new javax.swing.table.DefaultTableModel(data, cols) {

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
            String msg = "Class : BankBookTable  Method : createTable   Exception:" + ex.getMessage();
            log.debug(msg);
        }
        BankBookTable.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        BankBookTable.getTableHeader().setBackground(new Color(226, 238, 244));
        BankBookTable.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
        BankBookTable.setShowGrid(true);
        BankBookTable.getTableHeader().setReorderingAllowed(false);
        for (int i = 0; i < len; i++) {
            BankBookTable.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }
        BankBookTable.removeColumn(BankBookTable.getColumnModel().getColumn(0));
        BankBookTable.setGridColor(new java.awt.Color(204, 204, 255));
        BankBookTable.setCellSelectionEnabled(false);
        BankBookTable.setRowSelectionAllowed(true);
        BankBookTable.getInputMap().put(save, "actionF2");
        BankBookTable.getInputMap().put(edit, "actionF2");
        BankBookTable.getInputMap().put(reset, "actionF2");
        BankBookTable.getInputMap().put(can, "actionF2");
        BankBookTable.getInputMap().put(update, "actionF2");
        BankBookTable.getInputMap().put(del, "actionF2");
        BankBookTable.getInputMap().put(back, "actionF2");
        BankBookTable.getInputMap().put(rR, "actionF2");
        BankBookTable.getActionMap().put("actionF2", new AbstractAction() {

            @Override
            public void actionPerformed(ActionEvent e) {
                BankBookTable.transferFocus();
            }
        });
        BankBookTable.setRowHeight(20);
        BankBookTable.setSelectionBackground(Color.LIGHT_GRAY);
        BankBookTable.setSelectionForeground(Color.RED);
        BankBookTable.revalidate();
        loadBankBookValues(0);
        BankBookTable.addKeyListener(new KeyListener() {

            @Override
            public void keyReleased(KeyEvent e) {
           viewBankBookCalculations();
            }

            @Override
            public void keyTyped(KeyEvent e) {
            }

            @Override
            public void keyPressed(KeyEvent e) {
            }
        });
        BankBookTable.addMouseListener(new MouseListener() {

            @Override
            public void mouseClicked(MouseEvent e) {
                final int i = BankBookTable.getSelectedRow();
                stockId = (String) BankBookTable.getModel().getValueAt(i, 0);
                rowselt = stockId;
            }

            @Override
            public void mousePressed(MouseEvent e) {
            }

            @Override
            public void mouseReleased(MouseEvent e) {
                final int i = BankBookTable.getSelectedRow();
                stockId = (String) BankBookTable.getModel().getValueAt(i, 0);
                rowselt = stockId;
            }

            @Override
            public void mouseEntered(MouseEvent e) {
            }

            @Override
            public void mouseExited(MouseEvent e) {
            }
        });

        chequeTansScrollPane.add(BankBookTable);
        chequeTansScrollPane.setViewportView(BankBookTable);
        return BankBookTable;
    }
    public JComponent getScrollTable(JComponent jt) {
        BankBookTable = (JTable) jt;
        chequeTansScrollPane.add(BankBookTable);
        chequeTansScrollPane.setViewportView(BankBookTable);
        return chequeTansScrollPane;
    }
    public void viewBankBookCalculations() {
        final int i = BankBookTable.getSelectedRow();
        stockId = (String) BankBookTable.getModel().getValueAt(i, 0);
        rowselt = stockId;

    }
    private void loadingTableValues(String sql) {
        try {

            BankBookModel bankBookModel = new BankBookModel();
            bankBookModel.setQuery(sql);
            BankBook bankBookController = (BankBook) RegistryFactory.getClientStub(RegistryConstants.BankBook);
            bankBookModel = (BankBookModel)bankBookController.viewBankBookTableValues(bankBookModel);
            List<BankBookModel> bankbookList = new ArrayList();
            bankbookList = bankBookModel.getListofitems();
            BankBookModel listModel;
            int index = 0;
            for (index = 0; index < bankbookList.size(); index++) {
                listModel = new BankBookModel();
                listModel = (BankBookModel) bankbookList.get(index);
                addRow();
                BankBookTable.getModel().setValueAt(String.valueOf(listModel.getBankId()), index, 0);
                BankBookTable.getModel().setValueAt(listModel.getAccountNumber(), index, 1);
                BankBookTable.getModel().setValueAt(listModel.getBankBookDate(), index, 2);
                BankBookTable.getModel().setValueAt(listModel.getTransactionType(), index, 3);
                BankBookTable.getModel().setValueAt(listModel.getTransactionDetails(), index, 4);
                BankBookTable.getModel().setValueAt(String.valueOf(listModel.getDebitAmount()), index, 5);
                BankBookTable.getModel().setValueAt(String.valueOf(listModel.getCreditAmount()), index, 6);
                BankBookTable.getModel().setValueAt(String.valueOf(listModel.getClosingBalance()), index, 7);

            }
            BankBookTable.clearSelection();
        } catch (Exception e) {
            String msg = "Class : BankBookTable  Method : loadingTableValues  Exception: " + e.getMessage();
            log.debug(msg);
        }
    }
    public void loadBankBookValues(int type) {
        try {
            clearData();
            String sql = "";
            int i = 0;
            String curDate = DateUtils.now("yyyy-MM-dd");
            if (type == 0) {
                sql = "SELECT  *  FROM bank_book where bank_flag_id=0  and  cur_date='" + curDate + "' order by account_no,bank_id desc ";
            } else {
                sql = "SELECT  *  FROM bank_book    order by account_no,bank_id desc limit 0,15 ";
            }
            loadingTableValues(sql);

        } catch (Exception e) {
            String msg = "Class : BankBookTable  Method : loadBankBookValues  Exception: " + e.getMessage();
            log.debug(msg);

        }
    }
   public void searchBankBookValues(String AccountNo, String cmboTransType, String fromDate, String endDate) {
        try {
            clearData();
            String sql = "";

            cmboTransType = cmboTransType.trim();

            if (cmboTransType.equals("ALL")) {
                sql = "SELECT  *  FROM bank_book where  account_no='" + AccountNo + "'  and cur_date>='" + fromDate + "' and cur_date<='" + endDate + "' order by account_no,bank_id desc ";
            } else if (cmboTransType.equals("Deposit")) {
                sql = "SELECT  *  FROM bank_book where  account_no='" + AccountNo + "'  and transaction_type='Deposit' and cur_date>='" + fromDate + "' and cur_date<='" + endDate + "' order by account_no,bank_id desc ";
            } else {
                sql = "SELECT  *  FROM bank_book where  account_no='" + AccountNo + "'  and transaction_type!='Deposit' and cur_date>='" + fromDate + "' and cur_date<='" + endDate + "' order by account_no,bank_id desc ";
            }
            loadingTableValues(sql);
        } catch (Exception e) {
            String msg = "Class : BankBookTable  Method : searchBankBookValues  Exception: " + e.getMessage();
            log.debug(msg);

        }

    }
    public void addRow() {
        DefaultTableModel model = (DefaultTableModel) BankBookTable.getModel();
        Vector datas = new Vector();
        for (int i = 0; i < BankBookTable.getModel().getColumnCount(); i++) {
            datas.addElement(null);
        }
        model.insertRow(BankBookTable.getRowCount(), datas);
    }

    public static void removeRow() {
        int i = BankBookTable.getSelectedRow();
        if (i != -1) {
            DefaultTableModel model = (DefaultTableModel) BankBookTable.getModel();
            model.removeRow(i);
            BankBookTable.getModel().setValueAt(i, i + 1, 0);
            BankBookTable.changeSelection(i + 1, 0, false, false);
        } else {
            JOptionPane.showMessageDialog(BankBookTable, "Please select row to remove ...");
        }
    }

    public void clearData() {
        DefaultTableModel model = (DefaultTableModel) BankBookTable.getModel();
        model.getDataVector().removeAllElements();
        BankBookTable.revalidate();
    }

    public void addBasicRows() {
        for (int i = 0; i < 8; i++) {
            addRow();
        }
    }
}
