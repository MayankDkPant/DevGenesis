/*
	Created By: Mayank Pant
	Purpose: This class is a trigger handler class for Job Orders.
*/
public class AS_TrggHandler_JobOrder {
    /*
    	This method checks if the status of job order is new or in progress it calls method 
		to create product required records
	*/
    public static void trgHandlerCriteriaMatch(List<WorkOrder> lstJobOrder){
        Set<Id> setJobOrderId = new Set<Id>();
        Set<Id> setJobOrderCompleteOrCanceled = new Set<Id>();
        
        
        for(WorkOrder jobOrdr : lstJobOrder){
            if(jobOrdr.Status == 'New'  || jobOrdr.Status == 'In Progress'){
            	setJobOrderId.add(jobOrdr.Id);    
            }
            if(jobOrdr.Status == 'Completed'  || jobOrdr.Status == 'Canceled' || jobOrdr.Status == 'Closed')
            {
            	setJobOrderCompleteOrCanceled.add(jobOrdr.Id);    
            }
        }
    	if(!setJobOrderId.isEmpty())
        {
        	AS_InventoryMngmt_CreateProductRequried.createProductRequiredForJobOrders(setJobOrderId);    
        }
        
        if(!setJobOrderCompleteOrCanceled.isEmpty())
        {
        	AS_InventoryMngmt_CloseProductRequried.updateProductRequiredStatusToClose(setJobOrderCompleteOrCanceled); 
            AS_InventoryMngmt_CreateProductConsumed.createProductRequiredForJobOrders(setJobOrderCompleteOrCanceled);
            AS_VehicleServicePackageConsumption.updateVehicleServicePakcageItem(setJobOrderCompleteOrCanceled);
        }
        
        
    }
}