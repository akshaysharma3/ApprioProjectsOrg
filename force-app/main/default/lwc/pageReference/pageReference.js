import { LightningElement, api } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';

export default class PageReference extends NavigationMixin (LightningElement) {
    @api heading = "Page Reference Demo";
    navigateToList(){
        let pageReference = {
            type : 'standard__objectPage',
            attributes : {
                actionName : 'list',
                objectApiName : 'Account'
            },
            state : {
                filterName : 'Recent'
            }
        };
        this[NavigationMixin.Navigate](pageReference,true);
    }
    navigateToRecord(){
        let pageReferenceRecord = {
            type : 'standard__recordPage',
            attributes : {
                actionName : 'view',
                recordId : '0015D00000WCafmQAD',
                objectApiName : 'Account'
            },
            state : {}
        };
        this[NavigationMixin.Navigate](pageReferenceRecord,true);
    }
    navigateToObjectHome(){
        this[NavigationMixin.Navigate]({
            type : 'standard__objectPage',
            attributes : {
                objectApiName : 'Account',
                actionName : 'home'
            }
        });

    }
    avigateToNewRecordPage(){
        this[NavigationMixin.Navigate]({
            type : 'standard__objectPage',
            attributes : {
                objectApiName : 'Account',
                actionName : 'new'
            }
        });

    }
}