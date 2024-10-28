package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CreditNote;
import com.vanuston.medeil.model.CreditNoteModel;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.KeyEvent;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.Vector;
import javax.swing.table.DefaultTableModel;

public final class GetDebitDistributor extends javax.swing.JDialog {

    public static String bill = null;
    public static String name = null;
    public static String choice = null;
    boolean colEditable[] = {false, false, false, false};
    public static Logger log = Logger.getLogger (GetDebitDistributor.class, "Utilities") ;
    CreditNote creditNoteController ;

    public GetDebitDistributor(String val) throws RemoteException, NotBoundException {
        //Controller Instance
        creditNoteController = (CreditNote) RegistryFactory.getClientStub (RegistryConstants.CreditNote) ;
        choice = val;
        initComponents();
        jTextField1.requestFocus();
        if (choice.equalsIgnoreCase ("Distributor")) {
            loadPurchaseTable("");
        } else if (choice.equalsIgnoreCase("Customer")) {
            loadSalesTable("");
        }
    }

    public GetDebitDistributor() {
        initComponents();
        jTextField1.requestFocus();
    }

    @SuppressWarnings("unchecked")
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jTextField1 = new javax.swing.JTextField();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        setModal(true);
        setBounds(300, 350, 590, 325);
        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Debit Note");
        setResizable(false);
        addFocusListener(new java.awt.event.FocusAdapter() {

            @Override
            public void focusGained(java.awt.event.FocusEvent evt) {
                formFocus();
            }
        });
        addKeyListener(new java.awt.event.KeyAdapter() {

            @Override
            public void keyPressed(java.awt.event.KeyEvent evt) {
                formKeyPressed(evt);
            }
        });

        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());
        jPanel1.add(jTextField1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 20, 260, 20));
        jTable1.setModel(new javax.swing.table.DefaultTableModel(
                new Object[][]{
                    {null, null, null, null},
                    {null, null, null, null},
                    {null, null, null, null},
                    {null, null, null, null}
                },
                new String[]{
                    "Title 1", "Title 2", "Title 3", "Title 4"
                }));

        jTable1.setGridColor(new java.awt.Color(204, 204, 255));
        jTable1.setRowHeight(25);
        jTable1.getTableHeader().setBackground(new Color(226, 238, 244));
        jTable1.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
        jTable1.setShowGrid(true);
        jTable1.getTableHeader().setReorderingAllowed(false);
        jTextField1.addKeyListener(new java.awt.event.KeyAdapter() {

            @Override
            public void keyPressed(java.awt.event.KeyEvent evt) {
                jTextField1KeyPressed(evt);
            }

            @Override
            public void keyReleased(java.awt.event.KeyEvent evt) {
                jTextField1KeyReleased(evt);
            }
        });

        jTable1.addMouseListener(new java.awt.event.MouseAdapter() {

            @Override
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jTable1MouseClicked(evt);
            }
        });

        jTable1.addKeyListener(new java.awt.event.KeyAdapter() {

            @Override
            public void keyPressed(java.awt.event.KeyEvent evt) {
                jTable1KeyPressed(evt);
            }

            @Override
            public void keyReleased(java.awt.event.KeyEvent evt) {
                jTable1KeyPressed(evt);
            }
        });

        jScrollPane1.setViewportView(jTable1);
        jPanel1.add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 50, 560, 230));
        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
                layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING).add(jPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 580, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE));
        layout.setVerticalGroup(
                layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING).add(jPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 290, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE));
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

    private void jTextField1KeyReleased(java.awt.event.KeyEvent evt) {
        String val = jTextField1.getText();
        if (val != null && val.trim().length() > 1) {
            if (choice.equalsIgnoreCase("Distributor")) {
                loadPurchaseTable(val);
            } else if (choice.equalsIgnoreCase("Customer")) {
                loadSalesTable(val);
            }
        }
    }

    private void jTextField1KeyPressed(java.awt.event.KeyEvent evt) {
        if (evt.getKeyCode() == 10 || evt.getKeyCode() == 9 || evt.getKeyCode() == KeyEvent.VK_DOWN) {
            jTable1.requestFocus();
        }
        if (evt.getKeyCode() == 27) {
            this.dispose();
        }
    }

    private void jTable1KeyPressed(java.awt.event.KeyEvent evt) {
        if (evt.getKeyCode() == 10) {
            int i = jTable1.getSelectedRow();
            bill = jTable1.getValueAt(i, 0).toString();
            name = jTable1.getValueAt(i, 2).toString();
            this.dispose();
        }
        if (evt.getKeyCode() == 27) {
            this.dispose();
        }
    }

    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {
        int i = jTable1.getSelectedRow();
        bill = jTable1.getValueAt(i, 0).toString();
        name = jTable1.getValueAt(i, 2).toString();
        this.dispose();
    }

    public void loadPurchaseTable(String billNo) {

        Vector col = new Vector();
        Vector data = new Vector();
        try {
            col.addElement("Invoice No");
            col.addElement("Invoice Date");
            col.addElement("Dist Name");
            col.addElement("Total Amount");
            CreditNoteModel creditNoteModel = creditNoteController.viewRecord("purchase_invoice", billNo) ;
            java.util.List<CreditNoteModel> creditModellist = creditNoteModel.getCreditModelList() ;
            for (int i=0; i < creditModellist.size (); i++) {
                Vector temp = new Vector();
                creditNoteModel = creditModellist.get (i) ;
                temp.addElement (creditNoteModel.getInvoiceOrBillNumber ());
                temp.addElement(creditNoteModel.getCreditDate ());
                temp.addElement(creditNoteModel.getName ());
                temp.addElement(creditNoteModel.getAmount ());
                data.addElement (temp);
            }

//            ResultSet rs;
//            Statement stmt = DBConnection.getStatement();
//            String query;
//            if (val != null && val != "" && val.trim().length() > 1) {
//                if (val != null || val != "") {
//                    query = "Select invoice_no,invoice_date,dist_name,total_amount from purchase_invoice where invoice_no like'" + val + "%' ";
//                } else {
//                    query = "Select * from purchase_invoice";
//                }
//                rs = stmt.executeQuery(query);
//                col.addElement("Invoice No");
//                col.addElement("Invoice Date");
//                col.addElement("Dist Name");
//                col.addElement("Total Amount");
//                while (rs.next()) {
//                    Vector temp = new Vector();
//                    temp.addElement(rs.getString("invoice_no"));
//                    temp.addElement(rs.getString("invoice_date"));
//                    temp.addElement(rs.getString("dist_name"));
//                    temp.addElement(rs.getString("total_amount"));
//                    data.addElement(temp);
//                }
//            }
            jTable1.setModel(new DefaultTableModel(data, col) {

                boolean[] canEditCol = colEditable;

                @Override
                public boolean isCellEditable(int rowIndex, int columnIndex) {
                    return canEditCol[columnIndex];
                }
            });
            jTable1.setModel(new DefaultTableModel(data, col));
            jTable1.revalidate();
            jTable1.repaint();
        } catch (Exception ex) {
            String msg = "Class : GetDebitDistributor  Method    : LoadPurchaseTable()   = "+ex.getMessage();
            log.debug(msg);
        }
    }

    public void loadSalesTable(String billNo) {

        Vector col = new Vector();
        Vector data = new Vector();
        try {
            col.addElement("Bill Number");
            col.addElement("Bill Date");
            col.addElement("Customer Name");
            col.addElement("Total Amount");
            CreditNoteModel creditNoteModel = creditNoteController.viewRecord("sales_maintain_bill", billNo) ;
            java.util.List<CreditNoteModel> creditModellist = creditNoteModel.getCreditModelList() ;
            for (int i=0; i < creditModellist.size (); i++) {
                Vector temp = new Vector();
                creditNoteModel = creditModellist.get (i) ;
                temp.addElement (creditNoteModel.getInvoiceOrBillNumber ());
                temp.addElement(creditNoteModel.getCreditDate ());
                temp.addElement(creditNoteModel.getName ());
                temp.addElement(creditNoteModel.getAmount ());
                data.addElement (temp);
            }

//            ResultSet rs;
//            Statement stmt = DBConnection.getStatement();
//            String query;
//            if (val != null && val != "" && val.trim().length() > 1) {
//                if (val != null || val != "") {
//                    query = "Select bill_no,bill_date,cust_name,total_amount from sales_maintain_bill where bill_no like'" + val + "%' ";
//                } else {
//                    query = "Select * from sales_maintain_bill";
//                }
//                rs = stmt.executeQuery(query);
//                col.addElement("Bill Number");
//                col.addElement("Bill Date");
//                col.addElement("Customer Name");
//                col.addElement("Total Amount");
//                while (rs.next()) {
//                    Vector temp = new Vector();
//                    temp.addElement(rs.getString("bill_no"));
//                    temp.addElement(rs.getString("bill_date"));
//                    temp.addElement(rs.getString("cust_name"));
//                    temp.addElement(rs.getString("total_amount"));
//                    data.addElement(temp);
//                }
//            }
            jTable1.setModel(new DefaultTableModel(data, col) {

                boolean[] canEditCol = colEditable;

                @Override
                public boolean isCellEditable(int rowIndex, int columnIndex) {
                    return canEditCol[columnIndex];
                }
            });

            jTable1.setModel(new DefaultTableModel(data, col));
            jTable1.revalidate();
            jTable1.repaint();
        } catch (Exception ex) {
            String msg = "Class : GetDebitDistributor  Method   : LoadSalesTable()   = "+ex.getMessage();
            log.debug(msg);
        }
    }
    public javax.swing.JButton jButton1;
    public javax.swing.JPanel jPanel1;
    public javax.swing.JScrollPane jScrollPane1;
    public javax.swing.JTable jTable1;
    public javax.swing.JTextField jTextField1;
}
