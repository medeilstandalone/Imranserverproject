package com.vanuston.medeil.uitables;


import com.vanuston.medeil.model.DamageStockModel;

import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.DecimalFormatRenderer;
import java.awt.Color;
import java.awt.Component;
import java.awt.event.ActionEvent;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.MouseWheelEvent;
import java.util.Vector;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableCellRenderer;
import javafx.stage.Alert;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.PercentageFormatRenderer;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import com.vanuston.medeil.util.Value;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import javax.swing.event.TableModelEvent;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.implementation.DamageStock;

public class TableDamageHelper {

    static Logger log = Logger.getLogger(TableDamageHelper.class, "Utilities");
    public static JTable table;
    public static JTable jcomp;
    public static JTextField jt;
    public static int flag = 0;
    public static String ino;
    public static int Edit = 0;
    public static JScrollPane scrollPane = new JScrollPane();
    public static int totQty = 0;
    public static int totItems = 0;
    public static int totQtys = 0;
    public static double totAmt = 0.00;
    public static double totDistAmt = 0.0;
    public static double totVATAmt = 0.0;
    public static int totPurcQty = 0;
    public static int totPurcItems = 0;
    public static double totPurcAmt = 0.00;
    public static double totPurcDistAmt = 0.0;
    public static double totPurcVAT4Amt = 0.0;
    public static double totPurcVAT12Amt = 0.0;
    public static double amt = 0.00;
    static int initR;
    public int chkDamgeQty = 0;
    public double damAmt = 0.00;
    public double getvat = 0.00;
    public int tot = 0;
    HeaderRenderer2 tabHead;
    com.vanuston.medeil.implementation.DamageStock damagestockController;

    public TableDamageHelper() throws RemoteException, NotBoundException {
        damagestockController = (com.vanuston.medeil.implementation.DamageStock) RegistryFactory.getClientStub(RegistryConstants.DamageStock);
    }

    public JComponent createTable() {
        //public JComponent createTable(final int rowNo, Object[] colNames, Class[] colType, boolean[] colEditable, int[] colWidth) {
        int col = 0;
        Integer[] colWidth = {40, 100, 50, 100, 82, 50, 50, 60, 70, 110, 70, 50};
        Object[] colName = {"S.No.", "Product Name", "Batch No.", "Purchased Date", "Purchased Qty.", "Damaged Qty.", "VAT %", "Disc %", "Unit Price", " Total Amount", "Remarks", "All"};
        Class[] type = {java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.String.class,
            java.lang.Integer.class, java.lang.Integer.class, java.lang.Double.class, java.lang.Double.class, java.lang.Double.class, java.lang.Double.class, java.lang.String.class, java.lang.Boolean.class};
        final boolean[] colEditable = {false, false, false, false, false, true, true, true, false, true, true, true};
        final Class[] types = type;
//        final boolean[] canEditCols = canEdit;
//        final int[] colWidth = width;
        jcomp = new JTable() {

            @Override
            public int getSelectedRow() {
                return super.getSelectedRow();
            }

            @Override
            public TableCellRenderer getCellRenderer(int row, int column) {
                TableCellRenderer t = super.getCellRenderer(row, column);
                return t;
            }

            @Override
            public void tableChanged(TableModelEvent e) {
                super.tableChanged(e);
            }

            @Override
            public Component prepareRenderer(TableCellRenderer renderer, int row, int column) {
                Component c = super.prepareRenderer(renderer, row, column);
                return c;
            }
        };
        Vector cols = new Vector();
        Vector data = new Vector();
        initR = col;
        int len = colName.length;
        for (int i = 1; i <= initR; i++) {
            Vector c = new Vector();
            for (int j = 0; j < len - 1; j++) {
                if (j == len - 1) {
                    c.addElement(Boolean.FALSE);
                } else {
                    c.addElement(null);
                }
                cols.addElement(c);
            }
        }
        for (int i = 0; i < len; i++) {
            cols.addElement(colName[i]);
        }
        try {
            jcomp.setModel(new javax.swing.table.DefaultTableModel(data, cols) {

                Class[] type = types;
                boolean[] canEditCol = colEditable;

                @Override
                public Class getColumnClass(int columnIndex) {
                    return type[columnIndex];
                }

                @Override
                public boolean isCellEditable(int rowIndex, int columnIndex) {
                    return canEditCol[columnIndex];
                }

                @Override
                public void fireTableRowsUpdated(int row, int column) {
                    super.fireTableRowsUpdated(row, column);
                    DamageStockCalculations();
                }
//                @Override
//                public void fireTableCellUpdated(int row, int column){
//                    super.fireTableCellUpdated(row, column);
//                    DamageStockCalculations();
//                }
            });
        } catch (Exception ex) {
            log.debug("Class : TableDamageHelper Method : createTable Exception :" + ex.getMessage());
        }

        jcomp.setGridColor(new java.awt.Color(204, 204, 255));
        jcomp.setCellSelectionEnabled(true);


        jcomp.setSelectionMode(0);
        jcomp.setShowGrid(true);
        jcomp.setDragEnabled(false);
        jcomp.setRowHeight(20);
        jcomp.revalidate();

        jcomp.getColumnModel().getColumn(6).setCellRenderer(new PercentageFormatRenderer());
        jcomp.getColumnModel().getColumn(7).setCellRenderer(new PercentageFormatRenderer());
        jcomp.getColumnModel().getColumn(8).setCellRenderer(new DecimalFormatRenderer());
        jcomp.getColumnModel().getColumn(9).setCellRenderer(new DecimalFormatRenderer());
//        jcomp.setSelectionBackground(Color.LIGHT_GRAY);
//        jcomp.setSelectionForeground(Color.RED);

        for (int i = 0; i < len; i++) {
            jcomp.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }
        tabHead = new HeaderRenderer2(jcomp.getTableHeader(), "damageCheck");
        jcomp.getColumnModel().getColumn(11).setHeaderRenderer(tabHead);


        KeyStroke save = KeyStroke.getKeyStroke(KeyEvent.VK_F3, 0);
        KeyStroke edit = KeyStroke.getKeyStroke(KeyEvent.VK_F6, 0);
        KeyStroke update = KeyStroke.getKeyStroke(KeyEvent.VK_F7, 0);
        KeyStroke reset = KeyStroke.getKeyStroke(KeyEvent.VK_F4, 0);
        KeyStroke cancel = KeyStroke.getKeyStroke(KeyEvent.VK_F8, 0);
        KeyStroke rR = KeyStroke.getKeyStroke(KeyEvent.VK_F12, 0);
        KeyStroke back = KeyStroke.getKeyStroke(KeyEvent.VK_LEFT, KeyEvent.CTRL_MASK);

        jcomp.getInputMap().put(save, "action");
        jcomp.getInputMap().put(edit, "action");
        jcomp.getInputMap().put(update, "action");
        jcomp.getInputMap().put(reset, "action");
        jcomp.getInputMap().put(cancel, "action");
        jcomp.getInputMap().put(rR, "action");
        jcomp.getInputMap().put(back, "action");
        jcomp.getActionMap().put("action", new AbstractAction() {

            @Override
            public void actionPerformed(ActionEvent e) {
                jcomp.transferFocus();
            }
        });
        jcomp.addKeyListener(new KeyAdapter() {
            @Override
            public void keyReleased(KeyEvent e) {
                final int i = jcomp.getSelectedRow();
                final int j = jcomp.getSelectedColumn();
                final int rowCnt = jcomp.getRowCount();
                DamageStockCalculations();
                if (i >= 0) {
//                    jcomp.getModel().setValueAt(i+1 , i, 0);
                    if (e.getKeyCode() == 10 || e.getKeyCode() == 9) {
                        InputMap im = jcomp.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                        KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                        KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                        im.put(enter, im.get(tab));
                        DamageStockCalculations();
                    }
                    if ((j == 1) && e.getKeyCode() != 27 || (j == 1 && e.getKeyCode() == KeyEvent.VK_TAB && e.getKeyCode() != 27)) {
                        if (Edit == 0) {
                        }
                    }
                    /*if (j == jcomp.getModel().getColumnCount() - 1) {
                    
                    String cntQuery = "Select count(*) from purchase_invoice where invoice_no='" + ino + "'";
                    int count = DBData.selectCountQuryExe(cntQuery);
                    int rwcount = jcomp.getRowCount();

                    if (Edit == 0 && i == jcomp.getModel().getRowCount() - 1 && jcomp.getModel().getValueAt(i, 1) != null && jcomp.getModel().getValueAt(i, 2) != null) {
                    if (rwcount < count) {
                    }
                    }
                    }*/
                }
                if (Integer.valueOf(jcomp.getModel().getValueAt(i, 5).toString()) == 0) {
//                chkDamgeQty=0;
                    jcomp.setValueAt(0.00, i, 9);
                    
//                    DamageStockCalculations();
                } else {
                    DamageStockCalculations();
                }
                DamageStockCalculations();
            }

            @Override
            public void keyPressed(KeyEvent e) {
                final int i = jcomp.getSelectedRow();
                final int j = jcomp.getSelectedColumn();
                DamageStockCalculations();
                InputMap im = jcomp.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                im.put(enter, im.get(tab));
                if (j == 7) {
                    if (e.isActionKey()) {
                        jcomp.getModel().setValueAt("", i, 7);
                    }
                }
//                if(Integer.valueOf(jcomp.getModel().getValueAt(i,5).toString())==0)
//                {
////                chkDamgeQty=0;
//                    jcomp.setValueAt(0.00, i, 9);

//                }
//                else{//
                DamageStockCalculations();
//                }
            }
            @Override
            public void keyTyped(KeyEvent e) {
                DamageStockCalculations();
            }
        });
        jcomp.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
                
                jcomp.requestFocus();
                DamageStockCalculations();
            }

            @Override
            public void mouseReleased(MouseEvent e) {
                jcomp.requestFocus();
                DamageStockCalculations();
            }
        });
        return jcomp;
    }

    public static JComponent getScrollTable(JComponent jt) {
        jcomp = (JTable) jt;
        scrollPane.add(jcomp);
        scrollPane.setViewportView(jcomp);
        return scrollPane;
    }

    public void clickCheck() {
        
        int rwCount = jcomp.getRowCount();
        damAmt = 0.0;
        for (int i = 0; i < rwCount; i++) {

            if (jcomp.getValueAt(i, 11) == null); else {
                Object val = jcomp.getValueAt(i, 11);
                
                if (!Boolean.parseBoolean(val.toString())) {
                    tabHead.deSelect();
                    //DamageStockCalculations();
                } else {
//                    DamageStockCalculations();
                    //damAmt = damAmt + Double.parseDouble(jcomp.getValueAt(i, 9).toString());

//                    if (jcomp.getValueAt(i, 5).toString().equals(getvat)) {
//                        getvat = getvat + damAmt;//Double.parseDouble(table.getValueAt(i, 8).toString());
//                    }
                    tot++;
                }
            }
        }
        if (tot == rwCount) {

            tabHead.select();
        }
    }

    public boolean checkDamageStock() {
        boolean checkVal = true;
        int rCount = jcomp.getRowCount();
        for (int i = 0; i < jcomp.getRowCount(); i++) {
            if (jcomp.getValueAt(i, 5) == null || jcomp.getValueAt(i, 5) == "0") {
                checkVal = false;
//                Alert.inform("Damage Stock", "Damage quantity is null or Zero. Check it");
                break;
            } else {
                int purVal = Integer.parseInt(jcomp.getValueAt(i, 4).toString());
                int damagVal = Integer.parseInt(jcomp.getValueAt(i, 5).toString());
                if (purVal < damagVal) {
                    checkVal = false;
//                    Alert.inform("Damage Stock", "Damage quantity is higher than purchased quantity");
                    jcomp.changeSelection(i, 5, false, false);
                    break;
                }
            }
        }
        return checkVal;
    }

//    public List getDamagedInvoiceno(String invoiceno) {
//        ArrayList<DamageStockModel> drugListBean = new ArrayList();
//        DamageStockModel damagestockBean = new DamageStockModel();
//        try {
//            ResultSet rs = null;
//            String query = "select *,count(damaged_qty) as 'damage',sum(damaged_qty) as 'damagedqty' from damage_stocks where invoice_no='" + invoiceno + "' group by item_name order by item_name desc";

//            rs = DBConnection.getStatement().executeQuery(query);
//            rs.last();
//            int getRow = rs.getRow();
//            rs.beforeFirst();
//            if (getRow != 0) {
//                String[][] s = new String[getRow][10];
//                int j = 0;
//                {
//                    while (rs.next()) {
//                        int damage = rs.getInt("damage");
//                        if (damage == 0) {
//                        } else {
//                            damagestockBean.setDamage_invoice_no(invoiceno);
//                            damagestockBean.setDamage_item_name(rs.getString("item_name"));
//                            damagestockBean.setDamage_batch_no(rs.getString("batch_no"));
//                            damagestockBean.setDamage_invoice_date(rs.getString("invoice_date"));
//                            damagestockBean.setDamage_purchased_qty(rs.getInt("purchased_qty"));
//                            damagestockBean.setDamage_damaged_qty(rs.getInt("damaged_qty"));
//                            damagestockBean.setDamage_unit_vat(rs.getDouble("unit_vat"));
//                            damagestockBean.setDamage_unit_discount(rs.getDouble("unit_discount"));
//                            damagestockBean.setDamage_sub_total(rs.getDouble("unit_price"));
//                            damagestockBean.setDamage_total_amount(rs.getDouble("total_amount"));
//                            damagestockBean.setDamage_remarks(rs.getString("remarks"));

//                            drugListBean.add(damagestockBean);
//                            damagestockBean.setDamageStock(drugListBean);
//
//                        }
//                        j++;
//                    }
//                }
//            } else {
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//        return drugListBean;
//    }
//    public void setDamageValues(DamageStockModel damagestockBean) {
//        //DamageStockModel damagestockBean=new DamageStockModel();

//        //damagestockBean.setDamageStock(getDamagedInvoiceno(damagestockBean.getDamage_invoice_no()));
//        //List al =damagestockBean.getDamageStock();
//        List al = getDamagedInvoiceno(damagestockBean.getDamage_invoice_no());

//        for (int i = 0; i < al.size(); i++) {
//            damagestockBean = (DamageStockModel) al.get(i);
//            jcomp.setValueAt(damagestockBean.getDamage_damaged_qty(), i, 0);
//            jcomp.setValueAt(damagestockBean.getDamage_item_name(), i, 1);
//            jcomp.setValueAt(damagestockBean.getDamage_batch_no(), i, 2);
//            jcomp.setValueAt(damagestockBean.getDamage_invoice_date(), i, 3);
//            jcomp.setValueAt(damagestockBean.getDamage_purchased_qty(), i, 4);
//            jcomp.setValueAt(damagestockBean.getDamage_damaged_qty(), i, 5);
//            jcomp.setValueAt(damagestockBean.getDamage_unit_vat(), i, 6);
//            jcomp.setValueAt(damagestockBean.getDamage_unit_discount(), i, 7);
//            jcomp.setValueAt(damagestockBean.getDamage_sub_total(), i, 8);
//            jcomp.setValueAt(damagestockBean.getDamage_total_amount(), i, 9);
//            jcomp.setValueAt(damagestockBean.getDamage_remarks(), i, 10);
//        }
//    }
    public static void addRow() {
        DefaultTableModel model = (DefaultTableModel) jcomp.getModel();
        Vector datas = new Vector();
        for (int i = 0; i < jcomp.getModel().getColumnCount(); i++) {
            if (i == 11) {
                datas.addElement(Boolean.FALSE);
            } else {
                datas.addElement(null);
            }
        }
        model.insertRow(jcomp.getRowCount(), datas);
    }

    public void addInitRow() {
        Edit = 0;
        for (int i = 0; i < initR; i++) {
            addRow();
        }
    }

    public static void EditDamage(String[] get) {
        int rowCount = jcomp.getRowCount();
        int flag = 0;
        DefaultTableModel model = (DefaultTableModel) jcomp.getModel();
        Vector datas = new Vector();
        datas.size();
        for (int i = 0; i < rowCount; i++) {
            String itemname = jcomp.getValueAt(i, 1) + "";
            if (itemname.equals(get[0])) {
                flag = 1;
                jcomp.changeSelection(i, 5, false, false);
            }
        }
        if (flag == 0) {
            for (int i = 0; i < get.length; i++) {
                if (i == 0) {
                    datas.addElement(jcomp.getRowCount() + 1);
                } else if (i <= 4) {
                    datas.addElement(get[i - 1]);
                } else if (i == 5) {
                    datas.addElement(Integer.parseInt(get[i - 1]));
                } else if (i <= 9) {
                    datas.addElement(Double.parseDouble(get[i - 1]));
                } else if (i == 10) {
                    datas.addElement(get[i]);
                }
            }
            model.insertRow(jcomp.getRowCount(), datas);
        }
    }

    public static JComponent intial() {
        return table;
    }

    public void SaveDamage(List tableVal) {
        tabHead = new HeaderRenderer2(jcomp.getTableHeader(), "damageCheck");
        jcomp.getColumnModel().getColumn(11).setHeaderRenderer(tabHead);
        jcomp.getColumnModel().getColumn(11).setMaxWidth(70);
        jcomp.getColumnModel().getColumn(11).setMinWidth(70);
        jcomp.getColumnModel().getColumn(11).setPreferredWidth(70);
        //jcomp.getColumnModel().getColumn(11).setResizable(false);
        DefaultTableModel model = (DefaultTableModel) jcomp.getModel();
        model.getDataVector().removeAllElements();
        int row = jcomp.getRowCount();
        int col = jcomp.getColumnCount();
        jcomp.changeSelection(row, 0, false, false);
//        for (int i = 0; i < tableVal.size() - row; i++) {
//            addRow();
//        }
        
        
        for (int r = 0; r < tableVal.size(); r++) {
            DamageStockModel damagestockBean = (DamageStockModel) tableVal.get(r);
            addRow();
            jcomp.setValueAt(r + 1, r, 0);
            jcomp.setValueAt(damagestockBean.getDamage_item_name(), r, 1);
            
            jcomp.setValueAt(damagestockBean.getDamage_batch_no(), r, 2);
            
            jcomp.setValueAt(DateUtils.normalFormatDate(damagestockBean.getDamage_invoice_date()), r, 3);
            jcomp.setValueAt(damagestockBean.getDamage_purchased_qty(), r, 4);
            jcomp.setValueAt(damagestockBean.getDamage_damaged_qty(), r, 5);
            jcomp.setValueAt(damagestockBean.getDamage_unit_vat(), r, 6);
            jcomp.setValueAt(damagestockBean.getDamage_unit_discount(), r, 7);
            jcomp.setValueAt(damagestockBean.getDamage_unit_price(), r, 8);
            jcomp.setValueAt(damagestockBean.getDamage_total_amount(), r, 9);
            jcomp.setValueAt(damagestockBean.getDamage_remarks(), r, 10);
        }
    }

    public void EditDamage(List tableVal) {
        DefaultTableModel model = (DefaultTableModel) jcomp.getModel();
        model.getDataVector().removeAllElements();
        int row = jcomp.getRowCount();
        int col = jcomp.getColumnCount();
        jcomp.changeSelection(row, 0, false, false);
        jcomp.getColumnModel().getColumn(11).setMaxWidth(0);
        jcomp.getColumnModel().getColumn(11).setMinWidth(0);
        jcomp.getColumnModel().getColumn(11).setPreferredWidth(0);
        jcomp.getColumnModel().getColumn(11).setResizable(false);

        for (int i = 0; i < tableVal.size() - row; i++) {
            addRow();
        }
        
        
        for (int r = 0; r < tableVal.size(); r++) {
            DamageStockModel damagestockBean = (DamageStockModel) tableVal.get(r);
            jcomp.setValueAt(r + 1, r, 0);
            jcomp.setValueAt(damagestockBean.getDamage_item_name(), r, 1);
            
            jcomp.setValueAt(damagestockBean.getDamage_batch_no(), r, 2);
            
            jcomp.setValueAt(DateUtils.normalFormatDate(damagestockBean.getDamage_invoice_date()), r, 3);
            jcomp.setValueAt(damagestockBean.getDamage_purchased_qty(), r, 4);
            jcomp.setValueAt(damagestockBean.getDamage_damaged_qty(), r, 5);
            jcomp.setValueAt(damagestockBean.getDamage_unit_vat(), r, 6);
            jcomp.setValueAt(damagestockBean.getDamage_unit_discount(), r, 7);
            jcomp.setValueAt(damagestockBean.getDamage_unit_price(), r, 8);
            jcomp.setValueAt(damagestockBean.getDamage_total_amount(), r, 9);
            jcomp.setValueAt(damagestockBean.getDamage_remarks(), r, 10);
            jcomp.setValueAt(Boolean.TRUE, r, 11);
            
            DamageStockCalculations();
        }
            
//            for (int c = 0; c < tableVal[r].length + 1; c++) {
//                if (c == 0) {
//                    jcomp.setValueAt(r + 1, r, c);
//                } else if (c == 1) {
//                    jcomp.setValueAt(tableVal[r][c - 1], r, c);
//                } else if (c == 2) {
//                    jcomp.setValueAt(tableVal[r][c - 1], r, c);
//                } else if (c == 3) {
//                    jcomp.setValueAt(tableVal[r][c - 1], r, c);
//                } else if (c == 4) {
//                    jcomp.setValueAt(tableVal[r][c - 1], r, c);
//                } else if (c == 5) {
//                    jcomp.setValueAt(tableVal[r][c - 1], r, c);
//                } else if (c == 6) {
//                    jcomp.setValueAt(Double.parseDouble(tableVal[r][c - 1]), r, c);
//                } else if (c == 7) {
//                    jcomp.setValueAt(Double.parseDouble(tableVal[r][c - 1]), r, c);
//                } else if (c == 8) {
//                    jcomp.setValueAt(Double.parseDouble(tableVal[r][c - 1]), r, c);
//                } else if (c == 9) {
//                    jcomp.setValueAt(Double.parseDouble(tableVal[r][c - 1]), r, c);
//                } else if (c == 10) {
//                    jcomp.setValueAt((tableVal[r][c - 1]), r, c);
//                } else if (c == 11) {
//                    jcomp.setValueAt(tableVal[r][c - 1], r, c);
//                }
//            }

    }
//    public  void EditDamage(String[][] tableVal) {
//        DefaultTableModel model = (DefaultTableModel) jcomp.getModel();
//        model.getDataVector().removeAllElements();
//        int row = jcomp.getRowCount();
//        jcomp.changeSelection(row, 0, false, false);
//        for (int i = 0; i < tableVal.length - row; i++) {
//            addRow();
//        }
//        for (int r = 0; r < tableVal.length; r++) {
//            for (int c = 0; c < tableVal[r].length + 1; c++) {
//                if (c == 0) {
//                    jcomp.setValueAt(r + 1, r, c);
//                } else if (c == 1) {
//                    jcomp.setValueAt(tableVal[r][c - 1], r, c);
//                } else if (c == 2) {
//                    jcomp.setValueAt(tableVal[r][c - 1], r, c);
//                } else if (c == 3) {
//                    jcomp.setValueAt(tableVal[r][c - 1], r, c);
//                } else if (c == 4) {
//                    jcomp.setValueAt(tableVal[r][c - 1], r, c);
//                } else if (c == 5) {
//                    jcomp.setValueAt(tableVal[r][c - 1], r, c);
//                } else if (c == 6) {
//                    jcomp.setValueAt(Double.parseDouble(tableVal[r][c - 1]), r, c);
//                } else if (c == 7) {
//                    jcomp.setValueAt(Double.parseDouble(tableVal[r][c - 1]), r, c);
//                } else if (c == 8) {
//                    jcomp.setValueAt(Double.parseDouble(tableVal[r][c - 1]), r, c);
//                } else if (c == 9) {
//                    jcomp.setValueAt(Double.parseDouble(tableVal[r][c - 1]), r, c);
//                } else if (c == 10) {
//                    jcomp.setValueAt((tableVal[r][c - 1]), r, c);
//                } else if (c == 11) {
//                    jcomp.setValueAt(tableVal[r][c - 1], r, c);
//                }
//            }
//        }
//    }

    public static void addText(List get) {
        int rno = 0;
        DamageStockModel damagestockBean;
        damagestockBean = new DamageStockModel();
        Vector dataAdd = new Vector();
        DefaultTableModel model = (DefaultTableModel) jcomp.getModel();
        //int flag=0;
        int count = 0;
        if (get.size() != 0) {
            for (int j = 0; j < get.size(); j++) {
                damagestockBean = (DamageStockModel) get.get(j);
                for (int i = 0; i < jcomp.getRowCount(); i++) {
                    String itemname = jcomp.getValueAt(i, 1) + "";
                    String damageQty = jcomp.getValueAt(j, 5) + "";
                    
                    if (itemname.equals(damagestockBean.getDamage_item_name())) {
                        flag = 1;
                        rno = i;
                    }
                }
                if (flag == 0) {

                    
                    dataAdd.addElement(count + 1);
                    dataAdd.addElement(damagestockBean.getDamage_item_name());
                    dataAdd.addElement(damagestockBean.getDamage_batch_no());
                    dataAdd.addElement(DateUtils.normalFormatDate(damagestockBean.getDamage_invoice_date()));
                    dataAdd.addElement(damagestockBean.getDamage_purchased_qty());
                    dataAdd.addElement(0);
                    dataAdd.addElement(damagestockBean.getDamage_unit_vat());
                    dataAdd.addElement(damagestockBean.getDamage_unit_discount());
                    dataAdd.addElement(damagestockBean.getDamage_unit_price());
                    dataAdd.addElement(damagestockBean.getDamage_total_amount());
                    dataAdd.addElement(damagestockBean.getDamage_remarks());
                    model.insertRow(j, dataAdd);
                } else {
                    //Alert.confirm("Damage Stock", "Item Name already exists");
                    //flag = 1;
                }
                jcomp.requestFocus();
                jcomp.changeSelection(j, 5, false, false);
                jcomp.setCellSelectionEnabled(true);
                jcomp.setEditingRow(j);
                jcomp.setEditingColumn(5);
            }
        }
        count++;

    }

//    public static void addText(String[] get) {
//        int rno = 0;
//
//        int rowCount = jcomp.getRowCount();
//        DefaultTableModel model = (DefaultTableModel) jcomp.getModel();
//        Vector datas = new Vector();
//        datas.size();
//        int getlength = get.length;
//        if (getlength != 0) {
//            for (int i = 0; i < rowCount; i++) {
//                String itemname = jcomp.getValueAt(i, 1) + "";
//                if (itemname.equals(get[0])) {
//                    flag = 1;
//                    rno = i;
//                }
//            }
//            if (flag == 0) {
//                for (int i = 0; i < get.length + 4; i++) {
//                    if (i == 0) {
//                        datas.addElement(jcomp.getRowCount() + 1);
//                    } else if (i <= 4) {
//                        datas.addElement(get[i - 1]);
//                    } else if (i == 5) {
//                        datas.addElement(Integer.parseInt("0"));
//                    } else if (i <= 8) {
//                        datas.addElement(Double.parseDouble(get[i - 2]));
//                    } else if (i == 9) {
//                        datas.addElement(Double.parseDouble("0.00"));
//                    } else if (i == 10) {
//                        datas.addElement("");
//                    }
//                }
//                model.insertRow(jcomp.getRowCount(), datas);
//            } else {
//                Alert.confirm("Damage Stock", "Item Name already exists");
//                for (int i = 0; i < get.length; i++) {
//                    if (i == 0) {
//                        datas.addElement(jcomp.getRowCount() + 1);
//                    } else if (i <= 4) {
//                        datas.addElement(get[i - 1]);
//                    } else if (i == 5) {
//                        datas.addElement(Integer.parseInt("0"));
//                    } else if (i <= 9) {
//                        datas.addElement(Double.parseDouble(get[i - 1]));
//                    } else if (i == 10) {
//                        datas.addElement(get[i]);
//                    }
//                }
//            }
//            jcomp.requestFocus();
//            jcomp.changeSelection(rowCount, 5, false, false);
//            jcomp.setCellSelectionEnabled(true);
//            jcomp.setEditingRow(rowCount);
//            jcomp.setEditingColumn(5);
//        }
//    }
    public static int getRowCount() {
        int row = jcomp.getModel().getRowCount();
        return row;
    }

    /*  public static void removeRow() {
    int i = jcomp.getSelectedRow();
    if (i != -1) {
    DefaultTableModel model = (DefaultTableModel) jcomp.getModel();
    model.removeRow(i);
    if (i != 0) {
    jcomp.changeSelection(i + 1, 5, false, false);
    }
    } else {
    JOptionPane.showMessageDialog(jcomp, "Please select row to remove ...");
    }
    }*/
    public int removeRow() {
        int retVal = 0;
        int i = jcomp.getSelectedRow();
        if (jcomp.getRowCount() <= 0) {
            retVal = 101; // there is no row proceed to remove
        } else if (i != -1) {
            DefaultTableModel model = (DefaultTableModel) jcomp.getModel();
            model.removeRow(i);
            if (i != 0) {
                jcomp.changeSelection(i + 1, 5, false, false);
            }
        } else {
            retVal = 100;
        }
        DamageStockCalculations();
        return retVal;
    }

    public static int checkDmgStock() {
        int checkVal = 0;
        for (int i = 0; i < jcomp.getRowCount(); i++) {
            if (jcomp.getValueAt(i, 5) == null) {
                checkVal = 100;
                break;
            } else {
                int purVal = Integer.parseInt(jcomp.getValueAt(i, 4).toString());
                int damagVal = Integer.parseInt(jcomp.getValueAt(i, 5).toString());
                if (purVal < damagVal) {
                    checkVal = 101;
                    jcomp.changeSelection(i, 5, false, false);
                    break;
                }
            }
        }
        return checkVal;
    }

    public static void clearData() {
        DefaultTableModel model = (DefaultTableModel) jcomp.getModel();
        model.getDataVector().removeAllElements();
        jcomp.revalidate();
    }

    public String[][] getDamageValues() {
        int rowCount = jcomp.getModel().getRowCount();
        int colCount = jcomp.getModel().getColumnCount();
        String[][] values = new String[rowCount][colCount];
        for (int i = 0; i < rowCount; i++) {
            for (int j = 0; j < colCount; j++) {
                values[i][j] = "" + jcomp.getModel().getValueAt(i, j);
            }
        }
        return values;
    }

    public static void setCellRenderColor(JComponent jt, Color even, Color odd) {
        final Color c = even;
        final Color c1 = odd;
        JTable temp = (JTable) jt;
        temp = new JTable() {

            @Override
            public Component prepareRenderer(TableCellRenderer renderer, int Index_row, int Index_col) {
                Component comp = super.prepareRenderer(renderer, Index_row, Index_col);
                if (Index_row == 0 || Index_row % 2 == 0 && !isCellSelected(Index_row, Index_col)) {
                    comp.setBackground(c);
                } else {
                    comp.setBackground(c1);
                }
                return comp;
            }
        };
    }

    public static void setHeaderColor(JComponent jt, Color c) {
        JTable temp = (JTable) jt;
        temp.getTableHeader().setBackground(c);
    }

    public static void focusSet() {
        jcomp.requestFocus();
        jcomp.changeSelection(0, 0, false, false);
        jcomp.changeSelection(0, 1, false, false);
        jcomp.setCellSelectionEnabled(true);
    }

    public static void focusSet(int i, int j) {
        jcomp.requestFocus();
        if (j != 0) {
            jcomp.changeSelection(i, (j - 1), false, false);
        } else {
            jcomp.changeSelection(i, (j + 1), false, false);
        }

        jcomp.changeSelection(i, j, false, false);
        jcomp.setCellSelectionEnabled(true);
        jcomp.setEditingRow(i);
        jcomp.setEditingColumn(j);
    }

    public void DamageStockCalculations() {
        int rowCount = jcomp.getRowCount();

        int[] qty = new int[rowCount];
        double[] uprice = new double[rowCount];
        double[] vat = new double[rowCount];
        double[] dist = new double[rowCount];
        double[] subTot = new double[rowCount];
        totDistAmt = 0;
        totVATAmt = 0;
        totAmt = 0;
        totQty = 0;
        totItems = 0;
        int rw = jcomp.getRowCount();
        if (rowCount > 0) {
            for (int i = 0; i < rowCount; i++) {
                if (jcomp.getValueAt(i, 11) == null);
                else {
                    Object val = jcomp.getValueAt(i, 11);
                    
                    if (!Boolean.parseBoolean(val.toString()))
                    {
                        ;
                    } else
                        if (jcomp.getModel().getValueAt(i, 11).equals(true)) {
                        if (jcomp.getModel().getValueAt(i, 1) != null && jcomp.getModel().getValueAt(i, 2) != null && jcomp.getModel().getValueAt(i, 4) != null && jcomp.getModel().getValueAt(i, 5) != null) {
                            int purQty = Integer.parseInt("" + jcomp.getModel().getValueAt(i, 4));
                            int damQty = Integer.parseInt("" + jcomp.getModel().getValueAt(i, 5));
                            if (damQty != 0 ||damQty == 0)
                            {
                                //chkDamgeQty = 1;
                                if (jcomp.getModel().getValueAt(i, 1) == null || jcomp.getModel().getValueAt(i, 1).equals("")) {
                                } else {
                                    {
                                        totItems++;
                                    }
                                    if (jcomp.getModel().getValueAt(i, 5) == null || jcomp.getModel().getValueAt(i, 5).equals("") || jcomp.getModel().getValueAt(i, 5) == "0") {
                                        qty[i] = 0;
                                    } else {
                                        qty[i] = Integer.parseInt(jcomp.getModel().getValueAt(i, 5).toString());
                                    }
                                    if (jcomp.getModel().getValueAt(i, 8) == null || jcomp.getModel().getValueAt(i, 8).equals("")) {
                                        uprice[i] = 0;
                                    } else {
                                        uprice[i] = Double.parseDouble("" + jcomp.getModel().getValueAt(i, 8));
                                    }
                                    if (jcomp.getModel().getValueAt(i, 7) == null || jcomp.getModel().getValueAt(i, 7).equals("")) {
                                        dist[i] = 0;
                                    } else {
                                        dist[i] = qty[i] * uprice[i] * (Double.parseDouble("" + jcomp.getModel().getValueAt(i, 7)) / 100);
                                    }
                                    if (jcomp.getModel().getValueAt(i, 6) == null || jcomp.getModel().getValueAt(i, 6).equals("")) {
                                        vat[i] = 0;
                                    } else {
                                        vat[i] = ((qty[i] * uprice[i]) - dist[i]) * (Double.parseDouble("" + jcomp.getModel().getValueAt(i, 6)) / 100);
                                        totVATAmt += vat[i];
                                    }
                                    subTot[i] = Value.Round(((qty[i] * uprice[i]) - dist[i]) + vat[i], 2);
                                    totAmt += subTot[i];
                                    jcomp.setValueAt(subTot[i], i, 9);
                                }
                                tot++;
                                
                            } else {
                                rowCount--;
                            }
                            
                        }
                    }                    
                }
            }
//            if (tot == rw) {
//                tabHead.select();

//            }
//            else {
//        }
        }
     
    }

    public static int total(int colNum) {
        int tot = 0;
        int colNo = colNum;
        for (int i = 0; i < jcomp.getModel().getRowCount(); i++) {
            if (jcomp.getModel().getValueAt(i, colNo) != null);
            tot += Double.parseDouble("" + jcomp.getModel().getValueAt(i, colNo));
        }
        return tot;
    }

    public static int totalRow() {
        int tot = 0;
        for (int i = 0; i < jcomp.getModel().getRowCount(); i++) {
            if (jcomp.getModel().getValueAt(i, 2) != null) {
                tot += 1;
            }
        }
        return tot;
    }

    public static String InvoiceNo(String InvNo) {
        ino = InvNo;
        return ino;
    }
}
