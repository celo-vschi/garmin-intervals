using Toybox.Application;
using Toybox.WatchUi;

class intervalsappApp extends Application.AppBase {

	private var view;

    function initialize() {
        AppBase.initialize();
    }

    function getInitialView() {
    	view = new intervalsappView();
    	view.loadProperties();
    	
    	var delegate = new intervalsappDelegate();
    	delegate.setView(view);
    	
        return [ view, delegate ];
    }
    
    function onSettingsChanged() {
		view.loadProperties();
		WatchUi.requestUpdate();
	}
}
