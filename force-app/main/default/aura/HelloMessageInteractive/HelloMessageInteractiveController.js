({
    handleClick: function(component, event, helper) {
        var btnClicked = event.getSource();         // get the button
        var btnMessage = btnClicked.get("v.label"); // get the button's label
        component.set("v.message", btnMessage);     // update attribute "v.message" with btnMessage value
    },
    handleClick2: function(component, event, helper) {
        var newMessage = event.getSource().get("v.label"); //shorter code
        console.log("handleClick2: Message: " + newMessage);
        component.set("v.message", newMessage);
    },
    handleClick3: function(component, event, helper) {
        component.set("v.message", event.getSource().get("v.label")); //shorter code
    }
    
})