using Toybox.WatchUi;
using Toybox.Graphics;

class NumberFactory extends WatchUi.PickerFactory {

	private var mStart;
	private var mStop;
	private var mIncrement;
	
	const FONT = Graphics.FONT_NUMBER_HOT;
	const FORMAT = "%d";
	const COLOR = Graphics.COLOR_WHITE;
	const X_ALIGN = WatchUi.LAYOUT_HALIGN_CENTER;
	const Y_ALIGN = WatchUi.LAYOUT_VALIGN_CENTER;
	
	function getIndex(value) {
		var index = (value / mIncrement) - mStart;
		return index;
	}
	
	function initialize(start, stop, increment) {
		PickerFactory.initialize();
		
		mStart = start;
		mStop = stop;
		mIncrement = increment;
	}
	
	function getDrawable(index, selected) {
		return new WatchUi.Text({
			:text => getValue(index).format(FORMAT),
			:color => COLOR,
			:font => FONT,
			:locX => X_ALIGN,
			:locY => Y_ALIGN
		});
	}
	
	function getValue(index) {
		var value = mStart + (index * mIncrement); 
		return value;
	}
	
	function getSize() {
		var size = (mStop - mStart) / mIncrement + 1;
		return size;
	}

} 