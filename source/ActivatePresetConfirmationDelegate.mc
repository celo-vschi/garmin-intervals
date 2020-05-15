using Toybox.WatchUi as Ui;
using Toybox.System;

class ActivatePresetConfirmationDelegate extends Ui.ConfirmationDelegate {

		private var mId;
		private var mActivated;

	    function initialize(id, activated) {
	        ConfirmationDelegate.initialize();
	        mActivated = activated;
	        mId = id;
	    }
	
	    function onResponse(response) {
	        if (response == Ui.CONFIRM_YES) {
				Properties.setPresetActivated(mId, !mActivated);
				Ui.popView(Ui.SLIDE_IMMEDIATE);
	        }
	    }
	    
}