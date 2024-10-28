package com.vanuston.medeil.util;

import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import javax.swing.AbstractButton;
import javax.swing.JTable;

public class CheckAllListener implements ItemListener {

    JTable table1;
    int cols;

    public CheckAllListener() {
    }

    public CheckAllListener(JTable jt, int colIndex) {
        table1 = jt;
        cols = colIndex;
    }

    @Override
    public void itemStateChanged(ItemEvent e) {
        Object source = e.getSource();
        if (source instanceof AbstractButton == false) {
            return;
        }
        boolean checked = e.getStateChange() == ItemEvent.SELECTED;
        for (int x = 0, y = table1.getRowCount(); x < y; x++) {
            table1.setValueAt(checked, x, cols);
        }
    }
}
