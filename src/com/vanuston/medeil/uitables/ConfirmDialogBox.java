package com.vanuston.medeil.uitables;

import java.awt.*;
import javax.swing.*;

/**
 * Summary description for ConfirmDialogBox
 *
 */
public class ConfirmDialogBox extends JDialog {
    // Variables declaration

    private JLabel displayLabel;
    private JButton jButton1;
    private JButton jButton2;
    private JPanel contentPane;
    public static boolean staus;
    private String display_text = "Are You Sure to ";
    private String titleText;
    // End of variables declaration

    public ConfirmDialogBox(int n, String moduleName) {
        titleText = moduleName;
        if (n == 0) {
            display_text = "Are You Sure to Update?";
        } else if (n == 1) {
            display_text = "Are You Sure to Delete?";
        } else if(n == 2) {
            display_text = "Are You Sure to Cancel the bill?";
        } else if(n == 3) {
            display_text = "Are You Sure to reprint the bill?";
        }

        setModal(true);
        initializeComponent();
        this.setVisible(true);
    }

    public ConfirmDialogBox(int n, String moduleName, String msgtxt) {
        titleText = moduleName;
        if (n == 0) {
            display_text = msgtxt;
        }
        setModal(true);
        initializeComponent();
        this.setVisible(true);
    }

    private void initializeComponent() {
        displayLabel = new JLabel();
        jButton1 = new JButton();
        jButton2 = new JButton();
        contentPane = (JPanel) this.getContentPane();
        displayLabel.setFont(new java.awt.Font("Arial", 1, 12)); // NOI18N
        displayLabel.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/vanuston/medeil/ui/images/MsgConfirm.png"))); // NOI18N
        displayLabel.setText(display_text);
        displayLabel.setIconTextGap(15);

        jButton1.setFont(new java.awt.Font("Arial Rounded MT Bold", 1, 12)); // NOI18N
        jButton1.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/vanuston/medeil/ui/images/Apply.png"))); // NOI18N
        jButton1.setText("YES");

        jButton1.setMnemonic('Y');

        // jButton2
        jButton2.setFont(new java.awt.Font("Arial Rounded MT Bold", 1, 12)); // NOI18N
        jButton2.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/vanuston/medeil/ui/images/Cancel.png"))); // NOI18N
        jButton2.setMnemonic('N');
        jButton2.setText("NO");
        jButton1.addKeyListener(new java.awt.event.KeyAdapter() {

            @Override
            public void keyPressed(java.awt.event.KeyEvent evt) {
                jButton1KeyPressed(evt);
            }
        });
        jButton2.addKeyListener(new java.awt.event.KeyAdapter() {

            @Override
            public void keyPressed(java.awt.event.KeyEvent evt) {
                jButton2KeyPressed(evt);
            }
        });
        jButton1.addMouseListener(new java.awt.event.MouseAdapter() {

            @Override
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jButton1MouseClicked(evt);
            }
        });

        jButton2.addMouseListener(new java.awt.event.MouseAdapter() {

            @Override
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                jButton2MouseClicked(evt);
            }
        });

        //
        // contentPane
        //
        contentPane.setLayout(null);
        addComponent(contentPane, displayLabel, 33, 23, 300, 44);
        addComponent(contentPane, jButton1, 54, 95, 100, 30);
        addComponent(contentPane, jButton2, 179, 95, 100, 30);
        //
        // ConfirmDialogBox
        //
      //  setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        this.setTitle("Medeil Confirm Box -  ".concat(titleText));
        //  this.setLocation(new Point(65, 58));
        java.awt.Dimension screenSize = java.awt.Toolkit.getDefaultToolkit().getScreenSize();
        this.setLocation(new Point(((screenSize.width - 100) / 2 - 100), (screenSize.height / 2 - 100)));

        this.setSize(new Dimension(360, 170));
    }

    /** Add Component Without a Layout Manager (Absolute Positioning) */
    private void addComponent(Container container, Component c, int x, int y, int width, int height) {
        c.setBounds(x, y, width, height);
        container.add(c);
    }

    //
    // TODO: Add any appropriate code in the following Event Handling Methods
    //
    private void jButton1MouseClicked(java.awt.event.MouseEvent evt) {
        staus = true;
        this.dispose();
    }

    private void jButton2MouseClicked(java.awt.event.MouseEvent evt) {

        staus = false;
        this.dispose();
    }

    private void jButton2KeyPressed(java.awt.event.KeyEvent evt) {

        if (evt.getKeyCode() == 89) {
            staus = true;
            this.dispose();
        } else if (evt.getKeyCode() == 10 || evt.getKeyCode() == 78) {
            staus = false;
            this.dispose();
        }
        if (evt.getKeyCode() == 37 || evt
                .getKeyCode() == 39) {
            jButton1.requestFocus();
        }


    }

    private void jButton1KeyPressed(java.awt.event.KeyEvent evt) {
        if (evt.getKeyCode() == 78) {
            staus = false;
            this.dispose();
        } else if (evt.getKeyCode() == 10 || evt.getKeyCode() == 89) {
            staus = true;
            this.dispose();
        }
        if (evt.getKeyCode() == 37 || evt.getKeyCode() == 39) {
            jButton2.requestFocus();
        }
    }
    //
    // TODO: Add any method code to meet your needs in the following area
    //
//============================= Testing ================================//
//=                                                                    =//
//= The following main method is just for testing this class you built.=//
//= After testing,you may simply delete it.                            =//
//======================================================================//
}
