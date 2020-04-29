using Toybox.WatchUi;
using Toybox.System;
using Toybox.Graphics;

class NumberPicker extends WatchUi.Picker {

	function initialize(label, initialValue, min, max) {
		var title = new WatchUi.Text({
			:text => label,
			:font => Graphics.FONT_MEDIUM, 
			:locX => WatchUi.LAYOUT_HALIGN_CENTER, 
			:locY => WatchUi.LAYOUT_VALIGN_BOTTOM, 
			:color => Graphics.COLOR_WHITE
		});
		var factory = new NumberFactory(min, max, 1);
		var index = getIndexValue(initialValue, min);
		
		Picker.initialize({
			:title => title,
			:defaults => [index],
			:pattern => [factory]
		});
	}
	
	private function getIndexValue(initialValue, min) {
		var index = initialValue - min;
		if (index < 0) {
			index = 0;
		}
		return index;
	}	

}