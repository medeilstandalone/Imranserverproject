package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.controller.ExpiryReturnController;
import com.vanuston.medeil.model.ExpiryReturnModel;
import com.vanuston.medeil.util.Value;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.RegistryConstants;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.util.Vector;
import java.util.logging.Level;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import java.awt.Font;
import java.awt.Color;
import java.text.SimpleDateFormat;
import javafx.stage.Alert;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;

import java.util.List;
import com.vanuston.medeil.util.DecimalFormatRenderer;


public class ExpiryReturnTable {

    static Logger log = Logger.getLogger(ExpiryReturnTable.class, "Inventory");
    public JTable expiryReturnTable;
    public JScrollPane expiryReturnScrollPane = new JScrollPane();
    public KeyStroke calExpiryReturnsTable = KeyStroke.getKeyStroke(KeyEvent.VK_T, KeyEvent.CTRL_MASK);
    public KeyStroke calExpiryReturnsfocusOut = KeyStroke.getKeyStroke(KeyEvent.VK_SPACE, KeyEvent.CTRL_MASK);
    public String salesId = "";
    public double expiryReturnAmount = 0.0;
    public int purSel = 0;
    public String dbNoteNo = "";
    
    public int excludeFree = 0;
    public int initR;
    public static String sDate;
    public static String eDate;
    public static String distributorName;
    public String discount;
    public String subT;
    public String disA;
    public String roundA;
    public String totA;
    public static KeyStroke save = KeyStroke.getKeyStroke(KeyEvent.VK_F3, 0);
    public static KeyStroke reset = KeyStroke.getKeyStroke(KeyEvent.VK_F4, 0);
    public static KeyStroke del = KeyStroke.getKeyStroke(KeyEvent.VK_F5, 0);
    public static KeyStroke update = KeyStroke.getKeyStroke(KeyEvent.VK_F7, 0);
    public static KeyStroke edit = KeyStroke.getKeyStroke(KeyEvent.VK_F6, 0);
    public static KeyStroke rR = KeyStroke.getKeyStroke(KeyEvent.VK_F12, 0);
    public static KeyStroke can = KeyStroke.getKeyStroke(KeyEvent.VK_F8, 0);
    public static KeyStroke back = KeyStroke.getKeyStroke(KeyEvent.VK_LEFT, KeyEvent.CTRL_MASK);
    int initRow = 9;
    Object[] colName= {"S.No.", "Product Name", "Formulation", "Mfr.", "Batch No.", "Qty.", "Free", "Expiry ", "Purchase Price", "MRP", "Total Amt"};
    Class[] type = {java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class, java.lang.String.class,
                java.lang.Integer.class, java.lang.Integer.class, java.lang.Object.class, java.lang.String.class, java.lang.String.class, java.lang.String.class};
     boolean[] canEdit= {false, true, false, false, false, true, false, false, false, false, false};
     int[] width = {45, 140, 75, 75, 70, 50, 50, 80, 80, 80, 80};



    com.vanuston.medeil.implementation.ExpiryReturn expiryReturnController;    
    public ExpiryReturnTable() throws RemoteException, NotBoundException
    {
 //-       expiryReturnController=(com.vanuston.medeil.implementation.ExpiryReturn) RegistryFactory.getClientStub(RegistryConstants.ExpiryReturn);
    }
//    public JComponent createTable(final int initRow, Object[] colName, Class[] type, boolean[] canEdit, int[] width) {
         public JComponent createTable() {
        final Class[] types = type;
        final boolean[] canEditCols = canEdit;
        final int[] colWidth = width;
        initR = initRow;
        expiryReturnTable = new JTable();
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
            expiryReturnTable.setModel(new javax.swing.table.DefaultTableModel(data, cols) {

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
            String msg = "Class : ExpiryReturnTable  Method : CreateTable()  = " + ex.getMessage();
            log.debug(msg);
        }
        expiryReturnTable.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        expiryReturnTable.getTableHeader().setBackground(new Color(226, 238, 244));
        expiryReturnTable.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
        expiryReturnTable.setShowGrid(true);
        expiryReturnTable.getTableHeader().setReorderingAllowed(false);

        expiryReturnTable.getColumnModel().getColumn(8).setCellRenderer(new DecimalFormatRenderer());
        expiryReturnTable.getColumnModel().getColumn(9).setCellRenderer(new DecimalFormatRenderer());
        expiryReturnTable.getColumnModel().getColumn(10).setCellRenderer(new DecimalFormatRenderer());
        expiryReturnTable.getInputMap().put(save, "actionF2");
        expiryReturnTable.getInputMap().put(edit, "actionF2");
        expiryReturnTable.getInputMap().put(reset, "actionF2");
        expiryReturnTable.getInputMap().put(can, "actionF2");
        expiryReturnTable.getInputMap().put(update, "actionF2");
        expiryReturnTable.getInputMap().put(del, "actionF2");
        expiryReturnTable.getInputMap().put(back, "actionF2");
        expiryReturnTable.getInputMap().put(rR, "actionF2");
        expiryReturnTable.getActionMap().put("actionF2", new AbstractAction() {

            @Override
            public void actionPerformed(ActionEvent e) {
                expiryReturnTable.transferFocus();
            }
        });
        expiryReturnTable.getActionMap().put("removeRow", new AbstractAction("removeRow") {

            @Override
            public void actionPerformed(ActionEvent evt) {
                removeRow();
            }
        });
        for (int i = 0; i < len; i++) {
            expiryReturnTable.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }
        expiryReturnTable.setGridColor(new java.awt.Color(204, 204, 255));
        expiryReturnTable.setCellSelectionEnabled(false);
        expiryReturnTable.setColumnSelectionAllowed(false);
        expiryReturnTable.setRowHeight(20);
        expiryReturnTable.setSelectionBackground(Color.LIGHT_GRAY);
        expiryReturnTable.setSelectionForeground(Color.RED);
        expiryReturnTable.revalidate();
        expiryReturnTable.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {

                final int i = expiryReturnTable.getSelectedRow();
                final int j = expiryReturnTable.getSelectedColumn();
                final int rowCnt = expiryReturnTable.getRowCount();
                if (i == 0 && j == 0) {
                    
                    try {
                        if(sDate!=null && eDate!=null && (distributorName!=null || distributorName.equals("")))
                        {
                        expiryReturnController=new ExpiryReturnController();
                            
                        ExpiryReturnModel expiryreturnBean=new ExpiryReturnModel();
                            
                        expiryreturnBean.setExpiry_checkVal("getcountQueryValue");
                        expiryreturnBean.setExpiry_from_date(sDate);
                        expiryreturnBean.setExpiry_to_date(eDate);
                        expiryreturnBean.setExpiry_dist_name(distributorName);
                        
                        
                        Integer cntValue=(Integer)expiryReturnController.viewRecord(expiryreturnBean);
                        
                        if(cntValue!=0)
                        //if(sDate!="" || sDate!=null || eDate!="" || eDate!=null || distributorName!="" || distributorName!=null)
                        {
                            ExpiryReturnDetails g;
                        g = new ExpiryReturnDetails(expiryReturnTable);
                        g.requestFocusInWindow();
                        g.setVisible(true);
                        g.requestFocus();
                        }
                        }
                        else{log.debug(" Method:mouseClicked info:Not Having the value in table");}
                    } catch (RemoteException ex) {
                        log.debug("Method:mouseClicked exception_1:"+ex.getMessage());
                    } catch (NotBoundException ex) {
                        log.debug("Method:mouseClicked exception_2:"+ex.getMessage());
                    }
                    
                }
                int k = 0;
                for (k = 0; k < rowCnt; k++) {
                    expiryReturnTable.getModel().setValueAt(k + 1, k, 0);
                }
            }
        });
        expiryReturnTable.addKeyListener(new KeyListener() {

            @Override
            public void keyReleased(KeyEvent e) {
                ExpiryReturnModel expiryReturnBean=new ExpiryReturnModel();
                final int i = expiryReturnTable.getSelectedRow();
                final int j = expiryReturnTable.getSelectedColumn();

                expiryReturnCalculations();
                if (i >= 0) {
                    expiryReturnTable.getModel().setValueAt(i + 1, i, 0);
                    if (e.getKeyCode() == 10 || e.getKeyCode() == 9) {
                        InputMap im = expiryReturnTable.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                        KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                        KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                        im.put(enter, im.get(tab));
                    }
                    if ((j == 1) && e.getKeyCode() != 27 || (j == 1 && e.getKeyCode() == KeyEvent.VK_TAB && e.getKeyCode() != 27)) {
                        //ExpiryReturnDetails g;
                        try {
                            expiryReturnController=new ExpiryReturnController();
                            
                        ExpiryReturnModel expiryreturnBean=new ExpiryReturnModel();
                            
                        expiryreturnBean.setExpiry_checkVal("getcountQueryValue");
                        expiryreturnBean.setExpiry_from_date(sDate);
                        expiryreturnBean.setExpiry_to_date(eDate);
                        expiryreturnBean.setExpiry_dist_name(distributorName);
                        
                        Integer cntValue=(Integer)expiryReturnController.viewRecord(expiryreturnBean);
                        
                        if(cntValue!=0){
                            ExpiryReturnDetails g;
                            g = new ExpiryReturnDetails(expiryReturnTable);
                            g.requestFocusInWindow();
                            g.setVisible(true);
                            g.requestFocus();
                            }else { log.debug("Method:keyReleased info:Not Having the value in table"); }
                        } catch (RemoteException ex) {
                            log.debug("Method:keyReleased exception_1:"+ex.getMessage());
                        } catch (NotBoundException ex) {
                            log.debug("Method:keyReleased exception_2:"+ex.getMessage());
                        }
                        
                    }
                    if (i == expiryReturnTable.getModel().getRowCount() - 1) {
                        addRow();
                    }
                    double totamt = 0.0;
                    double mrp = 0.0;
                    double unitPrice = 0.0;
                    int free = 0;
                    int finalQty = 0;
                    if (j == 4 || j == 5 || j == 6 || j == 7) {
                        if (expiryReturnTable.getModel().getValueAt(i, 5) == null || expiryReturnTable.getModel().getValueAt(i, 5) == "") {
                        } else {
                            finalQty = Integer.parseInt("" + expiryReturnTable.getModel().getValueAt(i, 5));
                            free = Integer.parseInt("" + expiryReturnTable.getModel().getValueAt(i, 6));
                            unitPrice = Double.parseDouble("" + expiryReturnTable.getModel().getValueAt(i, 8));
                            mrp = Double.parseDouble("" + expiryReturnTable.getModel().getValueAt(i, 9));
                            int qty = 0;
                            qty = finalQty + free;
                            if (excludeFree == 1) {
                                finalQty = finalQty + free;
                            }
                            if (purSel == 0) {
                                totamt = finalQty * unitPrice;
                            } else {
                                totamt = finalQty * mrp;
                            }
                            totamt = Value.Round(totamt, 2);

                            expiryReturnTable.getModel().setValueAt(Value.Round(totamt), i, 10);
                           
                            String itN = "";
                            itN = (String) expiryReturnTable.getModel().getValueAt(i, 1);
                            String batNo = "";
                            batNo = (String) expiryReturnTable.getModel().getValueAt(i, 4);
                            int qt = 0;
                            int exQty = 0;
                            expiryReturnBean.setExpiry_item_name(itN);
                            expiryReturnBean.setExpiry_batch_no(batNo);
                            expiryReturnBean.setExpiry_checkVal("checkExpiryReturn");
                            try {
                                //                            qt = GetInformation.checkExpiryReturn(itN, batNo);
                                 expiryReturnController=(com.vanuston.medeil.implementation.ExpiryReturn) RegistryFactory.getClientStub(RegistryConstants.ExpiryReturn);
                                expiryReturnBean.setExpiry_checkVal("checkExpiryReturn");
                                qt = (Integer) expiryReturnController.viewRecord(expiryReturnBean);
                                expiryReturnBean.setExpiry_checkVal("checkExpiryReturnStock");
                                exQty = (Integer) expiryReturnController.viewRecord(expiryReturnBean);
                            } catch (Exception ex) {
                                java.util.logging.Logger.getLogger(ExpiryReturnTable.class.getName()).log(Level.SEVERE, null, ex);
                            }

                            //int exQty = 0;
                            //exQty = GetInformation.checkExpiryReturnStock(itN, batNo);
                            
                            qt = exQty + qt;
                            int wt = 0;
                            wt = qt - free;
                            if (wt < 0) {
                                wt = 0;
                            }
                            if (qt < qty) {
                                Alert.inform("Please enter correct quantity less than Stock Quantity is " + wt);
                                expiryReturnTable.requestFocus();
                                expiryReturnTable.changeSelection(i, 5, false, false);
                            } else {

                                if (e.getKeyCode() == 10 || e.getKeyCode() == 9) {
                                    expiryReturnCalculations();
                                    expiryReturnTable.changeSelection(i + 1, 0, false, false);
                                }


                            }
                        }
                    }
                }
              expiryReturnCalculations();
            }
            @Override
            public void keyPressed(KeyEvent e) {
                final int i = expiryReturnTable.getSelectedRow();
                final int j = expiryReturnTable.getSelectedColumn();
                InputMap im = expiryReturnTable.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                if (e.getKeyCode() == 10) {
                    KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                    KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                    im.put(enter, im.get(tab));
                }
                if (e.getKeyCode() == KeyEvent.VK_ESCAPE) {
                }
            }

            @Override
            public void keyTyped(KeyEvent e) {
            }
        });
      
        return expiryReturnTable;
    }



    public void expiryReturnCalculations() {
        final int rowCnt = expiryReturnTable.getRowCount();
          expiryReturnAmount = 0.0;
                int k = 0;
                for (k = 0; k < rowCnt; k++) {
                    String item_code = "";
                    item_code = (String) expiryReturnTable.getModel().getValueAt(k, 1);
                    if (item_code != null && item_code.trim().length() > 0) {
                        Double total = 0.0;
                        total =  Double.parseDouble("" + expiryReturnTable.getModel().getValueAt(k, 10));

                        if (total != null && total > 0) {
                            expiryReturnAmount += total;
                        }
                    }
                }
                expiryReturnAmount = Value.Round(expiryReturnAmount, 2);
    }
      public JComponent getScrollTable(JComponent jt) {
        expiryReturnTable = (JTable) jt;
        expiryReturnScrollPane.add(expiryReturnTable);
        expiryReturnScrollPane.setViewportView(expiryReturnTable);
        return expiryReturnScrollPane;
    }

    public void focusSet() {
        expiryReturnTable.requestFocus();
        expiryReturnTable.changeSelection(0, 0, false, false);
        expiryReturnTable.getModel().setValueAt(1, 0, 0);
    }

    public void focusSet(int row, int col) {
        expiryReturnTable.requestFocus();
        expiryReturnTable.changeSelection(row, col, false, false);
    }

    public void clearAllValues() {
        DefaultTableModel model = (DefaultTableModel) expiryReturnTable.getModel();
        model.getDataVector().removeAllElements();
        for (int i = 0; i < 9; i++) {
            addRow();
        }
        expiryReturnTable.revalidate();
    }

    public void addRow() {
        DefaultTableModel model = (DefaultTableModel) expiryReturnTable.getModel();
        Vector datas = new Vector();
        for (int i = 0; i < expiryReturnTable.getModel().getColumnCount(); i++) {
            datas.addElement(null);
        }
        model.insertRow(expiryReturnTable.getRowCount(), datas);
    }

    public void removeRow() {
        int i = expiryReturnTable.getSelectedRow();
        int j = expiryReturnTable.getSelectedColumn();
        int rows = expiryReturnTable.getRowCount();
        if (i != -1) {
            DefaultTableModel model = (DefaultTableModel) expiryReturnTable.getModel();
            if (rows == 1) {
                if (i == 0) {
                    model.removeRow(i);
                    for (int n = 0; n < initR; n++) {
                        addRow();
                    }
                    expiryReturnTable.changeSelection(0, 0, false, false);
                }
            } else {
                model.removeRow(i);
                int rows1 = expiryReturnTable.getRowCount();
                if (i + 1 != rows) {
                    for (int n = 0; n < rows1; n++) {
                        if (expiryReturnTable.getModel().getValueAt(n, 0) == null); else {
                            expiryReturnTable.getModel().setValueAt(n + 1, n, 0);
                        }
                    }
                    expiryReturnTable.changeSelection(rows1 - 1, j, false, false);
                } else {
                    expiryReturnTable.changeSelection(i - 1, j, false, false);
                }
            }
        } else {
            Alert.inform("Please select row to remove ...");
        }
    }

    public void clearData() {
        DefaultTableModel model = (DefaultTableModel) expiryReturnTable.getModel();
        model.getDataVector().removeAllElements();
        expiryReturnTable.revalidate();
    }

    public void keyFunctions() {
    }

    public void addBasicRows() {
        for (int i = 0; i < 9; i++) {
            addRow();
        }
    }

    public String[][] getTableContenets() {
        int rowCount = expiryReturnTable.getModel().getRowCount();
        int colCount = expiryReturnTable.getModel().getColumnCount();
        String[][] values = new String[rowCount][colCount];
        for (int i = 0; i < rowCount; i++) {
            for (int j = 0; j < colCount; j++) {
                values[i][j] = "" + expiryReturnTable.getModel().getValueAt(i, j);
            }
        }
        return values;
    }

    public int totalRow() {
        int tot = 0;
        for (int i = 0; i < expiryReturnTable.getModel().getRowCount(); i++) {
            if (expiryReturnTable.getModel().getValueAt(i, 2) != null) {
                tot++;
            }
        }
        return tot;
    }

    public void loadExpiryReturnDateTable(String exDate, String distName, String totAmt) {
        try {
            expiryReturnController=(com.vanuston.medeil.implementation.ExpiryReturn) RegistryFactory.getClientStub(RegistryConstants.ExpiryReturn);  // ExpiryReturnController expiryReturnController = new ExpiryReturnController();
            ExpiryReturnModel expiryReturnBean = new ExpiryReturnModel();
//            List<ExpiryReturnModel> get=new ArrayList();
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            int i = 0;
            clearData();
            int j = 1;
            String curD = DateUtils.changeFormatDate(sdf.parse(exDate));
            
            expiryReturnBean.setExpiry_checkVal("loadExpiryReturnDateTable");
            expiryReturnBean.setExpiry_curr_date(curD);
            expiryReturnBean.setExpiry_dist_name(distName);
            expiryReturnBean.setExpiry_total_amount(Double.parseDouble(totAmt));
            expiryReturnBean=expiryReturnController.viewAllRecord(expiryReturnBean);
//            String sql = "";
//            ResultSet rs = null;
//            sql = "SELECT  dist_name,from_date,to_date,curr_date,discount,item_name,formulation,mfgname,batch_no,qty,free_qty,expiry_date,purchase_rate,mrp,item_total_amount,sub_total,dis_amount,roundoff_amount,total_amount,return_basedon,include_exclude,debit_note_no FROM expiryreturn where  curr_date='" + curD + "' and dist_name='" + distName + "' and total_amount='" + totAmt + "'";
//            rs = DBConnection.getStatement().executeQuery(sql);
//            while (rs.next()) {
//                 sDate = DateUtils.normalFormatDate(rs.getDate("from_date"));

//            }


            int in =0;
            ExpiryReturnModel expiryReturnAddBean;
            List<ExpiryReturnModel> get = expiryReturnBean.getExpiryreturn();
            

                 for (int g = 0; g < get.size();g++) {
                     expiryReturnAddBean=new ExpiryReturnModel();
                    expiryReturnAddBean=get.get(g);
                    
                addRow();
                if(in==0)
                {
//                    dbNoteNo = rs.getString("debit_note_no");
                    dbNoteNo = expiryReturnBean.getExpiry_debit_note_no();
                }
//                purSel = rs.getInt("return_basedon");
//                excludeFree = rs.getInt("include_exclude");
//                sDate = DateUtils.normalFormatDate(rs.getDate("from_date"));
//                eDate = DateUtils.normalFormatDate(rs.getDate("to_date"));
//                distributorName = rs.getString("dist_name");
//                discount = rs.getString("discount");
//                expiryReturnAmount = rs.getDouble("sub_total");
//                disA = rs.getString("dis_amount");
//                roundA = rs.getString("roundoff_amount");
//                totA = rs.getString("total_amount");
//                subT = rs.getString("sub_total");
                expiryReturnTable.getModel().setValueAt(j, i, 0);
                expiryReturnTable.getModel().setValueAt(expiryReturnAddBean.getExpiry_item_name(), i, 1);
                expiryReturnTable.getModel().setValueAt(expiryReturnAddBean.getExpiry_formulation(), i, 2);
                expiryReturnTable.getModel().setValueAt(expiryReturnAddBean.getExpiry_mfgname(), i, 3);
                expiryReturnTable.getModel().setValueAt(expiryReturnAddBean.getExpiry_batch_no(), i, 4);
                expiryReturnTable.getModel().setValueAt(expiryReturnAddBean.getExpiry_qty(), i, 5);
                expiryReturnTable.getModel().setValueAt(expiryReturnAddBean.getExpiry_free_qty(), i, 6);
//              expiryReturnTable.getModel().setValueAt(DateUtils.normalFormatDate(expiryReturnBean.getExpiry_date()), i, 7);
                expiryReturnTable.getModel().setValueAt(expiryReturnAddBean.getExpiry_date(), i, 7);
                expiryReturnTable.getModel().setValueAt(expiryReturnAddBean.getExpiry_purchase_rate(), i, 8);
                expiryReturnTable.getModel().setValueAt(expiryReturnAddBean.getExpiry_mrp(), i, 9);
                expiryReturnTable.getModel().setValueAt(expiryReturnAddBean.getExpiry_item_total_amount(), i, 10);

                purSel =expiryReturnBean.getExpiry_return_basedon();
                excludeFree = expiryReturnBean.getExpiry_include_exclude();
                
                sDate = expiryReturnBean.getExpiry_from_date();
                
                eDate = expiryReturnBean.getExpiry_to_date();
                distributorName = expiryReturnBean.getExpiry_dist_name();
                discount = String.valueOf(expiryReturnBean.getExpiry_discount());
                expiryReturnAmount = expiryReturnBean.getExpiry_sub_total();
                disA = String.valueOf(expiryReturnBean.getExpiry_dis_amount());
                roundA = String.valueOf(expiryReturnBean.getExpiry_roundoff_amount());
                totA = String.valueOf(expiryReturnBean.getExpiry_total_amount());
                subT = String.valueOf(expiryReturnBean.getExpiry_sub_total());

                
//                expiryReturnTable.getModel().setValueAt(String.valueOf(j), i, 0);
//                expiryReturnTable.getModel().setValueAt(rs.getString("item_name"), i, 1);
//                expiryReturnTable.getModel().setValueAt(rs.getString("formulation"), i, 2);
//                expiryReturnTable.getModel().setValueAt(rs.getString("mfgname"), i, 3);
//                expiryReturnTable.getModel().setValueAt(rs.getString("batch_no"), i, 4);
//                expiryReturnTable.getModel().setValueAt(rs.getInt("qty"), i, 5);
//                expiryReturnTable.getModel().setValueAt(rs.getInt("free_qty"), i, 6);
//                expiryReturnTable.getModel().setValueAt(DateUtils.normalFormatDate(rs.getDate("expiry_date")), i, 7);
//                expiryReturnTable.getModel().setValueAt(rs.getDouble("purchase_rate"), i, 8);
//                expiryReturnTable.getModel().setValueAt(rs.getDouble("mrp"), i, 9);
//                expiryReturnTable.getModel().setValueAt(rs.getDouble("item_total_amount"), i, 10);
                i++;
                j++;
                in++;
            }
        } catch (Exception e) {
            String msg = "Class : Expiry Return Table  method : loadExpiryReturnDateTable()  = " + e.getMessage();
            log.debug(msg);
        }
    }

    public void loadExpiryReturnTable() {
        try {
            double totalamount = 0.00;
            int m = 0;
            m = expiryReturnTable.getModel().getRowCount();
            for (int i = 0; i < expiryReturnTable.getModel().getRowCount(); i++) {
                if (expiryReturnTable.getModel().getValueAt(i, 1) != null && expiryReturnTable.getModel().getValueAt(i, 1) != "" && expiryReturnTable.getModel().getValueAt(i, 9) != null && expiryReturnTable.getModel().getValueAt(i, 9) != "") {
                    double totalValue = 0.00;
                    if (purSel == 0 && excludeFree == 0) {
                        
                        int qty = (Integer) expiryReturnTable.getModel().getValueAt(i, 5);
                        double purRate = Double.parseDouble("" + expiryReturnTable.getModel().getValueAt(i, 8));
                        totalamount += qty * purRate;
                        totalValue = qty * purRate;
                        expiryReturnTable.getModel().setValueAt(totalValue, i, 10);
                    } else if (purSel == 0 && excludeFree == 1) {
                        
                        int qty = (Integer) expiryReturnTable.getModel().getValueAt(i, 5);
                        int free = (Integer) expiryReturnTable.getModel().getValueAt(i, 6);
                        double purRate = Double.parseDouble("" + expiryReturnTable.getModel().getValueAt(i, 8));
                        qty += free;
                        totalamount += qty * purRate;
                        totalValue = qty * purRate;
                        expiryReturnTable.getModel().setValueAt(totalValue, i, 10);
                    } else if (purSel == 1 && excludeFree == 0) {
                        
                        int qty = (Integer) expiryReturnTable.getModel().getValueAt(i, 5);
                        double purRate = Double.parseDouble("" + expiryReturnTable.getModel().getValueAt(i, 9));
                        totalamount += qty * purRate;
                        totalValue = qty * purRate;
                        expiryReturnTable.getModel().setValueAt(totalValue, i, 10);
                    } else if (purSel == 1 && excludeFree == 1) {
                        
                        int qty = (Integer) expiryReturnTable.getModel().getValueAt(i, 5);
                        int free = (Integer) expiryReturnTable.getModel().getValueAt(i, 6);
                        double purRate = Double.parseDouble("" + expiryReturnTable.getModel().getValueAt(i, 9));
                        qty += free;
                        totalamount += qty * purRate;
                        totalValue = qty * purRate;
                        expiryReturnTable.getModel().setValueAt(totalValue, i, 10);
                    }
                }
            }
            expiryReturnAmount = totalamount;
            expiryReturnAmount = Value.Round(expiryReturnAmount, 2);

        } catch (Exception e) {
            String msg = "Class : Expiry Return Table  method : loadExpiryReturnTable()  = " + e.getMessage();
            log.debug(msg);
        }
    }
}
