@isTest
public with sharing class DuplicateLead {
    @TestSetup
    public static void Data(){
    	Account a = New Account(name = 'Test Account');
		Contact c = new Contact(lastName = 'Test Contact');
		Product2 p = new Product2(name = 'Test Product');
//		Lead l = New Lead(name = ‘Test 1’);
//		Lead l2 = New Lead(name = ‘Test 1’);
		insert a;
		insert c;
		insert p;
//		insert l;
//		insert l2;
    	
    }
    
    @isTest
    public static void testDuplicateLead() {
//    	Lead l = [SELECT email, accountID, contactID, productID FROM Lead LIMIT 1];
//    	Lead l2 = [SELECT email, accountID, contactID, productID FROM Lead LIMIT 1 OFFSET 1];
    	Account a = [SELECT ID FROM Account LIMIT 1];
		Contact c = [SELECT ID FROM Contact LIMIT 1];
//		Product p = [SELECT ID FROM Product2 LIMIT 1];
//    	System.assertequals('0', l.duplicity);
    	
//    	l.email = 'jane.doe@gmail.com';
//    	l2.email = l.email;
//    	update l;
//    	update l2;
//    	System.assertequals('.25', l.duplicity);
    	
//    	l.accountid = a.id;
//    	l2.accountid = a.id;
//    	update l;
//    	update l2;
//    	System.assertequals('.5', l.duplicity);
    	
//    	l.contactid = c.id;
//    	l2.contactid = c.id;
//    	update l;
//    	update l2;
//    	System.assertequals('.75', l.duplicity);
    	
//    	l.productid = p.id;
//    	l2.productid = p.id;
//    	update l;
//    	update l2;
//    	System.assertequals('1', l.duplicity);
    }
}