package com.vanuston.medeil.filemanupulation;

import com.vanuston.medeil.util.Logger;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.util.ArrayList;
import java.util.List;

public class ReadFile {
	
	/*public static void main(String[] args) {
		ReadFile readFile = new ReadFile();
		List<String> list = readFile.getRecordsInList("D:/_VAN-MED1.0-S200009_2011-05-06_2011-05-11.csv");
		for (String string: list) {
			
		}
 	}*/
        Logger log = Logger.getLogger(ReadFile.class, "ReadFile");
	public List<String> getRecordsInList(String filePathAndName) {
		List<String> recordList = new ArrayList<String>();
		try {
                    
			String line ="";
			File inFile = new File(filePathAndName);
			BufferedReader br = new BufferedReader(new InputStreamReader (new FileInputStream (inFile)));

			while ( (line = br.readLine()) != null ) {				
				recordList.add(line);
			}
			br.close();
		} catch (Exception e) {
			log.debug("Method: getRecordsInList    Exception : " + e.getMessage());
		}
		return recordList;
	}
	
}
