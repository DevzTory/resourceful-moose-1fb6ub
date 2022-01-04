@isTest
private class AccountTriggerTest {
    
    @isTest static void CreateAccounts(){
        
        List<Account> acctList = new List<Account>();
        Integer cnt;
        
        for(cnt = 1; cnt < 201; cnt++){
            
            Account acct = new Account(Name = 'Account'+cnt, BillingState = 'CA');
            acctList.add(acct);        
        }
        
        Test.startTest();
        insert acctList;
        Test.stopTest();
        
        System.assertEquals(200, [SELECT Id FROM Account].Size());
        
        
    }

}