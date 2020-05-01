using Toybox.Application as App;
using Toybox.WatchUi as Ui;
using Toybox.System;

module Properties {

	const PROP_PRESET_NUMBER = "presetNumber";
	const PROP_PRESET_NAME = "presetName";
	
	const PROP_WORK_TIME =  "workTime";
	const PROP_REST_TIME = "restTime";
	const PROP_EXERCISES = "exercises";
	const PROP_PREP_TIME = "prepTime";

	// getters - current preset
	function getPresetNumberInternal(app) {
		var presetNumber = app.getProperty(PROP_PRESET_NUMBER);
		return presetNumber;
	}
	
	function getCurrentPresetName() {
		var app = App.getApp();
		
		var presetNumber = getPresetNumberInternal(app);
		var presetName = getPresetNameForPreset(presetNumber);
		return presetName;
	}
	
	function getCurrentWorkTime() {
		var app = App.getApp();

		var preset = getPresetNumberInternal(app);
		var workTime = app.getProperty(PROP_WORK_TIME + preset);
		return workTime;
	}
	
	function getCurrentRestTime() {
		var app = App.getApp();
		
		var preset = getPresetNumberInternal(app);
		var restTime = app.getProperty(PROP_REST_TIME + preset);
		return restTime;
	}
	
	function getCurrentPrepTime() {
		var app = App.getApp();
		
		var prepTime = app.getProperty(PROP_PREP_TIME);
		return prepTime;
	}
	
	function getCurrentExercises() {
		var app = App.getApp();
			
		var preset = getPresetNumberInternal(app);
		var exercises = app.getProperty(PROP_EXERCISES + preset);
		return exercises;
	}
	
	// setters - current preset
	function setPresetNumber(presetNumber) {
		App.getApp().setProperty(PROP_PRESET_NUMBER, presetNumber);
	}	

	// getters - specified preset
	function getExercisesForPreset(preset) {
		var app = App.getApp();
		
		var exercises = app.getProperty(PROP_EXERCISES + preset);
		return exercises;
	}
	
	function getRestTimeForPreset(preset) {
		var app = App.getApp();
		
		var restTime = app.getProperty(PROP_REST_TIME + preset);
		return restTime;
	}
	
	function getWorkTimeForPreset(preset) {
		var app = App.getApp();
		
		var workTime = app.getProperty(PROP_WORK_TIME + preset);
		return workTime;
	}
	
	// setters - specified preset 
	function setPresetName(id, name) {
		App.getApp().setProperty(PROP_PRESET_NAME + id, name);
	}
	
	function setPrepTime(prepTime) {
		App.getApp().setProperty(PROP_PREP_TIME, prepTime);
	}
	
	function setExercises(id, value) {
		App.getApp().setProperty(PROP_EXERCISES + id, value);
	}
	
	function setWorkTime(id, value) {
		App.getApp().setProperty(PROP_WORK_TIME + id, value);
	}
	
	function setRestTime(id, value) {
		App.getApp().setProperty(PROP_REST_TIME + id, value);
	}		
	
	// others
	function getPresetNameForPreset(id) {
		var app = App.getApp();
		var presetName = app.getProperty(PROP_PRESET_NAME + id);
		return presetName;
	}
		
}