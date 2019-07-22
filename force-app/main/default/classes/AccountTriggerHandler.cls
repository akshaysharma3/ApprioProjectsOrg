public class AccountTriggerHandler {
    public static void inactiveAccountAddError(List<Account> accts, Map<Id,Account> mapAcc){
        List<account> accList = new List<Account>();
        for(Account acct : accts){
            if(acct.Active__c=='NO' && mapAcc.get(acct.id).Active__c != acct.Active__c){
                accList.add(acct);
            }
        }
        
        Map<Id,Account> accMap = new Map<Id,Account>([Select Id, (Select Id from Contacts Limit 1) from Account where Id in: accList]);
        for(Account a : accList){
            if(accMap.containsKey(a.id)){
                Account acc = accMap.get(a.id);
                if(!acc.Contacts.isEmpty()){
                    a.addError('You Cannot Deactivate the Account');
                }
            }
        }
    }
    
    public static void updateNoOfContacts(List<Account> accounts){
        /*System.debug('Accounts++>>'+accounts);
        List<Account> accts = new List<Account>();
        accts = [Select Id, Name, (Select Id From Contacts) From Account where Id in:accounts];
        for(Account acc : accounts){
            System.debug('Contacts Associated-->> '+acc.Contacts.size());
            acc.Name = 'Phr Se Update';
            acc.No_Of_Contacts_Associated__c = acc.Contacts.size();
            accounts.add(acc);
        }
        System.debug('After Update '+accounts);*/
    }
}