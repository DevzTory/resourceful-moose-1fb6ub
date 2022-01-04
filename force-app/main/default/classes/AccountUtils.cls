public class AccountUtils {

    public static List<Account> accountsByState(String state){
        
        List<Account> lstAccts = [SELECT id, Name FROM Account WHERE BillingState = :state];
        
        return lstAccts;
    }
}