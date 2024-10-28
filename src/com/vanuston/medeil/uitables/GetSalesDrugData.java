package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.implementation.Sales;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import java.awt.Color;
import java.awt.Component;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Image;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.Vector;
import java.util.logging.Level;
import javafx.stage.Alert;
import javax.swing.AbstractAction;
import javax.swing.JComponent;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.KeyStroke;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableCellRenderer;

public class GetSalesDrugData extends javax.swing.JDialog {   
    CommonImplements commonController;
    Sales salesController;
    static Logger log = Logger.getLogger(GetSalesDrugData.class, "Utilities");
    String ss = " Drug Index";
    JTable jcomp;
    String tName;
    String type;
    GetSubstituteDrugs sd;
    TempStocks tempS;
    Image medilICO = Toolkit.getDefaultToolkit().getImage("LogoMedil.png");
    public static KeyStroke shrctF9 = KeyStroke.getKeyStroke(KeyEvent.VK_F9, 0);
    public static KeyStroke shrctF11 = KeyStroke.getKeyStroke(KeyEvent.VK_F11, 0);
    public static KeyStroke escape = KeyStroke.getKeyStroke(KeyEvent.VK_ESCAPE, 0);
    private int[] minStkArray;
     
    public GetSalesDrugData(JTable jc, String tableName, String formType) {       
        try {            
            commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
            salesController = (Sales) RegistryFactory.getClientStub(RegistryConstants.Sales);
            jcomp = jc;
            tName = tableName;
            type = formType;
            int s = 0;
            if (tName.equalsIgnoreCase("Sales") || tName.equalsIgnoreCase("CounterSales")) {
                ss = "Stocks";
                s = 1;
            }else{
                s = 0;
            }
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
            if(s == 0)
            {
                jLabel1.setVisible(false);
                jLabel4.setVisible(false);
                jLabel3.setVisible(false);
                jLabel6.setVisible(false);
                jLabel7.setVisible(false);
                jLabel8.setVisible(false);
            }else if(s ==1){
                jLabel1.setVisible(true);
                jLabel4.setVisible(true);
                jLabel3.setVisible(true);
                jLabel6.setVisible(true);
                jLabel7.setVisible(true);
                jLabel8.setVisible(true);

            }
            jPanel2.setMinimumSize(new Dimension(jTable1.getWidth(), jPanel2.getHeight()));
            jPanel2.setMaximumSize(new Dimension(jTable1.getWidth(), jPanel2.getHeight()));

            jTable1.getActionMap().put("CloseWindow", new AbstractAction("CloseWindow") {

                @Override
                public void actionPerformed(ActionEvent evt) {
                    dispose();
                }
            });
            jTable1.getActionMap().put("callTempStocks", new AbstractAction("callTempStocks") {
                @Override
                public void actionPerformed(ActionEvent evt) {
                    if (tName.equalsIgnoreCase("Sales") || tName.equalsIgnoreCase("CounterSales")) {
                        try {
                            callTempStocks();
                        } catch (RemoteException ex) {
                            java.util.logging.Logger.getLogger(GetSalesDrugData.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                }
            });
            jTable1.getActionMap().put("callSubstituteDrugs", new AbstractAction("callSubstituteDrugs") {
                @Override
                public void actionPerformed(ActionEvent evt) {
                    if (tName.equalsIgnoreCase("Sales") || tName.equalsIgnoreCase("CounterSales")) {
                        try {
                            callSubstituteDrugs();
                        } catch (RemoteException ex) {
                            java.util.logging.Logger.getLogger(GetSalesDrugData.class.getName()).log(Level.SEVERE, null, ex);
                        } catch (NotBoundException ex) {
                            java.util.logging.Logger.getLogger(GetSalesDrugData.class.getName()).log(Level.SEVERE, null, ex);
                        }
                    }
                }
            });            
            jTextField1.requestFocus();
            if (tName.equalsIgnoreCase("Sales") || tName.equalsIgnoreCase("CounterSales")) {
                loadStockTable("");
            } 
        } catch (Exception ex) {            
            log.debug("Method:GetSalesDrugData Exception:"+ex.getMessage());
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
                try {
                    int a = super.getColumnCount();
                    Color  banned = new Color(204,51,51);
                    Color  outS = new Color(235,236,148);
                    //                                Color  expStk = new Color(240,203,168);
                    Color  expStk = new Color(204,204,254);
                    Color  minStk = new Color(204,255,255);
                    //                                if(a > 9)
                    //                                {
                        if (tName.equalsIgnoreCase("Sales") || tName.equalsIgnoreCase("CounterSales"))
                        {

                            Object val = getModel().getValueAt(row, 11);
                            Object stkQ = getModel().getValueAt(row, 5);
                            Object expD = getModel().getValueAt(row, 9);
                            Object productCode = getModel().getValueAt(row, 1);
                            Object batch = getModel().getValueAt(row, 4);
                            String ques = "SELECT DATEDIFF(STR_TO_DATE('"+expD.toString().trim()+"-01','%M-%Y-%d'),concat(DATE_FORMAT(curdate(),'%Y-%m'),'-01')) as compare";
                            //CommonImplements commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
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
                                else if (minStkArray[row] == 1)
                                {
                                    c.setBackground(minStk);
                                    c.setForeground(Color.BLACK);
                                    this.setToolTipText(" item highlighted in Blue represents Minimum stock");                        }
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
                }
                catch(Exception ex) {
                    ex.getMessage();
                }
                return c;
            }
        };
        jPanel2 = new javax.swing.JPanel();
        jLabel1 = new javax.swing.JLabel();
        jLabel2 = new javax.swing.JLabel();
        jLabel3 = new javax.swing.JLabel();
        jLabel4 = new javax.swing.JLabel();
        jLabel5 = new javax.swing.JLabel();
        jLabel6 = new javax.swing.JLabel();
        jLabel7 = new javax.swing.JLabel();
        jLabel8 = new javax.swing.JLabel();
        jLabel9 = new javax.swing.JLabel();
        jLabel10 = new javax.swing.JLabel();

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
        jPanel2.setPreferredSize(new java.awt.Dimension(930, 35));

        jLabel1.setBackground(new java.awt.Color(204, 204, 254));
        jLabel1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/vanuston/medeil/ui/images/ExpiryStock.png"))); // NOI18N
        jLabel1.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        jLabel2.setBackground(new java.awt.Color(204, 51, 51));
        jLabel2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/vanuston/medeil/ui/images/BannedDrug.png"))); // NOI18N
        jLabel2.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));
        jLabel2.setDebugGraphicsOptions(javax.swing.DebugGraphics.NONE_OPTION);

        jLabel3.setBackground(new java.awt.Color(235, 236, 148));
        jLabel3.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/vanuston/medeil/ui/images/OutofStock.png"))); // NOI18N
        jLabel3.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        jLabel4.setFont(new java.awt.Font("Tahoma", 1, 14));
        jLabel4.setText("Expired Stock");

        jLabel5.setFont(new java.awt.Font("Tahoma", 1, 14));
        jLabel5.setText("Banned Drug");

        jLabel6.setFont(new java.awt.Font("Tahoma", 1, 14));
        jLabel6.setText("Out of Stock");

        jLabel7.setFont(new java.awt.Font("Tahoma", 1, 14));
        jLabel7.setText("F9 - Temporary Stock");

        jLabel8.setFont(new java.awt.Font("Tahoma", 1, 14));
        jLabel8.setText("F11 - Substitute Drug");

        jLabel9.setBackground(new java.awt.Color(204, 255, 255));
        jLabel9.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/vanuston/medeil/ui/images/MinStock.png"))); // NOI18N
        jLabel9.setBorder(javax.swing.BorderFactory.createLineBorder(new java.awt.Color(0, 0, 0)));

        jLabel10.setFont(new java.awt.Font("Tahoma", 1, 14));
        jLabel10.setText("Min. Stock");

        org.jdesktop.layout.GroupLayout jPanel2Layout = new org.jdesktop.layout.GroupLayout(jPanel2);
        jPanel2.setLayout(jPanel2Layout);
        jPanel2Layout.setHorizontalGroup(
            jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel2Layout.createSequentialGroup()
                .add(10, 10, 10)
                .add(jLabel2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 16, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .add(14, 14, 14)
                .add(jLabel5, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 121, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(jLabel3, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 16, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.UNRELATED)
                .add(jLabel6)
                .add(38, 38, 38)
                .add(jLabel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 16, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .add(18, 18, 18)
                .add(jLabel4)
                .add(32, 32, 32)
                .add(jLabel9)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.UNRELATED)
                .add(jLabel10, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 71, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .add(18, 18, 18)
                .add(jLabel7)
                .add(20, 20, 20)
                .add(jLabel8)
                .addContainerGap(77, Short.MAX_VALUE))
        );
        jPanel2Layout.setVerticalGroup(
            jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel2Layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(jLabel6)
                    .add(jLabel3, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 17, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(jLabel5)
                    .add(jPanel2Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.BASELINE)
                        .add(jLabel10)
                        .add(jLabel7)
                        .add(jLabel8))
                    .add(jLabel2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 16, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(org.jdesktop.layout.GroupLayout.TRAILING, jLabel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 16, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                    .add(org.jdesktop.layout.GroupLayout.TRAILING, jLabel9, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 18, Short.MAX_VALUE)
                    .add(org.jdesktop.layout.GroupLayout.TRAILING, jLabel4))
                .addContainerGap())
        );

        org.jdesktop.layout.GroupLayout jPanel1Layout = new org.jdesktop.layout.GroupLayout(jPanel1);
        jPanel1.setLayout(jPanel1Layout);
        jPanel1Layout.setHorizontalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel1Layout.createSequentialGroup()
                .addContainerGap()
                .add(jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
                    .add(jScrollPane1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 997, Short.MAX_VALUE)
                    .add(jPanel1Layout.createSequentialGroup()
                        .add(jTextField1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 550, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                        .addContainerGap(447, Short.MAX_VALUE))
                    .add(jPanel2, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, 997, Short.MAX_VALUE)))
        );
        jPanel1Layout.setVerticalGroup(
            jPanel1Layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(org.jdesktop.layout.GroupLayout.TRAILING, jPanel1Layout.createSequentialGroup()
                .addContainerGap(17, Short.MAX_VALUE)
                .add(jTextField1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.UNRELATED)
                .add(jScrollPane1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 222, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .addPreferredGap(org.jdesktop.layout.LayoutStyle.RELATED)
                .add(jPanel2, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 44, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE)
                .add(5, 5, 5))
        );

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(layout.createSequentialGroup()
                .add(jPanel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
                .addContainerGap())
        );
        layout.setVerticalGroup(
            layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING)
            .add(jPanel1, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, org.jdesktop.layout.GroupLayout.DEFAULT_SIZE, Short.MAX_VALUE)
        );

        java.awt.Dimension screenSize = java.awt.Toolkit.getDefaultToolkit().getScreenSize();
        setBounds((screenSize.width-1033)/2, (screenSize.height-364)/2, 1033, 364);
    }// </editor-fold>//GEN-END:initComponents

    private void formFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_formFocusGained
        jTextField1.requestFocus();
}//GEN-LAST:event_formFocusGained

    private void jTextField1KeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTextField1KeyReleased
        String val = jTextField1.getText();
        if (val.length() > 1) {
            if (tName.equalsIgnoreCase("Sales") || tName.equalsIgnoreCase("CounterSales")) {
                loadStockTable(val);
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
        }
}//GEN-LAST:event_jTextField1KeyReleased

    private void formKeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_formKeyPressed
        jTextField1.requestFocus();
}//GEN-LAST:event_formKeyPressed

    private void jTable1KeyReleased(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTable1KeyReleased
}//GEN-LAST:event_jTable1KeyReleased

    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {//GEN-FIRST:event_jTable1MouseClicked
        try {
            selectValues();
        } catch (RemoteException ex) {
            log.debug("GetSalesDrugData jTable1MouseClicked RemoteException:"+ex.getMessage());
        }
}//GEN-LAST:event_jTable1MouseClicked
    private void selectValues() throws RemoteException {
        if (tName.equalsIgnoreCase("Sales") || tName.equalsIgnoreCase("CounterSales")) {
            setSalesValues();
        } 
    }
    private void jTextField1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField1ActionPerformed
    }//GEN-LAST:event_jTextField1ActionPerformed

    private void jTable1KeyPressed(java.awt.event.KeyEvent evt) {//GEN-FIRST:event_jTable1KeyPressed

        if (evt.getKeyCode() == 10) {
            try {
                selectValues();
            } catch (RemoteException ex) {
                log.debug("GetSalesDrugData jTable1KeyPressed RemoteException:"+ex.getMessage());
            }
        }

    }//GEN-LAST:event_jTable1KeyPressed

    public void callTempStocks() throws RemoteException {
        int s = jTable1.getSelectedRow();
//        commonController = new CommonController();
        if (s != -1) {
            Object itemName = jTable1.getModel().getValueAt(s, 0);
            Object itemCode = null;
            Object dosage = null;         
                                   
            itemCode = jTable1.getModel().getValueAt(s, 1);
            dosage = commonController.getDosage(itemCode.toString(), itemName.toString());           
            
            
            if (itemName == null && itemCode == null); else {
                this.dispose();
                new TempStocks(this, jcomp, itemName.toString(), itemCode.toString(), dosage.toString()).setVisible(true);
                loadStockTable(jTextField1.getText());
            }
        }
    }

    public void callSubstituteDrugs() throws RemoteException, NotBoundException {
        int i = jTable1.getSelectedRow();
        if (i != -1) {
            Object icode = jTable1.getModel().getValueAt(i, 1);
            if (icode == null); else {
                this.dispose();
                sd = new GetSubstituteDrugs(jcomp, icode.toString(), tName);
                sd.setVisible(true);
            }
        }
    }

    void goToItem(int rw, Object iName, Object batch) {
        int rcnt = jTable1.getRowCount();
    }

    public void setSalesValues() {
        System.out.println("jai");
        stopEditing();
        final int i = jTable1.getSelectedRow();
        final int j = jcomp.getSelectedRow();
        int rr = jcomp.getRowCount();
         System.out.println("kummm");
        try {
            System.out.println("kummm231");
            if (rr > 0) {
                System.out.println("kummm543");

                String stkQty = jTable1.getModel().getValueAt(i, 5).toString();
                System.out.println(jTable1.getModel().getValueAt(i, 5).toString());
                int stk = Integer.parseInt(stkQty);
                if (stk > 0) {
                     System.out.println("kummm23");
                    String dname = "" + jTable1.getModel().getValueAt(i, 0);
                    String dcode = "" + jTable1.getModel().getValueAt(i, 1);
//                  String mfgname = "" + jTable1.getModel().getValueAt(i, 2);
                    String dosage = "" + jTable1.getModel().getValueAt(i, 3);
                    System.out.println(dosage+jTable1.getModel().getValueAt(i, 3));
                    String batch = "" + jTable1.getModel().getValueAt(i, 4);
                    System.out.println(batch+jTable1.getModel().getValueAt(i, 4));
                    String uprice = "" + jTable1.getModel().getValueAt(i, 6);
                    String mrp = "" + jTable1.getModel().getValueAt(i, 7);
                    String vat = "" + jTable1.getModel().getValueAt(i, 8);
                    String edate = "" + jTable1.getModel().getValueAt(i,9 );
                    String forml = "" + jTable1.getModel().getValueAt(i, 10);
                          System.out.println("kumar1243979");
                    int bann = Integer.parseInt(jTable1.getModel().getValueAt(i, 11).toString());
                    System.out.println("kumar12");
                    double discount=Double.parseDouble(jTable1.getModel().getValueAt(i, 16).toString());
                           System.out.println("kumar1");
                    String fprice = "" + jTable1.getModel().getValueAt(i, 18 );
                    System.out.println("Value set fprice: " + Double.parseDouble(fprice) + " at row " + j + ", column 14");
                    System.out.println("kumar124312");
                    boolean[] flag = new boolean[jcomp.getRowCount()];
                    int flags = 0;
                    for (int val = 0; val < jcomp.getRowCount(); val++) {                        
                    if (j != 0) {
                        if (val == j && jcomp.getModel().getValueAt(val, 1) == null);
                        else if (jcomp.getModel().getValueAt(val, 1) == null);
                        else if (jcomp.getModel().getValueAt(val, 1).equals(dcode) && jcomp.getModel().getValueAt(val, 4).equals(batch)) {
                            flag[val] = true;
                            flags = 1;
                            System.out.println("k124312");
                            int adjId=Integer.parseInt(jcomp.getModel().getValueAt(i,15).toString());
                            System.out.println(jcomp.getModel().getValueAt(i,15).toString());
                            System.out.println("Value set adjId : "  + " at row " + j + ", column 15");
//                           String adjId = "123"; // Example value; ensure adjId is actually a String
//int j = 5; // Example value for j

                  //  System.out.println("Value set adjId : " + Integer.parseInt(int adjId) + " at row " + j + ", column 14");

                            System.out.println("k1");
                            if(adjId== 0) {
                                this.dispose();
                                jcomp.requestFocus();
                                jcomp.changeSelection(val, 4, false, false);
                                jcomp.setEditingColumn(4);
                            }
                            else {
                                JOptionPane.showMessageDialog(rootPane, "The item has been already added from Stock Adjustment.Please check");
                                this.dispose();
                                jcomp.requestFocus();
                            }
                        }
                    }
                    }
                    boolean check = true;
                    boolean chkExp = true;
                    String expCheckQuery ="SELECT DATEDIFF(STR_TO_DATE('"+edate.trim()+"-01','%M-%Y-%d'),concat(DATE_FORMAT(curdate(),'%Y-%m'),'-01')) as compare";
                    int dateDiff = Integer.parseInt(commonController.getQueryValue(expCheckQuery));
                    if (bann != 0) {
                        String message = "This medicine \"" + dname + " \" is banned drug. Do u want to add it?";
                        int returnPressed=JOptionPane.showConfirmDialog(rootPane, message, "Sales", JOptionPane.YES_NO_OPTION);
                        if(returnPressed==0) {
                            check=true;
                        }
                        else {
                            check=false;
                        }
                    }
                    if(dateDiff <=0) {
                        String message = "This medicine \"" + dname + " \" is expired drug. Do u want to add it?";
                        int returnPressed=JOptionPane.showConfirmDialog(rootPane, message, "Sales", JOptionPane.YES_NO_OPTION);
                        if(returnPressed==0) {
                            check=true;
                        }
                        else {
                            check=false;
                        }
                    }
                    if (flags != 1 && check && chkExp) {
                        jcomp.getModel().setValueAt(j + 1, j, 0);
                        jcomp.getModel().setValueAt(dname + "_" + dosage.trim(), j, 2);
                        if (tName.equalsIgnoreCase("Sales")) {
                            jcomp.getModel().setValueAt(dcode, j, 1);
                                 jcomp.getModel().setValueAt(0, j, 14);
                        } else if (tName.equalsIgnoreCase("CounterSales")) {
                            jcomp.getModel().setValueAt(dcode, j, 13);
                        }
//                        jcomp.getModel().setValueAt(mfgname, j, 3);
                        jcomp.getModel().setValueAt(forml, j, 3);
                        jcomp.getModel().setValueAt(Integer.parseInt("0"), j, 4);
                        jcomp.getModel().setValueAt(Integer.parseInt("0"), j, 5);
                        jcomp.getModel().setValueAt(batch, j, 6);
                        jcomp.getModel().setValueAt(edate, j, 7);
                        if (jTable1.getModel().getValueAt(i, 6) == null);
                        else if (Double.parseDouble(jTable1.getModel().getValueAt(i, 6).toString()) == 0.0) {
                            jcomp.getModel().setValueAt(Double.parseDouble("0.0"), j, 8);
                        } else {
                            jcomp.getModel().setValueAt(Double.parseDouble(uprice), j, 8);
                        }
                        if(mrp.equals("0.00") || mrp == null) {
                        jcomp.getModel().setValueAt(Double.parseDouble("0.0"), j, 9);
                        }
                        else {
                        jcomp.getModel().setValueAt(Double.parseDouble(mrp), j, 9);
                        }
                        jcomp.getModel().setValueAt(discount, j, 10);
                        jcomp.getModel().setValueAt(0, j, 11);
                        
                        if (vat.equals("0.00") || vat == null) {
                            jcomp.getModel().setValueAt(Double.parseDouble("0.0"), j, 12);
                        } else {
                            jcomp.getModel().setValueAt(Double.parseDouble(vat), j, 12);
                        }
                        //jcomp.getModel().setValueAt(edate, j, 6);
                        //jcomp.getModel().setValueAt(fprice, j, 12);
                        jcomp.getModel().setValueAt(Double.parseDouble(fprice), j, 13);
                       // System.out.println((Double.parseDouble(fprice), j, 13));
                       // jcomp.getModel().setValueAt(Double.parseDouble(fprice), j, 14);
            System.out.println("Value set: " + Double.parseDouble(fprice) + " at row " + j + ", column 14");

                        this.dispose();
                        jcomp.requestFocus();
                        if (tName.equalsIgnoreCase("CounterSales")) {
                            jcomp.changeSelection(j, 3, false, false);
                        } else {
                            jcomp.changeSelection(j, 4, false, false);
                        }
                    }
                } else {
                    String iname = jTable1.getModel().getValueAt(i, 0).toString();
                    String icode = jTable1.getModel().getValueAt(i, 1).toString();
                    Object dos = jTable1.getModel().getValueAt(i, 3);
                    String itemName = iname+"_"+dos;
                    int cnt = commonController.getReturnCompare(icode, itemName);
                    if (cnt <= 0) {
                        Object[] options = {"Substitute Drug For " + iname, "Add Temp Stocks Drug For " + iname};

                        int s = JOptionPane.showOptionDialog(
                                jTable1,
                                "This " + iname + " is Out of Stock so, want to choose ?",
                                "Sales",
                                JOptionPane.YES_NO_OPTION,
                                JOptionPane.QUESTION_MESSAGE,
                                null,
                                options,
                                options[0]);

                        if (s == 0) {
                            callSubstituteDrugs();
                        } else if (s == 1) {
                            callTempStocks();
                        }
                    } else if (cnt > 0) {
                        jTextField1.setText(iname);
                        loadStockTable(iname, dos);
                    }
                }
            }
            jTextField1.setText("");
        } catch (Exception ex) {
            String ss1 = "Class : GetDrugData  Method : setSalesValues   Exception : " + ex.getMessage();
            log.debug(ss1);
        }
    }    
  
  
    public void loadStockTable(String val) {
        System.out.println("pack");
        stopEditing();
        String value = val;
        Vector col = new Vector();
        Vector data = new Vector();
        try {            
            col.addElement("Item Name");
            col.addElement("Code"); 
            col.addElement("MFR");
            col.addElement("Dosage");
            col.addElement("Batch No");
          // col.addElement("Pack");//jai
            col.addElement("Qty");
            col.addElement("Price");
            col.addElement("MRP");
            col.addElement("VAT");
            col.addElement("Expiry");
            col.addElement("Form.");
            col.addElement("Banned");
            col.addElement("Rack");
            col.addElement("Shelf");
            col.addElement("Min. Stock");
            col.addElement("Pack");
            col.addElement("Discount");
            col.addElement("P.Price");
            col.addElement("F.Price");
            
            if (value.length() <= 1) {
            } else {
                  data = salesController.loadStockTable(value);
            }
            Vector temp;
            minStkArray = new int[data.size()];
            for(int i=0;i<data.size();i++){
                temp = (Vector) data.get(i);
                minStkArray[i] = Integer.parseInt(temp.get(14).toString());
    /*                int minStock =salesController.getMinStock("select sum(qty) as quantity,min_qty from stock_statement where item_code='"+productCode+"' and ss_flag_id = 0");
                    minStkArray[i]=minStock;*/
            }
            jTable1.setModel(new DefaultTableModel(data, col));
            jTable1.getColumnModel().getColumn(0).setPreferredWidth(500);
            jTable1.getColumnModel().getColumn(4).setPreferredWidth(150);
            jTable1.removeColumn(jTable1.getColumnModel().getColumn(11));
            jTable1.removeColumn(jTable1.getColumnModel().getColumn(13));
            jTable1.removeColumn(jTable1.getColumnModel().getColumn(14));
            jTable1.getColumnModel().getColumn(15).setPreferredWidth(150);
            jTable1.revalidate();
            jTable1.repaint();            
        } catch (Exception ex) {
            String ss = "Class : GetDrugData  Method : loadStockTable   NullPointerException : " + ex.getMessage();
        }
    }

    public void loadStockTable(String val, Object dos) {
        stopEditing();
        String value = val;
        Vector col = new Vector();
        Vector data = new Vector();
        try {
            col.addElement("Product Name");
            col.addElement("Product Code");
            col.addElement("MFR Name");
            col.addElement("Dosage");
            col.addElement("Batch");
           //col.addElement("Pack");//jai
            col.addElement("Stock Qty");
            col.addElement("Unit Price");
            col.addElement("MRP");
            col.addElement("VAT");
            col.addElement("Expiry Date");
            col.addElement("Formulation");
            col.addElement("Banned");
            col.addElement("F.Price");
             
            if (value.length() <= 1) {
            } else {
                  //Sales salesController = new SalesController();                
               // salesController = (Sales) RegistryFactory.getClientStub(RegistryConstants.Sales);
                  data = salesController.loadStockTable(value);


            }
            jTable1.setModel(new DefaultTableModel(data, col));
            jTable1.getColumnModel().getColumn(0).setPreferredWidth(200);
            jTable1.removeColumn(jTable1.getColumnModel().getColumn(11));
            jTable1.changeSelection(0, 0, false, false);
            setSalesValues();
            jTable1.revalidate();
            jTable1.repaint();

            
        } catch (Exception ex) {
            String ss = "Class : GetDrugData  Method : loadStockTable  Exception : " + ex.getMessage();
            log.debug(ss);
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

    public void refreshStockTab(String itemCode) {
        jTextField1.setText(itemCode);
        loadStockTable(itemCode);
        if(jTable1.getRowCount() == 1) {
            jTable1.setRowSelectionInterval(0, 0);
            setSalesValues();
        }
        else {            
            this.setVisible(true);
            this.requestFocusInWindow();
            this.requestFocus();
        }
    }
    // Variables declaration - do not modify//GEN-BEGIN:variables
    private javax.swing.JLabel jLabel1;
    private javax.swing.JLabel jLabel10;
    private javax.swing.JLabel jLabel2;
    private javax.swing.JLabel jLabel3;
    private javax.swing.JLabel jLabel4;
    private javax.swing.JLabel jLabel5;
    private javax.swing.JLabel jLabel6;
    private javax.swing.JLabel jLabel7;
    private javax.swing.JLabel jLabel8;
    private javax.swing.JLabel jLabel9;
    private javax.swing.JPanel jPanel1;
    private javax.swing.JPanel jPanel2;
    private javax.swing.JScrollPane jScrollPane1;
    private javax.swing.JTable jTable1;
    private javax.swing.JTextField jTextField1;
    // End of variables declaration//GEN-END:variables
}
