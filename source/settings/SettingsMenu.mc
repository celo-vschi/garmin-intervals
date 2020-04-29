using Toybox.WatchUi;

class SettingsMenu extends WatchUi.Menu {

	function initialize() {
		Menu.initialize();
		setTitle("Settings");
		
		var label = WatchUi.loadResource(Rez.Strings.PrepTimeLabel);
		addItem(label, :prepTime);
	}

}