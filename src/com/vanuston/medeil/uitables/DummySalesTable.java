package com.vanuston.medeil.uitables;

import com.vanuston.medeil.util.DecimalFormatRenderer;
import com.vanuston.medeil.model.SalesModel;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.PercentageFormatRenderer;
import com.vanuston.medeil.util.Value;
import java.awt.Font;
import java.awt.Color;
import java.awt.event.MouseWheelEvent;
import java.util.Vector;
import javax.swing.*;
import java.awt.event.KeyEvent;
import java.awt.event.KeyAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.ActionEvent;
import java.awt.event.MouseAdapter;
import java.util.ArrayList;
import java.util.List;
import javax.swing.table.DefaultTableModel;
import javafx.stage.Alert;

public class DummySalesTable {

    static Logger log = Logger.getLogger(DummySalesTable.class, "Utilities");
    public JTable jcomp;
    public  SalesTableModel dtmodel;
    public String thisForm = null;
    public int initR;
    public JScrollPane scrollPane = new JScrollPane();
    public int qty[];
    public double uprice[];
    public double vat4[];
    public double dist[];
    public double subTot[];
    public int stockQty;
    public int totQty = 0;
    public int totItems = 0;
    public double totAmt = 0.00;
    public double totDistAmt = 0.0;
    public double totVATAmt4 = 0.0;
  //  public static double totVATAmt12 = 0.0;
    public int nullVal;
    public KeyStroke focusOut = KeyStroke.getKeyStroke(KeyEvent.VK_SPACE, KeyEvent.CTRL_MASK);
    public KeyStroke focusOut1 = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, KeyEvent.CTRL_MASK);
    public KeyStroke callTable = KeyStroke.getKeyStroke(KeyEvent.VK_T, KeyEvent.CTRL_MASK);
    public KeyStroke shrctF2 = KeyStroke.getKeyStroke(KeyEvent.VK_F2, 0);
    public KeyStroke shrctF3 = KeyStroke.getKeyStroke(KeyEvent.VK_F3, 0);
    public KeyStroke shrctF4 = KeyStroke.getKeyStroke(KeyEvent.VK_F4, 0);
    public KeyStroke shrctF5 = KeyStroke.getKeyStroke(KeyEvent.VK_F5, 0);
    public KeyStroke shrctF6 = KeyStroke.getKeyStroke(KeyEvent.VK_F6, 0);
    public KeyStroke shrctF7 = KeyStroke.getKeyStroke(KeyEvent.VK_F7, 0);
    public KeyStroke shrctF8 = KeyStroke.getKeyStroke(KeyEvent.VK_F8, 0);
    public KeyStroke shrctF12 = KeyStroke.getKeyStroke(KeyEvent.VK_F12, 0);
    public KeyStroke shrctCtrlAr = KeyStroke.getKeyStroke(KeyEvent.VK_LEFT, KeyEvent.CTRL_MASK);
    public double amt = 0.00;
    public String itN = "";
    public GetDummySales g;

    /**
     *
     * @param initRow
     * @param colName
     * @param type
     * @param canEdit
     * @param width
     * @param form
     * @return
     */
    public JComponent createTable(final int initRow, Object[] colName, Class[] type, boolean[] canEdit, int[] width, String form) {
        thisForm = form;
        initR = initRow;
        final Class[] types = type;
        final boolean[] canEditCols = canEdit;
        final int[] colWidth = width;
        jcomp = new JTable();
        SwingUtilities.updateComponentTreeUI(jcomp);
        g = new GetDummySales(jcomp);
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
            dtmodel=new SalesTableModel(data,cols,types,canEditCols);
            jcomp.setModel(dtmodel);
        } catch (Exception ex) {
            String ss = "Method: Create Table    Exception : " + ex.getMessage();
            log.debug(ss);
        }

        jcomp.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        jcomp.setSelectionMode(0);
        jcomp.getTableHeader().setBackground(new Color(226, 238, 244));
        jcomp.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
        jcomp.setShowGrid(true);
        jcomp.getTableHeader().setReorderingAllowed(false);
        jcomp.getColumnModel().getColumn(11).setCellRenderer(new DecimalFormatRenderer());
        jcomp.getColumnModel().getColumn(10).setCellRenderer(new PercentageFormatRenderer());
        jcomp.getColumnModel().getColumn(9).setCellRenderer(new PercentageFormatRenderer());
        jcomp.putClientProperty("terminateEditOnFocusLost", Boolean.TRUE);
        jcomp.getInputMap().put(focusOut, "focusOut");
        jcomp.getInputMap().put(focusOut1, "focusOut");
        jcomp.getInputMap().put(shrctF2, "focusOut");
        jcomp.getInputMap().put(shrctF3, "focusOut");
        jcomp.getInputMap().put(shrctF4, "focusOut");
        jcomp.getInputMap().put(shrctF5, "focusOut");
        jcomp.getInputMap().put(shrctF6, "focusOut");
        jcomp.getInputMap().put(shrctF7, "focusOut");
        jcomp.getInputMap().put(shrctF8, "focusOut");
        jcomp.getInputMap().put(shrctCtrlAr, "focusOut");
        jcomp.getInputMap().put(shrctF12, "removeRow");
        jcomp.getInputMap().put(callTable, "callTable");
        jcomp.getActionMap().put("removeRow", new AbstractAction("removeRow") {

            @Override
            public void actionPerformed(ActionEvent evt) {
                removeRow();
            }
        });
        jcomp.getActionMap().put("focusOut", new AbstractAction("focusOut") {

            @Override
            public void actionPerformed(ActionEvent evt) {
                jcomp.clearSelection();
                jcomp.transferFocus();
            }
        });
        jcomp.getActionMap().put("callTable", new AbstractAction("callTable") {

            @Override
            public void actionPerformed(ActionEvent evt) {
                g.refreshStockTab();
            }
        });


        if (colWidth.length > 0) {
            for (int i = 0; i < len; i++) {
                jcomp.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
            }
        }
        jcomp.setGridColor(new java.awt.Color(204, 204, 255));
        jcomp.setCellSelectionEnabled(true);
        jcomp.setRowHeight(20);
        jcomp.setSelectionBackground(Color.LIGHT_GRAY);
        jcomp.setSelectionForeground(Color.RED);
        jcomp.revalidate();
        jcomp.addMouseListener(new MouseAdapter() {

            @Override
            public void mouseClicked(MouseEvent e) {
                final int i = jcomp.getSelectedRow();
                final int j = jcomp.getSelectedColumn();

                for (int val = 0; val < jcomp.getRowCount(); val++) {
                    if (jcomp.getModel().getValueAt(val, 4) == null); else {
                        if (jcomp.getModel().getValueAt(val, 4).equals(0)) {
                            jcomp.changeSelection(val, 4, false, false);
                        }
                    }
                }
            }

        });
        jcomp.addKeyListener(new KeyAdapter() {

            @Override
            public void keyReleased(KeyEvent e) {
                final int i = jcomp.getSelectedRow();
                final int j = jcomp.getSelectedColumn();
                try {
                    salesCalculations();
                    if (e.getKeyCode() == 10) {
                        InputMap im = jcomp.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                        KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                        KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                        im.put(enter, im.get(tab));
                    }
                    if ((j == 1 || j == 2) && e.getKeyCode() != 27) {
                        for (int val = 0; val < jcomp.getRowCount(); val++) {
                            if (jcomp.getModel().getValueAt(val, 2) == null) {
                                if (jcomp.getModel().getValueAt(val, 0) == null) {
                                    jcomp.getModel().setValueAt(val + 1, val, 0);
                                }
                                jcomp.changeSelection(val, 2, false, false);
                                break;
                            }
                        }
                        g.refreshStockTab();
                    }
                 
                    itN = (String) jcomp.getModel().getValueAt(i, 2);
                 
                    if (j == 6) {
                        int stkQty = 0;
                        stkQty = 9000000;
                        int qty = 0;
                        if (jcomp.getModel().getValueAt(i, 4) == null); else {
                            qty = Integer.parseInt(jcomp.getModel().getValueAt(i, 4).toString());
                        }
                        if (qty == 0) {
                            jcomp.changeSelection(i, 4, false, false);
                        } else {
                            double sp = 0;
                            if (qty <= stkQty) {
                                if (i == jcomp.getModel().getRowCount() - 1) {
                                    addRow();
                                }
                                jcomp.changeSelection(i, 9, false, false);
                                
                            } else {
                                String ss = "";
                                if (stkQty == 0) {
                                    ss = "Please this Medicine " + jcomp.getModel().getValueAt(i, 2) + " is Out of Stock";
                                } else {
                                    ss = "Please enter quantity less than Stock Quantity of Medicine " + jcomp.getModel().getValueAt(i, 2) + " is : " + stkQty;
                                }
                                Alert.inform("Sales Cash", ss);
                                jcomp.requestFocus();
                                jcomp.changeSelection(i, 4, false, false);
                            }
                        }
                    }
                    else if(j==10) {
                            jcomp.changeSelection(i + 1, 1, false, false);
                            jcomp.getModel().setValueAt(i + 2, i + 1, 0);
                            g.refreshStockTab();
                    }
                    else if(i == jcomp.getModel().getRowCount() - 1 && j==10) {
                            addRow();
                        }
                } catch (Exception ex) {
                    String ss = "Method: tablekeyReleased    Exception : " + ex.getMessage();
                    log.debug(ss);
                }
            }

            @Override
            public void keyPressed(KeyEvent e) {
                final int i = jcomp.getSelectedRow();
                final int j = jcomp.getSelectedColumn();
                InputMap im = jcomp.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                try {
                    salesCalculations();
                    if (e.getKeyCode() == 10) {
                        KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                        KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                        im.put(enter, im.get(tab));
                    }
                    if (e.isActionKey()) {
                        for (int val = 0; val < jcomp.getRowCount(); val++) {
                            if (jcomp.getModel().getValueAt(val, 1) == null); else {
                                jcomp.getModel().setValueAt(val + 1, val, 0);
                            }
                            if (jcomp.getModel().getValueAt(val, 4) == null); else {
                                if (Integer.parseInt(jcomp.getModel().getValueAt(val, 4).toString()) == 0) {
                                    jcomp.changeSelection(val, 4, false, false);
                                    break;
                                }
                            }
                        }
                    }
                      if (e.getKeyCode() == KeyEvent.VK_DELETE || e.getKeyCode() == KeyEvent.VK_BACK_SPACE) {
                            if (jcomp.getModel().isCellEditable(i, j)) {
                                jcomp.getModel().setValueAt("", i, j);
                            }
                        }
                        else {
                            char c = e.getKeyChar();
                            if(jcomp.getModel().isCellEditable(i, j) && j!=5) {
                            if((c>'0' && c<='9'))
                            jcomp.getModel().setValueAt(0, i, j);
                     }
                        }

                } catch (Exception ex) {
                    String ss = "Method: tableKeyPressed    Exception : " + ex.getMessage();
                    log.debug(ss);
                }
            }

            @Override
            public void keyTyped(KeyEvent e) {
            }
        });
		return jcomp;
    }
    public JComponent getScrollTable(JComponent jt) {
        jcomp = (JTable) jt;
        scrollPane.add(jcomp);
        scrollPane.setViewportView(jcomp);
        return scrollPane;
    }

    public void addRow() {
        DefaultTableModel model = (DefaultTableModel) jcomp.getModel();
        int row = jcomp.getRowCount();
        Vector datas = new Vector();
        try {
            for (int i = 0; i < jcomp.getModel().getColumnCount(); i++) {
                if (row == 0 && i == 0) {
                    datas.addElement(i + 1);
                } else {
                    datas.addElement(null);
                }
            }
        } catch (Exception ex) {
            String ss = "Method: addRow    Exception : " + ex.getMessage();
            log.debug(ss);
        }
        model.insertRow(jcomp.getRowCount(), datas);
    }

    public void removeRow() {
        int i = jcomp.getSelectedRow();
        int j = jcomp.getSelectedColumn();
        int rows = jcomp.getRowCount();
        if (i != -1) {
            DefaultTableModel model = (DefaultTableModel) jcomp.getModel();

            if (rows == 1) {
                if (i == 0) {
                    model.removeRow(i);
                    resetValues();
                    for (int n = 0; n < initR; n++) {
                        addRow();
                    }
                    jcomp.changeSelection(0, j, false, false);
                }
            } else {
                model.removeRow(i);
                int rows1 = jcomp.getRowCount();

                if (i + 1 != rows) {
                    for (int n = 0; n < rows1; n++) {
                        if (jcomp.getModel().getValueAt(n, 0) == null) {
                            jcomp.getModel().setValueAt(1, 0, 0);
                        } else {
                            jcomp.getModel().setValueAt(n + 1, n, 0);
                        }
                    }
                    jcomp.changeSelection(i, j, false, false);
                } else {
                    jcomp.changeSelection(i - 1, j, false, false);
                }
            }
        } else {
            Alert.inform("Please select row to remove ...");
        }
    }

    public void clearData() {
        DefaultTableModel model = (DefaultTableModel) jcomp.getModel();
        model.getDataVector().removeAllElements();
        for (int i = 0; i < initR; i++) {
            addRow();
        }
        salesCalculations();
        jcomp.revalidate();
    }
    public  List getSalesBillItems() {
        List<SalesModel> salesBillItems = new ArrayList<SalesModel>();
        
        try {
        
        SalesModel model;
        try {
            for (int index = 0; index < jcomp.getRowCount(); index++) {
                
                if (!(jcomp.getModel().getValueAt(index, 1) == null)) {
                    model = new SalesModel();
                    model.setItemCode(jcomp.getModel().getValueAt(index, 1).toString());
                    model.setItemName(jcomp.getModel().getValueAt(index, 2).toString());
                    model.setFormulation(jcomp.getModel().getValueAt(index,3).toString());
                    if(jcomp.getModel().getValueAt(index, 4) == null || jcomp.getModel().getValueAt(index, 4).toString().equals(""))
                    {
                        model.setQuantity(0);
                    }
                    else {
                    model.setQuantity((Integer)jcomp.getModel().getValueAt(index,4));
                    }
                    model.setBatchNumber(jcomp.getModel().getValueAt(index,5).toString());
                    model.setExpiryDate(jcomp.getModel().getValueAt(index,6).toString());
                    if(jcomp.getModel().getValueAt(index, 7) == null || jcomp.getModel().getValueAt(index, 7).toString().equals(""))
                    {
                        model.setUnitPrice(0.00);
                    }
                    else {
                        model.setUnitPrice((Double)jcomp.getModel().getValueAt(index,7));
                    }
                    

                    if(jcomp.getModel().getValueAt(index, 8) == null || jcomp.getModel().getValueAt(index, 8).toString().equals(""))
                    {
                        model.setMrp(0.00);
                    }
                    else {
                    model.setMrp((Double)jcomp.getModel().getValueAt(index,8));
                    }
                    
                    if(jcomp.getModel().getValueAt(index, 9) == null || jcomp.getModel().getValueAt(index, 9).toString().equals("")) {
                        model.setUnitDiscount(0.00);
                    }
                    else {
                        model.setUnitDiscount((Double)jcomp.getModel().getValueAt(index,9));
                    }
                    
                    if(jcomp.getModel().getValueAt(index, 10) == null || jcomp.getModel().getValueAt(index, 10).toString().equals("")) {
                    model.setUnitVAT(0.00);
                    }
                    else {
                    model.setUnitVAT((Double)jcomp.getModel().getValueAt(index,10));
                    }
                    
                    model.setSubTotal((Double)jcomp.getModel().getValueAt(index,11));
                    model.setTotalItems(0);
                    salesBillItems.add(model);
                }
            }
        }
     catch (Exception e) {            
            String ss = "Method: getSalesBillItems    Exception1 : " + e.getMessage();
            log.debug(ss);
        }
        } catch(Exception e) {
            log.debug("Method: getSalesBillItems    Exception2 : " + e.getMessage());
        }
        return salesBillItems;
    }

    public void resetValues() {

        totQty = 0;
        totItems = 0;
        totAmt = 0.00;
        totDistAmt = 0.0;
        totVATAmt4 = 0.0;
        amt = 0.00;
    }

    public void focusSet() {
        jcomp.requestFocus();
        jcomp.changeSelection(0, 1, false, false);
        jcomp.getModel().setValueAt("1", 0, 0);
        jcomp.setCellSelectionEnabled(true);
    }

    public void focusSet(int row, int col) {
        jcomp.requestFocus();
        jcomp.changeSelection(row, col, false, false);
        jcomp.setCellSelectionEnabled(true);
    }

    public int total(int colNum) {
        int tot = 0;
        int colNo = colNum;
        for (int i = 0; i < jcomp.getModel().getRowCount(); i++) {
            if (jcomp.getModel().getValueAt(i, colNo) == null || jcomp.getModel().getValueAt(i, colNo).equals("")) {
                tot += 0;
            } else {
                tot += Double.parseDouble("" + jcomp.getModel().getValueAt(i, colNo));
            }
        }
        return tot;
    }

    public int totalItems() {
        int tot = 0;
        for (int i = 0; i < jcomp.getModel().getRowCount(); i++) {
            if (jcomp.getModel().getValueAt(i, 2) != null || jcomp.getModel().getValueAt(i, 2) != "") {
                tot++;
            }
        }
        return tot;
    }

    public void salesCalculations() {
        int rowCount = jcomp.getRowCount();
        qty = new int[rowCount];
        uprice = new double[rowCount];
        vat4 = new double[rowCount];
        dist = new double[rowCount];
        subTot = new double[rowCount];
        totDistAmt = 0;
        totVATAmt4 = 0;
     //-   totVATAmt12 = 0;
        totAmt = 0;
        totQty = 0;
        totItems = 0;
        try {
            for (int i = 0; i < rowCount; i++) {
                if (jcomp.getModel().getValueAt(i, 2) == null || jcomp.getModel().getValueAt(i, 2).equals("") || jcomp.getModel().getValueAt(i, 4) == null) {
                    if (i == 0) {
                        nullVal = 0;
                    }
                } else {
                    nullVal = 1;
                    totItems++;
                    if (jcomp.getModel().getValueAt(i, 4) == null) {
                        jcomp.changeSelection(i, 4, false, false);
                    }
                    else {
                        if (jcomp.getModel().getValueAt(i, 4).equals("")) {
                            qty[i] = 0;
                        } else {
                            qty[i] = Integer.parseInt(jcomp.getModel().getValueAt(i, 4).toString());
                        }
                        if (jcomp.getModel().getValueAt(i, 7) == null || jcomp.getModel().getValueAt(i, 7).equals("")) {
                            uprice[i] = 0.0;
                        } else {
                            uprice[i] = Double.parseDouble("" + jcomp.getModel().getValueAt(i, 7));
                        }

                        subTot[i] = Value.Round(qty[i] * uprice[i], 2);
                        jcomp.getModel().setValueAt(subTot[i], i, 11);
                        totAmt += Value.Round(subTot[i], 2);
                        if (jcomp.getModel().getValueAt(i, 9) == null || jcomp.getModel().getValueAt(i, 9).equals("")) {
                            dist[i] = 0;
                        } else {
                            dist[i] = Value.Round(subTot[i] * (Double.parseDouble("" + jcomp.getModel().getValueAt(i, 9)) / 100), 2);
                        }
                        totDistAmt += Value.Round(dist[i], 2);
                        if (jcomp.getModel().getValueAt(i, 10) == null || jcomp.getModel().getValueAt(i, 10).equals("")) {
                            vat4[i] = 0;
                        } 
                        else {
                            double vatPerc = Double.parseDouble("" + jcomp.getModel().getValueAt(i, 10));
                            vat4[i] = Value.Round((qty[i]*uprice[i]*vatPerc)/(100+vatPerc), 2);
                        }
                        totVATAmt4 += Value.Round(vat4[i], 2);
                        totQty += qty[i];
                    } 
                }
            }
        } catch (Exception ex) {
            String ss = "Method: salesCalculations    Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

    public void calcDiscount(String discAmt) {
        double discPerc=0.00;
        discPerc=Value.Round(Double.parseDouble(discAmt)*100/totAmt,2);
        for (int index = 0; index < jcomp.getModel().getRowCount(); index++) {
            if (jcomp.getModel().getValueAt(index, 2) != null && jcomp.getModel().getValueAt(index, 2) != "" && jcomp.getModel().getValueAt(index, 2) != "null" ) {
            jcomp.getModel().setValueAt(discPerc, index, 9);
            }
        }
        salesCalculations();
    }
    
}
