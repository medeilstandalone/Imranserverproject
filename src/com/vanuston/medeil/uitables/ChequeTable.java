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
import java.awt.event.KeyAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseAdapter;
import java.lang.String;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Vector;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableCellRenderer;
import javax.swing.table.TableColumnModel;

public class ChequeTable {

    Logger log = Logger.getLogger(ChequeTable.class, "Finance");


    public ChequeTable() throws RemoteException, NotBoundException {

      
    }
    public String[] acc_chq_id = new String[3];
    public int intialRow = 0;
    public JTable ChequeTable;
    public JScrollPane stockStScrollPane = new JScrollPane();
    public KeyStroke calChequeTable = KeyStroke.getKeyStroke(KeyEvent.VK_T, KeyEvent.CTRL_MASK);
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
        final Class[] types = {java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class};
        final boolean[] canEditCols = {false, false, false, false, false, false, false, false, false, false, false, false};
        final int[] colWidth = {40, 130, 110, 60, 90, 70, 70, 70, 70};
        Object[] colName = {"S.No", "Account No.", "Book ID", "Leaves", "Remaining ", "Issued ", "First No.", "Last No.", "Status"};
        intialRow = 9;
        ChequeTable = new JTable() {

            @Override
            public Component prepareRenderer(TableCellRenderer renderer, int row, int column) {
                Component c = super.prepareRenderer(renderer, row, column);
                Color completeColor = new Color(247, 222, 170);
                Color useColor = new Color(210, 245, 190);
                Object val = getModel().getValueAt(row, 8);
                Object l = getModel().getValueAt(row, 3);
                Object r = getModel().getValueAt(row, 4);
                Integer leaves = 0;
                Integer remaining = 0;
                if (l != null) {
                    leaves = Integer.parseInt(l.toString());
                }
                if (r != null) {
                    remaining = Integer.parseInt(r.toString());
                }
                if (val != null && l != null && r != null) {
                    if (isRowSelected(row)) {
                        c.setBackground(Color.DARK_GRAY);
                        c.setForeground(Color.WHITE);
                    } else if (val.equals("Completed")) {
                        c.setBackground(completeColor);
                        c.setForeground(Color.black);
                    } else if (leaves > remaining) {
                        c.setBackground(useColor);
                        c.setForeground(Color.black);
                    } else {
                        c.setBackground(Color.WHITE);
                        c.setForeground(Color.black);
                    }
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
            ChequeTable.setModel(new javax.swing.table.DefaultTableModel(data, cols) {

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
            String msg = "Class : ChequeTable  Method : createTable ()   = " + ex.getMessage();
            log.debug(msg);
        }


//        map.removeKeyStrokeBinding(ctrlc);


        ChequeTable.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        ChequeTable.getTableHeader().setBackground(new Color(226, 238, 244));
        ChequeTable.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
        ChequeTable.setRowSelectionAllowed(true);
        ChequeTable.setShowGrid(true);
        ChequeTable.getTableHeader().setReorderingAllowed(false);
        for (int i = 0; i < len; i++) {
            ChequeTable.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }
        ChequeTable.setGridColor(new java.awt.Color(204, 204, 255));
        ChequeTable.setCellSelectionEnabled(false);
        ChequeTable.setColumnSelectionAllowed(false);
        ChequeTable.setRowSelectionAllowed(true);
        ChequeTable.setRowSelectionInterval(0, 1);


// this line added for 26-11-2011 for disable copy option////////////////////////////////////////////////////

        AbstractAction disabled = new AbstractAction() {

            public boolean isEnabled() {
                return false;
            }

            public void actionPerformed(ActionEvent e) {
            }
        };



        ChequeTable.getInputMap(JComponent.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT).put(KeyStroke.getKeyStroke(KeyEvent.VK_C, KeyEvent.CTRL_MASK), "none");
        ChequeTable.getActionMap().put("none", disabled);
/////////////////////////////////////////////////////////////////////



        ChequeTable.getInputMap().put(save, "actionF2");
        ChequeTable.getInputMap().put(edit, "actionF2");
        ChequeTable.getInputMap().put(reset, "actionF2");
        ChequeTable.getInputMap().put(can, "actionF2");
        ChequeTable.getInputMap().put(update, "actionF2");
        ChequeTable.getInputMap().put(del, "actionF2");
        ChequeTable.getInputMap().put(back, "actionF2");
        ChequeTable.getInputMap().put(rR, "actionF2");
        ChequeTable.getActionMap().put("actionF2", new AbstractAction() {

            @Override
            public void actionPerformed(ActionEvent e) {
                ChequeTable.transferFocus();
            }
        });
        ChequeTable.setRowHeight(20);
        ChequeTable.setSelectionMode(0);
        ChequeTable.revalidate();
        loadChequeValues();
        ChequeTable.addKeyListener(new KeyAdapter() {

            @Override
            public void keyReleased(KeyEvent e) {
                setChequeID();
            }
        });

        ChequeTable.addMouseListener(new MouseAdapter() {

            @Override
            public void mouseClicked(MouseEvent e) {
                setChequeID();
            }
            @Override
             public void mouseReleased(MouseEvent e) {
                setChequeID();
            }

        });




        return ChequeTable;
    }

    public JComponent getScrollTable(JComponent jt) {
        ChequeTable = (JTable) jt;
        stockStScrollPane.add(ChequeTable);
        stockStScrollPane.setViewportView(ChequeTable);
        return stockStScrollPane;
    }

    public void setChequeID() {
        final int i = ChequeTable.getSelectedRow();
        if (ChequeTable.getModel().getValueAt(i, 1) != null && ChequeTable.getModel().getValueAt(i, 2) != null) {
            acc_chq_id[0] = (String) ChequeTable.getModel().getValueAt(i, 1);
            acc_chq_id[1] = (String) ChequeTable.getModel().getValueAt(i, 2);
            acc_chq_id[2] = (String) ChequeTable.getModel().getValueAt(i, 8);
        }
    }

    public void loadChequeValues() {
        try {
            clearData();
            int i = 0;
            List<ChequeBookModel> listValues = new ArrayList<ChequeBookModel>();

            ChequeBookModel chqModel;
             ChequeBook chqcon= (ChequeBook) RegistryFactory.getClientStub(RegistryConstants.ChequeBook);;
            listValues = chqcon.loadChequeTableValues();
            for (i = 0; i < listValues.size(); i++) {
                chqModel = new ChequeBookModel();
                chqModel = listValues.get(i);
                addRow();
                ChequeTable.getModel().setValueAt(i + 1, i, 0);
                ChequeTable.getModel().setValueAt(chqModel.getAccountNumber(), i, 1);
                ChequeTable.getModel().setValueAt(chqModel.getBookID(), i, 2);
                ChequeTable.getModel().setValueAt(chqModel.getLeaves(), i, 3);
                ChequeTable.getModel().setValueAt(chqModel.getRemaining(), i, 4);
                ChequeTable.getModel().setValueAt(chqModel.getIssuedDate(), i, 5);
                ChequeTable.getModel().setValueAt(chqModel.getStartNumber(), i, 6);
                ChequeTable.getModel().setValueAt(chqModel.getEndNumber(), i, 7);
                ChequeTable.getModel().setValueAt(chqModel.getStatus(), i, 8);
            }

            if (i < intialRow) {
                for (int j = i; j < intialRow; j++) {
                    addBasicRows();
                }
            }
            ChequeTable.clearSelection();

        } catch (Exception e) {
            String msg = "Class : ChequeTable  Method : loadChequeValues ()   = " + e.getMessage();
            log.debug(msg);
        }
    }

    public void addRow() {
        DefaultTableModel model = (DefaultTableModel) ChequeTable.getModel();
        Vector datas = new Vector();
        for (int i = 0; i < ChequeTable.getModel().getColumnCount(); i++) {
            datas.addElement(null);
        }
        model.insertRow(ChequeTable.getRowCount(), datas);
    }

    public void addRowWithColor() {
        DefaultTableModel model = (DefaultTableModel) ChequeTable.getModel();
        Vector datas = new Vector();
        for (int i = 0; i < ChequeTable.getModel().getColumnCount(); i++) {
            datas.addElement(null);
        }
        model.isCellEditable(0, 0);
        model.insertRow(ChequeTable.getRowCount(), datas);
        TableColumnModel cm = ChequeTable.getColumnModel();
        CustomCellRenderer customCellRenderer3 = new CustomCellRenderer(1, Color.BLUE);
        cm.getColumn(0).setCellRenderer(customCellRenderer3);
        cm.getColumn(1).setCellRenderer(customCellRenderer3);
        cm.getColumn(2).setCellRenderer(customCellRenderer3);
        cm.getColumn(3).setCellRenderer(customCellRenderer3);
        cm.getColumn(4).setCellRenderer(customCellRenderer3);
        cm.getColumn(5).setCellRenderer(customCellRenderer3);
    }

    public void removeRow() {
        int i = ChequeTable.getSelectedRow();
        if (i != -1) {
            DefaultTableModel model = (DefaultTableModel) ChequeTable.getModel();
            model.removeRow(i);
            ChequeTable.getModel().setValueAt(i, i + 1, 0);
            ChequeTable.changeSelection(i + 1, 0, false, false);
        } else {
            JOptionPane.showMessageDialog(ChequeTable, "Please select row to remove ...");
        }
    }

    public int clearDatas() {
        int i = 1;
        DefaultTableModel model = (DefaultTableModel) ChequeTable.getModel();
        model.getDataVector().removeAllElements();
        ChequeTable.revalidate();
        addBasicRows();
        return i;
    }

    public void clearData() {
        DefaultTableModel model = (DefaultTableModel) ChequeTable.getModel();
        model.getDataVector().removeAllElements();
        ChequeTable.revalidate();
    }

    public void addBasicRows() {
        for (int i = 0; i < intialRow; i++) {
            addRow();
        }

    }

    public void focusSet() {
        ChequeTable.requestFocus();
        ChequeTable.changeSelection(0, 1, false, false);
        ChequeTable.setCellSelectionEnabled(true);
    }
}
