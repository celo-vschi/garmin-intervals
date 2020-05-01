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
				var usedPresetName = Properties.getCurrentPresetName();	        
				System.print(usedPresetName);
//	            Properties.setPresetName(mId, EMPTY);
	        }
	    }
}