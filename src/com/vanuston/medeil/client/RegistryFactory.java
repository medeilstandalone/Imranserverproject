package com.vanuston.medeil.client;

import java.rmi.ConnectException;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import com.vanuston.medeil.implementation.*;
//import com.vanuston.medeil.util.GetUserInfo;
import com.vanuston.medeil.util.Logger;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.util.StubType;
import java.net.InetAddress;
import java.net.UnknownHostException;
import javax.swing.JOptionPane;


public class RegistryFactory {
    
    public static int errCnt = 0;
    public static String serverHostIP;

    public static Integer serverPort = 20202;
    public static Logger log = Logger.getLogger(RegistryFactory.class, "RegistryFactory");
    private RegistryFactory() {
        super();
    }
    public static Object getClientStub(String moduleTypeString) throws RemoteException, NotBoundException {
        Registry clientRegistry = null;
        try {
        if (serverHostIP == null || serverPort == null || serverHostIP.equals("")) {            
            serverHostIP = (InetAddress.getLocalHost()).getHostAddress();
            serverPort = 20202;
        }
        if(!serverHostIP.equals((InetAddress.getLocalHost()).getHostAddress())) {
		serverHostIP = (InetAddress.getLocalHost()).getHostAddress();
                log.debug("system host sddress has been changed restart clients with this IP :"+serverHostIP +" and Port:"+serverPort);
		JOptionPane.showMessageDialog(null, "system host sddress has been changed restart clients with this IP :"+serverHostIP +" and Port:"+serverPort);
	}
        } catch (UnknownHostException ex) {
                Logger.getLogger(RegistryFactory.class,"RegistryFactory").debug("Method:getClientStub UnknownHostException_1:"+ex.getMessage());
        }
        clientRegistry = LocateRegistry.getRegistry(serverHostIP, serverPort);
        StubType stubType = StubType.valueOf(moduleTypeString);
        try {
            BankAccount bankAccountStub;
            BankBook bankBookStub;
            BaseImplements baseImplementsStub;
            ChequeBook chequeBookStub;
            ChequeTransaction chequeTransactionStub;
            CommonImplements commonImplementsStub;
            ComplaintRegister complaintRegisterStub;
            Settings configurationStub;
            CreditNote creditNoteStub;
            Customer customerStub;
            CustomerAlerts customerAlertsStub;
            DailyCashBook dailyCashBookStub;
            DamageStock damageStockStub;
            DebitNote debitNoteStub;
            Distributor distributorStub;
            Doctor doctorStub;
            Employee employeeStub;
            EmployeeSalary employeeSalaryStub;
            Hospital hospitalStub;
            MaintenanceCost maintenanceCostStub;
            Payment paymentStub;
            PrintSettings printSettingsStub;
            Purchase purchaseStub;
            PurchaseOrder purchaseOrderStub;
            Receipt receiptStub;
            Sales salesStub;
            Stock stockStub;
            StoreInformation storeInformationStub;
            UserInformation userInformationStub;
            VatRegister vatRegisterStub;
            Drug drugStub;
            ExpiryReturn expiryReturnStub;
            Prescription prescriptionFormatStub;
          
            switch (stubType) {
                case BankAccountStub:
                    bankAccountStub = (com.vanuston.medeil.implementation.BankAccount) clientRegistry.lookup(RegistryConstants.BankAccount);
                    return bankAccountStub;
                case BankBookStub:
                    bankBookStub = (com.vanuston.medeil.implementation.BankBook) clientRegistry.lookup(RegistryConstants.BankBook);
                    return bankBookStub;
                case BaseImplementsStub:
                    baseImplementsStub = (com.vanuston.medeil.implementation.BaseImplements) clientRegistry.lookup(RegistryConstants.BaseImplements);
                    return baseImplementsStub;
                case ChequeBookStub:
                    chequeBookStub = (com.vanuston.medeil.implementation.ChequeBook) clientRegistry.lookup(RegistryConstants.ChequeBook);
                    return chequeBookStub;
                case ChequeTransactionStub:
                    chequeTransactionStub = (com.vanuston.medeil.implementation.ChequeTransaction) clientRegistry.lookup(RegistryConstants.ChequeTransaction);
                    return chequeTransactionStub;
                case CommonImplementsStub:
                    commonImplementsStub = (com.vanuston.medeil.implementation.CommonImplements) clientRegistry.lookup(RegistryConstants.CommonImplements);
                    return commonImplementsStub;
                case ComplaintRegisterStub:
                    complaintRegisterStub = (com.vanuston.medeil.implementation.ComplaintRegister) clientRegistry.lookup(RegistryConstants.ComplaintRegister);
                    return complaintRegisterStub;
                case ConfigurationStub:
                    configurationStub = (com.vanuston.medeil.implementation.Settings) clientRegistry.lookup(RegistryConstants.Configuration);
                    return configurationStub;
                case CreditNoteStub:
                    creditNoteStub = (com.vanuston.medeil.implementation.CreditNote) clientRegistry.lookup(RegistryConstants.CreditNote);
                    return creditNoteStub;
                case CustomerStub:
                    customerStub = (com.vanuston.medeil.implementation.Customer) clientRegistry.lookup(RegistryConstants.Customer);
                    return customerStub;
                case CustomerAlertsStub:
                    customerAlertsStub = (com.vanuston.medeil.implementation.CustomerAlerts) clientRegistry.lookup(RegistryConstants.CustomerAlerts);
                    return customerAlertsStub;
                case DailyCashBookStub:
                    dailyCashBookStub = (com.vanuston.medeil.implementation.DailyCashBook) clientRegistry.lookup(RegistryConstants.DailyCashBook);
                    return dailyCashBookStub;
                case DamageStockStub:
                    damageStockStub = (com.vanuston.medeil.implementation.DamageStock) clientRegistry.lookup(RegistryConstants.DamageStock);
                    return damageStockStub;
                case DebitNoteStub:
                    debitNoteStub = (com.vanuston.medeil.implementation.DebitNote) clientRegistry.lookup(RegistryConstants.DebitNote);
                    return debitNoteStub;
                case DistributorStub:
                    distributorStub = (com.vanuston.medeil.implementation.Distributor) clientRegistry.lookup(RegistryConstants.Distributor);
                    return distributorStub;
                case DoctorStub:
                    doctorStub = (com.vanuston.medeil.implementation.Doctor) clientRegistry.lookup(RegistryConstants.Doctor);
                    return doctorStub;
                case EmployeeStub:
                    employeeStub = (com.vanuston.medeil.implementation.Employee) clientRegistry.lookup(RegistryConstants.Employee);
                    return employeeStub;
                case EmployeeSalaryStub:
                    employeeSalaryStub = (com.vanuston.medeil.implementation.EmployeeSalary) clientRegistry.lookup(RegistryConstants.EmployeeSalary);
                    return employeeSalaryStub;
                case HospitalStub:
                    hospitalStub = (com.vanuston.medeil.implementation.Hospital) clientRegistry.lookup(RegistryConstants.Hospital);
                    return hospitalStub;
                case MaintenanceCostStub:
                    maintenanceCostStub = (com.vanuston.medeil.implementation.MaintenanceCost) clientRegistry.lookup(RegistryConstants.MaintenanceCost);
                    return maintenanceCostStub;
                case PaymentStub:
                    paymentStub = (com.vanuston.medeil.implementation.Payment) clientRegistry.lookup(RegistryConstants.Payment);
                    return paymentStub;
                case PrintSettingsStub:
                    printSettingsStub = (com.vanuston.medeil.implementation.PrintSettings) clientRegistry.lookup(RegistryConstants.PrintSettings);
                    return printSettingsStub;
                case PurchaseStub:
                    purchaseStub = (com.vanuston.medeil.implementation.Purchase) clientRegistry.lookup(RegistryConstants.Purchase);
                    return purchaseStub;
                case PurchaseOrderStub:
                    purchaseOrderStub = (com.vanuston.medeil.implementation.PurchaseOrder) clientRegistry.lookup(RegistryConstants.PurchaseOrder);
                    return purchaseOrderStub;
                case ReceiptStub:
                    receiptStub = (com.vanuston.medeil.implementation.Receipt) clientRegistry.lookup(RegistryConstants.Receipt);
                    return receiptStub;
                case SalesStub:
                    salesStub = (com.vanuston.medeil.implementation.Sales) clientRegistry.lookup(RegistryConstants.Sales);
                    return salesStub;
                case StockStub:
                    stockStub = (com.vanuston.medeil.implementation.Stock) clientRegistry.lookup(RegistryConstants.Stock);
                    return stockStub;
                case StoreInformationStub:
                    storeInformationStub = (com.vanuston.medeil.implementation.StoreInformation) clientRegistry.lookup(RegistryConstants.StoreInformation);
                    return storeInformationStub;
                case UserInformationStub:
                    userInformationStub = (com.vanuston.medeil.implementation.UserInformation) clientRegistry.lookup(RegistryConstants.UserInformation);
                    return userInformationStub;
                case VatRegisterStub:
                    vatRegisterStub = (com.vanuston.medeil.implementation.VatRegister) clientRegistry.lookup(RegistryConstants.VatRegister);
                    return vatRegisterStub;
                case DrugStub:
                    drugStub = (com.vanuston.medeil.implementation.Drug) clientRegistry.lookup(RegistryConstants.Drug);
                    return drugStub;
                case ExpiryReturnStub:
                    expiryReturnStub = (com.vanuston.medeil.implementation.ExpiryReturn) clientRegistry.lookup(RegistryConstants.ExpiryReturn);
                    return expiryReturnStub;
                case PrescriptionFormatStub:
                    prescriptionFormatStub = (com.vanuston.medeil.implementation.Prescription) clientRegistry.lookup(RegistryConstants.PrescriptionFormat);
                    return prescriptionFormatStub;
              
                default:
                    // Add logger
                    
                    return null;
            }
        } catch (ConnectException e) {       
            try {
                 serverHostIP = (InetAddress.getLocalHost()).getHostAddress();
                 errCnt = 10;
            } catch (UnknownHostException ex) {
                Logger.getLogger(RegistryFactory.class,"RegistryFactory").debug("Method:getClientStub UnknownHostException_2:"+ex.getMessage());                
                ex.printStackTrace();
            }
        }
        return null;
    }
}
