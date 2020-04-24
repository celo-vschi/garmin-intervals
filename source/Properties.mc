using Toybox.Application as App;
using Toybox.System;

module Properties {

	const PROP_PRESET_NUMBER = "presetNumber";
	const PROP_WORK_TIME =  "workTime";

	function getPresetNumber() {
		var app = App.getApp();
		var presetNumber = app.getProperty(PROP_PRESET_NUMBER);
		System.println(presetNumber);
		
		var workTime = app.getProperty(PROP_WORK_TIME + presetNumber);
		System.println(workTime);
	}
	
	function setPresetNumber(presetNumber) {
		App.getApp().setProperty(PROP_PRESET_NUMBER, presetNumber);
	}

		
}