/*
 *   PROBILZ – Retail Management System (RMS) To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.dao;

import com.vanuston.medeil.implementation.LabelPrint;
import com.vanuston.medeil.model.LabelPrinterModel;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;
import java.rmi.RemoteException;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Silambarasan
 */
public class LabelPrintSettingsDAO implements LabelPrint  {

    @Override
    public Object createRecord(Object object) throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    Logger log = Logger.getLogger(LabelPrintSettingsDAO.class, "com.vanuston.medeil.dao.LabelPrintSettingsDAO");

    @Override
    public Object viewRecord(Object object) {
        LabelPrinterModel model = (LabelPrinterModel) object;
        List<LabelPrinterModel> list = new ArrayList<LabelPrinterModel>();
        ResultSet rs = null;
        int i =0;
        try {
            rs = DBConnection.getStatement().executeQuery("select * from label_print_settings");
            while (rs.next()) {
                System.out.println("i:"+i++);
                    model = new LabelPrinterModel();
                    model.setLabelWidth(rs.getString("width"));
                    model.setLabelHeight(rs.getString("height"));
                    model.setPrintSpeed(rs.getString("speed"));
                    model.setDensity(rs.getString("density"));
                    model.setSensor(rs.getString("sensor"));
                    model.setVerticalGap(rs.getString("vertical_gap"));
                    model.setShiftOffset(rs.getString("shift_offset"));
                    model.setxPoint(rs.getString("font_xstart_point"));
                    model.setyPoint(rs.getString("font_ystart_point"));
                    model.setRotation(rs.getString("font_rotation"));
                    model.setxMagnify(rs.getString("x_magnify"));
                    model.setyMagnify(rs.getString("y_magnify"));
                    model.setBarType(rs.getString("barcode_type"));
                    model.setBarHeight(rs.getString("barcode_height_point"));
                    model.setHumanInterprate(rs.getString("human_interprate"));
                    model.setNarrowRatio1(rs.getString("narrowbar_ratio1"));
                    model.setNarrowRatio2(rs.getString("narrowbar_ratio2"));
                    model.setPrintSet(rs.getInt("labelset"));
                    model.setPrintCopies(rs.getInt("print_copies"));
                    model.setFontType(rs.getString("font_type"));
                    model.setContent(rs.getString("content"));
                    model.setBarLineX(rs.getDouble("bar_x"));
                    model.setBarLineY(rs.getDouble("bar_y"));
                    model.setBarLineWidth(rs.getDouble("bar_width"));
                    model.setBarLineHeight(rs.getDouble("bar_height"));
                    list.add(model);
                }
        } catch (Exception e) {
            String msg = "Class:LabelPrintSettingsDAO Method:viewRecord() Exception:"+e.getMessage();
            log.debug(msg);
        }
        return list;
    }

    @Override
    public Object updateRecord(Object object) throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public boolean deleteRecord(Object object) throws RemoteException {
        throw new UnsupportedOperationException("Not supported yet.");
    }

}
