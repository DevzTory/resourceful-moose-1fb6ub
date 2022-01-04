({
    init : function(cmp, event, helper) {

         console.log('init');
        var eventSelect ="<div></div>"
            //cmp.find("multiselect").getElement();

       //$("select").multiselect();
        console.log(eventSelect);

    helper.setEventTypes(cmp,event);

    $('#calendar').fullCalendar({
        // put your options and callbacks here
        customButtons: {
        /*     newEventButton: {
                text: 'New Event',
                click: function(){

                var btnClick = cmp.getEvent("btnClick");

                    btnClick.setParams({

                        "type":"newEvent"

                    });
                    btnClick.fire();

                }  
             } */

         },
        aspectRatio: 2,
        height: 600,
        header: {
              left: 'prev,next today,newEventButton',
              center: 'title',
              right: 'month,agendaWeek,agendaDay'
       },
        editable: true,
        events: $A.getCallback(function(start, end, timezone, callback){

            var cSettings = cmp.get("v.settings");     
            var action = cmp.get("c.getEvents");
            var viewType = cmp.get("v.view");
            var cEvents = {};
            var Events = [];

            console.log('####settings: '+  cSettings);
            console.log('####timeZone: '+ timezone);
           // console.log('end: '+  end);
            action.setParams({

                "StartDate": start,
                "EndDate" : end,
                "settings": cSettings,
                "viewType": viewType
            });
             action.setCallback(this,function(r){  

               var state = r.getState();

              // console.log('State: '+ state);

               if(state =='SUCCESS'){    

                cEvents = JSON.parse(r.getReturnValue());

              /*  console.log('jSon String is : ')
                console.log(r.getReturnValue());
                console.log('cEventsources are: ')
                console.log(cEvents); */

                   callback(cEvents);

               }

             })

           $A.enqueueAction(action);

        }  //events function 
        ),

        eventClick: function(calEvent, jsEvent, view) {

          // window.open(calEvent.url, '_blank');
           //$.popupWindow(calEvent.url, { height: 500, width: 1000 });
            //console.log('----Hi-- '+calEvent.url);
            //alert(calEvent.url);
            //return false;
            $("#account-dialog").show('fade');
            return false;

        },



    });


    },

    newEvent : function(cmp,event,helper){

        var v_event = {};
        v_event.StartDateTime= cmp.get("v.startDateTime");
        v_event.EndDateTime= cmp.get("v.endDateTime");
         v_event.ActivityDate= cmp.get("v.dueDateTime");
        v_event.Subject= cmp.get("v.subject");
        var setting_mdt={};

        var eventType = cmp.get("v.EventTypes");

        var settingId =  cmp.find("eventType").get("v.value");

        for(i in eventType){


            if(eventType[i].Id==settingId){

                setting_mdt = eventType[i]; 

                console.log('EventType is');
                console.log(setting_mdt);
                console.log(setting_mdt.Subject__c);

                console.log(setting_mdt.Id);

            }
        }



        helper.createEvent(cmp,v_event,setting_mdt,function(r){

            var state = r.getState(); 

            var toastEvent = $A.get("e.force:showToast");

            if(toastEvent){

              toastEvent.setParams({

                    "title": "Success !",
                    "message": "Event has been successfully created."
                });

            }
            else{

                console.log('Event creation Status is: '+state);

                if(state=="SUCCESS"){

                    dialog.dialog("close");
                }

                $('#calendar').fullCalendar('refetchEvents');
            }


        });

       // console.log('closing the dialog');

    },
    updateEvent : function(cEvent,helper){

        console.log('Event in update method');
        console.log(cEvent);

    }, 

    openNewEventDialog : function(cmp,event,helper){

        console.log('New Event dialog');

        var eventDialog = cmp.find('newEvent-dialog-form'); 



        dialog = $( "[data-aura-rendered-by=\'"+eventDialog.getGlobalId()+"\']" ).dialog({

            autoOpen: false,
            modal: true,
            draggable: true,
            height: 600,
            width: 900,
            resizable: true,
            position: { my:'center', at:'center'},


             buttons: {

            Cancel: function () {
               $(this).dialog('close');
              }
            },
            close: function() {

                dialog.dialog("close");
            }
    });


          dialog.dialog( "open" );

    },



})