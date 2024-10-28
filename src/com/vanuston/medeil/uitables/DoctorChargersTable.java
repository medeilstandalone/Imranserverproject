package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.Doctor;
import com.vanuston.medeil.model.DoctorChargesModel;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import java.awt.Font;
import java.awt.Color;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
//import java.sql.ResultSet;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.util.List;
import java.util.Vector;
import java.util.logging.Level;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;

public class DoctorChargersTable {

    static Logger log = Logger.getLogger(DoctorChargersTable.class, "Utilities");
    Doctor doctorChargesController ;
    public DoctorChargersTable()  {
        try {
            doctorChargesController = (Doctor) RegistryFactory.getClientStub(RegistryConstants.Doctor);
        } catch (RemoteException ex) {
            log.debug("Err in DoctorChargersTable Remote " + ex.getMessage());
        } catch (NotBoundException ex) {
            log.debug("Err in DoctorChargersTable notNbound " + ex.getMessage());
        }
    }    
    public static JTable doctorViewChargeTable;
    public static JScrollPane doctorViewChargeScrollPane = new JScrollPane();
    public static KeyStroke back = KeyStroke.getKeyStroke(KeyEvent.VK_LEFT, KeyEvent.CTRL_MASK);
    public static String chargeId;


    public JComponent createTable(final int initRow, Object[] colName, Class[] type, boolean[] canEdit, int[] width) {
        final Class[] types = type;
        final boolean[] canEditCols = canEdit;
        final int[] colWidth = width;
        doctorViewChargeTable = new JTable();
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
            doctorViewChargeTable.setModel(new javax.swing.table.DefaultTableModel(data, cols) {

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
            String msg = " Class : DoctorChargersTable    Method   : CreateTable()  = " + ex.getMessage();
            log.debug(msg);
        }
        doctorViewChargeTable.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        doctorViewChargeTable.getTableHeader().setBackground(new Color(226, 238, 244));
        doctorViewChargeTable.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
        doctorViewChargeTable.setShowGrid(true);
        doctorViewChargeTable.getTableHeader().setReorderingAllowed(false);
        for (int i = 0; i < len; i++) {
            doctorViewChargeTable.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }
        doctorViewChargeTable.setGridColor(new java.awt.Color(204, 204, 255));
        doctorViewChargeTable.setCellSelectionEnabled(true);
        doctorViewChargeTable.setColumnSelectionAllowed(false);
        doctorViewChargeTable.setRowSelectionAllowed(false);
        doctorViewChargeTable.setColumnSelectionAllowed(false);
        doctorViewChargeTable.setRowHeight(20);
        doctorViewChargeTable.setSelectionBackground(Color.LIGHT_GRAY);
        doctorViewChargeTable.setSelectionForeground(Color.RED);
        doctorViewChargeTable.revalidate();
        doctorViewChargeTable.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        doctorViewChargeTable.getTableHeader().setBackground(new Color(226, 238, 244));
        doctorViewChargeTable.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
        doctorViewChargeTable.setShowGrid(true);
        doctorViewChargeTable.getTableHeader().setReorderingAllowed(false);
        doctorViewChargeTable.getInputMap().put(back, "actionF2");
        doctorViewChargeTable.getActionMap().put("actionF2", new AbstractAction() {

            @Override
            public void actionPerformed(ActionEvent e) {
                doctorViewChargeTable.transferFocus();
            }
        });
        loadDoctorChargers();
        doctorViewChargeTable.addKeyListener(new KeyListener() {

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

        doctorViewChargeTable.addMouseListener(new MouseListener() {

            @Override
            public void mouseClicked(MouseEvent e) {
                final int i = doctorViewChargeTable.getSelectedRow();          
                chargeId = (String) doctorViewChargeTable.getValueAt(i, 0);
            }

            @Override
            public void mousePressed(MouseEvent e) {
            }

            @Override
            public void mouseReleased(MouseEvent e) {
            }

            @Override
            public void mouseEntered(MouseEvent e) {
            }

            @Override
            public void mouseExited(MouseEvent e) {
            }
        });


        return doctorViewChargeTable;
    }


    public static void viewDoctorChargersCalculations() {
		 final int i = doctorViewChargeTable.getSelectedRow();
                chargeId = (String) doctorViewChargeTable.getValueAt(i, 0);

}


	public static JComponent getScrollTable(JComponent jt) {
        doctorViewChargeTable = (JTable) jt;
        doctorViewChargeScrollPane.add(doctorViewChargeTable);
        doctorViewChargeScrollPane.setViewportView(doctorViewChargeTable);
        return doctorViewChargeScrollPane;
    }
    public int loadDoctorChargers() {
        chargeId = "";
        int listSize = 0 ;
        try {
            String sql = "";
            int i = 0;
            clearData();

            DoctorChargesModel doctorChargesModel=new DoctorChargesModel();
            doctorChargesModel.setDoctorCommisionName(null);
            doctorChargesModel.setChargeId(null);
            doctorChargesModel=(DoctorChargesModel) doctorChargesController.viewDoctorCharges(doctorChargesModel);
            List<DoctorChargesModel> chargeModelList=doctorChargesModel.getChargesModelList();
            listSize = chargeModelList.size ();
            while (i< chargeModelList.size() && chargeModelList.size() < 12) {
                addRow();
                doctorChargesModel=chargeModelList.get(i);
                doctorViewChargeTable.getModel().setValueAt(doctorChargesModel.getChargeId(), i, 0);
                doctorViewChargeTable.getModel().setValueAt(DateUtils.normalFormatDate(doctorChargesModel.getChargeDate()), i, 1);
                doctorViewChargeTable.getModel().setValueAt(doctorChargesModel.getDoctorcommisionCode(), i, 2);
                doctorViewChargeTable.getModel().setValueAt(doctorChargesModel.getDoctorCommisionName(), i, 3);
                doctorViewChargeTable.getModel().setValueAt(DateUtils.normalFormatDate(doctorChargesModel.getCommisionStartDate()), i, 4);
                doctorViewChargeTable.getModel().setValueAt(DateUtils.normalFormatDate(doctorChargesModel.getCommisionEndDate()), i, 5);
                doctorViewChargeTable.getModel().setValueAt(doctorChargesModel.getTotalAmount(), i, 6);
                i++;
            }
            if (i == 0) {
                addBasicRows();
            }
             doctorViewChargeTable.clearSelection();
        } catch (Exception e) {
            
            String msg = " Class : DoctorChargersTable  Method  : loadDoctorChargers()  = " + e.getMessage();
            log.debug(msg);
        }
        return listSize ;
    }

    public int loadDoctorChargers(String DoctorName) {
        chargeId = "";
        int listSize = 0 ;
        try {
            String sql = "";
            int i = 0;
            clearData();

            DoctorChargesModel doctorChargesModel=new DoctorChargesModel();
            doctorChargesModel.setDoctorCommisionName(DoctorName);

            doctorChargesModel.setChargeId(null);
            doctorChargesModel=(DoctorChargesModel) doctorChargesController.viewDoctorCharges(doctorChargesModel);
            List<DoctorChargesModel> chargeModelList=doctorChargesModel.getChargesModelList();
            listSize = chargeModelList.size () ;
            while (i < chargeModelList.size ()) {
                addRow();
                doctorChargesModel=chargeModelList.get(i);
                doctorViewChargeTable.getModel().setValueAt(doctorChargesModel.getChargeId(), i, 0);
                doctorViewChargeTable.getModel().setValueAt(DateUtils.normalFormatDate(doctorChargesModel.getChargeDate()), i, 1);
                doctorViewChargeTable.getModel().setValueAt(doctorChargesModel.getDoctorcommisionCode(), i, 2);
                doctorViewChargeTable.getModel().setValueAt(doctorChargesModel.getDoctorCommisionName(), i, 3);
                doctorViewChargeTable.getModel().setValueAt(DateUtils.normalFormatDate(doctorChargesModel.getCommisionStartDate()), i, 4);
                doctorViewChargeTable.getModel().setValueAt(DateUtils.normalFormatDate(doctorChargesModel.getCommisionEndDate()), i, 5);
                doctorViewChargeTable.getModel().setValueAt(doctorChargesModel.getTotalAmount(), i, 6);
                i++;
            }
            if (i == 0) {
                addBasicRows();
            }
             doctorViewChargeTable.clearSelection();
        } catch (Exception e) {
            String msg = " Class : DoctorChargersTable  Method  : loadDoctorChargers()  = " + e.getMessage();
            log.debug(msg);
        }
        return listSize ;
    }

    public int loadDoctorChargersALL() {
        chargeId = "";
        int listSize = 0 ;
        try {
            String sql = "";
            int i = 0;
            clearData();

            DoctorChargesModel doctorChargesModel=new DoctorChargesModel();
            doctorChargesModel.setDoctorCommisionName(null);
            doctorChargesModel.setChargeId(null);
            doctorChargesModel=(DoctorChargesModel) doctorChargesController.viewDoctorCharges(doctorChargesModel);
            List<DoctorChargesModel> chargeModelList=doctorChargesModel.getChargesModelList();
            listSize = chargeModelList.size () ;
            while (i < chargeModelList.size ()) {
                addRow();
                doctorChargesModel=chargeModelList.get(i);
                doctorViewChargeTable.getModel().setValueAt(doctorChargesModel.getChargeId(), i, 0);
                doctorViewChargeTable.getModel().setValueAt(DateUtils.normalFormatDate(doctorChargesModel.getChargeDate()), i, 1);
                doctorViewChargeTable.getModel().setValueAt(doctorChargesModel.getDoctorcommisionCode(), i, 2);
                doctorViewChargeTable.getModel().setValueAt(doctorChargesModel.getDoctorCommisionName(), i, 3);
                doctorViewChargeTable.getModel().setValueAt(DateUtils.normalFormatDate(doctorChargesModel.getCommisionStartDate()), i, 4);
                doctorViewChargeTable.getModel().setValueAt(DateUtils.normalFormatDate(doctorChargesModel.getCommisionEndDate()), i, 5);
                doctorViewChargeTable.getModel().setValueAt(doctorChargesModel.getTotalAmount(), i, 6);
                i++;
            }
            if (i == 0) {
                addBasicRows();
            }
             doctorViewChargeTable.clearSelection();

        } catch (Exception e) {

            String msg = " Class : DoctorChargersTable  Method  : loadDoctorChargers()  = " + e.getMessage();
            log.debug(msg);
        }
        return listSize ;
    }

    public static void addRow() {
        DefaultTableModel model = (DefaultTableModel) doctorViewChargeTable.getModel();
        Vector datas = new Vector();
        for (int i = 0; i < doctorViewChargeTable.getModel().getColumnCount(); i++) {
            datas.addElement(null);
        }
        model.insertRow(doctorViewChargeTable.getRowCount(), datas);
    }

    public static void removeRow() {
        int i = doctorViewChargeTable.getSelectedRow();
        if (i != -1) {
            DefaultTableModel model = (DefaultTableModel) doctorViewChargeTable.getModel();
            model.removeRow(i);
            doctorViewChargeTable.getModel().setValueAt(i, i - 1, 0);
            doctorViewChargeTable.changeSelection(i - 1, 0, false, false);
        } else {
            JOptionPane.showMessageDialog(doctorViewChargeTable, "Please select row to remove ...");
        }
    }

    public static void clearData() {
        DefaultTableModel model = (DefaultTableModel) doctorViewChargeTable.getModel();
        model.getDataVector().removeAllElements();
        doctorViewChargeTable.revalidate();
    }

    public static void keyFunctions() {
    }

    public static void addBasicRows() {
        for (int i = 0; i < 15; i++) {
            addRow();
        }
    }
}
