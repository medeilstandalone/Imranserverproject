package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.implementation.Sales;
import com.vanuston.medeil.model.SalesModel;
import com.vanuston.medeil.model.StockModel;
import com.vanuston.medeil.util.*;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import java.text.SimpleDateFormat;
import java.util.Vector;
import javax.swing.*;
import javax.swing.table.DefaultTableColumnModel;
import javax.swing.table.DefaultTableModel;
import com.vanuston.medeil.util.DecimalFormatRenderer;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.Value;

public class TempStocks extends javax.swing.JDialog {

    int ss1 = 0;
    String iname = "";
    String code = "";
    String dosage = "";
    int height = 25;
    static int isBanned = 0;
    JDialog srt;
    public static KeyStroke escape = KeyStroke.getKeyStroke(KeyEvent.VK_ESCAPE, 0);
    static Logger log = Logger.getLogger(TempStocks.class, "utilities");
    public TempStocks(JDialog parent, JTable jt, String name, String code, String dos) {
        srt = parent;
        iname = name;
        this.code = code;
        dosage = dos;
        initComponents();
        setLocationRelativeTo(null);
        jTable1.changeSelection(0, 0, false, false);
        jTable1.getActionMap().put("CloseWindow", new AbstractAction("CloseWindow") {

            @Override
            public void actionPerformed(ActionEvent evt) {
                dispose();
            }
        });
    }

    public TempStocks(JDialog parent, String name, String code) {
        srt = parent;
        iname = name;
        this.code = code;
        initComponents();
        setLocationRelativeTo(null);
        jTable1.changeSelection(0, 0, false, false);
        jTable1.getInputMap().put(escape, "CloseWindow");
        jTable1.getActionMap().put("CloseWindow", new AbstractAction("CloseWindow") {

            @Override
            public void actionPerformed(ActionEvent evt) {
                dispose();
            }
        });
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jButton1 = new javax.swing.JButton();
        jButton2 = new javax.swing.JButton();
        jButton3 = new javax.swing.JButton();
        jButton4 = new javax.swing.JButton();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Insert Stock for the Item :"+iname);
        setBounds(new java.awt.Rectangle(0, 0, 0, 0));
        setModal(true);
        setResizable(false);
        getContentPane().setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jPanel1.setBorder(javax.swing.BorderFactory.createTitledBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)), iname));

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null}
            },
            new String [] {
                "Batch No", "Qty", "Packing", "Expiry Date", "MRP"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.String.class, java.lang.Integer.class, java.lang.Integer.class, java.lang.String.class, java.lang.Double.class
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }
        });
        jTable1.setColumnSelectionAllowed(true);
        jTable1.setGridColor(new java.awt.Color(204, 204, 255));
        jTable1.setRowHeight(25);
        jTable1.setRowMargin(0);
        jTable1.setSelectionBackground(new java.awt.Color(153, 153, 153));
        jTable1.setSelectionForeground(new java.awt.Color(255, 51, 51));
        jTable1.getTableHeader().setReorderingAllowed(false);
        ((DefaultTableColumnModel)jTable1.getColumnModel()).getColumn(3).setCellRenderer(new DateCellEditor.DateRenderer());
        jTable1.getColumnModel().getColumn(3).setCellEditor(new DateCellEditor());
        jTable1.getColumnModel().getColumn(4).setCellRenderer(new DecimalFormatRenderer());
        jTable1.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                jTable1KeyPressed(evt);
            }
            public void keyTyped(java.awt.event.KeyEvent evt) {
                jTable1KeyTyped(evt);
            }
        });
        jScrollPane1.setViewportView(jTable1);
        jTable1.getColumnModel().getSelectionModel().setSelectionMode(javax.swing.ListSelectionModel.SINGLE_INTERVAL_SELECTION);
        jTable1.getColumnModel().getColumn(0).setResizable(false);
        jTable1.getColumnModel().getColumn(1).setResizable(false);
        jTable1.getColumnModel().getColumn(2).setResizable(false);
        jTable1.getColumnModel().getColumn(3).setResizable(false);
        jTable1.getColumnModel().getColumn(4).setResizable(false);

        jButton1.setMnemonic('I');
        jButton1.setText("Insert");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jButton2.setText("Clear");
        jButton2.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton2ActionPerformed(evt);
            }
        });

        jButton3.setText("Add Row");
        jButton3.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton3ActionPerformed(evt);
            }
        });

        jButton4.setText("Remove Row");
        jButton4.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton4ActionPerformed(evt);
            }
        });

        javax.swing.GroupLayout jPanel1Layout = new javax.swing.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 779, javax.swing.GroupLayout.PREFERRED_SIZE)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addGap(176, 176, 176)
                .addComponent(jButton1)
                .addGap(18, 18, 18)
                .addComponent(jButton2)
                .addGap(26, 26, 26)
                .addComponent(jButton3)
                .addGap(18, 18, 18)
                .addComponent(jButton4))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(jPanel1Layout.createSequentialGroup()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 141, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGap(6, 6, 6)
                .addGroup(jPanel1Layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jButton1)
                    .addComponent(jButton2)
                    .addComponent(jButton3)
                    .addComponent(jButton4)))
        );

        getContentPane().add(jPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 0, -1, 200));

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jTable1KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTable1KeyPressed
        InputMap im = jTable1.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
        int j = jTable1.getSelectedColumn();

        if (evt.getKeyCode() == 10) {
            KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
            KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
            KeyStroke f2 = KeyStroke.getKeyStroke(KeyEvent.VK_F2, 0);
//            im.put(enter, im.get(tab));
            if (j == 3 && ss1 == 0 && jTable1.getCellEditor() == null) {
                im.put(enter, im.get(f2));
                ss1 = 1;
            } else {
                im.put(enter, im.get(tab));
                ss1 = 0;
            }
        }
        if (evt.isControlDown() && evt.getKeyCode() == 10) {
            insertStocks();
        }
    }//GEN-LAST:event_jTable1KeyPressed

    private void jButton2ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton2ActionPerformed
        resetTableValues();
    }//GEN-LAST:event_jButton2ActionPerformed

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        insertStocks();

    }//GEN-LAST:event_jButton1ActionPerformed

    private void jButton3ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton3ActionPerformed
        jTable1.clearSelection();
        int row = jTable1.getRowCount();
        Object batch = jTable1.getModel().getValueAt(0, 0);
        Object qty = jTable1.getModel().getValueAt(0, 1);
        Object pack = jTable1.getModel().getValueAt(0, 2);
        Object edate = jTable1.getModel().getValueAt(0, 3);
        Object mrp = jTable1.getModel().getValueAt(0, 4);
        if (row == 1) {
            if (batch != null && qty != null && pack != null && edate != null && mrp != null) {
                addRow();
            }
        } else if (row == 2) {
            Object batch1 = jTable1.getModel().getValueAt(1, 0);
            Object qty1 = jTable1.getModel().getValueAt(1, 1);
            Object pack1 = jTable1.getModel().getValueAt(1, 2);
            Object edate1 = jTable1.getModel().getValueAt(1, 3);
            Object mrp1 = jTable1.getModel().getValueAt(1, 4);
            if (batch1 != null && qty1 != null && pack1 != null && edate1 != null && mrp1 != null) {
                addRow();
            }
        } else if (row == 3) {
            Object batch2 = jTable1.getModel().getValueAt(2, 0);
            Object qty2 = jTable1.getModel().getValueAt(2, 1);
            Object pack2 = jTable1.getModel().getValueAt(2, 2);
            Object edate2 = jTable1.getModel().getValueAt(2, 3);
            Object mrp2 = jTable1.getModel().getValueAt(2, 4);
            if (batch2 != null && qty2 != null && pack2 != null && edate2 != null && mrp2 != null) {
                addRow();
            }
        } else {
            JOptionPane.showInternalMessageDialog(jTable1, "only 4 rows only allowed for this item", "Temporary Stocks", JOptionPane.OK_CANCEL_OPTION);
        }
    }//GEN-LAST:event_jButton3ActionPerformed

    private void jButton4ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton4ActionPerformed
        int i = jTable1.getSelectedRow();
        int j = jTable1.getSelectedColumn();
        int r = jTable1.getRowCount();
        if (i != -1) {
            DefaultTableModel model = (DefaultTableModel) jTable1.getModel();
            model.removeRow(i);
            jTable1.changeSelection(0, j, false, false);
        }
        if (r == 1) {
            addRow();
        }
    }//GEN-LAST:event_jButton4ActionPerformed

    private void jTable1KeyTyped(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTable1KeyTyped
        // TODO add your handling code here:
        ss1 = 0;
    }//GEN-LAST:event_jTable1KeyTyped

    private void insertStocks() {
        try {
        
        CommonImplements commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
        int r = jTable1.getRowCount();
        
        int chk = 0;
        Object[] batch = new Object[r];
        Object[] qty = new Object[r];
        Object[] pack = new Object[r];
        Object[] edate = new Object[r];
        Object[] mrp = new Object[r];
        for (int i = 0; i < r; i++) {
            batch[i] = jTable1.getModel().getValueAt(i, 0);
            qty[i] = jTable1.getModel().getValueAt(i, 1);
            pack[i] = jTable1.getModel().getValueAt(i, 2);
            edate[i] = jTable1.getModel().getValueAt(i, 3);
            mrp[i] = jTable1.getModel().getValueAt(i, 4);           
             if(batch[i] != null && qty[i] != null && pack[i] != null && edate[i] != null && mrp[i] != null) {
                if (batch[i].toString().trim().length() > 0 && qty[i].toString().trim().length() > 0 && pack[i].toString().trim().length() > 0 && edate[i].toString().trim().length() > 0 && mrp[i].toString().trim().length() > 0) {
                        String ed = "" + new SimpleDateFormat("MMM-yyyy").format(edate[i]);
                        edate[i] = ed;
                        int pac = Integer.parseInt(pack[i].toString());
                        int stkQ = Integer.parseInt(qty[i].toString()) * pac;
                        double sm = Double.parseDouble(mrp[i].toString()) / pac;
                        String stkMRP = Value.Round(sm);
                        SalesModel sales = new SalesModel();
                        sales.setItemCode(code);
                        sales.setItemName(iname+"_"+dosage);
                        sales.setBatchNumber((String) batch[i]);
                        sales.setQuantity(stkQ);
                        sales.setPacking(pac);
                        sales.setExpiryDate((String)edate[i]);
                        
                        sales.setMrp(Double.parseDouble(stkMRP));
                        Sales salesController = (Sales) RegistryFactory.getClientStub(RegistryConstants.Sales);
                        boolean insertTemp = salesController.insertTempStock(sales);
                        if (insertTemp) {
                            int purch=0;
                            purch=commonController.checkItemBatch(code,batch[i].toString());
                            StockModel stock = new StockModel();
                            stock.setStock_itemCode(Integer.parseInt(code));
                            stock.setStock_itemName(iname+"_"+dosage);
                            stock.setStock_batchNo((String) batch[i]);
                            stock.setStock_packing((Integer)pack[i]);
                            stock.setStock_expiryDate((String) edate[i]);
                            stock.setStock_mrp(Double.parseDouble(stkMRP));
                            stock.setStock_sellingPrice(Double.parseDouble(stkMRP));
                            stock.setStock_formulation(commonController.getFormulation(code,iname));
                            stock.setStock_qty(stkQ);
                            if(purch!=-9081){
                            stkQ=stkQ+purch;
                            stock.setStock_qty(stkQ);
                            salesController.updateStock(stock,"update");
                             }
                            else {
                            salesController.updateStock(stock,"insert");
                             }
//                    } else {
//                        jTable1.changeSelection(i, 0, false, false);
//                        chk = 1;
//                        break;
//                    }

                 }
                 }
                 }
                 }
                   resetTableValues();
                   jTable1.changeSelection(0, 0, false, false);
                   this.dispose();
                   srt.setVisible(true);                                                                                                     
        }                 
       catch(Exception ex) {
            ex.printStackTrace();
        }
    }

    private void addRow() {
        DefaultTableModel model = (DefaultTableModel) jTable1.getModel();

        int row = jTable1.getRowCount();
        Vector datas = new Vector();
        try {
            for (int i = 0; i < jTable1.getModel().getColumnCount(); i++) {
                datas.addElement(null);
            }
        } catch (Exception ex) {
            String ss = " Class : TempStock   Method: addRow    Exception : " + ex;
            log.debug(ss);
        }
        model.insertRow(row, datas);
        jTable1.revalidate();
    }

    private void resetTableValues() {
        DefaultTableModel model = (DefaultTableModel) jTable1.getModel();
        model.getDataVector().removeAllElements();

        addRow();
        jTable1.clearSelection();
    }

    public static void main(String args[]) {
        java.awt.EventQueue.invokeLater(new Runnable() {

            @Override
            public void run() {
                new TempStocks(new JDialog(), new javax.swing.JTable(), "SEPEXIN", "616", "250mg").setVisible(true);
            }
        });
    }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JButton jButton2;
    private javax.swing.JButton jButton3;
    private javax.swing.JButton jButton4;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    // End of variables declaration//GEN-END:variables
}
