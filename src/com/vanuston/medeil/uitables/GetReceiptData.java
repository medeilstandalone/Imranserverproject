package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.implementation.Receipt;
import com.vanuston.medeil.model.ReceiptModel;
import com.vanuston.medeil.util.DateUtils;
import java.awt.event.KeyEvent;
import java.util.Vector;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.util.Value;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.List;

public class GetReceiptData extends javax.swing.JDialog {

    static Logger log = Logger.getLogger(GetReceiptData.class, "Financial");



    public GetReceiptData() throws RemoteException, NotBoundException {


    }
    JTable ReceptTab = new JTable();
    String distName = RecptTable.distName;

    /** Creates new form GetReceiptData */
    public GetReceiptData(JTable jc) throws RemoteException, NotBoundException {

     //   receiptcontroller = (Receipt) RegistryFactory.getClientStub(RegistryConstants.Receipt);

    //    comObj = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
        ReceptTab = jc;
        initComponents1();
        loadReceiptTable("");
        jTextField1.requestFocus();
        //this.setBounds(super.getX(),super.getY()+50,super.getWidth(),super.getHeight()+25);
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">
    private void initComponents1() {
        setModal(true);
        jPanel1 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        recTable = new javax.swing.JTable();
        jButton1 = new javax.swing.JButton();
        jTextField1 = new javax.swing.JTextField();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Receipt Table");
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

        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());

        jTextField1.addActionListener(new java.awt.event.ActionListener() {

            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField1ActionPerformed(evt);
            }
        });


        jTextField1.addKeyListener(new java.awt.event.KeyAdapter() {

            public void keyReleased(java.awt.event.KeyEvent evt) {
                jTextField1KeyReleased(evt);
            }

            @Override
            public void keyPressed(java.awt.event.KeyEvent evt) {
                jTextField1KeyPressed(evt);
            }
        });
        jPanel1.add(jTextField1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 20, 450, -1));

        recTable.setModel(new javax.swing.table.DefaultTableModel(
                new Object[][]{
                    {null, null, null},
                    {null, null, null},
                    {null, null, null},
                    {null, null, null}
                },
                new String[]{
                    "Title 1", "Title 2", "Title 3"
                }));
        recTable.setGridColor(new java.awt.Color(204, 204, 255));
        recTable.setRowHeight(22);

        recTable.setCellSelectionEnabled(false);
        recTable.setRowSelectionAllowed(true);
        recTable.addMouseListener(new java.awt.event.MouseAdapter() {

            public void mouseClicked(java.awt.event.MouseEvent evt) {
                recTableMouseClicked(evt);
            }
        });
        recTable.addKeyListener(new java.awt.event.KeyAdapter() {

            public void keyPressed(java.awt.event.KeyEvent evt) {
                recTableKeyPressed(evt);
            }

            public void keyReleased(java.awt.event.KeyEvent evt) {
                recTableKeyReleased(evt);
            }
        });
        jScrollPane1.setViewportView(recTable);

        jPanel1.add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 50, 530, 230));

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
                layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING).add(jPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 547, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE));
        layout.setVerticalGroup(
                layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING).add(jPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 290, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE));

        java.awt.Dimension screenSize = java.awt.Toolkit.getDefaultToolkit().getScreenSize();
        setBounds((screenSize.width - 555) / 2, (screenSize.height - 324) / 2, 555, 324);
    }// </editor-fold>//GEN-END:initComponents

    private void formFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_formFocusGained
        // TODO add your handling code here:
        jTextField1.requestFocus();
    }//GEN-LAST:event_formFocusGained

    private void formFocus() {
        jTextField1.requestFocus();
    }

    private void jTextField1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField1ActionPerformed

    private void formKeyPressed(java.awt.event.KeyEvent e) {
        jTextField1.requestFocus();
        if (!e.isActionKey()) {
            jTextField1.setText("" + e.getKeyChar());
        }
        if (e.getKeyCode() == 27) {
            this.dispose();
        }
    }

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {
        // TODO add your handling code here:
        this.dispose();
    }

    private void jTextField1KeyReleased(java.awt.event.KeyEvent evt) {
        // TODO add your handling code here:
        String val = jTextField1.getText();
        loadReceiptTable(val);
    }

    private void jTextField1KeyPressed(java.awt.event.KeyEvent evt) {
        // TODO add your handling code here:
        if (evt.getKeyCode() == 10 || evt.getKeyCode() == 9 || evt.getKeyCode() == KeyEvent.VK_DOWN) {
            recTable.requestFocus();
        }
        if (evt.getKeyCode() == 27) {
            this.dispose();
        }
    }

    private void recTableKeyReleased(java.awt.event.KeyEvent evt) {
        // TODO add your handling code here:
        if (evt.getKeyCode() == 10) {
            setReceiptValues();
        }
        if (evt.getKeyCode() == 27) {
            this.dispose();
        }
    }

    private void recTableKeyPressed(java.awt.event.KeyEvent evt) {
        // TODO add your handling code here:
        if (evt.getKeyCode() == 10) {
            setReceiptValues();
        }
        if (evt.getKeyCode() == 27) {
            this.dispose();
        }
    }

    private void recTableMouseClicked(java.awt.event.MouseEvent evt) {
        // TODO add your handling code here:
        setReceiptValues();
    }

    public void setReceiptValues() {
        final int i = recTable.getSelectedRow();
        final int j = ReceptTab.getSelectedRow();
        if (j >= 0) {
            String invoiceNo = "" + recTable.getModel().getValueAt(i, 0);
            String invoiceDate = "" + recTable.getModel().getValueAt(i, 1);
            String BalanceAmount = "" + recTable.getModel().getValueAt(i, 2);
            double balAmt = 0.0;
            if (BalanceAmount != null && BalanceAmount.trim().length() > 0) {
                balAmt = Double.valueOf(BalanceAmount);
            }
            balAmt = getSalesBillBalanceAmt(invoiceNo, balAmt);
            String stBal = "0.0";
            if (balAmt > 0) {
                stBal = String.valueOf(balAmt);
            }
            ReceptTab.getModel().setValueAt(invoiceNo, j, 1);
            ReceptTab.getModel().setValueAt(invoiceDate, j, 2);
            ReceptTab.getModel().setValueAt(BalanceAmount, j, 3);
            ReceptTab.getModel().setValueAt(stBal, j, 4);
            //ReceptTab.getModel().setValueAt(Double.parseDouble("0"), j, 5);
            this.dispose();
            ReceptTab.requestFocus();
            ReceptTab.changeSelection(j, 5, false, false);
        }
    }

    public double getSalesBillBalanceAmt(String inv, double bal) {
        double balAmt = 0.0;
        double paid = 0.0;

        try {
          CommonImplements   comObj = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);

            String query = "";
            query = "Select sum(paid_amount) as amt from sales_maintain_bill where bill_no='" + inv + "'  ";
            paid = comObj.getBillAmount(query);
            query = "Select sum(paid_amt) as amt from receipt where invoice_no='" + inv + "' and rec_flag_id=0 ";
            paid += comObj.getBillAmount(query);

            query="select sum(amount)as amt from credit_note where invoiceorbill_no='"+inv+"' and cre_flag_id=0 and credit_opt='Sales Return' and issued_against='Customer'";
             paid += comObj.getBillAmount(query);
        } catch (Exception e) {
            String msg = "Class : GetReceiptData  Method : Create Table   = " + e.getMessage();
            log.debug(msg);
        }
        balAmt = bal - paid;
        balAmt = Value.Round(balAmt, 2);
        return balAmt;
    }

    public void loadReceiptTable(String val) {
        Vector col = new Vector();
        Vector data = new Vector();
        try {
            Receipt   receiptcontroller = (Receipt) RegistryFactory.getClientStub(RegistryConstants.Receipt);
            if (distName != null && !distName.equals("") && distName.trim().length() > 0) {
                String query = "";
                if (val != null || val.trim().length() > 0) {
                    query = "Select bill_no,bill_date,total_amount from sales_maintain_bill where cust_name='" + distName + "' and balance_amount>0 and bill_no like'" + val + "%' ";
                } else {
                    query = "Select bill_no,bill_date,total_amount from sales_maintain_bill where cust_name='" + distName + "' and balance_amount>0";
                }


                ReceiptModel receiptModel = new ReceiptModel();
                receiptModel = (ReceiptModel) receiptcontroller.getBillDetails(query);
                List<ReceiptModel> salesList = new ArrayList<ReceiptModel>();
                salesList = receiptModel.getListofitems();
                ReceiptModel payModel;
                int index = 0;
                col.addElement("Bill No");
                col.addElement("Bill Date");
                col.addElement("Total Amount");
                for (index = 0; index < salesList.size(); index++) {
                    Vector temp = new Vector();
                    payModel = new ReceiptModel();
                    payModel = (ReceiptModel) salesList.get(index);
                    temp.addElement(payModel.getBillNumber());
                    temp.addElement(DateUtils.normalFormatDate(payModel.getBillDate()));
                    temp.addElement(payModel.getTotalPaidAmount());
                    data.addElement(temp);
                }
            }
            recTable.setModel(new DefaultTableModel(data, col));
            recTable.revalidate();
            recTable.repaint();
        } catch (Exception Ex) {
            String msg = "Class : GetReceiptData  Method : LoadReceipt Table   = " + Ex.getMessage();
            log.debug(msg);
        }

    }
    public javax.swing.JButton jButton1;
    public javax.swing.JPanel jPanel1;
    public javax.swing.JScrollPane jScrollPane1;
    public javax.swing.JTable recTable;
    public javax.swing.JTextField jTextField1;
}
