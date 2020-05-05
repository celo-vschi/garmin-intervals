using Toybox.Application as App;
using Toybox.WatchUi as Ui;
using Toybox.System;

module Properties {

	const PROP_PRESET_NUMBER = "presetNumber";
	const PROP_PRESET_NAME = "presetName";
	
	const PROP_ACTIVATED = "activated";
	const PROP_WORK_TIME =  "workTime";
	const PROP_REST_TIME = "restTime";
	const PROP_EXERCISES = "exercises";
	const PROP_PREP_TIME = "prepTime";

	// getters - current preset
	function getCurrentPresetNumber() {
		var app = App.getApp();
		var presetNumber = getCurrentPresetNumberInternal(app);
		return presetNumber;
	}
	function getCurrentPresetNumberInternal(app) {
		var presetNumber = app.getProperty(PROP_PRESET_NUMBER);
		return presetNumber;
	}
	
	function getCurrentPresetName() {
		var app = App.getApp();
		
		var presetNumber = getCurrentPresetNumberInternal(app);
		var presetName = getPresetNameForPreset(presetNumber);
		return presetName;
	}
	
	function getCurrentPrepTime() {
		var app = App.getApp();
		
		var prepTime = app.getProperty(PROP_PREP_TIME);
		return prepTime;
	}
	
	function getCurrentWorkTime() {
		var app = App.getApp();

		var presetNumber = getCurrentPresetNumberInternal(app);
		var workTime = app.getProperty(PROP_WORK_TIME + presetNumber);
		return workTime;
	}
	
	function getCurrentRestTime() {
		var app = App.getApp();
		
		var presetNumber = getCurrentPresetNumberInternal(app);
		var restTime = app.getProperty(PROP_REST_TIME + presetNumber);
		return restTime;
	}
	
	function getCurrentExercises() {
		var app = App.getApp();
			
		var presetNumber = getCurrentPresetNumberInternal(app);
		var exercises = app.getProperty(PROP_EXERCISES + presetNumber);
		return exercises;
	}
	
	// getters - specified preset
	function isPresetActivated(preset) {
		var app = App.getApp();
		
		var activated = app.getProperty(PROP_ACTIVATED + preset);
		return activated;
	}	
	
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
	
	function setExercises(id, exercises) {
		App.getApp().setProperty(PROP_EXERCISES + id, exercises);
	}
	
	function setWorkTime(id, workTime) {
		App.getApp().setProperty(PROP_WORK_TIME + id, workTime);
	}
	
	function setRestTime(id, restTime) {
		App.getApp().setProperty(PROP_REST_TIME + id, restTime);
	}		
	
	// others
	function getPresetNameForPreset(id) {
		var app = App.getApp();
		var presetName = app.getProperty(PROP_PRESET_NAME + id);
		return presetName;
	}
	
	function setPreset(presetNumber) {
		App.getApp().setProperty(PROP_PRESET_NUMBER, presetNumber);
	}
		
}