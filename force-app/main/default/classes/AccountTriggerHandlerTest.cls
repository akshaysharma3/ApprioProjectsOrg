@isTest
public class AccountTriggerHandlerTest {
    @isTest
    public static void testInactiveAccountAddError(){
        List<Account> accts = new List<Account>();
        for(Integer i = 0;i < 5;i++){
            Account acc = new Account(Name='Test '+i, Active__c='Yes');
            accts.add(acc);
        }
        Insert accts;
        List<Contact> conList = new List<Contact>();
        for(Integer i=0;i<5;i++){
            Contact con = new Contact(LastName='Test Contact '+i,AccountId=accts[i].id);
            conList.add(con);
        }
        insert conList;
        
        List<Account> updateList = new List<Account>();
        for(Account acc : accts){
            acc.Active__c = 'No';
            updateList.add(acc);
        }
        
        Test.startTest();
        Database.SaveResult[] results =  Database.update(updateList,false);
        Test.stopTest();
        System.assertNotEquals(null,results.size());

    }

}