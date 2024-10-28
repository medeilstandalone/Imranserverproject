package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.model.DrugModel;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.util.Value;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseWheelEvent;
import java.util.ArrayList;
import java.util.Vector;
import javax.swing.AbstractAction;
import javax.swing.JComponent;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.JOptionPane;
import javax.swing.KeyStroke;

public class GenericSearchTable {


    public JTable table1;
    public JScrollPane scrollPane = new JScrollPane();
    public String acc_no;
    public Logger log = Logger.getLogger(GenericSearchTable.class, "GenericSearch Table");
    public KeyStroke save = KeyStroke.getKeyStroke(KeyEvent.VK_F3, 0);
    public KeyStroke edit = KeyStroke.getKeyStroke(KeyEvent.VK_F6, 0);
    public KeyStroke can = KeyStroke.getKeyStroke(KeyEvent.VK_F8, 0);
    public KeyStroke reset = KeyStroke.getKeyStroke(KeyEvent.VK_F4, 0);
    public KeyStroke del = KeyStroke.getKeyStroke(KeyEvent.VK_F5, 0);
    public KeyStroke update = KeyStroke.getKeyStroke(KeyEvent.VK_F7, 0);
    public KeyStroke back = KeyStroke.getKeyStroke(KeyEvent.VK_LEFT, KeyEvent.CTRL_MASK);

    // Create Dynamic Table
    public JComponent createViewTable(final int col, Object[] colName, Class[] type, boolean[] canEdit, int[] width) {
        final Class[] types = type;
        final boolean[] canEditCols = canEdit;
        final int[] colWidth = width;

        table1 = new JTable();
        Vector cols = new Vector();
        Vector data = new Vector();

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
            table1.setModel(new javax.swing.table.DefaultTableModel(data, cols) {

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
            String msg = "Class : GenericSearchTable  Method : createViewTable()   = ".concat(e.getMessage());
            log.debug(msg);
        }
        //BankDetails.getColumnModel().getColumn(6).setCellRenderer(new DecimalFormatRenderer());
        table1.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        table1.getTableHeader().setBackground(new Color(226, 238, 244));
        table1.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
        table1.setShowGrid(true);
        table1.getTableHeader().setReorderingAllowed(false);
        table1.setSelectionMode(0);
        table1.setDragEnabled(false);
        for (int i = 0; i < len; i++) {
            table1.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }
        table1.addKeyListener(new KeyAdapter() {

            @Override
            public void keyReleased(KeyEvent e) {
            }
        });

        table1.addMouseListener(new MouseAdapter() {

            @Override
            public void mouseClicked(MouseEvent e) {
                final int i = table1.getSelectedRow();
                if (table1.getModel().getValueAt(i, 0) != null && table1.getModel().getValueAt(i, 1) != null && table1.getModel().getValueAt(i, 2) != null && table1.getModel().getValueAt(i, 3) != null && table1.getModel().getValueAt(i, 4) != null && table1.getModel().getValueAt(i, 5) != null) {
                    acc_no = (String) table1.getModel().getValueAt(i, 1);
                }
            }

            public void mouseWheelMoved(MouseWheelEvent e) {
                throw new UnsupportedOperationException("Not supported yet.");
            }

            public void mouseDragged(MouseEvent e) {
                throw new UnsupportedOperationException("Not supported yet.");
            }

            public void mouseMoved(MouseEvent e) {
                throw new UnsupportedOperationException("Not supported yet.");
            }
        });

        table1.getInputMap().put(save, "action");
        table1.getInputMap().put(edit, "action");
        table1.getInputMap().put(update, "action");
        table1.getInputMap().put(del, "action");
        table1.getInputMap().put(reset, "action");
        table1.getInputMap().put(can, "action");
        table1.getInputMap().put(back, "action");
        table1.getActionMap().put("action", new AbstractAction() {

            @Override
            public void actionPerformed(ActionEvent e) {
                table1.transferFocus();
            }
        });
        table1.setGridColor(new java.awt.Color(204, 204, 255));
        table1.setCellSelectionEnabled(false);
        table1.setRowSelectionAllowed(true);
        table1.setRowHeight(20);
        table1.setSelectionBackground(Color.LIGHT_GRAY);
        table1.setSelectionForeground(Color.RED);
        table1.revalidate();
        return table1;
    }

    public JComponent getScrollTable(JComponent jt) {
        table1 = (JTable) jt;
        scrollPane.add(table1);
        scrollPane.setViewportView(table1);
        return scrollPane;
    }

    public void addRow() {
        DefaultTableModel model = (DefaultTableModel) table1.getModel();
        Vector datas = new Vector();
        for (int i = 1; i < table1.getModel().getColumnCount(); i++) {
            datas.addElement(null);
        }
        model.insertRow(table1.getRowCount(), datas);
    }

    public void removeRow() {
        int i = table1.getSelectedRow();
        if (i != -1) {
            DefaultTableModel model = (DefaultTableModel) table1.getModel();
            model.removeRow(i);
            table1.getModel().setValueAt(i, i - 1, 0);
            table1.changeSelection(i - 1, 0, false, false);
        } else {
            JOptionPane.showMessageDialog(null, "Please select row to remove...");
        }
    }

    public void clearData() {
        drugsCount = 0;
        DefaultTableModel model = (DefaultTableModel) table1.getModel();
        model.getDataVector().removeAllElements();
        addRow();
        addRow();
        addRow();
        addRow();
        addRow();
        addRow();
        addRow();
        addRow();
        addRow();
        addRow();        
        addRow();        
        addRow();        
        addRow();
        table1.revalidate();
    }
    public void focusSet(int row, int col) {
        table1.requestFocus();
        table1.changeSelection(row, col, false, false);
        table1.setCellSelectionEnabled(true);
    }
    public void focusSet() {
        table1.requestFocus();
        table1.changeSelection(0, 1, false, false);
        table1.getModel().setValueAt("1", 0, 0);
        table1.setCellSelectionEnabled(true);
    }
    public long drugsCount = 0;
      public long LoadGenericSearchResult (DrugModel drugModel) {
        try {
            //Controller Instance
            com.vanuston.medeil.implementation.Drug drugController = (com.vanuston.medeil.implementation.Drug) RegistryFactory.getClientStub (RegistryConstants.Drug) ;
            int i = 0;
            clearData();
             String searchType = "generic";
             if((drugModel.getPassVale()==110) || (drugModel.getPassVale()==100)) {
                 table1.getColumnModel().getColumn(1).setHeaderValue("Item Name");
                 searchType = "generic";
             } else {
                 table1.getColumnModel().getColumn(1).setHeaderValue("Generic Name");
                 searchType = "product";
             }
             ArrayList<DrugModel> drugs = drugController.SearchRecord(drugModel);
             drugsCount = drugs.size ();
            if (drugs.size () > 10) {
                DefaultTableModel model = (DefaultTableModel) table1.getModel();
                model.getDataVector().removeAllElements();
                table1.revalidate();
                for (int j = 0; j < drugs.size (); j++) {
                    addRow();
                }
            }
            while (i < drugs.size ()) {
                drugModel =  drugs.get (i) ;
                table1.getModel().setValueAt(Value.Round(drugModel.getDrug_id(),0), i, 0);
                if(searchType.equalsIgnoreCase("generic")){
                    table1.getModel().setValueAt(drugModel.getDrug_name(), i, 1);
                }else {
                    table1.getModel().setValueAt(drugModel.getGeneric_name(), i, 1);
                }
                table1.getModel().setValueAt(drugModel.getDosage(), i, 2);
                table1.getModel().setValueAt(drugModel.getFormulation(), i, 3);
                table1.getModel().setValueAt(drugModel.getClassification() , i, 4) ;
                table1.getModel().setValueAt(drugModel.getSub_classification(), i, 5);
                table1.getModel().setValueAt(drugModel.getIndication(), i, 6);
                table1.getModel().setValueAt(drugModel.getMfr_name(), i, 7);
                table1.getModel().setValueAt(Value.Round(drugModel.getMrp(),2), i, 8);
                i++;
            }
            drugs.clear();
        } catch (Exception e) {
            String msg = "Class : GenericSearchTable Method : LoadGenericSearchResult()   = ".concat(e.getMessage());
            log.debug(msg);
        }
        return drugsCount;
    }
}
