using Toybox.WatchUi as Ui;
using Toybox.System;

class DeletePresetConfirmationDelegate extends Ui.ConfirmationDelegate {

		private var mId;
		const EMPTY = "-";

	    function initialize(id) {
	        ConfirmationDelegate.initialize();
	        mId = id;
	    }
	
	    function onResponse(response) {
	        if (response == Ui.CONFIRM_YES) {
	            Properties.setPresetName(mId, EMPTY);
				
				// replace used preset if needed
				var usedPresetNumber = Properties.getCurrentPresetNumber();	        
				if (usedPresetNumber == mId) {
					var newPresetNumber = getFirstAvailablePresetNumber();
					if (newPresetNumber != 0) {
						Properties.setPreset(newPresetNumber);
					}
				}
				
				// back to first screen
				Ui.popView(WatchUi.SLIDE_IMMEDIATE);
				Ui.popView(WatchUi.SLIDE_IMMEDIATE);
				Ui.popView(WatchUi.SLIDE_IMMEDIATE);
	        }
	    }
	    
	    function getFirstAvailablePresetNumber() {
	    	for (var i=1; i<=5; i++) {
	    		var presetName = Properties.getPresetNameForPreset(i);
	    		if (!EMPTY.equals(presetName)) {
	    			return i;
	    		}
	    	}
	    	return 0;
	    }
}