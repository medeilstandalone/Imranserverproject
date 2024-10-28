package com.vanuston.medeil.quartz;

import com.vanuston.medeil.quartz.jobs.HelloJob;
import com.vanuston.medeil.util.Logger;
import org.quartz.CronTrigger;
import org.quartz.Scheduler;
import org.quartz.SchedulerFactory;
import org.quartz.impl.StdSchedulerFactory;
import org.quartz.JobDetail;
import com.vanuston.medeil.util.WinRegistry;

public class CronSchedule {
    Logger log = Logger.getLogger(CronSchedule.class, "CronSchedule");
    public CronSchedule() {        
        try {
            log.debug("Schedule init...");
            SchedulerFactory sf = new StdSchedulerFactory();
            Scheduler sched = sf.getScheduler();
            JobDetail jd = new JobDetail("job1", "group1", HelloJob.class);
            WinRegistry winR = new WinRegistry();
            String str = winR.getInstalledDay(); // get from Installed day (like sun, mon) from registry. [ I/P: FRI, Fri, friday, 6]            
            String cronExpression = "0 * 10-19 ? * " + str;
            log.debug("str:"+str);

            if (!str.equals("NA")) {
                log.debug("schedule start");
                CronTrigger ct = new CronTrigger("cronTrigger", "group2", cronExpression);
                sched.scheduleJob(jd, ct);
                sched.start();
            }

        } catch (Exception e) {
            log.debug("cronSchedule Exception:"+e.getMessage());
//            e.printStackTrace();
        }
    }
}
