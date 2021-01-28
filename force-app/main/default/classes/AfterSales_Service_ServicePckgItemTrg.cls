/*
Created By: Mayank Pant
Created Date: 17th Nov 2020
Description: It is Trigger handler class for Service PackageItem trigger. This class will set the price
	         and discount on Service Package Item based on corresponding price in Regional Pricebook
*/	
public class AfterSales_Service_ServicePckgItemTrg {
	/*This is the constructor method*/
    public AfterSales_Service_ServicePckgItemTrg(List<Service_Package_Item__c> lstServicePackageItem){
        setServicePackageItemPrice(lstServicePackageItem);  
    }
    
    /*This method will get the Repair Package Price from the pricebook*/
    public List<Service_Package_Item__c> getServicePackagePrice(List<Service_Package_Item__c> lstServicePackageItem, Id prcBkId){
        set<Id> setProductId = new Set<Id>();
        
        /*Prepare set of the Product Id from the list of serive package item */
        for(Service_Package_Item__c serPckItem :lstServicePackageItem){
        	setProductId.add(serPckItem.Product__c);	 	   
        }
        
        Map<Id,PricebookEntry> mapProductPriceBookEntry = new Map<Id,PricebookEntry>();
        mapProductPriceBookEntry  = AfterSales_Service_Package_ItemPrice.getPriceBookItem(setProductId, prcBkId);
        
        if(!mapProductPriceBookEntry.isEmpty()){
        
            for(Service_Package_Item__c serPckItem :lstServicePackageItem){
                if(mapProductPriceBookEntry.containsKey(serPckItem.Product__c)) {
                	serPckItem.SpiUnitPrice__c = mapProductPriceBookEntry.get(serPckItem.Product__c).UnitPrice__c;
                    serPckItem.DiscountRates__c  = mapProductPriceBookEntry.get(serPckItem.Product__c).UnitDiscount__c;
                    try{
                        serPckItem.DiscountAmounts__c = ((serPckItem.SpiUnitPrice__c)* serPckItem.Quantity__c*serPckItem.DiscountRates__c)/100;
                	}catch(Exception ex){
                        
                    }
                }  
            }
        }
    	return lstServicePackageItem;
    }
    /*This method will set the Repair Package Price*/
    public void setServicePackageItemPrice(List<Service_Package_Item__c> lstServicePackageItem){
        Pricebook2 prcBook = new Pricebook2();
        /*Call to get the pricebook for the department selected at the repair package*/
        
        prcBook = util.getRegionalPriceBook([SELECT Country__c 
                                                FROM Service_Package__c 
                                                WHERE id =: lstServicePackageItem[0].Service_Package__c].country__c);
        
        if(prcBook!=null){
            /*Call to get the unity price and discount for the product in the price book of the dealer or NSC*/
        	lstServicePackageItem = getServicePackagePrice(lstServicePackageItem,prcBook.Id);     
        }
             
    }
    
    
}