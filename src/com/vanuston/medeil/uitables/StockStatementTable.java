package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.Stock;
import com.vanuston.medeil.model.StockModel;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.util.ArrayList;
import java.util.Vector;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import com.vanuston.medeil.util.DecimalFormatRenderer;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.util.Value;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;

public class StockStatementTable {

    static Logger log = Logger.getLogger(StockStatementTable.class, "Utilities");
    public static JTable stockStatementTable;
    public static JScrollPane stockStScrollPane = new JScrollPane();
    public static KeyStroke callStockStatementTable = KeyStroke.getKeyStroke(KeyEvent.VK_T, KeyEvent.CTRL_MASK);
    public static KeyStroke callStockfocusOut = KeyStroke.getKeyStroke(KeyEvent.VK_SPACE, KeyEvent.CTRL_MASK);
    public static String stockId;
    public static String rowselt = "-1";
    public static KeyStroke save = KeyStroke.getKeyStroke(KeyEvent.VK_F3, 0);
    public static KeyStroke reset = KeyStroke.getKeyStroke(KeyEvent.VK_F4, 0);
    public static KeyStroke del = KeyStroke.getKeyStroke(KeyEvent.VK_F5, 0);
    public static KeyStroke update = KeyStroke.getKeyStroke(KeyEvent.VK_F7, 0);
    public static KeyStroke edit = KeyStroke.getKeyStroke(KeyEvent.VK_F6, 0);
    public static KeyStroke rR = KeyStroke.getKeyStroke(KeyEvent.VK_F12, 0);
    public static KeyStroke can = KeyStroke.getKeyStroke(KeyEvent.VK_F8, 0);
    public static KeyStroke back = KeyStroke.getKeyStroke(KeyEvent.VK_LEFT, KeyEvent.CTRL_MASK);
    Stock stockController;
    public StockStatementTable() throws RemoteException, NotBoundException
    {
        stockController= (Stock) RegistryFactory.getClientStub(RegistryConstants.Stock);
    }

    public JComponent createTable(final int initRow, Object[] colName, Class[] type, boolean[] canEdit, int[] width) {
        final Class[] types = type;
        final boolean[] canEditCols = canEdit;
        final int[] colWidth = width;
        stockStatementTable = new JTable();
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
            stockStatementTable.setModel(new javax.swing.table.DefaultTableModel(data, cols) {

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
            String msg = "Class : StockStatementTable  Method : createTable   Exception:" + ex.getMessage();
            log.debug(msg);
        }
        stockStatementTable.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        stockStatementTable.getTableHeader().setBackground(new Color(226, 238, 244));
        stockStatementTable.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
        stockStatementTable.setShowGrid(true);
        stockStatementTable.getTableHeader().setReorderingAllowed(false);

      //   stockStatementTable.removeColumn(stockStatementTable.getColumnModel().getColumn(0));

        for (int i = 0; i < len; i++) {
            stockStatementTable.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }
        stockStatementTable.getColumnModel().getColumn(9).setCellRenderer(new DecimalFormatRenderer());
        stockStatementTable.getColumnModel().getColumn(10).setCellRenderer(new DecimalFormatRenderer());
        stockStatementTable.getColumnModel().getColumn(11).setCellRenderer(new DecimalFormatRenderer());

        stockStatementTable.removeColumn(stockStatementTable.getColumnModel().getColumn(0));

        stockStatementTable.setGridColor(new java.awt.Color(204, 204, 255));
        stockStatementTable.setCellSelectionEnabled(false);
        stockStatementTable.setRowSelectionAllowed(true);
        stockStatementTable.getInputMap().put(save, "actionF2");
        stockStatementTable.getInputMap().put(edit, "actionF2");
        stockStatementTable.getInputMap().put(reset, "actionF2");
        stockStatementTable.getInputMap().put(can, "actionF2");
        stockStatementTable.getInputMap().put(update, "actionF2");
        stockStatementTable.getInputMap().put(del, "actionF2");
        stockStatementTable.getInputMap().put(back, "actionF2");
        stockStatementTable.getInputMap().put(rR, "actionF2");
        stockStatementTable.getActionMap().put("actionF2", new AbstractAction() {

            @Override
            public void actionPerformed(ActionEvent e) {
                stockStatementTable.transferFocus();
            }
        });
        stockStatementTable.setRowHeight(20);
        stockStatementTable.setSelectionBackground(Color.LIGHT_GRAY);
        stockStatementTable.setSelectionForeground(Color.RED);
        stockStatementTable.revalidate();
      //-  loadStockStatementValues();
        stockStatementTable.addKeyListener(new KeyListener() {

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
        stockStatementTable.addMouseListener(new MouseListener() {

            @Override
            public void mouseClicked(MouseEvent e) {
                final int i = stockStatementTable.getSelectedRow();
                stockId = (String) stockStatementTable.getModel().getValueAt(i, 0);
                rowselt = stockId;
            }

            @Override
            public void mousePressed(MouseEvent e) {
            }

            @Override
            public void mouseReleased(MouseEvent e) {
                final int i = stockStatementTable.getSelectedRow();
                stockId = (String) stockStatementTable.getModel().getValueAt(i, 0);                
                rowselt = stockId;
            }

            @Override
            public void mouseEntered(MouseEvent e) {
            }

            @Override
            public void mouseExited(MouseEvent e) {
            }
        });


        return stockStatementTable;
    }


    public static JComponent getScrollTable(JComponent jt) {
        stockStatementTable = (JTable) jt;
        stockStScrollPane.add(stockStatementTable);
        stockStScrollPane.setViewportView(stockStatementTable);
        return stockStScrollPane;
    }


    public static void viewStockCalculations() {
	  final int i = stockStatementTable.getSelectedRow();
          stockId = (String) stockStatementTable.getModel().getValueAt(i, 0);
          rowselt = stockId;
}

    public void loadStockStatementValues() {
        try {
            clearData();
            
            StockModel stockBean = new StockModel();            
            //com.vanuston.medeil.implementation.Stock stockController = new StockController();
            stockBean.setPassValue(1);
            ArrayList<StockModel> stockList = stockController.viewAllRecord(stockBean);
            
            for (int i = 0; i < stockList.size() && stockList != null; i++) {
                stockBean = stockList.get(i);                
                addRow();
                stockStatementTable.getModel().setValueAt(String.valueOf(stockBean.getStock_ssNo()),i, 0);
                
                stockStatementTable.getModel().setValueAt(stockBean.getStock_itemName(), i, 1);
                
                 stockStatementTable.getModel().setValueAt(stockBean.getStock_formulation(), i, 2);
                
                stockStatementTable.getModel().setValueAt(stockBean.getDosage(), i, 3);
                stockStatementTable.getModel().setValueAt(stockBean.getStock_rackNo(), i, 4);
                stockStatementTable.getModel().setValueAt(stockBean.getStock_shelfNo(), i, 5);
                stockStatementTable.getModel().setValueAt(stockBean.getStock_batchNo(), i, 6);
                stockStatementTable.getModel().setValueAt(stockBean.getStock_qty(), i, 7);
                //curDate = DateUtils.normalFormatExpDate(stockBean.getStock_date());
                stockStatementTable.getModel().setValueAt(stockBean.getStock_expiryDate(), i, 8);
                stockStatementTable.getModel().setValueAt(Value.Round(stockBean.getStock_mrp()*stockBean.getStock_packing()), i, 9);
                stockStatementTable.getModel().setValueAt(Value.Round(stockBean.getStock_purchasePrice()*stockBean.getStock_packing()), i, 10);
                stockStatementTable.getModel().setValueAt(Value.Round(stockBean.getStock_sellingPrice()*stockBean.getStock_packing()), i, 11);
            }
//            String sql = "";
//            int i = 0;
//            String curDate = DateUtils.now("MM-yy");
//            ResultSet rs = null;
//            sql = "SELECT  *  FROM stock_statement where ss_flag_id=0 order by ss_no desc limit 0,8";
//            rs = DBConnection.getStatement().executeQuery(sql);
//            while (rs.next()) {
//                addRow();
//                stockStatementTable.getModel().setValueAt(rs.getString("ss_no"), i, 0);
//                String itName = "";
//                itName = rs.getString("item_name");
//                String itN[] = itName.split("_");
//                String itN1 = "";
//                String Dosage = "";
//                if (itN.length > 1) {
//                    itN1 = itN[0];
//                    Dosage = itN[1];
//                } else if (itN.length == 1) {
//                    itN1 = itN[0];
//                    Dosage = "";
//                }
//                stockStatementTable.getModel().setValueAt(itN1, i, 1);
//                 stockStatementTable.getModel().setValueAt(rs.getString("formulation"), i, 2);
//                stockStatementTable.getModel().setValueAt(Dosage, i, 3);
//                stockStatementTable.getModel().setValueAt(rs.getString("rack_no"), i, 4);
//                stockStatementTable.getModel().setValueAt(rs.getString("shelf_no"), i, 5);
//                stockStatementTable.getModel().setValueAt(rs.getString("batch_no"), i, 6);
//                stockStatementTable.getModel().setValueAt(rs.getString("qty"), i, 7);
//                curDate = DateUtils.normalFormatExpDate(rs.getDate("expiry_date"));
//                stockStatementTable.getModel().setValueAt(curDate, i, 8);
//                stockStatementTable.getModel().setValueAt((rs.getDouble("mrp") * rs.getInt("packing")), i, 9);
//                stockStatementTable.getModel().setValueAt((rs.getDouble("purchase_price") * rs.getInt("packing")), i, 10);
//                stockStatementTable.getModel().setValueAt((rs.getDouble("selling_price") * rs.getInt("packing")), i, 11);
//
//                i++;
//            }
            stockStatementTable.clearSelection();
        } catch (Exception e) {
            String msg = "Class : StockStatementTable  Method : loadStockStatementValues  Exception: " + e.getMessage();
            log.debug(msg);
        }
    }

    public String searchStockStatementValues(String name, Integer type) {
        clearData();
        String valu = "No Products Found";
        int jk = 0;
        rowselt = "-1";
        try {
            StockModel stockBean = new StockModel();
            //com.vanuston.medeil.implementation.Stock stockController;// = new DrugController();
            ArrayList<StockModel> stockList=new ArrayList();

            if (type == 0) {
                stockBean.setPassValue(2);
                stockBean.setStock_itemName(name);
                //stockController = new StockController();
                 stockList=stockController.viewAllRecord(stockBean);
            } else if (type == 1){
                stockBean.setPassValue(3);
                stockBean.setStock_itemCode(Integer.valueOf(name));
                //stockController = new StockController();
                stockList=stockController.viewAllRecord(stockBean);
            }
            else if (type == 2){
                stockBean.setPassValue(4);
                stockBean.setStock_batchNo(name);
                //stockController = new StockController();
                stockList=stockController.viewAllRecord(stockBean);
            }
            else if (type == 3){
                stockBean.setPassValue(5);
                stockBean.setStock_qty(Integer.valueOf(name));
                //stockController = new StockController();
                stockList=stockController.viewAllRecord(stockBean);
            }
            else
            {
                stockBean.setPassValue(6);
                stockBean.setStock_itemName(name);
                //stockController = new StockController();
                stockList=stockController.viewAllRecord(stockBean);
            }
            
            for (int i = 0; i < stockList.size(); i++) {
                stockBean = stockList.get(i);
                addRow();
                jk++;
                stockStatementTable.getModel().setValueAt(String.valueOf(stockBean.getStock_ssNo()),i, 0);
                stockStatementTable.getModel().setValueAt(stockBean.getStock_itemName(), i, 1);
                stockStatementTable.getModel().setValueAt(stockBean.getStock_formulation(), i, 2);
                stockStatementTable.getModel().setValueAt(stockBean.getDosage(), i, 3);
                stockStatementTable.getModel().setValueAt(stockBean.getStock_rackNo(), i, 4);
                stockStatementTable.getModel().setValueAt(stockBean.getStock_shelfNo(), i, 5);
                stockStatementTable.getModel().setValueAt(stockBean.getStock_batchNo(), i, 6);
                stockStatementTable.getModel().setValueAt(stockBean.getStock_qty(), i, 7);
                //curDate = DateUtils.normalFormatExpDate(stockBean.getStock_date());
                stockStatementTable.getModel().setValueAt(stockBean.getStock_expiryDate(), i, 8);
                stockStatementTable.getModel().setValueAt(Value.Round(stockBean.getStock_mrp()*stockBean.getStock_packing()), i, 9);
                stockStatementTable.getModel().setValueAt(Value.Round(stockBean.getStock_purchasePrice()*stockBean.getStock_packing()), i, 10);
                stockStatementTable.getModel().setValueAt(Value.Round(stockBean.getStock_sellingPrice()*stockBean.getStock_packing()), i, 11);
            }
            if (jk > 0) {
                valu = jk + "  Products Found";
            }
            stockStatementTable.clearSelection();           
    }
            catch (Exception e) {
            String msg = "Class : StockStatementTable  Method : searchStockStatementValues   Exception: " + e.getMessage();
            log.debug(msg);
        }
//        try {
//            String sql1 = "";
//            int i = 0;
//            int cnt = 0;
//            String curDate = DateUtils.now("MM-yy");
//            if (type == 0) {
//                sql1 = "SELECT  *  FROM stock_statement  where   ss_flag_id=0 and item_name like'" + name + "%'";
//            } else if (type == 1) {
//                sql1 = "SELECT  *  FROM stock_statement  where ss_flag_id=0 and  item_code like'" + name + "%'";
//            } else if (type == 2) {
//                sql1 = "SELECT * FROM stock_statement  where ss_flag_id=0 and  batch_no like'" + name + "%'";
//            } else {
//                sql1 = "SELECT  *  FROM stock_statement  where ss_flag_id=0 and  qty ='" + name + "' ";
//            }
//            ResultSet rs = null;
//            rs = DBConnection.getStatement().executeQuery(sql1);
//            while (rs.next()) {
//                addRow();
//                jk++;
//                stockStatementTable.getModel().setValueAt(rs.getString("ss_no"), i, 0);
//                String itName = "";
//                itName = rs.getString("item_name");
//                String itN[] = itName.split("_");
//                String itN1 = "";
//                String Dosage = "";
//                if (itN.length > 1) {
//                    itN1 = itN[0];
//                    Dosage = itN[1];
//                } else if (itN.length == 1) {
//                    itN1 = itN[0];
//                    Dosage = "";
//                }
//                 stockStatementTable.getModel().setValueAt(itN1, i, 1);
//                 stockStatementTable.getModel().setValueAt(rs.getString("formulation"), i, 2);
//                stockStatementTable.getModel().setValueAt(Dosage, i, 3);
//                stockStatementTable.getModel().setValueAt(rs.getString("rack_no"), i, 4);
//                stockStatementTable.getModel().setValueAt(rs.getString("shelf_no"), i, 5);
//                stockStatementTable.getModel().setValueAt(rs.getString("batch_no"), i, 6);
//                stockStatementTable.getModel().setValueAt(rs.getString("qty"), i, 7);
//                curDate = DateUtils.normalFormatExpDate(rs.getDate("expiry_date"));
//                stockStatementTable.getModel().setValueAt(curDate, i, 8);
//                stockStatementTable.getModel().setValueAt(Value.Round(rs.getDouble("mrp") * rs.getInt("packing")), i, 9);
//                stockStatementTable.getModel().setValueAt(Value.Round(rs.getDouble("purchase_price") * rs.getInt("packing")), i, 10);
//                stockStatementTable.getModel().setValueAt(Value.Round(rs.getDouble("selling_price") * rs.getInt("packing")), i, 11);
//
//                i++;
//            }
//            if (jk > 0) {
//                valu = jk + "  Products Found";
//            }
//            stockStatementTable.clearSelection();
//        } catch (Exception e) {
//            String msg = "Class : StockStatementTable  Method : searchStockStatementValues   Exception: " + e.getMessage();
//            log.debug(msg);
//        }
        return valu;
    }

//    public static String searchStockStmtValues(String name) {
//        clearData();
//        String valu = "No Products Found";
//        int j = 0;
//        try {
//            String sql1 = "";
//            int i = 0;
//            String curDate = DateUtils.now("MM-yy");
//            sql1 = "SELECT  *  FROM stock_statement  where ss_flag_id=0 and  item_name like'" + name + "%'";
//            ResultSet rs = null;
//            rs = DBConnection.getStatement().executeQuery(sql1);
//            while (rs.next()) {
//                j++;
//                addRow();
//                stockStatementTable.getModel().setValueAt(rs.getString("ss_no"), i, 0);
//                String itName = "";
//                itName = rs.getString("item_name");
//                String itN[] = itName.split("_");
//                String itN1 = "";
//                String Dosage = "";
//                if (itN.length > 1) {
//                    itN1 = itN[0];
//                    Dosage = itN[1];
//                } else if (itN.length == 1) {
//                    itN1 = itN[0];
//                    Dosage = "";
//                }
//                  stockStatementTable.getModel().setValueAt(itN1, i, 1);
//                 stockStatementTable.getModel().setValueAt(rs.getString("formulation"), i, 2);
//                stockStatementTable.getModel().setValueAt(Dosage, i, 3);
//                stockStatementTable.getModel().setValueAt(rs.getString("rack_no"), i, 4);
//                stockStatementTable.getModel().setValueAt(rs.getString("shelf_no"), i, 5);
//                stockStatementTable.getModel().setValueAt(rs.getString("batch_no"), i, 6);
//                stockStatementTable.getModel().setValueAt(rs.getString("qty"), i, 7);
//                curDate = DateUtils.normalFormatExpDate(rs.getDate("expiry_date"));
//                stockStatementTable.getModel().setValueAt(curDate, i, 8);
//                stockStatementTable.getModel().setValueAt(Value.Round(rs.getDouble("mrp") * rs.getInt("packing")), i, 9);
//                stockStatementTable.getModel().setValueAt(Value.Round(rs.getDouble("purchase_price") * rs.getInt("packing")), i, 10);
//                stockStatementTable.getModel().setValueAt(Value.Round(rs.getDouble("selling_price") * rs.getInt("packing")), i, 11);
//                i++;
//            }
//            if (j > 0) {
//                valu = j + "  Products Found";
//            }
//            stockStatementTable.clearSelection();
//        } catch (Exception e) {
//            String msg = "Class : StockStatementTable  Method : searchStockStatementValues  Exception: " + e.getMessage();
//            log.debug(msg);
//        }
//        return valu;
//    }

    public static void addRow() {
        DefaultTableModel model = (DefaultTableModel) stockStatementTable.getModel();
        Vector datas = new Vector();
        for (int i = 0; i < stockStatementTable.getModel().getColumnCount(); i++) {
            datas.addElement(null);
        }
        model.insertRow(stockStatementTable.getRowCount(), datas);
    }

    public static void removeRow() {
        int i = stockStatementTable.getSelectedRow();
        if (i != -1) {
            DefaultTableModel model = (DefaultTableModel) stockStatementTable.getModel();
            model.removeRow(i);
            stockStatementTable.getModel().setValueAt(i, i + 1, 0);
            stockStatementTable.changeSelection(i + 1, 0, false, false);
        } else {
            JOptionPane.showMessageDialog(stockStatementTable, "Please select row to remove ...");
        }
    }

    public static void clearData() {
        DefaultTableModel model = (DefaultTableModel) stockStatementTable.getModel();
        model.getDataVector().removeAllElements();
        stockStatementTable.revalidate();
    }

    public static void addBasicRows() {
        for (int i = 0; i < 8; i++) {
            addRow();
        }
    }
}
