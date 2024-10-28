package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.Purchase;
import com.vanuston.medeil.model.PurchaseModel;
import com.vanuston.medeil.util.CheckAllListener;
import com.vanuston.medeil.util.CheckBoxHeader;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;

public final class GetPRAdjust extends javax.swing.JDialog {

    JTable jcomp;
    String title;
    String inv;
    int s = 0;
    static Logger log = Logger.getLogger(GetPRAdjust.class, "Utilities");

    public GetPRAdjust(javax.swing.JTable parent, String title, String inv) {
        jcomp = parent;
        this.title = title;
        this.inv = inv;
        initComponents();
        setModal(true);
        setLocationRelativeTo(null);
        loadReturnDatas(inv);
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jButton1 = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Get "+title+" Return Datas");

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null}
            },
            new String [] {
                "Item Code", "Item Name", "Batch No", "Qty", "Packing", "Expiry Date", "MRP", "Select"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.Integer.class, java.lang.Integer.class, java.lang.String.class, java.lang.Double.class, java.lang.Boolean.class
            };
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false, false, false, true
            };

            public Class getColumnClass(int columnIndex) {
                return types [columnIndex];
            }

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        TableColumn tc = jTable1.getColumnModel().getColumn(7);
        tc.setCellEditor(jTable1.getDefaultEditor(Boolean.class));
        tc.setCellRenderer(jTable1.getDefaultRenderer(Boolean.class));
        tc.setHeaderRenderer(new CheckBoxHeader(new CheckAllListener(jTable1,7),"Select All","Deselect All"));
        jTable1.setGridColor(new java.awt.Color(204, 204, 255));
        jTable1.setRowHeight(25);
        jTable1.getTableHeader().setReorderingAllowed(false);
        jTable1.addMouseListener(new java.awt.event.MouseAdapter() {
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTable1MouseClicked(evt);
            }
        });
        jTable1.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                jTable1FocusGained(evt);
            }
        });
        jTable1.addKeyListener(new java.awt.event.KeyAdapter() {
            public void keyPressed(java.awt.event.KeyEvent evt) {
                jTable1KeyPressed(evt);
            }
        });
        jScrollPane1.setViewportView(jTable1);
        jTable1.getColumnModel().getColumn(0).setResizable(false);
        jTable1.getColumnModel().getColumn(1).setResizable(false);
        jTable1.getColumnModel().getColumn(2).setResizable(false);
        jTable1.getColumnModel().getColumn(3).setResizable(false);
        jTable1.getColumnModel().getColumn(4).setResizable(false);
        jTable1.getColumnModel().getColumn(5).setResizable(false);
        jTable1.getColumnModel().getColumn(6).setResizable(false);
        jTable1.getColumnModel().getColumn(7).setResizable(false);

        jButton1.setText("Insert");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jLabel1.setText("No of Rows Selected :");

        jLabel2.setText("jLabel2");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 1004, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 123, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel2)
                        .addGap(297, 297, 297)
                        .addComponent(jButton1)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 210, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addGroup(layout.createSequentialGroup()
                        .addGap(20, 20, 20)
                        .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                            .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 23, javax.swing.GroupLayout.PREFERRED_SIZE)
                            .addComponent(jLabel2)))
                    .addGroup(layout.createSequentialGroup()
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                        .addComponent(jButton1)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    void reCreateTable() {
    }
    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        insertReturnDatas();
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jTable1FocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_jTable1FocusGained
        selectData();
    }//GEN-LAST:event_jTable1FocusGained

    private void jTable1KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTable1KeyPressed
        selectData();
    }//GEN-LAST:event_jTable1KeyPressed

    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTable1MouseClicked
        selectData();
    }//GEN-LAST:event_jTable1MouseClicked
    void selectData() {
        int rCnt = jTable1.getRowCount();
        s = 0;
        for (int i = 0; i < rCnt; i++) {
            Object obj = null;
            if (title.equals("Purchase")) {
                obj = jTable1.getModel().getValueAt(i, 8);
            }
            if (obj != null) {
                boolean bo = (Boolean) obj;
                if (bo) {
                    s++;
                }
            }
        }
        jLabel2.setText(String.valueOf(s));
    }

    public int getPIVal(String iname) {
        int flag = 0;
        int rc = jcomp.getModel().getRowCount();
        int rowVal = 0;
        try {
            for (int i = 0; i < rc; i++) {
                if (jcomp.getModel().getValueAt(i, 1) != null && jcomp.getModel().getValueAt(i, 1) != "" && jcomp.getModel().getValueAt(i, 2) != null && jcomp.getModel().getValueAt(i, 2) != "") {
                } else {
                    rowVal = i;
                    break;
                }
            }
            for (int val = 0; val < jcomp.getRowCount(); val++) {
                if (rowVal != 0) {
                    if (val == rowVal && jcomp.getModel().getValueAt(val, 1) == null); else if (jcomp.getModel().getValueAt(val, 1) == null); else if (jcomp.getModel().getValueAt(val, 1).equals(iname)) {
                        flag = 1;
                    }
                }
            }
        } catch (Exception ex) {
            String ss = " Class : PurchaseTable  Method : getPIVal    Exception : " + ex.getMessage();
            log.debug(ss);
        }
        return flag;
    }

    void insertPurcRetValue() {
        try {
            Purchase purcCont = (Purchase) RegistryFactory.getClientStub(RegistryConstants.Purchase);
            int rTot = jTable1.getRowCount();
            int rowCount = jcomp.getModel().getRowCount();
            int rowVal = 0;
            for (int i = 0; i < rowCount; i++) {
                if (jcomp.getModel().getValueAt(i, 1) != null && jcomp.getModel().getValueAt(i, 1) != "" && jcomp.getModel().getValueAt(i, 2) != null && jcomp.getModel().getValueAt(i, 2) != "") {
                } else {
                    rowVal = i;
                    break;
                }
            }
            for (int i = 0; i < rTot; i++) {
                boolean isSelect = (Boolean) jTable1.getModel().getValueAt(i, 8);
                if (isSelect) {
                    for (int ss = 0; ss < jcomp.getRowCount(); ss++) {
                        if (jcomp.getModel().getValueAt(ss, 1) == null && jcomp.getModel().getValueAt(ss, 2) == null && jcomp.getModel().getValueAt(ss, 3) == null) {
                            String iname = jTable1.getModel().getValueAt(i, 1).toString();
                            String icode = jTable1.getModel().getValueAt(i, 0).toString();
                            String form = purcCont.getFormulation(icode, iname);
                            String mfg = jTable1.getModel().getValueAt(i, 2).toString();
                            String qty = jTable1.getModel().getValueAt(i, 3).toString();
                            String packing = jTable1.getModel().getValueAt(i, 5).toString();
                            String mrp = jTable1.getModel().getValueAt(i, 6).toString();
                            String vat = jTable1.getModel().getValueAt(i, 7).toString();                            
                            boolean isPR = Boolean.valueOf(jTable1.getModel().getValueAt(i, 8).toString());
                            int vat_calc_flag= Integer.parseInt(jTable1.getModel().getValueAt(i, 9).toString());
                            int val = 0;
                            val = getPIVal(iname);
                            if (val != 1) {
                                addRow();
                                jcomp.getModel().setValueAt((rowVal + 1), rowVal, 0);
                                jcomp.getModel().setValueAt(iname, rowVal, 1);
                                jcomp.getModel().setValueAt(form, rowVal, 2);
                                jcomp.getModel().setValueAt(mfg, rowVal, 3);
                                jcomp.getModel().setValueAt(Integer.parseInt(qty), rowVal, 4);
                                jcomp.getModel().setValueAt(Integer.parseInt("0"), rowVal, 5);
                                jcomp.getModel().setValueAt(Integer.parseInt(packing), rowVal, 8);
                                jcomp.getModel().setValueAt(Double.parseDouble(mrp), rowVal, 10);
                                jcomp.getModel().setValueAt(Integer.parseInt("0"), rowVal, 11);
                                jcomp.getModel().setValueAt(Integer.parseInt("0"), rowVal, 13);
                                jcomp.getModel().setValueAt(Double.parseDouble(vat), rowVal, 14);
                                jcomp.getModel().setValueAt(icode, rowVal, 16);
                                jcomp.getModel().setValueAt(Boolean.FALSE, rowVal, 17);
                                jcomp.getModel().setValueAt(isPR, rowVal, 18);
                                jcomp.getModel().setValueAt(vat_calc_flag, rowVal, 19);
                            }
                        }
                    }
                    rowVal++;
                }
                this.dispose();
                jcomp.changeSelection(0, 6, false, false);
                jcomp.requestFocus();
            }
        } catch (Exception ex) {
            String ss = "Class : GetPRAdjust  Method : insertPurchaseValue   Exception : " + ex.getMessage();
            log.debug(ss);            
        }
    }

    void addRow() {
        try {
            DefaultTableModel model = (DefaultTableModel) jcomp.getModel();
            int row = jcomp.getRowCount();
            Vector datas = new Vector();
            for (int i = 0; i < jcomp.getModel().getColumnCount(); i++) {
                if (row == 0 && i == 0) {
                    datas.addElement(i + 1);
                } else if (i == 17) {
                    datas.addElement(Boolean.TRUE);
                } else {
                    datas.addElement(null);
                }
            }
            model.insertRow(jcomp.getRowCount(), datas);
        } catch (Exception ex) {
            String ss = " Class : GetPRAdjust  in Adjust    Method: AddRow    Exception : " + ex;
            log.debug(ss);
        }
    }

    void insertReturnDatas() {
        insertPurcRetValue();
    }

    void loadReturnDatas(String val) {
        loadPurRetDatas(val);
    }

    void loadPurRetDatas(String val) {
        Vector col = new Vector();
        Vector data = new Vector();
        try {
            if (val != null) {
                col.addElement("Product Code");
                col.addElement("Product Name");
                col.addElement("MFR Name");
                col.addElement("Qty");
                col.addElement("Free");
                col.addElement("Packing");
                col.addElement("MRP");
                col.addElement("VAT");
                col.addElement("Select All");
                col.addElement("Vat_Calc_Flag");
                com.vanuston.medeil.implementation.Purchase purcCont = (com.vanuston.medeil.implementation.Purchase) RegistryFactory.getClientStub(RegistryConstants.Purchase);;
                PurchaseModel pmodel;
                List<PurchaseModel> retStock = new ArrayList<PurchaseModel>();
                retStock = purcCont.getPRAdjustValues(val);
                int index = 0;
                for (index = 0; index < retStock.size(); index++) {
                    pmodel = retStock.get(index);
                    Vector temp = new Vector();
                    temp.addElement(pmodel.getItemCode());
                    temp.addElement(pmodel.getItemName());
                    temp.addElement(pmodel.getMfrName());
                    temp.addElement(pmodel.getQuantity());
                    temp.addElement(pmodel.getFree());
                    temp.addElement(pmodel.getPacking());
                    temp.addElement(pmodel.getMrp());
                    temp.addElement(pmodel.getUnitVat());
                    temp.addElement(Boolean.TRUE);
                    temp.addElement(pmodel.getPurc_adj_flagid());
                    data.addElement(temp);
                }
                jTable1.setModel(new DefaultTableModel(data, col) {

                    Class[] types = new Class[]{
                        java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.Integer.class, java.lang.Integer.class,
                        java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.Boolean.class, java.lang.Integer.class
                    };
                    boolean[] canEdit = new boolean[]{
                        false, false, false, false, false, false, false, false, true, false
                    };

                    @Override
                    public Class getColumnClass(int columnIndex) {
                        return types[columnIndex];
                    }

                    @Override
                    public boolean isCellEditable(int rowIndex, int columnIndex) {
                        return canEdit[columnIndex];
                    }

                    @Override
                    public void fireTableCellUpdated(int row, int column) {
                        super.fireTableCellUpdated(row, column);
                        if (column == 8) {
                            selectData();
                        }
                    }
                });
                TableColumn tc = jTable1.getColumnModel().getColumn(8);
                tc.setCellEditor(jTable1.getDefaultEditor(Boolean.class));
                tc.setCellRenderer(jTable1.getDefaultRenderer(Boolean.class));
                tc.setHeaderRenderer(new CheckBoxHeader(new CheckAllListener(jTable1, 8), "Select All", "Deselect All"));
                jTable1.removeColumn(jTable1.getColumnModel().getColumn(9));
                jTable1.revalidate();
                jTable1.repaint();                
            }
        } catch (Exception ex) {
            String ss = "Class : GetPRAdjust  Method : loadPurchaseDatas   Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JButton jButton1;
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    // End of variables declaration//GEN-END:variables
}
