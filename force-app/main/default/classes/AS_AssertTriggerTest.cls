@isTest
public class AS_AssertTriggerTest {
    
@isTest 
static void insertServicePackage() {


   
   
    // Riddhi is creating Service package record for US-1335
    Test.startTest();
           
    	Department__c dep = AfterSales_TestFactory.getDepartmentStore('Store','StoreCode', false);  
   		GMECountry__c country = AfterSales_TestFactory.getCountry('Germany', 'DE', true);
        VehicleModel__c vM = new VehicleModel__c(
                	Name = 'G70-Product Name',
                    Model__c = 'G70'
                
            );
            insert vM;
    	Service_Package__c rec = new Service_Package__c();
    	rec = TestDataSetFactory.createServicepackage('SP1', 
                                                   'Germany', 
                                                   system.today(),
                                                   system.today().addDays(3),
                                                   true,
                                                   '1 Year',
                                                    vM.Id );
    	system.debug('rec is '+rec);
         
            
       Test.stopTest();
    	Asset vehicle = TestDataSetFactory.createAssetWithVehicleModel('Test Vehicle', dep.Id , vM.Id); 

    
	}
    
}