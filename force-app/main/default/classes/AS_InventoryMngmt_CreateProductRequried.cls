/*
	Created By: Mayank Pant
	Purpose: This class will create Product Required oject records when a Job order is created in the system.*/
public class AS_InventoryMngmt_CreateProductRequried {

    /*	This method will receive list of Job orders and 
		will create Product required for each relevant Job order line item of type part 
	*/    
    public static List<ProductRequired> createProductRequiredForJobOrders(Set<Id> setJobOrderId){
        
        
        List<WorkOrderLineItem> lstJobOrderLineItem = new List<WorkOrderLineItem>();
        Set<Id> setProductId = new Set<Id>();
        Set<Id> setDepartmentId = new Set<Id>();
        Map<Id,Map<Id,Id>> mapDepartment_MapPartInventory = new Map<Id,Map<Id,Id>> ();
        List<ProductRequired> lstProductRequired = new List<ProductRequired>();

        lstJobOrderLineItem = getJobOrderLineItemForJobOrders(setJobOrderId);

        
        lstProductRequired = prepareProductRequiredForJobOrder(setJobOrderId,
            												   lstJobOrderLineItem
                                                               );
        lstProductRequired = insertProductRequired(lstProductRequired);
        return lstProductRequired;
    }
    
    /*This method will query and return the job order line items associated to a set of Job orders*/
    public static List<WorkOrderLineItem> getJobOrderLineItemForJobOrders(set<ID> setJobOrderId){
       
        return [SELECT  ID, 
                        WorkOrderId, 
                        Department__c,
                        Product2Id,
                		Product_Item__c,
                		Quantity,
                		VehicleServicePackageItem__c
                FROM WorkOrderLineItem
                WHERE WorkOrderId IN : setJobOrderId
                AND Product2Id!=null
                AND RECORDTYPE.DEVELOPERNAME = 'Part'];
        
    }
    
    /*This method will prepare the Product Required list of records*/
    public static List<ProductRequired> prepareProductRequiredForJobOrder(Set<Id> setJobOrderId,
        																  List<WorkOrderLineItem> lstJobOrderLineItem
                                                                          )
    {
        
        List<ProductRequired> lstProductRequired = new List<ProductRequired>();
        ProductRequired prdReq;
        Set<Id> setJobOrderLineItemId = new Set<Id>();
        setJobOrderLineItemId = getExistingProductRequiredForJobOrder(setJobOrderId);
        for(WorkOrderLineItem  jobOrderLineItem : lstJobOrderLineItem)
        {
        	if(!setJobOrderLineItemId.contains(jobOrderLineItem.Id))
            {	
            	system.debug('enters in prdReq');
                prdReq = new ProductRequired();
                prdReq.ParentRecordId = jobOrderLineItem.Id;
                prdReq.Product2Id = jobOrderLineItem.Product2Id;
                prdReq.QuantityRequired = jobOrderLineItem.Quantity;
                prdReq.JobOrder__c = jobOrderLineItem.WorkOrderId;
                prdReq.Status__c = 'New';
                prdReq.Product_Item_Inventory__c = jobOrderLineItem.Product_Item__c;
                lstProductRequired.add(prdReq);      
             } 
        }
        system.debug('lstProductRequired '+lstProductRequired);
        return lstProductRequired;
    }
    
    /*This method will perform the dml and creates product required record*/
    public static List<ProductRequired> insertProductRequired(List<ProductRequired> lstProductRequired){
        try{
        	database.insert(lstProductRequired, false);    
        }catch(Exception ex){
            // Mayank to write the exception
            system.debug('Exception is ' +ex.getMessage());
        }
        system.debug('lstProductRequired after insert'+lstProductRequired);
        return lstProductRequired;
    }
    
    /*This method will return existing product requried records for the job order*/
    public static Set<Id> getExistingProductRequiredForJobOrder(Set<Id> setJobOrderId){
    	set<Id> setJobOrderLineItemId= new Set<Id>();
        for(ProductRequired prdReq : [SELECT ID, 
                	   ParentRecordId,
                	   Status__c
                	FROM ProductRequired
                	WHERE JobOrder__c IN : setJobOrderId])
        {
            setJobOrderLineItemId.add(prdReq.ParentRecordId);
        }
		system.debug('setJobOrderLineItemId '+setJobOrderLineItemId);
        return setJobOrderLineItemId;
    }
}