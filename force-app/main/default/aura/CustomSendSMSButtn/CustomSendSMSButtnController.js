({
	openSendSMS: function(component, event, helper) {      
        var action = component.get("c.DoSendSMS");    
        var recordId = component.get("v.recordId");
        
        action.setParams({
            "recordId":recordId
        });
		        
        
        action.setCallback(component,
                           function(response) {
                               var state = response.getState();
                               var urlEvent = $A.get("e.force:navigateToURL");
                               
                               if (state === 'SUCCESS'){
                                   
                                   if(response.getReturnValue() == 'false'){
                                       alert('Contact Administrator');
                                   }
                                   else{
                                       urlEvent.setParams({
                                           "url": response.getReturnValue()
                                       });
                                       urlEvent.fire();
                                   }
                               } else {
                                   alert('Error. Please contact administrator');
                               }
                           }
                          );
        
        // Queue this action to send to the server
        $A.enqueueAction(action);
    }
})