/*
Created By: Mayank Pant
Created Date: 13th Nov 2020
Description: It is Trigger handler class for Repair PackageItem trigger. This class will set the price
	         and discount on Repair Package Item based on corresponding price on Dealers Pricebook
*/	
public class AfterSales_Service_RepairPckgItemTrggr {
    
    /*This is the constructor method*/
    public AfterSales_Service_RepairPckgItemTrggr(List<RepairPackageItem__c> lstRepairPackageItem){
    	system.debug('enters in the constructor method');
        setRepairPackageItemPrice(lstRepairPackageItem);    
    }
    
    /*This method will get the Repair Package Price from the pricebook*/
    public List<RepairPackageItem__c> getRepairPackagePrice(List<RepairPackageItem__c> lstRepairPackageItem, Id prcBkId){
    	system.debug('enters in get Repair package price');
        set<Id> setProductId = new Set<Id>();
        
        /*Prepare set of the Product Id from the list of serive package item */
        for(RepairPackageItem__c repPckItem :lstRepairPackageItem){
        	setProductId.add(repPckItem.Product__c);	 	   
        }
        
        Map<Id,PricebookEntry> mapProductPriceBookEntry = new Map<Id,PricebookEntry>();
        mapProductPriceBookEntry  = AfterSales_Service_Package_ItemPrice.getPriceBookItem(setProductId, prcBkId);
        if(!mapProductPriceBookEntry.isEmpty()){
        
            for(RepairPackageItem__c repPckItem :lstRepairPackageItem){
                if(mapProductPriceBookEntry.containsKey(repPckItem.Product__c)) {
                	repPckItem.UnitPrice__c = mapProductPriceBookEntry.get(repPckItem.Product__c).UnitPrice__c;
                    repPckItem.DiscountRates__c  = mapProductPriceBookEntry.get(repPckItem.Product__c).UnitDiscount__c;
                    try{
                        repPckItem.DiscountAmounts__c = ((repPckItem.UnitPrice__c)* repPckItem.Quantity__c*repPckItem.DiscountRates__c)/100;
                    }
                    catch(Exception ex){}
                    
                }  
            }
        }
    	return lstRepairPackageItem;
    }
    /*This method will set the Repair Package Price*/
    public void setRepairPackageItemPrice(List<RepairPackageItem__c> lstRepairPackageItem){
        Pricebook2 prcBook = new Pricebook2();
        system.debug('lstRepairPackageItem[0].RepairPackage__c '+lstRepairPackageItem[0].RepairPackage__c);
        /*Call to get the pricebook for the department selected at the repair package*/
        prcBook = util.getPriceBookForRepairPackage(lstRepairPackageItem[0].RepairPackage__c);
        if(prcBook!=null){
            /*Call to get the unity price and discount for the product in the price book of the dealer or NSC*/
        	lstRepairPackageItem = getRepairPackagePrice(lstRepairPackageItem,prcBook.Id);     
        }
             
    }
    
    
    public List<RepairPackageItem__c> updateRepairPackageItem(List<RepairPackageItem__c> lstRepairPackageItem){
         database.update(lstRepairPackageItem,false);
         return lstRepairPackageItem;
    }
    
}