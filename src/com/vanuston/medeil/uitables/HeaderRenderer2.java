/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.uitables;

import java.awt.Color;
import java.awt.Component;
import java.awt.Container;
import java.awt.Graphics;


import java.awt.event.MouseAdapter;
import java.awt.event.MouseEvent;


import javax.swing.Icon;
import javax.swing.JCheckBox;
import javax.swing.JLabel;
import javax.swing.JTable;
import javax.swing.SwingUtilities;
import javax.swing.table.JTableHeader;
import javax.swing.table.TableCellRenderer;
import javax.swing.table.TableColumnModel;
import javax.swing.table.TableModel;
import com.vanuston.medeil.uitables.TableDamageHelper;
import com.vanuston.medeil.util.Logger;
/**
 *
 * @author Administrator
 */
public class HeaderRenderer2 implements TableCellRenderer {
    Logger log = Logger.getLogger(HeaderRenderer2.class, "HeaderRenderer2");
    public final JCheckBox check = new JCheckBox();
    public double d = 0.00, vamt = 0.00, samt = 0.00;
    public boolean f;
    JTableHeader header;

    public HeaderRenderer2(JTableHeader hd, String chkmode) {
        header = hd;
        check.setOpaque(false);
        check.setFont(header.getFont());
        final String chk = chkmode;

        header.addMouseListener(new MouseAdapter() {

            @Override
            public void mouseClicked(MouseEvent e) {
                if (chk.equals("damageCheck") || chk == "damageCheck") {
                    try
                    {
                    TableDamageHelper damTable=new TableDamageHelper();
                    JTable table = ((JTableHeader) e.getSource()).getTable();
                    TableColumnModel columnModel = table.getColumnModel();
                    int viewColumn = columnModel.getColumnIndexAtX(e.getX());
                    int modelColumn = table.convertColumnIndexToModel(viewColumn);
                    TableModel m = table.getModel();                        
                     check.setSelected(!check.isSelected());                        
                    if (modelColumn == 11) {                                                
                        f = check.isSelected();
                        table.requestFocus();
                        if (!f) {
                            table.requestFocus();
                            for (int i = 0; i < m.getRowCount(); i++) {                                
                                table.setValueAt(f, i, 11);
                                check.setSelected(f);
                                damTable.DamageStockCalculations();
                            }
                        } else {
                            for (int i = 0; i < m.getRowCount(); i++) {                                
                                m.setValueAt(f, i, 11);
                                check.setSelected(f);
                                damTable.DamageStockCalculations();
                            }
                        }                    
                        ((JTableHeader) e.getSource()).repaint();
                    }
                    }
                    catch(Exception ex)
                    {
                        String ss = "Method:loadSalesDatas   Exception:" + ex.getMessage();
                        log.debug(ss);
                    }
                } else if (chk.equals("salesCheck") || chk == "salesCheck") {
                    JTable table = ((JTableHeader) e.getSource()).getTable();

                    TableColumnModel columnModel = table.getColumnModel();
                    int viewColumn = columnModel.getColumnIndexAtX(e.getX());
                    int modelColumn = table.convertColumnIndexToModel(viewColumn);
                    if (modelColumn == 9) {
                        check.setSelected(!check.isSelected());
                        TableModel m = table.getModel();                        
                        f = check.isSelected();
                        if (f) {
                            for (int i = 0; i < m.getRowCount(); i++) {
                                m.setValueAt(f, i, 9);
                                check.setSelected(f);
//                            table.setBackground(Color.black);
//                            table.setForeground(Color.white);


                            }
                        } else {
                            for (int i = 0; i < m.getRowCount(); i++) {
                                m.setValueAt(f, i, 9);
                                check.setSelected(f);
//                            table.setBackground(Color.white);
//                            table.setForeground(Color.black);
                            }
                        }
                        ((JTableHeader) e.getSource()).repaint();
                    }
                } else if (chk.equals("purCheck") || chk == "purCheck") {
                    JTable table = ((JTableHeader) e.getSource()).getTable();
                    TableColumnModel columnModel = table.getColumnModel();
                    int viewColumn = columnModel.getColumnIndexAtX(e.getX());
                    int modelColumn = table.convertColumnIndexToModel(viewColumn);
                    if (modelColumn == 10) {
                        check.setSelected(!check.isSelected());
                        TableModel m = table.getModel();                        
                        f = check.isSelected();
                        if (f) {
                            for (int i = 0; i < m.getRowCount(); i++) {
                                m.setValueAt(f, i, 10);
                                check.setSelected(f);
//                            table.setBackground(Color.black);
//                            table.setForeground(Color.white);
                            }
                        } else {
                            for (int i = 0; i < m.getRowCount(); i++) {
                                m.setValueAt(f, i, 10);
                                check.setSelected(f);
                            }
                        }
                       ((JTableHeader) e.getSource()).repaint();
                    }
                }
            }
        });
    }

    @Override
    public Component getTableCellRendererComponent(
            JTable tbl, Object val, boolean isS, boolean hasF, int row, int col) {

        TableCellRenderer r = tbl.getTableHeader().getDefaultRenderer();

        JLabel l = (JLabel) r.getTableCellRendererComponent(tbl, val, isS, hasF, row, col);
        l.setIcon(new CheckBoxIcon(check));

        return l;
    }

    public void toggleSelect(Boolean bo) {
        check.setSelected(bo);
    }

    public void select() {
        check.setSelected(Boolean.TRUE);
//        header.repaint();
    }

    public void deSelect() {
        check.setSelected(Boolean.FALSE);
//        header.repaint();
    }

    private static class CheckBoxIcon implements Icon {

        private final JCheckBox check;

        public CheckBoxIcon(JCheckBox check) {
            this.check = check;

        }

        @Override
        public int getIconWidth() {
            return check.getPreferredSize().width;
        }

        @Override
        public int getIconHeight() {
            return check.getPreferredSize().height;
        }

        @Override
        public void paintIcon(Component c, Graphics g, int x, int y) {
            SwingUtilities.paintComponent(
                    g, check, (Container) c, x, y, getIconWidth(), getIconHeight());
        }
    }
}
