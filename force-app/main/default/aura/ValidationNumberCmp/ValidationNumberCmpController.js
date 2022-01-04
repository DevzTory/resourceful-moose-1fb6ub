({
    doAction : function(component, event) {
        var inputCmp = component.find("inputCmp");
        var value = inputCmp.get("v.value");

        // Is input numeric?
        if (isNaN(value)) {
            // Set error
            inputCmp.set("v.errors", [{message:"Input not a number: " + value}]);
        } else {
            // Clear error
            inputCmp.set("v.errors", null);
        }
    },
    
    doTrueOrFalse : function(component, event) {
        var mondayToday = component.get("v.mondayToday");

        if (mondayToday == true) {
            inputCmp.set("v.errors", [{message:"It is indeed today!"}]);
        } else {
            inputCmp.set("v.errors", [{message:"Not Monday today."}]);
        }
    }
})