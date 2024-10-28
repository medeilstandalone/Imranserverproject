package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.implementation.Purchase;
import com.vanuston.medeil.model.PurchaseModel;
import com.vanuston.medeil.util.CheckAllListener;
import com.vanuston.medeil.util.CheckBoxHeader;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.util.Value;
import java.util.Vector;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author VANEmp025
 */
public final class GetPurcReturnDatas extends javax.swing.JDialog {

    JTable jcomp;
    CheckBoxHeader jchck;
    String title;
    String inv;
    int s = 0;
    static Logger log = Logger.getLogger(GetPurcReturnDatas.class, "Utilities");
    DateUtils dutil = new DateUtils();
    Value value = new Value();    

    public GetPurcReturnDatas(javax.swing.JTable parent, String title, String inv) {                
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
        jTable1 = new JTable(){

        };
        jButton1 = new javax.swing.JButton();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("View "+title.toLowerCase()+" products");
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

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jButton1ActionPerformed
        insertReturnDatas();
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jTable1FocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_jTable1FocusGained
        selectData();
    }//GEN-LAST:event_jTable1FocusGained

    private void jTable1KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTable1KeyPressed
        selectData();
        checkEditableData();
    }//GEN-LAST:event_jTable1KeyPressed

    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTable1MouseClicked
        selectData();
        checkEditableData();
    }//GEN-LAST:event_jTable1MouseClicked

    private void formWindowClosed(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowClosed
    }//GEN-LAST:event_formWindowClosed
    void selectData() {
        int rCnt = jTable1.getRowCount();
        s = 0;
        for (int i = 0; i < rCnt; i++) {
            Object obj = null;
            if (title.equals("Purchase")) {
                obj = jTable1.getModel().getValueAt(i, 12);
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

    void checkEditableData() {
        int rCnt = jTable1.getSelectedRow();
        String n = "";
        if (rCnt != -1) {
            Object obj = null;
            if (title.equals("Purchase")) {
                obj = jTable1.getModel().getValueAt(rCnt, 13);
                n = "Invoice Number";
            }
            String msg = "";
            if (obj != null) {
                boolean bo = (Boolean) obj;
                if (!bo) {
                    msg = "this \"" + inv + "\" " + title + " " + n + " and \"" + jTable1.getModel().getValueAt(rCnt, 1) + "\" item has already insert to " + title + " Return.\n\nPlease use edit for this item";
                    JOptionPane.showMessageDialog(jTable1, msg, title + " Return", JOptionPane.WARNING_MESSAGE);
                }
            }
        }
    }

    void insertPurchaseValue() {
        try {
            Purchase purcCont = (Purchase) RegistryFactory.getClientStub(RegistryConstants.Purchase);
            int rowCnt = jTable1.getRowCount();
            if (rowCnt > 8) {
                DefaultTableModel model = (DefaultTableModel) jcomp.getModel();
                model.getDataVector().removeAllElements();
                jcomp.revalidate();
                for (int i = 0; i < rowCnt; i++) {
                    PurcRetTable.addRow();
                }
            }
            int j = 0;
            for (int i = 0; i < rowCnt; i++) {
                boolean isSelect = (Boolean) jTable1.getModel().getValueAt(i, 12);
                boolean isEditable = (Boolean) jTable1.getModel().getValueAt(i, 13);
                if (isSelect && isEditable) {
                    String iname = jTable1.getModel().getValueAt(i, 1).toString();
                    String icode = jTable1.getModel().getValueAt(i, 0).toString();
                    String form = purcCont.getFormulation(icode, iname);
                    String mfg = jTable1.getModel().getValueAt(i, 2).toString();
                    String qty = jTable1.getModel().getValueAt(i, 3).toString();
                    String free = jTable1.getModel().getValueAt(i, 4).toString();
                    String batch = jTable1.getModel().getValueAt(i, 5).toString();
                    String edate = jTable1.getModel().getValueAt(i, 6).toString();
                    String packing = jTable1.getModel().getValueAt(i, 7).toString();
                    String price = jTable1.getModel().getValueAt(i, 8).toString();
                    String mrp = jTable1.getModel().getValueAt(i, 9).toString();
                    String udist = jTable1.getModel().getValueAt(i, 10).toString();
                    String vat = jTable1.getModel().getValueAt(i, 11).toString();
                    int vat_calc_flag = Integer.parseInt(jTable1.getModel().getValueAt(i, 14).toString());
                    jcomp.getModel().setValueAt((j + 1), j, 0);
                    jcomp.getModel().setValueAt(iname, j, 1);
                    jcomp.getModel().setValueAt(form, j, 2);
                    jcomp.getModel().setValueAt(mfg, j, 3);
                    jcomp.getModel().setValueAt(Integer.parseInt(qty), j, 4);
                    jcomp.getModel().setValueAt(Integer.parseInt(free), j, 5);
                    jcomp.getModel().setValueAt(batch, j, 6);
                    jcomp.getModel().setValueAt(edate, j, 7);
                    jcomp.getModel().setValueAt(Integer.parseInt(packing), j, 8);
                    jcomp.getModel().setValueAt(Double.parseDouble(price), j, 9);
                    jcomp.getModel().setValueAt(Double.parseDouble(mrp), j, 10);
                    jcomp.getModel().setValueAt(Double.parseDouble(udist), j, 11);
                    jcomp.getModel().setValueAt(Double.parseDouble(vat), j, 12);
                    jcomp.getModel().setValueAt(icode, j, 14);
                    jcomp.getModel().setValueAt(vat_calc_flag, j, 15);
                    j++;
                }
            }
            this.dispose();
            jcomp.changeSelection(0, 4, false, false);
            jcomp.requestFocus();
        } catch (Exception ex) {
            String ss = "  Method: insertPurchaseValue   Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

    void insertReturnDatas() {
        boolean bo = false;
        for (int i = 0; i < jTable1.getModel().getRowCount(); i++) {
            if (title.equals("Purchase")) {
                boolean isSelect = (Boolean) jTable1.getModel().getValueAt(i, 12);
                if (isSelect) {
                    bo = isSelect;
                }
            }
        }
        if (bo) {
            if (title.equals("Purchase")) {
                insertPurchaseValue();
            }
        } else {
            String msg = "Please Select any one Item to be Insert !";
            JOptionPane.showMessageDialog(jTable1, msg, title + " Return", JOptionPane.WARNING_MESSAGE);
        }
    }

    void loadReturnDatas(String val) {
        if (title.equals("Purchase")) {
            loadPurDatas(val);
        }
    }

    void loadPurDatas(String val) {
        Vector col = new Vector();
        Vector data = new Vector();
        try {
            Purchase purcCont = (Purchase) RegistryFactory.getClientStub(RegistryConstants.Purchase);
            CommonImplements commomcont = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
            if (val != null) {
                col.addElement("Product Code");
                col.addElement("Product Name");
                col.addElement("MFR Name");
                col.addElement("Qty");
                col.addElement("Free");
                col.addElement("Batch No");
                col.addElement("Expiry Date");
                col.addElement("Packing");
                col.addElement("Price");
                col.addElement("MRP");
                col.addElement("Dist");
                col.addElement("VAT");
                col.addElement("Select All");
                col.addElement("Editable");
                col.addElement("vat_calc_flag");
                PurchaseModel pModel;
                List<PurchaseModel> purchaseBill = new ArrayList<PurchaseModel>();
                purchaseBill = purcCont.getPurcReturnDatas(val);
                
                int index = 0;
                for (index = 0; index < purchaseBill.size(); index++) {
                    pModel = purchaseBill.get(index);
                    Vector temp = new Vector();
                    boolean bo = true;
                    String iname = pModel.getItemName();
                    String icode = pModel.getItemCode();
                    String batch = pModel.getBatch();
                    temp.addElement(icode);
                    temp.addElement(iname);
                    temp.addElement(pModel.getMfrName());
                    temp.addElement(pModel.getQuantity());
                    temp.addElement(pModel.getFree());
                    temp.addElement(batch);
                    temp.addElement(dutil.normalFormatExpDate(pModel.getExpdate()));
                    temp.addElement(pModel.getPacking());
                    temp.addElement(pModel.getUnitprice());
                    temp.addElement(value.Round(pModel.getMrp()));
                    temp.addElement(value.Round(pModel.getUnitDis()));
                    temp.addElement(value.Round(pModel.getUnitVat()));
                    temp.addElement(false);
                    int ses = commomcont.getCompare("select count(*) as compare from purchase_return where invoice_no='" + val + "' and item_code='" + icode + "' and item_name='" + iname + "' and batch_no='" + batch + "'");
                    //int ses = commomcont.getCompare("select count(*) as compare from purchase_invoice p,purchase_return pr where p.invoice_no=pr.invoice_no and p.item_code=pr.item_code"
                    //            + " and pr.invoice_no='" + val + "' and pr.item_code='" + icode + "' and pr.item_name='" + iname + "' and pr.batch_no='" + batch + "' and pr.qty=p.qty");
                    //System.out.println("Ses"+ses);
                    if (ses > 0) {
                        bo = false;
                    }
                    int vat_calc_flag = Integer.parseInt(commomcont.getQueryValue("select vat_calc_flag from drugtable where itemcode='"+pModel.getItemCode()+"'"));
                    temp.addElement(bo);
                    temp.addElement(vat_calc_flag);
                    data.addElement(temp);
                }
                jchck = new CheckBoxHeader(new CheckAllListener(jTable1, 12), "Select All", "Deselect All");
                jTable1.setModel(new DefaultTableModel(data, col) {

                    Class[] types = new Class[]{
                        java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.Integer.class, java.lang.Integer.class,
                        java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class,
                        java.lang.String.class, java.lang.String.class, java.lang.Boolean.class, java.lang.Boolean.class, java.lang.Integer.class
                    };

                    @Override
                    public Class getColumnClass(int columnIndex) {
                        return types[columnIndex];
                    }

                    @Override
                    public boolean isCellEditable(int rowIndex, int columnIndex) {
                        Object edit = jTable1.getModel().getValueAt(rowIndex, 13);
                        boolean s = Boolean.valueOf(edit.toString());
                        boolean ret = false;
                        if (s && columnIndex == 12) {
                            ret = true;
                        }
                        return ret;
                    }

                    @Override
                    public void fireTableCellUpdated(int row, int column) {
                        super.fireTableCellUpdated(row, column);
                        if (column == 12) {
                            selectData();
                        } else {
                            Object edit = jTable1.getModel().getValueAt(row, 12);
                            boolean s = Boolean.valueOf(edit.toString());
                            if (!s) {
                                jchck.doCheck();
                            }
                        }
                    }
                });
                TableColumn tc = jTable1.getColumnModel().getColumn(12);
                tc.setCellEditor(jTable1.getDefaultEditor(Boolean.class));
                tc.setCellRenderer(jTable1.getDefaultRenderer(Boolean.class));
                tc.setHeaderRenderer(jchck);
                jTable1.removeColumn(jTable1.getColumnModel().getColumn(14));
                jTable1.removeColumn(jTable1.getColumnModel().getColumn(13));                
                jTable1.revalidate();
                jTable1.repaint();               
            }
        } catch (Exception ex) {
            String ss = "  Method: loadPurchaseDatas   Exception : " + ex.getMessage();
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
