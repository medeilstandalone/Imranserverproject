package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.implementation.Sales;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import java.awt.Color;
import java.awt.Component;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Vector;
import java.util.logging.Level;
import javafx.stage.Alert;
import javax.swing.AbstractAction;
import javax.swing.JTable;
import javax.swing.KeyStroke;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableCellRenderer;

public final class GetSubstituteDrugs extends javax.swing.JDialog {

    static Logger log = Logger.getLogger(GetSalesDrugData.class, "Utilities");
    public static KeyStroke escape = KeyStroke.getKeyStroke(KeyEvent.VK_ESCAPE, 0);
    String drug_code = null;
    String drug_name = null;
    String fName = null;
    JTable jcomp;
    CommonImplements commonController;
    public GetSubstituteDrugs() throws RemoteException, NotBoundException {
        initComponents();
        commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
    }

    public GetSubstituteDrugs(JTable jc, String ss) throws NotBoundException {
        try {
            initComponents();
            setLocationRelativeTo(null);
            commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
            drug_code = ss;
            jcomp = jc;
            callSub();
            drug_name = commonController.getProduct(drug_code);
            jTextField1.setText(drug_name);
        } catch (RemoteException ex) {
            String ss1 = "Class : GetSubstituteDrugs  Method : GetSubstituteDrugs(JTable jc, String ss)   Exception : " + ex.getMessage();
            log.debug(ss1);
        }
    }

    public GetSubstituteDrugs(JTable jc, String ss, String fName) throws NotBoundException {
        try {
            this.fName = fName;
            drug_code = ss;
            commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
            drug_name = commonController.getProduct(drug_code);
            initComponents();
            setLocationRelativeTo(null);
            jcomp = jc;
            callSub();
            jTextField1.setText(drug_name);
        } catch (RemoteException ex) {
            String ss1 = "Class : GetSubstituteDrugs  Method : GetSubstituteDrugs(JTable jc, String ss, String fName)   Exception : " + ex.getMessage();
            log.debug(ss1);
        }
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        priceGroup = new javax.swing.ButtonGroup();
        stockGroup = new javax.swing.ButtonGroup();
        jPanel1 = new javax.swing.JPanel();
        jTextField1 = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable() {

            @Override
            public boolean isCellEditable(int rowIndex, int colIndex) {
                return false;   //Disallow the editing of any cell
            }
            @Override
            public Component prepareRenderer(TableCellRenderer renderer, int row, int column)
            {
                Component c = super.prepareRenderer(renderer, row, column);
                int a = super.getColumnCount();

                Object val = getModel().getValueAt(row, 12);
                Object stkQ = getModel().getValueAt(row, 6);

                if (val!=null && stkQ!=null)
                {
                    String type = val.toString().trim();
                    String typ = stkQ.toString().trim();
                    int t = Integer.parseInt(typ);

                    if(type.equals("1"))
                    {
                        //                                            c.setBackground( Color.ORANGE);
                        //                                            c.setBackground( Color.decode("#cc3333")); 225,35,35
                        c.setBackground( new Color(225,35,35));
                        c.setForeground(Color.WHITE);
                        this.setToolTipText(" This red Background shows Banned Drug");
                    }else if (t <= 0){
                        //                                             c.setBackground( Color.RED);
                        //                                             c.setBackground( Color.decode("#ebec94")); 235,235,145
                        c.setBackground( new Color(235,235,145));
                        c.setForeground(Color.BLACK);
                        this.setToolTipText(" This yellow Background shows Out Of Stocks");
                    }else{
                        c.setBackground( Color.WHITE);
                        c.setForeground(Color.BLACK);
                        this.setToolTipText(" This yellow Background shows Out Of Stocks");
                    }

                    // }
            }
            /*if (!c.getBackground().equals(getSelectionBackground()) && stkQ!=null)
            {
                String type = stkQ.toString().trim();
                int t = Integer.parseInt(type);
                if(t<=0)
                {
                    c.setBackground( Color.RED);
                    c.setForeground(Color.darkGray);
                    this.setToolTipText(" This Red Background shows Out Of Stocks");
                }else{
                    c.setBackground( Color.WHITE);
                    c.setForeground(Color.BLACK);
                    this.setToolTipText(" This Red Background shows Out Of Stocks");
                }
            }*/

            return c;
        }
    };
    jRadioButton1 = new javax.swing.JRadioButton();
    jRadioButton2 = new javax.swing.JRadioButton();
    jLabel3 = new javax.swing.JLabel();
    jLabel4 = new javax.swing.JLabel();
    jRadioButton3 = new javax.swing.JRadioButton();
    jRadioButton4 = new javax.swing.JRadioButton();
    Status = new javax.swing.JLabel();

    setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
    setTitle("Substiute Drugs - MEDEIL");
    setBounds(new java.awt.Rectangle(0, 0, 0, 0));
    setModal(true);
    setResizable(false);
    addKeyListener(new java.awt.event.KeyAdapter() {
        public void keyReleased(java.awt.event.KeyEvent evt) {
            formKeyReleased(evt);
        }
    });
    getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

    jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)), " Substitute Drug For - "+drug_name+" "));
    jPanel1.setLayout(null);

    jTextField1.setEditable(false);
    jPanel1.add(jTextField1);
    jTextField1.setBounds(160, 20, 370, 20);

    jTable1.setModel(new javax.swing.table.DefaultTableModel(
        new Object [][] {
            {null, null, null, null},
            {null, null, null, null},
            {null, null, null, null},
            {null, null, null, null}
        },
        new String [] {
            "Title 1", "Title 2", "Title 3", "Title 4"
        }
    ));
    jTable1.setRowHeight(25);
    jTable1.addMouseListener(new java.awt.event.MouseAdapter() {
        public void mouseClicked(java.awt.event.MouseEvent evt) {
            jTable1MouseClicked(evt);
        }
    });
    jTable1.addKeyListener(new java.awt.event.KeyAdapter() {
        public void keyPressed(java.awt.event.KeyEvent evt) {
            jTable1KeyPressed(evt);
        }
        public void keyReleased(java.awt.event.KeyEvent evt) {
            jTable1KeyReleased(evt);
        }
    });
    jScrollPane1.setViewportView(jTable1);

    jPanel1.add(jScrollPane1);
    jScrollPane1.setBounds(10, 60, 990, 300);

    priceGroup.add(jRadioButton1);
    jRadioButton1.setMnemonic('L');
    jRadioButton1.setSelected(true);
    jRadioButton1.setText("Low");
    jRadioButton1.addActionListener(new java.awt.event.ActionListener() {
        public void actionPerformed(java.awt.event.ActionEvent evt) {
            jRadioButton1ActionPerformed(evt);
        }
    });
    jPanel1.add(jRadioButton1);
    jRadioButton1.setBounds(590, 20, 60, 23);

    priceGroup.add(jRadioButton2);
    jRadioButton2.setMnemonic('H');
    jRadioButton2.setText("High");
    jRadioButton2.addActionListener(new java.awt.event.ActionListener() {
        public void actionPerformed(java.awt.event.ActionEvent evt) {
            jRadioButton2ActionPerformed(evt);
        }
    });
    jPanel1.add(jRadioButton2);
    jRadioButton2.setBounds(660, 20, 60, 23);

    jLabel3.setText("Price     :");
    jPanel1.add(jLabel3);
    jLabel3.setBounds(540, 20, 90, 20);

    jLabel4.setText("Stock Qty's    :");
    jPanel1.add(jLabel4);
    jLabel4.setBounds(730, 20, 110, 20);

    stockGroup.add(jRadioButton3);
    jRadioButton3.setMnemonic('i');
    jRadioButton3.setSelected(true);
    jRadioButton3.setText("High");
    jRadioButton3.addActionListener(new java.awt.event.ActionListener() {
        public void actionPerformed(java.awt.event.ActionEvent evt) {
            jRadioButton3ActionPerformed(evt);
        }
    });
    jPanel1.add(jRadioButton3);
    jRadioButton3.setBounds(810, 20, 60, 23);

    stockGroup.add(jRadioButton4);
    jRadioButton4.setMnemonic('w');
    jRadioButton4.setText("Low");
    jRadioButton4.addActionListener(new java.awt.event.ActionListener() {
        public void actionPerformed(java.awt.event.ActionEvent evt) {
            jRadioButton4ActionPerformed(evt);
        }
    });
    jPanel1.add(jRadioButton4);
    jRadioButton4.setBounds(880, 20, 80, 23);

    Status.setForeground(new java.awt.Color(252, 76, 76));
    jPanel1.add(Status);
    Status.setBounds(270, 60, 700, 0);

    getContentPane().add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, 1010, 370));

    pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jRadioButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRadioButton1ActionPerformed
        callSub();
    }//GEN-LAST:event_jRadioButton1ActionPerformed

    private void jRadioButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRadioButton2ActionPerformed
        callSub();
    }//GEN-LAST:event_jRadioButton2ActionPerformed

    private void jRadioButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRadioButton3ActionPerformed
        callSub();
    }//GEN-LAST:event_jRadioButton3ActionPerformed

    private void jRadioButton4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jRadioButton4ActionPerformed
        callSub();
    }//GEN-LAST:event_jRadioButton4ActionPerformed

    private void jTable1KeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTable1KeyReleased
        if (evt.getKeyCode() == KeyEvent.VK_ENTER) {
            int r = jTable1.getSelectedRow();
            if (r != -1) {
                setSalesValues();
            }
        }
    }//GEN-LAST:event_jTable1KeyReleased

    private void formKeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_formKeyReleased
        if (evt.getKeyCode() == KeyEvent.VK_ESCAPE) {
            this.dispose();
        }
    }//GEN-LAST:event_formKeyReleased

    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTable1MouseClicked
        int r = jTable1.getSelectedRow();
        if (r != -1) {
            setSalesValues();
        }
    }//GEN-LAST:event_jTable1MouseClicked

    private void jTable1KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTable1KeyPressed
        if (evt.getKeyCode() == KeyEvent.VK_ENTER) {
            int r = jTable1.getSelectedRow();
            if (r != -1) {
                setSalesValues();
            }
        }
    }//GEN-LAST:event_jTable1KeyPressed
    public void stopEditing() {
        if (jcomp.getCellEditor() != null) {
            jcomp.getCellEditor().stopCellEditing();
        }
    }

    void callSub() {
        jTable1.getInputMap().put(escape, "CloseWindow");
        jTable1.getActionMap().put("CloseWindow", new AbstractAction("CloseWindow") {

            @Override
            public void actionPerformed(ActionEvent evt) {
                dispose();
            }
        });
        int pp = 0;
        int ss = 1;
        if (jRadioButton2.isSelected()) {
            pp = 1;
        }
        if (jRadioButton4.isSelected()) {
            ss = 0;
        }
        loadSub(pp, ss);
    }

    public void setSalesValues() {
        stopEditing();
        final int i = jTable1.getSelectedRow();
        final int j = jcomp.getSelectedRow();
        int rr = jcomp.getRowCount();
        try {
            if (rr > 0) {
                String dname = "" + jTable1.getModel().getValueAt(i, 0);
                String dcode = "" + jTable1.getModel().getValueAt(i, 1);
                String mfgname = "" + jTable1.getModel().getValueAt(i, 2);
                String dosage = "" + jTable1.getModel().getValueAt(i, 3);
                String generic = "" + jTable1.getModel().getValueAt(i, 4);
                String batch = "" + jTable1.getModel().getValueAt(i, 5);
                String stkQty = "" + jTable1.getModel().getValueAt(i, 6);
                String uprice = "" + jTable1.getModel().getValueAt(i, 7);
                String mrp = "" + jTable1.getModel().getValueAt(i, 8);
                String vat = "" + jTable1.getModel().getValueAt(i, 9);
                String edate = "" + jTable1.getModel().getValueAt(i, 10);
                int bann = Integer.parseInt(jTable1.getModel().getValueAt(i, 12).toString());
                boolean[] flag = new boolean[jcomp.getRowCount()];
                int flags = 0;
                for (int val = 0; val < jcomp.getRowCount(); val++) {
                    if (j != 0) {
                        if (val == j && jcomp.getModel().getValueAt(val, 1) == null); else if (jcomp.getModel().getValueAt(val, 1) == null); else if (jcomp.getModel().getValueAt(val, 1).equals(dcode) && jcomp.getModel().getValueAt(val, 5).equals(batch)) {
                            flag[val] = true;
                            flags = 1;
                            this.dispose();
                            Alert.inform("already this medicine \"" + dname + "\" and Batch \"" + batch + "\" is added. please check");
                            jcomp.requestFocus();
                            jcomp.changeSelection(val, 4, false, false);
                            jcomp.setEditingColumn(4);
                        }
                    }
                }
                boolean check = true;
                if (bann != 0) {
                    check = Alert.confirm("Sales Form", "This medicine \"" + dname + " \" is banned drug. Do u want to add this one ?");
                }
                if (flags != 1 && check) {
                    jcomp.getModel().setValueAt(j + 1, j, 0);
                    jcomp.getModel().setValueAt(dname + "_" + dosage.trim(), j, 2);
                    if (fName.equalsIgnoreCase("Sales")) {
                        jcomp.getModel().setValueAt(dcode, j, 1);
                    } else if (fName.equalsIgnoreCase("CounterSales")) {
                        jcomp.getModel().setValueAt(dcode, j, 12);
                    }
                    jcomp.getModel().setValueAt(mfgname, j, 3);
                    jcomp.getModel().setValueAt(Integer.parseInt("0"), j, 4);
                    jcomp.getModel().setValueAt(batch, j, 5);
                    jcomp.getModel().setValueAt(edate, j, 6);
                    if (uprice == null); else if (Double.parseDouble(uprice) == 0.0) {
                        jcomp.getModel().setValueAt(Integer.parseInt("0"), j, 7);
                    } else {
                        jcomp.getModel().setValueAt(Double.parseDouble(uprice), j, 7);
                    }
                    jcomp.getModel().setValueAt(Double.parseDouble(mrp), j, 8);
                    jcomp.getModel().setValueAt(Double.parseDouble("0"), j, 9);
                    jcomp.getModel().setValueAt("0.00", j, 10);
                    if (vat.equals("0.00") || vat == null) {
                        jcomp.getModel().setValueAt(Double.parseDouble("0"), j, 11);
                    } else {
                        jcomp.getModel().setValueAt(Double.parseDouble(vat), j, 11);
                    }
                    this.dispose();
                    jcomp.requestFocus();
                    jcomp.changeSelection(j, 4, false, false);
                }
            }
            jTextField1.setText("");
        } catch (Exception ex) {
            String ss = "Class : GetSubstituteDrugs  Method : setSalesValues   Exception : " + ex.getMessage();
            log.debug(ss);
        }

    }

    void loadSub(int p, int st) {
        stopEditing();
        String value = drug_code;
        int pr = p;
        int stk = st;
        Vector col = new Vector();
        Vector data = new Vector();
        try {
            ResultSet rs;
            Statement stmt = DBConnection.getStatement();
            String query;
            col.addElement("Item Name");
            col.addElement("Item Code");
            col.addElement("MFR Name");
            col.addElement("Dosage");
            col.addElement("Generic");
            col.addElement("Batch");
            col.addElement("Stock Qty");
            col.addElement("Unit Price");
            col.addElement("MRP");
            col.addElement("VAT");
            col.addElement("Expiry Date");
            col.addElement("Formulation");
            col.addElement("Banned");
            if (value == null || value.equals("")) {
            } else {                                                          
                   Sales salesController = (Sales) RegistryFactory.getClientStub(RegistryConstants.Sales);
                   data = salesController.loadSubstituteDrug(value,pr,stk);
                   Status.setText("");
                   Status.setForeground(Color.black);
                   jTable1.requestFocus();
                   jTable1.changeSelection(0, 0, true, true);                 
//                    Status.setText("No other substitute drug for this product.");
//                    Status.setForeground(Color.red);                
            }
            jTable1.setModel(new DefaultTableModel(data, col));
            jTable1.removeColumn(jTable1.getColumnModel().getColumn(11));
            jTable1.revalidate();
            jTable1.repaint();
            
        }catch (Exception ex) {
            String ss = " Class : GetSubstituteDrugs   Method: loadStockTable   NullPointerException : " + ex.getMessage();
            log.debug(ss);
        }
    }

    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(new Runnable() {

            @Override
            public void run() {
                try {
                    new GetSubstituteDrugs(new JTable(), "4788").setVisible(true);
                } catch (NotBoundException ex) {
                    java.util.logging.Logger.getLogger(GetSubstituteDrugs.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        });
    }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel Status;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JRadioButton jRadioButton1;
    private javax.swing.JRadioButton jRadioButton2;
    private javax.swing.JRadioButton jRadioButton3;
    private javax.swing.JRadioButton jRadioButton4;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    private javax.swing.JTextField jTextField1;
    private javax.swing.ButtonGroup priceGroup;
    private javax.swing.ButtonGroup stockGroup;
    // End of variables declaration//GEN-END:variables
}
