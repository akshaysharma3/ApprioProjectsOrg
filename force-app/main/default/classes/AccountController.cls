public class AccountController {
    public Account account{get;set;}
    
    public AccountController(){
        if(ApexPages.currentPage().getParameters().get('id') != null){
            account = [Select Name, Industry ,Phone From Account where id=:ApexPages.currentPage().getParameters().get('id')];
        }
    }
    public Account getAccount(){
        return account;
    }
    
    public PageReference save(){
        insert account;
        PageReference success = new ApexPages.StandardController(Account).view();
        return (success);
    }

}