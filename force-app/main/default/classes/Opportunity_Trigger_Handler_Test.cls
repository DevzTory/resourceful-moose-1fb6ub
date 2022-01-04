@IsTest
public class Opportunity_Trigger_Handler_Test{
    
    static void createTestData() {
        
        Account acct1 = new Account(name = 'New1');
        Account acct2 = new Account(name = 'New2');
        Account acct3 = new Account(name = 'New3');
        
        insert acct1;
        insert acct2;
        insert acct3;
        
        Contact cntac1 = new Contact(Firstname ='Bob1', Lastname = 'Test', AccountId = acct1.Id, Level__c = 'Primary');
        Contact cntac2 = new Contact(Firstname ='Bob2', Lastname = 'Test', AccountId = acct1.Id, Level__c = 'Primary');
        Contact cntac3 = new Contact(Firstname ='Bob3', Lastname = 'Test', AccountId = acct2.Id, Level__c = 'Primary');
        insert cntac1;
        insert cntac2;
        insert cntac3;
    }
    
    @isTest static void verifyLinkedContacts(){
        createTestData();
        
        test.startTest();
        Account acct1 = [SELECT Id, Name FROM Account WHERE name = 'New1' LIMIT 1];
        Account acct2 = [SELECT Id, Name FROM Account WHERE name = 'New2' LIMIT 1];
        
        Opportunity opp = new Opportunity(Name = 'OppSky',StageName ='Conquer', AccountId = acct1.Id, CloseDate = System.today().addMOnths(1));
        insert opp;
        
        Opportunity opp2 = new Opportunity(Name = 'OppSea',StageName ='Analysis', AccountId = acct2.Id, CloseDate = System.today().addMOnths(5));
        insert opp2;
        Opportunity opp3 = new Opportunity(Name = 'OppCloud',StageName ='Analysis', AccountId = acct2.Id, CloseDate = System.today().addMOnths(3));
        insert opp3;
        Opportunity opp4 = new Opportunity(Name = 'OppForce',StageName ='Analysis', AccountId = acct2.Id, CloseDate = System.today().addMOnths(2));
        insert opp4;
        
        List<OpportunityContactRole> lstOpps = [SELECT id FROM OpportunityContactRole WHERE opportunityId = :opp.Id]; 
        
        System.assertEquals(2, lstOpps.size());
        test.stopTest();
    }
    
}