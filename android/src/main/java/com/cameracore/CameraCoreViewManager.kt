package com.cameracore

import android.graphics.Color
import com.facebook.react.module.annotations.ReactModule
import com.facebook.react.uimanager.SimpleViewManager
import com.facebook.react.uimanager.ThemedReactContext
import com.facebook.react.uimanager.ViewManagerDelegate
import com.facebook.react.uimanager.annotations.ReactProp
import com.facebook.react.viewmanagers.CameraCoreViewManagerInterface
import com.facebook.react.viewmanagers.CameraCoreViewManagerDelegate

@ReactModule(name = CameraCoreViewManager.NAME)
class CameraCoreViewManager : SimpleViewManager<CameraCoreView>(),
  CameraCoreViewManagerInterface<CameraCoreView> {
  private val mDelegate: ViewManagerDelegate<CameraCoreView>

  init {
    mDelegate = CameraCoreViewManagerDelegate(this)
  }

  override fun getDelegate(): ViewManagerDelegate<CameraCoreView>? {
    return mDelegate
  }

  override fun getName(): String {
    return NAME
  }

  public override fun createViewInstance(context: ThemedReactContext): CameraCoreView {
    return CameraCoreView(context)
  }

  @ReactProp(name = "color")
  override fun setColor(view: CameraCoreView?, color: Int?) {
    view?.setBackgroundColor(color ?: Color.TRANSPARENT)
  }

  companion object {
    const val NAME = "CameraCoreView"
  }
}
