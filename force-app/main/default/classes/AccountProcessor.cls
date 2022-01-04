// From Trailhead Asynchronous Apex 
public class AccountProcessor {
    
    @future
    public static void countContacts(List<Id> listAcctIds){
        
        for(String Id : listAcctIds){            
            Account acct = [SELECT Id, Number_of_Contacts__c, (SELECT Id FROM Contacts) from Account WHERE Id = :Id];
            
            List<Contact> listAccts = acct.Contacts;
            
            acct.Number_of_Contacts__c  = listAccts.Size();
            update acct;
        }
        
    }
    
}