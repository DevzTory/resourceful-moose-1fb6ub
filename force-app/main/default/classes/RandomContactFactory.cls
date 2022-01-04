public class RandomContactFactory {
	
    public static List<Contact> generateRandomContacts(Integer numOfContcs, String lastName){
        List<Contact> lstContcs = new List<Contact>();
        
        for(Integer cnt = 0; cnt < numOfContcs; cnt++){
            
            //Contact c = new Contact(Firstname = 'Name'+cnt, Lastname = lastName);
            lstContcs.add(new Contact(Firstname = 'Name'+cnt, Lastname = lastName));
        }
        
     return lstContcs;   
    }
}