package com.ac.reactnativeassetbroswer;

import android.graphics.Color;

import androidx.annotation.Nullable;

import com.facebook.react.module.annotations.ReactModule;
import com.facebook.react.uimanager.ThemedReactContext;
import com.facebook.react.uimanager.annotations.ReactProp;

@ReactModule(name = ReactNativeAssetBroswerViewManager.NAME)
public class ReactNativeAssetBroswerViewManager extends ReactNativeAssetBroswerViewManagerSpec<ReactNativeAssetBroswerView> {

  public static final String NAME = "ReactNativeAssetBroswerView";

  @Override
  public String getName() {
    return NAME;
  }

  @Override
  public ReactNativeAssetBroswerView createViewInstance(ThemedReactContext context) {
    return new ReactNativeAssetBroswerView(context);
  }

  @Override
  @ReactProp(name = "color")
  public void setColor(ReactNativeAssetBroswerView view, @Nullable String color) {
    view.setBackgroundColor(Color.parseColor(color));
  }
}
