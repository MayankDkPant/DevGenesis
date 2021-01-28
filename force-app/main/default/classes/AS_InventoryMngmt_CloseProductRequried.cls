/*
	Created By: Mayank Pant
	Purpose: This class will update the status of Product Required object records when a Job order is 
	closed/completed/cancelled	in the system.*/
public class AS_InventoryMngmt_CloseProductRequried {
    
    /*This method will update the stauts of product requried records for the job order received in the argument*/
    public static List<ProductRequired> updateProductRequiredStatusToClose(Set<Id> setJobOrderId){
    	List<ProductRequired> lstProductRequired = new List<ProductRequired>();
        lstProductRequired = getProductRequired(setJobOrderId);
        setProductRequiredStatusToClose(lstProductRequired);
        lstProductRequired =  updateProductRequiredRecords(lstProductRequired);
        return lstProductRequired;
    }
    
    /*This method will query and return product requried records for the job orders*/
    public static List<ProductRequired> getProductRequired(Set<Id> setJobOrderId){
    	return [SELECT ID, 
                	   ParentRecordId,
                	   JobOrder__r.Status,
                	   Status__c
                	FROM ProductRequired
               		WHERE JobOrder__c IN : setJobOrderId];
        
    }
    
    /*This method will set the status of product requried to Complete*/
    public static List<ProductRequired> setProductRequiredStatusToClose(List<ProductRequired> lstProductRequired)
    {
        for(ProductRequired prdReq: lstProductRequired){
            
            if(prdReq.JobOrder__r.status == 'Completed'){
            	prdReq.status__c = 'Completed';    
            }   
            if(prdReq.JobOrder__r.status == 'Closed' || prdReq.JobOrder__r.status == 'Canceled'){
                prdReq.status__c = 'Completed'; 
            } 
        }
        return lstProductRequired;
    }
    
    /*This method will perform the dml and will update the product required records*/
    public static List<ProductRequired> updateProductRequiredRecords(List<ProductRequired> lstProductRequired){
        try{
        	database.update(lstProductRequired, false);   
        }catch(Exception ex){
            //Mayank to provide exception here
        }
        return lstProductRequired;
    }
}