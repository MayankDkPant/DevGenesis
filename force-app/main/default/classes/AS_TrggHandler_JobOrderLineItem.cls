/*
	Created By: Mayank Pant
	Purpose: This class is a trigger handler class for Job Order Line Item.
*/
public class AS_TrggHandler_JobOrderLineItem {
	/*
    	This method checks if the status of job order is new or in progress it calls method 
		to create product required records
	*/
    public static void trgHandlerCriteriaMatch(List<WorkOrderLineItem> lstJobOrderLineItem){
        Set<Id> setJobOrderId = new Set<Id>();
        for(WorkOrderLineItem jobOrderLineItem : lstJobOrderLineItem){
            setJobOrderId.add(jobOrderLineItem.workOrderId);
        }
        
        AS_InventoryMngmt_CreateProductRequried.createProductRequiredForJobOrders(setJobOrderId);
    }
    
    public static List<ProductRequired> getExistingProductRequiredForJobOrder(Set<Id> setJobOrderId){
      
        return [SELECT ID, 
                     ParentRecordId,
                     Status__c
                  FROM ProductRequired
                  WHERE JobOrder__c IN : setJobOrderId];
    }
}