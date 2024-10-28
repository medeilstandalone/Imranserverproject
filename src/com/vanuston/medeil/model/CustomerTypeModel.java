package com.vanuston.medeil.model;

/**
 *
 * @author san
 */
import java.io.Serializable;
import java.util.List;

public class CustomerTypeModel implements Serializable  {
    private static final long serialVersionUID = 1L ;

    private String customertype;
    private Double customerPercent;
    private List<CustomerTypeModel> listModel ;

    public Double getCustomerPercent() {
        return customerPercent;
    }

    public void setCustomerPercent(Double customerPercent) {
        this.customerPercent = customerPercent;
    }

    public String getCustomertype() {
        return customertype;
    }

    public void setCustomertype(String customertype) {
        this.customertype = customertype;
    }

    public List<CustomerTypeModel> getListModel() {
        return listModel;
    }

    public void setListModel(List<CustomerTypeModel> listModel) {
        this.listModel = listModel;
    }


}
