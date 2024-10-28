package com.vanuston.medeil.uitables;

import com.vanuston.medeil.model.DrugSpecificationModel;
import java.awt.*;
import java.awt.event.KeyAdapter;
import java.awt.event.KeyEvent;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Vector;
import javax.swing.*;
import javax.swing.table.DefaultTableCellRenderer;

/**
 * Summary description for ConfirmDialogBox
 *
 */
public class ConfirmDialogBox1 extends JDialog {
    // Variables declaration

    private JLabel displayLabel;
    private JButton jButton1;
    private JButton jButton2;
    private JPanel contentPane;
    public static boolean staus;
    private String display_text = "Are You Sure to ";
    private String titleText;
    private String detailMessage="";
    private JButton btnInteraction;
    private String itemName;
    java.awt.Dimension screenSize = java.awt.Toolkit.getDefaultToolkit().getScreenSize();
    private DrugSpecificationModel DrugModel;
    // End of variables declaration

    public ConfirmDialogBox1(int n, String moduleName) {
        titleText = moduleName;
        if (n == 0) {
            display_text = "Are You Sure to Update?";
        } else if (n == 1) {
            display_text = "Are You Sure to Delete?";
        } else if(n == 2) {
            display_text = "Are You Sure to Cancel the bill?";
        }
        setModal(true);
        initializeComponent();
        this.setVisible(true);
    }

    public ConfirmDialogBox1(int n, String moduleName, String msgtxt) {
        titleText = moduleName;
        if (n == 0) {
            display_text = msgtxt;
        }
        setModal(true);
        initializeComponent();
        this.setVisible(true);
    }

    public ConfirmDialogBox1(int n, String moduleName, String msgtxt,String detailMessage,String itemName,DrugSpecificationModel drugSpecificationModel) {
        this.detailMessage=detailMessage;
        this.itemName=itemName;
        this.DrugModel = drugSpecificationModel;
        titleText = moduleName;
        if (n == 0) {
            display_text = msgtxt;
        }
        setModal(true);
        initializeComponent();
        this.setVisible(true);        
    }

    private void initializeComponent() {
        if(!detailMessage.equals("")) {
        btnInteraction = new JButton("DETAILS");
        btnInteraction.setMnemonic('D');
        btnInteraction.addKeyListener(new java.awt.event.KeyAdapter() {

            @Override
            public void keyPressed(java.awt.event.KeyEvent evt) {
                btnInteractionKeyPressed(evt);
            }
        });
        btnInteraction.addMouseListener(new java.awt.event.MouseAdapter() {

            @Override
            public void mouseClicked(java.awt.event.MouseEvent evt) {
                btnInteractionMouseClicked(evt);
            }
        });
        }
        displayLabel = new JLabel();
        displayLabel.setFont(new java.awt.Font("Arial", 1, 12)); // NOI18N
        displayLabel.setIcon(new javax.swing.ImageIcon(getClass().getResource("/com/vanuston/medeil/ui/images/MsgConfirm.png"))); // NOI18N
        displayLabel.setText(display_text);
        displayLabel.setIconTextGap(15);
        jButton1 = new JButton();
        jButton2 = new JButton();
        contentPane = (JPanel) this.getContentPane();        

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
        if(!detailMessage.equals("")) {
        addComponent(contentPane, btnInteraction, 380, 95, 100, 30);
        }
        addComponent(contentPane, displayLabel, 33, 6, 450, 90);
        addComponent(contentPane, jButton1, 124, 95, 100, 30);
        addComponent(contentPane, jButton2, 249, 95, 100, 30);
        //
        // ConfirmDialogBox
        //
      //  setDefaultCloseOperation(javax.swing.WindowConstants.DISPOSE_ON_CLOSE);
        this.setTitle("Medeil Confirm Box -  ".concat(titleText));        //  this.setLocation(new Point(65, 58));        
        this.setLocation(new Point(((screenSize.width - 100) / 2 - 100), (screenSize.height / 2 - 100)));
        this.setSize(new Dimension(500, 170));
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

    private void btnInteractionKeyPressed(java.awt.event.KeyEvent evt) {
        if(evt.getKeyCode() == KeyEvent.VK_D || evt.getKeyCode() == KeyEvent.VK_ENTER) {
             displayDetailMessage ();
        }
        else if(evt.getKeyCode() == KeyEvent.VK_ESCAPE) {
            this.dispose();
        }
    }

    private void btnInteractionMouseClicked(java.awt.event.MouseEvent evt) {
              displayDetailMessage ();
    }

    private void displayDetailMessage () {
        final JDialog detailsDialog = new JDialog();
        JPanel detailsPanel = new JPanel();   
        detailsPanel.setLayout(null);

        //Create interaction details Table
        String colName[]={"GENERIC NAME", "INTERACTING GENERIC NAME", "INTERACTING BRAND NAME"};
        Class colType[]  = {java.lang.String.class, java.lang.String.class, java.lang.String.class};
        boolean colEditable[] = {false, false, false};
        JTable detailsTable = new JTable();
        JScrollPane detailsTablePane = new JScrollPane();
        Vector cols = new Vector();
        Vector data = new Vector();
            for (int i = 0; i < DrugModel.getDrugSpecificationModelList().size(); i++) {
                Vector c = new Vector();
                for (int j = 0; j < colName.length; j++) {
                    c.addElement(null);
                }
                data.addElement(c);
            }
            for (int n = 0; n < colName.length; n++) {
                cols.addElement(colName[n]);
            }
        detailsTable.getTableHeader().setFont(new Font("Arial", Font.BOLD, 14));
        ((DefaultTableCellRenderer)detailsTable.getTableHeader().getDefaultRenderer()).setHorizontalAlignment(JLabel.LEFT);
        SalesTableModel model = new SalesTableModel(data, cols, colType, colEditable);
        detailsTable.setModel(model);

        // Display text in interaction details table
        ArrayList DrugSpecificationList = new ArrayList();
        DrugSpecificationList = DrugModel.getDrugSpecificationModelList();
        DrugSpecificationModel dModel;
        for(int i=0; i < DrugSpecificationList.size();i++) {
            dModel = (DrugSpecificationModel) DrugSpecificationList.get(i);
            detailsTable.getModel().setValueAt(dModel.getGenericName(),i,0);
            detailsTable.getModel().setValueAt(dModel.getInteractingGenericName(),i,1);
            detailsTable.getModel().setValueAt(dModel.getItemName(),i,2);
        }
        detailsTablePane.add(detailsTable);        
        detailsTablePane.setViewportView(detailsTable);        
        
        // Add interaction effects in Text Area
        JTextArea detailstxtArea = new JTextArea(detailMessage);
        detailstxtArea.setOpaque(false);
        detailstxtArea.setLineWrap(true);
        detailstxtArea.setWrapStyleWord(true);
        detailstxtArea.setFont(new java.awt.Font("Arial", 1, 14));
        detailstxtArea.setEditable(false);            
        detailstxtArea.addKeyListener(new KeyAdapter() {

            @Override
            public void keyPressed(KeyEvent e) {
                if(e.getKeyCode()==KeyEvent.VK_ESCAPE) {
                    detailsDialog.dispose();
                }
            }
        });
        JScrollPane js = new JScrollPane();
        js.setBorder(BorderFactory.createTitledBorder("Interaction Effects"));
        js.setViewportView(detailstxtArea);
        JLabel itemLabel= new JLabel("BRAND NAME : "+itemName);
        itemLabel.setFont(new Font("Arial", Font.BOLD, 14));        
        
        // Add components in Dialog and customize dialog box
        addComponent(detailsPanel, itemLabel, 33, 6, 650, 15);
        addComponent(detailsPanel, detailsTablePane, 33, 26, 650, 150);
        addComponent(detailsPanel, js, 33, 180, 650, 280);
        detailstxtArea.requestFocusInWindow();
        detailsDialog.add(detailsPanel);
        detailsDialog.setLocation(new Point(((screenSize.width - 100) / 2 - 200), (screenSize.height / 2 - 200)));
        detailsDialog.setSize(new Dimension(700,500));
        detailsDialog.setFocusable(true);
        detailsDialog.setModal(true);
        detailsDialog.setTitle("Drug-Drug Interaction");
        detailsDialog.setVisible(true);
    }

    

    private void jButton2KeyPressed(java.awt.event.KeyEvent evt) {

        if (evt.getKeyCode() == 89) {
            staus = true;
            this.dispose();
        } else if (evt.getKeyCode() == 10 || evt.getKeyCode() == 78) {
            staus = false;
            this.dispose();
        }
        if (evt.getKeyCode() == 37 || evt.getKeyCode() == 39) {
            jButton1.requestFocus();
        }
        if(evt.getKeyCode() == KeyEvent.VK_D) {
            displayDetailMessage ();
        }
        if(evt.getKeyCode()==KeyEvent.VK_ESCAPE) {
            this.dispose();
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

        if(evt.getKeyCode() == KeyEvent.VK_D) {
            displayDetailMessage ();
        }
        if(evt.getKeyCode()==KeyEvent.VK_ESCAPE) {
            this.dispose();
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
