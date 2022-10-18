global class AccountTypeupdatebatch implements Database.stateful, Database.Batchable < sObject > {
    // Variables and Lists
    public String query;
    public String TypeToReplace,AccountType;
    public AccountTypeupdatebatch(String TypeToReplace, String Type) {
      // System.debug('+++TypeToReplace'+TypeToReplace+'++++'+Type);
       this.TypeToReplace = TypeToReplace;
        AccountType = Type;
        AccType__c obj = AccType__c.getInstance('Type');
        obj.AccountType__c = Type;
        update obj;
    }
    public Database.QueryLocator start(Database.BatchableContext BC) {
        System.debug('+++'+this.TypeToReplace);
        String temp = this.TypeToReplace; 
        query = 'Select ID from Account where Type =: temp';
       System.debug('+++'+query); 
        return Database.getQueryLocator(query);
    }
    public static void execute(Database.BatchableContext BC, List < Sobject > scope) {
        List < Account > AccountList = (List < Account > ) scope;
        AccountTypeupdatebatchHelper.changeType(AccountList);    
    }
    public void finish(Database.BatchableContext bc) {}
}