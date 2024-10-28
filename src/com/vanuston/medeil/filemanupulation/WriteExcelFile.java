package com.vanuston.medeil.filemanupulation;

import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;
import com.vanuston.medeil.util.Logger;

import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

public class WriteExcelFile {
    static Logger log = Logger.getLogger(WriteExcelFile.class, "com.vanuston.filemanupulation");
	@SuppressWarnings("deprecation")
	public static boolean writeXLFile (List<String> list, String filePath ) {
		boolean flag = false;
		try {
		//	list.add("karthi  | karthi | sudha | jana | keyan |karthi | sudha | jana | keyan |karthi | sudha | jana | keyan |karthi | sudha | jana | keyan");
		//	list.add("karthi 2 | karthi 2| sudha 2| jana2 | keyan2 |karthi2 | sudha2 | jana2 | keyan2 |karthi2 | sudha2 | jana2 | keyan2 |karthi2 | sudha2 | jana2 | keyan2");
			int listSize = list.size();
			HSSFWorkbook wb = new HSSFWorkbook();
			HSSFSheet sheet = wb.createSheet ("new sheet");
			/*HSSFRow row = sheet.createRow ((short)0);
			HSSFCell cell = row.createCell ((short)0);
			cell.setCellValue(1);*/
	    	StringTokenizer tokenizer = null;
	    	for (int rowIndex = 0; rowIndex < listSize; rowIndex++) {
	    		HSSFRow row = sheet.createRow ((short)rowIndex);
				String listItem = list.get(rowIndex);
			
				tokenizer = new StringTokenizer(listItem, "|");
				String valueString = null;
				int tokenCounter = 1;
				String[] varargs = new String[17];
				for (int index = 0; tokenizer.hasMoreTokens(); index++) {
					valueString = tokenizer.nextToken().trim();
					
					row.createCell((short)index).setCellValue (valueString);
					varargs[index] = valueString;
					tokenCounter++;
				}
	    	}
			/*row.createCell((short)0).setCellValue ("Karthikeyan subburaj");
			row.createCell((short)1).setCellValue ("Karthikeyan subburaj");
			row.createCell((short)2).setCellValue ("amkit Kumar ");
			row.createCell((short)3).setCellValue (true);*/
			FileOutputStream fileOut = new FileOutputStream (filePath);
			wb.write (fileOut);
			fileOut.close(); 
			flag = true;
		} catch ( Exception e ) {
			log.debug( "Class : WriteExcelFile   Method :writeXLFile   Exception : " + e.getMessage());
		}
		return flag;
	}
	
	public static void main(String[] args) {
		List<String> a = new ArrayList<String>();
		writeXLFile(a, "d:\\drugTable.xls");
	}
	
}
