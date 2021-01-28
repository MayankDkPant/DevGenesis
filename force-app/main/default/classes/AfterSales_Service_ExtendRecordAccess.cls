/*
	Created By: Mayank Pant
	Created Date: 10th Nov 2020
	Purpose: This class will extend the record access to the identified audience.
			 It is a generic class and whenever a record is created and owned by Aftersales dealer user, 
			 the record is shared with all dealers in that dealership. 
*/
public class AfterSales_Service_ExtendRecordAccess {

    /*This method will receive set of record ids and the sobject type*/
    public void extendTheRecordAccess(Set<Id> setRecordId, sobjectType sobjType){
        
    }
    
    /*Fetch the public group of the dealer*/
    public void getDealerPublicGroup(){
      // The naming convention for public group name is 'AfterSales Dealer'+ 'Country Code'  
    }
}