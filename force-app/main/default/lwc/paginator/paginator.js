import { LightningElement } from 'lwc';

export default class Paginator extends LightningElement {
    handleNext(){
        const nextEvent = new CustomEvent('next');
        this.dispatchEvent(nextEvent);

    }
    handlePrevious(){
        const prevEvent = new CustomEvent('previous');
        this.dispatchEvent(prevEvent);
    }
    

}