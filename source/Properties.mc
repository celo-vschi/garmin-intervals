using Toybox.Application as App;
using Toybox.WatchUi as Ui;
using Toybox.System;

module Properties {

	const PROP_PRESET_NUMBER = "presetNumber";
	const PROP_WORK_TIME =  "workTime";

	function getPresetNumber() {
		var app = App.getApp();
		var presetNumber = app.getProperty(PROP_PRESET_NUMBER);
		
//		var workTime = app.getProperty(PROP_WORK_TIME + presetNumber);
//		System.println(workTime);
		return presetNumber;
	}
	
	function getPresetName() {
		var app = App.getApp();
		var presetNumber = getPresetNumber();
		var presetName;  
		switch (presetNumber) {
			case 1: presetName = Ui.loadResource(Rez.Strings.preset1);
				break;
			case 2: presetName = Ui.loadResource(Rez.Strings.preset2);
				break;
		}
		return presetName;
	}
	
	function setPresetNumber(presetNumber) {
		App.getApp().setProperty(PROP_PRESET_NUMBER, presetNumber);
	}

		
}