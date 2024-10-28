package com.vanuston.medeil.uitables;


import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.Doctor;
import com.vanuston.medeil.model.DoctorChargesModel;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.util.Value;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import java.util.Vector;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.Font;
import java.awt.Color;
import java.awt.event.KeyListener;
import java.util.List;
import javafx.stage.Alert;

public class DoctorCommissionTable {
    static Logger log = Logger.getLogger(DoctorCommissionTable.class, "Utilities");
    public static int initR; 
    public static JTable doctorchargerutiltiesComp;
    public static JScrollPane doctorCharagesScrollPane = new JScrollPane();    
    public static String salesId = "";
    public static double finalChargeamount = 0.0;
    public static String sDate;
    public static String eDate;
    public static String doctorName;
    public static KeyStroke save = KeyStroke.getKeyStroke(KeyEvent.VK_F3, 0);
    public static KeyStroke reset = KeyStroke.getKeyStroke(KeyEvent.VK_F4, 0);
    public static KeyStroke del = KeyStroke.getKeyStroke(KeyEvent.VK_F5, 0);
    public static KeyStroke update = KeyStroke.getKeyStroke(KeyEvent.VK_F7, 0);
    public static KeyStroke edit = KeyStroke.getKeyStroke(KeyEvent.VK_F6, 0);
    public static KeyStroke rR = KeyStroke.getKeyStroke(KeyEvent.VK_F12, 0);
    public static KeyStroke can = KeyStroke.getKeyStroke(KeyEvent.VK_F8, 0);
    public static KeyStroke back = KeyStroke.getKeyStroke(KeyEvent.VK_LEFT, KeyEvent.CTRL_MASK);

    public JComponent createTable(final int initRow, Object[] colName, Class[] type, boolean[] canEdit, int[] width) {
        final Class[] types = type;
        final boolean[] canEditCols = canEdit;
        final int[] colWidth = width;
        initR = initRow;
        doctorchargerutiltiesComp = new JTable();
        Vector cols = new Vector();
        Vector data = new Vector();
        int len = colName.length;
        for (int i = 0; i < initRow; i++) {
            Vector c = new Vector();
            for (int j = 0; j < len; j++) {
                c.addElement(null);
            }
            data.addElement(c);
        }
        for (int n = 0; n < len; n++) {
            cols.addElement(colName[n]);
        }
        try {
            doctorchargerutiltiesComp.setModel(new javax.swing.table.DefaultTableModel(data, cols) {

                Class[] type = types;
                boolean[] canEditCol = canEditCols;

                @Override
                public Class getColumnClass(int columnIndex) {
                    return type[columnIndex];
                }

                @Override
                public boolean isCellEditable(int rowIndex, int columnIndex) {
                    return canEditCol[columnIndex];
                }
            });
        } catch (Exception ex) {
            String msg = "Class : DoctorCommissionTable  Method : CreateTable()  = " + ex.getMessage();
            log.debug(msg);
        }
       

        doctorchargerutiltiesComp.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        doctorchargerutiltiesComp.getTableHeader().setBackground(new Color(226, 238, 244));
        doctorchargerutiltiesComp.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
        doctorchargerutiltiesComp.setShowGrid(true);
        doctorchargerutiltiesComp.getTableHeader().setReorderingAllowed(false);
        doctorchargerutiltiesComp.getInputMap().put(save, "focusOut");
        doctorchargerutiltiesComp.getInputMap().put(edit, "focusOut");
        doctorchargerutiltiesComp.getInputMap().put(reset, "focusOut");
        doctorchargerutiltiesComp.getInputMap().put(can, "focusOut");
        doctorchargerutiltiesComp.getInputMap().put(update, "focusOut");
        doctorchargerutiltiesComp.getInputMap().put(del, "focusOut");
        doctorchargerutiltiesComp.getInputMap().put(back, "focusOut");
        doctorchargerutiltiesComp.getInputMap().put(rR, "focusOut");
        doctorchargerutiltiesComp.getActionMap().put("focusOut", new AbstractAction() {

            @Override
            public void actionPerformed(ActionEvent e) {
                doctorchargerutiltiesComp.transferFocus();
            }
        });      
        for (int i = 0; i < len; i++) {
            doctorchargerutiltiesComp.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }
        doctorchargerutiltiesComp.setGridColor(new java.awt.Color(204, 204, 255));
        doctorchargerutiltiesComp.setCellSelectionEnabled(false);
        doctorchargerutiltiesComp.setColumnSelectionAllowed(false);
        doctorchargerutiltiesComp.setRowHeight(20);
        doctorchargerutiltiesComp.setSelectionBackground(Color.LIGHT_GRAY);
        doctorchargerutiltiesComp.setSelectionForeground(Color.RED);
        doctorchargerutiltiesComp.revalidate();
        doctorchargerutiltiesComp.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                final int i = doctorchargerutiltiesComp.getSelectedRow();
                final int j = doctorchargerutiltiesComp.getSelectedColumn();
                final int rowCnt = doctorchargerutiltiesComp.getRowCount();
                if (i == 0 && j == 0) {
                   GetChargesDetails g = new GetChargesDetails(doctorchargerutiltiesComp);
                    g.requestFocusInWindow();
                     g.setVisible(true);
                    g.requestFocus();
                }
                int k = 0;
                for (k = 0; k < rowCnt; k++) {
                    doctorchargerutiltiesComp.getModel().setValueAt(k + 1, k, 0);
                }
            }
        });
        doctorchargerutiltiesComp.addKeyListener(new KeyListener() {

            @Override
            public void keyReleased(KeyEvent e) {
                final int i = doctorchargerutiltiesComp.getSelectedRow();
                final int j = doctorchargerutiltiesComp.getSelectedColumn();
                doctorCommisionCalculations();

                if (e.getKeyCode() == 10) {
                    InputMap im = doctorchargerutiltiesComp.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                    KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                    KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                    im.put(enter, im.get(tab));
                    doctorCommisionCalculations();
                }
                if (i >= 0) {
                    doctorchargerutiltiesComp.getModel().setValueAt(i + 1, i, 0);
                    if (e.getKeyCode() == 10 || e.getKeyCode() == 9) {
                        InputMap im = doctorchargerutiltiesComp.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                        KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                        KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                        im.put(enter, im.get(tab));
                    }
                    if ((j == 1) && e.getKeyCode() != 27 || (j == 1 && e.getKeyCode() == KeyEvent.VK_TAB && e.getKeyCode() != 27)) {
                        GetChargesDetails g = new GetChargesDetails(doctorchargerutiltiesComp);
                        g.requestFocusInWindow();
                        g.setVisible(true);
                        g.requestFocus();
                    }
                  
                    if (i == doctorchargerutiltiesComp.getModel().getRowCount() - 1) {
                        addRow();
                    }
                }
                doctorCommisionCalculations();
            }

            @Override
            public void keyPressed(KeyEvent e) {
                final int i = doctorchargerutiltiesComp.getSelectedRow();
                final int j = doctorchargerutiltiesComp.getSelectedColumn();
                InputMap im = doctorchargerutiltiesComp.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                if (e.getKeyCode() == 10) {
                    KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                    KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                    im.put(enter, im.get(tab));
                }
                if (e.getKeyCode() == KeyEvent.VK_DELETE) {
                    doctorchargerutiltiesComp.getModel().setValueAt("", i, j);
                }
                if (e.getKeyCode() == KeyEvent.VK_ESCAPE) {
                }
            }
          
       @Override
            public void keyTyped(KeyEvent e) {
                 final int i = doctorchargerutiltiesComp.getSelectedRow();
                final int j = doctorchargerutiltiesComp.getSelectedColumn();
            }
        });




        return doctorchargerutiltiesComp;
    }


     public JComponent getScrollTable(JComponent jt) {
        doctorchargerutiltiesComp = (JTable) jt;
        doctorCharagesScrollPane.add(doctorchargerutiltiesComp);
        doctorCharagesScrollPane.setViewportView(doctorchargerutiltiesComp);
        return doctorCharagesScrollPane;
    }

    public void doctorCommisionCalculations() {
               final int rowCnt = doctorchargerutiltiesComp.getRowCount();
                  final int i1 = doctorchargerutiltiesComp.getSelectedRow();
                final int j1 = doctorchargerutiltiesComp.getSelectedColumn();

                 String item_code = "";
                    item_code = (String) doctorchargerutiltiesComp.getModel().getValueAt(i1, 1);
                    if (item_code != null && item_code.trim().length() > 0) {
                        Integer qt = 0;
                        Double selPrice = 0.0;
                        if (j1 == 3 || j1 == 4 || j1 == 5) {
                            qt = (Integer) doctorchargerutiltiesComp.getModel().getValueAt(i1, 4);
                            selPrice = (Double) doctorchargerutiltiesComp.getModel().getValueAt(i1, 3);
                            Double qtSelAmt = 0.0;
                            if (qt == null) {
                                qt = 0;
                            }
                            if (selPrice == null) {
                                selPrice = 0.0;
                            }
                            qtSelAmt = qt * selPrice;
                            doctorchargerutiltiesComp.getModel().setValueAt(qtSelAmt, i1, 5);
                        }
                        Double mar = 0.0;
                        String strMrp=""+doctorchargerutiltiesComp.getModel().getValueAt(i1, 6);
                        if(strMrp!=null && !strMrp.equals("null") && !strMrp.equals("")){
                        mar = Double.parseDouble(""+ doctorchargerutiltiesComp.getModel().getValueAt(i1, 6));
                        }
                        Double amt = 0.0;
                        amt = Double.parseDouble("0"+doctorchargerutiltiesComp.getModel().getValueAt(i1, 5));
                        Double chargeAmt = 0.0;
                        if (amt == null) {
                            amt = 0.0;
                        }
                        if (mar != null && mar > 0) {
                            chargeAmt = (amt / 100) * mar;
                        }
                        chargeAmt=Value.Round(chargeAmt, 2);
                        doctorchargerutiltiesComp.getModel().setValueAt(chargeAmt, i1, 7);
                    }

            finalChargeamount = 0.0;
                int k = 0;
                for (k = 0; k < rowCnt; k++) {
                    String itemcode1="";
                    itemcode1 = (String) doctorchargerutiltiesComp.getModel().getValueAt(k, 1);
                    if (itemcode1 != null && itemcode1.trim().length() > 0) {
                        Double bal = 0.0;
                        bal = Double.parseDouble("0"+ doctorchargerutiltiesComp.getModel().getValueAt(k, 7));

                        if (bal != null && bal > 0) {
                            finalChargeamount += bal;
                        }
                    }

                }
                finalChargeamount = Value.Round(finalChargeamount, 2);
        }
    public void focusSet() {
        doctorchargerutiltiesComp.requestFocus();
        doctorchargerutiltiesComp.changeSelection(0, 4, false, false);
        doctorchargerutiltiesComp.changeSelection(0, 0, false, false);
        doctorchargerutiltiesComp.getModel().setValueAt(1, 0, 0);
        doctorchargerutiltiesComp.setCellSelectionEnabled(true);
    }    

    public void clearAllValues() {
        DefaultTableModel model = (DefaultTableModel) doctorchargerutiltiesComp.getModel();
        model.getDataVector().removeAllElements();
        for (int i = 0; i < 12; i++) {
            addRow();
        }
        doctorchargerutiltiesComp.revalidate();
        doctorchargerutiltiesComp.clearSelection();
    }

    public void addRow() {
        DefaultTableModel model = (DefaultTableModel) doctorchargerutiltiesComp.getModel();
        Vector datas = new Vector();
        for (int i = 0; i < doctorchargerutiltiesComp.getModel().getColumnCount(); i++) {
            datas.addElement(null);
        }
        model.insertRow(doctorchargerutiltiesComp.getRowCount(), datas);
    }

    public void removeRow() {
        int i = doctorchargerutiltiesComp.getSelectedRow();
        int j = doctorchargerutiltiesComp.getSelectedColumn();
        int rows = doctorchargerutiltiesComp.getRowCount();
        if (i != -1) {
            DefaultTableModel model = (DefaultTableModel) doctorchargerutiltiesComp.getModel();
            if (rows == 1) {
                if (i == 0) {
                    model.removeRow(i);
                    for (int n = 0; n < initR; n++) {
                        addRow();
                    }
                    doctorchargerutiltiesComp.changeSelection(0, 0, false, false);
                }
            } else {
                model.removeRow(i);
                int rows1 = doctorchargerutiltiesComp.getRowCount();
                if (i + 1 != rows) {
                    for (int n = 0; n < rows1; n++) {
                        if (doctorchargerutiltiesComp.getModel().getValueAt(n, 0) == null); else {
                            doctorchargerutiltiesComp.getModel().setValueAt(n + 1, n, 0);
                        }
                    }
                    doctorchargerutiltiesComp.changeSelection(rows1 - 1, j, false, false);
                } else {
                    doctorchargerutiltiesComp.changeSelection(i - 1, j, false, false);
                }
            }
        } else {
            Alert.inform("Please select row to remove ...");
        }
    }

    public void clearData() {
        DefaultTableModel model = (DefaultTableModel) doctorchargerutiltiesComp.getModel();
        model.getDataVector().removeAllElements();
        doctorchargerutiltiesComp.revalidate();
         doctorchargerutiltiesComp.clearSelection();
    }

  

    public void addBasicRows() {
        for (int i = 0; i < 8; i++) {
            addRow();
        }
    }

    public String[][] getTableContenets() {
        int rowCount = doctorchargerutiltiesComp.getModel().getRowCount();
        int colCount = doctorchargerutiltiesComp.getModel().getColumnCount();
        String[][] values = new String[rowCount][colCount];
        for (int i = 0; i < rowCount; i++) {
            for (int j = 0; j < colCount; j++) {
                values[i][j] = "" + doctorchargerutiltiesComp.getModel().getValueAt(i, j);
            }
        }
        return values;
    }

    public int totalRow() {
        int tot = 0;
        for (int i = 0; i < doctorchargerutiltiesComp.getModel().getRowCount(); i++) {
            if (doctorchargerutiltiesComp.getModel().getValueAt(i, 2) != null) {
                tot++;
            }
        }
        return tot;
    }

    public void loadDoctorCommisonTable(String dchid) {
        salesId = "";
        try {
            int i = 0;
            clearData();
            //DoctorChargesController Call

            Doctor doctorChargesController = (Doctor) RegistryFactory.getClientStub(RegistryConstants.Doctor) ;
            DoctorChargesModel doctorChargesModels=new DoctorChargesModel();
            doctorChargesModels.setDoctorCommisionName(null);
            doctorChargesModels.setChargeId(dchid);
            DoctorChargesModel doctorChargesModel=(DoctorChargesModel) doctorChargesController.viewDoctorCharges(doctorChargesModels);
            List<DoctorChargesModel> modelList=doctorChargesModel.getChargesModelList();
            while (i<modelList.size()) {
                doctorChargesModel=modelList.get(i);
                addRow();
                doctorchargerutiltiesComp.getModel().setValueAt(i + 1, i, 0);
                doctorchargerutiltiesComp.getModel().setValueAt(doctorChargesModel.getItemCode(), i, 1);
                doctorchargerutiltiesComp.getModel().setValueAt(doctorChargesModel.getItemName(), i, 2);
                doctorchargerutiltiesComp.getModel().setValueAt(doctorChargesModel.getSellingPrice(), i, 3);
                doctorchargerutiltiesComp.getModel().setValueAt(doctorChargesModel.getQuantity(), i, 4);
                doctorchargerutiltiesComp.getModel().setValueAt(doctorChargesModel.getAmount(), i, 5);
                doctorchargerutiltiesComp.getModel().setValueAt(doctorChargesModel.getDoctorMargin(), i, 6);
                doctorchargerutiltiesComp.getModel().setValueAt(doctorChargesModel.getChargeAmount(), i, 7);
                finalChargeamount = doctorChargesModel.getTotalAmount();
                i++;
            }
            finalChargeamount = Value.Round(finalChargeamount, 2);
             doctorchargerutiltiesComp.clearSelection();
        } catch (Exception e) {
            String msg = "Class : DoctorCommissionTable  Method : loadDoctorCommisonTable()  = " + e.getMessage();
            log.debug(msg);
        }
    }
}
