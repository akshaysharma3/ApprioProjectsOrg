@RestResource(urlMapping='/showAccountDetails/*')
global class CheckAccount {
    @HttpGet
    global static List<Account> getAccount(){
        List<Account> accountsList = new List<Account>();
        try{
            accountsList = [Select Id, Name, Phone From Account];
            return accountsList;
        }
        catch(Exception ex){
            System.debug('Exception Occured : '+ex.getMessage());
        }
        return accountsList;
        
    }
    
    @HttpPost
    global static String doPost(String Name, String Phone, String AccountNumber){
        Account acc = new Account();
        acc.Name = Name;
        acc.Phone = Phone;
        acc.AccountNumber = AccountNumber;
        insert acc;
        return acc.Id;
    }
    
}