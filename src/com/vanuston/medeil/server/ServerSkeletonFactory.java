package com.vanuston.medeil.server;

import java.io.Serializable;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.rmi.NotBoundException;
import java.rmi.RemoteException;
import java.rmi.registry.LocateRegistry;
import java.rmi.registry.Registry;
import java.rmi.server.UnicastRemoteObject;
import com.vanuston.medeil.controller.*;
import com.vanuston.medeil.implementation.*;
import com.vanuston.medeil.util.RegistryConstants;
import com.vanuston.medeil.util.Logger;
import java.lang.management.ManagementFactory;

public class ServerSkeletonFactory extends UnicastRemoteObject implements Serializable {

    /**
     *
     */

    private static final long serialVersionUID = 1L;

    public ServerSkeletonFactory() throws RemoteException {
        super();
    }

    public static void run(Integer serverPort) throws RemoteException, NotBoundException {
        try {
	    Logger.getLogger(ServerSkeletonFactory.class, "ServerSkeletonFactory").debug("IP:" + (InetAddress.getLocalHost()).getHostAddress() + ", port:"+serverPort);
	} catch (UnknownHostException ex) {
	    Logger.getLogger(ServerSkeletonFactory.class, "ServerSkeletonFactory").debug("Method:run UnknownHostException:"+ex.getMessage());
	}
        long memoryrSize = ((com.sun.management.OperatingSystemMXBean) ManagementFactory.getOperatingSystemMXBean()).getTotalPhysicalMemorySize();
        Registry serverRegistry = LocateRegistry.createRegistry(serverPort);

        BankAccount bankAccountSkeleton = new BankAccountController();
        serverRegistry.rebind(RegistryConstants.BankAccount, bankAccountSkeleton);

        BankBook BankBookSkeleton = new BankBookController();
        serverRegistry.rebind(RegistryConstants.BankBook, BankBookSkeleton);

        ChequeBook chequeBookSkeleton = new ChequeBookController();
        serverRegistry.rebind(RegistryConstants.ChequeBook, chequeBookSkeleton);

        ChequeTransaction chequeTransactionSkeleton = new ChequeTransactionController();
        serverRegistry.rebind(RegistryConstants.ChequeTransaction, chequeTransactionSkeleton);

        CommonImplements commonImplementsSkeleton = new CommonController();
        serverRegistry.rebind(RegistryConstants.CommonImplements, commonImplementsSkeleton);

        ComplaintRegister complaintRegisterSkeleton = new ComplaintRegisterController();
        serverRegistry.rebind(RegistryConstants.ComplaintRegister, complaintRegisterSkeleton);

        Settings configurationSkeleton = new SettingsController();
        serverRegistry.rebind(RegistryConstants .Configuration, configurationSkeleton);

        CreditNote creditNoteSkeleton = new CreditNoteController();
        serverRegistry.rebind(RegistryConstants.CreditNote, creditNoteSkeleton);

        Customer customerSkeleton = new CustomerController();
        serverRegistry.rebind(RegistryConstants.Customer, customerSkeleton);

        CustomerAlerts customerAlertsSkeleton = new CustomerAlertsController();
        serverRegistry.rebind(RegistryConstants.CustomerAlerts, customerAlertsSkeleton);

        DailyCashBook dailyCashBookSkeleton = new DailyCashBookController();
        serverRegistry.rebind(RegistryConstants.DailyCashBook, dailyCashBookSkeleton);

        DamageStock damageStockSkeleton = new DamageStockController();
        serverRegistry.rebind(RegistryConstants.DamageStock, damageStockSkeleton);

        DebitNote debitNoteSkeleton = new DebitNoteController();
        serverRegistry.rebind(RegistryConstants.DebitNote, debitNoteSkeleton);

        Distributor distributorSkeleton = new DistributorController();
        serverRegistry.rebind(RegistryConstants.Distributor, distributorSkeleton);

        Doctor doctorSkeleton = new DoctorController();
        serverRegistry.rebind(RegistryConstants.Doctor, doctorSkeleton);

        Employee employeeSkeleton = new EmployeeController();
        serverRegistry.rebind(RegistryConstants.Employee, employeeSkeleton);

        EmployeeSalary employeeSalarySkeleton = new EmployeeSalaryController();
        serverRegistry.rebind(RegistryConstants.EmployeeSalary, employeeSalarySkeleton);

        Hospital hospitalSkeleton = new HospitalController();
        serverRegistry.rebind(RegistryConstants.Hospital, hospitalSkeleton);

        MaintenanceCost maintenanceCostSkeleton = new MaintenanceCostController();
        serverRegistry.rebind(RegistryConstants.MaintenanceCost, maintenanceCostSkeleton);

        Payment paymentSkeleton = new PaymentController();
        serverRegistry.rebind(RegistryConstants.Payment, paymentSkeleton);

        PrintSettings printSettingsSkeleton = new PrintSettingsController();
        serverRegistry.rebind(RegistryConstants.PrintSettings, printSettingsSkeleton);

        Purchase purchaseSkeleton = new PurchaseController();
        serverRegistry.rebind(RegistryConstants.Purchase, purchaseSkeleton);

        PurchaseOrder purchaseOrderSkeleton = new PurchaseOrderController();
        serverRegistry.rebind(RegistryConstants.PurchaseOrder, purchaseOrderSkeleton);

        Receipt receiptSkeleton = new ReceiptController();
        serverRegistry.rebind(RegistryConstants.Receipt, receiptSkeleton);

        Sales salesSkeleton = new SalesController();
        serverRegistry.rebind(RegistryConstants.Sales, salesSkeleton);

        Stock stockSkeleton = new StockController();
        serverRegistry.rebind(RegistryConstants.Stock, stockSkeleton);

        StoreInformation storeInformationSkeleton = new StoreInformationController();
        serverRegistry.rebind(RegistryConstants.StoreInformation, storeInformationSkeleton);

        UserInformation userInformationSkeleton = new UserInformationController();
        serverRegistry.rebind(RegistryConstants.UserInformation, userInformationSkeleton);

        VatRegister vatRegisterSkeleton = new VatRegisterController();
        serverRegistry.rebind(RegistryConstants.VatRegister, vatRegisterSkeleton);

        Drug drugSkeleton = new DrugController();
        serverRegistry.rebind(RegistryConstants.Drug, drugSkeleton);

        ExpiryReturn expiryReturnSkeleton = new ExpiryReturnController();
        serverRegistry.rebind(RegistryConstants.ExpiryReturn, expiryReturnSkeleton);

        Prescription prescriptionSkeleton = new PrescriptionController();
        serverRegistry.rebind(RegistryConstants.PrescriptionFormat, prescriptionSkeleton);



    }

    public String getIPAddress() {
        String serverHostIP = "";
        try {
            serverHostIP = (InetAddress.getLocalHost()).getHostAddress();
        } catch (UnknownHostException e) {
            Logger.getLogger(ServerSkeletonFactory.class, "ServerSkeletonFactory").debug("Method:getIPAddress Exception:"+e.getMessage());
        }
        return serverHostIP;
    }
//	public static void main(String[] args) throws RemoteException,NotBoundException {
//		ServerSkeletonFactory.run(20202);
//		ServerSkeletonFactory factory = new ServerSkeletonFactory();

//	}
}
