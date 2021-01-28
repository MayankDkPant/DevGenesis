public without sharing class AfterSales_ProductNewRequestLineItem {
    
    /* @AuraEnabled
public static List < Product2 > getRequestProductNewItem(String searchKeyWord){ 
List < Product2 > returnListProductLineItem = new List < Product2 > (); 
String searchString = '%' + searchKeyWord + '%';        
List < Product2 > lstOfProductLineItem =[select id,name,productcode,ProductNameNative__c,Family,Description,StartDate__c,EndDate__c,Model__c from product2 where (productcode like :searchString) or (name like :searchString)]; //) or (ProductCode like :searchString)];// or Name like :searchString];// LIKE :('%' + searchKeyWord + '%')];// searchString or Name LIKE: searchString ];

/// List < Product2 > lstOfProductLineItem =[SELECT Product2.Id,Product2.Name, Product2.ProductCode, Product2.ProductNameNative__c,PriceBook2.Name,Product2.Family,Product2.StartDate__c,Product2.EndDate__c,Product2.Model__c,PricebookEntry.UnitPrice from PriceBookEntry where (productcode like :searchString) or (name like :searchString)];

return lstOfProductLineItem;
}  */
    
    @AuraEnabled
    public static List <PriceBookEntry> getRequestProductNewItem(String searchKeyWord){ 
        List <PriceBookEntry> returnListProductLineItem = new List <PriceBookEntry> (); 
        String searchString = '%' + searchKeyWord + '%';        
        List <PriceBookEntry> lstOfProductLineItem =[
            // SELECT Product2.Id,Product2.recordtype.name, Product2.Name, Product2.ProductCode,Product2.Description, Product2.ProductNameNative__c,Product2.Family,Product2.StartDate__c,Product2.EndDate__c,Product2.Model__c,PricebookEntry.UnitPrice,Product2.AfterSales_Recommendation__c,Product2.AfterSales_Supersession__c from PriceBookEntry where (Product2.productcode like :searchString) or (Product2.name like :searchString)];
            SELECT Product2.Id,Product2.recordtype.name, Product2.Name, Product2.ProductCode,Product2.Description, Product2.ProductNameNative__c,Product2.Family,Product2.StartDate__c,Product2.Quantity__c,Product2.EndDate__c,Product2.Model__c,PricebookEntry.UnitPrice,Product2.AfterSales_Recommendation__c,Product2.AfterSales_Supersession__c from PriceBookEntry where ((Product2.productcode like :searchString) or (Product2.name like :searchString)) and Product2.recordtype.name='Part' ];
        
        return lstOfProductLineItem;
    } 
    
    
    @AuraEnabled
    public static String getRequestProductNumber(String recordId){  	
        List<ProductRequest> lstProductRequest =[SELECT ProductRequestNumber FROM ProductRequest where Id=:recordId]; 
        return lstProductRequest[0].ProductRequestNumber;
    }  
    
    @AuraEnabled
    public static ProductRequestLineItem saveProductRequestLineItem(ProductRequestLineItem objProductRequestLineItem) {
        upsert objProductRequestLineItem;
        return objProductRequestLineItem;
    }
    
      @AuraEnabled
    public static string getSupersessionProductNewItem(String searchSupersessionKeyWord){ 
         
        String searchSupersessionString = '%' + searchSupersessionKeyWord + '%';        
        List <Product2> lstSupersessionProductLineItem =[ SELECT Id, Name from Product2  where  Name like :searchSupersessionString];        
        return lstSupersessionProductLineItem[0].Id;
    } 
    
}