public class IncrementController {
    Integer count = 0;
    
    public PageReference incrementCounter(){
        if(count>5){
            count = 100; 
        }
        else{
            count++;   
        }
        return null;
    }
    
    public Integer getCount(){
        return count;
    }
    
}