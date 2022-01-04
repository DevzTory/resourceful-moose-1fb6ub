// From Trailhead Asynchronous Apex 
@isTest
public class AccountProcessorTest {
    
    @IsTest
    public static void testCountContacts() {
                
        Account acct = new Account(name='TestingAcc');
        insert acct;
        
        Account acct2 = new Account(name='LaVida');
        insert acct2;
            
        Contact cnct = new Contact(Firstname='Missy', Lastname='Missy', AccountId=acct.Id);
        insert cnct;
        
        Contact cnct1 = new Contact(Firstname='Lilly', Lastname='Paws', AccountId=acct.Id);
        insert cnct1;
            
        List<Id> Ids = new List<Id>();
        Ids.add(acct.Id);
        Ids.add(acct2.Id);
        
        Test.setMock(HttpCalloutMock.class, new ContactCalloutMock());
        Test.startTest();
            AccountProcessor.countContacts(Ids);
        Test.stopTest();
        
        /*// runs callout and check results
        List<SMS_Log__c> logs = [select msg__c from SMS_Log__c];
        System.assertEquals(1, logs.size());
        System.assertEquals('success', logs[0].msg__c);
        */
    }   
}