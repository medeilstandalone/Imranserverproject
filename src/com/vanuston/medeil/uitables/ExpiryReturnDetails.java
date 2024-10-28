package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.controller.ExpiryReturnController;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.implementation.ExpiryReturn;
import com.vanuston.medeil.model.ExpiryReturnModel;
import com.vanuston.medeil.uitables.ExpiryReturnTable;
import com.vanuston.medeil.util.Value;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.RegistryConstants;
import java.awt.event.KeyEvent;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import javax.swing.JOptionPane;
import javax.swing.JTable;
import javax.swing.table.DefaultTableModel;

public final class ExpiryReturnDetails extends javax.swing.JDialog {

    static Logger log = Logger.getLogger(ExpiryReturnDetails.class, "Inventory");
    JTable expiryComp = new JTable();
    SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
    java.util.Date FromJavaDate;
    java.sql.Date FromSqlDate;
    java.util.Date ToJavaDate;
    java.sql.Date ToSqlDate;
    int exclude = 0;
    int purch = 0;
    ExpiryReturnTable expiryReturnTable=new ExpiryReturnTable();
    com.vanuston.medeil.implementation.ExpiryReturn expiryReturnController;

    public ExpiryReturnDetails(JTable jc) throws RemoteException, NotBoundException {
        expiryReturnController=(com.vanuston.medeil.implementation.ExpiryReturn) RegistryFactory.getClientStub(RegistryConstants.ExpiryReturn);
        expiryComp = jc;
        initComponents();
        
        loadExpiryReturnTable("");
        jChargeTextField1.requestFocus();
    }

    @SuppressWarnings("unchecked")
    private void initComponents() {
        setModal(true);
        jChrgesPanel1 = new javax.swing.JPanel();
        jChrgesScrollPanel1 = new javax.swing.JScrollPane();
        expiryTable = new javax.swing.JTable();
        jButtonCharges = new javax.swing.JButton();
        jChargeTextField1 = new javax.swing.JTextField();
        setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        setTitle("Expiry Returns Table");
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
                try {
                    jChargeTextField1KeyReleased(evt);
                } catch (RemoteException ex) {
                    java.util.logging.Logger.getLogger(ExpiryReturnDetails.class.getName()).log(Level.SEVERE, null, ex);
                }
            }

            @Override
            public void keyPressed(java.awt.event.KeyEvent evt) {
                jChargeTextField1KeyPressed(evt);
            }
        });
        jChrgesPanel1.add(jChargeTextField1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 20, 350, -1));

        expiryTable.setModel(new javax.swing.table.DefaultTableModel(
                new Object[][]{
                    {null, null, null},
                    {null, null, null},
                    {null, null, null},
                    {null, null, null}
                },
                new String[]{
                    "Title 1", "Title 2", "Title 3"
                }));
        expiryTable.setGridColor(new java.awt.Color(204, 204, 255));
        expiryTable.setRowHeight(22);

        expiryTable.setCellSelectionEnabled(false);
        expiryTable.setRowSelectionAllowed(true);
        expiryTable.addMouseListener(new java.awt.event.MouseAdapter() {

            @Override
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                try {
                    jTable1MouseClicked(evt);
                } catch (RemoteException ex) {
                    java.util.logging.Logger.getLogger(ExpiryReturnDetails.class.getName()).log(Level.SEVERE, null, ex);
                } catch (NotBoundException ex) {
                    java.util.logging.Logger.getLogger(ExpiryReturnDetails.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        });
        expiryTable.addKeyListener(new java.awt.event.KeyAdapter() {

            @Override
            public void keyPressed(java.awt.event.KeyEvent evt) {
                jTable1KeyPressed(evt);
            }

            @Override
            public void keyReleased(java.awt.event.KeyEvent evt) {
                jTable1KeyReleased(evt);
            }
        });
        jChrgesScrollPanel1.setViewportView(expiryTable);
        jChrgesPanel1.add(jChrgesScrollPanel1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 50, 530, 230));
        org.jdesktop.layout.GroupLayout layout = new org.jdesktop.layout.GroupLayout(getContentPane());
        getContentPane().setLayout(layout);
        layout.setHorizontalGroup(
                layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING).add(jChrgesPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 547, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE));
        layout.setVerticalGroup(
                layout.createParallelGroup(org.jdesktop.layout.GroupLayout.LEADING).add(jChrgesPanel1, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE, 290, org.jdesktop.layout.GroupLayout.PREFERRED_SIZE));
        java.awt.Dimension screenSize = java.awt.Toolkit.getDefaultToolkit().getScreenSize();
        setBounds((screenSize.width - 555) / 2, (screenSize.height - 324) / 2, 555, 324);
    }

    private void formFocusGained(java.awt.event.FocusEvent evt) {
        jChargeTextField1.requestFocus();
    }

    private void jChargeTextField1ActionPerformed(java.awt.event.ActionEvent evt) {
    }

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

    private void jChargeTextField1KeyReleased(java.awt.event.KeyEvent evt) throws RemoteException {
       
            String val = jChargeTextField1.getText();
            loadExpiryReturnTable(val);
       
    }

    private void jChargeTextField1KeyPressed(java.awt.event.KeyEvent evt) {
        if (evt.getKeyCode() == 10 || evt.getKeyCode() == 9 || evt.getKeyCode() == KeyEvent.VK_DOWN) {
            expiryTable.requestFocus();
        }
        if (evt.getKeyCode() == 27) {
            this.dispose();
        }
    }

    private void jTable1KeyReleased(java.awt.event.KeyEvent evt)  {
        if (evt.getKeyCode() == 10) {            
                setExpiryReturnValues();            
        }
        if (evt.getKeyCode() == 27) {
            this.dispose();
        }
    }

    private void jTable1KeyPressed(java.awt.event.KeyEvent evt) {
        if (evt.getKeyCode() == 10) {            
                setExpiryReturnValues();            
        }
        if (evt.getKeyCode() == 27) {
            this.dispose();
        }
    }

    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) throws RemoteException, NotBoundException {
        setExpiryReturnValues();
    }

    public void setExpiryReturnValues()  {
        
        //ExpiryReturn expiryReturnController = new ExpiryReturnController();
        ExpiryReturnModel expiryReturnBean = new ExpiryReturnModel();
        
        final int i = expiryTable.getSelectedRow();
        final int j = expiryComp.getSelectedRow();

        String itemCode = "" + expiryTable.getModel().getValueAt(i, 0);
        expiryReturnBean.setExpiry_item_code(itemCode);
        //String itemName = "" + expiryTable.getModel().getValueAt(i, 1);
        expiryReturnBean.setExpiry_item_name(expiryTable.getModel().getValueAt(i, 1).toString());
        //String batchNo = "" + expiryTable.getModel().getValueAt(i, 3);
        expiryReturnBean.setExpiry_batch_no(expiryTable.getModel().getValueAt(i, 3).toString());
        exclude = expiryReturnTable.excludeFree;
        purch = expiryReturnTable.purSel;
        String sDate1 = "";
        sDate1 = expiryReturnTable.sDate;
        if (sDate1 != null && sDate1.trim().length() >= 10) {
            setFromDate(sDate1);
        }
        //java.sql.Date sDate = getFromDate();
        expiryReturnBean.setExpiry_from_date(getFromDate().toString());
        String eDate1 = "";
        eDate1 = expiryReturnTable.eDate;
        if (eDate1 != null && eDate1.trim().length() >= 10) {
            setFromDate(eDate1);
        }
        // java.sql.Date eDate = getFromDate();
        expiryReturnBean.setExpiry_to_date(getFromDate().toString());
        String distributorName = "";
        //distributorName = ExpiryReturnTable.distributorName;
        expiryReturnBean.setExpiry_dist_name(expiryReturnTable.distributorName);
        if (sDate1 == null || sDate1.trim().length() < 10) {
            JOptionPane.showMessageDialog(null, "Please Enter From Date ");
            this.dispose();
        } else if (eDate1 == null || eDate1.trim().length() < 10) {
            JOptionPane.showMessageDialog(null, "Please Enter to Date ");
            this.dispose();
        } else {
            String mfr_name = "";
            int qty = 0;
            int free = 0;
            String expiryDate = "";
            double unitPrice = 0.0;
            double totalVal = 0.0;
            double mrp = 0.0;
            int packing = 1;
            String formulation = "";
            int finalQty = 0;
            int finQty = 0;
//            List get = new ArrayList();
            try {
                ResultSet rs = null;
                Statement st = DBConnection.getStatement();
                String sql = "";
                expiryReturnBean.setExpiry_checkVal("setExpiryReturnValues");
                expiryReturnBean = expiryReturnController.viewAllRecord(expiryReturnBean);
                List<ExpiryReturnModel> get  = expiryReturnBean.getExpiryreturn();
                for (int g = 0; g < get.size(); g++) {
                expiryReturnBean =  get.get(g);
//                sql = "select  p.packing,p.item_name,p.batch_no,p.mfr_name,s.qty,p.free,p.expiry_date,p.unit_price,s.formulation,p.mrp from purchase_invoice p,stock_statement s where p.item_code='" + itemCode + "' and  s.item_code='" + itemCode + "' and p.dist_name='" + distributorName + "' and p.invoice_date>='" + sDate + "' and p.invoice_date<='" + eDate + "' and p.batch_no='" + batchNo + "' and s.batch_no='" + batchNo + "' and  p.item_name=s.item_name and p.item_code=s.item_code and p.batch_no=s.batch_no and  p.item_name='" + itemName + "' and s.stock_date > p.expiry_date and s.qty>0;";

//                rs = st.executeQuery(sql);
//                while (rs.next()) {
//                    mfr_name = rs.getString("mfr_name");
//                    qty = rs.getInt("qty");
//                    free = rs.getInt("free");
//                    expiryDate = DateUtils.normalFormatDate1(rs.getDate("expiry_date"));
//                    unitPrice = rs.getDouble("unit_price");
//                    formulation = rs.getString("formulation");
//                    mrp = rs.getDouble("mrp");
//                    packing = rs.getInt("packing");

//                    if(mrp>0){
//                    mrp=mrp/packing;
//                    }
//                    if(unitPrice>0){
//                    unitPrice=unitPrice/packing;
//                   }
//
//
//                }
//                free = free * packing;
//                if (qty <= free) {
//                    finalQty = 0;
//                } else {
//                    finalQty = qty - free;
//                }
//                finQty = finalQty;
//                if (exclude == 1) {
//                    finalQty = finalQty + free;
//                }
//                if (purch == 0) {
//                    totalVal = finalQty * unitPrice;
//                } else {
//                    totalVal = finalQty * mrp;
//                }
                    if (expiryReturnBean.getExpiry_mrp() > 0) {
                        mrp = expiryReturnBean.getExpiry_mrp() / expiryReturnBean.getExpiry_packing();
                    }
                    if (expiryReturnBean.getExpiry_unit_price() > 0) {
                        unitPrice = expiryReturnBean.getExpiry_unit_price() / expiryReturnBean.getExpiry_packing();
                    }


                
                free = expiryReturnBean.getExpiry_free_qty() * expiryReturnBean.getExpiry_packing();
                if (expiryReturnBean.getExpiry_qty() <= free) {
                    finalQty = 0;
                } else {
                    finalQty = expiryReturnBean.getExpiry_qty() - expiryReturnBean.getExpiry_free_qty();
                }
                finQty = finalQty;
                if (exclude == 1) {
                    finalQty = finalQty + expiryReturnBean.getExpiry_free_qty();
                }
                if (purch == 0) {
                    totalVal = finalQty * expiryReturnBean.getExpiry_unit_price();
                } else {
                    totalVal = finalQty * expiryReturnBean.getExpiry_mrp();
                }
             
//            expiryComp.getModel().setValueAt(itemName, j, 1);
//            expiryComp.getModel().setValueAt(formulation, j, 2);
//            expiryComp.getModel().setValueAt(mfr_name, j, 3);
//            expiryComp.getModel().setValueAt(batchNo, j, 4);
//            expiryComp.getModel().setValueAt(finQty, j, 5);
//            expiryComp.getModel().setValueAt(free, j, 6);
//            expiryComp.getModel().setValueAt(expiryDate, j, 7);
//            expiryComp.getModel().setValueAt(Value.Round(unitPrice), j, 8);
//            expiryComp.getModel().setValueAt(Value.Round(mrp), j, 9);
//            expiryComp.getModel().setValueAt(Value.Round(totalVal), j, 10);

            expiryComp.getModel().setValueAt(expiryReturnBean.getExpiry_item_name(), j, 1);
            
            expiryComp.getModel().setValueAt(expiryReturnBean.getExpiry_formulation(), j, 2);
            expiryComp.getModel().setValueAt(expiryReturnBean.getExpiry_mfgname(), j, 3);
            
            expiryComp.getModel().setValueAt(expiryReturnBean.getExpiry_batch_no(), j, 4);
            expiryComp.getModel().setValueAt(finQty, j, 5);
            expiryComp.getModel().setValueAt(free, j, 6);
            expiryDate = DateUtils.normalFormatDate(expiryReturnBean.getExpiry_date());
            expiryComp.getModel().setValueAt(expiryDate, j, 7);
            expiryComp.getModel().setValueAt(Value.Round(unitPrice), j, 8);
            expiryComp.getModel().setValueAt(Value.Round(mrp), j, 9);
            expiryComp.getModel().setValueAt((Value.Round(totalVal/expiryReturnBean.getExpiry_packing())), j, 10);
              }
            this.dispose();
            expiryComp.requestFocus();
            expiryComp.changeSelection(j, 5, true, true);
              
        }catch (Exception e) {
            
                String msg = "Class : ExpiryReturnDetails  Method : setExpiryReturnValues()  = " + e.getMessage();
                log.debug(msg);
            }
        }
    }

    public void loadExpiryReturnTable(String val1) {
        //ExpiryReturn expiryReturnController = new ExpiryReturnController();
        //expiryReturnController=(com.vanuston.medeil.implementation.ExpiryReturn) RegistryFactory.getClientStub(RegistryConstants.ExpiryReturn);
        ExpiryReturnModel expiryReturnBean = new ExpiryReturnModel();

        Vector col = new Vector();
        Vector data = new Vector();
        String sDate1 = "";
        //sDate1 = expiryReturnBean.getExpiry_from_date();
        sDate1 = expiryReturnTable.sDate;
//        expiryReturnBean.setExpiry_from_date(DateUtils.changeFormatDate(sDate1));

        if (sDate1 != null && sDate1.trim().length() >= 10) {
            
            setToDate(sDate1);
        }

//        if (expiryReturnTable.sDate.toString() != null && expiryReturnTable.sDate.toString().trim().length() >= 10) {
//             expiryReturnBean.setExpiry_from_date(expiryReturnTable.sDate.toString());
//            setToDate(expiryReturnTable.sDate.toString());
//        }
        java.sql.Date sDate = getToDate();

        expiryReturnBean.setExpiry_from_date(DateUtils.changeFormatDate(sDate));

        String eDate1 = "";
        eDate1 = expiryReturnTable.eDate;
        //eDate1 =expiryReturnBean.getExpiry_to_date();
        // expiryReturnBean.setExpiry_to_date(eDate1);
        if (eDate1 != null && eDate1.trim().length() >= 10) {
            setToDate(eDate1);
        }
//        if (expiryReturnTable.eDate.toString() != null && expiryReturnTable.eDate.toString().trim().length() >= 10) {
//            setToDate(expiryReturnTable.eDate.toString());
//        }
        java.sql.Date eDate = getToDate();
        
        expiryReturnBean.setExpiry_to_date(DateUtils.changeFormatDate(eDate));
        String distributorName = "";
        distributorName = expiryReturnTable.distributorName;
//        distributorName = distributorName.trim();
        expiryReturnBean.setExpiry_dist_name(distributorName);
//        List<ExpiryReturnModel> get = new ArrayList<ExpiryReturnModel>();
        try {
            expiryReturnBean.setExpiry_checkVal("loadExpiryReturnTable");
            expiryReturnBean.setExpiry_item_name(val1);
//            ExpiryReturnModel expiryRetBean=new ExpiryReturnModel();
             expiryReturnBean = expiryReturnController.viewAllRecord(expiryReturnBean);
              List<ExpiryReturnModel> get = expiryReturnBean.getExpiryreturn();
              
            col.addElement("Item code");
            col.addElement("Item Name");
            col.addElement("Mfg Name");
            col.addElement("Batch no");
            col.addElement("Qty");
                for (int g = 0; g < get.size(); g++) {
                    expiryReturnBean=get.get(g);
                    int res = 0;
                String batc = "";
                batc=expiryReturnBean.getExpiry_batch_no();
                String iin = "";
//                iin = rs.getString("item_name");
                iin=expiryReturnBean.getExpiry_item_name();
                res = getBatchNo(iin, batc);
                if (res == 0) {
                    Vector temp = new Vector();
                    int qty = 0;
                    qty = expiryReturnBean.getExpiry_qty();
                    temp.addElement(expiryReturnBean.getExpiry_item_code());
                    
                    temp.addElement(expiryReturnBean.getExpiry_item_name());
                    
                    temp.addElement(expiryReturnBean.getExpiry_mfgname());
                    
                    temp.addElement(expiryReturnBean.getExpiry_batch_no());
                    
                    temp.addElement(String.valueOf(qty));
                    data.addElement(temp);
            }

//            ResultSet rs = null;
//            Statement stmt = DBConnection.getStatement();
//            String query = "";
//            if (val1 != null || val1 != "") {
//                query = " SELECT p.item_code,p.item_name, p.mfr_name,p.batch_no,p.total_qty,s.qty  FROM purchase_invoice p,stock_statement s where p.invoice_date>='" + sDate + "' and p.invoice_date<='" + eDate + "' and p.dist_name='" + distributorName + "' and s.stock_date > p.expiry_date and s.qty>0 and p.item_name=s.item_name  and p.item_code=s.item_code  and p.batch_no=s.batch_no and  p.item_name like '" + val1 + "%';";
//            } else {
//                query = " SELECT  p.item_code,p.item_name, p.mfr_name,p.batch_no,p.total_qty,s.qty   FROM purchase_invoice p,stock_statement s where p.invoice_date>='" + sDate + "' and p.invoice_date<='" + eDate + "' and p.dist_name='" + distributorName + "' and s.stock_date > p.expiry_date and s.qty>0 and p.item_name=s.item_name and p.item_code=s.item_code and p.batch_no=s.batch_no; ";
//            }
//

//            rs = stmt.executeQuery(query);
//            col.addElement("Item code");
//            col.addElement("Item Name");
//            col.addElement("Mfg Name");
//            col.addElement("Batch no");
//            col.addElement("Qty");
//            while (rs.next()) {
//                int res = 0;
//                String batc = "";
//                batc = rs.getString("batch_no");
//                String iin = "";
//                iin = rs.getString("item_name");
//                res = getBatchNo(iin, batc);
//                if (res == 0) {
//                    Vector temp = new Vector();
//                    int qty = 0;
//                    qty = rs.getInt("qty");
//                    temp.addElement(rs.getString("item_code"));
//                    temp.addElement(rs.getString("item_name"));
//                    temp.addElement(rs.getString("mfr_name"));
//                    temp.addElement(rs.getString("batch_no"));
//                    temp.addElement(String.valueOf(qty));
//                    data.addElement(temp);
//                }
//            }
            expiryTable.setModel(new DefaultTableModel(data, col));
            expiryTable.revalidate();
            expiryTable.repaint();
        }
        } catch (Exception e) {
            String msg = "Class : ExpiryReturnDetails  Method : loadExpiryReturnTable()  = " + e.getMessage();
            log.debug(msg);
        }
    }

    public void setFromDate(String FromDateString) {
        try {
            FromJavaDate = dateFormat.parse(FromDateString);
            FromSqlDate = new java.sql.Date(FromJavaDate.getTime());
        } catch (Exception e) {
            String msg = "Class : ExpiryReturnDetails  Method : setFromDate()  = " + e.getMessage();
            log.debug(msg);
        }
    }

    public java.sql.Date getFromDate() {
        return FromSqlDate;
    }

//    public int getBatchNo(String itemName, String BatchNo) {
//        int re = 0;
//        try {
//            ResultSet rsBat = null;
//            String sqlBa = "select batch_no from expiryreturn where item_name='" + itemName + "' and batch_no='" + BatchNo + "'";
//            rsBat = DBConnection.getStatement().executeQuery(sqlBa);
//            while (rsBat.next()) {
//                re = 1;
//            }
//        } catch (Exception e) {
//            String msg = "Class : ExpiryReturnDetails  Method : getBatchNo()  = " + e.getMessage();
//            log.debug(msg);
//        }
//        return re;
//    }
 public int getBatchNo(String itemName, String BatchNo) {
        int re = 0;
        try {
            CommonImplements commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
            String sqlBa = "select batch_no from expiryreturn where item_name='" + itemName + "' and batch_no='" + BatchNo + "'";
            
            String batw = commonController.getQueryValue(sqlBa);
            if (!batw.equals("")) {
                re = 1;
            }
        } catch (Exception e) {
            String msg = "Class : ExpiryReturnDetails  Method : getBatchNo()  = " + e.getMessage();
            log.debug(msg);
        }
        return re;
    }
    public void setToDate(String ToDateString) {
        try {
            ToJavaDate = dateFormat.parse(ToDateString);
            ToSqlDate = new java.sql.Date(ToJavaDate.getTime());
        } catch (Exception e) {
            String msg = "Class : ExpiryReturnDetails  Method : setToDate()  = " + e.getMessage();
            log.debug(msg);
        }
    }

    public java.sql.Date getToDate() {
        return ToSqlDate;
    }
    public javax.swing.JButton jButtonCharges;
    public javax.swing.JPanel jChrgesPanel1;
    public javax.swing.JScrollPane jChrgesScrollPanel1;
    public javax.swing.JTable expiryTable;
    public javax.swing.JTextField jChargeTextField1;
}
