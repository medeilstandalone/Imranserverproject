package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CommonImplements;

import com.vanuston.medeil.implementation.Payment;
import com.vanuston.medeil.model.PaymentModel;
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

public final class GetPurchaseData extends javax.swing.JDialog {

    static Logger log = Logger.getLogger(GetPurchaseData.class, "Finanical");
    static Payment paymentCon;

    public GetPurchaseData() throws RemoteException, NotBoundException {

     //   paymentCon = (Payment) RegistryFactory.getClientStub(RegistryConstants.Payment);
    }
    JTable jcomp = new JTable();
    public String distName = PayTable.distName;

    public GetPurchaseData(JTable jc) throws RemoteException, NotBoundException {

       
        jcomp = jc;
        initComponents();
        loadPurchaseTable("");
        jTextField1.requestFocus();
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">
    private void initComponents() {

        setModal(true);
        jPanel1 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        purTable = new javax.swing.JTable();
        jButtonPayment = new javax.swing.JButton();
        jTextField1 = new javax.swing.JTextField();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Payment Table");
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

        purTable.setModel(new javax.swing.table.DefaultTableModel(
                new Object[][]{
                    {null, null, null},
                    {null, null, null},
                    {null, null, null},
                    {null, null, null}
                },
                new String[]{
                    "Title 1", "Title 2", "Title 3"
                }));
        purTable.setGridColor(new java.awt.Color(204, 204, 255));
        purTable.setRowHeight(22);
        purTable.addMouseListener(new java.awt.event.MouseAdapter() {

            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTable1MouseClicked(evt);
            }
        });
        purTable.addKeyListener(new java.awt.event.KeyAdapter() {

            public void keyPressed(java.awt.event.KeyEvent evt) {
                jTable1KeyPressed(evt);
            }

            public void keyReleased(java.awt.event.KeyEvent evt) {
                jTable1KeyReleased(evt);
            }
        });
        jScrollPane1.setViewportView(purTable);

        jPanel1.add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 50, 530, 230));

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
                layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING).add(jPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 547, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE));
        layout.setVerticalGroup(
                layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING).add(jPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 290, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE));

        java.awt.Dimension screenSize = java.awt.Toolkit.getDefaultToolkit().getScreenSize();
        setBounds((screenSize.width - 555) / 2, (screenSize.height - 324) / 2, 555, 324);
    }// </editor-fold>

    private void formFocusGained(java.awt.event.FocusEvent evt) {
        jTextField1.requestFocus();
    }

    private void jTextField1ActionPerformed(java.awt.event.ActionEvent evt) {
    }

    private void formFocus() {
        jTextField1.requestFocus();
    }

    private void formKeyPressed(java.awt.event.KeyEvent e) {
        jTextField1.requestFocus();
        if (!e.isActionKey()) {
            jTextField1.setText("" + e.getKeyChar());
        }
        if (e.getKeyCode() == 27) {
            this.dispose();
        }
    }

    private void jButtonPaymentActionPerformed(java.awt.event.ActionEvent evt) {
        this.dispose();
    }

    private void jTextField1KeyReleased(java.awt.event.KeyEvent evt) {
        String val = jTextField1.getText();
        loadPurchaseTable(val);
    }

    private void jTextField1KeyPressed(java.awt.event.KeyEvent evt) {
        if (evt.getKeyCode() == 10 || evt.getKeyCode() == 9 || evt.getKeyCode() == KeyEvent.VK_DOWN) {
            purTable.requestFocus();
        }
        if (evt.getKeyCode() == 27) {
            this.dispose();
        }
    }

    private void jTable1KeyReleased(java.awt.event.KeyEvent evt) {
        if (evt.getKeyCode() == 10) {
            setPaymentValues();
        }
        if (evt.getKeyCode() == 27) {
            this.dispose();
        }
    }

    private void jTable1KeyPressed(java.awt.event.KeyEvent evt) {
        if (evt.getKeyCode() == 10) {
            setPaymentValues();
        }
        if (evt.getKeyCode() == 27) {
            this.dispose();
        }
    }

    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {
        setPaymentValues();
    }

    public void setPaymentValues() {
        final int i = purTable.getSelectedRow();
        final int j = jcomp.getSelectedRow();
        String invoiceNo = "" + purTable.getModel().getValueAt(i, 0);
        String invoiceDate = "" + purTable.getModel().getValueAt(i, 1);
        String BalanceAmount = "" + purTable.getModel().getValueAt(i, 2);
        double balAmt = 0.0;
        if (BalanceAmount != null && BalanceAmount.trim().length() > 0) {
            balAmt = Double.valueOf(BalanceAmount);
        }
        String strBal = "0.0";
        balAmt = getInvoiceBalanceAmount(invoiceNo, balAmt);
        if (balAmt > 0) {
            strBal = String.valueOf(balAmt);
        }
        jcomp.getModel().setValueAt(invoiceNo, j, 1);
        jcomp.getModel().setValueAt(invoiceDate, j, 2);
        jcomp.getModel().setValueAt(BalanceAmount, j, 3);
        jcomp.getModel().setValueAt(strBal, j, 4);
        //jcomp.getModel().setValueAt("0", j, 5);
        this.dispose();
        jcomp.requestFocus();
        jcomp.changeSelection(j, 5, false, false);
    }

    public double getInvoiceBalanceAmount(String invNo, double invoiceAmt) {
        double balAmt = 0.0;
        try {
             CommonImplements commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);

            paymentCon = (Payment) RegistryFactory.getClientStub(RegistryConstants.Payment);
            String query = "Select sum(paid_amt)as paid_amt,invoice_no,invoice_date,invoice_amt as total_amount from payment  where invoice_no='" + invNo + "' and pay_flag_id=0 ";
            PaymentModel paymentModel = new PaymentModel();
            paymentModel = (PaymentModel) paymentCon.getInvoiceDetails(query);
            String query1="select sum(amount)as am from debit_note where invoiceorbill_no='"+invNo+"' and dn_flag_id=0 and debit_opt='Purchase Return' and issued_against='Distributor' ";
            double debitAmount=0.0;
            String debitStr="";debitStr=commonController.getQueryValue(query1);

            if(debitStr!=null && !debitStr.equalsIgnoreCase("null") && !debitStr.equals("")){
                debitAmount=Double.parseDouble(debitStr);
            }

            balAmt = invoiceAmt - paymentModel.getPaidAmount();
            balAmt = Value.Round(balAmt, 2);

        } catch (Exception e) {
            String msg = "Class : GetPurchaseData  Method  : getInvoiceBalanceAmount()   = " + e.getMessage();
            log.debug(msg);
        }
        return balAmt;
    }

    public void loadPurchaseTable(String val1) {
        Vector col = new Vector();
        Vector data = new Vector();
        try {
            paymentCon = (Payment) RegistryFactory.getClientStub(RegistryConstants.Payment);
            String query = "";
            if (val1 != null || !val1.equals("")) {
                query = "Select paid_amt,invoice_no,invoice_date,total_amount from purchase_maintenance where pm_flag_id=0 and dist_name='" + distName + "' and invoice_no like'" + val1 + "%' ";
            } else {
                query = "Select paid_amt,invoice_no,invoice_date,total_amount from purchase_maintenance where dist_name='" + distName + "' and pm_flag_id=0 ";
            }
            PaymentModel paymentModel = new PaymentModel();
            paymentModel = (PaymentModel) paymentCon.getInvoiceDetails(query);
            List<PaymentModel> purchaseList = new ArrayList<PaymentModel>();
            purchaseList = paymentModel.getListofitems();
            PaymentModel payModel;
            int index = 0;
            col.addElement("Invoice No");
            col.addElement("Invoice Date");
            col.addElement("Invoice Amount");
            for (index = 0; index < purchaseList.size(); index++) {
                Vector temp = new Vector();
                payModel = new PaymentModel();
                payModel = (PaymentModel) purchaseList.get(index);
                temp.addElement(payModel.getInvoiceNumber());
                temp.addElement(DateUtils.normalFormatDate(payModel.getInvoiceDate()));
                temp.addElement(payModel.getTotalPaidAmount());
                data.addElement(temp);
            }


            purTable.setModel(new DefaultTableModel(data, col));
            purTable.revalidate();
            purTable.repaint();
        } catch (Exception Ex) {
            String msg = "Class : GetPurchaseData  Method  : loadPurchaseTable()   = " + Ex.getMessage();
            log.debug(msg);
        }
    }
    public javax.swing.JButton jButtonPayment;
    public javax.swing.JPanel jPanel1;
    public javax.swing.JScrollPane jScrollPane1;
    public javax.swing.JTable purTable;
    public javax.swing.JTextField jTextField1;
}
