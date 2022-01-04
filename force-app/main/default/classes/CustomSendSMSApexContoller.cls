public class CustomSendSMSApexContoller {
    
    @AuraEnabled
    public static String DoSendSMS(String recordId){
        
        Lead leadContc = [SELECT Id, FirstName, MobilePhone FROM Lead WHERE Id = :recordId LIMIT 1];
        
        if(leadContc == null)
        {
            return 'false';
        }
        
        String smsUrl = 'https://advsms.advancenetgroup.co.za/AdvanceSMSWebService.svc/rest/sendsinglesms/'+ leadContc.MobilePhone +'/Hi '+ leadContc.FirstName +', visit our exciting Annual Open Day this winter!/ADVANCENET';
        System.debug(smsUrl);
        return smsUrl;
    }
}