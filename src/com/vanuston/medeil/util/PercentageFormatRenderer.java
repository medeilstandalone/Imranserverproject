package com.vanuston.medeil.util;

import java.awt.Component;
import java.text.DecimalFormat;
import javax.swing.JLabel;
import javax.swing.JTable;
import javax.swing.table.DefaultTableCellRenderer;

public class PercentageFormatRenderer extends DefaultTableCellRenderer {

    @Override
    public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column) {
        DecimalFormat decFormatter = new java.text.DecimalFormat("##.#%");
        Component renderer = super.getTableCellRendererComponent(table, value, isSelected, hasFocus, row, column);
        if (value != null) {
            if (value != "") {
                String ss = value.toString();
                setText(decFormatter.format((Double.parseDouble(ss)) / 100));
                int val = value.toString().lastIndexOf("%");
                if (val == -1) {
                }
            } else {
                setText("0%");
            }
        } else {
            setText(null);
        }
        setHorizontalAlignment(JLabel.RIGHT);
        return renderer;
    }
}
