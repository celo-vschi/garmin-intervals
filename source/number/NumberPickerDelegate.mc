using Toybox.WatchUi;
using Toybox.System;

class NumberPickerDelegate extends WatchUi.PickerDelegate {
	
	private var mSetting;
	private var mId;
	
	function initialize(setting, id) {
        PickerDelegate.initialize();
        mSetting = setting;
        mId = id;
    }

    function onCancel() {
        WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
    }
    
    function onAccept(values) {
		var value = values[0];
		
		switch(mSetting) {
			case :prepTime:
				Properties.setPrepTime(value);
				break;
			case :exercises:	
				Properties.setExercises(mId, value);
				break;
			case :workTime:
				Properties.setWorkTime(mId, value);
				break;
			case :restTime:
				Properties.setRestTime(mId, value);
				break;
		}			
				
		System.println("setting " + mSetting.toString() + " for preset#" + mId + " to " + value);	
		WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
    }

}