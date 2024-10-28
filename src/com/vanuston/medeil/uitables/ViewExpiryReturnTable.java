/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.uitables;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.controller.ExpiryReturnController;
import com.vanuston.medeil.model.ExpiryReturnModel;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.implementation.ExpiryReturn;
import java.awt.Font;
import java.awt.Color;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.sql.ResultSet;
import java.util.Vector;
import javax.swing.JComponent;
import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.KeyStroke;
import javax.swing.table.DefaultTableModel;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author admin
 */
public class ViewExpiryReturnTable {

    static Logger log = Logger.getLogger(ViewExpiryReturnTable.class, "Inventory");
    public JTable expiryRettTabTable;
    public JScrollPane expiryRettTabScrollPane = new JScrollPane();
    public KeyStroke valexpiryRettTabTab = KeyStroke.getKeyStroke(KeyEvent.VK_T, KeyEvent.CTRL_MASK);
    public KeyStroke callexpiryRettTabFocusOut = KeyStroke.getKeyStroke(KeyEvent.VK_SPACE, KeyEvent.CTRL_MASK);
    public static String expiryRetDate;
    public static String ditName;
    public static double totAmount;
    com.vanuston.medeil.implementation.ExpiryReturn expiryReturnController;
    public ViewExpiryReturnTable() throws RemoteException, NotBoundException
    {
        expiryReturnController=(com.vanuston.medeil.implementation.ExpiryReturn) RegistryFactory.getClientStub(RegistryConstants.ExpiryReturn);
    }
    // This function is used to Load the  Stoc Statement Values
    public JComponent createTable(final int initRow, Object[] colName, Class[] type, boolean[] canEdit, int[] width) {

        final Class[] types = type;
        final boolean[] canEditCols = canEdit;
        final int[] colWidth = width;

        expiryRettTabTable = new JTable();

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

            expiryRettTabTable.setModel(new javax.swing.table.DefaultTableModel(data, cols) {

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
            String msg = "Class : xpiry Return Table  method : CreateTable()  = " + ex.getMessage();
            log.debug(msg);
        }

        expiryRettTabTable.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        expiryRettTabTable.getTableHeader().setBackground(new Color(226, 238, 244));

        expiryRettTabTable.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));

        expiryRettTabTable.setShowGrid(true);
        expiryRettTabTable.getTableHeader().setReorderingAllowed(false);





        for (int i = 0; i < len; i++) {
            expiryRettTabTable.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }
        expiryRettTabTable.setGridColor(new java.awt.Color(204, 204, 255));
         expiryRettTabTable.setCellSelectionEnabled(false);
      expiryRettTabTable.setRowSelectionAllowed(true);
        expiryRettTabTable.setRowHeight(20);
        expiryRettTabTable.setSelectionBackground(Color.LIGHT_GRAY);
        expiryRettTabTable.setSelectionForeground(Color.RED);
        expiryRettTabTable.revalidate();



        expiryRettTabTable.addKeyListener(new KeyListener() {

            public void keyReleased(KeyEvent e) {
            }

            @Override
            public void keyTyped(KeyEvent e) {
            }

            @Override
            public void keyPressed(KeyEvent e) {
            }
        });

        expiryRettTabTable.addMouseListener(new MouseListener() {

            @Override
            public void mouseClicked(MouseEvent e) {
                final int i = expiryRettTabTable.getSelectedRow();
                expiryRetDate = (String) expiryRettTabTable.getValueAt(i, 1);
                ditName = (String) expiryRettTabTable.getValueAt(i, 2);
                totAmount = (Double) expiryRettTabTable.getValueAt(i, 6);
                expiryRettTabTable.requestFocus();
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

   
        return expiryRettTabTable;
    }


    public void viewPaymentCalculations() {
		 final int i = expiryRettTabTable.getSelectedRow();
                expiryRetDate = (String) expiryRettTabTable.getValueAt(i, 1);

                ditName = (String) expiryRettTabTable.getValueAt(i, 2);
                totAmount =  Double.valueOf(expiryRettTabTable.getValueAt(i, 6).toString());

		}



	public JComponent getScrollTable(JComponent jt) {
        expiryRettTabTable = (JTable) jt;
        expiryRettTabScrollPane.add(expiryRettTabTable);
        expiryRettTabScrollPane.setViewportView(expiryRettTabTable);
        return expiryRettTabScrollPane;
    }

    // This function is used to Load the Stock Statement Values
    public void loadExpiryReturn() {
        //ExpiryReturn expiryReturnController = new ExpiryReturnController();
        ExpiryReturnModel expiryReturnBean = new ExpiryReturnModel();
        List<ExpiryReturnModel> get=new ArrayList<ExpiryReturnModel>();
        expiryRetDate = "";
        ditName = "";
        totAmount = 0.00;
        try {
            int i = 0;
            clearData();
            //int j = 1;
            expiryReturnBean.setExpiry_checkVal("loadExpiryReturn");
             expiryReturnBean = expiryReturnController.viewAllRecord(expiryReturnBean);
                get = expiryReturnBean.getExpiryreturn();
                 for (int j = 0; j < get.size();j++) {
                     expiryReturnBean=get.get(j);
//            String sql = "";
//            ResultSet rs = null;
//            sql = "SELECT  dist_name,curr_date,item_name,batch_no,qty,total_amount FROM expiryreturn order by exp_no  desc  limit 0,12";
//            rs = DBConnection.getStatement().executeQuery(sql);
//            while (rs.next()) {
                addRow();
                expiryRettTabTable.getModel().setValueAt(j+1, i, 0);
                expiryRettTabTable.getModel().setValueAt(expiryReturnBean.getExpiry_curr_date(), i, 1);
                expiryRettTabTable.getModel().setValueAt(expiryReturnBean.getExpiry_dist_name(), i, 2);
                expiryRettTabTable.getModel().setValueAt(expiryReturnBean.getExpiry_item_name(), i, 3);
                expiryRettTabTable.getModel().setValueAt(expiryReturnBean.getExpiry_batch_no(), i, 4);
                expiryRettTabTable.getModel().setValueAt(expiryReturnBean.getExpiry_qty(), i, 5);
                expiryRettTabTable.getModel().setValueAt(expiryReturnBean.getExpiry_total_amount(), i, 6);
                i++;
                //j++;
            }

            if (i == 0) {
                addBasicRows();
            }expiryRettTabTable.clearSelection();
        } catch (Exception e) {
            
            String msg = "Class : xpiry Return Table  method : loadExpiryReturn  = " + e.getMessage();
            
            log.debug(msg);
        }

    }

    public void loadExpiryReturnTable(String distName) {
        try {
            //ExpiryReturnController expiryReturnController = new ExpiryReturnController();
        ExpiryReturnModel expiryReturnBean = new ExpiryReturnModel();        
        expiryRetDate = "";
        ditName = "";
        totAmount = 0.00;            
            int i = 0;
            clearData();
            //int j = 1;
            expiryReturnBean.setExpiry_dist_name(distName);
            expiryReturnBean.setExpiry_checkVal("loadEditExpiryReturnTable");
             expiryReturnBean = expiryReturnController.viewAllRecord(expiryReturnBean);
                List<ExpiryReturnModel> get = expiryReturnBean.getExpiryreturn();
                 for (int j = 0; j < get.size();j++) {
                     expiryReturnBean=(ExpiryReturnModel)get.get(j);
                 addRow();
                expiryRettTabTable.getModel().setValueAt(j+1, i, 0);
                expiryRettTabTable.getModel().setValueAt(expiryReturnBean.getExpiry_curr_date(), i, 1);
                expiryRettTabTable.getModel().setValueAt(expiryReturnBean.getExpiry_dist_name(), i, 2);
                expiryRettTabTable.getModel().setValueAt(expiryReturnBean.getExpiry_item_name(), i, 3);
                expiryRettTabTable.getModel().setValueAt(expiryReturnBean.getExpiry_batch_no(), i, 4);
                expiryRettTabTable.getModel().setValueAt(expiryReturnBean.getExpiry_qty(), i, 5);
                expiryRettTabTable.getModel().setValueAt(expiryReturnBean.getExpiry_total_amount(), i, 6);
                i++;
                 }
//            String sql = "";
//            ResultSet rs = null;
//            sql = "SELECT  dist_name,curr_date,item_name,batch_no,qty,total_amount FROM expiryreturn where dist_name='" + distName + "' order by  exp_no desc  ";
//            rs = DBConnection.getStatement().executeQuery(sql);
//            while (rs.next()) {
//                addRow();
//                expiryRettTabTable.getModel().setValueAt(j, i, 0);
//                expiryRettTabTable.getModel().setValueAt(DateUtils.normalFormatDate(rs.getDate("curr_date")), i, 1);
//                expiryRettTabTable.getModel().setValueAt(rs.getString("dist_name"), i, 2);
//                expiryRettTabTable.getModel().setValueAt(rs.getString("item_name"), i, 3);
//                expiryRettTabTable.getModel().setValueAt(rs.getString("batch_no"), i, 4);
//                expiryRettTabTable.getModel().setValueAt(rs.getString("qty"), i, 5);
//                expiryRettTabTable.getModel().setValueAt(rs.getString("total_amount"), i, 6);
//                j++;
//                i++;
//            }

            if (i == 0) {
                addBasicRows();
            }
            expiryRettTabTable.clearSelection();
        } catch (Exception e) {
            
            String msg = "Class : expiry Return Table  method : loadExpiryReturn  = " + e.getMessage();
            log.debug(msg);
        }

    }

    public void addRow() {
        DefaultTableModel model = (DefaultTableModel) expiryRettTabTable.getModel();

        Vector datas = new Vector();

//    datas.addElement(StockStatementTable.getRowCount()+1);
        for (int i = 0; i < expiryRettTabTable.getModel().getColumnCount(); i++) {
            datas.addElement(null);
        }
        model.insertRow(expiryRettTabTable.getRowCount(), datas);
//   model.insertRow(row, rowData);
    }

    public void removeRow() {
        int i = expiryRettTabTable.getSelectedRow();
        if (i != -1) {
            DefaultTableModel model = (DefaultTableModel) expiryRettTabTable.getModel();
            model.removeRow(i);
            expiryRettTabTable.getModel().setValueAt(i, i - 1, 0);
            expiryRettTabTable.changeSelection(i - 1, 0, false, false);
        } else {
            JOptionPane.showMessageDialog(expiryRettTabTable, "Please select row to remove ...");
        }
    }

    public void clearData() {
        DefaultTableModel model = (DefaultTableModel) expiryRettTabTable.getModel();
        model.getDataVector().removeAllElements();
expiryRettTabTable.clearSelection();
        expiryRettTabTable.revalidate();
    }

    public  void keyFunctions() {
    }

    public  void addBasicRows() {

        for (int i = 0; i < 15; i++) {

            addRow();
        }

    }
}
