package com.vanuston.medeil.util;

import java.awt.Component;
import javax.swing.JLabel;
import javax.swing.JTable;
import javax.swing.table.DefaultTableCellRenderer;

public class DecimalFormatRenderer extends DefaultTableCellRenderer {

    static Logger log = Logger.getLogger(DecimalFormatRenderer.class, "Utilities");

    @Override
    public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column) {
        Component renderer = super.getTableCellRendererComponent(table, value, isSelected, hasFocus, row, column);
        try {
            setHorizontalAlignment(JLabel.RIGHT);
        } catch (Exception ex) {
            String ss = "Method : getTableCellRendererComponent Exception :" + ex.getMessage();
            log.debug(ss);
        }
        return renderer;
    }
}
