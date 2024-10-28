package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.Sales;
import com.vanuston.medeil.model.SalesModel;
import java.rmi.NotBoundException;
import java.sql.*;
import javax.swing.*;
import java.awt.Color;
import java.awt.Font;
import java.util.Vector;
import java.awt.event.ActionEvent;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.util.ArrayList;
import java.util.List;
import javax.swing.table.DefaultTableModel;
import com.vanuston.medeil.util.DecimalFormatRenderer;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.RegistryConstants;
import java.rmi.RemoteException;

public class SalesMaintainLoadTable {

    Sales salesController;

    public SalesMaintainLoadTable() throws RemoteException, NotBoundException {
        salesController = (Sales) RegistryFactory.getClientStub(RegistryConstants.Sales);
    }

    public JTable SalesMaintainLoad;
    public JScrollPane scrollPane = new JScrollPane();
    public int totQty = 0;
    public int totItems = 0;
    public double totAmt = 0.00;
    public double totDistAmt = 0.0;
    public double totVATAmt = 0.0;
    public int totPurcQty = 0;
    public int totPurcItems = 0;
    public double totPurcAmt = 0.00;
    public double totPurcDistAmt = 0.0;
    public double totPurcVAT4Amt = 0.0;
    public double totPurcVAT12Amt = 0.0;
    public double amt = 0.00;
    public static String invoice;
    public static String typ;
    public static int salesCount;
    public static double salesAmount;
    public static Logger log = Logger.getLogger(SalesMaintainLoadTable.class, "Sales");
    public KeyStroke edit = KeyStroke.getKeyStroke(KeyEvent.VK_F6, 0);
    public  KeyStroke can = KeyStroke.getKeyStroke(KeyEvent.VK_F8, 0);
    public  KeyStroke print = KeyStroke.getKeyStroke(KeyEvent.VK_F2, 0);
    
    SalesModel sales = new SalesModel();

    public JComponent createViewTable(final int col, Object[] colName, Class[] type, boolean[] canEdit, int[] width) {
        final Class[] types = type;
        final boolean[] canEditCols = canEdit;
        final int[] colWidth = width;
        SalesMaintainLoad = new JTable();
        Vector cols = new Vector();
        Vector data = new Vector();
        int len = colName.length;
        for (int i = 1; i <= col; i++) {
            Vector c = new Vector();
            for (int j = 0; j < len; j++) {
                c.addElement(null);
            }
            data.addElement(c);
        }
        for (int i = 0; i < len; i++) {
            cols.addElement(colName[i]);
        }
        try {
            SalesMaintainLoad.setModel(new javax.swing.table.DefaultTableModel(data, cols) {

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
        } catch (Exception e) {
            String msg = "Class : Sales Maintanance  Method : createViewTable()   = "+e.getMessage();
            log.debug(msg);
        }
        SalesMaintainLoad.getColumnModel().getColumn(6).setCellRenderer(new DecimalFormatRenderer());
        SalesMaintainLoad.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        SalesMaintainLoad.getTableHeader().setBackground(new Color(226, 238, 244));
        SalesMaintainLoad.getTableHeader().setFont(new Font("Arial", Font.BOLD, 16));
        SalesMaintainLoad.setShowGrid(true);
        SalesMaintainLoad.getTableHeader().setReorderingAllowed(false);
        SalesMaintainLoad.setSelectionMode(0);
        SalesMaintainLoad.setDragEnabled(false);
        for (int i = 0; i < len; i++) {
            SalesMaintainLoad.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }
        SalesMaintainLoad.addKeyListener(new KeyAdapter() {

            @Override
            public void keyReleased(KeyEvent e) {
            }

            @Override
            public void keyPressed(KeyEvent e) {
               final int i = SalesMaintainLoad.getSelectedRow();
               if (SalesMaintainLoad.getModel().getValueAt(i, 0) != null && SalesMaintainLoad.getModel().getValueAt(i, 1) != null) {
                    invoice = (String) SalesMaintainLoad.getModel().getValueAt(i, 0);
                    typ = (String) SalesMaintainLoad.getModel().getValueAt(i, 2);
                    if (typ.equals("Counter Bill")) {
                        typ = "Account";
                    }
                }
                else {
                    invoice="";
                    typ="";
                }
            }
        });

        SalesMaintainLoad.addMouseListener(new MouseAdapter() {

            @Override
            public void mouseClicked(MouseEvent e) {
                final int i = SalesMaintainLoad.getSelectedRow();
                if (SalesMaintainLoad.getModel().getValueAt(i, 0) != null && SalesMaintainLoad.getModel().getValueAt(i, 1) != null) {
                    invoice = (String) SalesMaintainLoad.getModel().getValueAt(i, 0);
                    typ = (String) SalesMaintainLoad.getModel().getValueAt(i, 2);
                    if (typ.equals("Counter Bill")) {
                        typ = "Account";
                    }
                }
                else {
                    invoice="";
                    typ="";
                }
            }
        });

        SalesMaintainLoad.getInputMap().put(edit, "action");
        SalesMaintainLoad.getInputMap().put(can, "action");
        SalesMaintainLoad.getInputMap().put(print, "action");
        SalesMaintainLoad.getActionMap().put("action", new AbstractAction() {

            @Override
            public void actionPerformed(ActionEvent e) {
                SalesMaintainLoad.transferFocus();
            }
        });
        SalesMaintainLoad.setGridColor(new java.awt.Color(204, 204, 255));
        SalesMaintainLoad.setCellSelectionEnabled(false);
        SalesMaintainLoad.setRowSelectionAllowed(true);
        SalesMaintainLoad.setRowHeight(20);
        SalesMaintainLoad.setSelectionBackground(Color.LIGHT_GRAY);
        SalesMaintainLoad.setSelectionForeground(Color.RED);
        SalesMaintainLoad.revalidate();
	return SalesMaintainLoad;
    }
    public JComponent getScrollTable(JComponent jt) {
        SalesMaintainLoad = (JTable) jt;
        scrollPane.add(SalesMaintainLoad);
        scrollPane.setViewportView(SalesMaintainLoad);
        return scrollPane;
    }

    public void addRow() {
        DefaultTableModel model = (DefaultTableModel) SalesMaintainLoad.getModel();
        Vector datas = new Vector();
        for (int i = 1; i < SalesMaintainLoad.getModel().getColumnCount(); i++) {
            datas.addElement(null);
        }
        model.insertRow(SalesMaintainLoad.getRowCount(), datas);
    }

    public void removeRow() {
        int i = SalesMaintainLoad.getSelectedRow();
        if (i != -1) {
            DefaultTableModel model = (DefaultTableModel) SalesMaintainLoad.getModel();
            model.removeRow(i);
            SalesMaintainLoad.getModel().setValueAt(i, i - 1, 0);
            SalesMaintainLoad.changeSelection(i - 1, 0, false, false);
        } else {
            JOptionPane.showMessageDialog(null, "Please select row to remove...");
        }
    }

    public void clearData() {
        System.out.println("run....");
        DefaultTableModel model = (DefaultTableModel) SalesMaintainLoad.getModel();
      //  model.getDataVector().removeAllElements();old
        model.setRowCount(0);
        for(int i=0;i<15;i++) {
        addRow();
        }
        SalesMaintainLoad.revalidate();
    }

    public void focusSet(int row, int col) {
        SalesMaintainLoad.requestFocus();
        SalesMaintainLoad.changeSelection(row, col, false, false);
        SalesMaintainLoad.setCellSelectionEnabled(true);
    }

    public void focusSet() {
        SalesMaintainLoad.requestFocus();
        SalesMaintainLoad.changeSelection(0, 1, false, false);
        SalesMaintainLoad.getModel().setValueAt("1", 0, 0);
        SalesMaintainLoad.setCellSelectionEnabled(true);
    }

    public void LoadSalesMaintain(String nowDate) {
        try {
            clearData();            
            int i;
            //salesController = new SalesController();            
            sales = new SalesModel();
            List <SalesModel> salesList = new ArrayList();
            sales = salesController.loadSalesMaintain(nowDate);
            salesList = sales.getListofitems();
            salesCount =salesList.size();
            salesAmount=0.00;
            SalesModel salesItems;
            if (sales.getRowCount() > 15) {
                DefaultTableModel model = (DefaultTableModel) SalesMaintainLoad.getModel();
                model.getDataVector().removeAllElements();
                SalesMaintainLoad.revalidate();
                for (int j = 0; j < sales.getRowCount(); j++) {
                    addRow();
                }
            }
                for( i = 0; i <  salesList.size();i++)
                {
                    salesItems =  salesList.get(i);
                    SalesMaintainLoad.getModel().setValueAt(salesItems.getBillNumber(), i, 0);
                    SalesMaintainLoad.getModel().setValueAt(DateUtils.normalFormatDate(salesItems.getBillDate()), i, 1);
                    String type = salesItems.getBillType();
                    if (type.equals("Account")) {
                        type = "Counter Bill";
                    }
                    SalesMaintainLoad.getModel().setValueAt(type, i, 2);
                    SalesMaintainLoad.getModel().setValueAt(salesItems.getCustomerName(), i, 3);
                    SalesMaintainLoad.getModel().setValueAt(salesItems.getTotalItems(), i, 4);
                    SalesMaintainLoad.getModel().setValueAt(salesItems.getTotalQuantity(), i, 5);
                    SalesMaintainLoad.getModel().setValueAt(salesItems.getTotalAmount(), i, 6);
                    salesAmount+=salesItems.getTotalAmount();
                }
        } catch (Exception e) {
            String msg = "Class : Sales Maintanance  Method : LoadSalesMaintain()   = "+e.getMessage();
            log.debug(msg);
        }
    }

    public void LoadSalesMaintain(String option, String val) {
        try {
            System.out.println("Start....");
            clearData();
            
            ResultSet rs = null;
            int i=0;
            //salesController = new SalesController();
            sales = new SalesModel();
            List <SalesModel> salesList = new ArrayList();
            sales = salesController.loadSalesMaintain(option,val);
            salesList = sales.getListofitems();
            salesCount = salesList.size();
            salesAmount=0.00;
            SalesModel salesItems;
            if (sales.getRowCount() > 15) {
                DefaultTableModel model = (DefaultTableModel) SalesMaintainLoad.getModel();
                model.getDataVector().removeAllElements();
                SalesMaintainLoad.revalidate();
                for (int j = 0; j < sales.getRowCount(); j++) {
                    addRow();
                }
            }
             for( i = 0; i <  salesList.size();i++)
                {
                salesItems =  salesList.get(i);
                SalesMaintainLoad.getModel().setValueAt(salesItems.getBillNumber(), i, 0);
                SalesMaintainLoad.getModel().setValueAt(DateUtils.normalFormatDate(salesItems.getBillDate()), i, 1);
                String type = salesItems.getBillType();
                if (type.equals("Account")) {
                    type = "Counter Bill";
                }
                SalesMaintainLoad.getModel().setValueAt(type, i, 2);
                SalesMaintainLoad.getModel().setValueAt(salesItems.getCustomerName(), i, 3);
                SalesMaintainLoad.getModel().setValueAt(salesItems.getTotalItems(), i, 4);
                SalesMaintainLoad.getModel().setValueAt(salesItems.getTotalQuantity(), i, 5);
                SalesMaintainLoad.getModel().setValueAt(salesItems.getTotalAmount(), i, 6);
                salesAmount+=salesItems.getTotalAmount();
        }
        } catch (Exception e) {
            String msg = "Class : Sales Maintanance  Method : LoadSalesMaintain()   = "+e.getMessage();
            log.debug(msg);
        }
    }
}
