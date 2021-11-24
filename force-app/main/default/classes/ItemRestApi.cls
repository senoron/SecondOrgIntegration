@RestResource(urlMapping='/itemrest')
global class ItemRestApi {
    
    @HttpPost
    global static void CreateItem(){
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;

        res.addHeader('Content-Type', 'application/json');
        
        Blob bl = req.requestBody;

        List<String> names = (List<String>)JSON.deserialize(bl.toString(), List<String>.class);

        CreateNewItem(names);
    }

    private static void CreateNewItem(List<String> names){
        List<Item__c> items = new List<Item__c>();
        
        for(String name : names){
            items.add(new Item__c(Name = name));
        }

        insert items;
    }   

}
