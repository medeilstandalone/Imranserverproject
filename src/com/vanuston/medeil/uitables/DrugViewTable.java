package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;

import com.vanuston.medeil.implementation.Drug;
import com.vanuston.medeil.model.DrugModel;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.InputEvent;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Vector;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableColumnModel;

import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;

public class DrugViewTable extends JTable {

    static Logger log = Logger.getLogger(DrugViewTable.class, "Masters");
    public static JTable drugViewTable;
    public static JScrollPane stockStScrollPane = new JScrollPane();
    public static KeyStroke calDrugViewTable = KeyStroke.getKeyStroke(KeyEvent.VK_T, KeyEvent.CTRL_MASK);
    public static KeyStroke callDrugfocusOut = KeyStroke.getKeyStroke(KeyEvent.VK_SPACE, KeyEvent.CTRL_MASK);
    public static String drugId;
    public static String drugSetId = "-1";
    public static HashMap m_tDataAwareColorMap = new HashMap();
    public static KeyStroke save = KeyStroke.getKeyStroke(KeyEvent.VK_F3, 0);
    public static KeyStroke reset = KeyStroke.getKeyStroke(KeyEvent.VK_F4, 0);
    public static KeyStroke del = KeyStroke.getKeyStroke(KeyEvent.VK_F5, 0);
    public static KeyStroke update = KeyStroke.getKeyStroke(KeyEvent.VK_F7, 0);
    public static KeyStroke edit = KeyStroke.getKeyStroke(KeyEvent.VK_F6, 0);
    public static KeyStroke rR = KeyStroke.getKeyStroke(KeyEvent.VK_F12, 0);
    public static KeyStroke can = KeyStroke.getKeyStroke(KeyEvent.VK_F8, 0);
    public static KeyStroke back = KeyStroke.getKeyStroke(KeyEvent.VK_LEFT, KeyEvent.CTRL_MASK);
    // public static KeyStroke ctrlc = KeyStroke.getKeyStroke(KeyEvent.VK_C, KeyEvent.CTRL_MASK);

    Drug drugController;

    public DrugViewTable() throws RemoteException, NotBoundException {
        drugController = (Drug) RegistryFactory.getClientStub(RegistryConstants.Drug);
    }
    public JComponent createTable(final int initRow, Object[] colName, Class[] type, boolean[] canEdit, int[] width) {
        final Class[] types = type;
        final boolean[] canEditCols = canEdit;
        final int[] colWidth = width;
        drugViewTable = new JTable();
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
            drugViewTable.setModel(new javax.swing.table.DefaultTableModel(data, cols) {

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
            String msg = "Class : DrugViewTable  Method : createTable ()   = " + ex.getMessage();
            log.debug(msg);
        }
//        map.removeKeyStrokeBinding(ctrlc);
        drugViewTable.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        drugViewTable.getTableHeader().setBackground(new Color(226, 238, 244));
        drugViewTable.getTableHeader().setFont(new Font("Arial", Font.BOLD, 16));
        drugViewTable.setRowSelectionAllowed(true);
        drugViewTable.setShowGrid(true);
        drugViewTable.getTableHeader().setReorderingAllowed(false);
        for (int i = 0; i < len; i++) {
            drugViewTable.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }
        drugViewTable.setGridColor(new java.awt.Color(204, 204, 255));
        drugViewTable.setCellSelectionEnabled(false);
        drugViewTable.setColumnSelectionAllowed(false);
        drugViewTable.setRowSelectionAllowed(true);
        drugViewTable.setRowSelectionInterval(0, 1);
// this line added for 26-11-2011 for disable copy option////////////////////////////////////////////////////

        AbstractAction disabled = new AbstractAction() {

            public boolean isEnabled() {
                return false;
            }

            public void actionPerformed(ActionEvent e) {
            }
        };



        drugViewTable.getInputMap(JComponent.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT).put(KeyStroke.getKeyStroke(KeyEvent.VK_C, KeyEvent.CTRL_MASK), "none");
        drugViewTable.getActionMap().put("none", disabled);
/////////////////////////////////////////////////////////////////////



        drugViewTable.getInputMap().put(save, "actionF2");
        drugViewTable.getInputMap().put(edit, "actionF2");
        drugViewTable.getInputMap().put(reset, "actionF2");
        drugViewTable.getInputMap().put(can, "actionF2");
        drugViewTable.getInputMap().put(update, "actionF2");
        drugViewTable.getInputMap().put(del, "actionF2");
        drugViewTable.getInputMap().put(back, "actionF2");
        drugViewTable.getInputMap().put(rR, "actionF2");
        drugViewTable.getActionMap().put("actionF2", new AbstractAction() {

            @Override
            public void actionPerformed(ActionEvent e) {
                drugViewTable.transferFocus();
            }
        });
        drugViewTable.setRowHeight(20);
        drugViewTable.setSelectionBackground(Color.LIGHT_GRAY);
        drugViewTable.setSelectionForeground(Color.RED);
        drugViewTable.revalidate();
       //- loaddDrugInformationValues();
        drugViewTable.addKeyListener(new KeyListener() {

            @Override
            public void keyReleased(KeyEvent e) {
            }

            @Override
            public void keyTyped(KeyEvent e) {
            }

            @Override
            public void keyPressed(KeyEvent e) {
            }
        });

        drugViewTable.addMouseListener(new MouseListener() {

            @Override
            public void mouseClicked(MouseEvent e) {
              viewDrugCalculations();
            }

            @Override
            public void mousePressed(MouseEvent e) {
            }

            @Override
            public void mouseReleased(MouseEvent e) {
             viewDrugCalculations();
            }

            @Override
            public void mouseEntered(MouseEvent e) {
            }

            @Override
            public void mouseExited(MouseEvent e) {
            }
        });
        return drugViewTable;
    }

    public JComponent getScrollTable(JComponent jt) {
        drugViewTable = (JTable) jt;
        stockStScrollPane.add(drugViewTable);
        stockStScrollPane.setViewportView(drugViewTable);
        return stockStScrollPane;
    }

    public  void viewDrugCalculations() {
        final int i = drugViewTable.getSelectedRow();
        drugId = (String) drugViewTable.getValueAt(i, 0);
        drugSetId = drugId;

    }

    public void loaddDrugInformationValues() {
        try {
            clearData();
            DrugModel drugBean = new DrugModel();
            //Drug dc = new DrugController();
            drugBean.setPassVale(1);
            ArrayList<DrugModel> drugList = drugController.viewAllRecord(drugBean);
            for (int i = 0; i < drugList.size(); i++) {
                drugBean = new DrugModel();
                drugBean = drugList.get(i);
                addRow();
                drugViewTable.getModel().setValueAt(drugBean.getDrug_code(), i, 0);
                drugViewTable.getModel().setValueAt(drugBean.getDosage().equals("") ? drugBean.getDrug_name():drugBean.getDrug_name()+"_"+drugBean.getDosage(), i, 1);
                drugViewTable.getModel().setValueAt(drugBean.getMfr_name(), i, 2);
                drugViewTable.getModel().setValueAt(drugBean.getVAT_percentage(), i, 3);
                drugViewTable.getModel().setValueAt(drugBean.getFormulation(), i, 4);
                drugViewTable.getModel().setValueAt(drugBean.getMrp(), i, 5);
            }


//            String sql = "";
//            int i = 0;
//            ResultSet rs = null;
//            sql = "SELECT  *  FROM drugtable where dru_flag_id!=3  order by itemcode desc limit 0,8";
//            rs = DBConnection.getStatement().executeQuery(sql);
//            while (rs.next()) {
//                addRow();
//                drugViewTable.getModel().setValueAt(rs.getString("item_id"), i, 0);
//                drugViewTable.getModel().setValueAt(rs.getString("itemname"), i, 1);
//                drugViewTable.getModel().setValueAt(rs.getString("company_name"), i, 2);
//                drugViewTable.getModel().setValueAt(rs.getString("dosage"), i, 3);
//                drugViewTable.getModel().setValueAt(rs.getString("formulation_length"), i, 4);
//                drugViewTable.getModel().setValueAt(rs.getString("mrp"), i, 5);
//                i++;
//            }
            drugViewTable.clearSelection();
        } catch (Exception e) {
            
            String msg = "Class : DrugViewTable  Method : loadDrugInformationValues ()   = " + e.getMessage();
            log.debug(msg);            
        }
    }

    public String searchDrugInformationValues(String name, Integer type) {
        clearData();
        String valu = "No Products Found";
        int jk = 0;
        drugSetId = "-1";
        try {
            DrugModel drugBean = new DrugModel();

           // Drug dc;// = new DrugController();
            ArrayList<DrugModel> drugList;

            if (type == 0) {
                drugBean.setPassVale(2);
                drugBean.setDrug_name(name);
                //dc = new DrugController();
                drugList = drugController.viewAllRecord(drugBean);

            } else if(type == 1){
                drugBean.setPassVale(3);
                drugBean.setFormulation(name);
                //dc = new DrugController();
                drugList = drugController.viewAllRecord(drugBean);
            }else if(type == 2){
                drugBean.setPassVale(21);
                drugBean.setGeneric_name(name);
                //dc = new DrugController();
                drugList = drugController.viewAllRecord(drugBean);
            }
            else if(type == 3){
                drugBean.setPassVale(22);
                drugBean.setTherapeuticName(name);
                //dc = new DrugController();
                drugList = drugController.viewAllRecord(drugBean);
            }
            else{
                drugBean.setPassVale(23);
                drugBean.setIndication(name);
                //dc = new DrugController();
                drugList = drugController.viewAllRecord(drugBean);
            }

            for (int i = 0; i < drugList.size(); i++) {
                drugBean = drugList.get(i);
                addRow();
                jk++;
                drugViewTable.getModel().setValueAt(drugBean.getDrug_code(), i, 0);
                drugViewTable.getModel().setValueAt(drugBean.getDosage().equals("") ? drugBean.getDrug_name():drugBean.getDrug_name()+"_"+drugBean.getDosage(), i, 1);
                drugViewTable.getModel().setValueAt(drugBean.getMfr_name(), i, 2);
                drugViewTable.getModel().setValueAt(drugBean.getVAT_percentage(), i, 3);
                drugViewTable.getModel().setValueAt(drugBean.getFormulation(), i, 4);
                drugViewTable.getModel().setValueAt(drugBean.getMrp(), i, 5);
            }
//            ResultSet rs = null;
//            rs = DBConnection.getStatement().executeQuery(sql1);
//            while (rs.next()) {
//                addRow();
//                jk++;
//                drugViewTable.getModel().setValueAt(rs.getString("item_id"), i, 0);
//                drugViewTable.getModel().setValueAt(rs.getString("itemname"), i, 1);
//                drugViewTable.getModel().setValueAt(rs.getString("company_name"), i, 2);
//                drugViewTable.getModel().setValueAt(rs.getString("dosage"), i, 3);
//                drugViewTable.getModel().setValueAt(rs.getString("formulation_length"), i, 4);
//                drugViewTable.getModel().setValueAt(rs.getString("mrp"), i, 5);
//                i++;
//            }
            if (jk > 0) {
                valu = jk + "  Products Found";
            }
            drugViewTable.clearSelection();
        } catch (Exception e) {
            String msg = "Class : DrugViewTable  Method : searchDrugInformationValues ()   = " + e.getMessage();
            log.debug(msg);
        }
        return valu;
    }

    public static String searchDrugInformationValues(String name) {
//        drugSetId = "-1";
//        String valu = "No Products Found";
//        int j = 0;
//        try {
//            String sql1 = "";
//            int i = 0;
//            sql1 = "SELECT  *  FROM drugtable  where dru_flag_id!=3  and itemname like'" + name + "%'";
//            ResultSet rs = null;
//            rs = DBConnection.getStatement().executeQuery(sql1);
//            while (rs.next()) {
//                addRow();
//                j++;
//                drugViewTable.getModel().setValueAt(rs.getString("item_id"), i, 0);
//                drugViewTable.getModel().setValueAt(rs.getString("itemname"), i, 1);
//                drugViewTable.getModel().setValueAt(rs.getString("company_name"), i, 2);
//                drugViewTable.getModel().setValueAt(rs.getString("dosage"), i, 3);
//                drugViewTable.getModel().setValueAt(rs.getString("formulation_length"), i, 4);
//                drugViewTable.getModel().setValueAt(rs.getString("mrp"), i, 5);
//                i++;
//            }
//            if (j > 0) {
//                valu = j + "  Products Found";
//            } else {
//                clearData();
//            }
//            drugViewTable.clearSelection();
//        } catch (Exception e) {
//            String msg = "Class : DrugViewTable  Method : searchDrugInformationValues ()   = " + e.getMessage();
//            log.debug(msg);
//        }
//        return valu;
        return "";
    }

    public static void addRow() {
        DefaultTableModel model = (DefaultTableModel) drugViewTable.getModel();
        Vector datas = new Vector();
        for (int i = 0; i < drugViewTable.getModel().getColumnCount(); i++) {
            datas.addElement(null);
        }
        model.insertRow(drugViewTable.getRowCount(), datas);
    }



    public static void removeRow() {
        int i = drugViewTable.getSelectedRow();
        if (i != -1) {
            DefaultTableModel model = (DefaultTableModel) drugViewTable.getModel();
            model.removeRow(i);
            drugViewTable.getModel().setValueAt(i, i + 1, 0);
            drugViewTable.changeSelection(i + 1, 0, false, false);
        } else {
            JOptionPane.showMessageDialog(drugViewTable, "Please select row to remove ...");
        }
    }

    public static int clearDatas() {
        int i = 1;
        DefaultTableModel model = (DefaultTableModel) drugViewTable.getModel();
        model.getDataVector().removeAllElements();
        drugViewTable.revalidate();
        addBasicRows();
        return i;
    }

    public static void clearData() {
        DefaultTableModel model = (DefaultTableModel) drugViewTable.getModel();
        model.getDataVector().removeAllElements();
        drugViewTable.revalidate();
    }

    public static void addBasicRows() {
        for (int i = 0; i < 8; i++) {
            addRow();
        }
    }
}
