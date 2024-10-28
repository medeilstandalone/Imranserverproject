package com.vanuston.medeil.quartz.jobs;

import com.vanuston.medeil.client.RegistryFactory;
import org.quartz.Job;
import org.quartz.JobExecutionContext;
//import org.quartz.JobExecutionException;
import medil.activate.SendSystemInfo;
import com.vanuston.medeil.filemanupulation.WriteExcelFile;
import com.vanuston.medeil.implementation.CommonImplements;
import java.util.ArrayList;
import java.util.List;
import com.vanuston.medeil.util.ConcatenateFiles;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
public class HelloJob implements Job {
    static Logger log = Logger.getLogger(HelloJob.class, "com.vanuston.quartz.jobs");
    @Override
    public void execute(JobExecutionContext arg0)  {
//        log.debug("HelloJob execute...");
        try {
            CommonImplements comImp = (CommonImplements) RegistryFactory.getClientStub(RegistryConstants.CommonImplements);
            int scnt = comImp.selectCountQuryExe("select count(*) from sales_maintain_bill");
            int pcnt = comImp.selectCountQuryExe("select count(*) from purchase_invoice");
            if (scnt > 0 && pcnt > 0) {
//              new ConcatenateFiles().getBackup();
                ConcatenateFiles.getBackup();
                SendSystemInfo sendSystemInfo = new SendSystemInfo();
                String getFile = ConcatenateFiles.getFilePath();
                List<String> list = new ArrayList<String>();
                list = sendSystemInfo.call(getFile + ".txt");
                int listSize = list.size();
                if (listSize == 1 && listSize <= 1 && listSize != 0) {
                    String string = list.get(0);
                    if (string.equalsIgnoreCase("server_error")) {
                        log.debug("Class : HelloJob   Method :execute   Hello Job Scheduler Info: System conn't connect to server.");
                        // exit now
                    } else if (string.equalsIgnoreCase("false")) {
                        log.debug("Class : HelloJob   Method :execute   ello Job Scheduler Info: Invalid Product.");
                    }
                } else {
                    log.debug("Class : HelloJob   Method :execute   Hello Job Scheduler Info:Write Excel file ");
                    // Call writeXLFile method
                    
                    WriteExcelFile.writeXLFile(list, getFile + ".xls");
                }
            }
        } catch (Exception e) {
            log.debug("Class : HelloJob   Method :execute   Exception : " + e.getMessage());
        }
    }
}
