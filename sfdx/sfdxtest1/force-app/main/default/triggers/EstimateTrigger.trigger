trigger EstimateTrigger on EstimateInfo__c (after insert, after update) {
    
	for (EstimateInfo__c ei : Trigger.new){
		List<EstimateDetail__c> ed = [SELECT Id, Name, Approvar1__c, Approvar2__c, Parent__r.Id FROM EstimateDetail__c WHERE Parent__r.Id = :ei.Id]; 
	
		for (EstimateDetail__c edi : ed){
			boolean bUpd = false;

/*			
			if (ei.Approvar1__c != null){
				edi.Approvar1__c = ei.Approvar1__c;
				bUpd = true;
			}
			if (ei.Approvar2__c != null){
				edi.Approvar2__c = ei.Approvar2__c;
				bUpd = true;
			}			
*/
			
			bUpd = EstimateDataUtil.CopyInfoData2Detail(ei, edi);
			
			if (bUpd){
				update edi;
			}
		}
				
	}
}