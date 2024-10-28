package com.vanuston.medeil.uitables;

import com.vanuston.medeil.model.SalesModel;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseWheelEvent;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import javafx.stage.Alert;
import javax.swing.JTextField;
import com.vanuston.medeil.util.DecimalFormatRenderer;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.PercentageFormatRenderer;
import com.vanuston.medeil.util.Value;

public class SalesReturnTable {

    static Logger log = Logger.getLogger(SalesReturnTable.class, "Utilities");
    public static JTable jcomp;
    public static JTextField jt;
    public static String thisForm = null;
    public static int initR;
    public static JScrollPane scrollPane = new JScrollPane();
    public static JComboBox jcoB = new JComboBox();
    public static int qty[];
    public static double uprice[];
    public static double vat[];
    public static double dist[];
    public static double subTot[];
    public static int stockQty;
    public static int totQty = 0;
    public static int totItems = 0;
    public static double totAmt = 0.00;
    public static double totDistAmt = 0.0;
    public static double totVATAmt = 0.0;
    public static int nullVal;
    public static KeyStroke focusOut = KeyStroke.getKeyStroke(KeyEvent.VK_SPACE, KeyEvent.CTRL_MASK);
    public static KeyStroke focusOut1 = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, KeyEvent.CTRL_MASK);
    public static KeyStroke callTable = KeyStroke.getKeyStroke(KeyEvent.VK_T, KeyEvent.CTRL_MASK);
    public static KeyStroke shrctF2 = KeyStroke.getKeyStroke(KeyEvent.VK_F2, 0);
    public static KeyStroke shrctF3 = KeyStroke.getKeyStroke(KeyEvent.VK_F3, 0);
    public static KeyStroke shrctF4 = KeyStroke.getKeyStroke(KeyEvent.VK_F4, 0);
    public static KeyStroke shrctF5 = KeyStroke.getKeyStroke(KeyEvent.VK_F5, 0);
    public static KeyStroke shrctF6 = KeyStroke.getKeyStroke(KeyEvent.VK_F6, 0);
    public static KeyStroke shrctF7 = KeyStroke.getKeyStroke(KeyEvent.VK_F7, 0);
    public static KeyStroke shrctF8 = KeyStroke.getKeyStroke(KeyEvent.VK_F8, 0);
    public static KeyStroke shrctF12 = KeyStroke.getKeyStroke(KeyEvent.VK_F12, 0);
    public static KeyStroke shrctCtrlAr = KeyStroke.getKeyStroke(KeyEvent.VK_LEFT, KeyEvent.CTRL_MASK);
    public static double amt = 0.00;
    private static int[] fqty;
    private static double fprice;

    public static JComponent createViewTable(final int initRow, Object[] colName, Class[] type, boolean[] canEdit, int[] width) {
        final Class[] types = type;
        final boolean[] canEditCols = canEdit;
        final int[] colWidth = width;
        initR = initRow;
        jcomp = new JTable();
        Vector cols = new Vector();
        Vector data = new Vector();
        int len = colName.length;
        for (int i = 1; i <= initRow; i++) {
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
            jcomp.setModel(new javax.swing.table.DefaultTableModel(data, cols) {

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
            String ss = " Method: createViewTable  Exception : " + ex;
            log.debug(ss);
        }
        for (int i = 0; i < len; i++) {
            jcomp.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }
        jcomp.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        jcomp.setSelectionMode(0);
        jcomp.getTableHeader().setBackground(new Color(226, 238, 244));
        jcomp.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
        jcomp.setShowGrid(true);
        jcomp.getTableHeader().setReorderingAllowed(false);
        jcomp.getColumnModel().getColumn(13).setCellRenderer(new DecimalFormatRenderer());//12
        jcomp.getColumnModel().getColumn(11).setCellRenderer(new PercentageFormatRenderer());
        jcomp.getColumnModel().getColumn(10).setCellRenderer(new PercentageFormatRenderer());
        jcomp.removeColumn(jcomp.getColumnModel().getColumn(14));//14
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
		        jcomp.addMouseListener(new MouseAdapter() {

            @Override
            public void mouseClicked(MouseEvent e) {
				salesCalculations();
            }
        });
        jcomp.addKeyListener(new KeyAdapter() {

            @Override
            public void keyReleased(KeyEvent e) {
                salesCalculations();
                final int i = jcomp.getSelectedRow();
                final int j = jcomp.getSelectedColumn();
                if (e.getKeyCode() == 10) {
                    InputMap im = jcomp.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                    KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                    KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                    im.put(enter, im.get(tab));
                }
                if (j == 5) {
                    int qty = 0;

                    if (jcomp.getModel().getValueAt(i, 4) == null || jcomp.getModel().getValueAt(i, 4).equals("0")); else {
                        jcomp.changeSelection(i + 1, 4, false, false);
                    }
                }
            }

            @Override
            public void keyPressed(KeyEvent e) {
                final int i = jcomp.getSelectedRow();
                final int j = jcomp.getSelectedColumn();
                InputMap im = jcomp.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                salesCalculations();
                if (e.getKeyCode() == 10) {
                    KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                    KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                    im.put(enter, im.get(tab));
                }
            }
        });      
        jcomp.setGridColor(new java.awt.Color(204, 204, 255));
        jcomp.setCellSelectionEnabled(true);
        jcomp.setRowHeight(25);
        jcomp.setSelectionBackground(Color.LIGHT_GRAY);
        jcomp.setSelectionForeground(Color.RED);
        jcomp.revalidate();
			
		return jcomp;
}
    public static JComponent getScrollTable(JComponent jt) {
        jcomp = (JTable) jt;
        scrollPane.add(jcomp);
        scrollPane.setViewportView(jcomp);
        return scrollPane;
    }
    public void restuctureViewTable(SalesModel tableVal) {
        DefaultTableModel model = (DefaultTableModel) jcomp.getModel();
        model.getDataVector().removeAllElements();
        int row = jcomp.getRowCount();
        SalesModel salesModel=tableVal;
        List<SalesModel> tableList=new ArrayList();
        tableList=salesModel.getListofitems();
        System.out.println("oooooooooo");
     for (int i = 0; i < tableList.size()-row; i++)
        {
            addRow();
            System.out.println("oo");
        }
               System.out.println("oo1");
        for (int j = 0; j < tableList.size(); j++) {
               System.out.println("oooooooooo1111111111111111");
            SalesModel sales=tableList.get(j);
            jcomp.getModel().setValueAt(j+1,j,0);
            jcomp.getModel().setValueAt(sales.getItemCode(),j,1);
            jcomp.getModel().setValueAt(sales.getItemName(),j,2);
            jcomp.getModel().setValueAt(sales.getFormulation(),j,3);
            jcomp.getModel().setValueAt(sales.getPquantity(),j,4);
            jcomp.getModel().setValueAt(sales.getQuantity(),j,5);
            jcomp.getModel().setValueAt(sales.getBatchNumber(),j,6);
            jcomp.getModel().setValueAt(sales.getReturnExpiryDate(),j,7);
            jcomp.getModel().setValueAt(sales.getUnitPrice(),j,8);
            jcomp.getModel().setValueAt(sales.getMrp(),j,9);
            jcomp.getModel().setValueAt(sales.getUnitDiscount(),j,10);
            jcomp.getModel().setValueAt(sales.getUnitVAT(),j,11);
              System.out.println("oooooooooo1111111111111111222222222222222");
           //   jcomp.getModel().setValueAt(sales.getFprice(),j,12);
            jcomp.getModel().setValueAt(sales.getSubTotal(),j,12);//12
            jcomp.getModel().setValueAt(sales.getTotalItems(),j,13);//13
        }
    }


    public static void addRow() {
        DefaultTableModel model = (DefaultTableModel) jcomp.getModel();
        int row = jcomp.getRowCount();
        Vector datas = new Vector();
        for (int i = 0; i < jcomp.getModel().getColumnCount(); i++) {
            if (row == 0 && i == 0) {
                datas.addElement(i + 1);
            } else {
                datas.addElement(null);
            }
        }
        model.insertRow(jcomp.getRowCount(), datas);
    }

    public static void removeRow() {
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
                    jcomp.changeSelection(0, 0, false, false);
                }
            } else {
                model.removeRow(i);
                int rows1 = jcomp.getRowCount();
                if (i + 1 != rows) {
                    for (int n = 0; n < rows1; n++) {
                        if (jcomp.getModel().getValueAt(n, 0) == null); else {
                            jcomp.getModel().setValueAt(n + 1, n, 0);
                        }
                    }
                    jcomp.changeSelection(rows1 - 1, j, false, false);
                } else {
                    jcomp.changeSelection(i - 1, j, false, false);
                }
            }
            salesCalculations();
        } else {
            Alert.inform("Please select row to remove ...");
        }
    }

    public static void clearData() {
        DefaultTableModel model = (DefaultTableModel) jcomp.getModel();
        model.getDataVector().removeAllElements();
        for (int i = 0; i < initR; i++) {
            addRow();
        }
        jcomp.revalidate();
    }

    public static void insertSalesData(String invNO) {
        clearData();
       new GetSalesReturnDatas(jcomp, "Sales", invNO).setVisible(true);
        salesCalculations();
    }

    public  List getSalesBillItems() {
        List<SalesModel> salesBillItems = new ArrayList<SalesModel>();
        int rowCount = 0;
        try {
        rowCount = jcomp.getRowCount();
        
        SalesModel model;
        try {
            for (int index = 0; index < rowCount; index++) {                
                if (!(jcomp.getModel().getValueAt(index, 1) == null)) {
                    model = new SalesModel();
                      System.out.println("s");
                    model.setItemCode(jcomp.getModel().getValueAt(index, 1).toString());
                    model.setItemName(jcomp.getModel().getValueAt(index, 2).toString());
                    model.setFormulation(jcomp.getModel().getValueAt(index,3).toString());
                    model.setPquantity((Integer)jcomp.getModel().getValueAt(index,4));
                    model.setQuantity((Integer)jcomp.getModel().getValueAt(index,5));
                    model.setBatchNumber(jcomp.getModel().getValueAt(index,6).toString());
                    model.setExpiryDate(jcomp.getModel().getValueAt(index,7).toString());
                    model.setUnitPrice((Double)jcomp.getModel().getValueAt(index,8));
                    model.setMrp((Double)jcomp.getModel().getValueAt(index,9));
                    model.setUnitDiscount((Double)jcomp.getModel().getValueAt(index,10));
                    model.setUnitVAT((Double)jcomp.getModel().getValueAt(index,11));
                     model.setFprice((Double)jcomp.getModel().getValueAt(index,12));
                    model.setSubTotal((Double)jcomp.getModel().getValueAt(index,13));//12
                      System.out.println("sret");
                  model.setTotalItems(Integer.parseInt(jcomp.getModel().getValueAt(index, 14).toString()));//13
                    salesBillItems.add(model);
                      System.out.println("sreturn1");
                }
            }
        }
     catch (Exception e) {
            
            String ss = "Method: getSalesBillItems    Exception_2 : " + e.getMessage();
            log.debug(ss);
        }
        } catch(Exception ex) {
            String ss = "Method: getSalesBillItems    Exception_2 : " + ex.getMessage();
            log.debug(ss);
        }
        return salesBillItems;
    }

    public static void resetValues() {
        totQty = 0;
        totItems = 0;
        totAmt = 0.00;
        totDistAmt = 0.0;
        totVATAmt = 0.0;
        amt = 0.00;
    }

    public static void focusSet() {
        jcomp.requestFocus();
        jcomp.changeSelection(0, 0, false, false);
		jcomp.changeSelection(0, 1, false, false);
        jcomp.setCellSelectionEnabled(true);
    }

    public static void focusSet(int row, int col) {
        jcomp.requestFocus();
			if(col!=0)			
				jcomp.changeSelection(row, (col-1), false, false);
			else
				jcomp.changeSelection(row, (col+1), false, false);	
				
        jcomp.changeSelection(row, col, false, false);
        jcomp.setCellSelectionEnabled(true);
    }

    public static int total(int colNum) {
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

    public static int totalItems() {
        int tot = 0;
        for (int i = 0; i < jcomp.getModel().getRowCount(); i++) {
            if (jcomp.getModel().getValueAt(i, 2) != null || jcomp.getModel().getValueAt(i, 2) != "") {
                tot++;
            }
        }
        return tot;
    }
    public  String[][] getTableValues() {
        int rowCount = jcomp.getModel().getRowCount();
        int colCount = jcomp.getModel().getColumnCount();
        String[][] values = new String[rowCount][colCount];
        try {
            for (int i = 0; i < rowCount; i++) {
                for (int j = 0; j < colCount; j++) {
                    if (jcomp.getModel().getValueAt(i, 1) == null && jcomp.getModel().getValueAt(i, 2) == null); else {
                        values[i][j] = "" + jcomp.getModel().getValueAt(i, j);
                    }
                }
            }
        } catch (Exception ex) {
            String ss = "Method: getTableValues    Exception : " + ex.getMessage();
            log.debug(ss);
        }
        return values;
    }

    public static void salesCalculations() {
        int rowCount = jcomp.getRowCount();
        qty = new int[rowCount];
        fqty= new int[rowCount];//jai
        uprice = new double[rowCount];
        vat = new double[rowCount];
        dist = new double[rowCount];
        subTot = new double[rowCount];
        totDistAmt = 0;
        totVATAmt = 0;
        totAmt = 0;
        totQty = 0;
        totItems = 0;
        double fprice = 0.00;
 try {
    for (int i = 0; i < rowCount; i++) {
        if (jcomp.getModel().getValueAt(i, 2) == null || jcomp.getModel().getValueAt(i, 2).equals("")) {
            if (i == 0) {
                nullVal = 0;
            }
        } else {
            nullVal = 1;
            totItems++;
//            if (jcomp.getModel().getValueAt(i, 4).equals(0)) {
//                if (jcomp.getModel().getValueAt(i, 4) == null || jcomp.getModel().getValueAt(i, 4).equals("")) {
//                    fqty[i] = 0;
//                } else {
//                    fqty[i] = Integer.parseInt(jcomp.getModel().getValueAt(i, 4).toString());
//                          System.out.println("Salesreturn");
//                     System.out.println(fqty[i]);
//                }
//            }
            System.out.println("Salesreturn");
            fqty[i] = Integer.parseInt(jcomp.getModel().getValueAt(i, 4).toString());
            System.out.println(fqty[i]);
 System.out.println("akk");
           // if (jcomp.getModel().getValueAt(i, 5).equals(0))
//            {
//                if (jcomp.getModel().getValueAt(i, 5) == null || jcomp.getModel().getValueAt(i, 5).equals("")) {
//                    qty[i] = 0;
//                } else {
//                    qty[i] = Integer.parseInt(jcomp.getModel().getValueAt(i, 5).toString());
                 qty[i] = Integer.parseInt(jcomp.getModel().getValueAt(i, 5).toString());
                    System.out.println("akkkkkkk");
                    System.out.println( qty[i]);
//                }

                if (jcomp.getModel().getValueAt(i, 8) == null || jcomp.getModel().getValueAt(i, 8).equals("")) {
                    uprice[i] = 0.0;
                } else {
                    uprice[i] = Double.parseDouble("" + jcomp.getModel().getValueAt(i, 8));
                     System.out.println( uprice[i]);
                }

                 if((jcomp.getModel().getValueAt(i, 12)!=null && !jcomp.getModel().getValueAt(i, 12).toString().equals(""))) {
                    fprice = Double.parseDouble(jcomp.getModel().getValueAt(i, 12).toString());
                }

                System.out.println(fprice);
                     System.out.println("subjai");
  System.out.println(fprice);
               // subTot[i] = Value.Round(qty[i]+fqty[i] * uprice[i], 2);
                  subTot[i] =   Value.Round(fqty[i] * fprice + qty[i] * uprice[i], 2);
                
                 System.out.println("subTot");
                    System.out.println(subTot[i]);
                    jcomp.getModel().setValueAt(subTot[i], i, 13);
                totAmt += Value.Round(subTot[i], 2);
                 System.out.println(totAmt);
                if (jcomp.getModel().getValueAt(i, 10) == null || jcomp.getModel().getValueAt(i, 10).equals("")) {
                    dist[i] = 0;
                } else {
                    dist[i] = Value.Round(subTot[i] * (Double.parseDouble("" + jcomp.getModel().getValueAt(i, 10)) / 100), 2);
                }
                totDistAmt += Value.Round(dist[i], 2);
                if (jcomp.getModel().getValueAt(i, 11) == null || jcomp.getModel().getValueAt(i, 11).equals("")) {
                    vat[i] = 0;
                } else {
                    vat[i] = Value.Round((subTot[i] - dist[i]) * (Double.parseDouble("" + jcomp.getModel().getValueAt(i, 11)) / 100), 2);
                }
                totVATAmt += Value.Round(vat[i], 2);
                totQty += qty[i];
                   totQty += fqty[i];
                    System.out.println("sssss");
//            }
//            else {
//                jcomp.changeSelection(i, 5, false, false);
//            }
        }
    }
}
        catch (Exception ex) {
    String ss = "Method: salesCalculations    Exception : " + ex;
    log.debug(ss);
}

    }
}
