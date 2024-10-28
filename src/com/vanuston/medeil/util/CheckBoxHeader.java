package com.vanuston.medeil.util;

import java.awt.Component;
import java.awt.event.ItemEvent;
import java.awt.event.ItemListener;
import java.awt.event.MouseEvent;
import java.awt.event.MouseListener;
import javax.swing.*;
import javax.swing.table.*;

public class CheckBoxHeader extends JCheckBox implements TableCellRenderer, MouseListener {

    protected CheckBoxHeader rendererComponent;
    protected int column;
    protected int cols;
    protected boolean mousePressed = false;
    protected String title = "";
    protected String chgTitle = "";
    protected boolean isDisable = false;
    protected JTable parent;

    public CheckBoxHeader(ItemListener itemListener) {
        rendererComponent = this;
        rendererComponent.addItemListener(itemListener);
    }

    public CheckBoxHeader(ItemListener itemListener, String title, String chgTitle) {
        this.title = title;
        this.chgTitle = chgTitle;
        rendererComponent = this;
        rendererComponent.addItemListener(itemListener);
    }

    public CheckBoxHeader(JTable jt, String title, String chgTitle, int n) {
        parent = jt;
        cols = n;
        this.title = title;
        this.chgTitle = chgTitle;
        rendererComponent = this;
        rendererComponent.addItemListener(new CheckAllListenerLocal(parent, title, chgTitle, this, cols));
    }

    @Override
    public Component getTableCellRendererComponent(JTable table, Object value, boolean isSelected, boolean hasFocus, int row, int column) {
        if (table != null) {
            JTableHeader header = table.getTableHeader();
            if (header != null) {
                header.addMouseListener(rendererComponent);
            }
        }
        setColumn(column);
        rendererComponent.setText(title);
        setBorder(UIManager.getBorder("TableHeader.cellBorder"));
        return rendererComponent;
    }

    protected void setColumn(int column) {
        this.column = column;
    }

    public int getColumn() {
        return column;
    }

    protected void handleClickEvent(MouseEvent e) {
        if (mousePressed) {
            mousePressed = false;
            JTableHeader header = (JTableHeader) (e.getSource());
            JTable tableView = header.getTable();
            TableColumnModel columnModel = tableView.getColumnModel();
            int viewColumn = columnModel.getColumnIndexAtX(e.getX());
            int coln = tableView.convertColumnIndexToModel(viewColumn);
            if (viewColumn == this.column && e.getClickCount() == 1 && coln != -1) {
                doCheck();
            }
            rendererComponent.setText(title);
            this.repaint();
        }
    }

    @Override
    public void mouseClicked(MouseEvent e) {
        if (!isDisable) {
            handleClickEvent(e);
            ((JTableHeader) e.getSource()).repaint();
        }
    }

    @Override
    public void mousePressed(MouseEvent e) {
        mousePressed = true;
        rendererComponent.setText(chgTitle);
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

    public void doCheck() {
        doClick();
    }
}

class CheckAllListenerLocal implements ItemListener {

    JTable table1;
    int cols;
    CheckBoxHeader rendComp;
    String tit = "";
    String ChngTit = "";

    public CheckAllListenerLocal() {
    }

    public CheckAllListenerLocal(JTable jt, int colIndex) {
        table1 = jt;
        cols = colIndex;
    }

    public CheckAllListenerLocal(JTable jt, String t, String chngT, CheckBoxHeader rr, int colIndex) {
        table1 = jt;
        cols = colIndex;
        rendComp = rr;
        tit = t;
        ChngTit = chngT;
    }

    @Override
    public void itemStateChanged(ItemEvent e) {
        Object source = e.getSource();
        if (source instanceof AbstractButton == false) {
            rendComp.setText(tit);
            return;
        }
        boolean checked = e.getStateChange() == ItemEvent.SELECTED;
        for (int x = 0, y = table1.getRowCount(); x < y; x++) {
            table1.setValueAt(checked, x, cols);
        }
        rendComp.setText(ChngTit);
    }
}
