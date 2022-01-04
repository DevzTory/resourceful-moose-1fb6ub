public class Opportunity_Trigger_Handler {
    
    public static void onAfterUpdate(List<Opportunity> lstOpp){
        
        Map<String, String> acctOppMap = new Map<String,String>();
        Map<String, String> oppCntacMap = new Map<String,String>();
        
        Set<Id> oppAcctIds = new Set<Id>();
        List<OpportunityContactRole> lstOppCtctRole = new List<OpportunityContactRole>(); 
        
        //Get Account Ids on all new opportunities
        //Map account Ids to opportunity Ids
        for(Opportunity opp: lstOpp){
            oppAcctIds.add(opp.accountId);
            
            acctOppMap.put(opp.AccountId, opp.Id);
        }
        
        //Get related key contacts
        List<Contact> lstCntcs = [SELECT id, name, accountId FROM Contact WHERE accountId IN :oppAcctIds AND Level__c = 'Primary'];
        
        //Map contact Ids to opportunity Ids
        for(Contact cntac:lstCntcs){
            if(acctOppMap.containsKey(cntac.accountId)){
                oppCntacMap.put(cntac.Id,acctOppMap.get(cntac.accountId));
            }
        }
        
        //Link key contacts to new opportunities
        for(String keyCntac: oppCntacMap.keySet()){
            OpportunityContactRole oppRole = new OpportunityContactRole (ContactId = keyCntac, OpportunityId = oppCntacMap.get(keyCntac));
            lstOppCtctRole.add(oppRole);
        }
        System.debug(lstOppCtctRole);
        
        If(lstOppCtctRole.Size() > 0){
            insert lstOppCtctRole;
        }
    }      
}