/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;

import com.vanuston.medeil.implementation.Receipt;
import com.vanuston.medeil.model.ReceiptModel;
import java.awt.Font;
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.util.Vector;
import javax.swing.AbstractAction;
import javax.swing.JComponent;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.KeyStroke;
import javax.swing.table.DefaultTableModel;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class ViewReceiptTable {

    static Logger log = Logger.getLogger(ViewReceiptTable.class, "Financial");
     

    public ViewReceiptTable() throws RemoteException, NotBoundException {
   //     receiptController = (Receipt) RegistryFactory.getClientStub(RegistryConstants.Receipt);
    }
    public static JTable ReceiptViewEntryTable;
    public static JScrollPane ReceiptViewScriollPane = new JScrollPane();
    public static KeyStroke ReceiptViewScriolTab = KeyStroke.getKeyStroke(KeyEvent.VK_T, KeyEvent.CTRL_MASK);
    public static KeyStroke ReceiptViewSFocusOut = KeyStroke.getKeyStroke(KeyEvent.VK_SPACE, KeyEvent.CTRL_MASK);
    public static String receipterId;
    public static KeyStroke back = KeyStroke.getKeyStroke(KeyEvent.VK_LEFT, KeyEvent.CTRL_MASK);

    // This function is used to Load the  Stoc Statement Values
    public JComponent createTable() {
        final Class[] types = {java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, String.class};
        final boolean[] canEditCols = {false, false, false, false, false, false, false};
        final int[] colWidth = {50, 90, 100, 200, 80, 80, 110};
        Object[] colName = {"S.No", "Date", "Receipt No.", "Customer Name", "Invoice No.", "Amount", "Amount Paid"};
        ReceiptViewEntryTable = new JTable();

        Vector cols = new Vector();
        Vector data = new Vector();

        int len = colName.length;
        for (int i = 0; i < 10; i++) {
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

            ReceiptViewEntryTable.setModel(new javax.swing.table.DefaultTableModel(data, cols) {

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
            String msg = "Class : ViewReciptTable  method : Create Table   = " + ex.getMessage();
            log.debug(msg);
        }
        ReceiptViewEntryTable.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        ReceiptViewEntryTable.getTableHeader().setBackground(new Color(226, 238, 244));
        ReceiptViewEntryTable.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
        ReceiptViewEntryTable.setShowGrid(true);
        ReceiptViewEntryTable.getTableHeader().setReorderingAllowed(false);
        for (int i = 0; i < len; i++) {
            ReceiptViewEntryTable.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }
        ReceiptViewEntryTable.setGridColor(new java.awt.Color(204, 204, 255));
        ReceiptViewEntryTable.setCellSelectionEnabled(false);
        ReceiptViewEntryTable.setColumnSelectionAllowed(false);
        ReceiptViewEntryTable.setRowSelectionAllowed(true);
        ReceiptViewEntryTable.setRowHeight(20);
        ReceiptViewEntryTable.setSelectionBackground(Color.LIGHT_GRAY);
        ReceiptViewEntryTable.setSelectionForeground(Color.RED);
        ReceiptViewEntryTable.revalidate();
        ReceiptViewEntryTable.getInputMap().put(back, "actionF2");
        ReceiptViewEntryTable.getActionMap().put("actionF2", new AbstractAction() {

            @Override
            public void actionPerformed(ActionEvent e) {
                ReceiptViewEntryTable.transferFocus();
            }
        });
        LoadReceiptValues("basicsearch", "");
        ReceiptViewEntryTable.addKeyListener(new KeyListener() {

            public void keyReleased(KeyEvent e) {
            }

            @Override
            public void keyTyped(KeyEvent e) {
            }

            @Override
            public void keyPressed(KeyEvent e) {
            }
        });

        ReceiptViewEntryTable.addMouseListener(new MouseListener() {

            @Override
            public void mouseClicked(MouseEvent e) {

                viewReceiptCalculations();
            }

            @Override
            public void mousePressed(MouseEvent e) {
            }

            @Override
            public void mouseReleased(MouseEvent e) {
            }

            @Override
            public void mouseEntered(MouseEvent e) {
            }

            @Override
            public void mouseExited(MouseEvent e) {
            }
        });


        return ReceiptViewEntryTable;
    }

    public JComponent getScrollTable(JComponent jt) {
        ReceiptViewEntryTable = (JTable) jt;
        ReceiptViewScriollPane.add(ReceiptViewEntryTable);
        ReceiptViewScriollPane.setViewportView(ReceiptViewEntryTable);
        return ReceiptViewScriollPane;
    }

    public void viewReceiptCalculations() {
        final int i = ReceiptViewEntryTable.getSelectedRow();
        receipterId = (String) ReceiptViewEntryTable.getValueAt(i, 2);
    }
    // This function is used to Load the Stock Statement Values

    public void LoadReceiptValues(String type, String custName) {
        receipterId = "";
        try {
            String sql = "";
            clearData();
            if (type.equals("basicsearch")) {
                //sql = "SELECT  distinct(payment_no), payment_date,payment_no,dist_name,invoice_no,invoice_amt,total_paid_amt,invoice_date,inv_bal_amt,paid_amt,balance_amt FROM payment where   pay_flag_id=0 order by payment_no  desc  limit 0,10";
                sql = "SELECT  * FROM receipt where rec_flag_id=0 order by receipt_no  desc     limit 0,10";
            } else if (type.equals("custnamesearch")) {
                sql = "SELECT  * FROM receipt where rec_flag_id=0 and cust_name='" + custName + "' order by receipt_no  desc";
            } else {
                sql = "SELECT  * FROM receipt  where rec_flag_id=0  order by receipt_no";
            }

            Receipt receiptController = (Receipt) RegistryFactory.getClientStub(RegistryConstants.Receipt);
            ReceiptModel recModel;
            ReceiptModel receiptModel = new ReceiptModel();
            receiptModel.setQueryValue(sql);
            receiptModel = (ReceiptModel) receiptController.getReceiptTableValues(receiptModel);
            List<ReceiptModel> receiptList = new ArrayList<ReceiptModel>();
            receiptList = receiptModel.getListofitems();

            int index = 0;
            for (index = 0; index < receiptList.size(); index++) {

                addRow();
                recModel = receiptList.get(index);
                ReceiptViewEntryTable.getModel().setValueAt(recModel.getReceiptDate(), index, 1);
                ReceiptViewEntryTable.getModel().setValueAt(recModel.getReceiptNumber(), index, 2);
                ReceiptViewEntryTable.getModel().setValueAt(recModel.getCustomerName(), index, 3);
                ReceiptViewEntryTable.getModel().setValueAt(recModel.getBillNumber(), index, 4);
                ReceiptViewEntryTable.getModel().setValueAt(String.valueOf(recModel.getBillAmount()), index, 5);
                ReceiptViewEntryTable.getModel().setValueAt(String.valueOf(recModel.getPaidAmount()), index, 6);
                ReceiptViewEntryTable.getModel().setValueAt(index + 1, index, 0);
            }

            if (index == 0) {
            //-    addBasicRows();
            }
            ReceiptViewEntryTable.clearSelection();
        } catch (Exception e) {
            String msg = "Class : ViewReceiptTable  Method : LoadReceiptValues()   = " + e.getMessage();
            log.debug(msg);
        }

    }

    public void addRow() {
        DefaultTableModel model = (DefaultTableModel) ReceiptViewEntryTable.getModel();
        Vector datas = new Vector();
//    datas.addElement(StockStatementTable.getRowCount()+1);
        for (int i = 0; i < ReceiptViewEntryTable.getModel().getColumnCount(); i++) {
            datas.addElement(null);
        }
        model.insertRow(ReceiptViewEntryTable.getRowCount(), datas);
//   model.insertRow(row, rowData);
    }

    public void removeRow() {
        int i = ReceiptViewEntryTable.getSelectedRow();
        if (i != -1) {
            DefaultTableModel model = (DefaultTableModel) ReceiptViewEntryTable.getModel();
            model.removeRow(i);
            ReceiptViewEntryTable.getModel().setValueAt(i, i - 1, 0);
            ReceiptViewEntryTable.changeSelection(i - 1, 0, false, false);
        } else {
            JOptionPane.showMessageDialog(ReceiptViewEntryTable, "Please select row to remove ...");
        }
    }

    public void clearData() {
        DefaultTableModel model = (DefaultTableModel) ReceiptViewEntryTable.getModel();
        model.getDataVector().removeAllElements();
        ReceiptViewEntryTable.revalidate();
    }

    public void keyFunctions() {
    }

    public void addBasicRows() {
        for (int i = 0; i < 15; i++) {
            addRow();
        }

    }
}
