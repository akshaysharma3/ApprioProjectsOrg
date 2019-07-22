import { LightningElement ,track} from 'lwc';

export default class MyFirstLWC extends LightningElement {
    @track Name="Akshay";
    @track Title="As. Consultant";
    @track Phone="9799212725";
    @track Email="akshay20sharma3@gmail.com";
    handleClick(){
        this.Name="Akshay Sharma";
        this.Title="Associate Consultant"
    }     
}