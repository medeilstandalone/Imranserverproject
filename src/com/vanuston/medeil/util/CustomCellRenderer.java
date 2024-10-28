package com.vanuston.medeil.util;

import java.awt.Color;
import java.awt.Component;
import javax.swing.JTable;
import javax.swing.table.DefaultTableCellRenderer;

public class CustomCellRenderer extends DefaultTableCellRenderer {

    Color backColor = null;
    int rowIndex = -1;

    public CustomCellRenderer(int rowIndex, Color backColor) {
        this.rowIndex = rowIndex;
        this.backColor = backColor;
    }

    @Override
    public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column) {
        super.getTableCellRendererComponent(table, value, isSelected, hasFocus, row, column);
        if (row == rowIndex && backColor != null) {
            setBackground(backColor);
        }
        return this;
    }
}
