/*
 Created By: Mayank Pant
 Purpose: This class will create Prouduct Consumed Record when a Job order is marked as Completed.
*/
public class AS_InventoryMngmt_CreateProductConsumed {

   /*  This method will receive list of Job orders and 
    will create Product consumed record for each relevant Job order line item of type part 
  */    
    public static List<ProductConsumed> createProductRequiredForJobOrders(Set<Id> setJobOrderId)
    {
        List<ProductConsumed>  lstProductConsumed = new List<ProductConsumed>();
        List<WorkOrderLineItem> lstJobOrderLineItem = new List<WorkOrderLineItem>();
        
    	lstJobOrderLineItem = getJobOrderLineItemForJobOrders(setJobOrderId);
        lstProductConsumed = prepareProductConsumedForJobOrder(lstJobOrderLineItem);
        lstProductConsumed = insertProductRequired(lstProductConsumed);
        
        return lstProductConsumed;
    }
    
    /*This method will return the existing Product Required records for the Job orders received in the argument*/
    public static List<WorkOrderLineItem> getJobOrderLineItemForJobOrders(Set<Id> setJobOrderId){
    	return AS_InventoryMngmt_CreateProductRequried.getJobOrderLineItemForJobOrders(setJobOrderId);
    }
    
    /*This method will prepare Product consumed records for the given proudcts required records*/
    public static List<ProductConsumed> prepareProductConsumedForJobOrder(List<WorkOrderLineItem> lstJobOrderLineItem)
    {
        List<ProductConsumed> lstProductConsumed = new List<ProductConsumed>();
        ProductConsumed prdCons;
        for(WorkOrderLineItem jobOrderLineItem : lstJobOrderLineItem){
        	prdCons = new ProductConsumed();
            prdCons.Associated_Vehicle_Service_Package_Item__c = jobOrderLineItem.VehicleServicePackageItem__c;
            prdCons.ProductItemId = jobOrderLineItem.Product_Item__c;
            prdCons.WorkOrderId = jobOrderLineItem.workOrderId;
            prdCons.WorkOrderLineItemId = jobOrderLineItem.Id;
            prdCons.QuantityConsumed = jobOrderLineItem.Quantity;
            
            lstProductConsumed.add(prdCons);
        }
        return lstProductConsumed;
    }
    
    /*This method will perform the dml operation. It will insert product consumed record for the Job order */
     public static List<ProductConsumed> insertProductRequired(List<ProductConsumed> lstProductConsumed){
        try{
        	database.insert(lstProductConsumed, false);    
        }catch(Exception ex){
            // Mayank to write the exception
            system.debug('Exception is ' +ex.getMessage());
        }

        return lstProductConsumed;
    }
    
}