import { LightningElement, track } from 'lwc';

export default class SimpleEvent extends LightningElement {
    @track page = 1;
    handleNext(){
        if(this.page>50){
            this.page=1;
        }
        else{
            this.page = this.page+1;
        }
        
    }

    handlePrevious(){
        if(this.page>1){
            this.page = this.page - 1;
        }
        else{
            /* eslint-disable no-alert */         
            alert('Page Value Cant be 0');
        }
    }
}