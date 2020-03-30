public class DebugLog {
    private String fileName;
    private String methodName;
    private String details;

    public DebugLog(String fileName, String methodName, String details){
        this.fileName = fileName;
        this.methodName = methodName;
        this.details = details;
    }

    public DebugLog(String fileName, String methodName, Exception error){
        this.fileName = fileName;
        this.methodName = methodName;
        this.details = error.getStackTraceString() + '\n' + error.getMessage();
    }

    public void saveLog(){
        DebugLog__c newLog = new DebugLog__c();
        newLog.fileName__c = fileName;
        newLog.methodName__c = methodName;
        newLog.details__c = details;
        insert newLog;
    }

    public void publishLog(){
        DebugLogEvent__e logEvent = new DebugLogEvent__e();
        logEvent.fileName__c = fileName;
        logEvent.methodName__c = methodName;
        logEvent.details__c = details;
        EventBus.publish(logEvent);
    }
}