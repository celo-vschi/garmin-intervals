using Toybox.WatchUi;
using Toybox.System;

class intervalsappDelegate extends WatchUi.BehaviorDelegate {

	private var PRESET_MENU_TITLE = "Choose Preset";

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onKey(keyEvent) {
    	if (keyEvent.getKey() == WatchUi.KEY_DOWN) {
    		openSelectPresetMenu();
    	}
    	return true;
	}

    function onMenu() {
    	// will come later
        return true;
    }
    
    private function openSelectPresetMenu() {
    	var menu = new Rez.Menus.SelectPresetMenu();
		menu.setTitle(PRESET_MENU_TITLE);
    	WatchUi.pushView(menu, new intervalsappMenuDelegate(), WatchUi.SLIDE_UP);
    }
    

}