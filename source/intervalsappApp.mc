using Toybox.Application;
using Toybox.WatchUi;

class intervalsappApp extends Application.AppBase {

	private var view;

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state) {
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
    	view = new intervalsappView();
    	view.loadProperties();
        return [ view, new intervalsappDelegate() ];
    }

}
