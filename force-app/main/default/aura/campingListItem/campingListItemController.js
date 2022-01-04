({
	packItem : function(component, event, helper) {
        
        var cmpItem = component.get("v.item",true); // get the object "v.item (Camping_Item__c)"
        console.log("packItem: Message: " + JSON.stringify(cmpItem));        
        
        cmpItem.Packed__c = true; //set Packed__c to true
        component.set("v.item",cmpItem); //update object
        
        
        var btnClicked = event.getSource();  //get the button that generated the event
        btnClicked.set("v.disabled", true); //set the disabled attribute the button to true		
	}
})