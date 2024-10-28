package medil.activate;

import com.vanuston.medeil.filemanupulation.ReadFile;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.WinRegistry;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.net.ConnectException;
import java.net.URL;
import java.net.URLConnection;
import java.util.ArrayList;
import java.util.List;

public class SendSystemInfo {

    static Logger log = Logger.getLogger(SendSystemInfo.class, "Utilities");
//final static String domainURL = "http://www.medeil.com/";
final static String domainURL = "http://www.product.vanuston.com/";
//final static String domainURL = "http://192.168.100.19:8080/vanuston_product/";
//	public static String getMacAddress() throws Exception {
//		String macAddress = null;
//                String command = "ipconfig /all";
//                Process pid = Runtime.getRuntime().exec(command);
//                BufferedReader in = new BufferedReader(new InputStreamReader(pid.getInputStream()));
//                String line = "";
//                while ((line = in.readLine())!=null) {
//                    Pattern p = Pattern.compile(".*Physical Address.*: (.*)");
//                    Matcher m = p.matcher(line);
//                    if (m.matches()) {
//                        macAddress = m.group(1);
//                        break;
//                    }
//                }
//                in.close();
//	return macAddress;
//	}

    public static String getEthernetMacAddress() {
        // macAddress = "00-01-02-AF-BE-CD" If not get MAC Address return default MAC Address.
        String macAddress = null;
        try {
            String command = "ipconfig /all";
            Process pid = Runtime.getRuntime().exec(command);
            BufferedReader in = new BufferedReader(new InputStreamReader(pid.getInputStream()));
            String regEx = ".*Ethernet adapter Local Area Connection.*";
            String regEx_win8 = ".*Ethernet adapter Ethernet.*";
            while (true) {
                String line = in.readLine();
                if (line == null) {
                    break;
                }
                boolean flag = false;
                flag = Pattern.matches(regEx, line);
                if (Pattern.matches(regEx_win8, line)) {
                    flag = true;
                }
                if (flag) {
                    while (true) {
                        String macLine = in.readLine();
                        if (macLine == null) {
                            break;
                        }
                        Pattern p = Pattern.compile(".*Physical Address.*: (.*)");
                        Matcher m = p.matcher(macLine);
                        if (m.matches()) {
                            macAddress = m.group(1);
                            break;
                        }
                    }
                }
                if (macAddress != null) {
                    break;
                }
            }

            in.close();
        } catch (Exception e) {
            log.debug("Method:getEthernetMacAddress Exception:" + e.getMessage());
        }
        log.debug("System String = " + macAddress);
        if (macAddress == null || macAddress.length() < 1) {
            macAddress = "00-01-02-AF-BE-CD";
            log.debug("System Manual  String: = " + macAddress);
        }
        return macAddress;
    }
    
    private URLConnection requestServletURL (String domainURL, String servletURL) {
		URLConnection conn = null;
		try {
			URL url;
			url = new URL(""+domainURL+servletURL);
			//URLConnection connection = url.openConnection();
			conn = url.openConnection();
			conn.setDoInput(true);
			conn.setDoOutput(true);
			conn.setUseCaches(false);
			conn.setDefaultUseCaches(false);
			conn.setRequestProperty("Content-type", "application/octet-stream");
		} catch (ConnectException e) {
			log.debug( "Class : SendSystemInfo   Method :requestServletURL   Exception : " + e.getMessage());
		} catch (IOException e) {
			log.debug( "Class : SendSystemInfo   Method :requestServletURL   Exception : " + e.getMessage());
		}
		return conn;
	}

public static List<String> schedulerProcessToServer (String path) {
		SendSystemInfo systemInfo = new SendSystemInfo();
		List<String> itemsFromServer = new ArrayList<String>();
            try {
                String servletURL = "servlet/ScheduledServerCall";
                boolean flag;
                WinRegistry wr=new WinRegistry();
                URLConnection connection = systemInfo.requestServletURL(domainURL, servletURL);
                
                List<String> list = new ArrayList<String>();
                ReadFile readFile = new ReadFile();
//		list = readFile.getRecordsInList("D:/_VAN-MED1.0-S200009_2011-05-06_2011-05-15.txt");
                list = readFile.getRecordsInList(path);
                //String productLabel = "VAN-MED1.0-S200001";
                String productLabel = wr.convertHexToString(new WinRegistry().getCustvalue());
                log.debug("Method:schedulerProcessToServer Info1:"+productLabel);
                //String activationKey = "dfgg-sdfd-sdfs-fgng";
                String activationKey = wr.convertHexToString(wr.getActKey());
                log.debug("Method:schedulerProcessToServer Info2:"+activationKey);

                String insDay = wr.getInstalledDay();
                log.debug("Cron Job Day:" + insDay);

                int listsize = list.size() + 1;
                log.debug("Method:schedulerProcessToServer listsize:" + listsize);
                //	properties for validate the client system.
                list.add("" + productLabel + "|" + activationKey + "|" + listsize);
                flag = systemInfo.sendOutputStream(connection, list);
                if (flag) {
                    itemsFromServer = systemInfo.getInputStream(connection);
                    for (String string : itemsFromServer) {
                        log.debug("Method:schedulerProcessToServer Response from server: " + string);
                    }
                } else {
                    itemsFromServer.add("server_error");
                }
            } catch (Exception e) {
                log.debug( "Class : SendSystemInfo   Method :schedulerProcessToServer   Exception : " + e.getMessage());
            }
		return itemsFromServer;
	}
	public List<String> call(String path) {
		List<String> list = new ArrayList<String>();
		list = SendSystemInfo.schedulerProcessToServer(path);
                // File upload download
		log.debug("Method:schedulerProcessToServer List:"+list);

                return list;
	}

        private boolean sendOutputStream (URLConnection connection, List list) {
		boolean flag = false;
		if(connection != null) {
			try {
				ObjectOutputStream output = new ObjectOutputStream(connection.getOutputStream());
				output.writeObject(list);
				output.flush();
				output.close();
				flag = true;
			} catch (ConnectException e) {
				log.debug( "Class : SendSystemInfo   Method :sendOutputStream   Exception : " + e.getMessage());
				flag = false;
			} catch (IOException e) {
				log.debug( "Class : SendSystemInfo   Method :sendOutputStream   Exception : " + e.getMessage());
			}
		}
		
		return flag;
	}

	@SuppressWarnings("unchecked")
	private List<String> getInputStream (URLConnection connection) {
		List<String> itemsFromServer = new ArrayList<String>();
		try {
		ObjectInputStream input = new ObjectInputStream(connection.getInputStream());
		itemsFromServer = (ArrayList) input.readObject();
		} catch (ClassNotFoundException e) {
			log.debug( "Class : SendSystemInfo   Method :getInputStream   Exception : " + e.getMessage());
		} catch (ConnectException e) {
			log.debug( "Class : SendSystemInfo   Method :getInputStream   Exception : " + e.getMessage());
		} catch (IOException e) {
			log.debug( "Class : SendSystemInfo   Method :getInputStream   Exception : " + e.getMessage());
		}
		return itemsFromServer;
	}


//    public static String getMacAddress() {
//        // macAddress = "00-01-02-AF-BE-CD" If not get MAC Address return default MAC Address.
//
//      String macAddress = null;
//		try {
//		String command = "ipconfig /all";
//		Process pid = Runtime.getRuntime().exec(command);
//		BufferedReader in =
//		new BufferedReader(
//		new InputStreamReader(pid.getInputStream()));
//		while (true) {
//			String line = in.readLine();

//			if (line == null)
//			break;
//			Pattern p = Pattern.compile(".*Physical Address.*: (.*)");
//			Matcher m = p.matcher(line);
//			if (m.matches()) {
//				macAddress = m.group(1);
//				break;
//			}
//		}
//	in.close();
//		} catch (Exception e) {

//                    log.debug("Error in SendSystemInfo() = "+e.getMessage());
//		}
//                  log.debug("System String = "+macAddress);

//	if (macAddress == null || macAddress.length() < 1) {
//		macAddress = "00-01-02-AF-BE-CD";
//	}
//
//        log.debug("System Manual  String: = "+macAddress);
//
//        return macAddress;
//    }
}
