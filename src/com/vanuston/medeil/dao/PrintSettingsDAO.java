/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.dao;

import com.vanuston.medeil.implementation.PrintSettings;
import com.vanuston.medeil.model.BarcodePrinterModel;
import com.vanuston.medeil.util.DBConnection;
import com.vanuston.medeil.util.Logger;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Administrator
 */
public class PrintSettingsDAO implements PrintSettings {

Logger log = Logger.getLogger(PrintSettingsDAO.class, "com.vanuston.medeil.dao.PrintSettingsDAO");
@Override
    public Object viewRecord(Object object) {
        BarcodePrinterModel model = (BarcodePrinterModel) object;
        List<BarcodePrinterModel> list = new ArrayList<BarcodePrinterModel>();
        ResultSet rs = null;
        try {
            rs = DBConnection.getStatement().executeQuery("select * from label_print_settings");
            while (rs.next()) {
                    model = new BarcodePrinterModel();
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
            String msg = "Class:PrintSettingsDAO Method:viewRecord() Exception:"+e.getMessage();
            log.debug(msg);
        }
        return list;
    }

    @Override
    public boolean deleteRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Object createRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

    @Override
    public Object updateRecord(Object object) {
        throw new UnsupportedOperationException("Not supported yet.");
    }

}
