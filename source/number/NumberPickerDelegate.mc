using Toybox.WatchUi;
using Toybox.System;

class TimePickerDelegate extends WatchUi.PickerDelegate {
	
	private var mSetting;
	
	function initialize(setting) {
        PickerDelegate.initialize();
        mSetting = setting;
    }

    function onCancel() {
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
    }
    
    function onAccept(values) {
		var value = values[0];
//		System.println("setting " + mSetting.toString() + " to " + value);	
		if (mSetting == :prepTime) {
			Properties.setPrepTime(value);
		}
		WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
    }

}