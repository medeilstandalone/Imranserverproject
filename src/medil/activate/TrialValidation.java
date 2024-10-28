package medil.activate;

import java.io.IOException;
import com.vanuston.medeil.util.Logger;

public class TrialValidation {
	static Logger log =Logger.getLogger(TrialValidation.class,"Utilities");

	public static String getDemoId(String productLabel) throws IOException {
                String out="Error";
                sendActivationString(productLabel);
            try {
              //  String str = SendSystemInfo.getMacAddress();
                String str = SendSystemInfo.getEthernetMacAddress();
                String s[] = str.split("-");
                StringBuffer buffer = new StringBuffer();
                for (int i = 0; i < s.length; i++) {
                    buffer.append(s[i]);
                }
                String mac = buffer.toString();
                String raw[] = productLabel.split("-");
                char split[] = raw[2].toCharArray();
                StringBuffer prodLabel = new StringBuffer();
                for (int i = 1; i < split.length; i++) {
                    prodLabel.append(split[i]);
                }
                out = mac.substring(0, 6) + prodLabel + mac.substring(6, 12);
            } catch (Exception e) {
                log.debug("Class:TrialValidation  Method :getDemoId() "+e.getMessage());
            }
		return out;
	}
	
	public static String sendActivationString (String proLabel) throws IOException {
                String output="";
            try {
//                CheckValid checkValid = new CheckValid();
//                String MAC = SendSystemInfo.getMacAddress();
                 String MAC = SendSystemInfo.getEthernetMacAddress();
                String concatString = proLabel.concat(MAC);
                output = new CheckValid().getInputKeyString(concatString);
            } catch (Exception iOException) {
                log.debug("Class:TrialValidation  Method :sendActivationString() "+iOException);
            }
		return output;
	}
}
