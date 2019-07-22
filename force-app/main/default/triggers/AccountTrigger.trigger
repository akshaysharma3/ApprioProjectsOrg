trigger AccountTrigger on Account (before insert, before update) {
    if(Trigger.isBefore && Trigger.isUpdate){
        AccountTriggerHandler.inactiveAccountAddError(Trigger.new, Trigger.oldMap);
        AccountTriggerHandler.updateNoOfContacts(Trigger.new);
    }
}