package medil.activate;
 
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import com.vanuston.medeil.util.Logger;


public class CheckValid {
    
	static Logger log =Logger.getLogger(CheckValid.class,"Utilities");

	public boolean isValid(String customerLabel, String activationCode) {
            String variable = null;
            try {
                variable = activationCode.substring(20);
                activationCode = activationCode.substring(0, 19);
            } catch (Exception e) {
                log.debug("Class : CheckValid Method : isValid() Error : "+e.getMessage());
            }
		boolean flag = true;
		try {
			String delimeter = "-";
                    //  String mac = SendSystemInfo.getMacAddress();
                        
                       String mac = SendSystemInfo.getEthernetMacAddress();
                      
                        if(mac.length()>0)
                        {
                            String rawAddressString = getParseString(mac, delimeter);
//                            log.debug("customerV:"+customerLabel+"-"+rawAddressString+"-"+variable);
                            String compareString = getInputKeyString(customerLabel+rawAddressString+variable);
//                            log.debug("compareString:"+compareString+"_"+activationCode);
                            if(!compareString.equals(activationCode)) {
				flag = false;
                            }
                        }
		} catch (Exception e) {
			log.debug("Class : CheckValid Method : isValid() Exception: "+e);
		}
//                log.debug("Product Checked valid:"+flag);
                return flag;
	}
	
	public String getConcatInput(String customerId, String mac, String variable) {
		String concatInput = "";
		concatInput = customerId.concat(mac).concat(variable);
		return concatInput;
	}
	
	protected String getInputKeyString(String concatInput) {
		CheckValid valid = new CheckValid();
		String productNumberEncoded;
		String productNumberCalc = "";
		try {
			productNumberEncoded = valid.calculateHexaFormatMessage(concatInput,"MD2")
			+ valid.calculateHexaFormatMessage(concatInput,"SHA-384")
			+ valid.calculateHexaFormatMessage(concatInput,"MD5");
			int length = productNumberEncoded.trim().length()-1;
			int j=1;
			for(int i=1; i<=16; i++) {
				productNumberCalc += productNumberEncoded.charAt(length) ;
				if(j == 4 && i < 16) {
					productNumberCalc = productNumberCalc+"-";
					j = 0;
				}
				length = Math.abs(length-10);
				j++;
			}
		} catch (NoSuchAlgorithmException e) {
			log.debug("Class : CheckValid Method : getInputKeyString()"+e);
		}
		return productNumberCalc;
	}
	
	public String getParseString(String parseString, String delimeter) {
		String pureString = "";
		String[] strings = parseString.split("-");
		int arraySize = strings.length;
		for(int i=0; i < arraySize; i++) {
			pureString += strings[i].toString();
		}
		return pureString;
	}
	
	private String calculateHexaFormatMessage(String stringInput, String algorithmName) throws java.security.NoSuchAlgorithmException {
		String hexaFormatMessage = "";
		byte[] buffer = stringInput.getBytes();
		java.security.MessageDigest messageDigest = java.security.MessageDigest.getInstance(algorithmName);
		messageDigest.update(buffer);
		byte[] messageDigestBytes = messageDigest.digest();
		for (int index=0; index < messageDigestBytes.length ; index ++) {
			int countEncode = messageDigestBytes[index] & 0xff;
			if (Integer.toHexString(countEncode).trim().length() == 1) hexaFormatMessage = hexaFormatMessage + "0";
			hexaFormatMessage = hexaFormatMessage + Integer.toHexString(countEncode);
		}
		return hexaFormatMessage;
	}


}
