import { LightningElement, wire ,track} from 'lwc';
import getContactList from '@salesforce/apex/ContactListController.getContactList';
import getAccountList from '@salesforce/apex/ContactListController.getAccountList';
export default class ContactListDemo extends LightningElement {
    @track searchKey;
    @track contacts;
    @track error;
    @track accounts;
    @track accountErrors;
    @track searchKeyAccount;
    @track selectedAccount;
    handleChange(event){
        event.preventDefault();
        /* eslint-disable no-console */
        console.log('Value = '+event.target.value);
        this.searchKey = event.target.value;

    }
    handleSelectRec(event){
        const recordId = event.detail;
        console.log('Record Id '+recordId);
        //this.selectedAccount = this.accounts.find(account=>account.Id===recordId);

        for(let i=0;i<this.accounts.length;i++){
            if(this.accounts[i].Id===recordId){
                this.selectedAccount = this.accounts[i];
            }
        }

    }
    handleChangeAccount(event){
        event.preventDefault();
        /* eslint-disable no-console */
        console.log('Value = '+event.target.value);
        this.searchKeyAccount = event.target.value;

    }
    @wire(getContactList,{
        
        name : '&searchKey'
    })
    wiredContact({error,data}){
        if(data){
            console.log('Data = '+data);
            this.contacts = data;
            console.log('New Data= '+this.error);
        }
        if(error){
            console.log('error = '+error);
            this.error = error;
            console.log('New error = '+this.error);
        }
    }
    showAccounts(){
        getAccountList({
            name : this.searchKeyAccount
        })
        .then(result=>{
            this.accounts = result;
        })
        .catch(error=>{
            this.accountErrors = error;
        });
    }
    //Data and error

}