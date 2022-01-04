trigger EmailMatchTriggerRob on Contact (before update) {
    
    /*for(Contact n : trigger.new) //trigger.new is a list of new Objects
    {
        Contact old = Trigger.oldMap.get(n.id);
        if(n.Email  != old.Email )
        {
            n.Email.addError('Email cannot be changed');        
        }
    }*/
    
    for(Contact n : trigger.new) //trigger.new is a list of new Objects
    {
        Contact old = Trigger.oldMap.get(n.id);
        
        System.debug('New '+ n.Email);
        System.debug('Old '+ old.Email);
    
        if(n.Email  == old.Email )
        {
           System.debug('Emails match');
        }else{System.debug('Emails do not match');}
    }
}