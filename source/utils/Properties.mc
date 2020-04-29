using Toybox.Application as App;
using Toybox.WatchUi as Ui;
using Toybox.System;

module Properties {

	const PROP_PRESET_NUMBER = "presetNumber";
	
	const PROP_WORK_TIME =  "workTime";
	const PROP_REST_TIME = "restTime";
	const PROP_EXERCISES = "exercises";
	const PROP_PREP_TIME = "prepTime";

	function getPresetNumber(app) {
		var presetNumber = app.getProperty(PROP_PRESET_NUMBER);
		return presetNumber;
	}
	
	function getPrepTime() {
		var app = App.getApp();
		
		var prepTime = app.getProperty(PROP_PREP_TIME);
		return prepTime;
	}
	
	function getWorkTime() {
		var app = App.getApp();

		var preset = getPresetNumber(app);
		var workTime = app.getProperty(PROP_WORK_TIME + preset);
		return workTime;
	}
	
	function getRestTime() {
		var app = App.getApp();
		
		var preset = getPresetNumber(app);
		var restTime = app.getProperty(PROP_REST_TIME + preset);
		return restTime;
	}
	
	function getExercises() {
	var app = App.getApp();
		
	var preset = getPresetNumber(app);
	var exercises = app.getProperty(PROP_EXERCISES + preset);
	return exercises;
	}
	
	
	function getPresetName() {
		var app = App.getApp();
		var presetNumber = getPresetNumber(app);
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
	
	function setPrepTime(prepTime) {
		App.getApp().setProperty(PROP_PREP_TIME, prepTime);
	}

		
}