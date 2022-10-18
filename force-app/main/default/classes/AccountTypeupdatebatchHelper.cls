public class AccountTypeupdatebatchHelper {
    public static void changeType(List<Account> accList) {
        String AccType;
             AccType__c obj = AccType__c.getInstance('Type');
            AccType = obj.AccountType__c;
            for(Account acc : accList)
            {
                System.debug('++++Inside'+AccType);
                acc.Type = AccType; 
            }
    Update accList; 
    }
    }