/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.uitables;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.controller.VatRegisterController;
import com.vanuston.medeil.implementation.CommonImplements;
import com.vanuston.medeil.implementation.VatRegister;
import com.vanuston.medeil.model.VatRegisterModel;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.DecimalFormatRenderer;
import com.vanuston.medeil.util.Value;
import java.awt.Color;
import java.awt.Component;
import java.awt.Event;
import java.awt.Font;
import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.awt.event.MouseWheelEvent;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Vector;
import javax.swing.JComponent;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.event.TableModelEvent;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableCellRenderer;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;
import net.sf.jasperreports.swing.JRViewer;
import net.sf.jasperreports.view.JasperViewer;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.PercentageFormatRenderer;
import com.vanuston.medeil.util.RegistryConstants;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
/**
 *
 * @author Administrator
 */
public class VATTableHelper {

    static final Logger log = Logger.getLogger(VATTableHelper.class, "Utilities");
    Vector allRows1;
    JTable table;
    JScrollPane scrollPane = new JScrollPane();
    Vector colname = new Vector();
    public double vamt = 0.00;
    public double samt = 0.00;
    public double vat4 = 0.00;
    public double getvat=0.00;
    public double vat125 = 0.00;
    //public double vat145 = 0.00;
    public boolean chk = false;

    public String s = "";
    public boolean getBoo = false;
    public boolean truncateFlag = true;
    public int tot = 0;
    HeaderRenderer2 tabHead;
    int col = 18;
    //var colNames: Object[] = ["S.No.", "Customer Name", "Product Name", "VAT%", "Qty.", "Sales Amt.", "VAT Amt.", "All"];
    Object[] colName = {"S.No.", "Customer Name", "Bill No.", "Bill Date", "Product Name", "VAT%", "Qty.", "Sales Amt.", "VAT Amt.", "All"};
    Class[] type  = {
                java.lang.Integer.class,
                java.lang.String.class,
                java.lang.String.class,
                java.lang.String.class,
                java.lang.String.class,
                java.lang.Double.class,
                java.lang.Integer.class,
                java.lang.Double.class,
                java.lang.Double.class,
                java.lang.Boolean.class};
    boolean[] canEdit  = {false, false, false, false, false, false, false, false, false, true};
    int[] width = {20, 100, 60, 20, 90, 30, 40, 50, 50, 20};
//    public JComponent createTable(final int col, Object[] colName, Class[] type, boolean[] canEdit, int[] width, int rdoSel) {
    VatRegister vatregisterController;
    public VATTableHelper() throws RemoteException, NotBoundException
    {
        vatregisterController=(VatRegister) RegistryFactory.getClientStub(RegistryConstants.VatRegister);
    }
    public JComponent createTable(int rdoSel) {
        final Class[] types = type;
        final boolean[] canEditCols = canEdit;
        final int[] colWidth = width;
        Vector cols = new Vector();
        colname = cols;
        Vector data = new Vector();
        int initR = col;
        int len = colName.length;

        table = new JTable() {

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

//        table.getTableHeader().addMouseListener(null);



        for (int i = 1; i <= initR; i++) {
            Vector c = new Vector();
            for (int j = 0; j < len; j++) {
                if (j == len - 1) {
                    c.addElement(Boolean.FALSE);
                } else {
                    c.addElement(null);
                }

            }
            data.addElement(c);
            
        }
        for (int i = 0; i < len; i++) {
            cols.addElement(colName[i]);
        }

        try {
           
            table.setModel(new javax.swing.table.DefaultTableModel(data, cols) {

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

                @Override
                public void fireTableRowsUpdated(int row, int column) {
                    super.fireTableRowsUpdated(row, column);
                }

                @Override
                public void fireTableCellUpdated(int row, int column) {
                    super.fireTableCellUpdated(row, column);
                    getBoo = true;
                    clickCheck();
                }
            });
        } catch (Exception ex) {
            log.debug("Method : createTable Exception :" + ex.getMessage());

        }
        table.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        table.getTableHeader().setBackground(new Color(226, 238, 244));
        table.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
        table.getTableHeader().setReorderingAllowed(false);
        table.setSelectionMode(0);
        table.setShowGrid(true);
        table.setDragEnabled(false);
        table.setRowHeight(20);
        table.revalidate();

        for (int i = 0; i < len; i++) {
            table.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }        
        tabHead = new HeaderRenderer2(table.getTableHeader(),"salesCheck");
        table.getColumnModel().getColumn(9).setHeaderRenderer(tabHead);

        table.getColumnModel().getColumn(5).setCellRenderer(new PercentageFormatRenderer());
        table.getColumnModel().getColumn(7).setCellRenderer(new DecimalFormatRenderer());
        table.getColumnModel().getColumn(8).setCellRenderer(new DecimalFormatRenderer());

        table.addMouseListener(new MouseAdapter() {
            @Override
            public void mouseClicked(MouseEvent e) {
//                super.mouseClicked(e);
                clickCheck();
            }
        });
        return table;        
    }

    

    public boolean selectItem(boolean sel)
    {
        chk=sel;        
        return sel;
    }

    void clickCheck() {
         tot = 0;
        int rwCount = table.getRowCount();
        vamt = 0.0;
        samt = 0.0;
   //     vat4 = 0.0;
   //     vat125 = 0.0;

        for (int i = 0; i < rwCount; i++) {
            if (table.getValueAt(i, 9) == null);
            else {
                Object val = table.getValueAt(i, 9);
                if (!Boolean.parseBoolean(val.toString())) {
                    tabHead.deSelect();
                } else {                   
                    vamt = vamt + Double.parseDouble(table.getValueAt(i, 8).toString());
                    samt = samt + Double.parseDouble(table.getValueAt(i, 6).toString());
                    if (table.getValueAt(i, 5).toString().equals(getvat)) {
                        getvat = getvat + vamt;//Double.parseDouble(table.getValueAt(i, 8).toString());
                    }
                    tot++;
                }
            }
        }        
        if (tot == rwCount) {           
            tabHead.select();
        }
    }

   
    public JComponent getScrollable(JComponent jt) {
        scrollPane.add(jt);
        scrollPane.setViewportView(jt);
        return scrollPane;
    }

    public void removeCustomerCol() {
        vamt = 0.00;
        samt = 0.00;
//        vat125 = 0.00;
      //  vat4 = 0.00;

        table.getColumnModel().getColumn(4).setMaxWidth(0);
        table.getColumnModel().getColumn(4).setMinWidth(0);
        table.getColumnModel().getColumn(4).setPreferredWidth(0);
        table.getColumnModel().getColumn(4).setResizable(false);
        //table.setAutoResizeMode(0);
        table.getColumnModel().getColumn(6).setMaxWidth(0);
        table.getColumnModel().getColumn(6).setMinWidth(0);
        table.getColumnModel().getColumn(6).setPreferredWidth(0);
        table.getColumnModel().getColumn(6).setResizable(false);

    }

   

    public void addCustomerCol() {
        vamt = 0.00;
        samt = 0.00;
//        vat125 = 0.00;
  //      vat4 = 0.00;

        table.getColumnModel().getColumn(4).setMaxWidth(90);
        table.getColumnModel().getColumn(4).setMinWidth(90);
        table.getColumnModel().getColumn(4).setPreferredWidth(90);

        table.getColumnModel().getColumn(6).setMaxWidth(40);
        table.getColumnModel().getColumn(6).setMinWidth(40);
        table.getColumnModel().getColumn(6).setPreferredWidth(40);

    }

    public JComponent intial() {
        return table;
    }
public void setValues(VatRegisterModel tableVal, int tabSel) {

        try {
            VatRegisterModel vatregisterBean=tableVal;
            List vatregisterList=new ArrayList();
            vatregisterList=tableVal.getVatreport();
            VatRegisterModel vatregisterAddBean;
            DefaultTableModel model = (DefaultTableModel) table.getModel();
            model.getDataVector().removeAllElements();
            int row = table.getRowCount();           
            table.changeSelection(row, 0, false, false);
            if (tableVal == null ) {
            } else {
                for (int i = 0; i < vatregisterList.size() - row; i++) {
                    addRow();
                }
                {
                    for (int r = 0; r <vatregisterList.size(); r++) {
                        //for (int c = 0; c < table.getColumnCount(); c++)
                        {
                            // VatRegisterModel vatregisterAddBean=new VatRegisterModel();
                             vatregisterAddBean=(VatRegisterModel)vatregisterList.get(r);                             
                             table.setValueAt(r+1,r,0);
                             table.setValueAt(vatregisterAddBean.getCustomerName(),r,1);                              
                             table.setValueAt(vatregisterAddBean.getInvoiceNumber(),r,2);                             
                             table.setValueAt(vatregisterAddBean.getInvoiceDate(),r,3);
                             table.setValueAt(vatregisterAddBean.getProductName(),r,4);
                             table.setValueAt(Value.Round(vatregisterAddBean.getVat()),r,5);
                             table.setValueAt(vatregisterAddBean.getQty(),r,6);
                             table.setValueAt(Value.Round(vatregisterAddBean.getSalesAmount()),r,7);
                             table.setValueAt(Value.Round(vatregisterAddBean.getVatAmount()),r,8);

                        }
                    }
                }
            }
        } catch (Exception ex) {
            log.debug("Method : setValues Exception :" + ex.getMessage());
        }
    }
//    public void setValues(String[][] tableVal, int tabSel) {
//
//        try {
//            DefaultTableModel model = (DefaultTableModel) table.getModel();
//            model.getDataVector().removeAllElements();
//            int row = table.getRowCount();
//            table.changeSelection(row, 0, false, false);
//
//            if (tableVal == null) {
//
//            } else {
//                for (int i = 0; i < tableVal.length - row; i++) {
//                    addRow();
//                }
//
//                {
//                    for (int r = 0; r < tableVal.length; r++) {
//                        for (int c = 0; c < tableVal[r].length + 1; c++) {
//                            if (c == 0) {
//                                table.setValueAt(r + 1, r, c);
//                            } else if (c == 1) {
//                                table.setValueAt(tableVal[r][c - 1], r, c);
//
//                            } else if (c == 2) {
//                                table.setValueAt(tableVal[r][c - 1], r, c);
//
//                            } else if (c == 3) {
//                                table.setValueAt(tableVal[r][c - 1], r, c);
//
//                            } else if (c == 4) {
//                                table.setValueAt(tableVal[r][c - 1], r, c);
//
//                            } else if (c == 5) {
//                                table.setValueAt(tableVal[r][c - 1], r, c);
//
//                            } else if (c == 6) {
//                                table.setValueAt(tableVal[r][c - 1], r, c);
//
//                            }else if (c == 7) {
//                                table.setValueAt(Value.Round(tableVal[r][c - 1]), r, c);
//
//                            }else if (c == 8) {
//                                table.setValueAt(Value.Round(tableVal[r][c - 1]), r, c);
//                            }
//                        }
//                    }
//                }
//            }
//        } catch (Exception ex) {
//            log.debug("Method : setValues Exception :" + ex.getMessage());
//        }
//    }

    public void addRow() {
        DefaultTableModel model = (DefaultTableModel) table.getModel();
        Vector datas = new Vector();
        for (int i = 1; i < table.getModel().getColumnCount(); i++) {
            if (i == 9) {
                datas.addElement(Boolean.FALSE);
            } else {
                datas.addElement(null);
            }

        }
        model.insertRow(table.getRowCount(), datas);

    }

    public String calculationVAT() {
        return "";
    }
public void clearData() {
        DefaultTableModel model = (DefaultTableModel) table.getModel();
        model.getDataVector().removeAllElements();
        table.revalidate();
    }
    public List<VatRegisterModel> insertData() {
        List<VatRegisterModel> salesVatItemList = new ArrayList<VatRegisterModel>();
        try {
              VatRegisterModel vatregisterBean; // = new VatRegisterModel();
             //VatRegister vatregisterController = new VatRegisterController();
             
            int r = table.getRowCount();
            
            if (getBoo) {
                for (int i = 0; i < r; i++) {
                    vatregisterBean = new VatRegisterModel();
                    vatregisterBean.setVattype("salesvat");
                    // Object val=table.getValueAt(i,7).toString();
                    if (table.getValueAt(i, 9) == null) {
                    } else {
                        if (Boolean.parseBoolean(table.getValueAt(i, 9).toString())) {
//                            String cn = table.getValueAt(i, 1).toString();
//                            String bn = table.getValueAt(i, 2).toString();
//                            String bd = table.getValueAt(i, 3).toString();
//                            String pn = table.getValueAt(i, 4).toString();
//                            double vat = Double.parseDouble(table.getValueAt(i, 5).toString());
//                            int qty = Integer.parseInt(table.getValueAt(i, 6).toString());
//                            double samt1 = Double.parseDouble(table.getValueAt(i,7).toString());
//                            double vamt1 = Double.parseDouble(table.getValueAt(i, 8).toString());

                            vatregisterBean.setCustomerName(table.getValueAt(i, 1).toString());
                            vatregisterBean.setDistname("");
                            vatregisterBean.setTinNumber("");
                            vatregisterBean.setInvoiceNumber(table.getValueAt(i, 2).toString());
                            vatregisterBean.setInvoiceDate(table.getValueAt(i, 3).toString());
                            vatregisterBean.setProductName(table.getValueAt(i, 4).toString());
                            vatregisterBean.setVat(table.getValueAt(i, 5).toString());
                            vatregisterBean.setQty(Integer.parseInt(table.getValueAt(i, 6).toString()));
                            vatregisterBean.setSalesAmount(Double.parseDouble(table.getValueAt(i,7).toString()));
                            vatregisterBean.setVatAmount(Double.parseDouble(table.getValueAt(i, 8).toString()));
                            vatregisterBean.setTotalAmount(vamt);
                            vatregisterBean.setNetVatAmount(0.00);
                      
                        }
                    }

                    salesVatItemList.add(vatregisterBean);
                }

            }

        } catch (Exception ex) {
            log.debug("Method : insertData() Exception :" + ex.getMessage());
        }
        return salesVatItemList;
    }

    public void truncateData(boolean b) {
        try {
            if (b == false) {
                CommonImplements commonController = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
                String s = "Truncate salesvat_table";
                commonController.getTruncateQuery(s);
//                DBConnection.getStatement().executeUpdate(s);
                //truncateFlag=true;
            }
        } catch (Exception ex) {
            log.debug("Method : truncateData() Exception :" + ex.getMessage());
        }
    }

    public void reportView(String fileName) throws JRException {

        JasperReport report = (JasperReport) JRLoader.loadObject(fileName);
        try {
            try {
                JasperPrint jasperPrint = JasperFillManager.fillReport(report, new HashMap(), DBConnection.getStatement().getConnection());

                if (truncateFlag == true) {
                    truncateFlag = false;

                    JasperViewer.viewReport(jasperPrint, false);

                    truncateFlag = true;
                    truncateData(false);
                }

            } catch (SQLException ex) {
                log.debug("Method : reportView() SQLException :" + ex.getMessage());
            }
        } catch (JRException ex) {
            log.debug("Method : reportView() JRException :" + ex.getMessage());
        }

    }

   

// public double getVat(double vatper)
//    {
//
//     return vatper;
// }

    public boolean isValidDateStr(String date) {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat("dd-MM-yyyy");
            sdf.setLenient(false);
            sdf.parse(date);
        } catch (ParseException e) {
            return false;
        } catch (IllegalArgumentException e) {
            return false;
        }
        return true;
    }
}
