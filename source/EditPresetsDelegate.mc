using Toybox.WatchUi as Ui;
using Toybox.System;

class EditPresetsDelegate extends Ui.MenuInputDelegate {

	const EMPTY = "-";

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(item) {
		var id;
		var title;
		
		if (item != :addNew) {
			id = item;
			title = Properties.getPresetNameForPreset(item);
		} else {
    		id = findFirstNotAddedPreset();
    		title = "Preset#" + id;
    		
    		Properties.setPresetName(id, title);
    		Ui.popView(WatchUi.SLIDE_IMMEDIATE);
    		Ui.pushView(new SelectPresetMenu(true), new EditPresetsDelegate(), WatchUi.SLIDE_IMMEDIATE);
    		
		}
		
		Ui.pushView(new EditPresetMenu(title, id), new EditPresetDelegate(id), Ui.SLIDE_UP);
	}
	
	function findFirstNotAddedPreset() {
		for (var i=1; i<=5; i++) {
			var presetName = Properties.getPresetNameForPreset(i);
			if (EMPTY.equals(presetName)) {
				return i;
			}
		}
		return 0;
	}
	        
}