/*Created By: Mayank Pant
Purpose: This class will update the price of the product in dealers pricebook from its corresponding NSC's pricebook*/
public class AS_PartsMaster_UpdatePriceBookEntry {

    @AuraEnabled
    public static string updatePriceBookEntry(string productId){
     	system.debug('enters in the update price book entry');
        try{
        	//string country = Util.getDepartment(Util.getUserInfo(UserInfo.getUserId()).Department).Country__c;  
        	  
        }catch(Exception ex){
            throw new AuraHandledException('NSFW name detected.');
        }
       
        return ('No country found');
    }
    
  }