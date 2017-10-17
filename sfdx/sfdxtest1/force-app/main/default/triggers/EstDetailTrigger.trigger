trigger EstDetailTrigger on EstimateDetail__c (before insert, before update) {
    for (EstimateDetail__c ed : Trigger.new) {
//        String pid = ed.Parent__c.Id;
        EstimateInfo__c ei = [SELECT Id, Name, Approvar1__c, Approvar2__c FROM EstimateInfo__c WHERE Id = :ed.Parent__c LIMIT 1];        
//        EstimateInfo__c ei = [SELECT Id, Name, Approvar1__c, Approvar2__c, (SELECT Id, Name FROM EstimateInfo__r) FROM EstimateInfo__c];
//        

        System.debug('★★id=' + ed.Parent__c + ', ed.Id= ' + ed.Id + ', ei.Id =' + ei.Id);
        EstimateDataUtil.CopyInfoData2Detail (ei, ed);
//        ed.Approvar1__c = ei.Approvar1__c;
//        ed.Approvar2__c = ei.Approvar2__c;
    }
}