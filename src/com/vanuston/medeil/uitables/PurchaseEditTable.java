package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.model.PurchaseModel;
//import com.vanuston.medeil.util.DateCellEditor;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.DecimalFormatRenderer;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.PercentageFormatRenderer;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.util.Value;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.rmi.RemoteException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Vector;
import javafx.scene.control.Button;
import javax.swing.*;
import javax.swing.table.DefaultTableModel;
import javafx.scene.control.Label;
import javafx.scene.control.TextBox;
import javafx.stage.Alert;
//import javax.swing.table.DefaultTableColumnModel;

public class PurchaseEditTable {

    Logger log = Logger.getLogger(PurchaseEditTable.class, "Utilities");
    int ss1 = 0;
    public JTable purcEditTable;
    public String thisForm = null;
    public int initR;
    public JScrollPane scrollPane = new JScrollPane();
    public int purcQty[];
    public int purcFreeQty[];
    public double purcPrice[];
    public double purcVAT4[];

    public double purcDisct[];
//    public double purcDisctMrp[];

    public double purcAdjVAT4[];

    public double purcAdjDist[];
    public double purcSubTot[];
    public int totPurcQty = 0;
    public int totPurcFreeQty = 0;
    public int totPurcItems = 0;
    public double totPurcAmt = 0.00;
    
    public double totPurcDistAmt = 0.0;
//    public double totPurcDistAmtMrp = 0.0;
    public double totPurcVAT4Amt = 0.0;
//    public double totPurcVAT4AmtMrp = 0.0;
    public int totPurcAdjQty = 0;
    public int totPurcAdjItems = 0;
    public double totPurcAdjAmt = 0.00;
    public double totPurcAdjDistAmt = 0.0;
    public double totPurcAdjVAT4Amt = 0.0;
    
    public double totMargin = 0.0;
    public double totMrp = 0.0;
    public double totPurPrice = 0.0;

    public int nullVal = 0;
    public KeyStroke focusOut = KeyStroke.getKeyStroke(KeyEvent.VK_SPACE, KeyEvent.CTRL_MASK);
    public KeyStroke focusOut1 = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, KeyEvent.CTRL_MASK);
    public KeyStroke shrctF4 = KeyStroke.getKeyStroke(KeyEvent.VK_F4, 0);
    public KeyStroke shrctF7 = KeyStroke.getKeyStroke(KeyEvent.VK_F7, 0);
    public KeyStroke shrctF12 = KeyStroke.getKeyStroke(KeyEvent.VK_F12, 0);
    public KeyStroke shrctCtrlAr = KeyStroke.getKeyStroke(KeyEvent.VK_LEFT, KeyEvent.CTRL_MASK);
    public KeyStroke callTable = KeyStroke.getKeyStroke(KeyEvent.VK_T, KeyEvent.CTRL_MASK);
    public KeyStroke ctrlD = KeyStroke.getKeyStroke(KeyEvent.VK_D, KeyEvent.CTRL_MASK);
    public double amt = 0.00;
    public TextBox fxTxt = new TextBox();
    public Label fxLbl = new Label();
    public Label fxLbl2 = new Label();
    public Button fxbtn = new Button();
    public GetPurcDrugData g = null;
    public int is = 0;
    public int js = 0;
    public String itemCode = "";
    public boolean barcodeSelected=false;
    public boolean barcodeFocus = false;


    public JComponent createTable() throws RemoteException {

        final int initRow = 10;
        Object[] colName = {"S.No.", "Product Name", "Formulation", "Mfr.", "Qty.(Strip(s))", "Free", "Batch No.", "Exp(mm/yy)", "Pack(Tablet(s) per Strip)", "Pur. Price", "MRP", "S.Disc %", "Margin","P.Disc %", "VAT %", "Amount", "Item Code", "Is Temp Stocks", "Is PR Adjusted", "vat_calc_flag","Editable","old Batch"};
        Class[] type = {java.lang.Integer.class, java.lang.String.class, java.lang.String.class, java.lang.String.class,
            java.lang.Integer.class, java.lang.Integer.class, java.lang.String.class, java.lang.Object.class, java.lang.Integer.class,
            java.lang.Double.class, java.lang.Double.class, java.lang.Double.class,java.lang.Double.class,java.lang.Double.class, java.lang.Double.class, java.lang.Double.class,
            java.lang.String.class, java.lang.Boolean.class, java.lang.Boolean.class, java.lang.Integer.class,java.lang.Boolean.class,java.lang.String.class};
        boolean[] canEdit = {false, false, false, false, true, true, true, true, true, true, true, true, false, true, true, false, false, false, false, false,false,false};
        int[] width = {25, 90, 58, 25, 30, 25, 70, 60, 25, 45, 40, 40, 35, 40, 30, 75, 0, 0, 0, 0, 0, 0};

        initR = initRow;
        final Class[] types = type;
        final boolean[] canEditCols = canEdit;
        final int[] colWidth = width;
        purcEditTable = new JTable();
        g = new GetPurcDrugData(purcEditTable, "Purchase");
        Vector cols = new Vector();
        Vector data = new Vector();
        int len = colName.length;
        for (int i = 0; i < initRow; i++) {
            Vector c = new Vector();
            for (int j = 0; j < len; j++) {
                if (j == 20) {
                    c.addElement(Boolean.TRUE);
                } else {
                    c.addElement(null);
                }
            }
            data.addElement(c);
        }
        for (int n = 0; n < len; n++) {
            cols.addElement(colName[n]);
        }
        try {
            purcEditTable.setModel(new javax.swing.table.DefaultTableModel(data, cols) {

                Class[] type = types;
                boolean[] canEditCol = canEditCols;

                @Override
                public Class getColumnClass(int columnIndex) {
                    return type[columnIndex];
                }

                @Override
                public boolean isCellEditable(int rowIndex, int columnIndex) {
                    boolean chk = false;
                    if (purcEditTable.getModel().getValueAt(rowIndex, 20) != null) {
                        boolean ss = Boolean.valueOf(purcEditTable.getModel().getValueAt(rowIndex, 20).toString());
                        if (ss) {
                            chk = canEditCol[columnIndex];
                        }
                    } else {
                        chk = canEditCol[columnIndex];
                    }
                    return chk;
                }
            });
        } catch (Exception ex) {
            String ss = "   Class : PurchaseEditTable  Method : Create Table    Exception : " + ex.getMessage();
            log.debug(ss);
        }
        for (int i = 0; i < len; i++) {
            purcEditTable.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }
        purcEditTable.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        purcEditTable.setSelectionMode(0);
        purcEditTable.getTableHeader().setBackground(new Color(226, 238, 244));
        purcEditTable.getTableHeader().setFont(new Font("Arial", Font.BOLD, 16));
        purcEditTable.setShowGrid(true);
        purcEditTable.getTableHeader().setReorderingAllowed(false);
        purcEditTable.getColumnModel().getColumn(15).setCellRenderer(new DecimalFormatRenderer());
        purcEditTable.getColumnModel().getColumn(14).setCellRenderer(new PercentageFormatRenderer());
        purcEditTable.getColumnModel().getColumn(13).setCellRenderer(new PercentageFormatRenderer());
        purcEditTable.getColumnModel().getColumn(12).setCellRenderer(new PercentageFormatRenderer());
        purcEditTable.getColumnModel().getColumn(11).setCellRenderer(new PercentageFormatRenderer());
        purcEditTable.removeColumn(purcEditTable.getColumnModel().getColumn(21));
        purcEditTable.removeColumn(purcEditTable.getColumnModel().getColumn(20));
        purcEditTable.removeColumn(purcEditTable.getColumnModel().getColumn(19));
        purcEditTable.removeColumn(purcEditTable.getColumnModel().getColumn(18));
        purcEditTable.removeColumn(purcEditTable.getColumnModel().getColumn(17));
        purcEditTable.removeColumn(purcEditTable.getColumnModel().getColumn(16));
        purcEditTable.putClientProperty("terminateEditOnFocusLost", Boolean.TRUE);
        purcEditTable.getInputMap().put(focusOut, "focusOut");
        purcEditTable.getInputMap().put(focusOut1, "focusOut");
        purcEditTable.getInputMap().put(shrctF4, "focusOut");
        purcEditTable.getInputMap().put(shrctF7, "focusOut");
        purcEditTable.getInputMap().put(shrctCtrlAr, "focusOut");
        purcEditTable.getInputMap().put(shrctF12, "removeRow");
        purcEditTable.getInputMap().put(ctrlD, "addRow");
        purcEditTable.getInputMap().put(callTable, "callTable");
        purcEditTable.getActionMap().put("addRow", new AbstractAction("removeRow") {

            @Override
            public void actionPerformed(ActionEvent evt) {
                int sel = purcEditTable.getSelectedRow();
                if (sel >= 0) {
                    getAddition(sel);
                }
            }
        });
        purcEditTable.getActionMap().put("removeRow", new AbstractAction("removeRow") {

            @Override
            public void actionPerformed(ActionEvent evt) {
                removeRow();
            }
        });

        purcEditTable.getActionMap().put("focusOut", new AbstractAction("focusOut") {

            @Override
            public void actionPerformed(ActionEvent evt) {
                purcEditTable.clearSelection();
                purcEditTable.transferFocus();
            }
        });
        purcEditTable.getActionMap().put("callTable", new AbstractAction("callTable") {

            @Override
            public void actionPerformed(ActionEvent evt) {
                for (int val = 0; val < purcEditTable.getRowCount(); val++) {
                    if (purcEditTable.getModel().getValueAt(val, 2) == null) {
                        if (purcEditTable.getModel().getValueAt(val, 0) == null) {
                            purcEditTable.getModel().setValueAt(val + 1, val, 0);
                        }
                        purcEditTable.changeSelection(val, 2, false, false);
                        break;
                    }
                }
                 if(barcodeSelected==false) {
                    g.refreshDrugTab();
                    barcodeFocus=false;
                }
                else {
                    g.refreshDrugTab(itemCode,"barcode");
                    barcodeSelected = false;
                    barcodeFocus=true;
                }
            }
        });
//        DefaultTableColumnModel dcm = (DefaultTableColumnModel) purcEditTable.getColumnModel();
//        dcm.getColumn(7).setCellRenderer(new DateCellEditor.DateRenderer());
//        dcm.getColumn(7).setCellEditor(new DateCellEditor());
        purcEditTable.setGridColor(new java.awt.Color(204, 204, 255));
        purcEditTable.setCellSelectionEnabled(true);
        purcEditTable.setRowHeight(25);
        purcEditTable.setSelectionBackground(Color.LIGHT_GRAY);
        purcEditTable.setSelectionForeground(Color.RED);
        purcEditTable.revalidate();
        purcEditTable.getActionMap().put("callTable", new AbstractAction("callTable") {

            @Override
            public void actionPerformed(ActionEvent evt) {
                for (int val = 0; val < purcEditTable.getRowCount(); val++) {
                    if (purcEditTable.getModel().getValueAt(val, 2) == null) {
                        if (purcEditTable.getModel().getValueAt(val, 0) == null) {
                            purcEditTable.getModel().setValueAt(val + 1, val, 0);
                        }
                        purcEditTable.changeSelection(val, 2, false, false);
                        break;
                    }
                }
                g.refreshDrugTab();
            }
        });

        purcEditTable.addMouseListener(new MouseAdapter() {

            @Override
            public void mouseClicked(MouseEvent e) {
                final int i = purcEditTable.getSelectedRow();
                final int j = purcEditTable.getSelectedColumn();
                purchaseCalculations();
                try {
                    for (int val = 0; val < purcEditTable.getRowCount(); val++) {
                        if (purcEditTable.getModel().getValueAt(val, 4) == null);
                        /*else {
                            if (purcEditTable.getModel().getValueAt(val, 4).equals(0)) {
                                purcEditTable.changeSelection(val, 4, false, false);
                            }
                        }*/
                    }
                } catch (Exception ex) {
                    String ss = "   Class : PurchaseEditTable  Method : tableMouseClicked    Exception : " + ex.getMessage();
                    log.debug(ss);
                }
            }
        });
        purcEditTable.addKeyListener(new KeyListener() {

            @Override
            public void keyReleased(KeyEvent e) {
                try {
                    final int i = purcEditTable.getSelectedRow();
                    final int j = purcEditTable.getSelectedColumn();
                    purchaseCalculations();
                    calculateMargin();
                    if (e.getKeyCode() == 10) {
                        InputMap im = purcEditTable.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                        KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                        KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                        im.put(enter, im.get(tab));
                    }
                    if (!e.isActionKey()) {
                        if (!Boolean.valueOf(purcEditTable.getModel().getValueAt(i, 20).toString())) {
                            String sub = "";
                            if (Boolean.valueOf(purcEditTable.getModel().getValueAt(i, 18).toString())) {
                                sub = "Purchase Adjustment Item";
                            } else {
                                sub = "sold or return";
                            }
                            JOptionPane.showMessageDialog(null, "This \"" + purcEditTable.getModel().getValueAt(i, 1) + "\" item(s) values are couldn't change, because it has " + sub, "Purchase Invoice", JOptionPane.OK_CANCEL_OPTION);
                        }
                    }


                    if ((j == 1 || j == 2) && e.getKeyCode() != 27 && purcEditTable.getModel().isCellEditable(i, 6)) {
                        if (purcEditTable.getModel().getValueAt(i, 1) == null || purcEditTable.getModel().getValueAt(i, 2) == null) {
                            if(barcodeSelected==false) {
                                g.refreshDrugTab();
                                barcodeFocus=false;
                            }
                            else {
                                g.refreshDrugTab(itemCode,"barcode");
                                barcodeSelected = false;
                                barcodeFocus=true;
                            }
                        }
                    }
                    if (j == 5) {
                        if (purcEditTable.getModel().getValueAt(i, 4) == null || purcEditTable.getModel().getValueAt(i, 4).toString().trim().length() <= 0) {
                            purcEditTable.changeSelection(i, 4, false, false);
                        } else {
                            getAddition(i);
                        }
                    }
                    if (j == 6) {
                        if (purcEditTable.getModel().getValueAt(i, 5) == null) {
                            purcEditTable.changeSelection(i, 5, false, false);
                        } else {                            
                            getAddition(i);
                        }
                    }
                    if (j == 7) {
                        if (purcEditTable.getModel().getValueAt(i, 6) == null) {
                            purcEditTable.changeSelection(i, 6, false, false);
                        } else {
                        if(DateUtils.now("MM/yy").equalsIgnoreCase(""+purcEditTable.getModel().getValueAt(i, 7))){
                            purcEditTable.getModel().setValueAt("",i,7);
                            }
                            getAddition(i);
                        }
                    }
                    if (j == 8) {
                        if (purcEditTable.getModel().getValueAt(i, 7) == null) {
                            purcEditTable.changeSelection(i, 7, false, false);
                        } else {
                            getAddition(i);
                        }
                    }
                    if (j == 9) {
                        if (purcEditTable.getModel().getValueAt(i, 8) == null) {
                            purcEditTable.changeSelection(i, 8, false, false);
                        } else {
                            getAddition(i);
                        }
                    }
                    if (j == 10) {
                        if (purcEditTable.getModel().getValueAt(i, 9) == null) {
                            purcEditTable.changeSelection(i, 9, false, false);
                        } else {
                            getAddition(i);
                        }
                    }
                    if (j == 12) {
                        if (purcEditTable.getModel().getValueAt(i, 10) == null) {
                            purcEditTable.changeSelection(i, 10, false, false);
                        } else {
                            getAddition(i);
                        }
                    }
                    if (j == 14) {
                        getAddition(i);
                    }
                    if (j == purcEditTable.getColumnModel().getColumnCount() - 1) {
                        double dis = 0;
                        double vat = 0;
                        if (vat == 0 || vat == 4 || vat == 12.5) {
                            getAddition(i);
                            purcEditTable.changeSelection(i + 1, 0, false, false);
                            if (i <= initR) {
                                purcEditTable.getModel().setValueAt(i + 2, i + 1, 0);
                            }
                        } else {
                            Alert.inform("Purchase Invoice", "Vat % is only 4 or 12.5 only allowed ");
                        }
                    }
                } catch (Exception ex) {
                    String ss = "   Class : PurchaseEditTable  Method : tablekeyReleased    Exception : " + ex.getMessage();
                    log.debug(ss);
                }
            }

            @Override
            public void keyPressed(KeyEvent e) {
                final int i = purcEditTable.getSelectedRow();
                final int j = purcEditTable.getSelectedColumn();
                try {
                    InputMap im = purcEditTable.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                    if (e.getKeyCode() == 10) {
                        ss1 = 0;
                        KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                        KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                        KeyStroke f2 = KeyStroke.getKeyStroke(KeyEvent.VK_ESCAPE, 0);
                        if (j == 15) {
                            getAddition(i);
                        }
                        if (j == 7 && ss1 == 0) {
                            if (purcEditTable.getCellEditor() == null) {
                                im.put(enter, im.get(f2));
                            } else if (purcEditTable.getCellEditor() != null) {
                                im.put(enter, im.get(tab));
                                ss1 = 0;
                            }
                            ss1 = 1;
                        } else {
                            im.put(enter, im.get(tab));
                            ss1 = 0;
                        }
                    }
                    if (e.isActionKey()) {
                        for (int val = 0; val < purcEditTable.getRowCount(); val++) {
                            if (purcEditTable.getModel().getValueAt(val, 4) == null); else {
                                if ( purcEditTable.getModel().getValueAt(val, 4)!=null && !purcEditTable.getModel().getValueAt(val, 4).equals("") && Integer.parseInt(purcEditTable.getModel().getValueAt(val, 4).toString()) == 0) {
                                    purcEditTable.changeSelection(val, 4, false, false);
                                    break;
                                }
                            }
                        }
                    }
                    if (e.getKeyCode() == KeyEvent.VK_DELETE || e.getKeyCode() == KeyEvent.VK_BACK_SPACE) {
                        if (purcEditTable.getModel().isCellEditable(i, j)) {
                            purcEditTable.getModel().setValueAt("", i, j);
                        }
                    }
                    else {
                     char c = e.getKeyChar();
                     if(purcEditTable.getModel().isCellEditable(i, j)) {
                            if(j==6) {
                                if((c>='0' && c<='9') || (c>='a' && c<='z') || (c>='A' && c<='Z'))
                                purcEditTable.getModel().setValueAt("", i, j);
                            }
                            else if(j==7) {
                                if((c>='0' && c<='9'))
                                purcEditTable.getModel().setValueAt("", i, j);
                            }
                            else {
                            if((c>'0' && c<='9'))
                            purcEditTable.getModel().setValueAt(0, i, j);
                            }
                     }
                    }
                } catch (Exception ex) {
                    String ss = "   Class : PurchaseEditTable  Method : tablekeyPressed    Exception : " + ex.getMessage();
                    log.debug(ss);
                }
            }

            @Override
            public void keyTyped(KeyEvent e) {
                InputMap im = purcEditTable.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                im.put(enter, im.get(tab));
                ss1 = 0;
            }
        });
        return purcEditTable;
    }

    public  void callPRAdjust(String PRNo) {
        GetPRAdjust prAdj = new GetPRAdjust(purcEditTable, "Purchase", PRNo);
        prAdj.setVisible(true);
    }

    public  int insertTableFrm(Object[][] tableVal) {
        int val=0;
        try {
            int row = purcEditTable.getModel().getRowCount();
            int jj = 0;
            for (int i = 0; i < row; i++) {
                if (purcEditTable.getModel().getValueAt(i, 1) == null && purcEditTable.getModel().getValueAt(i, 2) == null) {
                    if (purcEditTable.getModel().getValueAt(i, 3) == null && purcEditTable.getModel().getValueAt(i, 4) == null) {
                        jj = i;
                        break;
                    }
                }
            }
            int rLen = tableVal.length;
            int n = jj + rLen;
            if (n > row) {
                for (int j = 0; j < n - row; j++) {
                    addRow();
                }
            }
            for (int r = jj,i=0; i < rLen; r++,i++) {
                for (int c = 0; c < tableVal[i].length; c++) {
                    if (c == 0) {
                        purcEditTable.getModel().setValueAt(r + 1, r, c);
                    } else if (c == 4 || c == 5 || c == 8) {
                        if (tableVal[i][c] != null) {
                            purcEditTable.getModel().setValueAt(Integer.parseInt(tableVal[i][c].toString()), r, c);
                        } else {
                            purcEditTable.getModel().setValueAt(tableVal[i][c], r, c);
                        }
                    }
                    else if (c >= 10 && c <= 15) {
                        if (tableVal[i][c] != null) {
                            purcEditTable.getModel().setValueAt(Double.parseDouble(tableVal[i][c].toString()), r, c);
                        } else {
                            purcEditTable.getModel().setValueAt(tableVal[i][c], r, c);
                        }
                    } else if (c == 17) {
                        purcEditTable.getModel().setValueAt(Boolean.FALSE, r, c);
                    } else if (c == 18) {
                        purcEditTable.getModel().setValueAt(Boolean.TRUE, r, c);
                    } else {
                        purcEditTable.getModel().setValueAt(tableVal[i][c], r, c);
                        val = 1;
                    }

                }
            }
        } catch (Exception ex) {
            String ss = "Method: insertTableFrm    Exception : " + ex.getMessage();
            log.debug(ss);

        }
        return val;
    }

    void getAddition(int i) {
        int aRow = purcEditTable.getModel().getRowCount() - 1;
        if (i == aRow) {
            if (purcEditTable.getModel().getValueAt(i, 1) != null) {
                if (purcEditTable.getModel().getValueAt(i, 1).toString().trim().length() > 0) {
                    addRow();
                }
            }
        }
    }

    public JComponent getScrollTable(JComponent jt) {
        purcEditTable = (JTable) jt;
        scrollPane.add(purcEditTable);
        scrollPane.setViewportView(purcEditTable);
        return scrollPane;
    }

    public void LoadPurchaseEditTable(PurchaseModel tableVal){
        clearData();
        DateUtils dutil = new DateUtils();
        PurchaseModel purcModel = tableVal;        
        PurchaseModel pModel;
        List<PurchaseModel> purcOrderBill = new ArrayList<PurchaseModel>();
        purcOrderBill = purcModel.getListofitems();
        int cnt = purcOrderBill.size();
        if (cnt > 10) {
            DefaultTableModel model = (DefaultTableModel) purcEditTable.getModel();
            model.getDataVector().removeAllElements();
            purcEditTable.revalidate();
            for (int j = 0; j < cnt; j++) {
                addRow();
            }
        }
        int index = 0;
        try {
            CommonImplements commonCont = (CommonImplements)RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
            for (index = 0; index < purcOrderBill.size(); index++) {
                pModel = purcOrderBill.get(index);
                String expDate  = new SimpleDateFormat("MM/yy").format(new SimpleDateFormat("yyyy-MM-dd").parse((pModel.getExpdate())));
                String query = "select vat_calc_flag from drugtable where itemcode='"+pModel.getItemCode()+"'";
                int vat_calc_flag=Integer.parseInt(commonCont.getQueryValue(query));
                purcEditTable.getModel().setValueAt(index + 1, index, 0);
                purcEditTable.getModel().setValueAt(pModel.getItemName(), index, 1);
                purcEditTable.getModel().setValueAt(pModel.getFormulation(), index, 2);
                purcEditTable.getModel().setValueAt(pModel.getMfrName(), index, 3);
                purcEditTable.getModel().setValueAt(pModel.getQuantity(), index, 4);
                purcEditTable.getModel().setValueAt(pModel.getFree(), index, 5);
                purcEditTable.getModel().setValueAt(pModel.getBatch(), index, 6);
                purcEditTable.getModel().setValueAt(expDate, index, 7);
                purcEditTable.getModel().setValueAt(pModel.getPacking(), index, 8);
                purcEditTable.getModel().setValueAt(pModel.getUnitprice(), index, 9);
                purcEditTable.getModel().setValueAt(pModel.getMrp(), index, 10);
                purcEditTable.getModel().setValueAt(pModel.getSalesDiscount(), index, 11);
                purcEditTable.getModel().setValueAt(pModel.getUnitDis(), index, 13);
                purcEditTable.getModel().setValueAt(pModel.getUnitVat(), index, 14);
                purcEditTable.getModel().setValueAt(pModel.getTotVal(), index, 15);
                purcEditTable.getModel().setValueAt(pModel.getItemCode(), index, 16);
                purcEditTable.getModel().setValueAt(Boolean.valueOf(pModel.getPurc_temp_flagid()), index, 17);
                purcEditTable.getModel().setValueAt(Boolean.valueOf(pModel.getPurc_is_adj()), index, 18);
                purcEditTable.getModel().setValueAt(vat_calc_flag, index, 19);
                purcEditTable.getModel().setValueAt(pModel.getBatch(), index, 21);
            }
        } catch (Exception e) {
            String ss = "Class: PurchaseEditTable      Method: LoadPurchaseEditTable    Exception : " + e.getMessage();
            log.debug(ss);
        }
    }

    public void addRow() {
        try {
            DefaultTableModel model = (DefaultTableModel) purcEditTable.getModel();
            int row = purcEditTable.getRowCount();
            Vector datas = new Vector();
            for (int i = 0; i < purcEditTable.getModel().getColumnCount(); i++) {
                if (row == 0 && i == 0) {
                    datas.addElement(i + 1);
                } else if (i == 20) {
                    datas.addElement(Boolean.TRUE);
                } else {
                    datas.addElement(null);
                }
            }
            model.insertRow(purcEditTable.getRowCount(), datas);
        } catch (Exception ex) {
            String ss = "   Class : PurchaseEditTable  Method : removeRow    Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

    public void removeRow() {
        int i = purcEditTable.getSelectedRow();
        int j = purcEditTable.getSelectedColumn();
        int rows = purcEditTable.getRowCount();
        try {
            if (purcEditTable.getModel().getValueAt(i, 1) != null) {
                CommonImplements commonCont = (CommonImplements)RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
                int batchExists = Integer.parseInt(commonCont.getQueryValue("SELECT count(*) FROM (select item_code,batch_no from sales_Cash_bill where batch_no='"+""+purcEditTable.getModel().getValueAt(i, 21)+"' and item_code='"+""+purcEditTable.getModel().getValueAt(i, 16)+"' union "
                        + "select item_code,batch_no from sales_Credit_bill where batch_no='"+""+purcEditTable.getModel().getValueAt(i, 21)+"' and item_code='"+""+purcEditTable.getModel().getValueAt(i, 16)+"' union "
                        + "select item_code,batch_no from sales_Cards_bill where batch_no='"+""+purcEditTable.getModel().getValueAt(i, 21)+"' and item_code='"+""+purcEditTable.getModel().getValueAt(i, 16)+"' union "
                        + "select item_code,batch_no from sales_accounts where batch_no='"+""+purcEditTable.getModel().getValueAt(i, 21)+"' and item_code='"+""+purcEditTable.getModel().getValueAt(i, 16)+"') s "));
                if (purcEditTable.getModel().isCellEditable(i, 6) && batchExists==0) {
                    if (i != -1) {
                        DefaultTableModel model = (DefaultTableModel) purcEditTable.getModel();
                        if (rows == 1) {
                            if (i == 0) {
                                model.removeRow(i);
                                resetValues();
                                for (int n = 0; n < initR; n++) {
                                    addRow();
                                }
                                purcEditTable.changeSelection(0, 0, false, false);
                            }
                        } else {
                            model.removeRow(i);
                            int rows1 = purcEditTable.getRowCount();
                            if (i + 1 != rows) {
                                for (int n = 0; n < rows1; n++) {
                                    if (purcEditTable.getModel().getValueAt(n, 0) == null); else {
                                        purcEditTable.getModel().setValueAt(n + 1, n, 0);
                                    }
                                }
                                purcEditTable.changeSelection(i, j, false, false);
                            } else {
                                purcEditTable.changeSelection(i - 1, j, false, false);
                            }
                        }
                    } else {
                        Alert.inform("Purchase Invoice", "Please select row to remove ...");
                    }
                } 
                else if(batchExists > 0) {
                   Alert.inform("The row cannot be removed since "+""+purcEditTable.getModel().getValueAt(i, 1)+" with batch "+""+purcEditTable.getModel().getValueAt(i, 21)+" is already Sold");
                }               
                purchaseCalculations();
            }
            else {
                   Alert.inform("Please Select Valid Row to Remove ...");
            }
        } catch (Exception ex) {
            String ss = "   Class : PurchaseEditTable  Method : removeRow    Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

    public void removeRows(int i) {
        int RCount = purcEditTable.getRowCount();
        try {
            if (i >= 0 || i < RCount) {
                ((DefaultTableModel) purcEditTable.getModel()).removeRow(i);
            }
            purchaseCalculations();
        } catch (Exception ex) {
            String ss = "   Method: removeRows with argument    Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

    public void clearData() {
        DefaultTableModel model = (DefaultTableModel) purcEditTable.getModel();
        model.getDataVector().removeAllElements();
        try {
            for (int n = 0; n < initR; n++) {
                addRow();
            }
            purchaseCalculations();
        } catch (Exception ex) {
            String ss = "   Class : PurchaseEditTable  Method : clearData    Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

    public double returnDouble(String str) {
        double returnVal = 0.0;
        try {
            if (str != null && !str.equals("null") && str.trim().length() > 0) {
                returnVal = Double.parseDouble(str);
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
            returnVal = 0.0;
        }
        return returnVal;
    }

    public String returnString(String str) {
        try {
            if (str != null && !str.equals("null") && str.trim().length() > 0) {
            } else {
                str = "";
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
            str = "";
        }
        return str;
    }

    public int returnInt(String str) {
        int returnVal = 0;
        try {
            if (str != null && !str.equals("null") && str.trim().length() > 0) {
                returnVal = Integer.parseInt(str);
            }
        } catch (Exception e) {
            log.debug(e.getMessage());
            returnVal = 0;
        }
        return returnVal;
    }

    public List<PurchaseModel> getPurchaseBill() {
        List<PurchaseModel> purcEBillItems = new ArrayList<PurchaseModel>();
        int rowCount = purcEditTable.getRowCount();
        PurchaseModel model;
        try {
            for (int index = 0; index < rowCount; index++) {
                if (purcEditTable.getModel().getValueAt(index, 1) != null) {
                    model = new PurchaseModel();
                    model.setItemName(""+purcEditTable.getModel().getValueAt(index, 1));
                    model.setFormulation("" + purcEditTable.getModel().getValueAt(index, 2));
                    model.setMfrName("" + purcEditTable.getModel().getValueAt(index, 3));
                    model.setQuantity(returnInt("" + purcEditTable.getModel().getValueAt(index, 4)));
                    model.setFree(returnInt("" + purcEditTable.getModel().getValueAt(index, 5)));
                    model.setBatch(returnString("" + purcEditTable.getModel().getValueAt(index, 6)));
                    model.setExpdate(""+purcEditTable.getModel().getValueAt(index, 7));
                    model.setPacking(returnString("" + purcEditTable.getModel().getValueAt(index, 8)));
                    model.setUnitprice(returnDouble("" + purcEditTable.getModel().getValueAt(index, 9)));
                    model.setMrp(returnDouble("" + purcEditTable.getModel().getValueAt(index, 10)));
                    model.setSalesDiscount(returnDouble("" + purcEditTable.getModel().getValueAt(index, 11)));
                    model.setUnitDis(returnDouble("" + purcEditTable.getModel().getValueAt(index, 13)));
                    model.setUnitVat(returnDouble("" + purcEditTable.getModel().getValueAt(index, 14)));
                    model.setTotVal(returnDouble("" + purcEditTable.getModel().getValueAt(index, 15)));
                    model.setItemCode(returnString("" + purcEditTable.getModel().getValueAt(index, 16)));
                    model.setPurc_temp_flagid("" + purcEditTable.getModel().getValueAt(index, 17));
                    model.setPurc_is_adj("" + purcEditTable.getModel().getValueAt(index, 18));
                    model.setInvoiceNo("" + purcEditTable.getModel().getValueAt(index, 21));
                    purcEBillItems.add(model);
                }
            }
        } catch (Exception e) {
            String ss = "Class: PurchaseEditTable      Method: getPurchaseBill    Exception : " + e.getMessage();            
            log.debug(ss);
        }
        return purcEBillItems;
    }

    public void resetValues() {
        totPurcQty = 0;
        totPurcFreeQty = 0;
        totPurcItems = 0;
        totPurcAmt = 0.00;
        totPurcDistAmt = 0.0;
        totPurcVAT4Amt = 0.0;
        amt = 0.00;
    }

    public void focusSet() {
        purcEditTable.requestFocus();
        if (purcEditTable.getModel().getRowCount() > 0) {
            purcEditTable.changeSelection(1, 1, false, false);
        }
        purcEditTable.changeSelection(0, 1, false, false);
        purcEditTable.getModel().setValueAt("1", 0, 0);
        purcEditTable.setCellSelectionEnabled(true);
    }

    public void focusSet(int row, int col) {
        if (col >= 0 && col <= 14) {
            purcEditTable.requestFocus();
            if (purcEditTable.getModel().getRowCount() > 0) {
                purcEditTable.changeSelection(1, 1, false, false);
            }
            purcEditTable.changeSelection(row, col, false, false);
            purcEditTable.setCellSelectionEnabled(true);
        } else {
        }
    }

    public  void focusSet(int row, int col,String barcode) {
        for(int i=0; i < purcEditTable.getRowCount();i++) {
            if(purcEditTable.getModel().getValueAt(i, 1)!=null) {
                row++;
            }
        }
        purcEditTable.requestFocus();
        purcEditTable.changeSelection(row, 1, false, false);
        purcEditTable.setCellSelectionEnabled(true);
        g.refreshDrugTab(itemCode,"barcode");
        barcodeSelected = false;
        barcodeFocus=true;
    }

    public int total(int colNum) {
        int tot = 0;
        int colNo = colNum;
        for (int i = 0; i < purcEditTable.getModel().getRowCount(); i++) {
            if (purcEditTable.getModel().getValueAt(i, colNo) == null || purcEditTable.getModel().getValueAt(i, colNo).equals("")) {
                tot += 0;
            } else {
                tot += Double.parseDouble("" + purcEditTable.getModel().getValueAt(i, colNo));
            }
        }
        return tot;
    }

    public int totalItems() {
        int tot = 0;
        for (int i = 0; i < purcEditTable.getModel().getRowCount(); i++) {
            if (purcEditTable.getModel().getValueAt(i, 2) == null || purcEditTable.getModel().getValueAt(i, 2) != ""); else {
                tot++;
            }
        }
        return tot;
    }

    public int getDuplicates(int col) {
        int R = purcEditTable.getModel().getRowCount();
        int val = 0;
        try {

            for (int i = 0; i < R - 1; i++) {
                if (purcEditTable.getModel().getValueAt(i, col) == null || purcEditTable.getModel().getValueAt(i, col).equals("")); else {
                    String va = purcEditTable.getModel().getValueAt(i, col).toString();
                    for (int j = i + 1; j < R; j++) {
                        if (purcEditTable.getModel().getValueAt(j, col) == null || purcEditTable.getModel().getValueAt(j, col).equals("")); else {
                            String comp = purcEditTable.getModel().getValueAt(j, col).toString();
                            if (va.equals(comp)) {
                                val = 1;
                                focusSet(j, col);
                                is = (i + 1);
                                js = (j + 1);
                                break;
                            }
                        }
                    }
                }
            }
        } catch (Exception ex) {
            String msg = "Class : PurchaseEditTable  Method  : getDuplicates  Exception:" + ex.getMessage();
            log.debug(msg);
        }
        return val;
    }

    public void clearSelection() {
        purcEditTable.clearSelection();
    }

    public void purchaseCalculations() {
        Value value = new Value();
        int rowCount = purcEditTable.getRowCount();
        purcQty = new int[rowCount];
        purcFreeQty = new int[rowCount];
        purcPrice = new double[rowCount];
        purcVAT4 = new double[rowCount];
//        purcVAT12 = new double[rowCount];
        purcDisct = new double[rowCount];
        
        purcSubTot = new double[rowCount];
        purcAdjVAT4 = new double[rowCount];
        
        purcAdjDist = new double[rowCount];
        totPurcAmt = 0;
        totPurcDistAmt = 0;
        
        totPurcItems = 0;
        totPurcQty = 0;
        totPurcFreeQty = 0;
        totPurcVAT4Amt = 0.0;
        
        totPurcAdjQty = 0;
        totPurcAdjItems = 0;
        totPurcAdjAmt = 0.00;
        totPurcAdjDistAmt = 0.0;
        totPurcAdjVAT4Amt = 0.0;

        totMrp = 0.0;
        totPurPrice = 0.0;
        totMargin = 0.0;
        try {
            for (int i = 0; i < rowCount; i++) {
                if ((purcEditTable.getModel().getValueAt(i, 1) == null || purcEditTable.getModel().getValueAt(i, 1).equals("")) && (purcEditTable.getModel().getValueAt(i, 2) == null || purcEditTable.getModel().getValueAt(i, 2).equals(""))) {
                    if (i == 0) {
                        nullVal = 0;
                    }
                } else {
                    nullVal = 1;
                    totPurcItems++;
                    if (purcEditTable.getModel().getValueAt(i, 4) == null || purcEditTable.getModel().getValueAt(i, 4).equals("")) {
                        purcQty[i] = 0;
                    } else {
                        purcQty[i] = Integer.parseInt(purcEditTable.getModel().getValueAt(i, 4).toString());
                    }
                    if (purcEditTable.getModel().getValueAt(i, 5) == null || purcEditTable.getModel().getValueAt(i, 5).equals("")) {
                        purcFreeQty[i] = 0;
                    } else {
                        purcFreeQty[i] = Integer.parseInt(purcEditTable.getModel().getValueAt(i, 5).toString());
                    }
                    totPurcQty += purcQty[i];
                    totPurcFreeQty += purcFreeQty[i];
                    if (purcEditTable.getModel().getValueAt(i, 9) == null || purcEditTable.getModel().getValueAt(i, 9).equals("")) {
                        purcPrice[i] = 0.0;
                    } else {
                        purcPrice[i] = Double.parseDouble("" + purcEditTable.getModel().getValueAt(i, 9));
                    }
                    totPurPrice += (purcQty[i]*purcPrice[i]);
                    Double purcMrp = 0.0;
                    purcMrp = ((purcEditTable.getModel().getValueAt(i, 10) == null || purcEditTable.getModel().getValueAt(i, 10).equals("")) ? 0.0 : Double.parseDouble("" + purcEditTable.getModel().getValueAt(i, 10)));
                    //Sum of Mrp
                    totMrp += (purcQty[i] * purcMrp);
                    boolean isPrAdjust = false;
                    if (purcEditTable.getModel().getValueAt(i, 18) != null) {
                        isPrAdjust = Boolean.valueOf(purcEditTable.getModel().getValueAt(i, 18).toString());
                    }
                    purcSubTot[i] = value.Round(purcQty[i] * purcPrice[i], 2);
                    double sttss = value.Round(purcSubTot[i], 2);
                    purcEditTable.getModel().setValueAt(value.Round(purcSubTot[i]), i, 15);
                    if (!isPrAdjust) {
                        totPurcAmt += sttss;
                        if (purcEditTable.getModel().getValueAt(i, 13) == null || purcEditTable.getModel().getValueAt(i, 13).equals("") || purcEditTable.getModel().getValueAt(i, 13).equals(0)) {
                            purcDisct[i] = 0.00;
                            
                        } else {
                            purcDisct[i] = value.Round(purcSubTot[i] * (Double.parseDouble(value.Round("" + purcEditTable.getModel().getValueAt(i, 13), 1)) / 100), 2);
                            
                        }
                        totPurcDistAmt += value.Round(purcDisct[i], 2);                        
                        Double purchVat = 0.00;
                        if (purcEditTable.getModel().getValueAt(i, 14) == null || purcEditTable.getModel().getValueAt(i, 14).equals("")) {
                            purcVAT4[i] = 0.00;

                        } else {                            
                            if (purcEditTable.getModel().getValueAt(i, 14).equals(0) || purcEditTable.getModel().getValueAt(i, 14).equals("")) {
                                purcVAT4[i] = 0.00;

                            } else {
                                if(purcEditTable.getModel().getValueAt(i, 14)!=null) {
                                purchVat = Double.parseDouble("" + purcEditTable.getModel().getValueAt(i, 14));
                                }
                                int vat_calc_flag = Integer.parseInt(purcEditTable.getModel().getValueAt(i, 19).toString());
                                if(vat_calc_flag == 0) {
                                purcVAT4[i] = value.Round((purcSubTot[i] - purcDisct[i]) * (purchVat / 100), 2);
                                }
                                else {
                                purcVAT4[i] = value.Round((purcQty[i]+purcFreeQty[i])*(purcMrp-(purcMrp/(1+purchVat/100))),2);
                                }
                            }
                        }
                        totPurcVAT4Amt += value.Round(purcVAT4[i], 2);
                    } else {
                        totPurcAdjQty += purcQty[i];
                        totPurcAdjItems++;
                        if (purcEditTable.getModel().getValueAt(i, 13) == null || purcEditTable.getModel().getValueAt(i, 13).equals("") || purcEditTable.getModel().getValueAt(i, 13).equals(0)) {
                            purcAdjDist[i] = 0;
                        } else {
                            purcAdjDist[i] = value.Round(purcSubTot[i] * (Double.parseDouble(value.Round("" + purcEditTable.getModel().getValueAt(i, 13), 1)) / 100), 2);
                        }
                        totPurcAdjDistAmt += value.Round(purcAdjDist[i], 2);
                        Double purchVat = 0.00;
                        if (purcEditTable.getModel().getValueAt(i, 14).equals(0)) {
                            purcAdjVAT4[i] = 0;
                            
                        } else {
                                if(purcEditTable.getModel().getValueAt(i, 14)!=null) {
                                purchVat = Double.parseDouble("" + purcEditTable.getModel().getValueAt(i, 14));
                                }
                                int vat_calc_flag = Integer.parseInt(purcEditTable.getModel().getValueAt(i, 19).toString());
                                if(vat_calc_flag == 0) {
                                purcAdjVAT4[i] = value.Round((purcSubTot[i] - purcDisct[i]) * (purchVat / 100), 2);
                                }
                                else {
                                purcAdjVAT4[i] = value.Round((purcQty[i]+purcFreeQty[i])*(purcMrp-(purcMrp/(1+purchVat/100))),2);
                                }
                        }
                        totPurcAdjVAT4Amt += value.Round(purcAdjVAT4[i], 2);
                        totPurcAdjAmt += ((sttss - purcAdjDist[i]) + purcAdjVAT4[i] );
                    }
                }
            }
            totMargin = Double.parseDouble(Value.Round( (totMrp) - ( totPurPrice-totPurcDistAmt+totPurcVAT4Amt)));
        } catch (Exception ex) {
            String ss = " Class : PurchaseEditTable  Method : purchaseCalculations    Exception : " + ex.getMessage();
            log.debug(ss);
        }
    }

    public void calculateMargin() {
        try {
        int rowCount = purcEditTable.getRowCount();
        double mrp = 0.00;
        double purPrice = 0.00;
        double unitDisc = 0.00;
        double unitVAT = 0.00;
        double margin = 0.00;
        double discAmt = 0.00;
        double VATAmt = 0.00;
        double percMargin = 0.00;
        for (int i = 0; i < rowCount; i++) {
        if(purcEditTable.getModel().getValueAt(i, 9) != null && purcEditTable.getModel().getValueAt(i, 10) !=null && purcEditTable.getModel().getValueAt(i, 13)!= null && purcEditTable.getModel().getValueAt(i, 14)!= null
                &&!purcEditTable.getModel().getValueAt(i, 9).equals("") && !purcEditTable.getModel().getValueAt(i, 10).equals("") && !purcEditTable.getModel().getValueAt(i, 13).equals("") && !purcEditTable.getModel().getValueAt(i, 14).equals(""))
             {
             purPrice = Double.parseDouble (purcEditTable.getModel().getValueAt(i, 9).toString());
             mrp = Double.parseDouble (purcEditTable.getModel().getValueAt(i, 10).toString());
             unitDisc = Double.parseDouble (purcEditTable.getModel().getValueAt(i, 13).toString());
             unitVAT = Double.parseDouble (purcEditTable.getModel().getValueAt(i, 14).toString());
             discAmt = unitDisc*purPrice/100;
             int vat_calc_flag1 = Integer.parseInt(purcEditTable.getModel().getValueAt(i, 19).toString());
             double salesVat = Value.Round((mrp*unitVAT)/(100+unitVAT),2);
             if(vat_calc_flag1 == 0) {
                VATAmt = (purPrice-discAmt)*unitVAT/100;
                margin = Double.parseDouble(Value.Round(mrp-salesVat-(purPrice-discAmt)));
             }
             else {
                VATAmt = (mrp-(mrp/(1+unitVAT/100)));
                margin = Double.parseDouble(Value.Round(mrp-(purPrice-discAmt)));
             }
             //margin = Double.parseDouble(Value.Round(mrp-(purPrice-discAmt+VATAmt)));
             percMargin = Value.Round((margin/mrp)*100,2);
             purcEditTable.getModel().setValueAt(percMargin, i, 12);
            }
    }
        }
    catch(Exception ex) {
            String ss = "Class : PurchaseEditTable  Method : calculateMargin   Exception : " + ex.getMessage();
            log.debug(ss);
    }
    }
}
