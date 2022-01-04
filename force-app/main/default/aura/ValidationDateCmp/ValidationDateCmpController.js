({
    dateUpdate : function(component, event, helper) {
        var today = new Date();        
        var dd = today.getDate();
        var mm = today.getMonth() + 1; //January is 0!
        var yyyy = today.getFullYear();
        // if date is less then 10, then append 0 before date   
        if(dd < 10){
            dd = '0' + dd;
        } 
        // if month is less then 10, then append 0 before date    
        if(mm < 10){
            mm = '0' + mm;
        }
        
        var todayFormattedDate = yyyy+'-'+mm+'-'+dd;
        if(component.get("v.testDate") != '' && component.get("v.testDate") < todayFormattedDate){
            component.set("v.dateValidationError" , true);
        }else{
            component.set("v.dateValidationError" , false);
        }
    },
    
    submit : function(component,event,helper){
        // get the 'dateValidationError' attribute value
        var isDateError = component.get("v.dateValidationError");
        
        if(isDateError != true){
            alert('Entered Date is valid...');
        }
    }
})