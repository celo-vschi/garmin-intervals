using Toybox.WatchUi as Ui;
using Toybox.System;

class EditPresetsDelegate extends Ui.MenuInputDelegate {

	const EMPTY = "-";

    function initialize() {
        MenuInputDelegate.initialize();
    }

    function onMenuItem(id) {
		var title = Properties.getPresetNameForPreset(id);
		Ui.pushView(new EditPresetMenu(title, id), new EditPresetDelegate(id), Ui.SLIDE_LEFT);
	}
	
}