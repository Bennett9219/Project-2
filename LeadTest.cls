@isTest
public with sharing class LeadTest {
	@testSetup
	public static void lData (){
		Account aTest = new Account(Name = 'aTest');
		Contact cTest = new Contact(LastName = 'cTest');
//		Lead = lTestProduct = new Lead(LastName = 'lTestProduct', Company = 'lTestProduct', Products__c = 'asdf;asdf1;asdf2;asdf3');
//		insert lTestProduct;
		insert aTest;
		insert cTest;	
				
	}
	
	@isTest
	public static void lTestAccountContact() {
		Account aID = [SELECT ID FROM Account];
		Contact cID = [SELECT ID FROM Contact];
		
//		Lead lTestAccount = new Lead(LastName = 'lTestAccount', Company = 'lTestAccount', Account_c = aID.ID);
//		Lead lTestContact = new Lead(LastName = 'lTestContact', Company = 'lTestContact', Contact__c = cID.ID);
//		Lead lTestAccountContact = new Lead(LastName = 'lTestAccountContact', Company = 'lTestAccountContact', 
//											Account_c = aID.ID, Contact__c = cID.ID);
		Lead lTestLead = new Lead(LastName = 'lTest', Company = 'lTest');
		
		Database.SaveResult lResultAccount = Database.insert(lTestAccount, false);
		Database.SaveResult lResultContact = Database.insert(lTestContact, false);
		Database.SaveResult lResultAccountContact = Database.insert(lTestAccountContact);
		Database.SaveResult lResultLead = Database.insert(lTestLead, false);
		
		system.assertEquals(true, lResultAccount.isSuccess());
		system.assertEquals(true, lResultContact.isSuccess());
		system.assertEquals(true, lResultAccountContact.isSuccess());
		system.assertEquals(true, lResultLead.isSuccess());
	}
	
	public static void lTestConversion() {
//		Lead lTest = [SELECT Id, Products__c FROM Lead];
		// Set up leadconvert object, this helps perform conversion
		Database.LeadConvert lc = new database.LeadConvert();
		// Add the test lead as the object we want to convert
//		lc.setLeadId(lTest.ID);
		// Fetch the desired conversion status for the test lead we are converting
		LeadStatus convertedStatus = [SELECT Id, MasterLabel FROM LeadStatus 
									  WHERE IsConverted = true LIMIT 1];
		// Set the conversion status
		lc.setConvertedStatus(convertedStatus.MasterLabel);
		// Attempt conversion
		Database.LeadConvertResult lcr = Database.convertLead(lc);
		// On success, we can check if Product was successfully created with matching Products
		if (lcr.isSuccess()) {
//			Opportunity tOpportunity = [SELECT Products__c FROM Opportunity LIMIT 1];
//			System.assertEquals(lTest.Products__c, tOpportunity.Products__c);
		}
	}
}