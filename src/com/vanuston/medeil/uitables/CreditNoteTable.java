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

public class CreditNoteTable extends javax.swing.JDialog {

    static Logger log = Logger.getLogger(CreditNoteTable.class, "Finanical");
    public static String bill = null;
    public static String name = null;
    boolean colEditable[] = {false, false, false, false};
    public static String typeS = null;
    private CreditNote creditNoteController ;

    public CreditNoteTable(String val) throws RemoteException, NotBoundException {
        //Controller Instance
        creditNoteController = (CreditNote) RegistryFactory.getClientStub (RegistryConstants.CreditNote) ;
        setModal(true);
        typeS = val;
        initComponents();
        jTextField1.requestFocus();
        if (val.equalsIgnoreCase("Distributor")) {
            loadPurchaseTable("");
        } else if (val.equalsIgnoreCase("Customer")) {
            loadSalesTable("");
        }
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jButton1 = new javax.swing.JButton();
        jTextField1 = new javax.swing.JTextField();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Credit Note Table");
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

            @Override
            public void actionPerformed(java.awt.event.ActionEvent evt) {
                jTextField1ActionPerformed(evt);
            }
        });


        jTextField1.addKeyListener(new java.awt.event.KeyAdapter() {

            @Override
            public void keyReleased(java.awt.event.KeyEvent evt) {
                jTextField1KeyReleased(evt);                
            }

            @Override
            public void keyPressed(java.awt.event.KeyEvent evt) {
                jTextField1KeyPressed(evt);
            }
        });
        jPanel1.add(jTextField1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 20, 550, -1));

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
        jTable1.getTableHeader().setBackground(new Color(226, 238, 244));
        jTable1.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
        jTable1.setRowHeight(22);
        jTable1.setCellSelectionEnabled(false);
        jTable1.setRowSelectionAllowed(true);

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

        jPanel1.add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 50, 630, 230));

        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
                layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING).add(jPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 647, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE));
        layout.setVerticalGroup(
                layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING).add(jPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 290, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE));

        java.awt.Dimension screenSize = java.awt.Toolkit.getDefaultToolkit().getScreenSize();
        setBounds((screenSize.width - 655) / 2, (screenSize.height - 324) / 2, 655, 324);
    }// </editor-fold>

    private void formFocusGained(java.awt.event.FocusEvent evt) {
        jTextField1.requestFocus();
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

    private void jButton1ActionPerformed(java.awt.event.ActionEvent evt) {
        this.dispose();
    }

    private void jTextField1KeyReleased(java.awt.event.KeyEvent evt) {
        String val = "";
        val = jTextField1.getText();
        if (val != null && val.trim().length() > 1) {
            if (typeS.equals("Distributor")) {
                loadPurchaseTable(val);
            } else {
                loadSalesTable(val);
            }
        }
    }

    private void jTextField1ActionPerformed(java.awt.event.ActionEvent evt) {
    }

    private void jTextField1KeyPressed(java.awt.event.KeyEvent evt) {
        if (evt.getKeyCode() == 10 || evt.getKeyCode() == 9 || evt.getKeyCode() == KeyEvent.VK_DOWN) {
            jTable1.requestFocus();
        }
        if (evt.getKeyCode() == 27) {
            this.dispose();
        }
    }

    private void jTable1KeyReleased(java.awt.event.KeyEvent evt) {
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

    public void loadPurchaseTable(String val)  {
        
        Vector col = new Vector();
        Vector data = new Vector();
        try {
            col.addElement("Invoice No");
            col.addElement("Invoice Date");
            col.addElement("Dist Name");
            col.addElement("Total Amount");
            //Controller Instance
            CreditNoteModel creditNoteModel = creditNoteController.viewRecord("purchase_invoice", val) ;
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
//                    query = "Select distinct(invoice_no),invoice_date,dist_name,total_amount from purchase_invoice where invoice_no like'" + val + "%' ";
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
//
//            }
            jTable1.setModel(new DefaultTableModel(data, col) {

                boolean[] canEditCol = colEditable;

                @Override
                public boolean isCellEditable(int rowIndex, int columnIndex) {
                    return canEditCol[columnIndex];
                }
            });
            jTable1.revalidate();
            jTable1.repaint();
        } catch (Exception Ex) {
            log.debug("Class : CreditNoteTable  Method   : loadPurchaseTable   Exception :" + Ex.getMessage());
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
            //Controller Instance
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
            jTable1.revalidate();
            jTable1.repaint();
        } catch (Exception Ex) {
            log.debug("Class : CreditNoteTable  Method  : loadSalesTable   Exception :" + Ex.getMessage());
        }
    }
    public javax.swing.JButton jButton1;
    public javax.swing.JPanel jPanel1;
    public javax.swing.JScrollPane jScrollPane1;
    public javax.swing.JTable jTable1;
    public javax.swing.JTextField jTextField1;
}
