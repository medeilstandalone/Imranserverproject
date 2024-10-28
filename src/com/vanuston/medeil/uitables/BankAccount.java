package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.model.BankAccountModel;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseWheelEvent;
import java.util.List;
import java.util.Vector;
import javax.swing.AbstractAction;
import javax.swing.JComponent;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.JOptionPane;
import javax.swing.KeyStroke;

public class BankAccount {

    public JTable BankDetails;
    public JScrollPane scrollPane = new JScrollPane();
    public String acc_no;
    public Logger log = Logger.getLogger(BankAccount.class, "Bank Details");
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

        BankDetails = new JTable();
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
            BankDetails.setModel(new javax.swing.table.DefaultTableModel(data, cols) {

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
            String msg = "Class : Bank Details  Method : createViewTable()   = ".concat(e.getMessage());
            log.debug(msg);
        }
        //BankDetails.getColumnModel().getColumn(6).setCellRenderer(new DecimalFormatRenderer());
        BankDetails.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        BankDetails.getTableHeader().setBackground(new Color(226, 238, 244));
        BankDetails.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
        BankDetails.setShowGrid(true);
        BankDetails.getTableHeader().setReorderingAllowed(false);
        BankDetails.setSelectionMode(0);
        BankDetails.setDragEnabled(false);
        for (int i = 0; i < len; i++) {
            BankDetails.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }
        BankDetails.addKeyListener(new KeyAdapter() {

            @Override
            public void keyReleased(KeyEvent e) {
                 final int i = BankDetails.getSelectedRow();
                if (BankDetails.getModel().getValueAt(i, 0) != null && BankDetails.getModel().getValueAt(i, 1) != null ) {
                    acc_no = (String) BankDetails.getModel().getValueAt(i, 1);
                }else{
                     acc_no="";
                }
            }
        });

        BankDetails.addMouseListener(new MouseAdapter() {

            @Override
            public void mouseClicked(MouseEvent e) {
                final int i = BankDetails.getSelectedRow();
                if (BankDetails.getModel().getValueAt(i, 0) != null && BankDetails.getModel().getValueAt(i, 1) != null ) {
                    acc_no = (String) BankDetails.getModel().getValueAt(i, 1);
                }else{
                     acc_no="";
                }
            }
            @Override
            public void mouseReleased(MouseEvent e) {
                final int i = BankDetails.getSelectedRow();
                if (BankDetails.getModel().getValueAt(i, 0) != null && BankDetails.getModel().getValueAt(i, 1) != null ) {
                    acc_no = (String) BankDetails.getModel().getValueAt(i, 1);
                }else{
                     acc_no="";
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

        BankDetails.getInputMap().put(save, "action");
        BankDetails.getInputMap().put(edit, "action");
        BankDetails.getInputMap().put(update, "action");
        BankDetails.getInputMap().put(del, "action");
        BankDetails.getInputMap().put(reset, "action");
        BankDetails.getInputMap().put(can, "action");
        BankDetails.getInputMap().put(back, "action");
        BankDetails.getActionMap().put("action", new AbstractAction() {

            @Override
            public void actionPerformed(ActionEvent e) {
                BankDetails.transferFocus();
            }
        });
        BankDetails.setGridColor(new java.awt.Color(204, 204, 255));
        BankDetails.setCellSelectionEnabled(false);
        BankDetails.setRowSelectionAllowed(true);
        BankDetails.setRowHeight(20);
        BankDetails.setSelectionBackground(Color.LIGHT_GRAY);
        BankDetails.setSelectionForeground(Color.RED);
        BankDetails.revalidate();
        return BankDetails;
    }

    public JComponent getScrollTable(JComponent jt) {
        BankDetails = (JTable) jt;
        scrollPane.add(BankDetails);
        scrollPane.setViewportView(BankDetails);
        return scrollPane;
    }

    public void addRow() {
        DefaultTableModel model = (DefaultTableModel) BankDetails.getModel();
        Vector datas = new Vector();
        for (int i = 1; i < BankDetails.getModel().getColumnCount(); i++) {
            datas.addElement(null);
        }
        model.insertRow(BankDetails.getRowCount(), datas);
    }

    public void removeRow() {
        int i = BankDetails.getSelectedRow();
        if (i != -1) {
            DefaultTableModel model = (DefaultTableModel) BankDetails.getModel();
            model.removeRow(i);
            BankDetails.getModel().setValueAt(i, i - 1, 0);
            BankDetails.changeSelection(i - 1, 0, false, false);
        } else {
            JOptionPane.showMessageDialog(null, "Please select row to remove...");
        }
    }

    public void clearData() {
        DefaultTableModel model = (DefaultTableModel) BankDetails.getModel();
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
        BankDetails.revalidate();
    }

    public void focusSet(int row, int col) {
        BankDetails.requestFocus();
        BankDetails.changeSelection(row, col, false, false);
        BankDetails.setCellSelectionEnabled(true);
    }

    public void focusSet() {
        BankDetails.requestFocus();
        BankDetails.changeSelection(0, 1, false, false);
        BankDetails.getModel().setValueAt("1", 0, 0);
        BankDetails.setCellSelectionEnabled(true);
    }

    public void LoadBankDetails() {
        try {
            //Controller Instance
            com.vanuston.medeil.implementation.BankAccount bankAccountController = (com.vanuston.medeil.implementation.BankAccount) RegistryFactory.getClientStub (RegistryConstants.BankAccount) ;
//            com.vanuston.medeil.implementation.BankAccount bankAccountController = new BankAccountController () ;;
            int i = 0;
            clearData();
            BankAccountModel bankAccountModel = (BankAccountModel) bankAccountController.viewRecord("") ;
            List<BankAccountModel> bankAccounts = bankAccountModel.getBankAccountModelList () ;
            if (bankAccounts.size () > 10) {
                DefaultTableModel model = (DefaultTableModel) BankDetails.getModel();
                model.getDataVector().removeAllElements();
                BankDetails.revalidate();
                for (int j = 0; j < bankAccounts.size (); j++) {
                    addRow();
                }
            }
            while (i < bankAccounts.size ()) {
                bankAccountModel = bankAccounts.get (i) ;
                BankDetails.getModel().setValueAt(i + 1, i, 0);
                BankDetails.getModel().setValueAt(bankAccountModel.getAccountNumber (), i, 1);
                BankDetails.getModel().setValueAt(bankAccountModel.getAccountHolder (), i, 2);
                BankDetails.getModel().setValueAt(bankAccountModel.getAccountType (), i, 3);
                BankDetails.getModel().setValueAt(bankAccountModel.getBankName() + "," + bankAccountModel.getBranch (), i, 4) ;
                BankDetails.getModel().setValueAt(bankAccountModel.getAddress (), i, 5);
                i++;                
            }

//            ResultSet rs = null;
//            rs = DBConnection.getStatement().executeQuery("select * from bank_details where bd_flag_id = '0'");
//            rs.last();
//            int cnt = rs.getRow();
//            rs.beforeFirst();
//            if (cnt > 10) {
//                DefaultTableModel model = (DefaultTableModel) BankDetails.getModel();
//                model.getDataVector().removeAllElements();
//                BankDetails.revalidate();
//                for (int j = 0; j < cnt; j++) {
//                    addRow();
//                }
//            }
//            while (rs.next()) {
//                BankDetails.getModel().setValueAt(r + 1, i, 0);
//                BankDetails.getModel().setValueAt(rs.getString("acc_number"), i, 1);
//                BankDetails.getModel().setValueAt(rs.getString("acc_holder"), i, 2);
//                BankDetails.getModel().setValueAt(rs.getString("acc_type"), i, 3);
//                String bname = rs.getString("bank_name");
//                String branch = rs.getString("branch");
//                String bb = bname +","+ branch;
//                BankDetails.getModel().setValueAt(bb, i, 4);
//                BankDetails.getModel().setValueAt(rs.getString("address"), i, 5);
//                i++;
//                r++;
//            }
        } catch (Exception e) {
            String msg = "Class : Bank Details Method : LoadBankDetails()   = ".concat(e.getMessage());
            log.debug(msg);
        }
    }
}
