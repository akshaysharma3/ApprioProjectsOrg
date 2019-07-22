public with sharing class UtilityClass {
    public UtilityClass() {

    }
    @AuraEnabled(cacheable=true)
    public static Map<Integer,String> getMap(){
        Map<Integer,String> myMap = new Map<Integer,String>();
        myMap.put(1,'Akshay Sharma');
        myMap.put(2,'Ankit Sharma');
        myMap.put(3,'Ashok Sharma');
        myMap.put(4,'Akash Agarwal');
        myMap.put(5,'Deepak Singh');
        return myMap;
    }
}