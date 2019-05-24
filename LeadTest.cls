@isTest
public with sharing class LeadTest {
	@testSetup
	public static void lData (){
		Account aTest = new Account(Name = 'aTest');
		Contact cTest = new Contact(LastName = 'cTest');
		
		insert aTest;
		insert cTest;	
				
	}
	
	@isTest
	public static void lTestAccountContact() {
		Account aID = [SELECT ID FROM Account];
		Contact cID = [SELECT ID FROM Contact];
		
		Lead lTestAccount = new Lead(LastName = 'lTestAccount', Company = 'lTestAccount', Account_c = aID.ID);
		Lead lTestContact = new Lead(LastName = 'lTestContact', Company = 'lTestContact', Contact__c = cID.ID);
		Lead lTestAccountContact = new Lead(LastName = 'lTestAccountContact', Company = 'lTestAccountContact', 
											Account_c = aID.ID, Contact__c = cID.ID);
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
}