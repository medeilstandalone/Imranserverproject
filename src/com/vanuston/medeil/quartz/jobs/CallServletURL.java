package com.vanuston.medeil.quartz.jobs;

import com.vanuston.medeil.util.Logger;
import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;

public class CallServletURL implements Job {
	
	URL url;
        Logger log =Logger.getLogger(CallServletURL.class,"CallServletURL");
	public void execute(JobExecutionContext arg0) throws JobExecutionException {
		
		/*List<String> list = new ArrayList<String>();
		String domainURL = "http://localhost:8080/FileUpload/";
		String servletName = "servlet/FileToClient";
		String fileAndPath = "D:/KArthikeyan/file.csv";
		boolean flag = false;*/
		
		List<String> list = new ArrayList<String>();
		String domainURL = "http://www.medeil.com/";
                //String domainURL = "http://localhost:8080/medeil_manager/";
		String servletName = "/servlet/ActivationServlet";
		String pathAndFile = "D:/KArthikeyan/file.csv";
		boolean flag = false;
		
		CallServletURL callServletURL = new CallServletURL();
		
		URLConnection connection = callServletURL.requestServletURL(domainURL, servletName);
		list = callServletURL.fileToArrayList(pathAndFile);
		
		
		
		flag = callServletURL.sendOutputStream(connection, list);
		
		
		if(flag == false) {
			callServletURL.sendOutputStream(connection, list);
		}
		
		List<String> dataFromServer = new ArrayList<String>();
		dataFromServer = callServletURL.getInputStream(connection);
		
		callServletURL.writeFileFromServer(dataFromServer);
	}
	
	public URLConnection requestServletURL(String domainURL, String servletName) {
		URLConnection conn = null;
		try {
			url = new URL(""+domainURL+""+servletName+"");
			// URLConnection connection = url.openConnection();
			conn = url.openConnection();
			conn.setDoInput(true);
			conn.setDoOutput(true);
			conn.setUseCaches(false);
			conn.setDefaultUseCaches(false);
			conn.setRequestProperty("Content-type", "application/octet-stream");
			} catch (IOException e) {
				log.debug("Method:requestServletURL Exception:"+e.getMessage());
			}
			return conn;
	}
	
	public ArrayList<String> fileToArrayList(String fileAndPath) {
		List<String> list = new ArrayList<String>();
		String eachLineFromString;
		int lineIndex = 0;
		try {
			BufferedReader bufferedReader = new BufferedReader(new FileReader(fileAndPath));
			while ((eachLineFromString = bufferedReader.readLine()) != null) {
				
				
				list.add(eachLineFromString);
				lineIndex++;
			}
			
		} catch (FileNotFoundException e) {
			log.debug("Method:fileToArrayList FileNotFoundException:"+e.getMessage());
		} catch (IOException e) {
			log.debug("Method:fileToArrayList IOException:"+e.getMessage());
		}
		return (ArrayList<String>) list;
	}
	
	public boolean sendOutputStream(URLConnection connection, List<String> list) {
		boolean flag = false;
		if(connection != null) {
			try {
			ObjectOutputStream output = new ObjectOutputStream(connection.getOutputStream());
			output.writeObject(list);
			output.flush();
			output.close();
			flag = true;
			} catch (IOException e) {
				log.debug("Method:sendOutputStream IOException:"+e.getMessage());
			}
		} else {
			log.debug("sendOutputStream Connection error.");
		}
		if(flag) log.debug("Successfully sent data to server from client..!");
		return flag;
	}
	
	@SuppressWarnings("unchecked")
	public List<String> getInputStream(URLConnection connection) {
		List<String> listFromServer = new ArrayList<String>();
		try {
		ObjectInputStream input = new ObjectInputStream(connection.getInputStream());
		listFromServer = (ArrayList) input.readObject();
		
		} catch(IOException e) {
			log.debug("Method:getInputStream IOException:"+e.getMessage());
		} catch (ClassNotFoundException e) {
			log.debug("Method:getInputStream ClassNotFoundException:"+e.getMessage());
		}
		return listFromServer;
	}
	
	public void writeFileFromServer(List<String> list) {
		
		for(String string: list) {

		}
	}
	
}