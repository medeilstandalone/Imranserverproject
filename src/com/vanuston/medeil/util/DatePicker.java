package com.vanuston.medeil.util;

import java.awt.*;
import java.awt.event.*;
import javax.swing.*;

public final class DatePicker {

    int month = java.util.Calendar.getInstance().get(java.util.Calendar.MONTH);
    int year = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR);
    JLabel l = new JLabel("", JLabel.CENTER);
    String day = "";
    JDialog d;
    JButton[] button = new JButton[49];
    public  KeyStroke exitDiag = KeyStroke.getKeyStroke(KeyEvent.VK_ESCAPE, 0);

    public DatePicker(JPanel parent) {
        d = new JDialog();
        d.setModal(true);
        String[] header = {"Sun", "Mon", "Tue", "Wed", "Thur", "Fri", "Sat"};
        JPanel p1 = new JPanel(new GridLayout(7, 7));
        p1.setPreferredSize(new Dimension(430, 120));



//                    .getActionMap().put("focusOut", new AbstractAction("focusOut") {
//
//                @Override
//                public void actionPerformed(ActionEvent evt) {
//                    jcomp.clearSelection();
//                    jcomp.transferFocus();
//                }
//            });
        for (int x = 0; x < button.length; x++) {
            final int selection = x;
            button[x] = new JButton();
            button[x].setFocusPainted(false);
            button[x].setBackground(Color.white);
            button[x].getInputMap().put(exitDiag, "exit");
            button[x].getActionMap().put("exit", new AbstractAction("exit") {
                @Override
                public void actionPerformed(ActionEvent e) {
                    d.dispose();
                }


            });
            if (x > 6) {
                button[x].addActionListener(new ActionListener() {

                    @Override
                    public void actionPerformed(ActionEvent ae) {
                        day = button[selection].getActionCommand();
                        d.dispose();
                    }
                });
            }
            if (x < 7) {
                button[x].setText(header[x]);
                button[x].setForeground(Color.red);
            }
            p1.add(button[x]);
        }

        JPanel p2 = new JPanel(new GridLayout(1, 3));
        JButton previous = new JButton("<< Previous");
        previous.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent ae) {
                month--;
                displayDate();
            }
        });
        p2.add(previous);
        p2.add(l);
        JButton next = new JButton("Next >>");
        next.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent ae) {
                month++;
                displayDate();
            }
        });
        p2.add(next);
        d.add(p1, BorderLayout.CENTER);
        d.add(p2, BorderLayout.SOUTH);
        d.pack();
        d.setLocationRelativeTo(parent);
        displayDate();
        d.setVisible(true);
    }

    public DatePicker(JFrame parent) {
        d = new JDialog();
        d.setModal(true);
        String[] header = {"Sun", "Mon", "Tue", "Wed", "Thur", "Fri", "Sat"};
        JPanel p1 = new JPanel(new GridLayout(7, 7));
        p1.setPreferredSize(new Dimension(380, 120));



//                    .getActionMap().put("focusOut", new AbstractAction("focusOut") {
//
//                @Override
//                public void actionPerformed(ActionEvent evt) {
//                    jcomp.clearSelection();
//                    jcomp.transferFocus();
//                }
//            });
        for (int x = 0; x < button.length; x++) {
            final int selection = x;
            button[x] = new JButton();
            button[x].setFocusPainted(false);
            button[x].setBackground(Color.white);
            button[x].getInputMap().put(exitDiag, "exit");
            button[x].getActionMap().put("exit", new AbstractAction("exit") {
                @Override
                public void actionPerformed(ActionEvent e) {
                    d.dispose();
                }


            });
            if (x > 6) {
                button[x].addActionListener(new ActionListener() {

                    @Override
                    public void actionPerformed(ActionEvent ae) {
                        day = button[selection].getActionCommand();
                        d.dispose();
                    }
                });
            }
            if (x < 7) {
                button[x].setText(header[x]);
                button[x].setForeground(Color.red);
            }
            p1.add(button[x]);
        }

        JPanel p2 = new JPanel(new GridLayout(1, 3));
        JButton previous = new JButton("<< Previous");
        previous.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent ae) {
                month--;
                displayDate();
            }
        });
        p2.add(previous);
        p2.add(l);
        JButton next = new JButton("Next >>");
        next.addActionListener(new ActionListener() {

            @Override
            public void actionPerformed(ActionEvent ae) {
                month++;
                displayDate();
            }
        });
        p2.add(next);
        d.add(p1, BorderLayout.CENTER);
        d.add(p2, BorderLayout.SOUTH);
        d.pack();
        d.setLocationRelativeTo(parent);
        displayDate();
        d.setVisible(true);
    }

    public void displayDate() {
        for (int x = 7; x < button.length; x++) {
//            button[x].setEnabled(true);
            button[x].setVisible(true);
            button[x].setText("");
        }
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("MMMM yyyy");
        java.util.Calendar cal = java.util.Calendar.getInstance();
        cal.set(year, month, 1);
        int dayOfWeek = cal.get(java.util.Calendar.DAY_OF_WEEK);
        int daysInMonth = cal.getActualMaximum(java.util.Calendar.DAY_OF_MONTH);
        for (int x = 6 + dayOfWeek, nDay = 1; nDay <= daysInMonth; x++, nDay++) {
            button[x].setText("" + nDay);
        }
        for (int x = 7; x < button.length; x++) {
            if(button[x].getText().equals("") || button[x].getText().length()<=0){
//                button[x].setEnabled(false);
                button[x].setVisible(false);
            }
        }
        l.setText(sdf.format(cal.getTime()));
        d.setTitle("Date Picker");
    }

    public String setPickedDate() {
        if (day.equals("")) {
            return day;
        }
        java.text.SimpleDateFormat sdf = new java.text.SimpleDateFormat("dd-MM-yyyy");
        java.util.Calendar cal = java.util.Calendar.getInstance();
        cal.set(year, month, Integer.parseInt(day));
        return sdf.format(cal.getTime());
    }
}
