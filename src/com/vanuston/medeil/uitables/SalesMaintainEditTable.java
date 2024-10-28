package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.util.DecimalFormatRenderer;
import com.vanuston.medeil.implementation.Sales;
import com.vanuston.medeil.implementation.Stock;
import com.vanuston.medeil.model.SalesModel;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.PercentageFormatRenderer;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.util.Value;
import java.sql.*;
import java.awt.*;
import java.awt.event.*;
import java.util.ArrayList;
import java.util.List;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableCellRenderer;
import java.util.Vector;
import javafx.stage.Alert;

public class SalesMaintainEditTable {
    public SalesTableModel dtmodel;
    public JTable SalesMaintainEdit;
    public JTextField jt;
    public JScrollPane scrollPane = new JScrollPane();
    public int qty[];
    public double uprice[];
    public double vat[];
    public double dist[];
    public double subTot[];
    public static int totQty = 0;
    public static int totItems = 0;
    public static double totDistAmt = 0.0;
    public static double totVATAmt = 0.0;
    public double paidAmt = 0.00;
    public double balAmt = 0.00;
    public static double totAmt = 0.00;
    public double totMargin = 0.00;
    public double amt = 0.00;
    public double fprice=0.00;
    public String formName = null;
    public ResultSet rs = null;
    public int oldQty[];
    public String icode[];
    public String iname[];
    public String batch[];
    public KeyStroke print = KeyStroke.getKeyStroke(KeyEvent.VK_F2, 0);
    public KeyStroke reset = KeyStroke.getKeyStroke(KeyEvent.VK_F4, 0);
    public KeyStroke del = KeyStroke.getKeyStroke(KeyEvent.VK_F5, 0);
    public KeyStroke update = KeyStroke.getKeyStroke(KeyEvent.VK_F7, 0);
    public KeyStroke rR = KeyStroke.getKeyStroke(KeyEvent.VK_F12, 0);
    public KeyStroke back = KeyStroke.getKeyStroke(KeyEvent.VK_LEFT, KeyEvent.CTRL_MASK);
  
    public Logger log = Logger.getLogger(SalesMaintainEditTable.class, "Sales");
    public int nullVal;
    private int[] fqty;
    private double margin;
    private int purPrice;
    private int stkQty;
    private int[] pqty;
    private Object pquantity;
    private String getQuantity;
    private String getPquantity;

    public JComponent createViewTable(final int col, Object[] colName, Class[] type, boolean[] canEdit, int[] width, String form) {
        final Class[] types = type;
        formName = form;
        final boolean[] canEditCols = canEdit;
        final int[] colWidth = width;
        SalesMaintainEdit = new JTable();
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
            dtmodel=new SalesTableModel(data,cols,types,canEditCols);
            SalesMaintainEdit.setModel(dtmodel);
        } catch (Exception e) {
            String msg = "Method : createViewTable Exception: " + e.getMessage();
            log.debug(msg);
        }
         for (int i = 0; i < len; i++) {
            SalesMaintainEdit.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }   
        SalesMaintainEdit.getColumnModel().getColumn(14).setCellRenderer(new DecimalFormatRenderer());
        SalesMaintainEdit.getColumnModel().getColumn(12).setCellRenderer(new PercentageFormatRenderer());
        SalesMaintainEdit.getColumnModel().getColumn(10).setCellRenderer(new PercentageFormatRenderer());
      //  SalesMaintainEdit.removeColumn(SalesMaintainEdit.getColumnModel().getColumn(12));
        SalesMaintainEdit.removeColumn(SalesMaintainEdit.getColumnModel().getColumn(15));
        SalesMaintainEdit.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        SalesMaintainEdit.getTableHeader().setBackground(new Color(226, 238, 244));
        SalesMaintainEdit.getTableHeader().setFont(new Font("Arial", Font.BOLD, 16));
        SalesMaintainEdit.setShowGrid(true);
        SalesMaintainEdit.getTableHeader().setReorderingAllowed(false);
        SalesMaintainEdit.setSelectionMode(0);
        SalesMaintainEdit.setDragEnabled(false);
        SalesMaintainEdit.addMouseListener(new MouseAdapter() {

            @Override
            public void mouseClicked(MouseEvent e) {
                final int i = SalesMaintainEdit.getSelectedRow();
                final int j = SalesMaintainEdit.getSelectedColumn();

                for (int val = 0; val < SalesMaintainEdit.getRowCount(); val++) {
                    if (SalesMaintainEdit.getModel().getValueAt(val, 4) == null); else {
                        if (SalesMaintainEdit.getModel().getValueAt(val, 4).equals(0)) {
                           // SalesMaintainEdit.changeSelection(val, 3, false, false);//jai
                        }
                    }
                }
                calculateMargin(i);
                salesCalculations();
            }
        });
        SalesMaintainEdit.addKeyListener(new KeyAdapter() {
            
            @Override
            public void keyReleased(KeyEvent e) {
                tableKeyReleased(e);
            }

            @Override
            public void keyPressed(KeyEvent e) {
                final int i = SalesMaintainEdit.getSelectedRow();
                final int j = SalesMaintainEdit.getSelectedColumn();

                InputMap im = SalesMaintainEdit.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);

                if (e.getKeyCode() == 10) {
                    KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                    KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                    im.put(enter, im.get(tab));
                }
                if (e.isActionKey()) {
                    for (int val = 0; val < SalesMaintainEdit.getRowCount(); val++) {
                        if (SalesMaintainEdit.getModel().getValueAt(val, 1) == null); else {
                            SalesMaintainEdit.getModel().setValueAt(val + 1, val, 0);
                        }
                        if (SalesMaintainEdit.getModel().getValueAt(val, 5) == null); else {
                            if (Integer.parseInt(SalesMaintainEdit.getModel().getValueAt(val, 5).toString()) == 0) {
                                SalesMaintainEdit.changeSelection(val, 5, false, false);
                                break;
                            }
                        }
                    }
                }
                    if (e.getKeyCode() == KeyEvent.VK_DELETE || e.getKeyCode() == KeyEvent.VK_BACK_SPACE) {
                            if (SalesMaintainEdit.getModel().isCellEditable(i, j)) {
                                SalesMaintainEdit.getModel().setValueAt("", i, j);
                            }
                        }
                        else {
                            char c = e.getKeyChar();
                            if(SalesMaintainEdit.getModel().isCellEditable(i, j)) {
                            if((c>'0' && c<='9'))
                            SalesMaintainEdit.getModel().setValueAt(0, i, j);
                        }
                        }
                calculateMargin(SalesMaintainEdit.getSelectedRow());
            }

            @Override
            public void keyTyped(KeyEvent e) {
                calculateMargin(SalesMaintainEdit.getSelectedRow());
                salesCalculations();
            }
        });

        SalesMaintainEdit.getInputMap().put(print, "action");
        SalesMaintainEdit.getInputMap().put(update, "action");
        SalesMaintainEdit.getInputMap().put(reset, "action");
        SalesMaintainEdit.getInputMap().put(del, "action");
        SalesMaintainEdit.getInputMap().put(back, "action");
        SalesMaintainEdit.getInputMap().put(rR, "action");

        SalesMaintainEdit.getActionMap().put("action", new AbstractAction() {

            @Override
            public void actionPerformed(ActionEvent e) {
                SalesMaintainEdit.transferFocus();
            }
        });
        SalesMaintainEdit.setGridColor(new java.awt.Color(204, 204, 255));
        SalesMaintainEdit.setCellSelectionEnabled(true);
        SalesMaintainEdit.setRowSelectionAllowed(true);
        SalesMaintainEdit.setRowHeight(20);
        SalesMaintainEdit.setSelectionBackground(Color.LIGHT_GRAY);
        SalesMaintainEdit.setSelectionForeground(Color.RED);
        SalesMaintainEdit.revalidate();
        return SalesMaintainEdit;
    }

    public JComponent getScrollTable(JComponent jt) {
        SalesMaintainEdit = (JTable) jt;
        scrollPane.add(SalesMaintainEdit);
        scrollPane.setViewportView(SalesMaintainEdit);
        return scrollPane;
    }

    public void addRow() {
        DefaultTableModel model = (DefaultTableModel) SalesMaintainEdit.getModel();
        Vector datas = new Vector();
        datas.addElement(SalesMaintainEdit.getRowCount() + 1);
        for (int i = 1; i < SalesMaintainEdit.getModel().getColumnCount(); i++) {
            datas.addElement(null);
        }
        model.insertRow(SalesMaintainEdit.getRowCount(), datas);
    }

        public void removeRow() {
        int i = SalesMaintainEdit.getSelectedRow();
        int n = SalesMaintainEdit.getSelectedColumn();
        int rows = SalesMaintainEdit.getRowCount();
        if (i != -1 && SalesMaintainEdit.getModel().getValueAt(i,2)!= null) {
            DefaultTableModel model = (DefaultTableModel) SalesMaintainEdit.getModel();
            if (rows == 1) {
                if (i == 0) {
                    model.removeRow(i);
                    resetValues();
                    addRow();
                    addRow();
                    //SalesMaintainEdit.changeSelection(0, 0, false, false);
                    SalesMaintainEdit.changeSelection(0, 5, false, false);
                }
            } else {
                model.removeRow(i);
                int rows1 = SalesMaintainEdit.getRowCount();
                addRow();
                if (i + 1 != rows) {
                    for (int j = 0; j < rows1; j++) {
                        SalesMaintainEdit.getModel().setValueAt(j + 1, j, 0);
                    }
                    SalesMaintainEdit.changeSelection(i - 1, 5, false, false);
                } else {
                    SalesMaintainEdit.changeSelection(i - 1, 5, false, false);
                }
            }
        } else {
            Alert.inform("Please select valid row to remove ...");
        }
    }


    public void resetValues() {
        totQty = 0;
        totItems = 0;
        totAmt = 0.00;
        totDistAmt = 0.0;
        totVATAmt = 0.0;
        amt = 0.00;
    }

    public void clearData() {
        DefaultTableModel model = (DefaultTableModel) SalesMaintainEdit.getModel();
        model.getDataVector().removeAllElements();
        for(int i=0;i<11;i++){
        addRow();        
        }
        SalesMaintainEdit.revalidate();
    }

    
    public  List getSalesBillItems() {
        List<SalesModel> salesBillItems = new ArrayList<SalesModel>();
             System.out.println("kumartable");
        try {
        SalesModel model;
        try {
            for (int index = 0; index < SalesMaintainEdit.getModel().getRowCount(); index++) {
     System.out.println("kumartableeeeeeeeeee");
                if (!(SalesMaintainEdit.getModel().getValueAt(index, 1) == null)) {
                    model = new SalesModel();
                    model.setItemCode(SalesMaintainEdit.getModel().getValueAt(index, 1).toString());
                    model.setItemName(SalesMaintainEdit.getModel().getValueAt(index, 2).toString());
                    model.setFormulation(SalesMaintainEdit.getModel().getValueAt(index,3).toString());
                    System.out.println("kumartable");
  System.out.println("kumart");
                     System.out.println((SalesMaintainEdit.getModel().getValueAt(index, 2).toString()));
//                    if(SalesMaintainEdit.getModel().getValueAt(index, 4) == null || SalesMaintainEdit.getModel().getValueAt(index, 4).toString().equals(""))
//                    {
//                        model.setPquantity(0);
//                    }
//                    System.out.println(
//                    else {
//                    model.setPquantity((Integer)SalesMaintainEdit.getModel().getValueAt(index,4));
//                    }



                    System.out.println("mai");

                     if(SalesMaintainEdit.getModel().getValueAt(index, 4) == null || SalesMaintainEdit.getModel().getValueAt(index, 4).toString().equals(""))
                    {
                        model.setPquantity(0);
                    }
                    else {
                    model.setPquantity((Integer)SalesMaintainEdit.getModel().getValueAt(index,4));
                    }
model.setPquantity((Integer) SalesMaintainEdit.getModel().getValueAt(index, 4));
  System.out.println("maie");




                    // Get the value from the table model
//Integer value = (Integer) SalesMaintainEdit.getModel().getValueAt(index, 4);
//
//// Assuming model is an instance of a class with the setPquantity method
//model.setPquantity(value);
//
//// Print a message to indicate that the value has been set
//System.out.println("Value set at index " + index + ", column 4: " + value);

    System.out.println("maintaintablekummmmmmmm");



                    if(SalesMaintainEdit.getModel().getValueAt(index, 5) == null || SalesMaintainEdit.getModel().getValueAt(index, 5).toString().equals(""))
                    {
                        model.setQuantity(0);
                    }
                    else {
                    model.setQuantity((Integer)SalesMaintainEdit.getModel().getValueAt(index,5));
                    }
    model.setQuantity((Integer) SalesMaintainEdit.getModel().getValueAt(index, 5));
                    model.setBatchNumber(SalesMaintainEdit.getModel().getValueAt(index,6).toString());
                    model.setExpiryDate(SalesMaintainEdit.getModel().getValueAt(index,7).toString());
                    if(SalesMaintainEdit.getModel().getValueAt(index, 8) == null || SalesMaintainEdit.getModel().getValueAt(index, 8).toString().equals(""))
                    {
                        model.setUnitPrice(0.00);
                    }
                    else {
                        model.setUnitPrice((Double)SalesMaintainEdit.getModel().getValueAt(index,8));
                    }

                    if(SalesMaintainEdit.getModel().getValueAt(index, 9) == null || SalesMaintainEdit.getModel().getValueAt(index, 9).toString().equals(""))
                    {
                        model.setMrp(0.00);
                    }
                    else {
                    model.setMrp((Double)SalesMaintainEdit.getModel().getValueAt(index,9));
                     }

                    if(SalesMaintainEdit.getModel().getValueAt(index, 10) == null || SalesMaintainEdit.getModel().getValueAt(index, 10).toString().equals("")) {
                        model.setUnitDiscount(0.00);
                    }
                    else {
                        model.setUnitDiscount((Double)SalesMaintainEdit.getModel().getValueAt(index,10));
                    }
                    SalesMaintainEdit.getModel().getValueAt(index,11);
                    model.setUnitVAT((Double)SalesMaintainEdit.getModel().getValueAt(index,12));
                    model.setFprice((Double)SalesMaintainEdit.getModel().getValueAt(index,13));
                    System.out.println("kummmmmmmm");
                     System.out.println(((Double)SalesMaintainEdit.getModel().getValueAt(index,13)));
                    model.setSubTotal((Double)SalesMaintainEdit.getModel().getValueAt(index,14));
//                    model.setTotalItems(Integer.parseInt("0"));
                    salesBillItems.add(model);
                }
            }
        }
     catch (Exception e) {
            String ss = "Method: getSalesBillItems    Exception : " + e.getMessage();
            log.debug(ss);
        }
        } catch(Exception exception) {
             log.debug(exception.getMessage());
        }
        return salesBillItems;
    }


    public void setCellRenderColor(JComponent jt, Color even, Color odd) {
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

    public void tableKeyReleased(KeyEvent e) {
        final int i = SalesMaintainEdit.getSelectedRow();
        final int j = SalesMaintainEdit.getSelectedColumn();
        if (e.getKeyCode() == 10) {
            InputMap im = SalesMaintainEdit.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
            KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
            KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
            im.put(enter, im.get(tab));
        }
        if (j == 1 && e.getKeyCode() != 27) {
            for (int val = 0; val < SalesMaintainEdit.getRowCount(); val++) {
                if (SalesMaintainEdit.getModel().getValueAt(val, 2) == null) {
                    if (SalesMaintainEdit.getModel().getValueAt(val, 0) == null) {
                        SalesMaintainEdit.getModel().setValueAt(val + 1, val, 0);
                    }
                    SalesMaintainEdit.changeSelection(val, 2, false, false);
                    break;
                }
            }
             refreshStockTab();
          //  SalesMaintainEdit.changeSelection(i, 4, false, false);
        }        
     
        if (j == 5) {
            try {
                Stock stockController = (Stock) RegistryFactory.getClientStub(RegistryConstants.Stock);
                int stkQty = Integer.parseInt(stockController.getStockQty(SalesMaintainEdit.getModel().getValueAt(i, 1).toString(), SalesMaintainEdit.getModel().getValueAt(i, 5).toString()));
               int stkfQty = Integer.parseInt(stockController.getStockQty(SalesMaintainEdit.getModel().getValueAt(i, 1).toString(), SalesMaintainEdit.getModel().getValueAt(i, 4).toString()));
                int qty = 0;
                int fqty = 0;
                System.out.println("amt123");

                if (SalesMaintainEdit.getModel().getValueAt(i, 4) == null) {

                } else {
                    fqty = Integer.parseInt(SalesMaintainEdit.getModel().getValueAt(i, 4).toString());
                }
                if (fqty == 0) {
                    SalesMaintainEdit.changeSelection(i, 4, false, false);
                }
                         System.out.println(fqty);
                         System.out.println("amt1235");




                if (SalesMaintainEdit.getModel().getValueAt(i, 5) == null) {
                    
                } else {
                    qty = Integer.parseInt(SalesMaintainEdit.getModel().getValueAt(i, 5).toString());
                }
                if (qty == 0) {
                    SalesMaintainEdit.changeSelection(i, 5, false, false);
                } 
                else {
                     System.out.println("am");
                    double sp = 0;
                    if (qty+fqty <= stkQty+stkfQty) {
                        SalesMaintainEdit.changeSelection(i, 8, false, false);
                        if (SalesMaintainEdit.getModel().getValueAt(i, 8) == null) {
                            
                        } else {
                            sp = Double.parseDouble("" + SalesMaintainEdit.getModel().getValueAt(i, 8));
                            System.out.println(sp);
                        }
                        System.out.println("amt12354245");
                        //amt = Value.Round(qty+fqty * sp, 2);
                         amt = Value.Round((qty + fqty) * sp, 2);

                        totAmt += amt;
                        System.out.println(totAmt);
                        System.out.println(amt);
                        SalesMaintainEdit.getModel().setValueAt(amt, i, 14);
                        totQty += Integer.parseInt("" + SalesMaintainEdit.getModel().getValueAt(i, 5));

                        System.out.println("amtq");
                        System.out.println(totQty);
                        if (e.getKeyCode() == KeyEvent.VK_DELETE || e.getKeyCode() == KeyEvent.VK_BACK_SPACE) {
                            SalesMaintainEdit.getModel().setValueAt("", i, 8);
                        }
                        SalesMaintainEdit.changeSelection(i, 10, false, false);
                    } else {
                    }
                }
            } catch (Exception ex) {
                String ss = "  Method: tableKeyReleased   Exception : " + ex.getMessage();
                
                log.debug(ss);
            }
        }
        else if(j==10) {
                if (i == SalesMaintainEdit.getModel().getRowCount() - 1) {
                    addRow();
                }
                SalesMaintainEdit.changeSelection(i + 1, 1, false, false);
                SalesMaintainEdit.getModel().setValueAt(i + 2, i + 1, 0);
                refreshStockTab();
        }
        if (j == SalesMaintainEdit.getModel().getColumnCount() - 1) {
            double vat = 0;
            if (SalesMaintainEdit.getModel().getValueAt(i, 12) == null || SalesMaintainEdit.getModel().getValueAt(i, 12).equals("")); else {
                vat = Double.parseDouble("" + SalesMaintainEdit.getModel().getValueAt(i, 12));
            }
            
                double dis = 0;
                double disAmt = 0;
                double vatAmt = 0;
                if (SalesMaintainEdit.getModel().getValueAt(i, 10) == null || SalesMaintainEdit.getModel().getValueAt(i, 10) == ""); else {
                    dis = Double.parseDouble("" + SalesMaintainEdit.getModel().getValueAt(i, 10));
                }
                if (dis != 0) {
                    disAmt = Value.Round(amt * dis / 100, 2);
                    totDistAmt += disAmt;
                }
                if (vat != 0) {       
                    vatAmt = Value.Round((amt - disAmt) * vat / 100, 2);
                    totVATAmt += vatAmt;
                }
                if (SalesMaintainEdit.getModel().getValueAt(i, 2) == null || SalesMaintainEdit.getModel().getValueAt(i, 2) == ""); else {
                    totItems = SalesMaintainEdit.getModel().getRowCount();
                }
                if (i == SalesMaintainEdit.getModel().getRowCount() - 1) {
                            addRow();
                        }
                SalesMaintainEdit.changeSelection(i + 1, 0, false, false);
                SalesMaintainEdit.getModel().setValueAt(i + 2, i + 1, 0);
                calculateMargin(SalesMaintainEdit.getSelectedRow());
        }
    }

    public void refreshStockTab() {
          GetSalesDrugData g = new GetSalesDrugData(SalesMaintainEdit, formName,"SalesEdit");
          g.requestFocusInWindow();
          g.setVisible(true);
          g.requestFocus();
    }

    public void setHeaderColor(JComponent jt, Color c) {
        JTable temp = (JTable) jt;
        temp.getTableHeader().setBackground(c);
    }

    public void focusSet(int row, int col) {
        SalesMaintainEdit.requestFocus();
        SalesMaintainEdit.changeSelection(row, col, false, false);
        SalesMaintainEdit.setCellSelectionEnabled(false);
        SalesMaintainEdit.setRowSelectionAllowed(true);
    }

    public void focusSet() {
        SalesMaintainEdit.requestFocus();
        SalesMaintainEdit.changeSelection(0, 1, false, false);
        SalesMaintainEdit.getModel().setValueAt("1", 0, 0);
        SalesMaintainEdit.setCellSelectionEnabled(false);
        SalesMaintainEdit.setRowSelectionAllowed(true);
    }

    public int total(int colNum) {
        int tot = 0;
        int colNo = colNum;
        for (int i = 0; i < SalesMaintainEdit.getModel().getRowCount(); i++) {
            if (SalesMaintainEdit.getModel().getValueAt(i, colNo) != null) {
                tot += Double.parseDouble("" + SalesMaintainEdit.getModel().getValueAt(i, colNo));
            }
        }
        return tot;
    }

    public int totalRow() {
        int tot = 0;
        for (int i = 0; i < SalesMaintainEdit.getModel().getRowCount(); i++) {
            if (SalesMaintainEdit.getModel().getValueAt(i, 2) != null) {
                tot += 1;
            }
        }
        return tot;
    }

    public void additionRow(int cnt) {
        
        if (cnt > 11) {
            DefaultTableModel model = (DefaultTableModel) SalesMaintainEdit.getModel();
            model.getDataVector().removeAllElements();
            SalesMaintainEdit.revalidate();
            for (int j = 0; j < cnt; j++) {
                addRow();
            }
        }   
    }

//    public SalesModel salesEditValues(String billNumber, String type) {
//
//          SalesModel sales = new SalesModel();
//          try {
//          clearData();
//          Sales salesController = (Sales) RegistryFactory.getClientStub(RegistryConstants.Sales);
//          sales = salesController.loadEditTable(billNumber,type);
//          SalesModel salesItems;
//          List <SalesModel> salesList = new ArrayList();
//
//          salesList = sales.getListofitems();
//          additionRow(salesList.size());
//            for(int i = 0; i < salesList.size();i++) {
//                System.out.println("index= " + " =" + salesList.size() + " =");
//            salesItems = salesList.get(i);
//               System.out.println(salesItems);
//            SalesMaintainEdit.getModel().setValueAt(i + 1, i, 0);
//            SalesMaintainEdit.getModel().setValueAt(salesItems.getItemCode(), i, 1);
//            SalesMaintainEdit.getModel().setValueAt(salesItems.getItemName(), i, 2);
//            SalesMaintainEdit.getModel().setValueAt(salesItems.getFormulation(), i, 3);
//            System.out.println("maintaintable");
//             // Assuming salesModel is an instance of SalesModel class
////SalesModel salesModel = new SalesModel(); // Initialize or get the instance appropriately
////
////
////
////           // SalesMaintainEdit.getModel().setValueAt(salesItems.getPquantity(), i, 4);
////            // Set the value in the table model
////SalesMaintainEdit.getModel().setValueAt(salesItems.getPquantity(), i, 4);
////Integer dataa = salesModel.getPquantity();
////if (dataa == null || dataa.equals("")) {
////    salesModel.setPquantity(0);
////} else {
////    // Handle the case when dataa is not null and not an empty string
////}
//// Print a message to indicate that the value has been set
//
//
//             SalesMaintainEdit.getModel().setValueAt(salesItems.getPquantity(), i, 4);
//
//        System.out.println("Value set at rowt5ff " + i + ", column 4: " + getPquantity);
//
////System.out.println("Value set at row " + i + ", column 4: " + salesItems.getPquantity());
//
//
//
//
//           // System.out.println(SalesMaintainEdit.getModel().setValueAt(salesItems.getPquantity(), i, 4));
//
//            //System.out.println(SalesMaintainEdit.getModel().setValueAt(salesItems.getPquantity(), i, 4));
//            SalesMaintainEdit.getModel().setValueAt(salesItems.getQuantity(), i, 5);
//            System.out.println("Value set  " + i + ", column 5: " + getQuantity);
//            SalesMaintainEdit.getModel().setValueAt(salesItems.getBatchNumber(), i, 6);
//            SalesMaintainEdit.getModel().setValueAt(salesItems.getReturnExpiryDate(), i, 7);
//            SalesMaintainEdit.getModel().setValueAt(salesItems.getUnitPrice(), i, 8);
//            SalesMaintainEdit.getModel().setValueAt(salesItems.getMrp(), i, 9);
//            SalesMaintainEdit.getModel().setValueAt(salesItems.getUnitDiscount(), i, 10);
//         //  SalesMaintainEdit.getModel().setValueAt(salesItems.getUnitDiscount(), i, 10);
//// Assuming salesItems.getUnitDiscount() returns a double or an object that can be printed
//System.out.println(salesItems.getUnitDiscount());
//System.out.println("prabha");
//
//           // SalesMaintainEdit.getModel().setValueAt(salesItems.g, i, 12);
//            // margin=Value.Round((unitPrice-salesVat-(unitPrice*discount/100)-purPrice)*stkQty,2);
//            // SalesMaintainEdit.getModel().setValueAt(margin, i, 11);
//            SalesMaintainEdit.getModel().setValueAt(salesItems.getUnitVAT(), i, 12);
//            SalesMaintainEdit.getModel().setValueAt(salesItems.getFprice(), i, 13);
//       System.out.println(salesItems.getFprice() + ", " + i + ", " + 13);
//
//            System.out.println("prabha123");
//            SalesMaintainEdit.getModel().setValueAt(salesItems.getSubTotal(), i, 14);
//            SalesMaintainEdit.getModel().setValueAt(salesItems.getTotalItems(), i, 15);
//            calculateMargin(i);
//            }
//        }
//        catch(Exception e) {
//            String msg = "Method : salesEditValues Exception:" + e.getMessage();
//            log.debug(msg);
//
//        }
//        return sales;
//    }

    public SalesModel salesEditValues(String billNumber, String type) {
    SalesModel sales = new SalesModel();
    try {
        clearData();
        Sales salesController = (Sales) RegistryFactory.getClientStub(RegistryConstants.Sales);
        sales = salesController.loadEditTable(billNumber, type);
        SalesModel salesItems;
        List<SalesModel> salesList = new ArrayList();
        salesList = sales.getListofitems();
        additionRow(salesList.size());

        for (int i = 0; i < salesList.size(); i++) {
            System.out.println("index= " + " =" + salesList.size() + " =");
            salesItems = salesList.get(i);
            System.out.println(salesItems);
            SalesMaintainEdit.getModel().setValueAt(i + 1, i, 0);
            SalesMaintainEdit.getModel().setValueAt(salesItems.getItemCode(), i, 1);
            SalesMaintainEdit.getModel().setValueAt(salesItems.getItemName(), i, 2);
            SalesMaintainEdit.getModel().setValueAt(salesItems.getFormulation(), i, 3);
            System.out.println("maintaintable");

            Integer pquantity = salesItems.getPquantity();
            if (pquantity == null) {
                pquantity = 0;
            }
            SalesMaintainEdit.getModel().setValueAt(pquantity, i, 4);
            System.out.println("Value set at row " + i + ", column 4: " + pquantity);

            Integer quantity = salesItems.getQuantity();
            if (quantity == null) {
                quantity = 0;
            }
            SalesMaintainEdit.getModel().setValueAt(quantity, i, 5);
            System.out.println("Value set at row " + i + ", column 5: " + quantity);

            SalesMaintainEdit.getModel().setValueAt(salesItems.getBatchNumber(), i, 6);
            SalesMaintainEdit.getModel().setValueAt(salesItems.getReturnExpiryDate(), i, 7);
            SalesMaintainEdit.getModel().setValueAt(salesItems.getUnitPrice(), i, 8);
            SalesMaintainEdit.getModel().setValueAt(salesItems.getMrp(), i, 9);
            SalesMaintainEdit.getModel().setValueAt(salesItems.getUnitDiscount(), i, 10);
            System.out.println(salesItems.getUnitDiscount());
            System.out.println("prabha");

            SalesMaintainEdit.getModel().setValueAt(salesItems.getUnitVAT(), i, 12);
            SalesMaintainEdit.getModel().setValueAt(salesItems.getFprice(), i, 13);
            System.out.println(salesItems.getFprice() + ", " + i + ", " + 13);

            System.out.println("prabha123");
            SalesMaintainEdit.getModel().setValueAt(salesItems.getSubTotal(), i, 14);
            SalesMaintainEdit.getModel().setValueAt(salesItems.getTotalItems(), i, 15);
            calculateMargin(i);
        }
    } catch (Exception e) {
        String msg = "Method : salesEditValues Exception:" + e.getMessage();
        log.debug(msg);
    }
    return sales;
}






















    public double calculateMargin(int i) {
         double margin = 0.0;
         double discount=0.00;
         double salesVat = 0.00;
         double unitPrice = 0.00;
         double vatPerc = 0.00;
         double fprice = 0.00;
         try {         
         if(i!=-1) {
             if(SalesMaintainEdit.getModel().getValueAt(i, 4)!=null && SalesMaintainEdit.getModel().getValueAt(i, 4)!="") {
                int stkfQty = Integer.parseInt(SalesMaintainEdit.getModel().getValueAt(i, 4).toString());

             System.out.println("maintancestock");

             System.out.println(stkfQty);
            if(SalesMaintainEdit.getModel().getValueAt(i, 5)!=null && SalesMaintainEdit.getModel().getValueAt(i, 5)!="") {
                int stkQty = Integer.parseInt(SalesMaintainEdit.getModel().getValueAt(i, 5).toString());

                 if(SalesMaintainEdit.getModel().getValueAt(i, 13)!=null && SalesMaintainEdit.getModel().getValueAt(i, 13)!="") {
                 fprice = Double.parseDouble(SalesMaintainEdit.getModel().getValueAt(i, 13).toString());

                 System.out.println("maintancestock123");
                  System.out.println(fprice);
                if((SalesMaintainEdit.getModel().getValueAt(i, 8)!=null || SalesMaintainEdit.getModel().getValueAt(i, 8)!="")) {
                    unitPrice = Double.parseDouble(SalesMaintainEdit.getModel().getValueAt(i, 8).toString());
                     System.out.println("mstock123");
                    System.out.println(unitPrice);
                }
                if(SalesMaintainEdit.getModel().getValueAt(i, 10)!=null && SalesMaintainEdit.getModel().getValueAt(i, 10)!="") {
                    discount = Double.parseDouble(SalesMaintainEdit.getModel().getValueAt(i, 10).toString());
                    System.out.println(discount);
                }
                if(SalesMaintainEdit.getModel().getValueAt(i, 12)!=null && SalesMaintainEdit.getModel().getValueAt(i, 12)!="") {
                    vatPerc = Double.parseDouble(SalesMaintainEdit.getModel().getValueAt(i, 12).toString());
                      System.out.println(vatPerc);
                }
                CommonImplements commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);

                double purPrice=Double.parseDouble(commonController.getQueryValue("select purchase_price from stock_statement where item_code='"+SalesMaintainEdit.getModel().getValueAt(i, 1).toString()+"' and batch_no='"+SalesMaintainEdit.getModel().getValueAt(i, 6).toString()+"'"));
                double vatCalcFlag=Double.parseDouble(commonController.getQueryValue("select vat_calc_flag from drugtable where itemcode='"+SalesMaintainEdit.getModel().getValueAt(i, 1).toString()+"'"));
                if(vatCalcFlag==0) {
                    //salesVat=Value.Round((unitPrice*vatPerc)/(100+vatPerc),2);
                    salesVat = Value.Round((((qty[i] * uprice[i]) + (fqty[i] * fprice)) * vatPerc) / (100 + vatPerc), 2);
                }
//                else {
//                    salesVat=0;
//                }
                System.out.println("m");
                System.out.println(salesVat);
                    System.out.println(purPrice);


                 //old//me formula  margin = Value.Round(((stkfQty*fprice)+(stkQty*unitPrice) - salesVat - (unitPrice * discount / 100) - purPrice), 2);

                  margin = Value.Round(((stkfQty * fprice) + (stkQty * unitPrice) - salesVat - (unitPrice * discount / 100) - purPrice), 2);


                  // margin=Value.Round((unitPrice-salesVat-(unitPrice*discount/100)-purPrice)*stkQty,2);
//                SalesMaintainEdit.getModel().setValueAt(margin, i, 11);//old
//                System.out.println( SalesMaintainEdit.getModel().setValueAt(margin, i, 11));
                SalesMaintainEdit.getModel().setValueAt(margin, i, 11);
                System.out.println("Margin");
               // System.out.println("Setting value at row " + i + ", column 11 to " + margin);
                System.out.println(margin);
               System.out.println("Value set successfully.");

            }
          }
             }
         }
        }
         catch(Exception e) {
            String msg = "Method : calculateMargin Exception:" + e.getMessage();
            log.debug(msg);
         }
         return margin;
    }

    public void salesCalculations() {
        int rowCount = SalesMaintainEdit.getRowCount();
        fqty= new int[rowCount];//jai
        qty = new int[rowCount];
        uprice = new double[rowCount];
        vat = new double[rowCount];
        dist = new double[rowCount];
        subTot = new double[rowCount];
        totDistAmt = 0;
        totVATAmt = 0;
        totAmt = 0;
        totQty = 0;
        totItems = 0;
        totMargin = 0;
        double fprice = 0.00;
        for (int i = 0; i < rowCount; i++) {
            if (SalesMaintainEdit.getModel().getValueAt(i, 2) == null || SalesMaintainEdit.getModel().getValueAt(i, 2).equals("")) {
                if (i == 0) {
                    nullVal = 0;
                }
            } else {
                nullVal = 1;
                totItems++;
                if (SalesMaintainEdit.getModel().getValueAt(i, 5) == null) {
                        SalesMaintainEdit.changeSelection(i, 5, false, false);
                    }
                else {
                    if (SalesMaintainEdit.getModel().getValueAt(i, 4) == null || SalesMaintainEdit.getModel().getValueAt(i, 4).equals("")) {
                        fqty[i] = 0;
                    } else {
                        fqty[i] = Integer.parseInt(SalesMaintainEdit.getModel().getValueAt(i, 4).toString());
                    }
                     System.out.println("kkk");
                     System.out.println(fqty[i]);


                     System.out.println("kkk1");




                    if (SalesMaintainEdit.getModel().getValueAt(i, 5) == null || SalesMaintainEdit.getModel().getValueAt(i, 5).equals("")) {
                        qty[i] = 0;
                    } else {
                        qty[i] = Integer.parseInt(SalesMaintainEdit.getModel().getValueAt(i, 5).toString());
                         System.out.println(qty[i]);
                    }
                    if (SalesMaintainEdit.getModel().getValueAt(i, 8) == null || SalesMaintainEdit.getModel().getValueAt(i, 8).equals("")) {
                        uprice[i] = 0.0;
                    } else {
                        uprice[i] = Double.parseDouble("" + SalesMaintainEdit.getModel().getValueAt(i, 8));
                    }
//                    subTot[i] = Value.Round(qty[i] * uprice[i], 2);
//                    SalesMaintainEdit.getModel().setValueAt(subTot[i], i, 14);//jai
                   // totAmt += Value.Round(subTot[i], 2);
//                    if (SalesMaintainEdit.getModel().getValueAt(i, 10) == null || SalesMaintainEdit.getModel().getValueAt(i, 10).equals("")) {
//                        dist[i] = 0;
//                    } else {
//                        dist[i] = Value.Round(subTot[i] * (Double.parseDouble("" + SalesMaintainEdit.getModel().getValueAt(i, 10)) / 100), 2);
//                    }
//                    totDistAmt += Value.Round(dist[i], 2);
                   
                    if (SalesMaintainEdit.getModel().getValueAt(i, 13) == null || SalesMaintainEdit.getModel().getValueAt(i, 13).equals(""))
                        {
                            fprice=0.0;
                        }
                        else
                        {
                        //@ author Jai
                           fprice = Double.parseDouble("" + SalesMaintainEdit.getModel().getValueAt(i, 13));
                            subTot[i] = Value.Round(fqty[i] * fprice + qty[i] * uprice[i], 2);//jai
                            //subTot[i] = Value.Round(fqty[i] * fprice + qty[i] * uprice[i], 2);
                            System.out.println(subTot[i]);//jai
                            SalesMaintainEdit.getModel().setValueAt(subTot[i], i, 14);
                             System.out.println(Value.Round(subTot[i], 2));
                             System.out.println("totAmtok");
                             //System.out.println(totAmt);
                            totAmt += Value.Round(subTot[i], 2);
                                System.out.println("totAmt2");
                                System.out.println(totAmt);
                        }
                     if (SalesMaintainEdit.getModel().getValueAt(i, 10) == null || SalesMaintainEdit.getModel().getValueAt(i, 10).equals("")) {
                        dist[i] = 0;
                    } else {
                        dist[i] = Value.Round(subTot[i] * (Double.parseDouble("" + SalesMaintainEdit.getModel().getValueAt(i, 10)) / 100), 2);
                    }
                    totDistAmt += Value.Round(dist[i], 2);
                     if (SalesMaintainEdit.getModel().getValueAt(i, 12) == null || SalesMaintainEdit.getModel().getValueAt(i, 12).equals("")) {
                        vat[i] = 0;
                    } else {
                        double vatPerc = Double.parseDouble("" + SalesMaintainEdit.getModel().getValueAt(i, 12));
                            vat[i] = Value.Round((((qty[i] * uprice[i]) + (fqty[i] * fprice)) * vatPerc) / (100 + vatPerc), 2);
                    }

                       System.out.println("bas563 ");
                    System.out.println("margin23");
                    totVATAmt += Value.Round(vat[i], 2);
                    System.out.println(totVATAmt);
                    totQty += qty[i];
                    totQty += fqty[i];
                     System.out.println(fqty[i]);
                      System.out.println(totQty);

                  //  System.out.println(Value.Round(Double.parseDouble(SalesMaintainEdit.getModel().getValueAt(i, 11).toString()),2));
                    totMargin+=Value.Round(Double.parseDouble(SalesMaintainEdit.getModel().getValueAt(i, 11).toString()),2);
                    System.out.println("margin");
                    System.out.println(Value.Round(Double.parseDouble(SalesMaintainEdit.getModel().getValueAt(i, 11).toString()),2));
                } 
            }
        }
    }

    public void calcDiscount(String discAmt) {
        double discPerc=0.00;
        discPerc=Value.Round(Double.parseDouble(discAmt)*100/totAmt,2);
        for (int index = 0; index < SalesMaintainEdit.getModel().getRowCount(); index++) {
            if (SalesMaintainEdit.getModel().getValueAt(index, 2) != null && SalesMaintainEdit.getModel().getValueAt(index, 2) != "" && SalesMaintainEdit.getModel().getValueAt(index, 2) != "null" ) {
            SalesMaintainEdit.getModel().setValueAt(discPerc, index, 10);
            }
        }
        salesCalculations();
    }
}
