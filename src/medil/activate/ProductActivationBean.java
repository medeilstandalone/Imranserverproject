package medil.activate;
import java.io.Serializable;

public class ProductActivationBean implements Serializable {
	/**
	 * @author karthikeyan subburaj
	 * This bean class is used to collect product info and send to medeil server. 
	 */
	private static final long serialVersionUID = 1L;
	private String nameString;
	private String pwordString;
	private String productLabel;
	private String productCode;
	private String macString;
	
	public ProductActivationBean(String nameString, String pwordString,
			String productLabel, String productCode, String macString) {
		super();
		this.nameString = nameString;
		this.pwordString = pwordString;
		this.productLabel = productLabel;
		this.productCode = productCode;
		this.macString = macString;
	}
	public String getNameString() {
		return nameString;
	}
	public void setNameString(String nameString) {
		this.nameString = nameString;
	}
	public String getPwordString() {
		return pwordString;
	}
	public void setPwordString(String pwordString) {
		this.pwordString = pwordString;
	}
	public String getProductLabel() {
		return productLabel;
	}
	public void setProductLabel(String productLabel) {
		this.productLabel = productLabel;
	}
	public String getProductCode() {
		return productCode;
	}
	public void setProductCode(String productCode) {
		this.productCode = productCode;
	}
	public String getMacString() {
		return macString;
	}
	public void setMacString(String macString) {
		this.macString = macString;
	}
	
}
