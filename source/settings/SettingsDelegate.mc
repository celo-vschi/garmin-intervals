using Toybox.Application;
using Toybox.WatchUi;
using Toybox.System;

class SettingsDelegate extends WatchUi.MenuInputDelegate {

	function initialize() {
        MenuInputDelegate.initialize();
    }
    
    function onMenuItem(item) {
    	
		// PREP TIME
		if (item == :prepTime) {
			var label = Rez.Strings.PrepTimeLabel;
			var value = Properties.getCurrentPrepTime();
			var delegate = new NumberPickerDelegate(:prepTime, null);
			
			WatchUi.pushView(new NumberPicker(label, value, 1, 99), delegate, WatchUi.SLIDE_IMMEDIATE);
		}
		
		if (item == :editPresets) {
			WatchUi.pushView(new SelectPresetMenu(true), new EditPresetsDelegate(), WatchUi.SLIDE_LEFT);
		}
    
    }

}