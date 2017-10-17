public with sharing class EstimateDataUtil {
    public static Boolean CopyInfoData2Detail(EstimateInfo__c parent, EstimateDetail__c child){
    	Boolean bUpd = false;
    	
    	if (parent != null && child != null){
	    	// 承認者のコピー
	    	if (child.Approvar1__c != parent.Approvar1__c) {
				child.Approvar1__c = parent.Approvar1__c;
				bUpd = true;
	    	}
	    	if (child.Approvar2__c != parent.Approvar2__c) {		
				child.Approvar2__c = parent.Approvar2__c;
				bUpd = true;
	    	}
    		
    	}
    	
    	
    	
    	return bUpd;
    }
}