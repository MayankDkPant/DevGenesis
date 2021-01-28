/*
	Created By: Mayank Pant
	Created Date: 19th Jan 2021
	Purpose: This class will update the quantity consumed in Vehicle service package item doing a job order
*/
public class AS_VehicleServicePackageConsumption {
	
    /*This method will find the vehicle service package item record related to job order*/
    public static List<Vehicle_Service_Package_Item__c> updateVehicleServicePakcageItem(set<Id> setJobOrderId){
    	List<WorkOrderLineItem> lstJobOrderLineItem = new List<WorkOrderLineItem>();
        List<Vehicle_Service_Package_Item__c> lstVehicleServicePackageItem = new List<Vehicle_Service_Package_Item__c>();
        
        lstJobOrderLineItem = getJobOrderLineItemForJobOrders(setJobOrderId);
        lstVehicleServicePackageItem = prepareVehicleServicePackageItem(lstJobOrderLineItem);
        updateVehicleServicePackageItem(lstVehicleServicePackageItem);
        return lstVehicleServicePackageItem;
    }
    
    /*This method will get Job Orders Items related to the Job Order received in the argument*/
    public static List<WorkOrderLineItem> getJobOrderLineItemForJobOrders(set<Id> setJobOrderId){
        return AS_InventoryMngmt_CreateProductRequried.getJobOrderLineItemForJobOrders(setJobOrderId);
    }
    /*This method will prepare the vehicle service package item*/
    public static List<Vehicle_Service_Package_Item__c> prepareVehicleServicePackageItem(
        													List<WorkOrderLineItem> lstJobOrderLineItem)
    {
        List<Vehicle_Service_Package_Item__c> lstVehicleServicePackageItem = new List<Vehicle_Service_Package_Item__c>();
        Vehicle_Service_Package_Item__c vhcSrvPckgItem;
        for(WorkOrderLineItem jobOrderLineItem : lstJobOrderLineItem)
        {
            vhcSrvPckgItem.Id = jobOrderLineItem.VehicleServicePackageItem__c;
            vhcSrvPckgItem.Quantity_Consumed__c = jobOrderLineItem.Quantity;
            lstVehicleServicePackageItem.add(vhcSrvPckgItem);
        }
        return lstVehicleServicePackageItem;
    }
    
    /*This method will perform the dml operation. It will update  product consumed record for the Job order */
     public static List<Vehicle_Service_Package_Item__c> updateVehicleServicePackageItem(List<Vehicle_Service_Package_Item__c> lstVehicleServicePackageItem){
        try{
        	database.insert(lstVehicleServicePackageItem, false);    
        }catch(Exception ex){
            // Mayank to write the exception
            system.debug('Exception is ' +ex.getMessage());
        }

        return lstVehicleServicePackageItem;
    }
    
}