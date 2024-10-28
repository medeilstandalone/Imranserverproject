 /*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.controller.DrugController;
import com.vanuston.medeil.controller.StockController;
import com.vanuston.medeil.implementation.Drug;
import com.vanuston.medeil.model.DrugModel;
import com.vanuston.medeil.model.StockModel;
import java.awt.event.KeyEvent;
import java.sql.*;
import java.util.Vector;
import javax.swing.table.DefaultTableModel;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.ArrayList;

/**
 *
 * @author admin
 */
public class GetStockDrugTable extends javax.swing.JDialog {

    static Logger log = Logger.getLogger(GetStockDrugTable.class, "Inventory");
    public static String ssno = null;
    public static String itemname = null;
    public static String Dosage = null;
    public static String batchNo = null;
    public static String formulation = null;
    public static String Package = null;
    public static String itemcode = null;
    boolean colEditable[] = {false, false, false, false, false, false, false};
    public static int cnt = 0;
    public String typeS = null;
    String mar = "DrugTable";

    /** Creates new form GetPurchaseData */
    Drug drugController;
    com.vanuston.medeil.implementation.Stock stockController;
    public GetStockDrugTable(String val) throws RemoteException, NotBoundException{
         drugController=(Drug) RegistryFactory.getClientStub(RegistryConstants.Drug);
         stockController=(com.vanuston.medeil.implementation.Stock) RegistryFactory.getClientStub(RegistryConstants.Stock);
        typeS = val;
        if (val.equalsIgnoreCase("save")) {
            initComponents();
            jTextField1.requestFocus();
            loadDrugTable("");
        } else if (val.equalsIgnoreCase("edit")) {           
            mar = "Stock Table";
            initComponents();
            jTextField1.requestFocus();
            loadStockTable("");
        }
    }

    public GetStockDrugTable() {
    }

    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">
    private void initComponents() {

        setModal(true);
        jPanel1 = new javax.swing.JPanel();
        jScrollPane1 = new javax.swing.JScrollPane();
        jTable1 = new javax.swing.JTable();
        jButton1 = new javax.swing.JButton();
        jTextField1 = new javax.swing.JTextField();

        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle(mar);
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
        jPanel1.add(jTextField1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 20, 350, -1));

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
                new Object[][]{
                    {null, null, null, null, null, null, null},
                    {null, null, null, null, null, null, null},
                    {null, null, null, null, null, null, null},
                    {null, null, null, null, null, null, null}
                },
                new String[]{
                    "Title 1", "Title 2", "Title 3", "Title 4", "Title 5", "Title 6", "Title 7"
                }));
        jTable1.setGridColor(new java.awt.Color(204, 204, 255));
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

    private void formFocusGained(java.awt.event.FocusEvent evt) {//GEN-FIRST:event_formFocusGained
        // TODO add your handling code here:
        jTextField1.requestFocus();
    }//GEN-LAST:event_formFocusGained

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

    public void addRow() {
        DefaultTableModel model = (DefaultTableModel) jTable1.getModel();
        Vector datas = new Vector();
        for (int i = 0; i < jTable1.getModel().getColumnCount(); i++) {
            datas.addElement(null);
        }
        model.insertRow(jTable1.getRowCount(), datas);
    }

    private void jTextField1ActionPerformed(java.awt.event.ActionEvent evt) {//GEN-FIRST:event_jTextField1ActionPerformed
        // TODO add your handling code here:
    }//GEN-LAST:event_jTextField1ActionPerformed

    private void jTextField1KeyReleased(java.awt.event.KeyEvent evt) {
        String val = "";
        val = jTextField1.getText();
        if (val != null && val.trim().length() > 1) {
            if (typeS.equals("save")) {
                loadDrugTable(val);
            } else {
                loadStockTable(val);
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

    private void jTable1KeyReleased(java.awt.event.KeyEvent evt) {
        if (evt.getKeyCode() == 10) {
            int i = jTable1.getSelectedRow();
            if (i != -1) {
                if (typeS.equals("save")) {
//                    itemname = jTable1.getModel().getValueAt(i, 0).toString();
//                    Dosage = jTable1.getModel().getValueAt(i, 3).toString();
//                    //.concat("_").concat(jTable1.getValueAt(i, 3).toString());
//                    formulation = jTable1.getModel().getValueAt(i, 4).toString();
//                    itemcode=jTable1.getModel().getValueAt(i, 5).toString();
                    itemname = jTable1.getModel().getValueAt(i, 0).toString();
                    Dosage = jTable1.getModel().getValueAt(i, 2).toString();
                    formulation = jTable1.getModel().getValueAt(i, 3).toString();
                    itemcode = jTable1.getModel().getValueAt(i, 5).toString();
                } else {
                    ssno = jTable1.getModel().getValueAt(i, 0).toString();
                    itemname = jTable1.getModel().getValueAt(i, 1).toString();
                    Dosage = jTable1.getModel().getValueAt(i, 2).toString();
                    formulation = jTable1.getModel().getValueAt(i, 3).toString();
                    batchNo = jTable1.getModel().getValueAt(i, 4).toString();
                }
            }
            this.dispose();
            cnt = 1;
        }
        if (evt.getKeyCode() == 27) {
            this.dispose();
        }
    }

    private void jTable1KeyPressed(java.awt.event.KeyEvent evt) {
        if (evt.getKeyCode() == 10) {
            int i = jTable1.getSelectedRow();
            if (typeS.equals("save")) {
//                itemname = jTable1.getModel().getValueAt(i, 0).toString();
//                Dosage = jTable1.getModel().getValueAt(i, 3).toString();
//                //.concat("_").concat(jTable1.getValueAt(i, 3).toString());
//                formulation = jTable1.getModel().getValueAt(i, 4).toString();
//                 itemcode=jTable1.getModel().getValueAt(i, 5).toString();
                itemname = jTable1.getModel().getValueAt(i, 0).toString();
                Dosage = jTable1.getModel().getValueAt(i, 2).toString();
                formulation = jTable1.getModel().getValueAt(i, 3).toString();
                itemcode = jTable1.getModel().getValueAt(i, 5).toString();
            } else {
                ssno = jTable1.getModel().getValueAt(i, 0).toString();
                itemname = jTable1.getModel().getValueAt(i, 1).toString();
                Dosage = jTable1.getModel().getValueAt(i, 2).toString();
                formulation = jTable1.getModel().getValueAt(i, 3).toString();
                batchNo = jTable1.getModel().getValueAt(i, 4).toString();

            }
            this.dispose();
            cnt = 1;
        }
        if (evt.getKeyCode() == 27) {
            this.dispose();
        }
    }

    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {
        int i = jTable1.getSelectedRow();
        if (typeS.equals("save")) {
//            itemname = jTable1.getModel().getValueAt(i, 0).toString();
//            Dosage = jTable1.getModel().getValueAt(i, 2).toString();
//            formulation = jTable1.getModel().getValueAt(i, 3).toString();
//            itemcode=jTable1.getModel().getValueAt(i, 5).toString();
            itemname = jTable1.getModel().getValueAt(i, 0).toString();
            Dosage = jTable1.getModel().getValueAt(i, 2).toString();
            formulation = jTable1.getModel().getValueAt(i, 3).toString();
            itemcode = jTable1.getModel().getValueAt(i, 5).toString();
        } else {
            ssno = jTable1.getModel().getValueAt(i, 0).toString();
            itemname = jTable1.getModel().getValueAt(i, 1).toString();
            Dosage = jTable1.getModel().getValueAt(i, 2).toString();
            formulation = jTable1.getModel().getValueAt(i, 3).toString();
            batchNo = jTable1.getModel().getValueAt(i, 4).toString();

        }
        this.dispose();
        cnt = 1;
    }

    public void loadDrugTable(String val) {
        Vector col = new Vector();
        Vector data = new Vector();
        try {
                col.addElement("Item Name");
                col.addElement("Generic Name");
                col.addElement("Dosage");
                col.addElement("Formulation");
                col.addElement("MRP");
                col.addElement("Item Code");
            if (val != null && !val.equals("") && val != "" && val.trim().length() > 1) {
                DrugModel drugBean = new DrugModel();
                //Drug dc = new DrugController();
                drugBean.setPassVale(5);
                drugBean.setGetDrugCharacter(val);
                ArrayList<DrugModel> drugList =drugController.viewAllRecord(drugBean);
                
                for (int i = 0; i < drugList.size(); i++) {
                    drugBean = drugList.get(i);
                    addRow();
                    Vector temp = new Vector();
                    temp.addElement(drugBean.getDrug_name());
                    temp.addElement(drugBean.getGeneric_name());
                    temp.addElement(drugBean.getDosage());
                    temp.addElement(drugBean.getFormulation_short());
                    temp.addElement(drugBean.getMrp());
                    temp.addElement(drugBean.getDrug_id());
                    data.addElement(temp);
                }

//                query = "Select  itemname ,genericname,mfgname,dosage,formulation,mrp,itemcode from drugtable where itemname like'" + val + "%' and dru_flag_id!=3  order by itemname";
//
//                rs = stmt.executeQuery(query);
//                //col.addElement("ss_no");
//                col.addElement("Item Name");
//                col.addElement("Generic Name");
//                col.addElement("Mfg Name");
//                col.addElement("Dosage");
//                col.addElement("Formulation");
//                col.addElement("MRP");
//                 col.addElement("ItemCode");
//                while (rs.next()) {
//                    Vector temp = new Vector();
//                   // temp.addElement(rs.getString("ss_no"));
//                    temp.addElement(rs.getString("itemname"));
//                    temp.addElement(rs.getString("genericname"));
//                    temp.addElement(rs.getString("mfgname"));
//                    temp.addElement(rs.getString("dosage"));
//                    temp.addElement(rs.getString("formulation"));
//                    temp.addElement(rs.getString("mrp"));
//                    temp.addElement(rs.getString("itemcode"));
//                    data.addElement(temp);
//
//                }
             }
            jTable1.setModel(new DefaultTableModel(data, col) {
                boolean[] canEditCol = colEditable;
                @Override
                public boolean isCellEditable(int rowIndex, int columnIndex) {
                    return canEditCol[columnIndex];
                }
            });
            int m = jTable1.getModel().getColumnCount();
            
             jTable1.getColumnModel().getColumn(5).setMaxWidth(0);
                jTable1.getColumnModel().getColumn(5).setMinWidth(0);
                jTable1.getColumnModel().getColumn(5).setPreferredWidth(0);
                jTable1.getColumnModel().getColumn(5).setResizable(false);
            if (m > 7) {
                jTable1.revalidate();
                jTable1.repaint();
            }
               
        } catch (Exception e) {
            String msg = "Class : GetStockDrugTable  method : loadDrugTable()   = ".concat(e.getMessage());
            log.debug(msg);
        }
    }

    public void loadStockTable(String val) {
        Vector col = new Vector();
        Vector data = new Vector();
        try {
                col.addElement("ss_no");
                col.addElement("Item Name");
                col.addElement("Dosage");
                col.addElement("Formulation");
                col.addElement("Batch No");
                col.addElement("Qty");
                col.addElement("MRP");
            if (val != null && !val.equals("") && val != "" && val.trim().length() > 1) {
                StockModel stockBean = new StockModel();
                //com.vanuston.medeil.implementation.Stock stockController = new StockController();
                stockBean.setPassValue(6);
                stockBean.setStock_itemName(val);
                ArrayList<StockModel> stockList = stockController.viewAllRecord(stockBean);
                for (int i = 0; i < stockList.size(); i++) {
                    stockBean = stockList.get(i);
                    addRow();
                    Vector temp = new Vector();
                    temp.addElement(stockBean.getStock_ssNo());
                    temp.addElement(stockBean.getStock_itemName());
                    temp.addElement(stockBean.getDosage());
                    temp.addElement(stockBean.getStock_formulation());
                    temp.addElement(stockBean.getStock_batchNo());
                    temp.addElement(stockBean.getStock_qty());
                    temp.addElement(stockBean.getStock_mrp());
                    data.addElement(temp);
                }
                }
            jTable1.setModel(new DefaultTableModel(data, col) {
                boolean[] canEditCol = colEditable;
                @Override
                public boolean isCellEditable(int rowIndex, int columnIndex) {
                    return canEditCol[columnIndex];
                }
            });
            
            int m = jTable1.getModel().getColumnCount();           
            jTable1.getColumnModel().getColumn(0).setMaxWidth(0);
                jTable1.getColumnModel().getColumn(0).setMinWidth(0);
                jTable1.getColumnModel().getColumn(0).setPreferredWidth(0);
                jTable1.getColumnModel().getColumn(0).setResizable(false);
            if (m > 7) {
                jTable1.revalidate();
                jTable1.repaint();
            }


        } catch (Exception e) {
            String msg = "Class : GetStockDrugTable  method : loadStockTable()   = ".concat(e.getMessage());
            log.debug(msg);
        }
    }

    public boolean isCellEditable(int rowIndex, int colIndex) {
        return false;   //Disallow the editing of any cell
    }
    // Variables declaration - do not modify
    public javax.swing.JButton jButton1;
    public javax.swing.JPanel jPanel1;
    public javax.swing.JScrollPane jScrollPane1;
    public javax.swing.JTable jTable1;
    public static javax.swing.JTextField jTextField1;
}
