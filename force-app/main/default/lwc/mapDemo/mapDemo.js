import { LightningElement,track } from 'lwc';
import nameMap from '@salesforce/apex/UtilityClass.getMap';

export default class MapDemo extends LightningElement {
    @track name='Akshay';

    @track maps;
    handleClick(){
        nameMap().then(result=>{
            const options=[];
            for(let key in result){
                if(key){
                    options.push({
                        key : key,
                        value : result[key]
                    })
                }
            }
            this.maps=options;
        })
    }
    blankMap(){
        this.maps=[];
        //window.location.reload();
    }
}