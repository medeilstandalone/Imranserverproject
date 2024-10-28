package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.Purchase;
import com.vanuston.medeil.model.PurchaseModel;
import com.vanuston.medeil.util.CheckAllListener;
import com.vanuston.medeil.util.CheckBoxHeader;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
//import java.util.Date;
import java.util.List;
import java.util.Vector;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;


public final class GetTempStockData extends javax.swing.JDialog {

    JTable jcomp;
    static Logger log = Logger.getLogger(GetTempStockData.class, "Utilities");
    private PurchaseTable purchaseTable;

    public GetTempStockData(PurchaseTable purchastable) {
	this.purchaseTable = purchastable;
        jcomp = purchastable.jTable;
        initComponents();
        setModal(true);
        setLocationRelativeTo(null);
        loadTempStocks();
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
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosed(java.awt.event.WindowEvent evt) {
                formWindowClosed(evt);
            }
        });

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
        jTable1.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                jTable1FocusGained(evt);
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

        jButton1.setText("Insert to Purchase");
        jButton1.addActionListener(new java.awt.event.ActionListener() {
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jButton1ActionPerformed(evt);
            }
        });

        jLabel1.setText("No of Rows :");

        jLabel2.setText("jLabel2");

        javax.swing.GroupLayout layout = new javax.swing.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
                    .addComponent(jScrollPane1, javax.swing.GroupLayout.DEFAULT_SIZE, 899, Short.MAX_VALUE)
                    .addGroup(layout.createSequentialGroup()
                        .addComponent(jLabel1, javax.swing.GroupLayout.PREFERRED_SIZE, 80, javax.swing.GroupLayout.PREFERRED_SIZE)
                        .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.RELATED)
                        .addComponent(jLabel2)
                        .addGap(262, 262, 262)
                        .addComponent(jButton1)))
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(javax.swing.GroupLayout.Alignment.LEADING)
            .addGroup(layout.createSequentialGroup()
                .addContainerGap()
                .addComponent(jScrollPane1, javax.swing.GroupLayout.PREFERRED_SIZE, 210, javax.swing.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(javax.swing.LayoutStyle.ComponentPlacement.UNRELATED)
                .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.TRAILING)
                    .addComponent(jButton1)
                    .addGroup(layout.createParallelGroup(javax.swing.GroupLayout.Alignment.BASELINE)
                        .addComponent(jLabel1)
                        .addComponent(jLabel2)))
                .addContainerGap(javax.swing.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );

        pack();
    }// </editor-fold>//GEN-END:initComponents

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        insertPurchaseValue();
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jTable1FocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_jTable1FocusGained
    }//GEN-LAST:event_jTable1FocusGained

    private void formWindowClosed(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowClosed
        this.dispose();
    }//GEN-LAST:event_formWindowClosed

    void insertPurchaseValue() {
        try {
            DateUtils dutil = new DateUtils();
	    PurchaseTable purcahseTable = new PurchaseTable();
            Purchase purcCont = (Purchase) RegistryFactory.getClientStub(RegistryConstants.Purchase);
            int rowCnt = jTable1.getRowCount();
            if (rowCnt > 10) {
                DefaultTableModel model = (DefaultTableModel) jcomp.getModel();
                model.getDataVector().removeAllElements();
                jcomp.revalidate();
                for (int i = 0; i < rowCnt; i++) {
                    purchaseTable.addRow();
                }
            }
            int j = 0;
            for (int i = 0; i < rowCnt; i++) {
                boolean isSelect = (Boolean) jTable1.getModel().getValueAt(i, 7);
                if (isSelect) {
                    String icode = jTable1.getModel().getValueAt(i, 0).toString();
                    String iname = jTable1.getModel().getValueAt(i, 1).toString();
                    String batch = jTable1.getModel().getValueAt(i, 2).toString();
                    String qty = jTable1.getModel().getValueAt(i, 3).toString();
                    String packing = jTable1.getModel().getValueAt(i, 4).toString();
                    String edate = jTable1.getModel().getValueAt(i, 5).toString();
                    String mrp = jTable1.getModel().getValueAt(i, 6).toString();                    
                    String form = purcCont.getFormulation(icode, (iname.split("_")[0]));
                    String mfg = purcCont.getFormulation(icode, (iname.split("_")[0]));
                    String vat = "4";
                    String da = new SimpleDateFormat("MM/yy").format(new SimpleDateFormat("dd-MM-yyyy").parse((edate)));
                    jcomp.getModel().setValueAt((j + 1), j, 0);
                    jcomp.getModel().setValueAt(iname, j, 1);
                    jcomp.getModel().setValueAt(form, j, 2);
                    jcomp.getModel().setValueAt(mfg, j, 3);
                    jcomp.getModel().setValueAt(Integer.parseInt(qty), j, 4);
                    jcomp.getModel().setValueAt(Integer.parseInt("0"), j, 5);
                    jcomp.getModel().setValueAt(batch, j, 6);
                    jcomp.getModel().setValueAt(da, j, 7);
                    jcomp.getModel().setValueAt(Integer.parseInt(packing), j, 8);
                    jcomp.getModel().setValueAt(Integer.parseInt("0"), j, 9);
                    jcomp.getModel().setValueAt(Double.parseDouble(mrp), j, 10);
                    jcomp.getModel().setValueAt(Integer.parseInt("0"), j, 12);
                    jcomp.getModel().setValueAt(Double.parseDouble(vat), j, 13);
                    jcomp.getModel().setValueAt(icode, j, 16);
                    jcomp.getModel().setValueAt(Boolean.TRUE, j, 17);
                    jcomp.getModel().setValueAt(Boolean.FALSE, j, 18);
                    jcomp.getModel().setValueAt(Integer.parseInt(jTable1.getModel().getValueAt(i, 8).toString()), j, 19);
                    j++;
                }
            }
            if (j > 0) {
                this.dispose();
                jcomp.requestFocus();
                jcomp.changeSelection(0, 9, false, false);
            } else {
                JOptionPane.showMessageDialog(jcomp, "Please Select any one Item to be Insert", "Temporary", JOptionPane.INFORMATION_MESSAGE);
                jTable1.requestFocus();
                jTable1.changeSelection(0, 0, false, false);
            }
        } catch (Exception ex) {
            String ss = " Class: GetTempStockData   Method: insertPurchaseValue  Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

    void loadTempStocks() {
        DateUtils dutil = new DateUtils();
        Vector col = new Vector();
        Vector data = new Vector();
        try {
            Purchase purcCont = (Purchase) RegistryFactory.getClientStub(RegistryConstants.Purchase);
            col.addElement("Product Code");
            col.addElement("Product Name");
            col.addElement("Batch No");
            col.addElement("Qty");
            col.addElement("Packing");
            col.addElement("Expiry Date");
            col.addElement("MRP");
            col.addElement("Select All");
            col.addElement("vat_calc_flag");
            int cn = 0;
            PurchaseModel pmodel;
            List<PurchaseModel> tempStock = new ArrayList<PurchaseModel>();
            tempStock = purcCont.getTempStockValues();
            int index = 0;
            for (index = 0; index < tempStock.size(); index++) {
                cn++;
                pmodel = tempStock.get(index);
                Vector temp = new Vector();
                temp.addElement(pmodel.getItemCode());
                temp.addElement(pmodel.getItemName());
                temp.addElement(pmodel.getBatch());
                temp.addElement(pmodel.getQuantity());
                temp.addElement(pmodel.getPacking());
                temp.addElement(dutil.normalFormatDate(pmodel.getExpdate()));
                temp.addElement(pmodel.getMrp());
                temp.addElement(false);
                temp.addElement(pmodel.getPurc_adj_flagid());
                data.addElement(temp);
            }
            jLabel2.setText(String.valueOf(cn));
            jTable1.setModel(new DefaultTableModel(data, col) {

                Class[] types = new Class[]{
                    java.lang.String.class, java.lang.String.class, java.lang.String.class,
                    java.lang.Integer.class, java.lang.Integer.class, java.lang.String.class,
                    java.lang.String.class, java.lang.Boolean.class,java.lang.Integer.class
                };
                boolean[] canEdit = new boolean[]{
                    false, false, false, false, false, false, false, true, false
                };

                @Override
                public Class getColumnClass(int columnIndex) {
                    return types[columnIndex];
                }

                @Override
                public boolean isCellEditable(int rowIndex, int columnIndex) {
                    return canEdit[columnIndex];
                }
            });            
            TableColumn tc = jTable1.getColumnModel().getColumn(7);
            tc.setCellEditor(jTable1.getDefaultEditor(Boolean.class));
            tc.setCellRenderer(jTable1.getDefaultRenderer(Boolean.class));
            tc.setHeaderRenderer(new CheckBoxHeader(jTable1, "Select All", "Deselect All", 7));
            //jTable1.removeColumn(jTable1.getColumnModel().getColumn(8));
            jTable1.revalidate();
            jTable1.repaint();
        } catch (Exception ex) {
            String ss = " Class: GetTempStockData   Method: loadTempStocks  Exception : " + ex.getMessage();
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
