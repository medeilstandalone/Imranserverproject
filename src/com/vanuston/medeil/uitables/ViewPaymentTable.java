package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.Payment;
import com.vanuston.medeil.model.PaymentModel;
import java.awt.Font;
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
 import java.util.Vector;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;

public class ViewPaymentTable {

    static Logger log = Logger.getLogger(ViewPaymentTable.class, "Finanical");

      Payment payController;

    public ViewPaymentTable() throws RemoteException, NotBoundException {

    }

    public static JTable viewPaymentViewChargeTable;
    public static JScrollPane viewPaymentViewChargeScrollPane = new JScrollPane();
    public static KeyStroke valviewPaymentViewChargeTab = KeyStroke.getKeyStroke(KeyEvent.VK_T, KeyEvent.CTRL_MASK);
    public static KeyStroke callviewPaymentViewChargeFocusOut = KeyStroke.getKeyStroke(KeyEvent.VK_SPACE, KeyEvent.CTRL_MASK);
    public static KeyStroke shrctCtrlAr = KeyStroke.getKeyStroke(KeyEvent.VK_LEFT, KeyEvent.CTRL_MASK);
    public static String chargerId;

    public JComponent createTable() {

        final Class[] types = {java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class};
        final boolean[] canEditCols = {false, false, false, false, false, false, false};
        Object[] colName = {"S.No", "Date", "Payment No.", "Distributor Name", "Invoice No.", "Amount", "Amount Paid"};
        final int[] colWidth = {50, 90, 100, 200, 80, 80, 110};
        viewPaymentViewChargeTable = new JTable();
        Vector cols = new Vector();
        Vector data = new Vector();
        int len = colName.length;
        final int initRow = 12;
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
            viewPaymentViewChargeTable.setModel(new javax.swing.table.DefaultTableModel(data, cols) {

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
            String msg = "Class : ViewPaymentTable  Method : createTable()   = " + ex.getMessage();
            log.debug(msg);
        }
        viewPaymentViewChargeTable.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        viewPaymentViewChargeTable.getTableHeader().setBackground(new Color(226, 238, 244));
        viewPaymentViewChargeTable.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
        viewPaymentViewChargeTable.setShowGrid(true);
        viewPaymentViewChargeTable.getTableHeader().setReorderingAllowed(false);
        for (int i = 0; i < len; i++) {
            viewPaymentViewChargeTable.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }
        viewPaymentViewChargeTable.setGridColor(new java.awt.Color(204, 204, 255));
        viewPaymentViewChargeTable.setCellSelectionEnabled(false);
        viewPaymentViewChargeTable.setRowSelectionAllowed(true);
        viewPaymentViewChargeTable.setColumnSelectionAllowed(false);
        viewPaymentViewChargeTable.setRowHeight(20);
        viewPaymentViewChargeTable.setSelectionBackground(Color.LIGHT_GRAY);
        viewPaymentViewChargeTable.setSelectionForeground(Color.RED);
        viewPaymentViewChargeTable.revalidate();
        LoadPaymentValues("basicsearch", "");
        viewPaymentViewChargeTable.addKeyListener(new KeyListener() {

            @Override
            public void keyReleased(KeyEvent e) {
            }

            @Override
            public void keyTyped(KeyEvent e) {
            }

            @Override
            public void keyPressed(KeyEvent e) {
            }
        });
        viewPaymentViewChargeTable.getInputMap().put(shrctCtrlAr, "actionF2");
        viewPaymentViewChargeTable.getActionMap().put("actionF2", new AbstractAction() {

            @Override
            public void actionPerformed(ActionEvent e) {
                viewPaymentViewChargeTable.transferFocus();
            }
        });

        viewPaymentViewChargeTable.addMouseListener(new MouseListener() {

            @Override
            public void mouseClicked(MouseEvent e) {
                viewPaymentCalculations();
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
        viewPaymentViewChargeScrollPane.add(viewPaymentViewChargeTable);
        viewPaymentViewChargeScrollPane.setViewportView(viewPaymentViewChargeTable);
        return viewPaymentViewChargeTable;
    }

    public void viewPaymentCalculations() {
        final int i = viewPaymentViewChargeTable.getSelectedRow();
        chargerId = (String) viewPaymentViewChargeTable.getValueAt(i, 2);

    }

    public JComponent getScrollTable(JComponent jt) {
        viewPaymentViewChargeTable = (JTable) jt;
        viewPaymentViewChargeScrollPane.add(viewPaymentViewChargeTable);
        viewPaymentViewChargeScrollPane.setViewportView(viewPaymentViewChargeTable);
        return viewPaymentViewChargeScrollPane;
    }

    public void LoadPaymentValues(String type, String distName) {
        chargerId = "";
        try {
            String sql = "";
            clearData();
            if (type.equals("basicsearch")) {
                //sql = "SELECT  distinct(payment_no), payment_date,payment_no,dist_name,invoice_no,invoice_amt,total_paid_amt,invoice_date,inv_bal_amt,paid_amt,balance_amt FROM payment where   pay_flag_id=0 order by payment_no  desc  limit 0,10";
                sql = "SELECT  * FROM payment where   pay_flag_id=0 order by payment_no  desc  limit 0,10";
            } else if (type.equals("distnamesearch")) {
                sql = "SELECT  * FROM payment where dist_name='" + distName + "' and   pay_flag_id=0 order by payment_no  desc  ";
            } else {
                sql = "SELECT  * FROM payment where   pay_flag_id=0 order by payment_no  desc   ";
            }

            payController = (Payment) RegistryFactory.getClientStub(RegistryConstants.Payment);
            PaymentModel payModel;
            PaymentModel paymentModel = new PaymentModel();
            paymentModel.setQueryValue(sql);
            paymentModel = (PaymentModel) payController.getPaymentTableValues(paymentModel);
            List<PaymentModel> paymentList = new ArrayList<PaymentModel>();
            paymentList = paymentModel.getListofitems();

            int index = 0;
            for (index = 0; index < paymentList.size(); index++) {
              
                addRow();
                payModel = paymentList.get(index);
                viewPaymentViewChargeTable.getModel().setValueAt(payModel.getPaymentDate(), index, 1);
                viewPaymentViewChargeTable.getModel().setValueAt(payModel.getPaymentNumber(), index, 2);
                viewPaymentViewChargeTable.getModel().setValueAt(payModel.getDistributorName(), index, 3);
                viewPaymentViewChargeTable.getModel().setValueAt(payModel.getInvoiceNumber(), index, 4);
                viewPaymentViewChargeTable.getModel().setValueAt(String.valueOf(payModel.getInvoiceAmount()), index, 5);
                viewPaymentViewChargeTable.getModel().setValueAt(String.valueOf(payModel.getPaidAmount()), index, 6);
                viewPaymentViewChargeTable.getModel().setValueAt(index + 1, index, 0);
            }

            if (index == 0) {
              //-  addBasicRows();
            }
            viewPaymentViewChargeTable.clearSelection();
        } catch (Exception e) {
            String msg = "Class : ViewPaymentTable  Method : LoadViewPaymentChargers()   = " + e.getMessage();
            log.debug(msg);
        }

    }

    public void addRow() {
        DefaultTableModel model = (DefaultTableModel) viewPaymentViewChargeTable.getModel();
        Vector datas = new Vector();
        for (int i = 0; i < viewPaymentViewChargeTable.getModel().getColumnCount(); i++) {
            datas.addElement(null);
        }
        model.insertRow(viewPaymentViewChargeTable.getRowCount(), datas);
    }

    public void removeRow() {
        int i = viewPaymentViewChargeTable.getSelectedRow();
        if (i != -1) {
            DefaultTableModel model = (DefaultTableModel) viewPaymentViewChargeTable.getModel();
            model.removeRow(i);
            viewPaymentViewChargeTable.getModel().setValueAt(i, i - 1, 0);
            viewPaymentViewChargeTable.changeSelection(i - 1, 0, false, false);
        } else {
            JOptionPane.showMessageDialog(viewPaymentViewChargeTable, "Please select row to remove ...");
        }
    }

    public void clearData() {
        DefaultTableModel model = (DefaultTableModel) viewPaymentViewChargeTable.getModel();
        model.getDataVector().removeAllElements();
        viewPaymentViewChargeTable.revalidate();
    }

    public void keyFunctions() {
    }

    public void addBasicRows() {
        for (int i = 0; i < 16; i++) {
            addRow();
        }
    }
}
