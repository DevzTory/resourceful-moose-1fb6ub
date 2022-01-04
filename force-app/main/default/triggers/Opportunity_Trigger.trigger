trigger Opportunity_Trigger on Opportunity (after insert) {
    
    if (Trigger.isAfter){
        Opportunity_Trigger_Handler.onAfterUpdate(trigger.New);
    }
}