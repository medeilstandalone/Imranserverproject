package com.vanuston.medeil.util;

import java.util.*;
import java.awt.Component;
import java.text.DateFormat;
import javax.swing.*;
import java.awt.event.KeyEvent;
import javax.swing.table.TableCellEditor;
import java.util.concurrent.atomic.AtomicBoolean;
import javax.swing.table.DefaultTableCellRenderer;

public class DateCellEditor extends AbstractCellEditor implements TableCellEditor {

    static Logger log = Logger.getLogger(DateCellEditor.class, "Utilities");
    int selectedRow;
    int selectedColumn;
    JTable currentTable;
    Date currentDate;
    JSpinner spinner;
    protected final String EDIT = "edit";

    public DateCellEditor() {
        try {
            Calendar calendar = Calendar.getInstance();
            Date initDate = calendar.getTime();
            calendar.add(Calendar.MONTH, -1);
            Date earliestDate = calendar.getTime();
            calendar.add(Calendar.YEAR, 200);
            Date latestDate = calendar.getTime();
            SpinnerDateModel dateModel = new SpinnerDateModel(initDate, earliestDate, latestDate, Calendar.YEAR);// ignored for user input
            final AtomicBoolean startByKeyPress = new AtomicBoolean();
            spinner = new JSpinner(dateModel) {

                @Override
                public void addNotify() {
                    super.addNotify();
                    getEditor().getComponent(0).requestFocusInWindow();
                }

                @Override
                protected boolean processKeyBinding(KeyStroke ks, KeyEvent e, int condition,
                        boolean pressed) {
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
            spinner.setEditor(new JSpinner.DateEditor(spinner, "MMM-yyyy"));
        } catch (Exception ex) {
            String ss = "Class : DateCellEditor  Method  : DateCellEditor(Constructor) Exception:" + ex.getMessage();
            log.debug(ss);
        }
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
            String ss = "Class : DateCellEditor  Method  : getTableCellEditorComponent Exception:" + ex.getMessage();
            log.debug(ss);
        }
        return spinner;
    }

    @Override
    public Object getCellEditorValue() {
        return spinner.getValue();
    }

   public static class DateRenderer extends DefaultTableCellRenderer {

        DateFormat formatter;

        public DateRenderer() {
            super();
        }

        @Override
        public void setValue(Object value) {
            try {
                if (formatter == null) {
                    formatter = DateFormat.getDateInstance(DateFormat.SHORT, Locale.ITALY);
                }
                setText((value == null) ? "" : formatter.format(value));
            } catch (Exception ex) {
                String ss = "Class : DateCellEditor  Method  : setValue Exception:" + ex.getMessage();
                log.debug(ss);
            }
        }
    }
}
