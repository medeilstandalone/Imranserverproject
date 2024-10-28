package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;

import com.vanuston.medeil.implementation.ChequeBook;
import com.vanuston.medeil.model.ChequeBookModel;
import com.vanuston.medeil.util.CustomCellRenderer;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import java.awt.Color;
import java.awt.Component;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Vector;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableCellRenderer;
import javax.swing.table.TableColumnModel;

public class ChequeViewTable {

    Logger log = Logger.getLogger(ChequeViewTable.class, "com.vanuston.medeil.uitables");

    public ChequeViewTable() throws RemoteException, NotBoundException {
        //  chqController = (ChequeBook) RegistryFactory.getClientStub(RegistryConstants.ChequeBook);
    }
    public JTable ChequeViewTable;
    public int intialRow = 0;
    public JScrollPane stockStScrollPane = new JScrollPane();
    public KeyStroke calChequeViewTable = KeyStroke.getKeyStroke(KeyEvent.VK_T, KeyEvent.CTRL_MASK);
    public KeyStroke callDrugfocusOut = KeyStroke.getKeyStroke(KeyEvent.VK_SPACE, KeyEvent.CTRL_MASK);
    public String drugId;
    public String drugSetId = "-1";
    public HashMap m_tDataAwareColorMap = new HashMap();
    public KeyStroke save = KeyStroke.getKeyStroke(KeyEvent.VK_F3, 0);
    public KeyStroke reset = KeyStroke.getKeyStroke(KeyEvent.VK_F4, 0);
    public KeyStroke del = KeyStroke.getKeyStroke(KeyEvent.VK_F5, 0);
    public KeyStroke update = KeyStroke.getKeyStroke(KeyEvent.VK_F7, 0);
    public KeyStroke edit = KeyStroke.getKeyStroke(KeyEvent.VK_F6, 0);
    public KeyStroke rR = KeyStroke.getKeyStroke(KeyEvent.VK_F12, 0);
    public KeyStroke can = KeyStroke.getKeyStroke(KeyEvent.VK_F8, 0);
    public KeyStroke back = KeyStroke.getKeyStroke(KeyEvent.VK_LEFT, KeyEvent.CTRL_MASK);
    // public KeyStroke ctrlc = KeyStroke.getKeyStroke(KeyEvent.VK_C, KeyEvent.CTRL_MASK);

    public JComponent createTable() {
        Object[] colName = {"S.No", "Cheque No.", "Issued Date", "Issued To", "Status", "Amount"};
        final Class[] types = {java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class};
        final boolean[] canEditCols = {false, false, false, false, false, false};
        final int[] colWidth = {40, 130, 110, 150, 70, 70};
        ChequeViewTable = new JTable() {

            @Override
            public Component prepareRenderer(TableCellRenderer renderer, int row, int column) {
                Component c = super.prepareRenderer(renderer, row, column);
                if (isRowSelected(row)) {
                    c.setBackground(Color.DARK_GRAY);
                    c.setForeground(Color.WHITE);
                } else {
                    c.setBackground(Color.WHITE);
                    c.setForeground(Color.black);
                }

                return c;
            }
        };
        Vector cols = new Vector();
        Vector data = new Vector();
        int len = colName.length;
        for (int i = 0; i < 9; i++) {
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
            ChequeViewTable.setModel(new javax.swing.table.DefaultTableModel(data, cols) {

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
            String msg = "Class : ChequeViewTable  Method : createTable ()   = " + ex.getMessage();
            log.debug(msg);
        }
//        map.removeKeyStrokeBinding(ctrlc);
        ChequeViewTable.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        ChequeViewTable.getTableHeader().setBackground(new Color(226, 238, 244));
        ChequeViewTable.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
        ChequeViewTable.setRowSelectionAllowed(true);
        ChequeViewTable.setShowGrid(true);
        ChequeViewTable.getTableHeader().setReorderingAllowed(false);
        for (int i = 0; i < len; i++) {
            ChequeViewTable.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }
        ChequeViewTable.setGridColor(new java.awt.Color(204, 204, 255));
        ChequeViewTable.setCellSelectionEnabled(false);
        ChequeViewTable.setColumnSelectionAllowed(false);
        ChequeViewTable.setRowSelectionAllowed(true);
        ChequeViewTable.setRowSelectionInterval(0, 1);
        AbstractAction disabled = new AbstractAction() {

            @Override
            public boolean isEnabled() {
                return false;
            }

            @Override
            public void actionPerformed(ActionEvent e) {
            }
        };
        ChequeViewTable.getInputMap(JComponent.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT).put(KeyStroke.getKeyStroke(KeyEvent.VK_C, KeyEvent.CTRL_MASK), "none");
        ChequeViewTable.getActionMap().put("none", disabled);
        ChequeViewTable.getInputMap().put(save, "actionF2");
        ChequeViewTable.getInputMap().put(edit, "actionF2");
        ChequeViewTable.getInputMap().put(reset, "actionF2");
        ChequeViewTable.getInputMap().put(can, "actionF2");
        ChequeViewTable.getInputMap().put(update, "actionF2");
        ChequeViewTable.getInputMap().put(del, "actionF2");
        ChequeViewTable.getInputMap().put(back, "actionF2");
        ChequeViewTable.getInputMap().put(rR, "actionF2");
        ChequeViewTable.getActionMap().put("actionF2", new AbstractAction() {

            @Override
            public void actionPerformed(ActionEvent e) {
                ChequeViewTable.transferFocus();
            }
        });
        ChequeViewTable.setRowHeight(20);
        ChequeViewTable.setSelectionBackground(Color.LIGHT_GRAY);
        ChequeViewTable.setSelectionForeground(Color.RED);
        ChequeViewTable.revalidate();
        ChequeViewTable.addKeyListener(new KeyListener() {

            public void keyReleased(KeyEvent e) {
            }

            @Override
            public void keyTyped(KeyEvent e) {
            }

            @Override
            public void keyPressed(KeyEvent e) {
            }
        });

        ChequeViewTable.addMouseListener(new MouseListener() {

            @Override
            public void mouseClicked(MouseEvent e) {
            }

            @Override
            public void mousePressed(MouseEvent e) {
            }

            @Override
            public void mouseReleased(MouseEvent e) {
                final int i = ChequeViewTable.getSelectedRow();
            }

            @Override
            public void mouseEntered(MouseEvent e) {
            }

            @Override
            public void mouseExited(MouseEvent e) {
            }
        });


        stockStScrollPane.add(ChequeViewTable);
        stockStScrollPane.setViewportView(ChequeViewTable);
        return ChequeViewTable;
    }

    public JComponent getScrollTable(JComponent jt) {
        ChequeViewTable = (JTable) jt;
        stockStScrollPane.add(ChequeViewTable);
        stockStScrollPane.setViewportView(ChequeViewTable);
        return stockStScrollPane;
    }

    public void viewDrugCalculations() {
        final int i = ChequeViewTable.getSelectedRow();
        drugId = (String) ChequeViewTable.getValueAt(i, 0);
        drugSetId = drugId;

    }

    public void loadChequeLeaves(ChequeBookModel chqModel) {
        try {
            Object chequeModel = (Object) chqModel;
            clearData();
            int i = 0;

            ChequeBookModel listModel;
            ChequeBook chqController = (ChequeBook) RegistryFactory.getClientStub(RegistryConstants.ChequeBook);
            List<ChequeBookModel> listValues = new ArrayList<ChequeBookModel>();
            listValues = (ArrayList) chqController.viewRecord(chequeModel);

            for (i = 0; i < listValues.size(); i++) {
                listModel = new ChequeBookModel();
                listModel = listValues.get(i);
                addRow();
                ChequeViewTable.getModel().setValueAt(i + 1, i, 0);
                ChequeViewTable.getModel().setValueAt(listModel.getChequeNo(), i, 1);
                ChequeViewTable.getModel().setValueAt(listModel.getIssuedDate(), i, 2);
                ChequeViewTable.getModel().setValueAt(listModel.getRemaining(), i, 3);
                ChequeViewTable.getModel().setValueAt(listModel.getStatus(), i, 4);
                ChequeViewTable.getModel().setValueAt(listModel.getChequeAmount(), i, 5);

            }
            if (i < intialRow) {
                for (int j = i; j < intialRow; j++) {
                    addRow();
                }
            }
            ChequeViewTable.clearSelection();
        } catch (Exception e) {
            String msg = "Class : ChequeViewTable  Method : loadChequeLeaves ()   = " + e.getMessage();
            log.debug(msg);
        }
    }

    public void addInitialRows() {
        int i = 0;
        if (i < intialRow) {
            for (int j = i; j < intialRow; j++) {
                addRow();
            }
        }
    }

    public void addRow() {
        DefaultTableModel model = (DefaultTableModel) ChequeViewTable.getModel();
        Vector datas = new Vector();
        for (int i = 0; i < ChequeViewTable.getModel().getColumnCount(); i++) {
            datas.addElement(null);
        }
        model.insertRow(ChequeViewTable.getRowCount(), datas);
    }

    public void addRowWithColor() {
        DefaultTableModel model = (DefaultTableModel) ChequeViewTable.getModel();
        Vector datas = new Vector();
        for (int i = 0; i < ChequeViewTable.getModel().getColumnCount(); i++) {
            datas.addElement(null);
        }
        model.isCellEditable(0, 0);
        model.insertRow(ChequeViewTable.getRowCount(), datas);
        TableColumnModel cm = ChequeViewTable.getColumnModel();
        CustomCellRenderer customCellRenderer3 = new CustomCellRenderer(1, Color.BLUE);
        cm.getColumn(0).setCellRenderer(customCellRenderer3);
        cm.getColumn(1).setCellRenderer(customCellRenderer3);
        cm.getColumn(2).setCellRenderer(customCellRenderer3);
        cm.getColumn(3).setCellRenderer(customCellRenderer3);
        cm.getColumn(4).setCellRenderer(customCellRenderer3);
        cm.getColumn(5).setCellRenderer(customCellRenderer3);
    }

    public void removeRow() {
        int i = ChequeViewTable.getSelectedRow();
        if (i != -1) {
            DefaultTableModel model = (DefaultTableModel) ChequeViewTable.getModel();
            model.removeRow(i);
            ChequeViewTable.getModel().setValueAt(i, i + 1, 0);
            ChequeViewTable.changeSelection(i + 1, 0, false, false);
        } else {
            JOptionPane.showMessageDialog(ChequeViewTable, "Please select row to remove ...");
        }
    }

    public int clearDatas() {
        int i = 1;
        DefaultTableModel model = (DefaultTableModel) ChequeViewTable.getModel();
        model.getDataVector().removeAllElements();
        ChequeViewTable.revalidate();
        addInitialRows();
        return i;
    }

    public void clearData() {
        DefaultTableModel model = (DefaultTableModel) ChequeViewTable.getModel();
        model.getDataVector().removeAllElements();
        ChequeViewTable.revalidate();
    }

    public void focusSet() {
        ChequeViewTable.requestFocus();
        ChequeViewTable.changeSelection(0, 1, false, false);
        ChequeViewTable.setCellSelectionEnabled(true);
    }
}
