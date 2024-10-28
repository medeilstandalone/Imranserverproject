package com.vanuston.medeil.uitables;

import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.EmployeeSalary;
import com.vanuston.medeil.model.EmployeeSalaryModel;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import java.awt.Color ;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.KeyEvent;
import java.awt.event.KeyListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Vector;
import javafx.stage.Alert;
import javax.swing.AbstractAction;
import javax.swing.JComponent;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.KeyStroke;

import javax.swing.table.DefaultTableModel;

public class EmployeeSalaryTable {
    public static void loadEmployeeSalaryTable() throws RemoteException, NotBoundException {
        //Controller Instance
        EmployeeSalary employeeSalaryController = (EmployeeSalary) RegistryFactory.getClientStub(RegistryConstants.EmployeeSalary);
        EmployeeSalaryModel employeeSalaryModel = (EmployeeSalaryModel) employeeSalaryController.viewAllRecord();
        List<EmployeeSalaryModel> employees=employeeSalaryModel.getEmployees();
        SimpleDateFormat sdf = new SimpleDateFormat ("dd-MM-yyyy") ;
        salesId = "";
        try {
            String sql = "";
            int i = 0;
            clearData();
            for(i=0;i<employees.size();i++){
             addRow();
                employeeSalaryModel=employees.get(i);
                employeeSalaryTable.getModel().setValueAt(employeeSalaryModel.getSalaryId(), i, 0);
                employeeSalaryTable.getModel().setValueAt(employeeSalaryModel.getEmployeeCode(), i, 1);
                employeeSalaryTable.getModel().setValueAt(employeeSalaryModel.getEmployeeName(), i, 2);
                employeeSalaryTable.getModel().setValueAt(sdf.format(employeeSalaryModel.getDate()), i, 3);
                employeeSalaryTable.getModel().setValueAt(employeeSalaryModel.getSalaryMonth(), i, 4);
                employeeSalaryTable.getModel().setValueAt(employeeSalaryModel.getPaidAmount(), i, 5);
                employeeSalaryTable.getModel().setValueAt(employeeSalaryModel.getSalaryType(), i, 6);
            }
            employeeSalaryTable.clearSelection();
        } catch (Exception e) {
            String msg = "Class : EmployeeSalaryTable  Method : LoadEmployeeSalaryTable()   = " + e.getMessage();
            log.debug(msg);
        }
    }

    static Logger log = Logger.getLogger(EmployeeSalaryTable.class, "Masters");
    public static int initR;
    public static JTable employeeSalaryTable;
    public static JScrollPane salryScrollPane = new JScrollPane();
    public static KeyStroke calEmployeeSalaryTable = KeyStroke.getKeyStroke(KeyEvent.VK_T, KeyEvent.CTRL_MASK);
    public static KeyStroke callSalaryfocusOut = KeyStroke.getKeyStroke(KeyEvent.VK_SPACE, KeyEvent.CTRL_MASK);
    public static String salesId = "";
    public static KeyStroke save = KeyStroke.getKeyStroke(KeyEvent.VK_F3, 0);
    public static KeyStroke reset = KeyStroke.getKeyStroke(KeyEvent.VK_F4, 0);
    public static KeyStroke del = KeyStroke.getKeyStroke(KeyEvent.VK_F5, 0);
    public static KeyStroke update = KeyStroke.getKeyStroke(KeyEvent.VK_F7, 0);
    public static KeyStroke edit = KeyStroke.getKeyStroke(KeyEvent.VK_F6, 0);
    public static KeyStroke rR = KeyStroke.getKeyStroke(KeyEvent.VK_F12, 0);
    public static KeyStroke can = KeyStroke.getKeyStroke(KeyEvent.VK_F8, 0);
    public static KeyStroke back = KeyStroke.getKeyStroke(KeyEvent.VK_LEFT, KeyEvent.CTRL_MASK);

    public static JComponent createTable (final int initRow, Object[] colName, Class[] type, boolean[] canEdit, int[] width) throws RemoteException, NotBoundException {
        final Class[] types = type;
        final boolean[] canEditCols = canEdit;
        final int[] colWidth = width;
        initR = initRow;
        employeeSalaryTable = new JTable();
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
            employeeSalaryTable.setModel(new javax.swing.table.DefaultTableModel(data, cols) {

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
            String msg = "Class : EmployeeSalaryTable  Method : Create Table()   = " + ex.getMessage();
            log.debug(msg);
        }
        employeeSalaryTable.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        employeeSalaryTable.getTableHeader().setBackground(new Color(226, 238, 244));
        employeeSalaryTable.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
        employeeSalaryTable.setShowGrid(true);
        employeeSalaryTable.getTableHeader().setReorderingAllowed(false);
        for (int i = 0; i < len; i++) {
            employeeSalaryTable.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }
        employeeSalaryTable.setGridColor(new java.awt.Color(204, 204, 255));
        employeeSalaryTable.setCellSelectionEnabled(false);
        employeeSalaryTable.setRowSelectionAllowed(true);
        employeeSalaryTable.setRowSelectionInterval(0, 0);
        employeeSalaryTable.setColumnSelectionInterval(0, 6);
        employeeSalaryTable.setRowHeight(20);
        employeeSalaryTable.setSelectionBackground(Color.LIGHT_GRAY);
        employeeSalaryTable.setSelectionForeground(Color.RED);
        employeeSalaryTable.revalidate();
        employeeSalaryTable.getInputMap().put(save, "focusOut");
        employeeSalaryTable.getInputMap().put(edit, "focusOut");
        employeeSalaryTable.getInputMap().put(reset, "focusOut");
        employeeSalaryTable.getInputMap().put(can, "focusOut");
        employeeSalaryTable.getInputMap().put(update, "focusOut");
        employeeSalaryTable.getInputMap().put(del, "focusOut");
        employeeSalaryTable.getInputMap().put(back, "focusOut");
        employeeSalaryTable.getInputMap().put(rR, "focusOut");
        employeeSalaryTable.getActionMap().put("focusOut", new AbstractAction() {

            @Override
            public void actionPerformed(ActionEvent evt) {
                employeeSalaryTable.transferFocus();
            }
        });
        loadEmployeeSalaryTable() ;
        employeeSalaryTable.addKeyListener(new KeyListener() {

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
        employeeSalaryTable.addMouseListener(new MouseListener() {

            @Override
            public void mouseClicked(MouseEvent e) {
                final int i = employeeSalaryTable.getSelectedRow();
                salesId = (String) employeeSalaryTable.getValueAt(i, 0);
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

        return employeeSalaryTable;
    }

    public static JComponent getScrollTable(JComponent jt) {
        employeeSalaryTable = (JTable) jt;
        salryScrollPane.add(employeeSalaryTable);
        salryScrollPane.setViewportView(employeeSalaryTable);
        return salryScrollPane;
    }

     public static void viewEmployeeSalaryCalculations() {
		   final int i = employeeSalaryTable.getSelectedRow();
                salesId = (String) employeeSalaryTable.getValueAt(i, 0);

		}



    public static void loadEmployeeSal(int cnt) throws RemoteException, NotBoundException {
        //Controller Instance
        EmployeeSalary employeeSalaryController = (EmployeeSalary) RegistryFactory.getClientStub(RegistryConstants.EmployeeSalary);
        EmployeeSalaryModel employeeSalaryModel=(EmployeeSalaryModel) employeeSalaryController.viewAllRecord();
        List<EmployeeSalaryModel> employees=employeeSalaryModel.getEmployees();
        SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
        salesId = "";
        try {
            String sql = "";
            int i = 0;
            clearData();
            for(i=0;i<cnt;i++){
             addRow();
                employeeSalaryModel=employees.get(i);
                employeeSalaryTable.getModel().setValueAt(employeeSalaryModel.getSalaryId(), i, 0);
                employeeSalaryTable.getModel().setValueAt(employeeSalaryModel.getEmployeeCode(), i, 1);
                employeeSalaryTable.getModel().setValueAt(employeeSalaryModel.getEmployeeName(), i, 2);
                employeeSalaryTable.getModel().setValueAt(sdf.format(employeeSalaryModel.getDate()), i, 3);
                employeeSalaryTable.getModel().setValueAt(employeeSalaryModel.getSalaryMonth(), i, 4);
                employeeSalaryTable.getModel().setValueAt(employeeSalaryModel.getPaidAmount(), i, 5);
                employeeSalaryTable.getModel().setValueAt(employeeSalaryModel.getSalaryType(), i, 6);
            }
            employeeSalaryTable.clearSelection();
        } catch (Exception e) {
            String msg = "Class : EmployeeSalaryTable  Method : LoadEmployeeSalaryTable()   = " + e.getMessage();
            log.debug(msg);
        }
    }

    public static void loadEmpSalAll() throws RemoteException, NotBoundException {
        //Controller Instance
        EmployeeSalary employeeSalaryController = (EmployeeSalary) RegistryFactory.getClientStub(RegistryConstants.EmployeeSalary);
        EmployeeSalaryModel employeeSalaryModel = (EmployeeSalaryModel) employeeSalaryController.viewAllRecord();
        List<EmployeeSalaryModel> employees=employeeSalaryModel.getEmployees();
        SimpleDateFormat sdf=new SimpleDateFormat("dd-MM-yyyy");
        salesId = "";
        try {
            String sql = "";
            int i = 0;
            clearData();
            for(i=0;i<employees.size();i++){
             addRow();
                employeeSalaryModel=employees.get(i);
                employeeSalaryTable.getModel().setValueAt(employeeSalaryModel.getSalaryId(), i, 0);
                employeeSalaryTable.getModel().setValueAt(employeeSalaryModel.getEmployeeCode(), i, 1);
                employeeSalaryTable.getModel().setValueAt(employeeSalaryModel.getEmployeeName(), i, 2);
                employeeSalaryTable.getModel().setValueAt(sdf.format(employeeSalaryModel.getDate()), i, 3);
                employeeSalaryTable.getModel().setValueAt(employeeSalaryModel.getSalaryMonth(), i, 4);
                employeeSalaryTable.getModel().setValueAt(employeeSalaryModel.getPaidAmount(), i, 5);
                employeeSalaryTable.getModel().setValueAt(employeeSalaryModel.getSalaryType(), i, 6);
            }
            employeeSalaryTable.clearSelection();
        } catch (Exception e) {
            String msg = "Class : EmployeeSalaryTable  Method : LoadEmployeeSalaryTable()   = " + e.getMessage();
            log.debug(msg);
        }
    }

    public static void addRow() {
        DefaultTableModel model = (DefaultTableModel) employeeSalaryTable.getModel();
        Vector datas = new Vector();
        for (int i = 0; i < employeeSalaryTable.getModel().getColumnCount(); i++) {
            datas.addElement(null);
        }
        model.insertRow(employeeSalaryTable.getRowCount(), datas);
    }

    public static void removeRow() {
        int i = employeeSalaryTable.getSelectedRow();
        int j = employeeSalaryTable.getSelectedColumn();
        int rows = employeeSalaryTable.getRowCount();
        if (i != -1) {
            DefaultTableModel model = (DefaultTableModel) employeeSalaryTable.getModel();
            if (rows == 1) {
                if (i == 0) {
                    model.removeRow(i);
                    for (int n = 0; n < initR; n++) {
                        addRow();
                    }
                    employeeSalaryTable.changeSelection(0, 0, false, false);
                }
            } else {
                model.removeRow(i);
                int rows1 = employeeSalaryTable.getRowCount();
                if (i + 1 != rows) {
                    for (int n = 0; n < rows1; n++) {
                        if (employeeSalaryTable.getModel().getValueAt(n, 0) == null); else {
                            employeeSalaryTable.getModel().setValueAt(n + 1, n, 0);
                        }
                    }
                    employeeSalaryTable.changeSelection(rows1 - 1, j, false, false);
                } else {
                    employeeSalaryTable.changeSelection(i - 1, j, false, false);
                }
            }
        } else {
            Alert.inform("Please select row to remove ...");
        }
    }

    public static void clearData() {
        DefaultTableModel model = (DefaultTableModel) employeeSalaryTable.getModel();
        model.getDataVector().removeAllElements();
        employeeSalaryTable.revalidate();
    }

    public static void keyFunctions() {
    }

    public static void addBasicRows() {
        for (int i = 0; i < 8; i++) {
            addRow();
        }
    }
}
