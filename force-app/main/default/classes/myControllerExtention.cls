public class myControllerExtention {
    public final Account acct;
    public myControllerExtention(ApexPages.StandardController controller){
        this.acct = (Account)controller.getRecord();
    }
    
    public string getGreeting(){
        Account ac = [Select Id, OwnerId from Account where Id=:acct.Id];
        return 'Hello '+ac.OwnerId;
    }

}