package com.parsempo.cloud

import android.app.Activity
import android.content.Intent
import com.dropbox.chooser.android.DbxChooser
import com.facebook.react.bridge.*

class CloudPickerModule(private val reactContext: ReactApplicationContext) : ReactContextBaseJavaModule(reactContext), ActivityEventListener {
    companion object {
        const val DBX_CHOOSER_REQUEST = 100
    }

    private var promise: Promise? = null

    override fun getName(): String {
        return "CloudPicker"
    }

    override fun initialize() {
        super.initialize()
        reactContext.addActivityEventListener(this)
    }

    override fun onCatalystInstanceDestroy() {
        reactContext.removeActivityEventListener(this)
    }

    @ReactMethod
    @Suppress("unused")
    fun pickDropBoxFile(appKey: String, promise: Promise) {
        this.promise = promise
        DbxChooser(appKey).forResultType(DbxChooser.ResultType.DIRECT_LINK).launch(currentActivity, DBX_CHOOSER_REQUEST)
    }

    override fun onActivityResult(activity: Activity?, requestCode: Int, resultCode: Int, data: Intent?) {
        if (requestCode == DBX_CHOOSER_REQUEST) {
            if (resultCode == Activity.RESULT_OK) {
                val result = DbxChooser.Result(data)
                promise?.resolve(result.link.toString())
            } else {
                promise?.reject("-1", "Cancelled by user")
            }
        }
    }

    override fun onNewIntent(intent: Intent?) {
        // Do nothing
    }
}