@IsTest
public class TestDataSetFactory {

	public static User createSampleUser() {
		return(User) TestDataFactory.createSObject('User', new Map<String, Object> {
			                                          'ProfileId' => UserInfo.getProfileId(),
			                                          'Username' => 'test@mytestdomain.developer',
			                                          'CommunityNickname' => 'test'
		                                           });
	}
	public static User createSampleUserUniqueUserName(String userName, String nickName) {
		return(User) TestDataFactory.createSObject('User', new Map<String, Object> {
			                                          'ProfileId' => UserInfo.getProfileId(),
			                                          'Username' => userName,
			                                          'CommunityNickname' => nickName
		                                           });
	}
	public static User createUserwithDeptandProfile(String username, String nickname, String deptcode, Id ProfileId) {
		return(User) TestDataFactory.createSObject('User', new Map<String, Object> {
			                                          'ProfileId' => ProfileId,
			                                          'Username' => username,
			                                          'CommunityNickname' => nickname,
			                                          'Department' => deptcode
		                                           });
	}
	public static GroupMember createGroupMember(Id userId, Id GroupId) {
		return(GroupMember) TestDataFactory.createSObject('GroupMember', new Map<String, Object> {
			                                                 'UserOrGroupId' => userId,
			                                                 'GroupId' => GroupId

		                                                  });
	}

	public static GMECountry__c createSampleGMECountry() {
		return(GMECountry__c) TestDataFactory.createSObject('GMECountry__c', new Map<String, Object> {
			                                                   'Name' => 'Germany',
			                                                   'ConsentVersion__c' => '1',
			                                                   'Sales_LatestReactionTimeLeads__c' => '2',
			                                                   'VAT__c' => 16.0
		                                                    });
	}

	public static Department__c createSamplePrefferedLocation(Id gmeCountryId) {
		return(Department__c) TestDataFactory.createSObject('Department__c', new Map<String, Object> {
			                                                   'Country__c' => 'Germany',
			                                                   'GME_Country__c' => gmeCountryId,
			                                                   'Department_Code__c' => 'CC01',
			                                                   'Name' => '	Germany, Call Center',
			                                                   'RecordTypeId' => Department__c.sObjectType.getDescribe()
			                                                   .getRecordTypeInfosByDeveloperName().get('Store').getRecordTypeId(),
			                                                   'Street__c' => 'Sonnenstraße 71',
			                                                   'Zipcode__c' => '80331',
			                                                   'City__c' => 'Stuttgart',
			                                                   'AdditionalVehicleOccupationHoursStar__c' => '',
			                                                   'AdditionalVehicleOccupationHoursEnd__c' => '1'
		                                                    });
	}

	public static Account createSampleAccount(Id prefferedFacilityId) {
		return(Account) TestDataFactory.createSObject('Account', new Map<String, Object> {
			                                             'AccountNumber' => 'Fleet account',
			                                             'Industry' => 'Agriculture',
			                                             'Contact_Details__c' => 'Email',
			                                             'Major_Language__c' => 'en_US',
			                                             'Preferred_ZipCode__c' => '12345',
			                                             'RecordTypeId' => Account.sObjectType.getDescribe()
			                                             .getRecordTypeInfosByDeveloperName().get('ARECFA').getRecordTypeId(),
			                                             'PreferredFacility__c' => prefferedFacilityId,
			                                             'BillingCountry' => 'Germany',
			                                             'BillingStreet' => 'Sonnenstraße 71',
			                                             'BillingPostalCode' => '80331',
			                                             'BillingCity' => 'Stuttgart'
		                                              });
	}

	public static Account createSampleAccount2(Id prefferedFacilityId) {
		return(Account) TestDataFactory.createSObject('Account', new Map<String, Object> {
			                                             'AccountNumber' => 'Fleet account 2',
			                                             'Industry' => 'Agriculture',
			                                             'Contact_Details__c' => 'Email',
			                                             'Major_Language__c' => 'en_US',
			                                             'Preferred_ZipCode__c' => '12345',
			                                             'RecordTypeId' => Account.sObjectType.getDescribe()
			                                             .getRecordTypeInfosByDeveloperName().get('ARECFA').getRecordTypeId(),
			                                             'PreferredFacility__c' => prefferedFacilityId,
			                                             'BillingCountry' => 'Germany',
			                                             'BillingStreet' => 'Niddastraße 49',
			                                             'BillingPostalCode' => '60329',
			                                             'BillingCity' => 'Frankfurt am Main'
		                                              });
	}

	public static Contact createSampleContact(Id accountId) {
		return(Contact) TestDataFactory.createSObject('Contact', new Map<String, Object> {
			                                             'AccountId' => accountId,
			                                             'LastName' => 'TestContact',
			                                             'CurrencyIsoCode' => 'EUR',
			                                             'MailingCountry' => 'Germany',
			                                             'MailingStreet' => 'Sonnenstraße 71',
			                                             'MailingPostalCode' => '80331',
			                                             'MailingCity' => 'Stuttgart'
		                                              });
	}

	public static Contact createSampleContactWithoutAddress(Id accountId) {
		return(Contact) TestDataFactory.createSObject('Contact', new Map<String, Object> {
			                                             'AccountId' => accountId,
			                                             'LastName' => 'TestContact',
			                                             'CurrencyIsoCode' => 'EUR',
			                                             'MailingCountry' => 'Germany',
			                                             'MailingStreet' => null,
			                                             'MailingPostalCode' => null,
			                                             'MailingCity' => null
		                                              });
	}

	public static Employee__c createEmployee(Id prefferedFacilityId, Id contactId, Id userId) {
		return(Employee__c) TestDataFactory.createSObject('Employee__c', new Map<String, Object> {
			                                                 'Country__c' => 'Germany',
			                                                 'Department__c' => prefferedFacilityId,
			                                                 'EmploymentStartDate__c' => System.today().addDays(- 5),
			                                                 'EmploymentEndDate__c' => System.today().addDays(50),
			                                                 'EmploymentStatus__c' => 'Active',
			                                                 'Name' => 'Berlin, Agency, GPA',
			                                                 'Role__c' => 'Receptionist',
			                                                 'Salutation__c' => 'Mr.',
			                                                 'Sex__c' => 'Male',
			                                                 'User__c' => userId,
			                                                 'Contact__c' => contactId
		                                                  });
	}

	public static Employee__c createEmployeeWithSpecificRole(Id prefferedFacilityId, Id contactId, Id userId, String role, Id recordTypeId) {
		return(Employee__c) TestDataFactory.createSObject('Employee__c', new Map<String, Object> {
			                                                 'Country__c' => 'Germany',
			                                                 'Department__c' => prefferedFacilityId,
			                                                 'EmploymentStartDate__c' => System.today().addDays(- 5),
			                                                 'EmploymentEndDate__c' => System.today().addDays(50),
			                                                 'EmploymentStatus__c' => 'Active',
			                                                 'Name' => 'Berlin, Agency, GPA',
			                                                 'Role__c' => role,
			                                                 'Salutation__c' => 'Mr.',
			                                                 'Sex__c' => 'Male',
			                                                 'User__c' => userId,
			                                                 'Contact__c' => contactId,
															 'RecordTypeId' => recordTypeId
		                                                  });
	}

	public static Account createSamplePersonAccount(Id prefferedFacilityId) {
		return(Account) TestDataFactory.createSObject('Account', new Map<String, Object> {
			                                             'FirstName' => 'Test',
			                                             'LastName' => 'PersonAccount',
			                                             'Salutation' => 'Ms.',
			                                             'Major_Language__c' => 'en_US',
			                                             'Preferred_ZipCode__c' => '12345',
			                                             'Contact_Details__c' => 'Email',
			                                             'Customer_type__pc' => 'Prospect',
			                                             'RecordTypeId' => Account.sObjectType.getDescribe()
			                                             .getRecordTypeInfosByDeveloperName().get('PersonAccount').getRecordTypeId(),
			                                             'PreferredFacility__pc' => prefferedFacilityId,
			                                             'SMSConsent__pc' => true,
			                                             'TelephoneConsent__pc' => true,
			                                             'EmailConsent__pc' => true,
			                                             'PersonMailingCountry' => 'Germany',
			                                             'PersonMailingStreet' => 'Sonnenstraße 71',
			                                             'PersonMailingPostalCode' => '80331',
			                                             'PersonMailingCity' => 'Stuttgart'
		                                              });
	}

	public static Lead creatSampleLead() {
		return(Lead) TestDataFactory.createSObject('Lead', new Map<String, Object> {
			                                          'CurrencyIsoCode' => 'EUR',
			                                          'FirstName' => 'Test',
			                                          'LastName' => 'Lead',
			                                          'Salutation' => 'Ms.',
			                                          'Status' => 'New',
			                                          'SMSConsent__c' => true,
			                                          'TelephoneConsent__c' => true,
			                                          'EmailConsent__c' => true,
			                                          'Country' => 'Germany',
			                                          'Street' => 'Sonnenstraße 71',
			                                          'PostalCode' => '80331',
			                                          'City' => 'Stuttgart',
			                                          'Email' => 'test@lead.com.invalid'
		                                           });
	}

	public static Lead creatSampleLeadWithoutAddress() {
		return(Lead) TestDataFactory.createSObject('Lead', new Map<String, Object> {
			                                          'CurrencyIsoCode' => 'EUR',
			                                          'FirstName' => 'Test',
			                                          'LastName' => 'Lead',
			                                          'Salutation' => 'Ms.',
			                                          'Status' => 'New',
			                                          'SMSConsent__c' => true,
			                                          'TelephoneConsent__c' => true,
			                                          'EmailConsent__c' => true,
			                                          'Country' => 'Germany',
			                                          'Street' => null,
			                                          'PostalCode' => null,
			                                          'City' => null,
			                                          'Email' => 'test@lead.com.invalid'
		                                           });
	}

	public static Opportunity creatSampleOpportunity(Id accountId) {
		return(Opportunity) TestDataFactory.createSObject('Opportunity', new Map<String, Object> {
			                                                 'CurrencyIsoCode' => 'EUR',
			                                                 'Name' => 'Sample Opp',
			                                                 'AccountId' => accountId,
			                                                 'CloseDate' => System.today().addDays(20),
			                                                 'StageName' => 'New',
			                                                 'ForecastCategoryName' => 'Omitted',
			                                                 'estimatedPurchaseTime__c' => '1',
			                                                 'Scoring__c' => 'Hot',
			                                                 'modelOfInterest__c' => 'G70;G90',
			                                                 'RecordTypeId' => Opportunity.sObjectType.getDescribe()
			                                                 .getRecordTypeInfosByDeveloperName().get('GME_Sales_Germany').getRecordTypeId()
		                                                  });
	}

	public static Appointment__c creatAppointmentTestDriveValet(Id preferredLocation, Id opportunityId) {
		return(Appointment__c) TestDataFactory.createSObject('Appointment__c', new Map<String, Object> {
			                                                    'CurrencyIsoCode' => 'EUR',
			                                                    'RetailStore__c' => preferredLocation,
			                                                    'Opportunity__c' => opportunityId,
			                                                    'PickUpCountry__c' => 'Germany',
			                                                    'PickUpStreet__c' => 'Sonnenstraße 71',
			                                                    'ReservationRequestStart__c' => System.now().addDays(- 2),
			                                                    'ReservationRequestEnd__c' => System.now().addDays(2),
			                                                    'PickUpPostalCode__c' => '80331',
			                                                    'PickUpCity__c' => 'Stuttgart',
			                                                    'RecordTypeId' => Appointment__c.sObjectType.getDescribe()
			                                                    .getRecordTypeInfosByDeveloperName().get('TestDriveValet').getRecordTypeId()
		                                                     });
	}

	public static Appointment__c creatAppointmentTestDriveValetWithoutAddress(Id preferredLocation, Id opportunityId) {
		return(Appointment__c) TestDataFactory.createSObject('Appointment__c', new Map<String, Object> {
			                                                    'CurrencyIsoCode' => 'EUR',
			                                                    'RetailStore__c' => preferredLocation,
			                                                    'Opportunity__c' => opportunityId,
			                                                    'PickUpStreet__c' => null,
			                                                    'PickUpPostalCode__c' => null,
			                                                    'PickUpCity__c' => null,
			                                                    'PickUpCountry__c' => null,
			                                                    'ReservationRequestStart__c' => System.now().addDays(- 2),
			                                                    'ReservationRequestEnd__c' => System.now().addDays(2),
			                                                    'RecordTypeId' => Appointment__c.sObjectType.getDescribe()
			                                                    .getRecordTypeInfosByDeveloperName().get('TestDriveValet').getRecordTypeId()
		                                                     });
	}

	public static PriceBook2 createPriceBook(String name, String type) {
		return(PriceBook2) TestDataFactory.createSObject('PriceBook2', new Map<String, Object> {
			                                                'Name' => name,
			                                                'Description' => null,
			                                                'IsActive' => true,
			                                                'Type__c' => type
		                                                 });
	}
	public static PriceBook2 createNSCPriceBook(String name, String type, String country) {
		return(PriceBook2) TestDataFactory.createSObject('PriceBook2', new Map<String, Object> {
			                                                'Name' => name,
			                                                'Description' => null,
			                                                'IsActive' => true,
			                                                'Type__c' => type,
			                                                'Country__c' => country,
			                                                'Is_Regional_Pricebook__c' => true
		                                                 });
	}
	public static PricebookEntry createPriceBookEntry(Integer unitprice, Id pricebookId, Id ProductId) {
		return(PricebookEntry) TestDataFactory.createSObject('PricebookEntry', new Map<String, Object> {
			                                                'IsActive' => true,
			                                                'UnitPrice' => unitprice,
			                                                'Pricebook2Id' => pricebookId,
			                                                'Product2Id' => ProductId
		                                                 });
	}
	public static Department__c createDepartment(String code, String name) {
		return(Department__c) TestDataFactory.createSObject('Department__c', new Map<String, Object> {
			                                                   'Department_Code__c' => code,
			                                                   'Name' => name
		                                                    });
	}
	public static Schema.Location createLocation(String LocationType, String name, Id department, Boolean IsInventoryLocation) {
		return(Schema.Location) TestDataFactory.createSObject('Location', new Map<String, Object> {
			                                                     'Name' => name,
			                                                     'LocationType' => LocationType,
			                                                     'Department__c' => department,
			                                                     'IsInventoryLocation' => IsInventoryLocation
		                                                      });
	}
	public static WorkOrder createWorkOrder(String country, Pricebook2 Pricebook) {
		return(WorkOrder) TestDataFactory.createSObject('WorkOrder', new Map<String, Object> {
			                                               'Country__c' => country,
			                                               'Pricebook2' => Pricebook
		                                                });
	}
	public static WorkOrderLineItem createWorkOrderLineItem(Id workorder) {
		return(WorkOrderLineItem) TestDataFactory.createSObject('WorkOrderLineItem', new Map<String, Object> {
			                                                       'WorkOrderId' => workorder
		                                                        });
	}
	public static Product2 createProduct(String name, Boolean isActiveBoolean, String country) {
		return(Product2) TestDataFactory.createSObject('Product2', new Map<String, Object> {
			                                                   'Name' => name,
			                                                   'isActive' => isActiveBoolean,
			                                                   'Country__c' => country
		                                                    });
	}
	public static List<Product2> createBulkProducts(String name, Integer count) {
		List<Product2> pdtList = new List<Product2> ();
		for (Integer i = 0; i<count; i++)
		{
			pdtList.add((Product2) TestDataFactory.createSObject('Product2', new Map<String, Object> {
				                                                    'Name' => name + i
			                                                     }));
		}
		return pdtList;
	}
	public static List<ProductItem> createBulkProductItems(List<Product2> pdtList, Integer QuantityOnHand, Id LocationId, Id Department, Integer QuantityReserved, Integer count) {
		List<ProductItem> piList = new List<ProductItem> ();
		for (Integer i = 0; i<count; i++)
		{
			piList.add((ProductItem) TestDataFactory.createSObject('ProductItem', new Map<String, Object> {
				                                                      'Product2Id' => pdtList[i].Id,
				                                                      'QuantityOnHand' => QuantityOnHand + i,
				                                                      'LocationId' => LocationId,
				                                                      'Department__c' => Department,
				                                                      'Quantity_Reserved__c' => QuantityReserved
			                                                       }));
		}
		return piList;
	}
	public static List<ProductRequired> createBulkProductRequired(Id ParentRecordId, List<ProductItem> piList, List<Product2> pdtList, Integer QuantityRequired, Integer count) {
		List<ProductRequired> prList = new List<ProductRequired> ();
		for (Integer i = 0; i<count; i++)
		{
			prList.add((ProductRequired) TestDataFactory.createSObject('ProductRequired', new Map<String, Object> {
				                                                          'ParentRecordId' => ParentRecordId,
				                                                          'Product_Item_Inventory__c' => piList[i / 4].Id,
				                                                          'Product2Id' => pdtList[i].Id,
				                                                          'QuantityRequired' => QuantityRequired
			                                                           }));
		}
		return prList;
	}
	public static Asset createAsset(String name, Id Department) {
		return(Asset) TestDataFactory.createSObject('Asset', new Map<String, Object> {
			                                           'name' => name,
			                                           'Department__c' => Department
		                                            });
    }
    //Riddhi Creating asset with vehicle Model
    public static Asset createAssetWithVehicleModel(String name, Id Department, ID VehicleModel) {
		return(Asset) TestDataFactory.createSObject('Asset', new Map<String, Object> {
			                                           'name' => name,
			                                           'Department__c' => Department,
                                                        'Vehicle_Model_LTM__c' => VehicleModel  
		                                            });
    }
    
        //Riddhi Creating ServicePackage for US-1335
    public static Service_Package__c createServicepackage(String name,string country,Date startDate, Date endDate, Boolean doInsert, string year , ID vM) {
		return(Service_Package__c) TestDataFactory.createSObject('Service_Package__c', new Map<String, Object> {
			                                           'name' => name,
                                     		           'SpValidity_From__c' => startDate,
                                     		           'SpValidity_Until__c' => endDate,
                                                       //'IsForAllModel__c' => doInsert,
                                    	               'Country__c' => country,
                                    				   'Auto_Link__c' => doInsert,
                                        			   'IsActive__c' => doInsert,
                                                       'SpLAST_MODIFIED_DATE__c' => date.today(),
                                                        'Validity__c' => year,
                                                         'Vehicle_Model__c' => vM
		                                            });
        
        
	}
	
	public static Service_Package__c createGMEServicePakcage(Id vehicleModel,string country,Boolean doInsert){
		return (Service_Package__c) TestDataFactory.createSObject('Service_Package__c', new Map<String,Object>{
																		'Name' => 'Stress Free Program',
																		'SpValidity_From__c' => system.today(),
																		'SpValidity_Until__c' => system.today().addDays(10),
																		'Country__c' => country,
																		'Auto_Link__c' => doInsert,
																		'IsActive__c' => doInsert,
																		'SpLAST_MODIFIED_DATE__c' => date.today(),
																		'Validity__c' => '1Year',
																		'Vehicle_Model__c' => vehicleModel			
		});
	}

	public static List<Service_Package_Item__c> createServicePackagePartItems(Id servicePackageId, Id productId, Integer numberOfSObjects, Boolean doInsert){
		return (List<Service_Package_Item__c>) TestDataFactory.createSObjectList('Service_Package_Item__c', 
																			new Map<String,Object> {
																			'Name' => 'Oil Filter',
																			'Service_Package__c' => servicePackageId,
																			'Tax__c' => 16,
																			'Product__c' =>productId,
																			'Quantity__c' =>2,
																			'StartDate__c' =>system.today(),
																			'LineItemType__c' =>'Part',
																			'EndDate__c' => System.today().addDays(3),
																			'Hours__c' => 10,
																			'spiValidity__c' => '1 Year'},
																			 numberOfSObjects, 
																			doInsert);
	}
	
	public static VehicleModel__c createVehicleModel(){
		return (VehicleModel__c) TestDataFactory.createSObject('VehicleModel__c', new Map<String,Object>{
																		'Name' => 'Genesis G80',
																		'Product_Code__c' => '3.5T V6 AWD',
																		'Model_Year__c' => '2021',
																		'Active__c	' => true,
																		'Transmission__c' =>'8-SPEED AUTOMATIC',
																		'Model__c' => 'G80'
		});
	}

    public static Quote createQuote(String name, Id accountId, Id opportunityId) {
		return(Quote) TestDataFactory.createSObject('Quote', new Map<String, Object> {
			                                           'Name' => name,
                                                       'Account__c' => accountId,
                                                       'Zip_Code__c' => '12345',
                                                       'OpportunityId' => opportunityId
		                                            });
    }
    public static QuoteLineItem createQuoteLineItem(Id quoteId, Id productId, Id pbeId) {
		return(QuoteLineItem) TestDataFactory.createSObject('QuoteLineItem', new Map<String, Object> {
			                                           'QuoteId' => quoteId,
                                                       'CarLine__c' => '1',
                                                       'Quantity' => 1,
                                                       'ExteriorColour__c' => 'red',
                                                       'ModelYear__c' => '2021',
                                                       'Product2Id' => productId,
                                                       'PricebookEntryId' => pbeId
		                                            });
    }
    public static QuoteVehiclePackageOption__c createQuoteVehiclePackageOption(Id quoteLineItemId) {
		return(QuoteVehiclePackageOption__c) TestDataFactory.createSObject('QuoteVehiclePackageOption__c', new Map<String, Object> {
			                                           'QuoteLineItem__c' => quoteLineItemId,
                                                       'Type__c' => 'O',
                                                       'OptionPackagePrice__c' => 2000,
                                                       'ITEMSequence__c' => 1
		                                            });
    }

    public static Contract createContract(String name, Id accountId, Id quoteId) {
		return(Contract) TestDataFactory.createSObject('Contract', new Map<String, Object> {
			                                           'Name' => name,
                                                       'AccountId' => accountId,
                                                       'Quotation__c' => quoteId
		                                            });
    }
	public static Repair__c createRepair(Id AssetId) {
		return(Repair__c) TestDataFactory.createSObject('Repair__c', new Map<String, Object> {
			                                         'Vehicle__c'=>AssetId
		                                            });
    } 
    public static StatusConfirmation__c createStatusConfirmation(Id RepairId) {
		return(StatusConfirmation__c) TestDataFactory.createSObject('StatusConfirmation__c', new Map<String, Object> {
			                                          'Repair__c '=>RepairId
		                                            });
	} 
	public static Department__c createSampleAfterSales_Department() {
		return(Department__c) TestDataFactory.createSObject('Department__c', new Map<String, Object> {
			                                                   'Country__c' => 'Germany',
			                                                   'Department_Code__c' => 'DE01',
			                                                   'Name' => '	Germany, Call Center',
			                                                   'RecordTypeId' => Department__c.sObjectType.getDescribe()
			                                                   .getRecordTypeInfosByDeveloperName().get('Service_Center').getRecordTypeId(),
			                                                   'Street__c' => 'Sonnenstraße 71',
			                                                   'Zipcode__c' => '80331',
			                                                   'City__c' => 'Stuttgart'
															});
	}
	public static RepairPackage__c createRepairPackage(){
		return(RepairPackage__c) TestDataFactory.createSObject('RepairPackage__c', new Map<String, Object> {
			                                                   'Name' => 'Package  Munich Store',
															   'Country__c' => 'Germany',
															   'IsActive__c' => true,
															   'StartDate__c' => system.today(),
															   'EndDate__c' => system.today().addDays(10)
															});
	}
	public static List<RepairPackageItem__c> createRepairPackagePartItems(Id rprPckgId, Id productId, Integer numberOfSObjects, Boolean doInsert){
		return (List<RepairPackageItem__c>) TestDataFactory.createSObjectList('RepairPackageItem__c', 
																			new Map<String,Object> {
																			'Name' => 'Oil Filter',
																			'RecordTypeId' => RepairPackageItem__c.sObjectType.getDescribe()
																			.getRecordTypeInfosByDeveloperName().get('Part').getRecordTypeId(),
																			'RepairPackage__c' => rprPckgId,
																			'Tax__c' => 16,
																			'Product__c' =>productId,
																			'Quantity__c' =>2,
																			'StartDate__c' =>system.today(),
																			'LineItemType__c' =>'Part',
																			'EndDate__c' => System.today().addDays(3),
																			'Hours__c' => 10},
																			 numberOfSObjects, 
																			doInsert
																			);
		
	}
    
    public static Related_Repair_Package__c createRelatedRepairPackage(Id servicePackageId, Id rprPckgId){
		return (Related_Repair_Package__c) TestDataFactory.createSObject('Related_Repair_Package__c', new Map<String, Object> {
																		'Service_Package__c' => servicePackageId,
                                                                        'Repair_Package__c' => rprPckgId,
																		'Number_of_Times__c' => 2
																	});
	}
	

}