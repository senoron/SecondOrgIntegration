@isTest
public class ItemRestApiTest {
    
    @isTest
    static void PostInsertationTest(){

        String body = '["One", "Two", "Three"]';
        Integer count = 3;

        HttpRequest r = new HttpRequest();
        r.setBody(body);

        System.RestRequest rq = new RestRequest();
        rq.requestBody = Blob.valueOf(body);
    
        RestContext.request = rq;

        System.assertEquals(0, [SELECT count() FROM Item__c]);

        Test.startTest();
        ItemRestApi.CreateItem();
        Test.stopTest();

        System.assertEquals(3, [SELECT count() FROM Item__c]);
    }

}
