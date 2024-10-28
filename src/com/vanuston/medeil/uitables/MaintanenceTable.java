package com.vanuston.medeil.uitables;



import com.vanuston.medeil.implementation.MaintenanceCost;
import com.vanuston.medeil.model.MaintenanceCostModel;
import com.vanuston.medeil.util.DateCellEditor;
import com.vanuston.medeil.util.DatePicker;
import com.vanuston.medeil.util.DateUtils;
import com.vanuston.medeil.util.DecimalFormatRenderer;
import com.vanuston.medeil.util.GetChequeTransaction;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import java.awt.Color;
import java.awt.Component;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.awt.event.MouseAdapter;
import java.sql.Date;
import java.util.Arrays;
import java.util.Vector;
import java.util.concurrent.atomic.AtomicBoolean;
import javafx.scene.control.TextBox;
import javafx.stage.Alert;
import javax.swing.AbstractAction;
import javax.swing.AbstractCellEditor;
import javax.swing.Action;
import javax.swing.ActionMap;
import javax.swing.DefaultCellEditor;
import javax.swing.InputMap;
import javax.swing.JComboBox;
import javax.swing.JComponent;
import javax.swing.JFrame;
import javax.swing.JScrollPane;
import javax.swing.JSpinner;
import javax.swing.JTable;
import javax.swing.JTextField;
import javax.swing.KeyStroke;
import javax.swing.SpinnerListModel;
import javax.swing.SwingUtilities;
//import javax.swing.UIManager;
import javax.swing.table.DefaultTableColumnModel;
import javax.swing.table.DefaultTableModel;
import javax.swing.table.TableCellEditor;
import javax.swing.table.TableColumn;
import com.vanuston.medeil.client.RegistryFactory;
import java.util.ArrayList;
import java.util.List;

public class MaintanenceTable {

    public MaintanenceTable() {
        scrollPane = new JScrollPane();
        spinner = new JSpinner();
        comboBox = new JComboBox();
        jcoB = new JComboBox();
        jcoB1 = new JComboBox();
        totItems = 0;
        intNull = 0;
        rowCount = 0;
        cnt =0;
        chqNo = new ArrayList<String>();
        save = KeyStroke.getKeyStroke(KeyEvent.VK_F3, 0);
        edit = KeyStroke.getKeyStroke(KeyEvent.VK_F6, 0);
        reset = KeyStroke.getKeyStroke(KeyEvent.VK_F4, 0);
        del = KeyStroke.getKeyStroke(KeyEvent.VK_F5, 0);
        update = KeyStroke.getKeyStroke(KeyEvent.VK_F7, 0);
        cancel = KeyStroke.getKeyStroke(KeyEvent.VK_F8, 0);
        rR = KeyStroke.getKeyStroke(KeyEvent.VK_F12, 0);
        back = KeyStroke.getKeyStroke(KeyEvent.VK_LEFT, KeyEvent.CTRL_MASK);
        ntamt = null;
    }
    public JTable MaintainCost;
    public JFrame jframe;
    public JScrollPane scrollPane;
    public JSpinner spinner;
    public JComboBox comboBox;
    public JComboBox jcoB;
    public JComboBox jcoB1;
    public int totItems;
    public int intNull;
    public int rowCount;
    public int cnt;
    public List<String> chqNo;
    public String cheqNo;
    public String date ;
    public KeyStroke save;
    public KeyStroke edit;
    public KeyStroke reset;
    public KeyStroke del;
    public KeyStroke update;
    public KeyStroke cancel;
    public KeyStroke rR;
    public KeyStroke back;
    public String ntamt;
    public Logger log = Logger.getLogger(MaintanenceTable.class, "Utilities");

    public JComponent createViewTable(final int col, Object[] colName, Class[] type, boolean[] canEdit, int[] width) {

        final Class[] types = type;
        final boolean[] canEditCols = canEdit;
        final int[] colWidth = width;
        MaintainCost = new JTable();
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

            MaintainCost.setModel(new javax.swing.table.DefaultTableModel(data, cols) {

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

        } catch (Exception e) {
            String msg = "Class : MaintanenceTable  Method  : createViewTable()  Exception:" + e.getMessage();
            log.debug(msg);
        }
        MaintainCost.getColumnModel().getColumn(4).setCellRenderer(new DecimalFormatRenderer());
        MaintainCost.setAutoResizeMode(JTable.AUTO_RESIZE_SUBSEQUENT_COLUMNS);
        MaintainCost.getTableHeader().setBackground(new Color(226, 238, 244));
        MaintainCost.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
        MaintainCost.getTableHeader().setReorderingAllowed(false);
        MaintainCost.setSelectionMode(0);
        MaintainCost.setShowGrid(true);
        MaintainCost.setDragEnabled(false);
        for (int i = 0; i < len; i++) {
            MaintainCost.getColumnModel().getColumn(i).setPreferredWidth(colWidth[i]);
        }
        MaintainCost.addKeyListener(new KeyAdapter() {

            @Override
            public void keyReleased(KeyEvent e) {
                tableKeyReleased(e);
            }

            @Override
            public void keyPressed(KeyEvent e) {
                if (e.getKeyCode() == 10 || e.getKeyCode() == 9) {
                    InputMap im = MaintainCost.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
                    KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
                    KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
                    im.put(enter, im.get(tab));
                }
            }
        });

        MaintainCost.addMouseListener(new MouseAdapter() {

            @Override
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                loadAdditional();
            }
        });

        MaintainCost.getInputMap().put(save, "action");
        MaintainCost.getInputMap().put(edit, "action");
        MaintainCost.getInputMap().put(reset, "action");
        MaintainCost.getInputMap().put(cancel, "action");
        MaintainCost.getInputMap().put(update, "action");
        MaintainCost.getInputMap().put(del, "action");
        MaintainCost.getInputMap().put(rR, "action");
        MaintainCost.getInputMap().put(back, "action");

        MaintainCost.getActionMap().put("action", new AbstractAction() {

            @Override
            public void actionPerformed(ActionEvent e) {
                MaintainCost.transferFocus();
            }
        });
        DefaultTableColumnModel colum = (DefaultTableColumnModel) MaintainCost.getColumnModel();
        DefaultTableColumnModel colum1 = (DefaultTableColumnModel) MaintainCost.getColumnModel();
        String[] part = {"Lease", "Electricity Bill", "Internet", "Rent", "Phone Bill", "Mobile Bill", "Computers Maintenance", "Peripherals Maintenance", "Materials", "Water Supply", "Other Expensive"};
        colum.getColumn(1).setCellEditor(new SpinnerEditor(part));
        String[] items = {"Default", "Paid", "Unpaid", "Not Applicable"};
        colum1.getColumn(3).setCellEditor(new SpinnerEditor(items));
        String[] paType = {"Cash", "Cheque", "DD", "Credit Card", "Debit Card"};
        colum1.getColumn(4).setCellEditor(new SpinnerEditor(paType));
        MaintainCost.setGridColor(new java.awt.Color(204, 204, 255));
        MaintainCost.setCellSelectionEnabled(false);
        MaintainCost.setRowSelectionAllowed(true);
        MaintainCost.setRowHeight(20);
        MaintainCost.setSelectionBackground(Color.LIGHT_GRAY);
        MaintainCost.setSelectionForeground(Color.RED);
        MaintainCost.revalidate();
        return MaintainCost;
    }

    public JComponent getScrollTable(JComponent jt) {
        MaintainCost = (JTable) jt;
        scrollPane.add(MaintainCost);
        scrollPane.setViewportView(MaintainCost);
        return scrollPane;
    }

    public void setCellCombo(int i) {
        TableColumn tableCol = MaintainCost.getColumnModel().getColumn(i);
        tableCol.setCellEditor(new DefaultCellEditor(jcoB));
    }

    public void setComboValue(String[] s) {
        for (int i = 0; i < s.length; i++) {
            jcoB.addItem(s[i]);
        }
    }

    public void setCellCombo1(int i) {
        TableColumn tableCol = MaintainCost.getColumnModel().getColumn(i);
        tableCol.setCellEditor(new DefaultCellEditor(jcoB1));
    }

    public void setComboValue1(String[] s) {
        for (int i = 0; i < s.length; i++) {
            jcoB1.addItem(s[i]);
        }
    }

    public void setParticularValue() {
        MaintainCost.getModel().setValueAt("1", 0, 0);
        MaintainCost.getModel().setValueAt("Lease", 0, 1);
        MaintainCost.getModel().setValueAt("2", 1, 0);
        MaintainCost.getModel().setValueAt("Electricity Bill", 1, 1);
        MaintainCost.getModel().setValueAt("3", 2, 0);
        MaintainCost.getModel().setValueAt("Internet", 2, 1);
        MaintainCost.getModel().setValueAt("4", 3, 0);
        MaintainCost.getModel().setValueAt("Rent", 3, 1);
        MaintainCost.getModel().setValueAt("5", 4, 0);
        MaintainCost.getModel().setValueAt("Phone Bill", 4, 1);
        MaintainCost.getModel().setValueAt("6", 5, 0);
        MaintainCost.getModel().setValueAt("Mobile Bill", 5, 1);
        MaintainCost.getModel().setValueAt("7", 6, 0);
        MaintainCost.getModel().setValueAt("Computers Maintenance", 6, 1);
        MaintainCost.getModel().setValueAt("8", 7, 0);
        MaintainCost.getModel().setValueAt("Peripherals Maintenance", 7, 1);
        MaintainCost.getModel().setValueAt("9", 8, 0);
        MaintainCost.getModel().setValueAt("Materials", 8, 1);
        MaintainCost.getModel().setValueAt("10", 9, 0);
        MaintainCost.getModel().setValueAt("Water Supply", 9, 1);
        MaintainCost.getModel().setValueAt("11", 10, 0);
        MaintainCost.getModel().setValueAt("Other Expensive", 10, 1);
        for (int i = 0;i<12;i++)
            chqNo.add("0") ;
    }

    public void addRow() {
        int row = MaintainCost.getSelectedRow();
        int column = MaintainCost.getSelectedColumn();
        DefaultTableModel model = (DefaultTableModel) MaintainCost.getModel();
        Vector datas = new Vector();
        datas.addElement(MaintainCost.getRowCount() + 1);
        for (int i = 1; i < MaintainCost.getModel().getColumnCount(); i++) {
            datas.addElement(null);
        }
        model.insertRow(MaintainCost.getRowCount(), datas);
        rowCount++;
        MaintainCost.changeSelection(MaintainCost.getRowCount(), column, false, false);
         for (int i = 0;i<rowCount;i++)
            chqNo.add("0") ;
    }

    public void removeRow() {
        int i = MaintainCost.getSelectedRow();
        int column = MaintainCost.getSelectedColumn();
        int rows = MaintainCost.getRowCount();
        if (i != -1) {
            DefaultTableModel model = (DefaultTableModel) MaintainCost.getModel();
            if (rows == 1) {
                if (i == 0) {
                    model.removeRow(i);
                    addRow();
                    addRow();
                    MaintainCost.changeSelection(0, 0, false, false);
                }
            } else {
                model.removeRow(i);
                rowCount--;
                int rows1 = MaintainCost.getRowCount();

                if (i + 1 != rows) {
                    for (int j = 0; j < rows1; j++) {
                        MaintainCost.getModel().setValueAt(j + 1, j, 0);
                    }
                    MaintainCost.changeSelection(i, column, false, false);
                    totItems = MaintainCost.getModel().getRowCount();
                } else {
                    MaintainCost.changeSelection(i, column, false, false);
                    totItems = MaintainCost.getModel().getRowCount();
                }
            }
        } else {
            Alert.inform("Please select row to remove ...");
        }
    }

    public void clearData() {
        rowCount = 0;
        chqNo.clear();
        DefaultTableModel model = (DefaultTableModel) MaintainCost.getModel();
        model.getDataVector().removeAllElements();
        addRow();
        addRow();
        addRow();
        addRow();
        addRow();
        addRow();
        addRow();
        addRow();
        addRow();
        addRow();
        addRow();
        addRow();
        MaintainCost.revalidate();
    }

    public String[][] getTableValues() {
        int rowCount = MaintainCost.getModel().getRowCount();
        totItems = rowCount;
        int colCount = MaintainCost.getModel().getColumnCount();
        String[][] values = new String[rowCount][colCount];
        for (int i = 0; i < rowCount; i++) {
            for (int j = 0; j < colCount; j++) {
                Object obj = MaintainCost.getModel().getValueAt(i, j);
                if (obj == null) {
                    values[i][j] = "";
                } else {
                    values[i][j] = "" + obj;
                }
            }
        }
        return values;
    }

    public Object[] getTableChequeNos() {

        int rowC = MaintainCost.getModel().getRowCount();
        Object[] val = {"0"} ;
        try {
            Object v[] = new Object[rowC];
            int r = 0;
            int rs = 0;
            for (int i = 0; i < rowC; i++) {
                if (MaintainCost.getModel().getValueAt(i, 4) != null){
                 Object ch = MaintainCost.getModel().getValueAt(i, 4);
                 if (ch.toString().equals("Cheque")) {
                    r++;
                    v[rs++]= i;
                }
            }
            }
            val = new Object[r];
            for (int i = 0; i < r; i++) {
                if (MaintainCost.getModel().getValueAt(i, 5).toString() != null || MaintainCost.getModel().getValueAt(i, 5).toString().equals("")) {
                    val[i] = MaintainCost.getModel().getValueAt(Integer.parseInt(v[i].toString()), 5).toString();
                } else {
                    val[i] = "0";
                    intNull = Integer.parseInt(v[i].toString());
                }
            }
        } catch (Exception e) {
            log.debug("Err in getTableChequeNos in maintanaceTtable :" + e.getMessage());
        }
        return val;
    }

    public void tableKeyReleased(KeyEvent e) {
        if (e.getKeyCode() == 10 || e.getKeyCode() == 9) {
            InputMap im = MaintainCost.getInputMap(JTable.WHEN_ANCESTOR_OF_FOCUSED_COMPONENT);
            KeyStroke tab = KeyStroke.getKeyStroke(KeyEvent.VK_TAB, 0);
            KeyStroke enter = KeyStroke.getKeyStroke(KeyEvent.VK_ENTER, 0);
            im.put(enter, im.get(tab));
        }
        loadAdditional();
    }

    void loadAdditional() {
        try {
            final int i = MaintainCost.getSelectedRow();
            final int j = MaintainCost.getSelectedColumn();
            chqNo.add("0");
            if (j == 2) {
                DatePicker dt = new DatePicker(jframe);
                MaintainCost.getModel().setValueAt(dt.setPickedDate(), i, 2);
                MaintainCost.changeSelection(i, 3, false, false);
            }
            if (j == 3) {
                if (MaintainCost.getModel().getValueAt(i, 1) == null) {
                    MaintainCost.changeSelection(i, 1, false, false);
                }
            }
            if (j == 5) {
                if (MaintainCost.getValueAt(i, 4).equals("") || MaintainCost.getValueAt(i, 4) == null) {
                    MaintainCost.changeSelection(i, 5, false, false);
                } else if (MaintainCost.getValueAt(i, 4).toString().equals("Cheque")) {
                     if (!chqNo.isEmpty()) { chqNo.set(i,"0"); }
                    GetChequeTransaction ch = new GetChequeTransaction(MaintainCost,chqNo);
                    MaintainCost.changeSelection(i, 6, false, false);
                    if ((ch.cheque_no == null || ch.cheque_no.equals("") || ch.cheque_no.length() <= 0) && (ch.amount == null || ch.amount.toString().equals("") || ch.amount.toString().length() <= 0)) {
                    } else {
                        chqNo.set(i,ch.cheque_no);
                        MaintainCost.getModel().setValueAt(ch.cheque_no, i, 5);
                        MaintainCost.getModel().setValueAt(ch.amount, i, 6);
                    }

                }
            }
            if (j == MaintainCost.getModel().getColumnCount() - 1) {
                if (MaintainCost.getModel().getValueAt(i, 6) == null || MaintainCost.getModel().getValueAt(i, 6) == "") {
                } else {
                    totItems = MaintainCost.getModel().getRowCount();
//                totItems++;
                }
                if (i == MaintainCost.getModel().getRowCount() - 1) {
                    addRow();
                }
            }
        } catch (Exception ex) {
            String msg = "Class : MaintanenceTable  Method  : loadAdditional() Exception: " + ex;
            log.debug(msg);
        }
    }

    public void focusSet(int row, int col) {
        MaintainCost.requestFocus();
        if (col != 0) {
            MaintainCost.changeSelection(row, (col - 1), false, false);
        } else {
            MaintainCost.changeSelection(row, (col + 1), false, false);
        }
        MaintainCost.changeSelection(row, col, false, false);
        MaintainCost.setCellSelectionEnabled(false);
        MaintainCost.setRowSelectionAllowed(true);
    }

    public void focusSet() {
        MaintainCost.requestFocus();
        MaintainCost.changeSelection(0, 0, false, false);
        MaintainCost.changeSelection(0, 1, false, false);
        MaintainCost.getModel().setValueAt("1", 0, 0);
        MaintainCost.setCellSelectionEnabled(false);
        MaintainCost.setRowSelectionAllowed(true);
    }

    public void focusOut(TextBox tbt) {
        tbt.requestFocus();
        MaintainCost.changeSelection(0, 1, false, false);
        MaintainCost.setCellSelectionEnabled(false);
        MaintainCost.setRowSelectionAllowed(true);
    }

    public double total(int colNum) {
        double tot = 0;
        int colNo = colNum;
        for (int i = 0; i < MaintainCost.getModel().getRowCount(); i++) {
            if (MaintainCost.getModel().getValueAt(i, colNo) != null) {
                tot += Double.parseDouble("" + MaintainCost.getModel().getValueAt(i, colNo));
            } else {
                MaintainCost.getModel().setValueAt(Integer.parseInt("0"), i, colNo);
                tot += Double.parseDouble("" + MaintainCost.getModel().getValueAt(i, colNo));
            }
        }
        return tot;
    }

    public int totalc(int col) {
        int tot = 0;
        int cn = col;
        for (int i = 0; i < MaintainCost.getModel().getRowCount(); i++) {
            if (MaintainCost.getModel().getValueAt(i, cn) != null) {
                tot += Double.parseDouble("" + MaintainCost.getModel().getValueAt(i, cn));
            } else {
                MaintainCost.getModel().setValueAt("0", i, cn);
                tot += Double.parseDouble("" + MaintainCost.getModel().getValueAt(i, cn));
            }
        }
        return tot;
    }

    public int totalRow() {
        int tot = 0;
        for (int i = 0; i < MaintainCost.getModel().getRowCount(); i++) {
            if (MaintainCost.getModel().getValueAt(i, 2) != null) {
                tot += 1;
            }
        }
        return tot;
    }

    public void GetDefaultValues(String year) {
        try {
            String curDate[] = DateUtils.now("dd-MM-yyyy").split("-");
            String part = null;
            String due[] = null;
            String pay_status = null;
            String pay_type = null;
            Double amount = 0.0;
            MaintenanceCost maintenanceCostController = (MaintenanceCost) RegistryFactory.getClientStub(RegistryConstants.MaintenanceCost);
            MaintenanceCostModel maintenanceCostModel = new MaintenanceCostModel();
            maintenanceCostModel.setYear(Integer.parseInt(year));
            maintenanceCostModel.setMonth("") ; //Default (Previous) Month Details
            maintenanceCostModel = (MaintenanceCostModel) maintenanceCostController.viewRecord(maintenanceCostModel);
            java.util.List<MaintenanceCostModel> modelList = maintenanceCostModel.getMaintenanceCostList();
            for (int index = 0; index < modelList.size(); index++) {
                maintenanceCostModel = modelList.get(index);
                part = maintenanceCostModel.getParticular();
                due = (DateUtils.normalFormatDate(maintenanceCostModel.getDueDate())).split("-");
                pay_status = maintenanceCostModel.getPaymentStatus();
                pay_type = maintenanceCostModel.getPaymentType();
                amount = maintenanceCostModel.getAmount();
                for (int i = 0; i < 10; i++) {
                    //if (part.equals(MaintainCost.getModel().getValueAt(i, 1).toString()) && pay_status.equals("Default")) {
                    if (part.equals(MaintainCost.getModel().getValueAt(i, 1))) {
                        date = due[0] + "-" + curDate[1] + "-" + due[2];
                        MaintainCost.getModel().setValueAt(date, i, 2);
                        MaintainCost.getModel().setValueAt(pay_status, i, 3);
                        if (!pay_type.equals("Cheque")) {
                            MaintainCost.getModel().setValueAt(pay_type, i, 4);
                        }
                        MaintainCost.getModel().setValueAt(amount, i, 6);
                    }
                }
            }
        } catch (Exception e) {
            String msg = "Class : MaintanenceTable  Method  : GetDefaultValues() Exception: " + e;
            log.debug(msg);
        }
    }

    public void MaintainDetails(String year, String month) {

        try {
            clearData();
            MaintenanceCost maintenanceCostController = (MaintenanceCost) RegistryFactory.getClientStub(RegistryConstants.MaintenanceCost);
            MaintenanceCostModel maintenanceCostModel = new MaintenanceCostModel();
            maintenanceCostModel.setYear(Integer.parseInt(year));
            maintenanceCostModel.setMonth(month);
            maintenanceCostModel = (MaintenanceCostModel) maintenanceCostController.viewRecord(maintenanceCostModel);
            java.util.List<MaintenanceCostModel> modelList = maintenanceCostModel.getMaintenanceCostList();
            maintenanceCostModel = modelList.get(modelList.size() - 1);
            date = DateUtils.normalFormatDate(maintenanceCostModel.getDate());
            ntamt = maintenanceCostModel.getNetTotal().toString();
            int j = 0;
            rowCount = 0 ;
            chqNo.clear();
            for (int i=0;i< modelList.size();i++){
                chqNo.add("0");
            }
            while (j < modelList.size()) {
                if(!chqNo.isEmpty()){
                    chqNo.set(j, "0");
                }
                maintenanceCostModel = modelList.get(j);
                String dueDat = maintenanceCostModel.getDueDate().trim();
                if (dueDat == null || dueDat.equals("null")) {
                    dueDat = "";
                }
                String pay_status = maintenanceCostModel.getPaymentStatus().trim();
                if (pay_status == null || pay_status.equals("null")) {
                    pay_status = "";
                }
                String chq_no = maintenanceCostModel.getChequeNo();
                if (chq_no == null || chq_no.equals("null")) {
                    chq_no = "";
                }else {
                    chqNo.set(j, chq_no);
                }
                rowCount++;
                MaintainCost.getModel().setValueAt(maintenanceCostModel.getParticular(), j, 1);
                MaintainCost.getModel().setValueAt((DateUtils.normalFormatDate(dueDat)), j, 2);
                MaintainCost.getModel().setValueAt(pay_status, j, 3);
                MaintainCost.getModel().setValueAt(maintenanceCostModel.getPaymentType(), j, 4);
                MaintainCost.getModel().setValueAt(chq_no, j, 5);
                MaintainCost.getModel().setValueAt(maintenanceCostModel.getAmount(), j, 6);
                j++;
            }
            totItems = MaintainCost.getModel().getRowCount();
        } catch (Exception e) {
            String msg = "Class : MaintanenceTable  Method  : MaintainDetails() Exception:" + e.getMessage();
            log.debug(msg);
        }
    }
}

class SpinnerEditor extends AbstractCellEditor implements TableCellEditor {

    static Logger log = Logger.getLogger(DateCellEditor.class, "Utilities");
    JSpinner spinner;
    int selectedRow;
    int selectedColumn;
    JTable currentTable;
    Date currentDate;

    public SpinnerEditor(String[] items) {
        try {
            final AtomicBoolean startByKeyPress = new AtomicBoolean();
            SpinnerListModel Slist = new SpinnerListModel(items);
            spinner = new JSpinner(Slist) {

                @Override
                public void addNotify() {
                    super.addNotify();
                    getEditor().getComponent(0).requestFocusInWindow();
                }

                @Override
                protected boolean processKeyBinding(KeyStroke ks, KeyEvent e, int condition, boolean pressed) {
                    JComponent component = (JComponent) getEditor().getComponent(0);
                    InputMap map = component.getInputMap(condition);
                    ActionMap am = component.getActionMap();
                    if (startByKeyPress.get() && component instanceof JTextField) {
                        ((JTextField) component).selectAll();
                        startByKeyPress.set(false);
                    }
                    if (map != null && am != null && isEnabled()) {
                        Object binding = map.get(ks);
                        Action action = (binding == null) ? null : am.get(binding);
                        if (action != null) {
                            return SwingUtilities.notifyAction(action, ks, e, component,
                                    e.getModifiers());
                        }
                    }
                    return super.processKeyBinding(ks, e, condition, pressed);
                }
            };
            spinner.setModel(new SpinnerListModel(Arrays.asList(items)));
        } catch (Exception ex) {
            String ss = "Class : MaintanenceTable  Method  : DateCellEditor(Constructor) Exception :" + ex.getMessage();
            log.debug(ss);
        }
    }

    @Override
    public Object getCellEditorValue() {
        return spinner.getValue();
    }

    @Override
    public Component getTableCellEditorComponent(JTable table, Object value, boolean isSelected, int row, int column) {
        try {
            if (value != null) {
                spinner.setValue(value);
                currentTable = table;
                selectedRow = row;
                selectedColumn = column;
            }
        } catch (Exception ex) {
            String ss = "Class : MaintanenceTable  Method  : getTableCellEditorComponent  Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return spinner;
    }
}
