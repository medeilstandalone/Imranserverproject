package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.Payment;
import com.vanuston.medeil.model.PaymentModel;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.util.Vector;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.Font;
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import javafx.stage.Alert;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.util.Value;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;

public class PayTable {

    static Logger log = Logger.getLogger(PayTable.class, "Finanical");

    public PayTable() throws RemoteException, NotBoundException {
    }
    public static JTable payJCompTable;
    public static JScrollPane scrollPanel = new JScrollPane();
    public static double totalAmt = 0.00;
    public static double totalDistAmt = 0.00;
    public static String payId = "";
    public static double AmountPaid = 0.00;
    public static double balanceAmount = 0.00;
    public static String distName = "";
    public static KeyStroke save = KeyStroke.getKeyStroke(KeyEvent.VK_F3, 0);
    public static KeyStroke reset = KeyStroke.getKeyStroke(KeyEvent.VK_F4, 0);
    public static KeyStroke del = KeyStroke.getKeyStroke(KeyEvent.VK_F5, 0);
    public static KeyStroke update = KeyStroke.getKeyStroke(KeyEvent.VK_F7, 0);
    public static KeyStroke edit = KeyStroke.getKeyStroke(KeyEvent.VK_F6, 0);
    public static KeyStroke rR = KeyStroke.getKeyStroke(KeyEvent.VK_F12, 0);
    public static KeyStroke can = KeyStroke.getKeyStroke(KeyEvent.VK_F8, 0);
    public static KeyStroke back = KeyStroke.getKeyStroke(KeyEvent.VK_LEFT, KeyEvent.CTRL_MASK);
    public static int initR;

    public JComponent createTable() {
        int col = 9;
        initR = col;
        final Class[] types = {java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.Double.class, java.lang.String.class};
        final boolean[] canEditCols = {false, false, false, false, false, true, true};
        final int[] colWidth = {10, 85, 105, 110, 120, 100, 90};
        payJCompTable = new JTable();
        Vector cols = new Vector();
        Vector data = new Vector();
        Object[] colName = {"S.No", "Invoice No.", "Invoice Date", "Invoice Amount", "Invoice Balance Amount", "Paid Amount", "Remarks"};
        int len = colName.length;
        for (int i = 1; i <= col; i++) {
            Vector c = new Vector();
            for (int j = 0; j < len; j++) {
                c.addElement(null);
            }
            data.addElement(c);
        }
        for (int i = 0; i < len; i++) {
            cols.addElement(colName[i]);
        }
        try {
            payJCompTable.setModel(new javax.swing.table.DefaultTableModel(data, cols) {

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
            String msg = "Class : PayTable  Method  : Create Table Exception: " + ex.getMessage();
            log.debug(msg);
        }
        payJCompTable.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        payJCompTable.getTableHeader().setBackground(new Color(226, 238, 244));
        payJCompTable.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
        payJCompTable.setShowGrid(true);
        payJCompTable.getTableHeader().setReorderingAllowed(false);
        payJCompTable.getInputMap().put(save, "focusOut");
        payJCompTable.getInputMap().put(edit, "focusOut");
        payJCompTable.getInputMap().put(reset, "focusOut");
        payJCompTable.getInputMap().put(can, "focusOut");
        payJCompTable.getInputMap().put(update, "focusOut");
        payJCompTable.getInputMap().put(del, "focusOut");
        payJCompTable.getInputMap().put(back, "focusOut");
        payJCompTable.getInputMap().put(rR, "focusOut");
        payJCompTable.getActionMap().put("focusOut", new AbstractAction() {

            @Override
            public void actionPerformed(ActionEvent evt) {
                payJCompTable.transferFocus();
            }
        });
        for (int i = 0; i < len; i++) {
            payJCompTable.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }
        payJCompTable.setGridColor(new java.awt.Color(204, 204, 255));
        payJCompTable.setCellSelectionEnabled(true);
        payJCompTable.setColumnSelectionAllowed(false);
        payJCompTable.setRowHeight(20);
        payJCompTable.setSelectionBackground(Color.LIGHT_GRAY);
        payJCompTable.setSelectionForeground(Color.RED);
        payJCompTable.revalidate();
        payJCompTable.addMouseListener(new MouseAdapter() {

            @Override
            public void mouseClicked(MouseEvent e) {
                final int i = payJCompTable.getSelectedRow();
                final int j = payJCompTable.getSelectedColumn();
                final int rowCnt = payJCompTable.getRowCount();
                if (i == 0 && j == 0) {
                }
                int k = 0;
                for (k = 0; k < rowCnt; k++) {
                    payJCompTable.getModel().setValueAt(k + 1, k, 0);
                }
            }
        });
        payJCompTable.addKeyListener(new KeyListener() {

            @Override
            public void keyReleased(KeyEvent e) {
                final int i = payJCompTable.getSelectedRow();
                final int j = payJCompTable.getSelectedColumn();
                paymentCalculations();
                if (e.getKeyCode() == 10) {
                    InputMap im = payJCompTable.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                    KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                    KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                    im.put(enter, im.get(tab));
                    paymentCalculations();
                }
                if (i >= 0) {
                    payJCompTable.getModel().setValueAt(i + 1, i, 0);
                    if (e.getKeyCode() == 10 || e.getKeyCode() == 9) {
                        InputMap im = payJCompTable.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                        KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                        KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                        im.put(enter, im.get(tab));
                    }
                    if ((j == 1) && e.getKeyCode() != 27 || (j == 1 && e.getKeyCode() == KeyEvent.VK_TAB && e.getKeyCode() != 27)) {
                        try {
                            GetPurchaseData g = new GetPurchaseData(payJCompTable);
                            g.requestFocusInWindow();
                            g.setVisible(true);
                            g.requestFocus();
                        } catch (Exception ex) {
                            log.debug("ERror Getting Load Table = " + ex.getMessage());
                        }
                    }
                    if (i == payJCompTable.getModel().getRowCount() - 1) {
                        addRow();
                    }
                }

                
                paymentCalculations();
            }

            @Override
            public void keyPressed(KeyEvent e) {
                    final int i = payJCompTable.getSelectedRow();
                final int j = payJCompTable.getSelectedColumn();
                InputMap im = payJCompTable.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                if (e.getKeyCode() == 10) {
                    KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                    KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                    im.put(enter, im.get(tab));
                }
                if (e.getKeyCode() == KeyEvent.VK_DELETE || e.getKeyCode() == KeyEvent.VK_BACK_SPACE) {
                        if (payJCompTable.getModel().isCellEditable(i, j)) {
                            payJCompTable.getModel().setValueAt("", i, j);
                        }
                    }
            }

            @Override
            public void keyTyped(KeyEvent e) {
            }
        });

        return payJCompTable;
    }

    public JComponent getScrollTable(JComponent jt) {
        payJCompTable = (JTable) jt;
        scrollPanel.add(payJCompTable);
        scrollPanel.setViewportView(payJCompTable);
        return scrollPanel;
    }

    public void paymentCalculations() {
        final int rowCnt = payJCompTable.getRowCount();
        totalAmt = 0.0;
        totalDistAmt = 0.0;
        int k = 0;
        for (k = 0; k < rowCnt; k++) {
            String Balance = (String) payJCompTable.getModel().getValueAt(k, 3);
            String invoice_no = "";
            invoice_no = (String) payJCompTable.getModel().getValueAt(k, 1);
            if (invoice_no != null && invoice_no.trim().length() > 0) {
                Double bal = 0.0;
                if (Balance != null && Balance.trim().length() > 0) {
                    bal = Double.valueOf(Balance);
                }
                Double sa = 0.0;
                String samp=""+payJCompTable.getModel().getValueAt(k, 5);
                if(samp!=null && !samp.equalsIgnoreCase("null") && !samp.equalsIgnoreCase("")){
                sa = Double.parseDouble("0" + payJCompTable.getModel().getValueAt(k, 5));
                }
                if (sa > 0.0) {
                    totalAmt += sa;
                }
                totalDistAmt += bal;
            }
        }
        totalDistAmt = Value.Round(totalDistAmt, 2);
        totalAmt = Value.Round(totalAmt, 2);
    }

    public void addRow() {
        DefaultTableModel model = (DefaultTableModel) payJCompTable.getModel();
        Vector datas = new Vector();
        for (int i = 0; i < payJCompTable.getModel().getColumnCount(); i++) {
            datas.addElement(null);
        }
        model.insertRow(payJCompTable.getRowCount(), datas);
    }

    public void removeRow() {
        int i = payJCompTable.getSelectedRow();
        int j = payJCompTable.getSelectedColumn();
        int rows = payJCompTable.getRowCount();
        try {
            if (payJCompTable.getModel().getValueAt(i, 1) != null) {
                if (i != -1) {
                    DefaultTableModel model = (DefaultTableModel) payJCompTable.getModel();
                    if (rows == 1) {
                        if (i == 0) {
                            model.removeRow(i);

                            for (int n = 0; n < initR; n++) {
                                addRow();
                            }
                            payJCompTable.changeSelection(0, 0, false, false);
                        }
                    } else {
                        model.removeRow(i);
                        int rows1 = payJCompTable.getRowCount();
                        if (i + 1 != rows) {
                            for (int n = 0; n < rows1; n++) {
                                if (payJCompTable.getModel().getValueAt(n, 0) == null); else {
                                    payJCompTable.getModel().setValueAt(n + 1, n, 0);
                                }
                            }
                            payJCompTable.changeSelection(i, j, false, false);
                        } else {
                            payJCompTable.changeSelection(i - 1, j, false, false);
                        }
                    }
                    getcounters();
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


    public void clearData() {
        DefaultTableModel model = (DefaultTableModel) payJCompTable.getModel();
        model.getDataVector().removeAllElements();
        for (int in = 0; in < 10; in++) {
            addRow();
        }
        payJCompTable.clearSelection();
        totalAmt = 0.0;
        totalDistAmt = 0.0;
        payId = "";
        AmountPaid = 0.0;
        balanceAmount = 0.0;
        payJCompTable.revalidate();
    }

    public List getPaymentItems() {
        List<PaymentModel> paymentItems = new ArrayList<PaymentModel>();
        int rowCount = totalRow();
        try {
            
            PaymentModel model;
            try {
                for (int index = 0; index < rowCount; index++) {
                     
                    if (!(payJCompTable.getModel().getValueAt(index, 1) == null)) {
                        model = new PaymentModel();
                        model.setInvoiceNumber(payJCompTable.getModel().getValueAt(index, 1).toString());
                        model.setInvoiceDate(payJCompTable.getModel().getValueAt(index, 2).toString());
                        model.setInvoiceAmount(Double.parseDouble(payJCompTable.getModel().getValueAt(index, 3).toString()));
                        model.setInvoiceBalanceAmount(Double.parseDouble(payJCompTable.getModel().getValueAt(index, 4).toString()));
                        model.setPaidAmount((Double) payJCompTable.getModel().getValueAt(index, 5));
                        model.setQueryValue(""+payJCompTable.getModel().getValueAt(index, 6));
                        paymentItems.add(model);
                    }
                }
            } catch (Exception e) {

                String ss = "Method: getSalesBillItems    Exception : " + e.getMessage();
                log.debug(ss);
            }
        } catch (Exception ex) {
            String ss = "Method: getSalesBillItems    Exception : " + ex.getMessage();
            log.debug(ss);
        }
        return paymentItems;
    }

    public void focusSet(int row) {
        payJCompTable.requestFocus();
        payJCompTable.changeSelection(row, 5, false, false);
        payJCompTable.setCellSelectionEnabled(true);
    }

    public void focusSet() {
        payJCompTable.requestFocus();
        payJCompTable.changeSelection(0, 0, false, false);
        payJCompTable.getModel().setValueAt("1", 0, 0);
        payJCompTable.setCellSelectionEnabled(true);
    }

    public void focusSet1() {
        payJCompTable.requestFocus();
        payJCompTable.getModel().setValueAt("1", 0, 0);
        payJCompTable.setCellSelectionEnabled(true);
    }

    public int total(int colNum) {
        int tot = 0;
        int colNo = colNum;
        for (int i = 0; i < payJCompTable.getModel().getRowCount(); i++) {
            if (payJCompTable.getModel().getValueAt(i, colNo) != null) {
                tot += Double.parseDouble("" + payJCompTable.getModel().getValueAt(i, colNo));
            }
        }
        return tot;
    }

    public int totalRow() {
        int tot = 0;
        for (int i = 0; i < payJCompTable.getModel().getRowCount(); i++) {
            if (payJCompTable.getModel().getValueAt(i, 2) != null && payJCompTable.getModel().getValueAt(i, 5) != null && payJCompTable.getModel().getValueAt(i, 5) != "") {
                tot++;
            }
        }
        return tot;
    }

    public void loadDPaymentTable(String dchid) {
        payId = "";
        try {

            PaymentModel payModel;
            PaymentModel paymentModel = new PaymentModel();
            paymentModel.setPaymentNumber(dchid);
            String sql = "SELECT * FROM payment where payment_no='" + dchid + "'  and pay_flag_id=0 order by payment_date  desc  ";
            paymentModel.setQueryValue(sql);
            Payment payController = (Payment) RegistryFactory.getClientStub(RegistryConstants.Payment);
            paymentModel = (PaymentModel) payController.getPaymentTableValues(paymentModel);
            List<PaymentModel> paymentList = new ArrayList<PaymentModel>();
            paymentList = paymentModel.getListofitems();

            int index = 0;
            clearData();
            for (index = 0; index < paymentList.size(); index++) {
                addRow();
                payModel = paymentList.get(index);
                payJCompTable.getModel().setValueAt(payModel.getInvoiceNumber(), index, 1);
                payJCompTable.getModel().setValueAt(payModel.getInvoiceDate(), index, 2);
                payJCompTable.getModel().setValueAt(String.valueOf(payModel.getInvoiceAmount()), index, 3);
                payJCompTable.getModel().setValueAt(String.valueOf(payModel.getInvoiceBalanceAmount()), index, 4);
                payJCompTable.getModel().setValueAt(payModel.getPaidAmount(), index, 5);
                if(payModel.getTransactionDetails().equals("null")) {
                    payModel.setTransactionDetails("");
                }
                else  {
                payJCompTable.getModel().setValueAt(payModel.getTransactionDetails(), index, 6);
                }
                payJCompTable.getModel().setValueAt(index + 1, index, 0);
            }
            totalAmt = Value.Round(paymentModel.getTotalPaidAmount(), 2);
            balanceAmount = Value.Round(paymentModel.getBalanceAmount(), 2);
            payJCompTable.clearSelection();
        } catch (Exception e) {
            String msg = "Class : PayTable  Method  : LoadPaymentTable() Exception: " + e.getMessage();
            log.debug(msg);
        }
    }

    public void getcounters() {
        final int rowCnt = payJCompTable.getRowCount();
        int k = 0;
        totalAmt = 0;
        for (k = 0; k < rowCnt; k++) {
            String Balance = (String) payJCompTable.getModel().getValueAt(k, 3);
            String invoice_no = "";
            invoice_no = (String) payJCompTable.getModel().getValueAt(k, 1);
            if (invoice_no != null && invoice_no.trim().length() > 0) {
                Double bal = 0.0;
                if (Balance != null && Balance.trim().length() > 0) {
                    bal = Double.valueOf(Balance);
                }
                Double sa = Double.parseDouble("" + payJCompTable.getModel().getValueAt(k, 5));
                totalAmt += sa;
                totalDistAmt += bal;
            }
        }
        totalDistAmt = Value.Round(totalDistAmt, 2);
        totalAmt = Value.Round(totalAmt, 2);
    }
}
