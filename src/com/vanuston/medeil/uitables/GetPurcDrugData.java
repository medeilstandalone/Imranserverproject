package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.implementation.Purchase;
import com.vanuston.medeil.implementation.PurchaseOrder;
import com.vanuston.medeil.model.PurchaseModel;
import com.vanuston.medeil.model.PurchaseOrderModel;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.RegistryConstants;
import java.awt.*;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import java.rmi.RemoteException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Calendar;
import java.util.Vector;
import javax.swing.AbstractAction;
import javax.swing.JComponent;
import javax.swing.JTable;
import javax.swing.KeyStroke;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableCellRenderer;

public final class GetPurcDrugData extends javax.swing.JDialog {
    static Logger log = Logger.getLogger(GetPurcDrugData.class, "Utilities");
    DateUtils dutil = new DateUtils();
    CommonImplements commonController;
    Purchase purchaseCont;
    PurchaseOrder purchaseOrder;
    String ss = " Drug Index";
    JTable jcomp;
    String tName;
    Image medilICO = Toolkit.getDefaultToolkit().getImage("LogoMedil.png");
    public KeyStroke escape = KeyStroke.getKeyStroke(KeyEvent.VK_ESCAPE, 0);
    List<PurchaseModel> stkList;
    Vector col;

    public GetPurcDrugData(JTable jc, String tableName) throws RemoteException {
        try {
            commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
            purchaseCont = (Purchase) RegistryFactory.getClientStub(RegistryConstants.Purchase);
            purchaseOrder = (PurchaseOrder) RegistryFactory.getClientStub(RegistryConstants.PurchaseOrder);
            jcomp = jc;
            tName = tableName;
            stopEditing();
            initComponents();
            setModal(true);
            jcomp.getTableHeader().setReorderingAllowed(false);
            jTable1.getInputMap().put(escape, "CloseWindow");
            jTable1.setAutoCreateColumnsFromModel(true);
            jTable1.getTableHeader().setFont(new Font("Arial", Font.BOLD, 16));
            jTable2.getTableHeader().setFont(new Font("Arial", Font.BOLD, 16));
            jTextField1.getInputMap().put(escape, "CloseWindow");            
            jPanel2.setMinimumSize(new Dimension(jTable1.getWidth(), jPanel2.getHeight()));
            jPanel2.setMaximumSize(new Dimension(jTable1.getWidth(), jPanel2.getHeight()));
            jTable1.getActionMap().put("CloseWindow", new AbstractAction("CloseWindow") {
                @Override
                public void actionPerformed(ActionEvent evt) {
                    dispose();
                    resetTable2();
                }
            });
            jTextField1.requestFocus();
            if (tName.equalsIgnoreCase("Purchase")) {
                loadDrugTable("","");
            } else if (tName.equalsIgnoreCase("PurcOrder")) {
                loadPODrugTable("");
            }
        } catch (Exception ex) {            
            log.debug("Method:GetPurcDrugData Exception:"+ex.getMessage());
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
            @Override
            public Component prepareRenderer(TableCellRenderer renderer, int row, int column)
            {
                Component c = super.prepareRenderer(renderer, row, column);
                try{

                    int a = super.getColumnCount();
                    Color  banned = new Color(204,51,51);
                    Color  outS = new Color(235,236,148);
                    //                                Color  expStk = new Color(240,203,168);
                    Color  expStk = new Color(204,204,254);
                    //                                if(a > 9)
                    //                                {
                        if (tName.equalsIgnoreCase("Sales") || tName.equalsIgnoreCase("CounterSales"))
                        {
                            Object val = getModel().getValueAt(row, 11);
                            Object stkQ = getModel().getValueAt(row, 5);
                            Object expD = getModel().getValueAt(row, 9);

                            String ques = "SELECT DATEDIFF(STR_TO_DATE('"+expD.toString().trim()+"-01','%M-%Y-%d'),concat(DATE_FORMAT(curdate(),'%Y-%m'),'-01')) as compare";

                            int compVal = commonController.getCompare(ques);

                            if (!c.getBackground().equals(getSelectionBackground()) && val!=null && stkQ!=null)
                            {
                                String type = val.toString();
                                String typ = stkQ.toString();
                                int t = Integer.parseInt(typ);

                                if(type.equals("1"))
                                {
                                    c.setBackground(banned);
                                    c.setForeground(Color.WHITE);
                                    this.setToolTipText("item highlighted in Red represents Banned Drug");
                                }
                                else if (t <= 0)
                                {
                                    c.setBackground(outS);
                                    c.setForeground(Color.darkGray);
                                    this.setToolTipText(" item highlighted in Yellow represents Out Of Stock");
                                }
                                else if (compVal <= 0)
                                {
                                    c.setBackground(expStk);
                                    c.setForeground(Color.BLACK);
                                    this.setToolTipText(" item highlighted in Orange represents Expired stock");
                                }
                                else{
                                    c.setBackground( Color.WHITE);
                                    c.setForeground(Color.BLACK);
                                    //                                            this.setToolTipText(" This Red Background shows Out Of Stocks");
                                }
                                // }
                        }
                        /*if (!c.getBackground().equals(getSelectionBackground()) && stkQ!=null)
                        {
                            String type = stkQ.toString();
                            int t = Integer.parseInt(type);
                            if(t<=0)
                            {
                                c.setBackground(outS);
                                c.setForeground(Color.darkGray);
                                this.setToolTipText(" This Red Background shows Out Of Stocks");
                            }else{
                                c.setBackground( Color.WHITE);
                                c.setForeground(Color.BLACK);
                                this.setToolTipText(" This Red Background shows Out Of Stocks");
                            }
                        }*/
                    }
                }catch(Exception e){
                    e.printStackTrace();
                }
                return c;
            }

        };
        jPanel2 = new javax.swing.JPanel();
        jLabel2 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jScrollPane2 = new javax.swing.JScrollPane();
        jTable2 = new javax.swing.JTable();
        jLabel1 = new javax.swing.JLabel();
        txttotalQty = new javax.swing.JTextField();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle(ss);
        setAlwaysOnTop(true);
        setCursor(new java.awt.Cursor(java.awt.Cursor.DEFAULT_CURSOR));
        setResizable(false);
        addWindowListener(new java.awt.event.WindowAdapter() {
            public void windowClosing(java.awt.event.WindowEvent evt) {
                formWindowClosing(evt);
            }
        });
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

        jPanel1.setPreferredSize(new java.awt.Dimension(1533, 451));

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

        jTable1.setFont(new java.awt.Font("Tahoma", 0, 14)); // NOI18N
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
        jTable1.addFocusListener(new java.awt.event.FocusAdapter() {
            public void focusGained(java.awt.event.FocusEvent evt) {
                jTable1FocusGained(evt);
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

        jPanel2.setBorder(javax.swing.BorderFactory.createEtchedBorder());
        jPanel2.setPreferredSize(new java.awt.Dimension(970, 114));

        jLabel2.setBackground(new java.awt.Color(204, 51, 51));
        jLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/vanuston/medeil/ui/images/BannedDrug.png"))); // NOI18N
        jLabel2.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        jLabel2.setDebugGraphicsOptions(javax.swing.DebugGraphics.NONE_OPTION);

        jLabel5.setFont(new java.awt.Font("Tahoma", 1, 14));
        jLabel5.setText("Banned Drug");

        jTable2.setModel(new javax.swing.table.DefaultTableModel(
            new Object [][] {

            },
            new String [] {
                "Batch", "Expiry Date", "Quantity"
            }
        ) {
            boolean[] canEdit = new boolean [] {
                false, false, false
            };

            public boolean isCellEditable(int rowIndex, int columnIndex) {
                return canEdit [columnIndex];
            }
        });
        jTable2.setGridColor(new java.awt.Color(204, 204, 255));
        jTable2.setMinimumSize(new java.awt.Dimension(45, 70));
        jTable2.getTableHeader().setReorderingAllowed(false);
        jScrollPane2.setViewportView(jTable2);

        jLabel1.setFont(new java.awt.Font("Arial", 1, 14));
        jLabel1.setText("Available Quantity :");

        txttotalQty.setBackground(new java.awt.Color(236, 233, 216));
        txttotalQty.setFont(new java.awt.Font("Arial", 1, 14));
        txttotalQty.setHorizontalAlignment(javax.swing.JTextField.LEFT);
        txttotalQty.setText("0");
        txttotalQty.setBorder(null);

        org.jdesktop.layout.GroupLayout jPanel2Layout = new org.jdesktop.layout.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(jPanel2Layout.createSequentialGroup()
                        .add(jLabel2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 16, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                        .add(14, 14, 14)
                        .add(jLabel5, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 141, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                    .add(jPanel2Layout.createSequentialGroup()
                        .add(jLabel1)
                        .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                        .add(txttotalQty, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 112, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)))
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED, 196, Short.MAX_VALUE)
                .add(jScrollPane2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 479, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap())
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel2Layout.createSequentialGroup()
                .add(jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(jPanel2Layout.createSequentialGroup()
                        .add(19, 19, 19)
                        .add(jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                            .add(jLabel2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 16, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                            .add(jPanel2Layout.createSequentialGroup()
                                .add(jLabel5)
                                .add(34, 34, 34)
                                .add(jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                                    .add(jLabel1)
                                    .add(txttotalQty, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)))))
                    .add(jPanel2Layout.createSequentialGroup()
                        .addContainerGap()
                        .add(jScrollPane2, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 90, Short.MAX_VALUE)))
                .addContainerGap())
        );

        org.jdesktop.layout.GroupLayout jPanel1Layout = new org.jdesktop.layout.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.TRAILING, false)
                    .add(org.jdesktop.layout.GroupLayout.LEADING, jPanel2, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 949, Short.MAX_VALUE)
                    .add(org.jdesktop.layout.GroupLayout.LEADING, jScrollPane1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 949, Short.MAX_VALUE)
                    .add(org.jdesktop.layout.GroupLayout.LEADING, jTextField1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 550, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE))
                .add(21, 21, 21))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel1Layout.createSequentialGroup()
                .add(11, 11, 11)
                .add(jTextField1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.UNRELATED)
                .add(jScrollPane1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 230, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .add(2, 2, 2)
                .add(jPanel2, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 116, Short.MAX_VALUE)
                .addContainerGap())
        );

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .add(jPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 970, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addContainerGap(org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE))
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 401, Short.MAX_VALUE)
        );

        java.awt.Dimension screenSize = java.awt.Toolkit.getDefaultToolkit().getScreenSize();
        setBounds((screenSize.width-973)/2, (screenSize.height-440)/2, 973, 440);
    }// </editor-fold>//GEN-END:initComponents

    private void formFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_formFocusGained
        jTextField1.requestFocus();        
}//GEN-LAST:event_formFocusGained

    private void jTextField1KeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTextField1KeyReleased
        String val = jTextField1.getText();
        if (val.length() > 1) {
            if (tName.equalsIgnoreCase("Purchase")) {
                loadDrugTable(val,"");
            } else if (tName.equalsIgnoreCase("PurcOrder")) {
                loadPODrugTable(val);
            }
        }
        if (evt.getKeyCode() == KeyEvent.VK_DOWN || evt.getKeyCode() == KeyEvent.VK_ENTER || evt.getKeyCode() == KeyEvent.VK_TAB) {
            int r = jTable1.getRowCount();
            if (r > 0) {
                jTable1.requestFocus();
                jTable1.changeSelection(0, 0, true, false);
            }
        } else if (evt.getKeyCode() == KeyEvent.VK_ESCAPE) {
            this.dispose();
            resetTable2();
        }
}//GEN-LAST:event_jTextField1KeyReleased

    public void resetTable2() {
            Vector data = new Vector();
            jTable2.setModel(new DefaultTableModel(data,col));
            jTable2.revalidate();
            jTable2.repaint();
            txttotalQty.setText("0");
    }

    private void formKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_formKeyPressed
        jTextField1.requestFocus();                
}//GEN-LAST:event_formKeyPressed

    private void jTable1KeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTable1KeyReleased
        int i=jTable1.getSelectedRow();
        getStockDetails(i);        
}//GEN-LAST:event_jTable1KeyReleased
    public void getStockDetails(int i) {
        col = new Vector();
        col.addElement("Batch No.");
        col.addElement("Expiry Date");
        col.addElement("Quantity");
        Vector data = new Vector();
        stkList = new ArrayList<PurchaseModel>();
        PurchaseModel model;
        try {
        String dcode = ""+jTable1.getModel().getValueAt(i,1);
        stkList = purchaseCont.getStockDetails(dcode);
        int totalQty = 0;
        for(int index=0; index < stkList.size();index++) {
        model = stkList.get(index);
        totalQty += model.getQuantity();
        Vector temp = new Vector();
        String expDate = new SimpleDateFormat("MM/yy").format(new SimpleDateFormat("yyyy-MM-dd").parse(model.getExpdate()));
        temp.addElement(model.getBatch());
        temp.addElement(expDate);
        temp.addElement(model.getQuantity());
        data.addElement(temp);
        }
        setModal(true);
        txttotalQty.setText(""+totalQty);
        jTable2.getTableHeader().setReorderingAllowed(false);
        jTable2.setModel(new DefaultTableModel(data,col)
        {
        boolean[] canEdit = new boolean [] {
        false, false, false
        };

        @Override
        public boolean isCellEditable(int rowIndex, int columnIndex) {
        return canEdit [columnIndex];
        }
        });        
        jTable2.revalidate();
        jTable2.repaint();        
        }
        catch(Exception e) {
            String ss = "Class : GetPurcDrugData  Method : getStockDetails   Exception : " + e.getMessage();
            log.debug(ss);
        }
    }
    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTable1MouseClicked
        selectValues();
}//GEN-LAST:event_jTable1MouseClicked
    private void selectValues() {
        if (tName.equalsIgnoreCase("Purchase")) {
            setPurchaseValues();
        } else if (tName.equalsIgnoreCase("PurcOrder")) {
            setPurcOrderValues();
        }
        resetTable2();
    }
    private void jTextField1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField1ActionPerformed
    }//GEN-LAST:event_jTextField1ActionPerformed

    private void jTable1KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTable1KeyPressed
        if (evt.getKeyCode() == 10) {
            selectValues();
        }        
    }//GEN-LAST:event_jTable1KeyPressed

    private void jTable1FocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_jTable1FocusGained
        int j=jTable1.getSelectedRow();        
            getStockDetails(0);
    }//GEN-LAST:event_jTable1FocusGained

    private void formWindowClosing(java.awt.event.WindowEvent evt) {//GEN-FIRST:event_formWindowClosing
        resetTable2();
    }//GEN-LAST:event_formWindowClosing

    public void setPurchaseValues() {
        stopEditing();
        final int i = jTable1.getSelectedRow();
        final int j = jcomp.getSelectedRow();
        try {
            String dname = "" + jTable1.getModel().getValueAt(i, 0);
            String dcode = "" + jTable1.getModel().getValueAt(i, 1);
            String mfgname = "" + jTable1.getModel().getValueAt(i, 2);
            String dosage = "" + jTable1.getModel().getValueAt(i, 3);
            String vat = "" + jTable1.getModel().getValueAt(i, 4);
            String mrp = "" + jTable1.getModel().getValueAt(i, 5);
            String form = "" + jTable1.getModel().getValueAt(i, 6);
            String vatCalcFlag = "" + jTable1.getModel().getValueAt(i, 8);
            String expiryDate = purchaseCont.getLastPurDetails(dcode).get(2);
            if(expiryDate.equals(""))
            expiryDate = DateUtils.now("yyyy-MM-dd");
            Date expDate = new SimpleDateFormat("yyyy-MM-dd").parse(expiryDate);
            boolean[] flag = new boolean[jcomp.getRowCount()];
            int flags = 0;
            if (flags != 1) {
                jcomp.getModel().setValueAt(j + 1, j, 0);
                jcomp.getModel().setValueAt(dname + "_" + dosage, j, 1);
                jcomp.getModel().setValueAt(form, j, 2);
                jcomp.getModel().setValueAt(mfgname, j, 3);
                jcomp.getModel().setValueAt(Integer.parseInt("0"), j, 4);
                jcomp.getModel().setValueAt(Integer.parseInt("0"), j, 5);
                jcomp.getModel().setValueAt(purchaseCont.getLastPurDetails(dcode).get(1), j, 6);
                jcomp.getModel().setValueAt(new SimpleDateFormat("MM/yy").format(expDate), j, 7);
                jcomp.getModel().setValueAt(purchaseCont.getPackingValue(dcode), j, 8);
                jcomp.getModel().setValueAt(Double.parseDouble(purchaseCont.getLastPurDetails(dcode).get(0).toString()), j, 9);
                jcomp.getModel().setValueAt(Double.parseDouble(mrp), j, 10);                
                jcomp.getModel().setValueAt(Double.parseDouble(purchaseCont.getLastPurDetails(dcode).get(3).toString()), j, 11);
                jcomp.getModel().setValueAt(Integer.parseInt("0"), j, 13);
                jcomp.getModel().setValueAt(Double.parseDouble(vat), j, 14);
                jcomp.getModel().setValueAt(dcode, j, 16);
                jcomp.getModel().setValueAt(Boolean.FALSE, j, 17);
                jcomp.getModel().setValueAt(Boolean.FALSE, j, 18);
                jcomp.getModel().setValueAt(vatCalcFlag, j, 19);
                this.dispose();
                jcomp.requestFocus();
                jcomp.changeSelection(j, 4, false, false);
            }
            jTextField1.setText("");
        } catch (Exception ex) {
            String ss = "Class : GetPurcDrugData  Method : setPurchaseValues   Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

    public void setPurcOrderValues() {
        stopEditing();
        final int i = jTable1.getSelectedRow();
        final int j = jcomp.getSelectedRow();
        try {
            String dname = "" + jTable1.getModel().getValueAt(i, 0);
            String dcode = "" + jTable1.getModel().getValueAt(i, 1);
            String dosage = "" + jTable1.getModel().getValueAt(i, 2);
            boolean[] flag = new boolean[jcomp.getRowCount()];
            int flags = 0;
            for (int val = 0; val < jcomp.getRowCount(); val++) {
                if (j != 0) {
                    if (val == j && jcomp.getModel().getValueAt(val, 1) == null); else if (jcomp.getModel().getValueAt(val, 1) == null); else if (jcomp.getModel().getValueAt(val, 1).equals(dcode)) {
                        flag[val] = true;
                        flags = 1;
                        this.dispose();
                        jcomp.requestFocus();
                        jcomp.changeSelection(val, 4, false, false);
                        jcomp.setEditingColumn(val);
                    }
                }
            }
            if (flags != 1) {
                jcomp.getModel().setValueAt(j + 1, j, 0);
                jcomp.getModel().setValueAt(dcode, j, 1);
                jcomp.getModel().setValueAt(dname, j, 2);
                jcomp.getModel().setValueAt(dosage, j, 3);
                jcomp.getModel().setValueAt(Integer.parseInt("0"), j, 4);
                jcomp.getModel().setValueAt(Integer.parseInt("0"), j, 5);
                this.dispose();
                jcomp.requestFocus();
                jcomp.changeSelection(j, 4, false, false);
            }
            jTextField1.setText("");
        } catch (Exception ex) {
            String ss = "Class : GetPurcDrugData  Method : setPurcOrderValues   Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

        public void loadDrugTable(String val,String barcode) {
        stopEditing();
        Vector col = new Vector();
        Vector data = new Vector();
        try {
            col.addElement("Product Name");
            col.addElement("Product Code");
            col.addElement("MFR Name");
            col.addElement("Dosage");
            col.addElement("VAT");
            col.addElement("MRP");
            col.addElement("Formulation");
            col.addElement("Drug Flag ID");
            col.addElement("vat_calc_flag");
            if (val == null || val.equals("")) {
            } else {
                PurchaseModel pModel;
                List<PurchaseModel> purchaseBill = new ArrayList<PurchaseModel>();
                if(barcode.equals("")) {
                    purchaseBill = purchaseCont.getDrugTableValues(val);
                }
                else {
                    purchaseBill = purchaseCont.getBarcodeValues(val);
                }
                int index = 0;
                for (index = 0; index < purchaseBill.size(); index++) {
                    pModel = purchaseBill.get(index);
                    Vector temp = new Vector();
                    temp.addElement(pModel.getItemName());
                    temp.addElement(pModel.getItemCode());
                    temp.addElement(pModel.getMfrName());
                    temp.addElement(pModel.getPacking());
                    temp.addElement(pModel.getUnitVat());
                    temp.addElement(pModel.getMrp());
                    temp.addElement(pModel.getBatch());
                    temp.addElement(pModel.getUpdate_flagid());
                    temp.addElement(pModel.getPurc_adj_flagid());
                    data.addElement(temp);
                }
            }
            jTable1.setModel(new DefaultTableModel(data, col));
            jTable1.getColumnModel().getColumn(0).setPreferredWidth(300);
            jTable1.removeColumn(jTable1.getColumnModel().getColumn(8));
            jTable1.revalidate();
            jTable1.repaint();            
        } catch (Exception ex) {
            String ss = "Class : GetPurcDrugData      Method : loadDrugTable   Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

    public void loadPODrugTable(String val) {
        stopEditing();
        Vector col = new Vector();
        Vector data = new Vector();
        try {
            col.addElement("Product Name");
            col.addElement("Product Code");
            col.addElement("Dosage");
            col.addElement("Drug Flag ID");
            if (val == null || val.equals("")) {
            } else {
                Object purcOrder1 = new Object();
                purcOrder1 = purchaseOrder.getDrugTableValues(val);
                PurchaseOrderModel purcOrder = (PurchaseOrderModel) purcOrder1;
                PurchaseOrderModel pModel;
                List<PurchaseOrderModel> purcOrderBill = new ArrayList<PurchaseOrderModel>();
                purcOrderBill = purcOrder.getListofitems();
                int index = 0;
                for (index = 0; index < purcOrderBill.size(); index++) {
                    pModel = purcOrderBill.get(index);
                    Vector temp = new Vector();
                    temp.addElement(pModel.getPurcOrderIN());
                    temp.addElement(pModel.getPurcOrderIC());
                    temp.addElement(pModel.getPurcOrderDos());
                    temp.addElement(pModel.getPurcOrderPack());
                    data.addElement(temp);
                }
            }
            jTable1.setModel(new DefaultTableModel(data, col));
            jTable1.revalidate();
            jTable1.repaint();
        } catch (Exception ex) {
            String ss = "Class : GetPurcDrugData      Method : loadPODrugTable   Exception : " + ex.getMessage();
        }
    }

    public void refreshDrugTab() {
        jTextField1.requestFocus();
        loadDrugTable("","");
        jTextField1.setText("");
        this.setVisible(true);
        this.requestFocusInWindow();
        this.requestFocus();
    }

    public void refreshDrugTab(String itemCode, String barcode) {
        jTextField1.setText(itemCode);
        loadDrugTable(itemCode,barcode);
        if(jTable1.getRowCount() == 1) {
            jTable1.setRowSelectionInterval(0, 0);
            setPurchaseValues();
        }
        else {
            this.setVisible(true);
            this.requestFocusInWindow();
            this.requestFocus();
        }
    }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JScrollPane jScrollPane2;
    private javax.swing.JTable jTable1;
    private javax.swing.JTable jTable2;
    private javax.swing.JTextField jTextField1;
    private javax.swing.JTextField txttotalQty;
    // End of variables declaration//GEN-END:variables
}
