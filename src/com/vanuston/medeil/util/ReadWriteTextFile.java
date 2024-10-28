package com.vanuston.medeil.util;

import java.io.*;

public class ReadWriteTextFile {
    static Logger log = Logger.getLogger(ReadWriteTextFile.class, "Utilities");
    private BufferedReader input;
    public String FileContent;

    public String ReadFile(File src) throws IOException {
        try {
            FileContent = "";
            FileInputStream fstream = new FileInputStream(src);
            DataInputStream in = new DataInputStream(fstream);
            BufferedReader br = new BufferedReader(new InputStreamReader(in));
            String strLine;
            while ((strLine = br.readLine()) != null) {
                FileContent = FileContent + strLine.toString() + "\n";
            }
            in.close();
        } catch (Exception e) {
             String msg = "Class : ReadWriteTextFile Method : SendNowPDFCreator    Exception : " + e.getMessage();
             log.debug(msg);
        }
        return FileContent;
    }

    public void WriteFile(File src, String data) throws IOException {
        Writer output = null;
        String text = data;
        File file = new File(src.toString() + ".txt");
        output = new BufferedWriter(new FileWriter(file));
        output.write(text);
        output.close();
    }
}
