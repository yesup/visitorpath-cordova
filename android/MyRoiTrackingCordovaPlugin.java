package com.yesup.myroitracking;

import android.util.Log;

import com.yesup.myroitracking.Tracker;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaInterface;
import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CordovaWebView;
import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

/**
 * Created by jeffye on 02/07/14.
 */
public final class MyRoiTrackingCordovaPlugin extends CordovaPlugin {

    private final static String TAG = "MyRoiTrackingPlugin";

    private Tracker tracker = null;

    @Override
    public void initialize(final CordovaInterface cordova, final CordovaWebView webView) {
        super.initialize(cordova, webView);

        Log.i(TAG, "Init MyRoiTracking Plugin");
        tracker = Tracker.initTracker(cordova.getActivity());
    }

    @Override
    public boolean execute(String action, JSONArray args, final CallbackContext callbackContext) throws JSONException {
        if ( action.equals("getTruid") ) {
            String truid = tracker.getTruid().getTruid();

            JSONObject r = new JSONObject();
            r.put("truid", truid);
            callbackContext.success(r);
        } else if ( action.equals("engagement") ) {
            String type = args.getString(0);
            String opt = args.getString(1);
            double value = args.getDouble(2);

            tracker.trackEngagement(type, opt, value);

            JSONObject r = new JSONObject();
            callbackContext.success(r);
        } else if ( action.equals("session") ) {
            String page = args.getString(0);

            tracker.trackSession(page);

            JSONObject r = new JSONObject();
            callbackContext.success(r);
        } else {
            return false;
        }

        return true;
    }

}