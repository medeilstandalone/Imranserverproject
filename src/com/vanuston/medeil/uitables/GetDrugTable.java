package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.Drug;
import com.vanuston.medeil.model.DrugModel;
import java.awt.event.KeyEvent;
import java.util.ArrayList;
import java.util.Vector;
import javax.swing.table.DefaultTableModel;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;

public class GetDrugTable extends javax.swing.JDialog {
    static Logger log = Logger.getLogger(GetDrugTable.class, "Masters");
    public static String itemCode = null;
    public static int cnt = 0;
    boolean colEditable[] = {false, false, false, false, false, false};

    Drug drugController;
    public GetDrugTable() throws RemoteException, NotBoundException{
         drugController=(Drug) RegistryFactory.getClientStub(RegistryConstants.Drug);
        initComponents();
        jTextField1.requestFocus();        
        loadDrugTable("");
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
        setTitle("Drug Table");
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
        jPanel1.add(jTextField1, new org.netbeans.lib.awtextra.AbsoluteConstraints(10, 20, 550, -1));

        jTable1.setModel(new javax.swing.table.DefaultTableModel(
                new Object[][]{
                    {null, null, null, null, null, null},
                    {null, null, null, null, null, null},
                    {null, null, null, null, null, null},
                    {null, null, null, null, null, null}
                },
                new String[]{
                    "Title 1", "Title 2", "Title 3", "Title 4", "Title 5", "Title 6"
                }));
        jTable1.setGridColor(new java.awt.Color(204, 204, 255));
        jTable1.setRowHeight(22);
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
    public void addRow() {
        DefaultTableModel model = (DefaultTableModel) jTable1.getModel();
        Vector datas = new Vector();
        for (int i = 0; i < jTable1.getModel().getColumnCount(); i++) {
            datas.addElement(null);
        }
        model.insertRow(jTable1.getRowCount(), datas);
    }

    private void jTextField1KeyReleased(java.awt.event.KeyEvent evt) {
        String val = "";
        val = jTextField1.getText();
        if (val != null && val.trim().length() > 1) {           
            loadDrugTable(val);
        }
    }
    public int setMyTransferHandlers(String s,int i) {
        String s1="";
     if(i==1)
     {
      s1=s;
      i=1;
        }
    else
     {
       s1=jTextField1.getText();
       i=2;
        }
     return i;
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
            itemCode = jTable1.getValueAt(i, 0).toString();
            cnt = 1;
            this.dispose();
        }
        if (evt.getKeyCode() == 27) {
            this.dispose();
        }
    }

    private void jTable1KeyPressed(java.awt.event.KeyEvent evt) {
        if (evt.getKeyCode() == 10) {
            int i = jTable1.getSelectedRow();
            itemCode = jTable1.getValueAt(i, 0).toString();
            cnt = 1;
            this.dispose();
        }
        if (evt.getKeyCode() == 27) {
            this.dispose();
        }
    }

    private void jTable1MouseClicked(java.awt.event.MouseEvent evt) {
        int i = jTable1.getSelectedRow();
        itemCode = jTable1.getValueAt(i, 0).toString();
        cnt = 1;
        this.dispose();
    }

    public void loadDrugTable(String val) {
        Vector col = new Vector();
        Vector data = new Vector();
        try {
                col.addElement("Item Code");
                col.addElement("Item Name");
                col.addElement("Generic Name");
                col.addElement("Dosage");
                col.addElement("Formulation");
                col.addElement("MRP");

             
            if (val != null && val != "" && val.trim().length() > 1) {
                DrugModel drugBean = new DrugModel();
            //Drug dc = new DrugController();
            drugBean.setPassVale(4);
            drugBean.setGetDrugCharacter(val);
           

            ArrayList<DrugModel> drugList =drugController.viewAllRecord(drugBean);
                
            for (int i = 0; i < drugList.size(); i++) {
                 drugBean = drugList.get(i);
                addRow();
                Vector temp = new Vector();
                    temp.addElement(drugBean.getDrug_code());
                    temp.addElement(drugBean.getDrug_name());
                    temp.addElement(drugBean.getGeneric_name());
                    temp.addElement(drugBean.getDosage());
                    temp.addElement(drugBean.getFormulation());
                    temp.addElement(drugBean.getMrp());
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
            jTable1.getColumnModel().getColumn(1).setPreferredWidth(500);
            jTable1.revalidate();
            jTable1.repaint();
        } catch (Exception e) {
            String msg = "Class : GetDrugTable  Method : loadDrugTable()   = "+e.getMessage();
            log.debug(msg);
        }
    }
    public javax.swing.JButton jButton1;
    public javax.swing.JPanel jPanel1;
    public javax.swing.JScrollPane jScrollPane1;
    public javax.swing.JTable jTable1;
    public javax.swing.JTextField jTextField1;
}
