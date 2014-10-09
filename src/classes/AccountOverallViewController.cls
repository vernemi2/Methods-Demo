public with sharing class AccountOverallViewController {
    
    Id curAccId;
	
	public AccountOverallViewController(ApexPages.StandardController ctrl){
		this.curAccId = ctrl.getId();
	}   
	
    public List<Task> getOpenTasks(){
        List<Task> openTasks = [select id, Subject, ActivityDate, Status, Priority from Task where AccountId = :curAccId and Status != 'Completed'];
        return openTasks;
    }
    
    public List<Event> getOpenEvents(){
        List<Event> openEvents = [select id, Subject, EndDateTime, StartDateTime from Event where AccountId = :curAccId];
        return openEvents;
    }
    
    public List<Product2> getAllProducts(){
        List<Product2> products = [select Id, Name, ProductCode, Description, Number_of_Transactions__c, Balance__c, Outgoing_Payments__c from Product2 where Account__c = :curAccId]; 
        return products;
    }
}