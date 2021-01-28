/*
	Created By: Mayank Pant
	Created Date: 10th Nov 2020
	Purpose: This class will create the vehicle repair package line item records.
			 This class is called from the Vehicle Repair package trigger when the record is created.
*/
public class AfterSales_Service_VehicleRepairPkg_Item {
	
    /*This method will return map of repair package and its repair package item*/
    public map<Id,List<RepairPackageItem__c>> getRepairPackageItem(set<ID> repairPackageId){
        // Query repair package item for the list of repair packge
        // create a map
        // return the map
        
        return null;
    }
    
    /*This method will create the vehicle repair package item records for the vehicle repair package*/
    public List<VehicleRepairPackageItem__c> createVehicleRepairPackageItem(set<Id> vehicleRepairPackageId){
    	// call method getRepairPackageItem() and pass the arguments
    	// iterate over the response and create the vehicle repair package item   
    	return null;
    }
}