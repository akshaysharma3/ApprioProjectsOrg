public with sharing class ContactListController {
    public ContactListController() {

    }
    @AuraEnabled(cacheable=true)
    public static List<Contact> getContactList(String name){
        string key = '%'+name+'%';
        //string query = 'Select Id, Name, Email, Phone From Contact Where Name Like :key';
        List<Contact> contacts = [Select Id, Name, Email, Phone From Contact Where Name Like :key];
        return contacts;
    }

    @AuraEnabled(cacheable=true)
    public static List<SObject> getAccountList(String name){
        string key='%'+name+'%';
        string query = 'Select Id, Name, Phone,Industry From Account  Where Name Like :key';
        return Database.query(query);
        
    }
    
}