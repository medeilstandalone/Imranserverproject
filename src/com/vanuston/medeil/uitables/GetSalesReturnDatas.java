package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.Sales;
import java.util.Vector;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumn;
import com.vanuston.medeil.util.CheckAllListener;
import com.vanuston.medeil.util.CheckBoxHeader;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;

/**
 *
 * @author VANEmp025
 */
public final class GetSalesReturnDatas extends javax.swing.JDialog {

    JTable jcomp;
    CheckBoxHeader jchck;
    String title;
    String inv;
    int s = 0;
    static Logger log = Logger.getLogger(GetSalesReturnDatas.class, "Utilities");

    public GetSalesReturnDatas(java.awt.Frame parent, boolean modal) {
        super(parent, modal);
        initComponents();
    }

    public GetSalesReturnDatas(javax.swing.JTable parent, String title, String inv) {
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
//    void selectData() {
//          System.out.println("insert342");
//        int rCnt = jTable1.getRowCount();
//        s = 0;
//        for (int i = 0; i < rCnt; i++) {
//            Object obj = null;
//            if (title.equals("Sales")) {
//                obj = jTable1.getModel().getValueAt(i, 12);//11
//            }
//            if (obj != null) {
//                boolean bo = (Boolean) obj;
//                if (bo) {
//                    s++;
//                }
//            }
//        }
//        jLabel2.setText(String.valueOf(s));
//    }
//
//    void checkEditableData() {
//          System.out.println("insert5");
//        int rCnt = jTable1.getSelectedRow();
//        String n = "";
//        if (rCnt != -1) {
//            Object obj = null;
//             System.out.println("insert56");
//            if (title.equals("Sales")) {
//                obj = jTable1.getModel().getValueAt(rCnt, 14);
//                n = "Bill Number";
//            }
//            String msg = "";
//            System.out.println("insert34245");
//            if (obj != null) {
//                boolean bo = (Boolean) obj;
//                if (!bo) {
//                      System.out.println("i67");
//                    msg = "this \"" + inv + "\" " + title + " " + n + " and \"" + jTable1.getModel().getValueAt(rCnt, 1) + "\" item has already insert to " + title + " Return.\n\nPlease use edit for this item";
//                    JOptionPane.showMessageDialog(jTable1, msg, title + " Return", JOptionPane.WARNING_MESSAGE);
//                             System.out.println("i");
//                }
//            }
//        }
//    }
//
//    void insertSalesValue() {
//           System.out.println("insert");
//        try {
//            int rTot = jTable1.getRowCount();
//            SalesReturnTable sr = new SalesReturnTable();
//             int rowCnt = Integer.parseInt(jLabel2.getText());
//            int j = 0;
//            // if (rowCnt > 11)
//                  if (rowCnt > 14)
//             {
//                DefaultTableModel model = (DefaultTableModel) jcomp.getModel();
//                model.getDataVector().removeAllElements();
//                jcomp.revalidate();
//                for (int i = 0; i < rowCnt; i++) {
//                    sr.addRow();
//                }
//            }
//            for (int i = 0; i < rTot; i++) {
//                boolean isSelect = (Boolean) jTable1.getModel().getValueAt(i, 12);
//                boolean isEditable = (Boolean) jTable1.getModel().getValueAt(i, 14);
//                if (isSelect && isEditable) {
//                     System.out.println("insert43");
//                    String icode = jTable1.getModel().getValueAt(i, 0).toString();
//                    String iname = jTable1.getModel().getValueAt(i, 1).toString();
////                  String mfg = jTable1.getModel().getValueAt(i, 2).toString();
//                    String form = jTable1.getModel().getValueAt(i, 2).toString();
//                    String fqty = jTable1.getModel().getValueAt(i, 3).toString();
//                    String qty = jTable1.getModel().getValueAt(i, 4).toString();
//                    String batch = jTable1.getModel().getValueAt(i, 5).toString();
//                    String edate = jTable1.getModel().getValueAt(i, 6).toString();
//                    String price = jTable1.getModel().getValueAt(i, 7).toString();
//                    String mrp = jTable1.getModel().getValueAt(i, 8).toString();
//                    String udist = jTable1.getModel().getValueAt(i, 9).toString();
//                    String vat = jTable1.getModel().getValueAt(i, 10).toString();
//                    String fprice = jTable1.getModel().getValueAt(i, 11).toString();
//                    //jcomp.getModel().setValueAt(Double.parseDouble(fprice), j, 11);
//                       // System.out.println((Double.parseDouble(fprice), j, 13));
//                       // jcomp.getModel().setValueAt(Double.parseDouble(fprice), j, 14);
//           // System.out.println("Value set return: " + Double.parseDouble(fprice) + " at row " + j + ", column 11");
//                    int adjId = Integer.parseInt(jTable1.getModel().getValueAt(i, 13).toString());//12
//                    jcomp.getModel().setValueAt((j + 1), j, 0);
//                    jcomp.getModel().setValueAt(icode, j, 1);
//                    jcomp.getModel().setValueAt(iname, j, 2);
//                    jcomp.getModel().setValueAt(form, j, 3);
//                     jcomp.getModel().setValueAt(Integer.parseInt(fqty), j, 4);
//                    jcomp.getModel().setValueAt(Integer.parseInt(qty), j, 5);
//                    jcomp.getModel().setValueAt(batch, j, 6);
//                    jcomp.getModel().setValueAt(edate, j, 7);
//                    jcomp.getModel().setValueAt(Double.parseDouble(price), j, 8);
//                    jcomp.getModel().setValueAt(Double.parseDouble(mrp), j, 9);
//                    jcomp.getModel().setValueAt(Double.parseDouble(udist), j, 10);
//                    jcomp.getModel().setValueAt(Double.parseDouble(vat), j, 11);
//                   jcomp.getModel().setValueAt(Double.parseDouble(fprice), j, 12);
//                    jcomp.getModel().setValueAt(adjId, j, 14);
//                    j++;
//                }
//            }
//            this.dispose();
//            jcomp.changeSelection(0, 4, false, false);
//            jcomp.requestFocus();
//        } catch (Exception ex) {
//            String ss = "  Method: insertSalesValue   Exception : " + ex.getMessage();
//            log.debug(ss);
//
//        }
//    }
//
//
//    void insertReturnDatas() {
//        boolean bo = false;
//        for (int i = 0; i < jTable1.getModel().getRowCount(); i++) {
//             if (title.equals("Sales")) {
//                boolean isSelect = (Boolean) jTable1.getModel().getValueAt(i, 12);
//                if (isSelect) {
//                    bo = isSelect;
//                }
//            }
//        }
//        if (bo) {
//            if (title.equals("Sales")) {
//                insertSalesValue();
//            }
//        } else {
//            String msg = "Please select any one item to insert !";
//            JOptionPane.showMessageDialog(jTable1, msg, title + " Return", JOptionPane.WARNING_MESSAGE);
//        }
//    }
//
//    void loadReturnDatas(String val) {
//         if (title.equals("Sales")) {
//            loadSalesDatas(val);
//        }
//    }
//----------------------------------------------------------------------------------------//
   void selectData() {
    int rCnt = jTable1.getRowCount();
    int s = 0;
    for (int i = 0; i < rCnt; i++) {
        Object obj = null;
        if (title.equals("Sales")) {
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

//void checkEditableData() {
//        int rCnt = jTable1.getSelectedRow();
//        String n = "";
//        if (rCnt != -1) {
//            Object obj = null;
//            if (title.equals("Sales")) {
//                obj = jTable1.getModel().getValueAt(rCnt, 14);
//                n = "Bill Number";
//            }
//            String msg = "";
//            if (obj != null) {
//                boolean bo = (Boolean) obj;
//                if (!bo) {
//                    msg = "this \"" + inv + "\" " + title + " " + n + " and \"" + jTable1.getModel().getValueAt(rCnt, 1) + "\" item has already insert to " + title + " Return.\n\nPlease use edit for this item";
//                    JOptionPane.showMessageDialog(jTable1, msg, title + " Return", JOptionPane.WARNING_MESSAGE);
//                }
//            }
//        }
//    }
//
void checkEditableData() {
    System.out.println("Entering checkEditableData");
    int selectedRow = jTable1.getSelectedRow(); // Get the selected row index
    String columnName = "";

    // Ensure a row is selected
    if (selectedRow != -1) {
        Object cellValue = null;

        // Check if the title is "Sales" and get the value at column index 14
        if (title.equals("Sales")) {
            cellValue = jTable1.getModel().getValueAt(selectedRow, 14);//14
            columnName = "Bill Number";
        }

        // If the cell value is not null, check its boolean state
        if (cellValue != null) {
            boolean isEditable = (Boolean) cellValue;

            // If not editable, show a warning message
            if (!isEditable) {
                String itemName = jTable1.getModel().getValueAt(selectedRow, 1).toString();
                String message = "This \"" + inv + "\" " + title + " " + columnName + " and \"" + itemName + "\" item has already been inserted to " + title + " Return.\n\nPlease use edit for this item.";
                JOptionPane.showMessageDialog(jTable1, message, title + " Return", JOptionPane.WARNING_MESSAGE);
                System.out.println("Item not editable: " + message);
            }
        }
    } else {
        System.out.println("No row selected");
    }
    System.out.println("Exiting checkEditableData");
}

void insertSalesValue() {
        System.out.println("rowCnt");
    try {
        int rTot = jTable1.getRowCount();
        int rowCnt = Integer.parseInt(jLabel2.getText());
        if (rowCnt > 14) {
            DefaultTableModel model = (DefaultTableModel) jcomp.getModel();
            model.getDataVector().removeAllElements();
            jcomp.revalidate();
            SalesReturnTable sr = new SalesReturnTable();
            for (int i = 0; i < rowCnt; i++) {
                System.out.println(rowCnt);
                sr.addRow();
            }
        }
        int j = 0;
        for (int i = 0; i < rTot; i++) {
            boolean isSelect = (Boolean) jTable1.getModel().getValueAt(i, 12);
            boolean isEditable = (Boolean) jTable1.getModel().getValueAt(i, 14);
            if (isSelect && isEditable) {
                String icode = jTable1.getModel().getValueAt(i, 0).toString();
                String iname = jTable1.getModel().getValueAt(i, 1).toString();
                String form = jTable1.getModel().getValueAt(i, 2).toString();
                String fqty = jTable1.getModel().getValueAt(i, 3).toString();
                String qty = jTable1.getModel().getValueAt(i, 4).toString();
                String batch = jTable1.getModel().getValueAt(i, 5).toString();
                String edate = jTable1.getModel().getValueAt(i, 6).toString();
                String price = jTable1.getModel().getValueAt(i, 7).toString();
                String mrp = jTable1.getModel().getValueAt(i, 8).toString();
                String udist = jTable1.getModel().getValueAt(i, 9).toString();
                String vat = jTable1.getModel().getValueAt(i, 10).toString();
                String fprice = jTable1.getModel().getValueAt(i, 11).toString();
                int adjId = Integer.parseInt(jTable1.getModel().getValueAt(i, 13).toString());
                jcomp.getModel().setValueAt((j + 1), j, 0);
                jcomp.getModel().setValueAt(icode, j, 1);
                jcomp.getModel().setValueAt(iname, j, 2);
                jcomp.getModel().setValueAt(form, j, 3);
                jcomp.getModel().setValueAt(Integer.parseInt(fqty), j, 4);
                jcomp.getModel().setValueAt(Integer.parseInt(qty), j, 5);
                jcomp.getModel().setValueAt(batch, j, 6);
                jcomp.getModel().setValueAt(edate, j, 7);
                jcomp.getModel().setValueAt(Double.parseDouble(price), j, 8);
                jcomp.getModel().setValueAt(Double.parseDouble(mrp), j, 9);
                jcomp.getModel().setValueAt(Double.parseDouble(udist), j, 10);
                jcomp.getModel().setValueAt(Double.parseDouble(vat), j, 11);
                jcomp.getModel().setValueAt(Double.parseDouble(fprice), j, 12);
                jcomp.getModel().setValueAt(adjId, j, 14);
                j++;
            }
        }
        this.dispose();
        jcomp.changeSelection(0, 4, false, false);
        jcomp.requestFocus();
    } catch (NumberFormatException ex) {
        String ss = "  Method: insertSalesValue   Exception : " + ex.getMessage();
        log.debug(ss);
        JOptionPane.showMessageDialog(this, "Error parsing data. Please check input values.", "Error", JOptionPane.ERROR_MESSAGE);
    }
}

void insertReturnDatas() {
    boolean bo = false;
    for (int i = 0; i < jTable1.getModel().getRowCount(); i++) {
        if (title.equals("Sales")) {
            boolean isSelect = (Boolean) jTable1.getModel().getValueAt(i, 12);
            if (isSelect) {
                bo = true;
                break;
            }
        }
    }
    if (bo) {
        if (title.equals("Sales")) {
            insertSalesValue();
        }
    } else {
        String msg = "Please select at least one item to insert!";
        JOptionPane.showMessageDialog(jTable1, msg, title + " Return", JOptionPane.WARNING_MESSAGE);
    }
}

void loadReturnDatas(String val) {
    if (title.equals("Sales")) {
        loadSalesDatas(val);
    }
}











//    void loadSalesDatas(String val) {
//        System.out.println("kumarr");
//        String cut = val.substring(0, 3);
//        int no = 0;
//        if (cut.equals("SCA")) {
//            no = 1;
//        } else if (cut.equals("SCR")) {
//            no = 2;
//        } else if (cut.equals("SCD")) {
//            no = 3;
//        } else if (cut.equals("SPC")) {
//            no = 4;
//        } else if (cut.equals("SAC")) {
//            no = 5;
//        }
//        Vector col = new Vector();
//        Vector data = new Vector();
//        try {
//            if (val != null) {
//                col.addElement("Product Code");0
//                col.addElement("Product Name");1
//                col.addElement("Form.");2
//                  col.addElement("fQty");3
//                col.addElement("Qty");4
//                col.addElement("Batch No");5
//                col.addElement("Expiry Date");6
//                col.addElement("Price");7
//                col.addElement("MRP");8
//                col.addElement("Dist");9
//                col.addElement("VAT");10
//                col.addElement("Select All");11
//                col.addElement("Adj Id");12
//                col.addElement("Editable");13
//                 System.out.println("kumarr903");
//                Sales salesController = (Sales) RegistryFactory.getClientStub(RegistryConstants.Sales);
//                data = salesController.loadSalesDetails(val,no);
//                jchck = new CheckBoxHeader(new CheckAllListener(jTable1, 11), "Select All", "Deselect All");
//                 System.out.println("kuma");
//                jTable1.setModel(new DefaultTableModel(data, col) {
//                    Class[] types = new Class[]{
//                        java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.Integer.class,
//                        java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class,
//                        java.lang.String.class, java.lang.String.class, java.lang.Boolean.class, java.lang.Integer.class,
//                        java.lang.Boolean.class
//                        };
//
//                    @Override
//                    public Class getColumnClass(int columnIndex) {
//                        return types[columnIndex];
//                    }
//
//                    @Override
//                    public boolean isCellEditable(int rowIndex, int columnIndex) {
//                        Object edit = jTable1.getModel().getValueAt(rowIndex, 13);
//                        boolean s = Boolean.valueOf(edit.toString());
//                        boolean ret = false;
//                        if (s && columnIndex == 10) {
//                            ret = true;
//                        }
//                        return ret;
//                    }
//
//                    @Override
//                    public void fireTableCellUpdated(int row, int column) {
//                        super.fireTableCellUpdated(row, column);
//                        if (column == 10) {
//                            selectData();
//                        } else {
//                            Object edit = jTable1.getModel().getValueAt(row, 13);//11
//                            boolean s = Boolean.valueOf(edit.toString());
//                            if (!s) {
//                               jchck.doCheck();
//                            }
//                        }
//                    }
//                });
//                System.out.println("lofcf9");
//                TableColumn tc = jTable1.getColumnModel().getColumn(13);//12
//                tc.setCellEditor(jTable1.getDefaultEditor(Boolean.class));
//                tc.setCellRenderer(jTable1.getDefaultRenderer(Boolean.class));
//                tc.setHeaderRenderer(jchck);
//                   System.out.println("lofcf");
//                int colWidth[]={50,140,50,40,60,60,60,60,50,50,65,0,0};
//                for (int i = 0; i < col.size(); i++) {
//                    jTable1.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
//                }
//                System.out.println("lo");
////                jTable1.removeColumn(jTable1.getColumnModel().getColumn(12));
////                jTable1.removeColumn(jTable1.getColumnModel().getColumn(11));
//                jTable1.removeColumn(jTable1.getColumnModel().getColumn(13));
//                jTable1.removeColumn(jTable1.getColumnModel().getColumn(12));
//                 System.out.println("lortf");
//                jTable1.revalidate();
//                jTable1.repaint();
//
//            }
//        } catch (Exception ex) {
//            String ss = "  Method: loadSalesDatas   Exception : " + ex.getMessage();
//
//            log.debug(ss);
//        }
//    }

//    void loadSalesDatas(String val) {
//         System.out.println("lo1");
//    String cut = val.substring(0, 3);
//    int no = 0;
//    if (cut.equals("SCA")) {
//        no = 1;
//    } else if (cut.equals("SCR")) {
//        no = 2;
//    } else if (cut.equals("SCD")) {
//        no = 3;
//    } else if (cut.equals("SPC")) {
//        no = 4;
//    } else if (cut.equals("SAC")) {
//        no = 5;
//    }
//    Vector col = new Vector();
//    Vector data = new Vector();
//    try {
//         System.out.println("lo34");
//        if (val != null) {
//            col.addElement("Product Code");//0
//            col.addElement("Product Name");//1
//            col.addElement("Form.");//2
//            col.addElement("fQty");//3
//            col.addElement("Qty");//4
//            col.addElement("Batch No");//5
//            col.addElement("Expiry Date");//6
//            col.addElement("Price");//7
//            col.addElement("MRP");//8
//            col.addElement("Dist");//9
//            col.addElement("VAT");//10
//            col.addElement("F.Price");//11
//            col.addElement("Select All");//12
//            col.addElement("Adj Id");//13
//            col.addElement("Editable");//14
//
//            Sales salesController = (Sales) RegistryFactory.getClientStub(RegistryConstants.Sales);
//            data = salesController.loadSalesDetails(val, no);
// System.out.println("lo4");
//            // Convert data to ensure Boolean columns are correct
//            for (int i = 0; i < data.size(); i++) {
//                Vector row = (Vector) data.get(i);
//                // Ensure the 'Select All' and 'Editable' columns are Boolean
//                row.set(12, Boolean.valueOf(row.get(12).toString())); // 'Select All' column index
//                row.set(14, Boolean.valueOf(row.get(14).toString())); // 'Editable' column index
//            }
// System.out.println("lo56");
//            jchck = new CheckBoxHeader(new CheckAllListener(jTable1, 13), "Select All", "Deselect All");
//
//            jTable1.setModel(new DefaultTableModel(data, col) {
//                Class[] types = new Class[]{
//                    java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.Integer.class,java.lang.Integer.class,
//                    java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class,
//                    java.lang.String.class, java.lang.String.class,java.lang.Integer.class, java.lang.Boolean.class, java.lang.Integer.class,
//                    java.lang.Boolean.class
//                };
//
//                @Override
//                public Class getColumnClass(int columnIndex) {
//                    return types[columnIndex];
//                }
//
//                @Override
//                public boolean isCellEditable(int rowIndex, int columnIndex) {
//                     System.out.println("lo5600");
//                    Object edit = jTable1.getModel().getValueAt(rowIndex, 14);//13
//                    boolean s = Boolean.valueOf(edit.toString());
//                     System.out.println("lo560089");
//                    boolean ret = false;
//                       System.out.println("l");
//                    if (s && columnIndex == 11)//10
//                    {
//                        System.out.println("l89");
//                        ret = true;
//                    }
//                    return ret;
//                }
//
//                @Override
//                public void fireTableCellUpdated(int row, int column) {
//                     System.out.println("lo567");
//                    super.fireTableCellUpdated(row, column);
//                    if (column == 10) {
//                        selectData();
//                    } else {
//                        Object edit = jTable1.getModel().getValueAt(row, 14); // 'Editable' column index
//                        boolean s = Boolean.valueOf(edit.toString());
//                        if (!s) {
//                            jchck.doCheck();
//                        }
//                    }
//                }
//            });
//
//            TableColumn tc = jTable1.getColumnModel().getColumn(14); // 'Editable' column index
//            tc.setCellEditor(jTable1.getDefaultEditor(Boolean.class));
//            tc.setCellRenderer(jTable1.getDefaultRenderer(Boolean.class));
//            tc.setHeaderRenderer(jchck);
// System.out.println("lo526");
//            int colWidth[] = {50, 140, 50, 40, 20, 60, 60, 60, 60, 50, 50,50, 65, 0, 0};
//            for (int i = 0; i < col.size(); i++) {
//                jTable1.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
//            }
//
//            jTable1.removeColumn(jTable1.getColumnModel().getColumn(13));
//            jTable1.removeColumn(jTable1.getColumnModel().getColumn(12));
//
//            jTable1.revalidate();
//            jTable1.repaint();
//        }
//    } catch (Exception ex) {
//        String ss = "  Method: loadSalesDatas   Exception : " + ex.getMessage();
//        log.debug(ss);
//    }
//}
void loadSalesDatas(String val) {
    System.out.println("lo1");
    String cut = val.substring(0, 3);
    int no = 0;
    if (cut.equals("SCA")) {
        no = 1;
    } else if (cut.equals("SCR")) {
        no = 2;
    } else if (cut.equals("SCD")) {
        no = 3;
    } else if (cut.equals("SPC")) {
        no = 4;
    } else if (cut.equals("SAC")) {
        no = 5;
    }
    Vector col = new Vector();
    Vector data = new Vector();
    try {
        System.out.println("lo34");
        if (val != null) {
            col.addElement("Product Code");
            col.addElement("Product Name");
            col.addElement("Form.");
            col.addElement("fQty");
            col.addElement("Qty");
            col.addElement("Batch No");
            col.addElement("Expiry Date");
            col.addElement("Price");
            col.addElement("MRP");
            col.addElement("Dist");
            col.addElement("VAT");
            col.addElement("F.Price");
            col.addElement("Select All");
            col.addElement("Adj Id");
            col.addElement("Editable");

            Sales salesController = (Sales) RegistryFactory.getClientStub(RegistryConstants.Sales);
            data = salesController.loadSalesDetails(val, no);
            jchck = new CheckBoxHeader(new CheckAllListener(jTable1, 12), "Select All", "Deselect All");
            jTable1.setModel(new DefaultTableModel(data, col) {
                Class[] types = new Class[]{
                    java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.Integer.class,
                    java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.String.class,
                    java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.Integer.class, java.lang.Boolean.class,
                    java.lang.Integer.class, java.lang.Boolean.class
                };

                @Override
                public Class getColumnClass(int columnIndex) {
                    return types[columnIndex];
                }

               public boolean isCellEditable(int rowIndex, int columnIndex) {
                        Object edit = jTable1.getModel().getValueAt(rowIndex, 14);
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
                    System.out.println("kumarreturn");
                    if (column == 10) //14old
                    {
                          System.out.println("kumarreturn234");
                        selectData();
                           System.out.println("kumarreturn23490");
                    } else {
                        Object edit = jTable1.getModel().getValueAt(row, 12);
                        boolean s = Boolean.valueOf(edit.toString());
                        if (!s) {
                            jchck.doCheck();
                        }
                    }
                }
            });
   System.out.println("23490");
            TableColumn tc = jTable1.getColumnModel().getColumn(12);
            tc.setCellEditor(jTable1.getDefaultEditor(Boolean.class));
            tc.setCellRenderer(jTable1.getDefaultRenderer(Boolean.class));
            tc.setHeaderRenderer(jchck);
 System.out.println("234");
            int colWidth[] = {50, 140, 50, 20, 20, 60, 60, 60, 60, 50, 40, 10, 65, 0, 0};
            for (int i = 0; i < col.size(); i++) {
                System.out.println(col.size());
                jTable1.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
            }
 System.out.println("23410");
            jTable1.removeColumn(jTable1.getColumnModel().getColumn(14));
            jTable1.removeColumn(jTable1.getColumnModel().getColumn(13));

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
