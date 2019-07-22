import { LightningElement, track } from 'lwc';
export default class HelloWorld extends LightningElement {
    @track greeting = 'World';
    @track greeting2 = 'This Value Changes on Typing';
    changeHandler(event) {
        this.greeting = event.target.value;
        
    }
    changeHandler2(event) {
        this.greeting2 = event.target.value;
    }
}