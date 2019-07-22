public with sharing class AccountWeatherExtention {
    
    public String city{get;set;}
    public String temp{get;set;}
    public String pressure{get;set;}
    public String humidity{get;set;}
    public String temp_min{get;set;}
    public String temp_max{get;set;}
    
    public AccountWeatherExtention(ApexPages.StandardController stdController){
        Account account = (Account)stdController.getRecord();
        account = [Select Id, ShippingCity From Account where Id=:account.Id];
        String accountCity = account.ShippingCity;
        String apiKey = '768588bbefab3f319de5ee35784c3965';
        
        String requestEndPoint = 'http://api.openweathermap.org/data/2.5/weather';
        requestEndPoint+='?q='+accountCity;
        requestEndPoint+='&units=metric';
        requestEndPoint+='&id='+apiKey;
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        System.debug('EndPoint= '+requestEndPoint);
        request.setEndpoint(requestEndPoint);
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        System.debug('Response : '+response);
        if(response.getStatusCode()==200){
            Map<String,Object> results = (Map<String,Object>)JSON.deserializeUntyped(response.getBody());
            city = String.valueOf(results.get('name'));
            Map<String,Object> mainResults = (Map<String,Object>)results.get('main');
            temp = String.valueOf(mainResults.get('temp')); 
            pressure = String.valueOf(mainResults.get('pressure')); 
            humidity = String.valueOf(mainResults.get('humidity')); 
            temp_min = String.valueOf(mainResults.get('temp_min')); 
            temp_max = String.valueOf(mainResults.get('temp_max')); 
        }
        else{
            ApexPages.Message myMsg = new ApexPages.Message(ApexPages.Severity.ERROR,'There was an Error in Reading Data');
            ApexPages.addMessage(myMsg);
        }
    }
}