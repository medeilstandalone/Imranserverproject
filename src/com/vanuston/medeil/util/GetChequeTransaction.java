package com.vanuston.medeil.util;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.model.MaintenanceCostModel;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.KeyEvent;
import java.util.Vector;
import javafx.stage.Alert;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

public class GetChequeTransaction extends javax.swing.JDialog {

    public String cheque_no = null;    
    public Double amount;
    public boolean colEditable[] = {false, false, false, false, false};
    public static Logger log = Logger.getLogger(GetChequeTransaction.class, "Utilities");
    public JTable MaintainCost;
    public java.util.List<String> cheqNo;

    /** Creates new form GetPurchaseData */
    public GetChequeTransaction() {
        cheque_no = "";
        amount = null;

        initComponents();
        if (!loadChequeTable()) {
            this.dispose();
        } else {
            requestFocusInWindow();
            setVisible(true);
            requestFocus();
        }
    }
    public GetChequeTransaction(JTable maintainCost,java.util.List<String> cNo) {
        MaintainCost =  maintainCost;
        cheque_no = "";
        amount = null;
        cheqNo = cNo;


        initComponents();
        if (!loadChequeTable()) {
            this.dispose();
        } else {
            requestFocusInWindow();
            setVisible(true);
            requestFocus();
        }
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">
    private void initComponents() {

        jPanel1 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        setModal(true);
        setBounds(300, 350, 590, 325);
        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Cheque Transaction");
        setResizable(false);
        addKeyListener(new java.awt.event.KeyAdapter() {

            @Override
            public void keyPressed(java.awt.event.KeyEvent evt) {
                formKeyPressed(evt);
            }
        });

        jPanel1.setLayout(new org.netbeans.lib.awtextra.AbsoluteLayout());
        jTable1.setModel(new javax.swing.table.DefaultTableModel(
                new Object[][]{
                    {null, null, null, null, null},
                    {null, null, null, null, null},
                    {null, null, null, null, null},
                    {null, null, null, null, null},},
                new String[]{
                    "Title 1", "Title 2", "Title 3", "Title 4", "Title5"
                }));

        jTable1.setGridColor(new java.awt.Color(204, 204, 255));
        jTable1.setRowHeight(25);
        jTable1.getTableHeader().setBackground(new Color(226, 238, 244));
        jTable1.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
        jTable1.setShowGrid(true);
        jTable1.getTableHeader().setReorderingAllowed(false);

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
        jPanel1.add(jScrollPane1, new org.netbeans.lib.awtextra.AbsoluteConstraints(0, 10, 560, 230));
        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
                layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING).add(jPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 580, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE));
        layout.setVerticalGroup(
                layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING).add(jPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 290, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE));
    }// </editor-fold>

    private void formKeyPressed(java.awt.event.KeyEvent e) {
        if (e.getKeyCode() == 27) {
            this.dispose();
        }
    }

    private void jTable1KeyPressed(java.awt.event.KeyEvent evt) {
        if (evt.getKeyCode() == 10) {
            checkChequeRepeat();
        }
        if (evt.getKeyCode() == 27) {
            this.dispose();
        }
    }

    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {
        checkChequeRepeat();
    }

    private void checkChequeRepeat() {
        int i = jTable1.getSelectedRow();
        if (i == -1 || (jTable1.getValueAt(i, 1) == null || jTable1.getValueAt(i, 1).equals("")) || (jTable1.getValueAt(i, 2) == null || jTable1.getValueAt(i, 2).equals(""))) {
        } else {
            cheque_no = jTable1.getValueAt(i, 1).toString();
            amount = Double.parseDouble(jTable1.getValueAt(i, 2).toString());            
        }
        this.dispose();
    }   
   private boolean loadChequeTable() {
        boolean ret = true;
        Vector col = new Vector();
        Vector data = new Vector();
        try {
            com.vanuston.medeil.implementation.MaintenanceCost mainCont = (com.vanuston.medeil.implementation.MaintenanceCost) RegistryFactory.getClientStub(RegistryConstants.MaintenanceCost);
            java.util.List<MaintenanceCostModel> chkDetails = mainCont.getChequeDetails();            
            MaintenanceCostModel model;
            int cnt = chkDetails.size();
            if (cnt > 0) {
                col.addElement("S.No");
                col.addElement("Cheque No");
                col.addElement("Amount");
                col.addElement("Bank Name");
                col.addElement("Account Number");
                int index = 0;
                for (index = 0; index < chkDetails.size(); index++) {
                    model = chkDetails.get(index);                     
                    String no = model.getChequeNo();                                        
                    if (!cheqNo.contains(no)) {
                        Vector temp = new Vector();
                        temp.addElement(index + 1);
                        temp.addElement(no);
                        temp.addElement(model.getAmount().toString());
                        temp.addElement(model.getBankName());
                        temp.addElement(model.getAccountNo());
                        data.addElement(temp);
                    }
                }

                if (index == 0 || data.isEmpty()) {
                    Alert.inform("There is no any other Cheque Transactions!");
                    ret = false;
                }                
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
            } else {
                Alert.inform("There is no any other Cheque Transactions!");
                ret = false;
            }
        } catch (Exception Ex) {
            String msg = "Class : GetChequeTransaction  Method : loadChequeTable ()   = "+Ex ;
            log.debug(msg);                        
            return false;
        }
        return ret;
    }
    public javax.swing.JButton jButton1;
    public javax.swing.JPanel jPanel1;
    public javax.swing.JScrollPane jScrollPane1;
    public javax.swing.JTable jTable1;
}
