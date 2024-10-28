/*
 *   PROBILZ – Retail Management System (RMS) To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.vanuston.medeil.printer;

import com.vanuston.medeil.model.BarcodePrinterModel;
import com.vanuston.medeil.util.Logger;
import java.awt.image.BufferedImage;
import java.io.BufferedReader;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import javax.print.Doc;
import javax.print.DocFlavor;
import javax.print.DocPrintJob;
//import javax.print.PrintException;
import javax.print.PrintService;
import javax.print.PrintServiceLookup;
import javax.print.SimpleDoc;
import javax.print.attribute.PrintServiceAttribute;
import javax.print.attribute.standard.PrinterName;
import javax.swing.JOptionPane;

import org.krysalis.barcode4j.impl.code128.Code128Bean;
import org.krysalis.barcode4j.output.bitmap.BitmapCanvasProvider;
import org.krysalis.barcode4j.tools.UnitConv;



/**
 *
 * @author saran
 */
public class PrintServices {

    private String printerName;
    Logger log=Logger.getLogger(PrintServices.class,"PrintServices");
//    public static void main(String arg[]){
//        PrintServices ps = new PrintServices();
//        BarcodePrinterModel model = new BarcodePrinterModel();
//        model.setProductCode("DEL1005");
//        model.setPrintCopies(2);
//        model.setShopName("SHARQMEDICALSUPPLY");
////        ps.PrintJob(ps.getPrintService(), model);
//
//    }

    public PrintService getPrintService() {
        PrintService psZebra = null;
        try {
           String sPrinterName = null;
           List<String> printers = null;
           PrintService[] services = PrintServiceLookup.lookupPrintServices(null, null);
           for (int i = 0; i < services.length; i++) {
               PrintServiceAttribute attr = services[i].getAttribute(PrinterName.class);
               sPrinterName = ((PrinterName) attr).getValue();
               if (sPrinterName.indexOf("TLP 2844") >= 0) {
                   psZebra = services[i];
                   break;
               }
           }

           if (psZebra == null) {
               log.debug("Zebra printer not found.");
               return psZebra;
           }
           this.PrintJob(psZebra, new BarcodePrinterModel());
           /*DocPrintJob job = psZebra.createPrintJob();
           String s = "${^XA^FO100,100^BY7^BCN,100,Y,N,N^FD123456^FS^XZ}$";
           byte[] by = s.getBytes();
           DocFlavor flavor = DocFlavor.BYTE_ARRAY.AUTOSENSE;
           Doc doc = new SimpleDoc(by, flavor, null);
           job.print(doc, null);*/
        } catch (Exception e) {
            log.debug("PrintServices  getPrintService Exception:"+e.getMessage() );


        }
    return psZebra;
    }

    public List<String> listPrinter(){
        List<String> printers = new ArrayList<String>();
        PrintService psZebra = null;
        PrintService[] services = PrintServiceLookup.lookupPrintServices(null, null);
//        try {
            for (int i = 0; i < services.length; i++) {
               PrintServiceAttribute attr = services[i].getAttribute(PrinterName.class);
               printers.add(((PrinterName) attr).getValue());
            }

//        }catch(){
//
//        }
        return printers;

    }
    public void PrintJob(PrintService psZebra,BarcodePrinterModel pModel) {
        DocPrintJob job = psZebra.createPrintJob();
        String code=pModel.getProductCode();
        if(code != null && code.length() > 2){

            String s = "N" + "\n"
                    + "q405" + "\n"
                    + "Q203,40" + "\n"
                    + "B55,26,0,1,2,2,102,B,\"" + pModel.getProductCode() + "\"" + "\n"
                    + "A50,156,0,1,1,1,N,\"" + pModel.getShopName() + "\"" + "\n"
                    + "P"+pModel.getPrintCopies()+",1";
            /*if(pModel.getEnableShopName()) {
                s = "N" + "\n"
                    + "q405" + "\n"
                    + "Q203,40" + "\n"
                    + "B55,26,0,1,2,2,102,B,\"" + pModel.getProductCode() + "\"" + "\n"
                    + "A55,136,0,1,1,1,N,\"" + pModel.getShopName() + "\"" + "\n"
                    + "P"+pModel.getPrintCopies()+",1";
            }*/
//            /*
            InputStream is = new ByteArrayInputStream(s.getBytes());
            DocFlavor flavor = DocFlavor.INPUT_STREAM.AUTOSENSE;
            Doc doc = new SimpleDoc(is, flavor, null);
//            */
            /*
//            DocPrintJob job = psZebra.createPrintJob();
           String s = "${^XA^FO100,100^BY7^BCN,100,Y,N,N^FD"+code+"^FS^XZ}$";
           byte[] byt = s.getBytes();
           DocFlavor flavor = DocFlavor.BYTE_ARRAY.AUTOSENSE;
           Doc doc = new SimpleDoc(byt, flavor, null);
//           job.print(doc, null);
           */

            try {
                job.print(doc, null);
            } catch (Exception e) {
                e.printStackTrace();
                log.debug("PrintServices  PrintJob Exception:"+e.getMessage() );
            }
        } else {
            log.debug("PrintServices  PrintJob info: Product Model Null." );
        }
    }
    public void printByWindows(BarcodePrinterModel model) {
        String pdtCode = model.getProductCode();
        try {
                if(pdtCode != null && pdtCode != ""){
                Code128Bean bean = new Code128Bean();
                final int dpi = 100;

                //Configure the barcode generator
                bean.setModuleWidth(UnitConv.in2mm(2.5f / dpi)); //makes the narrow bar width exactly one pixel
                bean.setBarHeight(10);
                bean.doQuietZone(false);

                //Open output file
                File outputFile = new File("out.png");
                OutputStream out;
                out = new FileOutputStream(outputFile);

                //Set up the canvas provider for monochrome PNG output
                BitmapCanvasProvider canvas = new BitmapCanvasProvider(out, "image/x-png", dpi, BufferedImage.TYPE_BYTE_BINARY, false, 90);

                // 200x 10

                //Generate the barcode
                bean.generateBarcode(canvas, pdtCode);

                //Signal end of generation
                canvas.finish();
                out.close();


//                paintComponent(labelArtikelbezeichnung.getText());
                String working_dir = System.getProperty("user.dir");
                
                try {
                    Runtime rt = Runtime.getRuntime();
                    String command = "C:\\WINDOWS\\system32\\rundll32.exe C:\\WINDOWS\\system32\\shimgvw.dll,ImageView_Fullscreen " + "" + working_dir + "\\out.png";
                    Process pr = rt.exec(command);
                    BufferedReader input = new BufferedReader(new InputStreamReader(pr.getInputStream()));
                    String line = null;
                    while ((line = input.readLine()) != null) {
                    }
                    int exitVal = pr.waitFor();                    
                } catch (Exception e) {                    
                    e.printStackTrace();
                }
            } else {
                JOptionPane.showMessageDialog(null, "Error! Product code is empty..");
            }
            } catch (IOException ex) {                
            }

    }
}
