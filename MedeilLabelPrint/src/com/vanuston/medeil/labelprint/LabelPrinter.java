/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package com.vanuston.medeil.labelprint;

/**
 *
 * @author saran
 */
import com.sun.jna.Library;
import com.sun.jna.Native;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.LabelPrint;
import com.vanuston.medeil.model.LabelPrinterModel;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import java.security.AccessController;
import java.security.PrivilegedAction;
import java.text.SimpleDateFormat;
import java.util.List;

public class LabelPrinter {

    static Logger log = Logger.getLogger(LabelPrinter.class, "LabelPrinter");

    public interface TscLibDll extends Library {

        TscLibDll INSTANCE = (TscLibDll) AccessController.doPrivileged(new PrivilegedAction() {

            public Object run() {
                Object obj = null;
                try {
                    System.out.println("TscLibDll interface");
                    obj = Native.loadLibrary("TSCLIB", TscLibDll.class);
                } catch (UnsatisfiedLinkError e) {
                    log.debug("Error Loading TSCLIB Interface:TscLibDll Exception:" + e.getMessage());
                }
                return obj;
            }
        });
//        TscLibDll INSTANCE = (TscLibDll) Native.loadLibrary ("TSCLIB", TscLibDll.class);

        int about();

        int openport(String pirnterName);

        int closeport();

        int sendcommand(String printerCommand);

        int setup(String width, String height, String speed, String density, String sensor, String vertical, String offset);

        int downloadpcx(String filename, String image_name);

        int barcode(String x, String y, String type, String height, String readable, String rotation, String narrow, String wide, String code);

        int printerfont(String x, String y, String fonttype, String rotation, String xmul, String ymul, String text);

        int clearbuffer();

        int printlabel(String set, String copy);

        int formfeed();

        int nobackfeed();

        int windowsfont(int x, int y, int fontheight, int rotation, int fontstyle, int fontunderline, String szFaceName, String content);
    }

    public Boolean sendToPrinter(LabelPrinterModel model) {
        System.out.println("sendToPrinter");
        System.out.println("sendToTVSPrinter");
        int labelPerRow = 1;
        Boolean isPrint = false;
        try {
            LabelPrint printController = (LabelPrint) RegistryFactory.getClientStub(RegistryConstants.LabelPrin);
            List<LabelPrinterModel> list = (List<LabelPrinterModel>) printController.viewRecord(model);
            labelPerRow = model.getPrintSet();

            LabelPrinterModel RX = list.get(0);
            LabelPrinterModel shopName = list.get(1);
            LabelPrinterModel shopAddress = list.get(2);
            LabelPrinterModel shopPhoneNo = list.get(3);
            LabelPrinterModel prescriptionNo = list.get(4);
            LabelPrinterModel doctorName = list.get(5);
            LabelPrinterModel doctorSign = list.get(6);
            LabelPrinterModel patientName = list.get(7);
            LabelPrinterModel patientAge = list.get(8);
            LabelPrinterModel patientSex = list.get(9);
            //LabelPrinterModel barCode = list.get(10);
            //LabelPrinterModel barCodeFont = list.get(11);
            LabelPrinterModel productName = list.get(10);
            LabelPrinterModel morning = list.get(11);
            LabelPrinterModel afterNoon = list.get(12);
            LabelPrinterModel evening = list.get(13);
            LabelPrinterModel night = list.get(14);
            LabelPrinterModel federal_caution = list.get(15);
            LabelPrinterModel drug_caution = list.get(16);
            LabelPrinterModel qty = list.get(17);
            LabelPrinterModel drug_filled_on = list.get(18);
            LabelPrinterModel drug_discarded_on = list.get(19);


            String printerName = "Bar Code Printer 3300";
            printerName = model.getPrinter();
            TscLibDll.INSTANCE.openport(printerName);
            TscLibDll.INSTANCE.sendcommand("REM ***** This is a test by JAVA. *****");
            TscLibDll.INSTANCE.setup(RX.getLabelWidth(), RX.getLabelHeight(), RX.getPrintSpeed(), RX.getDensity(), RX.getSensor(), RX.getVerticalGap(), RX.getShiftOffset());
            TscLibDll.INSTANCE.clearbuffer();
            if (labelPerRow == 1) {
                TscLibDll.INSTANCE.printerfont(RX.getxPoint(), RX.getyPoint(), RX.getFontType(), RX.getRotation(), RX.getxMagnify(), RX.getyMagnify(), LabelPrinterModel.RX);
                System.out.println("RX.getxPoint(): " + LabelPrinterModel.RX);
                TscLibDll.INSTANCE.printerfont(shopName.getxPoint(), shopName.getyPoint(), shopName.getFontType(), shopName.getRotation(), shopName.getxMagnify(), shopName.getyMagnify(), model.getShopName());
                System.out.println("shopName.getxPoint(): " + model.getShopName());
                TscLibDll.INSTANCE.printerfont(shopAddress.getxPoint(), shopAddress.getyPoint(), shopAddress.getFontType(), shopAddress.getRotation(), shopAddress.getxMagnify(), shopAddress.getyMagnify(), model.getShopAddress1());
                System.out.println("shopAddress.getxPoint(): " + model.getShopAddress1());
                TscLibDll.INSTANCE.printerfont(shopPhoneNo.getxPoint(), shopPhoneNo.getyPoint(), shopPhoneNo.getFontType(), shopPhoneNo.getRotation(), shopPhoneNo.getxMagnify(), shopPhoneNo.getyMagnify(), model.getShopMobilNo());
                System.out.println("shopPhoneNo.getxPoint(): " + model.getShopMobilNo());
                TscLibDll.INSTANCE.printerfont(prescriptionNo.getxPoint(), prescriptionNo.getyPoint(), prescriptionNo.getFontType(), prescriptionNo.getRotation(), prescriptionNo.getxMagnify(), prescriptionNo.getyMagnify(), "Rx.No: " + model.getPrescreptionNO().toString());
                System.out.println("prescriptionNo.getxPoint(): " + model.getPrescreptionNO().toString());
                TscLibDll.INSTANCE.printerfont(doctorName.getxPoint(), doctorName.getyPoint(), doctorName.getFontType(), doctorName.getRotation(), doctorName.getxMagnify(), doctorName.getyMagnify(), "Doctor Name : Test name"); //model.getDoctorName()
                System.out.println("doctorName.getxPoint(): " + model.getDoctorName());
                TscLibDll.INSTANCE.printerfont(doctorSign.getxPoint(), doctorSign.getyPoint(), doctorSign.getFontType(), doctorSign.getRotation(), doctorSign.getxMagnify(), doctorSign.getyMagnify(), "Pharmacist Sign : Test sign");//model.getDoctorName()
                System.out.println("doctorSign.getxPoint(): " + model.getDoctorName());
                TscLibDll.INSTANCE.printerfont(patientName.getxPoint(), patientName.getyPoint(), patientName.getFontType(), patientName.getRotation(), patientName.getxMagnify(), patientName.getyMagnify(), "Name of Patient: " + model.getCustomerName());
                System.out.println("patientName.getxPoint(): " + model.getCustomerName());
                TscLibDll.INSTANCE.printerfont(patientAge.getxPoint(), patientAge.getyPoint(), patientAge.getFontType(), patientAge.getRotation(), patientAge.getxMagnify(), patientAge.getyMagnify(), "Age: " + model.getAge());
                System.out.println("patientAge.getxPoint(): " + model.getAge());
                TscLibDll.INSTANCE.printerfont(patientSex.getxPoint(), patientSex.getyPoint(), patientSex.getFontType(), patientSex.getRotation(), patientSex.getxMagnify(), patientSex.getyMagnify(), "Gender: " + model.getSex());
                System.out.println("patientSex.getxPoint(): " + model.getSex());
//                    TscLibDll.INSTANCE.barcode(barCode.getxPoint(), barCode.getyPoint(), barCode.getBarType(), barCode.getBarHeight(), barCode.getHumanInterprate(), barCode.getRotation(), barCode.getNarrowRatio1(), barCode.getNarrowRatio2(), "!104" + model.getProductCode());
//                    System.out.println("barCode.getxPoint(): "+model.getProductCode());
//                    TscLibDll.INSTANCE.printerfont(barCodeFont.getxPoint(), barCodeFont.getyPoint(), barCodeFont.getFontType(), barCodeFont.getRotation(), barCodeFont.getxMagnify(), barCodeFont.getyMagnify(), model.getProductCode());
//                    System.out.println("barCodeFont.getxPoint(): "+model.getProductCode());
                TscLibDll.INSTANCE.printerfont(productName.getxPoint(), productName.getyPoint(), productName.getFontType(), productName.getRotation(), productName.getxMagnify(), productName.getyMagnify(), "Drug Name: " + model.getProductName());
                System.out.println("productName.getxPoint(): " + model.getProductName());
                TscLibDll.INSTANCE.printerfont(morning.getxPoint(), morning.getyPoint(), morning.getFontType(), morning.getRotation(), morning.getxMagnify(), morning.getyMagnify(), "M: " + model.getMorning());
                System.out.println("morning.getxPoint(): " + model.getMorning());
                TscLibDll.INSTANCE.printerfont(afterNoon.getxPoint(), afterNoon.getyPoint(), afterNoon.getFontType(), afterNoon.getRotation(), afterNoon.getxMagnify(), afterNoon.getyMagnify(), "A: " + model.getNoon());
                System.out.println("afterNoon.getxPoint(): " + model.getNoon());
                TscLibDll.INSTANCE.printerfont(evening.getxPoint(), evening.getyPoint(), evening.getFontType(), evening.getRotation(), evening.getxMagnify(), evening.getyMagnify(), "E: " + model.getEvening());
                System.out.println("evening.getxPoint(): " + model.getEvening());
                TscLibDll.INSTANCE.printerfont(night.getxPoint(), night.getyPoint(), night.getFontType(), night.getRotation(), night.getxMagnify(), night.getyMagnify(), "N: " + model.getNight());
                System.out.println("night.getxPoint(): " + model.getNight());
                TscLibDll.INSTANCE.printerfont(federal_caution.getxPoint(), federal_caution.getyPoint(), federal_caution.getFontType(), federal_caution.getRotation(), federal_caution.getxMagnify(), federal_caution.getyMagnify(), model.getFederalCaution());
                TscLibDll.INSTANCE.printerfont(drug_caution.getxPoint(), drug_caution.getyPoint(), drug_caution.getFontType(), drug_caution.getRotation(), drug_caution.getxMagnify(), drug_caution.getyMagnify(), model.getDrugCaution());
                TscLibDll.INSTANCE.printerfont(qty.getxPoint(), qty.getyPoint(), qty.getFontType(), qty.getRotation(), qty.getxMagnify(), qty.getyMagnify(), "QTY: " + model.getQTY());
                TscLibDll.INSTANCE.printerfont(drug_filled_on.getxPoint(), drug_filled_on.getyPoint(), drug_filled_on.getFontType(), drug_filled_on.getRotation(), drug_filled_on.getxMagnify(), drug_filled_on.getyMagnify(), "Filled On: " + model.getProductPacked());
                TscLibDll.INSTANCE.printerfont(drug_discarded_on.getxPoint(), drug_discarded_on.getyPoint(), drug_discarded_on.getFontType(), drug_discarded_on.getRotation(), drug_discarded_on.getxMagnify(), drug_discarded_on.getyMagnify(), "Discard Before: " + model.getBestBeforeOn());
            }
            TscLibDll.INSTANCE.printlabel(1 + "", model.getPrintCopies() + "");
            System.out.println("model.getPrintCopies(): " + model.getPrintCopies());
            TscLibDll.INSTANCE.closeport();
            isPrint = true;
            System.out.println("THE END");
        } catch (Exception e) {
            log.debug("Class: LabelPrinter  Method:sendToPrinter Exception:" + e.getMessage());
            e.printStackTrace();
        }
        return isPrint;
    }

    public static void main(String[] args) {
//        LabelPrinter bp = new LabelPrinter();
//        LabelPrinterModel model = new LabelPrinterModel();
//        model.setPrintCopies(1);
//        model.setPrintSet(3);
//        model.setEnableRX(true);
//        model.setEnableProductName(true);
//        model.setEnableSellingPrice(true);
//        model.setEnableProductPacked(false);
//        model.setProductCode("RAR1003");
//        model.setProductMrp("50.00");
//        model.setSellingPrice("48.00");
//        model.setProductName("Sun dth");
//        model.setProductPacked("pkd 04/12/12");
//        model.setRX("SARA CASUALS");
//        bp.sendToPrinter(model);
    }
}
