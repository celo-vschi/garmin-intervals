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

	function getPresetNameById(id) {
		var app = App.getApp();
		var presetName = app.getProperty(PROP_PRESET_NAME + id);
		return presetName;
	}
	
	function setPresetName(id, name) {
		App.getApp().setProperty(PROP_PRESET_NAME + id, name);
	}

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
		var presetName = getPresetNameById(presetNumber);
		return presetName;
	}
	
	function setPresetNumber(presetNumber) {
		App.getApp().setProperty(PROP_PRESET_NUMBER, presetNumber);
	}
	
	function setPrepTime(prepTime) {
		App.getApp().setProperty(PROP_PREP_TIME, prepTime);
	}
	
	function getExercisesForPreset(preset) {
		var app = App.getApp();
		
		var exercises = app.getProperty(PROP_EXERCISES + preset);
		return exercises;
	}
	
	function setExercises(id, value) {
		App.getApp().setProperty(PROP_EXERCISES + id, value);
	}
	
	function getWorkTimeForPreset(preset) {
		var app = App.getApp();
		
		var workTime = app.getProperty(PROP_WORK_TIME + preset);
		return workTime;
	}
	
	function setWorkTime(id, value) {
		App.getApp().setProperty(PROP_WORK_TIME + id, value);
	}
	
	function getRestTimeForPreset(preset) {
		var app = App.getApp();
		
		var restTime = app.getProperty(PROP_REST_TIME + preset);
		return restTime;
	}
	
	function setRestTime(id, value) {
		App.getApp().setProperty(PROP_REST_TIME + id, value);
	}
	

		
}