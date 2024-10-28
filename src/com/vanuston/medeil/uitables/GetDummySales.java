package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.implementation.Sales;
import java.awt.Font;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import java.awt.event.MouseEvent;
import java.awt.event.MouseWheelEvent;
import java.util.Vector;
import javax.swing.AbstractAction;
import javax.swing.JComponent;
import javax.swing.JTable;
import javax.swing.KeyStroke;
import javax.swing.table.DefaultTableModel;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;

public class GetDummySales extends javax.swing.JDialog {

    static Logger log = Logger.getLogger(GetDummySales.class, "Utilities");
    String ss = " Drug Index";
    JTable jcomp;
    Image medilICO = Toolkit.getDefaultToolkit().getImage("LogoMedil.png");
    public static KeyStroke shrctF9 = KeyStroke.getKeyStroke(KeyEvent.VK_F9, 0);
    public static KeyStroke shrctF11 = KeyStroke.getKeyStroke(KeyEvent.VK_F11, 0);
    public static KeyStroke escape = KeyStroke.getKeyStroke(KeyEvent.VK_ESCAPE, 0);
    
    
    public GetDummySales(JTable jc) {
        try {
            jcomp = jc;

            stopEditing();
            initComponents();
            setModal(true);
            jcomp.getTableHeader().setReorderingAllowed(false);
            jTable1.getInputMap().put(shrctF9, "callTempStocks");
            jTable1.getInputMap().put(shrctF11, "callSubstituteDrugs");
            jTable1.getInputMap().put(escape, "CloseWindow");
            jTable1.setAutoCreateColumnsFromModel(true);
            jTable1.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
            jTextField1.getInputMap().put(escape, "CloseWindow");


            jTable1.getActionMap().put("CloseWindow", new AbstractAction("CloseWindow") {

                @Override
                public void actionPerformed(ActionEvent evt) {
                    dispose();
                }
            });
            jTable1.getActionMap().put("callTempStocks", new AbstractAction("callTempStocks") {

                @Override
                public void actionPerformed(ActionEvent evt) {
                }
            });
            jTable1.getActionMap().put("callSubstituteDrugs", new AbstractAction("callSubstituteDrugs") {

                @Override
                public void actionPerformed(ActionEvent evt) {
                }
            });
            jTextField1.requestFocus();

            loadStockTable("");



        } catch (Exception ex) {
            log.debug("Method:GetDummySales Exception:"+ex.getMessage());
            
        }
    }

    public void stopEditing() {
        if (jcomp.getCellEditor() != null) {
            jcomp.getCellEditor().stopCellEditing();
        }
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jTextField1 = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable() {

            @Override
            public boolean isCellEditable(int rowIndex, int colIndex) {
                return false;   //Disallow the editing of any cell
            }

        };

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle(ss);
        setAlwaysOnTop(true);
        setResizable(false);
        addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                formFocusGained(evt);
            }
        });
        addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                formKeyPressed(evt);
            }
        });

        jTextField1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField1ActionPerformed(evt);
            }
        });
        jTextField1.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyReleased(java.awt.event.KeyEvent evt) {
                jTextField1KeyReleased(evt);
            }
        });

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
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jTable1.setGridColor(new java.awt.Color(204, 204, 255));
        jTable1.setRowHeight(22);
        jTable1.setSelectionMode(javax.swing.ListSelectionModel.SINGLE_SELECTION);
        jTable1.getTableHeader().setReorderingAllowed(false);
        AbstractAction disabled = new AbstractAction() {
            public boolean isEnabled() {
                return false;
            }
            public void actionPerformed(ActionEvent e) {

            }
        };
        jTable1.getInputMap(JComponent.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT).put(KeyStroke.getKeyStroke(KeyEvent.VK_C, KeyEvent.CTRL_MASK), "none");
        jTable1.getActionMap().put("none", disabled);
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

        org.jdesktop.layout.GroupLayout jPanel1Layout = new org.jdesktop.layout.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel1Layout.createSequentialGroup()
                .add(10, 10, 10)
                .add(jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(jTextField1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 550, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(jScrollPane1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 930, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .addContainerGap(11, Short.MAX_VALUE))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel1Layout.createSequentialGroup()
                .add(10, 10, 10)
                .add(jTextField1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .add(10, 10, 10)
                .add(jScrollPane1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 230, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(27, Short.MAX_VALUE))
        );

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .add(jPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
        );

        java.awt.Dimension screenSize = java.awt.Toolkit.getDefaultToolkit().getScreenSize();
        setBounds((screenSize.width-960)/2, (screenSize.height-324)/2, 960, 324);
    }// </editor-fold>//GEN-END:initComponents

    private void formFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_formFocusGained
        jTextField1.requestFocus();
}//GEN-LAST:event_formFocusGained

    private void jTextField1KeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTextField1KeyReleased
        String val = jTextField1.getText();
        if (val.length() > 1) {

            loadStockTable(val);

        }
        if (evt.getKeyCode() == KeyEvent.VK_DOWN || evt.getKeyCode() == KeyEvent.VK_ENTER || evt.getKeyCode() == KeyEvent.VK_TAB) {
            int r = jTable1.getRowCount();
            if (r > 0) {
                jTable1.requestFocus();
                jTable1.changeSelection(0, 0, true, false);
            }
        } else if (evt.getKeyCode() == KeyEvent.VK_ESCAPE) {
            this.dispose();
        }
}//GEN-LAST:event_jTextField1KeyReleased

    private void formKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_formKeyPressed
        jTextField1.requestFocus();
}//GEN-LAST:event_formKeyPressed

    private void jTable1KeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTable1KeyReleased
}//GEN-LAST:event_jTable1KeyReleased

    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTable1MouseClicked
        selectValues();
}//GEN-LAST:event_jTable1MouseClicked
    private void selectValues() {

        setSalesValues();

    }
    private void jTextField1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField1ActionPerformed
    }//GEN-LAST:event_jTextField1ActionPerformed

    private void jTable1KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTable1KeyPressed

        if (evt.getKeyCode() == 10) {
            selectValues();
        }

    }//GEN-LAST:event_jTable1KeyPressed

    public void setSalesValues() {


        stopEditing();
        final int i = jTable1.getSelectedRow();
        final int j = jcomp.getSelectedRow();
        int rr = jcomp.getRowCount();
        try {            
            CommonImplements commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
            String edate = commonController.getDummyExpiryDate();
            if (rr > 0) {

                    String dname = "" + jTable1.getModel().getValueAt(i, 0);
                    String dcode = "" + jTable1.getModel().getValueAt(i, 1);
//                    String mfgname = "" + jTable1.getModel().getValueAt(i, 2);
                    String dosage = "" + jTable1.getModel().getValueAt(i, 3);
                    String batch = " ";
                    String uprice = "" + jTable1.getModel().getValueAt(i, 4);
                    String mrp = "" + jTable1.getModel().getValueAt(i, 4);
                    String vat = "" + jTable1.getModel().getValueAt(i, 5);
                    String forml = "" + jTable1.getModel().getValueAt(i, 6);
                    if (uprice == null || uprice.equals("")) {
                        uprice = "0.00";mrp="0.00";
                    }
                    boolean[] flag = new boolean[jcomp.getRowCount()];
                    int flags = 0;
                    for (int val = 0; val < jcomp.getRowCount(); val++) {
                        if (j != 0) {
                            if (val == j && jcomp.getModel().getValueAt(val, 1) == null); else if (jcomp.getModel().getValueAt(val, 1) == null); else if (jcomp.getModel().getValueAt(val, 1).equals(dcode) && jcomp.getModel().getValueAt(val, 5).equals(batch)) {
                                flag[val] = true;
                                flags = 1;
                                this.dispose();
                                jcomp.requestFocus();
                                jcomp.changeSelection(val, 4, false, false);
                                jcomp.setEditingColumn(4);
                            }
                        }
                    }
                    boolean check = true;

                    if (flags != 1 && check) {
                        jcomp.getModel().setValueAt(j + 1, j, 0);
                        jcomp.getModel().setValueAt(dname + "_" + dosage.trim(), j, 2);
                        jcomp.getModel().setValueAt(dcode, j, 1);
                        jcomp.getModel().setValueAt(forml, j, 3);
                        jcomp.getModel().setValueAt(Integer.parseInt("0"), j, 4);
                        jcomp.getModel().setValueAt(batch, j, 5);
                        jcomp.getModel().setValueAt(edate, j, 6);
                        jcomp.getModel().setValueAt(Double.parseDouble(uprice), j, 7);
                        jcomp.getModel().setValueAt(Double.parseDouble(mrp), j, 8);
                        jcomp.getModel().setValueAt(Double.parseDouble("0.00"), j, 9);
                        if (vat.equals("0.00") || vat == null) {
                            jcomp.getModel().setValueAt(Double.parseDouble("0.00"), j, 10);
                        } else {
                            jcomp.getModel().setValueAt(Double.parseDouble(vat), j, 10);
                        }
                        this.dispose();
                        jcomp.requestFocus();

                        jcomp.changeSelection(j, 4, false, false);

                    }

            }
            jTextField1.setText("");
        } catch (Exception ex) {
            String ss1 = "Class : GetDummySales  Method : setSalesValues   Exception : " + ex.getMessage();
            log.debug(ss1);
        }
    }

    public void loadStockTable(String val) {
        stopEditing();
        String value = val;
        Vector col = new Vector();
        Vector data = new Vector();
        try {
            col.addElement("Product Name");
            col.addElement("Product Code");
            col.addElement("MFR Name");
            col.addElement("Dosage");
            col.addElement("MRP");
            col.addElement("VAT");
            col.addElement("Formulation");
            if (value.length() <= 1) {
            } else {
                  Sales salesController = (Sales) RegistryFactory.getClientStub(RegistryConstants.Sales);
                  data = salesController.loadDummyStockTable(value);
            }
            jTable1.setModel(new DefaultTableModel(data, col));
            jTable1.revalidate();
            jTable1.repaint();

        }  catch (Exception ex) {
            String ss = "Class : GetDummySales  Method : loadStockTable   NullPointerException : " + ex.getMessage();
        }
    }

    public void refreshStockTab() {
        loadStockTable("");
        jTextField1.requestFocus();
        jTextField1.setText("");
        this.setVisible(true);
        this.requestFocusInWindow();
        this.requestFocus();
    }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JPanel jPanel1;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    private javax.swing.JTextField jTextField1;
    // End of variables declaration//GEN-END:variables
}
