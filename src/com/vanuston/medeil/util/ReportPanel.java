/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.util;
import java.awt.Color;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JComponent;
import net.sf.jasperreports.engine.JasperFillManager;
import net.sf.jasperreports.engine.JasperPrint;
import net.sf.jasperreports.engine.JasperReport;
import net.sf.jasperreports.engine.util.JRLoader;
/*import net.sf.jasperreports.view.JRViewer;
import net.sf.jasperreports.view.JRSaveContributor;*/
import net.sf.jasperreports.view.JRSaveContributor;
/**
 *
 * @author vanuston
 */
public final class ReportPanel {

    String path = null;
    HashMap param1;
    int c1 = 224;
    JRViewer jrv = null;
    private final String       PDF                       = "PDF (*.pdf)";
    private final String       RTF                       = "RTF (*.rtf)";
    

    private final List<String> PERMITTED_FILE_TYPES_LIST = Arrays.asList(PDF, RTF);

    public JComponent loadReportView(String fName ){

        try {
        path = new File(".").getCanonicalFile().toString();
        String reportSource = path + fName;
        JasperReport report = (JasperReport) JRLoader.loadObject(reportSource);
        JasperPrint jasperPrint = JasperFillManager.fillReport(report, new HashMap(), DBConnection.getStatement().getConnection());
        jrv = new JRViewer(jasperPrint);

        List<JRSaveContributor> saveOptions = Arrays.asList(jrv.getSaveContributors());
        Iterator<JRSaveContributor> i = saveOptions.iterator();

        while (i.hasNext()) {
            JRSaveContributor jsc = i.next();
            if (PERMITTED_FILE_TYPES_LIST.contains(jsc.getDescription())) {
               continue;
            } else
                jrv.removeSaveContributor(jsc);
        }


        jrv.setOpaque(false);
        jrv.setBackground(new Color(0,true));
        return jrv;
          } catch (Exception ex) {
            Logger.getLogger(ReportPanel.class.getName()).log(Level.SEVERE, null, ex);
        }
       return jrv;
    }
    public void setZoom(float s){
        if(jrv!=null)
        {
            jrv.setZoomRatio(s);            
        }
    }
    public JComponent loadReportView(String fName,HashMap param){
        try {
        path = new File(".").getCanonicalFile().toString();
        String reportSource = path + fName;
        param1=param;
        JasperReport report = (JasperReport) JRLoader.loadObject(reportSource);
        JasperPrint jasperPrint = JasperFillManager.fillReport(report, param, DBConnection.getStatement().getConnection());
        jrv = new JRViewer(jasperPrint);
        return jrv;

          } catch (Exception ex) {
            Logger.getLogger(ReportPanel.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    
}
