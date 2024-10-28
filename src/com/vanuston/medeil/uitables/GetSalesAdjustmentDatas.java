package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.Sales;
import com.vanuston.medeil.util.CheckAllListener;
import java.util.Vector;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;
import com.vanuston.medeil.util.CheckBoxHeader;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;


/**
 *
 * @author VANEmp025
 */
public final class GetSalesAdjustmentDatas extends javax.swing.JDialog {    
    JTable jcomp;
    CheckBoxHeader jchck;
    String title;
    String inv;
    int s = 0;
    static Logger log = Logger.getLogger(GetSalesAdjustmentDatas.class, "Utilities");

    public GetSalesAdjustmentDatas(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();
    }

    public GetSalesAdjustmentDatas(javax.swing.JTable parent, String title, String inv) {
        jcomp = parent;
        this.title = title;
        this.inv = inv;
        initComponents();
        setModal(true);
        setLocationRelativeTo(null);
        loadAdjustmentDatas(inv);
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

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {
                {null, null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null, null},
                {null, null, null, null, null, null, null, null, null}
            },
            new String [] {
                "Item Code", "Item Name", "Batch No", "Qty", "Packing", "Expiry Date", "MRP", "Select", "Adj Id"
            }
        ) {
            Class[] types = new Class [] {
                java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.Integer.class, java.lang.Integer.class, java.lang.String.class, java.lang.Double.class, java.lang.Boolean.class, java.lang.Integer.class
            };
            boolean[] canEdit = new boolean [] {
                false, false, false, false, false, false, false, true, false
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
        jTable1.getColumnModel().getColumn(8).setResizable(false);

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
        insertAdjustmentDatas();        
    }//GEN-LAST:event_jButton1ActionPerformed

    private void jTable1FocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_jTable1FocusGained
        selectData();
    }//GEN-LAST:event_jTable1FocusGained

    private void jTable1KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTable1KeyPressed
        selectData();
    }//GEN-LAST:event_jTable1KeyPressed

    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTable1MouseClicked
        selectData();
        checkEditableData("rows");
    }//GEN-LAST:event_jTable1MouseClicked

    void selectData() {
        int rCnt = jTable1.getRowCount();
        s = 0;
        for (int i = 0; i < rCnt; i++) {
            Object obj = null;
            if (title.equals("Sales")) {
                obj = jTable1.getModel().getValueAt(i, 10);
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

    boolean checkEditableData(String selectType) {
        int rCnt = jTable1.getSelectedRow();
        boolean isSelect = true;
        String msg = "";
        if(selectType.equals("rows") && rCnt!=-1) {
            for(int j=0; j < jTable1.getRowCount(); j++) {
                if(j!=rCnt && (Boolean)jTable1.getModel().getValueAt(j,10)==true && jTable1.getModel().getValueAt(j, 0).toString().equals(jTable1.getValueAt(rCnt,0).toString()) && jTable1.getModel().getValueAt(j, 4).toString().equals(jTable1.getValueAt(rCnt,4).toString())) {
                    isSelect=false;
                    jTable1.getModel().setValueAt(false,rCnt, 10);
                     msg = "The same item Name : "+jTable1.getModel().getValueAt(rCnt, 1)+" and Batch No : "+jTable1.getModel().getValueAt(rCnt, 4)+" is already"
                   + " selected. Please check.";
                    JOptionPane.showMessageDialog(jTable1, msg, title + " Adjustment", JOptionPane.WARNING_MESSAGE);
                }
            }
        }
        else {
            for(int j=0; j < jTable1.getRowCount(); j++) {
                for(int k=j+1; k <jTable1.getRowCount();k++) {
                    if((Boolean)jTable1.getModel().getValueAt(j,10)==true && (Boolean)jTable1.getModel().getValueAt(k,10)==true && jTable1.getModel().getValueAt(j, 0).toString().equals(jTable1.getValueAt(k,0).toString()) && jTable1.getModel().getValueAt(j, 4).toString().equals(jTable1.getValueAt(k,4).toString())) {
                        isSelect=false;
                        jTable1.getModel().setValueAt(false,j, 10);
                        msg = "The same item Name : "+jTable1.getModel().getValueAt(j, 1)+" and Batch No : "+jTable1.getModel().getValueAt(j, 4)+" is already"
                        + " selected. Please check.";
                        JOptionPane.showMessageDialog(jTable1, msg, title + " Adjustment", JOptionPane.WARNING_MESSAGE);
                        break;
                    }
                }
            }
       }       
            
       return isSelect;
    }

    void insertAdjustmentDatas() {
        boolean bo = checkEditableData("All");
        for (int i = 0; i < jTable1.getModel().getRowCount(); i++) {
             if (title.equals("Sales")) {
                boolean isSelect = (Boolean) jTable1.getModel().getValueAt(i, 10);
                if (isSelect) {
                    bo = isSelect;
                }
            }
        }
        if (bo) {
            if (title.equals("Sales")) {
                clearAndAddRows();                                     
                insertSalesValue();
            }
        } else {
            String msg = "Please select any one item to insert !";
            JOptionPane.showMessageDialog(jTable1, msg, title + " Return", JOptionPane.WARNING_MESSAGE);
        }
    }

    void clearAndAddRows() {
        int rowCnt = Integer.parseInt(jLabel2.getText());
        if (rowCnt > 10) {
                DefaultTableModel model = (DefaultTableModel) jcomp.getModel();
                model.getDataVector().removeAllElements();
                jcomp.revalidate();
                for (int i = 0; i < rowCnt; i++) {
                    Vector datas = new Vector();
                    for (int k = 0; k < jcomp.getModel().getColumnCount(); k++) {
                        if (k == 0) {
                            datas.addElement(k + 1);
                        } else {
                            datas.addElement(null);
                        }
                    }
                    model.insertRow(jcomp.getRowCount(), datas);
                }
            }
    }

    void insertSalesValue() {
        try {
            int rTot = jTable1.getRowCount();            
            int j = 0;            
            for (int i = 0; i < rTot; i++) {
                boolean isSelect = (Boolean) jTable1.getModel().getValueAt(i, 10);
                boolean isEditable = (Boolean) jTable1.getModel().getValueAt(i, 12);
                if (isSelect && isEditable) {
                    String icode = jTable1.getModel().getValueAt(i, 0).toString();
                    String iname = jTable1.getModel().getValueAt(i, 1).toString();
                    String form = jTable1.getModel().getValueAt(i, 2).toString();
                    String qty = jTable1.getModel().getValueAt(i, 3).toString();
                    String batch = jTable1.getModel().getValueAt(i, 4).toString();
                    String edate = jTable1.getModel().getValueAt(i, 5).toString();
                    String price = jTable1.getModel().getValueAt(i, 6).toString();
                    String mrp = jTable1.getModel().getValueAt(i, 7).toString();
                    String udist = jTable1.getModel().getValueAt(i, 8).toString();
                    String vat = jTable1.getModel().getValueAt(i, 9).toString();
                    int adjId = Integer.parseInt(jTable1.getModel().getValueAt(i, 11).toString());
                    jcomp.getModel().setValueAt((j + 1), j, 0);
                    jcomp.getModel().setValueAt(icode, j, 1);
                    jcomp.getModel().setValueAt(iname, j, 2);
                    jcomp.getModel().setValueAt(form, j, 3);
                    jcomp.getModel().setValueAt(Integer.parseInt(qty), j, 4);   
                    jcomp.getModel().setValueAt(batch, j, 5);
                    jcomp.getModel().setValueAt(edate, j, 6);
                    jcomp.getModel().setValueAt(Double.parseDouble(price), j, 7);
                    jcomp.getModel().setValueAt(Double.parseDouble(mrp), j, 8);
                    jcomp.getModel().setValueAt(Double.parseDouble(udist), j, 9);
                    jcomp.getModel().setValueAt(0, j, 10);
                    jcomp.getModel().setValueAt(Double.parseDouble(vat), j, 11);
                    jcomp.getModel().setValueAt(0.00, j, 12);
                    jcomp.getModel().setValueAt(adjId, j, 13);
                    jcomp.getModel().setValueAt(adjId, j, 14);
                    j++;
                }
            }
            this.dispose();
            jcomp.changeSelection(0, 4, false, false);
            jcomp.requestFocus();
        } catch (Exception ex) {
            String ss = "  Method: insertSalesValue   Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

    void loadAdjustmentDatas(String val) {
        String cut = val.substring(0, 3);
        int no = 0;
        if(cut.equals("ADJ")) {
            no = 6;
        }
        Vector col = new Vector();
        Vector data = new Vector();
        try {
            if (val != null) {
                col.addElement("Code");//50 
                col.addElement("Product Name");//100
                col.addElement("Form.");//50
                col.addElement("Qty");//50
                col.addElement("Batch No");//60
                col.addElement("Expiry Date");//60
                col.addElement("Price");//70
                col.addElement("MRP");//70
                col.addElement("Dist");//50
                col.addElement("VAT");//50
                col.addElement("Select All");//65
                col.addElement("Adj Id");
                col.addElement("Editable");
                Sales salesController = (Sales) RegistryFactory.getClientStub(RegistryConstants.Sales);
                data = salesController.loadSalesDetails(val,no);
                jchck = new CheckBoxHeader(new CheckAllListener(jTable1, 10), "Select All", "Deselect All");
                jTable1.setModel(new DefaultTableModel(data, col) {
                    Class[] types = new Class[]{
                        java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.Integer.class,
                        java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class,
                        java.lang.String.class, java.lang.String.class, java.lang.Boolean.class, java.lang.Integer.class,
                        java.lang.Boolean.class
                    };

                    @Override
                    public Class getColumnClass(int columnIndex) {
                        return types[columnIndex];
                    }

                    @Override
                    public boolean isCellEditable(int rowIndex, int columnIndex) {
                        Object edit = jTable1.getModel().getValueAt(rowIndex, 12);
                        boolean s = Boolean.valueOf(edit.toString());
                        boolean ret = false;
                        if (s && columnIndex == 10) {
                            ret = true;
                        }
                        return ret;
                    }
                    
                    @Override
                    public void fireTableCellUpdated(int row, int column) {
                        super.fireTableCellUpdated(row, column);
                        if (column == 10) {
                            selectData();
                        } else {
                            Object edit = jTable1.getModel().getValueAt(row, 10);
                            boolean s = Boolean.valueOf(edit.toString());
                            if (!s) {
                               jchck.doCheck();
                            }
                        }
                    }
                });
                TableColumn tc = jTable1.getColumnModel().getColumn(10);
                tc.setCellEditor(jTable1.getDefaultEditor(Boolean.class));
                tc.setCellRenderer(jTable1.getDefaultRenderer(Boolean.class));
                tc.setHeaderRenderer(jchck);
                int colWidth[]={50,140,50,40,60,60,60,60,50,50,65,0,0};
                for (int i = 0; i < col.size(); i++) {
                    jTable1.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
                }                
                jTable1.removeColumn(jTable1.getColumnModel().getColumn(12));
                jTable1.removeColumn(jTable1.getColumnModel().getColumn(11));
                jTable1.revalidate();
                jTable1.repaint();                
            }
        } catch (Exception ex) {
            String ss = "  Method: loadSalesDatas   Exception : " + ex.getMessage();            
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
