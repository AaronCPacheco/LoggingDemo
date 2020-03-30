trigger DebugLogEvent on DebugLogEvent__e (after insert) {
    List<DebugLog__c> newDebugLogs = new List<DebugLog__c>();
    for(DebugLogEvent__e event: Trigger.new){
        DebugLog__c log = new DebugLog__c();
        log.FileName__c = event.FileName__c;
        log.MethodName__c = event.MethodName__c;
        log.Details__c = event.Details__c;
        log.OwnerId = event.CreatedById;
        newDebugLogs.add(log);
    }
    insert newDebugLogs;
}