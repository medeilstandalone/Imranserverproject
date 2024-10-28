package com.vanuston.medeil.quartz;

import java.util.Date;

import org.quartz.JobDetail;
import org.quartz.Scheduler;
import org.quartz.SchedulerFactory;
import org.quartz.SimpleTrigger;
import org.quartz.Trigger;
import org.quartz.impl.StdSchedulerFactory;

import com.vanuston.medeil.quartz.jobs.HelloJob;

public class HelloSchedule {
	
	public HelloSchedule() throws Exception {
		SchedulerFactory sf=new StdSchedulerFactory();
		Scheduler sched=sf.getScheduler();
		sched.start();
		JobDetail jd = new JobDetail("myjob",Scheduler.DEFAULT_GROUP,HelloJob.class);
		Date date = new Date();
		SimpleTrigger st=new SimpleTrigger("mytrigger", Scheduler.DEFAULT_GROUP, date, null, SimpleTrigger.REPEAT_INDEFINITELY, 60L*300L);
		
		sched.scheduleJob(jd, st);
	}
	
	public static void main(String args[]){
		try{
			new HelloSchedule();
		} catch(Exception e) {
		//	e.printStackTrace();
		}
	}
}
