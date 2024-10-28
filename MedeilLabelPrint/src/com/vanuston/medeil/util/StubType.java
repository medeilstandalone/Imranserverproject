package com.vanuston.medeil.util;

/**

 * @version medeil 1.0
 * @description This enum StubType have all module type name with order.
 * 				This is mainly involved in RegistryFactory class switch case.
 * @caution You can add additional type with it. When you need to modify the order of this enum type please double check with RegistryFactory class.
 */

public enum StubType {
	BankAccountStub, BankBookStub, BaseImplementsStub, ChequeBookStub, ChequeTransactionStub, CommonImplementsStub,
	ComplaintRegisterStub, ConfigurationStub, CreditNoteStub, CustomerStub, CustomerAlertsStub, DailyCashBookStub,
	DamageStockStub, DebitNoteStub, DistributorStub, DoctorStub, EmployeeStub, EmployeeSalaryStub, HospitalStub,
	LabelPrinStub, MaintenanceCostStub, PaymentStub, PrintSettingsStub, PurchaseStub, PurchaseOrderStub, ReceiptStub, SalesStub,
	StockStub, StoreInformationStub, UserInformationStub, VatRegisterStub, DrugStub, ExpiryReturnStub, PrescriptionFormatStub
}
