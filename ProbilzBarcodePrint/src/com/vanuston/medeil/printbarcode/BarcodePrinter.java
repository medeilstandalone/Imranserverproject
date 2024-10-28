/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.printbarcode;

/**
 *
 * @author saran
 */
//import com.sun.jna.Library;
//import com.sun.jna.Native;
import com.sun.jna.Library;
import com.sun.jna.Native;
import com.vanuston.medeil.client.RegistryFactory;
import com.vanuston.medeil.implementation.PrintSettings;
import com.vanuston.medeil.model.BarcodePrinterModel;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import java.security.AccessController;
import java.security.PrivilegedAction;
import java.text.SimpleDateFormat;
import java.util.List;

public class BarcodePrinter {
    static Logger log = Logger.getLogger(BarcodePrinter.class, "BarcodePrinter");

    public interface TscLibDll extends Library {
        TscLibDll INSTANCE = (TscLibDll) AccessController.doPrivileged(new PrivilegedAction () {
            public Object run() {
                Object obj = null;
                try {
                    obj = Native.loadLibrary ("TSCLIB", TscLibDll.class);
                } catch(UnsatisfiedLinkError e){
                    log.debug("Error Loading TSCLIB Interface:TscLibDll Exception:"+e.getMessage());
                }
                return obj;
            }
        } );
//        TscLibDll INSTANCE = (TscLibDll) Native.loadLibrary ("TSCLIB", TscLibDll.class);
        int about();
        int openport (String pirnterName);
        int closeport ();
        int sendcommand (String printerCommand);
        int setup (String width,String height,String speed,String density,String sensor,String vertical,String offset);
        int downloadpcx (String filename,String image_name);
        int barcode (String x,String y,String type,String height,String readable,String rotation,String narrow,String wide,String code);
        int printerfont (String x,String y,String fonttype,String rotation,String xmul,String ymul,String text);
        int clearbuffer ();
        int printlabel (String set, String copy);
        int formfeed ();
        int nobackfeed ();
        int windowsfont (int x, int y, int fontheight, int rotation, int fontstyle, int fontunderline, String szFaceName, String content);
    }

    public Boolean sendToPrinter(BarcodePrinterModel model) {
        int labelPerRow = 1;
        Boolean isPrint = false;
        try {
            PrintSettings printController = (PrintSettings) RegistryFactory.getClientStub(RegistryConstants.PrintSettings) ;
            List<BarcodePrinterModel> list = (List<BarcodePrinterModel>) printController.viewRecord(model);
            labelPerRow = model.getPrintSet();
            //First label
            BarcodePrinterModel ShopLbl1 = list.get(0);
            BarcodePrinterModel BarLbl1 = list.get(1);
            BarcodePrinterModel BarFontLbl1 = list.get(2);
            BarcodePrinterModel PdtLbl1 = list.get(3);
            BarcodePrinterModel MrpLbl1 = list.get(4);
            BarcodePrinterModel SaleRateLbl1 = list.get(5);

            //Second label
            BarcodePrinterModel ShopLbl2 = list.get(6);
            BarcodePrinterModel BarLbl2 = list.get(7);
            BarcodePrinterModel BarFontLbl2 = list.get(8);
            BarcodePrinterModel PdtLbl2 = list.get(9);
            BarcodePrinterModel MrpLbl2 = list.get(10);
            BarcodePrinterModel SaleRateLbl2 = list.get(11);
            //Third Label
            BarcodePrinterModel ShopLbl3 = list.get(12);
            BarcodePrinterModel BarLbl3 = list.get(13);
            BarcodePrinterModel BarFontLbl3 = list.get(14);
            BarcodePrinterModel PdtLbl3 = list.get(15);
            BarcodePrinterModel MrpLbl3 = list.get(16);
            BarcodePrinterModel SaleRateLbl3 = list.get(17);
            //Fourth Label
//            BarcodePrinterModel ShopLbl4 = list.get(18);
//            BarcodePrinterModel BarLbl4 = list.get(19);
//            BarcodePrinterModel BarFontLbl4 = list.get(20);
//            BarcodePrinterModel PdtLbl4 = list.get(21);
//            BarcodePrinterModel MrpLbl4 = list.get(22);
//            BarcodePrinterModel SaleRateLbl4 = list.get(23);


            //TscLibDll.INSTANCE.about();
            String printerName = "Honeywell PC42t plus (203 dpi)";
//            String printerName = "Bar Code Printer T-9650 Plus";
//            String printerName = "Bar Code Printer TT033-50";
//            String printerName = "Seagull Zebra TLP2844";
            printerName=model.getPrinter();
            TscLibDll.INSTANCE.openport(printerName);
            //TscLibDll.INSTANCE.downloadpcx("C:\\UL.PCX", "UL.PCX");
            TscLibDll.INSTANCE.sendcommand("REM ***** This is a test by JAVA. *****");
//            TscLibDll.INSTANCE.setup("102.5", "20", "3", "11", "3", "3", "0");
            TscLibDll.INSTANCE.setup(ShopLbl1.getLabelWidth(), ShopLbl1.getLabelHeight(), ShopLbl1.getPrintSpeed(), ShopLbl1.getDensity(), ShopLbl1.getSensor(), ShopLbl1.getVerticalGap(), ShopLbl1.getShiftOffset());
            TscLibDll.INSTANCE.clearbuffer();
            //Shop Name 22mm=165 /1mm=7.5
//            model.setShopName("GANESH");
            if (model.getEnableShopName()) {
                if(labelPerRow==3) {
                    TscLibDll.INSTANCE.printerfont(ShopLbl1.getxPoint(), ShopLbl1.getyPoint(), ShopLbl1.getFontType(), ShopLbl1.getRotation(), ShopLbl1.getxMagnify(), ShopLbl1.getyMagnify(), model.getShopName());
                    TscLibDll.INSTANCE.printerfont(ShopLbl2.getxPoint(), ShopLbl2.getyPoint(), ShopLbl2.getFontType(), ShopLbl2.getRotation(), ShopLbl2.getxMagnify(), ShopLbl2.getyMagnify(), model.getShopName());
                    TscLibDll.INSTANCE.printerfont(ShopLbl3.getxPoint(), ShopLbl3.getyPoint(), ShopLbl3.getFontType(), ShopLbl3.getRotation(), ShopLbl3.getxMagnify(), ShopLbl3.getyMagnify(), model.getShopName());

            }
//                else if (labelPerRow == 4) {
//                    TscLibDll.INSTANCE.printerfont(ShopLbl1.getxPoint(), ShopLbl1.getyPoint(), ShopLbl1.getFontType(), ShopLbl1.getRotation(), ShopLbl1.getxMagnify(), ShopLbl1.getyMagnify(), model.getShopName());
//                    TscLibDll.INSTANCE.printerfont(ShopLbl2.getxPoint(), ShopLbl2.getyPoint(), ShopLbl2.getFontType(), ShopLbl2.getRotation(), ShopLbl2.getxMagnify(), ShopLbl2.getyMagnify(), model.getShopName());
//                    TscLibDll.INSTANCE.printerfont(ShopLbl3.getxPoint(), ShopLbl3.getyPoint(), ShopLbl3.getFontType(), ShopLbl3.getRotation(), ShopLbl3.getxMagnify(), ShopLbl3.getyMagnify(), model.getShopName());
//                    TscLibDll.INSTANCE.printerfont(ShopLbl4.getxPoint(), ShopLbl4.getyPoint(), ShopLbl4.getFontType(), ShopLbl4.getRotation(), ShopLbl4.getxMagnify(), ShopLbl4.getyMagnify(), model.getShopName());
//            }
            else if (labelPerRow == 2) {
                    TscLibDll.INSTANCE.printerfont(ShopLbl1.getxPoint(), ShopLbl1.getyPoint(), ShopLbl1.getFontType(), ShopLbl1.getRotation(), ShopLbl1.getxMagnify(), ShopLbl1.getyMagnify(), model.getShopName());
                    TscLibDll.INSTANCE.printerfont(ShopLbl2.getxPoint(), ShopLbl2.getyPoint(), ShopLbl2.getFontType(), ShopLbl2.getRotation(), ShopLbl2.getxMagnify(), ShopLbl2.getyMagnify(), model.getShopName());
                } else if(labelPerRow==1) {
                    TscLibDll.INSTANCE.printerfont(ShopLbl1.getxPoint(), ShopLbl1.getyPoint(), ShopLbl1.getFontType(), ShopLbl1.getRotation(), ShopLbl1.getxMagnify(), ShopLbl1.getyMagnify(), model.getShopName());
                }

//                TscLibDll.INSTANCE.printerfont("762", shopNameYPnt, "0", rotation, "5", "6", model.getShopName());
//                TscLibDll.INSTANCE.printerfont("489", shopNameYPnt, "0", rotation, "5", "6", model.getShopName());
//                TscLibDll.INSTANCE.printerfont("216", shopNameYPnt, "0", rotation, "5", "6", model.getShopName());
            }
            //Packing Product Name
            if (model.getEnableProductName()) {
                if(labelPerRow==3) {
                    TscLibDll.INSTANCE.printerfont(PdtLbl1.getxPoint(), PdtLbl1.getyPoint(), PdtLbl1.getFontType(), PdtLbl1.getRotation(), PdtLbl1.getxMagnify(), PdtLbl1.getyMagnify(), model.getProductName());
                    TscLibDll.INSTANCE.printerfont(PdtLbl2.getxPoint(), PdtLbl2.getyPoint(), PdtLbl2.getFontType(), PdtLbl2.getRotation(), PdtLbl2.getxMagnify(), PdtLbl2.getyMagnify(), model.getProductName());
                    TscLibDll.INSTANCE.printerfont(PdtLbl3.getxPoint(), PdtLbl3.getyPoint(), PdtLbl3.getFontType(), PdtLbl3.getRotation(), PdtLbl3.getxMagnify(), PdtLbl3.getyMagnify(), model.getProductName());
                }
//                else if(labelPerRow == 4) {
//                    TscLibDll.INSTANCE.printerfont(PdtLbl1.getxPoint(), PdtLbl1.getyPoint(), PdtLbl1.getFontType(), PdtLbl1.getRotation(), PdtLbl1.getxMagnify(), PdtLbl1.getyMagnify(), model.getProductName());
//                    TscLibDll.INSTANCE.printerfont(PdtLbl2.getxPoint(), PdtLbl2.getyPoint(), PdtLbl2.getFontType(), PdtLbl2.getRotation(), PdtLbl2.getxMagnify(), PdtLbl2.getyMagnify(), model.getProductName());
//                    TscLibDll.INSTANCE.printerfont(PdtLbl3.getxPoint(), PdtLbl3.getyPoint(), PdtLbl3.getFontType(), PdtLbl3.getRotation(), PdtLbl3.getxMagnify(), PdtLbl3.getyMagnify(), model.getProductName());
//                    TscLibDll.INSTANCE.printerfont(PdtLbl4.getxPoint(), PdtLbl4.getyPoint(), PdtLbl4.getFontType(), PdtLbl4.getRotation(), PdtLbl4.getxMagnify(), PdtLbl4.getyMagnify(), model.getProductName());
//                }
                else if(labelPerRow==2) {
                    TscLibDll.INSTANCE.printerfont(PdtLbl1.getxPoint(), PdtLbl1.getyPoint(), PdtLbl1.getFontType(), PdtLbl1.getRotation(), PdtLbl1.getxMagnify(), PdtLbl1.getyMagnify(), model.getProductName());
                    TscLibDll.INSTANCE.printerfont(PdtLbl2.getxPoint(), PdtLbl2.getyPoint(), PdtLbl2.getFontType(), PdtLbl2.getRotation(), PdtLbl2.getxMagnify(), PdtLbl2.getyMagnify(), model.getProductName());
                }else if(labelPerRow==1) {
                    TscLibDll.INSTANCE.printerfont(PdtLbl1.getxPoint(), PdtLbl1.getyPoint(), PdtLbl1.getFontType(), PdtLbl1.getRotation(), PdtLbl1.getxMagnify(), PdtLbl1.getyMagnify(), model.getProductName());
                }

//                TscLibDll.INSTANCE.printerfont("746", pdtNameYPnt, "ROMAN.TTF", rotation, "1", "7", model.getProductName());
//                TscLibDll.INSTANCE.printerfont("473", pdtNameYPnt, "ROMAN.TTF", rotation, "1", "7", model.getProductName());
//                TscLibDll.INSTANCE.printerfont("200", pdtNameYPnt, "ROMAN.TTF", rotation, "1", "7", model.getProductName());
            }
            //Product MRP
            if (model.getEnableProductMrp()) {
                model.setProductMrp(MrpLbl1.getContent() + model.getProductMrp());
                if(labelPerRow==3) {
                    TscLibDll.INSTANCE.printerfont(MrpLbl1.getxPoint(), MrpLbl1.getyPoint(), MrpLbl1.getFontType(), MrpLbl1.getRotation(), MrpLbl1.getxMagnify(), MrpLbl1.getyMagnify(), model.getProductMrp());
                    TscLibDll.INSTANCE.printerfont(MrpLbl2.getxPoint(), MrpLbl2.getyPoint(), MrpLbl2.getFontType(), MrpLbl2.getRotation(), MrpLbl2.getxMagnify(), MrpLbl2.getyMagnify(), model.getProductMrp());
                    TscLibDll.INSTANCE.printerfont(MrpLbl3.getxPoint(), MrpLbl3.getyPoint(), MrpLbl3.getFontType(), MrpLbl3.getRotation(), MrpLbl3.getxMagnify(), MrpLbl3.getyMagnify(), model.getProductMrp());
                }
//                else if (labelPerRow == 4) {
//                    TscLibDll.INSTANCE.printerfont(MrpLbl1.getxPoint(), MrpLbl1.getyPoint(), MrpLbl1.getFontType(), MrpLbl1.getRotation(), MrpLbl1.getxMagnify(), MrpLbl1.getyMagnify(), model.getProductMrp());
//                    TscLibDll.INSTANCE.printerfont(MrpLbl2.getxPoint(), MrpLbl2.getyPoint(), MrpLbl2.getFontType(), MrpLbl2.getRotation(), MrpLbl2.getxMagnify(), MrpLbl2.getyMagnify(), model.getProductMrp());
//                    TscLibDll.INSTANCE.printerfont(MrpLbl3.getxPoint(), MrpLbl3.getyPoint(), MrpLbl3.getFontType(), MrpLbl3.getRotation(), MrpLbl3.getxMagnify(), MrpLbl3.getyMagnify(), model.getProductMrp());
//                    TscLibDll.INSTANCE.printerfont(MrpLbl4.getxPoint(), MrpLbl4.getyPoint(), MrpLbl4.getFontType(), MrpLbl4.getRotation(), MrpLbl4.getxMagnify(), MrpLbl4.getyMagnify(), model.getProductMrp());
//                }
                else if (labelPerRow == 2) {
                    TscLibDll.INSTANCE.printerfont(MrpLbl1.getxPoint(), MrpLbl1.getyPoint(), MrpLbl1.getFontType(), MrpLbl1.getRotation(), MrpLbl1.getxMagnify(), MrpLbl1.getyMagnify(), model.getProductMrp());
                    TscLibDll.INSTANCE.printerfont(MrpLbl2.getxPoint(), MrpLbl2.getyPoint(), MrpLbl2.getFontType(), MrpLbl2.getRotation(), MrpLbl2.getxMagnify(), MrpLbl2.getyMagnify(), model.getProductMrp());
                } else if(labelPerRow==1) {
                    TscLibDll.INSTANCE.printerfont(MrpLbl1.getxPoint(), MrpLbl1.getyPoint(), MrpLbl1.getFontType(), MrpLbl1.getRotation(), MrpLbl1.getxMagnify(), MrpLbl1.getyMagnify(), model.getProductMrp());
                }

                //for Strike Line
                if(model.getEnableSellingPrice()) {
                    if(labelPerRow==3) {
                        MrpLbl1.setBarLineWidth( model.getProductMrp().length() * MrpLbl1.getBarLineWidth());
                        MrpLbl2.setBarLineWidth( model.getProductMrp().length() * MrpLbl2.getBarLineWidth());
                        MrpLbl3.setBarLineWidth( model.getProductMrp().length() * MrpLbl3.getBarLineWidth());

                        //PMR GUDUR
                        TscLibDll.INSTANCE.sendcommand("BAR "+ MrpLbl1.getBarLineX() +", "+MrpLbl1.getBarLineY()+", "+ MrpLbl1.getBarLineWidth()+", "+MrpLbl1.getBarLineHeight() );
                        TscLibDll.INSTANCE.sendcommand("BAR "+ MrpLbl2.getBarLineX()+", "+MrpLbl2.getBarLineY()+", "+ MrpLbl2.getBarLineWidth()+", "+MrpLbl2.getBarLineHeight() );
                        TscLibDll.INSTANCE.sendcommand("BAR "+ MrpLbl3.getBarLineX()+", "+MrpLbl3.getBarLineY()+", "+ MrpLbl3.getBarLineWidth()+", "+MrpLbl3.getBarLineHeight() );
                    }
//                    else if(labelPerRow == 4) {
//                        MrpLbl1.setBarLineWidth( model.getProductMrp().length() * MrpLbl1.getBarLineWidth());
//                        MrpLbl2.setBarLineWidth( model.getProductMrp().length() * MrpLbl2.getBarLineWidth());
//                        MrpLbl3.setBarLineWidth( model.getProductMrp().length() * MrpLbl3.getBarLineWidth());
//                        MrpLbl4.setBarLineWidth( model.getProductMrp().length() * MrpLbl4.getBarLineWidth());
//
//                        //PMR GUDUR
//                        TscLibDll.INSTANCE.sendcommand("BAR "+ MrpLbl1.getBarLineX() +", "+MrpLbl1.getBarLineY()+", "+ MrpLbl1.getBarLineWidth()+", "+MrpLbl1.getBarLineHeight() );
//                        TscLibDll.INSTANCE.sendcommand("BAR "+ MrpLbl2.getBarLineX()+", "+MrpLbl2.getBarLineY()+", "+ MrpLbl2.getBarLineWidth()+", "+MrpLbl2.getBarLineHeight() );
//                        TscLibDll.INSTANCE.sendcommand("BAR "+ MrpLbl3.getBarLineX()+", "+MrpLbl3.getBarLineY()+", "+ MrpLbl3.getBarLineWidth()+", "+MrpLbl3.getBarLineHeight() );
//                        TscLibDll.INSTANCE.sendcommand("BAR "+ MrpLbl4.getBarLineX()+", "+MrpLbl4.getBarLineY()+", "+ MrpLbl4.getBarLineWidth()+", "+MrpLbl4.getBarLineHeight() );
//                    }
                    else if(labelPerRow==2) {
                        MrpLbl1.setBarLineWidth( model.getProductMrp().length() * MrpLbl1.getBarLineWidth());
                        MrpLbl2.setBarLineWidth( model.getProductMrp().length() * MrpLbl2.getBarLineWidth());
                        //PMR GUDUR
                        TscLibDll.INSTANCE.sendcommand("BAR "+ MrpLbl1.getBarLineX() +", "+MrpLbl1.getBarLineY()+", "+ MrpLbl1.getBarLineWidth()+", "+MrpLbl1.getBarLineHeight() );
                        TscLibDll.INSTANCE.sendcommand("BAR "+ MrpLbl2.getBarLineX()+", "+MrpLbl2.getBarLineY()+", "+ MrpLbl2.getBarLineWidth()+", "+MrpLbl2.getBarLineHeight() );
                    }
                    //Moorthy's
//                    TscLibDll.INSTANCE.sendcommand("BAR "+ (MrpLbl1.getBarLineX()-MrpLbl1.getBarLineWidth()) +", "+MrpLbl1.getBarLineY()+", "+ MrpLbl1.getBarLineWidth()+", "+MrpLbl1.getBarLineHeight() );
//                    TscLibDll.INSTANCE.sendcommand("BAR "+ (MrpLbl2.getBarLineX()-MrpLbl2.getBarLineWidth())+", "+MrpLbl2.getBarLineY()+", "+ MrpLbl2.getBarLineWidth()+", "+MrpLbl2.getBarLineHeight() );
//                    TscLibDll.INSTANCE.sendcommand("BAR "+ (MrpLbl3.getBarLineX()-MrpLbl3.getBarLineWidth())+", "+MrpLbl3.getBarLineY()+", "+ MrpLbl3.getBarLineWidth()+", "+MrpLbl3.getBarLineHeight() );
                } else if(labelPerRow==1) {
                    MrpLbl1.setBarLineWidth( model.getProductMrp().length() * MrpLbl1.getBarLineWidth());
                    TscLibDll.INSTANCE.sendcommand("BAR "+ MrpLbl1.getBarLineX() +", "+MrpLbl1.getBarLineY()+", "+ MrpLbl1.getBarLineWidth()+", "+MrpLbl1.getBarLineHeight() );
                }
//                TscLibDll.INSTANCE.printerfont("754", mrpYPnt, "ROMAN.TTF", rotation, "1", "11", model.getProductMrp());
//                TscLibDll.INSTANCE.printerfont("481", mrpYPnt, "ROMAN.TTF", rotation, "1", "11", model.getProductMrp());
//                TscLibDll.INSTANCE.printerfont("208", mrpYPnt, "ROMAN.TTF", rotation, "1", "11", model.getProductMrp());
            }
            //Selling Price
            if (model.getEnableSellingPrice()) {
                model.setSellingPrice(SaleRateLbl1.getContent() + model.getSellingPrice());
                if(labelPerRow==3) {
                    TscLibDll.INSTANCE.printerfont(SaleRateLbl1.getxPoint(), SaleRateLbl1.getyPoint(), SaleRateLbl1.getFontType(), SaleRateLbl1.getRotation(), SaleRateLbl1.getxMagnify(), SaleRateLbl1.getyMagnify(), model.getSellingPrice());
                    TscLibDll.INSTANCE.printerfont(SaleRateLbl2.getxPoint(), SaleRateLbl2.getyPoint(), SaleRateLbl2.getFontType(), SaleRateLbl2.getRotation(), SaleRateLbl2.getxMagnify(), SaleRateLbl2.getyMagnify(), model.getSellingPrice());
                    TscLibDll.INSTANCE.printerfont(SaleRateLbl3.getxPoint(), SaleRateLbl3.getyPoint(), SaleRateLbl3.getFontType(), SaleRateLbl3.getRotation(), SaleRateLbl3.getxMagnify(), SaleRateLbl3.getyMagnify(), model.getSellingPrice());
    //                TscLibDll.INSTANCE.printerfont("754", mrpYPnt, "ROMAN.TTF", rotation, "1", "11", model.getProductMrp());
    //                TscLibDll.INSTANCE.printerfont("481", mrpYPnt, "ROMAN.TTF", rotation, "1", "11", model.getProductMrp());
    //                TscLibDll.INSTANCE.printerfont("208", mrpYPnt, "ROMAN.TTF", rotation, "1", "11", model.getProductMrp());
                }
//                else if (labelPerRow == 4) {
//                    TscLibDll.INSTANCE.printerfont(SaleRateLbl1.getxPoint(), SaleRateLbl1.getyPoint(), SaleRateLbl1.getFontType(), SaleRateLbl1.getRotation(), SaleRateLbl1.getxMagnify(), SaleRateLbl1.getyMagnify(), model.getSellingPrice());
//                    TscLibDll.INSTANCE.printerfont(SaleRateLbl2.getxPoint(), SaleRateLbl2.getyPoint(), SaleRateLbl2.getFontType(), SaleRateLbl2.getRotation(), SaleRateLbl2.getxMagnify(), SaleRateLbl2.getyMagnify(), model.getSellingPrice());
//                    TscLibDll.INSTANCE.printerfont(SaleRateLbl3.getxPoint(), SaleRateLbl3.getyPoint(), SaleRateLbl3.getFontType(), SaleRateLbl3.getRotation(), SaleRateLbl3.getxMagnify(), SaleRateLbl3.getyMagnify(), model.getSellingPrice());
//                    TscLibDll.INSTANCE.printerfont(SaleRateLbl4.getxPoint(), SaleRateLbl4.getyPoint(), SaleRateLbl4.getFontType(), SaleRateLbl4.getRotation(), SaleRateLbl4.getxMagnify(), SaleRateLbl4.getyMagnify(), model.getSellingPrice());
//                }
                else if (labelPerRow == 2) {
                    TscLibDll.INSTANCE.printerfont(SaleRateLbl1.getxPoint(), SaleRateLbl1.getyPoint(), SaleRateLbl1.getFontType(), SaleRateLbl1.getRotation(), SaleRateLbl1.getxMagnify(), SaleRateLbl1.getyMagnify(), model.getSellingPrice());
                    TscLibDll.INSTANCE.printerfont(SaleRateLbl2.getxPoint(), SaleRateLbl2.getyPoint(), SaleRateLbl2.getFontType(), SaleRateLbl2.getRotation(), SaleRateLbl2.getxMagnify(), SaleRateLbl2.getyMagnify(), model.getSellingPrice());
    //                TscLibDll.INSTANCE.printerfont("754", mrpYPnt, "ROMAN.TTF", rotation, "1", "11", model.getProductMrp());
    //                TscLibDll.INSTANCE.printerfont("481", mrpYPnt, "ROMAN.TTF", rotation, "1", "11", model.getProductMrp());
                } else if(labelPerRow==1) {
                    TscLibDll.INSTANCE.printerfont(SaleRateLbl1.getxPoint(), SaleRateLbl1.getyPoint(), SaleRateLbl1.getFontType(), SaleRateLbl1.getRotation(), SaleRateLbl1.getxMagnify(), SaleRateLbl1.getyMagnify(), model.getSellingPrice());
                }
            }
            if(labelPerRow==3) {
                TscLibDll.INSTANCE.barcode(BarLbl1.getxPoint(), BarLbl1.getyPoint(), BarLbl1.getBarType(), BarLbl1.getBarHeight(), BarLbl1.getHumanInterprate(), BarLbl1.getRotation(), BarLbl1.getNarrowRatio1(), BarLbl1.getNarrowRatio2(), "!104" + model.getProductCode());
                TscLibDll.INSTANCE.barcode(BarLbl2.getxPoint(), BarLbl2.getyPoint(), BarLbl2.getBarType(), BarLbl2.getBarHeight(), BarLbl2.getHumanInterprate(), BarLbl2.getRotation(), BarLbl2.getNarrowRatio1(), BarLbl2.getNarrowRatio2(), "!104" + model.getProductCode());
                TscLibDll.INSTANCE.barcode(BarLbl3.getxPoint(), BarLbl3.getyPoint(), BarLbl3.getBarType(), BarLbl3.getBarHeight(), BarLbl3.getHumanInterprate(), BarLbl3.getRotation(), BarLbl3.getNarrowRatio1(), BarLbl3.getNarrowRatio2(), "!104" + model.getProductCode());

                TscLibDll.INSTANCE.printerfont(BarFontLbl1.getxPoint(), BarFontLbl1.getyPoint(), BarFontLbl1.getFontType(), BarFontLbl1.getRotation(), BarFontLbl1.getxMagnify(), BarFontLbl1.getyMagnify(), model.getProductCode());
                TscLibDll.INSTANCE.printerfont(BarFontLbl2.getxPoint(), BarFontLbl2.getyPoint(), BarFontLbl2.getFontType(), BarFontLbl2.getRotation(), BarFontLbl2.getxMagnify(), BarFontLbl2.getyMagnify(), model.getProductCode());
                TscLibDll.INSTANCE.printerfont(BarFontLbl3.getxPoint(), BarFontLbl3.getyPoint(), BarFontLbl3.getFontType(), BarFontLbl3.getRotation(), BarFontLbl3.getxMagnify(), BarFontLbl3.getyMagnify(), model.getProductCode());
            }
//            else if (labelPerRow == 4) {
//                TscLibDll.INSTANCE.barcode(BarLbl1.getxPoint(), BarLbl1.getyPoint(), BarLbl1.getBarType(), BarLbl1.getBarHeight(), BarLbl1.getHumanInterprate(), BarLbl1.getRotation(), BarLbl1.getNarrowRatio1(), BarLbl1.getNarrowRatio2(), "!104" + model.getProductCode());
//                TscLibDll.INSTANCE.barcode(BarLbl2.getxPoint(), BarLbl2.getyPoint(), BarLbl2.getBarType(), BarLbl2.getBarHeight(), BarLbl2.getHumanInterprate(), BarLbl2.getRotation(), BarLbl2.getNarrowRatio1(), BarLbl2.getNarrowRatio2(), "!104" + model.getProductCode());
//                TscLibDll.INSTANCE.barcode(BarLbl3.getxPoint(), BarLbl3.getyPoint(), BarLbl3.getBarType(), BarLbl3.getBarHeight(), BarLbl3.getHumanInterprate(), BarLbl3.getRotation(), BarLbl3.getNarrowRatio1(), BarLbl3.getNarrowRatio2(), "!104" + model.getProductCode());
//                TscLibDll.INSTANCE.barcode(BarLbl4.getxPoint(), BarLbl4.getyPoint(), BarLbl4.getBarType(), BarLbl4.getBarHeight(), BarLbl4.getHumanInterprate(), BarLbl4.getRotation(), BarLbl4.getNarrowRatio1(), BarLbl4.getNarrowRatio2(), "!104" + model.getProductCode());
//
//                TscLibDll.INSTANCE.printerfont(BarFontLbl1.getxPoint(), BarFontLbl1.getyPoint(), BarFontLbl1.getFontType(), BarFontLbl1.getRotation(), BarFontLbl1.getxMagnify(), BarFontLbl1.getyMagnify(), model.getProductCode());
//                TscLibDll.INSTANCE.printerfont(BarFontLbl2.getxPoint(), BarFontLbl2.getyPoint(), BarFontLbl2.getFontType(), BarFontLbl2.getRotation(), BarFontLbl2.getxMagnify(), BarFontLbl2.getyMagnify(), model.getProductCode());
//                TscLibDll.INSTANCE.printerfont(BarFontLbl3.getxPoint(), BarFontLbl3.getyPoint(), BarFontLbl3.getFontType(), BarFontLbl3.getRotation(), BarFontLbl3.getxMagnify(), BarFontLbl3.getyMagnify(), model.getProductCode());
//                TscLibDll.INSTANCE.printerfont(BarFontLbl4.getxPoint(), BarFontLbl4.getyPoint(), BarFontLbl4.getFontType(), BarFontLbl4.getRotation(), BarFontLbl4.getxMagnify(), BarFontLbl4.getyMagnify(), model.getProductCode());
//            }
            else if (labelPerRow == 2) {
                TscLibDll.INSTANCE.barcode(BarLbl1.getxPoint(), BarLbl1.getyPoint(), BarLbl1.getBarType(), BarLbl1.getBarHeight(), BarLbl1.getHumanInterprate(), BarLbl1.getRotation(), BarLbl1.getNarrowRatio1(), BarLbl1.getNarrowRatio2(), "!104" + model.getProductCode());
                TscLibDll.INSTANCE.barcode(BarLbl2.getxPoint(), BarLbl2.getyPoint(), BarLbl2.getBarType(), BarLbl2.getBarHeight(), BarLbl2.getHumanInterprate(), BarLbl2.getRotation(), BarLbl2.getNarrowRatio1(), BarLbl2.getNarrowRatio2(), "!104" + model.getProductCode());

                TscLibDll.INSTANCE.printerfont(BarFontLbl1.getxPoint(), BarFontLbl1.getyPoint(), BarFontLbl1.getFontType(), BarFontLbl1.getRotation(), BarFontLbl1.getxMagnify(), BarFontLbl1.getyMagnify(), model.getProductCode());
                TscLibDll.INSTANCE.printerfont(BarFontLbl2.getxPoint(), BarFontLbl2.getyPoint(), BarFontLbl2.getFontType(), BarFontLbl2.getRotation(), BarFontLbl2.getxMagnify(), BarFontLbl2.getyMagnify(), model.getProductCode());
            } else if(labelPerRow==1) {
                TscLibDll.INSTANCE.barcode(BarLbl1.getxPoint(), BarLbl1.getyPoint(), BarLbl1.getBarType(), BarLbl1.getBarHeight(), BarLbl1.getHumanInterprate(), BarLbl1.getRotation(), BarLbl1.getNarrowRatio1(), BarLbl1.getNarrowRatio2(), "!104" + model.getProductCode());
                TscLibDll.INSTANCE.printerfont(BarFontLbl1.getxPoint(), BarFontLbl1.getyPoint(), BarFontLbl1.getFontType(), BarFontLbl1.getRotation(), BarFontLbl1.getxMagnify(), BarFontLbl1.getyMagnify(), model.getProductCode());
            }

            //Packing date
            model.setProductPacked(model.getProductPacked().substring(3));
            if (model.getEnableProductPacked()) {
                if(labelPerRow==3) {
                    TscLibDll.INSTANCE.printerfont(SaleRateLbl1.getxPoint(), ""+(Integer.parseInt(MrpLbl1.getyPoint())-25), "1", "180", "1", "1", "Pkd:"+model.getProductPacked());
                    TscLibDll.INSTANCE.printerfont(SaleRateLbl2.getxPoint(), ""+(Integer.parseInt(MrpLbl2.getyPoint())-25), "1", "180", "1", "1", "Pkd:"+model.getProductPacked());
                    TscLibDll.INSTANCE.printerfont(SaleRateLbl3.getxPoint(), ""+(Integer.parseInt(MrpLbl3.getyPoint())-25), "1", "180", "1", "1", "Pkd:"+model.getProductPacked());
                }
//                else if (labelPerRow == 4) {
//                    TscLibDll.INSTANCE.printerfont(SaleRateLbl1.getxPoint(), ""+(Integer.parseInt(MrpLbl1.getyPoint())-25), "1", "180", "1", "1", "Pkd:"+model.getProductPacked());
//                    TscLibDll.INSTANCE.printerfont(SaleRateLbl2.getxPoint(), ""+(Integer.parseInt(MrpLbl2.getyPoint())-25), "1", "180", "1", "1", "Pkd:"+model.getProductPacked());
//                    TscLibDll.INSTANCE.printerfont(SaleRateLbl3.getxPoint(), ""+(Integer.parseInt(MrpLbl3.getyPoint())-25), "1", "180", "1", "1", "Pkd:"+model.getProductPacked());
//                    TscLibDll.INSTANCE.printerfont(SaleRateLbl4.getxPoint(), ""+(Integer.parseInt(MrpLbl4.getyPoint())-25), "1", "180", "1", "1", "Pkd:"+model.getProductPacked());
//                }
                else if (labelPerRow == 2) {
                    TscLibDll.INSTANCE.printerfont(SaleRateLbl1.getxPoint(), ""+(Integer.parseInt(MrpLbl1.getyPoint())-25), "1", "180", "1", "1", "Pkd:"+model.getProductPacked());
                    TscLibDll.INSTANCE.printerfont(SaleRateLbl2.getxPoint(), ""+(Integer.parseInt(MrpLbl2.getyPoint())-25), "1", "180", "1", "1", "Pkd:"+model.getProductPacked());
                } else if(labelPerRow==1) {
                    TscLibDll.INSTANCE.printerfont(SaleRateLbl1.getxPoint(), ""+(Integer.parseInt(MrpLbl1.getyPoint())-25), "1", "180", "1", "1", "Pkd:"+model.getProductPacked());
                }
            }
            //Best Before date
            model.setBestBeforeOn(model.getBestBeforeOn().substring(3));
            if (model.getEnableBestBeforeOn()) {
                if(labelPerRow==3) {
                    TscLibDll.INSTANCE.printerfont(SaleRateLbl1.getxPoint(), ""+(Integer.parseInt(MrpLbl1.getyPoint())-50), "1", "180", "1", "1", "BestBefore:"+model.getBestBeforeOn());
                    TscLibDll.INSTANCE.printerfont(SaleRateLbl2.getxPoint(), ""+(Integer.parseInt(MrpLbl2.getyPoint())-50), "1", "180", "1", "1", "BestBefore:"+model.getBestBeforeOn());
                    TscLibDll.INSTANCE.printerfont(SaleRateLbl3.getxPoint(), ""+(Integer.parseInt(MrpLbl3.getyPoint())-50), "1", "180", "1", "1", "BestBefore:"+model.getBestBeforeOn());
                }
//                else if (labelPerRow == 4) {
//                    TscLibDll.INSTANCE.printerfont(SaleRateLbl1.getxPoint(), ""+(Integer.parseInt(MrpLbl1.getyPoint())-50), "1", "180", "1", "1", "BestBefore:"+model.getBestBeforeOn());
//                    TscLibDll.INSTANCE.printerfont(SaleRateLbl2.getxPoint(), ""+(Integer.parseInt(MrpLbl2.getyPoint())-50), "1", "180", "1", "1", "BestBefore:"+model.getBestBeforeOn());
//                    TscLibDll.INSTANCE.printerfont(SaleRateLbl3.getxPoint(), ""+(Integer.parseInt(MrpLbl3.getyPoint())-50), "1", "180", "1", "1", "BestBefore:"+model.getBestBeforeOn());
//                    TscLibDll.INSTANCE.printerfont(SaleRateLbl4.getxPoint(), ""+(Integer.parseInt(MrpLbl4.getyPoint())-50), "1", "180", "1", "1", "BestBefore:"+model.getBestBeforeOn());
//                }
                else if (labelPerRow == 2) {
                    TscLibDll.INSTANCE.printerfont(SaleRateLbl1.getxPoint(), ""+(Integer.parseInt(MrpLbl1.getyPoint())-50), "1", "180", "1", "1", "BestBefore:"+model.getBestBeforeOn());
                    TscLibDll.INSTANCE.printerfont(SaleRateLbl2.getxPoint(), ""+(Integer.parseInt(MrpLbl2.getyPoint())-50), "1", "180", "1", "1", "BestBefore:"+model.getBestBeforeOn());
                } else if(labelPerRow==1) {
                    TscLibDll.INSTANCE.printerfont(SaleRateLbl1.getxPoint(), ""+(Integer.parseInt(MrpLbl1.getyPoint())-50), "1", "180", "1", "1", "BestBefore:"+model.getBestBeforeOn());
                }
            }
            TscLibDll.INSTANCE.printlabel(1+"", model.getPrintCopies()+"");
            TscLibDll.INSTANCE.closeport();
            isPrint = true;
        } catch (Exception e) {
            log.debug("Method:sendToPrinter Exception:" + e.getMessage());
            e.printStackTrace();
        }
        return isPrint;
    }
    public static void main(String[] args) {
//        BarcodePrinter bp = new BarcodePrinter();
//        BarcodePrinterModel model = new BarcodePrinterModel();
//        model.setPrintCopies(1);
//        model.setPrintSet(3);
//        model.setEnableShopName(true);
//        model.setEnableProductName(true);
//        model.setEnableSellingPrice(true);
//        model.setEnableProductPacked(false);
//        model.setProductCode("RAR1003");
//        model.setProductMrp("50.00");
//        model.setSellingPrice("48.00");
//        model.setProductName("Sun dth");
//        model.setProductPacked("pkd 04/12/12");
//        model.setShopName("SARA CASUALS");
//        bp.sendToPrinter(model);
    }
}
