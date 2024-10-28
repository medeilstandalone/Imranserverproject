package com.vanuston.medeil.uitables;


import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.Doctor;
import com.vanuston.medeil.model.DoctorChargesModel;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.util.Value;
import java.awt.event.KeyEvent;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import javafx.stage.Alert;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

public final class GetChargesDetails extends javax.swing.JDialog {

    Doctor doctorController ;
    static Logger log = Logger.getLogger(GetChargesDetails.class, "Utilities");
    JTable chargecomp = new JTable();
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
    java.util.Date payingJavaDate;
    java.sql.Date payingSqlDate;
    java.util.Date paidedJavaDate;
    java.sql.Date paidedSqlDate;

    public GetChargesDetails(JTable jc) {
        try {
            doctorController = (Doctor) RegistryFactory.getClientStub(RegistryConstants.Doctor  );
        } catch (RemoteException ex) {
            java.util.logging.Logger.getLogger(GetChargesDetails.class.getName()).log(Level.SEVERE, null, ex);
        } catch (NotBoundException ex) {
            java.util.logging.Logger.getLogger(GetChargesDetails.class.getName()).log(Level.SEVERE, null, ex);
        }
        chargecomp = jc;
        initComponents();
        loadDoctorChargesTable("");
        jChargeTextField1.requestFocus();

    }

    @SuppressWarnings("unchecked")
    private void initComponents() {
        setModal(true);
        jChrgesPanel1 = new javax.swing.JPanel();
        jChrgesScrollPanel1 = new javax.swing.JScrollPane();
        charTable = new javax.swing.JTable();
        jButtonCharges = new javax.swing.JButton();
        jChargeTextField1 = new javax.swing.JTextField();
        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Doctor Chargers Table");
        setResizable(false);
        addFocusListener(new java.awt.event.FocusAdapter() {

            @Override
            public void focusGained(java.awt.event.FocusEvent evt) {
                formFocusGained(evt);
            }
        });
        addKeyListener(new java.awt.event.KeyAdapter() {

            @Override
            public void keyPressed(java.awt.event.KeyEvent evt) {
                formKeyPressed(evt);
            }
        });

        jChrgesPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jChargeTextField1.addActionListener(new java.awt.event.ActionListener() {

            @Override
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jChargeTextField1ActionPerformed(evt);
            }
        });


        jChargeTextField1.addKeyListener(new java.awt.event.KeyAdapter() {

            @Override
            public void keyReleased(java.awt.event.KeyEvent evt) {
                jChargeTextField1KeyReleased(evt);
            }

            @Override
            public void keyPressed(java.awt.event.KeyEvent evt) {
                jChargeTextField1KeyPressed(evt);
            }
        });
        jChrgesPanel1.add(jChargeTextField1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 20, 350, -1));

        charTable.setModel(new javax.swing.table.DefaultTableModel(
                new Object[][]{
                    {null, null, null},
                    {null, null, null},
                    {null, null, null},
                    {null, null, null}
                },
                new String[]{
                    "Title 1", "Title 2", "Title 3"
                }));
        charTable.setGridColor(new java.awt.Color(204, 204, 255));
        charTable.setRowHeight(22);

        charTable.setCellSelectionEnabled(false);
        charTable.setRowSelectionAllowed(true);
        charTable.addMouseListener(new java.awt.event.MouseAdapter() {

            @Override
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTable1MouseClicked(evt);
            }
        });
        charTable.addKeyListener(new java.awt.event.KeyAdapter() {

            @Override
            public void keyPressed(java.awt.event.KeyEvent evt) {
                jTable1KeyPressed(evt);
            }

            @Override
            public void keyReleased(java.awt.event.KeyEvent evt) {
                jTable1KeyReleased(evt);
            }
        });
        jChrgesScrollPanel1.setViewportView(charTable);

        jChrgesPanel1.add(jChrgesScrollPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 50, 530, 230));

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
                layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING).add(jChrgesPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 547, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE));
        layout.setVerticalGroup(
                layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING).add(jChrgesPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 290, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE));

        java.awt.Dimension screenSize = java.awt.Toolkit.getDefaultToolkit().getScreenSize();
        setBounds((screenSize.width - 555) / 2, (screenSize.height - 324) / 2, 555, 324);
    }// </editor-fold>//GEN-END:initComponents

    private void formFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_formFocusGained
        // TODO add your handling code here:
        jChargeTextField1.requestFocus();
    }//GEN-LAST:event_formFocusGained

    private void jChargeTextField1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField1ActionPerformed

    private void formKeyPressed(java.awt.event.KeyEvent e) {
        jChargeTextField1.requestFocus();
        if (!e.isActionKey()) {
            jChargeTextField1.setText("" + e.getKeyChar());
        }
        if (e.getKeyCode() == 27) {
            this.dispose();
        }
    }

    private void jButtonPaymentActionPerformed(java.awt.event.ActionEvent evt) {
        this.dispose();
    }

    private void jChargeTextField1KeyReleased(java.awt.event.KeyEvent evt) {
        String val = jChargeTextField1.getText();
        loadDoctorChargesTable(val);

    }

    private void jChargeTextField1KeyPressed(java.awt.event.KeyEvent evt) {
        if (evt.getKeyCode() == 10 || evt.getKeyCode() == 9 || evt.getKeyCode() == KeyEvent.VK_DOWN) {
            charTable.requestFocus();
        }
        if (evt.getKeyCode() == 27) {
            this.dispose();
        }
    }

    private void jTable1KeyReleased(java.awt.event.KeyEvent evt) {
        if (evt.getKeyCode() == 10) {
            setChargeValues();
        }

        if (evt.getKeyCode() == 27) {
            this.dispose();
        }
    }

    private void jTable1KeyPressed(java.awt.event.KeyEvent evt) {
        if (evt.getKeyCode() == 10) {
            setChargeValues();
        }

        if (evt.getKeyCode() == 27) {
            this.dispose();
        }
    }

    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {
        setChargeValues();

    }

    public void setChargeValues()  {

        final int i = charTable.getSelectedRow();
        final int j = chargecomp.getSelectedRow();


        String itemCode = "" + charTable.getModel().getValueAt(i, 0);
        String itemName = "" + charTable.getModel().getValueAt(i, 1);
        String sellingPrice = "" + charTable.getModel().getValueAt(i, 2);

        String sDate1 = "";
        sDate1 = DoctorCommissionTable.sDate;
        if (sDate1 != null && sDate1.length() >= 10) {
            setPayingDate(sDate1);
        }
        java.sql.Date sDate = getPayingDate();



        String eDate1 = "";
        eDate1 = DoctorCommissionTable.eDate;

        if (eDate1 != null && eDate1.length() >= 10) {
            setPayingDate(eDate1);
        }
        java.sql.Date eDate = getPayingDate();

        String doctorName = "";
        doctorName = DoctorCommissionTable.doctorName;

        if (sDate1 == null || sDate1.length() < 10) {

            JOptionPane.showMessageDialog(null, "Please Enter Starting Date ");
            this.dispose();
        } else if (eDate1 == null || eDate1.length() < 10) {

            JOptionPane.showMessageDialog(null, "Please Enter Ending Date ");
            this.dispose();
        } else {

                double selPrice = 0.0;
                if (sellingPrice != null && sellingPrice.length() > 0) {
                    selPrice = Double.valueOf(sellingPrice);
                    selPrice = Value.Round(selPrice, 2);
                }
                DoctorChargesModel doctorChargesModel = new DoctorChargesModel();
                doctorChargesModel.setItemCode(itemCode);
                doctorChargesModel.setDoctorCommisionName(doctorName);
                doctorChargesModel.setCommisionStartDate(sDate);
                doctorChargesModel.setCommisionEndDate(eDate);
                int qty = 0;
                try {
                    //                ResultSet rs = null;
                    //                Statement st = DBConnection.getStatement();
                    //                String sql = "";
                    //                sql = "select  sum(qty) as qt from sales_cash_bill where item_code='" + itemCode + "' and doctor_name='" + doctorName + "' and bill_date>='" + sDate + "' and bill_date<='" + eDate + "' ";
                    //                rs = st.executeQuery(sql);
                    //                while (rs.next()) {
                    //                    qty = rs.getInt("qt");
                    //                }
                    //Controller Insatance
                    qty = doctorController.sumQty("sales_cash_bill", doctorChargesModel);
                    qty += doctorController.sumQty("sales_accounts", doctorChargesModel);
                    //                sql = "select  sum(qty) as qt from sales_accounts where item_code='" + itemCode + "' and doctor_name='" + doctorName + "' and bill_date>='" + sDate + "' and bill_date<='" + eDate + "' ";
                    //                rs = st.executeQuery(sql);
                    //                while (rs.next()) {
                    //                    qty += rs.getInt("qt");
                    //                }
                    //Controller Insatance
                    qty += doctorController.sumQty("sales_cards_bill", doctorChargesModel);
                    //                sql = "select  sum(qty) as qt from sales_cards_bill where item_code='" + itemCode + "' and doctor_name='" + doctorName + "' and bill_date>='" + sDate + "' and bill_date<='" + eDate + "' ";
                    //                rs = st.executeQuery(sql);
                    //                while (rs.next()) {
                    //                    qty += rs.getInt("qt");
                    //                }
                    //Controller Insatance
                    qty += doctorController.sumQty("sales_credit_bill", doctorChargesModel);
                    //                sql = "select  sum(qty) as qt from sales_credit_bill where item_code='" + itemCode + "' and doctor_name='" + doctorName + "' and bill_date>='" + sDate + "' and bill_date<='" + eDate + "' ";
                    //
                    //                rs = st.executeQuery(sql);
                    //                while (rs.next()) {
                    //                    qty += rs.getInt("qt");
                    //                }
                    //Controller Insatance
                    qty += doctorController.sumQty("sales_partitions_bill", doctorChargesModel);
                    //                sql = "select  sum(qty) as qt from sales_partitions_bill where item_code='" + itemCode + "' and doctor_name='" + doctorName + "' and bill_date>='" + sDate + "' and bill_date<='" + eDate + "' ";
                    //                rs = st.executeQuery(sql);
                    //                while (rs.next()) {
                    //                    qty += rs.getInt("qt");
                    //                }
                    //Controller Insatance
                    qty -= doctorController.sumQty("sales_return", doctorChargesModel);
                    //                sql = "select sum(qty) as qt from sales_return where item_code='" + itemCode + "' and doctor_name='" + doctorName + "' and bill_date>='" + sDate + "' and bill_date<='" + eDate + "' ";
                    //                rs = st.executeQuery(sql);
                    //                while (rs.next()) {
                    //                    qty -= rs.getInt("qt");
                    //                }
                } catch (Exception e) {                    
                    String msg = "Class : getChargersDetails  method : setChargeValues()  = " + e.getMessage();
                    log.debug(msg);
                }
                double Amt = 0.0;
                Amt = selPrice * qty;
                int m = 0;
                m = checkAlreadyAdded(itemCode);
                if (m == 0) {
                    chargecomp.getModel().setValueAt(itemCode, j, 1);
                    chargecomp.getModel().setValueAt(itemName, j, 2);
                    chargecomp.getModel().setValueAt(selPrice, j, 3);
                    chargecomp.getModel().setValueAt(qty, j, 4);
                    chargecomp.getModel().setValueAt(Amt, j, 5);
                    this.dispose();
                    chargecomp.requestFocus();
                    chargecomp.changeSelection(j, 6, false, false);
                } else {
                    Alert.inform("Item Already Added");
                    this.dispose();
                }
        }
    }

    public int checkAlreadyAdded(String itemCode) {
        int i = 0;
        int j = 0;
        try {


            int n = chargecomp.getModel().getRowCount();

            for (j = 0; j < n; j++) {

                String itemCod = "";
                itemCod = (String) chargecomp.getModel().getValueAt(i, 1);

                if(itemCod!=null && itemCod!="null"){
                if (itemCod.equals(itemCode)) {
                    i = 1;
                    break;
                }
        }

            }
        } catch (Exception e) {
            
            String msg = "Class : getChargersDetails  method : checkAlreadyAdded()  = " + e.getMessage();
            log.debug(msg);
        }

        return i;
    }

    public double getInvoiceBalanceAmount(String invNo, double invoiceAmt) {
        double selPrice = 0.0;
        try {
            //Controller Insatance
            doctorController.sumPaidAmt(invNo, invoiceAmt) ;
//            ResultSet rs = null;
//            Statement stmt = DBConnection.getStatement();
//
//            String query = "";
//            query = "Select sum(paid_amt)as amt from payment  where invoice_no='" + invNo + "'  ";
//
//            rs = stmt.executeQuery(query);
//            while (rs.next()) {
//
//                inAmt = rs.getDouble("amt");
//            }
        } catch (Exception e) {
            
            String msg = "Class : getChargersDetails  method : getInvoiceBalanceAmount()  = " + e.getMessage();
            log.debug(msg);
        }
//        selPrice = invoiceAmt - inAmt;
//        selPrice = Value.Round(selPrice, 2);
        return selPrice;
    }

    public void loadDoctorChargesTable(String val1) {

        Vector col = new Vector();
        Vector data = new Vector();


        String sDate1 = "";
        sDate1 = DoctorCommissionTable.sDate;
        if (sDate1 != null && sDate1.length() >= 10) {
            setPaidedDate(sDate1);
        }
        java.sql.Date sDate = getPaidedDate();

        String eDate1 = "";
        eDate1 = DoctorCommissionTable.eDate;

        if (eDate1 != null && eDate1.length() >= 10) {
            setPaidedDate(eDate1);
        }
        java.sql.Date eDate = getPaidedDate();


        String doctorName = "";
        doctorName = DoctorCommissionTable.doctorName;
        DoctorChargesModel doctorChargesModels = new DoctorChargesModel () ;
        doctorChargesModels.setCommisionStartDate(sDate);
        doctorChargesModels.setCommisionEndDate(eDate);
        doctorChargesModels.setDoctorCommisionName(doctorName);
        doctorChargesModels.setItemName(val1);
        try {

            col.addElement("Item code");
            col.addElement("Item Name");
            col.addElement("Selling Price");
            //Controller Insatance
            DoctorChargesModel doctorChargesModel = (DoctorChargesModel) doctorController.viewRecord(doctorChargesModels, "sales_cash_bill") ;
            List<DoctorChargesModel> listChargesModel = doctorChargesModel.getChargesModelList() ;
            for( int i=0 ; i < listChargesModel.size() ; i++ ) {
                doctorChargesModel = listChargesModel.get(i) ;
                Vector temp = new Vector();
                temp.addElement (doctorChargesModel.getItemCode ()) ;
                temp.addElement (doctorChargesModel.getItemName ()) ;
                temp.addElement (doctorChargesModel.getSellingPrice ()) ;

                data.addElement(temp);
            }


            doctorChargesModel = (DoctorChargesModel) doctorController.viewRecord(doctorChargesModels, "sales_cards_bill") ;
            listChargesModel = doctorChargesModel.getChargesModelList() ;
            for( int i=0 ; i < listChargesModel.size() ; i++ ) {
                doctorChargesModel = listChargesModel.get(i) ;
                Vector temp = new Vector();
                temp.addElement (doctorChargesModel.getItemCode ()) ;
                temp.addElement (doctorChargesModel.getItemName ()) ;
                temp.addElement (doctorChargesModel.getSellingPrice ()) ;
                data.addElement(temp);
            }

            doctorChargesModel = (DoctorChargesModel) doctorController.viewRecord(doctorChargesModels, "sales_credit_bill") ;
            listChargesModel = doctorChargesModel.getChargesModelList() ;
            for( int i=0 ; i < listChargesModel.size() ; i++ ) {
                doctorChargesModel = listChargesModel.get(i) ;
                Vector temp = new Vector();
                temp.addElement (doctorChargesModel.getItemCode ()) ;
                temp.addElement (doctorChargesModel.getItemName ()) ;
                temp.addElement (doctorChargesModel.getSellingPrice ()) ;
                data.addElement(temp);
            }

            //Controller Insatance
            doctorChargesModel = (DoctorChargesModel) doctorController.viewRecord(doctorChargesModels, "sales_accounts") ;
            listChargesModel = doctorChargesModel.getChargesModelList() ;
            for( int i=0 ; i < listChargesModel.size() ; i++ ) {
                doctorChargesModel = listChargesModel.get(i) ;
                Vector temp = new Vector();
                temp.addElement (doctorChargesModel.getItemCode ()) ;
                temp.addElement (doctorChargesModel.getItemName ()) ;
                temp.addElement (doctorChargesModel.getSellingPrice ()) ;
                data.addElement(temp);
            }


            //Controller Insatance
            doctorChargesModel = (DoctorChargesModel) doctorController.viewRecord(doctorChargesModels, "sales_partitions_bill") ;
            listChargesModel = doctorChargesModel.getChargesModelList() ;
            for( int i=0 ; i < listChargesModel.size() ; i++ ) {
                doctorChargesModel = listChargesModel.get(i) ;
                Vector temp = new Vector();
                temp.addElement (doctorChargesModel.getItemCode ()) ;
                temp.addElement (doctorChargesModel.getItemName ()) ;
                temp.addElement (doctorChargesModel.getSellingPrice ()) ;
                data.addElement(temp);
            }




            charTable.setModel(new DefaultTableModel(data, col));
            charTable.revalidate();
            charTable.repaint();


        } catch (Exception e) {
            
            String msg = "Class : getChargersDetails  method : loadDoctorChargesTable()  = " + e.getMessage();
            log.debug(msg);
        }
    }

    public void setPayingDate(String payingDateString) {
        try {

            payingJavaDate = dateFormat.parse(payingDateString);
            payingSqlDate = new java.sql.Date(payingJavaDate.getTime());

        } catch (Exception e) {
            
            String msg = "Class : getChargersDetails  method : setPayingDate()  = " + e.getMessage();
            log.debug(msg);
        }
    }

    public java.sql.Date getPayingDate() {
        return payingSqlDate;
    }

    public void setPaidedDate(String paidedDateString) {
        try {

            paidedJavaDate = dateFormat.parse(paidedDateString);
            paidedSqlDate = new java.sql.Date(paidedJavaDate.getTime());

        } catch (Exception e) {
            
            String msg = "Class : getChargersDetails  method : setPaidedDate()  = " + e.getMessage();
            log.debug(msg);
        }
    }

    public java.sql.Date getPaidedDate() {
        return paidedSqlDate;
    }
    // Variables declaration - do not modify
    public javax.swing.JButton jButtonCharges;
    public javax.swing.JPanel jChrgesPanel1;
    public javax.swing.JScrollPane jChrgesScrollPanel1;
    public javax.swing.JTable charTable;
    public javax.swing.JTextField jChargeTextField1;
}
