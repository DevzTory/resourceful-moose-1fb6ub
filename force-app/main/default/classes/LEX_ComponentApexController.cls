public class LEX_ComponentApexController {
	@AuraEnabled
    public static List<Account> getAccounts() {
        List<Account> accounts = [SELECT Id, Name
                                  FROM Account 
                                  LIMIT 20];
        return accounts;
    }
}