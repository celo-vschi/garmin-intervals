using Toybox.Application as App;
using Toybox.System;

module Properties {

	const PROP_PRESET_NUMBER = "presetNumber";

	function getPresetNumber() {
		var app = App.getApp();
		var x = app.getProperty(PROP_PRESET_NUMBER);
		System.println(x);
	}

		
}