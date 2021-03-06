using Toybox.WatchUi;
using Toybox.System;

class IntervalsDelegate extends WatchUi.BehaviorDelegate {

	private var view = null;

	private var PRESET_MENU_TITLE = "Choose Preset";

    function initialize() {
        BehaviorDelegate.initialize();
    }
    
    function onBack() {
    	if (view == null) {
    		return false;
    	} else if (view.isRunning()) {
			view.stopActivity();
			return true;
    	}
    	return false;
    }

    function onKey(keyEvent) {
    	var key = keyEvent.getKey();
    	if (key == WatchUi.KEY_DOWN) {
    		if (!view.isRunning()) {
    			WatchUi.pushView(new SelectPresetMenu(false), new SelectPresetDelegate(), WatchUi.SLIDE_LEFT);
			} 		
    		return true;
    	} else if (key == WatchUi.KEY_ENTER) {
    		if (view.isRunning()) {
    			if (view.isPaused()) {
    				view.resumeActivity();			
    			} else {
					view.pauseActivity();    	
    			}
    		} else {
    			view.startActivity();
    		}
    		return true;
		}
    	return false;
	}

    function onMenu() {
    	if (!view.isRunning()) {
	    	WatchUi.pushView(new SettingsMenu(), new SettingsDelegate(), WatchUi.SLIDE_LEFT);
    	} 
        return true;
    }
    
    function setView(view) {
    	me.view = view;
    }

}